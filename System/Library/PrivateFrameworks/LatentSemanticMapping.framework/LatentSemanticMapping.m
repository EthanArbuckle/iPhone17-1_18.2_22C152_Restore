void LSMWordTable::Create(LSMWordTable *this)
{
  operator new();
}

void sub_2177C0144(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C408D77F1C3);
  _Unwind_Resume(a1);
}

void LSMWordTable::Load(LSMWordTable *this, LSMReadFileDesc *a2)
{
  if ((a2 & 2) == 0) {
    operator new();
  }
  operator new();
}

void sub_2177C01E0(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C408D77F1C3);
  _Unwind_Resume(a1);
}

uint64_t LSMWordTable::LookupPair(LSMWordTable *this, unsigned int a2, unsigned int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v10 = v11;
  int v5 = Encode(a2, &v10);
  int v6 = Encode(a3, &v10);
  v7 = v10;
  unsigned __int8 *v10 = 0;
  int v8 = (*(uint64_t (**)(LSMWordTable *, unsigned char *, int64_t, uint64_t))(*(void *)this + 8))(this, v11, v7 - v11, 1);
  if (v8) {
    return (v6 << 26) | (v5 << 28) | v8 | 0x40000000u;
  }
  else {
    return 0;
  }
}

uint64_t Encode(unsigned int a1, unsigned __int8 **a2)
{
  if (a1 < 0x40000)
  {
    if (a1 < 0x1000) {
      goto LABEL_5;
    }
  }
  else
  {
    v2 = (*a2)++;
    unsigned __int8 *v2 = ((a1 >> 18) & 0x3F) + 33;
  }
  v3 = (*a2)++;
  unsigned __int8 *v3 = ((a1 >> 12) & 0x3F) + 33;
LABEL_5:
  v4 = (*a2)++;
  unsigned __int8 *v4 = ((a1 >> 6) & 0x3F) + 33;
  int v5 = (*a2)++;
  *int v5 = (a1 & 0x3F) + 33;
  if (a1 >> 18) {
    return 2;
  }
  else {
    return a1 > 0xFFF;
  }
}

uint64_t LSMWordTable::LookupTriplet(LSMWordTable *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13 = v14;
  int v7 = Encode(a2, &v13);
  int v8 = Encode(a3, &v13);
  int v9 = Encode(a4, &v13);
  v10 = v13;
  unsigned __int8 *v13 = 0;
  int v11 = (*(uint64_t (**)(LSMWordTable *, unsigned char *, int64_t, uint64_t))(*(void *)this + 8))(this, v14, v10 - v14, 1);
  if (v11) {
    return v11 | (((4 * v8) | (16 * v7) | v9) << 24) | 0x80000000;
  }
  else {
    return 0;
  }
}

unsigned __int8 *LSMWordTable::Pair(LSMWordTable *this, unsigned int a2, unsigned int *a3, unsigned int *a4)
{
  if (a2 >> 30) {
    int v7 = 0xFFFFFF;
  }
  else {
    int v7 = 0x3FFFFFFF;
  }
  result = (unsigned __int8 *)(*(uint64_t (**)(LSMWordTable *, void))(*(void *)this + 16))(this, v7 & a2);
  int v9 = result;
  if (result)
  {
    *a3 = Decode((const unsigned __int8 **)&v9, (a2 >> 28) & 3);
    result = (unsigned __int8 *)Decode((const unsigned __int8 **)&v9, (a2 >> 26) & 3);
    *a4 = result;
  }
  else
  {
    *a4 = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t Decode(const unsigned __int8 **a1, int a2)
{
  if (a2 == 2)
  {
    v4 = (unsigned __int8 *)*a1;
    int v5 = *a1 + 1;
    *a1 = v5;
    int v6 = (*v4 << 18) - 8650752;
LABEL_6:
    v3 = (unsigned __int8 *)(v5 + 1);
    *a1 = v5 + 1;
    int v2 = ((*v5 << 12) - 135168) | v6;
    goto LABEL_7;
  }
  if (a2)
  {
    int v6 = 0;
    int v5 = *a1;
    goto LABEL_6;
  }
  int v2 = 0;
  v3 = (unsigned __int8 *)*a1;
LABEL_7:
  *a1 = v3 + 1;
  int v7 = (*v3 << 6) - 2112;
  *a1 = v3 + 2;
  return v7 | v2 | (v3[1] - 33);
}

unsigned __int8 *LSMWordTable::Triplet(LSMWordTable *this, unsigned int a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  if (a2 >> 30) {
    int v9 = 0xFFFFFF;
  }
  else {
    int v9 = 0x3FFFFFFF;
  }
  result = (unsigned __int8 *)(*(uint64_t (**)(LSMWordTable *, void))(*(void *)this + 16))(this, v9 & a2);
  int v11 = result;
  if (result)
  {
    *a3 = Decode((const unsigned __int8 **)&v11, (a2 >> 28) & 3);
    *a4 = Decode((const unsigned __int8 **)&v11, (a2 >> 26) & 3);
    result = (unsigned __int8 *)Decode((const unsigned __int8 **)&v11, HIBYTE(a2) & 3);
    *a5 = result;
  }
  else
  {
    *a5 = 0;
    *a4 = 0;
    *a3 = 0;
  }
  return result;
}

unint64_t LSMWordTree::FindInPage(LSMWordTree *this, unsigned __int8 **a2, uint64_t a3, unint64_t a4, BOOL *a5)
{
  return FindWord(a2, a3, a4, (char *)a5);
}

unint64_t FindWord(unsigned __int8 **a1, uint64_t a2, unint64_t a3, char *a4)
{
  unint64_t result = 0;
LABEL_2:
  while (result < a3)
  {
    unint64_t v6 = (a3 + result) >> 1;
    int v8 = *a1;
    int v7 = a1[1];
    int v9 = a1[2];
    uint64_t v10 = *(unsigned int *)(a2 + 4 * v6);
    int v11 = &v9[v10];
    uint64_t v12 = &v7[v10];
    while (1)
    {
      unsigned int v14 = *v8++;
      unsigned int v13 = v14;
      unsigned int v15 = *v11++;
      BOOL v16 = v13 >= v15;
      BOOL v17 = v13 > v15;
      if (v13 <= v15) {
        unint64_t v18 = result;
      }
      else {
        unint64_t v18 = v6 + 1;
      }
      if (v17) {
        int v19 = 6;
      }
      else {
        int v19 = 0;
      }
      if (v16) {
        unint64_t result = v18;
      }
      if (v16)
      {
        int v20 = v19;
      }
      else
      {
        a3 = v6;
        int v20 = 6;
      }
      if (v20) {
        break;
      }
      if (!--v7)
      {
        if (v12[(void)v9])
        {
          a3 = v6;
          goto LABEL_2;
        }
        char v21 = 1;
        unint64_t result = v6;
        goto LABEL_23;
      }
    }
  }
  char v21 = 0;
LABEL_23:
  *a4 = v21;
  return result;
}

void LSMCommonWordTable::LSMCommonWordTable(LSMCommonWordTable *this)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = 0;
  LSMVectorBase::LSMVectorBase((LSMCommonWordTable *)((char *)this + 16), 1);
}

void LSMCommonWordTable::LSMCommonWordTable(LSMCommonWordTable *this, const LSMCommonWordTable *a2)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  LSMVectorBase::LSMVectorBase((LSMCommonWordTable *)((char *)this + 16), (const LSMCommonWordTable *)((char *)a2 + 16));
}

uint64_t LSMCommonWordTable::Word(LSMCommonWordTable *this, unsigned int a2)
{
  return *((void *)this + 2) + a2;
}

uint64_t LSMCommonWordTable::StopWords(LSMCommonWordTable *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t LSMCommonWordTable::Size(LSMCommonWordTable *this)
{
  return *((void *)this + 4);
}

uint64_t LSMCommonWordTable::BeginSweep(uint64_t this)
{
  unsigned int v1 = *(_DWORD *)(this + 8);
  if (v1 <= 1) {
    unsigned int v1 = 1;
  }
  *(_DWORD *)(this + 12) = v1;
  return this;
}

uint64_t LSMCommonWordTable::MarkUsed(LSMCommonWordTable *this, unsigned int a2)
{
  if (a2 >> 30) {
    int v2 = 0xFFFFFF;
  }
  else {
    int v2 = 0x3FFFFFFF;
  }
  unsigned int v3 = v2 & a2;
  uint64_t v4 = *((unsigned int *)this + 3);
  if ((v2 & a2) < v4) {
    return 0;
  }
  uint64_t v7 = *((void *)this + 2);
  size_t v8 = strlen((const char *)(v7 + v3)) + 1;
  uint64_t v5 = v3 - v4;
  if (v3 != v4)
  {
    memmove((void *)(v7 + v4), (const void *)(v7 + v3), v8);
    unsigned int v3 = *((_DWORD *)this + 3);
  }
  *((_DWORD *)this + 3) = v3 + v8;
  return v5;
}

uint64_t LSMCommonWordTable::EndSweep(LSMCommonWordTable *this)
{
  unint64_t v2 = *((unsigned int *)this + 3);
  unint64_t v3 = *((void *)this + 5);
  if (v3 < v2)
  {
    LSMVectorBase::Allocate((const void **)this + 2, v2, 1);
    unint64_t v3 = *((void *)this + 5);
  }
  if (v3 >= v2) {
    unint64_t v3 = v2;
  }
  *((void *)this + 4) = v3;
  uint64_t v4 = *(uint64_t (**)(LSMCommonWordTable *))(*(void *)this + 112);
  return v4(this);
}

uint64_t LSMCommonWordTable::ValidTuples(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2 < 1) {
    return 1;
  }
  unint64_t v3 = *(_DWORD **)a2;
  unint64_t v4 = *(void *)a2 + 4 * v2;
  while (1)
  {
    int v5 = *v3 >> 30 ? 0xFFFFFF : 0x3FFFFFFF;
    unint64_t v6 = v5 & *v3;
    if (*(void *)(a1 + 32) <= v6 || v6 && *(unsigned char *)(*(void *)(a1 + 16) + (v6 - 1))) {
      break;
    }
    if ((unint64_t)++v3 >= v4) {
      return 1;
    }
  }
  return 0;
}

void LSMImmutableWordTable::LSMImmutableWordTable(LSMImmutableWordTable *this, const LSMImmutableWordTable *a2)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  LSMVectorBase::LSMVectorBase((LSMImmutableWordTable *)((char *)this + 16), (const LSMImmutableWordTable *)((char *)a2 + 16));
  *(void *)this = &unk_26C7C5E00;
  LSMVectorBase::LSMVectorBase((LSMImmutableWordTable *)((char *)this + 48), (const LSMImmutableWordTable *)((char *)a2 + 48));
}

void sub_2177C0A38(_Unwind_Exception *a1)
{
  *unsigned int v1 = v2;
  LSMVectorBase::~LSMVectorBase(v3);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void LSMImmutableWordTable::LSMImmutableWordTable(LSMImmutableWordTable *this, const LSMMutableWordTable *a2)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  LSMVectorBase::LSMVectorBase((LSMImmutableWordTable *)((char *)this + 16), (const LSMMutableWordTable *)((char *)a2 + 16));
  *(void *)this = &unk_26C7C5E00;
  LSMVectorBase::LSMVectorBase((LSMImmutableWordTable *)((char *)this + 48), 4);
  unint64_t v4 = *((void *)a2 + 7);
  if (*((void *)this + 9) < v4) {
    LSMVectorBase::Allocate((const void **)this + 6, *((void *)a2 + 7), 1);
  }
  LSMTreeBase::Begin((uint64_t)a2 + 48, (LSMTreeIterBase *)v9);
  long long v7 = v9[0];
  long long v8 = v9[1];
  unint64_t v5 = v4 + 1;
  while (--v5)
  {
    int v6 = **((_DWORD **)&v8 + 1);
    LSMVectorBase::Append((void *)this + 6);
    *(_DWORD *)(*((void *)this + 6) + 4 * *((void *)this + 8) - 4) = v6;
    LSMTreeIterBase::operator++((uint64_t)&v7);
  }
}

void sub_2177C0B7C(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v4);
  *unsigned int v1 = v2;
  LSMVectorBase::~LSMVectorBase(v3);
  _Unwind_Resume(a1);
}

void LSMImmutableWordTable::LSMImmutableWordTable(LSMImmutableWordTable *this, LSMReadFileDesc *a2)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = 0;
  unint64_t v4 = (unsigned int *)((char *)this + 8);
  unint64_t v5 = (void **)((char *)this + 16);
  LSMVectorBase::LSMVectorBase((LSMImmutableWordTable *)((char *)this + 16), 1);
  *(void *)this = &unk_26C7C5E00;
  LSMVectorBase::LSMVectorBase((LSMImmutableWordTable *)((char *)this + 48), 4);
  memset(__nitems, 0, sizeof(__nitems));
  LSMReadFileDesc::Read(a2, &__nitems[2], 1uLL, 4uLL);
  LSMReadFileDesc::Read(a2, &__nitems[1], 1uLL, 4uLL);
  LSMReadFileDesc::Read(a2, __nitems, 1uLL, 4uLL);
  if (__nitems[2] < 2) {
    unsigned int *v4 = 1;
  }
  else {
    LSMReadFileDesc::Read(a2, v4, 1uLL, 4uLL);
  }
  LSMReadFileDesc::ReadVec(a2, (void **)this + 6, __nitems[1]);
  LSMReadFileDesc::ReadVec(a2, v5, __nitems[0]);
  LSMVectorBase::advise((uint64_t)this + 48, 3);
  LSMVectorBase::advise((uint64_t)v5, 3);
}

void sub_2177C0D00(_Unwind_Exception *a1)
{
  *unsigned int v1 = v2;
  LSMVectorBase::~LSMVectorBase(v3);
  _Unwind_Resume(a1);
}

void LSMImmutableWordTable::Clone(LSMImmutableWordTable *this, int a2)
{
  if (a2) {
    operator new();
  }
  operator new();
}

void sub_2177C0DA0(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40479FAB70);
  _Unwind_Resume(a1);
}

uint64_t LSMImmutableWordTable::Lookup(LSMImmutableWordTable *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unint64_t v3 = (unsigned __int8 *)*((void *)this + 2);
  v8[0] = a2;
  v8[1] = a3;
  v8[2] = v3;
  char v7 = 0;
  uint64_t v4 = *((void *)this + 6);
  unint64_t Word = FindWord(v8, v4, *((void *)this + 8), &v7);
  if (v7) {
    return *(unsigned int *)(v4 + 4 * Word);
  }
  else {
    return 0;
  }
}

uint64_t LSMImmutableWordTable::Store(LSMImmutableWordTable *this, FILE **a2, __int16 a3)
{
  unint64_t v5 = (uint64_t *)((char *)this + 16);
  uint64_t v6 = *((void *)this + 4);
  int v12 = v6;
  if ((a3 & 0x100) != 0)
  {
    unint64_t v7 = v6;
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)__ptr, 1);
    if (__ptr[3] < (void *)v7) {
      LSMVectorBase::Allocate((const void **)__ptr, v7, 1);
    }
    if (*((uint64_t *)this + 4) >= 1)
    {
      long long v8 = (unsigned __int8 *)*v5;
      do
      {
        unsigned int v9 = *v8;
        LSMVectorBase::Append(__ptr);
        *((unsigned char *)__ptr[0] + (unint64_t)__ptr[2] - 1) = (v9 >> 1) & 0x55 | (2 * v9) & 0xAA;
        ++v8;
      }
      while ((unint64_t)v8 < *((void *)this + 2) + *((void *)this + 4));
    }
    LSMVectorBase::Swap(v5, (LSMVectorBase *)__ptr);
    (*(void (**)(LSMImmutableWordTable *))(*(void *)this + 112))(this);
    LSMVectorBase::~LSMVectorBase(__ptr);
  }
  LODWORD(__ptr[0]) = *((void *)this + 8);
  if (LSMWriteFileDesc::Write(a2, &kLSMWordTableVersion, 1uLL, 4uLL)
    && LSMWriteFileDesc::Write(a2, __ptr, 1uLL, 4uLL)
    && LSMWriteFileDesc::Write(a2, &v12, 1uLL, 4uLL)
    && LSMWriteFileDesc::Write(a2, (char *)this + 8, 1uLL, 4uLL)
    && LSMWriteFileDesc::WriteVec(a2, (LSMImmutableWordTable *)((char *)this + 48))
    && LSMWriteFileDesc::WriteVec(a2, (const LSMVectorBase *)v5))
  {
    return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

void sub_2177C0FE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  LSMVectorBase::~LSMVectorBase((void **)va);
  _Unwind_Resume(a1);
}

uint64_t LSMImmutableWordTable::SetStopWords(LSMImmutableWordTable *this)
{
  return 0;
}

void LSMImmutableWordTable::RebuildIndex(LSMImmutableWordTable *this)
{
  LSMTreeBase::LSMTreeBase((LSMTreeBase *)&v1, 4u);
}

void sub_2177C1170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  LSMVectorBase::~LSMVectorBase((void **)va);
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)(v10 - 88));
  _Unwind_Resume(a1);
}

void LSMMutableWordTable::LSMMutableWordTable(LSMMutableWordTable *this)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = 0;
  LSMVectorBase::LSMVectorBase((LSMMutableWordTable *)((char *)this + 16), 1);
  *(void *)this = &unk_26C7C5E88;
  LSMTreeBase::LSMTreeBase((LSMMutableWordTable *)((char *)this + 48), 4u);
}

void sub_2177C1274(_Unwind_Exception *a1)
{
  LSMTreeBase::~LSMTreeBase(v4);
  *uint64_t v1 = v2;
  LSMVectorBase::~LSMVectorBase(v3);
  _Unwind_Resume(a1);
}

void LSMMutableWordTable::LSMMutableWordTable(LSMMutableWordTable *this, const LSMImmutableWordTable *a2)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  LSMVectorBase::LSMVectorBase((LSMMutableWordTable *)((char *)this + 16), (const LSMImmutableWordTable *)((char *)a2 + 16));
  *(void *)this = &unk_26C7C5E88;
  LSMTreeBase::LSMTreeBase((LSMMutableWordTable *)((char *)this + 48), 4u);
}

void sub_2177C13A4(_Unwind_Exception *a1)
{
  *uint64_t v1 = v2;
  LSMVectorBase::~LSMVectorBase(v3);
  _Unwind_Resume(a1);
}

void LSMMutableWordTable::LSMMutableWordTable(LSMMutableWordTable *this, const LSMMutableWordTable *a2)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  LSMVectorBase::LSMVectorBase((LSMMutableWordTable *)((char *)this + 16), (const LSMMutableWordTable *)((char *)a2 + 16));
  *(void *)this = &unk_26C7C5E88;
  LSMTreeBase::LSMTreeBase((LSMMutableWordTable *)((char *)this + 48), 4u);
}

void sub_2177C14D8(_Unwind_Exception *a1)
{
  LSMTreeBase::~LSMTreeBase(v4);
  *uint64_t v1 = v2;
  LSMVectorBase::~LSMVectorBase(v3);
  _Unwind_Resume(a1);
}

void LSMMutableWordTable::LSMMutableWordTable(LSMMutableWordTable *this, LSMReadFileDesc *a2)
{
  *(void *)this = &unk_26C7C5D78;
  *((_DWORD *)this + 2) = 0;
  LSMVectorBase::LSMVectorBase((LSMMutableWordTable *)((char *)this + 16), 1);
  *(void *)this = &unk_26C7C5E88;
  LSMTreeBase::LSMTreeBase((LSMMutableWordTable *)((char *)this + 48), 4u);
}

void sub_2177C1694(_Unwind_Exception *a1)
{
  *uint64_t v1 = v2;
  LSMVectorBase::~LSMVectorBase(v3);
  _Unwind_Resume(a1);
}

void LSMMutableWordTable::Clone(LSMMutableWordTable *this, int a2)
{
  if (a2) {
    operator new();
  }
  operator new();
}

void sub_2177C1738(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40479FAB70);
  _Unwind_Resume(a1);
}

uint64_t LSMMutableWordTable::Lookup(LSMMutableWordTable *this, const unsigned __int8 *a2, size_t a3, int a4)
{
  if (!a3) {
    return 0;
  }
  unsigned int v9 = (LSMMutableWordTable *)((char *)this + 16);
  uint64_t v8 = *((void *)this + 2);
  v20[0] = a2;
  v20[1] = a3;
  v20[2] = v8;
  uint64_t v10 = (LSMMutableWordTable *)((char *)this + 48);
  LSMTreeBase::LowerBound((uint64_t)this + 48, (uint64_t)v20, (unsigned __int16 *)&v18);
  LOWORD(v17[0]) = 0;
  if (LSMTreeIterBase::Equal((LSMTreeIterBase *)&v18, (const LSMTreeIterBase *)v17)
    || (uint64_t v11 = **((_DWORD **)&v19 + 1), strlen((const char *)(*(void *)v9 + v11)) != a3)
    || memcmp(a2, (const void *)(*(void *)v9 + v11), a3))
  {
    unsigned int v12 = *((_DWORD *)this + 8);
    v17[0] = v12;
    if (a4) {
      int v13 = 0x40000000;
    }
    else {
      int v13 = 0;
    }
    if ((v13 | v12) >> 30) {
      int v14 = -16777216;
    }
    else {
      int v14 = -1073741824;
    }
    if ((v14 & v12) != 0)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      LSMVectorBase::Append(v9, a2, a3);
      LSMVectorBase::Append(v9);
      *(unsigned char *)(*((void *)this + 2) + *((void *)this + 4) - 1) = 0;
      v16[0] = v18;
      v16[1] = v19;
      LSMTreeBase::Insert(v10, v17, (const LSMTreeIterBase *)v16);
      return v17[0];
    }
  }
  return v11;
}

uint64_t LSMMutableWordTable::Store()
{
  *__error() = 1;
  return 0xFFFFFFFFLL;
}

BOOL LSMMutableWordTable::SetStopWords(LSMMutableWordTable *this)
{
  int v1 = *((_DWORD *)this + 2);
  if (!v1) {
    *((_DWORD *)this + 2) = *((void *)this + 4);
  }
  return v1 == 0;
}

uint64_t LSMMutableWordTable::UnsetStopWords(uint64_t this)
{
  if (!*(_DWORD *)(this + 8)) {
    *(_DWORD *)(this + 8) = 1;
  }
  return this;
}

void LSMMutableWordTable::RebuildIndex(LSMMutableWordTable *this)
{
  LSMTreeBase::LSMTreeBase((LSMTreeBase *)v1, 4u);
}

void sub_2177C19FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)va);
  _Unwind_Resume(a1);
}

void LSMImmutableWordTable::~LSMImmutableWordTable(void **this)
{
  *this = &unk_26C7C5E00;
  LSMVectorBase::~LSMVectorBase(this + 6);
  *this = &unk_26C7C5D78;
  LSMVectorBase::~LSMVectorBase(this + 2);
}

{
  uint64_t vars8;

  *this = &unk_26C7C5E00;
  LSMVectorBase::~LSMVectorBase(this + 6);
  *this = &unk_26C7C5D78;
  LSMVectorBase::~LSMVectorBase(this + 2);
  JUMPOUT(0x21D44C230);
}

void sub_2177C1A84(_Unwind_Exception *a1)
{
  *(void *)uint64_t v1 = &unk_26C7C5D78;
  LSMVectorBase::~LSMVectorBase((void **)(v1 + 16));
  _Unwind_Resume(a1);
}

void sub_2177C1B40(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40479FAB70);
  _Unwind_Resume(a1);
}

void LSMWordTree::~LSMWordTree(LSMWordTree *this)
{
  LSMTreeBase::~LSMTreeBase(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177C1BDC(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C408B8B6E5DLL);
  _Unwind_Resume(a1);
}

void LSMMutableWordTable::~LSMMutableWordTable(void **this)
{
  *this = &unk_26C7C5E88;
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)(this + 6));
  *this = &unk_26C7C5D78;
  LSMVectorBase::~LSMVectorBase(this + 2);
}

{
  uint64_t vars8;

  *this = &unk_26C7C5E88;
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)(this + 6));
  *this = &unk_26C7C5D78;
  LSMVectorBase::~LSMVectorBase(this + 2);
  JUMPOUT(0x21D44C230);
}

void sub_2177C1C68(_Unwind_Exception *a1)
{
  *(void *)uint64_t v1 = &unk_26C7C5D78;
  LSMVectorBase::~LSMVectorBase((void **)(v1 + 16));
  _Unwind_Resume(a1);
}

void sub_2177C1D24(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C408D77F1C3);
  _Unwind_Resume(a1);
}

void *LSMVectorBase::Append(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[2];
  if (v2 == this[3])
  {
    this = LSMVectorBase::Allocate((const void **)this, v2 + 1, 0);
    uint64_t v2 = v1[2];
  }
  v1[2] = v2 + 1;
  return this;
}

BOOL LSMTupleCount::AddWithWeight(LSMTupleCount *this, const LSMTupleCount *a2, float a3)
{
  AccumulateWithWeight((unsigned int *)this, *(_DWORD *)a2, a3);
  AccumulateWithWeight((unsigned int *)this + 1, *((_DWORD *)a2 + 1), a3);
  unsigned int v6 = *((_DWORD *)a2 + 2);
  return AccumulateWithWeight((unsigned int *)this + 2, v6, a3);
}

BOOL AccumulateWithWeight(unsigned int *a1, unsigned int a2, float a3)
{
  *(double *)&unint64_t v3 = (double)a2;
  double v4 = (double)a2 * a3;
  LODWORD(v3) = *a1;
  double v5 = (double)v3;
  double v6 = ceil(v4 + -0.5);
  double v7 = floor(v4 + 0.5);
  if (v4 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  double v9 = v8 + v5;
  if (v9 >= 0.0)
  {
    if (v9 >= 4294967300.0)
    {
      *a1 = -1;
      return 1;
    }
    else
    {
      *a1 = (unint64_t)v9;
      return (unint64_t)v9 != 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    *a1 = 0;
  }
  return v10;
}

uint64_t LSMTupleCount::RatherFull(LSMTupleCount *this)
{
  if ((*(_DWORD *)this & 0x80000000) != 0 || (*((_DWORD *)this + 1) & 0x80000000) != 0) {
    return 1;
  }
  else {
    return *((_DWORD *)this + 2) >> 31;
  }
}

unint64_t LSMTupleMap::FindInPage(LSMTupleMap *this, unsigned int *a2, char *a3, unint64_t a4, BOOL *a5)
{
  unsigned int v5 = *a2;
  if (a4)
  {
    double v6 = a3;
    unint64_t v7 = a4;
    do
    {
      unint64_t v8 = v7 >> 1;
      double v9 = &v6[8 * (v7 >> 1)];
      unsigned int v11 = *(_DWORD *)v9;
      uint64_t v10 = v9 + 8;
      v7 += ~(v7 >> 1);
      if (v11 < v5) {
        double v6 = v10;
      }
      else {
        unint64_t v7 = v8;
      }
    }
    while (v7);
  }
  else
  {
    double v6 = a3;
  }
  unint64_t result = (v6 - a3) >> 3;
  BOOL v13 = result < a4 && *(_DWORD *)v6 == v5;
  *a5 = v13;
  return result;
}

BOOL LSMTupleMap::Add(LSMTupleMap *this, const LSMTupleMap *a2)
{
  LSMTreeBase::Begin((uint64_t)a2, (LSMTreeIterBase *)v13);
  v12[0] = 0;
  v11[0] = 0;
  for (BOOL result = LSMTreeIterBase::Equal((LSMTreeIterBase *)v13, (const LSMTreeIterBase *)v11);
        !result;
        BOOL result = LSMTreeIterBase::Equal((LSMTreeIterBase *)v13, (const LSMTreeIterBase *)v11))
  {
    if (v14[1])
    {
      LSMTreeBase::LowerBound((uint64_t)this, (uint64_t)v14, (unsigned __int16 *)&v9);
      BOOL v4 = LSMTreeIterBase::Equal((LSMTreeIterBase *)&v9, (const LSMTreeIterBase *)v12);
      unsigned int v5 = v14;
      if (v4 || (uint64_t v6 = *((void *)&v10 + 1), **((_DWORD **)&v10 + 1) != *v14))
      {
        v8[0] = v9;
        v8[1] = v10;
        LSMTreeBase::Insert(this, v14, (const LSMTreeIterBase *)v8);
      }
      else
      {
        int v7 = *(_DWORD *)(*((void *)&v10 + 1) + 4);
        if (!v7) {
          --*((void *)this + 7);
        }
        *(_DWORD *)(v6 + 4) = v5[1] + v7;
      }
    }
    LSMTreeIterBase::operator++((uint64_t)v13);
  }
  return result;
}

BOOL LSMTupleMap::Add(LSMTupleMap *this, const LSMTupleMap *a2, float a3)
{
  LSMTreeBase::Begin((uint64_t)a2, (LSMTreeIterBase *)v22);
  v21[0] = 0;
  v20[0] = 0;
  for (BOOL result = LSMTreeIterBase::Equal((LSMTreeIterBase *)v22, (const LSMTreeIterBase *)v20);
        !result;
        BOOL result = LSMTreeIterBase::Equal((LSMTreeIterBase *)v22, (const LSMTreeIterBase *)v20))
  {
    if (v23[1])
    {
      LSMTreeBase::LowerBound((uint64_t)this, (uint64_t)v23, (unsigned __int16 *)&v18);
      BOOL v6 = LSMTreeIterBase::Equal((LSMTreeIterBase *)&v18, (const LSMTreeIterBase *)v21);
      unint64_t v8 = v23;
      unsigned int v9 = *v23;
      if (v6 || **((_DWORD **)&v19 + 1) != v9)
      {
        uint64_t v17 = v9;
        LODWORD(v7) = v23[1];
        double v11 = a3 * (double)v7;
        double v12 = ceil(v11 + -0.5);
        double v13 = floor(v11 + 0.5);
        if (v11 >= 0.0) {
          double v14 = v13;
        }
        else {
          double v14 = v12;
        }
        double v15 = v14 + 0.0;
        if (v15 < 0.0) {
          goto LABEL_15;
        }
        if (v15 >= 4294967300.0)
        {
          HIDWORD(v17) = -1;
        }
        else
        {
          HIDWORD(v17) = (unint64_t)v15;
          if (!HIDWORD(v17)) {
            goto LABEL_15;
          }
        }
        v16[0] = v18;
        v16[1] = v19;
        LSMTreeBase::Insert(this, &v17, (const LSMTreeIterBase *)v16);
      }
      else
      {
        long long v10 = (unsigned int *)(*((void *)&v19 + 1) + 4);
        *((void *)this + 7) -= *(_DWORD *)(*((void *)&v19 + 1) + 4) == 0;
        *((void *)this + 7) += !AccumulateWithWeight(v10, v8[1], a3);
      }
    }
LABEL_15:
    LSMTreeIterBase::operator++((uint64_t)v22);
  }
  return result;
}

void LSMTupleMap::Scale(LSMTupleMap *this)
{
  LSMTreeBase::LSMTreeBase((LSMTreeBase *)v1, 8u);
}

void sub_2177C22A0(_Unwind_Exception *a1)
{
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)(v1 - 96));
  _Unwind_Resume(a1);
}

uint64_t LSMTupleAccumulator::operator[](LSMTreeBase *a1, int a2)
{
  int v12 = a2;
  LSMTreeBase::LowerBound((uint64_t)a1, (uint64_t)&v12, (unsigned __int16 *)&v10);
  LOWORD(v8[0]) = 0;
  if (LSMTreeIterBase::Equal((LSMTreeIterBase *)&v10, (const LSMTreeIterBase *)v8))
  {
    int v3 = v12;
LABEL_4:
    LODWORD(v7) = 0;
    v6[0] = v10;
    v6[1] = v11;
    v8[0] = v3;
    v8[1] = 0;
    LSMTreeBase::Insert(a1, v8, (const LSMTreeIterBase *)v6);
    LSMTreeBase::LowerBound((uint64_t)a1, (uint64_t)&v12, (unsigned __int16 *)v8);
    uint64_t v4 = v9;
    return v4 + 4;
  }
  uint64_t v4 = *((void *)&v11 + 1);
  int v3 = v12;
  if (**((_DWORD **)&v11 + 1) != v12) {
    goto LABEL_4;
  }
  return v4 + 4;
}

uint64_t LSMMutableTextCounter::Seen(uint64_t this, unsigned int a2)
{
  uint64_t v2 = this;
  unsigned int v9 = a2;
  if (a2 == -1)
  {
    *(unsigned char *)(this + 88) = 1;
    return this;
  }
  if (*(unsigned char *)(this + 88)) {
    return this;
  }
  LSMTreeBase::LowerBound(this + 24, (uint64_t)&v9, (unsigned __int16 *)&v7);
  LOWORD(v6[0]) = 0;
  this = LSMTreeIterBase::Equal((LSMTreeIterBase *)&v7, (const LSMTreeIterBase *)v6);
  if (this)
  {
    unsigned int v3 = v9;
LABEL_8:
    v5[0] = v7;
    v5[1] = v8;
    v6[0] = v3;
    v6[1] = 1;
    this = LSMTreeBase::Insert((LSMTreeBase *)(v2 + 24), v6, (const LSMTreeIterBase *)v5);
    unsigned int v4 = v9;
    goto LABEL_9;
  }
  unsigned int v4 = **((_DWORD **)&v8 + 1);
  unsigned int v3 = v9;
  if (**((_DWORD **)&v8 + 1) != v9) {
    goto LABEL_8;
  }
  ++*(_DWORD *)(*((void *)&v8 + 1) + 4);
LABEL_9:
  ++*(_DWORD *)(v2 + 4 * (v4 >> 30) + 8);
  return this;
}

uint64_t LSMMutableTextCounter::GetTupleMap(LSMMutableTextCounter *this)
{
  return (uint64_t)this + 24;
}

uint64_t LSMMutableTextCounter::HadOverflow(LSMMutableTextCounter *this)
{
  if (!*((unsigned char *)this + 88)) {
    return 0;
  }
  *((unsigned char *)this + 88) = 0;
  return 4294960651;
}

void LSMImmutableTextCounter::LSMImmutableTextCounter(LSMImmutableTextCounter *this, const LSMImmutableMapCounter *a2)
{
  *((_DWORD *)this + 4) = 0;
  *(void *)this = &unk_26C7C6048;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 5) = *((_DWORD *)a2 + 4);
  unsigned int v4 = (const void **)((char *)this + 24);
  LSMVectorBase::LSMVectorBase((LSMImmutableTextCounter *)((char *)this + 24), 4);
  *((void *)this + 7) = (char *)a2 + 24;
  *((void *)this + 8) = (char *)a2 + 56;
  unint64_t v5 = *((void *)a2 + 5);
  unint64_t v6 = *((void *)this + 6);
  if (v6 < v5)
  {
    LSMVectorBase::Allocate(v4, v5, 1);
    unint64_t v6 = *((void *)this + 6);
  }
  if (v6 >= v5) {
    unint64_t v6 = v5;
  }
  *((void *)this + 5) = v6;
  bzero(*((void **)this + 3), 4 * v6);
}

void sub_2177C251C(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

uint64_t LSMImmutableTextCounter::Seen(uint64_t this, unsigned int a2)
{
  uint64_t v2 = *(char ***)(this + 56);
  unint64_t v3 = (unint64_t)v2[2];
  if (v3)
  {
    unsigned int v4 = *v2;
    unint64_t v5 = &v4[4 * v3];
    unint64_t v6 = v4;
    do
    {
      unint64_t v7 = v3 >> 1;
      long long v8 = &v6[4 * (v3 >> 1)];
      unsigned int v10 = *(_DWORD *)v8;
      unsigned int v9 = v8 + 4;
      v3 += ~(v3 >> 1);
      if (v10 < a2) {
        unint64_t v6 = v9;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    while (v3);
    if (v6 != v5 && *(_DWORD *)v6 == a2)
    {
      ++*(_DWORD *)(*(void *)(this + 24) + v6 - v4);
      ++*(_DWORD *)(this + 4 * (a2 >> 30) + 8);
    }
  }
  return this;
}

void LSMImmutableTextCounter::GetNormalizedVector(uint64_t a1, LSMVectorBase *this)
{
  unsigned int v4 = *(uint64_t **)(a1 + 56);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[2];
  uint64_t v7 = *v4 + 4 * v6;
  if (v6)
  {
    long long v8 = (_DWORD *)*v4;
    unint64_t v9 = v4[2];
    do
    {
      unint64_t v10 = v9 >> 1;
      long long v11 = &v8[v9 >> 1];
      unsigned int v13 = *v11;
      int v12 = v11 + 1;
      v9 += ~(v9 >> 1);
      if (v13 >> 30) {
        unint64_t v9 = v10;
      }
      else {
        long long v8 = v12;
      }
    }
    while (v9);
    uint64_t v14 = *v4 + 4 * v6;
    if ((_DWORD *)v7 != v8)
    {
      unint64_t v15 = (v7 - (uint64_t)v8) >> 2;
      uint64_t v14 = (uint64_t)v8;
      do
      {
        unint64_t v16 = v15 >> 1;
        uint64_t v17 = (int *)(v14 + 4 * (v15 >> 1));
        int v19 = *v17;
        long long v18 = v17 + 1;
        v15 += ~(v15 >> 1);
        BOOL v20 = v19 < 0;
        if (v19 < 0) {
          unint64_t v15 = v16;
        }
        if (!v20) {
          uint64_t v14 = (uint64_t)v18;
        }
      }
      while (v15);
      uint64_t v7 = (uint64_t)v8;
    }
  }
  else
  {
    uint64_t v14 = *v4;
  }
  unsigned int v21 = *(_DWORD *)(a1 + 8);
  float v22 = 1.0;
  float v23 = 1.0;
  if (v21) {
    float v23 = 1.0 / (float)v21;
  }
  unsigned int v24 = *(_DWORD *)(a1 + 12);
  if (v24) {
    float v22 = 1.0 / (float)v24;
  }
  uint64_t v25 = v14 - v5;
  unsigned int v26 = *(_DWORD *)(a1 + 16);
  if (v26) {
    float v27 = 1.0 / (float)v26;
  }
  else {
    float v27 = 1.0;
  }
  unint64_t v28 = (v7 - v5) >> 2;
  unint64_t v29 = v25 >> 2;
  unint64_t v30 = *(unsigned int *)(a1 + 20);
  if (v30)
  {
    unint64_t v31 = *((void *)this + 3);
    uint64_t v32 = *(unsigned int *)(a1 + 20);
    if (v31 < v30)
    {
      LSMVectorBase::Allocate((const void **)this, *(unsigned int *)(a1 + 20), 1);
      unint64_t v31 = *((void *)this + 3);
      uint64_t v32 = *(unsigned int *)(a1 + 20);
    }
    if (v31 >= v30) {
      unint64_t v31 = v30;
    }
    *((void *)this + 2) = v31;
    bzero(*(void **)this, 4 * v32);
    if (v7 != v5)
    {
      v33 = *(unsigned int **)(a1 + 24);
      uint64_t v34 = *(void *)this;
      v35 = **(unsigned int ***)(a1 + 64);
      if (v28 <= 1) {
        uint64_t v36 = 1;
      }
      else {
        uint64_t v36 = (v7 - v5) >> 2;
      }
      do
      {
        unsigned int v37 = *v33++;
        float v38 = (float)v37;
        unsigned int v39 = *v35++;
        *(float *)(v34 + 4 * v39) = *(float *)(v34 + 4 * v39) + (float)(v38 * v23);
        --v36;
      }
      while (v36);
    }
    unint64_t v40 = v29 - v28;
    if (v29 > v28)
    {
      uint64_t v41 = *(void *)this;
      v42 = (unsigned int *)(**(void **)(a1 + 64) + 4 * v28);
      v43 = (unsigned int *)(*(void *)(a1 + 24) + 4 * v28);
      do
      {
        unsigned int v44 = *v43++;
        float v45 = (float)v44;
        unsigned int v46 = *v42++;
        *(float *)(v41 + 4 * v46) = *(float *)(v41 + 4 * v46) + (float)(v45 * v22);
        --v40;
      }
      while (v40);
    }
    unint64_t v47 = v6 - v29;
    if (v6 > v29)
    {
      uint64_t v48 = *(void *)this;
      v49 = (unsigned int *)(**(void **)(a1 + 64) + 4 * v29);
      v50 = (unsigned int *)(*(void *)(a1 + 24) + 4 * v29);
      do
      {
        unsigned int v51 = *v50++;
        float v52 = (float)v51;
        unsigned int v53 = *v49++;
        *(float *)(v48 + 4 * v53) = *(float *)(v48 + 4 * v53) + (float)(v52 * v27);
        --v47;
      }
      while (v47);
    }
  }
  else
  {
    unint64_t v54 = *((void *)this + 3);
    if (v54 < v6)
    {
      LSMVectorBase::Allocate((const void **)this, v6, 1);
      unint64_t v54 = *((void *)this + 3);
    }
    if (v54 >= v6) {
      unint64_t v54 = v6;
    }
    *((void *)this + 2) = v54;
    if (v7 != v5)
    {
      v55 = *(unsigned int **)(a1 + 24);
      v56 = *(float **)this;
      if (v28 <= 1) {
        uint64_t v57 = 1;
      }
      else {
        uint64_t v57 = (v7 - v5) >> 2;
      }
      do
      {
        unsigned int v58 = *v55++;
        *v56++ = v23 * (float)v58;
        --v57;
      }
      while (v57);
    }
    unint64_t v59 = v29 - v28;
    if (v29 > v28)
    {
      v60 = (float *)(*(void *)this + 4 * v28);
      v61 = (unsigned int *)(*(void *)(a1 + 24) + 4 * v28);
      do
      {
        unsigned int v62 = *v61++;
        *v60++ = v22 * (float)v62;
        --v59;
      }
      while (v59);
    }
    unint64_t v63 = v6 - v29;
    if (v6 > v29)
    {
      v64 = (float *)(*(void *)this + 4 * v29);
      v65 = (unsigned int *)(*(void *)(a1 + 24) + 4 * v29);
      do
      {
        unsigned int v66 = *v65++;
        *v64++ = v27 * (float)v66;
        --v63;
      }
      while (v63);
    }
  }
}

uint64_t LSMTextCounter::GetTupleMap(LSMTextCounter *this)
{
  return 0;
}

size_t LSMTextCounter::GetNormalizedVector()
{
  return fwrite("LatentSemanticMapping: GetNormalizedVector called on mutable text\n", 0x42uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
}

uint64_t LSMTextCounter::HadOverflow(LSMTextCounter *this)
{
  return 0;
}

void LSMTextCounter::Create(LSMTextCounter *this, const LSMImmutableMapCounter *a2)
{
  if (this) {
    operator new();
  }
  operator new();
}

void sub_2177C29D0(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C406F311667);
  _Unwind_Resume(a1);
}

void LSMMapCounter::LSMMapCounter(LSMMapCounter *this)
{
  *((_DWORD *)this + 1) = 0;
  LSMVectorBase::LSMVectorBase((LSMMapCounter *)((char *)this + 8), 8);
  LSMTreeBase::LSMTreeBase((LSMMapCounter *)((char *)this + 40), 8u);
}

void sub_2177C2B70(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v3);
  LSMTreeBase::~LSMTreeBase(v2);
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void LSMMapCounter::LSMMapCounter(LSMMapCounter *this, const LSMImmutableMapCounter *a2)
{
  *(unsigned char *)this = *(unsigned char *)a2;
  *((_DWORD *)this + 1) = 0;
  LSMVectorBase::LSMVectorBase((LSMMapCounter *)((char *)this + 8), 8);
  LSMTreeBase::LSMTreeBase((LSMMapCounter *)((char *)this + 40), 8u);
}

void sub_2177C2D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **a9, uint64_t a10, LSMTreeBase *a11, void **a12)
{
  LSMVectorBase::~LSMVectorBase(a9);
  LSMVectorBase::~LSMVectorBase(v12);
  LSMTreeBase::~LSMTreeBase(a11);
  LSMVectorBase::~LSMVectorBase(a12);
  _Unwind_Resume(a1);
}

void LSMMapCounter::AddCategories(LSMMapCounter *this, unsigned int a2)
{
  unint64_t v4 = a2;
  unint64_t v5 = *((void *)this + 3);
  if (v5 < a2)
  {
    unint64_t v6 = *((void *)this + 4);
    if (v6 < a2)
    {
      LSMVectorBase::Allocate((const void **)this + 1, a2, 1);
      unint64_t v6 = *((void *)this + 4);
    }
    if (v6 >= v4) {
      unint64_t v6 = v4;
    }
    *((void *)this + 3) = v6;
    if (a2 > v5) {
      operator new();
    }
  }
  unint64_t v7 = *((void *)this + 15);
  if (v7 < v4)
  {
    unint64_t v8 = *((void *)this + 16);
    if (v8 < v4)
    {
      LSMVectorBase::Allocate((const void **)this + 13, v4, 1);
      unint64_t v8 = *((void *)this + 16);
    }
    if (v8 >= v4) {
      unint64_t v8 = v4;
    }
    *((void *)this + 15) = v8;
    if (v7 < a2)
    {
      unint64_t v9 = (void *)(*((void *)this + 13) + 12 * v7);
      bzero(v9, 12 * (~v7 + a2) + 12);
    }
  }
}

void sub_2177C2F4C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C40FD820D8ELL);
  _Unwind_Resume(a1);
}

void LSMMapCounter::LSMMapCounter(LSMMapCounter *this, LSMReadFileDesc *a2, LSMWordTable *a3)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 1) = 0;
  unint64_t v3 = (char *)this + 4;
  LSMVectorBase::LSMVectorBase((LSMMapCounter *)((char *)this + 8), 8);
  LSMTreeBase::LSMTreeBase((LSMTreeBase *)(v3 + 36), 8u);
}

void sub_2177C35AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  LSMVectorBase::~LSMVectorBase((void **)(v19 - 144));
  LSMVectorBase::~LSMVectorBase((void **)va);
  LSMVectorBase::~LSMVectorBase(v18);
  LSMVectorBase::~LSMVectorBase(v17);
  LSMTreeBase::~LSMTreeBase(v16);
  LSMVectorBase::~LSMVectorBase(v15);
  _Unwind_Resume(a1);
}

void LSMMapCounter::AddText(LSMMapCounter *this, const LSMTextCounter *a2)
{
  *((_DWORD *)this + 1) = 0;
  LSMTreeBase::clear((LSMMapCounter *)((char *)this + 40));
}

void LSMMapCounter::KillTupleClusters(LSMMapCounter *this)
{
  *((_DWORD *)this + 1) = 0;
  LSMTreeBase::clear((LSMMapCounter *)((char *)this + 40));
}

uint64_t LSMMapCounter::RescaleCounts(uint64_t this)
{
  if (*(void *)(this + 24)) {
    LSMTupleMap::Scale(**(LSMTupleMap ***)(this + 8));
  }
  return this;
}

void LSMMapCounter::~LSMMapCounter(LSMMapCounter *this)
{
  uint64_t v2 = (void **)((char *)this + 8);
  uint64_t v3 = *((void *)this + 3);
  if (v3)
  {
    uint64_t v4 = (char *)*v2;
    unint64_t v5 = (char *)*v2;
    do
    {
      if (*(void *)v5)
      {
        (*(void (**)(void))(**(void **)v5 + 8))(*(void *)v5);
        uint64_t v4 = (char *)*((void *)this + 1);
        uint64_t v3 = *((void *)this + 3);
      }
      v5 += 8;
    }
    while (v5 != &v4[8 * v3]);
  }
  LSMVectorBase::~LSMVectorBase((void **)this + 17);
  LSMVectorBase::~LSMVectorBase((void **)this + 13);
  LSMTreeBase::~LSMTreeBase((LSMMapCounter *)((char *)this + 40));
  LSMVectorBase::~LSMVectorBase(v2);
}

void sub_2177C3870(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void LSMMapCounter::AddTextWithWeight(LSMMapCounter *this, const LSMTextCounter *a2, float a3)
{
  *((_DWORD *)this + 1) = 0;
  LSMTreeBase::clear((LSMMapCounter *)((char *)this + 40));
}

void LSMMapCounter::ApplyCategoryClusters(uint64_t a1, unint64_t a2, void *a3)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v20, 8, a2);
  bzero(v20[0], 8 * a2);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v19, 12, a2);
  bzero(v19[0], 12 * a2);
  if (a3[2])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      uint64_t v8 = *(unsigned int *)(*a3 + 4 * v6);
      unint64_t v9 = (LSMTupleMap *)*((void *)v20[0] + v8);
      unint64_t v10 = *(const LSMTupleMap **)(*(void *)(a1 + 8) + 8 * v6);
      if (v9)
      {
        LSMTupleMap::Add(v9, v10);
        long long v11 = (_DWORD *)(*(void *)(a1 + 104) + 12 * v6);
        int v12 = (char *)v19[0] + 12 * v8;
        int v13 = v12[1];
        *v12 += *v11;
        v12[1] = v13 + v11[1];
        v12[2] += v11[2];
        uint64_t v14 = *(void *)(*(void *)(a1 + 8) + 8 * v6);
        if (v14) {
          (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
        }
      }
      else
      {
        *((void *)v20[0] + v8) = v10;
        uint64_t v15 = *(void *)(a1 + 104) + 12 * v6;
        unint64_t v16 = (char *)v19[0] + 12 * v8;
        uint64_t v17 = *(void *)v15;
        *((_DWORD *)v16 + 2) = *(_DWORD *)(v15 + 8);
        *(void *)unint64_t v16 = v17;
      }
      uint64_t v6 = v7;
    }
    while (a3[2] > (unint64_t)v7++);
  }
  LSMVectorBase::Swap((uint64_t *)(a1 + 8), (LSMVectorBase *)v20);
  LSMVectorBase::Swap((uint64_t *)(a1 + 104), (LSMVectorBase *)v19);
  LSMVectorBase::~LSMVectorBase(v19);
  LSMVectorBase::~LSMVectorBase(v20);
}

void sub_2177C3B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

uint64_t LSMMapCounter::ApplyTupleClusters(LSMMapCounter *this, int a2, LSMTupleMap *a3)
{
  *((_DWORD *)this + 1) = a2;
  return LSMTreeBase::Swap((LSMMapCounter *)((char *)this + 40), a3);
}

void LSMImmutableMapCounter::LSMImmutableMapCounter(LSMImmutableMapCounter *this, const LSMMapCounter *a2, LSMWordTable *a3, uint64_t a4, unint64_t a5)
{
  *(unsigned char *)this = *(unsigned char *)a2;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  v64 = (LSMImmutableMapCounter *)((char *)this + 24);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 24), 4);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 56), 4);
  unint64_t v9 = (uint64_t *)((char *)this + 88);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 88), 64);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 120), (const LSMMapCounter *)((char *)a2 + 104));
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 152), (const LSMMapCounter *)((char *)a2 + 136));
  unint64_t v63 = (char *)this + 152;
  if (a5
    && ((unint64_t)**((unsigned int **)this + 19) + a4 <= (unint64_t)(CFAbsoluteTimeGetCurrent() / 86400.0)
     || (LSMDebugFlags::sLSMDebug & 0x10) != 0))
  {
    (*(void (**)(LSMWordTable *))(*(void *)a3 + 64))(a3);
  }
  else
  {
    a5 = 0;
  }
  unint64_t v10 = *((void *)this + 17);
  v76[0] = 0;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v75, 32, v10);
  long long v11 = v75[0];
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v72, 8);
  v74 = v11;
  unsigned int v66 = a3;
  if (*((void *)this + 14) >= v10)
  {
    *((void *)this + 13) = v10;
    if (!v10) {
      goto LABEL_19;
    }
  }
  else
  {
    LSMVectorBase::Allocate((const void **)this + 11, v10, 1);
    unint64_t v12 = *((void *)this + 14);
    if (v12 >= v10) {
      unint64_t v12 = v10;
    }
    *((void *)this + 13) = v12;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  do
  {
    uint64_t v16 = *(void *)(*((void *)a2 + 1) + 8 * v15);
    uint64_t v17 = *(void *)(v16 + 8);
    uint64_t v18 = *(void *)(v16 + 56);
    std::pair<LSMVector<unsigned int>,LSMVector<unsigned int>>::pair[abi:ne180100]((LSMVectorBase *)(*v9 + v13));
    unint64_t v19 = v17 - v18;
    uint64_t v20 = *v9;
    uint64_t v21 = *v9 + v13;
    if (*(void *)(v21 + 24) < v19)
    {
      LSMVectorBase::Allocate((const void **)v21, v19, 1);
      uint64_t v20 = *v9;
    }
    uint64_t v22 = v20 + v13;
    if (*(void *)(v22 + 56) < v19) {
      LSMVectorBase::Allocate((const void **)(v22 + 32), v19, 1);
    }
    LSMTreeBase::Begin(v16, (LSMTreeIterBase *)&v77);
    long long v23 = v78;
    v71[0] = v77;
    v71[1] = v78;
    unsigned int v24 = (char *)v75[0] + v14;
    *unsigned int v24 = v77;
    v24[1] = v23;
    if (!LSMTreeIterBase::Equal((LSMTreeIterBase *)((char *)v75[0] + v14), (const LSMTreeIterBase *)v76))
    {
      LSMVectorBase::Append(v72);
      uint64_t v25 = v72[0];
      *((void *)v72[0] + v73 - 1) = v15;
      *(void *)&long long v77 = v74;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMTupleIterComp &,unsigned long *>((uint64_t)v25, (uint64_t)v25 + 8 * v73, (uint64_t *)&v77, v73);
    }
    ++v15;
    v14 += 32;
    v13 += 64;
  }
  while (v10 != v15);
LABEL_19:
  uint64_t v26 = v73;
  BOOL v65 = a5 != 0;
  if (v73)
  {
    uint64_t v27 = 0;
    unint64_t v28 = 0xFFFFFFFFLL;
    unint64_t v29 = v64;
    do
    {
      unint64_t v30 = v72[0];
      uint64_t v31 = *(void *)v72[0];
      *(void *)&long long v77 = v74;
      if (v26 >= 2)
      {
        uint64_t v32 = *(void *)v72[0];
        v33 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,LSMTupleIterComp &,unsigned long *>((void *)v72[0], (uint64_t *)&v77, v26 & 0x1FFFFFFFFFFFFFFFLL);
        uint64_t v34 = &v30[8 * v26 - 8];
        if (v33 == v34)
        {
          void *v33 = v32;
        }
        else
        {
          void *v33 = *v34;
          *uint64_t v34 = v32;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMTupleIterComp &,unsigned long *>((uint64_t)v30, (uint64_t)(v33 + 1), (uint64_t *)&v77, ((char *)(v33 + 1) - v30) >> 3);
        }
      }
      --v73;
      v35 = v75[0];
      uint64_t v36 = (unsigned int *)*((void *)v75[0] + 4 * v31 + 3);
      uint64_t v37 = v36[1];
      if (v37)
      {
        uint64_t v38 = *v36;
        if (v38 == v27)
        {
          uint64_t v39 = *((void *)this + 5);
        }
        else
        {
          if (a5 && v27) {
            LSMImmutableMapCounter::ProcessTuple((uint64_t)this, v66, v27, v28 < a5);
          }
          LSMVectorBase::Append(v64);
          unint64_t v28 = 0;
          uint64_t v39 = *((void *)this + 5);
          *(_DWORD *)(*((void *)this + 3) + 4 * v39 - 4) = v38;
          uint64_t v27 = v38;
        }
        unint64_t v40 = (void *)(*v9 + (v31 << 6));
        LSMVectorBase::Append(v40);
        *(_DWORD *)(*v40 + 4 * v40[2] - 4) = v39 - 1;
        uint64_t v41 = (void *)(*v9 + (v31 << 6) + 32);
        LSMVectorBase::Append(v41);
        *(_DWORD *)(*v41 + 4 * v41[2] - 4) = v37;
        ++*((void *)this + 1);
        v28 += v37;
        v35 = v75[0];
      }
      LSMTreeIterBase::operator++((uint64_t)v35 + 32 * v31);
      if (!LSMTreeIterBase::Equal((LSMTreeIterBase *)((char *)v75[0] + 32 * v31), (const LSMTreeIterBase *)v76))
      {
        LSMVectorBase::Append(v72);
        v42 = v72[0];
        *((void *)v72[0] + v73 - 1) = v31;
        *(void *)&long long v77 = v74;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMTupleIterComp &,unsigned long *>((uint64_t)v42, (uint64_t)v42 + 8 * v73, (uint64_t *)&v77, v73);
      }
      uint64_t v26 = v73;
    }
    while (v73);
    v43 = v66;
    if (a5 && v27)
    {
      LSMImmutableMapCounter::ProcessTuple((uint64_t)this, v66, v27, v28 < a5);
      BOOL v65 = 1;
    }
  }
  else
  {
    unint64_t v29 = v64;
    v43 = v66;
  }
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v71, v29);
  LSMVectorBase::Swap((uint64_t *)v29, (LSMVectorBase *)v71);
  int v44 = *((_DWORD *)a2 + 1);
  *((_DWORD *)this + 4) = v44;
  if (v44)
  {
    unint64_t v45 = *((void *)this + 5);
    unint64_t v46 = *((void *)this + 10);
    if (v46 < v45)
    {
      LSMVectorBase::Allocate((const void **)this + 7, *((void *)this + 5), 1);
      unint64_t v46 = *((void *)this + 10);
    }
    uint64_t v47 = *((void *)this + 5);
    if (v46 >= v45) {
      unint64_t v46 = v45;
    }
    *((void *)this + 9) = v46;
    if (v47)
    {
      unint64_t v48 = 0;
      v49 = (char *)a2 + 40;
      do
      {
        int v70 = 0;
        int v70 = *(_DWORD *)(*(void *)v29 + 4 * v48);
        LSMTreeBase::LowerBound((uint64_t)v49, (uint64_t)&v70, (unsigned __int16 *)&v77);
        long long v68 = v77;
        long long v69 = v78;
        LOWORD(v77) = 0;
        if (LSMTreeIterBase::Equal((LSMTreeIterBase *)&v68, (const LSMTreeIterBase *)&v77)) {
          int v50 = 0;
        }
        else {
          int v50 = *(_DWORD *)(*((void *)&v69 + 1) + 4);
        }
        *(_DWORD *)(*((void *)this + 7) + 4 * v48++) = v50;
      }
      while (v48 < *((void *)this + 5));
    }
  }
  if (v65)
  {
    uint64_t v51 = (*(uint64_t (**)(LSMWordTable *))(*(void *)v43 + 56))(v43);
    (*(void (**)(LSMWordTable *))(*(void *)v43 + 80))(v43);
    uint64_t v52 = (*(uint64_t (**)(LSMWordTable *))(*(void *)v43 + 56))(v43);
    int v53 = v52;
    unint64_t v54 = v51 - v52;
    v55 = *(_DWORD **)v63;
    unint64_t v56 = *(unsigned int *)(*(void *)v63 + 12);
    BOOL v57 = v51 - v52 >= v56;
    int v58 = v56 - (v51 - v52);
    if (v57) {
      int v58 = 0;
    }
    v55[4] = *(_DWORD *)(*(void *)v63 + 8);
    v55[5] = v58;
    unint64_t v59 = v55[1];
    BOOL v57 = v54 >= v59;
    int v60 = v59 - v54;
    if (v57) {
      int v60 = 0;
    }
    v55[2] = *v55;
    v55[3] = v60;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    unsigned int v62 = *(_DWORD **)v63;
    *unsigned int v62 = (unint64_t)(Current / 86400.0);
    v62[1] = v53;
  }
  LSMVectorBase::~LSMVectorBase((void **)v71);
  LSMVectorBase::~LSMVectorBase(v72);
  LSMVectorBase::~LSMVectorBase(v75);
}

void sub_2177C41B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  LSMVectorBase::~LSMVectorBase(&a27);
  LSMVectorBase::~LSMVectorBase(&a32);
  LSMVectorBase::~LSMVectorBase(a12);
  LSMVectorBase::~LSMVectorBase(a10);
  LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<unsigned int>>>::~LSMVector(v32);
  LSMVectorBase::~LSMVectorBase(a11);
  LSMVectorBase::~LSMVectorBase(a13);
  _Unwind_Resume(a1);
}

uint64_t LSMImmutableMapCounter::ProcessTuple(uint64_t this, LSMWordTable *a2, uint64_t a3, int a4)
{
  uint64_t v4 = this;
  if (a4
    && (!(a3 >> 30) ? (int v5 = 0x3FFFFFFF) : (int v5 = 0xFFFFFF),
        (v5 & a3) < *(_DWORD *)(*(void *)(this + 152) + 20)))
  {
    --*(void *)(this + 40);
    unint64_t v6 = *(void *)(this + 104);
    if (v6)
    {
      unint64_t v7 = 0;
      uint64_t v8 = (void *)(*(void *)(this + 88) + 48);
      do
      {
        uint64_t v9 = *(v8 - 4);
        if (v9)
        {
          if (*(void *)(this + 40) == *(_DWORD *)(*(v8 - 6) + 4 * v9 - 4))
          {
            *(v8 - 4) = v9 - 1;
            --*v8;
            --*(void *)(this + 8);
            unint64_t v6 = *(void *)(this + 104);
          }
        }
        ++v7;
        v8 += 8;
      }
      while (v7 < v6);
    }
  }
  else
  {
    this = (*(uint64_t (**)(LSMWordTable *, uint64_t))(*(void *)a2 + 72))(a2, a3);
    uint64_t v10 = *(void *)(v4 + 24) + 4 * *(void *)(v4 + 40);
    *(_DWORD *)(v10 - 4) -= this;
  }
  return this;
}

void LSMImmutableMapCounter::LSMImmutableMapCounter(LSMImmutableMapCounter *this, LSMReadFileDesc *a2, LSMWordTable **a3, LSMWordTable ***a4)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 4) = 0;
  uint64_t v8 = (unsigned int *)((char *)this + 16);
  *((void *)this + 1) = 0;
  uint64_t v9 = (void **)((char *)this + 24);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 24), 4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(v8 + 10), 4);
  uint64_t v10 = (uint64_t *)((char *)this + 88);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 88), 64);
  uint64_t v73 = (void *)((char *)this + 88);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 120), 12);
  v72 = a4;
  v74 = (void **)((char *)this + 152);
  LSMVectorBase::LSMVectorBase((LSMImmutableMapCounter *)((char *)this + 152), 4);
  long long v11 = *a3;
  uint64_t __dst = 0;
  unsigned int v75 = 0;
  LSMReadFileDesc::Read(a2, (unsigned int *)&__dst + 1, 1uLL, 4uLL);
  if (HIDWORD(__dst) < 3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    LSMVectorBase::Append(v74);
    *(_DWORD *)(*((void *)this + 19) + 4 * *((void *)this + 21) - 4) = (unint64_t)(Current / 86400.0);
    int v13 = (*(uint64_t (**)(LSMWordTable *))(*(void *)v11 + 56))(v11);
    LSMVectorBase::Append(v74);
    *(_DWORD *)(*((void *)this + 19) + 4 * *((void *)this + 21) - 4) = v13;
    LSMVectorBase::Append(v74);
    *(_DWORD *)(*((void *)this + 19) + 4 * *((void *)this + 21) - 4) = 0;
    LSMVectorBase::Append(v74);
    *(_DWORD *)(*((void *)this + 19) + 4 * *((void *)this + 21) - 4) = 1;
    LSMVectorBase::Append(v74);
    *(_DWORD *)(*((void *)this + 19) + 4 * *((void *)this + 21) - 4) = 0;
    LSMVectorBase::Append(v74);
    *(_DWORD *)(*((void *)this + 19) + 4 * *((void *)this + 21) - 4) = 1;
  }
  else
  {
    LSMReadFileDesc::ReadVec(a2, v74, 6uLL);
  }
  if (!LSMReadFileDesc::Read(a2, (unsigned int *)&__dst, 1uLL, 4uLL))
  {
LABEL_68:
    *(unsigned char *)this = 0;
    return;
  }
  BOOL v14 = LSMReadFileDesc::Read(a2, &v75, 1uLL, 4uLL);
  long long v69 = (void **)(v8 + 10);
  int v70 = (void **)((char *)this + 120);
  v71 = (const void **)v9;
  *(unsigned char *)this = v14;
  if (!v14) {
    return;
  }
  int v15 = __dst;
  if (HIDWORD(__dst) < 2)
  {
    uint64_t v20 = (void **)v71;
    if (*((void *)this + 6) < (unint64_t)__dst)
    {
      LSMVectorBase::Allocate(v71, __dst, 1);
      int v15 = __dst;
      uint64_t v20 = (void **)v71;
    }
    if (!v15)
    {
      int v22 = 0;
LABEL_28:
      char v27 = (*(uint64_t (**)(LSMWordTable *, void **))(*(void *)v11 + 88))(v11, v20);
      *(unsigned char *)this = v27;
      if (v27)
      {
        Vec = (void *)LSMReadFileDesc::ReadVec(a2, v70, v75);
        *(unsigned char *)this = (_BYTE)Vec;
        if (!Vec) {
          return;
        }
        if (v72)
        {
          unsigned int v29 = 0;
          unsigned int v75 = 0;
        }
        else
        {
          unsigned int v29 = v75;
        }
        unint64_t v52 = v29;
        unint64_t v53 = *((void *)this + 14);
        if (v53 < v29)
        {
          Vec = LSMVectorBase::Allocate((const void **)this + 11, v29, 1);
          unint64_t v53 = *((void *)this + 14);
          unsigned int v29 = v75;
        }
        v67 = a3;
        if (v53 >= v52) {
          unint64_t v53 = v52;
        }
        *((void *)this + 13) = v53;
        if (v29)
        {
          uint64_t v54 = 0;
          unint64_t v55 = 0;
          do
          {
            Vec = std::pair<LSMVector<unsigned int>,LSMVector<unsigned int>>::pair[abi:ne180100]((LSMVectorBase *)(*v10 + v54));
            ++v55;
            v54 += 64;
          }
          while (v55 < v75);
        }
        if (__dst)
        {
          unint64_t v56 = 0;
          int v68 = v22;
          do
          {
            MEMORY[0x270FA5388](Vec);
            int v58 = (unsigned int *)((char *)&v67 - ((v57 + 15) & 0x7FFFFFFF0));
            Vec = (void *)LSMReadFileDesc::Read(a2, v58, v75, 4uLL);
            *(unsigned char *)this = (_BYTE)Vec;
            if (!Vec) {
              return;
            }
            v72 = &v67;
            unint64_t v59 = v75;
            if (v75)
            {
              uint64_t v60 = 0;
              unint64_t v61 = 0;
              do
              {
                if (v58[v61])
                {
                  unsigned int v62 = v73;
                  unint64_t v63 = (void *)(*v73 + v60);
                  LSMVectorBase::Append(v63);
                  *(_DWORD *)(*v63 + 4 * v63[2] - 4) = v56;
                  uint64_t v64 = *v62 + v60;
                  unsigned int v65 = v58[v61];
                  Vec = LSMVectorBase::Append((void *)(v64 + 32));
                  *(_DWORD *)(*(void *)(v64 + 32) + 4 * *(void *)(v64 + 48) - 4) = v65;
                  ++*((void *)this + 1);
                  unint64_t v59 = v75;
                }
                ++v61;
                v60 += 64;
              }
              while (v61 < v59);
            }
            ++v56;
            LOBYTE(v22) = v68;
          }
          while (v56 < __dst);
        }
        unsigned int v66 = v67;
        if ((v22 & 1) == 0) {
          return;
        }
        if (*v67) {
          (*(void (**)(LSMWordTable *))(*(void *)*v67 + 104))(*v67);
        }
        *unsigned int v66 = (LSMWordTable *)(**(uint64_t (***)(LSMWordTable *, void))v11)(v11, 0);
      }
      else if ((v22 & 1) == 0)
      {
        return;
      }
      (*(void (**)(LSMWordTable *))(*(void *)v11 + 104))(v11);
      return;
    }
    uint64_t v21 = 0;
    int v22 = 0;
    while (1)
    {
      BOOL v23 = LSMReadFileDesc::Read(a2, &v77, 2uLL, 4uLL);
      *(unsigned char *)this = v23;
      if (!v23) {
        return;
      }
      unsigned int v24 = v77;
      if (v77 >> 30 == 1)
      {
        if ((v22 & 1) == 0)
        {
          long long v11 = (LSMWordTable *)(**(uint64_t (***)(LSMWordTable *, uint64_t))v11)(v11, 1);
          unsigned int v24 = v77;
        }
        unsigned int v25 = LSMWordTable::LookupPair(v11, (v24 >> 8) & 0xFFFFF, (__PAIR64__(v24, v78) >> 20) & 0xFFFFF);
      }
      else
      {
        if (v77 >> 30 != 2)
        {
          unsigned int v26 = (v77 >> 8) & 0xFFFFF;
          goto LABEL_25;
        }
        if ((v22 & 1) == 0)
        {
          long long v11 = (LSMWordTable *)(**(uint64_t (***)(LSMWordTable *, uint64_t))v11)(v11, 1);
          unsigned int v24 = v77;
        }
        unsigned int v25 = LSMWordTable::LookupTriplet(v11, (v24 >> 8) & 0xFFFFF, (__PAIR64__(v24, v78) >> 20) & 0xFFFFF, v78 & 0xFFFFF);
      }
      unsigned int v26 = v25;
      int v22 = 1;
LABEL_25:
      LSMVectorBase::Append(v20);
      *(_DWORD *)(*((void *)this + 3) + 4 * *((void *)this + 5) - 4) = v26;
      if (++v21 >= (unint64_t)__dst) {
        goto LABEL_28;
      }
    }
  }
  uint64_t v17 = v70;
  uint64_t v16 = (void **)v71;
  uint64_t v18 = v69;
  *(unsigned char *)this = LSMReadFileDesc::ReadVec(a2, (void **)v71, __dst);
  LSMVectorBase::advise((uint64_t)v16, 3);
  if (*(unsigned char *)this)
  {
    int v19 = (*(uint64_t (**)(LSMWordTable *, void **))(*(void *)v11 + 88))(v11, v16);
    if (v19) {
      int v19 = LSMReadFileDesc::ReadVec(a2, v17, v75);
    }
  }
  else
  {
    int v19 = 0;
  }
  *(unsigned char *)this = v19;
  if (HIDWORD(__dst) < 4)
  {
    *uint64_t v8 = 0;
    if (!v19) {
      return;
    }
  }
  else
  {
    if (v19)
    {
      int v19 = LSMReadFileDesc::Read(a2, v8, 1uLL, 4uLL);
      if (v19) {
        int v19 = LSMReadFileDesc::ReadVec(a2, v18, __dst);
      }
    }
    *(unsigned char *)this = v19;
    if (!v19) {
      return;
    }
  }
  if (v72)
  {
    unint64_t v30 = 0;
    uint64_t v32 = 0;
    unsigned int v75 = 0;
    unint64_t v31 = *((void *)this + 14);
  }
  else
  {
    unint64_t v30 = v75;
    unint64_t v31 = *((void *)this + 14);
    if (v31 < v75)
    {
      LSMVectorBase::Allocate((const void **)this + 11, v75, 1);
      unint64_t v31 = *((void *)this + 14);
    }
    uint64_t v32 = v75;
  }
  if (v31 >= v30) {
    unint64_t v31 = v30;
  }
  *((void *)this + 13) = v31;
  bzero(*((void **)this + 11), 8 * v32);
  if (v75)
  {
    for (unint64_t i = 0; i < v75; ++i)
    {
      std::pair<LSMVector<unsigned int>,LSMVector<unsigned int>>::pair[abi:ne180100]((LSMVectorBase *)(*v10 + (i << 6)));
      char v34 = LSMReadFileDesc::Decode(a2, (unsigned int *)&__dst);
      *(unsigned char *)this = v34;
      if ((v34 & 1) == 0) {
        break;
      }
      unint64_t v35 = __dst;
      *((void *)this + 1) += __dst;
      uint64_t v36 = *((void *)this + 11);
      uint64_t v37 = v36 + (i << 6);
      unint64_t v38 = *(void *)(v37 + 24);
      if (v38 >= v35)
      {
        unint64_t v39 = v35;
        int v40 = v35;
      }
      else
      {
        LSMVectorBase::Allocate((const void **)(v36 + (i << 6)), v35, 1);
        unint64_t v38 = *(void *)(v37 + 24);
        uint64_t v36 = *v10;
        unint64_t v39 = __dst;
        int v40 = __dst;
      }
      if (v38 >= v35) {
        unint64_t v38 = v35;
      }
      *(void *)(v37 + 16) = v38;
      uint64_t v41 = v36 + (i << 6);
      uint64_t v42 = v41 + 32;
      unint64_t v43 = *(void *)(v41 + 56);
      if (v43 < v39)
      {
        LSMVectorBase::Allocate((const void **)v42, v39, 1);
        unint64_t v43 = *(void *)(v42 + 24);
        uint64_t v36 = *v10;
        int v40 = __dst;
      }
      if (v43 >= v39) {
        unint64_t v43 = v39;
      }
      *(void *)(v42 + 16) = v43;
      int v44 = (_DWORD **)(v36 + (i << 6));
      unint64_t v45 = *v44;
      unint64_t v46 = v44[4];
      uint64_t v47 = (2 * v40);
      LODWORD(__dst) = v40 - 1;
      if (v40)
      {
        int v48 = 0;
        do
        {
          unsigned int v77 = 0;
          unsigned int v49 = LSMReadFileDesc::Decode(a2, &v77);
          v48 += v77;
          *unint64_t v45 = v48;
          unsigned int v50 = LSMReadFileDesc::Decode(a2, v46++);
          ++v45;
          uint64_t v47 = v47 - v49 - v50;
          int v51 = __dst;
          LODWORD(__dst) = __dst - 1;
        }
        while (v51);
      }
      uint64_t v10 = v73;
      if (v47) {
        goto LABEL_68;
      }
    }
  }
}

void sub_2177C4C04(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(*(void ***)(v1 - 136));
  LSMVectorBase::~LSMVectorBase(*(void ***)(v1 - 168));
  LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<unsigned int>>>::~LSMVector(*(LSMVectorBase **)(v1 - 144));
  LSMVectorBase::~LSMVectorBase(*(void ***)(v1 - 176));
  LSMVectorBase::~LSMVectorBase(*(void ***)(v1 - 160));
  _Unwind_Resume(a1);
}

void LSMImmutableMapCounter::~LSMImmutableMapCounter(void **this)
{
}

void sub_2177C4CFC(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase((void **)(v1 + 24));
  _Unwind_Resume(a1);
}

void LSMImmutableMapCounter::SumTuples(LSMImmutableMapCounter *this, LSMTupleAccumulator *a2, LSMWordTable *a3, int a4)
{
  uint64_t v8 = *((void *)this + 3);
  unint64_t v9 = *((void *)this + 5);
  uint64_t v10 = (unsigned int *)(v8 + 4 * v9);
  if (a4) {
    unsigned int v11 = 0x40000000;
  }
  else {
    unsigned int v11 = 0x80000000;
  }
  unint64_t v12 = (unsigned int *)(v8 + 4 * v9);
  if (v9)
  {
    unint64_t v12 = (unsigned int *)*((void *)this + 3);
    do
    {
      unint64_t v13 = v9 >> 1;
      BOOL v14 = &v12[v9 >> 1];
      unsigned int v16 = *v14;
      int v15 = v14 + 1;
      v9 += ~(v9 >> 1);
      if (v16 < v11) {
        unint64_t v12 = v15;
      }
      else {
        unint64_t v9 = v13;
      }
    }
    while (v9);
    if (a4 && v10 != v12)
    {
      unint64_t v17 = v10 - v12;
      uint64_t v10 = v12;
      do
      {
        unint64_t v18 = v17 >> 1;
        int v19 = (int *)&v10[v17 >> 1];
        int v21 = *v19;
        uint64_t v20 = (unsigned int *)(v19 + 1);
        v17 += ~(v17 >> 1);
        BOOL v22 = v21 < 0;
        if (v21 < 0) {
          unint64_t v17 = v18;
        }
        if (!v22) {
          uint64_t v10 = v20;
        }
      }
      while (v17);
    }
  }
  unint64_t v23 = *((void *)this + 13);
  unint64_t v24 = ((uint64_t)v12 - v8) >> 2;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v45, 4, v23);
  bzero(v45[0], 4 * v23);
  if (v23)
  {
    uint64_t v25 = 0;
    uint64_t v26 = *((void *)this + 11);
    char v27 = v45[0];
    do
    {
      unint64_t v28 = (uint64_t *)(v26 + (v25 << 6));
      unint64_t v29 = v28[2];
      unint64_t v30 = v27[v25];
      if (v29 > v30)
      {
        uint64_t v31 = *v28;
        unsigned int v32 = v30 + 1;
        do
        {
          if (v24 <= *(unsigned int *)(v31 + 4 * v30)) {
            break;
          }
          v27[v25] = v32;
          unint64_t v30 = v32;
          BOOL v22 = v29 > v32++;
        }
        while (v22);
      }
      ++v25;
    }
    while (v25 != v23);
  }
  while (v12 != v10)
  {
    unsigned int v44 = 0;
    if (a4)
    {
      unsigned int v43 = 0;
      LSMWordTable::Pair(a3, *v12, &v44, &v43);
      BOOL v33 = 0;
      if (!v23) {
        goto LABEL_35;
      }
    }
    else
    {
      unsigned int v43 = 0;
      *(void *)uint64_t v42 = 0;
      LSMWordTable::Triplet(a3, *v12, &v43, &v42[1], v42);
      unsigned int v44 = LSMWordTable::LookupPair(a3, v43, v42[1]);
      BOOL v33 = v43 == 0;
      if (!v23)
      {
LABEL_35:
        float v36 = 0.0;
        goto LABEL_36;
      }
    }
    char v34 = v45[0];
    unint64_t v35 = (uint64_t *)(*((void *)this + 11) + 32);
    float v36 = 0.0;
    unint64_t v37 = v23;
    do
    {
      unint64_t v38 = *v34;
      if (*(v35 - 2) > v38 && v24 == *(_DWORD *)(*(v35 - 4) + 4 * v38))
      {
        uint64_t v39 = *v35;
        *char v34 = v38 + 1;
        float v36 = v36 + (float)*(unsigned int *)(v39 + 4 * v38);
      }
      ++v34;
      v35 += 8;
      --v37;
    }
    while (v37);
LABEL_36:
    *(float *)LSMTupleAccumulator::operator[](a2, *v12) = v36;
    int v40 = (float *)LSMTupleAccumulator::operator[](a2, v44);
    *int v40 = v36 + *v40;
    if (v33)
    {
      uint64_t v41 = (float *)LSMTupleAccumulator::operator[](a2, 0);
      *uint64_t v41 = v36 + *v41;
    }
    ++v12;
    ++v24;
  }
  LSMVectorBase::~LSMVectorBase(v45);
}

void sub_2177C4FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  LSMVectorBase::~LSMVectorBase((void **)va);
  _Unwind_Resume(a1);
}

uint64_t LSMImmutableMapCounter::Store(LSMImmutableMapCounter *this, FILE **a2, char a3)
{
  unsigned int __ptr = *((void *)this + 5);
  if (a3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = *((_DWORD *)this + 34);
  }
  unsigned int v15 = v5;
  if (*((void *)this + 9)) {
    unint64_t v6 = &kLSMMapCounterVersionClusters;
  }
  else {
    unint64_t v6 = &kLSMMapCounterVersionNoClusters;
  }
  if (LSMWriteFileDesc::Write(a2, v6, 1uLL, 4uLL)
    && LSMWriteFileDesc::WriteVec(a2, (LSMImmutableMapCounter *)((char *)this + 152))
    && LSMWriteFileDesc::Write(a2, &__ptr, 1uLL, 4uLL)
    && LSMWriteFileDesc::Write(a2, &v15, 1uLL, 4uLL)
    && LSMWriteFileDesc::WriteVec(a2, (LSMImmutableMapCounter *)((char *)this + 24))
    && LSMWriteFileDesc::WriteVec(a2, (LSMImmutableMapCounter *)((char *)this + 120))
    && (!*((void *)this + 9)
     || LSMWriteFileDesc::Write(a2, (char *)this + 16, 1uLL, 4uLL)
     && LSMWriteFileDesc::WriteVec(a2, (LSMImmutableMapCounter *)((char *)this + 56))))
  {
    if (!v15) {
      return 0;
    }
    uint64_t v7 = 0;
    while (1)
    {
      unsigned int __ptr = *(_DWORD *)(*((void *)this + 11) + (v7 << 6) + 16);
      if (!LSMWriteFileDesc::Encode(a2, __ptr)) {
        break;
      }
      uint64_t v8 = (int **)(*((void *)this + 11) + (v7 << 6));
      unint64_t v9 = *v8;
      uint64_t v10 = (unsigned int *)v8[4];
      LODWORD(v8) = __ptr--;
      if (v8)
      {
        int v11 = 0;
        while (LSMWriteFileDesc::Encode(a2, *v9 - v11) && LSMWriteFileDesc::Encode(a2, *v10))
        {
          ++v10;
          int v12 = *v9++;
          int v11 = v12;
          if (!__ptr--) {
            goto LABEL_24;
          }
        }
        return 0xFFFFFFFFLL;
      }
LABEL_24:
      uint64_t result = 0;
      if (++v7 >= (unint64_t)v15) {
        return result;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

void LSMTupleMap::~LSMTupleMap(LSMTupleMap *this)
{
  LSMTreeBase::~LSMTreeBase(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177C5208(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C40FD820D8ELL);
  _Unwind_Resume(a1);
}

void LSMMutableTextCounter::~LSMMutableTextCounter(LSMMutableTextCounter *this)
{
  *(void *)this = &unk_26C7C6130;
  LSMTreeBase::~LSMTreeBase((LSMMutableTextCounter *)((char *)this + 24));
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C7C6130;
  LSMTreeBase::~LSMTreeBase((LSMMutableTextCounter *)((char *)this + 24));
  JUMPOUT(0x21D44C230);
}

void sub_2177C52D4(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C406F311667);
  _Unwind_Resume(a1);
}

void LSMImmutableTextCounter::~LSMImmutableTextCounter(void **this)
{
  *this = &unk_26C7C6048;
  LSMVectorBase::~LSMVectorBase(this + 3);
}

{
  uint64_t vars8;

  *this = &unk_26C7C6048;
  LSMVectorBase::~LSMVectorBase(this + 3);
  JUMPOUT(0x21D44C230);
}

void sub_2177C53A0(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C40965AFFE8);
  _Unwind_Resume(a1);
}

void LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<unsigned int>>>::~LSMVector(LSMVectorBase *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    uint64_t v3 = *(void ***)this;
    uint64_t v4 = v2 << 6;
    do
    {
      LSMVectorBase::~LSMVectorBase(v3 + 4);
      LSMVectorBase::~LSMVectorBase(v3);
      v3 += 8;
      v4 -= 64;
    }
    while (v4);
  }
  LSMVectorBase::~LSMVectorBase((void **)this);
}

void sub_2177C542C(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

LSMVectorBase *std::pair<LSMVector<unsigned int>,LSMVector<unsigned int>>::pair[abi:ne180100](LSMVectorBase *a1)
{
  LSMVectorBase::LSMVectorBase(a1, 4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(v2 + 32), 4);
  return a1;
}

void sub_2177C5490(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMTupleIterComp &,unsigned long *>(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    unint64_t v4 = (unint64_t)(a4 - 2) >> 1;
    unsigned int v5 = (void *)(result + 8 * v4);
    uint64_t v6 = *v5;
    uint64_t v9 = *(void *)(a2 - 8);
    uint64_t v7 = (void *)(a2 - 8);
    uint64_t v8 = v9;
    uint64_t v10 = *a3;
    unsigned int v11 = **(_DWORD **)(*a3 + 32 * v9 + 24);
    if (**(_DWORD **)(*a3 + 32 * *v5 + 24) > v11)
    {
      do
      {
        int v12 = v5;
        void *v7 = v6;
        if (!v4) {
          break;
        }
        unint64_t v4 = (v4 - 1) >> 1;
        unsigned int v5 = (void *)(result + 8 * v4);
        uint64_t v6 = *v5;
        uint64_t v7 = v12;
      }
      while (**(_DWORD **)(v10 + 32 * *v5 + 24) > v11);
      *int v12 = v8;
    }
  }
  return result;
}

void *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,LSMTupleIterComp &,unsigned long *>(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  uint64_t v6 = *a2;
  do
  {
    uint64_t v7 = &a1[v3];
    uint64_t v10 = v7[1];
    uint64_t v8 = v7 + 1;
    uint64_t v9 = v10;
    uint64_t v11 = (2 * v3) | 1;
    uint64_t v3 = 2 * v3 + 2;
    if (v3 >= a3)
    {
      uint64_t v3 = v11;
    }
    else if (**(_DWORD **)(v6 + 32 * v9 + 24) <= **(_DWORD **)(v6 + 32 * v8[1] + 24))
    {
      uint64_t v3 = v11;
    }
    else
    {
      uint64_t v9 = v8[1];
      ++v8;
    }
    *a1 = v9;
    a1 = v8;
  }
  while (v3 <= v5);
  return v8;
}

void LSMClassifier::LSMClassifier(LSMClassifier *this)
{
  *(void *)this = &unk_26C7C61A0;
  uint64_t v2 = (LSMClassifier *)((char *)this + 56);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 24), 4);
  LSMVectorBase::LSMVectorBase(v2, 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 88), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 120), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 152), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 184), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 216), 4);
  *((unsigned char *)this + 248) = 1;
}

void sub_2177C5688(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v6);
  LSMVectorBase::~LSMVectorBase(v5);
  LSMVectorBase::~LSMVectorBase(v4);
  LSMVectorBase::~LSMVectorBase(v3);
  LSMVectorBase::~LSMVectorBase(v2);
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void LSMClassifier::~LSMClassifier(void **this)
{
  *this = &unk_26C7C61A0;
  LSMVectorBase::~LSMVectorBase(this + 27);
  LSMVectorBase::~LSMVectorBase(this + 23);
  LSMVectorBase::~LSMVectorBase(this + 19);
  LSMVectorBase::~LSMVectorBase(this + 15);
  LSMVectorBase::~LSMVectorBase(this + 11);
  LSMVectorBase::~LSMVectorBase(this + 7);
  LSMVectorBase::~LSMVectorBase(this + 3);
}

{
  uint64_t vars8;

  LSMClassifier::~LSMClassifier(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177C5768(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase((void **)(v1 + 24));
  _Unwind_Resume(a1);
}

void sub_2177C581C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C4095E0DEAELL);
  _Unwind_Resume(a1);
}

void LSMClassifier::NBestCategories(uint64_t a1, uint64_t a2, int a3, float *a4, char a5)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v10, 4);
  (*(void (**)(uint64_t, void **))(*(void *)a2 + 16))(a2, v10);
  if ((LSMDebugFlags::sLSMDebug & 2) != 0) {
    DumpVector((uint64_t)v10);
  }
  LSMClassifier::NBestCategories(a1, (const float **)v10, a3, a4, a5);
  LSMVectorBase::~LSMVectorBase(v10);
}

void sub_2177C58F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t DumpVector(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  time_t v7 = 0;
  time(&v7);
  uint64_t v2 = localtime(&v7);
  strftime(__filename, 0x50uLL, "vector_%d%b%C_%H%M%S", v2);
  uint64_t v3 = fopen(__filename, "w");
  fprintf(v3, "%lu\n", *(void *)(a1 + 16));
  if (*(void *)(a1 + 16))
  {
    uint64_t v4 = *(float **)a1;
    do
    {
      float v5 = *v4++;
      fprintf(v3, "%14g\n", v5);
    }
    while (v4 != (float *)(*(void *)a1 + 4 * *(void *)(a1 + 16)));
  }
  return fclose(v3);
}

void LSMClassifier::NBestCategories(uint64_t a1, const float **a2, int a3, float *a4, char a5)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__X, 4, *(unsigned int *)(a1 + 16));
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__base, 8, *(unsigned int *)(a1 + 12));
  if (!*(void *)(a1 + 168)) {
    LSMClassifier::ComputeVV((LSMClassifier *)a1);
  }
  cblas_sgemv(CblasColMajor, CblasTrans, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 16), 1.0, *(const float **)(a1 + 24), (*(_DWORD *)(a1 + 8) + 3) & 0xFFFFFFFC, *a2, 1, 0.0, __X[0], 1);
  float v10 = 1.0 / cblas_snrm2(*(_DWORD *)(a1 + 16), __X[0], 1);
  if (a5)
  {
    if (fabsf(v10) == INFINITY)
    {
      bzero(a4, 8 * a3);
    }
    else
    {
      if (*(_DWORD *)(a1 + 12))
      {
        uint64_t v20 = 0;
        unint64_t v21 = 0;
        do
        {
          float v22 = cblas_sdot(*(_DWORD *)(a1 + 16), __X[0], 1, (const float *)(*(void *)(a1 + 56) + 4 * ((*(unsigned int *)(a1 + 16) + 3) & 0x1FFFFFFFCLL) * v21), 1);
          unint64_t v23 = v21 + 1;
          unint64_t v24 = __base[0];
          uint64_t v25 = (float *)((char *)__base[0] + v20);
          *(_DWORD *)uint64_t v25 = v21 + 1;
          v25[1] = v10 * (float)(v22 * *(float *)(*(void *)(a1 + 152) + 4 * v21));
          v20 += 8;
          unint64_t v21 = v23;
        }
        while (v23 < *(unsigned int *)(a1 + 12));
      }
      else
      {
        LODWORD(v2LSMVectorBase::~LSMVectorBase(this + 3) = 0;
        unint64_t v24 = __base[0];
      }
      qsort(v24, v23, 8uLL, (int (__cdecl *)(const void *, const void *))LSMCompareScores);
      if (a3 > (int)v23)
      {
        bzero(&a4[2 * v23], 8 * (a3 - (int)v23));
        a3 = v23;
      }
      if (a3 >= 1)
      {
        unsigned int v32 = (uint64_t *)__base[0];
        uint64_t v33 = a3;
        do
        {
          uint64_t v34 = *v32++;
          *(void *)a4 = v34;
          a4 += 2;
          --v33;
        }
        while (v33);
      }
    }
  }
  else
  {
    unsigned int v11 = *(_DWORD *)(a1 + 12);
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      float v14 = 0.0;
      unsigned int v15 = (char *)__base[0];
      do
      {
        unint64_t v16 = v13 + 1;
        *(_DWORD *)&v15[v12] = v13 + 1;
        float v17 = cblas_sdot(*(_DWORD *)(a1 + 16), __X[0], 1, (const float *)(*(void *)(a1 + 56) + 4 * ((*(unsigned int *)(a1 + 16) + 3) & 0x1FFFFFFFCLL) * v13), 1);
        float v18 = 1.0;
        if (fabsf(v17) >= 1.0e-30) {
          float v18 = (float)((float)(v17 * *(float *)(*(void *)(a1 + 152) + 4 * v13)) * v10) + 1.0;
        }
        unsigned int v15 = (char *)__base[0];
        *(float *)((char *)__base[0] + v12 + 4) = v18;
        float v14 = v14 + v18;
        unint64_t v19 = *(unsigned int *)(a1 + 12);
        v12 += 8;
        ++v13;
      }
      while (v16 < v19);
      unsigned int v11 = *(_DWORD *)(a1 + 12);
    }
    else
    {
      unint64_t v19 = 0;
      float v14 = 0.0;
    }
    if (a3 > v11)
    {
      bzero(&a4[2 * v19], 8 * (a3 - v11));
      unsigned int v11 = *(_DWORD *)(a1 + 12);
      a3 = v11;
    }
    if (v14 < 0.000001)
    {
      if (a3 >= 1)
      {
        uint64_t v26 = 0;
        char v27 = a4 + 1;
        do
        {
          *((_DWORD *)v27 - 1) = ++v26;
          *char v27 = 1.0 / (float)v11;
          v27 += 2;
        }
        while (a3 != v26);
      }
    }
    else
    {
      qsort(__base[0], v11, 8uLL, (int (__cdecl *)(const void *, const void *))LSMCompareScores);
      if (a3 >= 1)
      {
        uint64_t v28 = a3;
        unint64_t v29 = a4 + 1;
        unint64_t v30 = (float *)((char *)__base[0] + 4);
        do
        {
          *(v29 - 1) = *(v30 - 1);
          float v31 = *v30;
          v30 += 2;
          *unint64_t v29 = (float)(1.0 / v14) * v31;
          v29 += 2;
          --v28;
        }
        while (v28);
      }
    }
  }
  LSMVectorBase::~LSMVectorBase(__base);
  LSMVectorBase::~LSMVectorBase((void **)__X);
}

void sub_2177C5D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void *);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  LSMVectorBase::~LSMVectorBase((void **)va);
  LSMVectorBase::~LSMVectorBase((void **)va1);
  _Unwind_Resume(a1);
}

void LSMClassifier::NBestWords(uint64_t a1, uint64_t a2, unsigned int a3, char *a4, char a5)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v10, 4);
  (*(void (**)(uint64_t, void **))(*(void *)a2 + 16))(a2, v10);
  if ((LSMDebugFlags::sLSMDebug & 2) != 0) {
    DumpVector((uint64_t)v10);
  }
  LSMClassifier::NBestWords(a1, (const float **)v10, a3, a4, a5);
  LSMVectorBase::~LSMVectorBase(v10);
}

void sub_2177C5E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void LSMClassifier::NBestWords(uint64_t a1, const float **a2, unsigned int a3, char *a4, char a5)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__X, 4, *(unsigned int *)(a1 + 16));
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__base, 8, *(unsigned int *)(a1 + 8));
  if (!*(void *)(a1 + 200)) {
    LSMClassifier::ComputeU2((void *)a1, a5);
  }
  cblas_sgemv(CblasColMajor, CblasTrans, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 16), 1.0, *(const float **)(a1 + 24), (*(_DWORD *)(a1 + 8) + 3) & 0xFFFFFFFC, *a2, 1, 0.0, __X[0], 1);
  uint64_t v10 = *(unsigned int *)(a1 + 16);
  if (a5)
  {
    if (v10)
    {
      unsigned int v11 = __X[0];
      uint64_t v12 = *(float **)(a1 + 88);
      float v13 = 0.0;
      do
      {
        float v14 = *v12++;
        float v15 = *v11 * v14;
        *v11++ = v15;
        float v13 = v13 + (float)(v15 * v15);
        --v10;
      }
      while (v10);
      goto LABEL_13;
    }
LABEL_12:
    float v13 = 0.0;
    goto LABEL_13;
  }
  if (!v10) {
    goto LABEL_12;
  }
  unint64_t v16 = __X[0];
  float v17 = *(float **)(a1 + 120);
  float v13 = 0.0;
  do
  {
    float v18 = *v17++;
    float v19 = *v16 * v18;
    *v16++ = v18 * v19;
    float v13 = v13 + (float)(v19 * v19);
    --v10;
  }
  while (v10);
LABEL_13:
  unsigned int v20 = *(_DWORD *)(a1 + 8);
  if (v20)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    float v24 = 1.0 / sqrtf(v13);
    int v25 = (v20 + 3) & 0xFFFFFFFC;
    uint64_t v26 = (char *)__base[0];
    do
    {
      *(_DWORD *)&v26[v21] = ++v23;
      float v27 = cblas_sdot(*(_DWORD *)(a1 + 16), __X[0], 1, (const float *)(*(void *)(a1 + 24) + v22), v25);
      if ((a5 & 1) != 0 || (float v28 = 0.0, fabsf(v27) >= 1.0e-30)) {
        float v28 = v24 * (float)(v27 * *(float *)(*(void *)(a1 + 184) + v22));
      }
      uint64_t v26 = (char *)__base[0];
      *(float *)((char *)__base[0] + v21 + 4) = v28;
      unint64_t v29 = *(unsigned int *)(a1 + 8);
      v22 += 4;
      v21 += 8;
    }
    while (v23 < v29);
    unsigned int v20 = *(_DWORD *)(a1 + 8);
  }
  else
  {
    unint64_t v29 = 0;
  }
  if (a3 > v20)
  {
    bzero(&a4[8 * v29], 8 * (a3 - v20));
    unsigned int v20 = *(_DWORD *)(a1 + 8);
    a3 = v20;
  }
  qsort(__base[0], v20, 8uLL, (int (__cdecl *)(const void *, const void *))LSMCompareScores);
  memcpy(a4, __base[0], 8 * (int)a3);
  LSMVectorBase::~LSMVectorBase(__base);
  LSMVectorBase::~LSMVectorBase((void **)__X);
}

void sub_2177C60B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void *);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  LSMVectorBase::~LSMVectorBase((void **)va);
  LSMVectorBase::~LSMVectorBase((void **)va1);
  _Unwind_Resume(a1);
}

uint64_t LSMCompareScores(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a1 + 4) - *(float *)(a2 + 4);
  if (v2 < 0.0) {
    return 1;
  }
  if (v2 <= 0.0) {
    return (*(_DWORD *)a1 - *(_DWORD *)a2);
  }
  return 0xFFFFFFFFLL;
}

void LSMClassifier::ComputeVV(LSMClassifier *this)
{
  unint64_t v2 = *((unsigned int *)this + 3);
  unint64_t v3 = *((void *)this + 22);
  if (v3 >= v2)
  {
    int v4 = *((_DWORD *)this + 3);
  }
  else
  {
    LSMVectorBase::Allocate((const void **)this + 19, v2, 1);
    unint64_t v3 = *((void *)this + 22);
    int v4 = *((_DWORD *)this + 3);
  }
  if (v3 >= v2) {
    unint64_t v3 = v2;
  }
  *((void *)this + 21) = v3;
  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      *(float *)(*((void *)this + 19) + 4 * v5) = 1.0
                                                  / cblas_snrm2(*((_DWORD *)this + 4), (const float *)(*((void *)this + 7)+ 4* ((*((unsigned int *)this + 4) + 3) & 0x1FFFFFFFCLL)* v5), 1);
      ++v5;
    }
    while (v5 < *((unsigned int *)this + 3));
  }
}

void *LSMClassifier::ComputeU2(void *this, char a2)
{
  uint64_t v3 = (uint64_t)this;
  int v4 = this + 15;
  unint64_t v5 = *((unsigned int *)this + 4);
  unint64_t v6 = this[18];
  if (v6 >= v5)
  {
    uint64_t v7 = *((unsigned int *)this + 4);
    int v8 = *((_DWORD *)this + 4);
  }
  else
  {
    this = LSMVectorBase::Allocate((const void **)this + 15, v5, 1);
    unint64_t v6 = *(void *)(v3 + 144);
    uint64_t v7 = *(unsigned int *)(v3 + 16);
    int v8 = *(_DWORD *)(v3 + 16);
  }
  if (v6 >= v5) {
    unint64_t v6 = v5;
  }
  *(void *)(v3 + 136) = v6;
  if (v8)
  {
    uint64_t v9 = *(float **)(v3 + 88);
    uint64_t v10 = *(float **)(v3 + 120);
    do
    {
      float v11 = *v9++;
      *v10++ = 1.0 / sqrtf(v11);
      --v7;
    }
    while (v7);
  }
  unint64_t v12 = *(unsigned int *)(v3 + 8);
  unint64_t v13 = *(void *)(v3 + 208);
  if (v13 < v12)
  {
    this = LSMVectorBase::Allocate((const void **)(v3 + 184), *(unsigned int *)(v3 + 8), 1);
    unint64_t v13 = *(void *)(v3 + 208);
  }
  uint64_t v14 = *(unsigned int *)(v3 + 8);
  int v15 = *(_DWORD *)(v3 + 8);
  if (v13 >= v12) {
    unint64_t v13 = v12;
  }
  *(void *)(v3 + 200) = v13;
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = *(unsigned int *)(v3 + 16);
    uint64_t v19 = *(void *)(v3 + 184);
    do
    {
      if (v18)
      {
        uint64_t v20 = 0;
        uint64_t v21 = (float *)(*(void *)(v3 + 24) + v16);
        float v22 = 0.0;
        do
        {
          float v23 = *v21;
          if ((a2 & 1) == 0) {
            float v23 = v23 * *(float *)(*v4 + v20);
          }
          float v22 = v22 + (float)(v23 * v23);
          v20 += 4;
          uint64_t v21 = (float *)((char *)v21 + ((4 * (v12 + 3)) & 0x7FFFFFFF0));
        }
        while (4 * v18 != v20);
      }
      else
      {
        float v22 = 0.0;
      }
      *(float *)(v19 + 4 * v17++) = 1.0 / sqrtf(v22);
      v16 += 4;
    }
    while (v17 != v14);
  }
  return this;
}

void LSMClassifier::CombineW(uint64_t a1, void *a2)
{
  LODWORD(v2) = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    unint64_t v5 = 0;
    do
    {
      cblas_sscal(*(_DWORD *)(a1 + 16), *(const float *)(*a2 + 4 * v5), (float *)(*(void *)(a1 + 24) + 4 * v5), (v2 + 3) & 0xFFFFFFFC);
      ++v5;
      unint64_t v2 = *(unsigned int *)(a1 + 8);
    }
    while (v5 < v2);
  }
}

void LSMClassifier::CombineS(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(a1 + 16))
  {
    unint64_t v4 = 0;
    do
    {
      cblas_sscal(*(_DWORD *)(a1 + 8), *(const float *)(*a2 + 4 * v4), (float *)(*(void *)(a1 + 24) + 4 * ((*(unsigned int *)(a1 + 8) + 3) & 0x1FFFFFFFCLL) * v4), 1);
      cblas_sscal(*(_DWORD *)(a1 + 12), *(const float *)(*a2 + 4 * v4), (float *)(*(void *)(a1 + 56) + 4 * v4), (*(_DWORD *)(a1 + 16) + 3) & 0xFFFFFFFC);
      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
}

uint64_t LSMClassifier::Store(LSMClassifier *this, FILE **a2, char a3)
{
  if ((a3 & 4) != 0) {
    int v5 = 5;
  }
  else {
    int v5 = 4;
  }
  int __ptr = v5;
  if (!LSMWriteFileDesc::Write(a2, &__ptr, 1uLL, 4uLL)
    || !LSMWriteFileDesc::Write(a2, (char *)this + 8, 1uLL, 4uLL)
    || !LSMWriteFileDesc::Write(a2, (char *)this + 12, 1uLL, 4uLL)
    || !LSMWriteFileDesc::Write(a2, (char *)this + 16, 1uLL, 4uLL)
    || !LSMWriteFileDesc::WriteVec(a2, (LSMClassifier *)((char *)this + 24))
    || !LSMWriteFileDesc::WriteVec(a2, (LSMClassifier *)((char *)this + 56))
    || !LSMWriteFileDesc::WriteVec(a2, (LSMClassifier *)((char *)this + 88)))
  {
    return 0xFFFFFFFFLL;
  }
  if (__ptr == 5) {
    return (LSMWriteFileDesc::WriteVec(a2, (LSMClassifier *)((char *)this + 216)) - 1);
  }
  return 0;
}

void LSMClassifier::LSMClassifier(LSMClassifier *this, LSMReadFileDesc *a2)
{
  *(void *)this = &unk_26C7C61A0;
  unint64_t v4 = (LSMClassifier *)((char *)this + 56);
  int v5 = (void **)((char *)this + 24);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 24), 4);
  LSMVectorBase::LSMVectorBase(v4, 4);
  unint64_t v35 = (const void **)((char *)this + 88);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 88), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 120), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 152), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 184), 4);
  LSMVectorBase::LSMVectorBase((LSMClassifier *)((char *)this + 216), 4);
  int __dst = 0;
  if (!LSMReadFileDesc::Read(a2, (unsigned int *)&__dst, 1uLL, 4uLL)
    || (unint64_t v6 = (_DWORD *)((char *)this + 8), !LSMReadFileDesc::Read(a2, (unsigned int *)this + 2, 1uLL, 4uLL)))
  {
    int v8 = (BOOL *)this + 248;
    goto LABEL_11;
  }
  BOOL v7 = LSMReadFileDesc::Read(a2, (unsigned int *)this + 3, 1uLL, 4uLL);
  *((unsigned char *)this + 248) = v7;
  int v8 = (BOOL *)this + 248;
  if (!v7) {
    return;
  }
  if (__dst >= 3)
  {
    uint64_t v9 = (unsigned int *)((char *)this + 16);
    if (LSMReadFileDesc::Read(a2, (unsigned int *)this + 4, 1uLL, 4uLL)
      && LSMReadFileDesc::ReadVec(a2, v5, ((*v6 + 3) & 0x1FFFFFFFCLL) * *v9))
    {
      BOOL Vec = LSMReadFileDesc::ReadVec(a2, (void **)v4, ((*v9 + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 3));
      *int v8 = Vec;
      if (Vec)
      {
        unint64_t v11 = *v9;
        if (__dst < 4)
        {
          unint64_t v30 = *((void *)this + 14);
          if (v30 >= v11)
          {
            uint64_t v31 = *v9;
            int v32 = *v9;
          }
          else
          {
            LSMVectorBase::Allocate(v35, *v9, 1);
            unint64_t v30 = *((void *)this + 14);
            uint64_t v31 = *((unsigned int *)this + 4);
            int v32 = *((_DWORD *)this + 4);
          }
          if (v30 >= v11) {
            unint64_t v30 = v11;
          }
          *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v30;
          if (v32) {
            memset_pattern16((void *)*v35, &unk_2177DCCB0, 4 * v31);
          }
        }
        else
        {
          *int v8 = LSMReadFileDesc::ReadVec(a2, (void **)v35, *v9);
        }
        if (__dst >= 5) {
          *int v8 = LSMReadFileDesc::ReadVec(a2, (void **)this + 27, *v6);
        }
        goto LABEL_40;
      }
      return;
    }
LABEL_11:
    *int v8 = 0;
    return;
  }
  uint64_t v34 = (LSMVectorBase *)v5;
  uint64_t v12 = *((unsigned int *)this + 2);
  uint64_t v13 = *((unsigned int *)this + 3);
  *((_DWORD *)this + 4) = v13;
  uint64_t v14 = (v12 + 3) & 0x1FFFFFFFCLL;
  unint64_t v15 = *((void *)this + 6);
  uint64_t v16 = v13;
  if (v15 < v14 * v13)
  {
    LSMVectorBase::Allocate((const void **)v5, v14 * v13, 1);
    unint64_t v15 = *((void *)this + 6);
    uint64_t v16 = *((unsigned int *)this + 3);
  }
  uint64_t v33 = v13 + 3;
  uint64_t v17 = (v13 + 3) & 0x1FFFFFFFCLL;
  if (v15 >= v14 * v13) {
    unint64_t v15 = v14 * v13;
  }
  *((void *)this + 5) = v15;
  unint64_t v18 = v17 * v16;
  unint64_t v19 = *((void *)this + 10);
  if (v19 < v17 * v16)
  {
    LSMVectorBase::Allocate((const void **)v4, v17 * v16, 1);
    unint64_t v19 = *((void *)this + 10);
  }
  if (v19 >= v18) {
    unint64_t v19 = v18;
  }
  *((void *)this + 9) = v19;
  unint64_t v20 = *((unsigned int *)this + 4);
  unint64_t v21 = *((void *)this + 14);
  if (v21 < v20)
  {
    LSMVectorBase::Allocate(v35, *((unsigned int *)this + 4), 1);
    unint64_t v21 = *((void *)this + 14);
  }
  if (v21 >= v20) {
    unint64_t v21 = v20;
  }
  *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v21;
  (*(void (**)(LSMReadFileDesc *, uint64_t, uint64_t))(*(void *)a2 + 24))(a2, 8, 1);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__X, 4, *v6);
  if (*v6)
  {
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    do
    {
      LSMReadFileDesc::Read(a2, (unsigned int *)__X[0], *((unsigned int *)this + 4), 4uLL);
      cblas_scopy(*((_DWORD *)this + 4), __X[0], 1, (float *)(*((void *)this + 3) + v22), v14);
      ++v23;
      v22 += 4;
    }
    while (v23 < *v6);
  }
  (*(void (**)(LSMReadFileDesc *, uint64_t, uint64_t))(*(void *)a2 + 24))(a2, 24, 1);
  *int v8 = LSMReadFileDesc::Read(a2, *((unsigned int **)this + 11), *((unsigned int *)this + 4), 4uLL);
  (*(void (**)(LSMReadFileDesc *, uint64_t, uint64_t))(*(void *)a2 + 24))(a2, 24, 1);
  size_t v24 = *((unsigned int *)this + 4);
  if (v24)
  {
    uint64_t v25 = 0;
    for (size_t i = 0; i < v24; ++i)
    {
      BOOL v27 = LSMReadFileDesc::Read(a2, (unsigned int *)(*(void *)v4 + v25), v24, 4uLL);
      *((unsigned char *)this + 248) = v27;
      size_t v24 = *((unsigned int *)this + 4);
      v25 += (4 * v33) & 0x7FFFFFFF0;
    }
    if (!v27) {
      goto LABEL_38;
    }
  }
  else if (!*v8)
  {
    goto LABEL_38;
  }
  LSMClassifier::CombineS((uint64_t)this, v35);
  if (__dst > 1)
  {
LABEL_37:
    char v29 = 1;
    goto LABEL_39;
  }
  BOOL v28 = LSMReadFileDesc::Read(a2, (unsigned int *)__X[0], *v6, 4uLL);
  *int v8 = v28;
  if (v28)
  {
    LSMClassifier::CombineW((uint64_t)this, __X);
    goto LABEL_37;
  }
LABEL_38:
  char v29 = 0;
LABEL_39:
  LSMVectorBase::~LSMVectorBase((void **)__X);
  int v5 = (void **)v34;
  if (v29)
  {
LABEL_40:
    LSMVectorBase::advise((uint64_t)v5, 3);
    LSMVectorBase::advise((uint64_t)v4, 3);
    LSMVectorBase::advise((uint64_t)v35, 3);
    LSMVectorBase::advise((uint64_t)this + 216, 3);
  }
}

void sub_2177C6A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void **a13, char a14)
{
  LSMVectorBase::~LSMVectorBase(v16);
  LSMVectorBase::~LSMVectorBase(v15);
  LSMVectorBase::~LSMVectorBase(a11);
  LSMVectorBase::~LSMVectorBase(a12);
  LSMVectorBase::~LSMVectorBase(a13);
  LSMVectorBase::~LSMVectorBase(v14);
  LSMVectorBase::~LSMVectorBase(a10);
  _Unwind_Resume(a1);
}

uint64_t LSMCFInit_LSMMap(uint64_t result)
{
  *(void *)(result + 16) = &unk_26C7C61D0;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t LSMCFRegister_LSMMap(void)
{
  qword_26ACF2C68 = 0;
  unk_26ACF2C78 = 0u;
  unk_26ACF2C88 = 0u;
  return _CFRuntimeRegisterClass();
}

CFTypeID LSMMapGetTypeID(void)
{
  CFTypeID result = gLSMCFTypeID_LSMMap;
  if (!gLSMCFTypeID_LSMMap)
  {
    qword_26ACF2C68 = 0;
    unk_26ACF2C78 = 0u;
    unk_26ACF2C88 = 0u;
    CFTypeID result = _CFRuntimeRegisterClass();
    gLSMCFTypeID_LSMMap = result;
  }
  return result;
}

CFTypeID LSMTextGetTypeID(void)
{
  CFTypeID result = gLSMCFTypeID_LSMText;
  if (!gLSMCFTypeID_LSMText)
  {
    CFTypeID result = LSMCFRegister_LSMText();
    gLSMCFTypeID_LSMText = result;
  }
  return result;
}

CFTypeID LSMResultGetTypeID(void)
{
  CFTypeID result = gLSMCFTypeID_LSMResult;
  if (!gLSMCFTypeID_LSMResult)
  {
    CFTypeID result = LSMCFRegister_LSMResult();
    gLSMCFTypeID_LSMResult = result;
  }
  return result;
}

LSMMapRef LSMMapCreate(CFAllocatorRef alloc, CFOptionFlags flags)
{
  if (!gLSMCFTypeID_LSMMap)
  {
    qword_26ACF2C68 = 0;
    unk_26ACF2C78 = 0u;
    unk_26ACF2C88 = 0u;
    gLSMCFTypeID_LSMMap = _CFRuntimeRegisterClass();
  }
  if (_CFRuntimeCreateInstance()) {
    operator new();
  }
  return 0;
}

void sub_2177C6CA0(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C406AD1A8D0);
  _Unwind_Resume(a1);
}

void LSMMapSetProperties(LSMMapRef mapref, CFDictionaryRef properties)
{
  unint64_t v2 = *(const void **)(*((void *)mapref + 3) + 32);
  *(void *)(*((void *)mapref + 3) + 32) = CFDictionaryCreateCopy(0, properties);
  CFRelease(v2);
}

CFDictionaryRef LSMMapGetProperties(LSMMapRef mapref)
{
  return *(CFDictionaryRef *)(*((void *)mapref + 3) + 32);
}

OSStatus LSMMapStartTraining(LSMMapRef mapref)
{
  return (*(uint64_t (**)(void))(**((void **)mapref + 3) + 24))();
}

LSMCategory LSMMapAddCategory(LSMMapRef mapref)
{
  return (*(uint64_t (**)(void))(**((void **)mapref + 3) + 56))();
}

CFIndex LSMMapGetCategoryCount(LSMMapRef mapref)
{
  return (*(uint64_t (**)(void))(**((void **)mapref + 3) + 64))();
}

uint64_t LSMMapGetTokenCount(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 72))();
}

uint64_t LSMMapCopyWord(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 160))(*(void *)(a1 + 24), (a2 + 1));
}

uint64_t LSMMapCopyToken(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 168))(*(void *)(a1 + 24), (a2 + 1));
}

uint64_t LSMMapFindWord(uint64_t a1, const __CFString *a2)
{
  return LSMAbstractMap::FindWord(*(const __CFString ***)(a1 + 24), a2) - 1;
}

uint64_t LSMMapFindToken(uint64_t a1, const __CFData *a2, LSMWordTable *a3)
{
  return LSMAbstractMap::FindToken(*(const __CFData ***)(a1 + 24), a2, a3) - 1;
}

uint64_t LSMMapGetIndexingPower(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 80))();
}

OSStatus LSMMapSetStopWords(LSMMapRef mapref, LSMTextRef textref)
{
  LSMText::AddWord((LSMTextRef)((char *)textref + 16), 0);
  uint64_t v3 = *(uint64_t (**)(void))(**((void **)mapref + 3) + 96);
  return v3();
}

OSStatus LSMMapAddText(LSMMapRef mapref, LSMTextRef textref, LSMCategory category)
{
  LSMText::AddWord((LSMTextRef)((char *)textref + 16), 0);
  unint64_t v4 = *(uint64_t (**)(void))(**((void **)mapref + 3) + 104);
  return v4();
}

OSStatus LSMMapAddTextWithWeight(LSMMapRef mapref, LSMTextRef textref, LSMCategory category, float weight)
{
  LSMText::AddWord((LSMTextRef)((char *)textref + 16), 0);
  unint64_t v6 = *(uint64_t (**)(__n128))(**((void **)mapref + 3) + 112);
  v7.n128_f32[0] = weight;
  return v6(v7);
}

OSStatus LSMMapCompile(LSMMapRef mapref)
{
  return (*(uint64_t (**)(void, void, void))(**((void **)mapref + 3) + 16))(*((void *)mapref + 3), 0, 0);
}

uint64_t LSMMapCompileWithBlock(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 16))();
}

CFArrayRef LSMMapCreateClusters(CFAllocatorRef alloc, LSMMapRef mapref, CFArrayRef subset, CFIndex numClusters, CFOptionFlags flags)
{
  return (CFArrayRef)(*(uint64_t (**)(void, CFAllocatorRef, CFArrayRef, CFIndex, CFOptionFlags))(**((void **)mapref + 3) + 136))(*((void *)mapref + 3), alloc, subset, numClusters, flags);
}

OSStatus LSMMapApplyClusters(LSMMapRef mapref, CFArrayRef clusters)
{
  return (*(uint64_t (**)(void, CFArrayRef))(**((void **)mapref + 3) + 144))(*((void *)mapref + 3), clusters);
}

LSMResultRef LSMResultCreate(CFAllocatorRef alloc, LSMMapRef mapref, LSMTextRef textref, CFIndex numResults, CFOptionFlags flags)
{
  LSMText::AddWord((LSMTextRef)((char *)textref + 16), 0);
  unint64_t v6 = *(uint64_t (**)(void))(**((void **)mapref + 3) + 152);
  return (LSMResultRef)v6();
}

CFIndex LSMResultGetCount(CFIndex result)
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

LSMCategory LSMResultGetCategory(LSMResultRef result, CFIndex n)
{
  if (result) {
    LODWORD(result) = *(_DWORD *)(*((void *)result + 3) + 8 * n);
  }
  return result;
}

float LSMResultGetScore(LSMResultRef result, CFIndex n)
{
  if (result) {
    return *(float *)(*((void *)result + 3) + 8 * n + 4);
  }
  else {
    return 0.0;
  }
}

CFStringRef LSMResultCopyWord(CFStringRef result, CFIndex n)
{
  if (result) {
    return (CFStringRef)(*(uint64_t (**)(uint64_t, void))(*(void *)result[1].length + 160))(result[1].length, *(unsigned int *)(result->length + 8 * n));
  }
  return result;
}

CFDataRef LSMResultCopyToken(CFDataRef result, CFIndex n)
{
  if (result) {
    return (CFDataRef)(*(uint64_t (**)(void, void))(**((void **)result + 7) + 168))(*((void *)result + 7), *(unsigned int *)(*((void *)result + 3) + 8 * n));
  }
  return result;
}

CFArrayRef LSMResultCopyWordCluster(CFArrayRef result, CFIndex n)
{
  if (result) {
    return (CFArrayRef)(*(uint64_t (**)(void, void))(**((void **)result + 7) + 176))(*((void *)result + 7), *(unsigned int *)(*((void *)result + 3) + 8 * n));
  }
  return result;
}

CFArrayRef LSMResultCopyTokenCluster(CFArrayRef result, CFIndex n)
{
  if (result) {
    return (CFArrayRef)(*(uint64_t (**)(void, void))(**((void **)result + 7) + 184))(*((void *)result + 7), *(unsigned int *)(*((void *)result + 3) + 8 * n));
  }
  return result;
}

OSStatus LSMMapWriteToURL(LSMMapRef mapref, CFURLRef file, CFOptionFlags flags)
{
  if (!file) {
    return -6643;
  }
  (*(void (**)(void, void, void))(**((void **)mapref + 3) + 16))(*((void *)mapref + 3), 0, 0);
  unint64_t v4 = *(uint64_t (**)(void))(**((void **)mapref + 3) + 32);
  return v4();
}

LSMMapRef LSMMapCreateFromURL(CFAllocatorRef alloc, CFURLRef file, CFOptionFlags flags)
{
  if (!file) {
    return 0;
  }
  char v3 = flags;
  LSMDebugFlags::Update(alloc);
  if (!gLSMCFTypeID_LSMMap)
  {
    qword_26ACF2C68 = 0;
    unk_26ACF2C78 = 0u;
    unk_26ACF2C88 = 0u;
    gLSMCFTypeID_LSMMap = _CFRuntimeRegisterClass();
  }
  Instance = (__LSMMap *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    if ((v3 & 2) == 0) {
      operator new();
    }
    operator new();
  }
  return Instance;
}

void sub_2177C74C4(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C406AD1A8D0);
  _Unwind_Resume(a1);
}

OSStatus LSMMapWriteToStream(LSMMapRef mapref, LSMTextRef textref, CFWriteStreamRef stream, CFOptionFlags options)
{
  return (*(uint64_t (**)(void, CFWriteStreamRef, LSMTextRef))(**((void **)mapref + 3) + 40))(*((void *)mapref + 3), stream, textref);
}

uint64_t LSMMapCreateWordArray(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 48))();
}

LSMTextRef LSMTextCreate(CFAllocatorRef alloc, LSMMapRef mapref)
{
  return (LSMTextRef)(*(uint64_t (**)(void, CFAllocatorRef))(**((void **)mapref + 3) + 88))(*((void *)mapref + 3), alloc);
}

OSStatus LSMTextAddWord(LSMTextRef textref, CFStringRef word)
{
  return LSMText::AddWord((const __CFString **)textref + 2, word);
}

OSStatus LSMTextAddWords(LSMTextRef textref, CFStringRef words, CFLocaleRef locale, CFOptionFlags flags)
{
  if (!locale)
  {
    v9.length = CFStringGetLength(words);
    v9.location = 0;
    CFStringRef v7 = CFStringTokenizerCopyBestStringLanguage(words, v9);
    if (v7) {
      locale = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v7);
    }
    else {
      locale = 0;
    }
  }
  LSMParser::CreateParser((LSMParser *)flags, (uint64_t)textref + 24, locale, (const __CFLocale *)flags);
}

OSStatus LSMTextAddToken(LSMTextRef textref, CFDataRef token)
{
  return LSMText::AddToken((const __CFData **)textref + 2, token, v2);
}

uint64_t LSMMapCreateTextLanguageModel(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 24) + 120))(*(void *)(a2 + 24), a1);
}

uint64_t LSMMapCreateSRLanguageModel(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 24) + 128))(*(void *)(a2 + 24), a1);
}

void LSMMap::~LSMMap(LSMMap *this)
{
  LSMMap::~LSMMap(this);
  JUMPOUT(0x21D44C230);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26C7C61D0;
  unint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  LSMWordTable::~LSMWordTable(this);
}

void sub_2177C773C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0xA1C40BD48D6D6);
  _Unwind_Resume(a1);
}

uint64_t LSMCFType::Copy(LSMCFType *this, const __CFAllocator *a2)
{
  return 0;
}

uint64_t LSMCFType::Equal(LSMCFType *this, const LSMCFType *a2)
{
  return 0;
}

uint64_t LSMCFType::Hash(LSMCFType *this)
{
  return 0;
}

uint64_t LSMCFType::CopyFormattingDesc(LSMCFType *this, const __CFDictionary *a2)
{
  return 0;
}

uint64_t LSMCFType::CopyDebugDesc(LSMCFType *this)
{
  return 0;
}

void sub_2177C7804(_Unwind_Exception *a1)
{
  LSMWordTable::~LSMWordTable(v1);
  _Unwind_Resume(a1);
}

uint64_t LSMCFInit_LSMText(uint64_t result)
{
  *(void *)(result + 16) = &unk_26C7C64A0;
  *(void *)(result + 24) = &unk_26C7C64F0;
  *(_DWORD *)(result + 52) = 0;
  *(_DWORD *)(result + 56) = 0;
  return result;
}

void LSMText::LSMText(LSMText *this)
{
  *(void *)this = &unk_26C7C64A0;
  *((void *)this + 1) = &unk_26C7C64F0;
  *((_DWORD *)this + 9) = 0;
  *((_DWORD *)this + 10) = 0;
}

uint64_t LSMCFRegister_LSMText(void)
{
  qword_26ACF2CC8 = 0;
  unk_26ACF2CD8 = 0u;
  unk_26ACF2CE8 = 0u;
  return _CFRuntimeRegisterClass();
}

void LSMCFInit_LSMResult(char *a1)
{
}

uint64_t LSMCFRegister_LSMResult(void)
{
  qword_26ACF2D28 = 0;
  unk_26ACF2D38 = 0u;
  unk_26ACF2D48 = 0u;
  return _CFRuntimeRegisterClass();
}

void LSMMapHeader::LSMMapHeader(LSMMapHeader *this, LSMReadFileDesc *a2)
{
  LSMReadFileDesc::Read(a2, (unsigned int *)this, 1uLL, 0x18uLL);
  unsigned int v4 = *(_DWORD *)this;
  if (*(_DWORD *)this >= 0x10000u)
  {
    *((unsigned char *)a2 + 48) = 1;
    (*(void (**)(LSMReadFileDesc *, void, void))(*(void *)a2 + 24))(a2, 0, 0);
    LSMReadFileDesc::Read(a2, (unsigned int *)this, 1uLL, 0x18uLL);
    unsigned int v4 = *(_DWORD *)this;
  }
  if (v4 <= 2)
  {
    *((_DWORD *)this + 5) = 0;
    if (v4 != 2) {
      *((_DWORD *)this + 4) = 0;
    }
  }
}

BOOL LSMMapHeader::Sane(_DWORD *a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 32))(a2);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)a2 + 24))(a2, 0, 2);
  unint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 32))(a2);
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)a2 + 24))(a2, v4, 0);
  BOOL result = 0;
  if ((*a1 - 1) <= 2)
  {
    unint64_t v7 = a1[1];
    if (v5 <= v7) {
      return 0;
    }
    unint64_t v8 = a1[2];
    if (v5 <= v8) {
      return 0;
    }
    unint64_t v9 = a1[3];
    return v5 > v9 && ((v8 | v7 | v9) & 0xF) == 0;
  }
  return result;
}

void LSMAbstractMap::LSMAbstractMap(LSMAbstractMap *this, LSMMap *a2)
{
  *(void *)this = &unk_26C7C6230;
  *((void *)this + 1) = a2;
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 10) = -6640;
}

void LSMAbstractMap::LSMAbstractMap(LSMAbstractMap *this, LSMMap *a2, uint64_t a3)
{
  *(void *)this = &unk_26C7C6230;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a3;
  LSMWordTable::Create(this);
}

void LSMAbstractMap::LSMAbstractMap(LSMAbstractMap *this, const LSMAbstractMap *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  uint64_t v6 = *((void *)a2 + 2);
  *(void *)this = &unk_26C7C6230;
  *((void *)this + 1) = v5;
  *((void *)this + 2) = v6;
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = (***((uint64_t (****)(void, uint64_t))a2 + 3))(*((void *)a2 + 3), a3);
  *((void *)this + 4) = CFRetain(*((CFTypeRef *)a2 + 4));
  *((_DWORD *)this + 10) = -6640;
}

void LSMAbstractMap::~LSMAbstractMap(LSMAbstractMap *this)
{
  *(void *)this = &unk_26C7C6230;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 104))(v2);
  }
  char v3 = (const void *)*((void *)this + 4);
  if (v3) {
    CFRelease(v3);
  }
}

void LSMAbstractMap::Load(LSMAbstractMap *this, LSMReadFileDesc *a2, const LSMMapHeader *a3, LSMReadFileDesc *a4)
{
  if (*((_DWORD *)a3 + 5))
  {
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)bytes, 1);
    LSMReadFileDesc::ReadVec(a2, (void **)bytes, *((unsigned int *)a3 + 5));
    CFDataRef v8 = CFDataCreateWithBytesNoCopy(0, bytes[0], (CFIndex)bytes[2], (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    *((void *)this + 4) = CFPropertyListCreateFromXMLData(0, v8, 0, 0);
    CFRelease(v8);
    LSMVectorBase::~LSMVectorBase((void **)bytes);
  }
  else
  {
    *((void *)this + 4) = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  (*(void (**)(LSMReadFileDesc *, void, void))(*(void *)a2 + 24))(a2, *((unsigned int *)a3 + 1), 0);
  LSMWordTable::Load(a2, a4);
}

void sub_2177C7DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t LSMAbstractMap::Compile()
{
  return 0;
}

uint64_t LSMAbstractMap::StartTraining(LSMAbstractMap *this)
{
  return 0;
}

uint64_t LSMAbstractMap::Store(LSMAbstractMap *this, const __CFURL *a2)
{
  return 4294960656;
}

uint64_t LSMAbstractMap::WriteToStream(LSMAbstractMap *this, __CFWriteStream *a2, __LSMText *a3)
{
  return 4294960656;
}

uint64_t LSMAbstractMap::AddCategory(LSMAbstractMap *this)
{
  return 0;
}

uint64_t LSMAbstractMap::SetStopWords(LSMAbstractMap *this, __LSMText *a2)
{
  return 4294960656;
}

uint64_t LSMAbstractMap::AddText(LSMAbstractMap *this, __LSMText *a2)
{
  return 4294960656;
}

uint64_t LSMAbstractMap::AddTextWithWeight(LSMAbstractMap *this, __LSMText *a2, float a3)
{
  return 4294960656;
}

uint64_t LSMAbstractMap::CreateTextLanguageModel(LSMAbstractMap *this, const __CFAllocator *a2)
{
  return 0;
}

uint64_t LSMAbstractMap::CreateSRLanguageModel(LSMAbstractMap *this, const __CFAllocator *a2)
{
  return 0;
}

uint64_t LSMAbstractMap::CreateClusters(LSMAbstractMap *this, const __CFAllocator *a2, const __CFArray *a3)
{
  return 0;
}

uint64_t LSMAbstractMap::ApplyClusters(LSMAbstractMap *this, const __CFArray *a2)
{
  return 4294960656;
}

uint64_t LSMAbstractMap::CreateMappedResults(LSMAbstractMap *this, const __CFAllocator *a2, __LSMText *a3)
{
  return 0;
}

uint64_t LSMAbstractMap::CopyWord(LSMAbstractMap *this)
{
  return 0;
}

uint64_t LSMAbstractMap::CopyToken(LSMAbstractMap *this)
{
  return 0;
}

uint64_t LSMAbstractMap::CopyWords(LSMAbstractMap *this)
{
  return 0;
}

uint64_t LSMAbstractMap::CopyTokens(LSMAbstractMap *this)
{
  return 0;
}

uint64_t LSMAbstractMap::GetSVDParam(CFDictionaryRef *this, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  *a2 = 0;
  *a3 = 25000;
  *a4 = 0;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(this[4], @"LSMAlgorithm");
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(this[4], @"LSMPrecision");
  CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(this[4], @"LSMDimension");
  CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(this[4], @"LSMIterations");
  uint64_t result = (uint64_t)CFDictionaryGetValue(this[4], @"LSMTokenCountWeightKey");
  CFStringRef v13 = (const __CFString *)result;
  if (Value)
  {
    uint64_t result = CFStringCompare(Value, @"LSMAlgorithmDense", 0);
    if (result)
    {
      uint64_t result = CFStringCompare(Value, @"LSMAlgorithmSparse", 0);
      if (result) {
        goto LABEL_7;
      }
      uint64_t v14 = 2;
    }
    else
    {
      uint64_t v14 = 1;
    }
    *a2 |= v14;
  }
LABEL_7:
  if (!v9) {
    goto LABEL_13;
  }
  uint64_t result = CFStringCompare(v9, @"LSMPrecisionFloat", 0);
  if (result)
  {
    uint64_t result = CFStringCompare(v9, @"LSMPrecisionDouble", 0);
    if (result) {
      goto LABEL_13;
    }
    uint64_t v15 = 4;
  }
  else
  {
    uint64_t v15 = 8;
  }
  *a2 |= v15;
LABEL_13:
  if (v10)
  {
    unint64_t valuePtr = 0;
    uint64_t result = CFNumberGetValue(v10, kCFNumberLongType, &valuePtr);
    unint64_t v16 = valuePtr;
    if (valuePtr <= 2) {
      unint64_t v16 = 2;
    }
    if (v16 >= *a3) {
      unint64_t v16 = *a3;
    }
    *a3 = v16;
  }
  if (v11)
  {
    uint64_t result = CFNumberGetValue(v11, kCFNumberLongType, a4);
    unint64_t v17 = *a3;
    if (*a3 <= *a4) {
      unint64_t v17 = *a4;
    }
    if (v17 >= 5 * *a3) {
      unint64_t v17 = 5 * *a3;
    }
    *a4 = v17;
  }
  if (v13)
  {
    uint64_t result = CFStringCompare(v13, @"LSMTokenCountWeightNew", 0);
    if (!result) {
      *a2 |= 0x20uLL;
    }
  }
  return result;
}

CFStringRef LSMAbstractMap::CopyWordByID(LSMAbstractMap *this, const __CFAllocator *a2, unsigned int a3)
{
  uint64_t v5 = *((void *)this + 3);
  if (a3 >> 30) {
    int v6 = 0xFFFFFF;
  }
  else {
    int v6 = 0x3FFFFFFF;
  }
  unint64_t v7 = (const char *)(*(uint64_t (**)(uint64_t, void))(*(void *)v5 + 16))(v5, v6 & a3);
  if (*((unsigned char *)this + 17))
  {
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)cStr, 1);
    do
    {
      unsigned int v9 = *(unsigned __int8 *)v7;
      LSMVectorBase::Append(cStr);
      cStr[0][(unint64_t)cStr[2] - 1] = (v9 >> 1) & 0x55 | (2 * v9) & 0xAA;
    }
    while (*(unsigned __int8 *)v7++);
    CFStringRef v11 = CFStringCreateWithCString(a2, cStr[0], 0x8000100u);
    LSMVectorBase::~LSMVectorBase((void **)cStr);
    return v11;
  }
  else
  {
    return CFStringCreateWithCString(a2, v7, 0x8000100u);
  }
}

void sub_2177C815C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

CFDataRef LSMAbstractMap::CopyTokenByID(LSMAbstractMap *this, const __CFAllocator *a2, uint64_t a3)
{
  uint64_t v4 = (unsigned __int8 *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 16))(*((void *)this + 3), a3);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)bytes, 1);
  while (1)
  {
    while (1)
    {
      int v5 = *v4;
      if (v5 != 23) {
        break;
      }
      uint64_t v6 = v4[1];
      if (v4[1])
      {
        if (v6 == 23)
        {
          LSMVectorBase::Append(bytes);
          bytes[0][length - 1] = 23;
        }
        else
        {
          do
          {
            LSMVectorBase::Append(bytes);
            bytes[0][length - 1] = 0;
            --v6;
          }
          while (v6);
        }
      }
      v4 += 2;
    }
    if (!*v4) {
      break;
    }
    LSMVectorBase::Append(bytes);
    ++v4;
    bytes[0][length - 1] = v5;
  }
  CFDataRef v7 = CFDataCreate(a2, bytes[0], length);
  LSMVectorBase::~LSMVectorBase((void **)bytes);
  return v7;
}

void sub_2177C828C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t LSMAbstractMap::FindWord(const __CFString **this, const __CFString *a2)
{
  return LSMText::LookupWord((uint64_t)a2, this[3], (LSMWordTable *)(((unint64_t)this[2] >> 8) & 1));
}

uint64_t LSMText::LookupWord(uint64_t this, const __CFString *a2, LSMWordTable *a3)
{
  *(void *)&v10[1023] = *MEMORY[0x263EF8340];
  if (this)
  {
    int v3 = (int)a3;
    this = CFStringGetCString((CFStringRef)this, &buffer, 1024, 0x8000100u);
    if (this)
    {
      if (LSMDebugFlags::sLSMDebug) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "LSM Word '%s'\n", &buffer);
      }
      if (v3)
      {
        unsigned int v5 = buffer;
        if (buffer)
        {
          uint64_t v6 = v10;
          do
          {
            *(v6 - 1) = (v5 >> 1) & 0x55 | (2 * v5) & 0xAA;
            unsigned int v7 = *v6++;
            unsigned int v5 = v7;
          }
          while (v7);
        }
      }
      size_t v8 = strlen(&buffer);
      return (*((uint64_t (**)(const __CFString *, char *, size_t, void))a2->isa + 1))(a2, &buffer, v8, 0);
    }
  }
  return this;
}

uint64_t LSMAbstractMap::FindToken(const __CFData **this, const __CFData *a2, LSMWordTable *a3)
{
  return LSMText::LookupToken(a2, this[3], a3);
}

uint64_t LSMText::LookupToken(LSMText *this, const __CFData *a2, LSMWordTable *a3)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v15, 1);
  BytePtr = CFDataGetBytePtr(this);
  CFIndex Length = CFDataGetLength(this);
  if (Length >= 1)
  {
    do
    {
      LODWORD(vLSMVectorBase::~LSMVectorBase(this + 7) = *BytePtr;
      if (v7 == 23)
      {
        LSMVectorBase::Append(v15);
        LOBYTE(vLSMVectorBase::~LSMVectorBase(this + 7) = 23;
        *((unsigned char *)v15[0] + v16 - 1) = 23;
        LSMVectorBase::Append(v15);
      }
      else if (*BytePtr)
      {
        LSMVectorBase::Append(v15);
      }
      else
      {
        LSMVectorBase::Append(v15);
        LOBYTE(vLSMVectorBase::~LSMVectorBase(this + 7) = 0;
        *((unsigned char *)v15[0] + v16 - 1) = 23;
        if (BytePtr[1] || (unint64_t)Length < 2)
        {
          unsigned int v9 = BytePtr;
LABEL_16:
          CFIndex v10 = Length;
        }
        else
        {
          uint64_t v8 = 0;
          unsigned int v9 = BytePtr + 14;
          CFIndex v10 = Length - 14;
          while (1)
          {
            uint64_t v7 = v8 + 1;
            if (v8 + 1 >= 14) {
              break;
            }
            --Length;
            if (BytePtr[v8 + 2]) {
              BOOL v11 = 0;
            }
            else {
              BOOL v11 = (unint64_t)Length >= 2;
            }
            ++v8;
            if (!v11)
            {
              unsigned int v9 = &BytePtr[v7];
              goto LABEL_16;
            }
          }
          LOBYTE(vLSMVectorBase::~LSMVectorBase(this + 7) = 14;
        }
        LSMVectorBase::Append(v15);
        LOBYTE(vLSMVectorBase::~LSMVectorBase(this + 7) = v7 + 1;
        BytePtr = v9;
        CFIndex Length = v10;
      }
      *((unsigned char *)v15[0] + v16 - 1) = v7;
      ++BytePtr;
    }
    while (Length-- > 1);
  }
  uint64_t v13 = (*(uint64_t (**)(const __CFData *, void *, uint64_t, void))(*(void *)a2 + 8))(a2, v15[0], v16, 0);
  LSMVectorBase::~LSMVectorBase(v15);
  return v13;
}

void sub_2177C8590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void LSMTrainingMap::LSMTrainingMap(LSMTrainingMap *this, LSMMap *a2, uint64_t a3)
{
}

void sub_2177C8634(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x21D44C230](v3, 0x10A0C40ACE2A72CLL);
  LSMAbstractMap::~LSMAbstractMap(v1);
  _Unwind_Resume(a1);
}

void LSMTrainingMap::LSMTrainingMap(LSMTrainingMap *this, LSMMap *a2, const __CFURL *a3, LSMReadFileDesc *a4)
{
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 10) = -6640;
  *(void *)this = &unk_26C7C6300;
  *((void *)this + 1) = a2;
  *((void *)this + 6) = 0;
  LSMReadFileDesc::LSMReadFileDesc((LSMReadFileDesc *)v7, a3, 0);
  if (v7[1])
  {
    LSMMapHeader::LSMMapHeader((LSMMapHeader *)&v6, (LSMReadFileDesc *)v7);
    if (LSMMapHeader::Sane(&v6, (uint64_t)v7)) {
      LSMAbstractMap::Load(this, (LSMReadFileDesc *)v7, (const LSMMapHeader *)&v6, a4);
    }
  }
  LSMReadFileDesc::~LSMReadFileDesc((LSMReadFileDesc *)v7);
}

void sub_2177C87B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  MEMORY[0x21D44C230](v5, 0x10A0C40ACE2A72CLL);
  LSMReadFileDesc::~LSMReadFileDesc((LSMReadFileDesc *)va);
  LSMAbstractMap::~LSMAbstractMap(v4);
  _Unwind_Resume(a1);
}

void LSMTrainingMap::LSMTrainingMap(LSMTrainingMap *this, const LSMCompiledMap *a2)
{
  LSMAbstractMap::LSMAbstractMap(this, a2, 1);
  *(void *)uint64_t v3 = &unk_26C7C6300;
  *(void *)(v3 + 48) = 0;
  *(_DWORD *)(v3 + 56) = *(void *)(*((void *)a2 + 6) + 136);
  operator new();
}

void sub_2177C889C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v2, 0x10A0C40ACE2A72CLL);
  LSMAbstractMap::~LSMAbstractMap(v1);
  _Unwind_Resume(a1);
}

void LSMTrainingMap::~LSMTrainingMap(LSMTrainingMap *this)
{
  *(void *)this = &unk_26C7C6300;
  uint64_t v2 = *((void *)this + 6);
  if (v2)
  {
    LSMMapCounter::~LSMMapCounter(*((LSMMapCounter **)this + 6));
    MEMORY[0x21D44C230](v2, 0x10A0C40ACE2A72CLL);
  }
  LSMAbstractMap::~LSMAbstractMap(this);
}

{
  uint64_t vars8;

  LSMTrainingMap::~LSMTrainingMap(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177C8958(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v2, 0x10A0C40ACE2A72CLL);
  LSMAbstractMap::~LSMAbstractMap(v1);
  _Unwind_Resume(a1);
}

void sub_2177C89D4(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C406AD1A8D0);
  _Unwind_Resume(a1);
}

void LSMTrainingMap::Compile()
{
}

void sub_2177C8A98(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C40C64765C9);
  _Unwind_Resume(a1);
}

uint64_t LSMTrainingMap::AddCategory(LSMTrainingMap *this)
{
  uint64_t v1 = (*((_DWORD *)this + 14) + 1);
  *((_DWORD *)this + 14) = v1;
  return v1;
}

uint64_t LSMTrainingMap::GetCategoryCount(LSMTrainingMap *this)
{
  return *((unsigned int *)this + 14);
}

uint64_t LSMTrainingMap::CreateText(LSMTrainingMap *this, const __CFAllocator *a2)
{
  if (!gLSMCFTypeID_LSMText)
  {
    qword_26ACF2CC8 = 0;
    unk_26ACF2CD8 = 0u;
    unk_26ACF2CE8 = 0u;
    gLSMCFTypeID_LSMText = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance) {
    LSMText::InitForTraining((LSMText *)(Instance + 16), *((void *)this + 2), *((LSMWordTable **)this + 3));
  }
  return 0;
}

void LSMText::InitForTraining(LSMText *this, __int16 a2, LSMWordTable *a3)
{
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = a3;
  *((_DWORD *)this + 8) = (*(uint64_t (**)(LSMWordTable *))(*(void *)a3 + 48))(a3);
  *((unsigned char *)this + 16) = (a2 & 3) != 0;
  *((unsigned char *)this + 1LSMVectorBase::~LSMVectorBase(this + 7) = (a2 & 2) != 0;
  *((unsigned char *)this + 18) = HIBYTE(a2) & 1;
  LSMTextCounter::Create(0, v5);
}

uint64_t LSMTrainingMap::SetStopWords(LSMTrainingMap *this, __LSMText *a2)
{
  if ((*(unsigned int (**)(void, __LSMText *))(**((void **)this + 3) + 32))(*((void *)this + 3), a2)) {
    return 0;
  }
  else {
    return 4294960656;
  }
}

uint64_t LSMTrainingMap::AddText(LSMTrainingMap *this, const LSMTextCounter **a2, unsigned int a3)
{
  if (a3 && *((_DWORD *)this + 14) >= a3) {
    LSMMapCounter::AddText(*((LSMMapCounter **)this + 6), a2[8]);
  }
  return 4294960655;
}

void sub_2177C8CA8(void *a1)
{
}

uint64_t LSMTrainingMap::AddTextWithWeight(LSMTrainingMap *this, const LSMTextCounter **a2, unsigned int a3, float a4)
{
  if (a3 && *((_DWORD *)this + 14) >= a3) {
    LSMMapCounter::AddTextWithWeight(*((LSMMapCounter **)this + 6), a2[8], a4);
  }
  return 4294960655;
}

void sub_2177C8D4C(void *a1)
{
}

CFArrayRef LSMArrayBuilder::CreateArray(LSMArrayBuilder *this, CFAllocatorRef allocator)
{
  return CFArrayCreate(allocator, *(const void ***)this, *((void *)this + 2), MEMORY[0x263EFFF70]);
}

void LSMArrayBuilder::~LSMArrayBuilder(LSMArrayBuilder *this)
{
  if (*((void *)this + 2))
  {
    unint64_t v2 = 0;
    do
      CFRelease(*(CFTypeRef *)(*(void *)this + 8 * v2++));
    while (v2 < *((void *)this + 2));
  }
  LSMVectorBase::~LSMVectorBase((void **)this);
}

void sub_2177C8DD4(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

uint64_t LSMTrainingMap::CreateClusters(CFDictionaryRef *this, const __CFAllocator *a2, const __CFArray *a3)
{
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  unint64_t v6 = 0;
  LSMAbstractMap::GetSVDParam(this, &v8, &v7, &v6);
  uint64_t v4 = (**(uint64_t (***)(void))this[3])();
  if (*((void *)this[6] + 15)) {
    operator new();
  }
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 104))(v4);
  }
  return 0;
}

void sub_2177C91E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t LSMTrainingMap::ApplyClusters(LSMTrainingMap *this, const __CFArray *a2)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  CFTypeID v5 = CFStringGetTypeID();
  CFTypeID v6 = CFDataGetTypeID();
  CFTypeID v7 = CFNumberGetTypeID();
  CFIndex Count = CFArrayGetCount(a2);
  if (Count)
  {
    int64_t v9 = Count;
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(a2, 0);
    if (CFGetTypeID(ValueAtIndex) == TypeID)
    {
      if (CFArrayGetCount(ValueAtIndex))
      {
        BOOL v11 = CFArrayGetValueAtIndex(ValueAtIndex, 0);
        CFTypeID v12 = CFGetTypeID(v11);
        if (v12 == v5 || v12 == v6) {
          LSMTreeBase::LSMTreeBase((LSMTreeBase *)v16, 8u);
        }
        if (v12 == v7 || v12 == TypeID)
        {
          LSMVectorBase::LSMVectorBase((LSMVectorBase *)v16, 4, *(void *)(*((void *)this + 6) + 24));
          bzero(v16[0], 4 * (uint64_t)v16[2]);
          if (v9 < 1)
          {
LABEL_13:
            LSMMapCounter::ApplyCategoryClusters(*((void *)this + 6), v9, v16);
            LSMVectorBase::~LSMVectorBase(v16);
            return 0;
          }
          CFIndex v14 = 0;
          while (1)
          {
            uint64_t v15 = CFArrayGetValueAtIndex(a2, v14);
            if (CFGetTypeID(v15) != TypeID) {
              break;
            }
            AddCFValuesToMap((const __CFArray *)v15, (uint64_t)v16, v14++);
            if (v9 == v14) {
              goto LABEL_13;
            }
          }
          LSMVectorBase::~LSMVectorBase(v16);
        }
      }
    }
  }
  return 4294960652;
}

void sub_2177C94D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t AddCFValuesToMap(const __CFArray *a1, LSMTupleMap *a2, uint64_t a3, LSMWordTable *a4, LSMWordTable *a5, unint64_t a6)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  CFTypeID v20 = CFStringGetTypeID();
  CFTypeID v19 = CFDataGetTypeID();
  uint64_t result = CFArrayGetCount(a1);
  if (result >= 1)
  {
    uint64_t v14 = result;
    for (CFIndex i = 0; v14 != i; ++i)
    {
      unsigned int v24 = 0;
      CFArrayRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(a1, i);
      uint64_t result = CFGetTypeID(ValueAtIndex);
      if (result == TypeID)
      {
        AddCFValuesToMap((const __CFArray *)ValueAtIndex, a2, a3, a4, (BOOL)a5, a6);
      }
      else
      {
        if ((a6 & 1) != 0 && result == v20)
        {
          unsigned int v18 = LSMText::LookupWord((uint64_t)ValueAtIndex, (const __CFString *)a4, a5);
        }
        else
        {
          if ((a6 & 2) == 0 || result != v19) {
            continue;
          }
          unsigned int v18 = LSMText::LookupToken((LSMText *)ValueAtIndex, a4, v17);
        }
        unsigned int v24 = v18;
      }
      LSMTreeBase::LowerBound((uint64_t)a2, (uint64_t)&v24, v23);
      LOWORD(v22[0]) = 0;
      uint64_t result = LSMTreeIterBase::Equal((LSMTreeIterBase *)v23, (const LSMTreeIterBase *)v22);
      if (result)
      {
        v21[0] = 0;
        v22[0] = (a3 << 32) | v24;
        uint64_t result = LSMTreeBase::Insert(a2, v22, (const LSMTreeIterBase *)v21);
      }
    }
  }
  return result;
}

uint64_t AddCFValuesToMap(const __CFArray *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  CFTypeID v7 = CFNumberGetTypeID();
  uint64_t result = CFArrayGetCount(a1);
  if (result >= 1)
  {
    uint64_t v9 = result;
    for (CFIndex i = 0; i != v9; ++i)
    {
      CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      uint64_t result = CFGetTypeID(ValueAtIndex);
      if (result == TypeID)
      {
        uint64_t result = AddCFValuesToMap(ValueAtIndex, a2, a3);
      }
      else if (result == v7)
      {
        int valuePtr = 0;
        uint64_t result = CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
        if (result)
        {
          if (valuePtr <= *(_DWORD *)(a2 + 16)) {
            *(_DWORD *)(*(void *)a2 + 4 * (valuePtr - 1)) = a3;
          }
        }
      }
    }
  }
  return result;
}

CFDictionaryRef *LSMCompiledMap::LSMCompiledMap(CFDictionaryRef *a1, const LSMAbstractMap *a2)
{
  LSMAbstractMap::LSMAbstractMap((LSMAbstractMap *)a1, a2, 0);
  *(void *)uint64_t v4 = &unk_26C7C63D0;
  *(void *)(v4 + 48) = 0;
  *(void *)(v4 + 56) = 0;
  *(void *)(v4 + 64) = 0;
  unint64_t v11 = 25000;
  unint64_t v12 = 0;
  unint64_t v10 = 0;
  LSMAbstractMap::GetSVDParam((CFDictionaryRef *)v4, &v12, &v11, &v10);
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1[4], @"LSMSweepAge");
  CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a1[4], @"LSMSweepCutoff");
  CFNumberRef v7 = v6;
  if (Value)
  {
    uint64_t v9 = 0;
    CFNumberGetValue(Value, kCFNumberLongType, &v9);
    if (!v7) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    uint64_t v9 = 0;
    CFNumberGetValue(v7, kCFNumberLongType, &v9);
  }
LABEL_5:
  if (*(void *)(*((void *)a2 + 6) + 120)) {
    operator new();
  }
  return a1;
}

void sub_2177C98FC(_Unwind_Exception *a1, int a2)
{
  MEMORY[0x21D44C230](v3, 0x1080C40D1A5925CLL);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    *((_DWORD *)v2 + 10) = -108;
    __cxa_end_catch();
    JUMPOUT(0x2177C98DCLL);
  }
  LSMAbstractMap::~LSMAbstractMap(v2);
  _Unwind_Resume(a1);
}

void LSMCompiledMap::LSMCompiledMap(LSMCompiledMap *this, LSMMap *a2, const __CFURL *a3)
{
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 10) = -6640;
  *(void *)this = &unk_26C7C63D0;
  *((void *)this + 1) = a2;
  *((void *)this + 6) = 0;
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 7) = 0;
  operator new();
}

void sub_2177C9B34(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v2, 0x1081C4095E0DEAELL);
  LSMAbstractMap::~LSMAbstractMap(v1);
  _Unwind_Resume(a1);
}

void LSMCompiledMap::~LSMCompiledMap(LSMCompiledMap *this)
{
  *(void *)this = &unk_26C7C63D0;
  uint64_t v2 = *((void *)this + 6);
  if (v2)
  {
    LSMImmutableMapCounter::~LSMImmutableMapCounter(*((LSMImmutableMapCounter **)this + 6));
    MEMORY[0x21D44C230](v2, 0x1080C40D1A5925CLL);
  }
  uint64_t v3 = *((void *)this + 7);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 8);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  LSMAbstractMap::~LSMAbstractMap(this);
}

{
  uint64_t vars8;

  LSMCompiledMap::~LSMCompiledMap(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177C9C78(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x21D44C230](v3, 0x1080C40D1A5925CLL);
  LSMAbstractMap::~LSMAbstractMap(v1);
  _Unwind_Resume(a1);
}

void sub_2177C9D00(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C40C64765C9);
  _Unwind_Resume(a1);
}

void LSMCompiledMap::StartTraining(LSMCompiledMap *this)
{
}

void sub_2177C9DBC(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C406AD1A8D0);
  _Unwind_Resume(a1);
}

uint64_t LSMCompiledMap::Store(LSMCompiledMap *this, const __CFURL *a2, uint64_t a3)
{
  LSMWriteFileDesc::LSMWriteFileDesc((LSMWriteFileDesc *)v22, a2);
  if ((a3 & 0x100) != 0)
  {
    uint64_t v5 = *((void *)this + 2);
    if ((v5 & 0x103) != 0) {
      a3 ^= 0x100uLL;
    }
    else {
      *((void *)this + 2) = v5 | 0x100;
    }
  }
  if (v22[1])
  {
    CFDataRef XMLData = CFPropertyListCreateXMLData(0, *((CFPropertyListRef *)this + 4));
    uint64_t v7 = *((void *)this + 2);
    int v17 = 3;
    int v20 = v7;
    unsigned int Length = CFDataGetLength(XMLData);
    int v19 = -559038737;
    int32x2_t v18 = vdup_n_s32(0xDEADBEEF);
    LSMWriteFileDesc::Write(v22, &v17, 1uLL, 0x18uLL);
    BytePtr = CFDataGetBytePtr(XMLData);
    LSMWriteFileDesc::Write(v22, BytePtr, Length, 1uLL);
    CFRelease(XMLData);
    v18.i32[0] = LSMFileDesc::Align((LSMFileDesc *)v22, 0x10uLL);
    int v9 = (*(uint64_t (**)(void, FILE **, uint64_t))(**((void **)this + 3) + 24))(*((void *)this + 3), v22, a3);
    v18.i32[1] = LSMFileDesc::Align((LSMFileDesc *)v22, 0x10uLL);
    int v10 = LSMImmutableMapCounter::Store(*((LSMImmutableMapCounter **)this + 6), v22, a3);
    int v19 = LSMFileDesc::Align((LSMFileDesc *)v22, 0x10uLL);
    int v11 = LSMClassifier::Store(*((LSMClassifier **)this + 7), v22, a3);
    LSMFileDesc::Seek(v22, 0, 0);
    BOOL v12 = LSMWriteFileDesc::Write(v22, &v17, 1uLL, 0x18uLL);
    if (v11) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v12;
    }
    if (v10) {
      BOOL v14 = 0;
    }
    if (v14 && v9 == 0) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 4294960654;
    }
    if (!v14 || v9 != 0) {
      remove((const std::__fs::filesystem::path *)v22[2], v13);
    }
  }
  else
  {
    uint64_t v15 = 4294960653;
  }
  LSMFileDesc::~LSMFileDesc((LSMFileDesc *)v22);
  return v15;
}

void sub_2177C9FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  LSMFileDesc::~LSMFileDesc((LSMFileDesc *)va);
  _Unwind_Resume(a1);
}

uint64_t LSMCompiledMap::WriteToStream(LSMCompiledMap *this, __CFWriteStream *a2, __LSMText *a3)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v62);
  uint64_t v5 = v62;
  *(_DWORD *)&v63[*(void *)(v62 - 24)] = *(_DWORD *)&v63[*(void *)(v62 - 24)] & 0xFFFFFEFB | 4;
  *(void *)&v63[*(void *)(v5 - 24) + 8] = 2;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v61, 4);
  if (a3) {
    (*(void (**)(void, void **))(**((void **)a3 + 8) + 16))(*((void *)a3 + 8), v61);
  }
  CFNumberRef v6 = (void *)*((void *)this + 6);
  uint64_t v7 = (unsigned int *)v6[3];
  unint64_t v49 = v6[5];
  unint64_t v8 = v6[17];
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v60, 4, v8);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v59, 4, v8);
  bzero(v60[0], 4 * v8);
  bzero(v59[0], 4 * v8);
  if (v49)
  {
    int v9 = 0;
    int v10 = 0;
    unsigned int v11 = 0;
    int v48 = a3;
    unint64_t v12 = 1;
    while (1)
    {
      if (!a3) {
        goto LABEL_8;
      }
      if (*((float *)v61[0] + v12 - 1) != 0.0) {
        break;
      }
LABEL_48:
      ++v12;
      ++v7;
      if (v12 > v49) {
        goto LABEL_52;
      }
    }
    *(void *)&v63[*(void *)(v62 - 24) + 16] = 5;
    uint64_t v13 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"%\t", 2);
LABEL_8:
    unsigned int v58 = 0;
    unsigned int v14 = *v7;
    unsigned int v57 = -1;
    unsigned int v58 = v14;
    unsigned int v56 = -1;
    if (v14 >> 30 == 2)
    {
      LSMWordTable::Triplet(*((LSMWordTable **)this + 3), v14, &v58, &v57, &v56);
    }
    else if (v14 >> 30 == 1)
    {
      LSMWordTable::Pair(*((LSMWordTable **)this + 3), v14, &v58, &v57);
    }
    int v50 = v9;
    int v51 = v7;
    if (v8)
    {
      unint64_t v15 = v12 - 1;
      for (unint64_t i = 1; i <= v8; ++i)
      {
        uint64_t v17 = *(void *)(*((void *)this + 6) + 88);
        unint64_t v18 = i - 1;
        int v19 = (uint64_t *)(v17 + ((i - 1) << 6));
        int v20 = v60[0];
        unint64_t v21 = v19[2];
        unint64_t v22 = *((unsigned int *)v60[0] + i - 1);
        if (v21 <= v22) {
          goto LABEL_21;
        }
        uint64_t v23 = *v19;
        unsigned int v24 = v22 + 1;
        while (1)
        {
          unint64_t v25 = *(unsigned int *)(v23 + 4 * v22);
          if (v15 <= v25) {
            break;
          }
          v20[v18] = v24;
          unint64_t v22 = v24;
          if (v21 <= v24++) {
            goto LABEL_21;
          }
        }
        if (v15 == v25)
        {
          uint64_t v27 = *(void *)(v17 + (v18 << 6) + 32);
          v20[v18] = v24;
          uint64_t v28 = *(unsigned int *)(v27 + 4 * v22);
        }
        else
        {
LABEL_21:
          uint64_t v28 = 0;
        }
        *(void *)&v63[*(void *)(v62 - 24) + 16] = 6;
        char v29 = (void *)std::ostream::operator<<();
        LOBYTE(__p) = 9;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)&__p, 1);
        if (v28)
        {
          if (v11 <= *((_DWORD *)v59[0] + v18)) {
            unsigned int v11 = *((_DWORD *)v59[0] + v18);
          }
          *((_DWORD *)v59[0] + v18) = 0;
        }
        else
        {
          ++v10;
          ++*((_DWORD *)v59[0] + v18);
        }
      }
    }
    if (v58 == -1)
    {
      uint64_t v32 = v57;
      a3 = v48;
      uint64_t v7 = v51;
      int v31 = v50;
      if (v57 == -1)
      {
        uint64_t v34 = v56;
        if (v56 == -1)
        {
LABEL_36:
          LOBYTE(__p) = 10;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v62, (uint64_t)&__p, 1);
          int v9 = v31 + 1;
          if (v9 == 1000)
          {
            std::stringbuf::str();
            if ((v55 & 0x80u) == 0) {
              p_p = (const UInt8 *)&__p;
            }
            else {
              p_p = (const UInt8 *)__p;
            }
            if ((v55 & 0x80u) == 0) {
              CFIndex v37 = v55;
            }
            else {
              CFIndex v37 = v54;
            }
            CFWriteStreamWrite(a2, p_p, v37);
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)&unk_2177DF08E);
            std::string::operator=(v64, &__str);
            std::stringbuf::__init_buf_ptrs[abi:ne180100]((uint64_t)v63);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
            if ((char)v55 < 0) {
              operator delete(__p);
            }
            int v9 = 0;
          }
          goto LABEL_48;
        }
LABEL_35:
        unint64_t v35 = (const char *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 16))(*((void *)this + 3), v34);
        unhash(v35, &v62, (*((void *)this + 2) >> 8) & 1);
        goto LABEL_36;
      }
    }
    else
    {
      unint64_t v30 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 3) + 16))(*((void *)this + 3));
      a3 = v48;
      uint64_t v7 = v51;
      int v31 = v50;
      unhash(v30, &v62, (*((void *)this + 2) >> 8) & 1);
      if (v57 == -1)
      {
LABEL_33:
        if (v56 == -1) {
          goto LABEL_36;
        }
        LOBYTE(__p) = 58;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v62, (uint64_t)&__p, 1);
        uint64_t v34 = v56;
        goto LABEL_35;
      }
      LOBYTE(__p) = 58;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v62, (uint64_t)&__p, 1);
      uint64_t v32 = v57;
    }
    uint64_t v33 = (const char *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 16))(*((void *)this + 3), v32);
    unhash(v33, &v62, (*((void *)this + 2) >> 8) & 1);
    goto LABEL_33;
  }
LABEL_52:
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v62, (uint64_t)"Zeros ", 6);
  unint64_t v38 = (void *)std::ostream::operator<<();
  uint64_t v39 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v38, (uint64_t)" (", 2);
  uint64_t v40 = *v39;
  *(uint64_t *)((char *)v39 + *(void *)(*v39 - 24) + 24) = 4;
  *(uint64_t *)((char *)v39 + *(void *)(v40 - 24) + 16) = 1;
  uint64_t v41 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)"%), Max Run ", 12);
  uint64_t v42 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v42 + *(void *)(*v42 - 24)));
  unsigned int v43 = std::locale::use_facet((const std::locale *)&__p, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v43->__vftable[2].~facet_0)(v43, 10);
  std::locale::~locale((std::locale *)&__p);
  std::ostream::put();
  std::ostream::flush();
  std::stringbuf::str();
  if ((v55 & 0x80u) == 0) {
    unsigned int v44 = (const UInt8 *)&__p;
  }
  else {
    unsigned int v44 = (const UInt8 *)__p;
  }
  if ((v55 & 0x80u) == 0) {
    CFIndex v45 = v55;
  }
  else {
    CFIndex v45 = v54;
  }
  CFWriteStreamWrite(a2, v44, v45);
  if ((char)v55 < 0) {
    operator delete(__p);
  }
  LSMVectorBase::~LSMVectorBase(v59);
  LSMVectorBase::~LSMVectorBase(v60);
  LSMVectorBase::~LSMVectorBase(v61);
  std::ostringstream::~ostringstream((uint64_t)&v62);
  return 0;
}

void sub_2177CA688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_2177CA8AC(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x21D44C1E0](v1);
  _Unwind_Resume(a1);
}

const char *unhash(const char *__s, void *a2, int a3)
{
  uint64_t v4 = (uint64_t)__s;
  if (a3)
  {
    if (*__s)
    {
      uint64_t v5 = (unsigned __int8 *)(__s + 1);
      do
        __s = (const char *)std::ostream::put();
      while (*v5++);
    }
  }
  else
  {
    size_t v7 = strlen(__s);
    return (const char *)std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, v4, v7);
  }
  return __s;
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D44C1E0](a1 + 112);
  return a1;
}

void sub_2177CAA68(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C1E0](v1 + 112);
  _Unwind_Resume(a1);
}

__CFArray *LSMCompiledMap::CreateArrayOfWords(LSMCompiledMap *this)
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v3 = (void *)*((void *)this + 6);
  uint64_t v4 = v3[3];
  unint64_t v5 = v3[5];
  unint64_t v6 = v3[17];
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v21, 4, v6);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v20, 4, v6);
  v6 *= 4;
  bzero(v21[0], v6);
  bzero(v20[0], v6);
  if (v5)
  {
    uint64_t v7 = 0;
    do
    {
      unsigned int v8 = *(_DWORD *)(v4 + 4 * v7);
      unsigned int v18 = -1;
      unsigned int v19 = v8;
      unsigned int v17 = -1;
      if (v8 >> 30 == 2)
      {
        LSMWordTable::Triplet(*((LSMWordTable **)this + 3), v8, &v19, &v18, &v17);
      }
      else if (v8 >> 30 == 1)
      {
        LSMWordTable::Pair(*((LSMWordTable **)this + 3), v8, &v19, &v18);
      }
      int v9 = CFStringCreateMutable(0, 0);
      if (!v9) {
        goto LABEL_17;
      }
      if (v19 == -1)
      {
        uint64_t v11 = v18;
        if (v18 == -1)
        {
          uint64_t v13 = v17;
          if (v17 == -1) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
      }
      else
      {
        int v10 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 3) + 16))(*((void *)this + 3));
        CFStringAppendCString(v9, v10, 0x8000100u);
        if (v18 == -1) {
          goto LABEL_13;
        }
        CFStringAppendCString(v9, "_", 0x8000100u);
        uint64_t v11 = v18;
      }
      unint64_t v12 = (const char *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 16))(*((void *)this + 3), v11);
      CFStringAppendCString(v9, v12, 0x8000100u);
LABEL_13:
      if (v17 != -1)
      {
        CFStringAppendCString(v9, "_", 0x8000100u);
        uint64_t v13 = v17;
LABEL_15:
        unsigned int v14 = (const char *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 16))(*((void *)this + 3), v13);
        CFStringAppendCString(v9, v14, 0x8000100u);
      }
LABEL_16:
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
LABEL_17:
      unint64_t v15 = v7 + 2;
      ++v7;
    }
    while (v15 <= v5);
  }
  LSMVectorBase::~LSMVectorBase(v20);
  LSMVectorBase::~LSMVectorBase(v21);
  return Mutable;
}

void sub_2177CAD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  LSMVectorBase::~LSMVectorBase((void **)va);
  _Unwind_Resume(a1);
}

uint64_t LSMCompiledMap::GetCategoryCount(LSMCompiledMap *this)
{
  uint64_t result = *(void *)(*((void *)this + 6) + 136);
  if (!result) {
    return *(unsigned int *)(*((void *)this + 7) + 12);
  }
  return result;
}

uint64_t LSMCompiledMap::GetTokenCount(LSMCompiledMap *this)
{
  return *(void *)(*((void *)this + 6) + 40);
}

float LSMCompiledMap::GetIndexingPower(LSMCompiledMap *this, unsigned int a2)
{
  uint64_t v2 = *((void *)this + 7);
  float result = -1.0;
  if (*(void *)(v2 + 232) > (unint64_t)a2) {
    return *(float *)(*(void *)(v2 + 216) + 4 * a2);
  }
  return result;
}

uint64_t LSMCompiledMap::CreateText(LSMCompiledMap *this, const __CFAllocator *a2)
{
  if (!gLSMCFTypeID_LSMText)
  {
    qword_26ACF2CC8 = 0;
    unk_26ACF2CD8 = 0u;
    unk_26ACF2CE8 = 0u;
    gLSMCFTypeID_LSMText = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    uint64_t v5 = *((void *)this + 2);
    unint64_t v6 = (LSMTextCounter *)*((void *)this + 6);
    *(void *)(Instance + 40) = *((void *)this + 3);
    *(_DWORD *)(Instance + 48) = 0;
    *(unsigned char *)(Instance + 32) = (v5 & 3) != 0;
    *(unsigned char *)(Instance + 3LSMVectorBase::~LSMVectorBase(this + 3) = (v5 & 0x7FFFFFFFFFFFFFFFLL) != 0;
    *(unsigned char *)(Instance + 34) = BYTE1(v5) & 1;
    *(void *)(Instance + 64) = 0;
    LSMTextCounter::Create(v6, v3);
  }
  return 0;
}

void LSMText::InitForMapping(LSMText *this, const LSMImmutableMapCounter *a2, LSMWordTable *a3, const LSMImmutableMapCounter *a4)
{
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = a3;
  *((_DWORD *)this + 8) = 0;
  *((unsigned char *)this + 16) = (a2 & 3) != 0;
  *((unsigned char *)this + 1LSMVectorBase::~LSMVectorBase(this + 7) = ((unint64_t)a2 & 0x7FFFFFFFFFFFFFFFLL) != 0;
  *((unsigned char *)this + 18) = BYTE1(a2) & 1;
  *((void *)this + 6) = 0;
  LSMTextCounter::Create(a4, a2);
}

void LSMCompiledMap::CreateTextLanguageModel(const LSMImmutableMapCounter **this, const __CFAllocator *a2)
{
  LSMModelGenerator::LSMModelGenerator((LSMModelGenerator *)v2, this[6], this[3]);
}

void sub_2177CAF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void LSMCompiledMap::CreateSRLanguageModel(const LSMImmutableMapCounter **this, const __CFAllocator *a2)
{
  LSMSRModelGenerator::LSMSRModelGenerator((LSMSRModelGenerator *)v2, this[6], this[3]);
}

void sub_2177CB004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void LSMSRModelGenerator::~LSMSRModelGenerator(void **this)
{
  *this = &unk_26C7C6780;
  LSMVectorBase::~LSMVectorBase(this + 35);
  LSMModelGenerator::~LSMModelGenerator(this);
}

{
  uint64_t vars8;

  *this = &unk_26C7C6780;
  LSMVectorBase::~LSMVectorBase(this + 35);
  LSMModelGenerator::~LSMModelGenerator(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177CB088(_Unwind_Exception *a1)
{
  LSMModelGenerator::~LSMModelGenerator(v1);
  _Unwind_Resume(a1);
}

void *LSMCompiledMap::CreateMappedResults(LSMCompiledMap *this, const __CFAllocator *a2, __LSMText *a3, unint64_t a4, char a5)
{
  if (!gLSMCFTypeID_LSMResult)
  {
    qword_26ACF2D28 = 0;
    unk_26ACF2D38 = 0u;
    unk_26ACF2D48 = 0u;
    gLSMCFTypeID_LSMResult = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  int v10 = (void *)Instance;
  *(void *)(Instance + 56) = this;
  uint64_t v11 = (const void **)(Instance + 24);
  unint64_t v12 = *(void *)(Instance + 48);
  if (v12 < a4)
  {
    LSMVectorBase::Allocate((const void **)(Instance + 24), a4, 1);
    unint64_t v12 = v10[6];
  }
  if (v12 >= a4) {
    unint64_t v12 = a4;
  }
  v10[5] = v12;
  uint64_t v13 = *((void *)this + 7);
  uint64_t v14 = *((void *)a3 + 8);
  unint64_t v15 = (char *)v10[3];
  if (a5)
  {
    LSMClassifier::NBestWords(v13, v14, a4, v15, (a5 & 2) != 0);
    if ((a5 & 2) != 0)
    {
LABEL_9:
      unint64_t v16 = a4 + 1;
      uint64_t v17 = 8 * a4 - 8;
      while (--v16)
      {
        int v18 = *(_DWORD *)((char *)*v11 + v17);
        v17 -= 8;
        if (v18) {
          goto LABEL_17;
        }
      }
      goto LABEL_19;
    }
  }
  else
  {
    LSMClassifier::NBestCategories(v13, v14, a4, (float *)v15, (a5 & 2) != 0);
    if ((a5 & 2) != 0) {
      goto LABEL_9;
    }
  }
  unint64_t v16 = a4 + 1;
  uint64_t v19 = 8 * a4 - 4;
  while (--v16)
  {
    float v20 = *(float *)((char *)*v11 + v19);
    v19 -= 8;
    if (v20 >= 1.0e-10)
    {
LABEL_17:
      unint64_t v21 = v10[6];
      if (v21 >= v16) {
        goto LABEL_20;
      }
      LSMVectorBase::Allocate(v11, v16, 1);
      break;
    }
  }
LABEL_19:
  unint64_t v21 = v10[6];
LABEL_20:
  if (v21 >= v16) {
    unint64_t v21 = v16;
  }
  v10[5] = v21;
  return v10;
}

CFStringRef LSMCompiledMap::CopyWord(LSMCompiledMap *this, int a2)
{
  uint64_t v2 = *((void *)this + 6);
  if (*(void *)(v2 + 72))
  {
    CFArrayRef v3 = (const __CFArray *)(*(uint64_t (**)(LSMCompiledMap *))(*(void *)this + 176))(this);
    CFStringRef v4 = CFStringCreateByCombiningStrings(0, v3, @",");
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"{%@}", v4);
    CFRelease(v3);
    CFRelease(v4);
    return v5;
  }
  else
  {
    unsigned int v7 = *(_DWORD *)(*(void *)(v2 + 24) + 4 * (a2 - 1));
    return LSMCompiledMap::CopyWordByTuple((LSMWordTable **)this, v7);
  }
}

CFStringRef LSMCompiledMap::CopyWordByTuple(LSMWordTable **this, unsigned int a2)
{
  if (a2 >> 30)
  {
    unsigned int v13 = 0;
    if (a2 >> 30 == 1)
    {
      unsigned int v12 = 0;
      LSMWordTable::Pair(this[3], a2, &v13, &v12);
      CFStringRef v4 = LSMAbstractMap::CopyWordByID((LSMAbstractMap *)this, 0, v13);
      CFStringRef v5 = LSMAbstractMap::CopyWordByID((LSMAbstractMap *)this, 0, v12);
      CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"<%@,%@>", v4, v5);
      CFRelease(v4);
      CFStringRef v7 = v5;
    }
    else
    {
      unsigned int v11 = 0;
      unsigned int v12 = 0;
      LSMWordTable::Triplet(this[3], a2, &v13, &v12, &v11);
      CFStringRef v8 = LSMAbstractMap::CopyWordByID((LSMAbstractMap *)this, 0, v13);
      CFStringRef v9 = LSMAbstractMap::CopyWordByID((LSMAbstractMap *)this, 0, v12);
      CFStringRef v10 = LSMAbstractMap::CopyWordByID((LSMAbstractMap *)this, 0, v11);
      CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"<%@,%@,%@>", v8, v9, v10);
      CFRelease(v8);
      CFRelease(v9);
      CFStringRef v7 = v10;
    }
    CFRelease(v7);
    return v6;
  }
  else
  {
    return LSMAbstractMap::CopyWordByID((LSMAbstractMap *)this, 0, a2);
  }
}

CFDataRef LSMCompiledMap::CopyToken(LSMCompiledMap *this, int a2)
{
  uint64_t v2 = *((void *)this + 6);
  if (*(void *)(v2 + 72))
  {
    CFArrayRef v3 = (const void *)(*(uint64_t (**)(LSMCompiledMap *))(*(void *)this + 184))(this);
    CFDataRef XMLData = CFPropertyListCreateXMLData(0, v3);
    CFRelease(v3);
    return XMLData;
  }
  else
  {
    uint64_t v6 = *(unsigned int *)(*(void *)(v2 + 24) + 4 * (a2 - 1));
    return LSMAbstractMap::CopyTokenByID(this, 0, v6);
  }
}

CFArrayRef LSMCompiledMap::CopyWords(LSMCompiledMap *this, uint64_t a2)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)values, 8);
  CFStringRef v4 = (void *)*((void *)this + 6);
  if (v4[9])
  {
    uint64_t v5 = v4[5];
    if (v5)
    {
      uint64_t v6 = 0;
      int v7 = a2 - 1;
      do
      {
        if (*(_DWORD *)(v4[7] + 4 * v6) == v7)
        {
          CFStringRef v8 = LSMCompiledMap::CopyWordByTuple((LSMWordTable **)this, *(_DWORD *)(v4[3] + 4 * v6));
          LSMVectorBase::Append(values);
          values[0][numValues - 1] = (void *)v8;
        }
        ++v6;
      }
      while (v5 != v6);
    }
  }
  else
  {
    CFStringRef v9 = (void *)(*(uint64_t (**)(LSMCompiledMap *, uint64_t))(*(void *)this + 160))(this, a2);
    LSMVectorBase::Append(values);
    values[0][numValues - 1] = v9;
  }
  CFArrayRef v10 = CFArrayCreate(0, (const void **)values[0], numValues, MEMORY[0x263EFFF70]);
  LSMArrayBuilder::~LSMArrayBuilder((LSMArrayBuilder *)values);
  return v10;
}

void sub_2177CB614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

CFArrayRef LSMCompiledMap::CopyTokens(LSMCompiledMap *this, uint64_t a2)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)values, 8);
  CFStringRef v4 = (void *)*((void *)this + 6);
  if (v4[9])
  {
    uint64_t v5 = v4[5];
    if (v5)
    {
      uint64_t v6 = 0;
      int v7 = a2 - 1;
      do
      {
        if (*(_DWORD *)(v4[7] + 4 * v6) == v7)
        {
          CFDataRef v8 = LSMAbstractMap::CopyTokenByID(this, 0, *(unsigned int *)(v4[3] + 4 * v6));
          LSMVectorBase::Append(values);
          values[0][numValues - 1] = v8;
        }
        ++v6;
      }
      while (v5 != v6);
    }
  }
  else
  {
    CFStringRef v9 = (void *)(*(uint64_t (**)(LSMCompiledMap *, uint64_t))(*(void *)this + 168))(this, a2);
    LSMVectorBase::Append(values);
    values[0][numValues - 1] = v9;
  }
  CFArrayRef v10 = CFArrayCreate(0, (const void **)values[0], numValues, MEMORY[0x263EFFF70]);
  LSMArrayBuilder::~LSMArrayBuilder((LSMArrayBuilder *)values);
  return v10;
}

void sub_2177CB754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t LSMText::AddWord(LSMText *this, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = a2;
    if (*((_DWORD *)this + 8) <= a2)
    {
      (***((void (****)(void, uint64_t))this + 6))(*((void *)this + 6), a2);
      if (*((unsigned char *)this + 16))
      {
        CFStringRef v4 = (void (***)(void, uint64_t))*((void *)this + 6);
        uint64_t v5 = LSMWordTable::LookupPair(*((LSMWordTable **)this + 3), *((_DWORD *)this + 10), v3);
        (**v4)(v4, v5);
        if (*((unsigned char *)this + 17))
        {
          unsigned int v6 = *((_DWORD *)this + 10);
          if (v6)
          {
            int v7 = (void (***)(void, uint64_t))*((void *)this + 6);
            uint64_t v8 = LSMWordTable::LookupTriplet(*((LSMWordTable **)this + 3), *((_DWORD *)this + 9), v6, v3);
            (**v7)(v7, v8);
            *((_DWORD *)this + 9) = *((_DWORD *)this + 10);
          }
        }
        *((_DWORD *)this + 10) = v3;
      }
    }
  }
  else
  {
    if (*((unsigned char *)this + 16))
    {
      unsigned int v9 = *((_DWORD *)this + 10);
      if (v9)
      {
        CFArrayRef v10 = (void (***)(void, uint64_t))*((void *)this + 6);
        uint64_t v11 = LSMWordTable::LookupPair(*((LSMWordTable **)this + 3), v9, 0);
        (**v10)(v10, v11);
      }
    }
    if (*((unsigned char *)this + 17))
    {
      unsigned int v12 = *((_DWORD *)this + 9);
      if (v12)
      {
        unsigned int v13 = (void (***)(void, uint64_t))*((void *)this + 6);
        uint64_t v14 = LSMWordTable::LookupTriplet(*((LSMWordTable **)this + 3), v12, *((_DWORD *)this + 10), 0);
        (**v13)(v13, v14);
      }
    }
    *((_DWORD *)this + 9) = 0;
    *((_DWORD *)this + 10) = 0;
  }
  unint64_t v15 = *(uint64_t (**)(void))(**((void **)this + 6) + 24);
  return v15();
}

uint64_t LSMText::AddWord(const __CFString **this, const __CFString *a2)
{
  uint64_t v3 = LSMText::LookupWord((uint64_t)a2, this[3], (LSMWordTable *)*((unsigned __int8 *)this + 18));
  return LSMText::AddWord((LSMText *)this, v3);
}

uint64_t non-virtual thunk to'LSMText::AddWord(const __CFString **this, const __CFString *a2)
{
  uint64_t v2 = (LSMText *)(this - 1);
  uint64_t v3 = LSMText::LookupWord((uint64_t)a2, this[2], (LSMWordTable *)*((unsigned __int8 *)this + 10));
  return LSMText::AddWord(v2, v3);
}

uint64_t LSMText::AddToken(const __CFData **this, const __CFData *a2, LSMWordTable *a3)
{
  uint64_t v4 = LSMText::LookupToken(a2, this[3], a3);
  return LSMText::AddWord((LSMText *)this, v4);
}

void LSMText::~LSMText(LSMText *this)
{
  LSMText::~LSMText(this);
  JUMPOUT(0x21D44C230);
}

{
  LSMWordTable *v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_26C7C64A0;
  uint64_t v2 = (LSMText *)((char *)this + 8);
  *((void *)this + 1) = &unk_26C7C64F0;
  uint64_t v3 = *((void *)this + 6);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  LSMWordTable::~LSMWordTable(v2);
  LSMWordTable::~LSMWordTable(this);
}

void sub_2177CBAD0(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C404463B957);
  _Unwind_Resume(a1);
}

void non-virtual thunk to'LSMText::~LSMText(LSMText *this)
{
}

{
  LSMText::~LSMText((LSMText *)((char *)this - 8));
}

uint64_t LSMAbstractMap::CreateArrayOfWords(LSMAbstractMap *this)
{
  return 0;
}

uint64_t LSMAbstractMap::GetTokenCount(LSMAbstractMap *this)
{
  return 0;
}

float LSMAbstractMap::GetIndexingPower(LSMAbstractMap *this)
{
  return -1.0;
}

void LSMResult::LSMResult(LSMResult *this)
{
  *(void *)this = &unk_26C7C6FD0;
  LSMVectorBase::LSMVectorBase((LSMResult *)((char *)this + 8), 8);
  *(void *)this = &unk_26C7C6590;
}

void sub_2177CBB80(_Unwind_Exception *a1)
{
  LSMWordTable::~LSMWordTable(v1);
  _Unwind_Resume(a1);
}

void LSMResult::~LSMResult(void **this)
{
  LSMResult::~LSMResult(this);
  JUMPOUT(0x21D44C230);
}

{
  uint64_t vars8;

  LSMVectorBase::~LSMVectorBase(this + 1);
  LSMWordTable::~LSMWordTable((LSMWordTable *)this);
}

void sub_2177CBBE4(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C406E72DCD3);
  _Unwind_Resume(a1);
}

void sub_2177CBC44(_Unwind_Exception *a1)
{
  LSMWordTable::~LSMWordTable(v1);
  _Unwind_Resume(a1);
}

void LSMSRModelGenerator::LSMSRModelGenerator(LSMSRModelGenerator *this, const LSMImmutableMapCounter *a2, LSMWordTable *a3)
{
}

void sub_2177CBCAC(_Unwind_Exception *a1)
{
  LSMModelGenerator::~LSMModelGenerator(v1);
  _Unwind_Resume(a1);
}

void sub_2177CBD70(_Unwind_Exception *a1)
{
  LSMWordTable::~LSMWordTable(v2);
  LSMWordTable::~LSMWordTable(v1);
  _Unwind_Resume(a1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x21D44C120](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      CFArrayRef v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
  MEMORY[0x21D44C130](v13);
  return a1;
}

void sub_2177CBED4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21D44C130](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2177CBEB4);
}

void sub_2177CBF2C(_Unwind_Exception *a1)
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
      unsigned int v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_2177CC0AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
    *((unsigned char *)__b + 2LSMVectorBase::~LSMVectorBase(this + 3) = __len;
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2642A4700, MEMORY[0x263F8C060]);
}

void sub_2177CC1D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  float result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
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
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 2LSMVectorBase::~LSMVectorBase(this + 3) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t LSMModelContextMap::operator[](LSMTreeBase *a1, int a2)
{
  int v11 = a2;
  LSMTreeBase::LowerBound((uint64_t)a1, (uint64_t)&v11, (unsigned __int16 *)&v9);
  LOWORD(v7[0]) = 0;
  if (LSMTreeIterBase::Equal((LSMTreeIterBase *)&v9, (const LSMTreeIterBase *)v7))
  {
    int v3 = v11;
LABEL_4:
    v6[0] = v9;
    v6[1] = v10;
    v7[0] = v3;
    v7[1] = 0;
    LSMTreeBase::Insert(a1, v7, (const LSMTreeIterBase *)v6);
    LSMTreeBase::LowerBound((uint64_t)a1, (uint64_t)&v11, (unsigned __int16 *)v7);
    uint64_t v4 = v8;
    return v4 + 4;
  }
  uint64_t v4 = *((void *)&v10 + 1);
  int v3 = v11;
  if (**((_DWORD **)&v10 + 1) != v11) {
    goto LABEL_4;
  }
  return v4 + 4;
}

void LSMModelGenerator::LSMModelGenerator(LSMModelGenerator *this, const LSMImmutableMapCounter *a2, LSMWordTable *a3)
{
}

void sub_2177CC8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, LSMVectorBase *a9, LSMTreeBase *a10)
{
  LSMVectorBase::~LSMVectorBase(v13);
  LSMTreeBase::~LSMTreeBase(v12);
  LSMTreeBase::~LSMTreeBase(v11);
  LSMTreeBase::~LSMTreeBase(v10);
  _Unwind_Resume(a1);
}

uint64_t LSMModelGenerator::GenerateAll(LSMModelGenerator *this)
{
  (*(void (**)(LSMModelGenerator *))(*(void *)this + 40))(this);
  (*(void (**)(LSMModelGenerator *, void, void))(*(void *)this + 32))(this, 0, *((unsigned __int8 *)this + 212));
  if (*((int *)this + 52) < 1) {
    return (*(uint64_t (**)(LSMModelGenerator *))(*(void *)this + 48))(this);
  }
  do
  {
    LSMTreeBase::Begin((uint64_t)this + 80, (LSMTreeIterBase *)v6);
    v5[0] = 0;
    if (LSMTreeIterBase::Equal((LSMTreeIterBase *)v6, (const LSMTreeIterBase *)v5)) {
      continue;
    }
    while (1)
    {
      uint64_t v2 = v7;
      int v3 = v7[1];
      if ((v3 & 0xA000000) == 0x2000000)
      {
        if (!LSMModelGenerator::Terminal(this, *v7))
        {
          (*(void (**)(LSMModelGenerator *, void, void))(*(void *)this + 32))(this, *v7, 0);
          goto LABEL_13;
        }
        --*((_DWORD *)this + 52);
        uint64_t v2 = v7;
        int v3 = v7[1] | 0x8000000;
        v7[1] = v3;
      }
      if ((v3 & 0x14000000) == 0x4000000) {
        break;
      }
LABEL_9:
      LSMTreeIterBase::operator++((uint64_t)v6);
      if (LSMTreeIterBase::Equal((LSMTreeIterBase *)v6, (const LSMTreeIterBase *)v5)) {
        goto LABEL_13;
      }
    }
    if (LSMModelGenerator::Terminal(this, *v2))
    {
      --*((_DWORD *)this + 52);
      v7[1] |= 0x10000000u;
      goto LABEL_9;
    }
    (*(void (**)(LSMModelGenerator *, void, uint64_t))(*(void *)this + 32))(this, *v7, 1);
LABEL_13:
    ;
  }
  while (*((int *)this + 52) > 0);
  return (*(uint64_t (**)(LSMModelGenerator *))(*(void *)this + 48))(this);
}

BOOL LSMModelGenerator::Terminal(LSMModelGenerator *this, int a2)
{
  v8[0] = 0;
  v8[1] = a2;
  uint64_t v9 = 1;
  LSMTreeBase::LowerBound((uint64_t)this, (uint64_t)v8, v10);
  v5[0] = 0;
  v5[1] = a2 + 1;
  uint64_t v6 = 0;
  LSMTreeBase::LowerBound((uint64_t)this, (uint64_t)v5, v7);
  return LSMTreeIterBase::Equal((LSMTreeIterBase *)v10, (const LSMTreeIterBase *)v7);
}

uint64_t LSMModelGenerator::Generate(LSMModelGenerator *this, uint64_t a2, uint64_t a3)
{
  --*((_DWORD *)this + 52);
  if (a3) {
    int v6 = 0x10000000;
  }
  else {
    int v6 = 0x8000000;
  }
  uint64_t v7 = (LSMModelGenerator *)((char *)this + 80);
  uint64_t v8 = (_DWORD *)LSMModelContextMap::operator[]((LSMModelGenerator *)((char *)this + 80), a2);
  *v8 |= v6;
  v17[0] = 0;
  v17[1] = a2;
  uint64_t v18 = 0;
  LSMTreeBase::LowerBound((uint64_t)this, (uint64_t)v17, v19);
  v15[0] = 0;
  v15[1] = a2 + 1;
  uint64_t v16 = 0;
  LSMTreeBase::LowerBound((uint64_t)this, (uint64_t)v15, (unsigned __int16 *)v17);
  uint64_t v9 = 0;
  float v10 = *(float *)LSMTupleAccumulator::operator[]((LSMModelGenerator *)((char *)this + 144), a2);
  if (!v20[2])
  {
    uint64_t v9 = a3 ^ 1;
    LSMTreeIterBase::operator++((uint64_t)v19);
  }
  (*(void (**)(LSMModelGenerator *, uint64_t, uint64_t, uint64_t))(*(void *)this + 56))(this, a2, v9, a3);
  while (!LSMTreeIterBase::Equal((LSMTreeIterBase *)v19, (const LSMTreeIterBase *)v17))
  {
    int v11 = (float *)LSMTupleAccumulator::operator[]((LSMModelGenerator *)((char *)this + 144), *v20);
    (*(void (**)(LSMModelGenerator *, double))(*(void *)this + 72))(this, (float)(*v11 / v10));
    (*(void (**)(LSMModelGenerator *, void))(*(void *)this + 88))(this, v20[2]);
    if (!LSMModelGenerator::Terminal(this, v20[3]))
    {
      uint64_t v12 = 0;
      uint64_t v13 = v20[3];
      if (!a2 && *((unsigned char *)this + 212)) {
        uint64_t v12 = (*(unsigned __int8 *)(LSMModelContextMap::operator[](v7, v20[3]) + 3) >> 2) & 1;
      }
      (*(void (**)(LSMModelGenerator *, uint64_t, uint64_t))(*(void *)this + 96))(this, v13, v12);
    }
    (*(void (**)(LSMModelGenerator *))(*(void *)this + 80))(this);
    LSMTreeIterBase::operator++((uint64_t)v19);
  }
  return (*(uint64_t (**)(LSMModelGenerator *, uint64_t, uint64_t))(*(void *)this + 64))(this, a2, a3);
}

void *LSMModelGenerator::PushString(LSMModelGenerator *this, char *__s)
{
  int v3 = (LSMModelGenerator *)((char *)this + 216);
  size_t v4 = strlen(__s);
  return LSMVectorBase::Append(v3, __s, v4);
}

void *LSMModelGenerator::PushBlob(LSMModelGenerator *this, void *a2, uint64_t a3)
{
  return LSMVectorBase::Append((LSMModelGenerator *)((char *)this + 216), a2, a3);
}

void *LSMModelGenerator::PushName(LSMWordTable **this, unsigned int a2, int a3)
{
  int v6 = (LSMVectorBase *)(this + 27);
  LSMVectorBase::Append((LSMVectorBase *)(this + 27), "<", 1);
  if (!a2)
  {
    float v10 = "LSMModelTop";
    int v11 = v6;
    uint64_t v12 = 11;
LABEL_10:
    LSMVectorBase::Append(v11, v10, v12);
    return LSMVectorBase::Append(v6, ">", 1);
  }
  if (a2 >> 30 == 1)
  {
    *(void *)uint64_t v16 = 0;
    LSMWordTable::Pair(this[8], a2, &v16[1], v16);
    if (v16[1])
    {
      uint64_t v7 = (const char *)(*(uint64_t (**)(LSMWordTable *))(*(void *)this[8] + 16))(this[8]);
      size_t v8 = strlen(v7);
      LSMVectorBase::Append(v6, v7, v8);
      LSMVectorBase::Append(v6, " ", 1);
    }
    uint64_t v9 = *(uint64_t (**)(void))(*(void *)this[8] + 16);
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(void))(*(void *)this[8] + 16);
  }
  uint64_t v13 = (const char *)v9();
  size_t v14 = strlen(v13);
  LSMVectorBase::Append(v6, v13, v14);
  if (a3)
  {
    float v10 = "!";
    int v11 = v6;
    uint64_t v12 = 1;
    goto LABEL_10;
  }
  return LSMVectorBase::Append(v6, ">", 1);
}

uint64_t LSMModelGenerator::SRProbability(LSMModelGenerator *this, long double a2)
{
  return (int)fmax(log(a2) * 10000.5 * 6.0 * 0.001953125, -32000.0);
}

void LSMModelGenerator::~LSMModelGenerator(void **this)
{
  *this = &unk_26C7C6638;
  LSMVectorBase::~LSMVectorBase(this + 27);
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)(this + 18));
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)(this + 10));
  LSMTreeBase::~LSMTreeBase((LSMTreeBase *)this);
}

{
  uint64_t vars8;

  LSMModelGenerator::~LSMModelGenerator(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177CD0BC(_Unwind_Exception *a1)
{
  LSMTreeBase::~LSMTreeBase(v1);
  _Unwind_Resume(a1);
}

void sub_2177CD140(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C401ADF092ELL);
  _Unwind_Resume(a1);
}

unint64_t LSMModelGenerator::FindInPage(LSMModelGenerator *this, _DWORD *a2, char *a3, unint64_t a4, BOOL *a5)
{
  unsigned int v6 = a2[1];
  unsigned int v5 = a2[2];
  if (a4)
  {
    uint64_t v7 = a3;
    unint64_t v8 = a4;
    do
    {
      unint64_t v9 = v8 >> 1;
      float v10 = &v7[16 * (v8 >> 1)];
      unsigned int v11 = *((_DWORD *)v10 + 1);
      if (v11 < v6 || v11 == v6 && *(_DWORD *)&v7[16 * v9 + 8] < v5)
      {
        uint64_t v7 = v10 + 16;
        unint64_t v9 = v8 + ~v9;
      }
      unint64_t v8 = v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v7 = a3;
  }
  unint64_t result = (v7 - a3) >> 4;
  BOOL v13 = result < a4 && *((_DWORD *)v7 + 1) == v6 && *((_DWORD *)v7 + 2) == v5;
  *a5 = v13;
  return result;
}

CFStringRef LSMTextModelGenerator::TextModel(const char **this, CFAllocatorRef alloc)
{
  return CFStringCreateWithCString(alloc, this[27], 0x8000100u);
}

void *LSMTextModelGenerator::EndModels(LSMTextModelGenerator *this)
{
  unint64_t result = LSMVectorBase::Append((void *)this + 27);
  *(unsigned char *)(*((void *)this + 27) + *((void *)this + 29) - 1) = 0;
  return result;
}

void *LSMTextModelGenerator::StartModel(LSMTextModelGenerator *this, uint64_t a2, int a3, uint64_t a4)
{
  char v4 = a4;
  int v6 = a2;
  uint64_t v12 = *MEMORY[0x263EF8340];
  (*(void (**)(LSMTextModelGenerator *, uint64_t, uint64_t))(*(void *)this + 96))(this, a2, a4);
  if (a3) {
    LSMVectorBase::Append((LSMTextModelGenerator *)((char *)this + 216), " { kSROptional = true }", 23);
  }
  if (v4) {
    int v8 = 1;
  }
  else {
    int v8 = *(_DWORD *)LSMModelContextMap::operator[]((LSMTextModelGenerator *)((char *)this + 80), v6) & 0xFFFFFF;
  }
  sprintf(__s, " = /* References: %u */\n\t", v8);
  size_t v9 = strlen(__s);
  unint64_t result = LSMVectorBase::Append((LSMTextModelGenerator *)((char *)this + 216), __s, v9);
  *((_DWORD *)this + 62) = 0;
  return result;
}

void *LSMTextModelGenerator::EndModel(LSMTextModelGenerator *this)
{
  return LSMVectorBase::Append((LSMTextModelGenerator *)((char *)this + 216), "\t;\n\n", 4);
}

_DWORD *LSMTextModelGenerator::StartPath(_DWORD *this, long double a2)
{
  uint64_t v3 = (uint64_t)this;
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = this[62];
  this[62] = v4 + 1;
  if (v4) {
    this = LSMVectorBase::Append((LSMVectorBase *)(this + 54), "\t|\n\t", 4);
  }
  if (*(unsigned char *)(v3 + 72))
  {
    long double v5 = log(a2);
    sprintf(__s, "/* %5.4f / %d */ ", (double)a2, (int)fmax(v5 * 10000.5 * 6.0 * 0.001953125, -32000.0));
    size_t v6 = strlen(__s);
    return LSMVectorBase::Append((LSMVectorBase *)(v3 + 216), __s, v6);
  }
  return this;
}

void *LSMTextModelGenerator::AddWord(LSMTextModelGenerator *this)
{
  uint64_t v2 = (const char *)(*(uint64_t (**)(void))(**((void **)this + 8) + 16))(*((void *)this + 8));
  uint64_t v3 = (LSMTextModelGenerator *)((char *)this + 216);
  size_t v4 = strlen(v2);
  LSMVectorBase::Append(v3, v2, v4);
  return LSMVectorBase::Append(v3, "\t", 1);
}

CFDataRef LSMSRModelGenerator::SRModel(LSMSRModelGenerator *this, CFAllocatorRef allocator)
{
  return CFDataCreate(allocator, *((const UInt8 **)this + 27), *((void *)this + 29));
}

void *LSMSRModelGenerator::StartModels(LSMSRModelGenerator *this)
{
  unint64_t result = LSMSRModelGenerator::PushWords(this, dword_2177DCD60, 4);
  *((void *)this + 34) = 0;
  *((_WORD *)this + 156) = 0;
  return result;
}

void *LSMSRModelGenerator::PushWords(void *this, unsigned int *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  long double v5 = this;
  size_t v6 = this + 27;
  uint64_t v8 = this[29];
  unint64_t v7 = this[30];
  unint64_t v9 = v8 + 4 * a3;
  if (v7 < v9)
  {
    this = LSMVectorBase::Allocate((const void **)this + 27, v8 + 4 * a3, 1);
    unint64_t v7 = v5[30];
  }
  if (v7 >= v9) {
    unint64_t v7 = v9;
  }
  v5[29] = v7;
  if (v3)
  {
    float v10 = (_DWORD *)(*v6 + v8);
    do
    {
      unsigned int v11 = *a2++;
      *v10++ = bswap32(v11);
      --v3;
    }
    while (v3);
  }
  return this;
}

uint64_t LSMSRModelGenerator::EndModels(uint64_t this)
{
  uint64_t v1 = *(_DWORD **)(this + 216);
  *uint64_t v1 = bswap32(*(_DWORD *)(this + 232));
  v1[3] = bswap32(*(_DWORD *)(this + 272));
  return this;
}

void *LSMSRModelGenerator::StartModel(LSMSRModelGenerator *this, int a2, int a3, char a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(_OWORD *)unint64_t v7 = *(_OWORD *)"boml";
  *(_OWORD *)&v7[12] = unk_2177DCD7C;
  if ((a4 & 1) == 0)
  {
    if (a3) {
      *(_DWORD *)&v7[20] = 18;
    }
    if (*(unsigned char *)(LSMModelContextMap::operator[]((LSMSRModelGenerator *)((char *)this + 80), a2) + 3))
    {
      uint64_t v5 = *((void *)this + 34);
      *(_DWORD *)&v7[12] = 0x20000000;
      *(_DWORD *)&unsigned __int16 v7[16] = v5;
    }
  }
  unint64_t result = LSMSRModelGenerator::PushWords(this, (unsigned int *)v7, 7);
  *((void *)this + 31) = *((void *)this + 29) - 4;
  return result;
}

LSMVectorBase *LSMSRModelGenerator::EndModel(LSMSRModelGenerator *this, unsigned int a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)float v10 = 0;
  uint64_t v6 = *((void *)this + 29);
  LSMSRModelGenerator::PushWords(this, v10, 2);
  LSMModelGenerator::PushName((LSMWordTable **)this, a2, a3);
  unint64_t result = (LSMSRModelGenerator *)((char *)this + 216);
  uint64_t v8 = *((void *)this + 29);
  *(_DWORD *)(*((void *)this + 27) + v6) = bswap32(v8 - v6 - 8);
  if ((v8 & 3) != 0)
  {
    int __src = 0;
    return (LSMVectorBase *)LSMVectorBase::Append(result, &__src, 4 - (v8 & 3));
  }
  return result;
}

void *LSMSRModelGenerator::PadToLong(void *this)
{
  uint64_t v1 = this[29] & 3;
  if (v1)
  {
    int __src = 0;
    return LSMVectorBase::Append((LSMVectorBase *)(this + 27), &__src, 4 - v1);
  }
  return this;
}

void *LSMSRModelGenerator::StartPath(LSMSRModelGenerator *this, long double a2)
{
  if (*((unsigned char *)this + 72)) {
    *((_WORD *)this + 156) = (int)fmax(log(a2) * 10000.5 * 6.0 * 0.001953125, -32000.0);
  }
  unint64_t result = LSMSRModelGenerator::PushWords(this, (unsigned int *)"htap", 7);
  uint64_t v4 = *((void *)this + 31);
  uint64_t v5 = *((void *)this + 27);
  unsigned int v6 = *(_DWORD *)(v5 + v4);
  *((void *)this + 32) = *((void *)this + 29) - 4;
  *((void *)this + 3LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  *(_DWORD *)(v5 + v4) = bswap32(bswap32(v6) + 1);
  return result;
}

void *LSMSRModelGenerator::StartPhrase(LSMSRModelGenerator *this)
{
  unint64_t result = LSMSRModelGenerator::PushWords(this, (unsigned int *)"arhp", 7);
  uint64_t v3 = *((void *)this + 32);
  uint64_t v4 = *((void *)this + 27);
  unsigned int v5 = *(_DWORD *)(v4 + v3);
  *((void *)this + 3LSMVectorBase::~LSMVectorBase(this + 3) = *((void *)this + 29) - 4;
  *(_DWORD *)(v4 + vLSMVectorBase::~LSMVectorBase(this + 3) = bswap32(bswap32(v5) + 1);
  return result;
}

void *LSMSRModelGenerator::AddWord(LSMSRModelGenerator *this, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!*((void *)this + 33))
  {
    LSMSRModelGenerator::PushWords(this, (unsigned int *)"arhp", 7);
    *((void *)this + 3LSMVectorBase::~LSMVectorBase(this + 3) = *((void *)this + 29) - 4;
    *(_DWORD *)(*((void *)this + 27) + *((void *)this + 32)) = bswap32(bswap32(*(_DWORD *)(*((void *)this + 27)+ *((void *)this + 32)))+ 1);
  }
  *(_OWORD *)float v10 = *(_OWORD *)"drow";
  *(_OWORD *)&v10[3] = unk_2177DCDD0;
  if (*((unsigned char *)this + 72))
  {
    v10[3] = *((unsigned __int16 *)this + 156) | 0x10000;
    *((_WORD *)this + 156) = 0;
  }
  LSMSRModelGenerator::PushWords(this, v10, 7);
  uint64_t v4 = (const char *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 8) + 16))(*((void *)this + 8), a2);
  unsigned int v8 = strlen(v4);
  LSMSRModelGenerator::PushWords(this, &v8, 1);
  size_t v5 = strlen(v4);
  unint64_t result = LSMVectorBase::Append((LSMSRModelGenerator *)((char *)this + 216), v4, v5);
  uint64_t v7 = *((void *)this + 29) & 3;
  if (v7)
  {
    int __src = 0;
    unint64_t result = LSMVectorBase::Append((LSMSRModelGenerator *)((char *)this + 216), &__src, 4 - v7);
  }
  *(_DWORD *)(*((void *)this + 27) + *((void *)this + 3(*(void (**)(void))(**((void **)this + 3) + 40))(*((void *)this + 3)) = bswap32(bswap32(*(_DWORD *)(*((void *)this + 27)+ *((void *)this + 33)))+ 1);
  return result;
}

_DWORD *LSMSRModelGenerator::AddReference(LSMSRModelGenerator *this, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t result = (_DWORD *)LSMModelContextMap::operator[]((LSMSRModelGenerator *)((char *)this + 80), a2);
  if (a3) {
    goto LABEL_6;
  }
  uint64_t v7 = result;
  int v8 = *result;
  if ((*result & 0x1000000) != 0)
  {
    if ((v8 & 0x8000000) != 0)
    {
      v15[0] = 1634498418;
      v15[1] = v8 & 0xFFFFFF;
      unint64_t result = LSMSRModelGenerator::PushWords(this, v15, 2);
      if ((*v7 & 0x8000000) == 0) {
        goto LABEL_6;
      }
LABEL_8:
      uint64_t v14 = *((void *)this + 32);
      goto LABEL_9;
    }
    uint64_t v9 = *((void *)this + 34) + 1;
    *((void *)this + 34) = v9;
    int v8 = v8 & 0xFF000000 | v9;
    _DWORD *result = v8;
  }
  if ((v8 & 0x8000000) != 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v10 = *((void *)this + 31);
  LSMVectorBase::Append((void *)this + 35);
  *(void *)(*((void *)this + 35) + 8 * *((void *)this + 37) - 8) = v10;
  uint64_t v11 = *((void *)this + 32);
  LSMVectorBase::Append((void *)this + 35);
  *(void *)(*((void *)this + 35) + 8 * *((void *)this + 37) - 8) = v11;
  unint64_t result = (_DWORD *)(*(uint64_t (**)(LSMSRModelGenerator *, uint64_t, uint64_t))(*(void *)this + 32))(this, a2, a3);
  uint64_t v12 = *((void *)this + 35);
  uint64_t v13 = *((void *)this + 37);
  uint64_t v14 = *(void *)(v12 + 8 * v13 - 8);
  *((void *)this + 32) = v14;
  *((void *)this + 3LSMVectorBase::~LSMVectorBase(this + 7) = v13 - 1;
  *((void *)this + 31) = *(void *)(v12 + 8 * (v13 - 1) - 8);
  *((void *)this + 3LSMVectorBase::~LSMVectorBase(this + 7) = v13 - 2;
LABEL_9:
  *((void *)this + 3LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  *(_DWORD *)(*((void *)this + 27) + v14) = bswap32(bswap32(*(_DWORD *)(*((void *)this + 27) + v14)) + 1);
  return result;
}

void LSMTextModelGenerator::~LSMTextModelGenerator(void **this)
{
  LSMModelGenerator::~LSMModelGenerator(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177CDBD8(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C40D5D0B459);
  _Unwind_Resume(a1);
}

void sub_2177CDC6C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C408AABC5D4);
  _Unwind_Resume(a1);
}

void LSMModelContextMap::~LSMModelContextMap(LSMModelContextMap *this)
{
  LSMTreeBase::~LSMTreeBase(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177CDCEC(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C40FD820D8ELL);
  _Unwind_Resume(a1);
}

void LSMTupleAccumulator::~LSMTupleAccumulator(LSMTupleAccumulator *this)
{
  LSMTreeBase::~LSMTreeBase(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177CDD58(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10A1C40FD820D8ELL);
  _Unwind_Resume(a1);
}

void LSMVectorBase::LSMVectorBase(LSMVectorBase *this, __int16 a2)
{
  *(void *)this = 0;
  *((_WORD *)this + 4) = a2;
  *((unsigned char *)this + 10) = 1;
  *((void *)this + 2) = 0;
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = 0;
}

void LSMVectorBase::LSMVectorBase(LSMVectorBase *this, __int16 a2, unint64_t a3)
{
  *(void *)this = 0;
  *((_WORD *)this + 4) = a2;
  *((unsigned char *)this + 10) = 1;
  *((void *)this + 2) = 0;
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  if (a3)
  {
    LSMVectorBase::Allocate((const void **)this, a3, 1);
    unint64_t v5 = *((void *)this + 3);
  }
  else
  {
    unint64_t v5 = 0;
  }
  if (v5 >= a3) {
    unint64_t v5 = a3;
  }
  *((void *)this + 2) = v5;
}

void LSMVectorBase::LSMVectorBase(LSMVectorBase *this, const LSMVectorBase *a2)
{
  *(void *)this = 0;
  *((_WORD *)this + 4) = *((_WORD *)a2 + 4);
  *((unsigned char *)this + 10) = 1;
  unint64_t v4 = *((void *)a2 + 2);
  *((void *)this + 2) = v4;
  LSMVectorBase::Allocate((const void **)this, v4, 1);
  memcpy(*(void **)this, *(const void **)a2, *((void *)this + 2) * *((unsigned __int16 *)this + 4));
}

void *LSMVectorBase::Allocate(const void **this, unint64_t a2, char a3)
{
  unint64_t v3 = a2;
  if ((a3 & 1) == 0)
  {
    if (a2 >= 8) {
      unint64_t v3 = (3 * a2) >> 1;
    }
    else {
      unint64_t v3 = 8;
    }
  }
  unint64_t v5 = *((unsigned __int16 *)this + 4);
  if (v3 > 0x7FFFFFFFFFFFFFFFLL / v5) {
    goto LABEL_12;
  }
  if (!*((unsigned char *)this + 10))
  {
    int v8 = malloc_type_malloc(v3 * v5, 0x656C252EuLL);
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t result = memcpy(v8, *this, (void)this[3] * *((unsigned __int16 *)this + 4));
      *this = v9;
      *((unsigned char *)this + 10) = 1;
      uint64_t v7 = (unint64_t *)(this + 3);
      goto LABEL_11;
    }
LABEL_12:
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v11 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v11, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  unint64_t result = malloc_type_realloc((void *)*this, v3 * v5, 0x544B9CEDuLL);
  if (!result) {
    goto LABEL_12;
  }
  *this = result;
  uint64_t v7 = (unint64_t *)(this + 3);
LABEL_11:
  unint64_t *v7 = v3;
  return result;
}

void LSMVectorBase::Map(void **this, void *a2, void *a3)
{
  if (*((unsigned char *)this + 10)) {
    free(*this);
  }
  *this = a2;
  *((unsigned char *)this + 10) = 0;
  this[2] = a3;
  this[3] = a3;
}

void LSMVectorBase::~LSMVectorBase(void **this)
{
  if (*((unsigned char *)this + 10)) {
    free(*this);
  }
}

void *LSMVectorBase::Append(LSMVectorBase *this, const void *__src, uint64_t a3)
{
  uint64_t v6 = *((void *)this + 2);
  if ((unint64_t)(v6 + a3) > *((void *)this + 3))
  {
    LSMVectorBase::Allocate((const void **)this, v6 + a3, 0);
    uint64_t v6 = *((void *)this + 2);
  }
  unint64_t result = memcpy((void *)(*(void *)this + v6 * *((unsigned __int16 *)this + 4)), __src, *((unsigned __int16 *)this + 4) * a3);
  *((void *)this + 2) += a3;
  return result;
}

uint64_t *LSMVectorBase::Swap(uint64_t *this, LSMVectorBase *a2)
{
  char v2 = *((unsigned char *)this + 10);
  *((unsigned char *)this + 10) = *((unsigned char *)a2 + 10);
  *((unsigned char *)a2 + 10) = v2;
  uint64_t v3 = *this;
  *this = *(void *)a2;
  *(void *)a2 = v3;
  uint64_t v4 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  uint64_t v5 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + LSMVectorBase::~LSMVectorBase(this + 3) = v5;
  return this;
}

void LSMVectorBase::clear(void **this)
{
  *this = 0;
  this[2] = 0;
  this[3] = 0;
}

uint64_t LSMVectorBase::advise(uint64_t this, int a2)
{
  if (!*(unsigned char *)(this + 10))
  {
    unint64_t v2 = *(void *)(this + 16) * *(unsigned __int16 *)(this + 8);
    if (v2)
    {
      uint64_t v4 = *(char **)this;
      do
      {
        if (v2 >= 0x4000) {
          size_t v5 = 0x4000;
        }
        else {
          size_t v5 = v2;
        }
        this = madvise(v4, v5, a2);
        v4 += v5;
        v2 -= v5;
      }
      while (v2);
    }
  }
  return this;
}

uint64_t LSMTreePage::LSMTreePage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = &unk_26C7C68B0;
  *(_WORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 10) = *(_WORD *)(a3 + 18);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = malloc_type_malloc(0x200uLL, 0x5E26179AuLL);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(v4 + 32) + *(unsigned __int16 *)(a1 + 10);
  ++*(void *)(v4 + 24);
  *(void *)(v4 + 32) = v5;
  return a1;
}

void LSMTreePage::~LSMTreePage(void **this)
{
  *this = &unk_26C7C68B0;
  free(this[4]);
}

{
  *this = &unk_26C7C68B0;
  free(this[4]);
}

{
  uint64_t vars8;

  *this = &unk_26C7C68B0;
  free(this[4]);
  JUMPOUT(0x21D44C230);
}

BOOL LSMTreePage::LowerBound(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v10 = 0;
  uint64_t v7 = (*(uint64_t (**)(void, uint64_t, void, void, char *))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a3, *(void *)(a1 + 32), *(unsigned __int16 *)(a1 + 8), &v10);
  uint64_t v8 = *(unsigned __int16 *)(a1 + 8);
  if (v7 != v8)
  {
    *(_WORD *)a4 = a2;
    *(_WORD *)(a4 + 2 * a2) = v7;
    *(void *)(a4 + 16) = a1;
  }
  return v7 != v8;
}

BOOL LSMTreePage::Insert(uint64_t a1, int a2, void *__src, unsigned __int16 *a4)
{
  uint64_t v6 = &a4[a2];
  unsigned int v7 = *(unsigned __int16 *)(a1 + 8);
  if (*a4 < a2) {
    uint64_t v6 = (unsigned __int16 *)(a1 + 8);
  }
  unsigned int v8 = *v6;
  uint64_t v9 = *(void *)(a1 + 24);
  size_t v10 = *(unsigned __int16 *)(v9 + 16);
  uint64_t v11 = (char *)(*(void *)(a1 + 32) + v10 * v8);
  if (v8 < v7) {
    memmove(&v11[v10], (const void *)(*(void *)(a1 + 32) + *(unsigned __int16 *)(v9 + 16) * (unint64_t)v8), (int)(v7 - v8) * (unint64_t)*(unsigned __int16 *)(v9 + 16));
  }
  memcpy(v11, __src, v10);
  unsigned __int16 v12 = *(_WORD *)(a1 + 8) + 1;
  *(_WORD *)(a1 + 8) = v12;
  return *(unsigned __int16 *)(a1 + 10) == v12;
}

uint64_t LSMTreePage::Rebalance(LSMTreePage *this)
{
  uint64_t result = (*(uint64_t (**)(LSMTreePage *))(*(void *)this + 32))(this);
  ++*(void *)(*((void *)this + 3) + 40);
  return result;
}

void *LSMTreePage::DoRebalance(LSMTreePage *this, uint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  uint64_t v9 = *(void *)(*(void *)(*((void *)this + 2) + 40) + 8 * a2 + 8);
  size_t v10 = *(unsigned __int16 *)(*((void *)this + 3) + 16);
  uint64_t v11 = (void *)(*(void *)(*((void *)this + 2) + 32) + v10 * a2);
  unint64_t v12 = *((unsigned __int16 *)this + 4);
  if (v12 >= a3)
  {
    uint64_t v16 = a4 - *(unsigned __int16 *)(v9 + 8);
    size_t v17 = v16 * v10;
    memmove((void *)(*(void *)(v9 + 32) + v16 * v10), *(const void **)(v9 + 32), *(unsigned __int16 *)(v9 + 8) * (unint64_t)v10);
    if (a5)
    {
      size_t v17 = (v16 - 1) * v10;
      memcpy((void *)(*(void *)(v9 + 32) + v17), v11, v10);
    }
    memcpy(*(void **)(v9 + 32), (const void *)(*((void *)this + 4) + v10 + v10 * a3), v17);
    uint64_t result = memcpy(v11, (const void *)(*((void *)this + 4) + v10 * a3), v10);
  }
  else
  {
    if (a5)
    {
      uint64_t v13 = *((void *)this + 4);
      *((_WORD *)this + 4) = v12 + 1;
      memcpy((void *)(v13 + v12 * (unint64_t)v10), v11, v10);
      unint64_t v12 = *((unsigned __int16 *)this + 4);
    }
    size_t v14 = (a3 - v12) * v10;
    memcpy((void *)(*((void *)this + 4) + v12 * (unint64_t)v10), *(const void **)(v9 + 32), v14);
    memcpy(v11, (const void *)(*(void *)(v9 + 32) + v14), v10);
    uint64_t result = memmove(*(void **)(v9 + 32), (const void *)(*(void *)(v9 + 32) + v10 + v14), v10 * a4);
  }
  *((_WORD *)this + 4) = a3;
  *(_WORD *)(v9 + 8) = a4;
  return result;
}

void LSMTreePage::Split(LSMTreePage *this)
{
}

void sub_2177CE628(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10B1C4009E930FDLL);
  _Unwind_Resume(a1);
}

uint64_t LSMTreePage::Begin(uint64_t result, int a2, uint64_t a3)
{
  *(_WORD *)a3 = a2;
  *(_WORD *)(a3 + 2 * a2) = 0;
  *(void *)(a3 + 16) = result;
  return result;
}

uint64_t LSMTreePage::Next(uint64_t result, int a2, uint64_t a3)
{
  unsigned __int16 v3 = *(_WORD *)(a3 + 2 * a2) + 1;
  *(_WORD *)(a3 + 2 * a2) = v3;
  if (*(unsigned __int16 *)(result + 8) <= v3)
  {
    uint64_t v4 = a2 - 1;
    while (v4)
    {
      unsigned int v5 = *(unsigned __int16 *)(a3 + 2 * v4);
      uint64_t result = *(void *)(result + 16);
      --v4;
      LOWORD(a2) = a2 - 1;
      if (v5 < *(unsigned __int16 *)(result + 8)) {
        goto LABEL_7;
      }
    }
    LOWORD(a2) = 0;
  }
LABEL_7:
  *(_WORD *)a3 = a2;
  *(void *)(a3 + 16) = result;
  return result;
}

uint64_t LSMTreePage::SanityCheck(uint64_t a1, int a2, int a3, uint64_t a4)
{
  unsigned int v5 = *(unsigned __int16 *)(a1 + 8);
  if (a4 && !*(_WORD *)(a1 + 8) || *(unsigned __int16 *)(a1 + 10) <= v5 || *(void *)(a1 + 16) != a4) {
    abort();
  }
  if (a3)
  {
    printf("%.*s%08X %3u %08X %08X\n", a2, "               ", *(_DWORD *)a1, v5, **(_DWORD **)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32)+ (int)(v5 - 1) * (unint64_t)*(unsigned __int16 *)(*(void *)(a1 + 24) + 16)));
    return *(unsigned __int16 *)(a1 + 8);
  }
  return v5;
}

uint64_t LSMTreePage::SetTree(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t LSMTreeBranch::SetupBranches(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 24);
  uint64_t v2 = *(void *)(this + 32);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 20);
  *(_WORD *)(this + 10) = v3;
  *(void *)(this + 40) = v2 + 8 * ~v3 + 512;
  *(void *)(v1 + 32) = *(void *)(v1 + 32) + v3 - *(unsigned __int16 *)(v1 + 18);
  return this;
}

uint64_t LSMTreeBranch::LSMTreeBranch(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = LSMTreePage::LSMTreePage(a1, a2, a3);
  *(void *)uint64_t result = &unk_26C7C6910;
  uint64_t v4 = *(void *)(result + 24);
  uint64_t v5 = *(void *)(result + 32);
  uint64_t v6 = *(unsigned __int16 *)(v4 + 20);
  *(_WORD *)(result + 10) = v6;
  *(void *)(result + 40) = v5 + 8 * ~v6 + 512;
  *(void *)(v4 + 32) = *(void *)(v4 + 32) + v6 - *(unsigned __int16 *)(v4 + 18);
  return result;
}

uint64_t LSMTreeBranch::LSMTreeBranch(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = LSMTreePage::LSMTreePage(a1, a2, a4);
  *(void *)uint64_t v6 = &unk_26C7C6910;
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(v6 + 32);
  uint64_t v9 = *(unsigned __int16 *)(v7 + 20);
  *(_WORD *)(v6 + 10) = v9;
  uint64_t v10 = v8 + 8 * ~v9;
  *(void *)(v6 + 40) = v10 + 512;
  *(void *)(v7 + 32) = *(void *)(v7 + 32) + v9 - *(unsigned __int16 *)(v7 + 18);
  *(void *)(v10 + 512) = a3;
  a3[2] = v6;
  (*(void (**)(void *, void))(*a3 + 40))(a3, 0);
  *(_WORD *)(a1 + 8) = 1;
  return a1;
}

void sub_2177CE8A0(_Unwind_Exception *a1)
{
  *(void *)uint64_t v1 = &unk_26C7C68B0;
  free(*(void **)(v1 + 32));
  _Unwind_Resume(a1);
}

void LSMTreeBranch::~LSMTreeBranch(LSMTreeBranch *this)
{
  unint64_t v2 = 0;
  *(void *)this = &unk_26C7C6910;
  do
  {
    uint64_t v3 = *(void *)(*((void *)this + 5) + 8 * v2);
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
  }
  while (v2++ < *((unsigned __int16 *)this + 4));
  *(void *)this = &unk_26C7C68B0;
  free(*((void **)this + 4));
}

{
  uint64_t vars8;

  LSMTreeBranch::~LSMTreeBranch(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177CE980(_Unwind_Exception *a1)
{
  *(void *)uint64_t v1 = &unk_26C7C68B0;
  free(*(void **)(v1 + 32));
  _Unwind_Resume(a1);
}

void sub_2177CE9FC(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10B1C40ADA3C39ALL);
  _Unwind_Resume(a1);
}

uint64_t LSMTreeBranch::LowerBound(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v12 = 0;
  uint64_t v8 = (*(uint64_t (**)(void, uint64_t, void, void, char *))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a3, *(void *)(a1 + 32), *(unsigned __int16 *)(a1 + 8), &v12);
  uint64_t v9 = v8;
  *(_WORD *)(a4 + 2 * a2) = v8;
  if (!v12)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8 * v8);
    if ((*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)v11 + 16))(v11, (a2 + 1), a3, a4))return 1; {
    if (v9 == *(unsigned __int16 *)(a1 + 8))
    }
      return 0;
  }
  *(_WORD *)a4 = a2;
  *(void *)(a4 + 16) = a1;
  return 1;
}

uint64_t LSMTreeBranch::Insert(uint64_t a1, int a2, uint64_t a3, unsigned __int16 *a4)
{
  if (*a4 >= a2) {
    uint64_t v5 = &a4[a2];
  }
  else {
    uint64_t v5 = (unsigned __int16 *)(a1 + 8);
  }
  uint64_t v6 = *v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8 * v6);
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)v7 + 24))(v7, (a2 + 1));
  if (result)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int16 **)(v10 + 8 * v6);
    unint64_t v12 = (7 * (unint64_t)v11[5]) >> 3;
    unsigned int v13 = *(unsigned __int16 *)(a1 + 8);
    BOOL v14 = v6 < v13;
    if (v6) {
      BOOL v15 = v6 >= v13;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (!v6) {
        goto LABEL_16;
      }
      uint64_t v16 = *(unsigned __int16 **)(v10 + 8 * (v6 - 1));
      unsigned int v17 = v16[4];
    }
    else
    {
      uint64_t v16 = *(unsigned __int16 **)(v10 + 8 * (v6 - 1));
      unsigned int v17 = v16[4];
      if (v17 >= *(unsigned __int16 *)(*(void *)(v10 + 8 * v6 + 8) + 8)) {
        goto LABEL_17;
      }
      BOOL v14 = 0;
    }
    if (v12 > v17)
    {
      uint64_t v11 = v16;
LABEL_18:
      LSMTreePage::Rebalance((LSMTreePage *)v11);
      return 0;
    }
LABEL_16:
    if (!v14)
    {
      unsigned int v18 = v6 + 1;
LABEL_20:
      unsigned int v9 = *(unsigned __int16 *)(*(void *)(a1 + 24) + 16);
      memmove((void *)(*(void *)(a1 + 32) + v18 * (unint64_t)v9), (const void *)(*(void *)(a1 + 32) + v9 * (unint64_t)v6), (int)(v13 - v6) * (uint64_t)(int)v9);
      memmove((void *)(*(void *)(a1 + 40) + 8 * v6 + 16), (const void *)(*(void *)(a1 + 40) + 8 * v6 + 8), 8 * (*(unsigned __int16 *)(a1 + 8) - v6));
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8 * v6);
      (*(void (**)(uint64_t, uint64_t))(*(void *)v19 + 40))(v19, v6);
      unsigned __int16 v20 = *(_WORD *)(a1 + 8) + 1;
      *(_WORD *)(a1 + 8) = v20;
      return *(unsigned __int16 *)(a1 + 10) == v20;
    }
LABEL_17:
    unsigned int v18 = v6 + 1;
    if (v12 > *(unsigned __int16 *)(*(void *)(v10 + 8 * (v6 + 1)) + 8)) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  return result;
}

void *LSMTreeBranch::DoRebalance(LSMTreeBranch *this, uint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10 = *(void *)(*(void *)(*((void *)this + 2) + 40) + 8 * a2 + 8);
  unint64_t v11 = *((unsigned __int16 *)this + 4);
  uint64_t v12 = a3 - v11;
  if (a3 <= v11)
  {
    uint64_t v17 = *(unsigned __int16 *)(v10 + 8);
    if (*(_WORD *)(v10 + 8)) {
      uint64_t v18 = a4 - v17;
    }
    else {
      uint64_t v18 = a4 - v17 + 1;
    }
    if (*(_WORD *)(v10 + 8)) {
      memmove((void *)(*(void *)(v10 + 40) + 8 * v18), *(const void **)(v10 + 40), 8 * v17 + 8);
    }
    memcpy(*(void **)(v10 + 40), (const void *)(*((void *)this + 5) + 8 * a3 + 8), 8 * v18);
    if (v18)
    {
      uint64_t v19 = *(uint64_t **)(v10 + 40);
      do
      {
        uint64_t v20 = *v19++;
        *(void *)(v20 + 16) = v10;
        --v18;
      }
      while (v18);
    }
  }
  else
  {
    memcpy((void *)(*((void *)this + 5) + 8 * v11 + 8), *(const void **)(v10 + 40), 8 * v12);
    memmove(*(void **)(v10 + 40), (const void *)(*(void *)(v10 + 40) + 8 * v12), 8 * a4 + 8);
    uint64_t v13 = *((unsigned __int16 *)this + 4);
    if (v13 + 1 < a3 + 1)
    {
      uint64_t v14 = a3 - v13;
      BOOL v15 = (uint64_t *)(*((void *)this + 5) + 8 * v13 + 8);
      do
      {
        uint64_t v16 = *v15++;
        *(void *)(v16 + 16) = this;
        --v14;
      }
      while (v14);
    }
  }
  return LSMTreePage::DoRebalance(this, a2, a3, a4, a5);
}

void LSMTreeBranch::Split(LSMTreeBranch *this)
{
}

void sub_2177CEEB4(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10B1C40ADA3C39ALL);
  _Unwind_Resume(a1);
}

uint64_t LSMTreeBranch::Begin(uint64_t a1, int a2, uint64_t a3)
{
  *(_WORD *)(a3 + 2 * a2) = 0;
  return (*(uint64_t (**)(void, void))(***(void ***)(a1 + 40) + 48))(**(void **)(a1 + 40), (a2 + 1));
}

uint64_t LSMTreeBranch::Next(uint64_t a1, int a2, uint64_t a3)
{
  unsigned __int16 v3 = *(_WORD *)(a3 + 2 * a2) + 1;
  *(_WORD *)(a3 + 2 * a2) = v3;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8 * v3);
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 48))(v4, (a2 + 1));
}

uint64_t LSMTreeBranch::SanityCheck(LSMTreeBranch *this, int a2, uint64_t a3, LSMTreeBranch *a4)
{
  uint64_t v7 = LSMTreePage::SanityCheck((uint64_t)this, a2, a3, (uint64_t)a4);
  unint64_t v8 = 0;
  uint64_t v9 = (a2 + 1);
  do
  {
    uint64_t v10 = *(void *)(*((void *)this + 5) + 8 * v8);
    v7 += (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, LSMTreeBranch *))(*(void *)v10 + 64))(v10, v9, a3, this);
  }
  while (v8++ < *((unsigned __int16 *)this + 4));
  return v7;
}

uint64_t LSMTreeBranch::SetTree(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0;
  *(void *)(a1 + 24) = a2;
  do
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8 * v4);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 72))(v5, a2);
  }
  while (v4++ < *(unsigned __int16 *)(a1 + 8));
  return result;
}

void LSMTreeBase::LSMTreeBase(LSMTreeBase *this, unsigned __int16 a2)
{
  *(void *)this = &unk_26C7C6970;
  *((void *)this + 1) = 0;
  *((_WORD *)this + 8) = a2;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  *((_WORD *)this + 9) = 0x200u / a2;
  *((_WORD *)this + 10) = 0x1F8 / (a2 + 8);
  operator new();
}

void sub_2177CF0F8(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10B1C4009E930FDLL);
  _Unwind_Resume(a1);
}

void LSMTreeBase::clear(LSMTreeBase *this)
{
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *((void *)this + 1) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = 0;
  operator new();
}

void sub_2177CF1A0(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10B1C4009E930FDLL);
  _Unwind_Resume(a1);
}

void LSMTreeBase::~LSMTreeBase(LSMTreeBase *this)
{
  *(void *)this = &unk_26C7C6970;
  uint64_t v1 = *((void *)this + 6);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
}

uint64_t LSMTreeBase::LowerBound(uint64_t a1, uint64_t a2, unsigned __int16 *a3)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, unsigned __int16 *))(**(void **)(a1 + 48) + 16))(*(void *)(a1 + 48), 1, a2, a3);
  if (result)
  {
    unint64_t v5 = *a3;
    if (*a3) {
      unint64_t v5 = *(void *)(*((void *)a3 + 2) + 32)
    }
         + *(unsigned __int16 *)(*(void *)(*((void *)a3 + 2) + 24) + 16)
         * (unint64_t)a3[(v5 - 1) + 1];
  }
  else
  {
    unint64_t v5 = 0;
    *a3 = 0;
  }
  *((void *)a3 + LSMVectorBase::~LSMVectorBase(this + 3) = v5;
  return result;
}

unsigned __int16 *LSMTreeIterBase::Deref(unsigned __int16 *this)
{
  unint64_t v1 = *this;
  if (*this) {
    unint64_t v1 = *(void *)(*((void *)this + 2) + 32)
  }
       + *(unsigned __int16 *)(*(void *)(*((void *)this + 2) + 24) + 16)
       * (unint64_t)this[(v1 - 1) + 1];
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = v1;
  return this;
}

uint64_t LSMTreeBase::Insert(LSMTreeBase *this, const void *a2, const LSMTreeIterBase *a3)
{
  ++*((void *)this + 1);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, const void *, const LSMTreeIterBase *))(**((void **)this + 6)
                                                                                             + 24))(*((void *)this + 6), 1, a2, a3);
  if (result) {
    operator new();
  }
  return result;
}

void sub_2177CF384(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10B1C40ADA3C39ALL);
  _Unwind_Resume(a1);
}

uint64_t LSMTreeBase::Begin(uint64_t this, LSMTreeIterBase *a2)
{
  if (*(void *)(this + 8))
  {
    this = (*(uint64_t (**)(void, uint64_t, LSMTreeIterBase *))(**(void **)(this + 48) + 48))(*(void *)(this + 48), 1, a2);
    unint64_t v3 = *(unsigned __int16 *)a2;
    if (*(_WORD *)a2) {
      unint64_t v3 = *(void *)(*((void *)a2 + 2) + 32)
    }
         + *(unsigned __int16 *)(*(void *)(*((void *)a2 + 2) + 24) + 16)
         * (unint64_t)*((unsigned __int16 *)a2 + (v3 - 1) + 1);
    *((void *)a2 + LSMVectorBase::~LSMVectorBase(this + 3) = v3;
  }
  else
  {
    *(_WORD *)a2 = 0;
  }
  return this;
}

uint64_t LSMTreeBase::Swap(LSMTreeBase *this, LSMTreeBase *a2)
{
  uint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  uint64_t v4 = *((void *)this + 3);
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = *((void *)a2 + 3);
  *((void *)a2 + LSMVectorBase::~LSMVectorBase(this + 3) = v4;
  uint64_t v5 = *((void *)this + 4);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v5;
  uint64_t v6 = *((void *)this + 5);
  uint64_t v7 = *((void *)this + 6);
  uint64_t v8 = *((void *)a2 + 6);
  *((void *)this + 5) = *((void *)a2 + 5);
  *((void *)this + 6) = v8;
  *((void *)a2 + 5) = v6;
  *((void *)a2 + 6) = v7;
  (*(void (**)(void, LSMTreeBase *))(**((void **)this + 6) + 72))(*((void *)this + 6), this);
  uint64_t v9 = *(uint64_t (**)(void))(**((void **)a2 + 6) + 72);
  return v9();
}

uint64_t LSMTreeBase::Dump(LSMTreeBase *this)
{
  printf("%lu Elements %lu Pages (%4.1f%%) %lu Rebalances\n", *((void *)this + 1), *((void *)this + 3), (double)*((unint64_t *)this + 1) * 100.0 / (double)*((unint64_t *)this + 4), *((void *)this + 5));
  uint64_t v2 = *((void *)this + 1);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, void))(**((void **)this + 6) + 64))(*((void *)this + 6), 1, 1, 0);
  if (v2 != result) {
    abort();
  }
  return result;
}

uint64_t LSMTreeIterBase::operator++(uint64_t result)
{
  if (*(_WORD *)result)
  {
    uint64_t v1 = (unsigned __int16 *)result;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(result + 16) + 56))(*(void *)(result + 16));
    unint64_t v2 = *v1;
    if (*v1) {
      unint64_t v2 = *(void *)(*((void *)v1 + 2) + 32)
    }
         + *(unsigned __int16 *)(*(void *)(*((void *)v1 + 2) + 24) + 16)
         * (unint64_t)v1[(v2 - 1) + 1];
    *((void *)v1 + LSMVectorBase::~LSMVectorBase(this + 3) = v2;
  }
  return result;
}

BOOL LSMTreeIterBase::Equal(LSMTreeIterBase *this, const LSMTreeIterBase *a2)
{
  unint64_t v2 = *(unsigned __int16 *)this;
  if (v2 != *(unsigned __int16 *)a2) {
    return 0;
  }
  if (!*(_WORD *)this) {
    return 1;
  }
  if (*((void *)this + 2) != *((void *)a2 + 2) || *((unsigned __int16 *)this + 1) != *((unsigned __int16 *)a2 + 1)) {
    return 0;
  }
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = v3;
    if (v2 - 1 == v3) {
      break;
    }
    int v5 = *((unsigned __int16 *)this + v3 + 2);
    int v6 = *((unsigned __int16 *)a2 + v3++ + 2);
  }
  while (v5 == v6);
  return v4 + 1 >= v2;
}

void LSMSVD::ProcessMap(LSMSVD *this, const LSMImmutableMapCounter *a2)
{
  unint64_t v6 = *((unsigned int *)this + 2);
  unint64_t v5 = *((unsigned int *)this + 3);
  uint64_t v7 = (void *)((char *)this + 216);
  unint64_t v8 = *((void *)this + 30);
  if (v8 < v6)
  {
    LSMVectorBase::Allocate((const void **)this + 27, v6, 1);
    unint64_t v8 = *((void *)this + 30);
  }
  if (v8 >= v6) {
    unint64_t v8 = v6;
  }
  *((void *)this + 29) = v8;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v44, 8, v5);
  uint64_t v9 = v44[0];
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v41, 8);
  unsigned int v43 = v9;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v40, 8, v5);
  (*(void (**)(LSMSVD *))(*(void *)this + 32))(this);
  if (v5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v13 = *(void *)(*((void *)a2 + 11) + v10 + 16);
      (*(void (**)(LSMSVD *, uint64_t, uint64_t))(*(void *)this + 40))(this, i, v13);
      if (v13)
      {
        *((void *)v44[0] + i) = *(void *)(*((void *)a2 + 11) + v10);
        LSMVectorBase::Append(v41);
        uint64_t v14 = v41[0];
        *((void *)v41[0] + v42 - 1) = i;
        v38[0] = v43;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((uint64_t)v14, (uint64_t)v14 + 8 * v42, (uint64_t *)v38, v42);
      }
      *((void *)v40[0] + i) = *(unsigned int *)(*((void *)a2 + 15) + v11)
                              + (unint64_t)*(unsigned int *)(*((void *)a2 + 15) + v11 + 4)
                              + *(unsigned int *)(*((void *)a2 + 15) + v11 + 8);
      v11 += 12;
      v10 += 64;
    }
  }
  (*(void (**)(LSMSVD *))(*(void *)this + 48))(this);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v38, 8);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v37, 4);
  long double v15 = log((double)v5);
  uint64_t v16 = 0;
  double v17 = 1.0 / v15;
  while (1)
  {
    double v18 = 0.0;
    while (1)
    {
      uint64_t v19 = *(void *)v41[0];
      uint64_t v20 = v44[0];
      unint64_t v21 = (_DWORD *)*((void *)v44[0] + *(void *)v41[0]);
      if (v16 != *v21) {
        break;
      }
      LODWORD(v2) = *(_DWORD *)((char *)v21
                              + *(void *)(*((void *)a2 + 11) + (v19 << 6) + 32)
                              - *(void *)(*((void *)a2 + 11) + (v19 << 6)));
      LSMVectorBase::Append(v37);
      *((_DWORD *)v37[0] + (uint64_t)v37[2] - 1) = v19;
      LSMVectorBase::Append(v38);
      double v2 = (double)*(unint64_t *)&v2;
      *((double *)v38[0] + v39 - 1) = v2;
      unint64_t v22 = v41[0];
      uint64_t v23 = v42;
      CFIndex v45 = v43;
      if (v42 >= 2)
      {
        uint64_t v24 = *(void *)v41[0];
        unint64_t v25 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((void *)v41[0], (uint64_t *)&v45, v42 & 0x1FFFFFFFFFFFFFFFLL);
        uint64_t v26 = &v22[8 * v23 - 8];
        if (v25 == v26)
        {
          *unint64_t v25 = v24;
        }
        else
        {
          *unint64_t v25 = *v26;
          *uint64_t v26 = v24;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((uint64_t)v22, (uint64_t)(v25 + 1), (uint64_t *)&v45, ((char *)(v25 + 1) - v22) >> 3);
        }
      }
      double v18 = v18 + v2;
      uint64_t v27 = --v42;
      uint64_t v28 = v20[v19] + 4;
      v20[v19] = v28;
      if (v28 == *(void *)(*((void *)a2 + 11) + (v19 << 6))
                + 4 * *(void *)(*((void *)a2 + 11) + (v19 << 6) + 16))
      {
        if (!v27) {
          break;
        }
      }
      else
      {
        LSMVectorBase::Append(v41);
        char v29 = v41[0];
        *((void *)v41[0] + v42 - 1) = v19;
        CFIndex v45 = v43;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((uint64_t)v29, (uint64_t)v29 + 8 * v42, (uint64_t *)&v45, v42);
      }
    }
    uint64_t v30 = v39;
    if (v39 < 1)
    {
      double v2 = 0.0;
    }
    else
    {
      int v31 = (double *)v38[0];
      uint64_t v32 = (double *)((char *)v38[0] + 8 * v39);
      double v2 = 0.0;
      do
      {
        double v33 = *v31++;
        double v2 = v2 + 1.0 / v18 * v33 * log(1.0 / v18 * v33);
      }
      while (v31 < v32);
    }
    double v34 = v2 * v17 + 1.0;
    float v35 = v34;
    *(float *)(*v7 + 4 * v16) = v35;
    if (v30)
    {
      unint64_t v36 = 0;
      do
      {
        (*(void (**)(LSMSVD *, uint64_t, double))(*(void *)this + 56))(this, v16, v34 * (*((double *)v38[0] + v36) / (double)*((unint64_t *)v40[0] + *((unsigned int *)v37[0] + v36))));
        ++v36;
      }
      while (v36 < v39);
    }
    LSMVectorBase::clear(v38);
    LSMVectorBase::clear(v37);
    if (!v42) {
      break;
    }
    uint64_t v16 = *(unsigned int *)v20[v19];
  }
  LSMVectorBase::~LSMVectorBase(v37);
  LSMVectorBase::~LSMVectorBase(v38);
  LSMVectorBase::~LSMVectorBase(v40);
  LSMVectorBase::~LSMVectorBase(v41);
  LSMVectorBase::~LSMVectorBase(v44);
}

void sub_2177CFAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
}

void LSMSVD::ProcessMapLegacy(LSMSVD *this, const LSMImmutableMapCounter *a2)
{
  unint64_t v7 = *((unsigned int *)this + 2);
  unint64_t v6 = *((unsigned int *)this + 3);
  unint64_t v8 = (void *)((char *)this + 216);
  unint64_t v9 = *((void *)this + 30);
  if (v9 < v7)
  {
    LSMVectorBase::Allocate((const void **)this + 27, v7, 1);
    unint64_t v9 = *((void *)this + 30);
  }
  if (v9 >= v7) {
    unint64_t v9 = v7;
  }
  *((void *)this + 29) = v9;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v43, 8, v6);
  uint64_t v10 = v43[0];
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v40, 8);
  uint64_t v42 = v10;
  (*(void (**)(LSMSVD *))(*(void *)this + 32))(this);
  if (v6)
  {
    uint64_t v11 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v13 = *(void *)(*((void *)a2 + 11) + v11 + 16);
      (*(void (**)(LSMSVD *, uint64_t, uint64_t))(*(void *)this + 40))(this, i, v13);
      if (v13)
      {
        *((void *)v43[0] + i) = *(void *)(*((void *)a2 + 11) + v11);
        LSMVectorBase::Append(v40);
        uint64_t v14 = v40[0];
        *((void *)v40[0] + v41 - 1) = i;
        v38[0] = v42;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((uint64_t)v14, (uint64_t)v14 + 8 * v41, (uint64_t *)v38, v41);
      }
      v11 += 64;
    }
  }
  (*(void (**)(LSMSVD *))(*(void *)this + 48))(this);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v38, 8);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v37, 4);
  long double v15 = log((double)v6);
  uint64_t v16 = 0;
  double v17 = 1.0 / v15;
  while (1)
  {
    double v18 = 0.0;
    while (1)
    {
      uint64_t v19 = *(void *)v40[0];
      uint64_t v20 = v43[0];
      unint64_t v21 = (_DWORD *)*((void *)v43[0] + *(void *)v40[0]);
      if (v16 != *v21) {
        break;
      }
      LODWORD(v2) = *(_DWORD *)(*((void *)a2 + 15)
                              + 12 * v19
                              + (((unint64_t)*(unsigned int *)(*((void *)a2 + 3) + 4 * v16) >> 28) & 0xC));
      LODWORD(vLSMVectorBase::~LSMVectorBase(this + 3) = *(_DWORD *)((char *)v21
                              + *(void *)(*((void *)a2 + 11) + (v19 << 6) + 32)
                              - *(void *)(*((void *)a2 + 11) + (v19 << 6)));
      LSMVectorBase::Append(v37);
      *((_DWORD *)v37[0] + (uint64_t)v37[2] - 1) = v19;
      LSMVectorBase::Append(v38);
      double v2 = (double)*(unint64_t *)&v3 / (double)*(unint64_t *)&v2;
      *((double *)v38[0] + v39 - 1) = v2;
      unint64_t v22 = v40[0];
      uint64_t v23 = v41;
      v44[0] = (uint64_t)v42;
      if (v41 >= 2)
      {
        uint64_t v24 = *(void *)v40[0];
        unint64_t v25 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((void *)v40[0], v44, v41 & 0x1FFFFFFFFFFFFFFFLL);
        uint64_t v26 = &v22[8 * v23 - 8];
        if (v25 == v26)
        {
          *unint64_t v25 = v24;
        }
        else
        {
          *unint64_t v25 = *v26;
          *uint64_t v26 = v24;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((uint64_t)v22, (uint64_t)(v25 + 1), v44, ((char *)(v25 + 1) - v22) >> 3);
        }
      }
      double v18 = v18 + v2;
      uint64_t v27 = --v41;
      uint64_t v28 = v20[v19] + 4;
      v20[v19] = v28;
      if (v28 == *(void *)(*((void *)a2 + 11) + (v19 << 6))
                + 4 * *(void *)(*((void *)a2 + 11) + (v19 << 6) + 16))
      {
        if (!v27) {
          break;
        }
      }
      else
      {
        LSMVectorBase::Append(v40);
        char v29 = v40[0];
        *((void *)v40[0] + v41 - 1) = v19;
        v44[0] = (uint64_t)v42;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>((uint64_t)v29, (uint64_t)v29 + 8 * v41, v44, v41);
      }
    }
    uint64_t v30 = v39;
    if (v39 < 1)
    {
      double v2 = 0.0;
    }
    else
    {
      int v31 = (double *)v38[0];
      uint64_t v32 = (double *)((char *)v38[0] + 8 * v39);
      double v2 = 0.0;
      double v3 = 1.0 / v18;
      do
      {
        double v33 = *v31++;
        double v2 = v2 + v3 * v33 * log(v3 * v33);
      }
      while (v31 < v32);
    }
    double v34 = v2 * v17 + 1.0;
    float v35 = v34;
    *(float *)(*v8 + 4 * v16) = v35;
    if (v30)
    {
      unint64_t v36 = 0;
      do
      {
        (*(void (**)(LSMSVD *, uint64_t, void, double))(*(void *)this + 56))(this, v16, *((unsigned int *)v37[0] + v36), v34 * *((double *)v38[0] + v36));
        ++v36;
      }
      while (v36 < v39);
    }
    LSMVectorBase::clear(v38);
    LSMVectorBase::clear(v37);
    if (!v41) {
      break;
    }
    uint64_t v16 = *(unsigned int *)v20[v19];
  }
  LSMVectorBase::~LSMVectorBase(v37);
  LSMVectorBase::~LSMVectorBase(v38);
  LSMVectorBase::~LSMVectorBase(v40);
  LSMVectorBase::~LSMVectorBase(v43);
}

void sub_2177CFF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  LSMVectorBase::~LSMVectorBase((void **)va);
  _Unwind_Resume(a1);
}

void LSMSVD::ProcessClusteredMap(LSMSVD *this, const LSMImmutableMapCounter *a2)
{
  v45[7] = *(void **)MEMORY[0x263EF8340];
  unint64_t v4 = *((unsigned int *)this + 2);
  uint64_t v5 = *((unsigned int *)this + 3);
  unint64_t v6 = (void *)((char *)this + 216);
  unint64_t v7 = *((void *)this + 30);
  if (v7 < v4)
  {
    LSMVectorBase::Allocate((const void **)this + 27, v4, 1);
    unint64_t v7 = *((void *)this + 30);
  }
  if (v7 >= v4) {
    unint64_t v7 = v4;
  }
  *((void *)this + 29) = v7;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v45, 8, v5 * (unint64_t)v4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v44, 8, v4);
  uint64_t v8 = 8 * v4;
  bzero(v45[0], 8 * v4 * v5);
  bzero(v44[0], 8 * v4);
  (*(void (**)(LSMSVD *))(*(void *)this + 32))(this);
  if (v5)
  {
    uint64_t v9 = 0;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v11 = 0;
      uint64_t v12 = *((void *)a2 + 15) + v9;
      do
      {
        unsigned int v13 = *(_DWORD *)(v12 + 4 * v11);
        if (v13) {
          double v14 = 1.0 / (double)v13;
        }
        else {
          double v14 = 1.0;
        }
        *(double *)&v45[v11++ + 4] = v14;
      }
      while (v11 != 3);
      long double v15 = (unsigned int **)(*((void *)a2 + 11) + (i << 6));
      uint64_t v16 = v15[2];
      if (v16)
      {
        double v17 = *v15;
        double v18 = v15[4];
        uint64_t v19 = *((void *)a2 + 7);
        uint64_t v20 = *((void *)a2 + 3);
        unint64_t v21 = (double *)v45[0];
        uint64_t v22 = 4 * (void)v16;
        uint64_t v23 = (double *)v44[0];
        do
        {
          unsigned int v25 = *v17++;
          uint64_t v24 = v25;
          unint64_t v26 = *(unsigned int *)(v20 + 4 * v25);
          unsigned int v27 = *v18++;
          uint64_t v28 = *(unsigned int *)(v19 + 4 * v24);
          double v29 = *(double *)((char *)&v45[4] + ((v26 >> 27) & 0x18)) * (double)v27;
          v21[i * v4 + v28] = v29 + v21[i * v4 + v28];
          v23[v28] = v29 + v23[v28];
          v22 -= 4;
        }
        while (v22);
      }
      (*(void (**)(LSMSVD *, uint64_t, unint64_t))(*(void *)this + 40))(this, i, v4);
      v9 += 12;
    }
  }
  (*(void (**)(LSMSVD *))(*(void *)this + 48))(this);
  if (v4)
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    double v32 = 1.0 / log((double)v5);
    do
    {
      if (v5)
      {
        double v34 = 1.0 / *((double *)v44[0] + v31);
        float v35 = (double *)((char *)v45[0] + v30);
        double v36 = 0.0;
        uint64_t v37 = v5;
        do
        {
          if (*v35 != 0.0)
          {
            double v38 = *v35;
            double v36 = v36 + v34 * v38 * log(v34 * v38);
          }
          float v35 = (double *)((char *)v35 + v8);
          --v37;
        }
        while (v37);
        uint64_t v39 = 0;
        double v40 = v36 * v32 + 1.0;
        float v41 = v40;
        *(float *)(*v6 + 4 * v31) = v41;
        uint64_t v42 = v30;
        do
        {
          double v43 = *(double *)((char *)v45[0] + v42);
          if (v43 != 0.0) {
            (*(void (**)(LSMSVD *, uint64_t, uint64_t, double))(*(void *)this + 56))(this, v31, v39, v40 * v43);
          }
          ++v39;
          v42 += v8;
        }
        while (v5 != v39);
      }
      else
      {
        float v33 = v32 * 0.0 + 1.0;
        *(float *)(*v6 + 4 * v31) = v33;
      }
      ++v31;
      v30 += 8;
    }
    while (v31 != v4);
  }
  LSMVectorBase::~LSMVectorBase(v44);
  LSMVectorBase::~LSMVectorBase(v45);
}

void sub_2177D033C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
}

void LSMSVD::TransposeUV(int32x2_t *this)
{
  this[1] = vrev64_s32(this[1]);
  double v2 = (LSMVectorBase *)&this[3];
  double v3 = (LSMVectorBase *)&this[7];
  LSMVectorBase::Swap((uint64_t *)&this[3], (LSMVectorBase *)&this[7]);
  TransposeMatrix(v2, this[1].i32[0], this[2].i32[0]);
  TransposeMatrix(v3, this[2].i32[0], this[1].i32[1]);
  if (this[35])
  {
    int v4 = this[1].i32[0];
    int v5 = this[1].i32[1];
    TransposeMatrix((LSMVectorBase *)&this[33], v4, v5);
  }
}

void TransposeMatrix(LSMVectorBase *a1, int a2, int a3)
{
  signed int v6 = (a2 + 3) & 0xFFFFFFFC;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v14, 4, v6 * a3);
  if (a2 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(int **)a1;
    uint64_t v9 = v14[0];
    do
    {
      uint64_t v10 = a3;
      uint64_t v11 = v8;
      uint64_t v12 = v9;
      if (a3 >= 1)
      {
        do
        {
          int v13 = *v11++;
          *uint64_t v12 = v13;
          v12 += v6;
          --v10;
        }
        while (v10);
      }
      ++v7;
      ++v9;
      v8 += (int)((a3 + 3) & 0xFFFFFFFC);
    }
    while (v7 != a2);
  }
  LSMVectorBase::Swap((uint64_t *)v14, a1);
  LSMVectorBase::~LSMVectorBase(v14);
}

void sub_2177D04F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void LSMSVD::CombineWeights(LSMClassifier *a1, int a2, uint64_t a3, char a4)
{
  LSMClassifier::CombineS((uint64_t)a1, (void *)a1 + 11);
  if (a3)
  {
    if (a4)
    {
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
      if ((a4 & 2) == 0)
      {
LABEL_4:
        if ((a4 & 4) == 0) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
    else if ((a4 & 2) == 0)
    {
      goto LABEL_4;
    }
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 2);
    if ((a4 & 4) != 0) {
LABEL_5:
    }
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 4);
  }
LABEL_6:
  if (a2) {
    LSMClassifier::CombineW((uint64_t)a1, (void *)a1 + 27);
  }
  LSMClassifier::ComputeVV(a1);
}

void LSMSVD::Compute(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (*(void *)(a1 + 72)) {
    LODWORD(v6) = *(_DWORD *)(a1 + 16);
  }
  else {
    uint64_t v6 = *(void *)(a1 + 40);
  }
  uint64_t v7 = *(void *)(a1 + 136);
  if ((LSMDebugFlags::sLSMDebug & 0x80) != 0) {
    printf("Sparseness %lu/%lu\n", *(void *)(a1 + 8), (v6 * v7));
  }
  if ((a4 & 2) != 0)
  {
LABEL_15:
    BOOL v10 = v6 < v7;
    if ((a4 & 8) == 0) {
      LSMSVDSparseDouble::Create((LSMSVDSparseDouble *)v10);
    }
    LSMSVDSparseFloat::Create((LSMSVDSparseFloat *)v10);
  }
  if ((a4 & 1) == 0)
  {
    unint64_t v8 = (v6 * v7);
    if (v8 < 0x989681)
    {
      if (v8 < 0xF4241)
      {
        if (v8 < 0x186A1) {
          goto LABEL_17;
        }
        float v9 = 0.05;
      }
      else
      {
        float v9 = 0.1;
      }
    }
    else
    {
      float v9 = 0.4;
    }
    if ((float)((float)*(unint64_t *)(a1 + 8) / (float)v8) < v9) {
      goto LABEL_15;
    }
  }
LABEL_17:
  if (v6 < v7)
  {
    if ((a4 & 4) == 0) {
      operator new();
    }
    operator new();
  }
  if ((a4 & 4) == 0) {
    operator new();
  }
  operator new();
}

void sub_2177D0934(_Unwind_Exception *a1)
{
  LSMSVD::~LSMSVD(v1);
  MEMORY[0x21D44C230](v1, 0x1081C403EA31E41);
  _Unwind_Resume(a1);
}

void LSMSVD::~LSMSVD(void **this)
{
  *this = &unk_26C7C69D0;
  LSMVectorBase::~LSMVectorBase(this + 33);
  LSMClassifier::~LSMClassifier(this);
}

void sub_2177D09F4(_Unwind_Exception *a1)
{
  LSMClassifier::~LSMClassifier(v1);
  _Unwind_Resume(a1);
}

void LSMSVD::LSMSVD(LSMSVD *this)
{
  LSMClassifier::LSMClassifier(this);
  *uint64_t v1 = &unk_26C7C69D0;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(v1 + 33), 4);
}

void sub_2177D0A64(_Unwind_Exception *a1)
{
  LSMClassifier::~LSMClassifier(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v7 = *v6;
    uint64_t v8 = *(void *)(a2 - 8);
    uint64_t v9 = *a3;
    unsigned int v10 = **(_DWORD **)(*a3 + (*v6 << 32 >> 29));
    unsigned int v11 = **(_DWORD **)(*a3 + 8 * (int)v8);
    if (v10 > v11 || ((int)v7 > (int)v8 ? (BOOL v12 = v10 == v11) : (BOOL v12 = 0), v12))
    {
      *(void *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v14 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          int v13 = (uint64_t *)(result + 8 * v5);
          uint64_t v15 = *v13;
          unsigned int v16 = **(_DWORD **)(v9 + (*v13 << 32 >> 29));
          if (v16 <= v11 && ((int)v15 <= (int)v8 || v16 != v11)) {
            break;
          }
          *uint64_t v6 = v15;
          uint64_t v6 = (uint64_t *)(result + 8 * v5);
          if (v14 <= 1) {
            goto LABEL_17;
          }
        }
      }
      int v13 = v6;
LABEL_17:
      uint64_t *v13 = v8;
    }
  }
  return result;
}

void *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,LSMSparseRowIterComp &,unsigned long *>(void *result, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  uint64_t v6 = *a2;
  do
  {
    uint64_t v7 = result;
    result += v3 + 1;
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 < a3)
    {
      uint64_t v10 = result[1];
      unsigned int v11 = **(_DWORD **)(v6 + ((uint64_t)(*result << 32) >> 29));
      unsigned int v12 = **(_DWORD **)(v6 + 8 * (int)v10);
      if (v11 > v12 || ((int)*result > (int)v10 ? (BOOL v13 = v11 == v12) : (BOOL v13 = 0), v13))
      {
        ++result;
        uint64_t v3 = v9;
      }
    }
    void *v7 = *result;
  }
  while (v3 <= v5);
  return result;
}

void LSMSVDSparseDouble::Create(LSMSVDSparseDouble *this)
{
}

void sub_2177D0C28(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C404F0F5D55);
  _Unwind_Resume(a1);
}

unsigned int *LSMSVDSDImpl::StartColumns(unsigned int *this)
{
  uint64_t v1 = (uint64_t)this;
  unint64_t v2 = this[3];
  unint64_t v3 = *((void *)this + 40);
  if (v3 >= v2)
  {
    unsigned int v4 = this[3];
  }
  else
  {
    this = (unsigned int *)LSMVectorBase::Allocate((const void **)this + 37, v2, 1);
    unint64_t v3 = *(void *)(v1 + 320);
    unsigned int v4 = *(_DWORD *)(v1 + 12);
  }
  if (v3 >= v2) {
    unint64_t v3 = v2;
  }
  *(void *)(v1 + 312) = v3;
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      this = (unsigned int *)std::pair<LSMVector<unsigned int>,LSMVector<double>>::pair[abi:ne180100]((LSMVectorBase *)(*(void *)(v1 + 296) + v5));
      ++v6;
      v5 += 64;
    }
    while (v6 < *(unsigned int *)(v1 + 12));
  }
  return this;
}

unsigned int *LSMSVDSDTImpl::StartColumns(unsigned int *this)
{
  uint64_t v1 = (uint64_t)this;
  unint64_t v2 = this[2];
  unint64_t v3 = *((void *)this + 40);
  if (v3 >= v2)
  {
    unsigned int v4 = this[2];
  }
  else
  {
    this = (unsigned int *)LSMVectorBase::Allocate((const void **)this + 37, v2, 1);
    unint64_t v3 = *(void *)(v1 + 320);
    unsigned int v4 = *(_DWORD *)(v1 + 8);
  }
  if (v3 >= v2) {
    unint64_t v3 = v2;
  }
  *(void *)(v1 + 312) = v3;
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      this = (unsigned int *)std::pair<LSMVector<unsigned int>,LSMVector<double>>::pair[abi:ne180100]((LSMVectorBase *)(*(void *)(v1 + 296) + v5));
      ++v6;
      v5 += 64;
    }
    while (v6 < *(unsigned int *)(v1 + 8));
  }
  return this;
}

const void **LSMSVDSDImpl::ColumnDimension(LSMSVDSDImpl *this, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *((void *)this + 37);
  uint64_t result = (const void **)(v6 + (a2 << 6));
  if ((unint64_t)result[3] < a3)
  {
    uint64_t result = (const void **)LSMVectorBase::Allocate(result, a3, 1);
    uint64_t v6 = *((void *)this + 37);
  }
  uint64_t v8 = v6 + (a2 << 6);
  if (*(void *)(v8 + 56) < a3)
  {
    return (const void **)LSMVectorBase::Allocate((const void **)(v8 + 32), a3, 1);
  }
  return result;
}

void *LSMSVDSDImpl::ProcessElement(LSMSVDSDImpl *this, int a2, uint64_t a3, double a4)
{
  uint64_t v8 = (void *)(*((void *)this + 37) + (a3 << 6));
  LSMVectorBase::Append(v8);
  *(_DWORD *)(*v8 + 4 * v8[2] - 4) = a2;
  uint64_t v9 = *((void *)this + 37) + (a3 << 6);
  uint64_t result = LSMVectorBase::Append((void *)(v9 + 32));
  *(double *)(*(void *)(v9 + 32) + 8 * *(void *)(v9 + 48) - 8) = a4;
  return result;
}

void *LSMSVDSDTImpl::ProcessElement(LSMSVDSDTImpl *this, uint64_t a2, int a3, double a4)
{
  uint64_t v8 = (void *)(*((void *)this + 37) + (a2 << 6));
  LSMVectorBase::Append(v8);
  *(_DWORD *)(*v8 + 4 * v8[2] - 4) = a3;
  uint64_t v9 = *((void *)this + 37) + (a2 << 6);
  uint64_t result = LSMVectorBase::Append((void *)(v9 + 32));
  *(double *)(*(void *)(v9 + 32) + 8 * *(void *)(v9 + 48) - 8) = a4;
  return result;
}

uint64_t LSMSVDSDImpl::Dump(LSMSVDSDImpl *this)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  time_t v21 = 0;
  time(&v21);
  unint64_t v2 = localtime(&v21);
  strftime(__filename, 0x50uLL, "matrix_%d%b%C_%H%M%S", v2);
  unint64_t v3 = fopen(__filename, "w");
  unsigned int v4 = (char *)v3;
  uint64_t v5 = *((unsigned int *)this + 3);
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (uint64_t *)(*((void *)this + 37) + 16);
    uint64_t v8 = *((unsigned int *)this + 3);
    do
    {
      uint64_t v9 = *v7;
      v7 += 8;
      v6 += v9;
      --v8;
    }
    while (v8);
  }
  else
  {
    uint64_t v6 = 0;
  }
  fprintf(v3, "%-72s%-8s\n#\nRRA%14lu%14lu%14lu%14lu\n%-16s%-16s%-20s%-20s\n", __filename, "LSM", *((unsigned int *)this + 2), v5, v6, 0, "(16I5)", "(16I5)", "(1P,5D16.9)", "(1P,5D16.9)");
  uint64_t v22 = v4;
  v23[10] = v23;
  if (*((_DWORD *)this + 3))
  {
    unint64_t v10 = 0;
    uint64_t v11 = 1;
    uint64_t v12 = 16;
    do
    {
      LSMCardPunch::Punch(&v22, " %lu", v11);
      v11 += *(void *)(*((void *)this + 37) + v12);
      ++v10;
      v12 += 64;
    }
    while (v10 < *((unsigned int *)this + 3));
  }
  else
  {
    uint64_t v11 = 1;
  }
  LSMCardPunch::Punch(&v22, " %lu", v11);
  LSMCardPunch::Flush((uint64_t)&v22);
  if (*((_DWORD *)this + 3))
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(void *)(*((void *)this + 37) + (v13 << 6) + 16);
      if (v14)
      {
        for (uint64_t i = 0; i != v14; ++i)
          LSMCardPunch::Punch(&v22, " %lu", (*(_DWORD *)(*(void *)(*((void *)this + 37) + (v13 << 6)) + 4 * i) + 1));
      }
      LSMCardPunch::Flush((uint64_t)&v22);
      ++v13;
      unint64_t v16 = *((unsigned int *)this + 3);
    }
    while (v13 < v16);
    if (v16)
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = *(void *)(*((void *)this + 37) + (v17 << 6) + 48);
        if (v18)
        {
          for (uint64_t j = 0; j != v18; ++j)
            LSMCardPunch::Punch(&v22, " %14g", *(double *)(*(void *)(*((void *)this + 37) + (v17 << 6) + 32) + 8 * j));
        }
        LSMCardPunch::Flush((uint64_t)&v22);
        ++v17;
      }
      while (v17 < *((unsigned int *)this + 3));
    }
  }
  return fclose((FILE *)v4);
}

int32x2_t LSMSVDSDTImpl::Dump(int32x2_t *this)
{
  this[1] = vrev64_s32(this[1]);
  LSMSVDSDImpl::Dump((LSMSVDSDImpl *)this);
  int32x2_t result = vrev64_s32(this[1]);
  this[1] = result;
  return result;
}

void LSMSVDSDImpl::Compute(LSMSVDSDImpl *this)
{
  int64_t v2 = *((void *)this + 32);
  if (!v2) {
    int64_t v2 = (3 * *((_DWORD *)this + 4));
  }
  unint64_t v3 = *((unsigned int *)this + 3);
  if (v2 >= (uint64_t)v3) {
    LODWORD(v2) = *((_DWORD *)this + 3);
  }
  *((_DWORD *)this + 108) = v2;
  *((void *)this + 49) = 0xB9B4484BFEEBC2A0;
  *((_OWORD *)this + 25) = xmmword_2177DCEB0;
  *((void *)this + 5LSMVectorBase::~LSMVectorBase(this + 7) = 0;
  *((void *)this + 52) = 0;
  unsigned int v4 = (void **)((char *)this + 504);
  unint64_t v5 = *((void *)this + 66);
  unint64_t v6 = v3;
  if (v5 < v3)
  {
    LSMVectorBase::Allocate((const void **)this + 63, v3, 1);
    unint64_t v5 = *((void *)this + 66);
    unint64_t v6 = *((unsigned int *)this + 3);
  }
  if (v5 >= v3) {
    unint64_t v5 = v3;
  }
  *((void *)this + 65) = v5;
  unint64_t v49 = (const void **)((char *)this + 536);
  unint64_t v7 = *((void *)this + 70);
  unint64_t v8 = v6;
  if (v7 < v6)
  {
    LSMVectorBase::Allocate(v49, v6, 1);
    unint64_t v7 = *((void *)this + 70);
    unint64_t v8 = *((unsigned int *)this + 3);
  }
  if (v7 >= v6) {
    unint64_t v7 = v6;
  }
  *((void *)this + 69) = v7;
  uint64_t v9 = (void **)((char *)this + 568);
  unint64_t v10 = *((void *)this + 74);
  unint64_t v11 = v8;
  if (v10 < v8)
  {
    LSMVectorBase::Allocate((const void **)this + 71, v8, 1);
    unint64_t v10 = *((void *)this + 74);
    unint64_t v11 = *((unsigned int *)this + 3);
  }
  if (v10 >= v8) {
    unint64_t v10 = v8;
  }
  *((void *)this + 7LSMVectorBase::~LSMVectorBase(this + 3) = v10;
  uint64_t v12 = (void **)((char *)this + 600);
  unint64_t v13 = *((void *)this + 78);
  if (v13 < v11)
  {
    LSMVectorBase::Allocate((const void **)this + 75, v11, 1);
    unint64_t v13 = *((void *)this + 78);
  }
  if (v13 >= v11) {
    unint64_t v13 = v11;
  }
  *((void *)this + 7LSMVectorBase::~LSMVectorBase(this + 7) = v13;
  uint64_t v14 = (void **)((char *)this + 632);
  unint64_t v15 = *((unsigned int *)this + 2);
  unint64_t v16 = *((void *)this + 82);
  if (v16 < v15)
  {
    LSMVectorBase::Allocate((const void **)this + 79, *((unsigned int *)this + 2), 1);
    unint64_t v16 = *((void *)this + 82);
  }
  if (v16 >= v15) {
    unint64_t v16 = v15;
  }
  *((void *)this + 81) = v16;
  unint64_t v17 = (void **)((char *)this + 664);
  unint64_t v18 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (*((int *)this + 108) + 2);
  unint64_t v19 = *((void *)this + 86);
  if (v19 < v18)
  {
    LSMVectorBase::Allocate((const void **)this + 83, ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (*((int *)this + 108) + 2), 1);
    unint64_t v19 = *((void *)this + 86);
  }
  if (v19 >= v18) {
    unint64_t v19 = v18;
  }
  *((void *)this + 85) = v19;
  uint64_t v20 = *((void *)this + 65);
  if (v20 >= 1) {
    bzero(*v4, 8 * (v20 - ((v20 & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
  }
  LSMSVDSDImpl::landr(this);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__Y, 8, *((unsigned int *)this + 2));
  uint64_t v21 = *((int *)this + 111);
  if ((int)v21 >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = __Y[0];
    do
    {
      LSMSVDSDImpl::opb((void **)this, (double *)(*((void *)this + 41) + 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * v22), v23);
      double v24 = cblas_ddot(*((_DWORD *)this + 3), (const double *)(*((void *)this + 41) + 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * v22), 1, __Y[0], 1);
      cblas_daxpy(*((_DWORD *)this + 3), -v24, (const double *)(*((void *)this + 41) + 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * v22), 1, __Y[0], 1);
      double v25 = cblas_ddot(*((_DWORD *)this + 3), __Y[0], 1, __Y[0], 1);
      double v26 = sqrt(v24);
      LSMSVDSDImpl::opa(this, (double *)(*((void *)this + 41) + 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * v22), __Y[0]);
      cblas_dscal(*((_DWORD *)this + 2), 1.0 / v26, __Y[0], 1);
      *(double *)(*((void *)this + 71) + 8 * v22) = 1.0 / v26 * sqrt(v25);
      float v27 = v26;
      *(float *)(*((void *)this + 11) + 4 * v22) = v27;
      uint64_t v23 = __Y[0];
      if (v54)
      {
        uint64_t v28 = (float *)(*((void *)this + 3) + 4 * ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * v22);
        uint64_t v29 = 8 * v54;
        uint64_t v30 = __Y[0];
        do
        {
          double v31 = *v30++;
          float v32 = v31;
          *v28++ = v32;
          v29 -= 8;
        }
        while (v29);
      }
      ++v22;
      uint64_t v21 = *((int *)this + 111);
    }
    while (v22 < v21);
  }
  if (v21 < 1)
  {
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = 0;
    double v34 = (float *)(*((void *)this + 11) + 4 * v21 - 4);
    while (*v34 < 0.00000001)
    {
      ++v33;
      --v34;
      if (v21 == v33)
      {
        uint64_t v33 = v21;
        break;
      }
    }
  }
  uint64_t v35 = v21 - v33;
  if (v21 - v33 >= (unint64_t)*((unsigned int *)this + 4)) {
    uint64_t v35 = *((unsigned int *)this + 4);
  }
  *((_DWORD *)this + 4) = v35;
  if (v35 < v21)
  {
    uint64_t v36 = (v35 + 3) & 0x1FFFFFFFCLL;
    uint64_t v48 = v33 + v35;
    if (*((_DWORD *)this + 3))
    {
      uint64_t v37 = 0;
      unint64_t v38 = 0;
      uint64_t v39 = 4 * v21 - 4 * (v33 + v35);
      unint64_t v40 = (4 * (v35 + 3)) & 0xFFFFFFFFFFFFFFF0;
      do
      {
        memmove((void *)(*((void *)this + 7) + v37), (const void *)(*((void *)this + 7) + v39), 4 * *((unsigned int *)this + 4));
        ++v38;
        unint64_t v41 = *((unsigned int *)this + 3);
        v39 += (4 * (v21 + 3)) & 0xFFFFFFFFFFFFFFF0;
        v37 += v40;
      }
      while (v38 < v41);
    }
    else
    {
      unint64_t v41 = 0;
    }
    unint64_t v42 = v41 * v36;
    unint64_t v43 = *((void *)this + 10);
    uint64_t v9 = (void **)((char *)this + 568);
    unsigned int v4 = (void **)((char *)this + 504);
    uint64_t v14 = (void **)((char *)this + 632);
    uint64_t v12 = (void **)((char *)this + 600);
    unint64_t v17 = (void **)((char *)this + 664);
    if (v43 < v42)
    {
      LSMVectorBase::Allocate((const void **)this + 7, v42, 1);
      unint64_t v43 = *((void *)this + 10);
    }
    if (v43 >= v42) {
      unint64_t v43 = v42;
    }
    *((void *)this + 9) = v43;
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)v52, (LSMSVDSDImpl *)((char *)this + 56));
    LSMVectorBase::Swap((uint64_t *)v52, (LSMSVDSDImpl *)((char *)this + 56));
    LSMVectorBase::clear(v52);
    memmove(*((void **)this + 11), (const void *)(*((void *)this + 11) + 4 * (v21 - v48)), 4 * *((unsigned int *)this + 4));
    unint64_t v44 = *((unsigned int *)this + 4);
    unint64_t v45 = *((void *)this + 14);
    if (v45 < v44)
    {
      LSMVectorBase::Allocate((const void **)this + 11, *((unsigned int *)this + 4), 1);
      unint64_t v45 = *((void *)this + 14);
    }
    if (v45 >= v44) {
      unint64_t v45 = v44;
    }
    *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v45;
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)v51, (LSMSVDSDImpl *)((char *)this + 88));
    LSMVectorBase::Swap((uint64_t *)v51, (LSMSVDSDImpl *)((char *)this + 88));
    LSMVectorBase::clear(v51);
    memmove(*((void **)this + 3), (const void *)(*((void *)this + 3) + 4 * ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * (v21 - v48)), (4 * (*((_DWORD *)this + 4) * *((_DWORD *)this + 2)) + 12) & 0x7FFFFFFF0);
    unint64_t v46 = ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 4);
    unint64_t v47 = *((void *)this + 6);
    if (v47 < v46)
    {
      LSMVectorBase::Allocate((const void **)this + 3, ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 4), 1);
      unint64_t v47 = *((void *)this + 6);
    }
    if (v47 >= v46) {
      unint64_t v47 = v46;
    }
    *((void *)this + 5) = v47;
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)v50, (LSMSVDSDImpl *)((char *)this + 24));
    LSMVectorBase::Swap((uint64_t *)v50, (LSMSVDSDImpl *)((char *)this + 24));
    LSMVectorBase::clear(v50);
    LSMVectorBase::~LSMVectorBase(v50);
    LSMVectorBase::~LSMVectorBase(v51);
    LSMVectorBase::~LSMVectorBase(v52);
  }
  LSMVectorBase::clear(v4);
  LSMVectorBase::clear((void **)v49);
  LSMVectorBase::clear(v9);
  LSMVectorBase::clear(v12);
  LSMVectorBase::clear(v14);
  LSMVectorBase::clear(v17);
  LSMVectorBase::clear((void **)this + 41);
  LSMVectorBase::~LSMVectorBase((void **)__Y);
}

void sub_2177D17F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
}

void LSMSVDSDImpl::landr(LSMSVDSDImpl *this)
{
  *((void *)this + 45) = 0x3CB0000000000000;
  unint64_t v2 = *((unsigned int *)this + 3);
  *((double *)this + 46) = sqrt((double)v2) * 2.22044605e-16;
  *(_OWORD *)((char *)this + 376) = xmmword_2177DCEC0;
  unint64_t v3 = (void **)((char *)this + 504);
  unint64_t v4 = *((void *)this + 66);
  unint64_t v5 = v2;
  if (v4 < v2)
  {
    LSMVectorBase::Allocate((const void **)this + 63, v2, 1);
    unint64_t v4 = *((void *)this + 66);
    unint64_t v5 = *((unsigned int *)this + 3);
  }
  if (v4 >= v2) {
    unint64_t v4 = v2;
  }
  *((void *)this + 65) = v4;
  unint64_t v6 = *((void *)this + 90);
  unint64_t v7 = v5;
  if (v6 < v5)
  {
    LSMVectorBase::Allocate((const void **)this + 87, v5, 1);
    unint64_t v6 = *((void *)this + 90);
    unint64_t v7 = *((unsigned int *)this + 3);
  }
  if (v6 >= v5) {
    unint64_t v6 = v5;
  }
  *((void *)this + 89) = v6;
  unint64_t v8 = *((void *)this + 94);
  unint64_t v9 = v7;
  if (v8 < v7)
  {
    LSMVectorBase::Allocate((const void **)this + 91, v7, 1);
    unint64_t v8 = *((void *)this + 94);
    unint64_t v9 = *((unsigned int *)this + 3);
  }
  if (v8 >= v7) {
    unint64_t v8 = v7;
  }
  *((void *)this + 9LSMVectorBase::~LSMVectorBase(this + 3) = v8;
  unint64_t v10 = *((void *)this + 98);
  unint64_t v11 = v9;
  if (v10 < v9)
  {
    LSMVectorBase::Allocate((const void **)this + 95, v9, 1);
    unint64_t v10 = *((void *)this + 98);
    unint64_t v11 = *((unsigned int *)this + 3);
  }
  if (v10 >= v9) {
    unint64_t v10 = v9;
  }
  *((void *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = v10;
  unint64_t v12 = *((void *)this + 102);
  unint64_t v13 = v11;
  if (v12 < v11)
  {
    LSMVectorBase::Allocate((const void **)this + 99, v11, 1);
    unint64_t v12 = *((void *)this + 102);
    unint64_t v13 = *((unsigned int *)this + 3);
  }
  if (v12 >= v11) {
    unint64_t v12 = v11;
  }
  *((void *)this + 101) = v12;
  unint64_t v14 = *((void *)this + 106);
  if (v14 < v13)
  {
    LSMVectorBase::Allocate((const void **)this + 103, v13, 1);
    unint64_t v14 = *((void *)this + 106);
  }
  if (v14 >= v13) {
    unint64_t v14 = v13;
  }
  *((void *)this + 105) = v14;
  int v15 = *((_DWORD *)this + 108);
  unint64_t v16 = v15;
  unint64_t v17 = *((void *)this + 110);
  if (v17 < v15)
  {
    LSMVectorBase::Allocate((const void **)this + 107, v15, 1);
    unint64_t v17 = *((void *)this + 110);
    int v15 = *((_DWORD *)this + 108);
  }
  unint64_t v18 = v15;
  if (v17 >= v16) {
    unint64_t v17 = v16;
  }
  *((void *)this + 109) = v17;
  unint64_t v19 = *((void *)this + 114);
  unint64_t v20 = v15;
  if (v19 < v15)
  {
    LSMVectorBase::Allocate((const void **)this + 111, v15, 1);
    unint64_t v19 = *((void *)this + 114);
    int v15 = *((_DWORD *)this + 108);
    unint64_t v20 = v15;
  }
  if (v19 >= v18) {
    unint64_t v19 = v18;
  }
  *((void *)this + 11LSMVectorBase::~LSMVectorBase(this + 3) = v19;
  unint64_t v21 = *((void *)this + 118);
  if (v21 < v20)
  {
    LSMVectorBase::Allocate((const void **)this + 115, v20, 1);
    unint64_t v21 = *((void *)this + 118);
    int v15 = *((_DWORD *)this + 108);
  }
  if (v21 >= v20) {
    unint64_t v21 = v20;
  }
  *((void *)this + 11LSMVectorBase::~LSMVectorBase(this + 7) = v21;
  unint64_t v22 = v15 + 1;
  unint64_t v23 = *((void *)this + 122);
  if (v23 < v22)
  {
    LSMVectorBase::Allocate((const void **)this + 119, v22, 1);
    unint64_t v23 = *((void *)this + 122);
  }
  double v24 = v3;
  if (v23 >= v22) {
    unint64_t v23 = v22;
  }
  *((void *)this + 121) = v23;
  LSMSVDSDImpl::lanso(this);
  unint64_t v25 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((int *)this + 111);
  unint64_t v26 = *((void *)this + 44);
  if (v26 < v25)
  {
    LSMVectorBase::Allocate((const void **)this + 41, ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((int *)this + 111), 1);
    unint64_t v26 = *((void *)this + 44);
  }
  if (v26 >= v25) {
    unint64_t v26 = v25;
  }
  *((void *)this + 4LSMVectorBase::~LSMVectorBase(this + 3) = v26;
  bzero(*((void **)this + 41), 8 * v26);
  unint64_t v27 = *((int *)this + 111);
  unint64_t v28 = ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * v27;
  unint64_t v29 = *((void *)this + 6);
  if (v29 < v28)
  {
    LSMVectorBase::Allocate((const void **)this + 3, ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * v27, 1);
    unint64_t v29 = *((void *)this + 6);
    unint64_t v27 = *((int *)this + 111);
  }
  if (v29 >= v28) {
    unint64_t v29 = v28;
  }
  *((void *)this + 5) = v29;
  unint64_t v30 = ((v27 + 3) & 0xFFFFFFFFFFFFFFFCLL) * *((unsigned int *)this + 3);
  unint64_t v31 = *((void *)this + 10);
  if (v31 < v30)
  {
    LSMVectorBase::Allocate((const void **)this + 7, ((v27 + 3) & 0xFFFFFFFFFFFFFFFCLL) * *((unsigned int *)this + 3), 1);
    unint64_t v31 = *((void *)this + 10);
    unint64_t v27 = *((int *)this + 111);
  }
  if (v31 >= v30) {
    unint64_t v31 = v30;
  }
  *((void *)this + 9) = v31;
  unint64_t v32 = *((void *)this + 14);
  if (v32 < v27)
  {
    LSMVectorBase::Allocate((const void **)this + 11, v27, 1);
    unint64_t v32 = *((void *)this + 14);
  }
  if (v32 >= v27) {
    unint64_t v32 = v27;
  }
  *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v32;
  double v33 = fabs(*((double *)this + 51));
  if (v33 < *((double *)this + 48)) {
    double v33 = *((double *)this + 48);
  }
  *((double *)this + 51) = v33;
  LSMSVDSDImpl::ritvec(this);
  LSMVectorBase::clear(v24);
  LSMVectorBase::clear((void **)this + 87);
  LSMVectorBase::clear((void **)this + 91);
  LSMVectorBase::clear((void **)this + 95);
  LSMVectorBase::clear((void **)this + 99);
  LSMVectorBase::clear((void **)this + 103);
  LSMVectorBase::clear((void **)this + 107);
  LSMVectorBase::clear((void **)this + 111);
  LSMVectorBase::clear((void **)this + 115);
  LSMVectorBase::clear((void **)this + 119);
}

void LSMSVDSDImpl::opb(void **this, double *a2, double *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if (v6) {
    bzero(this[79], 8 * v6);
  }
  uint64_t v7 = *((unsigned int *)this + 3);
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = (char *)this[37];
    unint64_t v10 = (double *)this[79];
    do
    {
      unint64_t v11 = &v9[64 * v8];
      uint64_t v12 = *((void *)v11 + 2);
      double v13 = *a2++;
      double v14 = v13;
      if (v12 >= 1)
      {
        int v15 = *(_DWORD **)v11;
        unint64_t v16 = *(void *)v11 + 4 * v12;
        unint64_t v17 = (double *)*((void *)v11 + 4);
        do
        {
          double v18 = *v17++;
          double v19 = v18;
          LODWORD(v18) = *v15++;
          v10[LODWORD(v18)] = v10[LODWORD(v18)] + v19 * v14;
        }
        while ((unint64_t)v15 < v16);
      }
      ++v8;
    }
    while (v8 != v7);
    uint64_t v20 = 0;
    unint64_t v21 = (char *)this[37];
    unint64_t v22 = (double *)this[79];
    do
    {
      unint64_t v23 = &v21[64 * v20];
      uint64_t v24 = *((void *)v23 + 2);
      if (v24 < 1)
      {
        double v28 = 0.0;
      }
      else
      {
        unint64_t v25 = *(_DWORD **)v23;
        unint64_t v26 = *(void *)v23 + 4 * v24;
        unint64_t v27 = (double *)*((void *)v23 + 4);
        double v28 = 0.0;
        do
        {
          double v29 = *v27++;
          double v30 = v29;
          LODWORD(v29) = *v25++;
          double v28 = v28 + v30 * v22[LODWORD(v29)];
        }
        while ((unint64_t)v25 < v26);
      }
      *a3++ = v28;
      ++v20;
    }
    while (v20 != v7);
  }
}

void LSMSVDSDImpl::opa(LSMSVDSDImpl *this, double *a2, double *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if (v6) {
    bzero(a3, 8 * v6);
  }
  uint64_t v7 = *((unsigned int *)this + 3);
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *((void *)this + 37);
    do
    {
      uint64_t v10 = v9 + (v8 << 6);
      uint64_t v11 = *(void *)(v10 + 16);
      double v12 = *a2++;
      double v13 = v12;
      if (v11 >= 1)
      {
        double v14 = *(_DWORD **)v10;
        unint64_t v15 = *(void *)v10 + 4 * v11;
        unint64_t v16 = *(double **)(v10 + 32);
        do
        {
          double v17 = *v16++;
          double v18 = v17;
          LODWORD(v1LSMVectorBase::~LSMVectorBase(this + 7) = *v14++;
          a3[LODWORD(v17)] = a3[LODWORD(v17)] + v18 * v13;
        }
        while ((unint64_t)v14 < v15);
      }
      ++v8;
    }
    while (v8 != v7);
  }
}

void LSMSVDSDTImpl::Compute(int32x2_t *this)
{
  this[1] = vrev64_s32(this[1]);
  LSMSVDSDImpl::Compute((LSMSVDSDImpl *)this);
  LSMSVD::TransposeUV(this);
}

uint64_t datx(uint64_t result, double a2, double *a3, double *a4)
{
  if (result >= 1 && a2 != 0.0)
  {
    do
    {
      double v4 = *a3++;
      *a4++ = v4 * a2;
      --result;
    }
    while (result);
  }
  return result;
}

uint64_t dsort2(uint64_t result, uint64_t a2, double *a3, double *a4)
{
  if (result)
  {
    do
    {
      if (result < a2)
      {
        double v4 = &a3[result];
        uint64_t v5 = result;
        uint64_t v6 = &a4[result];
        do
        {
          for (uint64_t i = v5 - result; i >= 0; i -= result)
          {
            double v8 = a3[i];
            double v9 = v4[i];
            if (v8 <= v9) {
              break;
            }
            a3[i] = v9;
            v4[i] = v8;
            double v10 = a4[i];
            a4[i] = v6[i];
            v6[i] = v10;
          }
          ++v5;
        }
        while (v5 != a2);
      }
      if (result >= 0) {
        uint64_t v11 = result;
      }
      else {
        uint64_t v11 = result + 1;
      }
      unint64_t v12 = result + 1;
      int32x2_t result = v11 >> 1;
    }
    while (v12 > 2);
  }
  return result;
}

void LSMSVDSDImpl::lanso(LSMSVDSDImpl *this)
{
  *((_DWORD *)this + 110) = 0;
  *((_DWORD *)this + 109) = 0;
  LSMSVDSDImpl::stpone(this);
  if (*((double *)this + 52) != 0.0 && !*((_DWORD *)this + 110))
  {
    **((void **)this + 111) = *((void *)this + 46);
    **((void **)this + 1LSMVectorBase::~LSMVectorBase(this + 15) = *((void *)this + 46);
    int v33 = 0;
    unint64_t v2 = *((unsigned int *)this + 4);
    int64_t v3 = *((int *)this + 108);
    BOOL v32 = 0;
    if (v2)
    {
      int v31 = 0;
      double v4 = (int *)((char *)this + 436);
      uint64_t v5 = 8;
      if (v2 > 8) {
        uint64_t v5 = v2;
      }
      int64_t v6 = v5 + v2;
      if (v6 >= v3) {
        int v7 = v3;
      }
      else {
        int v7 = v6;
      }
      int v8 = 1;
      do
      {
        if (*((double *)this + 52) <= *((double *)this + 53)) {
          *((void *)this + 52) = 0;
        }
        LSMSVDSDImpl::lanczos_step(this, v8, v7, &v33, &v32);
        if (v32) {
          int v7 = *v4;
        }
        int v9 = v7 - 1;
        *((_DWORD *)this + 109) = v7 - 1;
        *(void *)(*((void *)this + 119) + 8 * vLSMVectorBase::~LSMVectorBase(this + 7) = *((void *)this + 52);
        if (v7 >= 2)
        {
          int v10 = 0;
          int v11 = 0;
          do
          {
            uint64_t v12 = v10;
            uint64_t v13 = v10;
            do
            {
              uint64_t v14 = v13;
              if (v13 > v9) {
                break;
              }
              ++v13;
            }
            while (*(double *)(*((void *)this + 119) + 8 * v14 + 8) != 0.0);
            if ((int)v14 >= v9) {
              int v15 = v9;
            }
            else {
              int v15 = v14;
            }
            int v16 = v15 - v12 + 1;
            cblas_dcopy(v16, (const double *)(*((void *)this + 107) + 8 * v12), 1, (double *)(*((void *)this + 67) + 8 * v12), -1);
            cblas_dcopy(v15 - v12, (const double *)(*((void *)this + 119) + 8 * v12 + 8), 1, (double *)(*((void *)this + 103) + 8 * v12 + 8), -1);
            LSMSVDSDImpl::imtqlb(this, v16, (double *)(*((void *)this + 67) + 8 * v12), (double *)(*((void *)this + 103) + 8 * v12), (double *)(*((void *)this + 71) + 8 * v12));
            if (*((_DWORD *)this + 110))
            {
              printf("IMTQLB FAILED TO CONVERGE (IERR = %d)\n", *((_DWORD *)this + 110));
              printf("L = %d    I = %d\n", v12, v15);
              if (v15 >= (int)v12)
              {
                uint64_t v17 = v12;
                do
                {
                  printf("%d  %lg  %lg  %lg\n", v17, *(double *)(*((void *)this + 67) + 8 * v17), *(double *)(*((void *)this + 103) + 8 * v17), *(double *)(*((void *)this + 71) + 8 * v17));
                  BOOL v19 = v17++ < v15;
                }
                while (v19);
              }
            }
            if (v15 >= (int)v12)
            {
              uint64_t v18 = *((void *)this + 71);
              do
              {
                *(double *)(v18 + 8 * v12) = *((double *)this + 52) * fabs(*(double *)(v18 + 8 * v12));
                BOOL v19 = v12++ < v15;
              }
              while (v19);
            }
            int v10 = v15 + 1;
            ++v11;
            int v9 = *v4;
            BOOL v19 = v11 < *v4 && v15 < v9;
          }
          while (v19);
        }
        int v20 = v9 + 1;
        if (v9 >= -1) {
          int v21 = v9 + 1;
        }
        else {
          int v21 = v9 + 2;
        }
        dsort2((uint64_t)v21 >> 1, v20, *((double **)this + 67), *((double **)this + 71));
        LSMSVDSDImpl::error_bound(this, &v32);
        uint64_t v22 = *((int *)this + 111);
        uint64_t v23 = *((unsigned int *)this + 4);
        if (v22 >= v23) {
          break;
        }
        if (v22)
        {
          unsigned int v24 = (*v4 - 5) * ((int)v23 - (int)v22) / v22;
          int v25 = v24 + 1 > 3 ? v24 + 1 : 3;
          int v26 = v25 + v7;
        }
        else
        {
          int v26 = v7 + 9;
        }
        if (v32) {
          break;
        }
        int v27 = *((_DWORD *)this + 108);
        if (v27 < v26) {
          int v26 = *((_DWORD *)this + 108);
        }
        BOOL v32 = v7 >= v27;
        if (++v31 >= v23) {
          break;
        }
        int v8 = v7;
        BOOL v19 = v7 < v27;
        int v7 = v26;
      }
      while (v19);
    }
    double v28 = (const double *)*((void *)this + 87);
    uint64_t v29 = *((unsigned int *)this + 3);
    double v30 = (double *)(*((void *)this + 83) + 8 * ((v29 + 3) & 0x1FFFFFFFCLL) * (*((int *)this + 109) + 2));
    cblas_dcopy(v29, v28, 1, v30, 1);
  }
}

void LSMSVDSDImpl::ritvec(LSMSVDSDImpl *this)
{
  unint64_t v2 = (double *)*((void *)this + 95);
  int64_t v3 = (double *)*((void *)this + 103);
  uint64_t v4 = *((int *)this + 109);
  uint64_t v5 = v4 + 1;
  unint64_t v6 = v5 * v5;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v27, 8, v5 * v5);
  if (v4 == -1 || (v6 <= 1 ? (uint64_t v7 = 1) : (uint64_t v7 = v5 * v5), bzero(v27[0], 8 * v7), (v4 & 0x80000000) != 0))
  {
    int v10 = 0;
  }
  else
  {
    int v8 = v27[0];
    uint64_t v9 = v4 + 1;
    do
    {
      *int v8 = 1.0;
      v8 += v4 + 2;
      --v9;
    }
    while (v9);
    int v10 = 1;
  }
  cblas_dcopy(v4 + 1, *((const double **)this + 107), 1, v2, -1);
  cblas_dcopy(*((_DWORD *)this + 109), (const double *)(*((void *)this + 119) + 8), 1, v3 + 1, -1);
  LSMSVDSDImpl::imtql2(this, v4 + 1, v4 + 1, v2, v3, v27[0]);
  if (!*((_DWORD *)this + 110))
  {
    *((_DWORD *)this + 112) = 0;
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 8 * (v6 - v5);
      do
      {
        if (*(double *)(*((void *)this + 71) + 8 * v12) <= *((double *)this + 51)
                                                            * fabs(*(double *)(*((void *)this + 67) + 8 * v12))
          && v12 > v5 + ~*((_DWORD *)this + 111))
        {
          uint64_t v26 = v11;
          uint64_t v14 = *((unsigned int *)this + 3);
          if (v14) {
            bzero(v2, 8 * v14);
          }
          uint64_t v15 = -1;
          uint64_t v16 = v13;
          do
          {
            cblas_dcopy(*((_DWORD *)this + 3), (const double *)(*((void *)this + 83)+ 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v15 + 3)), 1, v3, 1);
            cblas_daxpy(*((_DWORD *)this + 3), *(double *)((char *)v27[0] + v16), v3, 1, v2, 1);
            v16 += 8 * ~v4;
            ++v15;
          }
          while (v4 != v15);
          uint64_t v17 = *((int *)this + 112);
          uint64_t v18 = *((int *)this + 111);
          int v19 = *((_DWORD *)this + 3);
          if ((int)v17 < (int)v18 && v19)
          {
            int v20 = (float *)(*((void *)this + 7) + 4 * v17);
            unint64_t v21 = (4 * v18 + 12) & 0xFFFFFFFFFFFFFFF0;
            uint64_t v22 = v2;
            uint64_t v23 = *((unsigned int *)this + 3);
            do
            {
              double v24 = *v22++;
              float v25 = v24;
              *int v20 = v25;
              int v20 = (float *)((char *)v20 + v21);
              --v23;
            }
            while (v23);
          }
          cblas_dcopy(v19, v2, 1, (double *)(*((void *)this + 41) + 8 * v26), 1);
          uint64_t v11 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) + v26;
          ++*((_DWORD *)this + 112);
        }
        ++v12;
        v13 += 8;
      }
      while (v12 != v5);
    }
  }
  LSMVectorBase::~LSMVectorBase((void **)v27);
}

void sub_2177D2524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  LSMVectorBase::~LSMVectorBase((void **)va);
  _Unwind_Resume(a1);
}

void LSMSVDSDImpl::imtql2(LSMSVDSDImpl *this, uint64_t a2, uint64_t a3, double *a4, double *__dst, double *a6)
{
  uint64_t v6 = a3 - 1;
  if (a3 != 1)
  {
    *((_DWORD *)this + 110) = 0;
    if (a3 <= 1)
    {
      __dst[v6] = 0.0;
    }
    else
    {
      memmove(__dst, __dst + 1, 8 * a3 - 8);
      unint64_t v12 = 0;
      __dst[v6] = 0.0;
      uint64_t v13 = a3 * a2;
      unint64_t v61 = a6;
      uint64_t v62 = 1;
      v14.f64[0] = NAN;
      v14.f64[1] = NAN;
      float64x2_t v15 = vnegq_f64(v14);
      int8x16_t v58 = (int8x16_t)v15;
      unsigned int v56 = a6;
      uint64_t v60 = a4;
      uint64_t v16 = __dst;
      while (2)
      {
        uint64_t v17 = 0;
        unint64_t v59 = v12 + 1;
        while (1)
        {
          uint64_t v18 = 0;
          int v19 = v60;
          int v20 = v61;
          uint64_t v21 = v62;
          do
          {
            uint64_t v22 = v18;
            uint64_t v23 = v19;
            double v24 = v20;
            unint64_t v25 = v21 - 1;
            if (v21 - 1 >= a3 || a3 == v21) {
              break;
            }
            double v27 = fabs(*v19++);
            double v28 = v27 + fabs(v23[1]);
            double v29 = v28 + fabs(v16[v18]);
            ++v21;
            ++v18;
            ++v20;
          }
          while (v29 != v28);
          if (!v22) {
            break;
          }
          if (v17 == 30)
          {
            *((_DWORD *)this + 110) = v12;
            return;
          }
          uint64_t v64 = v17;
          double v30 = a4[v12];
          double v31 = __dst[v12];
          v15.f64[0] = (a4[v59] - v30) / (v31 + v31);
          int8x16_t v63 = (int8x16_t)v15;
          *(double *)v32.i64 = hypot(v15.f64[0], 1.0);
          float64x2_t v15 = (float64x2_t)vbslq_s8(v58, v32, v63);
          double v33 = *v23 - v30 + v31 / (*(double *)v63.i64 + v15.f64[0]);
          double v34 = 0.0;
          if (v25 <= v12)
          {
LABEL_20:
            a4[v12] = a4[v12] - v34;
            __dst[v12] = v33;
          }
          else
          {
            double v35 = 1.0;
            double v36 = 1.0;
            while (1)
            {
              int64_t v37 = v25 - 1;
              double v38 = __dst[v25 - 1];
              double v39 = v36 * v38;
              v15.f64[0] = hypot(v36 * v38, v33);
              __dst[v25] = v15.f64[0];
              if (v15.f64[0] == 0.0) {
                break;
              }
              double v40 = v35 * v38;
              double v36 = v39 / v15.f64[0];
              double v35 = v33 / v15.f64[0];
              double v41 = a4[v25] - v34;
              double v42 = v40 * (v35 + v35) + (a4[v37] - v41) * (v39 / v15.f64[0]);
              double v34 = v36 * v42;
              a4[v25] = v41 + v36 * v42;
              if (v13 >= 1)
              {
                for (uint64_t i = 0; i < v13; i += a3)
                {
                  unint64_t v44 = &v24[i];
                  double v45 = *(v44 - 1);
                  double v46 = v35 * *v44 + v36 * v45;
                  *(v44 - 1) = *v44 * -v36 + v35 * v45;
                  *unint64_t v44 = v46;
                }
              }
              double v33 = -(v40 - v35 * v42);
              --v24;
              --v25;
              if (v37 <= (uint64_t)v12) {
                goto LABEL_20;
              }
            }
            a4[v25] = a4[v25] - v34;
          }
          uint64_t v17 = v64 + 1;
          v16[v22] = 0.0;
        }
        ++v16;
        ++v60;
        ++v61;
        ++v62;
        ++v12;
        if (v59 != a3) {
          continue;
        }
        break;
      }
      uint64_t v47 = 1;
      uint64_t v48 = v56;
      do
      {
        uint64_t v49 = v47 - 1;
        double v50 = a4[v47 - 1];
        uint64_t v51 = v47 - 1;
        uint64_t v52 = v47;
        do
        {
          if (a4[v52] < v50)
          {
            uint64_t v51 = v52;
            double v50 = a4[v52];
          }
          ++v52;
        }
        while (v52 < a3);
        if (v51 != v49)
        {
          a4[v51] = a4[v47 - 1];
          a4[v49] = v50;
          if (v13 >= 1)
          {
            uint64_t v53 = 0;
            uint64_t v54 = &v56[v51];
            do
            {
              double v55 = v48[v53];
              v48[v53] = v54[v53];
              v54[v53] = v55;
              v53 += a3;
            }
            while (v53 < v13);
          }
        }
        ++v47;
        ++v48;
      }
      while (v47 != a3);
    }
  }
}

void LSMSVDSDImpl::store(LSMSVDSDImpl *this, int a2, uint64_t a3, double *a4)
{
  switch(a2)
  {
    case 0:
      uint64_t v4 = *((unsigned int *)this + 3);
      uint64_t v5 = *((void *)this + 83);
      uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) * (a3 + 2);
      goto LABEL_10;
    case 1:
      uint64_t v9 = *((unsigned int *)this + 3);
      uint64_t v10 = *((void *)this + 83);
      uint64_t v11 = ((v9 + 3) & 0x1FFFFFFFCLL) * (a3 + 2);
      goto LABEL_12;
    case 2:
      if (a3 >= 2)
      {
        uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
        int v8 = "store: (STORP) j >= MAXLL \n";
        goto LABEL_7;
      }
      uint64_t v4 = *((unsigned int *)this + 3);
      uint64_t v5 = *((void *)this + 83);
      uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) * a3;
LABEL_10:
      int v12 = v4;
      uint64_t v13 = a4;
      a4 = (double *)(v5 + 8 * v6);
      goto LABEL_13;
    case 3:
      if (a3 < 2)
      {
        uint64_t v9 = *((unsigned int *)this + 3);
        uint64_t v10 = *((void *)this + 83);
        uint64_t v11 = ((v9 + 3) & 0x1FFFFFFFCLL) * a3;
LABEL_12:
        uint64_t v13 = (const double *)(v10 + 8 * v11);
        int v12 = v9;
LABEL_13:
        cblas_dcopy(v12, v13, 1, a4, 1);
      }
      else
      {
        uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
        int v8 = "store: (RETRP) j >= MAXLL \n";
LABEL_7:
        fwrite(v8, 0x1BuLL, 1uLL, v7);
      }
      return;
    default:
      return;
  }
}

double sparse_ddot(unsigned int *a1, unsigned int *a2, double *a3, double *a4)
{
  double result = 0.0;
  while (a1 < a2)
  {
    double v5 = *a3++;
    double v6 = v5;
    LODWORD(v5) = *a1++;
    double result = result + v6 * a4[LODWORD(v5)];
  }
  return result;
}

void LSMSVDSDImpl::stpone(LSMSVDSDImpl *this)
{
  LSMSVDSDImpl::startv(this);
  *((double *)this + 52) = v2;
  if (v2 != 0.0 && !*((_DWORD *)this + 110))
  {
    double v3 = 1.0 / v2;
    int v4 = *((_DWORD *)this + 3);
    if (v3 != 0.0 && v4 != 0)
    {
      double v6 = (double *)*((void *)this + 87);
      uint64_t v7 = (double *)*((void *)this + 63);
      uint64_t v8 = *((unsigned int *)this + 3);
      do
      {
        double v9 = *v7++;
        *v6++ = v3 * v9;
        --v8;
      }
      while (v8);
    }
    cblas_dscal(v4, v3, *((double **)this + 95), 1);
    LSMSVDSDImpl::opb((void **)this, *((double **)this + 95), *((double **)this + 63));
    double v10 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 95), 1);
    **((double **)this + 10LSMVectorBase::~LSMVectorBase(this + 7) = v10;
    cblas_daxpy(*((_DWORD *)this + 3), -v10, *((const double **)this + 87), 1, *((double **)this + 63), 1);
    double v11 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 95), 1);
    cblas_daxpy(*((_DWORD *)this + 3), -v11, *((const double **)this + 87), 1, *((double **)this + 63), 1);
    **((double **)this + 10LSMVectorBase::~LSMVectorBase(this + 7) = v11 + **((double **)this + 107);
    cblas_dcopy(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((double **)this + 99), 1);
    double v12 = sqrt(cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 99), 1));
    *((double *)this + 52) = v12;
    *((double *)this + 5LSMVectorBase::~LSMVectorBase(this + 3) = *((double *)this + 47) * (v12 + fabs(**((double **)this + 107)));
  }
}

void LSMSVDSDImpl::lanczos_step(LSMSVDSDImpl *this, int a2, int a3, int *a4, BOOL *a5)
{
  *((_DWORD *)this + 109) = a2;
  if (a2 < a3)
  {
    double v9 = (uint64_t *)((char *)this + 696);
    double v10 = (LSMSVDSDImpl *)((char *)this + 728);
    double v11 = (uint64_t *)((char *)this + 760);
    double v12 = (LSMSVDSDImpl *)((char *)this + 792);
    while (1)
    {
      LSMVectorBase::Swap(v9, v10);
      LSMVectorBase::Swap(v11, v12);
      cblas_dcopy(*((_DWORD *)this + 3), *((const double **)this + 91), 1, (double *)(*((void *)this + 83)+ 8* (((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL)+ ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((int *)this + 109))), 1);
      int v13 = *((_DWORD *)this + 109);
      if (v13 <= 2)
      {
        LSMSVDSDImpl::store(this, 2, v13 - 1, *((double **)this + 99));
        int v13 = *((_DWORD *)this + 109);
      }
      double v14 = *((double *)this + 52);
      *(double *)(*((void *)this + 119) + 8 * v1LSMVectorBase::~LSMVectorBase(this + 3) = v14;
      if (v14 == 0.0)
      {
        LSMSVDSDImpl::startv(this);
        *((double *)this + 52) = v15;
        if (*((_DWORD *)this + 110)) {
          return;
        }
        if (v15 == 0.0) {
          break;
        }
      }
      if (!*a5)
      {
        int v16 = *((_DWORD *)this + 3);
        double v17 = 1.0 / *((double *)this + 52);
        if (v16 && v17 != 0.0)
        {
          uint64_t v18 = (double *)*((void *)this + 87);
          int v19 = (double *)*((void *)this + 63);
          uint64_t v20 = *((unsigned int *)this + 3);
          do
          {
            double v21 = *v19++;
            *v18++ = v17 * v21;
            --v20;
          }
          while (v20);
        }
        cblas_dscal(v16, v17, *((double **)this + 95), 1);
        LSMSVDSDImpl::opb((void **)this, *((double **)this + 95), *((double **)this + 63));
        cblas_daxpy(*((_DWORD *)this + 3), -*((double *)this + 52), *((const double **)this + 91), 1, *((double **)this + 63), 1);
        double v22 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 95), 1);
        *(double *)(*((void *)this + 107) + 8 * *((int *)this + 109)) = v22;
        cblas_daxpy(*((_DWORD *)this + 3), -v22, *((const double **)this + 87), 1, *((double **)this + 63), 1);
        int v23 = *((_DWORD *)this + 109);
        if (v23 <= 2
          && fabs(*(double *)(*((void *)this + 107) + 8 * (v23 - 1))) > fabs(*(double *)(*((void *)this + 107)
                                                                                           + 8 * v23))
                                                                          * 4.0)
        {
          *a4 = v23;
          int v23 = *((_DWORD *)this + 109);
        }
        int v24 = v23 - 1;
        if (v24 >= *a4) {
          int v24 = *a4;
        }
        if (v24 >= 1)
        {
          uint64_t v25 = 0;
          do
          {
            LSMSVDSDImpl::store(this, 3, v25, *((double **)this + 103));
            double v26 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 103), 1, *((const double **)this + 63), 1);
            cblas_dcopy(*((_DWORD *)this + 3), (const double *)(*((void *)this + 83)+ 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v25 + 2)), 1, *((double **)this + 103), 1);
            cblas_daxpy(*((_DWORD *)this + 3), -v26, *((const double **)this + 103), 1, *((double **)this + 63), 1);
            *(void *)(*((void *)this + 111) + 8 * v25) = *((void *)this + 46);
            *(void *)(*((void *)this + 115) + 8 * v25++) = *((void *)this + 46);
            int v27 = *((_DWORD *)this + 109) - 1;
            if (v27 >= *a4) {
              int v27 = *a4;
            }
          }
          while (v25 < v27);
        }
        double v28 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 99), 1);
        cblas_daxpy(*((_DWORD *)this + 3), -v28, *((const double **)this + 91), 1, *((double **)this + 63), 1);
        uint64_t v29 = *((void *)this + 119);
        uint64_t v30 = *((int *)this + 109);
        double v31 = *(double *)(v29 + 8 * v30);
        if (v31 > 0.0) {
          *(double *)(v29 + 8 * v30) = v28 + v31;
        }
        double v32 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 95), 1);
        cblas_daxpy(*((_DWORD *)this + 3), -v32, *((const double **)this + 87), 1, *((double **)this + 63), 1);
        *(double *)(*((void *)this + 107) + 8 * *((int *)this + 109)) = v32
                                                                          + *(double *)(*((void *)this + 107)
                                                                                      + 8 * *((int *)this + 109));
        cblas_dcopy(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((double **)this + 99), 1);
        double v33 = sqrt(cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 99), 1));
        *((double *)this + 52) = v33;
        double v34 = *((double *)this + 47)
            * (v33
             + *(double *)(*((void *)this + 119) + 8 * *((int *)this + 109))
             + fabs(*(double *)(*((void *)this + 107) + 8 * *((int *)this + 109))));
        *((double *)this + 5LSMVectorBase::~LSMVectorBase(this + 3) = v34;
        LSMSVDSDImpl::ortbnd(this, v34);
        LSMSVDSDImpl::purge(this, *a4, *((double **)this + 63), *((double **)this + 87), *((double **)this + 99), *((double **)this + 95));
        if (*((double *)this + 52) <= *((double *)this + 53)) {
          *((void *)this + 52) = 0;
        }
        int v35 = *((_DWORD *)this + 109) + 1;
        *((_DWORD *)this + 109) = v35;
        if (v35 < a3) {
          continue;
        }
      }
      return;
    }
    *a5 = 1;
  }
}

void LSMSVDSDImpl::imtqlb(LSMSVDSDImpl *this, uint64_t a2, double *a3, double *a4, double *a5)
{
  uint64_t v5 = a2 - 1;
  if (a2 != 1)
  {
    *((_DWORD *)this + 110) = 0;
    *a5 = 1.0;
    if (a2 < 2)
    {
      a4[v5] = 0.0;
    }
    else
    {
      uint64_t v10 = 0;
      do
      {
        a5[v10 + 1] = 0.0;
        a4[v10] = a4[v10 + 1];
        ++v10;
      }
      while (v5 != v10);
      a4[v5] = 0.0;
      unint64_t v11 = 0;
      uint64_t v55 = 1;
      v12.f64[0] = NAN;
      v12.f64[1] = NAN;
      float64x2_t v13 = vnegq_f64(v12);
      int8x16_t v52 = (int8x16_t)v13;
      double v14 = a5;
      double v15 = a3;
      int v16 = a4;
      while (2)
      {
        uint64_t v51 = v14;
        unint64_t v17 = 0;
        unint64_t v18 = v11++;
        uint64_t v53 = v15;
        unint64_t v54 = v11;
        while (1)
        {
          uint64_t v19 = 0;
          uint64_t v20 = v15;
          uint64_t v21 = v55;
          do
          {
            uint64_t v22 = v19;
            int v23 = v20;
            unint64_t v24 = v21 - 1;
            if (v21 - 1 >= a2 || a2 == v21) {
              break;
            }
            double v26 = fabs(*v20++);
            double v27 = v26 + fabs(v23[1]);
            double v28 = v27 + fabs(v16[v19]);
            ++v21;
            ++v19;
          }
          while (v28 != v27);
          double v29 = a3[v18];
          if (!v22) {
            break;
          }
          if (v17 == 30)
          {
            *((_DWORD *)this + 110) = v18;
            return;
          }
          double v30 = a4[v18];
          v13.f64[0] = (a3[v11] - v29) / (v30 + v30);
          int8x16_t v56 = (int8x16_t)v13;
          *(double *)v31.i64 = hypot(v13.f64[0], 1.0);
          float64x2_t v13 = (float64x2_t)vbslq_s8(v52, v31, v56);
          double v32 = *v23 - v29 + v30 / (*(double *)v56.i64 + v13.f64[0]);
          double v33 = 0.0;
          if (v24 <= v18)
          {
LABEL_19:
            a3[v18] = a3[v18] - v33;
            a4[v18] = v32;
          }
          else
          {
            double v34 = 1.0;
            double v35 = 1.0;
            while (1)
            {
              double v36 = &a4[v24];
              double v37 = *(v36 - 1);
              double v38 = v35 * v37;
              v13.f64[0] = hypot(v35 * v37, v32);
              *double v36 = v13.f64[0];
              if (v13.f64[0] == 0.0) {
                break;
              }
              double v39 = &a3[v24];
              double v40 = &a5[v24];
              double v41 = v34 * v37;
              double v35 = v38 / v13.f64[0];
              double v34 = v32 / v13.f64[0];
              double v42 = *v39 - v33;
              double v43 = v41 * (v34 + v34) + (*(v39 - 1) - v42) * v35;
              double v33 = v35 * v43;
              *double v39 = v42 + v35 * v43;
              double v32 = -(v41 - v34 * v43);
              double v44 = *(v40 - 1);
              double v45 = v34 * *v40 + v35 * v44;
              *(v40 - 1) = v34 * v44 - v35 * *v40;
              *double v40 = v45;
              if ((uint64_t)--v24 <= (uint64_t)v18) {
                goto LABEL_19;
              }
            }
            a3[v24] = a3[v24] - v33;
          }
          double v15 = v53;
          unint64_t v11 = v54;
          v16[v22] = 0.0;
          if (v17++ >= 0x1E) {
            goto LABEL_30;
          }
        }
        double v47 = a5[v18];
        if (v18)
        {
          uint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
          while (1)
          {
            double v49 = v15[v48];
            if (v29 >= v49) {
              break;
            }
            --v18;
            v15[v48 + 1] = v49;
            v51[v48 + 1] = v51[v48];
            --v48;
            if ((uint64_t)(v18 + 1) <= 1)
            {
              unint64_t v18 = 0;
              break;
            }
          }
        }
        a3[v18] = v29;
        a5[v18] = v47;
LABEL_30:
        ++v55;
        ++v16;
        ++v15;
        double v14 = v51 + 1;
        if (v11 != a2) {
          continue;
        }
        break;
      }
    }
  }
}

uint64_t LSMSVDSDImpl::error_bound(LSMSVDSDImpl *this, BOOL *a2)
{
  uint64_t result = cblas_idamax(*((_DWORD *)this + 109) + 1, *((const double **)this + 71), 1);
  uint64_t v5 = *((int *)this + 109);
  LODWORD(v6) = (2 * (int)v5) >> 1;
  if ((int)v6 > (int)result)
  {
    uint64_t v6 = (int)v6;
    uint64_t v7 = *((void *)this + 67);
    do
    {
      if (vabdd_f64(*(double *)(v7 + 8 * v6 - 8), *(double *)(v7 + 8 * v6)) < *((double *)this + 48)
                                                                             * fabs(*(double *)(v7 + 8 * v6)))
      {
        uint64_t v8 = *((void *)this + 71);
        double v9 = *(double *)(v8 + 8 * v6);
        double v10 = *((double *)this + 53);
        if (v9 > v10)
        {
          uint64_t v11 = v8 + 8 * v6;
          double v12 = *(double *)(v11 - 8);
          if (v12 > v10)
          {
            *(double *)(v11 - 8) = sqrt(v12 * v12 + v9 * v9);
            *(void *)(v8 + 8 * v6) = 0;
          }
        }
      }
      --v6;
    }
    while (v6 > (int)result);
  }
  float64x2_t v13 = (double *)*((void *)this + 67);
  if ((int)result >= 2)
  {
    uint64_t v14 = 0;
    do
    {
      if (vabdd_f64(v13[v14 + 2], v13[v14 + 1]) < *((double *)this + 48) * fabs(v13[v14 + 1]))
      {
        uint64_t v15 = *((void *)this + 71) + 8 * v14;
        double v16 = *(double *)(v15 + 8);
        double v17 = *((double *)this + 53);
        if (v16 > v17)
        {
          double v18 = *(double *)(v15 + 16);
          if (v18 > v17)
          {
            *(double *)(v15 + 16) = sqrt(v18 * v18 + v16 * v16);
            *(void *)(v15 + 8) = 0;
          }
        }
      }
      ++v14;
    }
    while ((int)result - 1 != v14);
  }
  *((_DWORD *)this + 111) = 0;
  if ((v5 & 0x80000000) == 0)
  {
    int v19 = 0;
    uint64_t v20 = 0;
    double v21 = v13[v5] - *v13;
    uint64_t v22 = *((void *)this + 71);
    do
    {
      double v23 = v21;
      if (v20 < v5) {
        double v21 = v13[v20 + 1] - v13[v20];
      }
      if (v21 >= v23) {
        double v24 = v23;
      }
      else {
        double v24 = v21;
      }
      double v25 = *(double *)(v22 + 8 * v20);
      if (v24 > v25)
      {
        double v25 = v25 * (v25 / v24);
        *(double *)(v22 + 8 * v20) = v25;
      }
      double v26 = v13[v20];
      if (v25 <= *((double *)this + 45) * 16.0 * fabs(v26))
      {
        *((_DWORD *)this + 111) = ++v19;
        if (!*a2)
        {
          BOOL v27 = *((double *)this + 49) < v26 && v26 < *((double *)this + 50);
          *a2 = v27;
        }
      }
      ++v20;
    }
    while (v5 + 1 != v20);
  }
  return result;
}

void LSMSVDSDImpl::startv(LSMSVDSDImpl *this)
{
  double v2 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 63), 1);
  uint64_t v3 = 0;
  uint64_t v11 = *((int *)this + 109) + 918273;
  do
  {
    if (v3 || *((int *)this + 109) > 0 || v2 == 0.0)
    {
      if (*((_DWORD *)this + 3))
      {
        unint64_t v4 = 0;
        do
        {
          *(double *)(*((void *)this + 63) + 8 * v4++) = LSMSVDSDImpl::random(this, &v11);
          unint64_t v5 = *((unsigned int *)this + 3);
        }
        while (v4 < v5);
      }
      else
      {
        LODWORD(v5) = 0;
      }
    }
    else
    {
      LODWORD(v5) = *((_DWORD *)this + 3);
    }
    cblas_dcopy(v5, *((const double **)this + 63), 1, *((double **)this + 95), 1);
    LSMSVDSDImpl::opb((void **)this, *((double **)this + 95), *((double **)this + 63));
    cblas_dcopy(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((double **)this + 95), 1);
    double v6 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((const double **)this + 95), 1);
    double v2 = v6;
    ++v3;
  }
  while (v6 <= 0.0 && v3 != 3);
  if (v6 <= 0.0)
  {
    *((_DWORD *)this + 110) = 0x2000;
  }
  else if (*((int *)this + 109) >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      cblas_dcopy(*((_DWORD *)this + 3), (const double *)(*((void *)this + 83) + 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v8 + 2)), 1, *((double **)this + 103), 1);
      double v9 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 95), 1, *((const double **)this + 103), 1);
      cblas_daxpy(*((_DWORD *)this + 3), -v9, *((const double **)this + 103), 1, *((double **)this + 63), 1);
      ++v8;
    }
    while (v8 < *((int *)this + 109));
    double v10 = cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 99), 1, *((const double **)this + 63), 1);
    cblas_daxpy(*((_DWORD *)this + 3), -v10, *((const double **)this + 91), 1, *((double **)this + 63), 1);
    cblas_dcopy(*((_DWORD *)this + 3), *((const double **)this + 63), 1, *((double **)this + 95), 1);
    cblas_ddot(*((_DWORD *)this + 3), *((const double **)this + 95), 1, *((const double **)this + 63), 1);
  }
}

double LSMSVDSDImpl::ortbnd(LSMSVDSDImpl *this, double result)
{
  uint64_t v3 = *((unsigned int *)this + 109);
  if ((int)v3 >= 1)
  {
    double v4 = *((double *)this + 52);
    if (v4 != 0.0 && v3 != 1)
    {
      **((double **)this + 1LSMVectorBase::~LSMVectorBase(this + 15) = *((double *)this + 46)
                                + ((**((double **)this + 107) - *(double *)(*((void *)this + 107) + 8 * v3))
                                 * **((double **)this + 111)
                                 + *(double *)(*((void *)this + 119) + 8)
                                 * *(double *)(*((void *)this + 111) + 8)
                                 - *(double *)(*((void *)this + 119) + 8 * v3) * **((double **)this + 115))
                                / v4;
      if (v3 >= 3)
      {
        uint64_t v6 = *((void *)this + 119);
        uint64_t v7 = *((void *)this + 107);
        uint64_t v8 = v3 - 2;
        double v9 = (double *)(*((void *)this + 115) + 8);
        double v10 = (double *)(v6 + 16);
        uint64_t v11 = (double *)(*((void *)this + 111) + 16);
        double v12 = (double *)(v7 + 8);
        do
        {
          double v13 = *v12++;
          double v14 = *(v11 - 2);
          double v15 = (v13 - *(double *)(v7 + 8 * v3)) * *(v11 - 1);
          double v16 = *v11++;
          *double v9 = (v15 + *v10 * v16 + *(v10 - 1) * v14 - *(double *)(v6 + 8 * v3) * *v9) / *((double *)this + 52)
              + *((double *)this + 46);
          ++v9;
          ++v10;
          --v8;
        }
        while (v8);
      }
    }
    double v17 = (double *)*((void *)this + 115);
    v17[(int)v3 - 1] = *((double *)this + 46);
    cblas_dswap(v3, v17, 1, *((double **)this + 111), 1);
    uint64_t result = *((double *)this + 46);
    *(double *)(*((void *)this + 111) + 8 * *((int *)this + 109)) = result;
  }
  return result;
}

void LSMSVDSDImpl::purge(LSMSVDSDImpl *this, uint64_t a2, double *a3, double *a4, double *a5, double *a6)
{
  uint64_t v6 = *((int *)this + 109);
  if (a2 + 2 <= v6)
  {
    int v13 = cblas_idamax(v6 + ~a2, (const double *)(*((void *)this + 111) + 8 * a2), 1);
    double v14 = *((double *)this + 47);
    if (fabs(*(double *)(*((void *)this + 111) + 8 * (a2 + v13))) > v14)
    {
      double v15 = *((double *)this + 52);
      char v16 = 1;
      double v17 = *((double *)this + 46) / v14;
      do
      {
        char v18 = v16;
        if (v15 > *((double *)this + 53))
        {
          double v19 = 0.0;
          double v20 = 0.0;
          if (*((int *)this + 109) > a2)
          {
            uint64_t v21 = a2;
            do
            {
              cblas_dcopy(*((_DWORD *)this + 3), (const double *)(*((void *)this + 83)+ 8 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v21 + 2)), 1, *((double **)this + 103), 1);
              double v22 = cblas_ddot(*((_DWORD *)this + 3), a6, 1, *((const double **)this + 103), 1);
              double v19 = v19 + fabs(v22);
              cblas_daxpy(*((_DWORD *)this + 3), -v22, *((const double **)this + 103), 1, a4, 1);
              double v23 = cblas_ddot(*((_DWORD *)this + 3), a5, 1, *((const double **)this + 103), 1);
              double v20 = v20 + fabs(v23);
              cblas_daxpy(*((_DWORD *)this + 3), -v23, *((const double **)this + 103), 1, a3, 1);
              ++v21;
            }
            while (v21 < *((int *)this + 109));
          }
          cblas_dcopy(*((_DWORD *)this + 3), a4, 1, a6, 1);
          double v24 = -cblas_ddot(*((_DWORD *)this + 3), a3, 1, a6, 1);
          cblas_daxpy(*((_DWORD *)this + 3), v24, a4, 1, a3, 1);
          cblas_dcopy(*((_DWORD *)this + 3), a3, 1, a5, 1);
          double v15 = sqrt(cblas_ddot(*((_DWORD *)this + 3), a5, 1, a3, 1));
          *((double *)this + 52) = v15;
          if (v19 <= v17 && v20 + fabs(v24) <= v17 * v15) {
            break;
          }
        }
        char v16 = 0;
      }
      while ((v18 & 1) != 0);
      uint64_t v25 = *((int *)this + 109);
      BOOL v26 = v25 < a2;
      uint64_t v27 = v25 - a2;
      if (!v26)
      {
        uint64_t v28 = v27 + 1;
        double v29 = (void *)(*((void *)this + 115) + 8 * a2);
        double v30 = (void *)(*((void *)this + 111) + 8 * a2);
        do
        {
          *v30++ = *((void *)this + 46);
          *v29++ = *((void *)this + 46);
          --v28;
        }
        while (v28);
      }
    }
  }
}

double LSMSVDSDImpl::random(LSMSVDSDImpl *this, uint64_t *a2)
{
  if (*((void *)this + 57))
  {
    uint64_t v2 = *((void *)this + 58);
  }
  else
  {
    *((void *)this + 5LSMVectorBase::~LSMVectorBase(this + 7) = 0x40000000;
    *((_OWORD *)this + 29) = xmmword_2177DCED0;
    *((void *)this + 60) = 1693666955;
    *((void *)this + 61) = 0x41D0000000000000;
    *((void *)this + 62) = 0x3E00000000000000;
    uint64_t v2 = 843314861;
  }
  uint64_t v3 = v2 * *a2;
  *a2 = v3;
  if (v3 > *((void *)this + 60))
  {
    v3 -= 2 * *((void *)this + 57);
    *a2 = v3;
  }
  uint64_t v4 = *((void *)this + 59);
  BOOL v5 = __OFADD__(v4, v3);
  uint64_t v6 = v4 + v3;
  *a2 = v6;
  if (v6 < 0 != v5) {
    uint64_t v7 = v6 + 1;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = *((void *)this + 57);
  if (v8 < v7 >> 1)
  {
    v6 -= 2 * v8;
    *a2 = v6;
  }
  if (v6 < 0)
  {
    v6 += 2 * *((void *)this + 57);
    *a2 = v6;
  }
  return *((double *)this + 62) * (double)v6;
}

void LSMSVDSDTImpl::~LSMSVDSDTImpl(void **this)
{
  LSMSVDSDImpl::~LSMSVDSDImpl(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177D3B2C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C404F0F5D55);
  _Unwind_Resume(a1);
}

void LSMSVDSDImpl::~LSMSVDSDImpl(void **this)
{
  LSMSVDSDImpl::~LSMSVDSDImpl(this);
  JUMPOUT(0x21D44C230);
}

{
  uint64_t vars8;

  *this = &unk_26C7C6AD0;
  LSMVectorBase::~LSMVectorBase(this + 119);
  LSMVectorBase::~LSMVectorBase(this + 115);
  LSMVectorBase::~LSMVectorBase(this + 111);
  LSMVectorBase::~LSMVectorBase(this + 107);
  LSMVectorBase::~LSMVectorBase(this + 103);
  LSMVectorBase::~LSMVectorBase(this + 99);
  LSMVectorBase::~LSMVectorBase(this + 95);
  LSMVectorBase::~LSMVectorBase(this + 91);
  LSMVectorBase::~LSMVectorBase(this + 87);
  LSMVectorBase::~LSMVectorBase(this + 83);
  LSMVectorBase::~LSMVectorBase(this + 79);
  LSMVectorBase::~LSMVectorBase(this + 75);
  LSMVectorBase::~LSMVectorBase(this + 71);
  LSMVectorBase::~LSMVectorBase(this + 67);
  LSMVectorBase::~LSMVectorBase(this + 63);
  LSMVectorBase::~LSMVectorBase(this + 41);
  LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<double>>>::~LSMVector((LSMVectorBase *)(this + 37));
  LSMSVD::~LSMSVD(this);
}

void sub_2177D3B9C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C404F0F5D55);
  _Unwind_Resume(a1);
}

void LSMSVDSDImpl::LSMSVDSDImpl(LSMSVDSDImpl *this)
{
  LSMSVD::LSMSVD(this);
  void *v2 = &unk_26C7C6AD0;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(v2 + 37), 64);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 328), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 504), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 536), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 568), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 600), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 632), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 664), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 696), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 728), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 760), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 792), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 824), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 856), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 888), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 920), 8);
  LSMVectorBase::LSMVectorBase((LSMSVDSDImpl *)((char *)this + 952), 8);
}

void sub_2177D3D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void **a10, void **a11, void **a12, void **a13, void **a14, void **a15, LSMVectorBase *a16)
{
  LSMVectorBase::~LSMVectorBase(v23);
  LSMVectorBase::~LSMVectorBase(v22);
  LSMVectorBase::~LSMVectorBase(v21);
  LSMVectorBase::~LSMVectorBase(v20);
  LSMVectorBase::~LSMVectorBase(v19);
  LSMVectorBase::~LSMVectorBase(v18);
  LSMVectorBase::~LSMVectorBase(v17);
  LSMVectorBase::~LSMVectorBase(v25);
  LSMVectorBase::~LSMVectorBase(v24);
  LSMVectorBase::~LSMVectorBase(a10);
  LSMVectorBase::~LSMVectorBase(a11);
  LSMVectorBase::~LSMVectorBase(a12);
  LSMVectorBase::~LSMVectorBase(a13);
  LSMVectorBase::~LSMVectorBase(a14);
  LSMVectorBase::~LSMVectorBase(a15);
  LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<double>>>::~LSMVector(a16);
  LSMSVD::~LSMSVD(v16);
  _Unwind_Resume(a1);
}

void LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<double>>>::~LSMVector(LSMVectorBase *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    uint64_t v3 = *(void ***)this;
    uint64_t v4 = v2 << 6;
    do
    {
      LSMVectorBase::~LSMVectorBase(v3 + 4);
      LSMVectorBase::~LSMVectorBase(v3);
      v3 += 8;
      v4 -= 64;
    }
    while (v4);
  }
  LSMVectorBase::~LSMVectorBase((void **)this);
}

void sub_2177D3ED4(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void sub_2177D3FD8(_Unwind_Exception *a1)
{
  LSMSVD::~LSMSVD(v1);
  _Unwind_Resume(a1);
}

LSMVectorBase *std::pair<LSMVector<unsigned int>,LSMVector<double>>::pair[abi:ne180100](LSMVectorBase *a1)
{
  LSMVectorBase::LSMVectorBase(a1, 4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(v2 + 32), 8);
  return a1;
}

void sub_2177D4128(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void LSMSVDSparseFloat::Create(LSMSVDSparseFloat *this)
{
}

void sub_2177D41B4(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40FA3C5B96);
  _Unwind_Resume(a1);
}

unsigned int *LSMSVDSFImpl::StartColumns(unsigned int *this)
{
  uint64_t v1 = (uint64_t)this;
  unint64_t v2 = this[3];
  unint64_t v3 = *((void *)this + 40);
  if (v3 >= v2)
  {
    unsigned int v4 = this[3];
  }
  else
  {
    this = (unsigned int *)LSMVectorBase::Allocate((const void **)this + 37, v2, 1);
    unint64_t v3 = *(void *)(v1 + 320);
    unsigned int v4 = *(_DWORD *)(v1 + 12);
  }
  if (v3 >= v2) {
    unint64_t v3 = v2;
  }
  *(void *)(v1 + 312) = v3;
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      this = (unsigned int *)std::pair<LSMVector<unsigned int>,LSMVector<float>>::pair[abi:ne180100]((LSMVectorBase *)(*(void *)(v1 + 296) + v5));
      ++v6;
      v5 += 64;
    }
    while (v6 < *(unsigned int *)(v1 + 12));
  }
  return this;
}

unsigned int *LSMSVDSFTImpl::StartColumns(unsigned int *this)
{
  uint64_t v1 = (uint64_t)this;
  unint64_t v2 = this[2];
  unint64_t v3 = *((void *)this + 40);
  if (v3 >= v2)
  {
    unsigned int v4 = this[2];
  }
  else
  {
    this = (unsigned int *)LSMVectorBase::Allocate((const void **)this + 37, v2, 1);
    unint64_t v3 = *(void *)(v1 + 320);
    unsigned int v4 = *(_DWORD *)(v1 + 8);
  }
  if (v3 >= v2) {
    unint64_t v3 = v2;
  }
  *(void *)(v1 + 312) = v3;
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      this = (unsigned int *)std::pair<LSMVector<unsigned int>,LSMVector<float>>::pair[abi:ne180100]((LSMVectorBase *)(*(void *)(v1 + 296) + v5));
      ++v6;
      v5 += 64;
    }
    while (v6 < *(unsigned int *)(v1 + 8));
  }
  return this;
}

const void **LSMSVDSFImpl::ColumnDimension(LSMSVDSFImpl *this, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *((void *)this + 37);
  uint64_t result = (const void **)(v6 + (a2 << 6));
  if ((unint64_t)result[3] < a3)
  {
    uint64_t result = (const void **)LSMVectorBase::Allocate(result, a3, 1);
    uint64_t v6 = *((void *)this + 37);
  }
  uint64_t v8 = v6 + (a2 << 6);
  if (*(void *)(v8 + 56) < a3)
  {
    return (const void **)LSMVectorBase::Allocate((const void **)(v8 + 32), a3, 1);
  }
  return result;
}

float LSMSVDSFImpl::ProcessElement(LSMSVDSFImpl *this, int a2, uint64_t a3, double a4)
{
  uint64_t v8 = (void *)(*((void *)this + 37) + (a3 << 6));
  LSMVectorBase::Append(v8);
  *(_DWORD *)(*v8 + 4 * v8[2] - 4) = a2;
  uint64_t v9 = *((void *)this + 37) + (a3 << 6);
  LSMVectorBase::Append((void *)(v9 + 32));
  *(float *)&a4 = a4;
  *(_DWORD *)(*(void *)(v9 + 32) + 4 * *(void *)(v9 + 48) - 4) = LODWORD(a4);
  return result;
}

float LSMSVDSFTImpl::ProcessElement(LSMSVDSFTImpl *this, uint64_t a2, int a3, double a4)
{
  uint64_t v8 = (void *)(*((void *)this + 37) + (a2 << 6));
  LSMVectorBase::Append(v8);
  *(_DWORD *)(*v8 + 4 * v8[2] - 4) = a3;
  uint64_t v9 = *((void *)this + 37) + (a2 << 6);
  LSMVectorBase::Append((void *)(v9 + 32));
  *(float *)&a4 = a4;
  *(_DWORD *)(*(void *)(v9 + 32) + 4 * *(void *)(v9 + 48) - 4) = LODWORD(a4);
  return result;
}

uint64_t LSMSVDSFImpl::Dump(LSMSVDSFImpl *this)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  time_t v21 = 0;
  time(&v21);
  unint64_t v2 = localtime(&v21);
  strftime(__filename, 0x50uLL, "matrix_%d%b%C_%H%M%S", v2);
  unint64_t v3 = fopen(__filename, "w");
  unsigned int v4 = (char *)v3;
  uint64_t v5 = *((unsigned int *)this + 3);
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (uint64_t *)(*((void *)this + 37) + 16);
    uint64_t v8 = *((unsigned int *)this + 3);
    do
    {
      uint64_t v9 = *v7;
      v7 += 8;
      v6 += v9;
      --v8;
    }
    while (v8);
  }
  else
  {
    uint64_t v6 = 0;
  }
  fprintf(v3, "%-72s%-8s\n#\nRRA%14lu%14lu%14lu%14lu\n%-16s%-16s%-20s%-20s\n", __filename, "LSM", *((unsigned int *)this + 2), v5, v6, 0, "(16I5)", "(16I5)", "(1P,5D16.9f)", "(1P,5D16.9)");
  double v22 = v4;
  v23[10] = v23;
  if (*((_DWORD *)this + 3))
  {
    unint64_t v10 = 0;
    uint64_t v11 = 1;
    uint64_t v12 = 16;
    do
    {
      LSMCardPunch::Punch(&v22, " %lu", v11);
      v11 += *(void *)(*((void *)this + 37) + v12);
      ++v10;
      v12 += 64;
    }
    while (v10 < *((unsigned int *)this + 3));
  }
  else
  {
    uint64_t v11 = 1;
  }
  LSMCardPunch::Punch(&v22, " %lu", v11);
  LSMCardPunch::Flush((uint64_t)&v22);
  if (*((_DWORD *)this + 3))
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(void *)(*((void *)this + 37) + (v13 << 6) + 16);
      if (v14)
      {
        for (uint64_t i = 0; i != v14; ++i)
          LSMCardPunch::Punch(&v22, " %lu", (*(_DWORD *)(*(void *)(*((void *)this + 37) + (v13 << 6)) + 4 * i) + 1));
      }
      LSMCardPunch::Flush((uint64_t)&v22);
      ++v13;
      unint64_t v16 = *((unsigned int *)this + 3);
    }
    while (v13 < v16);
    if (v16)
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = *(void *)(*((void *)this + 37) + (v17 << 6) + 48);
        if (v18)
        {
          for (uint64_t j = 0; j != v18; ++j)
            LSMCardPunch::Punch(&v22, " %14g", *(float *)(*(void *)(*((void *)this + 37) + (v17 << 6) + 32) + 4 * j));
        }
        LSMCardPunch::Flush((uint64_t)&v22);
        ++v17;
      }
      while (v17 < *((unsigned int *)this + 3));
    }
  }
  return fclose((FILE *)v4);
}

int32x2_t LSMSVDSFTImpl::Dump(int32x2_t *this)
{
  this[1] = vrev64_s32(this[1]);
  LSMSVDSFImpl::Dump((LSMSVDSFImpl *)this);
  int32x2_t result = vrev64_s32(this[1]);
  this[1] = result;
  return result;
}

void LSMSVDSFImpl::Compute(LSMSVDSFImpl *this)
{
  int64_t v2 = *((void *)this + 32);
  if (!v2) {
    int64_t v2 = (3 * *((_DWORD *)this + 4));
  }
  unint64_t v3 = *((unsigned int *)this + 3);
  if (v2 >= (uint64_t)v3) {
    LODWORD(v2) = *((_DWORD *)this + 3);
  }
  *((_DWORD *)this + 99) = v2;
  *((void *)this + 52) = 0;
  *(_OWORD *)((char *)this + 376) = xmmword_2177DCF20;
  unsigned int v4 = (void **)((char *)this + 456);
  unint64_t v5 = *((void *)this + 60);
  unint64_t v6 = v3;
  if (v5 < v3)
  {
    LSMVectorBase::Allocate((const void **)this + 57, v3, 1);
    unint64_t v5 = *((void *)this + 60);
    unint64_t v6 = *((unsigned int *)this + 3);
  }
  if (v5 >= v3) {
    unint64_t v5 = v3;
  }
  *((void *)this + 59) = v5;
  double v42 = (const void **)((char *)this + 488);
  unint64_t v7 = *((void *)this + 64);
  unint64_t v8 = v6;
  if (v7 < v6)
  {
    LSMVectorBase::Allocate(v42, v6, 1);
    unint64_t v7 = *((void *)this + 64);
    unint64_t v8 = *((unsigned int *)this + 3);
  }
  if (v7 >= v6) {
    unint64_t v7 = v6;
  }
  *((void *)this + 6LSMVectorBase::~LSMVectorBase(this + 3) = v7;
  uint64_t v9 = (void **)((char *)this + 520);
  unint64_t v10 = *((void *)this + 68);
  unint64_t v11 = v8;
  if (v10 < v8)
  {
    LSMVectorBase::Allocate((const void **)this + 65, v8, 1);
    unint64_t v10 = *((void *)this + 68);
    unint64_t v11 = *((unsigned int *)this + 3);
  }
  if (v10 >= v8) {
    unint64_t v10 = v8;
  }
  *((void *)this + 6LSMVectorBase::~LSMVectorBase(this + 7) = v10;
  uint64_t v12 = (void **)((char *)this + 552);
  unint64_t v13 = *((void *)this + 72);
  if (v13 < v11)
  {
    LSMVectorBase::Allocate((const void **)this + 69, v11, 1);
    unint64_t v13 = *((void *)this + 72);
  }
  if (v13 >= v11) {
    unint64_t v13 = v11;
  }
  *((void *)this + 71) = v13;
  uint64_t v14 = (void **)((char *)this + 584);
  unint64_t v15 = *((unsigned int *)this + 2);
  unint64_t v16 = *((void *)this + 76);
  if (v16 < v15)
  {
    LSMVectorBase::Allocate((const void **)this + 73, *((unsigned int *)this + 2), 1);
    unint64_t v16 = *((void *)this + 76);
  }
  if (v16 >= v15) {
    unint64_t v16 = v15;
  }
  *((void *)this + 75) = v16;
  unint64_t v17 = (void **)((char *)this + 616);
  unint64_t v18 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (*((int *)this + 99) + 2);
  unint64_t v19 = *((void *)this + 80);
  if (v19 < v18)
  {
    LSMVectorBase::Allocate((const void **)this + 77, ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (*((int *)this + 99) + 2), 1);
    unint64_t v19 = *((void *)this + 80);
  }
  if (v19 >= v18) {
    unint64_t v19 = v18;
  }
  *((void *)this + 79) = v19;
  uint64_t v20 = *((void *)this + 59);
  if (v20 >= 1) {
    bzero(*v4, 4 * (v20 - ((v20 & 0x3FFFFFFFFFFFFFFFLL) != 0)) + 4);
  }
  LSMSVDSFImpl::landr(this);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__Y, 4, *((unsigned int *)this + 2));
  uint64_t v21 = *((int *)this + 102);
  if ((int)v21 >= 1)
  {
    for (uint64_t i = 0; i < v21; ++i)
    {
      LSMSVDSFImpl::opb((void **)this, (float *)(*((void *)this + 41) + 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * i), __Y[0]);
      float v23 = cblas_sdot(*((_DWORD *)this + 3), (const float *)(*((void *)this + 41) + 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * i), 1, __Y[0], 1);
      cblas_saxpy(*((_DWORD *)this + 3), -v23, (const float *)(*((void *)this + 41) + 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * i), 1, __Y[0], 1);
      float v24 = cblas_sdot(*((_DWORD *)this + 3), __Y[0], 1, __Y[0], 1);
      float v25 = sqrtf(v23);
      LSMSVDSFImpl::opa(this, (float *)(*((void *)this + 41) + 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * i), __Y[0]);
      cblas_sscal(*((_DWORD *)this + 2), 1.0 / v25, __Y[0], 1);
      *(float *)(*((void *)this + 65) + 4 * i) = (float)(1.0 / v25) * sqrtf(v24);
      *(float *)(*((void *)this + 11) + 4 * i) = v25;
      if (v47) {
        memmove((void *)(*((void *)this + 3) + 4 * ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * i), __Y[0], 4 * v47);
      }
      uint64_t v21 = *((int *)this + 102);
    }
  }
  if (v21 < 1)
  {
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = (float *)(*((void *)this + 11) + 4 * v21 - 4);
    while (*v27 < 0.00000001)
    {
      ++v26;
      --v27;
      if (v21 == v26)
      {
        uint64_t v26 = v21;
        break;
      }
    }
  }
  uint64_t v28 = v21 - v26;
  if (v21 - v26 >= (unint64_t)*((unsigned int *)this + 4)) {
    uint64_t v28 = *((unsigned int *)this + 4);
  }
  *((_DWORD *)this + 4) = v28;
  if (v28 < v21)
  {
    uint64_t v29 = (v28 + 3) & 0x1FFFFFFFCLL;
    uint64_t v41 = v26 + v28;
    if (*((_DWORD *)this + 3))
    {
      uint64_t v30 = 0;
      unint64_t v31 = 0;
      uint64_t v32 = 4 * v21 - 4 * (v26 + v28);
      unint64_t v33 = (4 * (v28 + 3)) & 0xFFFFFFFFFFFFFFF0;
      do
      {
        memmove((void *)(*((void *)this + 7) + v30), (const void *)(*((void *)this + 7) + v32), 4 * *((unsigned int *)this + 4));
        ++v31;
        unint64_t v34 = *((unsigned int *)this + 3);
        v32 += (4 * (v21 + 3)) & 0xFFFFFFFFFFFFFFF0;
        v30 += v33;
      }
      while (v31 < v34);
    }
    else
    {
      unint64_t v34 = 0;
    }
    unint64_t v35 = v34 * v29;
    unint64_t v36 = *((void *)this + 10);
    uint64_t v9 = (void **)((char *)this + 520);
    unsigned int v4 = (void **)((char *)this + 456);
    uint64_t v14 = (void **)((char *)this + 584);
    uint64_t v12 = (void **)((char *)this + 552);
    unint64_t v17 = (void **)((char *)this + 616);
    if (v36 < v35)
    {
      LSMVectorBase::Allocate((const void **)this + 7, v35, 1);
      unint64_t v36 = *((void *)this + 10);
    }
    if (v36 >= v35) {
      unint64_t v36 = v35;
    }
    *((void *)this + 9) = v36;
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)v45, (LSMSVDSFImpl *)((char *)this + 56));
    LSMVectorBase::Swap((uint64_t *)v45, (LSMSVDSFImpl *)((char *)this + 56));
    LSMVectorBase::clear(v45);
    memmove(*((void **)this + 11), (const void *)(*((void *)this + 11) + 4 * (v21 - v41)), 4 * *((unsigned int *)this + 4));
    unint64_t v37 = *((unsigned int *)this + 4);
    unint64_t v38 = *((void *)this + 14);
    if (v38 < v37)
    {
      LSMVectorBase::Allocate((const void **)this + 11, *((unsigned int *)this + 4), 1);
      unint64_t v38 = *((void *)this + 14);
    }
    if (v38 >= v37) {
      unint64_t v38 = v37;
    }
    *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v38;
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)v44, (LSMSVDSFImpl *)((char *)this + 88));
    LSMVectorBase::Swap((uint64_t *)v44, (LSMSVDSFImpl *)((char *)this + 88));
    LSMVectorBase::clear(v44);
    memmove(*((void **)this + 3), (const void *)(*((void *)this + 3) + 4 * ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * (v21 - v41)), (4 * (*((_DWORD *)this + 4) * *((_DWORD *)this + 2)) + 12) & 0x7FFFFFFF0);
    unint64_t v39 = ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 4);
    unint64_t v40 = *((void *)this + 6);
    if (v40 < v39)
    {
      LSMVectorBase::Allocate((const void **)this + 3, ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 4), 1);
      unint64_t v40 = *((void *)this + 6);
    }
    if (v40 >= v39) {
      unint64_t v40 = v39;
    }
    *((void *)this + 5) = v40;
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)v43, (LSMSVDSFImpl *)((char *)this + 24));
    LSMVectorBase::Swap((uint64_t *)v43, (LSMSVDSFImpl *)((char *)this + 24));
    LSMVectorBase::clear(v43);
    LSMVectorBase::~LSMVectorBase(v43);
    LSMVectorBase::~LSMVectorBase(v44);
    LSMVectorBase::~LSMVectorBase(v45);
  }
  LSMVectorBase::clear(v4);
  LSMVectorBase::clear((void **)v42);
  LSMVectorBase::clear(v9);
  LSMVectorBase::clear(v12);
  LSMVectorBase::clear(v14);
  LSMVectorBase::clear(v17);
  LSMVectorBase::clear((void **)this + 41);
  LSMVectorBase::~LSMVectorBase((void **)__Y);
}

void sub_2177D4D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
}

void LSMSVDSFImpl::landr(LSMSVDSFImpl *this)
{
  unint64_t v2 = *((unsigned int *)this + 3);
  *((_DWORD *)this + 90) = 872415232;
  *((float *)this + 91) = sqrtf((float)v2) * 0.00000011921;
  *((void *)this + 46) = 0x36D744FC39B504F3;
  unint64_t v3 = (void **)((char *)this + 456);
  unint64_t v4 = *((void *)this + 60);
  unint64_t v5 = v2;
  if (v4 < v2)
  {
    LSMVectorBase::Allocate((const void **)this + 57, v2, 1);
    unint64_t v4 = *((void *)this + 60);
    unint64_t v5 = *((unsigned int *)this + 3);
  }
  if (v4 >= v2) {
    unint64_t v4 = v2;
  }
  *((void *)this + 59) = v4;
  unint64_t v6 = *((void *)this + 84);
  unint64_t v7 = v5;
  if (v6 < v5)
  {
    LSMVectorBase::Allocate((const void **)this + 81, v5, 1);
    unint64_t v6 = *((void *)this + 84);
    unint64_t v7 = *((unsigned int *)this + 3);
  }
  if (v6 >= v5) {
    unint64_t v6 = v5;
  }
  *((void *)this + 8LSMVectorBase::~LSMVectorBase(this + 3) = v6;
  unint64_t v8 = *((void *)this + 88);
  unint64_t v9 = v7;
  if (v8 < v7)
  {
    LSMVectorBase::Allocate((const void **)this + 85, v7, 1);
    unint64_t v8 = *((void *)this + 88);
    unint64_t v9 = *((unsigned int *)this + 3);
  }
  if (v8 >= v7) {
    unint64_t v8 = v7;
  }
  *((void *)this + 8LSMVectorBase::~LSMVectorBase(this + 7) = v8;
  unint64_t v10 = *((void *)this + 92);
  unint64_t v11 = v9;
  if (v10 < v9)
  {
    LSMVectorBase::Allocate((const void **)this + 89, v9, 1);
    unint64_t v10 = *((void *)this + 92);
    unint64_t v11 = *((unsigned int *)this + 3);
  }
  if (v10 >= v9) {
    unint64_t v10 = v9;
  }
  *((void *)this + 91) = v10;
  unint64_t v12 = *((void *)this + 96);
  unint64_t v13 = v11;
  if (v12 < v11)
  {
    LSMVectorBase::Allocate((const void **)this + 93, v11, 1);
    unint64_t v12 = *((void *)this + 96);
    unint64_t v13 = *((unsigned int *)this + 3);
  }
  if (v12 >= v11) {
    unint64_t v12 = v11;
  }
  *((void *)this + 95) = v12;
  unint64_t v14 = *((void *)this + 100);
  if (v14 < v13)
  {
    LSMVectorBase::Allocate((const void **)this + 97, v13, 1);
    unint64_t v14 = *((void *)this + 100);
  }
  if (v14 >= v13) {
    unint64_t v14 = v13;
  }
  *((void *)this + 99) = v14;
  int v15 = *((_DWORD *)this + 99);
  unint64_t v16 = v15;
  unint64_t v17 = *((void *)this + 104);
  if (v17 < v15)
  {
    LSMVectorBase::Allocate((const void **)this + 101, v15, 1);
    unint64_t v17 = *((void *)this + 104);
    int v15 = *((_DWORD *)this + 99);
  }
  unint64_t v18 = v15;
  if (v17 >= v16) {
    unint64_t v17 = v16;
  }
  *((void *)this + 10LSMVectorBase::~LSMVectorBase(this + 3) = v17;
  unint64_t v19 = *((void *)this + 108);
  unint64_t v20 = v15;
  if (v19 < v15)
  {
    LSMVectorBase::Allocate((const void **)this + 105, v15, 1);
    unint64_t v19 = *((void *)this + 108);
    int v15 = *((_DWORD *)this + 99);
    unint64_t v20 = v15;
  }
  if (v19 >= v18) {
    unint64_t v19 = v18;
  }
  *((void *)this + 10LSMVectorBase::~LSMVectorBase(this + 7) = v19;
  unint64_t v21 = *((void *)this + 112);
  if (v21 < v20)
  {
    LSMVectorBase::Allocate((const void **)this + 109, v20, 1);
    unint64_t v21 = *((void *)this + 112);
    int v15 = *((_DWORD *)this + 99);
  }
  if (v21 >= v20) {
    unint64_t v21 = v20;
  }
  *((void *)this + 111) = v21;
  unint64_t v22 = v15 + 1;
  unint64_t v23 = *((void *)this + 116);
  if (v23 < v22)
  {
    LSMVectorBase::Allocate((const void **)this + 113, v22, 1);
    unint64_t v23 = *((void *)this + 116);
  }
  float v24 = v3;
  if (v23 >= v22) {
    unint64_t v23 = v22;
  }
  *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 15) = v23;
  LSMSVDSFImpl::lanso(this);
  unint64_t v25 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((int *)this + 102);
  unint64_t v26 = *((void *)this + 44);
  if (v26 < v25)
  {
    LSMVectorBase::Allocate((const void **)this + 41, ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((int *)this + 102), 1);
    unint64_t v26 = *((void *)this + 44);
  }
  if (v26 >= v25) {
    unint64_t v26 = v25;
  }
  *((void *)this + 4LSMVectorBase::~LSMVectorBase(this + 3) = v26;
  bzero(*((void **)this + 41), 4 * v26);
  unint64_t v27 = *((int *)this + 102);
  unint64_t v28 = ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * v27;
  unint64_t v29 = *((void *)this + 6);
  if (v29 < v28)
  {
    LSMVectorBase::Allocate((const void **)this + 3, ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * v27, 1);
    unint64_t v29 = *((void *)this + 6);
    unint64_t v27 = *((int *)this + 102);
  }
  if (v29 >= v28) {
    unint64_t v29 = v28;
  }
  *((void *)this + 5) = v29;
  unint64_t v30 = ((v27 + 3) & 0xFFFFFFFFFFFFFFFCLL) * *((unsigned int *)this + 3);
  unint64_t v31 = *((void *)this + 10);
  if (v31 < v30)
  {
    LSMVectorBase::Allocate((const void **)this + 7, ((v27 + 3) & 0xFFFFFFFFFFFFFFFCLL) * *((unsigned int *)this + 3), 1);
    unint64_t v31 = *((void *)this + 10);
    unint64_t v27 = *((int *)this + 102);
  }
  if (v31 >= v30) {
    unint64_t v31 = v30;
  }
  *((void *)this + 9) = v31;
  unint64_t v32 = *((void *)this + 14);
  if (v32 < v27)
  {
    LSMVectorBase::Allocate((const void **)this + 11, v27, 1);
    unint64_t v32 = *((void *)this + 14);
  }
  if (v32 >= v27) {
    unint64_t v32 = v27;
  }
  *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v32;
  float v33 = fabsf(*((float *)this + 96));
  if (v33 < *((float *)this + 93)) {
    float v33 = *((float *)this + 93);
  }
  *((float *)this + 96) = v33;
  LSMSVDSFImpl::ritvec(this);
  LSMVectorBase::clear(v24);
  LSMVectorBase::clear((void **)this + 81);
  LSMVectorBase::clear((void **)this + 85);
  LSMVectorBase::clear((void **)this + 89);
  LSMVectorBase::clear((void **)this + 93);
  LSMVectorBase::clear((void **)this + 97);
  LSMVectorBase::clear((void **)this + 101);
  LSMVectorBase::clear((void **)this + 105);
  LSMVectorBase::clear((void **)this + 109);
  LSMVectorBase::clear((void **)this + 113);
}

void LSMSVDSFImpl::opb(void **this, float *a2, float *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if (v6) {
    bzero(this[73], 4 * v6);
  }
  uint64_t v7 = *((unsigned int *)this + 3);
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = (char *)this[37];
    unint64_t v10 = (float *)this[73];
    do
    {
      unint64_t v11 = &v9[64 * v8];
      uint64_t v12 = *((void *)v11 + 2);
      float v13 = *a2++;
      float v14 = v13;
      if (v12 >= 1)
      {
        int v15 = *(int **)v11;
        unint64_t v16 = *(void *)v11 + 4 * v12;
        unint64_t v17 = (float *)*((void *)v11 + 4);
        do
        {
          float v18 = *v17++;
          float v19 = v18;
          int v20 = *v15++;
          v10[v20] = v10[v20] + (float)(v19 * v14);
        }
        while ((unint64_t)v15 < v16);
      }
      ++v8;
    }
    while (v8 != v7);
    uint64_t v21 = 0;
    unint64_t v22 = (char *)this[37];
    unint64_t v23 = (float *)this[73];
    do
    {
      float v24 = &v22[64 * v21];
      uint64_t v25 = *((void *)v24 + 2);
      if (v25 < 1)
      {
        float v29 = 0.0;
      }
      else
      {
        unint64_t v26 = *(int **)v24;
        unint64_t v27 = *(void *)v24 + 4 * v25;
        unint64_t v28 = (float *)*((void *)v24 + 4);
        float v29 = 0.0;
        do
        {
          float v30 = *v28++;
          float v31 = v30;
          int v32 = *v26++;
          float v29 = v29 + (float)(v31 * v23[v32]);
        }
        while ((unint64_t)v26 < v27);
      }
      *a3++ = v29;
      ++v21;
    }
    while (v21 != v7);
  }
}

void LSMSVDSFImpl::opa(LSMSVDSFImpl *this, float *a2, float *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if (v6) {
    bzero(a3, 4 * v6);
  }
  uint64_t v7 = *((unsigned int *)this + 3);
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *((void *)this + 37);
    do
    {
      unint64_t v10 = (int **)(v9 + (v8 << 6));
      uint64_t v11 = (uint64_t)v10[2];
      float v12 = *a2++;
      float v13 = v12;
      if (v11 >= 1)
      {
        float v14 = *v10;
        unint64_t v15 = (unint64_t)&(*v10)[v11];
        unint64_t v16 = (float *)v10[4];
        do
        {
          float v17 = *v16++;
          float v18 = v17;
          int v19 = *v14++;
          a3[v19] = a3[v19] + (float)(v18 * v13);
        }
        while ((unint64_t)v14 < v15);
      }
      ++v8;
    }
    while (v8 != v7);
  }
}

void LSMSVDSFTImpl::Compute(int32x2_t *this)
{
  this[1] = vrev64_s32(this[1]);
  LSMSVDSFImpl::Compute((LSMSVDSFImpl *)this);
  LSMSVD::TransposeUV(this);
}

uint64_t datx(uint64_t result, float a2, float *a3, float *a4)
{
  if (result >= 1 && a2 != 0.0)
  {
    do
    {
      float v4 = *a3++;
      *a4++ = v4 * a2;
      --result;
    }
    while (result);
  }
  return result;
}

uint64_t dsort2(uint64_t result, uint64_t a2, float *a3, float *a4)
{
  if (result)
  {
    do
    {
      if (result < a2)
      {
        float v4 = &a3[result];
        uint64_t v5 = result;
        uint64_t v6 = &a4[result];
        do
        {
          for (uint64_t i = v5 - result; i >= 0; i -= result)
          {
            float v8 = a3[i];
            float v9 = v4[i];
            if (v8 <= v9) {
              break;
            }
            a3[i] = v9;
            v4[i] = v8;
            float v10 = a4[i];
            a4[i] = v6[i];
            v6[i] = v10;
          }
          ++v5;
        }
        while (v5 != a2);
      }
      if (result >= 0) {
        uint64_t v11 = result;
      }
      else {
        uint64_t v11 = result + 1;
      }
      unint64_t v12 = result + 1;
      int32x2_t result = v11 >> 1;
    }
    while (v12 > 2);
  }
  return result;
}

void LSMSVDSFImpl::lanso(LSMSVDSFImpl *this)
{
  *((void *)this + 50) = 0;
  LSMSVDSFImpl::stpone(this);
  if (*((float *)this + 97) != 0.0 && !*((_DWORD *)this + 101))
  {
    **((_DWORD **)this + 105) = *((_DWORD *)this + 91);
    **((_DWORD **)this + 109) = *((_DWORD *)this + 91);
    int v33 = 0;
    unint64_t v2 = *((unsigned int *)this + 4);
    int64_t v3 = *((int *)this + 99);
    BOOL v32 = 0;
    if (v2)
    {
      int v4 = 0;
      uint64_t v5 = 8;
      if (v2 > 8) {
        uint64_t v5 = v2;
      }
      int64_t v6 = v5 + v2;
      if (v6 >= v3) {
        int v7 = v3;
      }
      else {
        int v7 = v6;
      }
      int v8 = 1;
      do
      {
        if (*((float *)this + 97) <= *((float *)this + 98)) {
          *((_DWORD *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = 0;
        }
        LSMSVDSFImpl::lanczos_step(this, v8, v7, &v33, &v32);
        if (v32) {
          int v7 = *((_DWORD *)this + 100);
        }
        int v9 = v7 - 1;
        *((_DWORD *)this + 100) = v7 - 1;
        *(_DWORD *)(*((void *)this + 113) + 4 * vLSMVectorBase::~LSMVectorBase(this + 7) = *((_DWORD *)this + 97);
        if (v7 >= 2)
        {
          int v10 = 0;
          int v11 = 0;
          do
          {
            uint64_t v12 = v10;
            uint64_t v13 = v10;
            do
            {
              uint64_t v14 = v13;
              if (v13 > v9) {
                break;
              }
              ++v13;
            }
            while (*(float *)(*((void *)this + 113) + 4 * v14 + 4) != 0.0);
            if ((int)v14 >= v9) {
              int v15 = v9;
            }
            else {
              int v15 = v14;
            }
            int v16 = v15 - v12 + 1;
            cblas_scopy(v16, (const float *)(*((void *)this + 101) + 4 * v12), 1, (float *)(*((void *)this + 61) + 4 * v12), -1);
            cblas_scopy(v15 - v12, (const float *)(*((void *)this + 113) + 4 * v12 + 4), 1, (float *)(*((void *)this + 97) + 4 * v12 + 4), -1);
            LSMSVDSFImpl::imtqlb(this, v16, (float *)(*((void *)this + 61) + 4 * v12), (float *)(*((void *)this + 97) + 4 * v12), (float *)(*((void *)this + 65) + 4 * v12), v17);
            if (*((_DWORD *)this + 101))
            {
              printf("IMTQLB FAILED TO CONVERGE (IERR = %d)\n", *((_DWORD *)this + 101));
              printf("L = %d    I = %d\n", v12, v15);
              if (v15 >= (int)v12)
              {
                uint64_t v18 = v12;
                do
                {
                  printf("%d  %lg  %lg  %lg\n", v18, *(float *)(*((void *)this + 61) + 4 * v18), *(float *)(*((void *)this + 97) + 4 * v18), *(float *)(*((void *)this + 65) + 4 * v18));
                  BOOL v20 = v18++ < v15;
                }
                while (v20);
              }
            }
            if (v15 >= (int)v12)
            {
              uint64_t v19 = *((void *)this + 65);
              do
              {
                *(float *)(v19 + 4 * v12) = *((float *)this + 97) * fabsf(*(float *)(v19 + 4 * v12));
                BOOL v20 = v12++ < v15;
              }
              while (v20);
            }
            int v10 = v15 + 1;
            ++v11;
            int v9 = *((_DWORD *)this + 100);
            BOOL v20 = v11 < v9 && v15 < v9;
          }
          while (v20);
        }
        int v21 = v9 + 1;
        if (v9 >= -1) {
          int v22 = v9 + 1;
        }
        else {
          int v22 = v9 + 2;
        }
        dsort2((uint64_t)v22 >> 1, v21, *((float **)this + 61), *((float **)this + 65));
        LSMSVDSFImpl::error_bound(this, &v32);
        uint64_t v23 = *((int *)this + 102);
        uint64_t v24 = *((unsigned int *)this + 4);
        if (v23 >= v24) {
          break;
        }
        if (v23)
        {
          unsigned int v25 = (*((_DWORD *)this + 100) - 5) * ((int)v24 - (int)v23) / v23;
          int v26 = v25 + 1 > 3 ? v25 + 1 : 3;
          int v27 = v26 + v7;
        }
        else
        {
          int v27 = v7 + 9;
        }
        if (v32) {
          break;
        }
        int v28 = *((_DWORD *)this + 99);
        if (v28 < v27) {
          int v27 = *((_DWORD *)this + 99);
        }
        BOOL v32 = v7 >= v28;
        if (++v4 >= v24) {
          break;
        }
        int v8 = v7;
        BOOL v20 = v7 < v28;
        int v7 = v27;
      }
      while (v20);
    }
    float v29 = (const float *)*((void *)this + 81);
    uint64_t v30 = *((unsigned int *)this + 3);
    float v31 = (float *)(*((void *)this + 77) + 4 * ((v30 + 3) & 0x1FFFFFFFCLL) * (*((int *)this + 100) + 2));
    cblas_scopy(v30, v29, 1, v31, 1);
  }
}

void LSMSVDSFImpl::ritvec(LSMSVDSFImpl *this)
{
  unint64_t v2 = (float *)*((void *)this + 89);
  int64_t v3 = (float *)*((void *)this + 97);
  uint64_t v4 = *((int *)this + 100);
  uint64_t v5 = v4 + 1;
  unint64_t v6 = v5 * v5;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v26, 4, v5 * v5);
  if (v4 == -1 || (v6 <= 1 ? (uint64_t v7 = 1) : (uint64_t v7 = v5 * v5), bzero(v26[0], 4 * v7), (v4 & 0x80000000) != 0))
  {
    int v10 = 0;
  }
  else
  {
    int v8 = v26[0];
    uint64_t v9 = v4 + 1;
    do
    {
      *int v8 = 1.0;
      v8 += v4 + 2;
      --v9;
    }
    while (v9);
    int v10 = 1;
  }
  cblas_scopy(v4 + 1, *((const float **)this + 101), 1, v2, -1);
  cblas_scopy(*((_DWORD *)this + 100), (const float *)(*((void *)this + 113) + 4), 1, v3 + 1, -1);
  LSMSVDSFImpl::imtql2(this, v4 + 1, v4 + 1, v2, v3, v26[0]);
  if (!*((_DWORD *)this + 101))
  {
    *((_DWORD *)this + 10LSMVectorBase::~LSMVectorBase(this + 3) = 0;
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 4 * (v6 - v5);
      do
      {
        if (*(float *)(*((void *)this + 65) + 4 * v12) <= (float)(*((float *)this + 96)
                                                                   * fabsf(*(float *)(*((void *)this + 61) + 4 * v12)))
          && v12 > v5 + ~*((_DWORD *)this + 102))
        {
          uint64_t v25 = v11;
          uint64_t v14 = *((unsigned int *)this + 3);
          if (v14) {
            bzero(v2, 4 * v14);
          }
          uint64_t v15 = -1;
          uint64_t v16 = v13;
          do
          {
            cblas_scopy(*((_DWORD *)this + 3), (const float *)(*((void *)this + 77)+ 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v15 + 3)), 1, v3, 1);
            cblas_saxpy(*((_DWORD *)this + 3), *(float *)((char *)v26[0] + v16), v3, 1, v2, 1);
            v16 += 4 * ~v4;
            ++v15;
          }
          while (v4 != v15);
          uint64_t v17 = *((int *)this + 103);
          uint64_t v18 = *((int *)this + 102);
          int v19 = *((_DWORD *)this + 3);
          if ((int)v17 < (int)v18 && v19)
          {
            BOOL v20 = (_DWORD *)(*((void *)this + 7) + 4 * v17);
            unint64_t v21 = (4 * v18 + 12) & 0xFFFFFFFFFFFFFFF0;
            int v22 = v2;
            uint64_t v23 = *((unsigned int *)this + 3);
            do
            {
              int v24 = *(_DWORD *)v22++;
              *BOOL v20 = v24;
              BOOL v20 = (_DWORD *)((char *)v20 + v21);
              --v23;
            }
            while (v23);
          }
          cblas_scopy(v19, v2, 1, (float *)(*((void *)this + 41) + 4 * v25), 1);
          uint64_t v11 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) + v25;
          ++*((_DWORD *)this + 103);
        }
        ++v12;
        v13 += 4;
      }
      while (v12 != v5);
    }
  }
  LSMVectorBase::~LSMVectorBase((void **)v26);
}

void sub_2177D5A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  LSMVectorBase::~LSMVectorBase((void **)va);
  _Unwind_Resume(a1);
}

void LSMSVDSFImpl::imtql2(LSMSVDSFImpl *this, uint64_t a2, uint64_t a3, float *a4, float *__dst, float *a6)
{
  uint64_t v6 = a3 - 1;
  if (a3 != 1)
  {
    *((_DWORD *)this + 101) = 0;
    if (a3 <= 1)
    {
      __dst[v6] = 0.0;
    }
    else
    {
      memmove(__dst, __dst + 1, 4 * a3 - 4);
      unint64_t v13 = 0;
      __dst[v6] = 0.0;
      uint64_t v14 = a3 * a2;
      uint64_t v60 = a6;
      uint64_t v61 = 1;
      int8x16_t v56 = a6;
      unint64_t v59 = a4;
      uint64_t v15 = __dst;
      while (2)
      {
        uint64_t v16 = 0;
        unint64_t v58 = v13 + 1;
        while (1)
        {
          uint64_t v17 = 0;
          uint64_t v18 = v59;
          int v19 = v60;
          uint64_t v20 = v61;
          do
          {
            uint64_t v21 = v17;
            int v22 = v18;
            uint64_t v23 = v19;
            unint64_t v24 = v20 - 1;
            if (v20 - 1 >= a3 || a3 == v20) {
              break;
            }
            float v26 = fabsf(*v18++);
            float v27 = v26 + fabsf(v22[1]);
            float v28 = v27 + fabsf(v15[v17]);
            ++v20;
            ++v17;
            ++v19;
          }
          while (v28 != v27);
          if (!v21) {
            break;
          }
          if (v16 == 30)
          {
            *((_DWORD *)this + 101) = v13;
            return;
          }
          uint64_t v63 = v16;
          float v29 = a4[v13];
          float v30 = __dst[v13];
          *(float *)v12.i32 = (float)(a4[v58] - v29) / (float)(v30 + v30);
          int8x16_t v62 = v12;
          *(float *)v31.i32 = hypotf(*(float *)v12.i32, 1.0);
          v32.i64[0] = 0x8000000080000000;
          v32.i64[1] = 0x8000000080000000;
          int8x16_t v12 = vbslq_s8(v32, v31, v62);
          float v33 = (float)(*v22 - v29) + (float)(v30 / (float)(*(float *)v62.i32 + *(float *)v12.i32));
          float v34 = 0.0;
          if (v24 <= v13)
          {
LABEL_20:
            a4[v13] = a4[v13] - v34;
            __dst[v13] = v33;
          }
          else
          {
            float v35 = 1.0;
            float v36 = 1.0;
            while (1)
            {
              int64_t v37 = v24 - 1;
              float v38 = __dst[v24 - 1];
              float v39 = v36 * v38;
              *(float *)v12.i32 = hypotf(v36 * v38, v33);
              __dst[v24] = *(float *)v12.i32;
              if (*(float *)v12.i32 == 0.0) {
                break;
              }
              float v40 = v35 * v38;
              float v36 = v39 / *(float *)v12.i32;
              float v35 = v33 / *(float *)v12.i32;
              float v41 = a4[v24] - v34;
              float v42 = (float)(v40 * (float)(v35 + v35))
                  + (float)((float)(a4[v37] - v41) * (float)(v39 / *(float *)v12.i32));
              float v34 = v36 * v42;
              a4[v24] = v41 + (float)(v36 * v42);
              if (v14 >= 1)
              {
                for (uint64_t i = 0; i < v14; i += a3)
                {
                  double v44 = &v23[i];
                  float v45 = *(v44 - 1);
                  float v46 = (float)(v35 * *v44) + (float)(v36 * v45);
                  *(v44 - 1) = (float)(*v44 * (float)-v36) + (float)(v35 * v45);
                  *double v44 = v46;
                }
              }
              float v33 = -(float)(v40 - (float)(v35 * v42));
              --v23;
              --v24;
              if (v37 <= (uint64_t)v13) {
                goto LABEL_20;
              }
            }
            a4[v24] = a4[v24] - v34;
          }
          uint64_t v16 = v63 + 1;
          v15[v21] = 0.0;
        }
        ++v15;
        ++v59;
        ++v60;
        ++v61;
        ++v13;
        if (v58 != a3) {
          continue;
        }
        break;
      }
      uint64_t v47 = 1;
      uint64_t v48 = v56;
      do
      {
        uint64_t v49 = v47 - 1;
        float v50 = a4[v47 - 1];
        uint64_t v51 = v47 - 1;
        uint64_t v52 = v47;
        do
        {
          if (a4[v52] < v50)
          {
            uint64_t v51 = v52;
            float v50 = a4[v52];
          }
          ++v52;
        }
        while (v52 < a3);
        if (v51 != v49)
        {
          a4[v51] = a4[v47 - 1];
          a4[v49] = v50;
          if (v14 >= 1)
          {
            uint64_t v53 = 0;
            unint64_t v54 = &v56[v51];
            do
            {
              float v55 = v48[v53];
              v48[v53] = v54[v53];
              v54[v53] = v55;
              v53 += a3;
            }
            while (v53 < v14);
          }
        }
        ++v47;
        ++v48;
      }
      while (v47 != a3);
    }
  }
}

void LSMSVDSFImpl::store(LSMSVDSFImpl *this, int a2, uint64_t a3, float *a4)
{
  switch(a2)
  {
    case 0:
      uint64_t v4 = *((unsigned int *)this + 3);
      uint64_t v5 = *((void *)this + 77);
      uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) * (a3 + 2);
      goto LABEL_10;
    case 1:
      uint64_t v9 = *((unsigned int *)this + 3);
      uint64_t v10 = *((void *)this + 77);
      uint64_t v11 = ((v9 + 3) & 0x1FFFFFFFCLL) * (a3 + 2);
      goto LABEL_12;
    case 2:
      if (a3 >= 2)
      {
        uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
        int v8 = "store: (STORP) j >= MAXLL \n";
        goto LABEL_7;
      }
      uint64_t v4 = *((unsigned int *)this + 3);
      uint64_t v5 = *((void *)this + 77);
      uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) * a3;
LABEL_10:
      int v12 = v4;
      unint64_t v13 = a4;
      a4 = (float *)(v5 + 4 * v6);
      goto LABEL_13;
    case 3:
      if (a3 < 2)
      {
        uint64_t v9 = *((unsigned int *)this + 3);
        uint64_t v10 = *((void *)this + 77);
        uint64_t v11 = ((v9 + 3) & 0x1FFFFFFFCLL) * a3;
LABEL_12:
        unint64_t v13 = (const float *)(v10 + 4 * v11);
        int v12 = v9;
LABEL_13:
        cblas_scopy(v12, v13, 1, a4, 1);
      }
      else
      {
        uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
        int v8 = "store: (RETRP) j >= MAXLL \n";
LABEL_7:
        fwrite(v8, 0x1BuLL, 1uLL, v7);
      }
      return;
    default:
      return;
  }
}

float sparse_sdot(unsigned int *a1, unsigned int *a2, float *a3, float *a4)
{
  float result = 0.0;
  while (a1 < a2)
  {
    float v5 = *a3++;
    float v6 = v5;
    int v7 = *a1++;
    float result = result + (float)(v6 * a4[v7]);
  }
  return result;
}

void LSMSVDSFImpl::stpone(LSMSVDSFImpl *this)
{
  LSMSVDSFImpl::startv(this);
  *((float *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = v2;
  if (v2 != 0.0 && !*((_DWORD *)this + 101))
  {
    float v3 = 1.0 / v2;
    int v4 = *((_DWORD *)this + 3);
    if (v3 != 0.0 && v4 != 0)
    {
      float v6 = (float *)*((void *)this + 81);
      int v7 = (float *)*((void *)this + 57);
      uint64_t v8 = *((unsigned int *)this + 3);
      do
      {
        float v9 = *v7++;
        *v6++ = v3 * v9;
        --v8;
      }
      while (v8);
    }
    cblas_sscal(v4, v3, *((float **)this + 89), 1);
    LSMSVDSFImpl::opb((void **)this, *((float **)this + 89), *((float **)this + 57));
    float v10 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 89), 1);
    **((float **)this + 101) = v10;
    cblas_saxpy(*((_DWORD *)this + 3), -v10, *((const float **)this + 81), 1, *((float **)this + 57), 1);
    float v11 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 89), 1);
    cblas_saxpy(*((_DWORD *)this + 3), -v11, *((const float **)this + 81), 1, *((float **)this + 57), 1);
    **((float **)this + 101) = v11 + **((float **)this + 101);
    cblas_scopy(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((float **)this + 93), 1);
    float v12 = sqrtf(cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 93), 1));
    *((float *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = v12;
    *((float *)this + 98) = *((float *)this + 92) * (float)(v12 + fabsf(**((float **)this + 101)));
  }
}

void LSMSVDSFImpl::lanczos_step(LSMSVDSFImpl *this, int a2, int a3, int *a4, BOOL *a5)
{
  *((_DWORD *)this + 100) = a2;
  if (a2 < a3)
  {
    float v9 = (uint64_t *)((char *)this + 648);
    float v10 = (LSMSVDSFImpl *)((char *)this + 680);
    float v11 = (uint64_t *)((char *)this + 712);
    float v12 = (LSMSVDSFImpl *)((char *)this + 744);
    while (1)
    {
      LSMVectorBase::Swap(v9, v10);
      LSMVectorBase::Swap(v11, v12);
      cblas_scopy(*((_DWORD *)this + 3), *((const float **)this + 85), 1, (float *)(*((void *)this + 77)+ 4* (((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL)+ ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((int *)this + 100))), 1);
      int v13 = *((_DWORD *)this + 100);
      if (v13 <= 2)
      {
        LSMSVDSFImpl::store(this, 2, v13 - 1, *((float **)this + 93));
        int v13 = *((_DWORD *)this + 100);
      }
      float v14 = *((float *)this + 97);
      *(float *)(*((void *)this + 113) + 4 * v1LSMVectorBase::~LSMVectorBase(this + 3) = v14;
      if (v14 == 0.0)
      {
        LSMSVDSFImpl::startv(this);
        *((float *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = v15;
        if (*((_DWORD *)this + 101)) {
          return;
        }
        if (v15 == 0.0) {
          break;
        }
      }
      if (!*a5)
      {
        int v16 = *((_DWORD *)this + 3);
        float v17 = 1.0 / *((float *)this + 97);
        if (v16 && v17 != 0.0)
        {
          uint64_t v18 = (float *)*((void *)this + 81);
          int v19 = (float *)*((void *)this + 57);
          uint64_t v20 = *((unsigned int *)this + 3);
          do
          {
            float v21 = *v19++;
            *v18++ = v17 * v21;
            --v20;
          }
          while (v20);
        }
        cblas_sscal(v16, v17, *((float **)this + 89), 1);
        LSMSVDSFImpl::opb((void **)this, *((float **)this + 89), *((float **)this + 57));
        cblas_saxpy(*((_DWORD *)this + 3), -*((float *)this + 97), *((const float **)this + 85), 1, *((float **)this + 57), 1);
        float v22 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 89), 1);
        *(float *)(*((void *)this + 101) + 4 * *((int *)this + 100)) = v22;
        cblas_saxpy(*((_DWORD *)this + 3), -v22, *((const float **)this + 81), 1, *((float **)this + 57), 1);
        int v23 = *((_DWORD *)this + 100);
        if (v23 <= 2
          && fabsf(*(float *)(*((void *)this + 101) + 4 * (v23 - 1))) > (float)(fabsf(*(float *)(*((void *)this + 101) + 4 * v23))
                                                                                  * 4.0))
        {
          *a4 = v23;
          int v23 = *((_DWORD *)this + 100);
        }
        int v24 = v23 - 1;
        if (v24 >= *a4) {
          int v24 = *a4;
        }
        if (v24 >= 1)
        {
          uint64_t v25 = 0;
          do
          {
            LSMSVDSFImpl::store(this, 3, v25, *((float **)this + 97));
            float v26 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 97), 1, *((const float **)this + 57), 1);
            cblas_scopy(*((_DWORD *)this + 3), (const float *)(*((void *)this + 77)+ 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v25 + 2)), 1, *((float **)this + 97), 1);
            cblas_saxpy(*((_DWORD *)this + 3), -v26, *((const float **)this + 97), 1, *((float **)this + 57), 1);
            *(_DWORD *)(*((void *)this + 105) + 4 * v25) = *((_DWORD *)this + 91);
            *(_DWORD *)(*((void *)this + 109) + 4 * v25++) = *((_DWORD *)this + 91);
            int v27 = *((_DWORD *)this + 100) - 1;
            if (v27 >= *a4) {
              int v27 = *a4;
            }
          }
          while (v25 < v27);
        }
        float v28 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 93), 1);
        cblas_saxpy(*((_DWORD *)this + 3), -v28, *((const float **)this + 85), 1, *((float **)this + 57), 1);
        uint64_t v29 = *((void *)this + 113);
        uint64_t v30 = *((int *)this + 100);
        float v31 = *(float *)(v29 + 4 * v30);
        if (v31 > 0.0) {
          *(float *)(v29 + 4 * v30) = v28 + v31;
        }
        float v32 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 89), 1);
        cblas_saxpy(*((_DWORD *)this + 3), -v32, *((const float **)this + 81), 1, *((float **)this + 57), 1);
        *(float *)(*((void *)this + 101) + 4 * *((int *)this + 100)) = v32
                                                                         + *(float *)(*((void *)this + 101)
                                                                                    + 4 * *((int *)this + 100));
        cblas_scopy(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((float **)this + 93), 1);
        float v33 = sqrtf(cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 93), 1));
        *((float *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = v33;
        float v34 = *((float *)this + 92)
            * (float)(v33
                    + (float)(*(float *)(*((void *)this + 113) + 4 * *((int *)this + 100))
                            + fabsf(*(float *)(*((void *)this + 101) + 4 * *((int *)this + 100)))));
        *((float *)this + 98) = v34;
        LSMSVDSFImpl::ortbnd(this, v34);
        LSMSVDSFImpl::purge(this, *a4, *((float **)this + 57), *((float **)this + 81), *((float **)this + 93), *((float **)this + 89));
        if (*((float *)this + 97) <= *((float *)this + 98)) {
          *((_DWORD *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = 0;
        }
        int v35 = *((_DWORD *)this + 100) + 1;
        *((_DWORD *)this + 100) = v35;
        if (v35 < a3) {
          continue;
        }
      }
      return;
    }
    *a5 = 1;
  }
}

void LSMSVDSFImpl::imtqlb(LSMSVDSFImpl *this, uint64_t a2, float *a3, float *a4, float *a5, int8x16_t a6)
{
  uint64_t v6 = a2 - 1;
  if (a2 != 1)
  {
    *((_DWORD *)this + 101) = 0;
    *a5 = 1.0;
    if (a2 < 2)
    {
      a4[v6] = 0.0;
    }
    else
    {
      uint64_t v11 = 0;
      do
      {
        a5[v11 + 1] = 0.0;
        a4[v11] = a4[v11 + 1];
        ++v11;
      }
      while (v6 != v11);
      a4[v6] = 0.0;
      unint64_t v12 = 0;
      uint64_t v54 = 1;
      int v13 = a5;
      float v14 = a3;
      float v15 = a4;
      while (2)
      {
        uint64_t v51 = v13;
        uint64_t v52 = v14;
        unint64_t v16 = 0;
        unint64_t v17 = v12++;
        unint64_t v53 = v12;
        while (1)
        {
          uint64_t v18 = 0;
          int v19 = v14;
          uint64_t v20 = v54;
          do
          {
            uint64_t v21 = v18;
            float v22 = v19;
            unint64_t v23 = v20 - 1;
            if (v20 - 1 >= a2 || a2 == v20) {
              break;
            }
            float v25 = fabsf(*v19++);
            float v26 = v25 + fabsf(v22[1]);
            float v27 = v26 + fabsf(v15[v18]);
            ++v20;
            ++v18;
          }
          while (v27 != v26);
          float v28 = a3[v17];
          if (!v21) {
            break;
          }
          if (v16 == 30)
          {
            *((_DWORD *)this + 101) = v17;
            return;
          }
          float v29 = a4[v17];
          *(float *)a6.i32 = (float)(a3[v12] - v28) / (float)(v29 + v29);
          int8x16_t v55 = a6;
          *(float *)v30.i32 = hypotf(*(float *)a6.i32, 1.0);
          v31.i64[0] = 0x8000000080000000;
          v31.i64[1] = 0x8000000080000000;
          a6 = vbslq_s8(v31, v30, v55);
          float v32 = (float)(*v22 - v28) + (float)(v29 / (float)(*(float *)v55.i32 + *(float *)a6.i32));
          float v33 = 0.0;
          if (v23 <= v17)
          {
LABEL_19:
            a3[v17] = a3[v17] - v33;
            a4[v17] = v32;
          }
          else
          {
            float v34 = 1.0;
            float v35 = 1.0;
            while (1)
            {
              float v36 = &a4[v23];
              float v37 = *(v36 - 1);
              float v38 = v35 * v37;
              *(float *)a6.i32 = hypotf(v35 * v37, v32);
              *float v36 = *(float *)a6.i32;
              if (*(float *)a6.i32 == 0.0) {
                break;
              }
              float v39 = &a3[v23];
              float v40 = &a5[v23];
              float v41 = v34 * v37;
              float v35 = v38 / *(float *)a6.i32;
              float v34 = v32 / *(float *)a6.i32;
              float v42 = *v39 - v33;
              float v43 = (float)(v41 * (float)(v34 + v34)) + (float)((float)(*(v39 - 1) - v42) * v35);
              float v33 = v35 * v43;
              *float v39 = v42 + (float)(v35 * v43);
              float v32 = -(float)(v41 - (float)(v34 * v43));
              float v44 = *(v40 - 1);
              float v45 = (float)(v34 * *v40) + (float)(v35 * v44);
              *(v40 - 1) = (float)(v34 * v44) - (float)(v35 * *v40);
              *float v40 = v45;
              if ((uint64_t)--v23 <= (uint64_t)v17) {
                goto LABEL_19;
              }
            }
            a3[v23] = a3[v23] - v33;
          }
          float v14 = v52;
          unint64_t v12 = v53;
          v15[v21] = 0.0;
          if (v16++ >= 0x1E) {
            goto LABEL_30;
          }
        }
        float v47 = a5[v17];
        if (v17)
        {
          uint64_t v48 = 0x3FFFFFFFFFFFFFFFLL;
          while (1)
          {
            float v49 = v14[v48];
            if (v28 >= v49) {
              break;
            }
            --v17;
            v14[v48 + 1] = v49;
            v51[v48 + 1] = v51[v48];
            --v48;
            if ((uint64_t)(v17 + 1) <= 1)
            {
              unint64_t v17 = 0;
              break;
            }
          }
        }
        a3[v17] = v28;
        a5[v17] = v47;
LABEL_30:
        ++v54;
        ++v15;
        ++v14;
        int v13 = v51 + 1;
        if (v12 != a2) {
          continue;
        }
        break;
      }
    }
  }
}

uint64_t LSMSVDSFImpl::error_bound(LSMSVDSFImpl *this, BOOL *a2)
{
  uint64_t result = cblas_isamax(*((_DWORD *)this + 100) + 1, *((const float **)this + 65), 1);
  uint64_t v5 = *((int *)this + 100);
  LODWORD(v6) = (2 * (int)v5) >> 1;
  if ((int)v6 > (int)result)
  {
    uint64_t v6 = (int)v6;
    uint64_t v7 = *((void *)this + 61);
    do
    {
      if (vabds_f32(*(float *)(v7 + 4 * v6 - 4), *(float *)(v7 + 4 * v6)) < (float)(*((float *)this + 93)
                                                                                   * fabsf(*(float *)(v7 + 4 * v6))))
      {
        uint64_t v8 = *((void *)this + 65);
        float v9 = *(float *)(v8 + 4 * v6);
        float v10 = *((float *)this + 98);
        if (v9 > v10)
        {
          uint64_t v11 = v8 + 4 * v6;
          float v12 = *(float *)(v11 - 4);
          if (v12 > v10)
          {
            *(float *)(v11 - 4) = sqrtf((float)(v12 * v12) + (float)(v9 * v9));
            *(_DWORD *)(v8 + 4 * v6) = 0;
          }
        }
      }
      --v6;
    }
    while (v6 > (int)result);
  }
  int v13 = (float *)*((void *)this + 61);
  if ((int)result >= 2)
  {
    uint64_t v14 = 0;
    do
    {
      if (vabds_f32(v13[v14 + 2], v13[v14 + 1]) < (float)(*((float *)this + 93) * fabsf(v13[v14 + 1])))
      {
        uint64_t v15 = *((void *)this + 65) + 4 * v14;
        float v16 = *(float *)(v15 + 4);
        float v17 = *((float *)this + 98);
        if (v16 > v17)
        {
          float v18 = *(float *)(v15 + 8);
          if (v18 > v17)
          {
            *(float *)(v15 + 8) = sqrtf((float)(v18 * v18) + (float)(v16 * v16));
            *(_DWORD *)(v15 + 4) = 0;
          }
        }
      }
      ++v14;
    }
    while ((int)result - 1 != v14);
  }
  *((_DWORD *)this + 102) = 0;
  if ((v5 & 0x80000000) == 0)
  {
    int v19 = 0;
    uint64_t v20 = 0;
    float v21 = v13[v5] - *v13;
    uint64_t v22 = *((void *)this + 65);
    do
    {
      float v23 = v21;
      if (v20 < v5) {
        float v21 = v13[v20 + 1] - v13[v20];
      }
      if (v21 >= v23) {
        float v24 = v23;
      }
      else {
        float v24 = v21;
      }
      float v25 = *(float *)(v22 + 4 * v20);
      if (v24 > v25)
      {
        float v25 = v25 * (float)(v25 / v24);
        *(float *)(v22 + 4 * v20) = v25;
      }
      float v26 = v13[v20];
      if (v25 <= (float)((float)(*((float *)this + 90) * 16.0) * fabsf(v26)))
      {
        *((_DWORD *)this + 102) = ++v19;
        if (!*a2)
        {
          BOOL v27 = *((float *)this + 94) < v26 && v26 < *((float *)this + 95);
          *a2 = v27;
        }
      }
      ++v20;
    }
    while (v5 + 1 != v20);
  }
  return result;
}

void LSMSVDSFImpl::startv(LSMSVDSFImpl *this)
{
  float v2 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 57), 1);
  uint64_t v3 = 0;
  uint64_t v11 = *((int *)this + 100) + 918273;
  do
  {
    if (v3 || *((int *)this + 100) > 0 || v2 == 0.0)
    {
      if (*((_DWORD *)this + 3))
      {
        unint64_t v4 = 0;
        do
        {
          *(float *)(*((void *)this + 57) + 4 * v4++) = LSMSVDSFImpl::random(this, &v11);
          unint64_t v5 = *((unsigned int *)this + 3);
        }
        while (v4 < v5);
      }
      else
      {
        LODWORD(v5) = 0;
      }
    }
    else
    {
      LODWORD(v5) = *((_DWORD *)this + 3);
    }
    cblas_scopy(v5, *((const float **)this + 57), 1, *((float **)this + 89), 1);
    LSMSVDSFImpl::opb((void **)this, *((float **)this + 89), *((float **)this + 57));
    cblas_scopy(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((float **)this + 89), 1);
    float v6 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((const float **)this + 89), 1);
    float v2 = v6;
    ++v3;
  }
  while (v6 <= 0.0 && v3 != 3);
  if (v6 <= 0.0)
  {
    *((_DWORD *)this + 101) = 0x2000;
  }
  else if (*((int *)this + 100) >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      cblas_scopy(*((_DWORD *)this + 3), (const float *)(*((void *)this + 77) + 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v8 + 2)), 1, *((float **)this + 97), 1);
      float v9 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 89), 1, *((const float **)this + 97), 1);
      cblas_saxpy(*((_DWORD *)this + 3), -v9, *((const float **)this + 97), 1, *((float **)this + 57), 1);
      ++v8;
    }
    while (v8 < *((int *)this + 100));
    float v10 = cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 93), 1, *((const float **)this + 57), 1);
    cblas_saxpy(*((_DWORD *)this + 3), -v10, *((const float **)this + 85), 1, *((float **)this + 57), 1);
    cblas_scopy(*((_DWORD *)this + 3), *((const float **)this + 57), 1, *((float **)this + 89), 1);
    cblas_sdot(*((_DWORD *)this + 3), *((const float **)this + 89), 1, *((const float **)this + 57), 1);
  }
}

float LSMSVDSFImpl::ortbnd(LSMSVDSFImpl *this, float result)
{
  uint64_t v3 = *((unsigned int *)this + 100);
  if ((int)v3 >= 1)
  {
    float v4 = *((float *)this + 97);
    if (v4 != 0.0 && v3 != 1)
    {
      **((float **)this + 109) = *((float *)this + 91)
                               + (float)((float)((float)((float)((float)(**((float **)this + 101)
                                                                       - *(float *)(*((void *)this + 101) + 4 * v3))
                                                               * **((float **)this + 105))
                                                       + (float)(*(float *)(*((void *)this + 113) + 4)
                                                               * *(float *)(*((void *)this + 105) + 4)))
                                               - (float)(*(float *)(*((void *)this + 113) + 4 * v3)
                                                       * **((float **)this + 109)))
                                       / v4);
      if (v3 >= 3)
      {
        uint64_t v6 = *((void *)this + 113);
        uint64_t v7 = *((void *)this + 101);
        uint64_t v8 = v3 - 2;
        float v9 = (float *)(*((void *)this + 109) + 4);
        float v10 = (float *)(v6 + 8);
        uint64_t v11 = (float *)(*((void *)this + 105) + 8);
        float v12 = (float *)(v7 + 4);
        do
        {
          float v13 = *v12++;
          float v14 = *(v11 - 2);
          float v15 = (float)(v13 - *(float *)(v7 + 4 * v3)) * *(v11 - 1);
          float v16 = *v11++;
          *float v9 = (float)((float)((float)((float)(v15 + (float)(*v10 * v16)) + (float)(*(v10 - 1) * v14))
                              - (float)(*(float *)(v6 + 4 * v3) * *v9))
                      / *((float *)this + 97))
              + *((float *)this + 91);
          ++v9;
          ++v10;
          --v8;
        }
        while (v8);
      }
    }
    float v17 = (float *)*((void *)this + 109);
    v17[(int)v3 - 1] = *((float *)this + 91);
    cblas_sswap(v3, v17, 1, *((float **)this + 105), 1);
    uint64_t result = *((float *)this + 91);
    *(float *)(*((void *)this + 105) + 4 * *((int *)this + 100)) = result;
  }
  return result;
}

void LSMSVDSFImpl::purge(LSMSVDSFImpl *this, uint64_t a2, float *a3, float *a4, float *a5, float *a6)
{
  uint64_t v6 = *((int *)this + 100);
  if (a2 + 2 <= v6)
  {
    int v13 = cblas_isamax(v6 + ~a2, (const float *)(*((void *)this + 105) + 4 * a2), 1);
    float v14 = *((float *)this + 92);
    if (fabsf(*(float *)(*((void *)this + 105) + 4 * (a2 + v13))) > v14)
    {
      float v15 = *((float *)this + 97);
      char v16 = 1;
      float v17 = *((float *)this + 91) / v14;
      do
      {
        char v18 = v16;
        if (v15 > *((float *)this + 98))
        {
          float v19 = 0.0;
          float v20 = 0.0;
          if (*((int *)this + 100) > a2)
          {
            uint64_t v21 = a2;
            do
            {
              cblas_scopy(*((_DWORD *)this + 3), (const float *)(*((void *)this + 77)+ 4 * ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * (v21 + 2)), 1, *((float **)this + 97), 1);
              float v22 = cblas_sdot(*((_DWORD *)this + 3), a6, 1, *((const float **)this + 97), 1);
              float v19 = v19 + fabsf(v22);
              cblas_saxpy(*((_DWORD *)this + 3), -v22, *((const float **)this + 97), 1, a4, 1);
              float v23 = cblas_sdot(*((_DWORD *)this + 3), a5, 1, *((const float **)this + 97), 1);
              float v20 = v20 + fabsf(v23);
              cblas_saxpy(*((_DWORD *)this + 3), -v23, *((const float **)this + 97), 1, a3, 1);
              ++v21;
            }
            while (v21 < *((int *)this + 100));
          }
          cblas_scopy(*((_DWORD *)this + 3), a4, 1, a6, 1);
          float v24 = -cblas_sdot(*((_DWORD *)this + 3), a3, 1, a6, 1);
          cblas_saxpy(*((_DWORD *)this + 3), v24, a4, 1, a3, 1);
          cblas_scopy(*((_DWORD *)this + 3), a3, 1, a5, 1);
          float v15 = sqrtf(cblas_sdot(*((_DWORD *)this + 3), a5, 1, a3, 1));
          *((float *)this + 9LSMVectorBase::~LSMVectorBase(this + 7) = v15;
          if (v19 <= v17 && (float)(v20 + fabsf(v24)) <= (float)(v17 * v15)) {
            break;
          }
        }
        char v16 = 0;
      }
      while ((v18 & 1) != 0);
      uint64_t v25 = *((int *)this + 100);
      BOOL v26 = v25 < a2;
      uint64_t v27 = v25 - a2;
      if (!v26)
      {
        uint64_t v28 = v27 + 1;
        float v29 = (_DWORD *)(*((void *)this + 109) + 4 * a2);
        int8x16_t v30 = (_DWORD *)(*((void *)this + 105) + 4 * a2);
        do
        {
          *v30++ = *((_DWORD *)this + 91);
          *v29++ = *((_DWORD *)this + 91);
          --v28;
        }
        while (v28);
      }
    }
  }
}

float LSMSVDSFImpl::random(LSMSVDSFImpl *this, uint64_t *a2)
{
  if (*((void *)this + 52))
  {
    uint64_t v2 = *((void *)this + 53);
  }
  else
  {
    *((_OWORD *)this + 26) = xmmword_2177DCF30;
    *((_OWORD *)this + 2LSMVectorBase::~LSMVectorBase(this + 7) = xmmword_2177DCF40;
    *((void *)this + 56) = 0x300000004E800000;
    uint64_t v2 = 843314885;
  }
  uint64_t v3 = v2 * *a2;
  *a2 = v3;
  if (v3 > *((void *)this + 55))
  {
    v3 -= 2 * *((void *)this + 52);
    *a2 = v3;
  }
  uint64_t v4 = *((void *)this + 54);
  BOOL v5 = __OFADD__(v4, v3);
  uint64_t v6 = v4 + v3;
  *a2 = v6;
  if (v6 < 0 != v5) {
    uint64_t v7 = v6 + 1;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = *((void *)this + 52);
  if (v8 < v7 >> 1)
  {
    v6 -= 2 * v8;
    *a2 = v6;
  }
  if (v6 < 0)
  {
    v6 += 2 * *((void *)this + 52);
    *a2 = v6;
  }
  return *((float *)this + 113) * (float)v6;
}

void LSMSVDSFTImpl::~LSMSVDSFTImpl(void **this)
{
  LSMSVDSFImpl::~LSMSVDSFImpl(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177D7078(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40FA3C5B96);
  _Unwind_Resume(a1);
}

void LSMSVDSFImpl::~LSMSVDSFImpl(void **this)
{
  LSMSVDSFImpl::~LSMSVDSFImpl(this);
  JUMPOUT(0x21D44C230);
}

{
  uint64_t vars8;

  *this = &unk_26C7C6BB8;
  LSMVectorBase::~LSMVectorBase(this + 113);
  LSMVectorBase::~LSMVectorBase(this + 109);
  LSMVectorBase::~LSMVectorBase(this + 105);
  LSMVectorBase::~LSMVectorBase(this + 101);
  LSMVectorBase::~LSMVectorBase(this + 97);
  LSMVectorBase::~LSMVectorBase(this + 93);
  LSMVectorBase::~LSMVectorBase(this + 89);
  LSMVectorBase::~LSMVectorBase(this + 85);
  LSMVectorBase::~LSMVectorBase(this + 81);
  LSMVectorBase::~LSMVectorBase(this + 77);
  LSMVectorBase::~LSMVectorBase(this + 73);
  LSMVectorBase::~LSMVectorBase(this + 69);
  LSMVectorBase::~LSMVectorBase(this + 65);
  LSMVectorBase::~LSMVectorBase(this + 61);
  LSMVectorBase::~LSMVectorBase(this + 57);
  LSMVectorBase::~LSMVectorBase(this + 41);
  LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<float>>>::~LSMVector((LSMVectorBase *)(this + 37));
  LSMSVD::~LSMSVD(this);
}

void sub_2177D70E8(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40FA3C5B96);
  _Unwind_Resume(a1);
}

void LSMSVDSFImpl::LSMSVDSFImpl(LSMSVDSFImpl *this)
{
  LSMSVD::LSMSVD(this);
  void *v2 = &unk_26C7C6BB8;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(v2 + 37), 64);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 328), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 456), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 488), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 520), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 552), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 584), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 616), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 648), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 680), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 712), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 744), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 776), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 808), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 840), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 872), 4);
  LSMVectorBase::LSMVectorBase((LSMSVDSFImpl *)((char *)this + 904), 4);
}

void sub_2177D72A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void **a10, void **a11, void **a12, void **a13, void **a14, void **a15, LSMVectorBase *a16)
{
  LSMVectorBase::~LSMVectorBase(v23);
  LSMVectorBase::~LSMVectorBase(v22);
  LSMVectorBase::~LSMVectorBase(v21);
  LSMVectorBase::~LSMVectorBase(v20);
  LSMVectorBase::~LSMVectorBase(v19);
  LSMVectorBase::~LSMVectorBase(v18);
  LSMVectorBase::~LSMVectorBase(v17);
  LSMVectorBase::~LSMVectorBase(v25);
  LSMVectorBase::~LSMVectorBase(v24);
  LSMVectorBase::~LSMVectorBase(a10);
  LSMVectorBase::~LSMVectorBase(a11);
  LSMVectorBase::~LSMVectorBase(a12);
  LSMVectorBase::~LSMVectorBase(a13);
  LSMVectorBase::~LSMVectorBase(a14);
  LSMVectorBase::~LSMVectorBase(a15);
  LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<float>>>::~LSMVector(a16);
  LSMSVD::~LSMSVD(v16);
  _Unwind_Resume(a1);
}

void LSMVector<std::pair<LSMVector<unsigned int>,LSMVector<float>>>::~LSMVector(LSMVectorBase *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {
    uint64_t v3 = *(void ***)this;
    uint64_t v4 = v2 << 6;
    do
    {
      LSMVectorBase::~LSMVectorBase(v3 + 4);
      LSMVectorBase::~LSMVectorBase(v3);
      v3 += 8;
      v4 -= 64;
    }
    while (v4);
  }
  LSMVectorBase::~LSMVectorBase((void **)this);
}

void sub_2177D7420(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void sub_2177D7524(_Unwind_Exception *a1)
{
  LSMSVD::~LSMSVD(v1);
  _Unwind_Resume(a1);
}

LSMVectorBase *std::pair<LSMVector<unsigned int>,LSMVector<float>>::pair[abi:ne180100](LSMVectorBase *a1)
{
  LSMVectorBase::LSMVectorBase(a1, 4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(v2 + 32), 4);
  return a1;
}

void sub_2177D7674(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void LSMFileDesc::~LSMFileDesc(LSMFileDesc *this)
{
  *(void *)this = &unk_26C7C6C08;
  LSMFileDesc::Close(this);
}

{
  *(void *)this = &unk_26C7C6C08;
  LSMFileDesc::Close(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C7C6C08;
  LSMFileDesc::Close(this);
  JUMPOUT(0x21D44C230);
}

uint64_t LSMFileDesc::Close(LSMFileDesc *this)
{
  uint64_t v3 = (void *)((char *)this + 8);
  uint64_t v2 = (FILE *)*((void *)this + 1);
  if (v2) {
    fclose(v2);
  }
  uint64_t result = *((void *)this + 2);
  if (result) {
    uint64_t result = MEMORY[0x21D44C210](result, 0x1000C8077774924);
  }
  void *v3 = 0;
  v3[1] = 0;
  return result;
}

uint64_t LSMFileDesc::Seek(FILE **this, uint64_t a2, int a3)
{
  fflush(this[1]);
  uint64_t v6 = this[1];
  return fseek(v6, a2, a3);
}

void LSMFileDesc::Tell(LSMFileDesc *this)
{
}

uint64_t LSMFileDesc::Align(LSMFileDesc *this, unint64_t a2)
{
  unint64_t v4 = (*(uint64_t (**)(LSMFileDesc *))(*(void *)this + 32))(this) % a2;
  if (v4) {
    (*(void (**)(LSMFileDesc *, unint64_t, uint64_t))(*(void *)this + 24))(this, a2 - v4, 1);
  }
  BOOL v5 = *(uint64_t (**)(LSMFileDesc *))(*(void *)this + 32);
  return v5(this);
}

void LSMFileDesc::LSMFileDesc(LSMFileDesc *this, const __CFURL *a2, const char *a3)
{
  uint64_t v3 = (void *)MEMORY[0x270FA5388](this);
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[1] = 0;
  v3[2] = 0;
  void *v3 = &unk_26C7C6C08;
  if (CFURLGetFileSystemRepresentation(v4, 1u, buffer, 4096))
  {
    strlen((const char *)buffer);
    operator new[]();
  }
}

void LSMReadFileDesc::LSMReadFileDesc(LSMReadFileDesc *this, const __CFURL *a2, char a3)
{
  LSMFileDesc::LSMFileDesc(this, a2, "r");
  *(void *)uint64_t v4 = &unk_26C7C6C40;
  *(unsigned char *)(v4 + 48) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0;
  *(unsigned char *)(v4 + 49) = a3;
}

void LSMReadFileDesc::~LSMReadFileDesc(LSMReadFileDesc *this)
{
  *(void *)this = &unk_26C7C6C40;
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2) {
    munmap(v2, *((void *)this + 4));
  }
  *(void *)this = &unk_26C7C6C08;
  LSMFileDesc::Close(this);
}

{
  uint64_t vars8;

  LSMReadFileDesc::~LSMReadFileDesc(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177D7AB0(_Unwind_Exception *a1)
{
  *(void *)uint64_t v1 = &unk_26C7C6C08;
  LSMFileDesc::Close(v1);
  _Unwind_Resume(a1);
}

void sub_2177D7B2C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10B1C406B294420);
  _Unwind_Resume(a1);
}

uint64_t LSMReadFileDesc::Seek(uint64_t this, uint64_t a2, int a3)
{
  uint64_t v5 = this;
  if (*(void *)(this + 24))
  {
    if (a3)
    {
      if (a3 == 2)
      {
        uint64_t v6 = *(void *)(this + 32);
      }
      else
      {
        if (a3 != 1) {
          return this;
        }
        uint64_t v6 = *(void *)(this + 40);
      }
      *(void *)(this + 40) = v6 + a2;
    }
    else
    {
      *(void *)(this + 40) = a2;
    }
  }
  else
  {
    fflush(*(FILE **)(this + 8));
    uint64_t v7 = *(FILE **)(v5 + 8);
    return fseek(v7, a2, a3);
  }
  return this;
}

uint64_t LSMReadFileDesc::Tell(LSMReadFileDesc *this)
{
  if (!*((void *)this + 3)) {
    JUMPOUT(0x21D44C4C0);
  }
  return *((void *)this + 5);
}

BOOL LSMReadFileDesc::Read(LSMReadFileDesc *this, unsigned int *__dst, size_t __nitems, size_t __size)
{
  uint64_t v6 = __dst;
  uint64_t v8 = *((void *)this + 3);
  if (v8)
  {
    size_t v9 = __size * __nitems;
    size_t v10 = *((void *)this + 4);
    uint64_t v11 = *((void *)this + 5);
    BOOL v12 = v11 + __size * __nitems <= v10;
    if (v11 + __size * __nitems <= v10)
    {
      memcpy(__dst, (const void *)(v8 + v11), v9);
      size_t v10 = *((void *)this + 5) + v9;
    }
    *((void *)this + 5) = v10;
  }
  else if (fread(__dst, __size, __nitems, *((FILE **)this + 1)) == __nitems)
  {
    BOOL v12 = 1;
    if (__size >= 4)
    {
      if (*((unsigned char *)this + 48))
      {
        size_t v13 = (__size >> 2) * __nitems;
        if (v13)
        {
          do
          {
            *uint64_t v6 = bswap32(*v6);
            ++v6;
            --v13;
          }
          while (v13);
          return 1;
        }
      }
    }
  }
  else
  {
    return 0;
  }
  return v12;
}

BOOL LSMReadFileDesc::ReadVec(LSMReadFileDesc *this, void **a2, size_t __nitems)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = *((void *)this + 3);
  if (v6)
  {
LABEL_2:
    size_t v7 = *((unsigned __int16 *)a2 + 4) * __nitems;
    size_t v8 = *((void *)this + 4);
    uint64_t v9 = *((void *)this + 5);
    BOOL v10 = v7 + v9 <= v8;
    if (v7 + v9 <= v8)
    {
      LSMVectorBase::Map(a2, (void *)(v6 + v9), (void *)__nitems);
      size_t v8 = *((void *)this + 5) + v7;
    }
    *((void *)this + 5) = v8;
    return v10;
  }
  if (*((unsigned char *)this + 49))
  {
    if (*((unsigned char *)this + 48))
    {
      *((unsigned char *)this + 49) = 0;
    }
    else
    {
      int v14 = fileno(*((FILE **)this + 1));
      if ((fstatfs(v14, &v21) & 0x80000000) == 0
        && !strstr(v21.f_fstypename, "afp")
        && !strstr(v21.f_fstypename, "nfs"))
      {
        int v15 = fileno(*((FILE **)this + 1));
        fstat(v15, &v20);
        stat("/", &v19);
        if (v20.st_dev == v19.st_dev)
        {
          *((void *)this + 4) = v20.st_size;
          *((void *)this + 5) = MEMORY[0x21D44C4C0](*((void *)this + 1));
          fseek(*((FILE **)this + 1), 0, 0);
          size_t v16 = *((void *)this + 4);
          int v17 = fileno(*((FILE **)this + 1));
          char v18 = mmap(0, v16, 1, 1, v17, 0);
          *((void *)this + LSMVectorBase::~LSMVectorBase(this + 3) = v18;
          if (v18) {
            (*(void (**)(LSMReadFileDesc *))(*(void *)this + 16))(this);
          }
        }
      }
      uint64_t v6 = *((void *)this + 3);
      *((unsigned char *)this + 49) = 0;
      if (v6) {
        goto LABEL_2;
      }
    }
  }
  size_t v12 = (size_t)a2[3];
  if (v12 < __nitems)
  {
    LSMVectorBase::Allocate((const void **)a2, __nitems, 1);
    size_t v12 = (size_t)a2[3];
  }
  BOOL v13 = v12 >= __nitems;
  if (v12 >= __nitems) {
    size_t v12 = __nitems;
  }
  a2[2] = (void *)v12;
  return v13 && LSMReadFileDesc::Read(this, (unsigned int *)*a2, __nitems, *((unsigned __int16 *)a2 + 4));
}

uint64_t LSMReadFileDesc::Decode(LSMReadFileDesc *this, unsigned int *a2)
{
  uint64_t v4 = *((void *)this + 3);
  if (v4)
  {
    int v5 = 0;
    uint64_t v6 = *((void *)this + 4);
    uint64_t v7 = *((void *)this + 5);
    while (v6 != v7)
    {
      *((void *)this + 5) = v7 + 1;
      char v8 = *(unsigned char *)(v4 + v7);
      int v9 = v8 & 0x7F | (v5 << 7);
      ++v7;
      int v5 = v9;
      if ((v8 & 0x80) == 0) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    int v10 = 0;
    while (1)
    {
      int v11 = getc(*((FILE **)this + 1));
      if (v11 == -1) {
        break;
      }
      int v9 = v11 & 0x7F | (v10 << 7);
      int v10 = v9;
      if ((v11 & 0x80) == 0)
      {
LABEL_9:
        *a2 = v9;
        return 1;
      }
    }
  }
  return 0;
}

void LSMWriteFileDesc::LSMWriteFileDesc(LSMWriteFileDesc *this, const __CFURL *a2)
{
  LSMFileDesc::LSMFileDesc(this, a2, "w");
  void *v2 = &unk_26C7C6C78;
}

BOOL LSMWriteFileDesc::Write(FILE **this, const void *__ptr, size_t a3, size_t __size)
{
  return fwrite(__ptr, __size, a3, this[1]) == a3;
}

BOOL LSMWriteFileDesc::WriteVec(FILE **this, const LSMVectorBase *a2)
{
  size_t v2 = *((void *)a2 + 2);
  return fwrite(*(const void **)a2, *((unsigned __int16 *)a2 + 4), v2, this[1]) == v2;
}

BOOL LSMWriteFileDesc::Encode(FILE **this, unsigned int a2)
{
  if (a2 >> 28)
  {
    putc((a2 >> 28) | 0x80, this[1]);
LABEL_4:
    putc((a2 >> 21) & 0x7F | 0x80, this[1]);
    goto LABEL_5;
  }
  if (a2 >= 0x200000) {
    goto LABEL_4;
  }
  if (a2 < 0x4000)
  {
    if (a2 < 0x80) {
      return putc(a2 & 0x7F, this[1]) != -1;
    }
    goto LABEL_6;
  }
LABEL_5:
  putc((a2 >> 14) & 0x7F | 0x80, this[1]);
LABEL_6:
  putc((a2 >> 7) & 0x7F | 0x80, this[1]);
  return putc(a2 & 0x7F, this[1]) != -1;
}

void LSMWriteFileDesc::~LSMWriteFileDesc(LSMWriteFileDesc *this)
{
  *(void *)this = &unk_26C7C6C08;
  LSMFileDesc::Close(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C7C6C08;
  LSMFileDesc::Close(this);
  JUMPOUT(0x21D44C230);
}

const char *LSMDebugFlags::Update(LSMDebugFlags *this)
{
  uint64_t result = getenv("LSM_DEBUG");
  if (result) {
    uint64_t result = (const char *)atoi(result);
  }
  LSMDebugFlags::sLSMDebug = (int)result;
  return result;
}

uint64_t LSMCardPunch::Punch(char **this, const char *a2, ...)
{
  va_start(va, a2);
  uint64_t result = vsprintf(this[11], a2, va);
  uint64_t v4 = &this[11][(int)result];
  this[11] = v4;
  if (v4 - (char *)this - 8 >= 72) {
    return LSMCardPunch::Flush((uint64_t)this);
  }
  return result;
}

uint64_t LSMCardPunch::Flush(uint64_t this)
{
  uint64_t v1 = this + 8;
  if (*(void *)(this + 88) > (unint64_t)(this + 8))
  {
    uint64_t v2 = this;
    fputs((const char *)(this + 8), *(FILE **)this);
    this = fputc(10, *(FILE **)v2);
    *(void *)(v2 + 88) = v1;
  }
  return this;
}

void LSMParser::CreateParser(LSMParser *this, uint64_t a2, LSMParsedText *a3, const __CFLocale *a4)
{
  if (a3)
  {
    uint64_t v4 = (const void *)MEMORY[0x21D44BEA0](a3, a2, a3, a4);
    if (CFEqual(v4, @"zh-Hans") || CFEqual(v4, @"zh-Hant")) {
      operator new();
    }
  }
  operator new();
}

void sub_2177D8380(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

void *LSMChineseParser::LSMChineseParser(void *a1, uint64_t a2, CFLocaleRef locale)
{
  *a1 = &unk_26C7C6D50;
  a1[1] = a2;
  v6.location = -1;
  v6.CFIndex length = 0;
  a1[2] = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v6, 4uLL, locale);
  return a1;
}

void *LSMICUParser::LSMICUParser(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  const char *result = &unk_26C7C6D20;
  result[261] = 0;
  return result;
}

void *LSMCommonParser::LSMCommonParser(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const char *result = &unk_26C7C6CF0;
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

uint64_t LSMCommonParser::AddWords(LSMCommonParser *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  *((_WORD *)this + 16) = 32;
  uint64_t v4 = (char *)this + 32;
  if (Length >= 1)
  {
    uint64_t v5 = Length;
    CFIndex v6 = 0;
    uint64_t v7 = (UniChar *)((char *)this + 34);
    do
    {
      if ((unint64_t)v5 >= 0x3FC) {
        CFIndex v8 = 1020;
      }
      else {
        CFIndex v8 = v5;
      }
      v34.location = v6;
      v34.CFIndex length = v8;
      CFStringGetCharacters(theString, v34, v7);
      unint64_t v9 = 1020;
      if ((unint64_t)v5 <= 0x3FB)
      {
        unint64_t v9 = v8 + 1;
        *((_WORD *)this + v8 + 1LSMVectorBase::~LSMVectorBase(this + 7) = 32;
      }
      int v10 = (char *)this + 2 * v9;
      *((_WORD *)v10 + 1LSMVectorBase::~LSMVectorBase(this + 7) = 32;
      *((_DWORD *)v10 + 9) = 61407352;
      uint64_t v11 = 768;
      if (v9 < 0x300) {
        uint64_t v11 = v9;
      }
      size_t v12 = &v4[2 * v11];
      unint64_t v13 = (unint64_t)&v7[v9];
      int v14 = v7;
      while (1)
      {
        do
        {
          int v15 = v14;
          unsigned int v17 = *v14++;
          unsigned int v16 = v17;
        }
        while (v17 < 0x21);
        if (v15 > (unsigned __int16 *)v12) {
          break;
        }
        char v18 = v15 - 1;
        char v19 = *(v15 - 1) > 0x17Fu;
        uint64_t v20 = 2;
        statfs v21 = v14;
        do
        {
          uint64_t v22 = v20;
          v19 |= v16 > 0x17F;
          unsigned int v23 = *v21++;
          unsigned int v16 = v23;
          v20 += 2;
        }
        while (v23 > 0x20);
        if (v19)
        {
          while (1)
          {
            unsigned int v24 = *(unsigned __int16 *)((char *)v15 + v22 + 2);
            if (v24 <= 0x17F && v24 >= 0x21 && *(unsigned __int16 *)((char *)v15 + v22) < 0x21u) {
              break;
            }
            v22 += 2;
          }
          uint64_t v30 = v22 + 2;
          float v29 = (unsigned __int16 *)(*(uint64_t (**)(LSMCommonParser *, unsigned __int16 *, uint64_t))(*(void *)this + 24))(this, v18, ((v22 + 2) >> 1) + 1);
          uint64_t v28 = (unsigned __int16 *)((char *)v15 + v30);
          if (!v29) {
            return 4294960651;
          }
        }
        else
        {
          uint64_t v25 = v21 - 1;
          unsigned int v26 = *v21;
          if (v26 <= 0x17F)
          {
            do
            {
              if (v26 <= 0x20 && *(v21 - 1) > 0x20u) {
                uint64_t v25 = v21;
              }
              unsigned int v27 = v21[1];
              ++v21;
              unsigned int v26 = v27;
            }
            while (v27 < 0x180);
          }
          uint64_t v28 = v25 + 1;
          float v29 = LSMCommonParser::ParseEuroSegment((CFLocaleRef *)this, v18, v25 + 1 - v15 + 1, (unint64_t)(v25 + 1) > v13);
          if (!v29) {
            return 4294960651;
          }
        }
        if (v29 > v14 || (float v29 = v28, v15 < (unsigned __int16 *)this + 528))
        {
          int v14 = v29;
          int v15 = v29;
          if (v29 <= (unsigned __int16 *)v12) {
            continue;
          }
        }
        break;
      }
      uint64_t v7 = (UniChar *)((char *)this + 34);
      uint64_t v4 = (char *)this + 32;
      unint64_t v31 = (((char *)v15 - ((char *)this + 32)) >> 1) - 1;
      if (v31 >= v9) {
        unint64_t v31 = v9;
      }
      v6 += v31;
      v5 -= v31;
    }
    while (v5 > 0);
  }
  return 0;
}

unsigned __int16 *LSMCommonParser::ParseEuroSegment(CFLocaleRef *this, unsigned __int16 *a2, uint64_t a3, int a4)
{
  uint64_t v4 = a2;
  if ((LSMDebugFlags::sLSMDebug & 8) == 0)
  {
    if (a4)
    {
      uint64_t v6 = 2;
      if ((unint64_t)(a3 - 1) < 2) {
        uint64_t v6 = a3 - 1;
      }
      while (1)
      {
        uint64_t v7 = a3 - 1;
        if ((unint64_t)(a3 - 1) < 3) {
          break;
        }
        int v8 = sEuroCharType[a2[a3-- - 2]];
        if ((v8 & 0xFFFFFFF7) == 0) {
          goto LABEL_13;
        }
      }
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v7 = a3;
    }
LABEL_13:
    uint64_t v11 = &a2[v7];
    if (((_BYTE)this[1] & 4) == 0)
    {
      if (v7 < 1) {
        return v11;
      }
      while (1)
      {
        if ((sEuroCharType[*v4] & 0x87) != 0)
        {
          size_t v12 = v4;
        }
        else
        {
          size_t v12 = ++v4;
          if (v4 < v11) {
            continue;
          }
        }
        if (v12 >= v11) {
          return v11;
        }
        char v13 = 0;
        char v14 = 0;
        char v15 = 0;
        uint64_t v4 = v12;
        do
        {
          int v16 = sEuroCharType[*v4];
          switch(v16)
          {
            case 1:
              char v14 = 1;
              goto LABEL_25;
            case 4:
              goto LABEL_27;
            case 2:
              char v13 = 1;
LABEL_25:
              char v15 = 1;
              goto LABEL_27;
          }
          if ((v16 & 0x40) == 0) {
            break;
          }
LABEL_27:
          ++v4;
        }
        while (v4 < v11);
        if (v4 == v12) {
          return v11;
        }
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        do
          int v18 = sEuroCharType[v4[v17--]];
        while ((v18 & 0xFFFFFF87) == 0);
        if ((v14 & 1) == 0)
        {
          char v19 = 0;
          if ((v15 & 1) == 0) {
            goto LABEL_38;
          }
LABEL_37:
          if (!LSMCommonParser::DefiniteWord(this, v12, ((char *)v4 - (char *)v12 + v17 * 2 + 4) >> 1, v19 & 1))goto LABEL_38; {
          return 0;
          }
        }
        char v19 = (((unint64_t)this[1] & 2) == 0) | v13;
        if (this[1]) {
          char v19 = 0;
        }
        if (v15) {
          goto LABEL_37;
        }
LABEL_38:
        if (v4 >= v11) {
          return v11;
        }
      }
    }
    if (v7 < 1) {
      return v11;
    }
    uint64_t v20 = 0;
    statfs v21 = a2;
    uint64_t v22 = a2;
    do
    {
      uint64_t v23 = v20;
      unsigned int v24 = *v22++;
      ++v20;
      a2[v23] = v24;
      uint64_t v25 = v21 + 4;
      if ((sEuroCharType[v24] & 7) != 0 && v25 < v11)
      {
        uint64_t v27 = v21[2];
        if ((sEuroCharType[v27] & 7) != 0 && (sEuroCharType[*v25] & 7) != 0)
        {
          int v28 = *v22;
          if ((sEuroCharType[*v22] & 8) != 0 && v21[3] == v28)
          {
            float v29 = &a2[v20];
            if (v23 < 1 || (sEuroCharType[*(v29 - 2)] & 7) == 0)
            {
              uint64_t v30 = v23 + 2;
              *float v29 = v27;
              unint64_t v31 = &a2[v23 + 2];
              if (v21 + 6 >= v11) {
                goto LABEL_62;
              }
              float v32 = v21 + 4;
              while (1)
              {
                float v33 = v32 + 2;
                if ((sEuroCharType[v32[2]] & 7) == 0) {
                  goto LABEL_62;
                }
                if (v25[1] != v28) {
                  break;
                }
                *v31++ = *v25;
                ++v30;
                CFRange v34 = v32 + 2;
                unint64_t v35 = (unint64_t)(v32 + 4);
                v32 += 2;
                uint64_t v25 = v33;
                if (v35 >= (unint64_t)v11) {
                  goto LABEL_63;
                }
              }
              if (v28 != 32)
              {
LABEL_62:
                CFRange v34 = v25;
LABEL_63:
                LOWORD(v28) = *v34;
                uint64_t v25 = v34 + 1;
              }
              uint64_t v20 = v30 + 1;
              *unint64_t v31 = v28;
              uint64_t v22 = v25;
            }
          }
        }
      }
      statfs v21 = v22;
    }
    while (v22 < v11);
    if (v20 < 1) {
      return v11;
    }
    float v36 = &a2[v20];
LABEL_67:
    while (2)
    {
      if ((sEuroCharType[*v4] & 0x87) != 0)
      {
        float v37 = v4;
      }
      else
      {
        float v37 = ++v4;
        if (v4 < v36) {
          continue;
        }
      }
      break;
    }
    if (v37 >= v36)
    {
      char v42 = 0;
      char v41 = 0;
      char v40 = 0;
      float v39 = 0;
      float v38 = 0;
      float v45 = v37;
      float v44 = v37;
      goto LABEL_94;
    }
    float v38 = 0;
    float v39 = 0;
    char v40 = 0;
    char v41 = 0;
    char v42 = 0;
    uint64_t v43 = 0;
    float v44 = v37;
    float v45 = v37;
    while (1)
    {
      uint64_t v46 = *v45;
      int v47 = sEuroCharType[v46];
      if (v47 == 1) {
        break;
      }
      if (v47 == 4) {
        goto LABEL_90;
      }
      if (v47 == 2)
      {
        char v42 = 1;
        char v40 = 1;
LABEL_90:
        ++v43;
        *float v44 = v46;
        goto LABEL_91;
      }
      if ((v47 & 0x10) == 0)
      {
        if ((v47 & 0x20) == 0)
        {
          float v44 = &v37[v43];
LABEL_94:
          BOOL v51 = v39 != 0;
          BOOL v52 = (char *)v44 - (char *)v39 > 8;
          if (v51 && v52) {
            uint64_t v4 = v39;
          }
          else {
            uint64_t v4 = v45;
          }
          if (v51 && v52) {
            unint64_t v53 = v38;
          }
          else {
            unint64_t v53 = v44;
          }
          if (v53 == v37) {
            return v11;
          }
          uint64_t v54 = (char *)v53 - (char *)v37 + 2;
          int8x16_t v55 = v53 - 1;
          do
          {
            unsigned int v56 = *v55--;
            v54 -= 2;
          }
          while ((sEuroCharType[v56] & 0x87) == 0);
          if (v41)
          {
            char v57 = (((unint64_t)this[1] & 2) == 0) | v40;
            if (this[1]) {
              char v57 = 0;
            }
            if ((v42 & 1) == 0) {
              goto LABEL_110;
            }
          }
          else
          {
            char v57 = 0;
            if ((v42 & 1) == 0) {
              goto LABEL_110;
            }
          }
          if (LSMCommonParser::DefiniteWord(this, v37, v54 >> 1, v57 & 1)) {
            return 0;
          }
LABEL_110:
          if (v4 >= v36) {
            return v11;
          }
          goto LABEL_67;
        }
        BOOL v48 = v43 >= 4 && v39 == 0;
        if (v48) {
          float v49 = v45;
        }
        else {
          float v49 = v39;
        }
        if (v48) {
          float v50 = v44;
        }
        else {
          float v50 = v38;
        }
        if (v46 == 64)
        {
          float v39 = v49;
          float v38 = v50;
        }
        goto LABEL_90;
      }
LABEL_91:
      ++v45;
      float v44 = &v37[v43];
      if (v45 >= v36) {
        goto LABEL_94;
      }
    }
    char v42 = 1;
    char v41 = 1;
    goto LABEL_90;
  }
  unint64_t v9 = (uint64_t (*)(void))*((void *)*this + 3);
  return (unsigned __int16 *)v9();
}

uint64_t LSMCommonParser::DefiniteWord(CFLocaleRef *this, unsigned __int16 *a2, CFIndex a3, int a4)
{
  CFStringRef v6 = CFStringCreateWithCharactersNoCopy(0, a2, a3, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (a4)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, v6);
    CFStringLowercase(MutableCopy, this[3]);
    uint64_t v8 = (**(uint64_t (***)(void))this[2])();
    CFRelease(MutableCopy);
  }
  else
  {
    uint64_t v8 = (**(uint64_t (***)(CFLocaleRef, const __CFString *))this[2])(this[2], v6);
  }
  CFRelease(v6);
  return v8;
}

void LSMICUParser::~LSMICUParser(LSMICUParser *this)
{
  *(void *)this = &unk_26C7C6D20;
  if (*((void *)this + 261)) {
    ubrk_close();
  }
}

{
  *(void *)this = &unk_26C7C6D20;
  if (*((void *)this + 261)) {
    ubrk_close();
  }
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C7C6D20;
  if (*((void *)this + 261)) {
    ubrk_close();
  }
  JUMPOUT(0x21D44C230);
}

void sub_2177D8D5C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x10E1C40C3431A7DLL);
  _Unwind_Resume(a1);
}

LSMICUParser *LSMICUParser::ParseUnicodeSegment(LSMICUParser *this, LSMICUParser *a2, int a3)
{
  if (*((void *)this + 261)) {
    ubrk_setText();
  }
  else {
    *((void *)this + 261) = ubrk_open();
  }
  int v6 = ubrk_first();
  int v7 = ubrk_next();
  if ((int)((unint64_t)(this - a2 + 1568) >> 1) < a3) {
    a3 = (unint64_t)(this - a2 + 1568) >> 1;
  }
  if (v6 != -1)
  {
    if (v7 != -1 && v7 < a3)
    {
      while (1)
      {
        int v9 = v7;
        if (v6)
        {
          if (LSMICUParser::PossibleWord(this, (unsigned __int16 *)a2 + v6, v7 - v6)) {
            return 0;
          }
        }
        int v7 = ubrk_next();
        BOOL v10 = v7 != -1 && v7 < a3;
        int v6 = v9;
        if (!v10) {
          return (LSMICUParser *)((char *)a2 + 2 * v9);
        }
      }
    }
    else
    {
      int v9 = v6;
      return (LSMICUParser *)((char *)a2 + 2 * v9);
    }
  }
  return a2;
}

uint64_t LSMICUParser::PossibleWord(LSMICUParser *this, unsigned __int16 *a2, CFIndex a3)
{
  char v5 = 0;
  char v6 = 0;
  char v7 = 0;
  char v8 = 0;
  int v9 = a2;
  BOOL v10 = &a2[a3];
  do
  {
    if (v9 >= v10) {
      break;
    }
    uint64_t v11 = v9 + 1;
    int v12 = u_charType(*v9);
    switch(v12)
    {
      case 1:
      case 3:
        char v8 = ((*((unsigned char *)this + 8) & 2) == 0) | v7;
        char v5 = 1;
        char v6 = 1;
        break;
      case 2:
      case 5:
        char v5 = 1;
        char v7 = 1;
        char v8 = v6;
        break;
      case 4:
        break;
      default:
        if (v12 == 18)
        {
          if (v11 < v10) {
            u_charType(v9[1] & 0x3FF | ((*v9 & 0x3FF) << 10) | 0x10000);
          }
          uint64_t v11 = v9 + 2;
        }
        break;
    }
    char v13 = (*((unsigned char *)this + 8) & 1) != 0 ? v5 : v8;
    int v9 = v11;
  }
  while ((v13 & 1) == 0);
  if ((v5 & 1) == 0) {
    return 0;
  }
  int v14 = (v8 & 1) != 0 && (*((unsigned char *)this + 8) & 1) == 0;
  return LSMCommonParser::DefiniteWord((CFLocaleRef *)this, a2, a3, v14);
}

void LSMChineseParser::~LSMChineseParser(LSMChineseParser *this)
{
  *(void *)this = &unk_26C7C6D50;
  uint64_t v1 = (const void *)*((void *)this + 2);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v1;

  *(void *)this = &unk_26C7C6D50;
  uint64_t v1 = (const void *)*((void *)this + 2);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C7C6D50;
  uint64_t v1 = (const void *)*((void *)this + 2);
  if (v1) {
    CFRelease(v1);
  }
  JUMPOUT(0x21D44C230);
}

void sub_2177D9114(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

CFStringTokenizerTokenType LSMChineseParser::AddWords(LSMChineseParser *this, CFStringRef theString)
{
  if (!*((void *)this + 1)) {
    return 1;
  }
  uint64_t v3 = (__CFStringTokenizer *)*((void *)this + 2);
  if (!v3) {
    return 1;
  }
  v9.CFIndex length = CFStringGetLength(theString);
  v9.location = 0;
  CFStringTokenizerSetString(v3, theString, v9);
  CFStringTokenizerTokenType result = CFStringTokenizerAdvanceToNextToken(*((CFStringTokenizerRef *)this + 2));
  if (result)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*((void *)this + 2));
      CFStringRef v7 = CFStringCreateWithSubstring(v6, theString, CurrentTokenRange);
      if (v7)
      {
        CFStringRef v8 = v7;
        (***((void (****)(void, CFStringRef))this + 1))(*((void *)this + 1), v7);
        CFRelease(v8);
      }
      CFStringTokenizerTokenType result = CFStringTokenizerAdvanceToNextToken(*((CFStringTokenizerRef *)this + 2));
    }
    while (result);
  }
  return result;
}

void LSMSVDDenseFloat::StartColumns(LSMSVDDenseFloat *this)
{
  uint64_t v2 = (void **)((char *)this + 24);
  unint64_t v3 = ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 3);
  uint64_t v4 = *((void *)this + 6);
  if (v4 < v3)
  {
    LSMVectorBase::Allocate((const void **)this + 3, v3, 1);
    uint64_t v4 = *((void *)this + 6);
  }
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  *((void *)this + 5) = v4;
  if (v4 >= 1) {
    bzero(*v2, 4 * (v4 - ((v4 & 0x3FFFFFFFFFFFFFFFLL) != 0)) + 4);
  }
  unint64_t v5 = *((unsigned int *)this + 3);
  unint64_t v6 = *((void *)this + 14);
  unint64_t v7 = v5;
  if (v6 < v5)
  {
    LSMVectorBase::Allocate((const void **)this + 11, *((unsigned int *)this + 3), 1);
    unint64_t v6 = *((void *)this + 14);
    unint64_t v7 = *((unsigned int *)this + 3);
  }
  if (v6 >= v5) {
    unint64_t v6 = v5;
  }
  *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v6;
  unint64_t v8 = ((v7 + 3) & 0x1FFFFFFFCLL) * v7;
  unint64_t v9 = *((void *)this + 10);
  if (v9 < v8)
  {
    LSMVectorBase::Allocate((const void **)this + 7, ((v7 + 3) & 0x1FFFFFFFCLL) * v7, 1);
    unint64_t v9 = *((void *)this + 10);
  }
  if (v9 >= v8) {
    unint64_t v9 = v8;
  }
  *((void *)this + 9) = v9;
}

float LSMSVDDenseFloat::ProcessElement(LSMSVDDenseFloat *this, uint64_t a2, uint64_t a3, double a4)
{
  float result = a4;
  *(float *)(*((void *)this + 3) + 4 * (a2 + ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * a(*(void (**)(void))(**((void **)this + 3) + 40))(*((void *)this + 3)) = result;
  return result;
}

void LSMSVDDenseFloat::Compute(LSMSVDDenseFloat *this, char a2)
{
  __CLPK_integer v4 = *((_DWORD *)this + 2);
  uint64_t v5 = *((int *)this + 3);
  __CLPK_integer __n = v5;
  __CLPK_integer __m = v4;
  __CLPK_integer v32 = (v5 + 3) & 0xFFFFFFFC;
  __CLPK_integer __ldu = (v4 + 3) & 0xFFFFFFFC;
  __CLPK_integer v31 = -1;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__work, 4, 1uLL);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__iwork, 4, 8 * v5);
  __CLPK_integer v27 = 0;
  if ((a2 & 0x10) != 0)
  {
    unint64_t v6 = *((void *)this + 5);
    unint64_t v7 = *((void *)this + 36);
    if (v7 < v6)
    {
      LSMVectorBase::Allocate((const void **)this + 33, *((void *)this + 5), 1);
      unint64_t v7 = *((void *)this + 36);
    }
    uint64_t v8 = *((void *)this + 5);
    if (v7 >= v6) {
      unint64_t v7 = v6;
    }
    *((void *)this + 35) = v7;
    if (v8) {
      memmove(*((void **)this + 33), *((const void **)this + 3), 4 * v8);
    }
  }
  if (__n == 1)
  {
    **((_DWORD **)this + 11) = 1065353216;
    **((_DWORD **)this + LSMVectorBase::~LSMVectorBase(this + 7) = 1065353216;
  }
  else
  {
    sgesdd_("O", &__m, &__n, *((__CLPK_real **)this + 3), &__ldu, *((__CLPK_real **)this + 11), 0, &__ldu, *((__CLPK_real **)this + 7), &v32, (__CLPK_real *)__work[0], &v31, __iwork[0], &v27);
    unint64_t v9 = (__CLPK_real *)__work[0];
    BOOL v10 = (void *)v30;
    int v11 = (int)(*(float *)__work[0] + 0.0001);
    __CLPK_integer v31 = v11;
    unint64_t v12 = v11;
    if (v30 < v11)
    {
      LSMVectorBase::Allocate((const void **)__work, v11, 1);
      BOOL v10 = (void *)v30;
      unint64_t v9 = (__CLPK_real *)__work[0];
    }
    if ((unint64_t)v10 >= v12) {
      BOOL v10 = (void *)v12;
    }
    __work[2] = v10;
    sgesdd_("O", &__m, &__n, *((__CLPK_real **)this + 3), &__ldu, *((__CLPK_real **)this + 11), 0, &__ldu, *((__CLPK_real **)this + 7), &v32, v9, &v31, __iwork[0], &v27);
    LSMVectorBase::clear(__work);
    LSMVectorBase::clear((void **)__iwork);
    unsigned int v13 = *((_DWORD *)this + 4);
    if (v13 < *((_DWORD *)this + 3))
    {
      signed int v14 = (v13 + 3) & 0xFFFFFFFC;
      if (v32 > v14)
      {
        __CLPK_integer v15 = __n;
        if (__n >= 2)
        {
          uint64_t v16 = 1;
          uint64_t v17 = 4 * v14;
          do
          {
            memmove((void *)(*((void *)this + 7) + v17), (const void *)(*((void *)this + 7) + 4 * v16 * v32), 4 * *((unsigned int *)this + 4));
            ++v16;
            __CLPK_integer v15 = __n;
            v17 += 4 * v14;
          }
          while (v16 < __n);
        }
        unint64_t v18 = v15 * v14;
        unint64_t v19 = *((void *)this + 10);
        if (v19 < v18)
        {
          LSMVectorBase::Allocate((const void **)this + 7, v18, 1);
          unint64_t v19 = *((void *)this + 10);
        }
        if (v19 >= v18) {
          unint64_t v19 = v18;
        }
        *((void *)this + 9) = v19;
        LSMVectorBase::LSMVectorBase((LSMVectorBase *)v26, (LSMSVDDenseFloat *)((char *)this + 56));
        LSMVectorBase::Swap((uint64_t *)v26, (LSMSVDDenseFloat *)((char *)this + 56));
        LSMVectorBase::clear(v26);
        LSMVectorBase::~LSMVectorBase(v26);
        unsigned int v13 = *((_DWORD *)this + 4);
      }
      unint64_t v20 = v13;
      unint64_t v21 = *((void *)this + 14);
      if (v21 < v13)
      {
        LSMVectorBase::Allocate((const void **)this + 11, v13, 1);
        unint64_t v21 = *((void *)this + 14);
      }
      if (v21 >= v20) {
        unint64_t v22 = v20;
      }
      else {
        unint64_t v22 = v21;
      }
      *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v22;
      LSMVectorBase::LSMVectorBase((LSMVectorBase *)v26, (LSMSVDDenseFloat *)((char *)this + 88));
      LSMVectorBase::Swap((uint64_t *)v26, (LSMSVDDenseFloat *)((char *)this + 88));
      LSMVectorBase::clear(v26);
      unint64_t v23 = (*((_DWORD *)this + 4) * __ldu);
      unint64_t v24 = *((void *)this + 6);
      if (v24 < v23)
      {
        LSMVectorBase::Allocate((const void **)this + 3, (*((_DWORD *)this + 4) * __ldu), 1);
        unint64_t v24 = *((void *)this + 6);
      }
      if (v24 >= v23) {
        unint64_t v24 = v23;
      }
      *((void *)this + 5) = v24;
      LSMVectorBase::LSMVectorBase((LSMVectorBase *)v25, (LSMSVDDenseFloat *)((char *)this + 24));
      LSMVectorBase::Swap((uint64_t *)v25, (LSMSVDDenseFloat *)((char *)this + 24));
      LSMVectorBase::clear(v25);
      LSMVectorBase::~LSMVectorBase(v25);
      LSMVectorBase::~LSMVectorBase(v26);
    }
  }
  LSMVectorBase::~LSMVectorBase((void **)__iwork);
  LSMVectorBase::~LSMVectorBase(__work);
}

void sub_2177D96E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  LSMVectorBase::~LSMVectorBase((void **)va);
  LSMVectorBase::~LSMVectorBase((void **)(v16 - 136));
  _Unwind_Resume(a1);
}

void LSMSVDDenseFloatTrans::StartColumns(LSMSVDDenseFloatTrans *this)
{
  uint64_t v2 = (void **)((char *)this + 24);
  unint64_t v3 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 2);
  uint64_t v4 = *((void *)this + 6);
  if (v4 < v3)
  {
    LSMVectorBase::Allocate((const void **)this + 3, v3, 1);
    uint64_t v4 = *((void *)this + 6);
  }
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  *((void *)this + 5) = v4;
  if (v4 >= 1) {
    bzero(*v2, 4 * (v4 - ((v4 & 0x3FFFFFFFFFFFFFFFLL) != 0)) + 4);
  }
  unint64_t v5 = *((unsigned int *)this + 2);
  unint64_t v6 = *((void *)this + 14);
  unint64_t v7 = v5;
  if (v6 < v5)
  {
    LSMVectorBase::Allocate((const void **)this + 11, *((unsigned int *)this + 2), 1);
    unint64_t v6 = *((void *)this + 14);
    unint64_t v7 = *((unsigned int *)this + 2);
  }
  if (v6 >= v5) {
    unint64_t v6 = v5;
  }
  *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v6;
  unint64_t v8 = ((v7 + 3) & 0x1FFFFFFFCLL) * v7;
  unint64_t v9 = *((void *)this + 10);
  if (v9 < v8)
  {
    LSMVectorBase::Allocate((const void **)this + 7, ((v7 + 3) & 0x1FFFFFFFCLL) * v7, 1);
    unint64_t v9 = *((void *)this + 10);
  }
  if (v9 >= v8) {
    unint64_t v9 = v8;
  }
  *((void *)this + 9) = v9;
}

float LSMSVDDenseFloatTrans::ProcessElement(LSMSVDDenseFloatTrans *this, uint64_t a2, uint64_t a3, double a4)
{
  float result = a4;
  *(float *)(*((void *)this + 3) + 4 * (a3 + ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * a2)) = result;
  return result;
}

void LSMSVDDenseFloatTrans::Compute(int32x2_t *this, char a2)
{
  this[1] = vrev64_s32(this[1]);
  LSMSVDDenseFloat::Compute((LSMSVDDenseFloat *)this, a2);
  LSMSVD::TransposeUV(this);
}

void LSMSVDDenseDouble::StartColumns(LSMSVDDenseDouble *this)
{
  uint64_t v2 = (void **)((char *)this + 296);
  unint64_t v3 = ((*((unsigned int *)this + 2) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 3);
  uint64_t v4 = *((void *)this + 40);
  if (v4 < v3)
  {
    LSMVectorBase::Allocate((const void **)this + 37, v3, 1);
    uint64_t v4 = *((void *)this + 40);
  }
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  *((void *)this + 39) = v4;
  if (v4 >= 1)
  {
    unint64_t v5 = *v2;
    bzero(v5, 8 * (v4 - ((v4 & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
  }
}

uint64_t LSMSVDDenseDouble::ProcessElement(uint64_t this, uint64_t a2, uint64_t a3, double a4)
{
  *(double *)(*(void *)(this + 296) + 8 * (a2 + ((*(unsigned int *)(this + 8) + 3) & 0x1FFFFFFFCLL) * a(*(void (**)(void))(**((void **)this + 3) + 40))(*((void *)this + 3)) = a4;
  return this;
}

void LSMSVDDenseDouble::Compute(LSMSVDDenseDouble *this, char a2)
{
  __CLPK_integer v4 = *((_DWORD *)this + 2);
  unint64_t v5 = *((int *)this + 3);
  __CLPK_integer __n = v5;
  __CLPK_integer __m = v4;
  __CLPK_integer v59 = (v5 + 3) & 0xFFFFFFFC;
  __CLPK_integer __ldu = (v4 + 3) & 0xFFFFFFFC;
  __CLPK_integer v58 = -1;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v57, 8, v5);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__vt, 8, (int)(v5 * ((v5 + 3) & 0xFFFFFFFC)));
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__work, 8, 1uLL);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__iwork, 4, 8 * __n);
  unint64_t v6 = (__CLPK_doublereal **)((char *)this + 296);
  __CLPK_integer v52 = 0;
  if ((a2 & 0x10) != 0)
  {
    unint64_t v8 = *((void *)this + 39);
    unint64_t v9 = *((void *)this + 36);
    if (v9 < v8)
    {
      LSMVectorBase::Allocate((const void **)this + 33, *((void *)this + 39), 1);
      unint64_t v9 = *((void *)this + 36);
    }
    uint64_t v10 = *((void *)this + 39);
    if (v9 >= v8) {
      unint64_t v9 = v8;
    }
    *((void *)this + 35) = v9;
    unint64_t v7 = (__CLPK_doublereal *)*((void *)this + 37);
    if (v10)
    {
      unint64_t v11 = 0;
      unint64_t v12 = (float *)*((void *)this + 33);
      uint64_t v13 = 8 * v10;
      do
      {
        float v14 = v7[v11 / 8];
        *v12++ = v14;
        v11 += 8;
      }
      while (v13 != v11);
    }
  }
  else
  {
    unint64_t v7 = *v6;
  }
  dgesdd_("O", &__m, &__n, v7, &__ldu, (__CLPK_doublereal *)v57[0], 0, &__ldu, __vt[0], &v59, __work[0], &v58, __iwork[0], &v52);
  __CLPK_integer v15 = __work[0];
  uint64_t v16 = (__CLPK_doublereal *)v55;
  int v17 = (int)(*__work[0] + 0.0001);
  __CLPK_integer v58 = v17;
  unint64_t v18 = (__CLPK_doublereal *)v17;
  if (v55 < v17)
  {
    LSMVectorBase::Allocate((const void **)__work, v17, 1);
    uint64_t v16 = (__CLPK_doublereal *)v55;
    __CLPK_integer v15 = __work[0];
  }
  if (v16 >= v18) {
    uint64_t v16 = v18;
  }
  __work[2] = v16;
  dgesdd_("O", &__m, &__n, *v6, &__ldu, (__CLPK_doublereal *)v57[0], 0, &__ldu, __vt[0], &v59, v15, &v58, __iwork[0], &v52);
  LSMVectorBase::clear((void **)__work);
  LSMVectorBase::clear((void **)__iwork);
  uint64_t v19 = (*((unsigned int *)this + 4) + 3) & 0x1FFFFFFFCLL;
  __CLPK_integer v20 = __n;
  uint64_t v21 = __n;
  unint64_t v22 = v19 * __n;
  unint64_t v23 = *((void *)this + 10);
  if (v23 < v22)
  {
    LSMVectorBase::Allocate((const void **)this + 7, v19 * __n, 1);
    unint64_t v23 = *((void *)this + 10);
    __CLPK_integer v20 = __n;
    uint64_t v21 = __n;
  }
  if (v23 >= v22) {
    unint64_t v23 = v22;
  }
  *((void *)this + 9) = v23;
  if (v20 >= 1)
  {
    uint64_t v24 = 0;
    uint64_t v25 = __vt[0];
    uint64_t v26 = v59;
    uint64_t v27 = *((unsigned int *)this + 4);
    uint64_t v28 = *((void *)this + 7);
    do
    {
      if (v27)
      {
        float v29 = (float *)(v28 + 4 * v24 * v19);
        unint64_t v30 = &v25[v24 * v26];
        uint64_t v31 = 8 * v27;
        do
        {
          double v32 = *v30++;
          float v33 = v32;
          *v29++ = v33;
          v31 -= 8;
        }
        while (v31);
      }
      ++v24;
    }
    while (v24 != v21);
  }
  LSMVectorBase::clear((void **)__vt);
  unint64_t v34 = *((unsigned int *)this + 4);
  unint64_t v35 = *((void *)this + 14);
  if (v35 < v34)
  {
    LSMVectorBase::Allocate((const void **)this + 11, *((unsigned int *)this + 4), 1);
    unint64_t v35 = *((void *)this + 14);
  }
  uint64_t v36 = *((unsigned int *)this + 4);
  int v37 = *((_DWORD *)this + 4);
  if (v35 >= v34) {
    unint64_t v35 = v34;
  }
  *((void *)this + 1LSMVectorBase::~LSMVectorBase(this + 3) = v35;
  if (v37)
  {
    float v38 = (double *)v57[0];
    float v39 = (float *)*((void *)this + 11);
    uint64_t v40 = 8 * v36;
    do
    {
      double v41 = *v38++;
      float v42 = v41;
      *v39++ = v42;
      v40 -= 8;
    }
    while (v40);
  }
  LSMVectorBase::clear(v57);
  unint64_t v43 = (*((_DWORD *)this + 4) * __ldu);
  unint64_t v44 = *((void *)this + 6);
  if (v44 < v43)
  {
    LSMVectorBase::Allocate((const void **)this + 3, (*((_DWORD *)this + 4) * __ldu), 1);
    unint64_t v44 = *((void *)this + 6);
  }
  uint64_t v45 = (*((_DWORD *)this + 4) * __ldu);
  int v46 = *((_DWORD *)this + 4) * __ldu;
  if (v44 >= v43) {
    unint64_t v44 = v43;
  }
  *((void *)this + 5) = v44;
  if (v46)
  {
    int v47 = (double *)*((void *)this + 37);
    BOOL v48 = (float *)*((void *)this + 3);
    uint64_t v49 = 8 * v45;
    do
    {
      double v50 = *v47++;
      float v51 = v50;
      *v48++ = v51;
      v49 -= 8;
    }
    while (v49);
  }
  LSMVectorBase::clear((void **)this + 37);
  LSMVectorBase::~LSMVectorBase((void **)__iwork);
  LSMVectorBase::~LSMVectorBase((void **)__work);
  LSMVectorBase::~LSMVectorBase((void **)__vt);
  LSMVectorBase::~LSMVectorBase(v57);
}

void sub_2177D9D4C(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase((void **)(v1 - 104));
  _Unwind_Resume(a1);
}

void LSMSVDDenseDoubleTrans::StartColumns(LSMSVDDenseDoubleTrans *this)
{
  uint64_t v2 = (void **)((char *)this + 296);
  unint64_t v3 = ((*((unsigned int *)this + 3) + 3) & 0x1FFFFFFFCLL) * *((unsigned int *)this + 2);
  uint64_t v4 = *((void *)this + 40);
  if (v4 < v3)
  {
    LSMVectorBase::Allocate((const void **)this + 37, v3, 1);
    uint64_t v4 = *((void *)this + 40);
  }
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  *((void *)this + 39) = v4;
  if (v4 >= 1)
  {
    unint64_t v5 = *v2;
    bzero(v5, 8 * (v4 - ((v4 & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
  }
}

uint64_t LSMSVDDenseDoubleTrans::ProcessElement(uint64_t this, uint64_t a2, uint64_t a3, double a4)
{
  *(double *)(*(void *)(this + 296) + 8 * (a3 + ((*(unsigned int *)(this + 12) + 3) & 0x1FFFFFFFCLL) * a2)) = a4;
  return this;
}

void LSMSVDDenseDoubleTrans::Compute(int32x2_t *this, char a2)
{
  this[1] = vrev64_s32(this[1]);
  LSMSVDDenseDouble::Compute((LSMSVDDenseDouble *)this, a2);
  LSMSVD::TransposeUV(this);
}

void LSMSVDDenseFloat::~LSMSVDDenseFloat(void **this)
{
  LSMSVD::~LSMSVD(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177D9EEC(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40EAFC6A38);
  _Unwind_Resume(a1);
}

void LSMSVDDenseFloatTrans::~LSMSVDDenseFloatTrans(void **this)
{
  LSMSVD::~LSMSVD(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177D9F5C(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C40EAFC6A38);
  _Unwind_Resume(a1);
}

void LSMSVDDenseDouble::~LSMSVDDenseDouble(void **this)
{
  *this = &unk_26C7C6F00;
  LSMVectorBase::~LSMVectorBase(this + 37);
  LSMSVD::~LSMSVD(this);
}

{
  uint64_t vars8;

  *this = &unk_26C7C6F00;
  LSMVectorBase::~LSMVectorBase(this + 37);
  LSMSVD::~LSMSVD(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177D9FD8(_Unwind_Exception *a1)
{
  LSMSVD::~LSMSVD(v1);
  _Unwind_Resume(a1);
}

void sub_2177DA060(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C403EA31E41);
  _Unwind_Resume(a1);
}

void LSMSVDDenseDoubleTrans::~LSMSVDDenseDoubleTrans(void **this)
{
  *this = &unk_26C7C6F00;
  LSMVectorBase::~LSMVectorBase(this + 37);
  LSMSVD::~LSMSVD(this);
}

{
  uint64_t vars8;

  *this = &unk_26C7C6F00;
  LSMVectorBase::~LSMVectorBase(this + 37);
  LSMSVD::~LSMSVD(this);
  JUMPOUT(0x21D44C230);
}

void sub_2177DA0F0(_Unwind_Exception *a1)
{
  LSMSVD::~LSMSVD(v1);
  _Unwind_Resume(a1);
}

void sub_2177DA178(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1081C403EA31E41);
  _Unwind_Resume(a1);
}

void LSMCFType::~LSMCFType(LSMCFType *this)
{
}

uint64_t LSMCFCopy(const __CFAllocator *a1, char *a2)
{
  return (*(uint64_t (**)(char *, const __CFAllocator *))(*((void *)a2 + 2) + 16))(a2 + 16, a1);
}

uint64_t LSMCFFinalize(uint64_t (***a1)(void))
{
  return (*a1[2])();
}

uint64_t LSMCFEqual(void *a1, const void *a2)
{
  return (*(uint64_t (**)(void))(a1[2] + 24))();
}

uint64_t LSMCFHash(void *a1)
{
  return (*(uint64_t (**)(void))(a1[2] + 32))();
}

uint64_t LSMCFCopyFormattingDesc(void *a1, const __CFDictionary *a2)
{
  return (*(uint64_t (**)(void))(a1[2] + 40))();
}

uint64_t LSMCFCopyDebugDesc(void *a1)
{
  return (*(uint64_t (**)(void))(a1[2] + 48))();
}

void LSMClusterer::LSMClusterer(LSMClusterer *this, const LSMClassifier *a2, uint64_t a3, uint64_t a4)
{
  *(void *)this = a2;
  unint64_t v8 = (LSMClusterer *)((char *)this + 40);
  LSMVectorBase::LSMVectorBase((LSMClusterer *)((char *)this + 8), 4);
  LSMVectorBase::LSMVectorBase(v8, 4);
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  LSMVectorBase::LSMVectorBase((LSMClusterer *)((char *)this + 88), 4);
  *((void *)this + LSMVectorBase::~LSMVectorBase(this + 15) = a3;
  *((void *)this + 16) = a4;
  int v9 = *((unsigned __int8 *)a2 + 248);
  *((unsigned char *)this + 136) = v9;
  if (v9)
  {
    uint64_t v10 = 8;
    if ((a4 & 3) == 0) {
      uint64_t v10 = 12;
    }
    LSMClusterer::InitCategories((uint64_t *)this, *(unsigned int *)(*(void *)this + v10));
  }
}

void sub_2177DA360(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v3);
  LSMVectorBase::~LSMVectorBase(v2);
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

uint64_t *LSMClusterer::InitCategories(uint64_t *this, unint64_t a2)
{
  unint64_t v3 = this;
  uint64_t v4 = this + 1;
  unint64_t v5 = this[4];
  if (v5 < a2)
  {
    this = (uint64_t *)LSMVectorBase::Allocate((const void **)this + 1, a2, 1);
    unint64_t v5 = v3[4];
  }
  if (v5 >= a2) {
    unint64_t v5 = a2;
  }
  v3[3] = v5;
  if (v3[8] >= a2)
  {
    v3[7] = a2;
    if (!a2) {
      return this;
    }
  }
  else
  {
    this = (uint64_t *)LSMVectorBase::Allocate((const void **)v3 + 5, a2, 1);
    unint64_t v6 = v3[8];
    if (v6 >= a2) {
      unint64_t v6 = a2;
    }
    v3[7] = v6;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *v4;
  do
  {
    *(_DWORD *)(v8 + 4 * vLSMVectorBase::~LSMVectorBase(this + 7) = v7;
    ++v7;
  }
  while (a2 > v7);
  return this;
}

void LSMClusterer::~LSMClusterer(LSMClusterer *this)
{
  uint64_t v2 = *((void *)this + 10);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 - 8);
    if (v3)
    {
      uint64_t v4 = 32 * v3;
      do
      {
        LSMVectorBase::~LSMVectorBase((void **)(v2 - 32 + v4));
        v4 -= 32;
      }
      while (v4);
    }
    MEMORY[0x21D44C210](v2 - 16, 0x1080C806679C861);
  }
  LSMVectorBase::~LSMVectorBase((void **)this + 11);
  LSMVectorBase::~LSMVectorBase((void **)this + 5);
  LSMVectorBase::~LSMVectorBase((void **)this + 1);
}

void sub_2177DA4D8(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase((void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t LSMClusterer::operator[](uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8) + 4 * *(unsigned int *)(*(void *)(a1 + 88) + 4 * a2);
}

void LSMClusterer::Subset(uint64_t a1, const LSMVectorBase *a2)
{
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v3, a2);
  LSMVectorBase::Swap((uint64_t *)(a1 + 8), (LSMVectorBase *)v3);
  LSMVectorBase::~LSMVectorBase(v3);
}

void sub_2177DA5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t LSMClusterer::Subcluster(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 72) = a2;
  *(void *)(result + 80) = a3;
  return result;
}

void LSMClusterer::Compute(LSMClusterer *this)
{
  uint64_t v2 = *(unsigned int *)(*(void *)this + 16);
  uint64_t v3 = (v2 + 3) & 0x1FFFFFFFCLL;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v12, 4, v3 * *((void *)this + 3));
  uint64_t v4 = *((void *)this + 16);
  uint64_t v5 = *(void *)this;
  if ((v4 & 3) != 0)
  {
    unint64_t v6 = (uint64_t *)(v5 + 24);
    int v7 = (*(_DWORD *)(v5 + 8) + 3) & 0xFFFFFFFC;
    uint64_t v3 = 1;
  }
  else
  {
    unint64_t v6 = (uint64_t *)(v5 + 56);
    int v7 = 1;
  }
  if (*((void *)this + 3))
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = *v6;
    do
    {
      uint64_t v11 = *(unsigned int *)(*((void *)this + 1) + 4 * v9);
      *(_DWORD *)(*((void *)this + 5) + 4 * v11) = v9;
      cblas_scopy(v2, (const float *)(v10 + 4 * v3 * v11), v7, (float *)((char *)v12[0] + v8), 1);
      ++v9;
      v8 += (4 * (v2 + 3)) & 0x7FFFFFFF0;
    }
    while (v9 < *((void *)this + 3));
    uint64_t v4 = *((void *)this + 16);
  }
  if ((v4 & 4) != 0) {
    LSMClusterer::ComputeAgglomerative(this, (LSMVectorBase *)v12);
  }
  else {
    LSMClusterer::ComputeKMeans((uint64_t *)this, v12);
  }
  LSMVectorBase::~LSMVectorBase(v12);
}

void sub_2177DA6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void LSMClusterer::ComputeAgglomerative(void *a1, LSMVectorBase *a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1[3];
  unint64_t v5 = *(unsigned int *)(*a1 + 16);
  if (a1[9]) {
    unint64_t v6 = a1[9];
  }
  else {
    unint64_t v6 = a1[3];
  }
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v114, 4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v113, 4, v6);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v112, 4, v6);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v111, 4, v6);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v110, 4, v6);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v109, 4, v4);
  uint64_t v7 = (v5 + 3) & 0x1FFFFFFFCLL;
  if (v3[9])
  {
    unint64_t v8 = v115;
    if (v115 < v7 * v6)
    {
      LSMVectorBase::Allocate((const void **)v114, v7 * v6, 1);
      unint64_t v8 = v115;
    }
    if (v8 >= v7 * v6) {
      unint64_t v8 = v7 * v6;
    }
    v114[2] = (void *)v8;
  }
  else
  {
    LSMVectorBase::Swap((uint64_t *)v114, a2);
  }
  uint64_t v100 = (v5 + 3) & 0x1FFFFFFFCLL;
  unint64_t __N = v5;
  bzero(v113[0], 4 * v6);
  uint64_t v97 = 4 * (v5 + 3);
  v98 = v3;
  if (v6)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    do
    {
      *((_DWORD *)v112[0] + v11) = 1;
      if (v3[9])
      {
        uint64_t v12 = *(unsigned int *)(v3[5] + 4 * **(unsigned int **)(v3[10] + v9));
        cblas_scopy(__N, (const float *)(*(void *)a2 + 4 * v100 * v12), 1, (float *)((char *)v114[0] + v10), 1);
      }
      else
      {
        LODWORD(v12) = v11;
      }
      *((_DWORD *)v111[0] + v11) = v12;
      *((_DWORD *)v110[0] + v11++) = v12;
      v10 += v97 & 0x7FFFFFFF0;
      v9 += 32;
      uint64_t v3 = v98;
    }
    while (v6 != v11);
  }
  bzero(v109[0], 4 * v4);
  uint64_t v13 = v100;
  if (v3[9])
  {
    unint64_t v14 = 0;
    do
    {
      LSMVectorBase::LSMVectorBase((LSMVectorBase *)__A, (const LSMVectorBase *)(v3[10] + 32 * v14));
      int v15 = v107;
      if (v107 < 2)
      {
        float v19 = 0.0;
      }
      else
      {
        uint64_t v16 = (float *)((char *)v114[0] + 4 * v14 * v100);
        int v17 = v110[0];
        float v18 = 1.0;
        float v19 = 0.0;
        for (unint64_t i = 1; i < v107; ++i)
        {
          uint64_t v21 = *(unsigned int *)(v3[5] + 4 * LODWORD(__A[0][i]));
          unint64_t v22 = (const float *)(*(void *)a2 + 4 * v100 * v21);
          float v23 = EuclidianVecDistance(__N, v16, v22);
          cblas_sscal(__N, v18 / (float)(v18 + 1.0), v16, 1);
          cblas_saxpy(__N, 1.0 / (float)(v18 + 1.0), v22, 1, v16, 1);
          float v19 = (float)((float)(v19 * (float)(v18 * v19)) / (float)(v18 + 1.0))
              + (float)((float)(v23 * (float)(v18 * v23)) / (float)((float)(v18 + 1.0) * (float)(v18 + 1.0)));
          *((_DWORD *)v109[0] + v17[v14]) = v21 + 1;
          v17[v14] = v21;
          int v15 = v107;
          float v18 = v18 + 1.0;
        }
      }
      *((_DWORD *)v112[0] + v14) = v15;
      *((float *)v113[0] + v14) = v19;
      LSMVectorBase::~LSMVectorBase((void **)__A);
      ++v14;
      unint64_t v4 = v3[9];
    }
    while (v14 < v4);
    LSMVectorBase::clear((void **)a2);
  }
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__A, 4);
  unint64_t v101 = v4 - 1;
  unint64_t v24 = ((v4 - 1) * v4) >> 1;
  unint64_t v25 = v108;
  if (v108 < v24)
  {
    LSMVectorBase::Allocate((const void **)__A, ((v4 - 1) * v4) >> 1, 1);
    unint64_t v25 = v108;
  }
  if (v25 >= v24) {
    unint64_t v25 = ((v4 - 1) * v4) >> 1;
  }
  unint64_t v107 = v25;
  if (v4 >= 2)
  {
    uint64_t v26 = 0;
    for (uint64_t j = 1; j != v4; ++j)
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      do
      {
        float v30 = EuclidianVecDistance(__N, (const float *)v114[0] + j * v13, (const float *)((char *)v114[0] + v28));
        if (v3[9])
        {
          unsigned int v31 = *((_DWORD *)v112[0] + j);
          unsigned int v32 = *((_DWORD *)v112[0] + v29);
          float v33 = (float)((float)(v30 * (float)(v30 * (float)(v32 * v31)))
                      / (float)((float)(v32 + v31) * (float)(v32 + v31)))
              + (float)((float)((float)(*((float *)v113[0] + v29) * (float)v32)
                              + (float)((float)v31 * *((float *)v113[0] + j)))
                      / (float)(v32 + v31));
        }
        else
        {
          float v33 = (float)(v30 * v30) * 0.25;
        }
        __A[0][v26 + v29++] = v33;
        v28 += v97 & 0x7FFFFFFF0;
      }
      while (j != v29);
      v26 += v29;
      uint64_t v13 = v100;
    }
  }
  if ((LSMDebugFlags::sLSMDebug & 0x20) != 0)
  {
    unint64_t v34 = (FILE **)MEMORY[0x263EF8348];
    fwrite("Initial:\n", 9uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (v4)
    {
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      do
      {
        unint64_t v40 = v4;
        fprintf(*v34, "  %lu: n=%lu, sigma = %f, mu =", v38, *((unsigned int *)v112[0] + v38), *((float *)v113[0] + v38));
        uint64_t v41 = v37;
        unint64_t v42 = __N;
        if (__N)
        {
          do
          {
            fprintf(*v34, " %8f", *(float *)((char *)v114[0] + v41));
            v41 += 4;
            --v42;
          }
          while (v42);
        }
        fputc(10, *v34);
        if (v38)
        {
          uint64_t v43 = 0;
          v39 += v38;
          unint64_t v4 = v40;
          do
            fprintf(*v34, " %8f", *(float *)((char *)&__A[0][v43++] + v35));
          while (v38 != v43);
        }
        else
        {
          unint64_t v4 = v40;
        }
        fputc(10, *v34);
        ++v38;
        v37 += v97 & 0x7FFFFFFF0;
        v35 += v36;
        v36 += 4;
      }
      while (v38 != v4);
    }
  }
  unint64_t v44 = v98;
  if (v4 > v98[15])
  {
    uint64_t v45 = (FILE **)MEMORY[0x263EF8348];
    uint64_t v46 = v97 & 0x7FFFFFFF0;
    unint64_t v47 = v101;
    do
    {
      unint64_t v102 = v47;
      unint64_t v48 = v4;
      float __C = 0.0;
      __I[0] = 0;
      unint64_t v49 = v4 - 1;
      vDSP_minvi(__A[0], 1, &__C, __I, (v49 * v48) >> 1);
      unint64_t v50 = (unint64_t)(float)((float)(sqrtf((float)((float)__I[0] * 8.0) + 1.0) + 1.0) * 0.5);
      unint64_t v51 = (v50 - 1) * v50;
      vDSP_Length v52 = __I[0] - (v51 >> 1);
      if ((LSMDebugFlags::sLSMDebug & 0x20) != 0) {
        fprintf(*v45, "sigma(%lu, %lu) = %f", v50, __I[0] - (v51 >> 1), __C);
      }
      unsigned int v53 = *((_DWORD *)v112[0] + v52);
      float v54 = (float)(v53 + *((_DWORD *)v112[0] + v50));
      cblas_sscal(__N, (float)v53 / v54, (float *)v114[0] + v52 * v100, 1);
      unint64_t v55 = v100 * v50;
      cblas_saxpy(__N, (float)*((unsigned int *)v112[0] + v50) / v54, (const float *)v114[0] + v100 * v50, 1, (float *)v114[0] + v52 * v100, 1);
      unsigned int v56 = (unsigned int *)v112[0];
      *((_DWORD *)v112[0] + v52) += *((_DWORD *)v112[0] + v50);
      *((float *)v113[0] + v52) = __C;
      char v57 = v110[0];
      *((_DWORD *)v109[0] + *((unsigned int *)v110[0] + v52)) = *((_DWORD *)v111[0] + v50) + 1;
      v57[v52] = v57[v50];
      if ((LSMDebugFlags::sLSMDebug & 0x20) != 0)
      {
        fprintf(*v45, ", n = %lu, mu =", v56[v52]);
        if (__N)
        {
          vDSP_Length v58 = v46 * v52;
          unint64_t v59 = __N;
          do
          {
            fprintf(*v45, " %f", *(float *)((char *)v114[0] + v58));
            v58 += 4;
            --v59;
          }
          while (v59);
        }
        fputc(10, *v45);
        unint64_t v55 = v100 * v50;
      }
      if (v49 > v50)
      {
        *((_DWORD *)v112[0] + v50) = *((_DWORD *)v112[0] + v49);
        *((_DWORD *)v113[0] + v50) = *((_DWORD *)v113[0] + v49);
        *((_DWORD *)v111[0] + v50) = *((_DWORD *)v111[0] + v49);
        *((_DWORD *)v110[0] + v50) = *((_DWORD *)v110[0] + v49);
        cblas_scopy(__N, (const float *)v114[0] + v49 * v100, 1, (float *)v114[0] + v55, 1);
        unint64_t v60 = 0;
        uint64_t v61 = __A[0];
        do
        {
          if (v50 != v60 && v49 != v60)
          {
            if (v60 <= v49) {
              unint64_t v62 = v49;
            }
            else {
              unint64_t v62 = v60;
            }
            if (v60 >= v49) {
              unint64_t v63 = v49;
            }
            else {
              unint64_t v63 = v60;
            }
            float v64 = v61[v63 + (((v62 - 1) * v62) >> 1)];
            if (v60 <= v50) {
              unint64_t v65 = v50;
            }
            else {
              unint64_t v65 = v60;
            }
            if (v60 >= v50) {
              unint64_t v66 = v50;
            }
            else {
              unint64_t v66 = v60;
            }
            v61[v66 + (((v65 - 1) * v65) >> 1)] = v64;
          }
          ++v60;
        }
        while (v48 != v60);
      }
      if (v49)
      {
        uint64_t v67 = 0;
        vDSP_Length v68 = 0;
        do
        {
          if (v52 != v68)
          {
            float v69 = EuclidianVecDistance(__N, (const float *)((char *)v114[0] + v67), (const float *)v114[0] + v52 * v100);
            uint64_t v70 = *((unsigned int *)v112[0] + v68);
            uint64_t v71 = *((unsigned int *)v112[0] + v52);
            float v72 = (float)((float)(v69 * (float)(v69 * (float)(v71 * v70)))
                        / (float)((float)(v71 + v70) * (float)(v71 + v70)))
                + (float)((float)((float)(*((float *)v113[0] + v52) * (float)v71)
                                + (float)((float)v70 * *((float *)v113[0] + v68)))
                        / (float)(v71 + v70));
            vDSP_Length v73 = v68 <= v52 ? v52 : v68;
            vDSP_Length v74 = v68 >= v52 ? v52 : v68;
            __A[0][v74 + (((v73 - 1) * v73) >> 1)] = v72;
            if ((LSMDebugFlags::sLSMDebug & 0x20) != 0) {
              fprintf(*v45, "sigma(%lu[%lu], %lu[%lu]) = %f, dist = %f\n", v68, v70, v52, v71, v72, v69);
            }
          }
          ++v68;
          v67 += v46;
        }
        while (v102 != v68);
      }
      unint64_t v99 = v49;
      if ((LSMDebugFlags::sLSMDebug & 0x20) != 0)
      {
        fwrite("Revised:\n", 9uLL, 1uLL, *v45);
        if (v49)
        {
          uint64_t v75 = 0;
          uint64_t v76 = 0;
          uint64_t v77 = 0;
          uint64_t v78 = 0;
          uint64_t v79 = 0;
          do
          {
            fprintf(*v45, "  %lu: n=%lu, sigma = %f, mu =", v78, *((unsigned int *)v112[0] + v78), *((float *)v113[0] + v78));
            uint64_t v80 = v77;
            unint64_t v81 = __N;
            if (__N)
            {
              do
              {
                fprintf(*v45, " %8f", *(float *)((char *)v114[0] + v80));
                v80 += 4;
                --v81;
              }
              while (v81);
            }
            fputc(10, *v45);
            if (v78)
            {
              uint64_t v82 = 0;
              v79 += v78;
              do
                fprintf(*v45, " %8f", *(float *)((char *)&__A[0][v82++] + v75));
              while (v78 != v82);
            }
            fputc(10, *v45);
            ++v78;
            v77 += v46;
            v75 += v76;
            v76 += 4;
          }
          while (v78 != v102);
        }
      }
      unint64_t v44 = v98;
      unint64_t v4 = v99;
      unint64_t v47 = v102 - 1;
    }
    while (v99 > v98[15]);
  }
  v44[15] = v4;
  unint64_t v83 = v44[3];
  unint64_t v84 = v44[14];
  if (v84 < v4 + 1)
  {
    LSMVectorBase::Allocate((const void **)v44 + 11, v4 + 1, 1);
    unint64_t v84 = v44[14];
  }
  if (v84 >= v4 + 1) {
    unint64_t v84 = v4 + 1;
  }
  v44[13] = v84;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)__I, 4, v83);
  v85 = v44 + 1;
  uint64_t v86 = v44[15];
  uint64_t v87 = v44[11];
  if (v86)
  {
    uint64_t v88 = 0;
    uint64_t v89 = 0;
    v90 = v111[0];
    vDSP_Length v91 = __I[0];
    v92 = (char *)v109[0];
    do
    {
      *(_DWORD *)(v87 + 4 * v88) = v89;
      int v93 = v90[v88];
      unsigned int v94 = v93 + 1;
      if (v93 != -1)
      {
        uint64_t v95 = *v85;
        do
        {
          uint64_t v96 = 4 * v94 - 4;
          *(_DWORD *)(v91 + 4 * v89++) = *(_DWORD *)(v95 + v96);
          unsigned int v94 = *(_DWORD *)&v92[v96];
        }
        while (v94);
      }
      ++v88;
    }
    while (v88 != v86);
  }
  else
  {
    LODWORD(v89) = 0;
  }
  *(_DWORD *)(v87 + 4 * v86) = v89;
  LSMVectorBase::Swap(v85, (LSMVectorBase *)__I);
  LSMVectorBase::~LSMVectorBase((void **)__I);
  LSMVectorBase::~LSMVectorBase((void **)__A);
  LSMVectorBase::~LSMVectorBase(v109);
  LSMVectorBase::~LSMVectorBase(v110);
  LSMVectorBase::~LSMVectorBase(v111);
  LSMVectorBase::~LSMVectorBase(v112);
  LSMVectorBase::~LSMVectorBase(v113);
  LSMVectorBase::~LSMVectorBase(v114);
}

void sub_2177DB240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38)
{
  LSMVectorBase::~LSMVectorBase(&a26);
  LSMVectorBase::~LSMVectorBase(&a30);
  LSMVectorBase::~LSMVectorBase(&a34);
  LSMVectorBase::~LSMVectorBase(&a38);
  LSMVectorBase::~LSMVectorBase((void **)(v38 - 232));
  LSMVectorBase::~LSMVectorBase((void **)(v38 - 200));
  LSMVectorBase::~LSMVectorBase((void **)(v38 - 168));
  _Unwind_Resume(a1);
}

void LSMClusterer::ComputeKMeans(uint64_t *a1, void *a2)
{
  unint64_t v4 = a1[3];
  uint64_t v5 = *(unsigned int *)(*a1 + 16);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v63, 4, a1[15]);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v62, 4, v4);
  uint64_t v57 = v5;
  v5 += 3;
  memset(v62[0], 255, 4 * v4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v61, 4, a1[15] * (v5 & 0x1FFFFFFFCLL));
  uint64_t v56 = v5 & 0x1FFFFFFFCLL;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v60, 4, a1[15] * (v5 & 0x1FFFFFFFCLL));
  uint64_t v6 = 4 * v5;
  uint64_t v58 = (uint64_t)a1;
  unint64_t v55 = a2;
  if (a1[15])
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      unint64_t v9 = random();
      cblas_scopy(v57, (const float *)(*a2 + 4 * v9 % v4 * v56), 1, (float *)((char *)v61[0] + v7), 1);
      ++v8;
      unint64_t v10 = a1[15];
      v7 += v6 & 0x7FFFFFFF0;
    }
    while (v8 < v10);
  }
  else
  {
    unint64_t v10 = 0;
  }
  uint64_t v11 = (FILE **)MEMORY[0x263EF8348];
  unint64_t v53 = v4;
  if ((LSMDebugFlags::sLSMDebug & 0x20) != 0)
  {
    fwrite("Items:\n", 7uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (v4)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      do
      {
        fprintf(*v11, "%ld:", v13);
        uint64_t v14 = v12;
        uint64_t v15 = v57;
        if (v57)
        {
          do
          {
            fprintf(*v11, " %8f", *(float *)(*a2 + v14));
            v14 += 4;
            --v15;
          }
          while (v15);
        }
        fputc(10, *v11);
        ++v13;
        v12 += v6 & 0x7FFFFFFF0;
      }
      while (v13 != v53);
    }
  }
  uint64_t v54 = 0;
  uint64_t v17 = v57;
  uint64_t v16 = a1;
  vDSP_Length v52 = a1 + 1;
  uint64_t v18 = v6 & 0x7FFFFFFF0;
  while (v54 != 100)
  {
    if ((LSMDebugFlags::sLSMDebug & 0x20) != 0)
    {
      fwrite("Centroids:\n", 0xBuLL, 1uLL, *v11);
      if (v10)
      {
        uint64_t v19 = 0;
        for (uint64_t i = 0; i != v10; ++i)
        {
          fprintf(*v11, "%lu:", i);
          uint64_t v21 = v19;
          uint64_t v22 = v17;
          if (v17)
          {
            do
            {
              fprintf(*v11, " %8f", *(float *)((char *)v61[0] + v21));
              v21 += 4;
              --v22;
            }
            while (v22);
          }
          fputc(10, *v11);
          v19 += v18;
        }
      }
    }
    bzero(v63[0], 4 * v16[15]);
    bzero(v60[0], 4 * v56 * v16[15]);
    if (!v53) {
      break;
    }
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    ++v54;
    do
    {
      LODWORD(v59[0]) = 0;
      uint64_t v26 = (const float *)(*v55 + v23);
      if (v10)
      {
        uint64_t v27 = LSMClusterer::ClosestCentroid(v58, (const float *)(*v55 + v23), v61, v10, (float *)v59);
        float v28 = *(float *)v59;
      }
      else
      {
        uint64_t v27 = 0;
        float v28 = 1.0;
      }
      if (v10 >= *(void *)(v58 + 120) || v28 == 0.0)
      {
        unint64_t v29 = v10;
        unint64_t v10 = v27;
      }
      else
      {
        cblas_scopy(v57, v26, 1, (float *)v61[0] + v10 * v56, 1);
        unint64_t v29 = v10 + 1;
      }
      if ((LSMDebugFlags::sLSMDebug & 0x20) != 0) {
        fprintf(*v11, "%lu -> %lu\n", v24, v10);
      }
      cblas_saxpy(v57, 1.0, v26, 1, (float *)v60[0] + v10 * v56, 1);
      ++*((_DWORD *)v63[0] + v10);
      if (v10 != *((_DWORD *)v62[0] + v24))
      {
        ++v25;
        *((_DWORD *)v62[0] + v24) = v10;
      }
      ++v24;
      v23 += v18;
      unint64_t v10 = v29;
    }
    while (v53 != v24);
    if (!v25)
    {
      unint64_t v10 = v29;
      uint64_t v16 = (uint64_t *)v58;
      break;
    }
    uint64_t v16 = (uint64_t *)v58;
    if (v29)
    {
      uint64_t v30 = 0;
      unint64_t v31 = 0;
      uint64_t v17 = v57;
      do
      {
        unsigned int v32 = *((_DWORD *)v63[0] + v31);
        if (v32)
        {
          cblas_sscal(v57, 1.0 / (float)v32, (float *)((char *)v60[0] + v30), 1);
        }
        else if (v31 < --v29)
        {
          cblas_scopy(v57, (const float *)v60[0] + v29 * v56, 1, (float *)((char *)v60[0] + v30), 1);
          *((_DWORD *)v63[0] + v31) = *((_DWORD *)v63[0] + v29);
        }
        ++v31;
        v30 += v18;
      }
      while (v31 < v29);
    }
    else
    {
      uint64_t v17 = v57;
    }
    LSMVectorBase::Swap((uint64_t *)v61, (LSMVectorBase *)v60);
    unint64_t v10 = v29;
  }
  v16[15] = v10;
  unint64_t v33 = v10 + 1;
  unint64_t v34 = v16[14];
  if (v34 < v10 + 1)
  {
    LSMVectorBase::Allocate((const void **)v16 + 11, v10 + 1, 1);
    unint64_t v34 = v16[14];
    unint64_t v10 = v16[15];
  }
  if (v34 >= v33) {
    unint64_t v34 = v33;
  }
  v16[13] = v34;
  uint64_t v35 = v16[11];
  if (v10)
  {
    int v36 = 0;
    uint64_t v37 = (int *)v63[0];
    uint64_t v38 = (_DWORD *)v16[11];
    unint64_t v39 = v10;
    unint64_t v40 = v53;
    do
    {
      *v38++ = v36;
      int v41 = *v37++;
      v36 += v41;
      --v39;
    }
    while (v39);
  }
  else
  {
    int v36 = 0;
    unint64_t v40 = v53;
  }
  *(_DWORD *)(v35 + 4 * v10) = v36;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)v59, 4, v40);
  bzero(v63[0], 4 * v16[15]);
  if (v40)
  {
    unint64_t v42 = (unsigned int *)v62[0];
    uint64_t v43 = (int *)*v52;
    unint64_t v44 = v59[0];
    uint64_t v45 = v16[11];
    uint64_t v46 = v63[0];
    do
    {
      unsigned int v48 = *v42++;
      uint64_t v47 = v48;
      int v49 = *v43++;
      int v50 = *(_DWORD *)(v45 + 4 * v47);
      int v51 = v46[v47];
      v46[v47] = v51 + 1;
      v44[v51 + v50] = v49;
      --v40;
    }
    while (v40);
  }
  LSMVectorBase::Swap(v52, (LSMVectorBase *)v59);
  LSMVectorBase::~LSMVectorBase(v59);
  LSMVectorBase::~LSMVectorBase(v60);
  LSMVectorBase::~LSMVectorBase(v61);
  LSMVectorBase::~LSMVectorBase(v62);
  LSMVectorBase::~LSMVectorBase(v63);
}

void sub_2177DB8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  LSMVectorBase::~LSMVectorBase(&a24);
  LSMVectorBase::~LSMVectorBase(&a28);
  LSMVectorBase::~LSMVectorBase((void **)(v28 - 168));
  LSMVectorBase::~LSMVectorBase((void **)(v28 - 136));
  _Unwind_Resume(a1);
}

float EuclidianVecDistance(unint64_t a1, const float *a2, const float *a3)
{
  if ((LSMDebugFlags::sLSMDebug & 0x8000) != 0)
  {
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)__Y, 4, a1);
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)__X, 4, a1);
    cblas_scopy(a1, a2, 1, __Y[0], 1);
    cblas_scopy(a1, a3, 1, __X[0], 1);
    float v7 = cblas_snrm2(a1, __Y[0], 1);
    float v8 = cblas_snrm2(a1, __X[0], 1);
    float v6 = 100000000.0;
    if (v7 != 0.0 && v8 != 0.0) {
      float v6 = cblas_sdot(a1, __Y[0], 1, __X[0], 1) / (float)(v7 * v8);
    }
    LSMVectorBase::~LSMVectorBase((void **)__X);
  }
  else
  {
    LSMVectorBase::LSMVectorBase((LSMVectorBase *)__Y, 4, a1);
    cblas_scopy(a1, a2, 1, __Y[0], 1);
    cblas_saxpy(a1, -1.0, a3, 1, __Y[0], 1);
    float v6 = cblas_snrm2(a1, __Y[0], 1);
  }
  LSMVectorBase::~LSMVectorBase((void **)__Y);
  return v6;
}

void sub_2177DBAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

uint64_t LSMClusterer::ClosestCentroid(uint64_t a1, const float *a2, void *a3, uint64_t a4, float *a5)
{
  *a5 = INFINITY;
  unint64_t v9 = *(unsigned int *)(*(void *)a1 + 16);
  if ((LSMDebugFlags::sLSMDebug & 0x20) != 0) {
    fwrite("Dist", 4uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  if (a4)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0xFFFFFFFFLL;
    do
    {
      float v13 = EuclidianVecDistance(v9, a2, (const float *)(*a3 + v10));
      if ((LSMDebugFlags::sLSMDebug & 0x20) != 0) {
        fprintf((FILE *)*MEMORY[0x263EF8348], " %8f", v13);
      }
      if (v13 < *a5)
      {
        *a5 = v13;
        uint64_t v12 = v11;
      }
      ++v11;
      v10 += (4 * (v9 + 3)) & 0x7FFFFFFF0;
    }
    while (a4 != v11);
  }
  else
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  if ((LSMDebugFlags::sLSMDebug & 0x20) != 0) {
    fputc(10, (FILE *)*MEMORY[0x263EF8348]);
  }
  return v12;
}

uint64_t LSMClusterParser::LSMClusterParser(uint64_t a1, uint64_t a2, LSMVectorBase *a3, unint64_t a4, uint64_t a5, char a6)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a5;
  *(unsigned char *)(a1 + 16) = a6;
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(a1 + 24), a3);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(a1 + 56), 4);
  LSMVectorBase::LSMVectorBase((LSMVectorBase *)(a1 + 88), 1, a4);
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  bzero(*(void **)(a1 + 88), a4);
  return a1;
}

void sub_2177DBCB4(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase(v2);
  LSMVectorBase::~LSMVectorBase(v1);
  _Unwind_Resume(a1);
}

void LSMClusterParser::~LSMClusterParser(LSMClusterParser *this)
{
  uint64_t v2 = *((void *)this + 15);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 - 8);
    if (v3)
    {
      uint64_t v4 = 32 * v3;
      do
      {
        LSMVectorBase::~LSMVectorBase((void **)(v2 - 32 + v4));
        v4 -= 32;
      }
      while (v4);
    }
    MEMORY[0x21D44C210](v2 - 16, 0x1080C806679C861);
  }
  LSMVectorBase::~LSMVectorBase((void **)this + 11);
  LSMVectorBase::~LSMVectorBase((void **)this + 7);
  LSMVectorBase::~LSMVectorBase((void **)this + 3);
}

void sub_2177DBD70(_Unwind_Exception *a1)
{
  LSMVectorBase::~LSMVectorBase((void **)(v1 + 24));
  _Unwind_Resume(a1);
}

uint64_t LSMClusterParser::AddCFValues(uint64_t a1, const __CFArray *a2, void *a3)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  CFTypeID v29 = CFStringGetTypeID();
  CFTypeID v28 = CFDataGetTypeID();
  CFTypeID v27 = CFNumberGetTypeID();
  uint64_t result = CFArrayGetCount(a2);
  if (result >= 1)
  {
    uint64_t v7 = result;
    for (CFIndex i = 0; i != v7; ++i)
    {
      CFArrayRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(a2, i);
      uint64_t result = CFGetTypeID(ValueAtIndex);
      if (result != TypeID)
      {
        uint64_t v14 = result;
        if (!a3)
        {
          uint64_t v15 = *(void *)(a1 + 120);
          if (v15)
          {
            LSMVectorBase::~LSMVectorBase(*(void ***)(a1 + 120));
            uint64_t result = MEMORY[0x21D44C230](v15, 0x1080C406679C861);
            *(void *)(a1 + 120) = 0;
          }
        }
        if (v14 == v29 && (*(unsigned char *)a1 & 1) != 0)
        {
          uint64_t result = LSMText::LookupWord((uint64_t)ValueAtIndex, *(const __CFString **)(a1 + 8), (LSMWordTable *)*(unsigned __int8 *)(a1 + 16));
          if (!result) {
            goto LABEL_35;
          }
        }
        else
        {
          if (v14 != v28 || (*(unsigned char *)a1 & 2) == 0)
          {
            if (v14 == v27 && (*(unsigned char *)a1 & 3) == 0)
            {
              int valuePtr = 0;
              uint64_t result = CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
              if (result) {
                LODWORD(v16) = valuePtr - 1;
              }
              else {
                LODWORD(v16) = -1;
              }
LABEL_36:
              if (*(void *)(a1 + 104) > (unint64_t)v16)
              {
                uint64_t v26 = *(void *)(a1 + 88);
                if (!*(unsigned char *)(v26 + v16))
                {
                  *(unsigned char *)(v26 + v16) = 1;
                  uint64_t result = (uint64_t)LSMVectorBase::Append((void *)(a1 + 56));
                  *(_DWORD *)(*(void *)(a1 + 56) + 4 * *(void *)(a1 + 72) - 4) = v16;
                  if (a3)
                  {
                    uint64_t result = (uint64_t)LSMVectorBase::Append(a3);
                    *(_DWORD *)(*a3 + 4 * a3[2] - 4) = v16;
                  }
                }
              }
              continue;
            }
            goto LABEL_35;
          }
          uint64_t result = LSMText::LookupToken((LSMText *)ValueAtIndex, *(const __CFData **)(a1 + 8), v10);
          if (!result) {
            goto LABEL_35;
          }
        }
        unint64_t v18 = *(void *)(a1 + 40);
        if (v18)
        {
          uint64_t v19 = *(char **)(a1 + 24);
          __CLPK_integer v20 = &v19[4 * v18];
          uint64_t v21 = v19;
          do
          {
            unint64_t v22 = v18 >> 1;
            uint64_t v23 = (unsigned int *)&v21[4 * (v18 >> 1)];
            unsigned int v25 = *v23;
            uint64_t v24 = (char *)(v23 + 1);
            v18 += ~(v18 >> 1);
            if (v25 < result) {
              uint64_t v21 = v24;
            }
            else {
              unint64_t v18 = v22;
            }
          }
          while (v18);
          if (v21 != v20 && *(_DWORD *)v21 == result)
          {
            unint64_t v16 = (unint64_t)(v21 - v19) >> 2;
            goto LABEL_36;
          }
        }
LABEL_35:
        LODWORD(v16) = -1;
        goto LABEL_36;
      }
      if (!a3)
      {
        if (i)
        {
          if (*(void *)(a1 + 120) && (*(unsigned char *)a1 & 4) != 0)
          {
            uint64_t v17 = *(void **)(a1 + 128);
            *(void *)(a1 + 128) = v17 + 4;
            uint64_t v11 = a1;
            uint64_t v12 = ValueAtIndex;
            float v13 = v17;
            goto LABEL_6;
          }
        }
        else if ((*(unsigned char *)a1 & 4) != 0)
        {
          operator new[]();
        }
      }
      uint64_t v11 = a1;
      uint64_t v12 = ValueAtIndex;
      float v13 = a3;
LABEL_6:
      uint64_t result = LSMClusterParser::AddCFValues(v11, v12, v13);
    }
  }
  return result;
}

void sub_2177DC0E4(_Unwind_Exception *a1)
{
  MEMORY[0x21D44C230](v1, 0x1080C406679C861);
  _Unwind_Resume(a1);
}

void LSMClusterParser::ApplySubset(LSMClusterParser *this, LSMClusterer *a2)
{
  LSMClusterer::Subset((uint64_t)a2, (LSMClusterParser *)((char *)this + 56));
  uint64_t v4 = *((void *)this + 15);
  if (v4)
  {
    *((void *)a2 + 9) = (*((void *)this + 16) - v4) >> 5;
    *((void *)a2 + 10) = v4;
    *((void *)this + LSMVectorBase::~LSMVectorBase(this + 15) = 0;
  }
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
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

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D30](allocator, xmlData, mutabilityOption, errorString);
}

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList)
{
  return (CFDataRef)MEMORY[0x270EE4D50](allocator, propertyList);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x270EE5090](alloc, theArray, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE5100](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5280](string, range.location, range.length);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.CFIndex length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE5590](stream, buffer, bufferLength);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
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

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
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

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void abort(void)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void cblas_daxpy(const int __N, const double __alpha, const double *__X, const int __incX, double *__Y, const int __incY)
{
}

void cblas_dcopy(const int __N, const double *__X, const int __incX, double *__Y, const int __incY)
{
}

double cblas_ddot(const int __N, const double *__X, const int __incX, const double *__Y, const int __incY)
{
  MEMORY[0x270EDE318](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_dscal(const int __N, const double __alpha, double *__X, const int __incX)
{
}

void cblas_dswap(const int __N, double *__X, const int __incX, double *__Y, const int __incY)
{
}

int cblas_idamax(const int __N, const double *__X, const int __incX)
{
  return MEMORY[0x270EDE3D8](*(void *)&__N, __X, *(void *)&__incX);
}

int cblas_isamax(const int __N, const float *__X, const int __incX)
{
  return MEMORY[0x270EDE3E8](*(void *)&__N, __X, *(void *)&__incX);
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

void cblas_scopy(const int __N, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  MEMORY[0x270EDE420](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x270EDE478](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
}

void cblas_sswap(const int __N, float *__X, const int __incX, float *__Y, const int __incY)
{
}

int dgesdd_(char *__jobz, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__iwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE578](__jobz, __m, __n, __a, __lda, __s, __u, __ldu);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
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

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x270ED9BC0](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x270EDB088](*(void *)&a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

int sgesdd_(char *__jobz, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__s, __CLPK_real *__u, __CLPK_integer *__ldu, __CLPK_real *__vt, __CLPK_integer *__ldvt, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__iwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE798](__jobz, __m, __n, __a, __lda, __s, __u, __ldu);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x270F994E8](*(void *)&c);
}

uint64_t ubrk_close()
{
  return MEMORY[0x270F99610]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x270F99620]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x270F99648]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x270F99650]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x270F99668]();
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}