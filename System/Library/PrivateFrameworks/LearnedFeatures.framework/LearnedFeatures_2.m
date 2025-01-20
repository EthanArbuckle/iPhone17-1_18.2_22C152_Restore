uint64_t sub_21B95D144(uint64_t a1)
{
  void *v2;
  BOOL v3;
  BOOL v4;
  int v5;

  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    v3 = !*(_DWORD *)(a1 + 96) || *(_DWORD *)(a1 + 92) == 0;
    v4 = v3 || *(_DWORD *)(a1 + 88) == 0;
    v5 = v4 ? 0 : *(_DWORD *)(a1 + 96);
    if (v5 * (*(_DWORD *)(a1 + 108) >> 1) != -1) {
      goto LABEL_14;
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    v2 = *(void **)(a1 + 72);
    if (v2) {
LABEL_14:
    }
      free(v2);
  }
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_21B95D1F4(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    BOOL v3 = !*(_DWORD *)(a1 + 96) || *(_DWORD *)(a1 + 92) == 0;
    BOOL v4 = v3 || *(_DWORD *)(a1 + 88) == 0;
    int v5 = v4 ? 0 : *(_DWORD *)(a1 + 96);
    if (v5 * (*(_DWORD *)(a1 + 108) >> 1) != -1) {
      goto LABEL_14;
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    v2 = *(void **)(a1 + 72);
    if (v2) {
LABEL_14:
    }
      free(v2);
  }
  *(void *)(a1 + 72) = 0;

  JUMPOUT(0x21D495F30);
}

uint64_t (***sub_21B95D2C4())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F8B8, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C5F8B8))
  {
    return off_26AD08F40;
  }
  __cxa_atexit((void (*)(void *))nullsub_123, off_26AD08F40, &dword_21B831000);
  __cxa_guard_release(&qword_267C5F8B8);
  return off_26AD08F40;
}

void sub_21B95D340()
{
}

void sub_21B95D3D4(_Unwind_Exception *a1)
{
  MEMORY[0x21D495F30](v1, 0x1091C40A44A61E0);
  _Unwind_Resume(a1);
}

double sub_21B95D3F8(uint64_t a1, uint64_t *lpsrc)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = *lpsrc;
  int v5 = (unsigned int *)__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26CBA1760, (const struct __class_type_info *)&unk_26CBA0C00, 0);
  if (v5)
  {
    sub_21B971328(a1 + 8, v5 + 2);
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t *, uint64_t))(v4 + 72))(&v24, lpsrc, 35);
    uint64_t v7 = v24;
    long long v9 = *(_OWORD *)(v24 + 16);
    long long v8 = *(_OWORD *)(v24 + 32);
    v22[0] = *(_OWORD *)v24;
    v22[1] = v9;
    v22[2] = v8;
    *(void *)&long long v24 = 0;
    MEMORY[0x21D495F30](v7, 0xC400A2AC0F1, v10, v11, v12, v13);
    uint64_t v14 = *(void *)(a1 + 72);
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v15 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v15 = 1;
    }
    unint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    if (v15) {
      unint64_t v16 = 0;
    }
    LODWORD(v24) = 4;
    *(void *)((char *)&v24 + 4) = v16;
    unint64_t v18 = v16;
    uint64_t v19 = v24;
    unint64_t v20 = HIDWORD(v16);
    LODWORD(v24) = 1;
    *(void *)((char *)&v24 + 4) = v17;
    uint64_t v21 = v24;
    if (HIDWORD(v17) * HIDWORD(v16) == -1
      && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    *(void *)&long long v24 = v14;
    *((void *)&v24 + 1) = v19;
    int v25 = v20;
    uint64_t v26 = v21;
    int v27 = HIDWORD(v17);
    unint64_t v28 = v18;
    uint64_t v29 = v17;
    v23[0] = v22;
    v23[1] = &v24;
    return sub_21B897400(v23);
  }
  return result;
}

uint64_t sub_21B95D620(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

void sub_21B95D628(uint64_t a1, int a2)
{
  if (a2 == 35
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 78, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

void sub_21B95D7B4(uint64_t a1, int a2)
{
  if (a2 == 35
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 84, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

uint64_t sub_21B95D940(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_21B95D974(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;

  JUMPOUT(0x21D495F30);
}

uint64_t (***sub_21B95D9C8())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F8B8, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C5F8B8))
  {
    return off_26AD08F40;
  }
  __cxa_atexit((void (*)(void *))nullsub_123, off_26AD08F40, &dword_21B831000);
  __cxa_guard_release(&qword_267C5F8B8);
  return off_26AD08F40;
}

void sub_21B95DA44()
{
}

void sub_21B95DAD8(_Unwind_Exception *a1)
{
  MEMORY[0x21D495F30](v1, 0x1091C40A44A61E0);
  _Unwind_Resume(a1);
}

float sub_21B95DAFC(uint64_t a1, uint64_t *lpsrc)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = *lpsrc;
  uint64_t v5 = (unsigned int *)__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26CBA1760, (const struct __class_type_info *)&unk_26CBA0C18, 0);
  if (v5)
  {
    sub_21B971DA0(a1 + 8, v5 + 2);
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t *, uint64_t))(v4 + 72))(&v24, lpsrc, 36);
    uint64_t v7 = v24;
    long long v9 = *(_OWORD *)(v24 + 16);
    long long v8 = *(_OWORD *)(v24 + 32);
    long long v18 = *(_OWORD *)v24;
    long long v19 = v9;
    long long v20 = v8;
    *(void *)&long long v24 = 0;
    MEMORY[0x21D495F30](v7);
    uint64_t v10 = *(void *)(a1 + 72);
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v11 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v11 = 1;
    }
    unint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    if (v11) {
      unint64_t v12 = 0;
    }
    LODWORD(v24) = 4;
    *(void *)((char *)&v24 + 4) = v12;
    unint64_t v14 = v12;
    uint64_t v15 = v24;
    unint64_t v16 = HIDWORD(v12);
    LODWORD(v24) = 1;
    *(void *)((char *)&v24 + 4) = v13;
    uint64_t v17 = v24;
    if (HIDWORD(v13) * HIDWORD(v12) == -1
      && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    *(void *)&long long v24 = v10;
    *((void *)&v24 + 1) = v15;
    int v25 = v16;
    uint64_t v26 = v17;
    int v27 = HIDWORD(v13);
    unint64_t v28 = v14;
    uint64_t v29 = v13;
    v21[0] = (uint64_t)&v18;
    v21[1] = (uint64_t)&v24;
    if (v17 == 1 && DWORD1(v19) == 1)
    {
      sub_21B898758(v21);
    }
    else
    {
      char v22 = 0;
      if (DWORD2(v18) && HIDWORD(v18) && v19)
      {
        v23 = &v22;
        return sub_21B898FA4((uint64_t)&v23, (uint64_t)&v18, (uint64_t)&v24);
      }
    }
  }
  return result;
}

uint64_t sub_21B95DD70(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

void sub_21B95DD78(uint64_t a1, int a2)
{
  if (a2 == 36
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 78, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

void sub_21B95DF04(uint64_t a1, int a2)
{
  if (a2 == 36
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 84, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

uint64_t sub_21B95E090(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_21B95E0C4(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;

  JUMPOUT(0x21D495F30);
}

uint64_t (***sub_21B95E118())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F8B8, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C5F8B8))
  {
    return off_26AD08F40;
  }
  __cxa_atexit((void (*)(void *))nullsub_123, off_26AD08F40, &dword_21B831000);
  __cxa_guard_release(&qword_267C5F8B8);
  return off_26AD08F40;
}

void sub_21B95E194()
{
}

void sub_21B95E228(_Unwind_Exception *a1)
{
  MEMORY[0x21D495F30](v1, 0x1091C40A44A61E0);
  _Unwind_Resume(a1);
}

void sub_21B95E24C(uint64_t a1, uint64_t *lpsrc)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = *lpsrc;
  uint64_t v5 = (unsigned int *)__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26CBA1760, (const struct __class_type_info *)&unk_26CBA0C30, 0);
  if (v5)
  {
    sub_21B970698(a1 + 8, v5 + 2);
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t *, uint64_t))(v4 + 72))(&v23, lpsrc, 37);
    uint64_t v6 = v23;
    long long v8 = *(_OWORD *)(v23 + 16);
    long long v7 = *(_OWORD *)(v23 + 32);
    long long v17 = *(_OWORD *)v23;
    long long v18 = v8;
    long long v19 = v7;
    *(void *)&long long v23 = 0;
    MEMORY[0x21D495F30](v6);
    uint64_t v9 = *(void *)(a1 + 72);
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v10 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v10 = 1;
    }
    unint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    if (v10) {
      unint64_t v11 = 0;
    }
    LODWORD(v23) = 4;
    *(void *)((char *)&v23 + 4) = v11;
    unint64_t v13 = v11;
    uint64_t v14 = v23;
    unint64_t v15 = HIDWORD(v11);
    LODWORD(v23) = 1;
    *(void *)((char *)&v23 + 4) = v12;
    uint64_t v16 = v23;
    if (HIDWORD(v12) * HIDWORD(v11) == -1
      && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    *(void *)&long long v23 = v9;
    *((void *)&v23 + 1) = v14;
    int v24 = v15;
    uint64_t v25 = v16;
    int v26 = HIDWORD(v12);
    unint64_t v27 = v13;
    uint64_t v28 = v12;
    v20[0] = (size_t)&v17;
    v20[1] = (size_t)&v23;
    if (v16 == 1 && DWORD1(v18) == 1)
    {
      sub_21B8934C4(v20);
    }
    else
    {
      char v21 = 0;
      if (DWORD2(v17) && HIDWORD(v17) && v18)
      {
        char v22 = &v21;
        sub_21B893EEC((uint64_t)&v22, (uint64_t)&v17, (uint64_t)&v23);
      }
    }
  }
}

uint64_t sub_21B95E4C0(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

void sub_21B95E4C8(uint64_t a1, int a2)
{
  if (a2 == 37
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 78, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

void sub_21B95E654(uint64_t a1, int a2)
{
  if (a2 == 37
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 84, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

uint64_t sub_21B95E7E0(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_21B95E814(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;

  JUMPOUT(0x21D495F30);
}

uint64_t (***sub_21B95E868())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F8B8, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C5F8B8))
  {
    return off_26AD08F40;
  }
  __cxa_atexit((void (*)(void *))nullsub_123, off_26AD08F40, &dword_21B831000);
  __cxa_guard_release(&qword_267C5F8B8);
  return off_26AD08F40;
}

void sub_21B95E8E4()
{
}

void sub_21B95E978(_Unwind_Exception *a1)
{
  MEMORY[0x21D495F30](v1, 0x1091C40A44A61E0);
  _Unwind_Resume(a1);
}

void sub_21B95E99C(uint64_t a1, uint64_t *lpsrc)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = *lpsrc;
  uint64_t v5 = (unsigned int *)__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26CBA1760, (const struct __class_type_info *)&unk_26CBA0C48, 0);
  if (v5)
  {
    sub_21B970CB0(a1 + 8, v5 + 2);
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t *, uint64_t))(v4 + 72))(&v23, lpsrc, 38);
    uint64_t v6 = v23;
    long long v8 = *(_OWORD *)(v23 + 16);
    long long v7 = *(_OWORD *)(v23 + 32);
    long long v17 = *(_OWORD *)v23;
    long long v18 = v8;
    long long v19 = v7;
    *(void *)&long long v23 = 0;
    MEMORY[0x21D495F30](v6);
    uint64_t v9 = *(void *)(a1 + 72);
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v10 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v10 = 1;
    }
    unint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    if (v10) {
      unint64_t v11 = 0;
    }
    LODWORD(v23) = 4;
    *(void *)((char *)&v23 + 4) = v11;
    unint64_t v13 = v11;
    uint64_t v14 = v23;
    unint64_t v15 = HIDWORD(v11);
    LODWORD(v23) = 1;
    *(void *)((char *)&v23 + 4) = v12;
    uint64_t v16 = v23;
    if (HIDWORD(v12) * HIDWORD(v11) == -1
      && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    *(void *)&long long v23 = v9;
    *((void *)&v23 + 1) = v14;
    int v24 = v15;
    uint64_t v25 = v16;
    int v26 = HIDWORD(v12);
    unint64_t v27 = v13;
    uint64_t v28 = v12;
    v20[0] = (uint64_t)&v17;
    v20[1] = (uint64_t)&v23;
    if (v16 == 1 && DWORD1(v18) == 1)
    {
      sub_21B894E9C(v20);
    }
    else
    {
      char v21 = 0;
      if (DWORD2(v17) && HIDWORD(v17) && v18)
      {
        char v22 = &v21;
        sub_21B8957AC((uint64_t)&v22, (uint64_t)&v17, (uint64_t)&v23);
      }
    }
  }
}

uint64_t sub_21B95EC10(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

void sub_21B95EC18(uint64_t a1, int a2)
{
  if (a2 == 38
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 78, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

void sub_21B95EDA4(uint64_t a1, int a2)
{
  if (a2 == 38
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 84, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

uint64_t sub_21B95EF30(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    BOOL v3 = !*(_DWORD *)(a1 + 96) || *(_DWORD *)(a1 + 92) == 0;
    BOOL v4 = v3 || *(_DWORD *)(a1 + 88) == 0;
    int v5 = v4 ? 0 : *(_DWORD *)(a1 + 96);
    if (v5 * (*(_DWORD *)(a1 + 108) >> 1) != -1) {
      goto LABEL_14;
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    v2 = *(void **)(a1 + 72);
    if (v2) {
LABEL_14:
    }
      free(v2);
  }
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_21B95EFE0(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    BOOL v3 = !*(_DWORD *)(a1 + 96) || *(_DWORD *)(a1 + 92) == 0;
    BOOL v4 = v3 || *(_DWORD *)(a1 + 88) == 0;
    int v5 = v4 ? 0 : *(_DWORD *)(a1 + 96);
    if (v5 * (*(_DWORD *)(a1 + 108) >> 1) != -1) {
      goto LABEL_14;
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    v2 = *(void **)(a1 + 72);
    if (v2) {
LABEL_14:
    }
      free(v2);
  }
  *(void *)(a1 + 72) = 0;

  JUMPOUT(0x21D495F30);
}

uint64_t (***sub_21B95F0B0())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F8B8, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C5F8B8))
  {
    return off_26AD08F40;
  }
  __cxa_atexit((void (*)(void *))nullsub_123, off_26AD08F40, &dword_21B831000);
  __cxa_guard_release(&qword_267C5F8B8);
  return off_26AD08F40;
}

void sub_21B95F12C()
{
}

void sub_21B95F1C0(_Unwind_Exception *a1)
{
  MEMORY[0x21D495F30](v1, 0x1091C40A44A61E0);
  _Unwind_Resume(a1);
}

double sub_21B95F1E4(uint64_t a1, uint64_t *lpsrc)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = *lpsrc;
  int v5 = (unsigned int *)__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26CBA1760, (const struct __class_type_info *)&unk_26CBA0C60, 0);
  if (v5)
  {
    sub_21B971328(a1 + 8, v5 + 2);
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t *, uint64_t))(v4 + 72))(&v24, lpsrc, 39);
    uint64_t v7 = v24;
    long long v9 = *(_OWORD *)(v24 + 16);
    long long v8 = *(_OWORD *)(v24 + 32);
    v22[0] = *(_OWORD *)v24;
    v22[1] = v9;
    v22[2] = v8;
    *(void *)&long long v24 = 0;
    MEMORY[0x21D495F30](v7, 0xC400A2AC0F1, v10, v11, v12, v13);
    uint64_t v14 = *(void *)(a1 + 72);
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v15 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v15 = 1;
    }
    unint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    if (v15) {
      unint64_t v16 = 0;
    }
    LODWORD(v24) = 4;
    *(void *)((char *)&v24 + 4) = v16;
    unint64_t v18 = v16;
    uint64_t v19 = v24;
    unint64_t v20 = HIDWORD(v16);
    LODWORD(v24) = 1;
    *(void *)((char *)&v24 + 4) = v17;
    uint64_t v21 = v24;
    if (HIDWORD(v17) * HIDWORD(v16) == -1
      && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    *(void *)&long long v24 = v14;
    *((void *)&v24 + 1) = v19;
    int v25 = v20;
    uint64_t v26 = v21;
    int v27 = HIDWORD(v17);
    unint64_t v28 = v18;
    uint64_t v29 = v17;
    v23[0] = v22;
    v23[1] = &v24;
    return sub_21B897400(v23);
  }
  return result;
}

uint64_t sub_21B95F40C(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

void sub_21B95F414(uint64_t a1, int a2)
{
  if (a2 == 39
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 78, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

void sub_21B95F5A0(uint64_t a1, int a2)
{
  if (a2 == 39
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 84, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

uint64_t sub_21B95F72C(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_21B95F760(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 72) = 0;

  JUMPOUT(0x21D495F30);
}

uint64_t (***sub_21B95F7B4())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F8B8, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C5F8B8))
  {
    return off_26AD08F40;
  }
  __cxa_atexit((void (*)(void *))nullsub_123, off_26AD08F40, &dword_21B831000);
  __cxa_guard_release(&qword_267C5F8B8);
  return off_26AD08F40;
}

void sub_21B95F830()
{
}

void sub_21B95F8C4(_Unwind_Exception *a1)
{
  MEMORY[0x21D495F30](v1, 0x1091C40A44A61E0);
  _Unwind_Resume(a1);
}

float sub_21B95F8E8(uint64_t a1, uint64_t *lpsrc)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = *lpsrc;
  uint64_t v5 = (unsigned int *)__dynamic_cast(lpsrc, (const struct __class_type_info *)&unk_26CBA1760, (const struct __class_type_info *)&unk_26CBA0C78, 0);
  if (v5)
  {
    sub_21B971DA0(a1 + 8, v5 + 2);
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t *, uint64_t))(v4 + 72))(&v24, lpsrc, 40);
    uint64_t v7 = v24;
    long long v9 = *(_OWORD *)(v24 + 16);
    long long v8 = *(_OWORD *)(v24 + 32);
    long long v18 = *(_OWORD *)v24;
    long long v19 = v9;
    long long v20 = v8;
    *(void *)&long long v24 = 0;
    MEMORY[0x21D495F30](v7);
    uint64_t v10 = *(void *)(a1 + 72);
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v11 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v11 = 1;
    }
    unint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    if (v11) {
      unint64_t v12 = 0;
    }
    LODWORD(v24) = 4;
    *(void *)((char *)&v24 + 4) = v12;
    unint64_t v14 = v12;
    uint64_t v15 = v24;
    unint64_t v16 = HIDWORD(v12);
    LODWORD(v24) = 1;
    *(void *)((char *)&v24 + 4) = v13;
    uint64_t v17 = v24;
    if (HIDWORD(v13) * HIDWORD(v12) == -1
      && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    *(void *)&long long v24 = v10;
    *((void *)&v24 + 1) = v15;
    int v25 = v16;
    uint64_t v26 = v17;
    int v27 = HIDWORD(v13);
    unint64_t v28 = v14;
    uint64_t v29 = v13;
    v21[0] = (uint64_t)&v18;
    v21[1] = (uint64_t)&v24;
    if (v17 == 1 && DWORD1(v19) == 1)
    {
      sub_21B898758(v21);
    }
    else
    {
      char v22 = 0;
      if (DWORD2(v18) && HIDWORD(v18) && v19)
      {
        long long v23 = &v22;
        return sub_21B898FA4((uint64_t)&v23, (uint64_t)&v18, (uint64_t)&v24);
      }
    }
  }
  return result;
}

uint64_t sub_21B95FB5C(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

void sub_21B95FB64(uint64_t a1, int a2)
{
  if (a2 == 40
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 78, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

void sub_21B95FCF0(uint64_t a1, int a2)
{
  if (a2 == 40
    || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/ImageStorage.cpp", 84, (uint64_t)"F == format", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    if (*(_DWORD *)(a1 + 36)) {
      BOOL v3 = *(_DWORD *)(a1 + 32) == 0;
    }
    else {
      BOOL v3 = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      HIDWORD(v4) = 0;
    }
    if (HIDWORD(v5) * HIDWORD(v4) != -1
      || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      operator new();
    }
  }
  abort();
}

void sub_21B95FE7C(_DWORD *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = *(void *)a1;
  }
  unint64_t v6 = v5 << 32;
  if (!HIDWORD(v5)) {
    unint64_t v6 = 0;
  }
  uint64_t v7 = (void *)(v6 | (v5 != 0));
  if (v5) {
    BOOL v8 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    long long v9 = 0;
  }
  else {
    long long v9 = (void *)v5;
  }
  unint64_t v10 = HIDWORD(v6);
  uint64_t v11 = HIDWORD(v6) - 1;
  uint64_t v12 = (HIDWORD(v9) * v10);
  if ((v10 & v11) != 0) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = v11;
  }
  unint64_t v14 = v13 | (v13 >> 1) | ((v13 | (v13 >> 1)) >> 2);
  unint64_t v15 = v14 | (v14 >> 4) | ((v14 | (v14 >> 4)) >> 8);
  unint64_t v16 = v15 | (v15 >> 16) | ((v15 | (v15 >> 16)) >> 32);
  if (v16 + 1 > 8) {
    size_t v17 = v16 + 1;
  }
  else {
    size_t v17 = 8;
  }
  if (v12)
  {
    memptr[0] = 0;
    int v19 = malloc_type_posix_memalign(memptr, v17, (HIDWORD(v9) * v10), 0x1F88E90uLL);
    if (v19) {
      sub_21B97D9E4(v19, v17, (HIDWORD(v9) * v10));
    }
    long long v20 = memptr[0];
    if (memptr[0])
    {
      if (v9) {
        int v21 = v8;
      }
      else {
        int v21 = 1;
      }
      if (v21) {
        char v22 = 0;
      }
      else {
        char v22 = v9;
      }
      memptr[1] = v22;
      memptr[2] = v7;
      if (HIDWORD(v22) * v10 == -1
        && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
      {
        abort();
      }
      v24[0] = memptr;
      v24[1] = a2;
      sub_21B892CFC(v24);
    }
  }
  else
  {
    long long v20 = 0;
  }
  *(void *)a3 = &unk_26CB9F610;
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v7;
  *(unsigned char *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = v12;
  *(void *)(a3 + 48) = v20;
  *(void *)(a3 + 56) = v17;
  *(void *)(a3 + 64) = v9;
  *(void *)(a3 + 72) = v7;
}

void sub_21B960038(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_21B96004C(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = *(void *)a1;
  }
  if (HIDWORD(v4)) {
    unint64_t v5 = v4 << 32;
  }
  else {
    unint64_t v5 = 0;
  }
  if (v4) {
    BOOL v6 = HIDWORD(v4) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v4;
  }
  uint64_t v8 = (HIDWORD(v7) * HIDWORD(v5));
  if ((HIDWORD(v5) & (HIDWORD(v5) - 1)) != 0) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = HIDWORD(v5) - 1;
  }
  unint64_t v10 = v9 | (v9 >> 1) | ((v9 | (v9 >> 1)) >> 2);
  unint64_t v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
  unint64_t v12 = v11 | (v11 >> 16) | ((v11 | (v11 >> 16)) >> 32);
  if (v12 + 1 > 8) {
    size_t v13 = v12 + 1;
  }
  else {
    size_t v13 = 8;
  }
  if (v8)
  {
    memptr = 0;
    int v14 = malloc_type_posix_memalign(&memptr, v13, (HIDWORD(v7) * HIDWORD(v5)), 0x1F88E90uLL);
    if (v14) {
      sub_21B97D9E4(v14, v13, (HIDWORD(v7) * HIDWORD(v5)));
    }
    unint64_t v15 = memptr;
  }
  else
  {
    unint64_t v15 = 0;
  }
  *(void *)a2 = &unk_26CB9F610;
  *(void *)(a2 + 8) = v4;
  uint64_t v16 = v5 | (v4 != 0);
  *(void *)(a2 + 16) = v16;
  *(unsigned char *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = v8;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v13;
  *(void *)(a2 + 64) = v7;
  *(void *)(a2 + 72) = v16;
}

void sub_21B960178(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  if (a1[1]) {
    BOOL v5 = *a1 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = *(void *)a1;
  }
  unint64_t v7 = v6 << 32;
  if (!HIDWORD(v6)) {
    unint64_t v7 = 0;
  }
  BOOL v8 = v6 != 0;
  unint64_t v9 = v7 | v8;
  if (v6) {
    BOOL v10 = HIDWORD(v6) == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = (void *)v6;
  }
  uint64_t v12 = (HIDWORD(v11) * HIDWORD(v7));
  if (((v7 >> 31) & ((v7 >> 31) - 1)) != 0) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = (v7 >> 31) - 1;
  }
  unint64_t v14 = v13 | (v13 >> 1) | ((v13 | (v13 >> 1)) >> 2);
  unint64_t v15 = v14 | (v14 >> 4) | ((v14 | (v14 >> 4)) >> 8);
  unint64_t v16 = v15 | (v15 >> 16) | ((v15 | (v15 >> 16)) >> 32);
  if (v16 + 1 > 8) {
    size_t v17 = v16 + 1;
  }
  else {
    size_t v17 = 8;
  }
  unint64_t v32 = v17;
  unint64_t v33 = 2 * v12;
  if (v12)
  {
    memptr[0] = 0;
    int v18 = malloc_type_posix_memalign(memptr, v17, 2 * v12, 0x1F88E90uLL);
    if (v18) {
      sub_21B97D9E4(v18, v32, v33);
    }
    int v19 = memptr[0];
    uint64_t v20 = 2 * v9;
    if (memptr[0])
    {
      if (v11) {
        int v21 = v10;
      }
      else {
        int v21 = 1;
      }
      if (v21) {
        char v22 = 0;
      }
      else {
        char v22 = v11;
      }
      memptr[1] = v22;
      memptr[2] = (void *)(v9 & 0x7FFFFFFF00000001);
      if (HIDWORD(v22) * ((v9 >> 31) >> 1) == -1
        && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
      {
        abort();
      }
      v35[0] = memptr;
      v35[1] = a2;
      if (v6)
      {
        sub_21B89403C((uint64_t)v35);
LABEL_49:
        uint64_t v20 = 2 * v9;
        goto LABEL_50;
      }
      if (!v22 || !HIDWORD(v22)) {
        goto LABEL_49;
      }
      int v23 = v22 - 1;
      long long v24 = v19;
      int v25 = HIDWORD(v22) - 1;
      if (HIDWORD(v22) != 1)
      {
        uint64_t v26 = HIDWORD(v9) & 0x7FFFFFFF;
        if (v22 == 1)
        {
          uint64_t v31 = 2 * v26;
          long long v24 = v19;
          do
          {
            *long long v24 = *a2;
            long long v24 = (_WORD *)((char *)v24 + v31);
            --v25;
          }
          while (v25);
LABEL_48:
          *long long v24 = *a2;
          goto LABEL_49;
        }
        int v27 = 0;
        uint64_t v28 = 2 * v26;
        long long v24 = v19;
        do
        {
          uint64_t v29 = v24;
          int v30 = v22 - 1;
          do
          {
            *uint64_t v29 = *a2;
            v29 += v8;
            --v30;
          }
          while (v30);
          *uint64_t v29 = *a2;
          long long v24 = (_WORD *)((char *)v24 + v28);
          ++v27;
        }
        while (v27 != v25);
      }
      if (v22 != 1)
      {
        do
        {
          *long long v24 = *a2;
          v24 += v8;
          --v23;
        }
        while (v23);
      }
      goto LABEL_48;
    }
  }
  else
  {
    int v19 = 0;
    uint64_t v20 = 2 * v9;
  }
LABEL_50:
  *(void *)a3 = &unk_26CB9F690;
  *(void *)(a3 + 8) = v6;
  *(void *)(a3 + 16) = v9;
  *(unsigned char *)(a3 + 24) = 0;
  *(_DWORD *)(a3 + 25) = memptr[0];
  *(_DWORD *)(a3 + 28) = *(_DWORD *)((char *)memptr + 3);
  *(unsigned char *)(a3 + 32) = 0;
  *(_WORD *)(a3 + 33) = v35[0];
  *(unsigned char *)(a3 + 35) = BYTE2(v35[0]);
  *(void *)(a3 + 40) = v33;
  *(void *)(a3 + 48) = v19;
  *(void *)(a3 + 56) = v32;
  *(void *)(a3 + 64) = v11;
  *(void *)(a3 + 72) = v20;
}

void sub_21B960428(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_21B96043C(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = *(void *)a1;
  }
  if (HIDWORD(v4)) {
    unint64_t v5 = v4 << 32;
  }
  else {
    unint64_t v5 = 0;
  }
  if (v4) {
    BOOL v6 = HIDWORD(v4) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v4;
  }
  unint64_t v8 = HIDWORD(v7) * (v5 >> 31);
  if (((v5 >> 31) & ((v5 >> 31) - 1)) != 0) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = (v5 >> 31) - 1;
  }
  unint64_t v10 = v9 | (v9 >> 1) | ((v9 | (v9 >> 1)) >> 2);
  unint64_t v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
  unint64_t v12 = v11 | (v11 >> 16) | ((v11 | (v11 >> 16)) >> 32);
  if (v12 + 1 > 8) {
    size_t v13 = v12 + 1;
  }
  else {
    size_t v13 = 8;
  }
  unint64_t v14 = v8 & 0x1FFFFFFFELL;
  if ((v8 & 0x1FFFFFFFELL) != 0)
  {
    memptr = 0;
    int v15 = malloc_type_posix_memalign(&memptr, v13, v8 & 0x1FFFFFFFELL, 0x1F88E90uLL);
    if (v15) {
      sub_21B97D9E4(v15, v13, v14);
    }
    unint64_t v16 = memptr;
  }
  else
  {
    unint64_t v16 = 0;
  }
  *(void *)a2 = &unk_26CB9F690;
  *(void *)(a2 + 8) = v4;
  uint64_t v17 = v5 | (v4 != 0);
  *(void *)(a2 + 16) = v17;
  *(unsigned char *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = v14;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v13;
  *(void *)(a2 + 64) = v7;
  *(void *)(a2 + 72) = 2 * v17;
}

void sub_21B960570(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = *(void *)a1;
  }
  if (HIDWORD(v4)) {
    unint64_t v5 = v4 << 32;
  }
  else {
    unint64_t v5 = 0;
  }
  if (v4) {
    BOOL v6 = HIDWORD(v4) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v4;
  }
  unint64_t v8 = HIDWORD(v7) * (v5 >> 30);
  unint64_t v9 = 3;
  if (((v5 >> 30) & ((v5 >> 30) - 1)) == 0) {
    unint64_t v9 = (v5 >> 30) - 1;
  }
  unint64_t v10 = v9 | (v9 >> 1) | ((v9 | (v9 >> 1)) >> 2);
  unint64_t v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
  unint64_t v12 = v11 | (v11 >> 16) | ((v11 | (v11 >> 16)) >> 32);
  if (v12 + 1 > 8) {
    size_t v13 = v12 + 1;
  }
  else {
    size_t v13 = 8;
  }
  unint64_t v14 = v8 & 0x3FFFFFFFCLL;
  if ((v8 & 0x3FFFFFFFCLL) != 0)
  {
    memptr = 0;
    int v15 = malloc_type_posix_memalign(&memptr, v13, v8 & 0x3FFFFFFFCLL, 0x1F88E90uLL);
    if (v15) {
      sub_21B97D9E4(v15, v13, v14);
    }
    unint64_t v16 = memptr;
  }
  else
  {
    unint64_t v16 = 0;
  }
  *(void *)a2 = &unk_26CB9CD20;
  *(void *)(a2 + 8) = v4;
  uint64_t v17 = v5 | (v4 != 0);
  *(void *)(a2 + 16) = v17;
  *(unsigned char *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = v14;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v13;
  *(void *)(a2 + 64) = v7;
  *(void *)(a2 + 72) = 4 * v17;
}

void sub_21B9606A8(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a1;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 2;
  *(void *)&memptr[4] = v4;
  unint64_t v5 = v4;
  uint64_t v6 = 2 * (v4 != 0);
  unsigned int v7 = v6 * v4;
  if (HIDWORD(v5)) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t v9 = v6 & 0x1FFFFFFFFLL | ((unint64_t)(v8 >> 1) << 33);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 2);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 2) >> 32) {
    BOOL v12 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = HIDWORD(v5);
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CB9F790;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = HIDWORD(v5);
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B96087C@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 2;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 2 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x1FFFFFFFFLL | ((unint64_t)(v7 >> 1) << 33);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 2);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 2) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 2);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9F810;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B960A10@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 2;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 2 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x1FFFFFFFFLL | ((unint64_t)(v7 >> 1) << 33);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 2);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 2) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 2);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9F890;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B960BA4@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 2;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 2 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x1FFFFFFFFLL | ((unint64_t)(v7 >> 1) << 33);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 2);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 2) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 2);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9E380;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B960D3C(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = *(void *)a1;
  if (v3) {
    uint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 3;
  *(void *)&memptr[4] = v4;
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = HIDWORD(*(void *)&memptr[4]);
  if (HIDWORD(*(void *)&memptr[4])) {
    uint64_t v8 = (v6 * *(_DWORD *)&memptr[4]);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v6 | (v8 << 32);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 3);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = v7;
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CB9F910;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B960F08@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9F990;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B961098@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FA10;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B961228@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FA90;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B9613B8(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a1;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 4;
  *(void *)&memptr[4] = v4;
  unint64_t v5 = v4;
  uint64_t v6 = 4 * (v4 != 0);
  unsigned int v7 = v6 * v4;
  if (HIDWORD(v5)) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v8 >> 2) << 34);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 4);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v12 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = HIDWORD(v5);
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CB9FB10;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = HIDWORD(v5);
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B96158C@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FB90;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B961724@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FC10;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B9618BC@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FC90;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B961A50(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = *(void *)a1;
  if (v3) {
    uint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 3;
  *(void *)&memptr[4] = v4;
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = HIDWORD(*(void *)&memptr[4]);
  if (HIDWORD(*(void *)&memptr[4])) {
    uint64_t v8 = (v6 * *(_DWORD *)&memptr[4]);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v6 | (v8 << 32);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 3);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = v7;
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CB9FD10;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B961C1C@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FD90;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B961DAC@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FE10;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B961F3C@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FE90;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B9620CC(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = *(void *)a1;
  if (v3) {
    uint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 3;
  *(void *)&memptr[4] = v4;
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = HIDWORD(*(void *)&memptr[4]);
  if (HIDWORD(*(void *)&memptr[4])) {
    uint64_t v8 = (v6 * *(_DWORD *)&memptr[4]);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v6 | (v8 << 32);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 3);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = v7;
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CB9FF10;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B962298@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CB9FF90;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B962428@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0010;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B9625B8@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 3;
  *(void *)&v24[4] = v5;
  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = v6 | (v7 << 32);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 3);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 3) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 3);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0090;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B962748(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a1;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 4;
  *(void *)&memptr[4] = v4;
  unint64_t v5 = v4;
  uint64_t v6 = 4 * (v4 != 0);
  unsigned int v7 = v6 * v4;
  if (HIDWORD(v5)) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v8 >> 2) << 34);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 4);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v12 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = HIDWORD(v5);
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CBA0110;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = HIDWORD(v5);
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B96291C@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0190;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B962AB4@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0210;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B962C4C@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0290;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B962DE0(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a1;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 4;
  *(void *)&memptr[4] = v4;
  unint64_t v5 = v4;
  uint64_t v6 = 4 * (v4 != 0);
  unsigned int v7 = v6 * v4;
  if (HIDWORD(v5)) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v8 >> 2) << 34);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 4);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v12 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = HIDWORD(v5);
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CBA0310;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = HIDWORD(v5);
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B962FB4@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0390;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B96314C@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0410;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B9632E4@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0490;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B963478(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a1;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 4;
  *(void *)&memptr[4] = v4;
  unint64_t v5 = v4;
  uint64_t v6 = 4 * (v4 != 0);
  unsigned int v7 = v6 * v4;
  if (HIDWORD(v5)) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v8 >> 2) << 34);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 4);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v12 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = HIDWORD(v5);
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CBA0510;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = HIDWORD(v5);
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B96364C@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0590;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B9637E4@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0610;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B96397C@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0690;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21B963B10(_DWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v3 = *a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a1;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 4;
  *(void *)&memptr[4] = v4;
  unint64_t v5 = v4;
  uint64_t v6 = 4 * (v4 != 0);
  unsigned int v7 = v6 * v4;
  if (HIDWORD(v5)) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v8 >> 2) << 34);
  unint64_t v10 = __PAIR64__(*(unsigned int *)&memptr[4], 4);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v9;
  uint64_t v11 = *(void *)memptr;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v12 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = HIDWORD(v5);
  }
  unint64_t v15 = v8 - 1;
  uint64_t v16 = (v14 * v8);
  if ((v8 & (v8 - 1)) != 0) {
    unint64_t v15 = 0;
  }
  unint64_t v17 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  if (v16)
  {
    int v24 = v13;
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, (v14 * v8), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, v20, (v14 * v8));
    }
    uint64_t v22 = *(void *)memptr;
    int v13 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)a2 = &unk_26CBA0710;
  *(void *)(a2 + 8) = v10;
  if (v13) {
    unint64_t v23 = 0;
  }
  else {
    unint64_t v23 = v10;
  }
  *(_DWORD *)(a2 + 16) = HIDWORD(v5);
  *(void *)(a2 + 20) = v11;
  *(_DWORD *)(a2 + 28) = v8;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v9;
  *(unsigned char *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 60) = 0;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v22;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v23;
  *(_DWORD *)(a2 + 96) = v14;
  *(void *)(a2 + 100) = v11;
  *(_DWORD *)(a2 + 108) = v8;
}

double sub_21B963CE4@<D0>(_DWORD *a1@<X1>, const __int16 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96C7E4((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0790;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B963E7C@<D0>(_DWORD *a1@<X1>, _WORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((2 * v7) & (2 * v7 - 1)) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 2 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96CEEC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0810;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

double sub_21B964014@<D0>(_DWORD *a1@<X1>, const float *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1[1]) {
    BOOL v4 = *a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  unint64_t v5 = *(void *)a1;
  if (v4) {
    unint64_t v5 = 0;
  }
  *(_DWORD *)int v24 = 4;
  *(void *)&v24[4] = v5;
  uint64_t v6 = 4 * (v5 != 0);
  LODWORD(v7) = v6 * v5;
  unint64_t v8 = HIDWORD(v5);
  if (HIDWORD(v5)) {
    unint64_t v7 = v7;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v9 = v6 & 0x3FFFFFFFFLL | ((unint64_t)(v7 >> 2) << 34);
  *(_DWORD *)int v24 = 1;
  *(_DWORD *)&v24[4] = v9;
  uint64_t v10 = *(void *)v24;
  *(void *)int v24 = __PAIR64__(v5, 4);
  *(_DWORD *)&v24[8] = HIDWORD(v5);
  *(void *)&v24[12] = v10;
  *(_DWORD *)&v24[20] = v7;
  *(void *)&v24[24] = v5;
  *(void *)&long long v25 = v9;
  BYTE8(v25) = 0;
  BYTE4(v26) = 0;
  uint64_t v22 = v10;
  int v23 = v7;
  if (__PAIR64__(v5, 4) >> 32) {
    BOOL v11 = HIDWORD(v5) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = __PAIR64__(v5, 4);
  }
  unint64_t v20 = v12;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = v8;
  }
  int v21 = v13;
  if (((4 * v7) & (4 * v7 - 1)) != 0) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 4 * v7;
  }
  unint64_t v15 = (uint64_t *)sub_21B96D4CC((uint64_t)v27, (unsigned int *)&v20, &v22, 1, a2, 1, v14);
  long long v16 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a3 + 8) = *(_OWORD *)v24;
  *(void *)a3 = &unk_26CBA0890;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v25;
  uint64_t v17 = *v15;
  *(void *)(a3 + 56) = v26;
  *(void *)(a3 + 64) = v17;
  uint64_t v18 = v27[2];
  *(void *)(a3 + 72) = v27[1];
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 104) = v29;
  double result = *(double *)&v28;
  *(_OWORD *)(a3 + 88) = v28;
  return result;
}

uint64_t sub_21B9641A8(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  unint64_t v7 = *(unsigned char **)(a2 + 8);
  if (*(_DWORD *)(a2 + 28)) {
    BOOL v8 = *(_DWORD *)(a2 + 24) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  unint64_t v9 = *(void *)(a2 + 32);
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *(void *)(a2 + 24);
  }
  unint64_t v11 = HIDWORD(v9);
  int __len = HIDWORD(v10) * HIDWORD(v9);
  if (HIDWORD(v10) * HIDWORD(v9) == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_50;
  }
  if (v10) {
    BOOL v12 = HIDWORD(v10) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    return a1;
  }
  int v13 = *(unsigned char **)(a1 + 8);
  unint64_t v14 = *(void *)(a1 + 32);
  BOOL v15 = !*(_DWORD *)(a1 + 28) || *(_DWORD *)(a1 + 24) == 0;
  int v16 = v15 ? 0 : *(_DWORD *)(a1 + 28);
  unint64_t v17 = HIDWORD(v14);
  if (v16 * HIDWORD(v14) == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
LABEL_50:
    abort();
  }
  if (v9 != 1 || v14 != 1)
  {
    if (v10)
    {
      int v18 = v10 - 1;
      int v19 = HIDWORD(v10) - 1;
      if (HIDWORD(v10) != 1)
      {
        if (v10 == 1)
        {
          do
          {
            *int v13 = *v7;
            v7 += v11;
            v13 += v17;
            --v19;
          }
          while (v19);
        }
        else
        {
          int v20 = 0;
          do
          {
            int v21 = v10 - 1;
            uint64_t v22 = v7;
            int v23 = v13;
            do
            {
              unsigned char *v23 = *v22;
              v22 += v9;
              v23 += v14;
              --v21;
            }
            while (v21);
            unsigned char *v23 = *v22;
            v7 += v11;
            v13 += v17;
            ++v20;
          }
          while (v20 != v19);
        }
      }
      if (v10 != 1)
      {
        do
        {
          *int v13 = *v7;
          v7 += v9;
          v13 += v14;
          --v18;
        }
        while (v18);
      }
      *int v13 = *v7;
    }
    return a1;
  }
  if (HIDWORD(v9) != HIDWORD(v14) || HIDWORD(v9) != v10)
  {
    if (!v10) {
      return a1;
    }
    int v24 = HIDWORD(v10) - 1;
    if (HIDWORD(v10) == 1)
    {
LABEL_51:
      if (v7
        || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        long long v25 = v13;
        uint64_t v26 = v7;
        size_t v27 = v10;
LABEL_56:
        memmove(v25, v26, v27);
        return a1;
      }
    }
    else
    {
      while (v7
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v13, v7, v10);
        v7 += v11;
        v13 += v17;
        if (!--v24) {
          goto LABEL_51;
        }
      }
    }
    goto LABEL_50;
  }
  if (!v7 && __len)
  {
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_50;
    }
    goto LABEL_55;
  }
  if (__len)
  {
LABEL_55:
    long long v25 = v13;
    uint64_t v26 = v7;
    size_t v27 = (HIDWORD(v10) * HIDWORD(v9));
    goto LABEL_56;
  }
  return a1;
}

uint64_t sub_21B964540(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  unint64_t v7 = *(_WORD **)(a2 + 8);
  if (*(_DWORD *)(a2 + 28)) {
    BOOL v8 = *(_DWORD *)(a2 + 24) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  unint64_t v9 = *(void *)(a2 + 32);
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *(void *)(a2 + 24);
  }
  unint64_t v11 = v9 >> 33;
  uint64_t v12 = HIDWORD(v10) * (v9 >> 33);
  if (v12 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_48;
  }
  if (v10) {
    BOOL v13 = HIDWORD(v10) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    return a1;
  }
  unint64_t v14 = *(_WORD **)(a1 + 8);
  unint64_t v15 = *(void *)(a1 + 32);
  BOOL v16 = !*(_DWORD *)(a1 + 28) || *(_DWORD *)(a1 + 24) == 0;
  int v17 = v16 ? 0 : *(_DWORD *)(a1 + 28);
  unint64_t v29 = v15 >> 33;
  if (v17 * (v15 >> 33) == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
LABEL_48:
    abort();
  }
  uint64_t v18 = v9 & 0xFFFFFFFE;
  uint64_t v19 = v15 & 0xFFFFFFFE;
  if (v18 != 2 || v19 != 2)
  {
    if (!v10) {
      return a1;
    }
    int v20 = v10 - 1;
    int v21 = HIDWORD(v10) - 1;
    if (HIDWORD(v10) != 1)
    {
      if (v10 == 1)
      {
        do
        {
          *unint64_t v14 = *v7;
          v7 += v11;
          v14 += v29;
          --v21;
        }
        while (v21);
LABEL_55:
        *unint64_t v14 = *v7;
        return a1;
      }
      int v22 = 0;
      do
      {
        int v23 = v14;
        int v24 = v7;
        int v25 = v10 - 1;
        do
        {
          _WORD *v23 = *v24;
          int v24 = (_WORD *)((char *)v24 + v18);
          int v23 = (_WORD *)((char *)v23 + v19);
          --v25;
        }
        while (v25);
        _WORD *v23 = *v24;
        v7 += v11;
        v14 += v29;
        ++v22;
      }
      while (v22 != v21);
    }
    if (v10 != 1)
    {
      do
      {
        *unint64_t v14 = *v7;
        unint64_t v7 = (_WORD *)((char *)v7 + v18);
        unint64_t v14 = (_WORD *)((char *)v14 + v19);
        --v20;
      }
      while (v20);
    }
    goto LABEL_55;
  }
  if (v11 != v10 || v11 != v29)
  {
    if (!v10) {
      return a1;
    }
    size_t v26 = 2 * v10;
    int v27 = HIDWORD(v10) - 1;
    if (HIDWORD(v10) == 1)
    {
LABEL_49:
      if (v7
        || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v14, v7, v26);
        return a1;
      }
    }
    else
    {
      while (v7
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v14, v7, v26);
        v7 += v11;
        v14 += v29;
        if (!--v27) {
          goto LABEL_49;
        }
      }
    }
    goto LABEL_48;
  }
  if (!v7 && v12)
  {
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_48;
    }
    goto LABEL_53;
  }
  if (v12) {
LABEL_53:
  }
    memmove(v14, v7, 2 * v12);
  return a1;
}

uint64_t sub_21B964900(uint64_t a1)
{
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    BOOL v3 = !*(_DWORD *)(a1 + 28) || *(_DWORD *)(a1 + 24) == 0;
    int v4 = v3 ? 0 : *(_DWORD *)(a1 + 28);
    if (v4 * (*(void *)(a1 + 32) >> 33) != -1) {
      goto LABEL_11;
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    v2 = *(void **)(a1 + 8);
    if (v2) {
LABEL_11:
    }
      free(v2);
  }
  *(void *)(a1 + 8) = 0;
  return a1;
}

uint64_t sub_21B9649A8(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  unint64_t v7 = *(_WORD **)(a2 + 8);
  if (*(_DWORD *)(a2 + 28)) {
    BOOL v8 = *(_DWORD *)(a2 + 24) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  unint64_t v9 = *(void *)(a2 + 32);
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *(void *)(a2 + 24);
  }
  unint64_t v11 = v9 >> 33;
  if (HIDWORD(v10) * (v9 >> 33) == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_37;
  }
  if (v10) {
    BOOL v12 = HIDWORD(v10) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    return a1;
  }
  BOOL v13 = *(_WORD **)(a1 + 8);
  unint64_t v14 = *(void *)(a1 + 32);
  BOOL v15 = !*(_DWORD *)(a1 + 28) || *(_DWORD *)(a1 + 24) == 0;
  int v16 = v15 ? 0 : *(_DWORD *)(a1 + 28);
  unint64_t v17 = v14 >> 33;
  if (v16 * (v14 >> 33) == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
LABEL_37:
    abort();
  }
  int v18 = v10 - 1;
  uint64_t v19 = 2 * (v9 >> 1);
  uint64_t v20 = 2 * (v14 >> 1);
  int v21 = HIDWORD(v10) - 1;
  if (HIDWORD(v10) != 1)
  {
    if (v10 == 1)
    {
      do
      {
        *BOOL v13 = *v7;
        v7 += v11;
        v13 += v17;
        --v21;
      }
      while (v21);
    }
    else
    {
      int v22 = 0;
      do
      {
        int v23 = v13;
        int v24 = v7;
        int v25 = v10 - 1;
        do
        {
          _WORD *v23 = *v24;
          int v24 = (_WORD *)((char *)v24 + v19);
          int v23 = (_WORD *)((char *)v23 + v20);
          --v25;
        }
        while (v25);
        _WORD *v23 = *v24;
        v7 += v11;
        v13 += v17;
        ++v22;
      }
      while (v22 != v21);
    }
  }
  if (v10 != 1)
  {
    do
    {
      *BOOL v13 = *v7;
      unint64_t v7 = (_WORD *)((char *)v7 + v19);
      BOOL v13 = (_WORD *)((char *)v13 + v20);
      --v18;
    }
    while (v18);
  }
  *BOOL v13 = *v7;
  return a1;
}

void sub_21B964BD8(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)(v1 + 8);
  if (v3) {
    free(v3);
  }
  *(void *)(v1 + 8) = 0;
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B964BF4(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  unint64_t v7 = *(_DWORD **)(a2 + 8);
  if (*(_DWORD *)(a2 + 28)) {
    BOOL v8 = *(_DWORD *)(a2 + 24) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  unint64_t v9 = *(void *)(a2 + 32);
  if (v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *(void *)(a2 + 24);
  }
  unint64_t v11 = v9 >> 34;
  uint64_t v12 = HIDWORD(v10) * (v9 >> 34);
  if (v12 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_48;
  }
  if (v10) {
    BOOL v13 = HIDWORD(v10) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    return a1;
  }
  unint64_t v14 = *(_DWORD **)(a1 + 8);
  unint64_t v15 = *(void *)(a1 + 32);
  BOOL v16 = !*(_DWORD *)(a1 + 28) || *(_DWORD *)(a1 + 24) == 0;
  int v17 = v16 ? 0 : *(_DWORD *)(a1 + 28);
  unint64_t v29 = v15 >> 34;
  if (v17 * (v15 >> 34) == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
LABEL_48:
    abort();
  }
  uint64_t v18 = v9 & 0xFFFFFFFC;
  uint64_t v19 = v15 & 0xFFFFFFFC;
  if (v18 != 4 || v19 != 4)
  {
    if (!v10) {
      return a1;
    }
    int v20 = v10 - 1;
    int v21 = HIDWORD(v10) - 1;
    if (HIDWORD(v10) != 1)
    {
      if (v10 == 1)
      {
        do
        {
          *unint64_t v14 = *v7;
          v7 += v11;
          v14 += v29;
          --v21;
        }
        while (v21);
LABEL_55:
        *unint64_t v14 = *v7;
        return a1;
      }
      int v22 = 0;
      do
      {
        int v23 = v14;
        int v24 = v7;
        int v25 = v10 - 1;
        do
        {
          _DWORD *v23 = *v24;
          int v24 = (_DWORD *)((char *)v24 + v18);
          int v23 = (_DWORD *)((char *)v23 + v19);
          --v25;
        }
        while (v25);
        _DWORD *v23 = *v24;
        v7 += v11;
        v14 += v29;
        ++v22;
      }
      while (v22 != v21);
    }
    if (v10 != 1)
    {
      do
      {
        *unint64_t v14 = *v7;
        unint64_t v7 = (_DWORD *)((char *)v7 + v18);
        unint64_t v14 = (_DWORD *)((char *)v14 + v19);
        --v20;
      }
      while (v20);
    }
    goto LABEL_55;
  }
  if (v11 != v10 || v11 != v29)
  {
    if (!v10) {
      return a1;
    }
    size_t v26 = 4 * v10;
    int v27 = HIDWORD(v10) - 1;
    if (HIDWORD(v10) == 1)
    {
LABEL_49:
      if (v7
        || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v14, v7, v26);
        return a1;
      }
    }
    else
    {
      while (v7
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v14, v7, v26);
        v7 += v11;
        v14 += v29;
        if (!--v27) {
          goto LABEL_49;
        }
      }
    }
    goto LABEL_48;
  }
  if (!v7 && v12)
  {
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_48;
    }
    goto LABEL_53;
  }
  if (v12) {
LABEL_53:
  }
    memmove(v14, v7, 4 * v12);
  return a1;
}

uint64_t sub_21B964FB4(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  long long v7 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v61 = a1;
  *(_OWORD *)(a1 + 24) = v7;
  BOOL v8 = *(char **)(a2 + 8);
  unint64_t v9 = *(void *)(a2 + 36);
  if (*(_DWORD *)(a2 + 24)) {
    BOOL v10 = *(_DWORD *)(a2 + 28) == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || *(_DWORD *)(a2 + 32) == 0;
  int v12 = v11;
  if (v11) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *(void *)(a2 + 24);
  }
  if (v11) {
    int v14 = 0;
  }
  else {
    int v14 = *(_DWORD *)(a2 + 32);
  }
  uint64_t v63 = *(unsigned int *)(a2 + 44);
  size_t v15 = (v14 * *(_DWORD *)(a2 + 44));
  if (v15 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_116;
  }
  BOOL v16 = HIDWORD(v13) == 0;
  size_t v17 = v13;
  if (!v13) {
    BOOL v16 = 1;
  }
  if ((v12 | v16)) {
    return v61;
  }
  uint64_t v18 = *(char **)(v61 + 8);
  unint64_t v19 = *(void *)(v61 + 36);
  if (*(_DWORD *)(v61 + 32)) {
    BOOL v20 = *(_DWORD *)(v61 + 28) == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20 || *(_DWORD *)(v61 + 24) == 0) {
    int v22 = 0;
  }
  else {
    int v22 = *(_DWORD *)(v61 + 32);
  }
  uint64_t v62 = *(unsigned int *)(v61 + 44);
  if (v22 * *(_DWORD *)(v61 + 44) == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_116;
  }
  if (v9 != 1 || v19 != 1)
  {
    if (v13)
    {
      int v27 = v13 - 1;
      int v28 = HIDWORD(v13) - 1;
      unint64_t v29 = HIDWORD(v9);
      unint64_t v30 = HIDWORD(v19);
      int v31 = v14 - 1;
      if (v14 != 1)
      {
        if (HIDWORD(v13) == 1)
        {
          if (v13 == 1)
          {
            do
            {
              *uint64_t v18 = *v8;
              v8 += v63;
              v18 += v62;
              --v31;
            }
            while (v31);
          }
          else
          {
            int v48 = 0;
            do
            {
              int v49 = v13 - 1;
              v50 = v8;
              v51 = v18;
              do
              {
                char *v51 = *v50;
                v50 += v9;
                v51 += v19;
                --v49;
              }
              while (v49);
              char *v51 = *v50;
              v8 += v63;
              v18 += v62;
              ++v48;
            }
            while (v48 != v31);
          }
        }
        else
        {
          int v32 = 0;
          if (v13 == 1)
          {
            do
            {
              int v40 = HIDWORD(v13) - 1;
              v41 = v8;
              v42 = v18;
              do
              {
                char *v42 = *v41;
                v41 += v29;
                v42 += v30;
                --v40;
              }
              while (v40);
              char *v42 = *v41;
              v8 += v63;
              v18 += v62;
              ++v32;
            }
            while (v32 != v31);
          }
          else
          {
            do
            {
              int v33 = 0;
              v34 = v8;
              v35 = v18;
              do
              {
                int v36 = v13 - 1;
                v37 = v34;
                v38 = v35;
                do
                {
                  char *v38 = *v37;
                  v37 += v9;
                  v38 += v19;
                  --v36;
                }
                while (v36);
                char *v38 = *v37;
                v34 += v29;
                v35 += v30;
                ++v33;
              }
              while (v33 != v28);
              int v39 = v13 - 1;
              do
              {
                char *v35 = *v34;
                v34 += v9;
                v35 += v19;
                --v39;
              }
              while (v39);
              char *v35 = *v34;
              v8 += v63;
              v18 += v62;
              ++v32;
            }
            while (v32 != v31);
          }
        }
      }
      if (HIDWORD(v13) != 1)
      {
        if (v13 == 1)
        {
          do
          {
            *uint64_t v18 = *v8;
            v8 += v29;
            v18 += v30;
            --v28;
          }
          while (v28);
        }
        else
        {
          int v52 = 0;
          do
          {
            int v53 = v13 - 1;
            v54 = v8;
            v55 = v18;
            do
            {
              char *v55 = *v54;
              v54 += v9;
              v55 += v19;
              --v53;
            }
            while (v53);
            char *v55 = *v54;
            v8 += v29;
            v18 += v30;
            ++v52;
          }
          while (v52 != v28);
        }
      }
      if (v13 != 1)
      {
        do
        {
          *uint64_t v18 = *v8;
          v8 += v9;
          v18 += v19;
          --v27;
        }
        while (v27);
      }
      *uint64_t v18 = *v8;
    }
    return v61;
  }
  int v23 = (char *)HIDWORD(v9);
  unint64_t v24 = HIDWORD(v19);
  if (v23 != HIDWORD(v19) || v23 != v13)
  {
    if (!v13) {
      return v61;
    }
    int v43 = HIDWORD(v13) - 1;
    int v60 = v14 - 1;
    if (v14 == 1)
    {
LABEL_111:
      if (HIDWORD(v13) == 1)
      {
LABEL_117:
        if (v8)
        {
LABEL_119:
          v56 = v18;
          v57 = v8;
          size_t v58 = v17;
          goto LABEL_120;
        }
LABEL_118:
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          goto LABEL_116;
        }
        goto LABEL_119;
      }
      while (v8
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v18, v8, v17);
        BOOL v8 = &v23[(void)v8];
        v18 += v24;
        if (!--v43) {
          goto LABEL_117;
        }
      }
    }
    else if (HIDWORD(v13) == 1)
    {
      while (v8
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v18, v8, v13);
        v8 += v63;
        v18 += v62;
        if (!--v60) {
          goto LABEL_111;
        }
      }
    }
    else
    {
      int v44 = 0;
      while (1)
      {
        int v45 = 0;
        v46 = v8;
        v47 = v18;
        do
        {
          while (v46)
          {
            memmove(v47, v46, v17);
            v46 = &v23[(void)v46];
            v47 += v24;
            if (++v45 == v43) {
              goto LABEL_71;
            }
          }
          if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            goto LABEL_116;
          }
          memcpy(v47, 0, v17);
          v47 += v24;
          ++v45;
          v46 = v23;
        }
        while (v45 != v43);
        v46 = v23;
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          break;
        }
LABEL_71:
        memmove(v47, v46, v17);
        v8 += v63;
        v18 += v62;
        if (++v44 == v60) {
          goto LABEL_111;
        }
      }
    }
LABEL_116:
    abort();
  }
  size_t v17 = (HIDWORD(v13) * v13);
  if (v63 == v17 && v63 == v62)
  {
    if (v8 || !v15)
    {
      if (!v15) {
        return v61;
      }
    }
    else if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_116;
    }
    v56 = v18;
    v57 = v8;
    size_t v58 = v15;
LABEL_120:
    memmove(v56, v57, v58);
    return v61;
  }
  if (!v13) {
    return v61;
  }
  int v26 = v14 - 1;
  if (v14 == 1)
  {
LABEL_103:
    if (!v17 || v8)
    {
      if (!v17) {
        return v61;
      }
      goto LABEL_119;
    }
    goto LABEL_118;
  }
  if (v17)
  {
    while (v8
         || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      memmove(v18, v8, v17);
      v8 += v63;
      v18 += v62;
      if (!--v26) {
        goto LABEL_103;
      }
    }
    goto LABEL_116;
  }
  return v61;
}

uint64_t sub_21B965784(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  long long v7 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v81 = a1;
  *(_OWORD *)(a1 + 24) = v7;
  BOOL v8 = *(_WORD **)(a2 + 8);
  unint64_t v9 = *(void *)(a2 + 36);
  unint64_t v10 = (unint64_t)*(unsigned int *)(a2 + 44) >> 1;
  if (*(_DWORD *)(a2 + 24)) {
    BOOL v11 = *(_DWORD *)(a2 + 28) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || *(_DWORD *)(a2 + 32) == 0;
  char v13 = v12;
  if (v12) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = *(void *)(a2 + 24);
  }
  if (v12) {
    int v15 = 0;
  }
  else {
    int v15 = *(_DWORD *)(a2 + 32);
  }
  uint64_t v16 = (v15 * v10);
  if (v16 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_116;
  }
  if (v14) {
    BOOL v17 = HIDWORD(v14) == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17) {
    char v18 = 1;
  }
  else {
    char v18 = v13;
  }
  if (v18) {
    return v81;
  }
  unint64_t v19 = *(_WORD **)(v81 + 8);
  unint64_t v20 = *(void *)(v81 + 36);
  unint64_t v21 = (unint64_t)*(unsigned int *)(v81 + 44) >> 1;
  if (*(_DWORD *)(v81 + 32)) {
    BOOL v22 = *(_DWORD *)(v81 + 28) == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22 || *(_DWORD *)(v81 + 24) == 0) {
    int v24 = 0;
  }
  else {
    int v24 = *(_DWORD *)(v81 + 32);
  }
  if (v24 * v21 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_116;
  }
  uint64_t v25 = v9 & 0xFFFFFFFE;
  uint64_t v26 = v20 & 0xFFFFFFFE;
  if (v25 != 2 || v26 != 2)
  {
    int v35 = v14 - 1;
    int v36 = HIDWORD(v14) - 1;
    uint64_t v37 = v9 >> 33;
    uint64_t v38 = v20 >> 33;
    int v39 = v15 - 1;
    if (v15 != 1)
    {
      if (HIDWORD(v14) == 1)
      {
        if (v14 != 1)
        {
          int v69 = 0;
          do
          {
            v70 = v19;
            v71 = v8;
            int v72 = v14 - 1;
            do
            {
              _WORD *v70 = *v71;
              v71 = (_WORD *)((char *)v71 + v25);
              v70 = (_WORD *)((char *)v70 + v26);
              --v72;
            }
            while (v72);
            _WORD *v70 = *v71;
            v8 += v10;
            v19 += v21;
            ++v69;
          }
          while (v69 != v39);
LABEL_92:
          if (v14 != 1)
          {
            do
            {
              *unint64_t v19 = *v8;
              BOOL v8 = (_WORD *)((char *)v8 + v25);
              unint64_t v19 = (_WORD *)((char *)v19 + v26);
              --v35;
            }
            while (v35);
          }
          goto LABEL_123;
        }
        do
        {
          *unint64_t v19 = *v8;
          v8 += v10;
          v19 += v21;
          --v39;
        }
        while (v39);
LABEL_123:
        *unint64_t v19 = *v8;
        return v81;
      }
      if (v14 == 1)
      {
        int v73 = 0;
        do
        {
          v74 = v19;
          v75 = v8;
          int v76 = HIDWORD(v14) - 1;
          do
          {
            _WORD *v74 = *v75;
            v75 += v37;
            v74 += v38;
            --v76;
          }
          while (v76);
          _WORD *v74 = *v75;
          v8 += v10;
          v19 += v21;
          ++v73;
        }
        while (v73 != v39);
        do
        {
LABEL_102:
          *unint64_t v19 = *v8;
          v8 += v37;
          v19 += v38;
          --v36;
        }
        while (v36);
        goto LABEL_123;
      }
      int v40 = 0;
      uint64_t v41 = 2 * v10;
      uint64_t v42 = v37;
      uint64_t v43 = 2 * v21;
      uint64_t v44 = v38;
      int v45 = &v8[v37];
      v46 = &v19[v38];
      do
      {
        int v47 = 0;
        int v48 = v46;
        int v49 = v45;
        v50 = v19;
        v51 = v8;
        do
        {
          int v52 = v49;
          int v53 = v48;
          v54 = v50;
          v55 = v51;
          int v56 = v14 - 1;
          do
          {
            _WORD *v54 = *v55;
            v55 = (_WORD *)((char *)v55 + v25);
            v54 = (_WORD *)((char *)v54 + v26);
            --v56;
          }
          while (v56);
          _WORD *v54 = *v55;
          v51 = (_WORD *)((char *)v51 + v42 * 2);
          v50 = (_WORD *)((char *)v50 + v44 * 2);
          ++v47;
          int v49 = &v52[v42];
          int v48 = &v53[v44];
        }
        while (v47 != v36);
        int v57 = v14 - 1;
        do
        {
          *int v53 = *v52;
          int v52 = (_WORD *)((char *)v52 + v25);
          int v53 = (_WORD *)((char *)v53 + v26);
          --v57;
        }
        while (v57);
        *int v53 = *v52;
        BOOL v8 = (_WORD *)((char *)v8 + v41);
        unint64_t v19 = (_WORD *)((char *)v19 + v43);
        ++v40;
        int v45 = (_WORD *)((char *)v45 + v41);
        v46 = (_WORD *)((char *)v46 + v43);
      }
      while (v40 != v39);
    }
    if (HIDWORD(v14) == 1) {
      goto LABEL_92;
    }
    if (v14 != 1)
    {
      int v58 = 0;
      uint64_t v59 = 2 * v37;
      uint64_t v60 = 2 * v38;
      do
      {
        uint64_t v61 = v19;
        uint64_t v62 = v8;
        int v63 = v14 - 1;
        do
        {
          *uint64_t v61 = *v62;
          uint64_t v62 = (_WORD *)((char *)v62 + v25);
          uint64_t v61 = (_WORD *)((char *)v61 + v26);
          --v63;
        }
        while (v63);
        *uint64_t v61 = *v62;
        BOOL v8 = (_WORD *)((char *)v8 + v59);
        unint64_t v19 = (_WORD *)((char *)v19 + v60);
        ++v58;
      }
      while (v58 != v36);
      goto LABEL_92;
    }
    goto LABEL_102;
  }
  unint64_t v27 = v21;
  unint64_t v28 = v9 >> 33;
  unint64_t v29 = v20 >> 33;
  if (v9 >> 33 != v14 || v28 != v29)
  {
    int v64 = HIDWORD(v14) - 1;
    size_t v32 = 2 * v14;
    int v83 = v15 - 1;
    if (v15 == 1)
    {
LABEL_111:
      if (!v64)
      {
LABEL_117:
        if (v8)
        {
LABEL_119:
          memmove(v19, v8, v32);
          return v81;
        }
LABEL_118:
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          goto LABEL_116;
        }
        goto LABEL_119;
      }
      while (v8
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v19, v8, v32);
        v8 += v28;
        v19 += v29;
        if (!--v64) {
          goto LABEL_117;
        }
      }
    }
    else if (HIDWORD(v14) == 1)
    {
      uint64_t v77 = 2 * v27;
      while (v8
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v19, v8, v32);
        v8 += v10;
        unint64_t v19 = (_WORD *)((char *)v19 + v77);
        if (!--v83) {
          goto LABEL_111;
        }
      }
    }
    else
    {
      int v65 = 0;
      uint64_t v79 = v10;
      uint64_t v80 = v27;
      while (1)
      {
        int v82 = v65;
        int v66 = 0;
        v67 = (char *)v8;
        v68 = (char *)v19;
        do
        {
          while (v67)
          {
            memmove(v68, v67, v32);
            v67 += 2 * v28;
            v68 += 2 * v29;
            if (++v66 == v64) {
              goto LABEL_75;
            }
          }
          if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            goto LABEL_116;
          }
          memcpy(v68, 0, v32);
          v68 += 2 * v29;
          ++v66;
          v67 = (char *)(2 * v28);
        }
        while (v66 != v64);
        v67 = (char *)(2 * v28);
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          break;
        }
LABEL_75:
        memmove(v68, v67, v32);
        v8 += v79;
        v19 += v80;
        int v65 = v82 + 1;
        if (v82 + 1 == v83) {
          goto LABEL_111;
        }
      }
    }
LABEL_116:
    abort();
  }
  uint64_t v30 = (HIDWORD(v14) * v14);
  if (v10 == v30 && v10 == v27)
  {
    if (v8 || !v16)
    {
      if (!v16) {
        return v81;
      }
    }
    else if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_116;
    }
    memmove(v19, v8, 2 * v16);
    return v81;
  }
  size_t v32 = 2 * v30;
  int v33 = v15 - 1;
  if (v15 == 1)
  {
LABEL_95:
    if (!v30 || v8)
    {
      if (!v30) {
        return v81;
      }
      goto LABEL_119;
    }
    goto LABEL_118;
  }
  if (v30)
  {
    uint64_t v34 = 2 * v27;
    while (v8
         || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      memmove(v19, v8, 2 * v30);
      v8 += v10;
      unint64_t v19 = (_WORD *)((char *)v19 + v34);
      if (!--v33) {
        goto LABEL_95;
      }
    }
    goto LABEL_116;
  }
  return v81;
}

uint64_t sub_21B965FC8(uint64_t a1)
{
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    BOOL v3 = !*(_DWORD *)(a1 + 32) || *(_DWORD *)(a1 + 28) == 0;
    BOOL v4 = v3 || *(_DWORD *)(a1 + 24) == 0;
    int v5 = v4 ? 0 : *(_DWORD *)(a1 + 32);
    if (v5 * (*(_DWORD *)(a1 + 44) >> 1) != -1) {
      goto LABEL_14;
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    v2 = *(void **)(a1 + 8);
    if (v2) {
LABEL_14:
    }
      free(v2);
  }
  *(void *)(a1 + 8) = 0;
  return a1;
}

uint64_t sub_21B966078(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  long long v7 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v7;
  BOOL v8 = *(_WORD **)(a2 + 8);
  unint64_t v9 = *(void *)(a2 + 36);
  unint64_t v10 = (unint64_t)*(unsigned int *)(a2 + 44) >> 1;
  if (*(_DWORD *)(a2 + 24)) {
    BOOL v11 = *(_DWORD *)(a2 + 28) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || *(_DWORD *)(a2 + 32) == 0;
  char v13 = v12;
  if (v12) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = *(void *)(a2 + 24);
  }
  if (v12) {
    int v15 = 0;
  }
  else {
    int v15 = *(_DWORD *)(a2 + 32);
  }
  if (v15 * v10 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_77;
  }
  if (v14) {
    BOOL v16 = HIDWORD(v14) == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16) {
    char v17 = 1;
  }
  else {
    char v17 = v13;
  }
  if (v17) {
    return a1;
  }
  char v18 = *(_WORD **)(a1 + 8);
  unint64_t v19 = *(void *)(a1 + 36);
  unint64_t v20 = (unint64_t)*(unsigned int *)(a1 + 44) >> 1;
  BOOL v21 = !*(_DWORD *)(a1 + 32) || *(_DWORD *)(a1 + 28) == 0;
  BOOL v22 = v21 || *(_DWORD *)(a1 + 24) == 0;
  int v23 = v22 ? 0 : *(_DWORD *)(a1 + 32);
  if (v23 * v20 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
LABEL_77:
    abort();
  }
  uint64_t v24 = v9 >> 1;
  int v25 = v14 - 1;
  uint64_t v26 = v19 >> 1;
  int v27 = HIDWORD(v14) - 1;
  uint64_t v28 = v9 >> 33;
  uint64_t v29 = v19 >> 33;
  int v30 = v15 - 1;
  if (v15 != 1)
  {
    if (HIDWORD(v14) == 1)
    {
      if (v14 == 1)
      {
        do
        {
          *char v18 = *v8;
          v8 += v10;
          v18 += v20;
          --v30;
        }
        while (v30);
      }
      else
      {
        int v51 = 0;
        do
        {
          int v52 = v18;
          int v53 = v8;
          int v54 = v14 - 1;
          do
          {
            *int v52 = *v53;
            v53 += v24;
            v52 += v26;
            --v54;
          }
          while (v54);
          *int v52 = *v53;
          v8 += v10;
          v18 += v20;
          ++v51;
        }
        while (v51 != v30);
      }
    }
    else
    {
      int v31 = 0;
      uint64_t v32 = 2 * v10;
      uint64_t v33 = v28;
      if (v14 == 1)
      {
        do
        {
          int v55 = HIDWORD(v14) - 1;
          int v56 = v18;
          int v57 = v8;
          do
          {
            _WORD *v56 = *v57;
            int v57 = (_WORD *)((char *)v57 + v33 * 2);
            v56 += v29;
            --v55;
          }
          while (v55);
          _WORD *v56 = *v57;
          BOOL v8 = (_WORD *)((char *)v8 + v32);
          v18 += v20;
          ++v31;
        }
        while (v31 != v30);
      }
      else
      {
        uint64_t v34 = 2 * v24;
        uint64_t v35 = 2 * v20;
        uint64_t v36 = v29;
        uint64_t v37 = &v8[v33];
        uint64_t v38 = &v18[v29];
        uint64_t v39 = 2 * v26;
        do
        {
          int v40 = 0;
          uint64_t v41 = v38;
          uint64_t v42 = v37;
          uint64_t v43 = v18;
          uint64_t v44 = v8;
          do
          {
            int v45 = v42;
            v46 = v41;
            int v47 = v43;
            int v48 = v44;
            int v49 = v25;
            do
            {
              _WORD *v47 = *v48;
              int v48 = (_WORD *)((char *)v48 + v34);
              int v47 = (_WORD *)((char *)v47 + v39);
              --v49;
            }
            while (v49);
            _WORD *v47 = *v48;
            uint64_t v44 = (_WORD *)((char *)v44 + v33 * 2);
            uint64_t v43 = (_WORD *)((char *)v43 + v36 * 2);
            ++v40;
            uint64_t v42 = &v45[v33];
            uint64_t v41 = &v46[v36];
          }
          while (v40 != v27);
          int v50 = v25;
          do
          {
            _WORD *v46 = *v45;
            int v45 = (_WORD *)((char *)v45 + v34);
            v46 = (_WORD *)((char *)v46 + v39);
            --v50;
          }
          while (v50);
          _WORD *v46 = *v45;
          BOOL v8 = (_WORD *)((char *)v8 + v32);
          char v18 = (_WORD *)((char *)v18 + v35);
          ++v31;
          uint64_t v37 = (_WORD *)((char *)v37 + v32);
          uint64_t v38 = (_WORD *)((char *)v38 + v35);
        }
        while (v31 != v30);
      }
    }
  }
  if (v27)
  {
    if (v25)
    {
      int v58 = 0;
      uint64_t v59 = 2 * v28;
      uint64_t v60 = 2 * v29;
      do
      {
        uint64_t v61 = v18;
        uint64_t v62 = v8;
        int v63 = v25;
        do
        {
          *uint64_t v61 = *v62;
          v62 += v24;
          v61 += v26;
          --v63;
        }
        while (v63);
        *uint64_t v61 = *v62;
        BOOL v8 = (_WORD *)((char *)v8 + v59);
        char v18 = (_WORD *)((char *)v18 + v60);
        ++v58;
      }
      while (v58 != v27);
    }
    else
    {
      uint64_t v64 = 2 * v28;
      uint64_t v65 = 2 * v29;
      do
      {
        *char v18 = *v8;
        BOOL v8 = (_WORD *)((char *)v8 + v64);
        char v18 = (_WORD *)((char *)v18 + v65);
        --v27;
      }
      while (v27);
    }
  }
  if (v25)
  {
    uint64_t v66 = 2 * v24;
    uint64_t v67 = 2 * v26;
    do
    {
      *char v18 = *v8;
      BOOL v8 = (_WORD *)((char *)v8 + v66);
      char v18 = (_WORD *)((char *)v18 + v67);
      --v25;
    }
    while (v25);
  }
  *char v18 = *v8;
  return a1;
}

void sub_21B96648C(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)(v1 + 8);
  if (v3) {
    free(v3);
  }
  *(void *)(v1 + 8) = 0;
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B9664A8(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a2;
  size_t v5 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v5;
  if (v4)
  {
    memptr = 0;
    int v6 = malloc_type_posix_memalign(&memptr, v5, v4, 0x1F88E90uLL);
    if (v6) {
      sub_21B97D9E4(v6, *(void *)(a1 + 16), v4);
    }
    *(void *)(a1 + 8) = memptr;
  }
  long long v7 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v81 = a1;
  *(_OWORD *)(a1 + 24) = v7;
  BOOL v8 = *(_DWORD **)(a2 + 8);
  unint64_t v9 = *(void *)(a2 + 36);
  unint64_t v10 = (unint64_t)*(unsigned int *)(a2 + 44) >> 2;
  if (*(_DWORD *)(a2 + 24)) {
    BOOL v11 = *(_DWORD *)(a2 + 28) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || *(_DWORD *)(a2 + 32) == 0;
  char v13 = v12;
  if (v12) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = *(void *)(a2 + 24);
  }
  if (v12) {
    int v15 = 0;
  }
  else {
    int v15 = *(_DWORD *)(a2 + 32);
  }
  uint64_t v16 = (v15 * v10);
  if (v16 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_116;
  }
  if (v14) {
    BOOL v17 = HIDWORD(v14) == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17) {
    char v18 = 1;
  }
  else {
    char v18 = v13;
  }
  if (v18) {
    return v81;
  }
  unint64_t v19 = *(_DWORD **)(v81 + 8);
  unint64_t v20 = *(void *)(v81 + 36);
  unint64_t v21 = (unint64_t)*(unsigned int *)(v81 + 44) >> 2;
  if (*(_DWORD *)(v81 + 32)) {
    BOOL v22 = *(_DWORD *)(v81 + 28) == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22 || *(_DWORD *)(v81 + 24) == 0) {
    int v24 = 0;
  }
  else {
    int v24 = *(_DWORD *)(v81 + 32);
  }
  if (v24 * v21 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_116;
  }
  uint64_t v25 = v9 & 0xFFFFFFFC;
  uint64_t v26 = v20 & 0xFFFFFFFC;
  if (v25 != 4 || v26 != 4)
  {
    int v35 = v14 - 1;
    int v36 = HIDWORD(v14) - 1;
    uint64_t v37 = v9 >> 34;
    uint64_t v38 = v20 >> 34;
    int v39 = v15 - 1;
    if (v15 != 1)
    {
      if (HIDWORD(v14) == 1)
      {
        if (v14 != 1)
        {
          int v69 = 0;
          do
          {
            v70 = v19;
            v71 = v8;
            int v72 = v14 - 1;
            do
            {
              _DWORD *v70 = *v71;
              v71 = (_DWORD *)((char *)v71 + v25);
              v70 = (_DWORD *)((char *)v70 + v26);
              --v72;
            }
            while (v72);
            _DWORD *v70 = *v71;
            v8 += v10;
            v19 += v21;
            ++v69;
          }
          while (v69 != v39);
LABEL_92:
          if (v14 != 1)
          {
            do
            {
              *unint64_t v19 = *v8;
              BOOL v8 = (_DWORD *)((char *)v8 + v25);
              unint64_t v19 = (_DWORD *)((char *)v19 + v26);
              --v35;
            }
            while (v35);
          }
          goto LABEL_123;
        }
        do
        {
          *unint64_t v19 = *v8;
          v8 += v10;
          v19 += v21;
          --v39;
        }
        while (v39);
LABEL_123:
        *unint64_t v19 = *v8;
        return v81;
      }
      if (v14 == 1)
      {
        int v73 = 0;
        do
        {
          v74 = v19;
          v75 = v8;
          int v76 = HIDWORD(v14) - 1;
          do
          {
            _DWORD *v74 = *v75;
            v75 += v37;
            v74 += v38;
            --v76;
          }
          while (v76);
          _DWORD *v74 = *v75;
          v8 += v10;
          v19 += v21;
          ++v73;
        }
        while (v73 != v39);
        do
        {
LABEL_102:
          *unint64_t v19 = *v8;
          v8 += v37;
          v19 += v38;
          --v36;
        }
        while (v36);
        goto LABEL_123;
      }
      int v40 = 0;
      uint64_t v41 = 4 * v10;
      uint64_t v42 = v37;
      uint64_t v43 = 4 * v21;
      uint64_t v44 = v38;
      int v45 = &v8[v37];
      v46 = &v19[v38];
      do
      {
        int v47 = 0;
        int v48 = v46;
        int v49 = v45;
        int v50 = v19;
        int v51 = v8;
        do
        {
          int v52 = v49;
          int v53 = v48;
          int v54 = v50;
          int v55 = v51;
          int v56 = v14 - 1;
          do
          {
            _DWORD *v54 = *v55;
            int v55 = (_DWORD *)((char *)v55 + v25);
            int v54 = (_DWORD *)((char *)v54 + v26);
            --v56;
          }
          while (v56);
          _DWORD *v54 = *v55;
          int v51 = (_DWORD *)((char *)v51 + v42 * 4);
          int v50 = (_DWORD *)((char *)v50 + v44 * 4);
          ++v47;
          int v49 = &v52[v42];
          int v48 = &v53[v44];
        }
        while (v47 != v36);
        int v57 = v14 - 1;
        do
        {
          *int v53 = *v52;
          int v52 = (_DWORD *)((char *)v52 + v25);
          int v53 = (_DWORD *)((char *)v53 + v26);
          --v57;
        }
        while (v57);
        *int v53 = *v52;
        BOOL v8 = (_DWORD *)((char *)v8 + v41);
        unint64_t v19 = (_DWORD *)((char *)v19 + v43);
        ++v40;
        int v45 = (_DWORD *)((char *)v45 + v41);
        v46 = (_DWORD *)((char *)v46 + v43);
      }
      while (v40 != v39);
    }
    if (HIDWORD(v14) == 1) {
      goto LABEL_92;
    }
    if (v14 != 1)
    {
      int v58 = 0;
      uint64_t v59 = 4 * v37;
      uint64_t v60 = 4 * v38;
      do
      {
        uint64_t v61 = v19;
        uint64_t v62 = v8;
        int v63 = v14 - 1;
        do
        {
          *uint64_t v61 = *v62;
          uint64_t v62 = (_DWORD *)((char *)v62 + v25);
          uint64_t v61 = (_DWORD *)((char *)v61 + v26);
          --v63;
        }
        while (v63);
        *uint64_t v61 = *v62;
        BOOL v8 = (_DWORD *)((char *)v8 + v59);
        unint64_t v19 = (_DWORD *)((char *)v19 + v60);
        ++v58;
      }
      while (v58 != v36);
      goto LABEL_92;
    }
    goto LABEL_102;
  }
  unint64_t v27 = v21;
  unint64_t v28 = v9 >> 34;
  unint64_t v29 = v20 >> 34;
  if (v9 >> 34 != v14 || v28 != v29)
  {
    int v64 = HIDWORD(v14) - 1;
    size_t v32 = 4 * v14;
    int v83 = v15 - 1;
    if (v15 == 1)
    {
LABEL_111:
      if (!v64)
      {
LABEL_117:
        if (v8)
        {
LABEL_119:
          memmove(v19, v8, v32);
          return v81;
        }
LABEL_118:
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          goto LABEL_116;
        }
        goto LABEL_119;
      }
      while (v8
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v19, v8, v32);
        v8 += v28;
        v19 += v29;
        if (!--v64) {
          goto LABEL_117;
        }
      }
    }
    else if (HIDWORD(v14) == 1)
    {
      uint64_t v77 = 4 * v27;
      while (v8
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v19, v8, v32);
        v8 += v10;
        unint64_t v19 = (_DWORD *)((char *)v19 + v77);
        if (!--v83) {
          goto LABEL_111;
        }
      }
    }
    else
    {
      int v65 = 0;
      uint64_t v79 = v10;
      uint64_t v80 = v27;
      while (1)
      {
        int v82 = v65;
        int v66 = 0;
        uint64_t v67 = (char *)v8;
        v68 = (char *)v19;
        do
        {
          while (v67)
          {
            memmove(v68, v67, v32);
            v67 += 4 * v28;
            v68 += 4 * v29;
            if (++v66 == v64) {
              goto LABEL_75;
            }
          }
          if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            goto LABEL_116;
          }
          memcpy(v68, 0, v32);
          v68 += 4 * v29;
          ++v66;
          uint64_t v67 = (char *)(4 * v28);
        }
        while (v66 != v64);
        uint64_t v67 = (char *)(4 * v28);
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          break;
        }
LABEL_75:
        memmove(v68, v67, v32);
        v8 += v79;
        v19 += v80;
        int v65 = v82 + 1;
        if (v82 + 1 == v83) {
          goto LABEL_111;
        }
      }
    }
LABEL_116:
    abort();
  }
  uint64_t v30 = (HIDWORD(v14) * v14);
  if (v10 == v30 && v10 == v27)
  {
    if (v8 || !v16)
    {
      if (!v16) {
        return v81;
      }
    }
    else if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_116;
    }
    memmove(v19, v8, 4 * v16);
    return v81;
  }
  size_t v32 = 4 * v30;
  int v33 = v15 - 1;
  if (v15 == 1)
  {
LABEL_95:
    if (!v30 || v8)
    {
      if (!v30) {
        return v81;
      }
      goto LABEL_119;
    }
    goto LABEL_118;
  }
  if (v30)
  {
    uint64_t v34 = 4 * v27;
    while (v8
         || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      memmove(v19, v8, 4 * v30);
      v8 += v10;
      unint64_t v19 = (_DWORD *)((char *)v19 + v34);
      if (!--v33) {
        goto LABEL_95;
      }
    }
    goto LABEL_116;
  }
  return v81;
}

void sub_21B966CF0()
{
}

void sub_21B966D04(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  unint64_t v143 = a3;
  switch(a2)
  {
    case 1:
      *(void *)v158 = &unk_26CBA0F00;
      LOBYTE(v148) = 0;
      sub_21B95FE7C(&v143, (uint64_t)&v148, (uint64_t)&v150);
      operator new();
    case 2:
      *(void *)v158 = &unk_26CBA0F38;
      LOWORD(v148) = 0;
      sub_21B960178(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 3:
      LOWORD(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v80 = a3 == 0;
      }
      else {
        BOOL v80 = 1;
      }
      if (v80) {
        unint64_t v81 = 0;
      }
      else {
        unint64_t v81 = a3;
      }
      unint64_t v82 = v81 << 32;
      if (!HIDWORD(v81)) {
        unint64_t v82 = 0;
      }
      BOOL v83 = v81 != 0;
      if (v81) {
        BOOL v84 = HIDWORD(v81) == 0;
      }
      else {
        BOOL v84 = 1;
      }
      *(void *)v158 = v81;
      *(void *)&v158[8] = v82 | v83;
      v158[16] = 0;
      v158[24] = 0;
      uint64_t v148 = v82 | v83;
      if (v84) {
        unint64_t v81 = 0;
      }
      v145 = &unk_26CBA0F70;
      unint64_t v146 = v81;
      if (((v82 >> 31) & ((v82 >> 31) - 1)) != 0) {
        uint64_t v85 = 2;
      }
      else {
        uint64_t v85 = v82 >> 31;
      }
      v86 = sub_21B96BD7C((unint64_t *)&v159, &v146, (unint64_t *)&v148, 1, &v144, 1, v85);
      v150 = &unk_26CB9F710;
      *(_OWORD *)v151 = *(_OWORD *)v158;
      *(_OWORD *)&v151[12] = *(_OWORD *)&v158[12];
      *(void *)&long long v152 = *v86;
      *((void *)&v152 + 1) = *((void *)&v159 + 1);
      uint64_t v153 = v160;
      long long v154 = v161;
      operator new();
    case 4:
      int v144 = 0;
      if (HIDWORD(a3)) {
        BOOL v45 = a3 == 0;
      }
      else {
        BOOL v45 = 1;
      }
      if (v45) {
        unint64_t v46 = 0;
      }
      else {
        unint64_t v46 = a3;
      }
      unint64_t v47 = v46 << 32;
      if (!HIDWORD(v46)) {
        unint64_t v47 = 0;
      }
      BOOL v48 = v46 != 0;
      if (v46) {
        BOOL v49 = HIDWORD(v46) == 0;
      }
      else {
        BOOL v49 = 1;
      }
      *(void *)v158 = v46;
      *(void *)&v158[8] = v47 | v48;
      v158[16] = 0;
      v158[24] = 0;
      uint64_t v148 = v47 | v48;
      if (v49) {
        unint64_t v46 = 0;
      }
      v145 = &unk_26CB9CEC0;
      unint64_t v146 = v46;
      if (((v47 >> 30) & ((v47 >> 30) - 1)) != 0) {
        uint64_t v50 = 4;
      }
      else {
        uint64_t v50 = v47 >> 30;
      }
      int v51 = sub_21B96C0AC((unint64_t *)&v159, &v146, (unint64_t *)&v148, 1, &v144, 1, v50);
      v150 = &unk_26CB9CD20;
      *(_OWORD *)v151 = *(_OWORD *)v158;
      *(_OWORD *)&v151[12] = *(_OWORD *)&v158[12];
      *(void *)&long long v152 = *v51;
      *((void *)&v152 + 1) = *((void *)&v159 + 1);
      uint64_t v153 = v160;
      long long v154 = v161;
      operator new();
    case 5:
      v145 = &unk_26CBA0FA8;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v66 = a3 == 0;
      }
      else {
        BOOL v66 = 1;
      }
      if (v66) {
        unint64_t v67 = 0;
      }
      else {
        unint64_t v67 = a3;
      }
      *(void *)&v158[4] = v67;
      *(_DWORD *)v158 = 2;
      uint64_t v68 = 2 * (v67 != 0);
      LODWORD(v69) = v68 * v67;
      unint64_t v70 = HIDWORD(v67);
      if (HIDWORD(v67)) {
        unint64_t v69 = v69;
      }
      else {
        unint64_t v69 = 0;
      }
      unint64_t v71 = v68 & 0x1FFFFFFFFLL | ((unint64_t)(v69 >> 1) << 33);
      *(_DWORD *)v158 = 2;
      unint64_t v72 = *(void *)v158;
      *(_DWORD *)&v158[4] = v71;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = HIDWORD(v67);
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v69;
      *(void *)v158 = v72;
      *(void *)&v158[24] = v67;
      *(void *)&long long v159 = v71;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v69;
      if (HIDWORD(v72)) {
        BOOL v73 = v72 == 0;
      }
      else {
        BOOL v73 = 1;
      }
      BOOL v74 = v73 || HIDWORD(v67) == 0;
      if (v74) {
        unint64_t v75 = 0;
      }
      else {
        unint64_t v75 = v72;
      }
      unint64_t v146 = v75;
      if (v74) {
        int v76 = 0;
      }
      else {
        int v76 = v70;
      }
      int v147 = v76;
      if ((v69 & (v69 - 1)) != 0) {
        uint64_t v77 = 1;
      }
      else {
        uint64_t v77 = v69;
      }
      v78 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v77);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CB9F790;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v79 = *v78;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v79;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 6:
      *(void *)v158 = &unk_26CBA0FE0;
      LOWORD(v148) = 0;
      sub_21B96087C(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 7:
      *(void *)v158 = &unk_26CBA1018;
      LOWORD(v148) = 0;
      sub_21B960A10(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 8:
      *(void *)v158 = &unk_26CB9E520;
      LODWORD(v148) = 0;
      sub_21B960BA4(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 9:
      v145 = &unk_26CBA1050;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v52 = a3 == 0;
      }
      else {
        BOOL v52 = 1;
      }
      if (v52) {
        unint64_t v53 = 0;
      }
      else {
        unint64_t v53 = a3;
      }
      *(void *)&v158[4] = v53;
      *(_DWORD *)v158 = 3;
      if (v53) {
        uint64_t v54 = 3;
      }
      else {
        uint64_t v54 = 0;
      }
      LODWORD(v55) = v54 * *(_DWORD *)&v158[4];
      uint64_t v56 = HIDWORD(*(void *)&v158[4]);
      if (HIDWORD(*(void *)&v158[4])) {
        uint64_t v55 = v55;
      }
      else {
        uint64_t v55 = 0;
      }
      uint64_t v57 = v54 | (v55 << 32);
      *(_DWORD *)v158 = 3;
      unint64_t v58 = *(void *)v158;
      *(_DWORD *)&v158[4] = v57;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = v56;
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v55;
      *(void *)v158 = v58;
      *(void *)&v158[24] = v53;
      *(void *)&long long v159 = v57;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v55;
      if (HIDWORD(v58)) {
        BOOL v59 = v58 == 0;
      }
      else {
        BOOL v59 = 1;
      }
      BOOL v60 = v59 || v56 == 0;
      if (v60) {
        unint64_t v61 = 0;
      }
      else {
        unint64_t v61 = v58;
      }
      unint64_t v146 = v61;
      if (v60) {
        int v62 = 0;
      }
      else {
        int v62 = v56;
      }
      int v147 = v62;
      if ((v55 & (v55 - 1)) != 0) {
        uint64_t v63 = 1;
      }
      else {
        uint64_t v63 = v55;
      }
      int v64 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v63);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CB9F910;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v65 = *v64;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v65;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 10:
      *(void *)v158 = &unk_26CBA1088;
      LOWORD(v148) = 0;
      sub_21B960F08(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 11:
      *(void *)v158 = &unk_26CBA10C0;
      LOWORD(v148) = 0;
      sub_21B961098(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 12:
      *(void *)v158 = &unk_26CBA10F8;
      LODWORD(v148) = 0;
      sub_21B961228(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 13:
      v145 = &unk_26CBA1130;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v31 = a3 == 0;
      }
      else {
        BOOL v31 = 1;
      }
      if (v31) {
        unint64_t v32 = 0;
      }
      else {
        unint64_t v32 = a3;
      }
      *(void *)&v158[4] = v32;
      *(_DWORD *)v158 = 4;
      uint64_t v33 = 4 * (v32 != 0);
      LODWORD(v34) = v33 * v32;
      unint64_t v35 = HIDWORD(v32);
      if (HIDWORD(v32)) {
        unint64_t v34 = v34;
      }
      else {
        unint64_t v34 = 0;
      }
      unint64_t v36 = v33 & 0x3FFFFFFFFLL | ((unint64_t)(v34 >> 2) << 34);
      *(_DWORD *)v158 = 4;
      unint64_t v37 = *(void *)v158;
      *(_DWORD *)&v158[4] = v36;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = HIDWORD(v32);
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v34;
      *(void *)v158 = v37;
      *(void *)&v158[24] = v32;
      *(void *)&long long v159 = v36;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v34;
      if (HIDWORD(v37)) {
        BOOL v38 = v37 == 0;
      }
      else {
        BOOL v38 = 1;
      }
      BOOL v39 = v38 || HIDWORD(v32) == 0;
      if (v39) {
        unint64_t v40 = 0;
      }
      else {
        unint64_t v40 = v37;
      }
      unint64_t v146 = v40;
      if (v39) {
        int v41 = 0;
      }
      else {
        int v41 = v35;
      }
      int v147 = v41;
      if ((v34 & (v34 - 1)) != 0) {
        uint64_t v42 = 1;
      }
      else {
        uint64_t v42 = v34;
      }
      uint64_t v43 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v42);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CB9FB10;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v44 = *v43;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v44;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 14:
      *(void *)v158 = &unk_26CBA1168;
      LOWORD(v148) = 0;
      sub_21B96158C(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 15:
      *(void *)v158 = &unk_26CBA11A0;
      LOWORD(v148) = 0;
      sub_21B961724(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 16:
      *(void *)v158 = &unk_26CBA11D8;
      LODWORD(v148) = 0;
      sub_21B9618BC(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 17:
      v145 = &unk_26CBA1210;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v115 = a3 == 0;
      }
      else {
        BOOL v115 = 1;
      }
      if (v115) {
        unint64_t v116 = 0;
      }
      else {
        unint64_t v116 = a3;
      }
      *(void *)&v158[4] = v116;
      *(_DWORD *)v158 = 3;
      if (v116) {
        uint64_t v117 = 3;
      }
      else {
        uint64_t v117 = 0;
      }
      LODWORD(v118) = v117 * *(_DWORD *)&v158[4];
      uint64_t v119 = HIDWORD(*(void *)&v158[4]);
      if (HIDWORD(*(void *)&v158[4])) {
        uint64_t v118 = v118;
      }
      else {
        uint64_t v118 = 0;
      }
      uint64_t v120 = v117 | (v118 << 32);
      *(_DWORD *)v158 = 3;
      unint64_t v121 = *(void *)v158;
      *(_DWORD *)&v158[4] = v120;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = v119;
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v118;
      *(void *)v158 = v121;
      *(void *)&v158[24] = v116;
      *(void *)&long long v159 = v120;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v118;
      if (HIDWORD(v121)) {
        BOOL v122 = v121 == 0;
      }
      else {
        BOOL v122 = 1;
      }
      BOOL v123 = v122 || v119 == 0;
      if (v123) {
        unint64_t v124 = 0;
      }
      else {
        unint64_t v124 = v121;
      }
      unint64_t v146 = v124;
      if (v123) {
        int v125 = 0;
      }
      else {
        int v125 = v119;
      }
      int v147 = v125;
      if ((v118 & (v118 - 1)) != 0) {
        uint64_t v126 = 1;
      }
      else {
        uint64_t v126 = v118;
      }
      v127 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v126);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CB9FD10;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v128 = *v127;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v128;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 18:
      *(void *)v158 = &unk_26CBA1248;
      LOWORD(v148) = 0;
      sub_21B961C1C(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 19:
      *(void *)v158 = &unk_26CBA1280;
      LOWORD(v148) = 0;
      sub_21B961DAC(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 20:
      *(void *)v158 = &unk_26CBA12B8;
      LODWORD(v148) = 0;
      sub_21B961F3C(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 21:
      v145 = &unk_26CBA12F0;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v129 = a3 == 0;
      }
      else {
        BOOL v129 = 1;
      }
      if (v129) {
        unint64_t v130 = 0;
      }
      else {
        unint64_t v130 = a3;
      }
      *(void *)&v158[4] = v130;
      *(_DWORD *)v158 = 3;
      if (v130) {
        uint64_t v131 = 3;
      }
      else {
        uint64_t v131 = 0;
      }
      LODWORD(v132) = v131 * *(_DWORD *)&v158[4];
      uint64_t v133 = HIDWORD(*(void *)&v158[4]);
      if (HIDWORD(*(void *)&v158[4])) {
        uint64_t v132 = v132;
      }
      else {
        uint64_t v132 = 0;
      }
      uint64_t v134 = v131 | (v132 << 32);
      *(_DWORD *)v158 = 3;
      unint64_t v135 = *(void *)v158;
      *(_DWORD *)&v158[4] = v134;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = v133;
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v132;
      *(void *)v158 = v135;
      *(void *)&v158[24] = v130;
      *(void *)&long long v159 = v134;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v132;
      if (HIDWORD(v135)) {
        BOOL v136 = v135 == 0;
      }
      else {
        BOOL v136 = 1;
      }
      BOOL v137 = v136 || v133 == 0;
      if (v137) {
        unint64_t v138 = 0;
      }
      else {
        unint64_t v138 = v135;
      }
      unint64_t v146 = v138;
      if (v137) {
        int v139 = 0;
      }
      else {
        int v139 = v133;
      }
      int v147 = v139;
      if ((v132 & (v132 - 1)) != 0) {
        uint64_t v140 = 1;
      }
      else {
        uint64_t v140 = v132;
      }
      v141 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v140);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CB9FF10;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v142 = *v141;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v142;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 22:
      *(void *)v158 = &unk_26CBA1328;
      LOWORD(v148) = 0;
      sub_21B962298(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 23:
      *(void *)v158 = &unk_26CBA1360;
      LOWORD(v148) = 0;
      sub_21B962428(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 24:
      *(void *)v158 = &unk_26CBA1398;
      LODWORD(v148) = 0;
      sub_21B9625B8(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 25:
      v145 = &unk_26CBA13D0;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v3 = a3 == 0;
      }
      else {
        BOOL v3 = 1;
      }
      if (v3) {
        unint64_t v4 = 0;
      }
      else {
        unint64_t v4 = a3;
      }
      *(void *)&v158[4] = v4;
      *(_DWORD *)v158 = 4;
      uint64_t v5 = 4 * (v4 != 0);
      LODWORD(v6) = v5 * v4;
      unint64_t v7 = HIDWORD(v4);
      if (HIDWORD(v4)) {
        unint64_t v6 = v6;
      }
      else {
        unint64_t v6 = 0;
      }
      unint64_t v8 = v5 & 0x3FFFFFFFFLL | ((unint64_t)(v6 >> 2) << 34);
      *(_DWORD *)v158 = 4;
      unint64_t v9 = *(void *)v158;
      *(_DWORD *)&v158[4] = v8;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = HIDWORD(v4);
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v6;
      *(void *)v158 = v9;
      *(void *)&v158[24] = v4;
      *(void *)&long long v159 = v8;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v6;
      if (HIDWORD(v9)) {
        BOOL v10 = v9 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      BOOL v11 = v10 || HIDWORD(v4) == 0;
      if (v11) {
        unint64_t v12 = 0;
      }
      else {
        unint64_t v12 = v9;
      }
      unint64_t v146 = v12;
      if (v11) {
        int v13 = 0;
      }
      else {
        int v13 = v7;
      }
      int v147 = v13;
      if ((v6 & (v6 - 1)) != 0) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v6;
      }
      int v15 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v14);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CBA0110;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v16 = *v15;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v16;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 26:
      *(void *)v158 = &unk_26CBA1408;
      LOWORD(v148) = 0;
      sub_21B96291C(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 27:
      *(void *)v158 = &unk_26CBA1440;
      LOWORD(v148) = 0;
      sub_21B962AB4(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 28:
      *(void *)v158 = &unk_26CBA1478;
      LODWORD(v148) = 0;
      sub_21B962C4C(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 29:
      v145 = &unk_26CBA14B0;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v17 = a3 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = a3;
      }
      *(void *)&v158[4] = v18;
      *(_DWORD *)v158 = 4;
      uint64_t v19 = 4 * (v18 != 0);
      LODWORD(v20) = v19 * v18;
      unint64_t v21 = HIDWORD(v18);
      if (HIDWORD(v18)) {
        unint64_t v20 = v20;
      }
      else {
        unint64_t v20 = 0;
      }
      unint64_t v22 = v19 & 0x3FFFFFFFFLL | ((unint64_t)(v20 >> 2) << 34);
      *(_DWORD *)v158 = 4;
      unint64_t v23 = *(void *)v158;
      *(_DWORD *)&v158[4] = v22;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = HIDWORD(v18);
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v20;
      *(void *)v158 = v23;
      *(void *)&v158[24] = v18;
      *(void *)&long long v159 = v22;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v20;
      if (HIDWORD(v23)) {
        BOOL v24 = v23 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      BOOL v25 = v24 || HIDWORD(v18) == 0;
      if (v25) {
        unint64_t v26 = 0;
      }
      else {
        unint64_t v26 = v23;
      }
      unint64_t v146 = v26;
      if (v25) {
        int v27 = 0;
      }
      else {
        int v27 = v21;
      }
      int v147 = v27;
      if ((v20 & (v20 - 1)) != 0) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = v20;
      }
      unint64_t v29 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v28);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CBA0310;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v30 = *v29;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v30;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 30:
      *(void *)v158 = &unk_26CBA14E8;
      LOWORD(v148) = 0;
      sub_21B962FB4(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 31:
      *(void *)v158 = &unk_26CBA1520;
      LOWORD(v148) = 0;
      sub_21B96314C(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 32:
      *(void *)v158 = &unk_26CBA1558;
      LODWORD(v148) = 0;
      sub_21B9632E4(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 33:
      v145 = &unk_26CBA1590;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v101 = a3 == 0;
      }
      else {
        BOOL v101 = 1;
      }
      if (v101) {
        unint64_t v102 = 0;
      }
      else {
        unint64_t v102 = a3;
      }
      *(void *)&v158[4] = v102;
      *(_DWORD *)v158 = 4;
      uint64_t v103 = 4 * (v102 != 0);
      LODWORD(v104) = v103 * v102;
      unint64_t v105 = HIDWORD(v102);
      if (HIDWORD(v102)) {
        unint64_t v104 = v104;
      }
      else {
        unint64_t v104 = 0;
      }
      unint64_t v106 = v103 & 0x3FFFFFFFFLL | ((unint64_t)(v104 >> 2) << 34);
      *(_DWORD *)v158 = 4;
      unint64_t v107 = *(void *)v158;
      *(_DWORD *)&v158[4] = v106;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = HIDWORD(v102);
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v104;
      *(void *)v158 = v107;
      *(void *)&v158[24] = v102;
      *(void *)&long long v159 = v106;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v104;
      if (HIDWORD(v107)) {
        BOOL v108 = v107 == 0;
      }
      else {
        BOOL v108 = 1;
      }
      BOOL v109 = v108 || HIDWORD(v102) == 0;
      if (v109) {
        unint64_t v110 = 0;
      }
      else {
        unint64_t v110 = v107;
      }
      unint64_t v146 = v110;
      if (v109) {
        int v111 = 0;
      }
      else {
        int v111 = v105;
      }
      int v147 = v111;
      if ((v104 & (v104 - 1)) != 0) {
        uint64_t v112 = 1;
      }
      else {
        uint64_t v112 = v104;
      }
      v113 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v112);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CBA0510;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v114 = *v113;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v114;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 34:
      *(void *)v158 = &unk_26CBA15C8;
      LOWORD(v148) = 0;
      sub_21B96364C(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 35:
      *(void *)v158 = &unk_26CBA1600;
      LOWORD(v148) = 0;
      sub_21B9637E4(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 36:
      *(void *)v158 = &unk_26CBA1638;
      LODWORD(v148) = 0;
      sub_21B96397C(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    case 37:
      v145 = &unk_26CBA1670;
      LOBYTE(v144) = 0;
      if (HIDWORD(a3)) {
        BOOL v87 = a3 == 0;
      }
      else {
        BOOL v87 = 1;
      }
      if (v87) {
        unint64_t v88 = 0;
      }
      else {
        unint64_t v88 = a3;
      }
      *(void *)&v158[4] = v88;
      *(_DWORD *)v158 = 4;
      uint64_t v89 = 4 * (v88 != 0);
      LODWORD(v90) = v89 * v88;
      unint64_t v91 = HIDWORD(v88);
      if (HIDWORD(v88)) {
        unint64_t v90 = v90;
      }
      else {
        unint64_t v90 = 0;
      }
      unint64_t v92 = v89 & 0x3FFFFFFFFLL | ((unint64_t)(v90 >> 2) << 34);
      *(_DWORD *)v158 = 4;
      unint64_t v93 = *(void *)v158;
      *(_DWORD *)&v158[4] = v92;
      *(_DWORD *)v158 = 1;
      *(_DWORD *)&v158[8] = HIDWORD(v88);
      *(void *)&v158[12] = *(void *)v158;
      *(_DWORD *)&v158[20] = v90;
      *(void *)v158 = v93;
      *(void *)&v158[24] = v88;
      *(void *)&long long v159 = v92;
      BYTE8(v159) = 0;
      BYTE4(v160) = 0;
      uint64_t v148 = *(void *)&v158[12];
      int v149 = v90;
      if (HIDWORD(v93)) {
        BOOL v94 = v93 == 0;
      }
      else {
        BOOL v94 = 1;
      }
      BOOL v95 = v94 || HIDWORD(v88) == 0;
      if (v95) {
        unint64_t v96 = 0;
      }
      else {
        unint64_t v96 = v93;
      }
      unint64_t v146 = v96;
      if (v95) {
        int v97 = 0;
      }
      else {
        int v97 = v91;
      }
      int v147 = v97;
      if ((v90 & (v90 - 1)) != 0) {
        uint64_t v98 = 1;
      }
      else {
        uint64_t v98 = v90;
      }
      v99 = sub_21B96C318((size_t *)&v161, (unsigned int *)&v146, (uint64_t)&v148, 1, &v144, 1, v98);
      *(_OWORD *)v151 = *(_OWORD *)v158;
      v150 = &unk_26CBA0710;
      *(_OWORD *)&v151[16] = *(_OWORD *)&v158[16];
      long long v152 = v159;
      size_t v100 = *v99;
      uint64_t v153 = v160;
      *(void *)&long long v154 = v100;
      *((void *)&v154 + 1) = *((void *)&v161 + 1);
      uint64_t v155 = v162;
      uint64_t v157 = v164;
      long long v156 = v163;
      operator new();
    case 38:
      *(void *)v158 = &unk_26CBA16A8;
      LOWORD(v148) = 0;
      sub_21B963CE4(&v143, (const __int16 *)&v148, (uint64_t)&v150);
      operator new();
    case 39:
      *(void *)v158 = &unk_26CBA16E0;
      LOWORD(v148) = 0;
      sub_21B963E7C(&v143, &v148, (uint64_t)&v150);
      operator new();
    case 40:
      *(void *)v158 = &unk_26CBA1718;
      LODWORD(v148) = 0;
      sub_21B964014(&v143, (const float *)&v148, (uint64_t)&v150);
      operator new();
    default:
      sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/include/Kit/Image/FormatAlgorithm.h", 523, (uint64_t)&unk_21B997215, 0, (uint64_t)"Runtime format not in given Formats list", 40, (void (*)(void **))sub_21B984AC4);
      abort();
  }
}

void sub_21B968B10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26,void *a27,uint64_t a28,int a29,int a30,int a31,int a32,int a33,int a34)
{
  if (a27)
  {
    free(a27);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B9692C4(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  unint64_t v136 = a3;
  switch(a2)
  {
    case 1:
      *(void *)v150 = &unk_26CBA0F00;
      sub_21B96004C(&v136, (uint64_t)&v142);
      operator new();
    case 2:
      *(void *)v150 = &unk_26CBA0F38;
      sub_21B96043C(&v136, (uint64_t)&v142);
      operator new();
    case 3:
      if (HIDWORD(a3)) {
        BOOL v87 = a3 == 0;
      }
      else {
        BOOL v87 = 1;
      }
      if (v87) {
        unint64_t v88 = 0;
      }
      else {
        unint64_t v88 = a3;
      }
      unint64_t v89 = v88 << 32;
      if (!HIDWORD(v88)) {
        unint64_t v89 = 0;
      }
      BOOL v90 = v88 != 0;
      if (v88) {
        BOOL v91 = HIDWORD(v88) == 0;
      }
      else {
        BOOL v91 = 1;
      }
      *(void *)v150 = v88;
      *(void *)&v150[8] = v89 | v90;
      v150[16] = 0;
      v150[24] = 0;
      uint64_t v140 = (void *)(v89 | v90);
      if (v91) {
        unint64_t v88 = 0;
      }
      BOOL v137 = &unk_26CBA0F70;
      unint64_t v138 = v88;
      if (((v89 >> 31) & ((v89 >> 31) - 1)) != 0) {
        uint64_t v92 = 2;
      }
      else {
        uint64_t v92 = v89 >> 31;
      }
      unint64_t v93 = sub_21B96BD7C((unint64_t *)&v151, &v138, (unint64_t *)&v140, 1, 0, 0, v92);
      size_t v142 = &unk_26CB9F710;
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      *(_OWORD *)&v143[12] = *(_OWORD *)&v150[12];
      *(void *)&long long v144 = *v93;
      *((void *)&v144 + 1) = *((void *)&v151 + 1);
      uint64_t v145 = v152;
      long long v146 = v153;
      operator new();
    case 4:
      *(void *)v150 = &unk_26CB9CEC0;
      sub_21B960570(&v136, (uint64_t)&v142);
      operator new();
    case 5:
      *(void *)v150 = &unk_26CBA0FA8;
      sub_21B9606A8(&v136, (uint64_t)&v142);
      operator new();
    case 6:
      uint64_t v140 = &unk_26CBA0FE0;
      sub_21B972418((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9F810;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 7:
      BOOL v137 = &unk_26CBA1018;
      if (HIDWORD(a3)) {
        BOOL v31 = a3 == 0;
      }
      else {
        BOOL v31 = 1;
      }
      if (v31) {
        unint64_t v32 = 0;
      }
      else {
        unint64_t v32 = a3;
      }
      *(void *)&v150[4] = v32;
      *(_DWORD *)v150 = 2;
      uint64_t v33 = 2 * (v32 != 0);
      LODWORD(v34) = v33 * v32;
      unint64_t v35 = HIDWORD(v32);
      if (HIDWORD(v32)) {
        unint64_t v34 = v34;
      }
      else {
        unint64_t v34 = 0;
      }
      unint64_t v36 = v33 & 0x1FFFFFFFFLL | ((unint64_t)(v34 >> 1) << 33);
      *(_DWORD *)v150 = 2;
      *(void *)&v150[4] = v32;
      unint64_t v37 = *(void *)v150;
      *(_DWORD *)&v150[4] = v36;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v34;
      *(void *)v150 = v37;
      *(void *)&v150[24] = v32;
      *(void *)&long long v151 = v36;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v34;
      if (HIDWORD(v37)) {
        BOOL v38 = v37 == 0;
      }
      else {
        BOOL v38 = 1;
      }
      BOOL v39 = v38 || HIDWORD(v32) == 0;
      if (v39) {
        unint64_t v40 = 0;
      }
      else {
        unint64_t v40 = v37;
      }
      unint64_t v138 = v40;
      if (v39) {
        int v41 = 0;
      }
      else {
        int v41 = v35;
      }
      int v139 = v41;
      if (((2 * v34) & (2 * v34 - 1)) != 0) {
        uint64_t v42 = 2;
      }
      else {
        uint64_t v42 = 2 * v34;
      }
      uint64_t v43 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v42);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9F890;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v44 = *v43;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v44;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 8:
      uint64_t v140 = &unk_26CB9E520;
      sub_21B9725D8((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9E380;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 9:
      *(void *)v150 = &unk_26CBA1050;
      sub_21B960D3C(&v136, (uint64_t)&v142);
      operator new();
    case 10:
      uint64_t v140 = &unk_26CBA1088;
      sub_21B97279C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9F990;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 11:
      BOOL v137 = &unk_26CBA10C0;
      if (HIDWORD(a3)) {
        BOOL v94 = a3 == 0;
      }
      else {
        BOOL v94 = 1;
      }
      if (v94) {
        unint64_t v95 = 0;
      }
      else {
        unint64_t v95 = a3;
      }
      *(void *)&v150[4] = v95;
      *(_DWORD *)v150 = 3;
      if (v95) {
        uint64_t v96 = 3;
      }
      else {
        uint64_t v96 = 0;
      }
      LODWORD(v97) = v96 * v95;
      unint64_t v98 = HIDWORD(v95);
      if (HIDWORD(v95)) {
        uint64_t v97 = v97;
      }
      else {
        uint64_t v97 = 0;
      }
      uint64_t v99 = v96 | (v97 << 32);
      *(_DWORD *)v150 = 3;
      *(void *)&v150[4] = v95;
      unint64_t v100 = *(void *)v150;
      *(_DWORD *)&v150[4] = v99;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v97;
      *(void *)v150 = v100;
      *(void *)&v150[24] = v95;
      *(void *)&long long v151 = v99;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v97;
      if (HIDWORD(v100)) {
        BOOL v101 = v100 == 0;
      }
      else {
        BOOL v101 = 1;
      }
      BOOL v102 = v101 || HIDWORD(v95) == 0;
      if (v102) {
        unint64_t v103 = 0;
      }
      else {
        unint64_t v103 = v100;
      }
      unint64_t v138 = v103;
      if (v102) {
        int v104 = 0;
      }
      else {
        int v104 = v98;
      }
      int v139 = v104;
      if (((2 * v97) & (2 * v97 - 1)) != 0) {
        uint64_t v105 = 2;
      }
      else {
        uint64_t v105 = 2 * v97;
      }
      unint64_t v106 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v105);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FA10;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v107 = *v106;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v107;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 12:
      uint64_t v140 = &unk_26CBA10F8;
      sub_21B972954((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FA90;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 13:
      *(void *)v150 = &unk_26CBA1130;
      sub_21B9613B8(&v136, (uint64_t)&v142);
      operator new();
    case 14:
      uint64_t v140 = &unk_26CBA1168;
      sub_21B972B0C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FB90;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 15:
      BOOL v137 = &unk_26CBA11A0;
      if (HIDWORD(a3)) {
        BOOL v108 = a3 == 0;
      }
      else {
        BOOL v108 = 1;
      }
      if (v108) {
        unint64_t v109 = 0;
      }
      else {
        unint64_t v109 = a3;
      }
      *(void *)&v150[4] = v109;
      *(_DWORD *)v150 = 4;
      uint64_t v110 = 4 * (v109 != 0);
      LODWORD(v111) = v110 * v109;
      unint64_t v112 = HIDWORD(v109);
      if (HIDWORD(v109)) {
        unint64_t v111 = v111;
      }
      else {
        unint64_t v111 = 0;
      }
      unint64_t v113 = v110 & 0x3FFFFFFFFLL | ((unint64_t)(v111 >> 2) << 34);
      *(_DWORD *)v150 = 4;
      *(void *)&v150[4] = v109;
      unint64_t v114 = *(void *)v150;
      *(_DWORD *)&v150[4] = v113;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v111;
      *(void *)v150 = v114;
      *(void *)&v150[24] = v109;
      *(void *)&long long v151 = v113;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v111;
      if (HIDWORD(v114)) {
        BOOL v115 = v114 == 0;
      }
      else {
        BOOL v115 = 1;
      }
      BOOL v116 = v115 || HIDWORD(v109) == 0;
      if (v116) {
        unint64_t v117 = 0;
      }
      else {
        unint64_t v117 = v114;
      }
      unint64_t v138 = v117;
      if (v116) {
        int v118 = 0;
      }
      else {
        int v118 = v112;
      }
      int v139 = v118;
      if (((2 * v111) & (2 * v111 - 1)) != 0) {
        uint64_t v119 = 2;
      }
      else {
        uint64_t v119 = 2 * v111;
      }
      uint64_t v120 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v119);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FC10;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v121 = *v120;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v121;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 16:
      uint64_t v140 = &unk_26CBA11D8;
      sub_21B972CCC((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FC90;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 17:
      *(void *)v150 = &unk_26CBA1210;
      sub_21B961A50(&v136, (uint64_t)&v142);
      operator new();
    case 18:
      uint64_t v140 = &unk_26CBA1248;
      sub_21B97279C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FD90;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 19:
      BOOL v137 = &unk_26CBA1280;
      if (HIDWORD(a3)) {
        BOOL v17 = a3 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = a3;
      }
      *(void *)&v150[4] = v18;
      *(_DWORD *)v150 = 3;
      if (v18) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 0;
      }
      LODWORD(v20) = v19 * v18;
      unint64_t v21 = HIDWORD(v18);
      if (HIDWORD(v18)) {
        uint64_t v20 = v20;
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v22 = v19 | (v20 << 32);
      *(_DWORD *)v150 = 3;
      *(void *)&v150[4] = v18;
      unint64_t v23 = *(void *)v150;
      *(_DWORD *)&v150[4] = v22;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v20;
      *(void *)v150 = v23;
      *(void *)&v150[24] = v18;
      *(void *)&long long v151 = v22;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v20;
      if (HIDWORD(v23)) {
        BOOL v24 = v23 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      BOOL v25 = v24 || HIDWORD(v18) == 0;
      if (v25) {
        unint64_t v26 = 0;
      }
      else {
        unint64_t v26 = v23;
      }
      unint64_t v138 = v26;
      if (v25) {
        int v27 = 0;
      }
      else {
        int v27 = v21;
      }
      int v139 = v27;
      if (((2 * v20) & (2 * v20 - 1)) != 0) {
        uint64_t v28 = 2;
      }
      else {
        uint64_t v28 = 2 * v20;
      }
      unint64_t v29 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v28);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FE10;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v30 = *v29;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v30;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 20:
      uint64_t v140 = &unk_26CBA12B8;
      sub_21B972954((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FE90;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 21:
      *(void *)v150 = &unk_26CBA12F0;
      sub_21B9620CC(&v136, (uint64_t)&v142);
      operator new();
    case 22:
      uint64_t v140 = &unk_26CBA1328;
      sub_21B97279C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CB9FF90;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 23:
      BOOL v137 = &unk_26CBA1360;
      if (HIDWORD(a3)) {
        BOOL v122 = a3 == 0;
      }
      else {
        BOOL v122 = 1;
      }
      if (v122) {
        unint64_t v123 = 0;
      }
      else {
        unint64_t v123 = a3;
      }
      *(void *)&v150[4] = v123;
      *(_DWORD *)v150 = 3;
      if (v123) {
        uint64_t v124 = 3;
      }
      else {
        uint64_t v124 = 0;
      }
      LODWORD(v125) = v124 * v123;
      unint64_t v126 = HIDWORD(v123);
      if (HIDWORD(v123)) {
        uint64_t v125 = v125;
      }
      else {
        uint64_t v125 = 0;
      }
      uint64_t v127 = v124 | (v125 << 32);
      *(_DWORD *)v150 = 3;
      *(void *)&v150[4] = v123;
      unint64_t v128 = *(void *)v150;
      *(_DWORD *)&v150[4] = v127;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v125;
      *(void *)v150 = v128;
      *(void *)&v150[24] = v123;
      *(void *)&long long v151 = v127;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v125;
      if (HIDWORD(v128)) {
        BOOL v129 = v128 == 0;
      }
      else {
        BOOL v129 = 1;
      }
      BOOL v130 = v129 || HIDWORD(v123) == 0;
      if (v130) {
        unint64_t v131 = 0;
      }
      else {
        unint64_t v131 = v128;
      }
      unint64_t v138 = v131;
      if (v130) {
        int v132 = 0;
      }
      else {
        int v132 = v126;
      }
      int v139 = v132;
      if (((2 * v125) & (2 * v125 - 1)) != 0) {
        uint64_t v133 = 2;
      }
      else {
        uint64_t v133 = 2 * v125;
      }
      uint64_t v134 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v133);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0010;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v135 = *v134;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v135;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 24:
      uint64_t v140 = &unk_26CBA1398;
      sub_21B972954((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0090;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 25:
      *(void *)v150 = &unk_26CBA13D0;
      sub_21B962748(&v136, (uint64_t)&v142);
      operator new();
    case 26:
      uint64_t v140 = &unk_26CBA1408;
      sub_21B972B0C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0190;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 27:
      BOOL v137 = &unk_26CBA1440;
      if (HIDWORD(a3)) {
        BOOL v3 = a3 == 0;
      }
      else {
        BOOL v3 = 1;
      }
      if (v3) {
        unint64_t v4 = 0;
      }
      else {
        unint64_t v4 = a3;
      }
      *(void *)&v150[4] = v4;
      *(_DWORD *)v150 = 4;
      uint64_t v5 = 4 * (v4 != 0);
      LODWORD(v6) = v5 * v4;
      unint64_t v7 = HIDWORD(v4);
      if (HIDWORD(v4)) {
        unint64_t v6 = v6;
      }
      else {
        unint64_t v6 = 0;
      }
      unint64_t v8 = v5 & 0x3FFFFFFFFLL | ((unint64_t)(v6 >> 2) << 34);
      *(_DWORD *)v150 = 4;
      *(void *)&v150[4] = v4;
      unint64_t v9 = *(void *)v150;
      *(_DWORD *)&v150[4] = v8;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v6;
      *(void *)v150 = v9;
      *(void *)&v150[24] = v4;
      *(void *)&long long v151 = v8;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v6;
      if (HIDWORD(v9)) {
        BOOL v10 = v9 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      BOOL v11 = v10 || HIDWORD(v4) == 0;
      if (v11) {
        unint64_t v12 = 0;
      }
      else {
        unint64_t v12 = v9;
      }
      unint64_t v138 = v12;
      if (v11) {
        int v13 = 0;
      }
      else {
        int v13 = v7;
      }
      int v139 = v13;
      if (((2 * v6) & (2 * v6 - 1)) != 0) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 2 * v6;
      }
      int v15 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v14);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0210;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v16 = *v15;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v16;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 28:
      uint64_t v140 = &unk_26CBA1478;
      sub_21B972CCC((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0290;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 29:
      *(void *)v150 = &unk_26CBA14B0;
      sub_21B962DE0(&v136, (uint64_t)&v142);
      operator new();
    case 30:
      uint64_t v140 = &unk_26CBA14E8;
      sub_21B972B0C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0390;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 31:
      BOOL v137 = &unk_26CBA1520;
      if (HIDWORD(a3)) {
        BOOL v59 = a3 == 0;
      }
      else {
        BOOL v59 = 1;
      }
      if (v59) {
        unint64_t v60 = 0;
      }
      else {
        unint64_t v60 = a3;
      }
      *(void *)&v150[4] = v60;
      *(_DWORD *)v150 = 4;
      uint64_t v61 = 4 * (v60 != 0);
      LODWORD(v62) = v61 * v60;
      unint64_t v63 = HIDWORD(v60);
      if (HIDWORD(v60)) {
        unint64_t v62 = v62;
      }
      else {
        unint64_t v62 = 0;
      }
      unint64_t v64 = v61 & 0x3FFFFFFFFLL | ((unint64_t)(v62 >> 2) << 34);
      *(_DWORD *)v150 = 4;
      *(void *)&v150[4] = v60;
      unint64_t v65 = *(void *)v150;
      *(_DWORD *)&v150[4] = v64;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v62;
      *(void *)v150 = v65;
      *(void *)&v150[24] = v60;
      *(void *)&long long v151 = v64;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v62;
      if (HIDWORD(v65)) {
        BOOL v66 = v65 == 0;
      }
      else {
        BOOL v66 = 1;
      }
      BOOL v67 = v66 || HIDWORD(v60) == 0;
      if (v67) {
        unint64_t v68 = 0;
      }
      else {
        unint64_t v68 = v65;
      }
      unint64_t v138 = v68;
      if (v67) {
        int v69 = 0;
      }
      else {
        int v69 = v63;
      }
      int v139 = v69;
      if (((2 * v62) & (2 * v62 - 1)) != 0) {
        uint64_t v70 = 2;
      }
      else {
        uint64_t v70 = 2 * v62;
      }
      unint64_t v71 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v70);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0410;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v72 = *v71;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v72;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 32:
      uint64_t v140 = &unk_26CBA1558;
      sub_21B972CCC((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0490;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 33:
      *(void *)v150 = &unk_26CBA1590;
      sub_21B963478(&v136, (uint64_t)&v142);
      operator new();
    case 34:
      uint64_t v140 = &unk_26CBA15C8;
      sub_21B972B0C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0590;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 35:
      BOOL v137 = &unk_26CBA1600;
      if (HIDWORD(a3)) {
        BOOL v73 = a3 == 0;
      }
      else {
        BOOL v73 = 1;
      }
      if (v73) {
        unint64_t v74 = 0;
      }
      else {
        unint64_t v74 = a3;
      }
      *(void *)&v150[4] = v74;
      *(_DWORD *)v150 = 4;
      uint64_t v75 = 4 * (v74 != 0);
      LODWORD(v76) = v75 * v74;
      unint64_t v77 = HIDWORD(v74);
      if (HIDWORD(v74)) {
        unint64_t v76 = v76;
      }
      else {
        unint64_t v76 = 0;
      }
      unint64_t v78 = v75 & 0x3FFFFFFFFLL | ((unint64_t)(v76 >> 2) << 34);
      *(_DWORD *)v150 = 4;
      *(void *)&v150[4] = v74;
      unint64_t v79 = *(void *)v150;
      *(_DWORD *)&v150[4] = v78;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v76;
      *(void *)v150 = v79;
      *(void *)&v150[24] = v74;
      *(void *)&long long v151 = v78;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v76;
      if (HIDWORD(v79)) {
        BOOL v80 = v79 == 0;
      }
      else {
        BOOL v80 = 1;
      }
      BOOL v81 = v80 || HIDWORD(v74) == 0;
      if (v81) {
        unint64_t v82 = 0;
      }
      else {
        unint64_t v82 = v79;
      }
      unint64_t v138 = v82;
      if (v81) {
        int v83 = 0;
      }
      else {
        int v83 = v77;
      }
      int v139 = v83;
      if (((2 * v76) & (2 * v76 - 1)) != 0) {
        uint64_t v84 = 2;
      }
      else {
        uint64_t v84 = 2 * v76;
      }
      uint64_t v85 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v84);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0610;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v86 = *v85;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v86;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 36:
      uint64_t v140 = &unk_26CBA1638;
      sub_21B972CCC((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0690;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 37:
      *(void *)v150 = &unk_26CBA1670;
      sub_21B963B10(&v136, (uint64_t)&v142);
      operator new();
    case 38:
      uint64_t v140 = &unk_26CBA16A8;
      sub_21B972B0C((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0790;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 39:
      BOOL v137 = &unk_26CBA16E0;
      if (HIDWORD(a3)) {
        BOOL v45 = a3 == 0;
      }
      else {
        BOOL v45 = 1;
      }
      if (v45) {
        unint64_t v46 = 0;
      }
      else {
        unint64_t v46 = a3;
      }
      *(void *)&v150[4] = v46;
      *(_DWORD *)v150 = 4;
      uint64_t v47 = 4 * (v46 != 0);
      LODWORD(v48) = v47 * v46;
      unint64_t v49 = HIDWORD(v46);
      if (HIDWORD(v46)) {
        unint64_t v48 = v48;
      }
      else {
        unint64_t v48 = 0;
      }
      unint64_t v50 = v47 & 0x3FFFFFFFFLL | ((unint64_t)(v48 >> 2) << 34);
      *(_DWORD *)v150 = 4;
      *(void *)&v150[4] = v46;
      unint64_t v51 = *(void *)v150;
      *(_DWORD *)&v150[4] = v50;
      *(_DWORD *)v150 = 1;
      *(void *)&v150[12] = *(void *)v150;
      *(_DWORD *)&v150[20] = v48;
      *(void *)v150 = v51;
      *(void *)&v150[24] = v46;
      *(void *)&long long v151 = v50;
      BYTE8(v151) = 0;
      BYTE4(v152) = 0;
      uint64_t v140 = *(void **)&v150[12];
      int v141 = v48;
      if (HIDWORD(v51)) {
        BOOL v52 = v51 == 0;
      }
      else {
        BOOL v52 = 1;
      }
      BOOL v53 = v52 || HIDWORD(v46) == 0;
      if (v53) {
        unint64_t v54 = 0;
      }
      else {
        unint64_t v54 = v51;
      }
      unint64_t v138 = v54;
      if (v53) {
        int v55 = 0;
      }
      else {
        int v55 = v49;
      }
      int v139 = v55;
      if (((2 * v48) & (2 * v48 - 1)) != 0) {
        uint64_t v56 = 2;
      }
      else {
        uint64_t v56 = 2 * v48;
      }
      uint64_t v57 = (uint64_t *)sub_21B96CEEC((uint64_t)&v153, (unsigned int *)&v138, (uint64_t *)&v140, 1, 0, 0, v56);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0810;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v58 = *v57;
      uint64_t v145 = v152;
      *(void *)&long long v146 = v58;
      *((void *)&v146 + 1) = *((void *)&v153 + 1);
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    case 40:
      uint64_t v140 = &unk_26CBA1718;
      sub_21B972CCC((uint64_t)v150, &v136);
      *(_OWORD *)unint64_t v143 = *(_OWORD *)v150;
      size_t v142 = &unk_26CBA0890;
      *(_OWORD *)&v143[16] = *(_OWORD *)&v150[16];
      long long v144 = v151;
      uint64_t v145 = v152;
      long long v146 = v153;
      uint64_t v147 = v154;
      uint64_t v149 = v156;
      long long v148 = v155;
      operator new();
    default:
      sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/include/Kit/Image/FormatAlgorithm.h", 523, (uint64_t)&unk_21B997215, 0, (uint64_t)"Runtime format not in given Formats list", 40, (void (*)(void **))sub_21B984AC4);
      abort();
  }
}

void sub_21B96B5C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,void *a25,uint64_t a26,int a27,int a28,int a29,int a30,int a31,int a32)
{
  if (a25)
  {
    free(a25);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

unint64_t *sub_21B96BD7C(unint64_t *a1, _DWORD *a2, unint64_t *a3, char a4, _WORD *a5, char a6, uint64_t a7)
{
  if (a4)
  {
    unint64_t v11 = *a3;
    int v12 = a2[1];
  }
  else
  {
    LODWORD(v13) = *a2;
    int v12 = a2[1];
    if (v12) {
      uint64_t v13 = v13;
    }
    else {
      uint64_t v13 = 0;
    }
    unint64_t v11 = (*a2 != 0) | (unint64_t)(v13 << 32);
  }
  unsigned int v14 = v12 * HIDWORD(v11);
  unint64_t v15 = 2 * v14;
  unint64_t v16 = (a7 - 1) | ((unint64_t)(a7 - 1) >> 1) | (((a7 - 1) | ((unint64_t)(a7 - 1) >> 1)) >> 2);
  unint64_t v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
  unint64_t v18 = v17 | (v17 >> 16) | ((v17 | (v17 >> 16)) >> 32);
  if (v18 + 1 > 8) {
    size_t v19 = v18 + 1;
  }
  else {
    size_t v19 = 8;
  }
  *a1 = v15;
  a1[1] = 0;
  a1[2] = v19;
  if (v14)
  {
    memptr = 0;
    int v20 = malloc_type_posix_memalign(&memptr, v19, 2 * v14, 0x1F88E90uLL);
    if (v20) {
      sub_21B97D9E4(v20, a1[2], v15);
    }
    unint64_t v21 = memptr;
    a1[1] = (unint64_t)memptr;
    unint64_t v22 = *(void *)a2;
    a1[3] = *(void *)a2;
    a1[4] = (2 * v11) & 0xFFFFFFFEFFFFFFFELL;
    if (v21)
    {
      if (v22) {
        BOOL v23 = HIDWORD(v22) == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (v23) {
        unint64_t v24 = 0;
      }
      else {
        unint64_t v24 = v22;
      }
      unsigned int v25 = HIDWORD(v24) * ((v11 >> 31) >> 1);
      if (a6)
      {
        if (v25 == -1
          && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
        {
          abort();
        }
        if (v24 && HIDWORD(v24))
        {
          int v26 = v24 - 1;
          int v27 = HIDWORD(v24) - 1;
          if (HIDWORD(v24) != 1)
          {
            uint64_t v28 = HIDWORD(v11) & 0x7FFFFFFF;
            if (v24 == 1)
            {
              do
              {
                *unint64_t v21 = *a5;
                v21 += v28;
                --v27;
              }
              while (v27);
            }
            else
            {
              int v29 = 0;
              uint64_t v30 = 2 * v28;
              do
              {
                BOOL v31 = v21;
                int v32 = v24 - 1;
                do
                {
                  *BOOL v31 = *a5;
                  v31 += v11 & 0x7FFFFFFF;
                  --v32;
                }
                while (v32);
                *BOOL v31 = *a5;
                unint64_t v21 = (_WORD *)((char *)v21 + v30);
                ++v29;
              }
              while (v29 != v27);
            }
          }
          if (v24 != 1)
          {
            do
            {
              *unint64_t v21 = *a5;
              v21 += v11 & 0x7FFFFFFF;
              --v26;
            }
            while (v26);
          }
          *unint64_t v21 = *a5;
        }
      }
      else
      {
        if (v25 == -1
          && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
        {
          abort();
        }
        if (v24 && HIDWORD(v24))
        {
          int v33 = v24 - 1;
          int v34 = HIDWORD(v24) - 1;
          if (HIDWORD(v24) != 1)
          {
            uint64_t v35 = HIDWORD(v11) & 0x7FFFFFFF;
            if (v24 == 1)
            {
              do
              {
                *unint64_t v21 = 0;
                v21 += v35;
                --v34;
              }
              while (v34);
            }
            else
            {
              int v36 = 0;
              uint64_t v37 = 2 * v35;
              do
              {
                BOOL v38 = v21;
                int v39 = v24 - 1;
                do
                {
                  _WORD *v38 = 0;
                  v38 += v11 & 0x7FFFFFFF;
                  --v39;
                }
                while (v39);
                _WORD *v38 = 0;
                unint64_t v21 = (_WORD *)((char *)v21 + v37);
                ++v36;
              }
              while (v36 != v34);
            }
          }
          if (v24 != 1)
          {
            do
            {
              *unint64_t v21 = 0;
              v21 += v11 & 0x7FFFFFFF;
              --v33;
            }
            while (v33);
          }
          *unint64_t v21 = 0;
        }
      }
    }
  }
  else
  {
    a1[3] = *(void *)a2;
    a1[4] = (2 * v11) & 0xFFFFFFFEFFFFFFFELL;
  }
  return a1;
}

void sub_21B96C084(_Unwind_Exception *a1)
{
  sub_21B964900(v1);
  _Unwind_Resume(a1);
}

void sub_21B96C098(_Unwind_Exception *a1)
{
  sub_21B964900(v1);
  _Unwind_Resume(a1);
}

unint64_t *sub_21B96C0AC(unint64_t *a1, _DWORD *a2, unint64_t *a3, char a4, _DWORD *a5, char a6, uint64_t a7)
{
  if (a4)
  {
    unint64_t v11 = *a3;
    int v12 = a2[1];
  }
  else
  {
    LODWORD(v13) = *a2;
    int v12 = a2[1];
    if (v12) {
      uint64_t v13 = v13;
    }
    else {
      uint64_t v13 = 0;
    }
    unint64_t v11 = (*a2 != 0) | (unint64_t)(v13 << 32);
  }
  unsigned int v14 = v12 * HIDWORD(v11);
  unint64_t v15 = 4 * v14;
  unint64_t v16 = (a7 - 1) | ((unint64_t)(a7 - 1) >> 1) | (((a7 - 1) | ((unint64_t)(a7 - 1) >> 1)) >> 2);
  unint64_t v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
  unint64_t v18 = v17 | (v17 >> 16) | ((v17 | (v17 >> 16)) >> 32);
  if (v18 + 1 > 8) {
    size_t v19 = v18 + 1;
  }
  else {
    size_t v19 = 8;
  }
  *a1 = v15;
  a1[1] = 0;
  a1[2] = v19;
  if (v14)
  {
    memptr[0] = 0;
    int v20 = malloc_type_posix_memalign(memptr, v19, 4 * v14, 0x1F88E90uLL);
    if (v20) {
      sub_21B97D9E4(v20, a1[2], v15);
    }
    unint64_t v21 = memptr[0];
    a1[1] = (unint64_t)memptr[0];
    unint64_t v22 = *(void *)a2;
    a1[3] = *(void *)a2;
    a1[4] = (4 * v11) & 0xFFFFFFFCFFFFFFFCLL;
    if (v21 && a6)
    {
      if (v22) {
        BOOL v23 = HIDWORD(v22) == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (v23) {
        unint64_t v24 = 0;
      }
      else {
        unint64_t v24 = (void *)v22;
      }
      memptr[0] = v21;
      memptr[1] = v24;
      memptr[2] = (void *)(v11 & 0x3FFFFFFF3FFFFFFFLL);
      if (HIDWORD(v24) * ((v11 >> 30) >> 2) == -1
        && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
      {
        abort();
      }
      v36[0] = memptr;
      v36[1] = a5;
      uint64_t v25 = v11 & 0x3FFFFFFF;
      if (v25 == 1)
      {
        sub_21B897634((uint64_t)v36);
        return a1;
      }
      if (v24 && HIDWORD(v24))
      {
        int v26 = v24 - 1;
        int v27 = HIDWORD(v24) - 1;
        if (HIDWORD(v24) != 1)
        {
          uint64_t v28 = HIDWORD(v11) & 0x3FFFFFFF;
          if (v24 == 1)
          {
            do
            {
              *unint64_t v21 = *a5;
              v21 += v28;
              --v27;
            }
            while (v27);
LABEL_39:
            *unint64_t v21 = *a5;
            return a1;
          }
          int v29 = 0;
          uint64_t v30 = 4 * v28;
          do
          {
            BOOL v31 = v21;
            int v32 = v24 - 1;
            do
            {
              *BOOL v31 = *a5;
              v31 += v25;
              --v32;
            }
            while (v32);
            *BOOL v31 = *a5;
            unint64_t v21 = (_DWORD *)((char *)v21 + v30);
            ++v29;
          }
          while (v29 != v27);
        }
        if (v24 != 1)
        {
          uint64_t v33 = 4 * v25;
          do
          {
            *unint64_t v21 = *a5;
            unint64_t v21 = (_DWORD *)((char *)v21 + v33);
            --v26;
          }
          while (v26);
        }
        goto LABEL_39;
      }
    }
  }
  else
  {
    a1[3] = *(void *)a2;
    a1[4] = (4 * v11) & 0xFFFFFFFCFFFFFFFCLL;
  }
  return a1;
}

void sub_21B96C2FC(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)(v1 + 8);
  if (v3) {
    free(v3);
  }
  *(void *)(v1 + 8) = 0;
  _Unwind_Resume(exception_object);
}

size_t *sub_21B96C318(size_t *a1, unsigned int *a2, uint64_t a3, char a4, unsigned char *a5, char a6, uint64_t a7)
{
  BOOL v10 = a1;
  if (a4)
  {
    size_t v11 = *(void *)a3;
    unsigned int v12 = *(_DWORD *)(a3 + 8);
    unsigned int v13 = a2[2];
  }
  else
  {
    unsigned int v14 = *a2;
    unsigned int v15 = a2[1];
    if (v15) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = 0;
    }
    int v17 = v15 * v14;
    unsigned int v13 = a2[2];
    if (v13) {
      unsigned int v12 = v17;
    }
    else {
      unsigned int v12 = 0;
    }
    size_t v11 = (*a2 != 0) | (unint64_t)(v16 << 32);
  }
  size_t v18 = v12 * v13;
  unint64_t v19 = (a7 - 1) | ((unint64_t)(a7 - 1) >> 1) | (((a7 - 1) | ((unint64_t)(a7 - 1) >> 1)) >> 2);
  unint64_t v20 = v19 | (v19 >> 4) | ((v19 | (v19 >> 4)) >> 8);
  unint64_t v21 = v20 | (v20 >> 16) | ((v20 | (v20 >> 16)) >> 32);
  if (v21 + 1 > 8) {
    size_t v22 = v21 + 1;
  }
  else {
    size_t v22 = 8;
  }
  *a1 = v18;
  a1[1] = 0;
  a1[2] = v22;
  if (v18)
  {
    memptr = 0;
    int v23 = malloc_type_posix_memalign(&memptr, v22, v18, 0x1F88E90uLL);
    if (v23) {
      sub_21B97D9E4(v23, v10[2], v18);
    }
    unint64_t v24 = memptr;
    v10[1] = (size_t)memptr;
  }
  else
  {
    unint64_t v24 = 0;
  }
  size_t v25 = *(void *)a2;
  *((_DWORD *)v10 + 8) = a2[2];
  v10[3] = v25;
  *(size_t *)((char *)v10 + 36) = v11;
  *((_DWORD *)v10 + 11) = v12;
  if (v24 && a6)
  {
    if (*((_DWORD *)v10 + 6)) {
      BOOL v26 = *((_DWORD *)v10 + 7) == 0;
    }
    else {
      BOOL v26 = 1;
    }
    BOOL v27 = v26 || *((_DWORD *)v10 + 8) == 0;
    char v28 = v27;
    if (v27) {
      size_t v29 = 0;
    }
    else {
      size_t v29 = v10[3];
    }
    if (v27) {
      int v30 = 0;
    }
    else {
      int v30 = *((_DWORD *)v10 + 8);
    }
    if (v30 * v12 == -1
      && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
    if (v11 == 1)
    {
      size_t v31 = HIDWORD(v11);
      if (v29 * v11 == HIDWORD(v11))
      {
        size_t v32 = (HIDWORD(v29) * v29);
        if (v12 == HIDWORD(v29) * HIDWORD(v11))
        {
          memset(v24, *a5, (v32 * v30));
          return v10;
        }
        if (v29) {
          BOOL v56 = HIDWORD(v29) == 0;
        }
        else {
          BOOL v56 = 1;
        }
        if (v56) {
          char v57 = 1;
        }
        else {
          char v57 = v28;
        }
        if ((v57 & 1) == 0)
        {
          for (int i = v30 - 1; i; --i)
          {
            memset(v24, *a5, (HIDWORD(v29) * v29));
            v24 += v12;
          }
LABEL_93:
          memset(v24, *a5, v32);
        }
      }
      else
      {
        size_t v47 = HIDWORD(v29);
        if (v29) {
          BOOL v48 = HIDWORD(v29) == 0;
        }
        else {
          BOOL v48 = 1;
        }
        if (v48) {
          char v49 = 1;
        }
        else {
          char v49 = v28;
        }
        if ((v49 & 1) == 0)
        {
          size_t v32 = v29;
          int v50 = HIDWORD(v29) - 1;
          int v51 = v30 - 1;
          BOOL v66 = v10;
          if (v30 != 1)
          {
            uint64_t v52 = v12;
            if (v47 == 1)
            {
              do
              {
                memset(v24, *a5, v32);
                v24 += v12;
                --v51;
              }
              while (v51);
            }
            else
            {
              int v53 = 0;
              do
              {
                int v54 = HIDWORD(v29) - 1;
                int v55 = v24;
                do
                {
                  memset(v55, *a5, v32);
                  v55 += v31;
                  --v54;
                }
                while (v54);
                memset(v55, *a5, v32);
                v24 += v52;
                ++v53;
              }
              while (v53 != v51);
            }
          }
          if (HIDWORD(v29) == 1)
          {
            BOOL v10 = v66;
          }
          else
          {
            BOOL v10 = v66;
            do
            {
              memset(v24, *a5, v32);
              v24 += v31;
              --v50;
            }
            while (v50);
          }
          goto LABEL_93;
        }
      }
    }
    else
    {
      if (HIDWORD(v29)) {
        BOOL v33 = v29 == 0;
      }
      else {
        BOOL v33 = 1;
      }
      if (v33) {
        char v34 = 1;
      }
      else {
        char v34 = v28;
      }
      if ((v34 & 1) == 0 && v29)
      {
        int v35 = v29 - 1;
        int v36 = HIDWORD(v29) - 1;
        size_t v37 = HIDWORD(v11);
        int v38 = v30 - 1;
        if (v30 != 1)
        {
          if (HIDWORD(v29) == 1)
          {
            if (v29 == 1)
            {
              do
              {
                *unint64_t v24 = *a5;
                v24 += v12;
                --v38;
              }
              while (v38);
            }
            else
            {
              int v59 = 0;
              do
              {
                int v60 = v29 - 1;
                uint64_t v61 = v24;
                do
                {
                  *uint64_t v61 = *a5;
                  v61 += v11;
                  --v60;
                }
                while (v60);
                *uint64_t v61 = *a5;
                v24 += v12;
                ++v59;
              }
              while (v59 != v38);
            }
          }
          else
          {
            int v39 = 0;
            if (v29 == 1)
            {
              do
              {
                int v45 = HIDWORD(v29) - 1;
                unint64_t v46 = v24;
                do
                {
                  unsigned char *v46 = *a5;
                  v46 += v37;
                  --v45;
                }
                while (v45);
                unsigned char *v46 = *a5;
                v24 += v12;
                ++v39;
              }
              while (v39 != v38);
            }
            else
            {
              do
              {
                int v40 = 0;
                int v41 = v24;
                do
                {
                  int v42 = v29 - 1;
                  uint64_t v43 = v41;
                  do
                  {
                    *uint64_t v43 = *a5;
                    v43 += v11;
                    --v42;
                  }
                  while (v42);
                  *uint64_t v43 = *a5;
                  v41 += v37;
                  ++v40;
                }
                while (v40 != v36);
                int v44 = v29 - 1;
                do
                {
                  unsigned char *v41 = *a5;
                  v41 += v11;
                  --v44;
                }
                while (v44);
                unsigned char *v41 = *a5;
                v24 += v12;
                ++v39;
              }
              while (v39 != v38);
            }
          }
        }
        if (HIDWORD(v29) != 1)
        {
          if (v29 == 1)
          {
            do
            {
              *unint64_t v24 = *a5;
              v24 += v37;
              --v36;
            }
            while (v36);
          }
          else
          {
            int v62 = 0;
            do
            {
              int v63 = v29 - 1;
              unint64_t v64 = v24;
              do
              {
                *unint64_t v64 = *a5;
                v64 += v11;
                --v63;
              }
              while (v63);
              *unint64_t v64 = *a5;
              v24 += v37;
              ++v62;
            }
            while (v62 != v36);
          }
        }
        if (v29 != 1)
        {
          do
          {
            *unint64_t v24 = *a5;
            v24 += v11;
            --v35;
          }
          while (v35);
        }
        *unint64_t v24 = *a5;
      }
    }
  }
  return v10;
}

void sub_21B96C7C4(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)(v1 + 8);
  if (v3) {
    free(v3);
  }
  *(void *)(v1 + 8) = 0;
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B96C7E4(uint64_t a1, unsigned int *a2, uint64_t *a3, char a4, const __int16 *a5, char a6, uint64_t a7)
{
  if (a4)
  {
    unint64_t v11 = *a3;
    int v12 = *((_DWORD *)a3 + 2);
    unsigned int v13 = a2[2];
  }
  else
  {
    unsigned int v14 = *a2;
    unsigned int v15 = a2[1];
    if (v15) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = 0;
    }
    int v17 = v15 * v14;
    unsigned int v13 = a2[2];
    if (v13) {
      int v12 = v17;
    }
    else {
      int v12 = 0;
    }
    unint64_t v11 = (*a2 != 0) | (unint64_t)(v16 << 32);
  }
  unsigned int v18 = v12 * v13;
  unint64_t v19 = 2 * v18;
  unint64_t v20 = (a7 - 1) | ((unint64_t)(a7 - 1) >> 1) | (((a7 - 1) | ((unint64_t)(a7 - 1) >> 1)) >> 2);
  unint64_t v21 = v20 | (v20 >> 4) | ((v20 | (v20 >> 4)) >> 8);
  unint64_t v22 = v21 | (v21 >> 16) | ((v21 | (v21 >> 16)) >> 32);
  if (v22 + 1 > 8) {
    size_t v23 = v22 + 1;
  }
  else {
    size_t v23 = 8;
  }
  *(void *)a1 = v19;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v23;
  if (v18)
  {
    memptr = 0;
    int v24 = malloc_type_posix_memalign(&memptr, v23, 2 * v18, 0x1F88E90uLL);
    if (v24) {
      sub_21B97D9E4(v24, *(void *)(a1 + 16), v19);
    }
    size_t v25 = (__int16 *)memptr;
    *(void *)(a1 + 8) = memptr;
  }
  else
  {
    size_t v25 = 0;
  }
  uint64_t v26 = *(void *)a2;
  *(_DWORD *)(a1 + 32) = a2[2];
  *(void *)(a1 + 24) = v26;
  *(void *)(a1 + 36) = (2 * v11) & 0xFFFFFFFEFFFFFFFELL;
  *(_DWORD *)(a1 + 44) = 2 * v12;
  if (!v25 || !a6) {
    return a1;
  }
  uint64_t v27 = v12 & 0x7FFFFFFF;
  if (*(_DWORD *)(a1 + 24)) {
    BOOL v28 = *(_DWORD *)(a1 + 28) == 0;
  }
  else {
    BOOL v28 = 1;
  }
  BOOL v29 = v28 || *(_DWORD *)(a1 + 32) == 0;
  char v30 = v29;
  if (v29) {
    uint64_t v31 = 0;
  }
  else {
    uint64_t v31 = *(void *)(a1 + 24);
  }
  if (v29) {
    int v32 = 0;
  }
  else {
    int v32 = *(_DWORD *)(a1 + 32);
  }
  uint64_t v33 = (v32 * v27);
  if (v33 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_141;
  }
  unint64_t v34 = v11 & 0x7FFFFFFF7FFFFFFFLL;
  uint64_t v35 = v11 & 0x7FFFFFFF;
  if (v35 != 1)
  {
    if (v31) {
      BOOL v40 = HIDWORD(v31) == 0;
    }
    else {
      BOOL v40 = 1;
    }
    if (v40) {
      char v41 = 1;
    }
    else {
      char v41 = v30;
    }
    if (v41) {
      return a1;
    }
    int v42 = v31 - 1;
    int v43 = HIDWORD(v31) - 1;
    unint64_t v44 = HIDWORD(v34);
    int v45 = v32 - 1;
    if (v32 != 1)
    {
      if (HIDWORD(v31) == 1)
      {
        if (v31 != 1)
        {
          int v77 = 0;
          do
          {
            unint64_t v78 = v25;
            int v79 = v31 - 1;
            do
            {
              __int16 *v78 = *a5;
              v78 += v35;
              --v79;
            }
            while (v79);
            __int16 *v78 = *a5;
            v25 += v27;
            ++v77;
          }
          while (v77 != v45);
LABEL_109:
          if (v31 != 1)
          {
            uint64_t v80 = 2 * v35;
            do
            {
              *size_t v25 = *a5;
              size_t v25 = (__int16 *)((char *)v25 + v80);
              --v42;
            }
            while (v42);
          }
          goto LABEL_130;
        }
        do
        {
          *size_t v25 = *a5;
          v25 += v27;
          --v45;
        }
        while (v45);
LABEL_130:
        *size_t v25 = *a5;
        return a1;
      }
      if (v31 == 1)
      {
        do
        {
          BOOL v81 = v25;
          int v82 = HIDWORD(v31) - 1;
          do
          {
            *BOOL v81 = *a5;
            v81 += v44;
            --v82;
          }
          while (v82);
          *BOOL v81 = *a5;
          v25 += v27;
          ++v42;
        }
        while (v42 != v45);
        do
        {
LABEL_116:
          *size_t v25 = *a5;
          v25 += v44;
          --v43;
        }
        while (v43);
        goto LABEL_130;
      }
      int v46 = 0;
      uint64_t v47 = 2 * v27;
      uint64_t v48 = v44;
      uint64_t v49 = 2 * v35;
      int v50 = &v25[v44];
      do
      {
        int v51 = 0;
        uint64_t v52 = v50;
        int v53 = v25;
        do
        {
          int v54 = v52;
          int v55 = v53;
          int v56 = v31 - 1;
          do
          {
            __int16 *v55 = *a5;
            int v55 = (__int16 *)((char *)v55 + v49);
            --v56;
          }
          while (v56);
          __int16 *v55 = *a5;
          int v53 = (__int16 *)((char *)v53 + v48 * 2);
          ++v51;
          uint64_t v52 = &v54[v48];
        }
        while (v51 != v43);
        int v57 = v31 - 1;
        do
        {
          __int16 *v54 = *a5;
          int v54 = (__int16 *)((char *)v54 + v49);
          --v57;
        }
        while (v57);
        __int16 *v54 = *a5;
        size_t v25 = (__int16 *)((char *)v25 + v47);
        ++v46;
        int v50 = (__int16 *)((char *)v50 + v47);
      }
      while (v46 != v45);
    }
    if (HIDWORD(v31) == 1) {
      goto LABEL_109;
    }
    if (v31 != 1)
    {
      int v58 = 0;
      uint64_t v59 = 2 * v44;
      do
      {
        int v60 = v25;
        int v61 = v31 - 1;
        do
        {
          *int v60 = *a5;
          v60 += v35;
          --v61;
        }
        while (v61);
        *int v60 = *a5;
        size_t v25 = (__int16 *)((char *)v25 + v59);
        ++v58;
      }
      while (v58 != v43);
      goto LABEL_109;
    }
    goto LABEL_116;
  }
  if (HIDWORD(v34) != v31)
  {
    char v94 = 0;
    uint64_t v93 = v31;
    v95[0] = &v94;
    v95[1] = &v93;
    v95[2] = a5;
    if (v31) {
      BOOL v62 = HIDWORD(v31) == 0;
    }
    else {
      BOOL v62 = 1;
    }
    if (v62) {
      char v63 = 1;
    }
    else {
      char v63 = v30;
    }
    if ((v63 & 1) == 0)
    {
      LODWORD(memptr) = 0;
      HIDWORD(memptr) = v31 - 1;
      int v97 = 1;
      int v98 = HIDWORD(v31) - 1;
      v102[0] = 0;
      v102[1] = 0;
      int v64 = v32 - 1;
      int v99 = (v11 & 0x7FFFFFFF7FFFFFFFLL) >> 32;
      int v100 = v32 - 1;
      int v101 = v12 & 0x7FFFFFFF;
      if (v32 != 1)
      {
        do
        {
          sub_21B8941D8((uint64_t)&memptr, (uint64_t)v102, (uint64_t)v95, (unint64_t)v25);
          v25 += v12 & 0x7FFFFFFF;
          --v64;
        }
        while (v64);
      }
      sub_21B8941D8((uint64_t)&memptr, (uint64_t)v102, (uint64_t)v95, (unint64_t)v25);
    }
    return a1;
  }
  uint64_t v36 = (HIDWORD(v31) * v31);
  if (v27 != v36)
  {
    if (v31) {
      BOOL v65 = HIDWORD(v31) == 0;
    }
    else {
      BOOL v65 = 1;
    }
    if (v65) {
      char v66 = 1;
    }
    else {
      char v66 = v30;
    }
    if (v66) {
      return a1;
    }
    if (v32 == 1)
    {
      if (!v36) {
        return a1;
      }
    }
    else
    {
      if (!v36) {
        return a1;
      }
      uint64_t v67 = 0;
      uint64_t v68 = 2 * v27;
      int v69 = v25;
      do
      {
        unint64_t v70 = (unint64_t)v69;
        if (!v69
          && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          goto LABEL_141;
        }
        unint64_t v71 = (__int16 *)v70;
        uint64_t v72 = v36;
        if (v36 < 0x10) {
          goto LABEL_101;
        }
        if (v70 < (unint64_t)(a5 + 1))
        {
          unint64_t v71 = (__int16 *)v70;
          uint64_t v72 = v36;
          if ((__int16 *)((char *)&v25[v36] + v68 * v67) > a5) {
            goto LABEL_101;
          }
        }
        uint64_t v73 = 0;
        unint64_t v71 = (__int16 *)(v70 + 2 * (v36 & 0xFFFFFFF0));
        int16x8_t v74 = vld1q_dup_s16(a5);
        do
        {
          uint64_t v75 = (int16x8_t *)(v70 + v73);
          int16x8_t *v75 = v74;
          v75[1] = v74;
          v73 += 32;
        }
        while (((2 * v36) & 0x1FFFFFFE0) != v73);
        uint64_t v72 = v36 & 0xF;
        if ((v36 & 0xFFFFFFF0) != v36)
        {
LABEL_101:
          unint64_t v76 = v72 + 1;
          do
          {
            *v71++ = *a5;
            --v76;
          }
          while (v76 > 1);
        }
        int v69 = (__int16 *)(v70 + v68);
        ++v67;
      }
      while (v67 != v32 - 1);
      size_t v25 = (__int16 *)(v70 + v68);
      if (!v70)
      {
        if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          size_t v25 = 0;
          goto LABEL_122;
        }
LABEL_141:
        abort();
      }
    }
LABEL_122:
    unint64_t v83 = v36 - (v36 != 0) + 1;
    if (v83 >= 0x10 && (v25 >= a5 + 1 || &v25[v36] <= a5))
    {
      uint64_t v84 = &v25[v83 & 0xFFFFFFFFFFFFFFF0];
      v36 -= v83 & 0xFFFFFFFFFFFFFFF0;
      int16x8_t v90 = vld1q_dup_s16(a5);
      BOOL v91 = (int16x8_t *)(v25 + 8);
      unint64_t v92 = v83 & 0xFFFFFFFFFFFFFFF0;
      do
      {
        v91[-1] = v90;
        *BOOL v91 = v90;
        v91 += 2;
        v92 -= 16;
      }
      while (v92);
      if (v83 == (v83 & 0xFFFFFFFFFFFFFFF0)) {
        return a1;
      }
    }
    else
    {
      uint64_t v84 = v25;
    }
    unint64_t v85 = v36 + 1;
    do
    {
      *v84++ = *a5;
      --v85;
    }
    while (v85 > 1);
    return a1;
  }
  if (!v33) {
    return a1;
  }
  if (v33 < 0x10 || v25 < a5 + 1 && &v25[v33] > a5)
  {
    size_t v37 = v25;
    uint64_t v38 = (v32 * v27);
LABEL_44:
    unint64_t v39 = v38 + 1;
    do
    {
      *v37++ = *a5;
      --v39;
    }
    while (v39 > 1);
    return a1;
  }
  size_t v37 = &v25[v33 & 0xFFFFFFF0];
  uint64_t v38 = ((_BYTE)v32 * (_BYTE)v27) & 0xF;
  int16x8_t v87 = vld1q_dup_s16(a5);
  unint64_t v88 = (int16x8_t *)(v25 + 8);
  uint64_t v89 = v33 & 0xFFFFFFF0;
  do
  {
    v88[-1] = v87;
    *unint64_t v88 = v87;
    v88 += 2;
    v89 -= 16;
  }
  while (v89);
  if ((v33 & 0xFFFFFFF0) != v33) {
    goto LABEL_44;
  }
  return a1;
}

void sub_21B96CEC8(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)(v1 + 8);
  if (v3) {
    free(v3);
  }
  *(void *)(v1 + 8) = 0;
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B96CEEC(uint64_t a1, unsigned int *a2, uint64_t *a3, char a4, _WORD *a5, char a6, uint64_t a7)
{
  if (a4)
  {
    unint64_t v11 = *a3;
    int v12 = *((_DWORD *)a3 + 2);
    unsigned int v13 = a2[2];
  }
  else
  {
    unsigned int v14 = *a2;
    unsigned int v15 = a2[1];
    if (v15) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = 0;
    }
    int v17 = v15 * v14;
    unsigned int v13 = a2[2];
    if (v13) {
      int v12 = v17;
    }
    else {
      int v12 = 0;
    }
    unint64_t v11 = (*a2 != 0) | (unint64_t)(v16 << 32);
  }
  unsigned int v18 = v12 * v13;
  unint64_t v19 = 2 * v18;
  unint64_t v20 = (a7 - 1) | ((unint64_t)(a7 - 1) >> 1) | (((a7 - 1) | ((unint64_t)(a7 - 1) >> 1)) >> 2);
  unint64_t v21 = v20 | (v20 >> 4) | ((v20 | (v20 >> 4)) >> 8);
  unint64_t v22 = v21 | (v21 >> 16) | ((v21 | (v21 >> 16)) >> 32);
  if (v22 + 1 > 8) {
    size_t v23 = v22 + 1;
  }
  else {
    size_t v23 = 8;
  }
  *(void *)a1 = v19;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v23;
  if (v18)
  {
    memptr = 0;
    int v24 = malloc_type_posix_memalign(&memptr, v23, 2 * v18, 0x1F88E90uLL);
    if (v24) {
      sub_21B97D9E4(v24, *(void *)(a1 + 16), v19);
    }
    size_t v25 = memptr;
    *(void *)(a1 + 8) = memptr;
  }
  else
  {
    size_t v25 = 0;
  }
  uint64_t v26 = *(void *)a2;
  *(_DWORD *)(a1 + 32) = a2[2];
  *(void *)(a1 + 24) = v26;
  *(void *)(a1 + 36) = (2 * v11) & 0xFFFFFFFEFFFFFFFELL;
  *(_DWORD *)(a1 + 44) = 2 * v12;
  if (v25)
  {
    uint64_t v27 = v12 & 0x7FFFFFFF;
    unint64_t v28 = v11 & 0x7FFFFFFF7FFFFFFFLL;
    if (*(_DWORD *)(a1 + 24)) {
      BOOL v29 = *(_DWORD *)(a1 + 28) == 0;
    }
    else {
      BOOL v29 = 1;
    }
    BOOL v30 = v29 || *(_DWORD *)(a1 + 32) == 0;
    char v31 = v30;
    if (v30) {
      unint64_t v32 = 0;
    }
    else {
      unint64_t v32 = *(void *)(a1 + 24);
    }
    if (v30) {
      int v33 = 0;
    }
    else {
      int v33 = *(_DWORD *)(a1 + 32);
    }
    int v34 = v33 * v27;
    if (a6)
    {
      if (v34 == -1
        && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
      {
        abort();
      }
      if (HIDWORD(v32)) {
        BOOL v35 = v32 == 0;
      }
      else {
        BOOL v35 = 1;
      }
      if (v35) {
        char v36 = 1;
      }
      else {
        char v36 = v31;
      }
      if ((v36 & 1) == 0 && v32)
      {
        int v37 = v32 - 1;
        int v38 = HIDWORD(v32) - 1;
        unint64_t v39 = HIDWORD(v28);
        int v40 = v33 - 1;
        if (v33 != 1)
        {
          uint64_t v41 = v11 & 0x7FFFFFFF;
          if (HIDWORD(v32) == 1)
          {
            if (v32 == 1)
            {
              do
              {
                *size_t v25 = *a5;
                v25 += v27;
                --v40;
              }
              while (v40);
            }
            else
            {
              int v77 = 0;
              uint64_t v78 = 2 * v41;
              do
              {
                int v79 = v25;
                int v80 = v32 - 1;
                do
                {
                  *int v79 = *a5;
                  int v79 = (_WORD *)((char *)v79 + v78);
                  --v80;
                }
                while (v80);
                *int v79 = *a5;
                v25 += v27;
                ++v77;
              }
              while (v77 != v40);
            }
          }
          else
          {
            int v42 = 0;
            uint64_t v43 = 2 * v27;
            uint64_t v44 = v39;
            if (v32 == 1)
            {
              do
              {
                int v54 = HIDWORD(v32) - 1;
                int v55 = v25;
                do
                {
                  _WORD *v55 = *a5;
                  int v55 = (_WORD *)((char *)v55 + v44 * 2);
                  --v54;
                }
                while (v54);
                _WORD *v55 = *a5;
                size_t v25 = (_WORD *)((char *)v25 + v43);
                ++v42;
              }
              while (v42 != v40);
            }
            else
            {
              uint64_t v45 = 2 * v41;
              int v46 = &v25[v44];
              do
              {
                int v47 = 0;
                uint64_t v48 = v46;
                uint64_t v49 = v25;
                do
                {
                  int v50 = v48;
                  int v51 = v49;
                  int v52 = v32 - 1;
                  do
                  {
                    _WORD *v51 = *a5;
                    int v51 = (_WORD *)((char *)v51 + v45);
                    --v52;
                  }
                  while (v52);
                  _WORD *v51 = *a5;
                  uint64_t v49 = (_WORD *)((char *)v49 + v44 * 2);
                  ++v47;
                  uint64_t v48 = &v50[v44];
                }
                while (v47 != v38);
                int v53 = v32 - 1;
                do
                {
                  _WORD *v50 = *a5;
                  int v50 = (_WORD *)((char *)v50 + v45);
                  --v53;
                }
                while (v53);
                _WORD *v50 = *a5;
                size_t v25 = (_WORD *)((char *)v25 + v43);
                ++v42;
                int v46 = (_WORD *)((char *)v46 + v43);
              }
              while (v42 != v40);
            }
          }
        }
        if (HIDWORD(v32) != 1)
        {
          if (v32 == 1)
          {
            uint64_t v89 = 2 * v39;
            do
            {
              *size_t v25 = *a5;
              size_t v25 = (_WORD *)((char *)v25 + v89);
              --v38;
            }
            while (v38);
          }
          else
          {
            int v85 = 0;
            uint64_t v86 = 2 * v39;
            do
            {
              int16x8_t v87 = v25;
              int v88 = v32 - 1;
              do
              {
                *int16x8_t v87 = *a5;
                v87 += v11 & 0x7FFFFFFF;
                --v88;
              }
              while (v88);
              *int16x8_t v87 = *a5;
              size_t v25 = (_WORD *)((char *)v25 + v86);
              ++v85;
            }
            while (v85 != v38);
          }
        }
        if (v32 != 1)
        {
          do
          {
            *size_t v25 = *a5;
            v25 += v11 & 0x7FFFFFFF;
            --v37;
          }
          while (v37);
        }
        *size_t v25 = *a5;
      }
    }
    else
    {
      if (v34 == -1
        && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
      {
        abort();
      }
      if (HIDWORD(v32)) {
        BOOL v56 = v32 == 0;
      }
      else {
        BOOL v56 = 1;
      }
      if (v56) {
        char v57 = 1;
      }
      else {
        char v57 = v31;
      }
      if ((v57 & 1) == 0 && v32)
      {
        int v58 = v32 - 1;
        int v59 = HIDWORD(v32) - 1;
        unint64_t v60 = HIDWORD(v28);
        int v61 = v33 - 1;
        if (v33 != 1)
        {
          uint64_t v62 = v11 & 0x7FFFFFFF;
          if (HIDWORD(v32) == 1)
          {
            if (v32 == 1)
            {
              do
              {
                *size_t v25 = 0;
                v25 += v27;
                --v61;
              }
              while (v61);
            }
            else
            {
              int v81 = 0;
              uint64_t v82 = 2 * v62;
              do
              {
                unint64_t v83 = v25;
                int v84 = v32 - 1;
                do
                {
                  *unint64_t v83 = 0;
                  unint64_t v83 = (_WORD *)((char *)v83 + v82);
                  --v84;
                }
                while (v84);
                *unint64_t v83 = 0;
                v25 += v27;
                ++v81;
              }
              while (v81 != v61);
            }
          }
          else
          {
            int v63 = 0;
            uint64_t v64 = 2 * v27;
            uint64_t v65 = v60;
            if (v32 == 1)
            {
              do
              {
                int v75 = HIDWORD(v32) - 1;
                unint64_t v76 = v25;
                do
                {
                  *unint64_t v76 = 0;
                  unint64_t v76 = (_WORD *)((char *)v76 + v65 * 2);
                  --v75;
                }
                while (v75);
                *unint64_t v76 = 0;
                size_t v25 = (_WORD *)((char *)v25 + v64);
                ++v63;
              }
              while (v63 != v61);
            }
            else
            {
              uint64_t v66 = 2 * v62;
              uint64_t v67 = &v25[v65];
              do
              {
                int v68 = 0;
                int v69 = v67;
                unint64_t v70 = v25;
                do
                {
                  unint64_t v71 = v69;
                  uint64_t v72 = v70;
                  int v73 = v32 - 1;
                  do
                  {
                    *uint64_t v72 = 0;
                    uint64_t v72 = (_WORD *)((char *)v72 + v66);
                    --v73;
                  }
                  while (v73);
                  *uint64_t v72 = 0;
                  unint64_t v70 = (_WORD *)((char *)v70 + v65 * 2);
                  ++v68;
                  int v69 = &v71[v65];
                }
                while (v68 != v59);
                int v74 = v32 - 1;
                do
                {
                  _WORD *v71 = 0;
                  unint64_t v71 = (_WORD *)((char *)v71 + v66);
                  --v74;
                }
                while (v74);
                _WORD *v71 = 0;
                size_t v25 = (_WORD *)((char *)v25 + v64);
                ++v63;
                uint64_t v67 = (_WORD *)((char *)v67 + v64);
              }
              while (v63 != v61);
            }
          }
        }
        if (HIDWORD(v32) != 1)
        {
          if (v32 == 1)
          {
            uint64_t v94 = 2 * v60;
            do
            {
              *size_t v25 = 0;
              size_t v25 = (_WORD *)((char *)v25 + v94);
              --v59;
            }
            while (v59);
          }
          else
          {
            int v90 = 0;
            uint64_t v91 = 2 * v60;
            do
            {
              unint64_t v92 = v25;
              int v93 = v32 - 1;
              do
              {
                *unint64_t v92 = 0;
                v92 += v11 & 0x7FFFFFFF;
                --v93;
              }
              while (v93);
              *unint64_t v92 = 0;
              size_t v25 = (_WORD *)((char *)v25 + v91);
              ++v90;
            }
            while (v90 != v59);
          }
        }
        if (v32 != 1)
        {
          do
          {
            *size_t v25 = 0;
            v25 += v11 & 0x7FFFFFFF;
            --v58;
          }
          while (v58);
        }
        *size_t v25 = 0;
      }
    }
  }
  return a1;
}

void sub_21B96D4A4(_Unwind_Exception *a1)
{
  sub_21B965FC8(v1);
  _Unwind_Resume(a1);
}

void sub_21B96D4B8(_Unwind_Exception *a1)
{
  sub_21B965FC8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21B96D4CC(uint64_t a1, unsigned int *a2, uint64_t *a3, char a4, const float *a5, char a6, uint64_t a7)
{
  if (a4)
  {
    unint64_t v11 = *a3;
    int v12 = *((_DWORD *)a3 + 2);
    unsigned int v13 = a2[2];
  }
  else
  {
    unsigned int v14 = *a2;
    unsigned int v15 = a2[1];
    if (v15) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = 0;
    }
    int v17 = v15 * v14;
    unsigned int v13 = a2[2];
    if (v13) {
      int v12 = v17;
    }
    else {
      int v12 = 0;
    }
    unint64_t v11 = (*a2 != 0) | (unint64_t)(v16 << 32);
  }
  unsigned int v18 = v12 * v13;
  unint64_t v19 = 4 * v18;
  unint64_t v20 = (a7 - 1) | ((unint64_t)(a7 - 1) >> 1) | (((a7 - 1) | ((unint64_t)(a7 - 1) >> 1)) >> 2);
  unint64_t v21 = v20 | (v20 >> 4) | ((v20 | (v20 >> 4)) >> 8);
  unint64_t v22 = v21 | (v21 >> 16) | ((v21 | (v21 >> 16)) >> 32);
  if (v22 + 1 > 8) {
    size_t v23 = v22 + 1;
  }
  else {
    size_t v23 = 8;
  }
  *(void *)a1 = v19;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v23;
  if (v18)
  {
    memptr = 0;
    int v24 = malloc_type_posix_memalign(&memptr, v23, 4 * v18, 0x1F88E90uLL);
    if (v24) {
      sub_21B97D9E4(v24, *(void *)(a1 + 16), v19);
    }
    size_t v25 = (float32x4_t *)memptr;
    *(void *)(a1 + 8) = memptr;
  }
  else
  {
    size_t v25 = 0;
  }
  uint64_t v26 = *(void *)a2;
  *(_DWORD *)(a1 + 32) = a2[2];
  *(void *)(a1 + 24) = v26;
  *(void *)(a1 + 36) = (4 * v11) & 0xFFFFFFFCFFFFFFFCLL;
  *(_DWORD *)(a1 + 44) = 4 * v12;
  if (!v25 || !a6) {
    return a1;
  }
  uint64_t v27 = v12 & 0x3FFFFFFF;
  if (*(_DWORD *)(a1 + 24)) {
    BOOL v28 = *(_DWORD *)(a1 + 28) == 0;
  }
  else {
    BOOL v28 = 1;
  }
  BOOL v29 = v28 || *(_DWORD *)(a1 + 32) == 0;
  char v30 = v29;
  if (v29) {
    uint64_t v31 = 0;
  }
  else {
    uint64_t v31 = *(void *)(a1 + 24);
  }
  if (v29) {
    int v32 = 0;
  }
  else {
    int v32 = *(_DWORD *)(a1 + 32);
  }
  uint64_t v33 = (v32 * v27);
  if (v33 == -1
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_141;
  }
  unint64_t v34 = v11 & 0x3FFFFFFF3FFFFFFFLL;
  uint64_t v35 = v11 & 0x3FFFFFFF;
  if (v35 != 1)
  {
    if (v31) {
      BOOL v40 = HIDWORD(v31) == 0;
    }
    else {
      BOOL v40 = 1;
    }
    if (v40) {
      char v41 = 1;
    }
    else {
      char v41 = v30;
    }
    if (v41) {
      return a1;
    }
    int v42 = v31 - 1;
    int v43 = HIDWORD(v31) - 1;
    unint64_t v44 = HIDWORD(v34);
    int v45 = v32 - 1;
    if (v32 != 1)
    {
      if (HIDWORD(v31) == 1)
      {
        if (v31 != 1)
        {
          int v77 = 0;
          do
          {
            uint64_t v78 = v25;
            int v79 = v31 - 1;
            do
            {
              v78->f32[0] = *a5;
              uint64_t v78 = (float32x4_t *)((char *)v78 + 4 * v35);
              --v79;
            }
            while (v79);
            v78->f32[0] = *a5;
            size_t v25 = (float32x4_t *)((char *)v25 + 4 * v27);
            ++v77;
          }
          while (v77 != v45);
LABEL_109:
          if (v31 != 1)
          {
            uint64_t v80 = 4 * v35;
            do
            {
              v25->f32[0] = *a5;
              size_t v25 = (float32x4_t *)((char *)v25 + v80);
              --v42;
            }
            while (v42);
          }
          goto LABEL_130;
        }
        do
        {
          v25->f32[0] = *a5;
          size_t v25 = (float32x4_t *)((char *)v25 + 4 * v27);
          --v45;
        }
        while (v45);
LABEL_130:
        v25->f32[0] = *a5;
        return a1;
      }
      if (v31 == 1)
      {
        do
        {
          int v81 = v25;
          int v82 = HIDWORD(v31) - 1;
          do
          {
            v81->f32[0] = *a5;
            int v81 = (float32x4_t *)((char *)v81 + 4 * v44);
            --v82;
          }
          while (v82);
          v81->f32[0] = *a5;
          size_t v25 = (float32x4_t *)((char *)v25 + 4 * v27);
          ++v42;
        }
        while (v42 != v45);
        do
        {
LABEL_116:
          v25->f32[0] = *a5;
          size_t v25 = (float32x4_t *)((char *)v25 + 4 * v44);
          --v43;
        }
        while (v43);
        goto LABEL_130;
      }
      int v46 = 0;
      uint64_t v47 = 4 * v27;
      uint64_t v48 = v44;
      uint64_t v49 = 4 * v35;
      int v50 = &v25->i32[v44];
      do
      {
        int v51 = 0;
        int v52 = v50;
        int v53 = v25;
        do
        {
          int v54 = v52;
          int v55 = v53;
          int v56 = v31 - 1;
          do
          {
            v55->f32[0] = *a5;
            int v55 = (float32x4_t *)((char *)v55 + v49);
            --v56;
          }
          while (v56);
          v55->f32[0] = *a5;
          int v53 = (float32x4_t *)((char *)v53 + v48 * 4);
          ++v51;
          int v52 = &v54[v48];
        }
        while (v51 != v43);
        int v57 = v31 - 1;
        do
        {
          __int32 *v54 = *(_DWORD *)a5;
          int v54 = (__int32 *)((char *)v54 + v49);
          --v57;
        }
        while (v57);
        __int32 *v54 = *(_DWORD *)a5;
        size_t v25 = (float32x4_t *)((char *)v25 + v47);
        ++v46;
        int v50 = (__int32 *)((char *)v50 + v47);
      }
      while (v46 != v45);
    }
    if (HIDWORD(v31) == 1) {
      goto LABEL_109;
    }
    if (v31 != 1)
    {
      int v58 = 0;
      uint64_t v59 = 4 * v44;
      do
      {
        unint64_t v60 = v25;
        int v61 = v31 - 1;
        do
        {
          v60->f32[0] = *a5;
          unint64_t v60 = (float32x4_t *)((char *)v60 + 4 * v35);
          --v61;
        }
        while (v61);
        v60->f32[0] = *a5;
        size_t v25 = (float32x4_t *)((char *)v25 + v59);
        ++v58;
      }
      while (v58 != v43);
      goto LABEL_109;
    }
    goto LABEL_116;
  }
  if (HIDWORD(v34) != v31)
  {
    char v94 = 0;
    uint64_t v93 = v31;
    v95[0] = &v94;
    v95[1] = &v93;
    v95[2] = a5;
    if (v31) {
      BOOL v62 = HIDWORD(v31) == 0;
    }
    else {
      BOOL v62 = 1;
    }
    if (v62) {
      char v63 = 1;
    }
    else {
      char v63 = v30;
    }
    if ((v63 & 1) == 0)
    {
      LODWORD(memptr) = 0;
      HIDWORD(memptr) = v31 - 1;
      int v97 = 1;
      int v98 = HIDWORD(v31) - 1;
      v102[0] = 0;
      v102[1] = 0;
      int v64 = v32 - 1;
      int v99 = (v11 & 0x3FFFFFFF3FFFFFFFLL) >> 32;
      int v100 = v32 - 1;
      int v101 = v12 & 0x3FFFFFFF;
      if (v32 != 1)
      {
        do
        {
          sub_21B8977D0((uint64_t)&memptr, (uint64_t)v102, (uint64_t)v95, (unint64_t)v25);
          size_t v25 = (float32x4_t *)((char *)v25 + 4 * (v12 & 0x3FFFFFFF));
          --v64;
        }
        while (v64);
      }
      sub_21B8977D0((uint64_t)&memptr, (uint64_t)v102, (uint64_t)v95, (unint64_t)v25);
    }
    return a1;
  }
  uint64_t v36 = (HIDWORD(v31) * v31);
  if (v27 != v36)
  {
    if (v31) {
      BOOL v65 = HIDWORD(v31) == 0;
    }
    else {
      BOOL v65 = 1;
    }
    if (v65) {
      char v66 = 1;
    }
    else {
      char v66 = v30;
    }
    if (v66) {
      return a1;
    }
    if (v32 == 1)
    {
      if (!v36) {
        return a1;
      }
    }
    else
    {
      if (!v36) {
        return a1;
      }
      uint64_t v67 = 0;
      uint64_t v68 = 4 * v27;
      int v69 = v25;
      do
      {
        unint64_t v70 = (unint64_t)v69;
        if (!v69
          && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          goto LABEL_141;
        }
        unint64_t v71 = (_DWORD *)v70;
        uint64_t v72 = v36;
        if (v36 < 8) {
          goto LABEL_101;
        }
        if (v70 < (unint64_t)(a5 + 1))
        {
          unint64_t v71 = (_DWORD *)v70;
          uint64_t v72 = v36;
          if ((char *)&v25->f32[v36] + v68 * v67 > (char *)a5) {
            goto LABEL_101;
          }
        }
        uint64_t v73 = 0;
        unint64_t v71 = (_DWORD *)(v70 + 4 * (v36 & 0xFFFFFFF8));
        float32x4_t v74 = vld1q_dup_f32(a5);
        do
        {
          int v75 = (float32x4_t *)(v70 + v73);
          float32x4_t *v75 = v74;
          v75[1] = v74;
          v73 += 32;
        }
        while (((4 * v36) & 0x3FFFFFFE0) != v73);
        uint64_t v72 = v36 & 7;
        if ((v36 & 0xFFFFFFF8) != v36)
        {
LABEL_101:
          unint64_t v76 = v72 + 1;
          do
          {
            *v71++ = *(_DWORD *)a5;
            --v76;
          }
          while (v76 > 1);
        }
        int v69 = (float32x4_t *)(v70 + v68);
        ++v67;
      }
      while (v67 != v32 - 1);
      size_t v25 = (float32x4_t *)(v70 + v68);
      if (!v70)
      {
        if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          size_t v25 = 0;
          goto LABEL_122;
        }
LABEL_141:
        abort();
      }
    }
LABEL_122:
    unint64_t v83 = v36 - (v36 != 0) + 1;
    if (v83 >= 0x10 && (v25 >= (float32x4_t *)(a5 + 1) || &v25->f32[v36] <= a5))
    {
      int v84 = (float32x4_t *)((char *)v25 + 4 * (v83 & 0xFFFFFFFFFFFFFFF8));
      v36 -= v83 & 0xFFFFFFFFFFFFFFF8;
      float32x4_t v90 = vld1q_dup_f32(a5);
      uint64_t v91 = v25 + 1;
      unint64_t v92 = v83 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v91[-1] = v90;
        *uint64_t v91 = v90;
        v91 += 2;
        v92 -= 8;
      }
      while (v92);
      if (v83 == (v83 & 0xFFFFFFFFFFFFFFF8)) {
        return a1;
      }
    }
    else
    {
      int v84 = v25;
    }
    unint64_t v85 = v36 + 1;
    do
    {
      v84->f32[0] = *a5;
      int v84 = (float32x4_t *)((char *)v84 + 4);
      --v85;
    }
    while (v85 > 1);
    return a1;
  }
  if (!v33) {
    return a1;
  }
  if (v33 < 8 || v25 < (float32x4_t *)(a5 + 1) && &v25->f32[v33] > a5)
  {
    int v37 = v25;
    uint64_t v38 = (v32 * v27);
LABEL_44:
    unint64_t v39 = v38 + 1;
    do
    {
      v37->f32[0] = *a5;
      int v37 = (float32x4_t *)((char *)v37 + 4);
      --v39;
    }
    while (v39 > 1);
    return a1;
  }
  int v37 = (float32x4_t *)((char *)v25 + 4 * (v33 & 0xFFFFFFF8));
  uint64_t v38 = ((_BYTE)v32 * (_BYTE)v27) & 7;
  float32x4_t v87 = vld1q_dup_f32(a5);
  int v88 = v25 + 1;
  uint64_t v89 = v33 & 0xFFFFFFF8;
  do
  {
    v88[-1] = v87;
    *int v88 = v87;
    v88 += 2;
    v89 -= 8;
  }
  while (v89);
  if ((v33 & 0xFFFFFFF8) != v33) {
    goto LABEL_44;
  }
  return a1;
}

void sub_21B96DBB0(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)(v1 + 8);
  if (v3) {
    free(v3);
  }
  *(void *)(v1 + 8) = 0;
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B96DBD4(uint64_t a1, unsigned int *a2)
{
  BOOL v3 = *(unsigned char **)(a1 + 64);
  if (!v3 || *(void *)(a2 + 1) != *(void *)(a1 + 4) || *((void *)a2 + 2) != *(void *)(a1 + 16))
  {
    long long v44 = *(_OWORD *)a2;
    long long v45 = *((_OWORD *)a2 + 1);
    long long v46 = *((_OWORD *)a2 + 2);
    uint64_t v47 = *((void *)a2 + 6);
    sub_21B964FB4((uint64_t)v48, (uint64_t)(a2 + 14));
    *(_OWORD *)a1 = v44;
    *(_OWORD *)(a1 + 16) = v45;
    *(_OWORD *)(a1 + 32) = v46;
    *(_OWORD *)(a1 + 80) = v49;
    *(void *)(a1 + 96) = v50;
    uint64_t v4 = v48[0];
    *(void *)(a1 + 48) = v47;
    *(void *)(a1 + 56) = v4;
    uint64_t v5 = *(void **)(a1 + 64);
    if (v5) {
      free(v5);
    }
    uint64_t v6 = v48[2];
    *(void *)(a1 + 64) = v48[1];
    *(void *)(a1 + 72) = v6;
    return a1;
  }
  if (a2[3] == 1 && *(_DWORD *)(a1 + 12) == 1)
  {
    int v24 = (char *)a2[4];
    uint64_t v25 = *(unsigned int *)(a1 + 16);
    size_t v26 = *a2;
    if (v24 == v25 && v24 == v26)
    {
      uint64_t v27 = a2[5];
      uint64_t v28 = *(unsigned int *)(a1 + 20);
      unsigned int v29 = a2[1];
      size_t v26 = v29 * v24;
      if (v27 == v28 && v27 == v26)
      {
        size_t v26 = v27 * a2[2];
        char v30 = (char *)*((void *)a2 + 8);
        if (v26 && !v30)
        {
          if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            BOOL v3 = *(unsigned char **)(a1 + 64);
LABEL_75:
            memmove(v3, v30, v26);
            return a1;
          }
LABEL_76:
          abort();
        }
LABEL_60:
        if (!v26) {
          return a1;
        }
        goto LABEL_75;
      }
      if (!v24) {
        return a1;
      }
      if (!v29) {
        return a1;
      }
      unsigned int v38 = a2[2];
      if (!v38) {
        return a1;
      }
      char v30 = (char *)*((void *)a2 + 8);
      unsigned int v39 = v38 - 1;
      if (v38 != 1)
      {
        if (!v26) {
          return a1;
        }
        while (v30
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v30, v26);
          v30 += v27;
          v3 += v28;
          if (!--v39) {
            goto LABEL_58;
          }
        }
        goto LABEL_76;
      }
LABEL_58:
      if (!v26 || v30) {
        goto LABEL_60;
      }
    }
    else
    {
      if (!v26) {
        return a1;
      }
      unsigned int v31 = a2[1];
      if (!v31) {
        return a1;
      }
      unsigned int v32 = a2[2];
      if (!v32) {
        return a1;
      }
      unsigned int v33 = v31 - 1;
      char v30 = (char *)*((void *)a2 + 8);
      unsigned int v43 = v32 - 1;
      if (v32 != 1)
      {
        uint64_t v41 = *(unsigned int *)(a1 + 20);
        uint64_t v40 = a2[5];
        if (v31 == 1)
        {
          while (v30
               || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            memmove(v3, v30, v26);
            v30 += v40;
            v3 += v41;
            if (!--v43) {
              goto LABEL_67;
            }
          }
        }
        else
        {
          int v34 = 0;
          while (1)
          {
            int v42 = v34;
            int v35 = 0;
            uint64_t v36 = v30;
            int v37 = v3;
            do
            {
              while (v36)
              {
                memmove(v37, v36, v26);
                uint64_t v36 = &v24[(void)v36];
                v37 += v25;
                if (++v35 == v33) {
                  goto LABEL_40;
                }
              }
              if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
              {
                goto LABEL_76;
              }
              memcpy(v37, 0, v26);
              v37 += v25;
              ++v35;
              uint64_t v36 = v24;
            }
            while (v35 != v33);
            uint64_t v36 = v24;
            if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
            {
              break;
            }
LABEL_40:
            memmove(v37, v36, v26);
            v30 += v40;
            v3 += v41;
            int v34 = v42 + 1;
            if (v42 + 1 == v43) {
              goto LABEL_67;
            }
          }
        }
        goto LABEL_76;
      }
LABEL_67:
      if (v33)
      {
        while (v30
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v30, v26);
          char v30 = &v24[(void)v30];
          v3 += v25;
          if (!--v33) {
            goto LABEL_73;
          }
        }
        goto LABEL_76;
      }
LABEL_73:
      if (v30) {
        goto LABEL_75;
      }
    }
    if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))goto LABEL_75; {
    goto LABEL_76;
    }
  }
  if (*a2)
  {
    unsigned int v9 = a2[1];
    if (v9)
    {
      unsigned int v10 = a2[2];
      if (v10)
      {
        unsigned int v11 = v9 - 1;
        uint64_t v12 = a2[4];
        uint64_t v13 = *(unsigned int *)(a1 + 16);
        unsigned int v14 = (unsigned char *)*((void *)a2 + 8);
        unsigned int v15 = v10 - 1;
        if (v15)
        {
          uint64_t v16 = *(unsigned int *)(a1 + 20);
          uint64_t v17 = a2[5];
          if (v11)
          {
            int v18 = 0;
            unint64_t v19 = v3 + 2;
            unint64_t v20 = v14 + 2;
            do
            {
              unint64_t v21 = v20;
              unint64_t v22 = v19;
              unsigned int v23 = v11;
              do
              {
                *(v22 - 2) = *(v21 - 2);
                *(v22 - 1) = *(v21 - 1);
                *unint64_t v22 = *v21;
                v22 += v13;
                v21 += v12;
                --v23;
              }
              while (v23);
              *(v22 - 2) = *(v21 - 2);
              *(v22 - 1) = *(v21 - 1);
              *unint64_t v22 = *v21;
              v14 += v17;
              v3 += v16;
              ++v18;
              v19 += v16;
              v20 += v17;
            }
            while (v18 != v15);
          }
          else
          {
            do
            {
              *BOOL v3 = *v14;
              v3[1] = v14[1];
              v3[2] = v14[2];
              v14 += v17;
              v3 += v16;
              --v15;
            }
            while (v15);
          }
        }
        for (; v11; --v11)
        {
          *BOOL v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
          v14 += v12;
          v3 += v13;
        }
        *BOOL v3 = *v14;
        v3[1] = v14[1];
        v3[2] = v14[2];
      }
    }
  }
  return a1;
}

uint64_t sub_21B96E1C4(uint64_t a1, unsigned int *a2)
{
  BOOL v3 = *(_WORD **)(a1 + 64);
  if (v3 && *(void *)(a2 + 1) == *(void *)(a1 + 4) && *((void *)a2 + 2) == *(void *)(a1 + 16))
  {
    if (a2[3] != 1 || *(_DWORD *)(a1 + 12) != 1)
    {
      if (!*a2) {
        return a1;
      }
      unsigned int v9 = a2[1];
      if (!v9) {
        return a1;
      }
      unsigned int v10 = a2[2];
      if (!v10) {
        return a1;
      }
      unsigned int v11 = v9 - 1;
      uint64_t v12 = a2[4];
      uint64_t v13 = *(unsigned int *)(a1 + 16);
      unsigned int v14 = (_WORD *)*((void *)a2 + 8);
      unsigned int v15 = v10 - 1;
      if (v15)
      {
        uint64_t v16 = *(unsigned int *)(a1 + 20);
        uint64_t v17 = a2[5];
        if (!v11)
        {
          do
          {
            *BOOL v3 = *v14;
            v3[1] = v14[1];
            v3[2] = v14[2];
            v14 += v17;
            v3 += v16;
            --v15;
          }
          while (v15);
LABEL_59:
          *BOOL v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
          return a1;
        }
        int v18 = 0;
        unint64_t v19 = v3 + 2;
        unint64_t v20 = v14 + 2;
        do
        {
          unint64_t v21 = v20;
          unint64_t v22 = v19;
          unsigned int v23 = v11;
          do
          {
            *(v22 - 2) = *(v21 - 2);
            *(v22 - 1) = *(v21 - 1);
            *unint64_t v22 = *v21;
            v22 += v13;
            v21 += v12;
            --v23;
          }
          while (v23);
          *(v22 - 2) = *(v21 - 2);
          *(v22 - 1) = *(v21 - 1);
          *unint64_t v22 = *v21;
          v14 += v17;
          v3 += v16;
          ++v18;
          v19 += v16;
          v20 += v17;
        }
        while (v18 != v15);
      }
      for (; v11; --v11)
      {
        *BOOL v3 = *v14;
        v3[1] = v14[1];
        v3[2] = v14[2];
        v14 += v12;
        v3 += v13;
      }
      goto LABEL_59;
    }
    uint64_t v24 = a2[4];
    uint64_t v25 = *(unsigned int *)(a1 + 16);
    uint64_t v26 = *a2;
    if (v24 == v25 && v24 == v26)
    {
      uint64_t v27 = a2[5];
      uint64_t v28 = *(unsigned int *)(a1 + 20);
      unsigned int v29 = a2[1];
      uint64_t v30 = v29 * v24;
      if (v27 == v28 && v27 == v30)
      {
        uint64_t v31 = v27 * a2[2];
        unsigned int v32 = (const void *)*((void *)a2 + 8);
        if (!v31 || v32)
        {
          if (!v31) {
            return a1;
          }
LABEL_57:
          memmove(v3, v32, 2 * v31);
          return a1;
        }
        if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          BOOL v3 = *(_WORD **)(a1 + 64);
          goto LABEL_57;
        }
LABEL_79:
        abort();
      }
      if (!v24) {
        return a1;
      }
      if (!v29) {
        return a1;
      }
      unsigned int v43 = a2[2];
      if (!v43) {
        return a1;
      }
      long long v44 = (char *)*((void *)a2 + 8);
      size_t v37 = 2 * v30;
      unsigned int v45 = v43 - 1;
      if (v43 != 1)
      {
        if (!v30) {
          return a1;
        }
        uint64_t v46 = 2 * v27;
        uint64_t v47 = 2 * v28;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, 2 * v30);
          v44 += v46;
          BOOL v3 = (_WORD *)((char *)v3 + v47);
          if (!--v45) {
            goto LABEL_60;
          }
        }
        goto LABEL_79;
      }
LABEL_60:
      if (!v30 || v44)
      {
        if (!v30) {
          return a1;
        }
        goto LABEL_74;
      }
    }
    else
    {
      if (!v26) {
        return a1;
      }
      unsigned int v33 = a2[1];
      if (!v33) {
        return a1;
      }
      unsigned int v34 = a2[2];
      if (!v34) {
        return a1;
      }
      unsigned int v35 = v33 - 1;
      uint64_t v36 = (char *)*((void *)a2 + 8);
      size_t v37 = 2 * v26;
      unsigned int v55 = v34 - 1;
      if (v34 != 1)
      {
        if (v33 == 1)
        {
          uint64_t v39 = a2[4];
          uint64_t v49 = 2 * a2[5];
          uint64_t v50 = 2 * *(unsigned int *)(a1 + 20);
          while (v36
               || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            memmove(v3, v36, v37);
            v36 += v49;
            BOOL v3 = (_WORD *)((char *)v3 + v50);
            if (!--v55) {
              goto LABEL_65;
            }
          }
        }
        else
        {
          int v38 = 0;
          uint64_t v39 = a2[4];
          uint64_t v40 = 2 * v24;
          uint64_t v51 = a2[5];
          uint64_t v52 = *(unsigned int *)(a1 + 20);
          while (1)
          {
            int v53 = v38;
            int v41 = 0;
            int v54 = v36;
            int v42 = (char *)v3;
            do
            {
              while (v36)
              {
                memmove(v42, v36, v37);
                v36 += 2 * v39;
                v42 += 2 * v25;
                if (++v41 == v35) {
                  goto LABEL_38;
                }
              }
              if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
              {
                goto LABEL_79;
              }
              memcpy(v42, 0, v37);
              v42 += 2 * v25;
              ++v41;
              uint64_t v36 = (char *)v40;
            }
            while (v41 != v35);
            uint64_t v36 = (char *)v40;
            if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
            {
              break;
            }
LABEL_38:
            memmove(v42, v36, v37);
            uint64_t v36 = &v54[2 * v51];
            v3 += v52;
            int v38 = v53 + 1;
            if (v53 + 1 == v55) {
              goto LABEL_65;
            }
          }
        }
        goto LABEL_79;
      }
      uint64_t v39 = a2[4];
LABEL_65:
      if (v35)
      {
        uint64_t v48 = 2 * v39;
        long long v44 = v36;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, v37);
          v44 += v48;
          v3 += v25;
          if (!--v35) {
            goto LABEL_72;
          }
        }
        goto LABEL_79;
      }
      long long v44 = v36;
LABEL_72:
      if (v44)
      {
LABEL_74:
        memmove(v3, v44, v37);
        return a1;
      }
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_79;
    }
    goto LABEL_74;
  }
  long long v56 = *(_OWORD *)a2;
  long long v57 = *((_OWORD *)a2 + 1);
  long long v58 = *((_OWORD *)a2 + 2);
  uint64_t v59 = *((void *)a2 + 6);
  sub_21B965784((uint64_t)v60, (uint64_t)(a2 + 14));
  *(_OWORD *)a1 = v56;
  *(_OWORD *)(a1 + 16) = v57;
  *(_OWORD *)(a1 + 32) = v58;
  *(_OWORD *)(a1 + 80) = v61;
  *(void *)(a1 + 96) = v62;
  uint64_t v4 = v60[0];
  *(void *)(a1 + 48) = v59;
  *(void *)(a1 + 56) = v4;
  uint64_t v5 = *(void **)(a1 + 64);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = v60[2];
  *(void *)(a1 + 64) = v60[1];
  *(void *)(a1 + 72) = v6;
  return a1;
}

uint64_t sub_21B96E814(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = a1;
  BOOL v3 = *(_WORD **)(a1 + 64);
  if (!v3 || *(void *)(a2 + 1) != *(void *)(a1 + 4) || *((void *)a2 + 2) != *(void *)(a1 + 16))
  {
    long long v147 = *(_OWORD *)a2;
    long long v148 = *((_OWORD *)a2 + 1);
    long long v149 = *((_OWORD *)a2 + 2);
    uint64_t v150 = *((void *)a2 + 6);
    sub_21B966078((uint64_t)v151, (uint64_t)(a2 + 14));
    *(_OWORD *)uint64_t v2 = v147;
    *(_OWORD *)(v2 + 16) = v148;
    *(_OWORD *)(v2 + 32) = v149;
    *(void *)(v2 + 48) = v150;
    *(_OWORD *)(v2 + 80) = v152;
    *(void *)(v2 + 96) = v153;
    uint64_t v4 = *(void **)(v2 + 64);
    if (v4)
    {
      if (*(_DWORD *)(v2 + 88)) {
        BOOL v5 = *(_DWORD *)(v2 + 84) == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5 || *(_DWORD *)(v2 + 80) == 0) {
        int v7 = 0;
      }
      else {
        int v7 = *(_DWORD *)(v2 + 88);
      }
      if (v7 * (*(_DWORD *)(v2 + 100) >> 1) == -1)
      {
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
        {
          abort();
        }
        uint64_t v4 = *(void **)(v2 + 64);
        *(void *)(v2 + 56) = v151[0];
        if (!v4) {
          goto LABEL_20;
        }
      }
      else
      {
        *(void *)(v2 + 56) = v151[0];
      }
      free(v4);
    }
    else
    {
      *(void *)(v2 + 56) = v151[0];
    }
LABEL_20:
    uint64_t v8 = v151[2];
    *(void *)(v2 + 64) = v151[1];
    *(void *)(v2 + 72) = v8;
    return v2;
  }
  if (a2[3] != 1 || *(_DWORD *)(a1 + 12) != 1)
  {
    if (*a2)
    {
      unsigned int v11 = a2[1];
      if (v11)
      {
        unsigned int v12 = a2[2];
        if (v12)
        {
          unsigned int v13 = v11 - 1;
          unsigned int v14 = (_WORD *)*((void *)a2 + 8);
          uint64_t v15 = 2 * a2[4];
          uint64_t v16 = 2 * *(unsigned int *)(a1 + 16);
          unsigned int v17 = v12 - 1;
          if (v17)
          {
            uint64_t v18 = *(unsigned int *)(a1 + 20);
            uint64_t v19 = a2[5];
            if (v13)
            {
              int v20 = 0;
              unint64_t v21 = v3 + 2;
              unint64_t v22 = v14 + 2;
              do
              {
                unsigned int v23 = v22;
                uint64_t v24 = v21;
                unsigned int v25 = v13;
                do
                {
                  *(v24 - 2) = *(v23 - 2);
                  *(v24 - 1) = *(v23 - 1);
                  *uint64_t v24 = *v23;
                  uint64_t v24 = (_WORD *)((char *)v24 + v16);
                  unsigned int v23 = (_WORD *)((char *)v23 + v15);
                  --v25;
                }
                while (v25);
                *(v24 - 2) = *(v23 - 2);
                *(v24 - 1) = *(v23 - 1);
                *uint64_t v24 = *v23;
                v14 += v19;
                v3 += v18;
                ++v20;
                v21 += v18;
                v22 += v19;
              }
              while (v20 != v17);
            }
            else
            {
              uint64_t v92 = 2 * v19;
              uint64_t v93 = 2 * v18;
              do
              {
                *BOOL v3 = *v14;
                v3[1] = v14[1];
                v3[2] = v14[2];
                unsigned int v14 = (_WORD *)((char *)v14 + v92);
                BOOL v3 = (_WORD *)((char *)v3 + v93);
                --v17;
              }
              while (v17);
            }
          }
          for (; v13; --v13)
          {
            *BOOL v3 = *v14;
            v3[1] = v14[1];
            v3[2] = v14[2];
            unsigned int v14 = (_WORD *)((char *)v14 + v15);
            BOOL v3 = (_WORD *)((char *)v3 + v16);
          }
          *BOOL v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
        }
      }
    }
    return v2;
  }
  uint64_t v26 = a2[4];
  uint64_t v27 = *(unsigned int *)(a1 + 16);
  uint64_t v28 = *a2;
  if (v26 != v27 || v26 != v28)
  {
    if (!v28) {
      return v2;
    }
    unsigned int v35 = a2[1];
    if (!v35) {
      return v2;
    }
    unsigned int v36 = a2[2];
    if (!v36) {
      return v2;
    }
    unsigned int v37 = v35 - 1;
    uint64_t v38 = *((void *)a2 + 8);
    uint64_t v39 = 2 * v27;
    unsigned int v138 = v36 - 1;
    uint64_t v144 = *a2;
    unsigned int v143 = v35 - 1;
    uint64_t v132 = a2[4];
    if (v36 == 1)
    {
      uint64_t v44 = *(void *)(a1 + 64);
LABEL_105:
      if (v37)
      {
        uint64_t v95 = 0;
        uint64_t v96 = 2 * v132;
        unint64_t v97 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v98 = (v97 + 1) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v99 = 2 * v98;
        uint64_t v100 = v44;
        uint64_t v101 = v38;
        while (1)
        {
          if (!v101)
          {
            BOOL v102 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            unsigned int v37 = v143;
            uint64_t v28 = v144;
            if (v102) {
              goto LABEL_133;
            }
          }
          unint64_t v103 = (_WORD *)v100;
          int v104 = (__int16 *)v101;
          if (v97 < 0xF) {
            goto LABEL_147;
          }
          unint64_t v103 = (_WORD *)v100;
          int v104 = (__int16 *)v101;
          if ((unint64_t)(v44 + v39 * v95 - (v38 + v96 * v95)) < 0x20) {
            goto LABEL_147;
          }
          uint64_t v105 = 0;
          unint64_t v103 = (_WORD *)(v100 + v99);
          int v104 = (__int16 *)(v101 + v99);
          unint64_t v106 = (v97 + 1) & 0xFFFFFFFFFFFFFFF0;
          do
          {
            uint64_t v107 = (_OWORD *)(v100 + v105);
            long long v108 = *(_OWORD *)(v101 + v105 + 16);
            *uint64_t v107 = *(_OWORD *)(v101 + v105);
            v107[1] = v108;
            v105 += 32;
            v106 -= 16;
          }
          while (v106);
          if (v97 + 1 != v98)
          {
LABEL_147:
            do
            {
              __int16 v109 = *v104++;
              *v103++ = v109;
            }
            while (v104 != (__int16 *)(v101 + 2 * v28));
          }
          v101 += v96;
          v100 += v39;
          if (++v95 == v37) {
            goto LABEL_118;
          }
        }
      }
      uint64_t v100 = v44;
      uint64_t v101 = v38;
LABEL_118:
      if (!v101)
      {
        BOOL v110 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
        uint64_t v28 = v144;
        if (v110) {
LABEL_133:
        }
          abort();
      }
      unint64_t v111 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
      if (v111 < 0xF || (unint64_t)(v100 - v101) < 0x20)
      {
        unint64_t v114 = (_WORD *)v100;
        BOOL v115 = (__int16 *)v101;
        uint64_t v2 = a1;
      }
      else
      {
        unint64_t v112 = v111 + 1;
        unint64_t v113 = (v111 + 1) & 0xFFFFFFFFFFFFFFF0;
        unint64_t v114 = (_WORD *)(v100 + 2 * v113);
        BOOL v115 = (__int16 *)(v101 + 2 * v113);
        BOOL v116 = (long long *)(v101 + 16);
        unint64_t v117 = (_OWORD *)(v100 + 16);
        unint64_t v118 = v113;
        do
        {
          long long v119 = *v116;
          *(v117 - 1) = *(v116 - 1);
          *unint64_t v117 = v119;
          v116 += 2;
          v117 += 2;
          v118 -= 16;
        }
        while (v118);
        uint64_t v2 = a1;
        if (v112 == v113) {
          return v2;
        }
      }
      do
      {
        __int16 v120 = *v115++;
        *v114++ = v120;
      }
      while (v115 != (__int16 *)(v101 + 2 * v28));
      return v2;
    }
    uint64_t v142 = 0;
    unint64_t v40 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v139 = 2 * a2[5];
    uint64_t v140 = 2 * *(unsigned int *)(a1 + 20);
    uint64_t v41 = 2 * v26;
    unint64_t v146 = v40 + 1;
    unint64_t v42 = (v40 + 1) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v43 = 2 * v42;
    uint64_t v135 = *((void *)a2 + 8);
    uint64_t v136 = *(void *)(a1 + 64);
    uint64_t v44 = v136;
    while (1)
    {
      uint64_t v141 = v38;
      uint64_t v45 = v44;
      uint64_t v46 = v38;
      if (v37)
      {
        uint64_t v47 = 0;
        uint64_t v45 = v44;
        uint64_t v46 = v141;
        do
        {
          if (!v46)
          {
            BOOL v48 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            unsigned int v37 = v143;
            uint64_t v28 = v144;
            if (v48) {
              goto LABEL_133;
            }
          }
          uint64_t v49 = (_WORD *)v45;
          uint64_t v50 = (__int16 *)v46;
          if (v40 < 0xF) {
            goto LABEL_148;
          }
          uint64_t v49 = (_WORD *)v45;
          uint64_t v50 = (__int16 *)v46;
          if ((unint64_t)(v136 + v140 * v142 + v39 * v47 - (v135 + v139 * v142 + v41 * v47)) < 0x20) {
            goto LABEL_148;
          }
          uint64_t v51 = 0;
          uint64_t v49 = (_WORD *)(v45 + v43);
          uint64_t v50 = (__int16 *)(v46 + v43);
          unint64_t v52 = (v40 + 1) & 0xFFFFFFFFFFFFFFF0;
          do
          {
            int v53 = (_OWORD *)(v45 + v51);
            long long v54 = *(_OWORD *)(v46 + v51 + 16);
            *int v53 = *(_OWORD *)(v46 + v51);
            v53[1] = v54;
            v51 += 32;
            v52 -= 16;
          }
          while (v52);
          if (v146 != v42)
          {
LABEL_148:
            do
            {
              __int16 v55 = *v50++;
              *v49++ = v55;
            }
            while (v50 != (__int16 *)(v46 + 2 * v28));
          }
          v46 += v41;
          v45 += v39;
        }
        while (++v47 != v37);
      }
      if (!v46)
      {
        BOOL v56 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
        unsigned int v37 = v143;
        uint64_t v28 = v144;
        if (v56) {
          goto LABEL_133;
        }
      }
      if (v40 < 0xF || (unint64_t)(v45 - v46) < 0x20)
      {
        long long v57 = (_WORD *)v45;
        long long v58 = (__int16 *)v46;
      }
      else
      {
        long long v57 = (_WORD *)(v45 + v43);
        long long v58 = (__int16 *)(v46 + v43);
        uint64_t v59 = (long long *)(v46 + 16);
        unint64_t v60 = (_OWORD *)(v45 + 16);
        unint64_t v61 = (v40 + 1) & 0xFFFFFFFFFFFFFFF0;
        do
        {
          long long v62 = *v59;
          *(v60 - 1) = *(v59 - 1);
          *unint64_t v60 = v62;
          v59 += 2;
          v60 += 2;
          v61 -= 16;
        }
        while (v61);
        if (v146 == v42) {
          goto LABEL_49;
        }
      }
      do
      {
        __int16 v63 = *v58++;
        *v57++ = v63;
      }
      while (v58 != (__int16 *)(v46 + 2 * v28));
LABEL_49:
      uint64_t v38 = v141 + v139;
      v44 += v140;
      if (++v142 == v138) {
        goto LABEL_105;
      }
    }
  }
  uint64_t v29 = a2[5];
  uint64_t v30 = *(unsigned int *)(a1 + 20);
  unsigned int v31 = a2[1];
  uint64_t v32 = v31 * v26;
  if (v29 == v30 && v29 == v32)
  {
    uint64_t v33 = a2[2] * v29;
    uint64_t v34 = *((void *)a2 + 8);
    if (!v33 || v34)
    {
      if (!v33) {
        return v2;
      }
    }
    else
    {
      if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        goto LABEL_133;
      }
      BOOL v3 = *(_WORD **)(v2 + 64);
    }
    unint64_t v83 = (v33 - 1) & 0x7FFFFFFFFFFFFFFFLL;
    if (v83 < 0xF || (unint64_t)v3 - v34 < 0x20)
    {
      uint64_t v86 = v3;
      float32x4_t v87 = (__int16 *)v34;
    }
    else
    {
      unint64_t v84 = v83 + 1;
      unint64_t v85 = (v83 + 1) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v86 = &v3[v85];
      float32x4_t v87 = (__int16 *)(v34 + 2 * v85);
      int v88 = (long long *)(v34 + 16);
      uint64_t v89 = v3 + 8;
      unint64_t v90 = v85;
      do
      {
        long long v91 = *v88;
        *(v89 - 1) = *(v88 - 1);
        *uint64_t v89 = v91;
        v88 += 2;
        v89 += 2;
        v90 -= 16;
      }
      while (v90);
      if (v84 == v85) {
        return v2;
      }
    }
    do
    {
      __int16 v94 = *v87++;
      *v86++ = v94;
    }
    while (v87 != (__int16 *)(v34 + 2 * v33));
    return v2;
  }
  if (v26)
  {
    if (v31)
    {
      unsigned int v64 = a2[2];
      if (v64)
      {
        uint64_t v65 = *((void *)a2 + 8);
        unsigned int v66 = v64 - 1;
        uint64_t v145 = v32;
        if (v64 == 1)
        {
          uint64_t v134 = a1;
          uint64_t v70 = *(void *)(a1 + 64);
          uint64_t v74 = *((void *)a2 + 8);
LABEL_130:
          if (!v32 || v74)
          {
            uint64_t v2 = v134;
            if (!v32) {
              return v2;
            }
          }
          else
          {
            BOOL v121 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            uint64_t v32 = v145;
            uint64_t v2 = v134;
            if (v121) {
              goto LABEL_133;
            }
          }
          unint64_t v122 = (v32 - 1) & 0x7FFFFFFFFFFFFFFFLL;
          if (v122 < 0xF || (unint64_t)(v70 - v74) < 0x20)
          {
            uint64_t v125 = (_WORD *)v70;
            unint64_t v126 = (__int16 *)v74;
          }
          else
          {
            unint64_t v123 = v122 + 1;
            unint64_t v124 = (v122 + 1) & 0xFFFFFFFFFFFFFFF0;
            uint64_t v125 = (_WORD *)(v70 + 2 * v124);
            unint64_t v126 = (__int16 *)(v74 + 2 * v124);
            uint64_t v127 = (long long *)(v74 + 16);
            unint64_t v128 = (_OWORD *)(v70 + 16);
            unint64_t v129 = v124;
            do
            {
              long long v130 = *v127;
              *(v128 - 1) = *(v127 - 1);
              *unint64_t v128 = v130;
              v127 += 2;
              v128 += 2;
              v129 -= 16;
            }
            while (v129);
            if (v123 == v124) {
              return v2;
            }
          }
          do
          {
            __int16 v131 = *v126++;
            *v125++ = v131;
          }
          while (v126 != (__int16 *)(v74 + 2 * v32));
          return v2;
        }
        if (v32)
        {
          uint64_t v134 = a1;
          uint64_t v67 = 0;
          uint64_t v68 = 2 * v30;
          uint64_t v69 = 2 * v29;
          uint64_t v70 = *(void *)(a1 + 64);
          unint64_t v71 = (v32 - 1) & 0x7FFFFFFFFFFFFFFFLL;
          unint64_t v72 = (v71 + 1) & 0xFFFFFFFFFFFFFFF0;
          uint64_t v73 = 2 * v72;
          uint64_t v137 = v70;
          uint64_t v74 = *((void *)a2 + 8);
          while (1)
          {
            if (!v74)
            {
              BOOL v75 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
              uint64_t v32 = v145;
              if (v75) {
                goto LABEL_133;
              }
            }
            unint64_t v76 = (_WORD *)v70;
            int v77 = (__int16 *)v74;
            if (v71 < 0xF) {
              goto LABEL_149;
            }
            unint64_t v76 = (_WORD *)v70;
            int v77 = (__int16 *)v74;
            if ((unint64_t)(v137 + v68 * v67 - (v65 + v69 * v67)) < 0x20) {
              goto LABEL_149;
            }
            uint64_t v78 = 0;
            unint64_t v76 = (_WORD *)(v70 + v73);
            int v77 = (__int16 *)(v74 + v73);
            unint64_t v79 = (v71 + 1) & 0xFFFFFFFFFFFFFFF0;
            do
            {
              uint64_t v80 = (_OWORD *)(v70 + v78);
              long long v81 = *(_OWORD *)(v74 + v78 + 16);
              *uint64_t v80 = *(_OWORD *)(v74 + v78);
              v80[1] = v81;
              v78 += 32;
              v79 -= 16;
            }
            while (v79);
            if (v71 + 1 != v72)
            {
LABEL_149:
              do
              {
                __int16 v82 = *v77++;
                *v76++ = v82;
              }
              while (v77 != (__int16 *)(v74 + 2 * v32));
            }
            v74 += v69;
            v70 += v68;
            if (++v67 == v66) {
              goto LABEL_130;
            }
          }
        }
      }
    }
  }
  return v2;
}

void sub_21B96F250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_21B951594((uint64_t)va);
  _Unwind_Resume(a1);
}

__int16 sub_21B96F264@<H0>(uint64_t a1@<X0>, uint64_t a2@<X1>)
{
  if (*(_DWORD *)(a1 + 20) != 1 || *(_DWORD *)(a2 + 20) != 1)
  {
    int v4 = *(_DWORD *)(a1 + 12);
    int v5 = *(_DWORD *)(a1 + 16);
    if (*(_DWORD *)(a1 + 8)) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6 && v5 != 0)
    {
      int v8 = v4 - 1;
      unsigned int v9 = *(_WORD **)a1;
      unsigned int v10 = *(_WORD **)a2;
      uint64_t v11 = 2 * *(unsigned int *)(a1 + 24);
      uint64_t v12 = 2 * *(unsigned int *)(a2 + 24);
      int v13 = v5 - 1;
      if (v13)
      {
        uint64_t v14 = *(unsigned int *)(a2 + 28);
        uint64_t v15 = *(unsigned int *)(a1 + 28);
        if (v8)
        {
          int v16 = 0;
          unsigned int v17 = v10 + 2;
          uint64_t v18 = v9 + 2;
          do
          {
            uint64_t v19 = v18;
            int v20 = v17;
            int v21 = v8;
            do
            {
              *(v20 - 2) = *(v19 - 2);
              *(v20 - 1) = *(v19 - 1);
              *int v20 = *v19;
              int v20 = (_WORD *)((char *)v20 + v12);
              uint64_t v19 = (_WORD *)((char *)v19 + v11);
              --v21;
            }
            while (v21);
            *(v20 - 2) = *(v19 - 2);
            *(v20 - 1) = *(v19 - 1);
            *int v20 = *v19;
            v9 += v15;
            v10 += v14;
            ++v16;
            v17 += v14;
            v18 += v15;
          }
          while (v16 != v13);
        }
        else
        {
          uint64_t v108 = 2 * v15;
          uint64_t v109 = 2 * v14;
          do
          {
            *unsigned int v10 = *v9;
            v10[1] = v9[1];
            v10[2] = v9[2];
            unsigned int v9 = (_WORD *)((char *)v9 + v108);
            unsigned int v10 = (_WORD *)((char *)v10 + v109);
            --v13;
          }
          while (v13);
        }
      }
      for (; v8; --v8)
      {
        *unsigned int v10 = *v9;
        v10[1] = v9[1];
        v10[2] = v9[2];
        unsigned int v9 = (_WORD *)((char *)v9 + v11);
        unsigned int v10 = (_WORD *)((char *)v10 + v12);
      }
      *unsigned int v10 = *v9;
      v10[1] = v9[1];
      LOWORD(v86) = v9[2];
      v10[2] = v86;
    }
    return v86;
  }
  uint64_t v22 = *(unsigned int *)(a1 + 24);
  uint64_t v23 = *(unsigned int *)(a2 + 24);
  if (v22 != v23)
  {
    unsigned int v24 = *(_DWORD *)(a1 + 8);
LABEL_30:
    if (!v24) {
      return v86;
    }
    int v32 = *(_DWORD *)(a1 + 12);
    if (!v32) {
      return v86;
    }
    int v33 = *(_DWORD *)(a1 + 16);
    if (!v33) {
      return v86;
    }
    int v34 = v32 - 1;
    unsigned int v35 = *(_WORD **)a1;
    unsigned int v36 = *(_WORD **)a2;
    uint64_t v37 = 2 * v23;
    uint64_t v38 = v24;
    int v136 = v33 - 1;
    uint64_t v143 = v24;
    int v141 = v32 - 1;
    uint64_t v133 = *(unsigned int *)(a1 + 24);
    if (v33 == 1)
    {
LABEL_59:
      if (v34)
      {
        uint64_t v62 = 0;
        uint64_t v63 = 2 * v133;
        unint64_t v64 = (v38 - 1) & 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v65 = (v64 + 1) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v66 = v65;
        uint64_t v67 = v36;
        uint64_t v68 = v35;
        while (1)
        {
          if (!v68)
          {
            BOOL v69 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            int v34 = v141;
            uint64_t v38 = v143;
            if (v69) {
              goto LABEL_119;
            }
          }
          uint64_t v70 = v67;
          unint64_t v71 = v68;
          if (v64 < 0xF) {
            goto LABEL_132;
          }
          uint64_t v70 = v67;
          unint64_t v71 = v68;
          if ((unint64_t)((char *)v36 + v37 * v62 - ((char *)v35 + v63 * v62)) < 0x20) {
            goto LABEL_132;
          }
          uint64_t v72 = 0;
          uint64_t v70 = &v67[v66];
          unint64_t v71 = &v68[v66];
          unint64_t v73 = (v64 + 1) & 0xFFFFFFFFFFFFFFF0;
          do
          {
            uint64_t v74 = &v67[v72];
            long long v75 = *(_OWORD *)&v68[v72 + 8];
            _OWORD *v74 = *(_OWORD *)&v68[v72];
            v74[1] = v75;
            v72 += 16;
            v73 -= 16;
          }
          while (v73);
          if (v64 + 1 != v65)
          {
LABEL_132:
            do
            {
              __int16 v76 = *v71++;
              *v70++ = v76;
            }
            while (v71 != &v68[v38]);
          }
          uint64_t v68 = (_WORD *)((char *)v68 + v63);
          uint64_t v67 = (_WORD *)((char *)v67 + v37);
          if (++v62 == v34) {
            goto LABEL_72;
          }
        }
      }
      uint64_t v67 = v36;
      uint64_t v68 = v35;
LABEL_72:
      if (!v68)
      {
        BOOL v77 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
        uint64_t v38 = v143;
        if (v77) {
LABEL_119:
        }
          abort();
      }
      unint64_t v78 = (v38 - 1) & 0x7FFFFFFFFFFFFFFFLL;
      if (v78 < 0xF || (unint64_t)((char *)v67 - (char *)v68) < 0x20)
      {
        long long v81 = v67;
        __int16 v82 = v68;
      }
      else
      {
        unint64_t v79 = v78 + 1;
        unint64_t v80 = (v78 + 1) & 0xFFFFFFFFFFFFFFF0;
        long long v81 = &v67[v80];
        __int16 v82 = &v68[v80];
        unint64_t v83 = (long long *)(v68 + 8);
        unint64_t v84 = v67 + 8;
        unint64_t v85 = v80;
        do
        {
          long long v86 = *(v83 - 1);
          long long v87 = *v83;
          *(v84 - 1) = v86;
          *unint64_t v84 = v87;
          v83 += 2;
          v84 += 2;
          v85 -= 16;
        }
        while (v85);
        if (v79 == v80) {
          return v86;
        }
      }
      do
      {
        __int16 v88 = *v82++;
        LOWORD(v86) = v88;
        *v81++ = v88;
      }
      while (v82 != &v68[v38]);
      return v86;
    }
    uint64_t v140 = 0;
    unint64_t v39 = (v24 - 1) & 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v137 = 2 * *(unsigned int *)(a1 + 28);
    uint64_t v138 = 2 * *(unsigned int *)(a2 + 28);
    uint64_t v40 = 2 * v22;
    unint64_t v145 = v39 + 1;
    unint64_t v41 = (v39 + 1) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v42 = v41;
    uint64_t v134 = *(_WORD **)a2;
    uint64_t v135 = *(_WORD **)a1;
    while (1)
    {
      uint64_t v139 = v36;
      uint64_t v43 = v36;
      uint64_t v44 = v35;
      if (v34)
      {
        uint64_t v45 = 0;
        uint64_t v43 = v139;
        uint64_t v44 = v35;
        do
        {
          if (!v44)
          {
            BOOL v46 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            int v34 = v141;
            uint64_t v38 = v143;
            if (v46) {
              goto LABEL_119;
            }
          }
          uint64_t v47 = v43;
          BOOL v48 = v44;
          if (v39 < 0xF) {
            goto LABEL_133;
          }
          uint64_t v47 = v43;
          BOOL v48 = v44;
          if ((unint64_t)((char *)v134 + v138 * v140 + v37 * v45 - ((char *)v135 + v137 * v140 + v40 * v45)) < 0x20) {
            goto LABEL_133;
          }
          uint64_t v49 = 0;
          uint64_t v47 = &v43[v42];
          BOOL v48 = &v44[v42];
          unint64_t v50 = (v39 + 1) & 0xFFFFFFFFFFFFFFF0;
          do
          {
            uint64_t v51 = &v43[v49];
            long long v52 = *(_OWORD *)&v44[v49 + 8];
            _OWORD *v51 = *(_OWORD *)&v44[v49];
            v51[1] = v52;
            v49 += 16;
            v50 -= 16;
          }
          while (v50);
          if (v145 != v41)
          {
LABEL_133:
            do
            {
              __int16 v53 = *v48++;
              *v47++ = v53;
            }
            while (v48 != &v44[v38]);
          }
          uint64_t v44 = (_WORD *)((char *)v44 + v40);
          uint64_t v43 = (_WORD *)((char *)v43 + v37);
        }
        while (++v45 != v34);
      }
      if (!v44)
      {
        BOOL v54 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
        int v34 = v141;
        uint64_t v38 = v143;
        if (v54) {
          goto LABEL_119;
        }
      }
      if (v39 < 0xF || (unint64_t)((char *)v43 - (char *)v44) < 0x20)
      {
        __int16 v55 = v43;
        BOOL v56 = v44;
      }
      else
      {
        __int16 v55 = &v43[v42];
        BOOL v56 = &v44[v42];
        long long v57 = (long long *)(v44 + 8);
        long long v58 = v43 + 8;
        unint64_t v59 = (v39 + 1) & 0xFFFFFFFFFFFFFFF0;
        do
        {
          long long v60 = *v57;
          *(v58 - 1) = *(v57 - 1);
          *long long v58 = v60;
          v57 += 2;
          v58 += 2;
          v59 -= 16;
        }
        while (v59);
        if (v145 == v41) {
          goto LABEL_35;
        }
      }
      do
      {
        __int16 v61 = *v56++;
        *v55++ = v61;
      }
      while (v56 != &v44[v38]);
LABEL_35:
      unsigned int v35 = (_WORD *)((char *)v35 + v137);
      unsigned int v36 = &v139[(unint64_t)v138 / 2];
      if (++v140 == v136) {
        goto LABEL_59;
      }
    }
  }
  unsigned int v24 = *(_DWORD *)(a1 + 8);
  if (v22 != v24) {
    goto LABEL_30;
  }
  uint64_t v25 = *(unsigned int *)(a1 + 28);
  uint64_t v26 = *(unsigned int *)(a2 + 28);
  int v27 = *(_DWORD *)(a1 + 12);
  uint64_t v28 = (v27 * v22);
  if (v25 == v26 && v25 == v28)
  {
    uint64_t v29 = (v25 * *(_DWORD *)(a1 + 16));
    uint64_t v30 = *(_WORD **)a1;
    if (v29) {
      BOOL v31 = v30 == 0;
    }
    else {
      BOOL v31 = 0;
    }
    if (v31)
    {
      if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        goto LABEL_119;
      }
    }
    else if (!v29)
    {
      return v86;
    }
    BOOL v110 = *(_WORD **)a2;
    unint64_t v111 = (v29 - 1) & 0x7FFFFFFFFFFFFFFFLL;
    if (v111 < 0xF)
    {
      unint64_t v112 = v30;
    }
    else
    {
      unint64_t v112 = v30;
      if ((unint64_t)((char *)v110 - (char *)v30) >= 0x20)
      {
        unint64_t v113 = v111 + 1;
        unint64_t v114 = v113 & 0xFFFFFFFFFFFFFFF0;
        BOOL v115 = &v110[v114];
        unint64_t v112 = &v30[v114];
        BOOL v116 = (long long *)(v30 + 8);
        unint64_t v117 = v110 + 8;
        unint64_t v118 = v113 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          long long v86 = *(v116 - 1);
          long long v119 = *v116;
          *(v117 - 1) = v86;
          *unint64_t v117 = v119;
          v116 += 2;
          v117 += 2;
          v118 -= 16;
        }
        while (v118);
        BOOL v110 = v115;
        if (v113 == (v113 & 0xFFFFFFFFFFFFFFF0)) {
          return v86;
        }
      }
    }
    do
    {
      __int16 v120 = *v112++;
      LOWORD(v86) = v120;
      *v110++ = v120;
    }
    while (v112 != &v30[v29]);
    return v86;
  }
  if (v22)
  {
    if (v27)
    {
      int v89 = *(_DWORD *)(a1 + 16);
      if (v89)
      {
        unint64_t v90 = *(_WORD **)a1;
        long long v91 = *(_WORD **)a2;
        int v92 = v89 - 1;
        uint64_t v142 = v28;
        if (v89 == 1)
        {
          unint64_t v98 = *(_WORD **)a2;
          uint64_t v99 = *(_WORD **)a1;
LABEL_116:
          if (!v28 || v99)
          {
            if (!v28) {
              return v86;
            }
          }
          else
          {
            BOOL v121 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            uint64_t v28 = v142;
            if (v121) {
              goto LABEL_119;
            }
          }
          unint64_t v122 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
          if (v122 < 0xF || (unint64_t)((char *)v98 - (char *)v99) < 0x20)
          {
            uint64_t v125 = v98;
            unint64_t v126 = v99;
          }
          else
          {
            unint64_t v123 = v122 + 1;
            unint64_t v124 = (v122 + 1) & 0xFFFFFFFFFFFFFFF0;
            uint64_t v125 = &v98[v124];
            unint64_t v126 = &v99[v124];
            uint64_t v127 = (long long *)(v99 + 8);
            unint64_t v128 = v98 + 8;
            unint64_t v129 = v124;
            do
            {
              long long v86 = *(v127 - 1);
              long long v130 = *v127;
              *(v128 - 1) = v86;
              *unint64_t v128 = v130;
              v127 += 2;
              v128 += 2;
              v129 -= 16;
            }
            while (v129);
            if (v123 == v124) {
              return v86;
            }
          }
          do
          {
            __int16 v131 = *v126++;
            LOWORD(v86) = v131;
            *v125++ = v131;
          }
          while (v126 != &v99[v28]);
          return v86;
        }
        if (v28)
        {
          uint64_t v93 = 0;
          uint64_t v94 = 2 * v26;
          uint64_t v95 = 2 * v25;
          unint64_t v96 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
          unint64_t v97 = (v96 + 1) & 0xFFFFFFFFFFFFFFF0;
          uint64_t v144 = v97;
          unint64_t v98 = *(_WORD **)a2;
          uint64_t v99 = *(_WORD **)a1;
          while (1)
          {
            if (!v99)
            {
              BOOL v100 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
              uint64_t v28 = v142;
              if (v100) {
                goto LABEL_119;
              }
            }
            uint64_t v101 = v98;
            BOOL v102 = v99;
            if (v96 < 0xF) {
              goto LABEL_134;
            }
            uint64_t v101 = v98;
            BOOL v102 = v99;
            if ((unint64_t)((char *)v91 + v94 * v93 - ((char *)v90 + v95 * v93)) < 0x20) {
              goto LABEL_134;
            }
            uint64_t v103 = 0;
            uint64_t v101 = &v98[v144];
            BOOL v102 = &v99[v144];
            unint64_t v104 = (v96 + 1) & 0xFFFFFFFFFFFFFFF0;
            do
            {
              uint64_t v105 = &v98[v103];
              long long v86 = *(_OWORD *)&v99[v103];
              long long v106 = *(_OWORD *)&v99[v103 + 8];
              *uint64_t v105 = v86;
              v105[1] = v106;
              v103 += 16;
              v104 -= 16;
            }
            while (v104);
            if (v96 + 1 != v97)
            {
LABEL_134:
              do
              {
                __int16 v107 = *v102++;
                LOWORD(v86) = v107;
                *v101++ = v107;
              }
              while (v102 != &v99[v28]);
            }
            uint64_t v99 = (_WORD *)((char *)v99 + v95);
            unint64_t v98 = (_WORD *)((char *)v98 + v94);
            if (++v93 == v92) {
              goto LABEL_116;
            }
          }
        }
      }
    }
  }
  return v86;
}

uint64_t sub_21B96FB70(uint64_t a1, unsigned int *a2)
{
  BOOL v3 = *(_DWORD **)(a1 + 64);
  if (v3 && *(void *)(a2 + 1) == *(void *)(a1 + 4) && *((void *)a2 + 2) == *(void *)(a1 + 16))
  {
    if (a2[3] != 1 || *(_DWORD *)(a1 + 12) != 1)
    {
      if (!*a2) {
        return a1;
      }
      unsigned int v9 = a2[1];
      if (!v9) {
        return a1;
      }
      unsigned int v10 = a2[2];
      if (!v10) {
        return a1;
      }
      unsigned int v11 = v9 - 1;
      uint64_t v12 = a2[4];
      uint64_t v13 = *(unsigned int *)(a1 + 16);
      uint64_t v14 = (_DWORD *)*((void *)a2 + 8);
      unsigned int v15 = v10 - 1;
      if (v15)
      {
        uint64_t v16 = *(unsigned int *)(a1 + 20);
        uint64_t v17 = a2[5];
        if (!v11)
        {
          do
          {
            *BOOL v3 = *v14;
            v3[1] = v14[1];
            v3[2] = v14[2];
            v14 += v17;
            v3 += v16;
            --v15;
          }
          while (v15);
LABEL_59:
          *BOOL v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
          return a1;
        }
        int v18 = 0;
        uint64_t v19 = v3 + 2;
        int v20 = v14 + 2;
        do
        {
          int v21 = v20;
          uint64_t v22 = v19;
          unsigned int v23 = v11;
          do
          {
            *(v22 - 2) = *(v21 - 2);
            *(v22 - 1) = *(v21 - 1);
            *uint64_t v22 = *v21;
            v22 += v13;
            v21 += v12;
            --v23;
          }
          while (v23);
          *(v22 - 2) = *(v21 - 2);
          *(v22 - 1) = *(v21 - 1);
          *uint64_t v22 = *v21;
          v14 += v17;
          v3 += v16;
          ++v18;
          v19 += v16;
          v20 += v17;
        }
        while (v18 != v15);
      }
      for (; v11; --v11)
      {
        *BOOL v3 = *v14;
        v3[1] = v14[1];
        v3[2] = v14[2];
        v14 += v12;
        v3 += v13;
      }
      goto LABEL_59;
    }
    uint64_t v24 = a2[4];
    uint64_t v25 = *(unsigned int *)(a1 + 16);
    uint64_t v26 = *a2;
    if (v24 == v25 && v24 == v26)
    {
      uint64_t v27 = a2[5];
      uint64_t v28 = *(unsigned int *)(a1 + 20);
      unsigned int v29 = a2[1];
      uint64_t v30 = v29 * v24;
      if (v27 == v28 && v27 == v30)
      {
        uint64_t v31 = v27 * a2[2];
        int v32 = (const void *)*((void *)a2 + 8);
        if (!v31 || v32)
        {
          if (!v31) {
            return a1;
          }
LABEL_57:
          memmove(v3, v32, 4 * v31);
          return a1;
        }
        if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          BOOL v3 = *(_DWORD **)(a1 + 64);
          goto LABEL_57;
        }
LABEL_79:
        abort();
      }
      if (!v24) {
        return a1;
      }
      if (!v29) {
        return a1;
      }
      unsigned int v43 = a2[2];
      if (!v43) {
        return a1;
      }
      uint64_t v44 = (char *)*((void *)a2 + 8);
      size_t v37 = 4 * v30;
      unsigned int v45 = v43 - 1;
      if (v43 != 1)
      {
        if (!v30) {
          return a1;
        }
        uint64_t v46 = 4 * v27;
        uint64_t v47 = 4 * v28;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, 4 * v30);
          v44 += v46;
          BOOL v3 = (_DWORD *)((char *)v3 + v47);
          if (!--v45) {
            goto LABEL_60;
          }
        }
        goto LABEL_79;
      }
LABEL_60:
      if (!v30 || v44)
      {
        if (!v30) {
          return a1;
        }
        goto LABEL_74;
      }
    }
    else
    {
      if (!v26) {
        return a1;
      }
      unsigned int v33 = a2[1];
      if (!v33) {
        return a1;
      }
      unsigned int v34 = a2[2];
      if (!v34) {
        return a1;
      }
      unsigned int v35 = v33 - 1;
      unsigned int v36 = (char *)*((void *)a2 + 8);
      size_t v37 = 4 * v26;
      unsigned int v55 = v34 - 1;
      if (v34 != 1)
      {
        if (v33 == 1)
        {
          uint64_t v39 = a2[4];
          uint64_t v49 = 4 * a2[5];
          uint64_t v50 = 4 * *(unsigned int *)(a1 + 20);
          while (v36
               || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            memmove(v3, v36, v37);
            v36 += v49;
            BOOL v3 = (_DWORD *)((char *)v3 + v50);
            if (!--v55) {
              goto LABEL_65;
            }
          }
        }
        else
        {
          int v38 = 0;
          uint64_t v39 = a2[4];
          uint64_t v40 = 4 * v24;
          uint64_t v51 = a2[5];
          uint64_t v52 = *(unsigned int *)(a1 + 20);
          while (1)
          {
            int v53 = v38;
            int v41 = 0;
            BOOL v54 = v36;
            uint64_t v42 = (char *)v3;
            do
            {
              while (v36)
              {
                memmove(v42, v36, v37);
                v36 += 4 * v39;
                v42 += 4 * v25;
                if (++v41 == v35) {
                  goto LABEL_38;
                }
              }
              if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
              {
                goto LABEL_79;
              }
              memcpy(v42, 0, v37);
              v42 += 4 * v25;
              ++v41;
              unsigned int v36 = (char *)v40;
            }
            while (v41 != v35);
            unsigned int v36 = (char *)v40;
            if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
            {
              break;
            }
LABEL_38:
            memmove(v42, v36, v37);
            unsigned int v36 = &v54[4 * v51];
            v3 += v52;
            int v38 = v53 + 1;
            if (v53 + 1 == v55) {
              goto LABEL_65;
            }
          }
        }
        goto LABEL_79;
      }
      uint64_t v39 = a2[4];
LABEL_65:
      if (v35)
      {
        uint64_t v48 = 4 * v39;
        uint64_t v44 = v36;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, v37);
          v44 += v48;
          v3 += v25;
          if (!--v35) {
            goto LABEL_72;
          }
        }
        goto LABEL_79;
      }
      uint64_t v44 = v36;
LABEL_72:
      if (v44)
      {
LABEL_74:
        memmove(v3, v44, v37);
        return a1;
      }
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_79;
    }
    goto LABEL_74;
  }
  long long v56 = *(_OWORD *)a2;
  long long v57 = *((_OWORD *)a2 + 1);
  long long v58 = *((_OWORD *)a2 + 2);
  uint64_t v59 = *((void *)a2 + 6);
  sub_21B9664A8((uint64_t)v60, (uint64_t)(a2 + 14));
  *(_OWORD *)a1 = v56;
  *(_OWORD *)(a1 + 16) = v57;
  *(_OWORD *)(a1 + 32) = v58;
  *(_OWORD *)(a1 + 80) = v61;
  *(void *)(a1 + 96) = v62;
  uint64_t v4 = v60[0];
  *(void *)(a1 + 48) = v59;
  *(void *)(a1 + 56) = v4;
  int v5 = *(void **)(a1 + 64);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = v60[2];
  *(void *)(a1 + 64) = v60[1];
  *(void *)(a1 + 72) = v6;
  return a1;
}

_DWORD *sub_21B9701C0(_DWORD *result, char **a2)
{
  uint64_t v3 = result[6];
  uint64_t v4 = *((unsigned int *)a2 + 6);
  if (v3 != v4)
  {
    unsigned int v5 = result[2];
LABEL_18:
    int v18 = result[3];
    int v17 = result[4];
    if (v5) {
      BOOL v19 = v18 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (v19 || v17 == 0) {
      return result;
    }
    int v21 = v18 - 1;
    uint64_t v22 = *(char **)result;
    unsigned int v23 = *a2;
    size_t v24 = 4 * v5;
    int v40 = v17 - 1;
    if (v17 == 1)
    {
LABEL_49:
      if (!v21)
      {
LABEL_55:
        if (!v22
          && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          goto LABEL_63;
        }
        unsigned int v34 = v23;
        unsigned int v35 = v22;
        size_t v36 = v24;
LABEL_66:
        return memmove(v34, v35, v36);
      }
      while (v22
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v23, v22, v24);
        v22 += 4 * v3;
        v23 += 4 * v4;
        if (!--v21) {
          goto LABEL_55;
        }
      }
    }
    else if (v18 == 1)
    {
      uint64_t v32 = 4 * result[7];
      uint64_t v33 = 4 * *((unsigned int *)a2 + 7);
      while (v22
           || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        memmove(v23, v22, v24);
        v22 += v32;
        v23 += v33;
        if (!--v40) {
          goto LABEL_49;
        }
      }
    }
    else
    {
      int v25 = 0;
      uint64_t v37 = result[7];
      uint64_t v38 = *((unsigned int *)a2 + 7);
      while (1)
      {
        int v39 = v25;
        int v26 = 0;
        uint64_t v27 = v22;
        uint64_t v28 = v23;
        do
        {
          while (v27)
          {
            memmove(v28, v27, v24);
            v27 += 4 * v3;
            v28 += 4 * v4;
            if (++v26 == v21) {
              goto LABEL_30;
            }
          }
          if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            goto LABEL_63;
          }
          memcpy(v28, 0, v24);
          v28 += 4 * v4;
          ++v26;
          uint64_t v27 = (char *)(4 * v3);
        }
        while (v26 != v21);
        uint64_t v27 = (char *)(4 * v3);
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          break;
        }
LABEL_30:
        memmove(v28, v27, v24);
        v22 += 4 * v37;
        v23 += 4 * v38;
        int v25 = v39 + 1;
        if (v39 + 1 == v40) {
          goto LABEL_49;
        }
      }
    }
LABEL_63:
    abort();
  }
  unsigned int v5 = result[2];
  if (v3 != result[5] * v5) {
    goto LABEL_18;
  }
  uint64_t v6 = result[7];
  uint64_t v7 = *((unsigned int *)a2 + 7);
  int v8 = result[3];
  if (v6 == v7 && v6 == v8 * v3)
  {
    uint64_t v29 = v8 * v5 * result[4];
    uint64_t v30 = *(const void **)result;
    if (v29) {
      BOOL v31 = v30 == 0;
    }
    else {
      BOOL v31 = 0;
    }
    if (v31)
    {
      if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        goto LABEL_63;
      }
    }
    else if (!v29)
    {
      return result;
    }
    unsigned int v34 = *a2;
    size_t v36 = 4 * v29;
    unsigned int v35 = v30;
    goto LABEL_66;
  }
  if (!v5) {
    return result;
  }
  if (!v8) {
    return result;
  }
  int v10 = result[4];
  if (!v10) {
    return result;
  }
  unsigned int v11 = *a2;
  uint64_t v12 = v8 * v5;
  uint64_t v13 = *(char **)result;
  int v14 = v10 - 1;
  if (v10 == 1)
  {
LABEL_60:
    if (!v12 || v13)
    {
      if (!v12) {
        return result;
      }
    }
    else if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_63;
    }
    unsigned int v34 = v11;
    unsigned int v35 = v13;
    size_t v36 = 4 * v12;
    goto LABEL_66;
  }
  if (v12)
  {
    uint64_t v15 = 4 * v6;
    uint64_t v16 = 4 * v7;
    while (v13
         || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      double result = memmove(v11, v13, 4 * v12);
      v13 += v15;
      v11 += v16;
      if (!--v14) {
        goto LABEL_60;
      }
    }
    goto LABEL_63;
  }
  return result;
}

uint64_t sub_21B970698(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 64);
  if (!v3 || *(void *)(a2 + 1) != *(void *)(a1 + 4) || *((void *)a2 + 2) != *(void *)(a1 + 16))
  {
    long long v44 = *(_OWORD *)a2;
    long long v45 = *((_OWORD *)a2 + 1);
    long long v46 = *((_OWORD *)a2 + 2);
    uint64_t v47 = *((void *)a2 + 6);
    sub_21B964FB4((uint64_t)v48, (uint64_t)(a2 + 14));
    *(_OWORD *)a1 = v44;
    *(_OWORD *)(a1 + 16) = v45;
    *(_OWORD *)(a1 + 32) = v46;
    *(_OWORD *)(a1 + 80) = v49;
    *(void *)(a1 + 96) = v50;
    uint64_t v4 = v48[0];
    *(void *)(a1 + 48) = v47;
    *(void *)(a1 + 56) = v4;
    unsigned int v5 = *(void **)(a1 + 64);
    if (v5) {
      free(v5);
    }
    uint64_t v6 = v48[2];
    *(void *)(a1 + 64) = v48[1];
    *(void *)(a1 + 72) = v6;
    return a1;
  }
  if (a2[3] == 1 && *(_DWORD *)(a1 + 12) == 1)
  {
    size_t v24 = (char *)a2[4];
    uint64_t v25 = *(unsigned int *)(a1 + 16);
    size_t v26 = *a2;
    if (v24 == v25 && v24 == v26)
    {
      uint64_t v27 = a2[5];
      uint64_t v28 = *(unsigned int *)(a1 + 20);
      unsigned int v29 = a2[1];
      size_t v26 = v29 * v24;
      if (v27 == v28 && v27 == v26)
      {
        size_t v26 = v27 * a2[2];
        uint64_t v30 = (char *)*((void *)a2 + 8);
        if (v26 && !v30)
        {
          if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            uint64_t v3 = *(unsigned char **)(a1 + 64);
LABEL_75:
            memmove(v3, v30, v26);
            return a1;
          }
LABEL_76:
          abort();
        }
LABEL_60:
        if (!v26) {
          return a1;
        }
        goto LABEL_75;
      }
      if (!v24) {
        return a1;
      }
      if (!v29) {
        return a1;
      }
      unsigned int v38 = a2[2];
      if (!v38) {
        return a1;
      }
      uint64_t v30 = (char *)*((void *)a2 + 8);
      unsigned int v39 = v38 - 1;
      if (v38 != 1)
      {
        if (!v26) {
          return a1;
        }
        while (v30
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v30, v26);
          v30 += v27;
          v3 += v28;
          if (!--v39) {
            goto LABEL_58;
          }
        }
        goto LABEL_76;
      }
LABEL_58:
      if (!v26 || v30) {
        goto LABEL_60;
      }
    }
    else
    {
      if (!v26) {
        return a1;
      }
      unsigned int v31 = a2[1];
      if (!v31) {
        return a1;
      }
      unsigned int v32 = a2[2];
      if (!v32) {
        return a1;
      }
      unsigned int v33 = v31 - 1;
      uint64_t v30 = (char *)*((void *)a2 + 8);
      unsigned int v43 = v32 - 1;
      if (v32 != 1)
      {
        uint64_t v41 = *(unsigned int *)(a1 + 20);
        uint64_t v40 = a2[5];
        if (v31 == 1)
        {
          while (v30
               || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            memmove(v3, v30, v26);
            v30 += v40;
            v3 += v41;
            if (!--v43) {
              goto LABEL_67;
            }
          }
        }
        else
        {
          int v34 = 0;
          while (1)
          {
            int v42 = v34;
            int v35 = 0;
            size_t v36 = v30;
            uint64_t v37 = v3;
            do
            {
              while (v36)
              {
                memmove(v37, v36, v26);
                size_t v36 = &v24[(void)v36];
                v37 += v25;
                if (++v35 == v33) {
                  goto LABEL_40;
                }
              }
              if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
              {
                goto LABEL_76;
              }
              memcpy(v37, 0, v26);
              v37 += v25;
              ++v35;
              size_t v36 = v24;
            }
            while (v35 != v33);
            size_t v36 = v24;
            if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
            {
              break;
            }
LABEL_40:
            memmove(v37, v36, v26);
            v30 += v40;
            v3 += v41;
            int v34 = v42 + 1;
            if (v42 + 1 == v43) {
              goto LABEL_67;
            }
          }
        }
        goto LABEL_76;
      }
LABEL_67:
      if (v33)
      {
        while (v30
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v30, v26);
          uint64_t v30 = &v24[(void)v30];
          v3 += v25;
          if (!--v33) {
            goto LABEL_73;
          }
        }
        goto LABEL_76;
      }
LABEL_73:
      if (v30) {
        goto LABEL_75;
      }
    }
    if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))goto LABEL_75; {
    goto LABEL_76;
    }
  }
  if (*a2)
  {
    unsigned int v9 = a2[1];
    if (v9)
    {
      unsigned int v10 = a2[2];
      if (v10)
      {
        unsigned int v11 = v9 - 1;
        uint64_t v12 = a2[4];
        uint64_t v13 = *(unsigned int *)(a1 + 16);
        int v14 = (unsigned char *)*((void *)a2 + 8);
        unsigned int v15 = v10 - 1;
        if (v15)
        {
          uint64_t v16 = *(unsigned int *)(a1 + 20);
          uint64_t v17 = a2[5];
          if (v11)
          {
            int v18 = 0;
            BOOL v19 = v3 + 3;
            int v20 = v14 + 1;
            do
            {
              int v21 = v20;
              uint64_t v22 = v19;
              unsigned int v23 = v11;
              do
              {
                *(v22 - 3) = *(v21 - 1);
                *(v22 - 2) = *v21;
                *(v22 - 1) = v21[1];
                *uint64_t v22 = v21[2];
                v22 += v13;
                v21 += v12;
                --v23;
              }
              while (v23);
              *(v22 - 3) = *(v21 - 1);
              *(v22 - 2) = *v21;
              *(v22 - 1) = v21[1];
              *uint64_t v22 = v21[2];
              v14 += v17;
              v3 += v16;
              ++v18;
              v19 += v16;
              v20 += v17;
            }
            while (v18 != v15);
          }
          else
          {
            do
            {
              *uint64_t v3 = *v14;
              v3[1] = v14[1];
              v3[2] = v14[2];
              v3[3] = v14[3];
              v14 += v17;
              v3 += v16;
              --v15;
            }
            while (v15);
          }
        }
        for (; v11; --v11)
        {
          *uint64_t v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
          v3[3] = v14[3];
          v14 += v12;
          v3 += v13;
        }
        *uint64_t v3 = *v14;
        v3[1] = v14[1];
        v3[2] = v14[2];
        v3[3] = v14[3];
      }
    }
  }
  return a1;
}

uint64_t sub_21B970CB0(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *(_WORD **)(a1 + 64);
  if (v3 && *(void *)(a2 + 1) == *(void *)(a1 + 4) && *((void *)a2 + 2) == *(void *)(a1 + 16))
  {
    if (a2[3] != 1 || *(_DWORD *)(a1 + 12) != 1)
    {
      if (!*a2) {
        return a1;
      }
      unsigned int v9 = a2[1];
      if (!v9) {
        return a1;
      }
      unsigned int v10 = a2[2];
      if (!v10) {
        return a1;
      }
      unsigned int v11 = v9 - 1;
      uint64_t v12 = a2[4];
      uint64_t v13 = *(unsigned int *)(a1 + 16);
      int v14 = (_WORD *)*((void *)a2 + 8);
      unsigned int v15 = v10 - 1;
      if (v15)
      {
        uint64_t v16 = *(unsigned int *)(a1 + 20);
        uint64_t v17 = a2[5];
        if (!v11)
        {
          do
          {
            *uint64_t v3 = *v14;
            v3[1] = v14[1];
            v3[2] = v14[2];
            v3[3] = v14[3];
            v14 += v17;
            v3 += v16;
            --v15;
          }
          while (v15);
LABEL_59:
          *uint64_t v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
          v3[3] = v14[3];
          return a1;
        }
        int v18 = 0;
        BOOL v19 = v3 + 2;
        int v20 = v14 + 2;
        do
        {
          int v21 = v20;
          uint64_t v22 = v19;
          unsigned int v23 = v11;
          do
          {
            *(v22 - 2) = *(v21 - 2);
            *(v22 - 1) = *(v21 - 1);
            *uint64_t v22 = *v21;
            v22[1] = v21[1];
            v22 += v13;
            v21 += v12;
            --v23;
          }
          while (v23);
          *(v22 - 2) = *(v21 - 2);
          *(v22 - 1) = *(v21 - 1);
          *uint64_t v22 = *v21;
          v22[1] = v21[1];
          v14 += v17;
          v3 += v16;
          ++v18;
          v19 += v16;
          v20 += v17;
        }
        while (v18 != v15);
      }
      for (; v11; --v11)
      {
        *uint64_t v3 = *v14;
        v3[1] = v14[1];
        v3[2] = v14[2];
        v3[3] = v14[3];
        v14 += v12;
        v3 += v13;
      }
      goto LABEL_59;
    }
    uint64_t v24 = a2[4];
    uint64_t v25 = *(unsigned int *)(a1 + 16);
    uint64_t v26 = *a2;
    if (v24 == v25 && v24 == v26)
    {
      uint64_t v27 = a2[5];
      uint64_t v28 = *(unsigned int *)(a1 + 20);
      unsigned int v29 = a2[1];
      uint64_t v30 = v29 * v24;
      if (v27 == v28 && v27 == v30)
      {
        uint64_t v31 = v27 * a2[2];
        unsigned int v32 = (const void *)*((void *)a2 + 8);
        if (!v31 || v32)
        {
          if (!v31) {
            return a1;
          }
LABEL_57:
          memmove(v3, v32, 2 * v31);
          return a1;
        }
        if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          uint64_t v3 = *(_WORD **)(a1 + 64);
          goto LABEL_57;
        }
LABEL_79:
        abort();
      }
      if (!v24) {
        return a1;
      }
      if (!v29) {
        return a1;
      }
      unsigned int v43 = a2[2];
      if (!v43) {
        return a1;
      }
      long long v44 = (char *)*((void *)a2 + 8);
      size_t v37 = 2 * v30;
      unsigned int v45 = v43 - 1;
      if (v43 != 1)
      {
        if (!v30) {
          return a1;
        }
        uint64_t v46 = 2 * v27;
        uint64_t v47 = 2 * v28;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, 2 * v30);
          v44 += v46;
          uint64_t v3 = (_WORD *)((char *)v3 + v47);
          if (!--v45) {
            goto LABEL_60;
          }
        }
        goto LABEL_79;
      }
LABEL_60:
      if (!v30 || v44)
      {
        if (!v30) {
          return a1;
        }
        goto LABEL_74;
      }
    }
    else
    {
      if (!v26) {
        return a1;
      }
      unsigned int v33 = a2[1];
      if (!v33) {
        return a1;
      }
      unsigned int v34 = a2[2];
      if (!v34) {
        return a1;
      }
      unsigned int v35 = v33 - 1;
      size_t v36 = (char *)*((void *)a2 + 8);
      size_t v37 = 2 * v26;
      unsigned int v55 = v34 - 1;
      if (v34 != 1)
      {
        if (v33 == 1)
        {
          uint64_t v39 = a2[4];
          uint64_t v49 = 2 * a2[5];
          uint64_t v50 = 2 * *(unsigned int *)(a1 + 20);
          while (v36
               || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            memmove(v3, v36, v37);
            v36 += v49;
            uint64_t v3 = (_WORD *)((char *)v3 + v50);
            if (!--v55) {
              goto LABEL_65;
            }
          }
        }
        else
        {
          int v38 = 0;
          uint64_t v39 = a2[4];
          uint64_t v40 = 2 * v24;
          uint64_t v51 = a2[5];
          uint64_t v52 = *(unsigned int *)(a1 + 20);
          while (1)
          {
            int v53 = v38;
            int v41 = 0;
            BOOL v54 = v36;
            int v42 = (char *)v3;
            do
            {
              while (v36)
              {
                memmove(v42, v36, v37);
                v36 += 2 * v39;
                v42 += 2 * v25;
                if (++v41 == v35) {
                  goto LABEL_38;
                }
              }
              if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
              {
                goto LABEL_79;
              }
              memcpy(v42, 0, v37);
              v42 += 2 * v25;
              ++v41;
              size_t v36 = (char *)v40;
            }
            while (v41 != v35);
            size_t v36 = (char *)v40;
            if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
            {
              break;
            }
LABEL_38:
            memmove(v42, v36, v37);
            size_t v36 = &v54[2 * v51];
            v3 += v52;
            int v38 = v53 + 1;
            if (v53 + 1 == v55) {
              goto LABEL_65;
            }
          }
        }
        goto LABEL_79;
      }
      uint64_t v39 = a2[4];
LABEL_65:
      if (v35)
      {
        uint64_t v48 = 2 * v39;
        long long v44 = v36;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, v37);
          v44 += v48;
          v3 += v25;
          if (!--v35) {
            goto LABEL_72;
          }
        }
        goto LABEL_79;
      }
      long long v44 = v36;
LABEL_72:
      if (v44)
      {
LABEL_74:
        memmove(v3, v44, v37);
        return a1;
      }
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_79;
    }
    goto LABEL_74;
  }
  long long v56 = *(_OWORD *)a2;
  long long v57 = *((_OWORD *)a2 + 1);
  long long v58 = *((_OWORD *)a2 + 2);
  uint64_t v59 = *((void *)a2 + 6);
  sub_21B965784((uint64_t)v60, (uint64_t)(a2 + 14));
  *(_OWORD *)a1 = v56;
  *(_OWORD *)(a1 + 16) = v57;
  *(_OWORD *)(a1 + 32) = v58;
  *(_OWORD *)(a1 + 80) = v61;
  *(void *)(a1 + 96) = v62;
  uint64_t v4 = v60[0];
  *(void *)(a1 + 48) = v59;
  *(void *)(a1 + 56) = v4;
  unsigned int v5 = *(void **)(a1 + 64);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = v60[2];
  *(void *)(a1 + 64) = v60[1];
  *(void *)(a1 + 72) = v6;
  return a1;
}

uint64_t sub_21B971328(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(_WORD **)(a1 + 64);
  if (!v3 || *(void *)(a2 + 1) != *(void *)(a1 + 4) || *((void *)a2 + 2) != *(void *)(a1 + 16))
  {
    long long v147 = *(_OWORD *)a2;
    long long v148 = *((_OWORD *)a2 + 1);
    long long v149 = *((_OWORD *)a2 + 2);
    uint64_t v150 = *((void *)a2 + 6);
    sub_21B966078((uint64_t)v151, (uint64_t)(a2 + 14));
    *(_OWORD *)uint64_t v2 = v147;
    *(_OWORD *)(v2 + 16) = v148;
    *(_OWORD *)(v2 + 32) = v149;
    *(void *)(v2 + 48) = v150;
    *(_OWORD *)(v2 + 80) = v152;
    *(void *)(v2 + 96) = v153;
    uint64_t v4 = *(void **)(v2 + 64);
    if (v4)
    {
      if (*(_DWORD *)(v2 + 88)) {
        BOOL v5 = *(_DWORD *)(v2 + 84) == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5 || *(_DWORD *)(v2 + 80) == 0) {
        int v7 = 0;
      }
      else {
        int v7 = *(_DWORD *)(v2 + 88);
      }
      if (v7 * (*(_DWORD *)(v2 + 100) >> 1) == -1)
      {
        if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/include/Essentials/Array/ArrayView.h", 983, (uint64_t)"total_size < std::numeric_limits<uint32_t>::max()", 49, (uint64_t)"Given data block is too big to be represented by uint32_t indexed ArrayView", 75, (void (*)(void **))sub_21B984AC4))
        {
          abort();
        }
        uint64_t v4 = *(void **)(v2 + 64);
        *(void *)(v2 + 56) = v151[0];
        if (!v4) {
          goto LABEL_20;
        }
      }
      else
      {
        *(void *)(v2 + 56) = v151[0];
      }
      free(v4);
    }
    else
    {
      *(void *)(v2 + 56) = v151[0];
    }
LABEL_20:
    uint64_t v8 = v151[2];
    *(void *)(v2 + 64) = v151[1];
    *(void *)(v2 + 72) = v8;
    return v2;
  }
  if (a2[3] != 1 || *(_DWORD *)(a1 + 12) != 1)
  {
    if (*a2)
    {
      unsigned int v11 = a2[1];
      if (v11)
      {
        unsigned int v12 = a2[2];
        if (v12)
        {
          unsigned int v13 = v11 - 1;
          int v14 = (_WORD *)*((void *)a2 + 8);
          uint64_t v15 = 2 * a2[4];
          uint64_t v16 = 2 * *(unsigned int *)(a1 + 16);
          unsigned int v17 = v12 - 1;
          if (v17)
          {
            uint64_t v18 = *(unsigned int *)(a1 + 20);
            uint64_t v19 = a2[5];
            if (v13)
            {
              int v20 = 0;
              int v21 = v3 + 2;
              uint64_t v22 = v14 + 2;
              do
              {
                unsigned int v23 = v22;
                uint64_t v24 = v21;
                unsigned int v25 = v13;
                do
                {
                  *(v24 - 2) = *(v23 - 2);
                  *(v24 - 1) = *(v23 - 1);
                  *uint64_t v24 = *v23;
                  v24[1] = v23[1];
                  uint64_t v24 = (_WORD *)((char *)v24 + v16);
                  unsigned int v23 = (_WORD *)((char *)v23 + v15);
                  --v25;
                }
                while (v25);
                *(v24 - 2) = *(v23 - 2);
                *(v24 - 1) = *(v23 - 1);
                *uint64_t v24 = *v23;
                v24[1] = v23[1];
                v14 += v19;
                v3 += v18;
                ++v20;
                v21 += v18;
                v22 += v19;
              }
              while (v20 != v17);
            }
            else
            {
              uint64_t v92 = 2 * v19;
              uint64_t v93 = 2 * v18;
              do
              {
                *uint64_t v3 = *v14;
                v3[1] = v14[1];
                v3[2] = v14[2];
                v3[3] = v14[3];
                int v14 = (_WORD *)((char *)v14 + v92);
                uint64_t v3 = (_WORD *)((char *)v3 + v93);
                --v17;
              }
              while (v17);
            }
          }
          for (; v13; --v13)
          {
            *uint64_t v3 = *v14;
            v3[1] = v14[1];
            v3[2] = v14[2];
            v3[3] = v14[3];
            int v14 = (_WORD *)((char *)v14 + v15);
            uint64_t v3 = (_WORD *)((char *)v3 + v16);
          }
          *uint64_t v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
          v3[3] = v14[3];
        }
      }
    }
    return v2;
  }
  uint64_t v26 = a2[4];
  uint64_t v27 = *(unsigned int *)(a1 + 16);
  uint64_t v28 = *a2;
  if (v26 != v27 || v26 != v28)
  {
    if (!v28) {
      return v2;
    }
    unsigned int v35 = a2[1];
    if (!v35) {
      return v2;
    }
    unsigned int v36 = a2[2];
    if (!v36) {
      return v2;
    }
    unsigned int v37 = v35 - 1;
    uint64_t v38 = *((void *)a2 + 8);
    uint64_t v39 = 2 * v27;
    unsigned int v138 = v36 - 1;
    uint64_t v144 = *a2;
    unsigned int v143 = v35 - 1;
    uint64_t v132 = a2[4];
    if (v36 == 1)
    {
      uint64_t v44 = *(void *)(a1 + 64);
LABEL_105:
      if (v37)
      {
        uint64_t v95 = 0;
        uint64_t v96 = 2 * v132;
        unint64_t v97 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v98 = (v97 + 1) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v99 = 2 * v98;
        uint64_t v100 = v44;
        uint64_t v101 = v38;
        while (1)
        {
          if (!v101)
          {
            BOOL v102 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            unsigned int v37 = v143;
            uint64_t v28 = v144;
            if (v102) {
              goto LABEL_133;
            }
          }
          uint64_t v103 = (_WORD *)v100;
          unint64_t v104 = (__int16 *)v101;
          if (v97 < 0xF) {
            goto LABEL_147;
          }
          uint64_t v103 = (_WORD *)v100;
          unint64_t v104 = (__int16 *)v101;
          if ((unint64_t)(v44 + v39 * v95 - (v38 + v96 * v95)) < 0x20) {
            goto LABEL_147;
          }
          uint64_t v105 = 0;
          uint64_t v103 = (_WORD *)(v100 + v99);
          unint64_t v104 = (__int16 *)(v101 + v99);
          unint64_t v106 = (v97 + 1) & 0xFFFFFFFFFFFFFFF0;
          do
          {
            __int16 v107 = (_OWORD *)(v100 + v105);
            long long v108 = *(_OWORD *)(v101 + v105 + 16);
            *__int16 v107 = *(_OWORD *)(v101 + v105);
            v107[1] = v108;
            v105 += 32;
            v106 -= 16;
          }
          while (v106);
          if (v97 + 1 != v98)
          {
LABEL_147:
            do
            {
              __int16 v109 = *v104++;
              *v103++ = v109;
            }
            while (v104 != (__int16 *)(v101 + 2 * v28));
          }
          v101 += v96;
          v100 += v39;
          if (++v95 == v37) {
            goto LABEL_118;
          }
        }
      }
      uint64_t v100 = v44;
      uint64_t v101 = v38;
LABEL_118:
      if (!v101)
      {
        BOOL v110 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
        uint64_t v28 = v144;
        if (v110) {
LABEL_133:
        }
          abort();
      }
      unint64_t v111 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
      if (v111 < 0xF || (unint64_t)(v100 - v101) < 0x20)
      {
        unint64_t v114 = (_WORD *)v100;
        BOOL v115 = (__int16 *)v101;
        uint64_t v2 = a1;
      }
      else
      {
        unint64_t v112 = v111 + 1;
        unint64_t v113 = (v111 + 1) & 0xFFFFFFFFFFFFFFF0;
        unint64_t v114 = (_WORD *)(v100 + 2 * v113);
        BOOL v115 = (__int16 *)(v101 + 2 * v113);
        BOOL v116 = (long long *)(v101 + 16);
        unint64_t v117 = (_OWORD *)(v100 + 16);
        unint64_t v118 = v113;
        do
        {
          long long v119 = *v116;
          *(v117 - 1) = *(v116 - 1);
          *unint64_t v117 = v119;
          v116 += 2;
          v117 += 2;
          v118 -= 16;
        }
        while (v118);
        uint64_t v2 = a1;
        if (v112 == v113) {
          return v2;
        }
      }
      do
      {
        __int16 v120 = *v115++;
        *v114++ = v120;
      }
      while (v115 != (__int16 *)(v101 + 2 * v28));
      return v2;
    }
    uint64_t v142 = 0;
    unint64_t v40 = (v28 - 1) & 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v139 = 2 * a2[5];
    uint64_t v140 = 2 * *(unsigned int *)(a1 + 20);
    uint64_t v41 = 2 * v26;
    unint64_t v146 = v40 + 1;
    unint64_t v42 = (v40 + 1) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v43 = 2 * v42;
    uint64_t v135 = *((void *)a2 + 8);
    uint64_t v136 = *(void *)(a1 + 64);
    uint64_t v44 = v136;
    while (1)
    {
      uint64_t v141 = v38;
      uint64_t v45 = v44;
      uint64_t v46 = v38;
      if (v37)
      {
        uint64_t v47 = 0;
        uint64_t v45 = v44;
        uint64_t v46 = v141;
        do
        {
          if (!v46)
          {
            BOOL v48 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            unsigned int v37 = v143;
            uint64_t v28 = v144;
            if (v48) {
              goto LABEL_133;
            }
          }
          uint64_t v49 = (_WORD *)v45;
          uint64_t v50 = (__int16 *)v46;
          if (v40 < 0xF) {
            goto LABEL_148;
          }
          uint64_t v49 = (_WORD *)v45;
          uint64_t v50 = (__int16 *)v46;
          if ((unint64_t)(v136 + v140 * v142 + v39 * v47 - (v135 + v139 * v142 + v41 * v47)) < 0x20) {
            goto LABEL_148;
          }
          uint64_t v51 = 0;
          uint64_t v49 = (_WORD *)(v45 + v43);
          uint64_t v50 = (__int16 *)(v46 + v43);
          unint64_t v52 = (v40 + 1) & 0xFFFFFFFFFFFFFFF0;
          do
          {
            int v53 = (_OWORD *)(v45 + v51);
            long long v54 = *(_OWORD *)(v46 + v51 + 16);
            *int v53 = *(_OWORD *)(v46 + v51);
            v53[1] = v54;
            v51 += 32;
            v52 -= 16;
          }
          while (v52);
          if (v146 != v42)
          {
LABEL_148:
            do
            {
              __int16 v55 = *v50++;
              *v49++ = v55;
            }
            while (v50 != (__int16 *)(v46 + 2 * v28));
          }
          v46 += v41;
          v45 += v39;
        }
        while (++v47 != v37);
      }
      if (!v46)
      {
        BOOL v56 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
        unsigned int v37 = v143;
        uint64_t v28 = v144;
        if (v56) {
          goto LABEL_133;
        }
      }
      if (v40 < 0xF || (unint64_t)(v45 - v46) < 0x20)
      {
        long long v57 = (_WORD *)v45;
        long long v58 = (__int16 *)v46;
      }
      else
      {
        long long v57 = (_WORD *)(v45 + v43);
        long long v58 = (__int16 *)(v46 + v43);
        uint64_t v59 = (long long *)(v46 + 16);
        long long v60 = (_OWORD *)(v45 + 16);
        unint64_t v61 = (v40 + 1) & 0xFFFFFFFFFFFFFFF0;
        do
        {
          long long v62 = *v59;
          *(v60 - 1) = *(v59 - 1);
          *long long v60 = v62;
          v59 += 2;
          v60 += 2;
          v61 -= 16;
        }
        while (v61);
        if (v146 == v42) {
          goto LABEL_49;
        }
      }
      do
      {
        __int16 v63 = *v58++;
        *v57++ = v63;
      }
      while (v58 != (__int16 *)(v46 + 2 * v28));
LABEL_49:
      uint64_t v38 = v141 + v139;
      v44 += v140;
      if (++v142 == v138) {
        goto LABEL_105;
      }
    }
  }
  uint64_t v29 = a2[5];
  uint64_t v30 = *(unsigned int *)(a1 + 20);
  unsigned int v31 = a2[1];
  uint64_t v32 = v31 * v26;
  if (v29 == v30 && v29 == v32)
  {
    uint64_t v33 = a2[2] * v29;
    uint64_t v34 = *((void *)a2 + 8);
    if (!v33 || v34)
    {
      if (!v33) {
        return v2;
      }
    }
    else
    {
      if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
      {
        goto LABEL_133;
      }
      uint64_t v3 = *(_WORD **)(v2 + 64);
    }
    unint64_t v83 = (v33 - 1) & 0x7FFFFFFFFFFFFFFFLL;
    if (v83 < 0xF || (unint64_t)v3 - v34 < 0x20)
    {
      long long v86 = v3;
      long long v87 = (__int16 *)v34;
    }
    else
    {
      unint64_t v84 = v83 + 1;
      unint64_t v85 = (v83 + 1) & 0xFFFFFFFFFFFFFFF0;
      long long v86 = &v3[v85];
      long long v87 = (__int16 *)(v34 + 2 * v85);
      __int16 v88 = (long long *)(v34 + 16);
      int v89 = v3 + 8;
      unint64_t v90 = v85;
      do
      {
        long long v91 = *v88;
        *(v89 - 1) = *(v88 - 1);
        *int v89 = v91;
        v88 += 2;
        v89 += 2;
        v90 -= 16;
      }
      while (v90);
      if (v84 == v85) {
        return v2;
      }
    }
    do
    {
      __int16 v94 = *v87++;
      *v86++ = v94;
    }
    while (v87 != (__int16 *)(v34 + 2 * v33));
    return v2;
  }
  if (v26)
  {
    if (v31)
    {
      unsigned int v64 = a2[2];
      if (v64)
      {
        uint64_t v65 = *((void *)a2 + 8);
        unsigned int v66 = v64 - 1;
        uint64_t v145 = v32;
        if (v64 == 1)
        {
          uint64_t v134 = a1;
          uint64_t v70 = *(void *)(a1 + 64);
          uint64_t v74 = *((void *)a2 + 8);
LABEL_130:
          if (!v32 || v74)
          {
            uint64_t v2 = v134;
            if (!v32) {
              return v2;
            }
          }
          else
          {
            BOOL v121 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
            uint64_t v32 = v145;
            uint64_t v2 = v134;
            if (v121) {
              goto LABEL_133;
            }
          }
          unint64_t v122 = (v32 - 1) & 0x7FFFFFFFFFFFFFFFLL;
          if (v122 < 0xF || (unint64_t)(v70 - v74) < 0x20)
          {
            uint64_t v125 = (_WORD *)v70;
            unint64_t v126 = (__int16 *)v74;
          }
          else
          {
            unint64_t v123 = v122 + 1;
            unint64_t v124 = (v122 + 1) & 0xFFFFFFFFFFFFFFF0;
            uint64_t v125 = (_WORD *)(v70 + 2 * v124);
            unint64_t v126 = (__int16 *)(v74 + 2 * v124);
            uint64_t v127 = (long long *)(v74 + 16);
            unint64_t v128 = (_OWORD *)(v70 + 16);
            unint64_t v129 = v124;
            do
            {
              long long v130 = *v127;
              *(v128 - 1) = *(v127 - 1);
              *unint64_t v128 = v130;
              v127 += 2;
              v128 += 2;
              v129 -= 16;
            }
            while (v129);
            if (v123 == v124) {
              return v2;
            }
          }
          do
          {
            __int16 v131 = *v126++;
            *v125++ = v131;
          }
          while (v126 != (__int16 *)(v74 + 2 * v32));
          return v2;
        }
        if (v32)
        {
          uint64_t v134 = a1;
          uint64_t v67 = 0;
          uint64_t v68 = 2 * v30;
          uint64_t v69 = 2 * v29;
          uint64_t v70 = *(void *)(a1 + 64);
          unint64_t v71 = (v32 - 1) & 0x7FFFFFFFFFFFFFFFLL;
          unint64_t v72 = (v71 + 1) & 0xFFFFFFFFFFFFFFF0;
          uint64_t v73 = 2 * v72;
          uint64_t v137 = v70;
          uint64_t v74 = *((void *)a2 + 8);
          while (1)
          {
            if (!v74)
            {
              BOOL v75 = sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4);
              uint64_t v32 = v145;
              if (v75) {
                goto LABEL_133;
              }
            }
            __int16 v76 = (_WORD *)v70;
            BOOL v77 = (__int16 *)v74;
            if (v71 < 0xF) {
              goto LABEL_149;
            }
            __int16 v76 = (_WORD *)v70;
            BOOL v77 = (__int16 *)v74;
            if ((unint64_t)(v137 + v68 * v67 - (v65 + v69 * v67)) < 0x20) {
              goto LABEL_149;
            }
            uint64_t v78 = 0;
            __int16 v76 = (_WORD *)(v70 + v73);
            BOOL v77 = (__int16 *)(v74 + v73);
            unint64_t v79 = (v71 + 1) & 0xFFFFFFFFFFFFFFF0;
            do
            {
              unint64_t v80 = (_OWORD *)(v70 + v78);
              long long v81 = *(_OWORD *)(v74 + v78 + 16);
              *unint64_t v80 = *(_OWORD *)(v74 + v78);
              v80[1] = v81;
              v78 += 32;
              v79 -= 16;
            }
            while (v79);
            if (v71 + 1 != v72)
            {
LABEL_149:
              do
              {
                __int16 v82 = *v77++;
                *v76++ = v82;
              }
              while (v77 != (__int16 *)(v74 + 2 * v32));
            }
            v74 += v69;
            v70 += v68;
            if (++v67 == v66) {
              goto LABEL_130;
            }
          }
        }
      }
    }
  }
  return v2;
}

void sub_21B971D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  sub_21B953528((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B971DA0(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *(_DWORD **)(a1 + 64);
  if (v3 && *(void *)(a2 + 1) == *(void *)(a1 + 4) && *((void *)a2 + 2) == *(void *)(a1 + 16))
  {
    if (a2[3] != 1 || *(_DWORD *)(a1 + 12) != 1)
    {
      if (!*a2) {
        return a1;
      }
      unsigned int v9 = a2[1];
      if (!v9) {
        return a1;
      }
      unsigned int v10 = a2[2];
      if (!v10) {
        return a1;
      }
      unsigned int v11 = v9 - 1;
      uint64_t v12 = a2[4];
      uint64_t v13 = *(unsigned int *)(a1 + 16);
      int v14 = (_DWORD *)*((void *)a2 + 8);
      unsigned int v15 = v10 - 1;
      if (v15)
      {
        uint64_t v16 = *(unsigned int *)(a1 + 20);
        uint64_t v17 = a2[5];
        if (!v11)
        {
          do
          {
            *uint64_t v3 = *v14;
            v3[1] = v14[1];
            v3[2] = v14[2];
            v3[3] = v14[3];
            v14 += v17;
            v3 += v16;
            --v15;
          }
          while (v15);
LABEL_59:
          *uint64_t v3 = *v14;
          v3[1] = v14[1];
          v3[2] = v14[2];
          v3[3] = v14[3];
          return a1;
        }
        int v18 = 0;
        uint64_t v19 = v3 + 2;
        int v20 = v14 + 2;
        do
        {
          int v21 = v20;
          uint64_t v22 = v19;
          unsigned int v23 = v11;
          do
          {
            *(v22 - 2) = *(v21 - 2);
            *(v22 - 1) = *(v21 - 1);
            *uint64_t v22 = *v21;
            v22[1] = v21[1];
            v22 += v13;
            v21 += v12;
            --v23;
          }
          while (v23);
          *(v22 - 2) = *(v21 - 2);
          *(v22 - 1) = *(v21 - 1);
          *uint64_t v22 = *v21;
          v22[1] = v21[1];
          v14 += v17;
          v3 += v16;
          ++v18;
          v19 += v16;
          v20 += v17;
        }
        while (v18 != v15);
      }
      for (; v11; --v11)
      {
        *uint64_t v3 = *v14;
        v3[1] = v14[1];
        v3[2] = v14[2];
        v3[3] = v14[3];
        v14 += v12;
        v3 += v13;
      }
      goto LABEL_59;
    }
    uint64_t v24 = a2[4];
    uint64_t v25 = *(unsigned int *)(a1 + 16);
    uint64_t v26 = *a2;
    if (v24 == v25 && v24 == v26)
    {
      uint64_t v27 = a2[5];
      uint64_t v28 = *(unsigned int *)(a1 + 20);
      unsigned int v29 = a2[1];
      uint64_t v30 = v29 * v24;
      if (v27 == v28 && v27 == v30)
      {
        uint64_t v31 = v27 * a2[2];
        uint64_t v32 = (const void *)*((void *)a2 + 8);
        if (!v31 || v32)
        {
          if (!v31) {
            return a1;
          }
LABEL_57:
          memmove(v3, v32, 4 * v31);
          return a1;
        }
        if (!sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          uint64_t v3 = *(_DWORD **)(a1 + 64);
          goto LABEL_57;
        }
LABEL_79:
        abort();
      }
      if (!v24) {
        return a1;
      }
      if (!v29) {
        return a1;
      }
      unsigned int v43 = a2[2];
      if (!v43) {
        return a1;
      }
      uint64_t v44 = (char *)*((void *)a2 + 8);
      size_t v37 = 4 * v30;
      unsigned int v45 = v43 - 1;
      if (v43 != 1)
      {
        if (!v30) {
          return a1;
        }
        uint64_t v46 = 4 * v27;
        uint64_t v47 = 4 * v28;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, 4 * v30);
          v44 += v46;
          uint64_t v3 = (_DWORD *)((char *)v3 + v47);
          if (!--v45) {
            goto LABEL_60;
          }
        }
        goto LABEL_79;
      }
LABEL_60:
      if (!v30 || v44)
      {
        if (!v30) {
          return a1;
        }
        goto LABEL_74;
      }
    }
    else
    {
      if (!v26) {
        return a1;
      }
      unsigned int v33 = a2[1];
      if (!v33) {
        return a1;
      }
      unsigned int v34 = a2[2];
      if (!v34) {
        return a1;
      }
      unsigned int v35 = v33 - 1;
      unsigned int v36 = (char *)*((void *)a2 + 8);
      size_t v37 = 4 * v26;
      unsigned int v55 = v34 - 1;
      if (v34 != 1)
      {
        if (v33 == 1)
        {
          uint64_t v39 = a2[4];
          uint64_t v49 = 4 * a2[5];
          uint64_t v50 = 4 * *(unsigned int *)(a1 + 20);
          while (v36
               || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
          {
            memmove(v3, v36, v37);
            v36 += v49;
            uint64_t v3 = (_DWORD *)((char *)v3 + v50);
            if (!--v55) {
              goto LABEL_65;
            }
          }
        }
        else
        {
          int v38 = 0;
          uint64_t v39 = a2[4];
          uint64_t v40 = 4 * v24;
          uint64_t v51 = a2[5];
          uint64_t v52 = *(unsigned int *)(a1 + 20);
          while (1)
          {
            int v53 = v38;
            int v41 = 0;
            long long v54 = v36;
            unint64_t v42 = (char *)v3;
            do
            {
              while (v36)
              {
                memmove(v42, v36, v37);
                v36 += 4 * v39;
                v42 += 4 * v25;
                if (++v41 == v35) {
                  goto LABEL_38;
                }
              }
              if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
              {
                goto LABEL_79;
              }
              memcpy(v42, 0, v37);
              v42 += 4 * v25;
              ++v41;
              unsigned int v36 = (char *)v40;
            }
            while (v41 != v35);
            unsigned int v36 = (char *)v40;
            if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
            {
              break;
            }
LABEL_38:
            memmove(v42, v36, v37);
            unsigned int v36 = &v54[4 * v51];
            v3 += v52;
            int v38 = v53 + 1;
            if (v53 + 1 == v55) {
              goto LABEL_65;
            }
          }
        }
        goto LABEL_79;
      }
      uint64_t v39 = a2[4];
LABEL_65:
      if (v35)
      {
        uint64_t v48 = 4 * v39;
        uint64_t v44 = v36;
        while (v44
             || !sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
        {
          memmove(v3, v44, v37);
          v44 += v48;
          v3 += v25;
          if (!--v35) {
            goto LABEL_72;
          }
        }
        goto LABEL_79;
      }
      uint64_t v44 = v36;
LABEL_72:
      if (v44)
      {
LABEL_74:
        memmove(v3, v44, v37);
        return a1;
      }
    }
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Common/include/Essentials/Common/Span.h", 248, (uint64_t)"ptr != nullptr || size == 0", 27, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      goto LABEL_79;
    }
    goto LABEL_74;
  }
  long long v56 = *(_OWORD *)a2;
  long long v57 = *((_OWORD *)a2 + 1);
  long long v58 = *((_OWORD *)a2 + 2);
  uint64_t v59 = *((void *)a2 + 6);
  sub_21B9664A8((uint64_t)v60, (uint64_t)(a2 + 14));
  *(_OWORD *)a1 = v56;
  *(_OWORD *)(a1 + 16) = v57;
  *(_OWORD *)(a1 + 32) = v58;
  *(_OWORD *)(a1 + 80) = v61;
  *(void *)(a1 + 96) = v62;
  uint64_t v4 = v60[0];
  *(void *)(a1 + 48) = v59;
  *(void *)(a1 + 56) = v4;
  BOOL v5 = *(void **)(a1 + 64);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = v60[2];
  *(void *)(a1 + 64) = v60[1];
  *(void *)(a1 + 72) = v6;
  return a1;
}

uint64_t sub_21B972418(uint64_t a1, _DWORD *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a2[1]) {
    BOOL v3 = *a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a2;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 2;
  *(void *)&memptr[4] = v4;
  uint64_t v5 = 2 * (v4 != 0);
  if (HIDWORD(v4)) {
    unint64_t v6 = (v5 * *(_DWORD *)&memptr[4]);
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = v5 & 0x1FFFFFFFFLL | ((unint64_t)(v6 >> 1) << 33);
  unint64_t v8 = __PAIR64__(*(unsigned int *)&memptr[4], 2);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v7;
  uint64_t v9 = *(void *)memptr;
  *(void *)a1 = v8;
  *(_DWORD *)(a1 + 8) = HIDWORD(v4);
  *(void *)(a1 + 12) = v9;
  *(_DWORD *)(a1 + 20) = v6;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 52) = 0;
  if (HIDWORD(v8)) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || HIDWORD(v4) == 0;
  int v12 = v11;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = HIDWORD(v4);
  }
  uint64_t v14 = 2 * v6;
  if ((v14 & (v14 - 1)) != 0) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = v14 - 1;
  }
  unint64_t v16 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
  unint64_t v18 = v17 | (v17 >> 16) | ((v17 | (v17 >> 16)) >> 32);
  if (v18 + 1 > 8) {
    size_t v19 = v18 + 1;
  }
  else {
    size_t v19 = 8;
  }
  *(void *)(a1 + 56) = 2 * (v13 * v6);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v19;
  if (v13 * v6)
  {
    *(void *)memptr = 0;
    int v20 = malloc_type_posix_memalign((void **)memptr, v19, 2 * (v13 * v6), 0x1F88E90uLL);
    if (v20) {
      sub_21B97D9E4(v20, *(void *)(a1 + 72), 2 * (v13 * v6));
    }
    *(void *)(a1 + 64) = *(void *)memptr;
  }
  if (v12) {
    unint64_t v21 = 0;
  }
  else {
    unint64_t v21 = v8;
  }
  *(void *)(a1 + 80) = v21;
  *(_DWORD *)(a1 + 88) = v13;
  *(void *)(a1 + 92) = (2 * v9) & 0xFFFFFFFEFFFFFFFELL;
  *(_DWORD *)(a1 + 100) = 2 * v6;
  return a1;
}

uint64_t sub_21B9725D8(uint64_t a1, _DWORD *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2[1]) {
    BOOL v3 = *a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a2;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 2;
  *(void *)&memptr[4] = v4;
  uint64_t v5 = 2 * (v4 != 0);
  if (HIDWORD(v4)) {
    unint64_t v6 = (v5 * *(_DWORD *)&memptr[4]);
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = v5 & 0x1FFFFFFFFLL | ((unint64_t)(v6 >> 1) << 33);
  unint64_t v8 = __PAIR64__(*(unsigned int *)&memptr[4], 2);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v7;
  uint64_t v9 = *(void *)memptr;
  *(void *)a1 = v8;
  *(_DWORD *)(a1 + 8) = HIDWORD(v4);
  *(void *)(a1 + 12) = v9;
  *(_DWORD *)(a1 + 20) = v6;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 52) = 0;
  if (HIDWORD(v8)) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || HIDWORD(v4) == 0;
  int v12 = v11;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = HIDWORD(v4);
  }
  uint64_t v14 = 4 * v6;
  unint64_t v15 = v14 - 1;
  BOOL v3 = (v14 & (v14 - 1)) == 0;
  unint64_t v16 = 3;
  if (v3) {
    unint64_t v16 = v15;
  }
  unint64_t v17 = v16 | (v16 >> 1) | ((v16 | (v16 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  *(void *)(a1 + 56) = 4 * (v13 * v6);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v20;
  if (v13 * v6)
  {
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, 4 * (v13 * v6), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, *(void *)(a1 + 72), 4 * (v13 * v6));
    }
    *(void *)(a1 + 64) = *(void *)memptr;
  }
  if (v12) {
    unint64_t v22 = 0;
  }
  else {
    unint64_t v22 = v8;
  }
  *(void *)(a1 + 80) = v22;
  *(_DWORD *)(a1 + 88) = v13;
  *(void *)(a1 + 92) = (4 * v9) & 0xFFFFFFFCFFFFFFFCLL;
  *(_DWORD *)(a1 + 100) = 4 * v6;
  return a1;
}

uint64_t sub_21B97279C(uint64_t a1, _DWORD *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2[1]) {
    BOOL v3 = *a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = *(void *)a2;
  if (v3) {
    uint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 3;
  *(void *)&memptr[4] = v4;
  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = HIDWORD(*(void *)&memptr[4]);
  if (HIDWORD(*(void *)&memptr[4])) {
    uint64_t v7 = (v5 * *(_DWORD *)&memptr[4]);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v5 | (v7 << 32);
  unint64_t v9 = __PAIR64__(*(unsigned int *)&memptr[4], 3);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v8;
  uint64_t v10 = *(void *)memptr;
  *(void *)a1 = v9;
  *(_DWORD *)(a1 + 8) = v6;
  *(void *)(a1 + 12) = v10;
  *(_DWORD *)(a1 + 20) = v7;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 52) = 0;
  if (HIDWORD(v9)) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || v6 == 0;
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = v6;
  }
  uint64_t v15 = 2 * v7;
  if ((v15 & (v15 - 1)) != 0) {
    unint64_t v16 = 1;
  }
  else {
    unint64_t v16 = v15 - 1;
  }
  unint64_t v17 = v16 | (v16 >> 1) | ((v16 | (v16 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  *(void *)(a1 + 56) = 2 * (v14 * v7);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v20;
  if (v14 * v7)
  {
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, 2 * (v14 * v7), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, *(void *)(a1 + 72), 2 * (v14 * v7));
    }
    *(void *)(a1 + 64) = *(void *)memptr;
  }
  if (v13) {
    unint64_t v22 = 0;
  }
  else {
    unint64_t v22 = v9;
  }
  *(void *)(a1 + 80) = v22;
  *(_DWORD *)(a1 + 88) = v14;
  *(void *)(a1 + 92) = (2 * v10) & 0xFFFFFFFEFFFFFFFELL;
  *(_DWORD *)(a1 + 100) = 2 * v7;
  return a1;
}

uint64_t sub_21B972954(uint64_t a1, _DWORD *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2[1]) {
    BOOL v3 = *a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = *(void *)a2;
  if (v3) {
    uint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 3;
  *(void *)&memptr[4] = v4;
  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = HIDWORD(*(void *)&memptr[4]);
  if (HIDWORD(*(void *)&memptr[4])) {
    uint64_t v7 = (v5 * *(_DWORD *)&memptr[4]);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v5 | (v7 << 32);
  unint64_t v9 = __PAIR64__(*(unsigned int *)&memptr[4], 3);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v8;
  uint64_t v10 = *(void *)memptr;
  *(void *)a1 = __PAIR64__(v4, 3);
  *(_DWORD *)(a1 + 8) = v6;
  *(void *)(a1 + 12) = v10;
  *(_DWORD *)(a1 + 20) = v7;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 52) = 0;
  if (__PAIR64__(v4, 3) >> 32) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || v6 == 0;
  int v13 = v12;
  if (v12) {
    int v14 = 0;
  }
  else {
    int v14 = v6;
  }
  uint64_t v15 = 4 * v7;
  if ((v15 & (v15 - 1)) != 0) {
    unint64_t v16 = 3;
  }
  else {
    unint64_t v16 = v15 - 1;
  }
  unint64_t v17 = v16 | (v16 >> 1) | ((v16 | (v16 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  *(void *)(a1 + 56) = 4 * (v14 * v7);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v20;
  if (v14 * v7)
  {
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, 4 * (v14 * v7), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, *(void *)(a1 + 72), 4 * (v14 * v7));
    }
    *(void *)(a1 + 64) = *(void *)memptr;
  }
  if (v13) {
    unint64_t v22 = 0;
  }
  else {
    unint64_t v22 = v9;
  }
  *(void *)(a1 + 80) = v22;
  *(_DWORD *)(a1 + 88) = v14;
  *(void *)(a1 + 92) = (4 * v10) & 0xFFFFFFFCFFFFFFFCLL;
  *(_DWORD *)(a1 + 100) = 4 * v7;
  return a1;
}

uint64_t sub_21B972B0C(uint64_t a1, _DWORD *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a2[1]) {
    BOOL v3 = *a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a2;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 4;
  *(void *)&memptr[4] = v4;
  uint64_t v5 = 4 * (v4 != 0);
  if (HIDWORD(v4)) {
    unint64_t v6 = (v5 * *(_DWORD *)&memptr[4]);
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = v5 & 0x3FFFFFFFFLL | ((unint64_t)(v6 >> 2) << 34);
  unint64_t v8 = __PAIR64__(*(unsigned int *)&memptr[4], 4);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v7;
  uint64_t v9 = *(void *)memptr;
  *(void *)a1 = v8;
  *(_DWORD *)(a1 + 8) = HIDWORD(v4);
  *(void *)(a1 + 12) = v9;
  *(_DWORD *)(a1 + 20) = v6;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 52) = 0;
  if (HIDWORD(v8)) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || HIDWORD(v4) == 0;
  int v12 = v11;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = HIDWORD(v4);
  }
  uint64_t v14 = 2 * v6;
  if ((v14 & (v14 - 1)) != 0) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = v14 - 1;
  }
  unint64_t v16 = v15 | (v15 >> 1) | ((v15 | (v15 >> 1)) >> 2);
  unint64_t v17 = v16 | (v16 >> 4) | ((v16 | (v16 >> 4)) >> 8);
  unint64_t v18 = v17 | (v17 >> 16) | ((v17 | (v17 >> 16)) >> 32);
  if (v18 + 1 > 8) {
    size_t v19 = v18 + 1;
  }
  else {
    size_t v19 = 8;
  }
  *(void *)(a1 + 56) = 2 * (v13 * v6);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v19;
  if (v13 * v6)
  {
    *(void *)memptr = 0;
    int v20 = malloc_type_posix_memalign((void **)memptr, v19, 2 * (v13 * v6), 0x1F88E90uLL);
    if (v20) {
      sub_21B97D9E4(v20, *(void *)(a1 + 72), 2 * (v13 * v6));
    }
    *(void *)(a1 + 64) = *(void *)memptr;
  }
  if (v12) {
    unint64_t v21 = 0;
  }
  else {
    unint64_t v21 = v8;
  }
  *(void *)(a1 + 80) = v21;
  *(_DWORD *)(a1 + 88) = v13;
  *(void *)(a1 + 92) = (2 * v9) & 0xFFFFFFFEFFFFFFFELL;
  *(_DWORD *)(a1 + 100) = 2 * v6;
  return a1;
}

uint64_t sub_21B972CCC(uint64_t a1, _DWORD *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2[1]) {
    BOOL v3 = *a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  unint64_t v4 = *(void *)a2;
  if (v3) {
    unint64_t v4 = 0;
  }
  *(_DWORD *)memptr = 4;
  *(void *)&memptr[4] = v4;
  uint64_t v5 = 4 * (v4 != 0);
  if (HIDWORD(v4)) {
    unint64_t v6 = (v5 * *(_DWORD *)&memptr[4]);
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = v5 & 0x3FFFFFFFFLL | ((unint64_t)(v6 >> 2) << 34);
  unint64_t v8 = __PAIR64__(*(unsigned int *)&memptr[4], 4);
  *(_DWORD *)memptr = 1;
  *(void *)&memptr[4] = v7;
  uint64_t v9 = *(void *)memptr;
  *(void *)a1 = v8;
  *(_DWORD *)(a1 + 8) = HIDWORD(v4);
  *(void *)(a1 + 12) = v9;
  *(_DWORD *)(a1 + 20) = v6;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 52) = 0;
  if (HIDWORD(v8)) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || HIDWORD(v4) == 0;
  int v12 = v11;
  if (v11) {
    int v13 = 0;
  }
  else {
    int v13 = HIDWORD(v4);
  }
  uint64_t v14 = 4 * v6;
  unint64_t v15 = v14 - 1;
  BOOL v3 = (v14 & (v14 - 1)) == 0;
  unint64_t v16 = 3;
  if (v3) {
    unint64_t v16 = v15;
  }
  unint64_t v17 = v16 | (v16 >> 1) | ((v16 | (v16 >> 1)) >> 2);
  unint64_t v18 = v17 | (v17 >> 4) | ((v17 | (v17 >> 4)) >> 8);
  unint64_t v19 = v18 | (v18 >> 16) | ((v18 | (v18 >> 16)) >> 32);
  if (v19 + 1 > 8) {
    size_t v20 = v19 + 1;
  }
  else {
    size_t v20 = 8;
  }
  *(void *)(a1 + 56) = 4 * (v13 * v6);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v20;
  if (v13 * v6)
  {
    *(void *)memptr = 0;
    int v21 = malloc_type_posix_memalign((void **)memptr, v20, 4 * (v13 * v6), 0x1F88E90uLL);
    if (v21) {
      sub_21B97D9E4(v21, *(void *)(a1 + 72), 4 * (v13 * v6));
    }
    *(void *)(a1 + 64) = *(void *)memptr;
  }
  if (v12) {
    unint64_t v22 = 0;
  }
  else {
    unint64_t v22 = v8;
  }
  *(void *)(a1 + 80) = v22;
  *(_DWORD *)(a1 + 88) = v13;
  *(void *)(a1 + 92) = (4 * v9) & 0xFFFFFFFCFFFFFFFCLL;
  *(_DWORD *)(a1 + 100) = 4 * v6;
  return a1;
}

uint64_t sub_21B972E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  memcpy(&v12, (const void *)(a3 + 4 * a2 - 8), sizeof(v12));
  *(void *)a1 = v12;
  memcpy(&__dst, (const void *)(a5 + 4 * a4 - 4), sizeof(__dst));
  *(_DWORD *)(a1 + 8) = __dst * a6;
  if (a2 != a4
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Image/src/Size.cpp", 37, (uint64_t)"shape.size() == value_stride.size()", 35, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
  return a1;
}

void *sub_21B972F60(void *a1, uint64_t a2)
{
  BOOL v3 = *(uint64_t **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *a1 = &unk_26CBA1808;
  a1[1] = v3;
  a1[2] = v4;
  if (v4)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    BOOL v3 = (uint64_t *)a1[1];
  }
  *a1 = &unk_26CBA17C8;
  if (v3)
  {
    uint64_t v6 = *v3;
    uint64_t v5 = (std::__shared_weak_count *)v3[1];
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6) {
          return a1;
        }
        goto LABEL_7;
      }
    }
    if (v6) {
LABEL_7:
    }
      sub_21B97A1E8(a1[1]);
  }
  return a1;
}

void sub_21B97304C(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  _Unwind_Resume(exception_object);
}

void *sub_21B9730A4(void *a1, uint64_t a2)
{
  BOOL v3 = *(uint64_t **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *a1 = &unk_26CBA1808;
  a1[1] = v3;
  a1[2] = v4;
  if (v4)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    BOOL v3 = (uint64_t *)a1[1];
  }
  *a1 = &unk_26CBA17C8;
  if (v3)
  {
    uint64_t v6 = *v3;
    uint64_t v5 = (std::__shared_weak_count *)v3[1];
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6) {
          return a1;
        }
        goto LABEL_7;
      }
    }
    if (v6) {
LABEL_7:
    }
      sub_21B97A1E8(a1[1]);
  }
  return a1;
}

void sub_21B973190(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B9731E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    if (v6) {
      sub_21B97A404(*(void *)(a1 + 8));
    }
  }
  long long v7 = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  unint64_t v8 = *(std::__shared_weak_count **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = v7;
  if (!v8 || atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  return a1;
}

void *sub_21B9732E4(void *a1)
{
  uint64_t v2 = (uint64_t *)a1[1];
  if (v2)
  {
    uint64_t v4 = *v2;
    BOOL v3 = (std::__shared_weak_count *)v2[1];
    if (v3)
    {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
        if (!v4) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
    if (v4) {
LABEL_5:
    }
      sub_21B97A404(a1[1]);
  }
LABEL_6:
  *a1 = &unk_26CBA1808;
  uint64_t v5 = (std::__shared_weak_count *)a1[2];
  if (!v5 || atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

void sub_21B9733FC(void *a1)
{
  sub_21B9732E4(a1);

  JUMPOUT(0x21D495F30);
}

uint64_t sub_21B973434(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5
      && (atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v6) {
        goto LABEL_6;
      }
    }
    else if (v6)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 249, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v9 = v7;
  if (atomic_load_explicit((atomic_ullong *volatile)(v7 + 104), memory_order_acquire) != -1)
  {
    BOOL v11 = &v9;
    BOOL v10 = &v11;
    std::__call_once((std::once_flag::_State_type *)(v7 + 104), &v10, (void (__cdecl *)(void *))sub_21B976320);
  }
  return *(void *)(*(void *)(v7 + 112) + 8 * a2);
}

void *sub_21B973554(void *a1, uint64_t a2)
{
  BOOL v3 = *(uint64_t **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *a1 = &unk_26CBA1808;
  a1[1] = v3;
  a1[2] = v4;
  if (v4)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    BOOL v3 = (uint64_t *)a1[1];
  }
  *a1 = &unk_26CBA17E8;
  if (v3)
  {
    uint64_t v6 = *v3;
    uint64_t v5 = (std::__shared_weak_count *)v3[1];
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6) {
          return a1;
        }
        goto LABEL_7;
      }
    }
    if (v6) {
LABEL_7:
    }
      sub_21B97A2F8(a1[1]);
  }
  return a1;
}

void sub_21B973640(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  _Unwind_Resume(exception_object);
}

void *sub_21B973698(void *a1, uint64_t a2)
{
  BOOL v3 = *(uint64_t **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *a1 = &unk_26CBA1808;
  a1[1] = v3;
  a1[2] = v4;
  if (v4)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    BOOL v3 = (uint64_t *)a1[1];
  }
  *a1 = &unk_26CBA17E8;
  if (v3)
  {
    uint64_t v6 = *v3;
    uint64_t v5 = (std::__shared_weak_count *)v3[1];
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        if (!v6) {
          return a1;
        }
        goto LABEL_7;
      }
    }
    if (v6) {
LABEL_7:
    }
      sub_21B97A2F8(a1[1]);
  }
  return a1;
}

void sub_21B973784(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B9737DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    if (v6) {
      sub_21B97A514(*(void *)(a1 + 8));
    }
  }
  long long v7 = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  unint64_t v8 = *(std::__shared_weak_count **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = v7;
  if (!v8 || atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  return a1;
}

void *sub_21B9738D8(void *a1)
{
  uint64_t v2 = (uint64_t *)a1[1];
  if (v2)
  {
    uint64_t v4 = *v2;
    BOOL v3 = (std::__shared_weak_count *)v2[1];
    if (v3)
    {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
        if (!v4) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
    if (v4) {
LABEL_5:
    }
      sub_21B97A514(a1[1]);
  }
LABEL_6:
  *a1 = &unk_26CBA1808;
  uint64_t v5 = (std::__shared_weak_count *)a1[2];
  if (!v5 || atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

void sub_21B9739F0(void *a1)
{
  sub_21B9738D8(a1);

  JUMPOUT(0x21D495F30);
}

__IOSurface *sub_21B973A28@<X0>(IOSurfaceRef *a1@<X0>, void *a2@<X8>)
{
  double result = *a1;
  if (result)
  {
    size_t PlaneCount = IOSurfaceGetPlaneCount(result);
    if (PlaneCount <= 1) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = PlaneCount;
    }
    a2[1] = 0;
    a2[2] = 0;
    *a2 = 0;
    if (v6 >> 61) {
      sub_21B846300();
    }
    long long v7 = (char *)operator new(8 * v6);
    *a2 = v7;
    a2[2] = &v7[8 * v6];
    bzero(v7, 8 * v6);
    size_t v8 = 0;
    a2[1] = &v7[8 * v6];
    do
    {
      double result = (__IOSurface *)IOSurfaceGetBaseAddressOfPlane(*a1, v8);
      *(void *)&v7[8 * v8++] = result;
    }
    while (v6 != v8);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  return result;
}

void sub_21B973AF4(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B973B1C(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_21B8A1EA4(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_21B973DC8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B973DE0(_Unwind_Exception *a1)
{
}

void sub_21B973DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_21B973E10(_DWORD *a1, int a2)
{
  int v2 = a2;
  if (a1[1] * *a1) {
    sub_21B976EB0();
  }
  v3[23] = 21;
  strcpy(v3, "given IOSurface size ");
  int v4 = 1;
  sub_21B8A58F0();
}

void sub_21B974724(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,char a34)
{
  if (*(char *)(v34 - 113) < 0)
  {
    operator delete(*(void **)(v34 - 136));
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B974864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_21B974874(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120))
  {
    (**(void (***)(uint64_t))a1)(a1);
    return a1;
  }
  if (!*(unsigned char *)(a1 + 112)) {
    return a1;
  }
  if (!*(unsigned char *)(a1 + 104)) {
    goto LABEL_8;
  }
  if ((*(char *)(a1 + 103) & 0x80000000) == 0)
  {
    if ((*(char *)(a1 + 71) & 0x80000000) == 0) {
      goto LABEL_8;
    }
LABEL_12:
    operator delete(*(void **)(a1 + 48));
    if (!*(unsigned char *)(a1 + 40)) {
      return a1;
    }
    goto LABEL_9;
  }
  operator delete(*(void **)(a1 + 80));
  if (*(char *)(a1 + 71) < 0) {
    goto LABEL_12;
  }
LABEL_8:
  if (!*(unsigned char *)(a1 + 40)) {
    return a1;
  }
LABEL_9:
  if ((*(char *)(a1 + 39) & 0x80000000) == 0) {
    return a1;
  }
  operator delete(*(void **)(a1 + 16));
  return a1;
}

void *sub_21B974934(void *result)
{
  uint64_t v1 = result;
  *double result = &unk_26CBA1808;
  int v2 = (std::__shared_weak_count *)result[2];
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

void sub_21B9749CC(void *a1)
{
  *a1 = &unk_26CBA1808;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }

  JUMPOUT(0x21D495F30);
}

size_t sub_21B974A74(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = *v2;
    CFTypeRef v3 = (std::__shared_weak_count *)v2[1];
    if (v3
      && (atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      if (v4) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 131, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v5 = *(__IOSurface ***)(a1 + 8);
  if (v5)
  {
    unint64_t v6 = *v5;
    long long v7 = (std::__shared_weak_count *)v5[1];
    if (v7
      && (atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      size_t v8 = v6;
    }
    else
    {
      size_t v8 = v6;
    }
  }
  else
  {
    size_t v8 = 0;
  }
  return IOSurfaceGetPlaneCount(v8);
}

size_t sub_21B974BF8(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = *v2;
    CFTypeRef v3 = (std::__shared_weak_count *)v2[1];
    if (v3
      && (atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      if (v4) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 147, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v5 = *(__IOSurface ***)(a1 + 8);
  if (v5)
  {
    unint64_t v6 = *v5;
    long long v7 = (std::__shared_weak_count *)v5[1];
    if (v7
      && (atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      size_t v8 = v6;
    }
    else
    {
      size_t v8 = v6;
    }
  }
  else
  {
    size_t v8 = 0;
  }
  return IOSurfaceGetWidth(v8);
}

size_t sub_21B974D7C(uint64_t a1, size_t planeIndex)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5
      && (atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v6) {
        goto LABEL_6;
      }
    }
    else if (v6)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 152, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    size_t v8 = *(__IOSurface **)v7;
    uint64_t v9 = *(std::__shared_weak_count **)(v7 + 8);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  else
  {
    size_t v8 = 0;
  }

  return IOSurfaceGetWidthOfPlane(v8, planeIndex);
}

size_t sub_21B974EC4(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = *v2;
    CFTypeRef v3 = (std::__shared_weak_count *)v2[1];
    if (v3
      && (atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      if (v4) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 157, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v5 = *(__IOSurface ***)(a1 + 8);
  if (v5)
  {
    uint64_t v6 = *v5;
    uint64_t v7 = (std::__shared_weak_count *)v5[1];
    if (v7
      && (atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      size_t v8 = v6;
    }
    else
    {
      size_t v8 = v6;
    }
  }
  else
  {
    size_t v8 = 0;
  }
  return IOSurfaceGetHeight(v8);
}

size_t sub_21B975048(uint64_t a1, size_t planeIndex)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5
      && (atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v6) {
        goto LABEL_6;
      }
    }
    else if (v6)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 162, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    size_t v8 = *(__IOSurface **)v7;
    uint64_t v9 = *(std::__shared_weak_count **)(v7 + 8);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  else
  {
    size_t v8 = 0;
  }

  return IOSurfaceGetHeightOfPlane(v8, planeIndex);
}

size_t sub_21B975190(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = *v2;
    CFTypeRef v3 = (std::__shared_weak_count *)v2[1];
    if (v3
      && (atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      if (v4) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 192, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v5 = *(__IOSurface ***)(a1 + 8);
  if (v5)
  {
    uint64_t v6 = *v5;
    uint64_t v7 = (std::__shared_weak_count *)v5[1];
    if (v7
      && (atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      size_t v8 = v6;
    }
    else
    {
      size_t v8 = v6;
    }
  }
  else
  {
    size_t v8 = 0;
  }
  return IOSurfaceGetBytesPerElement(v8);
}

size_t sub_21B975314(uint64_t a1, size_t planeIndex)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5
      && (atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v6) {
        goto LABEL_6;
      }
    }
    else if (v6)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 197, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    size_t v8 = *(__IOSurface **)v7;
    uint64_t v9 = *(std::__shared_weak_count **)(v7 + 8);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  else
  {
    size_t v8 = 0;
  }

  return IOSurfaceGetBytesPerElementOfPlane(v8, planeIndex);
}

size_t sub_21B97545C(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = *v2;
    CFTypeRef v3 = (std::__shared_weak_count *)v2[1];
    if (v3
      && (atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      if (v4) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 202, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v5 = *(__IOSurface ***)(a1 + 8);
  if (v5)
  {
    uint64_t v6 = *v5;
    uint64_t v7 = (std::__shared_weak_count *)v5[1];
    if (v7
      && (atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      size_t v8 = v6;
    }
    else
    {
      size_t v8 = v6;
    }
  }
  else
  {
    size_t v8 = 0;
  }
  return IOSurfaceGetBytesPerRow(v8);
}

size_t sub_21B9755E0(uint64_t a1, size_t planeIndex)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5
      && (atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v6) {
        goto LABEL_6;
      }
    }
    else if (v6)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 207, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    size_t v8 = *(__IOSurface **)v7;
    uint64_t v9 = *(std::__shared_weak_count **)(v7 + 8);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  else
  {
    size_t v8 = 0;
  }

  return IOSurfaceGetBytesPerRowOfPlane(v8, planeIndex);
}

uint64_t sub_21B975728(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = *v2;
    CFTypeRef v3 = (std::__shared_weak_count *)v2[1];
    if (v3
      && (atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      if (v4) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 212, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v5 = *(__IOSurface ***)(a1 + 8);
  if (v5)
  {
    uint64_t v6 = *v5;
    uint64_t v7 = (std::__shared_weak_count *)v5[1];
    if (v7
      && (atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      size_t v8 = v6;
    }
    else
    {
      size_t v8 = v6;
    }
  }
  else
  {
    size_t v8 = 0;
  }
  return IOSurfaceGetPixelFormat(v8);
}

uint64_t sub_21B9758AC(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5
      && (atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v6) {
        goto LABEL_6;
      }
    }
    else if (v6)
    {
      goto LABEL_6;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 243, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v9 = v7;
  if (atomic_load_explicit((atomic_ullong *volatile)(v7 + 104), memory_order_acquire) != -1)
  {
    BOOL v11 = &v9;
    BOOL v10 = &v11;
    std::__call_once((std::once_flag::_State_type *)(v7 + 104), &v10, (void (__cdecl *)(void *))sub_21B976320);
  }
  return *(void *)(*(void *)(v7 + 112) + 8 * a2);
}

void sub_21B9759CC(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *v4;
    uint64_t v5 = (std::__shared_weak_count *)v4[1];
    if (v5
      && (atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed),
          !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v6)
      {
LABEL_5:
        if (sub_21B974A74(a1) > a2) {
          goto LABEL_9;
        }
      }
    }
    else if (v6)
    {
      goto LABEL_5;
    }
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/IOSurface/src/IOSurfaceRef.cpp", 299, (uint64_t)"IsValid() && plane_index < NumPlanes()", 38, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_9:
  v8[0] = 0;
  v8[1] = 0;
  value = v8;
  sub_21B97B8C4();
}

void sub_21B9760B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  sub_21B83A360((uint64_t)va1);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B9760CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B9760E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char *a15)
{
}

void sub_21B9760F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B97610C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B976120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B976134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B976148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B97615C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B976170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B976184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_21B83A360((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B976198(uint64_t *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5 = *a1;
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4
    && (atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (v5) {
LABEL_4:
    }
      sub_21B97ABE8(a3);
  }
  else if (v5)
  {
    goto LABEL_4;
  }
  return 0;
}

void sub_21B97630C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

double sub_21B976320(uint64_t ***a1)
{
  uint64_t v1 = ***a1;
  sub_21B973A28((IOSurfaceRef *)v1, &v4);
  int v2 = *(void **)(v1 + 112);
  if (v2)
  {
    *(void *)(v1 + 120) = v2;
    operator delete(v2);
  }
  double result = *(double *)&v4;
  *(_OWORD *)(v1 + 112) = v4;
  *(void *)(v1 + 128) = v5;
  return result;
}

void sub_21B97637C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CBA1870;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_21B97639C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CBA1870;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D495F30);
}

void sub_21B9763F0(uint64_t a1)
{
  int v2 = *(void **)(a1 + 136);
  if (v2)
  {
    *(void *)(a1 + 144) = v2;
    operator delete(v2);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 64));
  CFTypeRef v3 = *(std::__shared_weak_count **)(a1 + 32);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

size_t sub_21B97648C(void **a1)
{
  uint64_t v1 = (_DWORD *)**a1;
  int v2 = (const char *)(*a1)[1];
  uint64_t v3 = v1[6];
  if (v3 != -1) {
    ((void (*)(char *, _DWORD *))off_26CBA18C8[v3])(&v9, v1);
  }
  v1[6] = -1;
  size_t result = strlen(v2);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B836090();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v7 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v7 = result | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    *((void *)v1 + 1) = v5;
    *((void *)v1 + 2) = v8 | 0x8000000000000000;
    *(void *)uint64_t v1 = v6;
  }
  else
  {
    *((unsigned char *)v1 + 23) = result;
    uint64_t v6 = v1;
    if (!result) {
      goto LABEL_11;
    }
  }
  size_t result = (size_t)memmove(v6, v2, v5);
LABEL_11:
  *((unsigned char *)v6 + v5) = 0;
  v1[6] = 1;
  return result;
}

void sub_21B97657C(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  long long v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v14 = v4;
  *(void *)unint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  uint64_t v6 = __p;
  uint64_t v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B836090();
  }
  char v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26CBA18C8[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_21B84C93C((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_21B976738(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_21B83DE50(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97677C(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const void **)(*(void *)a1 + 32);
  char v5 = a2[1];
  long long v4 = a2[2];
  if (v5 < (void *)v4)
  {
    size_t v6 = strlen(*(const char **)(*(void *)a1 + 32));
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_21B836090();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v14 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v14 = v6 | 7;
      }
      uint64_t v15 = v14 + 1;
      size_t v8 = operator new(v14 + 1);
      v5[1] = v7;
      v5[2] = v15 | 0x8000000000000000;
      *char v5 = v8;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v6;
      size_t v8 = v5;
      if (!v6) {
        goto LABEL_19;
      }
    }
    memmove(v8, v3, v7);
LABEL_19:
    *((unsigned char *)v8 + v7) = 0;
    char v16 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_21B846300();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v11 = 2 * v10;
  if (2 * v10 <= v9 + 1) {
    uint64_t v11 = v9 + 1;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_21B845A48();
    }
    char v13 = (char *)operator new(24 * v12);
  }
  else
  {
    char v13 = 0;
  }
  unint64_t v17 = &v13[24 * v9];
  size_t v18 = strlen((const char *)v3);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v24 = v18 | 7;
    }
    uint64_t v25 = v24 + 1;
    size_t v20 = operator new(v24 + 1);
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v25 | 0x8000000000000000;
    *(void *)unint64_t v17 = v20;
  }
  else
  {
    v17[23] = v18;
    size_t v20 = v17;
    if (!v18)
    {
      int v21 = &v13[24 * v12];
      *unint64_t v17 = 0;
      char v16 = v17 + 24;
      unint64_t v22 = (void **)*a2;
      unsigned int v23 = (void **)a2[1];
      if (v23 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v26 = *(_OWORD *)(v23 - 3);
        *((void *)v17 - 1) = *(v23 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        v17 -= 24;
        *(v23 - 2) = 0;
        *(v23 - 1) = 0;
        *(v23 - 3) = 0;
        v23 -= 3;
      }
      while (v23 != v22);
      unsigned int v23 = (void **)*a2;
      uint64_t v27 = (void **)a2[1];
      *a2 = v17;
      a2[1] = v16;
      a2[2] = v21;
      while (v27 != v23)
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v20, v3, v19);
  int v21 = &v13[24 * v12];
  *((unsigned char *)v20 + v19) = 0;
  char v16 = v17 + 24;
  unint64_t v22 = (void **)*a2;
  unsigned int v23 = (void **)a2[1];
  if (v23 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v17;
  a2[1] = v16;
  a2[2] = v21;
LABEL_37:
  if (v23) {
    operator delete(v23);
  }
LABEL_39:
  a2[1] = v16;
}

void sub_21B976A10(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B976A28(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_21B976A30(int a1, unsigned int a2)
{
  if (a1 <= 1278226487)
  {
    if (a1 > 875704421)
    {
      if (a1 > 875836533)
      {
        if (a1 != 875836534)
        {
          int v2 = 1094862674;
          uint64_t v3 = 0x4000000004;
          if (a2 >= 2) {
            uint64_t v4 = 0;
          }
          else {
            uint64_t v4 = 0x4000000004;
          }
          uint64_t v5 = v4 & 0x4000000000;
          int v6 = 1111970369;
          goto LABEL_72;
        }
      }
      else if (a1 != 875704422 && a1 != 875704438 && a1 != 875836518)
      {
        return 0;
      }
      long long v37 = xmmword_21B9B46A0;
      if (a2 <= 2) {
        return *((void *)&v37 + a2);
      }
      else {
        return 0;
      }
    }
    if (a1 <= 843264055)
    {
      if (a1 == 24)
      {
        uint64_t v35 = 0xC000000003;
        if (a2 >= 2) {
          uint64_t v35 = 0;
        }
        return v35 & 0xC0000000FFLL;
      }
      else
      {
        uint64_t v7 = 0x4000000004;
        if (a2 >= 2) {
          uint64_t v7 = 0;
        }
        uint64_t v8 = 0xC000000003;
        if (a2 >= 2) {
          uint64_t v8 = 0;
        }
        if (a1 == 842285639) {
          char v9 = v8;
        }
        else {
          char v9 = 0;
        }
        if (a1 == 842285639) {
          uint64_t v10 = v8 & 0xC000000000;
        }
        else {
          uint64_t v10 = 0;
        }
        if (a1 == 32)
        {
          uint64_t v11 = v7 & 0x4000000000;
        }
        else
        {
          LOBYTE(v7) = v9;
          uint64_t v11 = v10;
        }
        return v11 | v7;
      }
    }
    if (a1 != 843264056)
    {
      int v13 = 843264102;
      uint64_t v14 = 0x8000000008;
      if (a2 >= 2) {
        uint64_t v14 = 0;
      }
      uint64_t v15 = v14 & 0x8000000000;
      int v16 = 843264104;
      uint64_t v17 = 0x4000000004;
      if (a2 >= 2) {
        uint64_t v17 = 0;
      }
      uint64_t v18 = v17 & 0x4000000000;
      goto LABEL_54;
    }
LABEL_101:
    uint64_t v34 = 0x4000000002;
    goto LABEL_107;
  }
  if (a1 <= 1647392358)
  {
    if (a1 > 1380401728)
    {
      if (a1 == 1380401729)
      {
        uint64_t v36 = 0x4000000004;
        if (a2 >= 2) {
          uint64_t v36 = 0;
        }
        return v36 & 0x40000000FFLL;
      }
      int v13 = 1380410945;
      uint64_t v14 = 0x10000000010;
      if (a2 >= 2) {
        uint64_t v14 = 0;
      }
      uint64_t v15 = v14 & 0x10000000000;
      int v16 = 1380411457;
      goto LABEL_51;
    }
    if (a1 != 1278226488)
    {
      int v2 = 1278226534;
      if (a2 >= 2) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = 0x4000000004;
      }
      uint64_t v5 = v4 & 0x4000000000;
      int v6 = 1278226536;
      uint64_t v3 = 0x4000000002;
      goto LABEL_72;
    }
    uint64_t v34 = 0x4000000001;
LABEL_107:
    if (a2 >= 2) {
      uint64_t v34 = 0;
    }
    return v34 & 0x40000000FFLL;
  }
  if (a1 <= 1717855599)
  {
    if (a1 != 1647392359)
    {
      int v13 = 1647589490;
      uint64_t v14 = 0xC000000006;
      if (a2 >= 2) {
        uint64_t v14 = 0;
      }
      uint64_t v15 = v14 & 0xC000000000;
      int v16 = 1647719521;
LABEL_51:
      uint64_t v17 = 0x8000000008;
      if (a2 >= 2) {
        uint64_t v17 = 0;
      }
      uint64_t v18 = v17 & 0x8000000000;
LABEL_54:
      BOOL v19 = a1 == v16;
      if (a1 == v16) {
        unsigned __int8 v20 = v17;
      }
      else {
        unsigned __int8 v20 = 0;
      }
      if (v19) {
        uint64_t v21 = v18;
      }
      else {
        uint64_t v21 = 0;
      }
      BOOL v22 = a1 == v13;
      if (a1 == v13) {
        unsigned __int8 v23 = v14;
      }
      else {
        unsigned __int8 v23 = v20;
      }
      if (v22) {
        uint64_t v24 = v15;
      }
      else {
        uint64_t v24 = v21;
      }
      return v24 | v23;
    }
    goto LABEL_101;
  }
  if (a1 <= 1751410031)
  {
    int v2 = 1717855600;
    uint64_t v3 = 0x4000000004;
    if (a2 >= 2) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 0x4000000004;
    }
    uint64_t v5 = v4 & 0x4000000000;
    int v6 = 1717856627;
LABEL_72:
    if (a2 >= 2) {
      uint64_t v3 = 0;
    }
    if (a1 == v6)
    {
      uint64_t v25 = v3 & 0x4000000000;
    }
    else
    {
      LOBYTE(v3) = 0;
      uint64_t v25 = 0;
    }
    BOOL v26 = a1 == v2;
    if (a1 == v2) {
      unsigned __int8 v27 = v4;
    }
    else {
      unsigned __int8 v27 = v3;
    }
    if (v26) {
      uint64_t v28 = v5;
    }
    else {
      uint64_t v28 = v25;
    }
    return v28 | v27;
  }
  uint64_t v29 = 0x4000000002;
  if (a2 >= 2) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = 0x4000000002;
  }
  if (a2 >= 2) {
    uint64_t v29 = 0;
  }
  if (a1 == 1751411059)
  {
    uint64_t v31 = v29 & 0x4000000000;
  }
  else
  {
    LOBYTE(v29) = 0;
    uint64_t v31 = 0;
  }
  if (a1 == 1751410032) {
    unsigned __int8 v32 = v30;
  }
  else {
    unsigned __int8 v32 = v29;
  }
  if (a1 == 1751410032) {
    uint64_t v33 = v30 & 0x4000000000;
  }
  else {
    uint64_t v33 = v31;
  }
  return v33 | v32;
}

void sub_21B976EB0()
{
  v1[3] = *MEMORY[0x263EF8340];
  v1[0] = 0;
  v1[1] = 0;
  value = v1;
  sub_21B97B8C4();
}

void sub_21B978358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  __cxa_guard_abort(&qword_267C5F940);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B978380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  __cxa_guard_abort(&qword_267C5F920);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9783A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  __cxa_guard_abort(&qword_267C5F900);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9783D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  __cxa_guard_abort(&qword_267C5F8E0);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9783F8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_267C5F930);
  sub_21B83A360(v1);
  _Unwind_Resume(a1);
}

void sub_21B978418(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_267C5F910);
  sub_21B83A360(v1);
  _Unwind_Resume(a1);
}

void sub_21B978438(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_267C5F8F0);
  sub_21B83A360(v1);
  _Unwind_Resume(a1);
}

void sub_21B978458(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_267C5F8D0);
  sub_21B83A360(v1);
  _Unwind_Resume(a1);
}

void sub_21B978478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  sub_21B83A360((uint64_t)&a13);
  sub_21B83A360((uint64_t)&a15);
  sub_21B83A360(v25);
  _Unwind_Resume(a1);
}

void sub_21B9786F0()
{
}

void sub_21B9786F8()
{
}

void sub_21B978700()
{
}

void sub_21B978708()
{
}

void sub_21B978710()
{
}

void sub_21B978718()
{
}

void sub_21B978720()
{
}

void sub_21B978728()
{
}

void sub_21B978730()
{
}

void sub_21B978738()
{
}

void sub_21B978740()
{
}

void sub_21B978748()
{
}

void sub_21B978750()
{
}

void sub_21B978758()
{
}

void sub_21B978760()
{
}

void sub_21B978768()
{
}

void sub_21B978770()
{
}

void sub_21B978778()
{
}

void sub_21B978780()
{
}

void sub_21B978788()
{
}

void sub_21B978790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,char *a21)
{
  sub_21B97B840((uint64_t)&a20, a21);
  sub_21B83A360((uint64_t)&a15);
  sub_21B83A360(v21);
  _Unwind_Resume(a1);
}

void sub_21B9787C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9787E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9787FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B978818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B978834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B978850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B97886C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B978888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9788A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9788C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9788DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B9788F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v7);
  _Unwind_Resume(a1);
}

void sub_21B978914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,char *a21)
{
  sub_21B97B840((uint64_t)&a20, a21);
  sub_21B83A360(v21);
  _Unwind_Resume(a1);
}

void sub_21B978940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  sub_21B83A360((uint64_t)va);
  sub_21B83A360(v12);
  _Unwind_Resume(a1);
}

void sub_21B97895C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
  {
    operator delete(__p);
    sub_21B83A360(v25);
    _Unwind_Resume(a1);
  }
  sub_21B83A360(v25);
  _Unwind_Resume(a1);
}

void sub_21B978980(_Unwind_Exception *a1)
{
  sub_21B83A360(v1);
  _Unwind_Resume(a1);
}

void sub_21B978994(_Unwind_Exception *a1)
{
  sub_21B83A360(v1);
  _Unwind_Resume(a1);
}

void sub_21B9789A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,char *a21)
{
}

void sub_21B9789C0(_Unwind_Exception *a1)
{
  sub_21B83A360(v1);
  _Unwind_Resume(a1);
}

void sub_21B9789E8(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  CFDictionaryRef v5 = *(CFDictionaryRef *)a1;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  if (v4
    && (atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (!v5) {
      goto LABEL_7;
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)a1, @"IOSurfaceName", (const void **)&value))
  {
    sub_21B97AF60((CFIndex)value, a2);
    return;
  }
LABEL_7:
  a2->__r_.__value_.__s.__data_[0] = 0;
  a2[1].__r_.__value_.__s.__data_[0] = 0;
}

uint64_t *sub_21B978AB8(uint64_t *a1, uint64_t *a2)
{
  sub_21B978B3C(a2, &__p);
  sub_21B979C98(a1, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_21B978B20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B978B3C(uint64_t *a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F8C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F8C0))
  {
    sub_21B978C88();
  }
  uint64_t v4 = &xmmword_267C5F948;
  uint64_t v5 = byte_267C5F95F;
  if (byte_267C5F95F < 0)
  {
    uint64_t v5 = *((void *)&xmmword_267C5F948 + 1);
    uint64_t v4 = (long long *)xmmword_267C5F948;
  }
  v8[0] = v4;
  v8[1] = v5;
  void v8[2] = "; ";
  v8[3] = 2;
  uint64_t v6 = *((unsigned __int8 *)a1 + 23);
  if ((v6 & 0x80u) == 0) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = (uint64_t *)*a1;
  }
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = a1[1];
  }
  v8[4] = v7;
  v8[5] = v6;
  v8[6] = "; X/X";
  v8[7] = 5;
  sub_21B84F40C((uint64_t)v8, (uint64_t)&v9, 0, 0, a2);
}

void sub_21B978C6C(_Unwind_Exception *a1)
{
}

void sub_21B978C88()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21B97A840(__p);
  sub_21B97A758((uint64_t)__p, (int)&v1);
}

void sub_21B979194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a23 < 0)
  {
    operator delete(__p);
    if (a30 < 0) {
      goto LABEL_6;
    }
  }
  else if (a30 < 0)
  {
LABEL_6:
    operator delete(a25);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B9792C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (*(unsigned char *)(v15 - 80))
  {
    if (*(char *)(v15 - 81) < 0) {
      operator delete(*(void **)(v15 - 104));
    }
  }
  sub_21B83A360((uint64_t)&a15);
  sub_21B83A360((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_21B9792F4(uint64_t a1, int a2)
{
  uint64_t v4 = (char *)operator new(0x20uLL);
  long long v5 = xmmword_21B9A0740;
  strcpy(v4, "Unsupported pixel format value ");
  int v6 = 1;
  std::to_string(&v7, a2);
  v8[0] = &v4;
  v8[1] = &v7;
  void v8[2] = &v4;
  v8[3] = &v7;
  v8[4] = &v7;
  uint64_t v9 = v8;
  ((void (*)(void **, char **))off_26CBA1960[0])(&v9, &v4);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
  if (v6 == -1) {
    sub_21B84C734();
  }
  v8[0] = &v7;
  uint64_t result = ((uint64_t (*)(void *, char **))off_26CBA1970[v6])(v8, &v4);
  if (v6 != -1) {
    return ((uint64_t (*)(void *, char **))off_26CBA1940[v6])(v8, &v4);
  }
  return result;
}

void sub_21B979430(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21B84C6D8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B97944C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
  {
    operator delete(__p);
    sub_21B84C6D8((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x21B97943CLL);
}

void sub_21B979470(uint64_t a1)
{
  sub_21B8A0AE0((uint64_t)&v1, a1);
}

void sub_21B979560(char *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v10 = a1;
    uint64_t v11 = 0;
    *(void *)a6 = 0;
    *(void *)(a6 + 8) = 0;
    *(void *)(a6 + 16) = 0;
    uint64_t v29 = a1;
    __p[0] = a1;
    uint64_t v12 = &a1[a2];
    while (1)
    {
      uint64_t v15 = v12;
      if (v10 != v12)
      {
        if (a4)
        {
          uint64_t v15 = v10;
LABEL_10:
          uint64_t v16 = a4;
          uint64_t v17 = a3;
          while (*v17 != *v15)
          {
            ++v17;
            if (!--v16)
            {
              if (++v15 != v12) {
                goto LABEL_10;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:
          uint64_t v15 = v12;
        }
      }
      uint64_t v29 = v15;
      if (a5 != 1 && v15 == v10) {
        goto LABEL_6;
      }
      if ((unint64_t)v11 >= *(void *)(a6 + 16))
      {
        uint64_t v11 = sub_21B979800((void **)a6, (uint64_t *)__p, &v29);
        goto LABEL_5;
      }
      unint64_t v18 = v15 - v10;
      if ((unint64_t)(v15 - v10) >= 0x7FFFFFFFFFFFFFF8) {
        sub_21B836090();
      }
      if (v18 > 0x16)
      {
        uint64_t v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v18 | 7) != 0x17) {
          uint64_t v21 = v18 | 7;
        }
        uint64_t v22 = v21 + 1;
        BOOL v19 = (char *)operator new(v21 + 1);
        *((void *)v11 + 1) = v18;
        *((void *)v11 + 2) = v22 | 0x8000000000000000;
        *(void *)uint64_t v11 = v19;
        unint64_t v20 = v15 - v10;
        if (v15 == v10)
        {
LABEL_3:
          int v13 = v19;
          goto LABEL_4;
        }
      }
      else
      {
        v11[23] = v18;
        BOOL v19 = v11;
        unint64_t v20 = v15 - v10;
        if (v15 == v10) {
          goto LABEL_3;
        }
      }
      if (v20 < 0x20 || (unint64_t)(v19 - v10) < 0x20)
      {
        unsigned __int8 v23 = v10;
        int v13 = v19;
      }
      else
      {
        unsigned __int8 v23 = &v10[v20 & 0xFFFFFFFFFFFFFFE0];
        int v13 = &v19[v20 & 0xFFFFFFFFFFFFFFE0];
        uint64_t v24 = v19 + 16;
        uint64_t v25 = (long long *)(v10 + 16);
        unint64_t v26 = v20 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v27 = *v25;
          *(v24 - 1) = *(v25 - 1);
          *uint64_t v24 = v27;
          v24 += 2;
          v25 += 2;
          v26 -= 32;
        }
        while (v26);
        if (v20 == (v20 & 0xFFFFFFFFFFFFFFE0)) {
          goto LABEL_4;
        }
      }
      do
      {
        char v28 = *v23++;
        *v13++ = v28;
      }
      while (v23 != v15);
LABEL_4:
      *int v13 = 0;
      v11 += 24;
      *(void *)(a6 + 8) = v11;
LABEL_5:
      *(void *)(a6 + 8) = v11;
      uint64_t v10 = v29;
LABEL_6:
      __p[0] = v10 + 1;
      if (v10++ == v12) {
        return;
      }
    }
  }
  if (a5)
  {
    char v31 = 0;
    LOBYTE(__p[0]) = 0;
    sub_21B84C93C((void *)a6, (uint64_t)__p, 1uLL);
    if (v31 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    *(void *)a6 = 0;
    *(void *)(a6 + 8) = 0;
    *(void *)(a6 + 16) = 0;
  }
}

void sub_21B9797C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

char *sub_21B979800(void **a1, uint64_t *a2, char **a3)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_21B846300();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v5) {
    unint64_t v5 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v5;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      sub_21B845A48();
    }
    uint64_t v9 = (char *)operator new(24 * v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = &v9[24 * v4];
  char v31 = v10;
  uint64_t v32 = v10;
  uint64_t v33 = &v9[24 * v8];
  uint64_t v11 = *a2;
  uint64_t v12 = *a3;
  unint64_t v13 = (unint64_t)&(*a3)[-v11];
  if (v13 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B836090();
  }
  if (v13 <= 0x16)
  {
    v10[23] = v13;
    if ((char *)v11 != v12) {
      goto LABEL_14;
    }
LABEL_23:
    uint64_t v15 = v10;
    goto LABEL_26;
  }
  uint64_t v20 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v13 | 7) != 0x17) {
    uint64_t v20 = v13 | 7;
  }
  uint64_t v21 = v20 + 1;
  uint64_t v22 = (char *)operator new(v20 + 1);
  *((void *)v10 + 1) = v13;
  *((void *)v10 + 2) = v21 | 0x8000000000000000;
  *(void *)uint64_t v10 = v22;
  uint64_t v10 = v22;
  if ((char *)v11 == v12) {
    goto LABEL_23;
  }
LABEL_14:
  if (v13 < 0x20 || (unint64_t)&v10[-v11] < 0x20)
  {
    uint64_t v14 = (char *)v11;
    uint64_t v15 = v10;
    do
    {
LABEL_25:
      char v23 = *v14++;
      *v15++ = v23;
    }
    while (v14 != v12);
    goto LABEL_26;
  }
  uint64_t v14 = (char *)(v11 + (v13 & 0xFFFFFFFFFFFFFFE0));
  uint64_t v15 = &v10[v13 & 0xFFFFFFFFFFFFFFE0];
  uint64_t v16 = v10 + 16;
  uint64_t v17 = (long long *)(v11 + 16);
  unint64_t v18 = v13 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v19 = *v17;
    *(v16 - 1) = *(v17 - 1);
    *uint64_t v16 = v19;
    v16 += 2;
    v17 += 2;
    v18 -= 32;
  }
  while (v18);
  if (v13 != (v13 & 0x7FFFFFFFFFFFFFE0)) {
    goto LABEL_25;
  }
LABEL_26:
  *uint64_t v15 = 0;
  uint64_t v24 = v31;
  uint64_t v25 = v32 + 24;
  unint64_t v26 = (void **)*a1;
  long long v27 = (void **)a1[1];
  if (v27 == *a1)
  {
    *a1 = v31;
    a1[1] = v25;
    a1[2] = v33;
  }
  else
  {
    do
    {
      long long v28 = *(_OWORD *)(v27 - 3);
      *((void *)v24 - 1) = *(v27 - 1);
      *(_OWORD *)(v24 - 24) = v28;
      v24 -= 24;
      *(v27 - 2) = 0;
      *(v27 - 1) = 0;
      *(v27 - 3) = 0;
      v27 -= 3;
    }
    while (v27 != v26);
    long long v27 = (void **)*a1;
    uint64_t v29 = (void **)a1[1];
    *a1 = v24;
    a1[1] = v25;
    a1[2] = v33;
    while (v29 != v27)
    {
      if (*((char *)v29 - 1) < 0) {
        operator delete(*(v29 - 3));
      }
      v29 -= 3;
    }
  }
  if (v27) {
    operator delete(v27);
  }
  return v32 + 24;
}

void sub_21B979A54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21B846734((uint64_t)va);
  _Unwind_Resume(a1);
}

void **sub_21B979A68(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    unint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        unint64_t v5 = (std::__shared_weak_count *)*((void *)v3 - 1);
        if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      unint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void ***sub_21B979B1C(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    uint64_t v3 = (char *)**result;
    if (v3)
    {
      unint64_t v4 = (char *)v2[1];
      unint64_t v5 = **result;
      if (v4 != v3)
      {
        do
        {
          int v6 = (std::__shared_weak_count *)*((void *)v4 - 1);
          if (v6)
          {
            if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
              std::__shared_weak_count::__release_weak(v6);
            }
          }
          v4 -= 16;
        }
        while (v4 != v3);
        unint64_t v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

void sub_21B979BF8(void *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  *a1 = cf;
  operator new();
}

void sub_21B979C6C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B979C84(_Unwind_Exception *a1)
{
}

void sub_21B979C98(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (v3
    && (atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    if (v4) {
LABEL_4:
    }
      sub_21B97AE28(a2);
  }
  else if (v4)
  {
    goto LABEL_4;
  }
}

void sub_21B979E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21B979E14(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = (std::__shared_weak_count *)a1[1];
  if (v1
    && (atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
    if (v2)
    {
LABEL_4:
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      sub_21B97B268((int)theArray, Mutable, 0);
    }
  }
  else if (v2)
  {
    goto LABEL_4;
  }
}

void sub_21B97A130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21B97A144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a12 && !atomic_fetch_add(&a12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  if (a14)
  {
    if (!atomic_fetch_add(&a14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
      std::__shared_weak_count::__release_weak(a14);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97A1E8(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 24) + 1;
  *(void *)(a1 + 24) = v3;
  IOSurfaceLockOptions v4 = *(_DWORD *)(a1 + 16);
  if (v4)
  {
    if (v4 == 1)
    {
      if (v3 && !*(void *)(a1 + 32))
      {
LABEL_5:
        unint64_t v5 = v2;
        goto LABEL_7;
      }
    }
    else if (v4 != 2 || *(void *)(a1 + 32))
    {
      goto LABEL_5;
    }
    IOSurfaceUnlock(*(IOSurfaceRef *)a1, v4, (uint32_t *)(a1 + 20));
    *(_DWORD *)(a1 + 16) = 0;
  }
  if (*(void *)(a1 + 32))
  {
    IOSurfaceLockOptions v6 = 2;
  }
  else
  {
    if (!*(void *)(a1 + 24)) {
      goto LABEL_5;
    }
    IOSurfaceLockOptions v6 = 1;
  }
  IOSurfaceLock(*(IOSurfaceRef *)a1, v6, (uint32_t *)(a1 + 20));
  *(_DWORD *)(a1 + 16) = v6;
  unint64_t v5 = v2;

LABEL_7:
  std::mutex::unlock(v5);
}

void sub_21B97A2D0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A2E4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A2F8(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32) + 1;
  *(void *)(a1 + 32) = v3;
  IOSurfaceLockOptions v4 = *(_DWORD *)(a1 + 16);
  if (v4)
  {
    if (v4 == 1)
    {
      if (*(void *)(a1 + 24) && !v3) {
        goto LABEL_7;
      }
    }
    else if (v4 != 2 || v3 != 0)
    {
      goto LABEL_7;
    }
    IOSurfaceUnlock(*(IOSurfaceRef *)a1, v4, (uint32_t *)(a1 + 20));
    *(_DWORD *)(a1 + 16) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (v3)
  {
    IOSurfaceLockOptions v7 = 2;
    goto LABEL_17;
  }
  if (!*(void *)(a1 + 24))
  {
LABEL_7:
    IOSurfaceLockOptions v6 = v2;
    goto LABEL_9;
  }
  IOSurfaceLockOptions v7 = 1;
LABEL_17:
  IOSurfaceLock(*(IOSurfaceRef *)a1, v7, (uint32_t *)(a1 + 20));
  *(_DWORD *)(a1 + 16) = v7;
  IOSurfaceLockOptions v6 = v2;

LABEL_9:
  std::mutex::unlock(v6);
}

void sub_21B97A3DC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A3F0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A404(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 24) - 1;
  *(void *)(a1 + 24) = v3;
  IOSurfaceLockOptions v4 = *(_DWORD *)(a1 + 16);
  if (v4)
  {
    if (v4 == 1)
    {
      if (v3 && !*(void *)(a1 + 32))
      {
LABEL_5:
        unint64_t v5 = v2;
        goto LABEL_7;
      }
    }
    else if (v4 != 2 || *(void *)(a1 + 32))
    {
      goto LABEL_5;
    }
    IOSurfaceUnlock(*(IOSurfaceRef *)a1, v4, (uint32_t *)(a1 + 20));
    *(_DWORD *)(a1 + 16) = 0;
  }
  if (*(void *)(a1 + 32))
  {
    IOSurfaceLockOptions v6 = 2;
  }
  else
  {
    if (!*(void *)(a1 + 24)) {
      goto LABEL_5;
    }
    IOSurfaceLockOptions v6 = 1;
  }
  IOSurfaceLock(*(IOSurfaceRef *)a1, v6, (uint32_t *)(a1 + 20));
  *(_DWORD *)(a1 + 16) = v6;
  unint64_t v5 = v2;

LABEL_7:
  std::mutex::unlock(v5);
}

void sub_21B97A4EC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A500(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A514(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32) - 1;
  *(void *)(a1 + 32) = v3;
  IOSurfaceLockOptions v4 = *(_DWORD *)(a1 + 16);
  if (v4)
  {
    if (v4 == 1)
    {
      if (*(void *)(a1 + 24) && !v3) {
        goto LABEL_7;
      }
    }
    else if (v4 != 2 || v3 != 0)
    {
      goto LABEL_7;
    }
    IOSurfaceUnlock(*(IOSurfaceRef *)a1, v4, (uint32_t *)(a1 + 20));
    *(_DWORD *)(a1 + 16) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (v3)
  {
    IOSurfaceLockOptions v7 = 2;
    goto LABEL_17;
  }
  if (!*(void *)(a1 + 24))
  {
LABEL_7:
    IOSurfaceLockOptions v6 = v2;
    goto LABEL_9;
  }
  IOSurfaceLockOptions v7 = 1;
LABEL_17:
  IOSurfaceLock(*(IOSurfaceRef *)a1, v7, (uint32_t *)(a1 + 20));
  *(_DWORD *)(a1 + 16) = v7;
  IOSurfaceLockOptions v6 = v2;

LABEL_9:
  std::mutex::unlock(v6);
}

void sub_21B97A5F8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A60C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21B97A620(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_21B97A954(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_21B97A72C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97A744(_Unwind_Exception *a1)
{
}

void sub_21B97A758(uint64_t a1@<X0>, int a2@<W8>)
{
  CFBundleRef v5 = *(CFBundleRef *)a1;
  IOSurfaceLockOptions v4 = *(std::__shared_weak_count **)(a1 + 8);
  if (v4
    && (atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (v5) {
      goto LABEL_7;
    }
  }
  else if (v5)
  {
    goto LABEL_7;
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Foundation/src/BundleRef.cpp", 54, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
LABEL_7:
  CFURLRef v6 = CFBundleCopyExecutableURL(*(CFBundleRef *)a1);

  sub_21B97C424(a2, v6, 0);
}

void sub_21B97A840(void *a1@<X8>)
{
  sub_21B9806E4((uint64_t)__p);
  if (v4) {
    sub_21B97C574((uint64_t)&bundleURL, (uint64_t)__p);
  }
  *a1 = 0;
  a1[1] = 0;
}

void sub_21B97A920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a17)
  {
    if (a16 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97A954(void *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  *a1 = cf;
  operator new();
}

void sub_21B97A9C8(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97A9E0(_Unwind_Exception *a1)
{
}

void sub_21B97A9F8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D495F30);
}

void sub_21B97AA30(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_21B97AA54(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIP10__CFBundleEC1ES4_EUlS4_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIP10__CFBundleEC1ES4_EUlS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIP10__CFBundleEC1ES4_EUlS4_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIP10__CFBundleEC1ES4_EUlS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_21B97AAC8(int *a1)
{
  uint64_t valuePtr = *a1;
  CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberNSIntegerType, &valuePtr);
  operator new();
}

void sub_21B97ABBC(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97ABD4(_Unwind_Exception *a1)
{
}

void sub_21B97ABE8(unsigned int *a1)
{
  uint64_t valuePtr = *a1;
  CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberNSIntegerType, &valuePtr);
  operator new();
}

void sub_21B97ACDC(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97ACF4(_Unwind_Exception *a1)
{
}

void sub_21B97AD08(uint64_t *a1)
{
  uint64_t valuePtr = *a1;
  CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberNSIntegerType, &valuePtr);
  operator new();
}

void sub_21B97ADFC(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97AE14(_Unwind_Exception *a1)
{
}

void sub_21B97AE28(uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  if (v1 >= 0) {
    uint64_t v2 = (const UInt8 *)a1;
  }
  else {
    uint64_t v2 = *(const UInt8 **)a1;
  }
  if (v1 >= 0) {
    CFIndex v3 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    CFIndex v3 = *(void *)(a1 + 8);
  }
  CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, v3, 0x8000100u, 0);
  operator new();
}

void sub_21B97AF34(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97AF4C(_Unwind_Exception *a1)
{
}

CFIndex sub_21B97AF60@<X0>(CFIndex result@<X0>, std::string *a2@<X8>)
{
  if (!result) {
    goto LABEL_9;
  }
  CFStringRef v3 = (const __CFString *)result;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t result = CFGetTypeID(v3);
  if (result != TypeID) {
    goto LABEL_9;
  }
  uint64_t result = CFStringGetLength(v3);
  if (result)
  {
    CFIndex v5 = result;
    CFIndex usedBufLen = 0;
    v10.location = 0;
    v10.length = result;
    uint64_t result = CFStringGetBytes(v3, v10, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    if (result > 0)
    {
      memset(&v8, 0, sizeof(v8));
      if (usedBufLen)
      {
        std::string::append(&v8, usedBufLen, 0);
        CFIndex v6 = usedBufLen;
        if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          IOSurfaceLockOptions v7 = &v8;
        }
        else {
          IOSurfaceLockOptions v7 = (std::string *)v8.__r_.__value_.__r.__words[0];
        }
      }
      else
      {
        CFIndex v6 = 0;
        IOSurfaceLockOptions v7 = &v8;
      }
      v11.location = 0;
      v11.length = v5;
      uint64_t result = CFStringGetBytes(v3, v11, 0x8000100u, 0, 0, (UInt8 *)v7, v6, 0);
      *a2 = v8;
      goto LABEL_13;
    }
LABEL_9:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
    return result;
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
LABEL_13:
  a2[1].__r_.__value_.__s.__data_[0] = 1;
  return result;
}

void sub_21B97B0A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97B0C4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D495F30);
}

void sub_21B97B0FC(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_21B97B120(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFNumberEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_21B97B198(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D495F30);
}

void sub_21B97B1D0(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_21B97B1F4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK10__CFStringEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void sub_21B97B268(int a1, CFTypeRef cf, int a3)
{
  if (a3)
  {
    if (cf) {
      CFRetain(cf);
    }
    operator new();
  }
  operator new();
}

void sub_21B97B364(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97B378()
{
}

void sub_21B97B3A4()
{
}

void sub_21B97B3B8(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_21B8A096C(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_21B97B4C4(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97B4DC(_Unwind_Exception *a1)
{
}

void sub_21B97B4F4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D495F30);
}

void sub_21B97B52C(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_21B97B550(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIP9__CFArrayEC1ES4_EUlS4_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIP9__CFArrayEC1ES4_EUlS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIP9__CFArrayEC1ES4_EUlS4_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIP9__CFArrayEC1ES4_EUlS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

BOOL sub_21B97B5C8(CFTypeRef *a1, uint64_t a2)
{
  return CFGetTypeID(*a1) == a2;
}

void sub_21B97B5F8(uint64_t a1, const void *a2, int a3)
{
  sub_21B97B6E8((int)&v3, a2, a3);
}

void sub_21B97B6E8(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_21B979BF8(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_21B97B7F4(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97B80C(_Unwind_Exception *a1)
{
}

BOOL sub_21B97B820(const __CFDictionary *a1, const void *a2, const void **a3)
{
  return CFDictionaryGetValueIfPresent(a1, a2, a3) != 0;
}

void sub_21B97B840(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_21B97B840(a1, *(void *)a2);
    sub_21B97B840(a1, *((void *)a2 + 1));
    if (a2[55] < 0)
    {
      operator delete(*((void **)a2 + 4));
      char v4 = a2;
    }
    else
    {
      char v4 = a2;
    }
    operator delete(v4);
  }
}

void sub_21B97B8C4()
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  sub_21B97B3B8((int)theDict, Mutable, 0);
}

void sub_21B97BE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __cxa_free_exception(v9);
  sub_21B83A360((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_21B97BE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21B97BE70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a12 && !atomic_fetch_add(&a12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  if (a14 && !atomic_fetch_add(&a14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a14->__on_zero_shared)(a14);
    std::__shared_weak_count::__release_weak(a14);
  }
  if (a16)
  {
    if (!atomic_fetch_add(&a16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a16->__on_zero_shared)(a16);
      std::__shared_weak_count::__release_weak(a16);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97BF6C(int a1, CFTypeRef cf, int a3)
{
  if (a3) {
    sub_21B97C0A4(&v3, cf);
  }
  CFTypeRef v3 = cf;
  operator new();
}

void sub_21B97C078(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97C090(_Unwind_Exception *a1)
{
}

void sub_21B97C0A4(void *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  *a1 = cf;
  operator new();
}

void sub_21B97C118(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97C130(_Unwind_Exception *a1)
{
}

void *sub_21B97C144(void *a1, CFTypeRef cf)
{
  if (cf)
  {
    v7[0] = (void *)CFCopyDescription(cf);
    operator new();
  }
  int v10 = 0;
  sub_21B84CA68(&__p, "nullptr");
  if (v10 == -1) {
    sub_21B84C734();
  }
  uint64_t v12 = &v11;
  ((void (*)(void **__return_ptr, char **, void **))off_26CBA1AE0[v10])(v7, &v12, &__p);
  if (v10 != -1) {
    ((void (*)(char **, void **))off_26CBA1AC8[v10])(&v12, &__p);
  }
  if ((v8 & 0x80u) == 0) {
    CFTypeRef v3 = v7;
  }
  else {
    CFTypeRef v3 = (void **)v7[0];
  }
  if ((v8 & 0x80u) == 0) {
    uint64_t v4 = v8;
  }
  else {
    uint64_t v4 = (uint64_t)v7[1];
  }
  CFIndex v5 = sub_21B863A18(a1, (uint64_t)v3, v4);
  if ((char)v8 < 0) {
    operator delete(v7[0]);
  }
  return v5;
}

void sub_21B97C384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97C3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_21B84C6D8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B97C3B4(uint64_t a1, ...)
{
  va_start(va, a1);
  sub_21B83A360((uint64_t)va);
  JUMPOUT(0x21B97C41CLL);
}

void sub_21B97C3BC(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97C3D4(_Unwind_Exception *a1)
{
}

void sub_21B97C3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_21B84C6D8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B97C3F8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19 && a18 < 0) {
    operator delete(__p);
  }
  sub_21B83A360((uint64_t)&a10);
  JUMPOUT(0x21B97C41CLL);
}

void sub_21B97C424(int a1, CFTypeRef cf, int a3)
{
  if (a3)
  {
    if (cf) {
      CFRetain(cf);
    }
    operator new();
  }
  operator new();
}

void sub_21B97C520(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97C534()
{
}

void sub_21B97C560()
{
}

void sub_21B97C574(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_21B846188(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v3 = *(void *)(a2 + 16);
  }
  sub_21B97AE28((uint64_t)__p);
}

void sub_21B97C6F4(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CFRelease(v1);
  }
  __cxa_rethrow();
}

void sub_21B97C70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
}

void sub_21B97C788(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFURLRef v3 = *(CFURLRef *)a1;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2
    && (atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    if (v3) {
      goto LABEL_7;
    }
  }
  else if (v3)
  {
    goto LABEL_7;
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Foundation/src/URLRef.cpp", 64, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
LABEL_11:
    abort();
  }
LABEL_7:
  CFURLRef v5 = *(CFURLRef *)a1;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  if (v4
    && (atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed),
        !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (v5) {
      goto LABEL_13;
    }
  }
  else if (v5)
  {
    goto LABEL_13;
  }
  if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Kit/Foundation/src/URLRef.cpp", 58, (uint64_t)"IsValid()", 9, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    goto LABEL_11;
  }
LABEL_13:
  CFStringRef v6 = CFURLCopyScheme(*(CFURLRef *)a1);
  sub_21B97BF6C((int)v7, v6, 0);
}

void sub_21B97CAFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a18)
  {
    if (a17 < 0)
    {
      operator delete(__p);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97CB58(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D495F30);
}

void sub_21B97CB90(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_21B97CBB4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN4cv3d3kit2cf3PtrIPK7__CFURLEC1ES5_EUlS5_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN4cv3d3kit2cf3PtrIPK7__CFURLEC1ES5_EUlS5_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN4cv3d3kit2cf3PtrIPK7__CFURLEC1ES5_EUlS5_E_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN4cv3d3kit2cf3PtrIPK7__CFURLEC1ES5_EUlS5_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void *sub_21B97CC28(void *a1, unsigned int *a2)
{
  sub_21B97CDB4();
  uint64_t v4 = qword_267C5FA28;
  if (!qword_267C5FA28) {
    goto LABEL_12;
  }
  unsigned int v5 = *a2;
  CFStringRef v6 = &qword_267C5FA28;
  do
  {
    unsigned int v7 = *(_DWORD *)(v4 + 32);
    BOOL v8 = v7 >= v5;
    if (v7 >= v5) {
      uint64_t v9 = (uint64_t *)v4;
    }
    else {
      uint64_t v9 = (uint64_t *)(v4 + 8);
    }
    if (v8) {
      CFStringRef v6 = (uint64_t *)v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 != &qword_267C5FA28 && v5 >= *((_DWORD *)v6 + 8))
  {
    sub_21B97CDB4();
    uint64_t v17 = v6[5];
    uint64_t v18 = v6[6];
    return sub_21B863A18(a1, v17, v18);
  }
  else
  {
LABEL_12:
    sub_21B97CDB4();
    unsigned int v20 = *a2;
    int v10 = sub_21B863A18(a1, (uint64_t)"Unknown pixel format '", 22);
    sub_21B97D894((uint64_t)&v21, (uint64_t)&v20, 0, 0, &__p);
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
    unint64_t v13 = sub_21B863A18(v10, (uint64_t)p_p, size);
    sub_21B863A18(v13, (uint64_t)"' (=", 4);
    uint64_t v14 = (void *)std::ostream::operator<<();
    uint64_t result = sub_21B863A18(v14, (uint64_t)")", 1);
    uint64_t v16 = result;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      return v16;
    }
  }
  return result;
}

void sub_21B97CD98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97CDB4()
{
  uint64_t v238 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F960, memory_order_acquire) & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_267C5F960))
    {
      LODWORD(v0[0]) = 1278226488;
      v0[1] = (uint64_t)"OneComponent8";
      v0[2] = 13;
      int v1 = 24;
      uint64_t v2 = "24RGB";
      uint64_t v3 = 5;
      int v4 = 32;
      unsigned int v5 = "32ARGB";
      uint64_t v6 = 6;
      int v7 = 1111970369;
      BOOL v8 = "32BGRA";
      uint64_t v9 = 6;
      int v10 = 1647719521;
      char v11 = "64ARGB";
      uint64_t v12 = 6;
      int v13 = 1647589490;
      uint64_t v14 = "48RGB";
      uint64_t v15 = 5;
      int v16 = 1647392359;
      uint64_t v17 = "16Gray";
      uint64_t v18 = 6;
      int v19 = 875704438;
      unsigned int v20 = "420YpCbCr8BiPlanarVideoRange";
      uint64_t v21 = 28;
      int v22 = 875704422;
      char v23 = "420YpCbCr8BiPlanarFullRange";
      uint64_t v24 = 27;
      int v25 = 875836534;
      unint64_t v26 = "444YpCbCr8BiPlanarVideoRange";
      uint64_t v27 = 28;
      int v28 = 875836518;
      uint64_t v29 = "444YpCbCr8BiPlanarFullRange";
      uint64_t v30 = 27;
      int v31 = 843264056;
      uint64_t v32 = "TwoComponent8";
      uint64_t v33 = 13;
      int v34 = 1278226536;
      uint64_t v35 = "OneComponent16Half";
      uint64_t v36 = 18;
      int v37 = 1278226534;
      int v38 = "OneComponent32Float";
      uint64_t v39 = 19;
      int v40 = 843264104;
      int v41 = "TwoComponent16Half";
      uint64_t v42 = 18;
      int v43 = 843264102;
      uint64_t v44 = "TwoComponent32Float";
      uint64_t v45 = 19;
      int v46 = 1380411457;
      uint64_t v47 = "64RGBAHalf";
      uint64_t v48 = 10;
      int v49 = 1380410945;
      uint64_t v50 = "128RGBAFloat";
      uint64_t v51 = 12;
      int v52 = 1751411059;
      int v53 = "DisparityFloat16";
      uint64_t v54 = 16;
      int v55 = 1717856627;
      long long v56 = "DisparityFloat32";
      uint64_t v57 = 16;
      int v58 = 1751410032;
      uint64_t v59 = "DepthFloat16";
      uint64_t v60 = 12;
      int v61 = 1717855600;
      uint64_t v62 = "DepthFloat32";
      uint64_t v63 = 12;
      int v64 = 842285639;
      uint64_t v65 = "24BGR";
      uint64_t v66 = 5;
      int v67 = 1380401729;
      uint64_t v68 = "32RGBA";
      uint64_t v69 = 6;
      int v70 = 1094862674;
      unint64_t v71 = "32ABGR";
      uint64_t v72 = 6;
      int v73 = 1278226742;
      uint64_t v74 = "OneComponent16";
      uint64_t v75 = 14;
      int v76 = 843264310;
      BOOL v77 = "TwoComponent16";
      uint64_t v78 = 14;
      int v79 = 1;
      unint64_t v80 = "1Monochrome";
      uint64_t v81 = 11;
      int v82 = 2;
      unint64_t v83 = "2Indexed";
      uint64_t v84 = 8;
      int v85 = 4;
      long long v86 = "4Indexed";
      uint64_t v87 = 8;
      int v88 = 8;
      int v89 = "8Indexed";
      uint64_t v90 = 8;
      int v91 = 33;
      uint64_t v92 = "1IndexedGray_WhiteIsZero";
      uint64_t v93 = 24;
      int v94 = 34;
      uint64_t v95 = "2IndexedGray_WhiteIsZero";
      uint64_t v96 = 24;
      int v97 = 36;
      unint64_t v98 = "4IndexedGray_WhiteIsZero";
      uint64_t v99 = 24;
      int v100 = 40;
      uint64_t v101 = "8IndexedGray_WhiteIsZero";
      uint64_t v102 = 24;
      int v103 = 16;
      unint64_t v104 = "16BE555";
      uint64_t v105 = 7;
      int v106 = 1278555445;
      __int16 v107 = "16LE555";
      uint64_t v108 = 7;
      int v109 = 892679473;
      BOOL v110 = "16LE5551";
      uint64_t v111 = 8;
      int v112 = 1110783541;
      unint64_t v113 = "16BE565";
      uint64_t v114 = 7;
      int v115 = 1278555701;
      BOOL v116 = "16LE565";
      uint64_t v117 = 7;
      int v118 = 1815491698;
      long long v119 = "64RGBALE";
      uint64_t v120 = 8;
      int v121 = 1647522401;
      unint64_t v122 = "32AlphaGray";
      uint64_t v123 = 11;
      int v124 = 1378955371;
      uint64_t v125 = "30RGB";
      uint64_t v126 = 5;
      int v127 = 846624121;
      unint64_t v128 = "422YpCbCr8";
      uint64_t v129 = 10;
      int v130 = 1983131704;
      __int16 v131 = "4444YpCbCrA8";
      uint64_t v132 = 12;
      int v133 = 1916022840;
      uint64_t v134 = "4444YpCbCrA8R";
      uint64_t v135 = 13;
      int v136 = 2033463352;
      uint64_t v137 = "4444AYpCbCr8";
      uint64_t v138 = 12;
      int v139 = 2033463606;
      uint64_t v140 = "4444AYpCbCr16";
      uint64_t v141 = 13;
      int v142 = 1983066168;
      unsigned int v143 = "444YpCbCr8";
      uint64_t v144 = 10;
      int v145 = 1983000886;
      unint64_t v146 = "422YpCbCr16";
      uint64_t v147 = 11;
      int v148 = 1983000880;
      long long v149 = "422YpCbCr10";
      uint64_t v150 = 11;
      int v151 = 1983131952;
      long long v152 = "444YpCbCr10";
      uint64_t v153 = 11;
      int v154 = 2033463856;
      long long v155 = "420YpCbCr8Planar";
      uint64_t v156 = 16;
      int v157 = 1714696752;
      v158 = "420YpCbCr8PlanarFullRange";
      uint64_t v159 = 25;
      int v160 = 1630697081;
      long long v161 = "422YpCbCr_4A_8BiPlanar";
      uint64_t v162 = 22;
      int v163 = 875704950;
      uint64_t v164 = "422YpCbCr8BiPlanarVideoRange";
      uint64_t v165 = 28;
      int v166 = 875704934;
      v167 = "422YpCbCr8BiPlanarFullRange";
      uint64_t v168 = 27;
      int v169 = 2037741171;
      v170 = "422YpCbCr8_yuvs";
      uint64_t v171 = 15;
      int v172 = 2037741158;
      v173 = "422YpCbCr8FullRange";
      uint64_t v174 = 19;
      int v175 = 1999843442;
      v176 = "30RGBLEPackedWideGamut";
      uint64_t v177 = 22;
      int v178 = 1815162994;
      v179 = "ARGB2101010LEPacked";
      uint64_t v180 = 19;
      int v181 = 1999908961;
      v182 = "40ARGBLEWideGamut";
      uint64_t v183 = 17;
      int v184 = 1999908973;
      v185 = "40ARGBLEWideGamutPremultiplied";
      uint64_t v186 = 30;
      int v187 = 1278226736;
      v188 = "OneComponent10";
      uint64_t v189 = 14;
      int v190 = 1278226738;
      v191 = "OneComponent12";
      uint64_t v192 = 14;
      int v193 = 1735549492;
      v194 = "14Bayer_GRBG";
      uint64_t v195 = 12;
      int v196 = 1919379252;
      v197 = "14Bayer_RGGB";
      uint64_t v198 = 12;
      int v199 = 1650943796;
      v200 = "14Bayer_BGGR";
      uint64_t v201 = 12;
      int v202 = 1734505012;
      v203 = "14Bayer_GBRG";
      uint64_t v204 = 12;
      int v205 = 1751411059;
      v206 = "DisparityFloat16";
      uint64_t v207 = 16;
      int v208 = 1717856627;
      v209 = "DisparityFloat32";
      uint64_t v210 = 16;
      int v211 = 2016686640;
      v212 = "420YpCbCr10BiPlanarVideoRange";
      uint64_t v213 = 29;
      int v214 = 2016686642;
      v215 = "422YpCbCr10BiPlanarVideoRange";
      uint64_t v216 = 29;
      int v217 = 2016687156;
      v218 = "444YpCbCr10BiPlanarVideoRange";
      uint64_t v219 = 29;
      int v220 = 2019963440;
      v221 = "420YpCbCr10BiPlanarFullRange";
      uint64_t v222 = 28;
      int v223 = 2019963442;
      v224 = "422YpCbCr10BiPlanarFullRange";
      uint64_t v225 = 28;
      int v226 = 2019963956;
      v227 = "444YpCbCr10BiPlanarFullRange";
      uint64_t v228 = 28;
      int v229 = 1982882104;
      v230 = "420YpCbCr8VideoRange_8A_TriPlanar";
      uint64_t v231 = 33;
      int v232 = 1651519798;
      v233 = "16VersatileBayer";
      uint64_t v234 = 16;
      int v235 = 1651521076;
      v236 = "64RGBA_DownscaledProResRAW";
      uint64_t v237 = 26;
      sub_21B97D6B0(v0, 80);
      __cxa_atexit((void (*)(void *))sub_21B97D684, &qword_267C5FA20, &dword_21B831000);
      __cxa_guard_release(&qword_267C5F960);
    }
  }
}

void sub_21B97D66C(_Unwind_Exception *a1)
{
}

uint64_t sub_21B97D684(uint64_t a1)
{
  return a1;
}

uint64_t *sub_21B97D6B0(uint64_t *result, uint64_t a2)
{
  qword_267C5FA30 = 0;
  qword_267C5FA28 = 0;
  qword_267C5FA20 = (uint64_t)&qword_267C5FA28;
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    int v4 = &result[3 * a2];
LABEL_6:
    uint64_t v6 = &qword_267C5FA28;
LABEL_10:
    if (v3)
    {
      int v10 = v6 + 1;
      if (v6[1]) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_20:
      int v10 = &qword_267C5FA28;
      uint64_t v6 = &qword_267C5FA28;
    }
LABEL_21:
    int v13 = operator new(0x38uLL);
    long long v14 = *(_OWORD *)v2;
    v13[6] = v2[2];
    *((_OWORD *)v13 + 2) = v14;
    *int v13 = 0;
    v13[1] = 0;
    v13[2] = v6;
    *int v10 = (uint64_t)v13;
    if (*(void *)qword_267C5FA20)
    {
      qword_267C5FA20 = *(void *)qword_267C5FA20;
      int v13 = (void *)*v10;
    }
    uint64_t result = sub_21B8A4F88((uint64_t *)qword_267C5FA28, v13);
    ++qword_267C5FA30;
LABEL_24:
    while (1)
    {
      v2 += 3;
      if (v2 == v4) {
        break;
      }
      uint64_t v3 = qword_267C5FA28;
      if ((uint64_t *)qword_267C5FA20 == &qword_267C5FA28) {
        goto LABEL_6;
      }
      uint64_t v5 = qword_267C5FA28;
      if (qword_267C5FA28)
      {
        do
        {
          uint64_t v6 = (uint64_t *)v5;
          uint64_t v5 = *(void *)(v5 + 8);
        }
        while (v5);
      }
      else
      {
        int v7 = &qword_267C5FA28;
        do
        {
          uint64_t v6 = (uint64_t *)v7[2];
          BOOL v8 = *v6 == (void)v7;
          int v7 = v6;
        }
        while (v8);
      }
      unsigned int v9 = *(_DWORD *)v2;
      if (*((_DWORD *)v6 + 8) < *(_DWORD *)v2) {
        goto LABEL_10;
      }
      if (!qword_267C5FA28) {
        goto LABEL_20;
      }
      uint64_t v11 = qword_267C5FA28;
      while (1)
      {
        while (1)
        {
          uint64_t v6 = (uint64_t *)v11;
          unsigned int v12 = *(_DWORD *)(v11 + 32);
          if (v12 <= v9) {
            break;
          }
          uint64_t v11 = *v6;
          int v10 = v6;
          if (!*v6) {
            goto LABEL_21;
          }
        }
        if (v12 >= v9) {
          break;
        }
        uint64_t v11 = v6[1];
        if (!v11)
        {
          int v10 = v6 + 1;
          goto LABEL_21;
        }
      }
    }
  }
  return result;
}

void sub_21B97D834(_Unwind_Exception *a1)
{
  sub_21B97D848(v1);
  _Unwind_Resume(a1);
}

void sub_21B97D848(void *a1)
{
  if (a1)
  {
    sub_21B97D848(*a1);
    sub_21B97D848(a1[1]);
    operator delete(a1);
  }
}

void sub_21B97D894(uint64_t a1@<X0>, uint64_t a2@<X2>, const std::string::value_type *a3@<X4>, std::string::size_type a4@<X5>, std::string *a5@<X8>)
{
  uint64_t v10 = a1 - a2;
  if (a1 == a2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = a1 - a2;
  }
  if (v10 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = a1 - a2;
  }
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  std::string::reserve(a5, v11 + (v12 - 1) * a4);
  if (v10 >= 1)
  {
    unsigned int v14 = *(unsigned __int8 *)(a1 - 1);
    uint64_t v13 = a1 - 1;
    *(void *)__s = v14;
    char v17 = 1;
    std::string::append(a5, __s, 1uLL);
    if (v17 < 0)
    {
      operator delete(*(void **)__s);
      if ((unint64_t)v10 < 2) {
        return;
      }
    }
    else if ((unint64_t)v10 < 2)
    {
      return;
    }
    while (v13 != a2)
    {
      std::string::append(a5, a3, a4);
      unsigned int v15 = *(unsigned __int8 *)--v13;
      *(void *)__s = v15;
      char v17 = 1;
      std::string::append(a5, __s, 1uLL);
      if (v17 < 0) {
        operator delete(*(void **)__s);
      }
    }
  }
}

void sub_21B97D9A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97D9E4(int a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6 = (const char *)&unk_21B997215;
  if (a1 == 12) {
    uint64_t v6 = " (ENOMEM)";
  }
  unsigned int v9 = v6;
  uint64_t v11 = (char *)operator new(0x28uLL);
  long long v12 = xmmword_21B9B49B0;
  strcpy(v11, "posix_memalign failed to allocate ");
  int v13 = 1;
  std::to_string(&v14, a2);
  int v16 = (std::string *)&v11;
  char v17 = &v14;
  uint64_t v18 = &v11;
  int v19 = &v14;
  unsigned int v20 = &v14;
  uint64_t v15 = &v16;
  ((void (*)(std::string ***, char **))off_26CBA1B78[0])(&v15, &v11);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  int v16 = (std::string *)&v11;
  char v17 = (std::string *)" bytes with alignment ";
  uint64_t v18 = &v11;
  int v19 = (std::string *)" bytes with alignment ";
  unsigned int v20 = (std::string *)" bytes with alignment ";
  if (v13 == -1) {
    sub_21B84C734();
  }
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  ((void (*)(std::string *, char **))off_26CBA1B88[v13])(&v14, &v11);
  std::to_string(&v14, a3);
  int v16 = (std::string *)&v11;
  char v17 = &v14;
  uint64_t v18 = &v11;
  int v19 = &v14;
  unsigned int v20 = &v14;
  if (v13 == -1) {
    sub_21B84C734();
  }
  uint64_t v15 = &v16;
  ((void (*)(std::string ***, char **))off_26CBA1B70[v13])(&v15, &v11);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  int v16 = (std::string *)&v11;
  char v17 = (std::string *)": error code ";
  uint64_t v18 = &v11;
  int v19 = (std::string *)": error code ";
  unsigned int v20 = (std::string *)": error code ";
  if (v13 == -1) {
    sub_21B84C734();
  }
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  ((void (*)(std::string *, char **))off_26CBA1BA0[v13])(&v14, &v11);
  std::to_string(&v14, a1);
  int v16 = (std::string *)&v11;
  char v17 = &v14;
  uint64_t v18 = &v11;
  int v19 = &v14;
  unsigned int v20 = &v14;
  if (v13 == -1) {
    sub_21B84C734();
  }
  uint64_t v15 = &v16;
  ((void (*)(std::string ***, char **))off_26CBA1B70[v13])(&v15, &v11);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  int v16 = (std::string *)&v11;
  char v17 = (std::string *)&v9;
  uint64_t v18 = &v11;
  int v19 = (std::string *)&v9;
  unsigned int v20 = (std::string *)&v9;
  if (v13 == -1) {
    sub_21B84C734();
  }
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  ((void (*)(std::string *, char **))off_26CBA1BB8[v13])(&v14, &v11);
  if (v13 == -1) {
    sub_21B84C734();
  }
  int v16 = &v14;
  ((void (*)(std::string *__return_ptr, std::string **, char **))off_26CBA1BD0[v13])(&v10, &v16, &v11);
  if (v13 != -1) {
    ((void (*)(std::string **, char **))off_26CBA1B58[v13])(&v16, &v11);
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v7 = &v10;
  }
  else {
    int v7 = (std::string *)v10.__r_.__value_.__r.__words[0];
  }
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v10.__r_.__value_.__l.__size_;
  }
  sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Array/src/ArrayBuffer.cpp", 37, (uint64_t)&unk_21B997215, 0, (uint64_t)v7, size, (void (*)(void **))sub_21B984AC4);
  std::string::~string(&v10);
  abort();
}

void sub_21B97DD10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

size_t sub_21B97DDA8(void **a1)
{
  int v1 = (_DWORD *)**a1;
  uint64_t v2 = (const char *)(*a1)[1];
  uint64_t v3 = v1[6];
  if (v3 != -1) {
    ((void (*)(char *, _DWORD *))off_26CBA1B58[v3])(&v9, v1);
  }
  v1[6] = -1;
  size_t result = strlen(v2);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B836090();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v7 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v7 = result | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    *((void *)v1 + 1) = v5;
    *((void *)v1 + 2) = v8 | 0x8000000000000000;
    *(void *)int v1 = v6;
  }
  else
  {
    *((unsigned char *)v1 + 23) = result;
    uint64_t v6 = v1;
    if (!result) {
      goto LABEL_11;
    }
  }
  size_t result = (size_t)memmove(v6, v2, v5);
LABEL_11:
  *((unsigned char *)v6 + v5) = 0;
  v1[6] = 1;
  return result;
}

void sub_21B97DE98(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  int v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::string v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  uint64_t v6 = __p;
  uint64_t v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B836090();
  }
  char v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26CBA1B58[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_21B84C93C((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_21B97E054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_21B83DE50(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97E098(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const void **)(*(void *)a1 + 32);
  char v5 = a2[1];
  int v4 = a2[2];
  if (v5 < (void *)v4)
  {
    size_t v6 = strlen(*(const char **)(*(void *)a1 + 32));
    if (v6 > 0x7FFFFFFFFFFFFFF7) {
      sub_21B836090();
    }
    size_t v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v14 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v14 = v6 | 7;
      }
      uint64_t v15 = v14 + 1;
      size_t v8 = operator new(v14 + 1);
      v5[1] = v7;
      v5[2] = v15 | 0x8000000000000000;
      *char v5 = v8;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v6;
      size_t v8 = v5;
      if (!v6) {
        goto LABEL_19;
      }
    }
    memmove(v8, v3, v7);
LABEL_19:
    *((unsigned char *)v8 + v7) = 0;
    char v16 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_21B846300();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v11 = 2 * v10;
  if (2 * v10 <= v9 + 1) {
    uint64_t v11 = v9 + 1;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_21B845A48();
    }
    char v13 = (char *)operator new(24 * v12);
  }
  else
  {
    char v13 = 0;
  }
  char v17 = &v13[24 * v9];
  size_t v18 = strlen((const char *)v3);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v24 = v18 | 7;
    }
    uint64_t v25 = v24 + 1;
    unsigned int v20 = operator new(v24 + 1);
    *((void *)v17 + 1) = v19;
    *((void *)v17 + 2) = v25 | 0x8000000000000000;
    *(void *)char v17 = v20;
  }
  else
  {
    v17[23] = v18;
    unsigned int v20 = v17;
    if (!v18)
    {
      uint64_t v21 = &v13[24 * v12];
      *char v17 = 0;
      char v16 = v17 + 24;
      int v22 = (void **)*a2;
      char v23 = (void **)a2[1];
      if (v23 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v26 = *(_OWORD *)(v23 - 3);
        *((void *)v17 - 1) = *(v23 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        v17 -= 24;
        *(v23 - 2) = 0;
        *(v23 - 1) = 0;
        *(v23 - 3) = 0;
        v23 -= 3;
      }
      while (v23 != v22);
      char v23 = (void **)*a2;
      uint64_t v27 = (void **)a2[1];
      *a2 = v17;
      a2[1] = v16;
      a2[2] = v21;
      while (v27 != v23)
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v20, v3, v19);
  uint64_t v21 = &v13[24 * v12];
  *((unsigned char *)v20 + v19) = 0;
  char v16 = v17 + 24;
  int v22 = (void **)*a2;
  char v23 = (void **)a2[1];
  if (v23 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v17;
  a2[1] = v16;
  a2[2] = v21;
LABEL_37:
  if (v23) {
    operator delete(v23);
  }
LABEL_39:
  a2[1] = v16;
}

void sub_21B97E32C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97E344(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

_DWORD *sub_21B97E34C(_DWORD ***a1)
{
  return sub_21B85AC74(**a1, (const char **)(*a1)[1]);
}

void sub_21B97E358(uint64_t *a1, uint64_t a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 16);
  *(void *)((char *)v19 + 7) = *(void *)(a2 + 15);
  int v4 = *(void **)a2;
  v19[0] = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v14 = v4;
  *(void *)uint64_t v15 = v19[0];
  *(void *)&v15[7] = *(void *)((char *)v19 + 7);
  char v16 = v5;
  memset(v19, 0, 15);
  size_t v6 = __p;
  size_t v7 = **(const char ***)(v2 + 24);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B836090();
  }
  unint64_t v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    size_t v6 = operator new(v11 + 1);
    __p[1] = v9;
    unint64_t v18 = v12 | 0x8000000000000000;
    __p[0] = v6;
LABEL_9:
    memmove(v6, v7, (size_t)v9);
    *((unsigned char *)v9 + (void)v6) = 0;
    uint64_t v10 = *(unsigned int *)(v3 + 24);
    if (v10 == -1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  HIBYTE(v18) = v8;
  if (v8) {
    goto LABEL_9;
  }
  LOBYTE(__p[0]) = 0;
  uint64_t v10 = *(unsigned int *)(v3 + 24);
  if (v10 != -1) {
LABEL_10:
  }
    ((void (*)(char *, uint64_t))off_26CBA1B58[v10])(&v13, v3);
LABEL_11:
  *(_DWORD *)(v3 + 24) = -1;
  sub_21B84C93C((void *)v3, (uint64_t)&v14, 2uLL);
  *(_DWORD *)(v3 + 24) = 2;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      return;
    }
LABEL_15:
    operator delete(v14);
    return;
  }
  operator delete(__p[0]);
  if (v16 < 0) {
    goto LABEL_15;
  }
}

void sub_21B97E518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_21B83DE50(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97E55C(uint64_t a1, void **a2)
{
  uint64_t v3 = *(const char ***)(*(void *)a1 + 32);
  char v5 = a2[1];
  int v4 = a2[2];
  size_t v6 = *v3;
  if (v5 < (void *)v4)
  {
    size_t v7 = strlen(*v3);
    if (v7 > 0x7FFFFFFFFFFFFFF7) {
      sub_21B836090();
    }
    size_t v8 = v7;
    if (v7 >= 0x17)
    {
      uint64_t v15 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v15 = v7 | 7;
      }
      uint64_t v16 = v15 + 1;
      unint64_t v9 = operator new(v15 + 1);
      v5[1] = v8;
      v5[2] = v16 | 0x8000000000000000;
      *char v5 = v9;
    }
    else
    {
      *((unsigned char *)v5 + 23) = v7;
      unint64_t v9 = v5;
      if (!v7) {
        goto LABEL_19;
      }
    }
    memmove(v9, v6, v8);
LABEL_19:
    *((unsigned char *)v9 + v8) = 0;
    char v17 = (char *)(v5 + 3);
    a2[1] = v5 + 3;
    goto LABEL_39;
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a2) >> 3);
  if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_21B846300();
  }
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a2) >> 3);
  uint64_t v12 = 2 * v11;
  if (2 * v11 <= v10 + 1) {
    uint64_t v12 = v10 + 1;
  }
  if (v11 >= 0x555555555555555) {
    unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v13)
  {
    if (v13 > 0xAAAAAAAAAAAAAAALL) {
      sub_21B845A48();
    }
    uint64_t v14 = (char *)operator new(24 * v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  unint64_t v18 = &v14[24 * v10];
  size_t v19 = strlen(v6);
  if (v19 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  size_t v20 = v19;
  if (v19 >= 0x17)
  {
    uint64_t v25 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v25 = v19 | 7;
    }
    uint64_t v26 = v25 + 1;
    uint64_t v21 = operator new(v25 + 1);
    *((void *)v18 + 1) = v20;
    *((void *)v18 + 2) = v26 | 0x8000000000000000;
    *(void *)unint64_t v18 = v21;
  }
  else
  {
    v18[23] = v19;
    uint64_t v21 = v18;
    if (!v19)
    {
      int v22 = &v14[24 * v13];
      *unint64_t v18 = 0;
      char v17 = v18 + 24;
      char v23 = (void **)*a2;
      uint64_t v24 = (void **)a2[1];
      if (v24 == *a2) {
        goto LABEL_36;
      }
      do
      {
LABEL_30:
        long long v27 = *(_OWORD *)(v24 - 3);
        *((void *)v18 - 1) = *(v24 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        v18 -= 24;
        *(v24 - 2) = 0;
        *(v24 - 1) = 0;
        *(v24 - 3) = 0;
        v24 -= 3;
      }
      while (v24 != v23);
      uint64_t v24 = (void **)*a2;
      int v28 = (void **)a2[1];
      *a2 = v18;
      a2[1] = v17;
      a2[2] = v22;
      while (v28 != v24)
      {
        if (*((char *)v28 - 1) < 0) {
          operator delete(*(v28 - 3));
        }
        v28 -= 3;
      }
      goto LABEL_37;
    }
  }
  memmove(v21, v6, v20);
  int v22 = &v14[24 * v13];
  *((unsigned char *)v21 + v20) = 0;
  char v17 = v18 + 24;
  char v23 = (void **)*a2;
  uint64_t v24 = (void **)a2[1];
  if (v24 != *a2) {
    goto LABEL_30;
  }
LABEL_36:
  *a2 = v18;
  a2[1] = v17;
  a2[2] = v22;
LABEL_37:
  if (v24) {
    operator delete(v24);
  }
LABEL_39:
  a2[1] = v17;
}

void sub_21B97E7F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B97E80C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_21B97E814(std::string *a1@<X8>)
{
  v44[19] = *MEMORY[0x263EF8340];
  *(void *)&v31[40] = 0x4000000001;
  *(void *)&v31[24] = 4;
  *(_DWORD *)&v31[32] = 0;
  sub_21B91AA18((unsigned int *)&v31[24], (unsigned int *)&v31[28], (unsigned int *)&v31[32], &v31[48]);
  sub_21B84DF0C(*(uint64_t *)&v31[48], v32, "_", 1uLL, &v24, v2, v3);
  uint64_t v4 = *(void *)&v31[48];
  if (*(void *)&v31[48])
  {
    uint64_t v5 = v32;
    size_t v6 = *(void **)&v31[48];
    if (v32 != *(void *)&v31[48])
    {
      do
      {
        if (*(char *)(v5 - 1) < 0) {
          operator delete(*(void **)(v5 - 24));
        }
        v5 -= 24;
      }
      while (v5 != v4);
      size_t v6 = *(void **)&v31[48];
    }
    uint64_t v32 = v4;
    operator delete(v6);
  }
  *(void *)&v31[48] = "densefeat";
  uint64_t v32 = 9;
  uint64_t v33 = "maps";
  uint64_t v34 = 4;
  sub_21B91AB9C("b", (int *)&v31[40]);
  uint64_t v7 = HIBYTE(v30);
  if (v30 >= 0) {
    size_t v8 = &v29;
  }
  else {
    size_t v8 = v29;
  }
  if (v30 < 0) {
    uint64_t v7 = v30;
  }
  uint64_t v35 = v8;
  uint64_t v36 = v7;
  sub_21B91AB9C("d", (int *)&v31[44]);
  unint64_t v9 = v28;
  if ((v28 & 0x80u) == 0) {
    unint64_t v10 = v27;
  }
  else {
    unint64_t v10 = (void **)v27[0];
  }
  if ((v28 & 0x80u) != 0) {
    unint64_t v9 = (unint64_t)v27[1];
  }
  int v37 = v10;
  unint64_t v38 = v9;
  uint64_t v39 = "quant";
  uint64_t v40 = 5;
  std::string::size_type size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
  uint64_t v12 = &v24;
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
  {
    std::string::size_type size = v24.__r_.__value_.__l.__size_;
    uint64_t v12 = (std::string *)v24.__r_.__value_.__r.__words[0];
  }
  int v41 = v12;
  uint64_t v42 = (void *)size;
  sub_21B84F40C((uint64_t)&v31[48], (uint64_t)v43, "_", 1uLL, (std::string *)v31);
  unint64_t v13 = std::string::append((std::string *)v31, ".mlmodelc/model.espresso.net", 0x1CuLL);
  std::string v26 = *v13;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if ((v31[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)v31);
    if (((char)v28 & 0x80000000) == 0)
    {
LABEL_23:
      if ((SHIBYTE(v30) & 0x80000000) == 0) {
        goto LABEL_24;
      }
LABEL_45:
      operator delete(v29);
      if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_46;
    }
  }
  else if (((char)v28 & 0x80000000) == 0)
  {
    goto LABEL_23;
  }
  operator delete(v27[0]);
  if (SHIBYTE(v30) < 0) {
    goto LABEL_45;
  }
LABEL_24:
  if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_25;
  }
LABEL_46:
  operator delete(v24.__r_.__value_.__l.__data_);
LABEL_25:
  int v14 = SHIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v15 = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t v15 = v26.__r_.__value_.__l.__size_;
  }
  unint64_t v16 = v15 + 49;
  if (v15 + 49 >= 0x7FFFFFFFFFFFFFF8) {
    sub_21B836090();
  }
  if (v16 <= 0x16)
  {
    qmemcpy(v31, "CV3D_LearnedFeatures_DenseFeatNet_EndToEnd_Model/", 49);
    char v17 = &v31[49];
LABEL_34:
    if (v14 >= 0) {
      uint64_t v21 = &v26;
    }
    else {
      uint64_t v21 = (std::string *)v26.__r_.__value_.__r.__words[0];
    }
    memmove(v17, v21, v15);
    goto LABEL_38;
  }
  uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v16 | 7) != 0x17) {
    uint64_t v18 = v16 | 7;
  }
  uint64_t v19 = v18 + 1;
  size_t v20 = (char *)operator new(v18 + 1);
  *(void *)&v31[8] = v15 + 49;
  *(void *)&v31[16] = v19 | 0x8000000000000000;
  *(void *)int v31 = v20;
  qmemcpy(v20, "CV3D_LearnedFeatures_DenseFeatNet_EndToEnd_Model/", 49);
  char v17 = v20 + 49;
  if (v15) {
    goto LABEL_34;
  }
LABEL_38:
  v17[v15] = 0;
  sub_21B844260((uint64_t)&v31[48]);
  uint64_t v29 = operator new(0x20uLL);
  long long v30 = xmmword_21B9AE730;
  strcpy((char *)v29, "com.apple.LearnedFeatures");
  sub_21B97FE7C((uint64_t)&v29, (std::string::size_type)v31, &v33, 1, &v24);
  if (SHIBYTE(v30) < 0) {
    operator delete(v29);
  }
  if (!v25)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to access model resource path");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_21B846188(a1, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
    if (v25 && SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *a1 = v24;
  }
  *(void *)&v31[48] = *MEMORY[0x263F8C2B8];
  int v22 = *(const char **)(MEMORY[0x263F8C2B8] + 72);
  *(void *)&v31[*(void *)(*(void *)&v31[48] - 24) + 48] = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v33 = v22;
  uint64_t v34 = MEMORY[0x263F8C318] + 16;
  if ((v43[15] & 0x80000000) != 0) {
    operator delete(v42);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D495E70](v44);
  if ((v31[23] & 0x80000000) == 0)
  {
    if ((v14 & 0x80000000) == 0) {
      return;
    }
LABEL_56:
    operator delete(v26.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(*(void **)v31);
  if (v14 < 0) {
    goto LABEL_56;
  }
}

void sub_21B97ED74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  __cxa_free_exception(v41);
  if (a15 && a14 < 0) {
    operator delete(__p);
  }
  sub_21B844544((uint64_t)&a41);
  if (a37 < 0) {
    operator delete(a32);
  }
  if (v42 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(a1);
}

void sub_21B97EEA8(std::string *a1@<X8>)
{
  int64x2_t v2 = (char *)operator new(0x70uLL);
  long long v14 = xmmword_21B9B49C0;
  strcpy(v2, "CV3D_LearnedFeatures_BinaryDenseFeatNet_EndToEnd_Model/train_desc_binary-38tburr39x_412080/model.espresso.net");
  unint64_t v13 = v2;
  sub_21B844260((uint64_t)v9);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = xmmword_21B9AE730;
  strcpy(__p.__r_.__value_.__l.__data_, "com.apple.LearnedFeatures");
  sub_21B97FE7C((uint64_t)&__p, (std::string::size_type)&v13, v10, 1, &v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (!v8)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_21B91A560(v9, &v5);
    sub_21B836FF8("Failed to access model resource path: ", &v5, &__p);
    std::runtime_error::runtime_error(exception, &__p);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_21B846188(a1, v7.__r_.__value_.__l.__data_, v7.__r_.__value_.__l.__size_);
    if (v8 && SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v7.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *a1 = v7;
  }
  v9[0] = *MEMORY[0x263F8C2B8];
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v9 + *(void *)(v9[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v10[0] = v3;
  v10[1] = MEMORY[0x263F8C318] + 16;
  if (v11 < 0) {
    operator delete((void *)v10[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D495E70](&v12);
  if (SHIBYTE(v14) < 0) {
    operator delete(v13);
  }
}

void sub_21B97F18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,int a28,__int16 a29,char a30,char a31)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v32 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if (!v32)
  {
LABEL_8:
    if (a27 && a26 < 0) {
      operator delete(a21);
    }
    sub_21B844544((uint64_t)&a29);
    if (*(char *)(v33 - 49) < 0) {
      operator delete(*(void **)(v33 - 72));
    }
    _Unwind_Resume(a1);
  }
  __cxa_free_exception(v31);
  goto LABEL_8;
}

void sub_21B97F248(std::string *a1@<X8>)
{
  int64x2_t v2 = (char *)operator new(0x68uLL);
  long long v14 = xmmword_21B9B49D0;
  strcpy(v2, "CV3D_LearnedFeatures_FloatDenseFeatNet_EndToEnd_Model/train_desc-kgeymr4m7f_206040/model.espresso.net");
  unint64_t v13 = v2;
  sub_21B844260((uint64_t)v9);
  std::string __p = operator new(0x20uLL);
  long long v6 = xmmword_21B9AE730;
  strcpy((char *)__p, "com.apple.LearnedFeatures");
  sub_21B97FE7C((uint64_t)&__p, (std::string::size_type)&v13, v10, 1, &v7);
  if (SHIBYTE(v6) < 0) {
    operator delete(__p);
  }
  if (!v8)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to access model resource path");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_21B846188(a1, v7.__r_.__value_.__l.__data_, v7.__r_.__value_.__l.__size_);
    if (v8 && SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v7.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *a1 = v7;
  }
  v9[0] = *MEMORY[0x263F8C2B8];
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v9 + *(void *)(v9[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v10[0] = v3;
  v10[1] = MEMORY[0x263F8C318] + 16;
  if (v11 < 0) {
    operator delete((void *)v10[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D495E70](&v12);
  if (SHIBYTE(v14) < 0) {
    operator delete(v13);
  }
}

void sub_21B97F4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,int a23,__int16 a24,char a25,char a26)
{
  __cxa_free_exception(v26);
  if (a22 && a21 < 0) {
    operator delete(__p);
  }
  sub_21B844544((uint64_t)&a24);
  if (*(char *)(v27 - 49) < 0) {
    operator delete(*(void **)(v27 - 72));
  }
  _Unwind_Resume(a1);
}

void sub_21B97F56C(std::string *a1@<X8>)
{
  int64x2_t v2 = (char *)operator new(0x60uLL);
  long long v14 = xmmword_21B9B49E0;
  strcpy(v2, "CV3D_LearnedFeatures_GlobalFeat_EndToEnd_Model/i_128f_u8_3_7_0_a3p73mmcsz_b1/model.espresso.net");
  unint64_t v13 = v2;
  sub_21B844260((uint64_t)v9);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = xmmword_21B9AE730;
  strcpy(__p.__r_.__value_.__l.__data_, "com.apple.LearnedFeatures");
  sub_21B97FE7C((uint64_t)&__p, (std::string::size_type)&v13, v10, 1, &v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (!v8)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_21B91A560(v9, &v5);
    sub_21B836FF8("Failed to access model resource path: ", &v5, &__p);
    std::runtime_error::runtime_error(exception, &__p);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_21B846188(a1, v7.__r_.__value_.__l.__data_, v7.__r_.__value_.__l.__size_);
    if (v8 && SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v7.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *a1 = v7;
  }
  v9[0] = *MEMORY[0x263F8C2B8];
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v9 + *(void *)(v9[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v10[0] = v3;
  v10[1] = MEMORY[0x263F8C318] + 16;
  if (v11 < 0) {
    operator delete((void *)v10[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D495E70](&v12);
  if (SHIBYTE(v14) < 0) {
    operator delete(v13);
  }
}

void sub_21B97F834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,int a28,__int16 a29,char a30,char a31)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v32 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if (!v32)
  {
LABEL_8:
    if (a27 && a26 < 0) {
      operator delete(a21);
    }
    sub_21B844544((uint64_t)&a29);
    if (*(char *)(v33 - 33) < 0) {
      operator delete(*(void **)(v33 - 56));
    }
    _Unwind_Resume(a1);
  }
  __cxa_free_exception(v31);
  goto LABEL_8;
}

void sub_21B97F8F0(int a1@<W0>, std::string *a2@<X8>)
{
  if (a1) {
    uint64_t v3 = ".bundle";
  }
  else {
    uint64_t v3 = ".espresso.net";
  }
  if (a1) {
    size_t v4 = 7;
  }
  else {
    size_t v4 = 13;
  }
  HIBYTE(v27[9]) = v4;
  memcpy(&v27[7], v3, v4);
  *((unsigned char *)&v27[7] + v4) = 0;
  int v5 = SHIBYTE(v27[9]);
  if (SHIBYTE(v27[9]) >= 0) {
    size_t v6 = HIBYTE(v27[9]);
  }
  else {
    size_t v6 = (size_t)v27[8];
  }
  unint64_t v7 = v6 + 72;
  if (v6 + 72 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v7 <= 0x16)
  {
    qmemcpy(&v27[4], "p32_64u_u8_3_7_0_6aa24xpnhm_b1024_gf_i_128f_u8_3_7_0_a3p73mmcsz_b1/model", 72);
    char v8 = (char *)&v28;
LABEL_16:
    if (v5 >= 0) {
      unint64_t v10 = &v27[7];
    }
    else {
      unint64_t v10 = (void **)v27[7];
    }
    memmove(v8, v10, v6);
    goto LABEL_20;
  }
  uint64_t v9 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v7 | 7) != 0x17) {
    uint64_t v9 = v7 | 7;
  }
  v27[5] = (void *)(v6 + 72);
  v27[6] = (void *)((v9 + 1) | 0x8000000000000000);
  v27[4] = operator new(v9 + 1);
  qmemcpy(v27[4], "p32_64u_u8_3_7_0_6aa24xpnhm_b1024_gf_i_128f_u8_3_7_0_a3p73mmcsz_b1/model", 72);
  char v8 = (char *)v27[4] + 72;
  if (v6) {
    goto LABEL_16;
  }
LABEL_20:
  v8[v6] = 0;
  int v11 = SHIBYTE(v27[6]);
  if (SHIBYTE(v27[6]) >= 0) {
    size_t v12 = HIBYTE(v27[6]);
  }
  else {
    size_t v12 = (size_t)v27[5];
  }
  unint64_t v13 = v12 + 57;
  if (v12 + 57 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v13 <= 0x16)
  {
    qmemcpy(v27, "CV3D_LearnedFeatures_ATUHardNetGlobalFeat_EndToEnd_Model/", 57);
    long long v14 = (char *)&v27[7] + 1;
LABEL_29:
    if (v11 >= 0) {
      unint64_t v16 = &v27[4];
    }
    else {
      unint64_t v16 = (void **)v27[4];
    }
    memmove(v14, v16, v12);
    goto LABEL_33;
  }
  uint64_t v15 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v13 | 7) != 0x17) {
    uint64_t v15 = v13 | 7;
  }
  v27[1] = (void *)(v12 + 57);
  v27[2] = (void *)((v15 + 1) | 0x8000000000000000);
  v27[0] = operator new(v15 + 1);
  qmemcpy(v27[0], "CV3D_LearnedFeatures_ATUHardNetGlobalFeat_EndToEnd_Model/", 57);
  long long v14 = (char *)v27[0] + 57;
  if (v12) {
    goto LABEL_29;
  }
LABEL_33:
  v14[v12] = 0;
  sub_21B844260((uint64_t)v23);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = xmmword_21B9AE730;
  strcpy(__p.__r_.__value_.__l.__data_, "com.apple.LearnedFeatures");
  sub_21B97FE7C((uint64_t)&__p, (std::string::size_type)v27, v24, 1, &v21);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (!v22)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_21B91A560(v23, &v19);
    sub_21B836FF8("Failed to access model resource path: ", &v19, &__p);
    std::runtime_error::runtime_error(exception, &__p);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_21B846188(a2, v21.__r_.__value_.__l.__data_, v21.__r_.__value_.__l.__size_);
    if (v22 && SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *a2 = v21;
  }
  v23[0] = *MEMORY[0x263F8C2B8];
  uint64_t v17 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v23 + *(void *)(v23[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v24[0] = v17;
  v24[1] = MEMORY[0x263F8C318] + 16;
  if (v25 < 0) {
    operator delete((void *)v24[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D495E70](&v26);
  if (SHIBYTE(v27[2]) < 0)
  {
    operator delete(v27[0]);
    if ((v11 & 0x80000000) == 0)
    {
LABEL_45:
      if ((v5 & 0x80000000) == 0) {
        return;
      }
LABEL_49:
      operator delete(v27[7]);
      return;
    }
  }
  else if ((v11 & 0x80000000) == 0)
  {
    goto LABEL_45;
  }
  operator delete(v27[4]);
  if (v5 < 0) {
    goto LABEL_49;
  }
}

void sub_21B97FD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,int a29,__int16 a30,char a31,char a32)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v33 & 1) == 0)
    {
LABEL_8:
      if (a28)
      {
        if (a27 < 0) {
          operator delete(a22);
        }
      }
      sub_21B844544((uint64_t)&a30);
      if (*(char *)(v36 - 137) < 0)
      {
        operator delete(*(void **)(v36 - 160));
        if ((v35 & 0x80000000) == 0)
        {
LABEL_13:
          if ((v34 & 0x80000000) == 0) {
            goto LABEL_14;
          }
          goto LABEL_17;
        }
      }
      else if ((v35 & 0x80000000) == 0)
      {
        goto LABEL_13;
      }
      operator delete(*(void **)(v36 - 128));
      if ((v34 & 0x80000000) == 0) {
LABEL_14:
      }
        _Unwind_Resume(a1);
LABEL_17:
      operator delete(*(void **)(v36 - 104));
      _Unwind_Resume(a1);
    }
  }
  else if (!v33)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v32);
  goto LABEL_8;
}

void sub_21B97FE7C(uint64_t a1@<X0>, std::string::size_type a2@<X1>, void *a3@<X2>, char a4@<W3>, std::string *a5@<X8>)
{
  v53[1] = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v10 = a1;
  }
  else {
    uint64_t v10 = *(void *)a1;
  }
  uint64_t v11 = [NSString stringWithUTF8String:v10];
  size_t v12 = (void *)[MEMORY[0x263F086E0] bundleWithIdentifier:v11];
  if (!v12)
  {
    if (a4)
    {
      uint64_t v18 = sub_21B863A18(a3, (uint64_t)"Could not find bundle '", 23);
      int v19 = *(char *)(a1 + 23);
      if (v19 >= 0) {
        uint64_t v20 = a1;
      }
      else {
        uint64_t v20 = *(void *)a1;
      }
      if (v19 >= 0) {
        uint64_t v21 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        uint64_t v21 = *(void *)(a1 + 8);
      }
      char v22 = sub_21B863A18(v18, v20, v21);
      char v23 = sub_21B863A18(v22, (uint64_t)"'.", 2);
      std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(void *)(*v23 - 24)));
      std::string v24 = std::locale::use_facet((const std::locale *)&v51, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale((std::locale *)&v51);
      std::ostream::put();
      std::ostream::flush();
    }
    a5->__r_.__value_.__s.__data_[0] = 0;
    a5[1].__r_.__value_.__s.__data_[0] = 0;
    return;
  }
  unint64_t v13 = (void *)[v12 resourcePath];
  if (!v13
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Resource/src/Resource.cpp", 125, (uint64_t)"resources_path", 14, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
  long long v14 = (const char *)[v13 UTF8String];
  size_t v15 = strlen(v14);
  if (v15 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  size_t v16 = v15;
  if (v15 >= 0x17)
  {
    uint64_t v25 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v25 = v15 | 7;
    }
    uint64_t v26 = v25 + 1;
    p_dst = (void **)operator new(v25 + 1);
    size_t v47 = v16;
    int64_t v48 = v26 | 0x8000000000000000;
    int __dst = p_dst;
    goto LABEL_23;
  }
  HIBYTE(v48) = v15;
  p_dst = (void **)&__dst;
  if (v15) {
LABEL_23:
  }
    memmove(p_dst, v14, v16);
  *((unsigned char *)p_dst + v16) = 0;
  int v27 = SHIBYTE(v48);
  if (v48 >= 0) {
    size_t v28 = HIBYTE(v48);
  }
  else {
    size_t v28 = v47;
  }
  unint64_t v29 = v28 + 10;
  if (v28 + 10 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v29 >= 0x17)
  {
    uint64_t v31 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v29 | 7) != 0x17) {
      uint64_t v31 = v29 | 7;
    }
    uint64_t v32 = v31 + 1;
    p_p = (std::string *)operator new(v31 + 1);
    __p.__r_.__value_.__l.__size_ = v28 + 10;
    __p.__r_.__value_.__r.__words[2] = v32 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
  }
  else
  {
    memset(&__p, 0, sizeof(__p));
    p_p = &__p;
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = v28 + 10;
    if (!v28) {
      goto LABEL_38;
    }
  }
  if (v27 >= 0) {
    int v33 = (void **)&__dst;
  }
  else {
    int v33 = __dst;
  }
  memmove(p_p, v33, v28);
LABEL_38:
  strcpy((char *)p_p + v28, "/.disabled");
  v51.__pn_ = __p;
  std::__fs::filesystem::__status(&v51, 0);
  if (SHIBYTE(v51.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v51.__pn_.__r_.__value_.__l.__data_);
  }
  std::string::size_type v34 = HIBYTE(v48);
  int v35 = (void **)&__dst;
  if (v48 < 0)
  {
    int v35 = __dst;
    std::string::size_type v34 = v47;
  }
  v51.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v35;
  v51.__pn_.__r_.__value_.__l.__size_ = v34;
  uint64_t v36 = *(unsigned __int8 *)(a2 + 23);
  if ((v36 & 0x80u) == 0) {
    std::string::size_type v37 = a2;
  }
  else {
    std::string::size_type v37 = *(void *)a2;
  }
  if ((v36 & 0x80u) != 0) {
    uint64_t v36 = *(void *)(a2 + 8);
  }
  v51.__pn_.__r_.__value_.__r.__words[2] = v37;
  uint64_t v52 = v36;
  sub_21B84F40C((uint64_t)&v51, (uint64_t)v53, "/", 1uLL, &__p);
  memset(&v51, 0, sizeof(v51));
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v39 = &__p;
  }
  else {
    uint64_t v39 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  sub_21B9803DC((unint64_t)&v51, (char *)v39, (char *)v39 + size);
  std::__fs::filesystem::__status(&v51, 0);
  unsigned __int8 v40 = v50;
  if (SHIBYTE(v51.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v51.__pn_.__r_.__value_.__l.__data_);
    int v41 = v40;
    if (!v40) {
      goto LABEL_57;
    }
  }
  else
  {
    int v41 = v50;
    if (!(_BYTE)v50) {
      goto LABEL_57;
    }
  }
  if (v41 != 255)
  {
    *a5 = __p;
    a5[1].__r_.__value_.__s.__data_[0] = 1;
    if (SHIBYTE(v48) < 0) {
      goto LABEL_69;
    }
    return;
  }
LABEL_57:
  if (a4)
  {
    int v42 = sub_21B863A18(a3, (uint64_t)"Resource at '", 13);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v43 = &__p;
    }
    else {
      int v43 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v44 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v44 = __p.__r_.__value_.__l.__size_;
    }
    uint64_t v45 = sub_21B863A18(v42, (uint64_t)v43, v44);
    sub_21B863A18(v45, (uint64_t)"' does not exist.", 17);
  }
  a5->__r_.__value_.__s.__data_[0] = 0;
  a5[1].__r_.__value_.__s.__data_[0] = 0;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v48) & 0x80000000) == 0) {
      return;
    }
LABEL_69:
    operator delete(__dst);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v48) < 0) {
    goto LABEL_69;
  }
}

void sub_21B98035C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
}

void sub_21B980370(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_21B9803DC(unint64_t a1, char *__src, char *a3)
{
  int v6 = *(char *)(a1 + 23);
  size_t v7 = a3 - __src;
  if (v6 < 0)
  {
    if (a3 == __src) {
      return a1;
    }
    size_t v8 = *(void *)(a1 + 8);
    unint64_t v12 = *(void *)(a1 + 16);
    unint64_t v9 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v11 = *(unsigned char **)a1;
    unint64_t v10 = HIBYTE(v12);
    if (*(void *)a1 > (unint64_t)__src) {
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == __src) {
      return a1;
    }
    size_t v8 = *(unsigned __int8 *)(a1 + 23);
    unint64_t v9 = 22;
    LOBYTE(v10) = *(unsigned char *)(a1 + 23);
    uint64_t v11 = (unsigned char *)a1;
    if (a1 > (unint64_t)__src)
    {
LABEL_11:
      if (v9 - v8 >= v7)
      {
        size_t v16 = (unsigned char *)a1;
        if ((v10 & 0x80) != 0)
        {
          size_t v16 = *(unsigned char **)a1;
          uint64_t v17 = (unsigned char *)(*(void *)a1 + v8);
          if (v7 >= 0x20) {
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v17 = (unsigned char *)(a1 + v8);
          if (v7 >= 0x20) {
            goto LABEL_36;
          }
        }
        goto LABEL_23;
      }
      size_t v14 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - v9 < v8 + v7 - v9) {
        sub_21B836090();
      }
      size_t v15 = (unsigned char *)a1;
      if (v6 < 0)
      {
        size_t v15 = *(unsigned char **)a1;
        if (v9 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          size_t v16 = operator new(0x7FFFFFFFFFFFFFF7uLL);
          if (!v8) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      else if (v9 > 0x3FFFFFFFFFFFFFF2)
      {
        goto LABEL_15;
      }
      unint64_t v30 = 2 * v9;
      if (v8 + v7 > 2 * v9) {
        unint64_t v30 = v8 + v7;
      }
      uint64_t v31 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v30 | 7) != 0x17) {
        uint64_t v31 = v30 | 7;
      }
      if (v30 >= 0x17) {
        size_t v14 = v31 + 1;
      }
      else {
        size_t v14 = 23;
      }
      size_t v16 = operator new(v14);
      if (!v8)
      {
LABEL_17:
        if (v9 != 22) {
          operator delete(v15);
        }
        *(void *)(a1 + 8) = v8;
        *(void *)(a1 + 16) = v14 | 0x8000000000000000;
        *(void *)a1 = v16;
        uint64_t v17 = &v16[v8];
        if (v7 >= 0x20)
        {
LABEL_36:
          if ((unint64_t)(&v16[v8] - __src) >= 0x20)
          {
            uint64_t v18 = &__src[v7 & 0xFFFFFFFFFFFFFFE0];
            v17 += v7 & 0xFFFFFFFFFFFFFFE0;
            char v23 = &v16[v8 + 16];
            std::string v24 = (long long *)(__src + 16);
            unint64_t v25 = v7 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v26 = *v24;
              *(v23 - 1) = *(v24 - 1);
              _OWORD *v23 = v26;
              v23 += 2;
              v24 += 2;
              v25 -= 32;
            }
            while (v25);
            if (v7 == (v7 & 0xFFFFFFFFFFFFFFE0)) {
              goto LABEL_42;
            }
          }
          else
          {
            uint64_t v18 = __src;
          }
          do
          {
LABEL_41:
            char v27 = *v18++;
            *v17++ = v27;
          }
          while (v18 != a3);
LABEL_42:
          *uint64_t v17 = 0;
          size_t v28 = v8 + v7;
          if (*(char *)(a1 + 23) < 0) {
            *(void *)(a1 + 8) = v28;
          }
          else {
            *(unsigned char *)(a1 + 23) = v28 & 0x7F;
          }
          return a1;
        }
LABEL_23:
        uint64_t v18 = __src;
        goto LABEL_41;
      }
LABEL_16:
      memmove(v16, v15, v8);
      goto LABEL_17;
    }
  }
  if (&v11[v8 + 1] <= __src) {
    goto LABEL_11;
  }
  if (v7 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v7 > 0x16)
  {
    uint64_t v19 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v19 = v7 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (void **)operator new(v19 + 1);
    size_t v33 = v7;
    int64_t v34 = v20 | 0x8000000000000000;
    int __dst = p_dst;
  }
  else
  {
    HIBYTE(v34) = (_BYTE)a3 - (_BYTE)__src;
    p_dst = (void **)&__dst;
  }
  memcpy(p_dst, __src, v7);
  *((unsigned char *)p_dst + v7) = 0;
  if (v34 >= 0) {
    uint64_t v21 = (const std::string::value_type *)&__dst;
  }
  else {
    uint64_t v21 = (const std::string::value_type *)__dst;
  }
  if (v34 >= 0) {
    std::string::size_type v22 = HIBYTE(v34);
  }
  else {
    std::string::size_type v22 = v33;
  }
  std::string::append((std::string *)a1, v21, v22);
  if (SHIBYTE(v34) < 0) {
    operator delete(__dst);
  }
  return a1;
}

void sub_21B9806C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B9806E4(uint64_t a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F968, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F968))
  {
    sub_21B9807EC();
    __cxa_atexit((void (*)(void *))sub_21B9817BC, byte_267C5F978, &dword_21B831000);
    __cxa_guard_release(&qword_267C5F968);
  }
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 24) = 0;
  if (byte_267C5F990)
  {
    if (byte_267C5F978[23] < 0)
    {
      sub_21B846188((unsigned char *)a1, *(void **)byte_267C5F978, *(unint64_t *)&byte_267C5F978[8]);
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)byte_267C5F978;
      *(void *)(a1 + 16) = *(void *)&byte_267C5F978[16];
    }
    *(unsigned char *)(a1 + 24) = 1;
  }
}

void sub_21B9807B0(_Unwind_Exception *a1)
{
}

void sub_21B9807C8(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21B9807EC()
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  if (!dladdr(&sub_21B9806E4, &__dst)) {
    goto LABEL_10;
  }
  memset(&__p, 0, sizeof(__p));
  v0 = (char *)(__dst.dli_fname - 1);
  while (*++v0)
    ;
  sub_21B9803DC((unint64_t)&__p, (char *)__dst.dli_fname, v0);
  std::__fs::filesystem::__weakly_canonical(&v71, &__p, 0);
  std::__fs::filesystem::path v73 = v71;
  memset(&v71, 0, sizeof(v71));
  char v74 = 1;
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    if (!v74)
    {
LABEL_10:
      byte_267C5F978[0] = 0;
      byte_267C5F990 = 0;
      return;
    }
  }
  std::__fs::filesystem::path::__string_view v2 = std::__fs::filesystem::path::__parent_path(&v73);
  if (v2.__size_ > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v2.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v4 = (v2.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v2.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v4 = v2.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v5 = v4 + 1;
    p_dst = (char *)operator new(v4 + 1);
    __dst.dli_fbase = (void *)v2.__size_;
    __dst.dli_sname = (const char *)(v5 | 0x8000000000000000);
    __dst.dli_fname = p_dst;
    goto LABEL_14;
  }
  HIBYTE(__dst.dli_sname) = v2.__size_;
  p_dst = (char *)&__dst;
  if (v2.__size_) {
LABEL_14:
  }
    memmove(p_dst, v2.__data_, v2.__size_);
  p_dst[v2.__size_] = 0;
  *(_OWORD *)&__p.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.dli_fname;
  __p.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)__dst.dli_sname;
  std::__fs::filesystem::path::__string_view v6 = std::__fs::filesystem::path::__extension(&__p);
  if (v6.__size_ > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v6.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v8 = (v6.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v8 = v6.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v9 = v8 + 1;
    size_t v7 = (char *)operator new(v8 + 1);
    __dst.dli_fbase = (void *)v6.__size_;
    __dst.dli_sname = (const char *)(v9 | 0x8000000000000000);
    __dst.dli_fname = v7;
    goto LABEL_22;
  }
  HIBYTE(__dst.dli_sname) = v6.__size_;
  size_t v7 = (char *)&__dst;
  if (v6.__size_) {
LABEL_22:
  }
    memmove(v7, v6.__data_, v6.__size_);
  v7[v6.__size_] = 0;
  *(_OWORD *)&v79.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.dli_fname;
  v79.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)__dst.dli_sname;
  memset(&__dst, 0, 24);
  sub_21B9803DC((unint64_t)&__dst, ".framework", "");
  if (SHIBYTE(__dst.dli_sname) >= 0) {
    v10.__data_ = (const std::string_view::value_type *)&__dst;
  }
  else {
    v10.__data_ = __dst.dli_fname;
  }
  if (SHIBYTE(__dst.dli_sname) >= 0) {
    v10.__size_ = HIBYTE(__dst.dli_sname);
  }
  else {
    v10.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)__dst.dli_fbase;
  }
  int v11 = std::__fs::filesystem::path::__compare(&v79, v10);
  if (SHIBYTE(__dst.dli_sname) < 0)
  {
    operator delete((void *)__dst.dli_fname);
    if ((SHIBYTE(v79.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_31:
      if (v11) {
        goto LABEL_32;
      }
LABEL_38:
      std::__fs::filesystem::path v71 = __p;
      unsigned __int8 v72 = 1;
      goto LABEL_92;
    }
  }
  else if ((SHIBYTE(v79.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_31;
  }
  operator delete(v79.__pn_.__r_.__value_.__l.__data_);
  if (!v11) {
    goto LABEL_38;
  }
LABEL_32:
  std::__fs::filesystem::path::__string_view v12 = std::__fs::filesystem::path::__parent_path(&__p);
  if (v12.__size_ > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v12.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v14 = (v12.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v14 = v12.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v15 = v14 + 1;
    unint64_t v13 = (char *)operator new(v14 + 1);
    __dst.dli_fbase = (void *)v12.__size_;
    __dst.dli_sname = (const char *)(v15 | 0x8000000000000000);
    __dst.dli_fname = v13;
    goto LABEL_42;
  }
  HIBYTE(__dst.dli_sname) = v12.__size_;
  unint64_t v13 = (char *)&__dst;
  if (v12.__size_) {
LABEL_42:
  }
    memmove(v13, v12.__data_, v12.__size_);
  v13[v12.__size_] = 0;
  *(_OWORD *)&v79.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.dli_fname;
  v79.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)__dst.dli_sname;
  std::__fs::filesystem::path::__string_view v16 = std::__fs::filesystem::path::__filename(&v79);
  if (v16.__size_ > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v16.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v18 = (v16.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v18 = v16.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v19 = v18 + 1;
    uint64_t v17 = (char *)operator new(v18 + 1);
    __dst.dli_fbase = (void *)v16.__size_;
    __dst.dli_sname = (const char *)(v19 | 0x8000000000000000);
    __dst.dli_fname = v17;
    goto LABEL_50;
  }
  HIBYTE(__dst.dli_sname) = v16.__size_;
  uint64_t v17 = (char *)&__dst;
  if (v16.__size_) {
LABEL_50:
  }
    memmove(v17, v16.__data_, v16.__size_);
  v17[v16.__size_] = 0;
  *(_OWORD *)&v77.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.dli_fname;
  v77.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)__dst.dli_sname;
  memset(&__dst, 0, 24);
  sub_21B9803DC((unint64_t)&__dst, "Versions", "");
  if (SHIBYTE(__dst.dli_sname) >= 0) {
    v20.__data_ = (const std::string_view::value_type *)&__dst;
  }
  else {
    v20.__data_ = __dst.dli_fname;
  }
  if (SHIBYTE(__dst.dli_sname) >= 0) {
    v20.__size_ = HIBYTE(__dst.dli_sname);
  }
  else {
    v20.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)__dst.dli_fbase;
  }
  int v21 = std::__fs::filesystem::path::__compare(&v77, v20);
  int v22 = v21;
  if (SHIBYTE(__dst.dli_sname) < 0)
  {
    operator delete((void *)__dst.dli_fname);
    if (v22) {
      goto LABEL_88;
    }
  }
  else if (v21)
  {
    goto LABEL_88;
  }
  std::__fs::filesystem::path::__string_view v23 = std::__fs::filesystem::path::__parent_path(&v79);
  if (v23.__size_ > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v23.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v25 = (v23.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v23.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v25 = v23.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v26 = v25 + 1;
    std::string v24 = (char *)operator new(v25 + 1);
    __dst.dli_fbase = (void *)v23.__size_;
    __dst.dli_sname = (const char *)(v26 | 0x8000000000000000);
    __dst.dli_fname = v24;
    goto LABEL_68;
  }
  HIBYTE(__dst.dli_sname) = v23.__size_;
  std::string v24 = (char *)&__dst;
  if (v23.__size_) {
LABEL_68:
  }
    memmove(v24, v23.__data_, v23.__size_);
  v24[v23.__size_] = 0;
  *(_OWORD *)&v76.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.dli_fname;
  v76.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)__dst.dli_sname;
  std::__fs::filesystem::path::__string_view v27 = std::__fs::filesystem::path::__extension(&v76);
  if (v27.__size_ > 0x7FFFFFFFFFFFFFF7) {
    sub_21B836090();
  }
  if (v27.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v29 = (v27.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v27.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v29 = v27.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v30 = v29 + 1;
    size_t v28 = (char *)operator new(v29 + 1);
    __dst.dli_fbase = (void *)v27.__size_;
    __dst.dli_sname = (const char *)(v30 | 0x8000000000000000);
    __dst.dli_fname = v28;
    goto LABEL_76;
  }
  HIBYTE(__dst.dli_sname) = v27.__size_;
  size_t v28 = (char *)&__dst;
  if (v27.__size_) {
LABEL_76:
  }
    memmove(v28, v27.__data_, v27.__size_);
  v28[v27.__size_] = 0;
  *(_OWORD *)&v75.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&__dst.dli_fname;
  v75.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)__dst.dli_sname;
  memset(&__dst, 0, 24);
  sub_21B9803DC((unint64_t)&__dst, ".framework", "");
  if (SHIBYTE(__dst.dli_sname) >= 0) {
    v31.__data_ = (const std::string_view::value_type *)&__dst;
  }
  else {
    v31.__data_ = __dst.dli_fname;
  }
  if (SHIBYTE(__dst.dli_sname) >= 0) {
    v31.__size_ = HIBYTE(__dst.dli_sname);
  }
  else {
    v31.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)__dst.dli_fbase;
  }
  int v32 = std::__fs::filesystem::path::__compare(&v75, v31);
  if (SHIBYTE(__dst.dli_sname) < 0)
  {
    operator delete((void *)__dst.dli_fname);
    if ((SHIBYTE(v75.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_85:
      if (v32) {
        goto LABEL_86;
      }
      goto LABEL_100;
    }
  }
  else if ((SHIBYTE(v75.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_85;
  }
  operator delete(v75.__pn_.__r_.__value_.__l.__data_);
  if (v32)
  {
LABEL_86:
    if (SHIBYTE(v76.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v76.__pn_.__r_.__value_.__l.__data_);
    }
LABEL_88:
    v71.__pn_.__r_.__value_.__s.__data_[0] = 0;
    unsigned __int8 v72 = 0;
    if ((SHIBYTE(v77.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_101;
  }
LABEL_100:
  std::__fs::filesystem::path v71 = v76;
  unsigned __int8 v72 = 1;
  if ((SHIBYTE(v77.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_89:
    if ((SHIBYTE(v79.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_102;
  }
LABEL_101:
  operator delete(v77.__pn_.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v79.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_90:
    if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_103;
  }
LABEL_102:
  operator delete(v79.__pn_.__r_.__value_.__l.__data_);
  if ((SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_91:
    if (!v72) {
      goto LABEL_104;
    }
    goto LABEL_92;
  }
LABEL_103:
  operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  if (!v72) {
    goto LABEL_104;
  }
LABEL_92:
  std::__fs::filesystem::__status(&v71, 0);
  if (!LOBYTE(__dst.dli_fname)
    || LOBYTE(__dst.dli_fname) == 255
    || (std::__fs::filesystem::__status(&v71, 0),
        __int16 v33 = WORD2(__dst.dli_fname),
        std::__fs::filesystem::__status(&v71, 0),
        LOBYTE(__dst.dli_fname) != 2)
    || (v33 & 0x100) == 0)
  {
LABEL_104:
    LODWORD(v77.__pn_.__r_.__value_.__l.__data_) = 1026;
    if (!_NSGetExecutablePath((char *)&__dst, (uint32_t *)&v77))
    {
      memset(&v79, 0, sizeof(v79));
      uint64_t v36 = &v81;
      while (*++v36)
        ;
      sub_21B9803DC((unint64_t)&v79, (char *)&__dst, v36);
      std::__fs::filesystem::path __p = v79;
      unsigned __int8 v70 = 1;
      goto LABEL_115;
    }
    size_t data_low = LODWORD(v77.__pn_.__r_.__value_.__l.__data_);
    if (LODWORD(v77.__pn_.__r_.__value_.__l.__data_))
    {
      int v35 = (char *)operator new(LODWORD(v77.__pn_.__r_.__value_.__l.__data_));
      bzero(v35, data_low);
    }
    else
    {
      int v35 = 0;
    }
    if (_NSGetExecutablePath(v35, (uint32_t *)&v77))
    {
      int v38 = 0;
      __p.__pn_.__r_.__value_.__s.__data_[0] = 0;
      unsigned __int8 v70 = 0;
      if (!v35) {
        goto LABEL_114;
      }
    }
    else
    {
      memset(&v79, 0, sizeof(v79));
      uint64_t v62 = v35 - 1;
      while (*++v62)
        ;
      sub_21B9803DC((unint64_t)&v79, v35, v62);
      std::__fs::filesystem::path __p = v79;
      int v38 = 1;
      unsigned __int8 v70 = 1;
      if (!v35)
      {
LABEL_114:
        if (!v38)
        {
          byte_267C5F978[0] = 0;
LABEL_209:
          byte_267C5F990 = v38;
          goto LABEL_210;
        }
LABEL_115:
        std::__fs::filesystem::path::__string_view v39 = std::__fs::filesystem::path::__parent_path(&__p);
        if (v39.__size_ > 0x7FFFFFFFFFFFFFF7) {
          sub_21B836090();
        }
        if (v39.__size_ >= 0x17)
        {
          std::basic_string_view<_CharT, _Traits>::size_type v41 = (v39.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v39.__size_ | 7) != 0x17) {
            std::basic_string_view<_CharT, _Traits>::size_type v41 = v39.__size_ | 7;
          }
          std::basic_string_view<_CharT, _Traits>::size_type v42 = v41 + 1;
          unsigned __int8 v40 = (char *)operator new(v41 + 1);
          __dst.dli_fbase = (void *)v39.__size_;
          __dst.dli_sname = (const char *)(v42 | 0x8000000000000000);
          __dst.dli_fname = v40;
        }
        else
        {
          HIBYTE(__dst.dli_sname) = v39.__size_;
          unsigned __int8 v40 = (char *)&__dst;
          if (!v39.__size_)
          {
LABEL_123:
            v40[v39.__size_] = 0;
            dli_fname = (char *)__dst.dli_fname;
            v78[0] = __dst.dli_sname;
            *(_DWORD *)((char *)v78 + 3) = *(_DWORD *)((char *)&__dst.dli_sname + 3);
            int dli_sname_high = SHIBYTE(__dst.dli_sname);
            LOBYTE(__dst.dli_fname) = 0;
            LOBYTE(__dst.dli_saddr) = 0;
            if (SHIBYTE(__dst.dli_sname) < 0)
            {
              sub_21B846188(&__dst, dli_fname, (unint64_t)__dst.dli_fbase);
            }
            else
            {
              __dst.dli_fname = dli_fname;
              LODWORD(__dst.dli_sname) = v78[0];
              *(_DWORD *)((char *)&__dst.dli_sname + 3) = *(_DWORD *)((char *)v78 + 3);
            }
            LOBYTE(__dst.dli_saddr) = 1;
            std::__fs::filesystem::path::__string_view v45 = std::__fs::filesystem::path::__extension((const std::__fs::filesystem::path *)&__dst);
            if (v45.__size_ > 0x7FFFFFFFFFFFFFF7) {
              sub_21B836090();
            }
            char data = (char)v45.__data_;
            if (v45.__size_ >= 0x17)
            {
              std::basic_string_view<_CharT, _Traits>::size_type v48 = (v45.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v45.__size_ | 7) != 0x17) {
                std::basic_string_view<_CharT, _Traits>::size_type v48 = v45.__size_ | 7;
              }
              std::basic_string_view<_CharT, _Traits>::size_type v49 = v48 + 1;
              size_t v47 = operator new(v48 + 1);
              v79.__pn_.__r_.__value_.__l.__size_ = v45.__size_;
              v79.__pn_.__r_.__value_.__r.__words[2] = v49 | 0x8000000000000000;
              v79.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v47;
            }
            else
            {
              *((unsigned char *)&v79.__pn_.__r_.__value_.__s + 23) = v45.__size_;
              size_t v47 = &v79;
              if (!v45.__size_)
              {
LABEL_134:
                v47[v45.__size_] = 0;
                std::__fs::filesystem::path v77 = v79;
                memset(&v76, 0, sizeof(v76));
                sub_21B9803DC((unint64_t)&v76, ".app", "");
                if ((v76.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v50.__data_ = (const std::string_view::value_type *)&v76;
                }
                else {
                  v50.__data_ = (const std::string_view::value_type *)v76.__pn_.__r_.__value_.__r.__words[0];
                }
                if ((v76.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v50.__size_ = HIBYTE(v76.__pn_.__r_.__value_.__r.__words[2]);
                }
                else {
                  v50.__size_ = v76.__pn_.__r_.__value_.__l.__size_;
                }
                if (!std::__fs::filesystem::path::__compare(&v77, v50))
                {
                  BOOL v53 = 1;
                  if ((SHIBYTE(v76.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                    goto LABEL_164;
                  }
                  goto LABEL_146;
                }
                std::__fs::filesystem::path::__string_view v51 = std::__fs::filesystem::path::__extension((const std::__fs::filesystem::path *)&__dst);
                if (v51.__size_ > 0x7FFFFFFFFFFFFFF7) {
                  sub_21B836090();
                }
                char data = (char)v51.__data_;
                if (v51.__size_ >= 0x17)
                {
                  std::basic_string_view<_CharT, _Traits>::size_type v57 = (v51.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v51.__size_ | 7) != 0x17) {
                    std::basic_string_view<_CharT, _Traits>::size_type v57 = v51.__size_ | 7;
                  }
                  std::basic_string_view<_CharT, _Traits>::size_type v58 = v57 + 1;
                  uint64_t v52 = operator new(v57 + 1);
                  v79.__pn_.__r_.__value_.__l.__size_ = v51.__size_;
                  v79.__pn_.__r_.__value_.__r.__words[2] = v58 | 0x8000000000000000;
                  v79.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v52;
                }
                else
                {
                  *((unsigned char *)&v79.__pn_.__r_.__value_.__s + 23) = v51.__size_;
                  uint64_t v52 = &v79;
                  if (!v51.__size_)
                  {
LABEL_155:
                    v52[v51.__size_] = 0;
                    std::__fs::filesystem::path v75 = v79;
                    memset(&v79, 0, sizeof(v79));
                    sub_21B9803DC((unint64_t)&v79, ".bundle", "");
                    if ((v79.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      v59.__data_ = (const std::string_view::value_type *)&v79;
                    }
                    else {
                      v59.__data_ = (const std::string_view::value_type *)v79.__pn_.__r_.__value_.__r.__words[0];
                    }
                    if ((v79.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      v59.__size_ = HIBYTE(v79.__pn_.__r_.__value_.__r.__words[2]);
                    }
                    else {
                      v59.__size_ = v79.__pn_.__r_.__value_.__l.__size_;
                    }
                    BOOL v53 = std::__fs::filesystem::path::__compare(&v75, v59) == 0;
                    if (SHIBYTE(v79.__pn_.__r_.__value_.__r.__words[2]) < 0)
                    {
                      operator delete(v79.__pn_.__r_.__value_.__l.__data_);
                      if ((SHIBYTE(v75.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                      {
LABEL_163:
                        if ((SHIBYTE(v76.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                          goto LABEL_164;
                        }
                        goto LABEL_146;
                      }
                    }
                    else if ((SHIBYTE(v75.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    {
                      goto LABEL_163;
                    }
                    operator delete(v75.__pn_.__r_.__value_.__l.__data_);
                    if ((SHIBYTE(v76.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    {
LABEL_164:
                      if ((SHIBYTE(v77.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                      {
LABEL_165:
                        int dli_saddr_low = LOBYTE(__dst.dli_saddr);
                        if (v53)
                        {
LABEL_166:
                          if (dli_saddr_low)
                          {
                            long long v56 = (char *)__dst.dli_fname;
                            *(void *)unint64_t v80 = __dst.dli_fbase;
                            *(void *)&v80[7] = *(void **)((char *)&__dst.dli_fbase + 7);
                            int v55 = 1;
                            char data = HIBYTE(__dst.dli_sname);
LABEL_168:
                            if ((dli_sname_high & 0x80000000) == 0) {
                              goto LABEL_169;
                            }
                            goto LABEL_176;
                          }
                          goto LABEL_174;
                        }
LABEL_148:
                        int v55 = 0;
                        long long v56 = 0;
                        if (!dli_saddr_low) {
                          goto LABEL_175;
                        }
                        if ((SHIBYTE(__dst.dli_sname) & 0x80000000) == 0) {
                          goto LABEL_168;
                        }
                        operator delete((void *)__dst.dli_fname);
LABEL_174:
                        long long v56 = 0;
                        int v55 = 0;
LABEL_175:
                        if ((dli_sname_high & 0x80000000) == 0)
                        {
LABEL_169:
                          int v60 = v72;
                          if (v72 == v55) {
                            goto LABEL_170;
                          }
                          goto LABEL_177;
                        }
LABEL_176:
                        operator delete(dli_fname);
                        int v60 = v72;
                        if (v72 == v55)
                        {
LABEL_170:
                          if (v60)
                          {
                            if (SHIBYTE(v71.__pn_.__r_.__value_.__r.__words[2]) < 0) {
                              operator delete(v71.__pn_.__r_.__value_.__l.__data_);
                            }
                            v71.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v56;
                            v71.__pn_.__r_.__value_.__l.__size_ = *(void *)v80;
                            *(std::string::size_type *)((char *)&v71.__pn_.__r_.__value_.__r.__words[1] + 7) = *(void *)&v80[7];
                            *((unsigned char *)&v71.__pn_.__r_.__value_.__s + 23) = data;
                            goto LABEL_186;
                          }
LABEL_181:
                          if (data < 0) {
                            int v61 = v55;
                          }
                          else {
                            int v61 = 0;
                          }
                          if (v61 == 1) {
                            operator delete(v56);
                          }
LABEL_186:
                          if (!v72) {
                            goto LABEL_199;
                          }
                          goto LABEL_197;
                        }
LABEL_177:
                        if (!v60)
                        {
                          v71.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v56;
                          v71.__pn_.__r_.__value_.__l.__size_ = *(void *)v80;
                          *(std::string::size_type *)((char *)&v71.__pn_.__r_.__value_.__r.__words[1] + 7) = *(void *)&v80[7];
                          *((unsigned char *)&v71.__pn_.__r_.__value_.__s + 23) = data;
                          unsigned __int8 v72 = 1;
LABEL_197:
                          std::__fs::filesystem::__status(&v71, 0);
                          if (LOBYTE(__dst.dli_fname))
                          {
                            if (LOBYTE(__dst.dli_fname) != 255)
                            {
                              std::__fs::filesystem::__status(&v71, 0);
                              __int16 v68 = WORD2(__dst.dli_fname);
                              std::__fs::filesystem::__status(&v71, 0);
                              if (LOBYTE(__dst.dli_fname) == 2 && (v68 & 0x100) != 0)
                              {
                                byte_267C5F978[0] = 0;
                                byte_267C5F990 = 0;
                                if (!v72)
                                {
LABEL_210:
                                  if (v70 && SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
                                  }
                                  if (v72 && SHIBYTE(v71.__pn_.__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v71.__pn_.__r_.__value_.__l.__data_);
                                  }
                                  goto LABEL_216;
                                }
                                *(std::__fs::filesystem::path *)byte_267C5F978 = v71;
                                memset(&v71, 0, sizeof(v71));
                                goto LABEL_208;
                              }
                            }
                          }
LABEL_199:
                          std::__fs::filesystem::path::__string_view v64 = std::__fs::filesystem::path::__parent_path(&__p);
                          if (v64.__size_ > 0x7FFFFFFFFFFFFFF7) {
                            sub_21B836090();
                          }
                          if (v64.__size_ >= 0x17)
                          {
                            std::basic_string_view<_CharT, _Traits>::size_type v66 = (v64.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
                            if ((v64.__size_ | 7) != 0x17) {
                              std::basic_string_view<_CharT, _Traits>::size_type v66 = v64.__size_ | 7;
                            }
                            std::basic_string_view<_CharT, _Traits>::size_type v67 = v66 + 1;
                            uint64_t v65 = (char *)operator new(v66 + 1);
                            __dst.dli_fbase = (void *)v64.__size_;
                            __dst.dli_sname = (const char *)(v67 | 0x8000000000000000);
                            __dst.dli_fname = v65;
                          }
                          else
                          {
                            HIBYTE(__dst.dli_sname) = v64.__size_;
                            uint64_t v65 = (char *)&__dst;
                            if (!v64.__size_) {
                              goto LABEL_207;
                            }
                          }
                          memmove(v65, v64.__data_, v64.__size_);
LABEL_207:
                          v65[v64.__size_] = 0;
                          *(_OWORD *)byte_267C5F978 = *(_OWORD *)&__dst.dli_fname;
                          *(void *)&byte_267C5F978[15] = *(void **)((char *)&__dst.dli_fbase + 7);
                          byte_267C5F978[23] = HIBYTE(__dst.dli_sname);
LABEL_208:
                          LOBYTE(v38) = 1;
                          goto LABEL_209;
                        }
                        if (SHIBYTE(v71.__pn_.__r_.__value_.__r.__words[2]) < 0) {
                          operator delete(v71.__pn_.__r_.__value_.__l.__data_);
                        }
                        unsigned __int8 v72 = 0;
                        goto LABEL_181;
                      }
LABEL_147:
                      operator delete(v77.__pn_.__r_.__value_.__l.__data_);
                      int dli_saddr_low = LOBYTE(__dst.dli_saddr);
                      if (v53) {
                        goto LABEL_166;
                      }
                      goto LABEL_148;
                    }
LABEL_146:
                    operator delete(v76.__pn_.__r_.__value_.__l.__data_);
                    if ((SHIBYTE(v77.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                      goto LABEL_165;
                    }
                    goto LABEL_147;
                  }
                }
                memmove(v52, v51.__data_, v51.__size_);
                goto LABEL_155;
              }
            }
            memmove(v47, v45.__data_, v45.__size_);
            goto LABEL_134;
          }
        }
        memmove(v40, v39.__data_, v39.__size_);
        goto LABEL_123;
      }
    }
    operator delete(v35);
    int v38 = v70;
    goto LABEL_114;
  }
  byte_267C5F978[0] = 0;
  byte_267C5F990 = 0;
  if (v72)
  {
    *(std::__fs::filesystem::path *)byte_267C5F978 = v71;
    byte_267C5F990 = 1;
  }
LABEL_216:
  if (v74)
  {
    if (SHIBYTE(v73.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v73.__pn_.__r_.__value_.__l.__data_);
    }
  }
}

void sub_21B98153C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (a44 < 0) {
    operator delete(__p);
  }
  if (v44) {
    operator delete(v44);
  }
  if (a19 && a18 < 0) {
    operator delete(exception_object);
  }
  if (a26)
  {
    if (a25 < 0)
    {
      operator delete(a20);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21B9817BC(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 24))
  {
    if (*(char *)(result + 23) < 0)
    {
      operator delete(*(void **)result);
      return v1;
    }
  }
  return result;
}

void sub_21B981808(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    LOBYTE(xmmword_267C5F998) = 0;
    byte_267C5F9B0 = 0;
    return;
  }
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 16);
    *(_OWORD *)Dl_info __dst = *(_OWORD *)a1;
    if (v13 >= 0) {
      std::__fs::filesystem::path::__string_view v2 = __dst;
    }
    else {
      std::__fs::filesystem::path::__string_view v2 = (void **)__dst[0];
    }
LABEL_10:
    *(_OWORD *)std::__fs::filesystem::path __p = *(_OWORD *)a1;
    uint64_t v11 = *(void *)(a1 + 16);
    goto LABEL_11;
  }
  std::__fs::filesystem::path::__string_view v2 = __dst;
  sub_21B846188(__dst, *(void **)a1, *(void *)(a1 + 8));
  if (v13 < 0) {
    std::__fs::filesystem::path::__string_view v2 = (void **)__dst[0];
  }
  if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
    goto LABEL_10;
  }
  sub_21B846188(__p, *(void **)a1, *(void *)(a1 + 8));
LABEL_11:
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v11 >= 0) {
    CFIndex v4 = HIBYTE(v11);
  }
  else {
    CFIndex v4 = (CFIndex)__p[1];
  }
  CFStringRef v5 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v2, v4, 0x8000100u, 0);
  CFStringRef v14 = v5;
  if ((SHIBYTE(v11) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v13) & 0x80000000) == 0) {
      goto LABEL_16;
    }
LABEL_19:
    operator delete(__dst[0]);
    if (!v5) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v13) < 0) {
    goto LABEL_19;
  }
LABEL_16:
  if (!v5)
  {
LABEL_20:
    if (sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Apple/src/BundlePath.cpp", 66, (uint64_t)"cf_path_str", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
    {
      abort();
    }
  }
LABEL_21:
  CFURLRef v6 = CFURLCreateWithFileSystemPath(v3, v5, kCFURLPOSIXPathStyle, 1u);
  __dst[0] = v6;
  if (!v6
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Apple/src/BundlePath.cpp", 70, (uint64_t)"cf_path_url", 11, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
  CFBundleRef v7 = CFBundleCreate(v3, v6);
  __p[0] = v7;
  if (!v7
    && sub_21B9845F0("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_LearnedFeatures/library/Essentials/Apple/src/BundlePath.cpp", 73, (uint64_t)"cf_current_bundle", 17, (uint64_t)&unk_21B997215, 0, (void (*)(void **))sub_21B984AC4))
  {
    abort();
  }
  CFStringRef ValueForInfoDictionaryKey = (const __CFString *)CFBundleGetValueForInfoDictionaryKey(v7, (CFStringRef)*MEMORY[0x263EFFB58]);
  CFStringRef v9 = ValueForInfoDictionaryKey;
  if (ValueForInfoDictionaryKey) {
    CFRetain(ValueForInfoDictionaryKey);
  }
  sub_21B9825FC(v9, (std::string *)&xmmword_267C5F998);
  if (v9) {
    CFRelease(v9);
  }
  __p[0] = 0;
  if (v7) {
    CFRelease(v7);
  }
  __dst[0] = 0;
  if (v6) {
    CFRelease(v6);
  }
  CFStringRef v14 = 0;
  if (v5) {
    CFRelease(v5);
  }
}

void sub_21B981ACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B981B68(uint64_t a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F970, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F970))
  {
    sub_21B9806E4((uint64_t)__p);
    sub_21B981808((uint64_t)__p);
    if (v4 && v3 < 0) {
      operator delete(__p[0]);
    }
    __cxa_atexit((void (*)(void *))sub_21B981CCC, &xmmword_267C5F998, &dword_21B831000);
    __cxa_guard_release(&qword_267C5F970);
  }
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 24) = 0;
  if (byte_267C5F9B0)
  {
    if (byte_267C5F9AF < 0)
    {
      sub_21B846188((unsigned char *)a1, (void *)xmmword_267C5F998, *((unint64_t *)&xmmword_267C5F998 + 1));
    }
    else
    {
      *(_OWORD *)a1 = xmmword_267C5F998;
      *(void *)(a1 + 16) = unk_267C5F9A8;
    }
    *(unsigned char *)(a1 + 24) = 1;
  }
}

void sub_21B981C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a15)
  {
    if (a14 < 0)
    {
      operator delete(__p);
      __cxa_guard_abort(&qword_267C5F970);
      _Unwind_Resume(a1);
    }
  }
  __cxa_guard_abort(&qword_267C5F970);
  _Unwind_Resume(a1);
}

void sub_21B981CA8(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B981CCC(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 24))
  {
    if (*(char *)(result + 23) < 0)
    {
      operator delete(*(void **)result);
      return v1;
    }
  }
  return result;
}

const void **sub_21B981D18(const void **a1)
{
  std::__fs::filesystem::path::__string_view v2 = *a1;
  *a1 = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_21B981D50(const void **a1)
{
  std::__fs::filesystem::path::__string_view v2 = *a1;
  *a1 = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_21B981D88(const void **a1)
{
  std::__fs::filesystem::path::__string_view v2 = *a1;
  *a1 = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_21B981DC4()
{
}

void sub_21B981DD8(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B981E34(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B981E4C(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B981EA8(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B981EC0(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B981F1C(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B981F34(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B981F90(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B981FA8(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B982004(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B98201C(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B982078(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B982090(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B9820EC(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B982104(uint64_t a1@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  CFStringRef v10 = v2;
  if (!v2)
  {
    std::string::value_type v4 = 0;
    goto LABEL_5;
  }
  CFStringRef v3 = v2;
  sub_21B9825FC(v2, &v8);
  CFRelease(v3);
  std::string::value_type v4 = v9;
  if (!v9)
  {
LABEL_5:
    char v7 = 10;
    __int16 v6 = 28271;
    std::string::size_type v5 = 0x69746375646F7250;
    goto LABEL_6;
  }
  std::string::size_type v5 = v8.__r_.__value_.__r.__words[0];
  __int16 v6 = v8.__r_.__value_.__r.__words[1];
  std::string::value_type v4 = v8.__r_.__value_.__s.__data_[10];
  CFStringRef v10 = *(const __CFString **)((char *)&v8.__r_.__value_.__r.__words[1] + 3);
  int v11 = *(_DWORD *)((char *)&v8.__r_.__value_.__r.__words[2] + 3);
  char v7 = HIBYTE(v8.__r_.__value_.__r.__words[2]);
LABEL_6:
  *(void *)a1 = v5;
  *(_WORD *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 10) = v4;
  *(void *)(a1 + 11) = v10;
  *(_DWORD *)(a1 + 19) = v11;
  *(unsigned char *)(a1 + 23) = v7;
  *(unsigned char *)(a1 + 24) = 1;
}

void sub_21B9821F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2) {
    sub_21B83DE50(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B982214()
{
  return MGGetSInt64Answer();
}

uint64_t sub_21B98223C()
{
  v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

uint64_t sub_21B9822AC()
{
  v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

uint64_t sub_21B98231C()
{
  v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

uint64_t sub_21B98238C()
{
  return MGGetSInt32Answer() | 0x100000000;
}

void sub_21B9823B8(std::string *a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  if (v2)
  {
    CFStringRef v3 = v2;
    sub_21B9825FC(v2, a1);
    CFRelease(v3);
  }
  else
  {
    a1->__r_.__value_.__s.__data_[0] = 0;
    a1[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_21B982414(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_21B98242C(uint64_t a1@<X8>)
{
  CFStringRef v2 = (const __CFString *)MGGetStringAnswer();
  *(void *)&long long v6 = v2;
  if (v2 && (CFStringRef v3 = v2, sub_21B9825FC(v2, &__p), CFRelease(v3), v9))
  {
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
    sub_21B979560((char *)p_p, size, ":", 1, 0, (uint64_t)&v6);
    *(_OWORD *)a1 = v6;
    *(void *)(a1 + 16) = v7;
    *(unsigned char *)(a1 + 24) = 1;
    if (v9)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
  else
  {
    *(unsigned char *)a1 = 0;
    *(unsigned char *)(a1 + 24) = 0;
  }
}

void sub_21B982500(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19)
  {
    if (a18 < 0)
    {
      operator delete(__p);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B98253C()
{
  v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  CFRelease(v0);
  return (v1 == (const void *)*MEMORY[0x263EFFB40]) | 0x100u;
}

BOOL sub_21B9825AC(uint64_t a1)
{
  unsigned int v1 = (*(unsigned __int16 (**)(uint64_t))(*(void *)a1 + 104))(a1);
  if (v1 <= 0x100) {
    LOBYTE(v1) = 0;
  }
  return v1 != 0;
}

const __CFString *sub_21B9825FC@<X0>(const __CFString *result@<X0>, std::string *a2@<X8>)
{
  if (!result) {
    goto LABEL_8;
  }
  CFStringRef v3 = result;
  size_t result = (const __CFString *)CFStringGetLength(result);
  if (result)
  {
    CFIndex v4 = (CFIndex)result;
    CFIndex usedBufLen = 0;
    v9.location = 0;
    v9.length = (CFIndex)result;
    size_t result = (const __CFString *)CFStringGetBytes(v3, v9, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    if ((uint64_t)result > 0)
    {
      memset(&v7, 0, sizeof(v7));
      if (usedBufLen)
      {
        std::string::append(&v7, usedBufLen, 0);
        CFIndex v5 = usedBufLen;
        if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          long long v6 = &v7;
        }
        else {
          long long v6 = (std::string *)v7.__r_.__value_.__r.__words[0];
        }
      }
      else
      {
        CFIndex v5 = 0;
        long long v6 = &v7;
      }
      v10.location = 0;
      v10.length = v4;
      size_t result = (const __CFString *)CFStringGetBytes(v3, v10, 0x8000100u, 0, 0, (UInt8 *)v6, v5, 0);
      *a2 = v7;
      goto LABEL_12;
    }
LABEL_8:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
    return result;
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
LABEL_12:
  a2[1].__r_.__value_.__s.__data_[0] = 1;
  return result;
}

void sub_21B982724(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B982740(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  CFIndex v4 = (long long *)(a2 + 16);
  if (!*(unsigned char *)(a2 + 112))
  {
    v47[0] = (const char *)(*(uint64_t (**)(void))(**(void **)(a2 + 8) + 16))(*(void *)(a2 + 8));
    LODWORD(v46.__r_.__value_.__l.__data_) = *(_DWORD *)a2;
    std::error_condition::message(&v35, (const std::error_condition *)a2);
    sub_21B983590((uint64_t)&v29, v47, (int *)&v46, &v35);
    if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_62;
    }
    CFRange v10 = (void *)v35.__r_.__value_.__r.__words[0];
    goto LABEL_61;
  }
  v46.__r_.__value_.__r.__words[0] = (*(uint64_t (**)(void))(**(void **)(a2 + 8) + 16))(*(void *)(a2 + 8));
  LODWORD(__dst) = *(_DWORD *)a2;
  std::error_condition::message(&v35, (const std::error_condition *)a2);
  sub_21B983590((uint64_t)v33, (const char **)&v46.__r_.__value_.__l.__data_, (int *)&__dst, &v35);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  CFIndex v5 = (const char *)v34;
  long long v6 = v33;
  if ((v34 & 0x80u) != 0)
  {
    long long v6 = (void **)v33[0];
    CFIndex v5 = (const char *)v33[1];
  }
  v47[0] = (const char *)v6;
  v47[1] = v5;
  sub_21B844260((uint64_t)&v35);
  if (*(unsigned char *)(a2 + 40))
  {
    sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)"detail", 6);
    sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)": ", 2);
    int v7 = *(char *)(a2 + 39);
    if (v7 >= 0) {
      uint64_t v8 = (uint64_t)v4;
    }
    else {
      uint64_t v8 = *(void *)(a2 + 16);
    }
    if (v7 >= 0) {
      uint64_t v9 = *(unsigned __int8 *)(a2 + 39);
    }
    else {
      uint64_t v9 = *(void *)(a2 + 24);
    }
    sub_21B863A18(&v35.__r_.__value_.__r.__words[2], v8, v9);
    if (!*(unsigned char *)(a2 + 104)) {
      goto LABEL_39;
    }
    sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)", ", 2);
  }
  else if (!*(unsigned char *)(a2 + 104))
  {
    goto LABEL_39;
  }
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)"location", 8);
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)": ", 2);
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)"{", 1);
  int v11 = *(char *)(a2 + 71);
  if (v11 >= 0) {
    uint64_t v12 = a2 + 48;
  }
  else {
    uint64_t v12 = *(void *)(a2 + 48);
  }
  if (v11 >= 0) {
    uint64_t v13 = *(unsigned __int8 *)(a2 + 71);
  }
  else {
    uint64_t v13 = *(void *)(a2 + 56);
  }
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], v12, v13);
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)",", 1);
  std::to_string(&v46, *(void *)(a2 + 72));
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    CFStringRef v14 = &v46;
  }
  else {
    CFStringRef v14 = (std::string *)v46.__r_.__value_.__r.__words[0];
  }
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v46.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v46.__r_.__value_.__l.__size_;
  }
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)v14, size);
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)",", 1);
  int v16 = *(char *)(a2 + 103);
  if (v16 >= 0) {
    uint64_t v17 = a2 + 80;
  }
  else {
    uint64_t v17 = *(void *)(a2 + 80);
  }
  if (v16 >= 0) {
    uint64_t v18 = *(unsigned __int8 *)(a2 + 103);
  }
  else {
    uint64_t v18 = *(void *)(a2 + 88);
  }
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], v17, v18);
  sub_21B863A18(&v35.__r_.__value_.__r.__words[2], (uint64_t)"}", 1);
LABEL_39:
  if ((v44 & 0x10) != 0)
  {
    unint64_t v21 = v43;
    if (v43 < v40)
    {
      unint64_t v43 = v40;
      unint64_t v21 = v40;
    }
    int v22 = v39;
    size_t v19 = v21 - (void)v39;
    if (v21 - (unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_66;
    }
  }
  else
  {
    if ((v44 & 8) == 0)
    {
      size_t v19 = 0;
      HIBYTE(v32) = 0;
      p_dst = (void **)&__dst;
      goto LABEL_52;
    }
    int v22 = v37;
    size_t v19 = v38 - (void)v37;
    if ((unint64_t)(v38 - (void)v37) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_66:
    }
      sub_21B836090();
  }
  if (v19 >= 0x17)
  {
    uint64_t v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v23 = v19 | 7;
    }
    uint64_t v24 = v23 + 1;
    p_dst = (void **)operator new(v23 + 1);
    std::__fs::filesystem::path::__string_view v31 = (const char *)v19;
    int64_t v32 = v24 | 0x8000000000000000;
    Dl_info __dst = p_dst;
  }
  else
  {
    HIBYTE(v32) = v19;
    p_dst = (void **)&__dst;
    if (!v19) {
      goto LABEL_52;
    }
  }
  memmove(p_dst, v22, v19);
LABEL_52:
  *((unsigned char *)p_dst + v19) = 0;
  v35.__r_.__value_.__r.__words[0] = *MEMORY[0x263F8C2B8];
  std::string::size_type v25 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(std::string::size_type *)((char *)v35.__r_.__value_.__r.__words + *(void *)(v35.__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v35.__r_.__value_.__r.__words[2] = v25;
  uint64_t v36 = MEMORY[0x263F8C318] + 16;
  if (v42 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D495E70](&v45);
  std::basic_string_view<_CharT, _Traits>::size_type v26 = (const char *)HIBYTE(v32);
  std::__fs::filesystem::path::__string_view v27 = (const char *)&__dst;
  if (v32 < 0)
  {
    std::__fs::filesystem::path::__string_view v27 = (const char *)__dst;
    std::basic_string_view<_CharT, _Traits>::size_type v26 = v31;
  }
  v47[2] = v27;
  v47[3] = v26;
  sub_21B84F40C((uint64_t)v47, (uint64_t)&v48, "; ", 2uLL, &v29);
  if (SHIBYTE(v32) < 0)
  {
    operator delete(__dst);
    if (((char)v34 & 0x80000000) == 0) {
      goto LABEL_62;
    }
  }
  else if (((char)v34 & 0x80000000) == 0)
  {
    goto LABEL_62;
  }
  CFRange v10 = v33[0];
LABEL_61:
  operator delete(v10);
LABEL_62:
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v29);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  *(void *)a1 = &unk_26CBA1CC0;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  sub_21B91758C((unsigned char *)(a1 + 32), v4);
  return a1;
}

void sub_21B982CD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a32 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B982E84(std::runtime_error *this)
{
  if (!LOBYTE(this[8].__vftable)) {
    goto LABEL_7;
  }
  if (!LOBYTE(this[7].__imp_.__imp_)) {
    goto LABEL_5;
  }
  if ((SHIBYTE(this[7].__vftable) & 0x80000000) == 0)
  {
    if ((SHIBYTE(this[5].__vftable) & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  operator delete(this[6].__vftable);
  if (SHIBYTE(this[5].__vftable) < 0)
  {
LABEL_11:
    operator delete(this[4].__vftable);
    if (LOBYTE(this[3].__imp_.__imp_)) {
      goto LABEL_6;
    }
LABEL_7:
    CFStringRef v2 = this;
    goto LABEL_9;
  }
LABEL_5:
  if (!LOBYTE(this[3].__imp_.__imp_)) {
    goto LABEL_7;
  }
LABEL_6:
  if ((SHIBYTE(this[3].__vftable) & 0x80000000) == 0) {
    goto LABEL_7;
  }
  operator delete(this[2].__vftable);
  CFStringRef v2 = this;

LABEL_9:
  std::runtime_error::~runtime_error(v2);
}

void sub_21B982F34(std::runtime_error *this)
{
  if (!LOBYTE(this[8].__vftable)) {
    goto LABEL_10;
  }
  if (LOBYTE(this[7].__imp_.__imp_))
  {
    if ((SHIBYTE(this[7].__vftable) & 0x80000000) == 0)
    {
      if ((SHIBYTE(this[5].__vftable) & 0x80000000) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      operator delete(this[4].__vftable);
      if (!LOBYTE(this[3].__imp_.__imp_)) {
        goto LABEL_10;
      }
      goto LABEL_6;
    }
    operator delete(this[6].__vftable);
    if (SHIBYTE(this[5].__vftable) < 0) {
      goto LABEL_9;
    }
  }
LABEL_5:
  if (!LOBYTE(this[3].__imp_.__imp_)) {
    goto LABEL_10;
  }
LABEL_6:
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[2].__vftable);
  }
LABEL_10:
  std::runtime_error::~runtime_error(this);

  JUMPOUT(0x21D495F30);
}

void sub_21B982FD8(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F9C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F9C0))
  {
    qword_267C5F9B8 = (uint64_t)std::generic_category();
    __cxa_guard_release(&qword_267C5F9C0);
  }
  if (*(void *)(a1 + 8) == qword_267C5F9B8)
  {
    int v2 = *(_DWORD *)a1;
    if (*(int *)a1 > 33)
    {
      if (v2 == 34)
      {
        exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
        sub_21B9833B0(exception, a1);
        __cxa_throw(exception, (struct type_info *)off_2643B88B0, MEMORY[0x263F8C068]);
      }
      if (v2 == 84)
      {
        CFIndex v4 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        sub_21B9834A0(v4, a1);
        __cxa_throw(v4, (struct type_info *)off_2643B88C0, MEMORY[0x263F8C078]);
      }
    }
    else
    {
      if (v2 == 22)
      {
        long long v6 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
        sub_21B9831D0(v6, a1);
        __cxa_throw(v6, (struct type_info *)off_2643B88C8, MEMORY[0x263F8C080]);
      }
      if (v2 == 33)
      {
        CFStringRef v3 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
        sub_21B9832C0(v3, a1);
        __cxa_throw(v3, (struct type_info *)off_2643B88A0, MEMORY[0x263F8C058]);
      }
    }
  }
  CFIndex v5 = __cxa_allocate_exception(0x88uLL);
  sub_21B982740((uint64_t)v5, a1);
  __cxa_throw(v5, (struct type_info *)&unk_26CBA1CD8, (void (*)(void *))sub_21B982E84);
}

void sub_21B98316C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21B983180(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21B983194(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21B9831A8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21B9831BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21B9831D0(std::logic_error *this, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 112)) {
    CFStringRef v3 = (long long *)(a2 + 16);
  }
  else {
    CFStringRef v3 = (long long *)&unk_21B9B4A38;
  }
  if (*((unsigned char *)v3 + 24))
  {
    sub_21B9837DC((uint64_t)&v4, v3);
    std::logic_error::logic_error(this, &v4);
    this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
    if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v4.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::logic_error::logic_error(this, (const char *)&unk_21B997215);
    this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
  }
}

void sub_21B9832A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B9832C0(std::logic_error *this, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 112)) {
    CFStringRef v3 = (long long *)(a2 + 16);
  }
  else {
    CFStringRef v3 = (long long *)&unk_21B9B4A38;
  }
  if (*((unsigned char *)v3 + 24))
  {
    sub_21B9837DC((uint64_t)&v4, v3);
    std::logic_error::logic_error(this, &v4);
    this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C380] + 16);
    if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v4.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::logic_error::logic_error(this, (const char *)&unk_21B997215);
    this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C380] + 16);
  }
}

void sub_21B983394(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B9833B0(std::logic_error *this, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 112)) {
    CFStringRef v3 = (long long *)(a2 + 16);
  }
  else {
    CFStringRef v3 = (long long *)&unk_21B9B4A38;
  }
  if (*((unsigned char *)v3 + 24))
  {
    sub_21B9837DC((uint64_t)&v4, v3);
    std::logic_error::logic_error(this, &v4);
    this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
    if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v4.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::logic_error::logic_error(this, (const char *)&unk_21B997215);
    this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  }
}

void sub_21B983484(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B9834A0(std::runtime_error *this, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 112)) {
    CFStringRef v3 = (long long *)(a2 + 16);
  }
  else {
    CFStringRef v3 = (long long *)&unk_21B9B4A38;
  }
  if (*((unsigned char *)v3 + 24))
  {
    sub_21B9837DC((uint64_t)&v4, v3);
    std::runtime_error::runtime_error(this, &v4);
    this->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x263F8C398] + 16);
    if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v4.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::runtime_error::runtime_error(this, (const char *)&unk_21B997215);
    this->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x263F8C398] + 16);
  }
}

void sub_21B983574(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B983590(uint64_t a1, const char **a2, int *a3, std::string *a4)
{
  int v8 = 0;
  if (*a2) {
    sub_21B85AC74(v7, a2);
  }
  else {
    sub_21B84CA68(v7, "nullptr");
  }
  int v11 = (std::string *)v7;
  uint64_t v12 = (std::string *)" error ";
  uint64_t v13 = v7;
  CFStringRef v14 = (std::string *)" error ";
  std::basic_string_view<_CharT, _Traits>::size_type v15 = (std::string *)" error ";
  if (v8 == -1) {
    sub_21B84C734();
  }
  v9.__r_.__value_.__r.__words[0] = (std::string::size_type)&v11;
  ((void (*)(std::string *, _DWORD *))off_26CBA1D08[v8])(&v9, v7);
  std::to_string(&v9, *a3);
  int v11 = (std::string *)v7;
  uint64_t v12 = &v9;
  uint64_t v13 = v7;
  CFStringRef v14 = &v9;
  std::basic_string_view<_CharT, _Traits>::size_type v15 = &v9;
  if (v8 == -1) {
    sub_21B84C734();
  }
  CFRange v10 = &v11;
  ((void (*)(std::string ***, _DWORD *))off_26CBA1D20[v8])(&v10, v7);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  int v11 = (std::string *)v7;
  uint64_t v12 = (std::string *)": ";
  uint64_t v13 = v7;
  CFStringRef v14 = (std::string *)": ";
  std::basic_string_view<_CharT, _Traits>::size_type v15 = (std::string *)": ";
  if (v8 == -1) {
    sub_21B84C734();
  }
  v9.__r_.__value_.__r.__words[0] = (std::string::size_type)&v11;
  ((void (*)(std::string *, _DWORD *))off_26CBA1D38[v8])(&v9, v7);
  int v11 = (std::string *)v7;
  uint64_t v12 = a4;
  uint64_t v13 = v7;
  CFStringRef v14 = a4;
  std::basic_string_view<_CharT, _Traits>::size_type v15 = a4;
  if (v8 == -1) {
    sub_21B84C734();
  }
  v9.__r_.__value_.__r.__words[0] = (std::string::size_type)&v11;
  ((void (*)(std::string *, _DWORD *))off_26CBA1D50[v8])(&v9, v7);
  if (v8 == -1) {
    sub_21B84C734();
  }
  int v11 = &v9;
  uint64_t result = ((uint64_t (*)(std::string **, _DWORD *))off_26CBA1D68[v8])(&v11, v7);
  if (v8 != -1) {
    return ((uint64_t (*)(std::string **, _DWORD *))off_26CBA1CF0[v8])(&v11, v7);
  }
  return result;
}

void sub_21B983790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
}

uint64_t sub_21B9837DC(uint64_t a1, long long *a2)
{
  int v6 = 0;
  if (*((unsigned char *)a2 + 24))
  {
    int v6 = -1;
    if (*((char *)a2 + 23) < 0)
    {
      sub_21B846188(&v4, *(void **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long v4 = *a2;
      uint64_t v5 = *((void *)a2 + 2);
    }
    int v2 = 1;
    int v6 = 1;
  }
  else
  {
    sub_21B84CA68(&v4, "nullopt");
    int v2 = v6;
    if (v6 == -1) {
      sub_21B84C734();
    }
  }
  int v8 = &v7;
  uint64_t result = ((uint64_t (*)(char **, long long *))off_26CBA1D68[v2])(&v8, &v4);
  if (v6 != -1) {
    return ((uint64_t (*)(char **, long long *))off_26CBA1CF0[v6])(&v8, &v4);
  }
  return result;
}

void sub_21B9838B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21B9838D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21B9838E8(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x21D495F30);
}

__n128 sub_21B983920@<Q0>(std::string *__s@<X0>, char *a2@<X1>, int64_t a3@<X2>, const std::string::value_type *a4@<X3>, std::string::size_type a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  if (SHIBYTE(__s->__r_.__value_.__r.__words[2]) < 0)
  {
    int64_t size = __s->__r_.__value_.__l.__size_;
    if (size) {
      BOOL v18 = a3 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18) {
      goto LABEL_24;
    }
    uint64_t v19 = a7 ? a6 : -1;
    uint64_t v38 = v19;
    uint64_t v17 = (std::string *)__s->__r_.__value_.__r.__words[0];
    if (size < a3) {
      goto LABEL_24;
    }
  }
  else
  {
    int64_t size = HIBYTE(__s->__r_.__value_.__r.__words[2]);
    if (*((unsigned char *)&__s->__r_.__value_.__s + 23)) {
      BOOL v15 = a3 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      goto LABEL_24;
    }
    uint64_t v16 = a7 ? a6 : -1;
    uint64_t v38 = v16;
    uint64_t v17 = __s;
    if (size < a3) {
      goto LABEL_24;
    }
  }
  std::__fs::filesystem::path::__string_view v20 = (char *)v17 + size;
  int v21 = *a2;
  int v22 = v17;
  do
  {
    int64_t v23 = size - a3;
    if (v23 == -1) {
      break;
    }
    uint64_t v24 = (char *)memchr(v22, v21, v23 + 1);
    if (!v24) {
      break;
    }
    std::string::size_type v25 = v24;
    if (!memcmp(v24, a2, a3))
    {
      if (v38)
      {
        if (v25 != v20)
        {
          std::string::size_type v27 = v25 - (char *)v17;
          if (v25 - (char *)v17 != -1)
          {
LABEL_28:
            std::string::replace(__s, v27, a3, a4, a5);
            if (SHIBYTE(__s->__r_.__value_.__r.__words[2]) < 0)
            {
              std::string v29 = (std::string *)__s->__r_.__value_.__r.__words[0];
              std::string::size_type v28 = __s->__r_.__value_.__l.__size_;
            }
            else
            {
              std::string::size_type v28 = HIBYTE(__s->__r_.__value_.__r.__words[2]);
              std::string v29 = __s;
            }
            std::string::size_type v30 = v27 + a5;
            if (v28 >= v27 + a5)
            {
              std::__fs::filesystem::path::__string_view v31 = (char *)v29 + v30;
              int64_t v32 = (char *)v29 + v28;
              int64_t v33 = v28 - v30;
              if (v33 >= a3)
              {
                --v38;
                int v34 = *a2;
                while (1)
                {
                  int64_t v35 = v33 - a3;
                  if (v35 == -1) {
                    break;
                  }
                  uint64_t v36 = (char *)memchr(v31, v34, v35 + 1);
                  if (!v36) {
                    break;
                  }
                  std::string::size_type v37 = v36;
                  if (!memcmp(v36, a2, a3))
                  {
                    if (v38)
                    {
                      if (v37 != v32)
                      {
                        std::string::size_type v27 = v37 - (char *)v29;
                        if (v37 - (char *)v29 != -1) {
                          goto LABEL_28;
                        }
                      }
                    }
                    goto LABEL_24;
                  }
                  std::__fs::filesystem::path::__string_view v31 = v37 + 1;
                  int64_t v33 = v32 - (v37 + 1);
                  if (v33 < a3) {
                    goto LABEL_24;
                  }
                }
              }
            }
          }
        }
      }
      break;
    }
    int v22 = (std::string *)(v25 + 1);
    int64_t size = v20 - (v25 + 1);
  }
  while (size >= a3);
LABEL_24:
  __n128 result = *(__n128 *)&__s->__r_.__value_.__l.__data_;
  *(_OWORD *)a8 = *(_OWORD *)&__s->__r_.__value_.__l.__data_;
  *(void *)(a8 + 16) = *((void *)&__s->__r_.__value_.__l + 2);
  __s->__r_.__value_.__l.__size_ = 0;
  __s->__r_.__value_.__r.__words[2] = 0;
  __s->__r_.__value_.__r.__words[0] = 0;
  return result;
}

void sub_21B983B14()
{
}

void sub_21B983B88(_Unwind_Exception *a1)
{
  MEMORY[0x21D495F30](v1, 0x10B2C40EED050F3);
  _Unwind_Resume(a1);
}

uint64_t *sub_21B983BAC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    sub_21B983CF0((uint64_t)a1, v2);
  }
  return a1;
}

uint64_t sub_21B983BE4(void *a1)
{
  return *a1 + 16;
}

void *sub_21B983BF0@<X0>(void *result@<X0>, unsigned char *a2@<X8>)
{
  CFStringRef v3 = *(void **)result;
  int v4 = *(_DWORD *)(*(void *)result + 120);
  if ((v4 & 0x10) != 0)
  {
    unint64_t v5 = v3[14];
    unint64_t v6 = v3[9];
    if (v5 < v6)
    {
      v3[14] = v6;
      unint64_t v5 = v6;
    }
    char v7 = (const void *)v3[8];
    size_t v8 = v5 - (void)v7;
    if (v5 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_16;
    }
  }
  else
  {
    if ((v4 & 8) == 0)
    {
      a2[23] = 0;
LABEL_4:
      *a2 = 0;
      return result;
    }
    char v7 = (const void *)v3[5];
    size_t v8 = v3[7] - (void)v7;
    if (v8 >= 0x7FFFFFFFFFFFFFF8) {
LABEL_16:
    }
      sub_21B836090();
  }
  if (v8 >= 0x17)
  {
    uint64_t v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v9 = v8 | 7;
    }
    uint64_t v10 = v9 + 1;
    int v11 = operator new(v9 + 1);
    *((void *)a2 + 1) = v8;
    *((void *)a2 + 2) = v10 | 0x8000000000000000;
    *(void *)a2 = v11;
    a2 = v11;
  }
  else
  {
    a2[23] = v8;
    if (!v8) {
      goto LABEL_4;
    }
  }
  __n128 result = memmove(a2, v7, v8);
  a2[v8] = 0;
  return result;
}

void sub_21B983CF0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = MEMORY[0x263F8C2B8];
    uint64_t v4 = *MEMORY[0x263F8C2B8];
    *(void *)a2 = *MEMORY[0x263F8C2B8];
    uint64_t v5 = *(void *)(v3 + 72);
    *(void *)(a2 + *(void *)(v4 - 24)) = *(void *)(v3 + 64);
    *(void *)(a2 + 16) = v5;
    *(void *)(a2 + 24) = MEMORY[0x263F8C318] + 16;
    if (*(char *)(a2 + 111) < 0) {
      operator delete(*(void **)(a2 + 88));
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x21D495E70](a2 + 128);
    JUMPOUT(0x21D495F30);
  }
}

size_t sub_21B983E50@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = strstr(a1, "T = ");
  if (v4)
  {
    uint64_t v5 = v4;
    size_t result = strlen(v4);
    size_t v7 = result - 5;
    if (result - 5 <= 0x7FFFFFFFFFFFFFF7)
    {
      if (v7 >= 0x17)
      {
        uint64_t v11 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v7 | 7) != 0x17) {
          uint64_t v11 = v7 | 7;
        }
        uint64_t v12 = v11 + 1;
        uint64_t v13 = operator new(v11 + 1);
        a2[1] = v7;
        a2[2] = v12 | 0x8000000000000000;
        *a2 = v13;
        a2 = v13;
      }
      else
      {
        *((unsigned char *)a2 + 23) = v7;
        if (result == 5) {
          goto LABEL_15;
        }
      }
      size_t result = (size_t)memmove(a2, v5 + 4, v7);
LABEL_15:
      *((unsigned char *)a2 + v7) = 0;
      return result;
    }
LABEL_40:
    sub_21B836090();
  }
  size_t v8 = strstr(a1, "= ");
  if (v8)
  {
    uint64_t v9 = v8;
    size_t result = strlen(v8);
    size_t v10 = result - 3;
    if (result - 3 > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_40;
    }
    if (v10 >= 0x17)
    {
      uint64_t v17 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17) {
        uint64_t v17 = v10 | 7;
      }
      uint64_t v18 = v17 + 1;
      uint64_t v19 = operator new(v17 + 1);
      a2[1] = v10;
      a2[2] = v18 | 0x8000000000000000;
      *a2 = v19;
      a2 = v19;
    }
    else
    {
      *((unsigned char *)a2 + 23) = v10;
      if (result == 3) {
        goto LABEL_25;
      }
    }
    size_t result = (size_t)memmove(a2, v9 + 2, v10);
LABEL_25:
    *((unsigned char *)a2 + v10) = 0;
    return result;
  }
  CFStringRef v14 = strchr(a1, 61);
  if (v14)
  {
    BOOL v15 = v14;
    size_t result = strlen(v14);
    size_t v16 = result - 2;
    if (result - 2 > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_40;
    }
    if (v16 >= 0x17)
    {
      uint64_t v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17) {
        uint64_t v21 = v16 | 7;
      }
      uint64_t v22 = v21 + 1;
      int64_t v23 = operator new(v21 + 1);
      a2[1] = v16;
      a2[2] = v22 | 0x8000000000000000;
      *a2 = v23;
      a2 = v23;
    }
    else
    {
      *((unsigned char *)a2 + 23) = v16;
      if (result == 2) {
        goto LABEL_34;
      }
    }
    size_t result = (size_t)memmove(a2, v15 + 1, v16);
LABEL_34:
    *((unsigned char *)a2 + v16) = 0;
    return result;
  }
  size_t result = strlen(a1);
  if (result > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_40;
  }
  size_t v20 = result;
  if (result >= 0x17)
  {
    uint64_t v24 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v24 = result | 7;
    }
    uint64_t v25 = v24 + 1;
    std::basic_string_view<_CharT, _Traits>::size_type v26 = operator new(v24 + 1);
    a2[1] = v20;
    a2[2] = v25 | 0x8000000000000000;
    *a2 = v26;
    a2 = v26;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result) {
      goto LABEL_39;
    }
  }
  size_t result = (size_t)memcpy(a2, a1, v20);
LABEL_39:
  *((unsigned char *)a2 + v20) = 0;
  return result;
}

void sub_21B9840C8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(char *)(a1 + 23) < 0) {
    sub_21B846188(&__p, *(void **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  sub_21B983920(&__p, "std::__1::", 10, "std::", 5uLL, 0, 0, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_21B984164(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B984180(void *a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>, int64x2_t a4@<Q3>, int8x16_t a5@<Q5>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  if (v7 == v8)
  {
    if (*((char *)a1 + 23) < 0)
    {
      uint64_t v13 = (void *)*a1;
      unint64_t v14 = a1[1];
      sub_21B846188(a3, v13, v14);
    }
    else
    {
      *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
      a3->__r_.__value_.__r.__words[2] = a1[2];
    }
  }
  else
  {
    uint64_t v9 = *((unsigned __int8 *)a1 + 23);
    uint64_t v10 = a1[1];
    if ((v9 & 0x80u) != 0)
    {
      a1 = (void *)*a1;
      uint64_t v9 = v10;
    }
    v16[0] = a1;
    v16[1] = v9;
    v16[2] = "<";
    v16[3] = 1;
    sub_21B84DF0C(v7, v8, ",", 1uLL, &__p, a4, a5);
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    v16[4] = p_p;
    v16[5] = size;
    v16[6] = ">";
    v16[7] = 1;
    sub_21B84F40C((uint64_t)v16, (uint64_t)&v17, 0, 0, a3);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_21B9842E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B98430C(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  memset(&v22, 0, sizeof(v22));
  int v3 = *(char *)(a1 + 23);
  if (v3 >= 0) {
    uint64_t v4 = (unsigned char *)a1;
  }
  else {
    uint64_t v4 = *(unsigned char **)a1;
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  if (v5)
  {
    char v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    char v10 = 1;
    uint64_t v11 = MEMORY[0x263EF8318];
    while (1)
    {
      unsigned int v13 = (char)*v4;
      if ((v13 & 0x80000000) == 0 && (*(_DWORD *)(v11 + 4 * v13 + 60) & 0x400) != 0) {
        break;
      }
      if (v13 == 76)
      {
        if (!v6) {
          goto LABEL_49;
        }
        std::string::push_back(&v22, 76);
        if (v8)
        {
          if (v7)
          {
            if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              unint64_t v14 = &v22;
            }
            else {
              unint64_t v14 = (std::string *)v22.__r_.__value_.__r.__words[0];
            }
            if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = v22.__r_.__value_.__l.__size_;
            }
            goto LABEL_34;
          }
          int v8 = 1;
          int v7 = 1;
          char v6 = 1;
        }
        else
        {
          int v8 = 1;
          char v6 = 1;
        }
      }
      else
      {
        if (*v4 != 85)
        {
          if ((v13 & 0x80000000) != 0) {
            int v17 = __maskrune((char)*v4, 0x500uLL);
          }
          else {
            int v17 = *(_DWORD *)(v11 + 4 * v13 + 60) & 0x500;
          }
          if (v17)
          {
            if (v6)
            {
              if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v18 = &v22;
              }
              else {
                uint64_t v18 = (std::string *)v22.__r_.__value_.__r.__words[0];
              }
              if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v19 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v19 = v22.__r_.__value_.__l.__size_;
              }
              std::string::append(a2, (const std::string::value_type *)v18, v19);
              if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
              {
                v22.__r_.__value_.__l.__size_ = 0;
                size_t v20 = (std::string *)v22.__r_.__value_.__r.__words[0];
              }
              else
              {
                *((unsigned char *)&v22.__r_.__value_.__s + 23) = 0;
                size_t v20 = &v22;
              }
              int v9 = 0;
              int v8 = 0;
              int v7 = 0;
              char v6 = 0;
              char v10 = 0;
              v20->__r_.__value_.__s.__data_[0] = 0;
            }
            else
            {
LABEL_49:
              char v6 = 0;
              char v10 = 0;
            }
          }
          else
          {
            if (v6)
            {
              if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
              {
                v22.__r_.__value_.__l.__size_ = 0;
                uint64_t v21 = (std::string *)v22.__r_.__value_.__r.__words[0];
              }
              else
              {
                *((unsigned char *)&v22.__r_.__value_.__s + 23) = 0;
                uint64_t v21 = &v22;
              }
              int v9 = 0;
              int v8 = 0;
              int v7 = 0;
              char v6 = 0;
              v21->__r_.__value_.__s.__data_[0] = 0;
            }
            else
            {
              char v6 = 0;
            }
            char v10 = 1;
          }
LABEL_11:
          std::string::push_back(a2, v13);
          goto LABEL_12;
        }
        if (!v6) {
          goto LABEL_49;
        }
        std::string::push_back(&v22, 85);
        if (v9)
        {
          if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            unint64_t v14 = &v22;
          }
          else {
            unint64_t v14 = (std::string *)v22.__r_.__value_.__r.__words[0];
          }
          if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type size = v22.__r_.__value_.__l.__size_;
          }
LABEL_34:
          std::string::append(a2, (const std::string::value_type *)v14, size);
          if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
          {
            v22.__r_.__value_.__l.__size_ = 0;
            size_t v16 = (std::string *)v22.__r_.__value_.__r.__words[0];
          }
          else
          {
            *((unsigned char *)&v22.__r_.__value_.__s + 23) = 0;
            size_t v16 = &v22;
          }
          int v9 = 0;
          int v8 = 0;
          int v7 = 0;
          char v6 = 0;
          v16->__r_.__value_.__s.__data_[0] = 0;
          goto LABEL_12;
        }
        int v9 = 1;
        char v6 = 1;
      }
LABEL_12:
      ++v4;
      if (!--v5)
      {
        if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v22.__r_.__value_.__l.__data_);
        }
        return;
      }
    }
    BOOL v12 = (v10 & 1) == 0;
    char v10 = 0;
    if (!v12) {
      char v6 = 1;
    }
    goto LABEL_11;
  }
}

void sub_21B9845B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v15 + 23) & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((*(char *)(v15 + 23) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

BOOL sub_21B9845F0(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void **))
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F9C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F9C8))
  {
    __cxa_atexit((void (*)(void *))sub_21B984C08, &qword_267C5F9E0, &dword_21B831000);
    __cxa_guard_release(&qword_267C5F9C8);
  }
  if (!byte_267C5FA08)
  {
    int v34 = a7;
    sub_21B844260((uint64_t)v37);
    if (a4) {
      unsigned int v13 = "Assert: ";
    }
    else {
      unsigned int v13 = "Abort: ";
    }
    if (a4) {
      uint64_t v14 = 8;
    }
    else {
      uint64_t v14 = 7;
    }
    sub_21B863A18(v38, (uint64_t)v13, v14);
    size_t v15 = strlen(a1);
    size_t v16 = sub_21B863A18(v38, (uint64_t)a1, v15);
    sub_21B863A18(v16, (uint64_t)":", 1);
    std::ostream::operator<<();
    if (a4)
    {
      int v17 = sub_21B863A18(v38, (uint64_t)" : ", 3);
      sub_21B863A18(v17, a3, a4);
    }
    if (a6)
    {
      uint64_t v18 = sub_21B863A18(v38, (uint64_t)" : ", 3);
      sub_21B863A18(v18, a5, a6);
    }
    sub_21B863A18(v38, (uint64_t)"\n", 1);
    if ((v46 & 0x10) != 0)
    {
      unint64_t v21 = v45;
      if (v45 < v42)
      {
        unint64_t v45 = v42;
        unint64_t v21 = v42;
      }
      std::string v22 = v41;
      size_t v19 = v21 - (void)v41;
      if (v21 - (unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        goto LABEL_45;
      }
    }
    else
    {
      if ((v46 & 8) == 0)
      {
        size_t v19 = 0;
        HIBYTE(v36) = 0;
        size_t v20 = __dst;
        goto LABEL_26;
      }
      std::string v22 = v39;
      size_t v19 = v40 - (void)v39;
      if ((unint64_t)(v40 - (void)v39) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_45:
      }
        sub_21B836090();
    }
    if (v19 >= 0x17)
    {
      uint64_t v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v19 | 7) != 0x17) {
        uint64_t v23 = v19 | 7;
      }
      uint64_t v24 = v23 + 1;
      size_t v20 = (void **)operator new(v23 + 1);
      __dst[1] = (void *)v19;
      int64_t v36 = v24 | 0x8000000000000000;
      __dst[0] = v20;
    }
    else
    {
      HIBYTE(v36) = v19;
      size_t v20 = __dst;
      if (!v19) {
        goto LABEL_26;
      }
    }
    memmove(v20, v22, v19);
LABEL_26:
    *((unsigned char *)v20 + v19) = 0;
    v37[0] = *MEMORY[0x263F8C2B8];
    uint64_t v25 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    *(void *)((char *)v37 + *(void *)(v37[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
    v38[0] = v25;
    v38[1] = MEMORY[0x263F8C318] + 16;
    if (v44 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x21D495E70](&v47);
    if (v36 >= 0) {
      std::basic_string_view<_CharT, _Traits>::size_type v26 = __dst;
    }
    else {
      std::basic_string_view<_CharT, _Traits>::size_type v26 = (void **)__dst[0];
    }
    v34(v26);
    if (SHIBYTE(v36) < 0) {
      operator delete(__dst[0]);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F9C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F9C8))
  {
    __cxa_atexit((void (*)(void *))sub_21B984C08, &qword_267C5F9E0, &dword_21B831000);
    __cxa_guard_release(&qword_267C5F9C8);
  }
  if (byte_267C5FA08) {
    BOOL v27 = byte_267C5FA10 == 0;
  }
  else {
    BOOL v27 = 0;
  }
  if (!v27)
  {
    uint64_t v28 = qword_267C5F9E0;
    uint64_t v29 = unk_267C5F9E8;
    while (v28 != v29)
    {
      std::__fs::filesystem::path::__string_view v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v28;
      uint64_t v30 = *(void *)(v28 + 8);
      v28 += 16;
      v31(v30, a3, a4, a5, a6);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F9C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F9C8))
  {
    __cxa_atexit((void (*)(void *))sub_21B984C08, &qword_267C5F9E0, &dword_21B831000);
    __cxa_guard_release(&qword_267C5F9C8);
  }
  int v32 = byte_267C5FA08;
  if (byte_267C5FA08) {
    qword_267C5F9F8(unk_267C5FA00, a3, a4, a5, a6);
  }
  return v32 == 0;
}

void sub_21B984A94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B984AC4(char *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_21B984D1C();
  size_t v3 = strlen(a1);
  sub_21B984D98((void **)v2 + 1, a1, v3);
  if (*((char *)v2 + 31) >= 0) {
    uint64_t v4 = (uint64_t)(v2 + 1);
  }
  else {
    uint64_t v4 = (uint64_t)v2[1];
  }
  qword_267C5E058 = v4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5F9D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C5F9D8))
  {
    qword_267C5F9D0 = (uint64_t)os_log_create("cv3d", (const char *)&unk_21B997215);
    __cxa_guard_release(&qword_267C5F9D8);
  }
  uint64_t v5 = qword_267C5F9D0;
  if (os_log_type_enabled((os_log_t)qword_267C5F9D0, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315138;
    int v8 = a1;
    _os_log_impl(&dword_21B831000, v5, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v7, 0xCu);
  }
  return fputs(a1, (FILE *)*MEMORY[0x263EF8348]);
}

uint64_t sub_21B984C08(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_21B984C3C(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)size_t result = off_26CBA1DD0;
  qword_267C5E058 = 0;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_21B984CA4(uint64_t a1)
{
  *(void *)a1 = off_26CBA1DD0;
  qword_267C5E058 = 0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x21D495F30);
}

uint64_t (***sub_21B984D1C())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C5FA18, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C5FA18))
  {
    return &off_26AD08F48;
  }
  __cxa_atexit((void (*)(void *))sub_21B984C3C, &off_26AD08F48, &dword_21B831000);
  __cxa_guard_release(&qword_267C5FA18);
  return &off_26AD08F48;
}

void **sub_21B984D98(void **__dst, void *__src, size_t __len)
{
  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = (unint64_t)__dst[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        uint64_t v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          int v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22) {
            operator delete(v9);
          }
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *Dl_info __dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        unint64_t v12 = 2 * v8;
        if (__len > 2 * v8) {
          unint64_t v12 = __len;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      sub_21B836090();
    }
    unint64_t v6 = HIBYTE(v10);
    int v7 = *__dst;
  }
  else
  {
    int v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        uint64_t v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)__dst + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __len) = 0;
  return __dst;
}

void sub_21B984EF8()
{
}

uint64_t sub_21B984F40(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t sub_21B984F78(uint64_t a1, std::__shared_weak_count **a2, uint64_t a3)
{
  nullsub_82(a1);
  uint64_t v5 = *a2;
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return nullsub_82(a3);
}

void sub_21B984FF0(void **a1, uint64_t a2)
{
  uint64_t v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v5 = *(void ***)(a2 + 96);
    unint64_t v6 = *a1;
    if (v5 != v2)
    {
      do
      {
        if (*((char *)v5 - 1) < 0) {
          operator delete(*(v5 - 3));
        }
        v5 -= 3;
      }
      while (v5 != v2);
      unint64_t v6 = *a1;
    }
    *(void *)(a2 + 96) = v2;
    operator delete(v6);
  }
}

uint64_t sub_21B985078(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 152);
  if (result == a2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 32))(a2);
  }
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

uint64_t sub_21B9850D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 112);
  if (result == a2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 32))(a2);
  }
  else if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  *(void *)a5 = a3;
  *(_DWORD *)(a5 + 8) = a4;
  return result;
}

void sub_21B985170(void **a1, void **a2, void **a3)
{
  uint64_t v5 = (void **)*a1;
  unint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((unsigned char *)v5 - 8) && *((char *)v5 - 9) < 0) {
        operator delete(*(v5 - 4));
      }
      v5 -= 4;
    }
    while (v5 != a2);
    unint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void sub_21B9851EC(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = a1;
    do
    {
      if (*(unsigned char *)(v3 - 8))
      {
        if (*(char *)(v3 - 9) < 0) {
          operator delete(*(void **)(v3 - 32));
        }
      }
      v3 -= 32;
    }
    while (v3 != a2);
  }
}

void sub_21B985240(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_21B985254(void **__p)
{
  do
  {
    uint64_t v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
    operator delete(__p);
    std::string __p = v2;
  }
  while (v2);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4550](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EE4610](bundle, key);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5368](anURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
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

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
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

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

uint64_t IOSurfaceCreateChildSurface()
{
  return MEMORY[0x270EF4C30]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EF4C80](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CA0](buffer);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CC0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4D58](buffer, planeIndex);
}

uint64_t IOSurfaceGetOffsetOfPlane()
{
  return MEMORY[0x270EF4D78]();
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D88](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4DF0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x270ED7D10](buf, bufsize);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::error_condition::message(std::string *__return_ptr retstr, const std::error_condition *this)
{
  return (std::string *)MEMORY[0x270F98270](retstr, this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__extension(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98290](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98298](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return MEMORY[0x270F982D0](this, a2.__data_, a2.__size_);
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
  return (std::logic_error *)MEMORY[0x270F98318](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x270F98338](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x270F98398](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
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

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
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

void std::string::~string(std::string *this)
{
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
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
  return MEMORY[0x270F98778]();
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

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x270F98898](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
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

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::__assoc_sub_state::__on_zero_shared(std::__assoc_sub_state *this)
{
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
}

void std::__assoc_sub_state::set_value(std::__assoc_sub_state *this)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
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

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x270F989F8]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__weakly_canonical(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F98AF0](retstr, __p, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
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

std::future<void> *__cdecl std::future<void>::future(std::future<void> *this, std::__assoc_sub_state *__state)
{
  return (std::future<void> *)MEMORY[0x270F98C40](this, __state);
}

void std::future<void>::~future(std::future<void> *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::thread::detach(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
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

void operator delete(void *__p, const std::nothrow_t *a2)
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

void __cxa_bad_cast(void)
{
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x270ED8118]();
}

simd_float4 _simd_fmod_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x270ED8278]((__n128)x, (__n128)y);
  return result;
}

void abort(void)
{
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

uint64_t e5rt_buffer_object_alloc()
{
  return MEMORY[0x270F27AE0]();
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x270F27B00]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x270F27B20]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x270F27B30]();
}

uint64_t e5rt_e5_compiler_config_options_create()
{
  return MEMORY[0x270F27B38]();
}

uint64_t e5rt_e5_compiler_config_options_set_cache_bundle_location()
{
  return MEMORY[0x270F27B40]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x270F27B48]();
}

uint64_t e5rt_e5_compiler_create_with_config()
{
  return MEMORY[0x270F27B50]();
}

uint64_t e5rt_e5_compiler_is_new_compile_required()
{
  return MEMORY[0x270F27B58]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x270F27B60]();
}

uint64_t e5rt_error_code_get_string()
{
  return MEMORY[0x270F27B88]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x270F27BD0]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x270F27BE0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x270F27BF0]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x270F27BF8]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x270F27C08]();
}

uint64_t e5rt_execution_stream_operation_prepare_op_for_encode()
{
  return MEMORY[0x270F27C18]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x270F27C28]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x270F27C40]();
}

uint64_t e5rt_execution_stream_prewire_in_use_allocations()
{
  return MEMORY[0x270F27C50]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x270F27C70]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x270F27CB0]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x270F27D00]();
}

uint64_t e5rt_precompiled_compute_op_create_options_set_allocate_intermediate_buffers()
{
  return MEMORY[0x270F27D10]();
}

uint64_t e5rt_program_library_create()
{
  return MEMORY[0x270F27D28]();
}

uint64_t e5rt_program_library_get_function_metadata()
{
  return MEMORY[0x270F27D38]();
}

uint64_t e5rt_program_library_get_function_names()
{
  return MEMORY[0x270F27D48]();
}

uint64_t e5rt_program_library_get_num_functions()
{
  return MEMORY[0x270F27D50]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x270F27D70]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x270F27DD8]();
}

uint64_t e5rt_tensor_desc_create()
{
  return MEMORY[0x270F27E00]();
}

uint64_t e5rt_tensor_desc_dtype_create()
{
  return MEMORY[0x270F27E08]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x270F27E10]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x270F27E20]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x270F27E28]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x270F27E30]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x270F27E58]();
}

uint64_t e5rt_tensor_desc_get_size()
{
  return MEMORY[0x270F27E60]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x270F27E68]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x270F27E88]();
}

uint64_t e5rt_tensor_utils_cast_from_fp16_to_fp32()
{
  return MEMORY[0x270F27E90]();
}

uint64_t e5rt_tensor_utils_dequantize_from_u8_to_fp32()
{
  return MEMORY[0x270F27EA8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_context_set_low_precision_accumulation()
{
  return MEMORY[0x270F27EF8]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_get_last_error()
{
  return MEMORY[0x270F27F58]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x270F27FA0]();
}

uint64_t espresso_network_bind_input_cvpixelbuffer()
{
  return MEMORY[0x270F27FB0]();
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

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x270F28008]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x270F28010]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x270F28048]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x270F28080]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x270F280A8]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x270F280D8]();
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
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

float nextafterf(float a1, float a2)
{
  MEMORY[0x270EDA718](a1, a2);
  return result;
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x270EDB068](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int timespec_get(timespec *ts, int base)
{
  return MEMORY[0x270EDB948](ts, *(void *)&base);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDF500](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}