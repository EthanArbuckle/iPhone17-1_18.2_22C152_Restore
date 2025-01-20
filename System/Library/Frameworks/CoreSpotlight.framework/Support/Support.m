void sub_100003114()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100025228();
  }
}

CFAllocatorRef sub_100003144(void *a1)
{
  context.version = 0;
  context.info = a1;
  memset(&context.retain, 0, 24);
  context.allocate = (CFAllocatorAllocateCallBack)sub_1000031C0;
  context.reallocate = (CFAllocatorReallocateCallBack)sub_1000031D4;
  context.deallocate = (CFAllocatorDeallocateCallBack)sub_1000031EC;
  context.preferredSize = (CFAllocatorPreferredSizeCallBack)j__malloc_good_size;
  return CFAllocatorCreate(kCFAllocatorDefault, &context);
}

void *sub_1000031C0(size_t size, int a2, malloc_zone_t *zone)
{
  return malloc_type_zone_malloc(zone, size, 0xF02CAAABuLL);
}

void *sub_1000031D4(void *ptr, size_t size, int a3, malloc_zone_t *zone)
{
  return malloc_type_zone_realloc(zone, ptr, size, 0x3455C427uLL);
}

void sub_1000031EC(void *ptr, malloc_zone_t *zone)
{
}

CFStringRef sub_100003200(const __CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    if (CFStringHasPrefix(result, @"dyn."))
    {
      values[0] = @"public.item";
      values[1] = (void *)v1;
      values[2] = @"public.data";
      return (const __CFString *)CFArrayCreate(kCFAllocatorDefault, (const void **)values, 3, &kCFTypeArrayCallBacks);
    }
    else
    {
      if (qword_10003CCE8 != -1) {
        dispatch_once(&qword_10003CCE8, &stru_100034E70);
      }
      value = 0;
      if (CFStringHasPrefix(v1, @"com.apple.iwork"))
      {
        Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
        v3 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
        sub_100003590(v1, v3, Mutable);
        value = CFArrayCreateCopy(kCFAllocatorDefault, v3);
        CFRelease(v3);
        CFRelease(Mutable);
      }
      else
      {
        os_unfair_lock_lock((os_unfair_lock_t)&unk_10003CCF8);
        if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_10003CCF0, v1, (const void **)&value))
        {
          CFRetain(value);
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003CCF8);
          v4 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
          v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          sub_100003590(v1, v5, v4);
          value = CFArrayCreateCopy(kCFAllocatorDefault, v5);
          CFRelease(v5);
          CFRelease(v4);
          os_unfair_lock_lock((os_unfair_lock_t)&unk_10003CCF8);
          CFTypeRef cf = 0;
          if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_10003CCF0, v1, &cf))
          {
            CFRelease(value);
            value = (void *)CFRetain(cf);
          }
          else
          {
            CFDictionarySetValue((CFMutableDictionaryRef)qword_10003CCF0, v1, value);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003CCF8);
      }
      return (const __CFString *)value;
    }
  }
  return result;
}

void sub_100003468(id a1)
{
  qword_10003CCF0 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  key[0] = (void *)kUTTypeItem;
  CFArrayRef v1 = CFArrayCreate(kCFAllocatorDefault, (const void **)key, 1, &kCFTypeArrayCallBacks);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_10003CCF0, key[0], v1);
  CFRelease(v1);
  key[0] = (void *)kUTTypeFolder;
  key[1] = (void *)kUTTypeDirectory;
  key[2] = (void *)kUTTypeItem;
  CFArrayRef v2 = CFArrayCreate(kCFAllocatorDefault, (const void **)key, 3, &kCFTypeArrayCallBacks);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_10003CCF0, key[0], v2);
  CFRelease(v2);
}

void sub_100003590(const void *a1, __CFArray *a2, __CFSet *a3)
{
  CFSetAddValue(a3, a1);
  CFArrayAppendValue(a2, a1);
  CFArrayRef v6 = (const __CFArray *)UTTypeCopyParentIdentifiers();
  if (v6)
  {
    CFArrayRef v7 = v6;
    CFIndex Count = CFArrayGetCount(v6);
    if (Count >= 1)
    {
      CFIndex v9 = Count;
      for (CFIndex i = 0; i != v9; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
        if (!CFSetContainsValue(a3, ValueAtIndex)) {
          sub_100003590(ValueAtIndex, a2, a3);
        }
      }
    }
    CFRelease(v7);
  }
}

void *sub_100003668(int a1)
{
  CFArrayRef v2 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
  *CFArrayRef v2 = sub_100007F50(((a1 + 3) & 0xFFFFFFFC) + 8);
  return v2;
}

void sub_1000036C0(uint64_t *a1)
{
  sub_100007FA0(*a1);

  free(a1);
}

uint64_t sub_1000036FC(unsigned int **a1)
{
  return sub_1000048EC(*a1) - 8;
}

uint64_t sub_10000371C(uint64_t *a1)
{
  uint64_t v3 = 0;
  uint64_t v1 = sub_100008014(*a1, &v3);
  if (v1) {
    return v1 + 4;
  }
  else {
    return 0;
  }
}

unsigned int *sub_100003754(uint64_t *a1)
{
  uint64_t v3 = 0;
  result = (unsigned int *)sub_100008014(*a1, &v3);
  if (result) {
    return (unsigned int *)sub_100008044((void *)*a1, ((*result - 1) & 0xFFFFFFFFFFFFFFFCLL) + 4);
  }
  return result;
}

uint64_t sub_1000037A8(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(a2 - 4) - 4;
}

uint64_t sub_1000037B4(uint64_t *a1, int a2)
{
  return sub_100008284(*a1, ((a2 + 3) & 0xFFFFFFFC) + 8);
}

_DWORD *sub_1000037C8(uint64_t *a1, size_t a2, const void *a3)
{
  uint64_t v6 = (a2 + 3) & 0xFFFFFFFC;
  CFArrayRef v7 = sub_1000082D4(*a1, v6 + 8);
  *CFArrayRef v7 = a2 + 4;
  v8 = v7 + 1;
  if (a3) {
    memcpy(v7 + 1, a3, a2);
  }
  *(_DWORD *)((char *)v8 + v6) = 0;
  sub_1000083EC((void *)*a1, v6 + 4);
  return v8;
}

_DWORD *sub_100003848(uint64_t *a1, uint64_t a2)
{
  CFArrayRef v2 = (_DWORD *)(a2 + (((*(_DWORD *)(a2 - 4) - 4) + 3) & 0x1FFFFFFFCLL));
  if (*v2) {
    return v2 + 1;
  }
  unint64_t v5 = 0;
  unint64_t v4 = sub_1000081B8(*a1, (unint64_t)v2, &v5, 0);
  if (v4) {
    return (_DWORD *)(v4 + 4);
  }
  else {
    return 0;
  }
}

double sub_1000038A8(void **a1)
{
  return sub_100008490(*a1);
}

void *sub_1000038B0(void *result, uint64_t a2)
{
  if (a2)
  {
    CFArrayRef v2 = (_DWORD *)(a2 + ((*(unsigned int *)(a2 - 4) - 1) & 0xFFFFFFFFFFFFFFFCLL));
    result = sub_100008608((void *)*result, (unint64_t)v2);
    *CFArrayRef v2 = 0;
  }
  return result;
}

void *sub_1000038F4()
{
  v0 = malloc_type_calloc(1uLL, 0x4620uLL, 0x10F0040DF486990uLL);
  atomic_fetch_add_explicit(&dword_10003CD00, 1u, memory_order_relaxed);
  if (sub_100003988())
  {
    sub_100003F14(v0);
    return 0;
  }
  return v0;
}

uint64_t sub_100003988()
{
  v0 = (void *)__chkstk_darwin();
  unsigned int v2 = v1;
  size_t v4 = v3;
  uint64_t v6 = v5;
  v8 = v7;
  uint64_t v9 = (uint64_t)v0;
  bzero(v0, 0x4620uLL);
  __strlcpy_chk();
  sub_100004294(v9);
  *(_DWORD *)uint64_t v9 = 0;
  long long v45 = xmmword_10002BC68;
  uint64_t v46 = 0;
  if (v6) {
    v10 = v6;
  }
  else {
    v10 = &v45;
  }
  if (!v4) {
    size_t v4 = sub_100006910((uint64_t)v10);
  }
  *(void *)(v9 + 9688) = malloc_type_malloc(0x1000uLL, 0x2004093837F09uLL);
  *(void *)(v9 + 9680) = sub_100003668(v4 << 8);
  *(void *)(v9 + 9640) = sub_100007F50(v4 << 8);
  *(_DWORD *)(v9 + 9696) = 0;
  *(_DWORD *)(v9 + 9704) = -1;
  uint64_t v11 = *((void *)v10 + 2);
  *(_OWORD *)(v9 + 1032) = *v10;
  *(void *)(v9 + 1048) = v11;
  *(void *)(v9 + 1056) = v4;
  int v42 = 5;
  long long v43 = xmmword_10002BB40;
  int v44 = 0;
  sub_100006624((uint64_t)v10, (uint64_t)&v42, (char *)(v9 + 1128));
  bzero(v49, 0x8A8uLL);
  int v39 = 5;
  long long v40 = xmmword_10002BB50;
  int v41 = 0;
  sub_100006624((uint64_t)v10, (uint64_t)&v39, v49);
  uint64_t v12 = v50;
  uint64_t v13 = v51;
  *(void *)(v9 + 1096) = v50;
  *(void *)(v9 + 1080) = v13;
  uint64_t v14 = v52;
  uint64_t v15 = v53;
  *(void *)(v9 + 1088) = v52;
  *(void *)(v9 + 1112) = v15;
  uint64_t v16 = v54;
  *(void *)(v9 + 1120) = v54;
  *(_DWORD *)(v9 + 1028) = v2 & 0xFFFFFFF9 | 4;
  *(_DWORD *)(v9 + 9708) = 0;
  *(_DWORD *)(v9 + 9712) = (~v2 & 0x18) == 0;
  if (v6) {
    v17 = v6;
  }
  else {
    v17 = &v45;
  }
  if ((*((_DWORD *)v17 + 1) & 0x80000000) == 0) {
    sub_100025270();
  }
  if (!v13) {
    sub_10002529C();
  }
  if (!v12) {
    sub_1000252C8();
  }
  if (!v14) {
    sub_1000252F4();
  }
  if (!v15) {
    sub_100025320();
  }
  if (!v16) {
    sub_10002534C();
  }
  *(_DWORD *)(v9 + 9716) = ((v2 >> 5) & 1) == 0;
  *(_DWORD *)(v9 + 9720) = (v2 >> 6) & 1;
  *(unsigned char *)(v9 + 1064) = v2 & 1;
  v18 = (unsigned char *)(v9 + 8616);
  *(unsigned char *)(v9 + 8616) = 0;
  *(void *)(v9 + 3360) = v9 + 8616;
  *(void *)(v9 + 3376) = v9 + 8616;
  bzero(v48, 0x400uLL);
  if (*v8 == 46)
  {
    v19 = v8;
    do
    {
      if (v19[1] != 47) {
        break;
      }
      int v20 = *((unsigned __int8 *)v19 + 2);
      v19 += 2;
    }
    while (v20 == 46);
  }
  if ((unint64_t)__strlcpy_chk() > 0x3FF)
  {
    v24 = __error();
    int v25 = 63;
LABEL_31:
    int *v24 = v25;
    return 0xFFFFFFFFLL;
  }
  v21 = strrchr((char *)(v9 + 8616), 47);
  if (!v21 || (v22 = v21, !strcmp((const char *)(v9 + 8616), "/")))
  {
    __strlcpy_chk();
    uint64_t v23 = 0;
    unsigned char *v18 = 0;
  }
  else
  {
    uint64_t v23 = v22 - v18;
    __strlcpy_chk();
    if (v22 == v18)
    {
      *(unsigned char *)(v9 + 8617) = 0;
      uint64_t v23 = 1;
    }
    else
    {
      char *v22 = 0;
    }
  }
  *(void *)(v9 + 3352) = v23;
  *(void *)(v9 + 9736) = 0;
  if (!(*(void *)(v9 + 1096) | *(void *)(v9 + 1088) | *(void *)(v9 + 1112)))
  {
    v24 = __error();
    int v25 = 22;
    goto LABEL_31;
  }
  v26 = (unsigned int *)malloc_type_malloc(*(void *)(v9 + 1056) + 4, 0x7E0B752EuLL);
  if (sub_10001DA40(v8, (void *)(v9 + 1032), v26, v4, 8))
  {
LABEL_28:
    int v27 = *__error();
LABEL_29:
    *__error() = v27;
LABEL_50:
    free(v26);
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(v9 + 9724) = *(unsigned int *)((char *)v26 + *(void *)(v9 + 1088));
  *(_DWORD *)(v9 + 9728) = *(unsigned int *)((char *)v26 + *(void *)(v9 + 1096));
  uint64_t v28 = *(void *)(v9 + 1080);
  if (v28)
  {
    unint64_t v29 = *v26;
    if (v28 + 8 <= v29)
    {
      v30 = (char *)v26 + v28;
      v31 = (char *)v26 + v28 + *(int *)((char *)v26 + v28);
      if (&v31[*(unsigned int *)((char *)v26 + v28 + 4)] <= (char *)v26 + v29 && (!strcmp(v8, "/") || !strcmp(v8, ".")))
      {
        strncpy(v31, v8, 2uLL);
        *((_DWORD *)v30 + 1) = 2;
      }
    }
  }
  if (*(_DWORD *)(v9 + 9708))
  {
    uint64_t v32 = *(void *)((char *)v26 + *(void *)(v9 + 1112));
  }
  else
  {
    bzero(v47, 0x400uLL);
    __strlcpy_chk();
    if (strcmp(v8, ".") && (unint64_t)__strlcat_chk() > 0x3FF)
    {
      int v27 = 63;
      goto LABEL_29;
    }
    atomic_fetch_add_explicit(&dword_10003CD04, 1u, memory_order_relaxed);
    unsigned int v33 = open(v47, 32772);
    if (v33 > 0x7FF)
    {
      if ((v33 & 0x80000000) != 0)
      {
        atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
        if (v33 == -1) {
          goto LABEL_28;
        }
      }
    }
    else
    {
      *(_DWORD *)(v9 + 4 * v33 + 9756) = 957;
      ++*(_DWORD *)(v9 + 9752);
    }
    uint64_t v32 = (int)v33;
  }
  if (sub_100006E6C(v9, v32)) {
    goto LABEL_50;
  }
  size_t v35 = *(void *)(v9 + 3368);
  v36 = *(const void **)(v9 + 3376);
  if (*(void *)(v9 + 9664))
  {
    uint64_t v37 = *(void *)(v9 + 9672);
    if (v37) {
      int v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 16))(v37, v9);
    }
    else {
      int v38 = 1;
    }
  }
  else
  {
    int v38 = 0;
  }
  sub_100006F50(v9, v26, v35, v36, v38);
  free(v26);
  return 0;
}

void sub_100003F14(void *a1)
{
  sub_100004600((uint64_t)a1);
  atomic_fetch_add_explicit(&dword_10003CD00, 0xFFFFFFFF, memory_order_relaxed);
  unsigned int v2 = (const void *)a1[1208];
  if (v2) {
    _Block_release(v2);
  }
  size_t v3 = (const void *)a1[1209];
  if (v3) {
    _Block_release(v3);
  }

  free(a1);
}

void *sub_100003F74(uint64_t a1, void *aBlock)
{
  result = _Block_copy(aBlock);
  *(void *)(a1 + 9664) = result;
  *(_DWORD *)(a1 + 9716) = 1;
  return result;
}

void *sub_100003FA8(uint64_t a1, void *aBlock)
{
  result = _Block_copy(aBlock);
  *(void *)(a1 + 9672) = result;
  return result;
}

char *sub_100003FD4(double a1, uint64_t a2, uint64_t a3, size_t a4, int a5, uint64_t a6, int *a7, int *a8, int a9)
{
  uint64_t v16 = (char *)malloc_type_calloc(1uLL, 0x4620uLL, 0x10F0040DF486990uLL);
  atomic_fetch_add_explicit(&dword_10003CD00, 1u, memory_order_relaxed);
  __strlcpy_chk();
  sub_100004294((uint64_t)v16);
  *(_DWORD *)uint64_t v16 = 2;
  v43[1] = 0;
  v43[2] = 0;
  uint64_t v42 = 0;
  v43[0] = 0x200000000000005;
  int v41 = 12;
  int v39 = 12;
  uint64_t v40 = -1;
  if (a6) {
    v17 = a8;
  }
  else {
    v17 = &v39;
  }
  if (a6) {
    v18 = a7;
  }
  else {
    v18 = &v41;
  }
  if (a6) {
    v19 = (void *)a6;
  }
  else {
    v19 = v43;
  }
  uint64_t v20 = *(void *)(a3 + 16);
  *(_OWORD *)(v16 + 4148) = *(_OWORD *)a3;
  *(void *)(v16 + 4164) = v20;
  int v21 = *((unsigned __int16 *)v16 + 2074);
  if (*((_WORD *)v16 + 2074))
  {
    v22 = (int *)(a6 + 4);
    if (!a6) {
      v22 = (int *)v43 + 1;
    }
    uint64_t v23 = v16 + 4152;
    int v24 = *((unsigned __int16 *)v16 + 2074);
    int v25 = v16 + 4152;
    do
    {
      int v26 = *v22++;
      *v25++ |= v26;
      --v24;
    }
    while (v24);
    int v27 = &v37;
    long long v37 = xmmword_10002BB60;
    int v38 = 0;
    do
    {
      int v28 = *(_DWORD *)v27;
      int v27 = (long long *)((char *)v27 + 4);
      *v23++ |= v28;
      --v21;
    }
    while (v21);
  }
  v36[1] = 0;
  v36[2] = 0;
  v36[0] = 0x400000000005;
  *((void *)v16 + 138) = sub_100006838((uint64_t)(v16 + 4148), (uint64_t)v36);
  unint64_t v29 = sub_1000038F4();
  *((void *)v16 + 1076) = v29;
  if (v29)
  {
    *((_DWORD *)v16 + 257) = a9;
    *((double *)v16 + 427) = a1;
    long long v30 = *(_OWORD *)a3;
    *((void *)v16 + 131) = *(void *)(a3 + 16);
    *(_OWORD *)(v16 + 1032) = v30;
    if (!a4) {
      a4 = sub_100006910(a3);
    }
    *((void *)v16 + 132) = a4;
    *((void *)v16 + 429) = a4;
    *((void *)v16 + 430) = malloc_type_malloc(a4, 0xE75F5C4DuLL);
    long long v31 = *(_OWORD *)v19;
    *((void *)v16 + 433) = v19[2];
    *(_OWORD *)(v16 + 3448) = v31;
    uint64_t v32 = malloc_type_malloc(*v18, 0x2E03AA8CuLL);
    memcpy(v32, v18, *v18);
    *((void *)v16 + 434) = v32;
    unsigned int v33 = malloc_type_malloc(*v17, 0xC626BDFBuLL);
    memcpy(v33, v17, *v17);
    *((void *)v16 + 435) = v33;
    *((_DWORD *)v16 + 856) = a5 | 1;
    sub_100006624((uint64_t)(v16 + 4148), (uint64_t)v19, v16 + 4176);
    sub_100006624((uint64_t)(v16 + 4148), a3, v16 + 6392);
  }
  else
  {
    sub_100003F14(v16);
    return 0;
  }
  return v16;
}

uint64_t sub_100004294(uint64_t a1)
{
  bzero(&v12, 0x878uLL);
  uint64_t result = statfs((const char *)(a1 + 4), &v12);
  if (!result)
  {
    uint64_t v11 = 0;
    long long v10 = xmmword_10002BC80;
    int v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t result = sub_10001DA40(v12.f_mntonname, &v10, &v7, 0x24uLL, 0);
    if (!result)
    {
      unsigned int v3 = DWORD1(v8);
      int v4 = DWORD1(v7);
      char v5 = BYTE8(v7) & BYTE8(v8);
      *(unsigned char *)(a1 + 3408) = BYTE8(v7) & BYTE8(v8) & 1;
      *(unsigned char *)(a1 + 3409) = (v5 & 8) != 0;
      unsigned int v6 = ((v4 & v3) >> 14) & 1;
      if (!(*(_DWORD *)v12.f_fstypename ^ 0x73666361 | v12.f_fstypename[4])) {
        LOBYTE(v6) = 1;
      }
      *(unsigned char *)(a1 + 3410) = v6;
    }
  }
  return result;
}

char *sub_100004394(double a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5, void *a6, unsigned int *a7, unsigned int *a8, char a9)
{
  uint64_t v16 = (char *)malloc_type_calloc(1uLL, 0x4620uLL, 0x10F0040DF486990uLL);
  atomic_fetch_add_explicit(&dword_10003CD00, 1u, memory_order_relaxed);
  __strlcpy_chk();
  sub_100004294((uint64_t)v16);
  *(_DWORD *)uint64_t v16 = 1;
  v16[1064] = a9 & 1;
  if (a9)
  {
    v35[1] = 0;
    v35[2] = 0;
    v35[0] = 0x200000000000005;
    *((void *)v16 + 139) = sub_100006838(a3, (uint64_t)v35);
  }
  *((_DWORD *)v16 + 857) = 1024;
  long long v17 = *(_OWORD *)a3;
  *((void *)v16 + 131) = *(void *)(a3 + 16);
  *(_OWORD *)(v16 + 1032) = v17;
  if (!a4) {
    a4 = sub_100006910(a3);
  }
  *((void *)v16 + 132) = a4;
  *((void *)v16 + 429) = a4 << 10;
  *((void *)v16 + 430) = malloc_type_malloc(a4 << 10, 0xBF873F4BuLL);
  v34[1] = 0;
  v34[2] = 0;
  v34[0] = 0x200000000000005;
  if (!a6)
  {
    a8 = (unsigned int *)&unk_10002BCA4;
    a7 = (unsigned int *)&unk_10002BC98;
  }
  v18 = v34;
  if (a6) {
    v18 = a6;
  }
  uint64_t v19 = v18[2];
  *(_OWORD *)(v16 + 3448) = *(_OWORD *)v18;
  *((void *)v16 + 433) = v19;
  uint64_t v20 = malloc_type_malloc(*a7, 0x31A948F5uLL);
  memcpy(v20, a7, *a7);
  *((void *)v16 + 434) = v20;
  int v21 = (unsigned int *)malloc_type_malloc(*a8, 0x9A324D4AuLL);
  memcpy(v21, a8, *a8);
  *((void *)v16 + 435) = v21;
  *((_DWORD *)v16 + 856) = a5 | 1;
  *((double *)v16 + 427) = a1;
  double v22 = 1.0;
  if (a1 != 0.0) {
    double v22 = a1;
  }
  uint64_t v23 = *((void *)v16 + 430);
  uint64_t v24 = *((void *)v16 + 429);
  uint64_t v25 = *((int *)v16 + 857);
  int v26 = (unsigned int *)*((void *)v16 + 434);
  uint64_t v27 = *v26;
  uint64_t v28 = *v21;
  *((void *)v16 + 436) = v16 + 1032;
  *((void *)v16 + 437) = v23;
  *((void *)v16 + 438) = v24;
  *((void *)v16 + 439) = v25;
  *((void *)v16 + 440) = (uint64_t)v22;
  *((_DWORD *)v16 + 882) = 0;
  *((void *)v16 + 442) = v26;
  *((void *)v16 + 443) = v27;
  *((void *)v16 + 444) = v21;
  *((void *)v16 + 445) = v28;
  *((_OWORD *)v16 + 223) = *(_OWORD *)(v16 + 3448);
  *((void *)v16 + 448) = *((void *)v16 + 433);
  int v31 = 5;
  long long v32 = xmmword_10002BB40;
  int v33 = 0;
  sub_100006624((uint64_t)(v16 + 1032), (uint64_t)&v31, v16 + 1128);
  return v16;
}

void sub_100004600(uint64_t a1)
{
  if (!*(_DWORD *)a1)
  {
    if (!*(_DWORD *)(a1 + 9708))
    {
      for (int i = *(_DWORD *)(a1 + 9696); i; *(_DWORD *)(a1 + 9696) = i)
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 9688) + 8 * --i);
        if (!v10) {
          break;
        }
        uint64_t v11 = *(void *)(v10 + 48);
        if (v11 != -1)
        {
          if ((v11 & 0x80000000) == 0)
          {
            atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
            if ((int)v11 <= 2047)
            {
              int v12 = *(_DWORD *)(a1 + 9752);
              *(_DWORD *)(a1 + 9752) = v12 - 1;
              uint64_t v13 = a1 + 4 * (int)v11;
              int v14 = *(_DWORD *)(v13 + 9756);
              if (v14 < 0 || v12 <= 0) {
                sub_1000253A4();
              }
              if (v14) {
                *(_DWORD *)(v13 + 9756) = -v14;
              }
            }
          }
          close(v11);
          int i = *(_DWORD *)(a1 + 9696) - 1;
        }
      }
    }
    free(*(void **)(a1 + 9688));
    free(*(void **)(a1 + 9648));
    *(void *)(a1 + 9648) = 0;
    uint64_t v2 = *(unsigned int *)(a1 + 9704);
    if ((v2 & 0x80000000) == 0)
    {
      atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
      if (v2 <= 0x7FF)
      {
        int v3 = *(_DWORD *)(a1 + 9752);
        *(_DWORD *)(a1 + 9752) = v3 - 1;
        uint64_t v4 = a1 + 4 * v2;
        int v5 = *(_DWORD *)(v4 + 9756);
        if (v5 < 0 || v3 <= 0) {
          sub_100025378();
        }
        if (v5) {
          *(_DWORD *)(v4 + 9756) = -v5;
        }
      }
      close(v2);
    }
    unsigned int v6 = *(uint64_t **)(a1 + 9680);
    if (v6) {
      sub_1000036C0(v6);
    }
    uint64_t v7 = *(void *)(a1 + 9640);
    if (v7) {
      sub_100007FA0(v7);
    }
  }
  free(*(void **)(a1 + 3440));
  free(*(void **)(a1 + 3472));
  free(*(void **)(a1 + 3480));
  if (*(void *)(a1 + 8608)) {
    sub_100003F14();
  }
  long long v8 = *(const void **)(a1 + 1072);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 1072) = 0;
  }
}

uint64_t sub_100004788(uint64_t result, uint64_t a2)
{
  *(void *)(result + 9744) = a2;
  return result;
}

uint64_t sub_100004790(uint64_t result)
{
  do
  {
    *(_DWORD *)(result + 3400) = 1;
    uint64_t result = *(void *)(result + 8608);
  }
  while (result);
  return result;
}

uint64_t sub_1000047A4(uint64_t a1)
{
  for (char i = 0; ; char i = 1)
  {
    *(void *)(a1 + 3400) = 0;
    int v3 = *(_DWORD *)a1;
    if (*(_DWORD *)a1 != 2) {
      break;
    }
    a1 = *(void *)(a1 + 8608);
  }
  if (v3 == 1)
  {
    unsigned int v4 = 0;
    *(_DWORD *)(a1 + 3424) |= 1u;
  }
  else if (v3)
  {
    unsigned int v4 = 0;
  }
  else
  {
    sub_100004600(a1);
    bzero(v6, 0x400uLL);
    __strlcpy_chk();
    if (sub_100003988()) {
      unsigned int v4 = -1;
    }
    else {
      unsigned int v4 = 0;
    }
  }
  if (i) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000048B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8608);
  if (!v1) {
    uint64_t v1 = a1;
  }
  return *(unsigned int *)(v1 + 9696);
}

uint64_t sub_1000048C4()
{
  return dword_10003CD04;
}

uint64_t sub_1000048D0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 9752);
}

uint64_t sub_1000048D8()
{
  return dword_10003CD00;
}

uint64_t sub_1000048E4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 9708);
}

uint64_t sub_1000048EC(unsigned int *a1)
{
  return *a1;
}

uint64_t sub_1000048F4(uint64_t a1)
{
  return a1 + 1128;
}

uint64_t sub_1000048FC(uint64_t a1)
{
  return a1 + 1032;
}

_DWORD *sub_100004904(_DWORD *a1)
{
  if (*a1 == 2) {
    return a1 + 1598;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000491C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 3404);
}

void sub_100004924(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3 = CFRetain(cf);
  uint64_t v4 = *(void *)(a1 + 8608);
  if (v4)
  {
    int v5 = *(const void **)(v4 + 1072);
    if (v5)
    {
      CFRelease(v5);
      uint64_t v4 = *(void *)(a1 + 8608);
    }
    unsigned int v6 = (void *)(v4 + 1072);
  }
  else
  {
    unsigned int v6 = (void *)(a1 + 1072);
    uint64_t v7 = *(const void **)(a1 + 1072);
    if (v7) {
      CFRelease(v7);
    }
  }
  *unsigned int v6 = v3;
}

uint64_t sub_10000498C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8608);
  if (!v1) {
    uint64_t v1 = a1;
  }
  uint64_t v2 = *(void *)(v1 + 1072);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v1 + 1072));
  }
  return v2;
}

uint64_t sub_1000049C8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8608);
  if (!v1) {
    uint64_t v1 = result;
  }
  *(unsigned char *)(v1 + 1065) = 0;
  return result;
}

uint64_t sub_1000049DC(uint64_t a1, long long *a2)
{
  return sub_1000049F0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100005DDC);
}

uint64_t sub_1000049F0(uint64_t a1, long long *a2, uint64_t (*a3)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))
{
  long long v152 = 0u;
  long long v153 = 0u;
  *(_DWORD *)(a1 + 3404) = 0;
  uint64_t v4 = *(void *)(a1 + 8608);
  if (v4) {
    *(_DWORD *)(v4 + 3404) = 0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  int v6 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    uint64_t v7 = a1;
    goto LABEL_8;
  }
  if (v6 == 1)
  {
    if (*(unsigned char *)(a1 + 1064) && !*(void *)(a1 + 1072)) {
      *(void *)(a1 + 1072) = SIUINT64SetCreate();
    }
    double v10 = CFAbsoluteTimeGetCurrent();
    while (1)
    {
      v156.d_ino = 0;
      if (searchfs((const char *)(a1 + 4), (fssearchblock *)(a1 + 3488), &v156.d_ino, 0x8000103u, *(_DWORD *)(a1 + 3424), (searchstate *)(a1 + 3592)))
      {
        int v11 = *__error();
        BOOL v12 = v11 == 35;
        if (v11 != 35 && v11 != 0)
        {
          *(_DWORD *)(a1 + 3424) &= ~1u;
          if (v11 != 35) {
            goto LABEL_357;
          }
          goto LABEL_36;
        }
      }
      else
      {
        BOOL v12 = 0;
        int v11 = 0;
      }
      if (v156.d_ino) {
        break;
      }
LABEL_35:
      *(_DWORD *)(a1 + 3424) &= ~1u;
      if (!v12)
      {
LABEL_357:
        unsigned int v23 = 0;
        int v22 = *(_DWORD *)(a1 + 3400);
LABEL_42:
        *(_DWORD *)(a1 + 3404) = v22;
        *(_DWORD *)(a1 + 3400) = 0;
        *__error() = v11;
        if (v11) {
          uint64_t v24 = 1;
        }
        else {
          uint64_t v24 = v23;
        }
        goto LABEL_346;
      }
LABEL_36:
      double v19 = *(double *)(a1 + 3416);
      CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
      uint64_t v21 = a1;
      if (v19 < v20 - v10)
      {
        do
        {
          *(_DWORD *)(v21 + 3400) = 1;
          uint64_t v21 = *(void *)(v21 + 8608);
        }
        while (v21);
      }
      int v22 = *(_DWORD *)(a1 + 3400);
      if (v22)
      {
        unsigned int v23 = 0;
        goto LABEL_42;
      }
    }
    int v14 = *(unsigned int **)(a1 + 3440);
    unsigned int v15 = 1;
    while (1)
    {
      uint64_t v16 = *(void *)(a1 + 1072);
      *(unsigned char *)(a1 + 1065) = v16 != 0;
      if (v16)
      {
        if (SIUINT64SetContainsValue()) {
          goto LABEL_34;
        }
        uint64_t v17 = *(void *)(a1 + 1072);
      }
      else
      {
        uint64_t v17 = 0;
      }
      *(unsigned char *)(a1 + 1065) = v17 != 0;
      int v18 = a3(a1, a1 + 3344, (uint64_t)a2, *(unsigned int *)(a1 + 3384), (uint64_t)v14);
      if (*(unsigned char *)(a1 + 1065)) {
        SIUINT64SetAddValue();
      }
      if (v18 == 1)
      {
        int v22 = 0;
        unsigned int v23 = -1;
        goto LABEL_42;
      }
LABEL_34:
      int v14 = (unsigned int *)((char *)v14 + *v14);
      BOOL v53 = v156.d_ino > v15++;
      if (!v53) {
        goto LABEL_35;
      }
    }
  }
  if (v6 != 2)
  {
    uint64_t v24 = 0xFFFFFFFFLL;
    goto LABEL_346;
  }
  *(double *)&long long v152 = Current;
  *((void *)&v152 + 1) = a3;
  *(void *)&long long v153 = a2;
  *((void *)&v153 + 1) = a1;
  uint64_t v7 = *(void *)(a1 + 8608);
  a3 = sub_100005DF8;
  a2 = &v152;
LABEL_8:
  if (*(unsigned char *)(v7 + 1064) && !*(void *)(v7 + 1072)) {
    *(void *)(v7 + 1072) = SIUINT64SetCreate();
  }
  int v8 = *(_DWORD *)(v7 + 9696);
  if (v8) {
    uint64_t v9 = *(void *)(*(void *)(v7 + 9688) + 8 * (v8 - 1));
  }
  else {
    uint64_t v9 = 0;
  }
  int v25 = -1;
  if (*(_DWORD *)(v7 + 9708)) {
    goto LABEL_47;
  }
  atomic_fetch_add_explicit(&dword_10003CD04, 1u, memory_order_relaxed);
  unsigned int v117 = open(".", 32772);
  int v25 = v117;
  if (v117 > 0x7FF)
  {
    if ((v117 & 0x80000000) != 0)
    {
      atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
      goto LABEL_338;
    }
  }
  else
  {
    *(_DWORD *)(v7 + 4 * v117 + 9756) = 1607;
    ++*(_DWORD *)(v7 + 9752);
  }
  if ((*(_DWORD *)(v7 + 9704) & 0x80000000) == 0 || v9 && (*(_DWORD *)(v9 + 48) & 0x80000000) == 0)
  {
    if (!pthread_fchdir_np())
    {
      uint64_t v140 = *(unsigned int *)(v7 + 9704);
      if ((v140 & 0x80000000) == 0)
      {
        atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
        if (v140 <= 0x7FF)
        {
          int v141 = *(_DWORD *)(v7 + 9752);
          *(_DWORD *)(v7 + 9752) = v141 - 1;
          uint64_t v142 = v7 + 4 * v140;
          int v143 = *(_DWORD *)(v142 + 9756);
          if (v143 < 0 || v141 <= 0) {
            sub_100025504();
          }
          if (v143) {
            *(_DWORD *)(v142 + 9756) = -v143;
          }
        }
      }
      close(v140);
      *(_DWORD *)(v7 + 9704) = -1;
      goto LABEL_47;
    }
    int v118 = *__error();
    atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
    if (v25 <= 2047)
    {
      int v119 = *(_DWORD *)(v7 + 9752);
      *(_DWORD *)(v7 + 9752) = v119 - 1;
      uint64_t v120 = v7 + 4 * v25;
      int v121 = *(_DWORD *)(v120 + 9756);
      if (v121 < 0 || v119 <= 0) {
        sub_100025530();
      }
      if (v121) {
        *(_DWORD *)(v120 + 9756) = -v121;
      }
    }
    int v122 = v25;
LABEL_337:
    close(v122);
    *__error() = v118;
LABEL_338:
    uint64_t v24 = 1;
    goto LABEL_346;
  }
LABEL_47:
  unsigned int v144 = v25;
  uint64_t v26 = *(void *)(v7 + 1056);
  char v27 = 10;
  if (*(_DWORD *)(v7 + 9712)) {
    char v27 = 0;
  }
  size_t v147 = v26 << v27;
  uint64_t v28 = (char *)malloc_type_malloc(v26 << v27, 0x80A0E6F6uLL);
  int v29 = 0;
  uint64_t v148 = v7 + 3344;
  v149 = v28;
  v146 = (void *)(v7 + 1032);
  do
  {
    if (*(_DWORD *)(v7 + 9700) != 2)
    {
      int v29 = 0;
      *(_DWORD *)(v7 + 9700) = 0;
      if (*(_DWORD *)(v7 + 3400))
      {
LABEL_52:
        *(_DWORD *)(v7 + 9700) = 1;
        goto LABEL_147;
      }
      LODWORD(v30) = 0;
      int v29 = 0;
      while (2)
      {
        int v31 = *(_DWORD *)(v7 + 9696);
        if (!v31) {
          goto LABEL_294;
        }
        while (1)
        {
          int v32 = v31 - 1;
          uint64_t v9 = *(void *)(*(void *)(v7 + 9688) + 8 * (v31 - 1));
          if (!v9) {
            goto LABEL_146;
          }
          int v33 = *(const char **)v9;
          if (*(void *)v9 && v30 == 0) {
            break;
          }
          if (!*(_DWORD *)(v7 + 9708))
          {
            uint64_t v35 = *(void *)(v9 + 48);
            if (v35 != -1)
            {
              if ((v35 & 0x80000000) == 0)
              {
                atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
                if (v35 <= 0x7FF)
                {
                  int v36 = *(_DWORD *)(v7 + 9752);
                  *(_DWORD *)(v7 + 9752) = v36 - 1;
                  uint64_t v37 = v7 + 4 * v35;
                  int v38 = *(_DWORD *)(v37 + 9756);
                  if (v38 < 0 || v36 <= 0) {
                    sub_100025480();
                  }
                  if (v38) {
                    *(_DWORD *)(v37 + 9756) = -v38;
                  }
                }
              }
              close(v35);
              int v31 = *(_DWORD *)(v7 + 9696);
              int v32 = v31 - 1;
            }
          }
          *(_DWORD *)(v7 + 9696) = v32;
          if (!v32)
          {
LABEL_145:
            uint64_t v9 = 0;
LABEL_146:
            if (v29 == 1) {
              goto LABEL_270;
            }
            goto LABEL_147;
          }
          uint64_t v39 = *(void *)(v7 + 9688);
          uint64_t v40 = *(void *)(v39 + 8 * (v31 - 2));
          if (v40)
          {
            if (*(void *)(v7 + 1080)) {
              *(void *)(v7 + 9736) = *(void *)(v40 + 56);
            }
            if (*(_DWORD *)(v7 + 9708) || !pthread_fchdir_np()) {
              uint64_t v30 = 0;
            }
            else {
              uint64_t v30 = *__error();
            }
            int v41 = *(uint64_t **)(v7 + 9680);
            uint64_t v42 = sub_100003848(v41, *(void *)(v40 + 8));
            sub_1000038B0(v41, (uint64_t)v42);
            int v32 = *(_DWORD *)(v7 + 9696);
            if (!v32) {
              goto LABEL_145;
            }
            uint64_t v39 = *(void *)(v7 + 9688);
          }
          else
          {
            uint64_t v30 = 0;
          }
          uint64_t v9 = *(void *)(v39 + 8 * (v32 - 1));
          if (v9)
          {
            LODWORD(v30) = sub_100007080(v7, v30, *(const char **)(v9 + 16));
            *(_DWORD *)(v7 + 3348) = 2;
            int v43 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
            if (v43 == 2) {
              int v29 = 0;
            }
            else {
              int v29 = v43;
            }
            if (v43 == 1) {
              goto LABEL_146;
            }
            int v32 = *(_DWORD *)(v7 + 9696);
          }
          int v31 = v32;
          if (!v32) {
            goto LABEL_145;
          }
        }
        if (*(_DWORD *)(v7 + 9712) && !*(void *)(v7 + 1080))
        {
          uint64_t v44 = (uint64_t)sub_100003848(*(uint64_t **)(v7 + 9680), *(void *)v9);
          if (v44) {
            sub_1000037A8(*(void *)(v7 + 9680), v44);
          }
        }
        else
        {
          uint64_t v44 = 0;
        }
        *(void *)(v9 + 16) = v33;
        LODWORD(v30) = sub_100007080(v7, 0, v33);
        if (*(void *)(v7 + 9664)
          && ((uint64_t v45 = *(void *)(v7 + 9672)) == 0
           || (*(unsigned int (**)(uint64_t, uint64_t))(v45 + 16))(v45, v7)))
        {
          uint64_t v46 = *(void *)(v9 + 40);
          if (v46 != *(void *)(v9 + 24))
          {
            uint64_t v47 = *(void *)(v9 + 32);
            *(void *)(v9 + 40) = v46 + 1;
            v48 = *(_DWORD **)(v47 + 8 * v46);
            goto LABEL_99;
          }
        }
        else if (v33 != *(const char **)(v9 + 8))
        {
          v48 = sub_100003848(*(uint64_t **)(v7 + 9680), (uint64_t)v33);
          goto LABEL_99;
        }
        v48 = 0;
LABEL_99:
        *(void *)uint64_t v9 = v48;
        if (*(_DWORD *)&v33[*(void *)(v7 + 1096)] == 1 && *(void *)(v7 + 9664))
        {
          uint64_t v49 = *(void *)(v7 + 9672);
          if (!v49) {
            goto LABEL_280;
          }
          if ((*(unsigned int (**)(uint64_t, uint64_t))(v49 + 16))(v49, v7))
          {
            if (!*(void *)(v7 + 9664)) {
              sub_1000254D8();
            }
LABEL_280:
            *(_DWORD *)(v7 + 3348) = 0;
            int v29 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
            if ((v29 & 0xFFFFFFFD) == 0)
            {
              v112 = *(const char **)v9;
              if (*(void *)v9)
              {
                if (*(_DWORD *)&v112[*(void *)(v7 + 1096)] == 1)
                {
                  uint64_t v113 = 0;
                  do
                  {
                    *(void *)(v9 + 16) = v112;
                    uint64_t v114 = *(void *)(v9 + 40);
                    if (v114 == *(void *)(v9 + 24))
                    {
                      uint64_t v115 = 0;
                    }
                    else
                    {
                      uint64_t v116 = *(void *)(v9 + 32);
                      *(void *)(v9 + 40) = v114 + 1;
                      uint64_t v115 = *(void *)(v116 + 8 * v114);
                    }
                    *(void *)uint64_t v9 = v115;
                    uint64_t v113 = sub_100007080(v7, v113, v112);
                    *(_DWORD *)(v7 + 3348) = 0;
                    int v29 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
                    if ((v29 & 0xFFFFFFFD) != 0) {
                      break;
                    }
                    v112 = *(const char **)v9;
                    if (!*(void *)v9) {
                      break;
                    }
                  }
                  while (*(_DWORD *)&v112[*(void *)(v7 + 1096)] == 1);
                }
              }
            }
            if (v29 == 2)
            {
              int v29 = 0;
              goto LABEL_147;
            }
            goto LABEL_146;
          }
        }
        if (*(_DWORD *)(v7 + 9708))
        {
          uint64_t v50 = *(void *)(v7 + 1112);
          unint64_t v51 = v50 + 8;
          uint64_t v52 = (uint64_t *)&v33[v50];
          if (v52) {
            BOOL v53 = v51 > *(unsigned int *)v33;
          }
          else {
            BOOL v53 = 1;
          }
          if (!v53)
          {
            uint64_t v44 = *v52;
LABEL_128:
            int v64 = 1;
LABEL_131:
            *(_DWORD *)(v7 + 3348) = 1;
            if (*(_DWORD *)(v7 + 9720))
            {
              *(_DWORD *)(v7 + 3388) = 0;
              int v65 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
              *(_DWORD *)(v7 + 3388) = 0;
            }
            else
            {
              int v65 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
            }
            if (v65) {
              int v66 = 0;
            }
            else {
              int v66 = v64;
            }
            if (v66 != 1)
            {
              sub_100007320(v7, v44);
              if (v65 == 1) {
                goto LABEL_270;
              }
              *(_DWORD *)(v7 + 3348) = 2;
              if (v65 != 3
                && a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392)) == 1)
              {
                goto LABEL_270;
              }
LABEL_143:
              int v29 = 2;
              if (!*(_DWORD *)(v7 + 3400)) {
                continue;
              }
              goto LABEL_52;
            }
            if (sub_100006E6C(v7, v44))
            {
              sub_100007320(v7, v44);
              goto LABEL_143;
            }
            int v111 = *(_DWORD *)(v7 + 9696);
            if (v111)
            {
              int v29 = 0;
              uint64_t v9 = *(void *)(*(void *)(v7 + 9688) + 8 * (v111 - 1));
              goto LABEL_147;
            }
            int v29 = 0;
LABEL_294:
            uint64_t v9 = 0;
LABEL_147:
            if (*(_DWORD *)(v7 + 3400)) {
              goto LABEL_269;
            }
            goto LABEL_148;
          }
        }
        else
        {
          uint64_t v54 = *(void *)(v7 + 1080);
          if (v54)
          {
            unint64_t v55 = *(unsigned int *)v33;
            if (v54 + 8 <= v55)
            {
              v56 = &v33[v54];
              uint64_t v57 = *((unsigned int *)v56 + 1);
              v58 = &v56[*(int *)v56];
              if (&v58[v57] <= &v33[v55]) {
                uint64_t v44 = (uint64_t)v58;
              }
              else {
                uint64_t v44 = 0;
              }
            }
            else
            {
              uint64_t v44 = 0;
            }
          }
          atomic_fetch_add_explicit(&dword_10003CD04, 1u, memory_order_relaxed);
          unsigned int v59 = open((const char *)v44, 32772);
          LODWORD(v44) = v59;
          if (v59 > 0x7FF)
          {
            if ((v59 & 0x80000000) != 0)
            {
              atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
              break;
            }
          }
          else
          {
            *(_DWORD *)(v7 + 4 * v59 + 9756) = 749;
            ++*(_DWORD *)(v7 + 9752);
          }
          if (!pthread_fchdir_np())
          {
            uint64_t v44 = v44;
            goto LABEL_128;
          }
          int v60 = *__error();
          atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
          if ((int)v44 <= 2047)
          {
            int v61 = *(_DWORD *)(v7 + 9752);
            *(_DWORD *)(v7 + 9752) = v61 - 1;
            uint64_t v62 = v7 + 4 * v44;
            int v63 = *(_DWORD *)(v62 + 9756);
            if (v63 < 0 || v61 <= 0) {
              sub_1000254AC();
            }
            if (v63) {
              *(_DWORD *)(v62 + 9756) = -v63;
            }
          }
          close(v44);
          *__error() = v60;
        }
        break;
      }
      __error();
      int v64 = 0;
      uint64_t v44 = -1;
      goto LABEL_131;
    }
LABEL_148:
    if (!v9) {
      goto LABEL_269;
    }
    if (*(_DWORD *)(v7 + 3400) && !*(_DWORD *)(v7 + 9700))
    {
      *(_DWORD *)(v7 + 9700) = 2;
      goto LABEL_269;
    }
    *(_DWORD *)(v7 + 9700) = 0;
    bzero(v157, 0x400uLL);
    if (*(_DWORD *)(v7 + 9708))
    {
      d_name = v157;
      sub_10001D964(v157, *(_DWORD *)(v7 + 9724), *(void *)(v9 + 48));
    }
    else
    {
      d_name = ".";
    }
    if (*(_DWORD *)(v7 + 9712))
    {
      v68 = opendir(d_name);
      if (!v68) {
        goto LABEL_269;
      }
      v69 = v68;
      bzero(&v156, 0x418uLL);
      v155 = 0;
      if (*(void *)(v7 + 9664))
      {
        uint64_t v70 = *(void *)(v7 + 9672);
        if (v70) {
          int v71 = (*(uint64_t (**)(uint64_t, uint64_t))(v70 + 16))(v70, v7);
        }
        else {
          int v71 = 1;
        }
      }
      else
      {
        int v71 = 0;
      }
      while (1)
      {
        while (1)
        {
          while (1)
          {
            if (v29 != 1 && !readdir_r(v69, &v156, &v155))
            {
              v95 = v155;
              if (v155) {
                continue;
              }
            }
            closedir(v69);
            if (*(_DWORD *)(v7 + 9716)
              && (!*(void *)(v7 + 9664)
               || (uint64_t v105 = *(void *)(v7 + 9672)) != 0
               && ((*(uint64_t (**)(uint64_t, uint64_t))(v105 + 16))(v105, v7) & 1) == 0))
            {
              if (v29 != 1)
              {
                *(void *)&v154.st_dev = 0;
                v106 = (const char *)sub_100008014(*(void *)(v7 + 9640), &v154);
                if (*(void *)&v154.st_dev >= 4uLL)
                {
                  v107 = v106;
                  unint64_t v108 = *(unsigned int *)v106;
                  if (*(void *)&v154.st_dev >= v108)
                  {
                    uint64_t v109 = 0;
                    do
                    {
                      uint64_t v109 = sub_100007080(v7, v109, v107);
                      *(_DWORD *)(v7 + 3348) = 0;
                      int v29 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
                      sub_100008044(*(void **)(v7 + 9640), v108);
                      if (v29 == 2) {
                        int v29 = 0;
                      }
                      if (v29 == 1) {
                        break;
                      }
                      *(void *)&v154.st_dev = 0;
                      v110 = (const char *)sub_100008014(*(void *)(v7 + 9640), &v154);
                      if (*(void *)&v154.st_dev < 4uLL) {
                        break;
                      }
                      v107 = v110;
                      unint64_t v108 = *(unsigned int *)v110;
                    }
                    while (*(void *)&v154.st_dev >= v108);
                  }
                }
              }
              sub_100008490(*(void **)(v7 + 9640));
            }
            else
            {
              sub_1000071CC((_DWORD *)v7);
            }
            goto LABEL_269;
            if (strcmp(v155->d_name, ".") && strcmp(v95->d_name, ".."))
            {
              if (*(_DWORD *)(v7 + 9708))
              {
                sub_10001D964(v157, *(_DWORD *)(v7 + 9724), v95->d_ino);
                v95 = v155;
              }
              else
              {
                d_name = v95->d_name;
              }
              int d_type = v95->d_type;
              if (!v95->d_type)
              {
                memset(&v154, 0, sizeof(v154));
                int v97 = sub_10001D9B4(d_name, &v154);
                v98 = v155;
                if (!v97) {
                  v155->int d_type = v154.st_mode >> 12;
                }
                int d_type = v98->d_type;
              }
              if ((d_type == 8 || d_type == 4)
                && (!sub_10001DA40(d_name, v146, v28, v147, 8) || !*__error()))
              {
                break;
              }
            }
          }
          if (v155->d_type != 8) {
            break;
          }
          if (*(_DWORD *)(v7 + 9724) == *(_DWORD *)&v28[*(void *)(v7 + 1088)])
          {
            if (*(_DWORD *)(v7 + 9716))
            {
              if (v71)
              {
                uint64_t v99 = v7;
                v100 = (unsigned int *)v28;
                size_t d_namlen = 0;
                v102 = 0;
                int v103 = 1;
                goto LABEL_248;
              }
              sub_100008418(*(void **)(v7 + 9640), *(unsigned int *)v28, v28);
            }
            else
            {
              sub_100007080(v7, 0, v28);
              *(_DWORD *)(v7 + 3348) = 0;
              int v104 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
              if (v104 == 2) {
                int v29 = 0;
              }
              else {
                int v29 = v104;
              }
            }
          }
        }
        if ((v28[*(void *)(v7 + 1120)] & 3) == 0 && *(_DWORD *)(v7 + 9724) == *(_DWORD *)&v28[*(void *)(v7 + 1088)])
        {
          size_t d_namlen = v155->d_namlen;
          v102 = v155->d_name;
          uint64_t v99 = v7;
          v100 = (unsigned int *)v28;
          int v103 = v71;
LABEL_248:
          sub_100006F50(v99, v100, d_namlen, v102, v103);
        }
      }
    }
    atomic_fetch_add_explicit(&dword_10003CD04, 1u, memory_order_relaxed);
    unsigned int v72 = open(d_name, 32772);
    int v73 = v72;
    unsigned int v145 = v72;
    if (v72 > 0x7FF)
    {
      if ((v72 & 0x80000000) != 0)
      {
        atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
        goto LABEL_269;
      }
    }
    else
    {
      *(_DWORD *)(v7 + 4 * v72 + 9756) = 1654;
      ++*(_DWORD *)(v7 + 9752);
    }
    while (1)
    {
      int v74 = sub_10001DA58(v73, v146, v28, v147, 8);
      if ((v74 & 0x80000000) == 0)
      {
        int v75 = v74;
        if (!v74)
        {
          BOOL v85 = v29 != 1;
          goto LABEL_197;
        }
        if (*(void *)(v7 + 9664))
        {
          uint64_t v76 = *(void *)(v7 + 9672);
          if (v76) {
            int v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v76 + 16))(v76, v7);
          }
          else {
            int v77 = 1;
          }
        }
        else
        {
          int v77 = 0;
        }
        uint64_t v78 = 0;
        int v29 = 0;
        int v79 = 1;
        v80 = v149;
        while (1)
        {
          if (*(_DWORD *)(v7 + 9724) != *(_DWORD *)&v80[*(void *)(v7 + 1088)]) {
            goto LABEL_189;
          }
          int v81 = *(_DWORD *)&v80[*(void *)(v7 + 1096)];
          if (v81 - 1) > 1 || *(void *)(v7 + 1072) && (SIUINT64SetContainsValue()) {
            goto LABEL_189;
          }
          if (v81 != 1) {
            break;
          }
          if (!*(_DWORD *)(v7 + 9716))
          {
            uint64_t v78 = sub_100007080(v7, v78, v80);
            *(_DWORD *)(v7 + 3348) = 0;
            *(unsigned char *)(v7 + 1065) = *(void *)(v7 + 1072) != 0;
            int v29 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
            if (*(unsigned char *)(v7 + 1065)) {
              SIUINT64SetAddValue();
            }
            if (v29 == 2) {
              int v29 = 0;
            }
            goto LABEL_189;
          }
          if (v77)
          {
            uint64_t v82 = v7;
            v83 = (unsigned int *)v80;
            int v84 = 1;
LABEL_182:
            sub_100006F50(v82, v83, 0, 0, v84);
            goto LABEL_189;
          }
          sub_100008418(*(void **)(v7 + 9640), *(unsigned int *)v80, v80);
LABEL_189:
          if (v79 < v75)
          {
            v80 += *(unsigned int *)v80;
            ++v79;
            if (v29 != 1) {
              continue;
            }
          }
          goto LABEL_191;
        }
        if ((v80[*(void *)(v7 + 1120)] & 3) != 0) {
          goto LABEL_189;
        }
        uint64_t v82 = v7;
        v83 = (unsigned int *)v80;
        int v84 = v77;
        goto LABEL_182;
      }
      LODWORD(v78) = *__error();
LABEL_191:
      BOOL v85 = v29 != 1;
      if (v78) {
        break;
      }
      uint64_t v28 = (char *)v149;
      int v73 = v145;
      if (v29 == 1) {
        goto LABEL_197;
      }
    }
    uint64_t v28 = (char *)v149;
    int v73 = v145;
LABEL_197:
    if (*(_DWORD *)(v7 + 9716)
      && (!*(void *)(v7 + 9664)
       || (uint64_t v86 = *(void *)(v7 + 9672)) != 0
       && ((*(uint64_t (**)(uint64_t, uint64_t))(v86 + 16))(v86, v7) & 1) == 0))
    {
      if (v29 != 1)
      {
        v156.d_ino = 0;
        v87 = (const char *)sub_100008014(*(void *)(v7 + 9640), &v156);
        if (v156.d_ino >= 4)
        {
          v88 = v87;
          __uint64_t v89 = *(unsigned int *)v87;
          if (v156.d_ino >= v89)
          {
            uint64_t v90 = 0;
            do
            {
              uint64_t v90 = sub_100007080(v7, v90, v88);
              *(_DWORD *)(v7 + 3348) = 0;
              *(unsigned char *)(v7 + 1065) = *(void *)(v7 + 1072) != 0;
              int v29 = a3(v7, v148, (uint64_t)a2, *(unsigned int *)(v7 + 3384), *(void *)(v7 + 3392));
              if (*(unsigned char *)(v7 + 1065)) {
                SIUINT64SetAddValue();
              }
              sub_100008044(*(void **)(v7 + 9640), v89);
              if (v29 == 2) {
                int v29 = 0;
              }
              if (v29 == 1) {
                break;
              }
              v156.d_ino = 0;
              v91 = (const char *)sub_100008014(*(void *)(v7 + 9640), &v156);
              if (v156.d_ino < 4) {
                break;
              }
              v88 = v91;
              __uint64_t v89 = *(unsigned int *)v91;
            }
            while (v156.d_ino >= v89);
          }
        }
        int v73 = v145;
      }
      sub_100008490(*(void **)(v7 + 9640));
    }
    else if (v85)
    {
      sub_1000071CC((_DWORD *)v7);
    }
    else
    {
      int v29 = 1;
    }
    atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
    if (v73 <= 2047)
    {
      int v92 = *(_DWORD *)(v7 + 9752);
      *(_DWORD *)(v7 + 9752) = v92 - 1;
      uint64_t v93 = v7 + 4 * v73;
      int v94 = *(_DWORD *)(v93 + 9756);
      if (v94 < 0 || v92 <= 0) {
        sub_100025454();
      }
      if (v94) {
        *(_DWORD *)(v93 + 9756) = -v94;
      }
    }
    close(v73);
LABEL_269:
    if (v29 != 1)
    {
      uint64_t v24 = 0;
      if (!v9) {
        break;
      }
      continue;
    }
LABEL_270:
    if (!*(_DWORD *)(v7 + 9708))
    {
      int v123 = *(_DWORD *)(v7 + 9696);
      uint64_t v24 = 0xFFFFFFFFLL;
      if (v123)
      {
        do
        {
          uint64_t v124 = *(void *)(*(void *)(v7 + 9688) + 8 * --v123);
          if (!v124) {
            break;
          }
          uint64_t v125 = *(void *)(v124 + 48);
          if (v125 != -1)
          {
            if ((v125 & 0x80000000) == 0)
            {
              atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
              if ((int)v125 <= 2047)
              {
                int v126 = *(_DWORD *)(v7 + 9752);
                *(_DWORD *)(v7 + 9752) = v126 - 1;
                uint64_t v127 = v7 + 4 * (int)v125;
                int v128 = *(_DWORD *)(v127 + 9756);
                if (v128 < 0 || v126 <= 0) {
                  sub_100025428();
                }
                if (v128) {
                  *(_DWORD *)(v127 + 9756) = -v128;
                }
              }
            }
            close(v125);
            int v123 = *(_DWORD *)(v7 + 9696) - 1;
          }
          *(_DWORD *)(v7 + 9696) = v123;
        }
        while (v123);
        uint64_t v24 = 0xFFFFFFFFLL;
      }
      break;
    }
    int v29 = 1;
    uint64_t v24 = 0xFFFFFFFFLL;
    if (!v9) {
      break;
    }
  }
  while (v29 != 1 && !*(_DWORD *)(v7 + 3400));
  double v129 = sub_100008490(*(void **)(v7 + 9640));
  if (*(_DWORD *)(v7 + 3400))
  {
    *(_DWORD *)(v7 + 3404) = 1;
    unsigned int v130 = v144;
    if (!*(_DWORD *)(v7 + 9708))
    {
      atomic_fetch_add_explicit(&dword_10003CD04, 1u, memory_order_relaxed);
      unsigned int v131 = open(".", 32772, v129);
      if (v131 <= 0x7FF)
      {
        *(_DWORD *)(v7 + 4 * v131 + 9756) = 1868;
        ++*(_DWORD *)(v7 + 9752);
        goto LABEL_328;
      }
      if ((v131 & 0x80000000) != 0)
      {
        atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
        *(_DWORD *)(v7 + 9704) = v131;
        *(_DWORD *)(v7 + 3404) = 0;
        uint64_t v24 = 1;
      }
      else
      {
LABEL_328:
        *(_DWORD *)(v7 + 9704) = v131;
      }
    }
    *(_DWORD *)(v7 + 3400) = 0;
    if ((v144 & 0x80000000) == 0)
    {
LABEL_330:
      if (pthread_fchdir_np())
      {
        *(_DWORD *)(v7 + 3404) = 0;
        int v118 = *__error();
        atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
        if (v130 <= 0x7FF)
        {
          int v132 = *(_DWORD *)(v7 + 9752);
          *(_DWORD *)(v7 + 9752) = v132 - 1;
          uint64_t v133 = v7 + 4 * v130;
          int v134 = *(_DWORD *)(v133 + 9756);
          if (v134 < 0 || v132 <= 0) {
            sub_1000253FC();
          }
          if (v134) {
            *(_DWORD *)(v133 + 9756) = -v134;
          }
        }
        int v122 = v130;
        goto LABEL_337;
      }
      atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
      if (v130 <= 0x7FF)
      {
        int v135 = *(_DWORD *)(v7 + 9752);
        *(_DWORD *)(v7 + 9752) = v135 - 1;
        uint64_t v136 = v7 + 4 * v130;
        int v137 = *(_DWORD *)(v136 + 9756);
        if (v137 < 0 || v135 <= 0) {
          sub_1000253D0();
        }
        if (v137) {
          *(_DWORD *)(v136 + 9756) = -v137;
        }
      }
      close(v130);
    }
  }
  else
  {
    unsigned int v130 = v144;
    if ((v144 & 0x80000000) == 0) {
      goto LABEL_330;
    }
  }
  free(v28);
LABEL_346:
  uint64_t v138 = *(void *)(a1 + 8608);
  if (v138)
  {
    *(_DWORD *)(a1 + 3404) = *(_DWORD *)(v138 + 3404);
    *(_DWORD *)(a1 + 3400) = 0;
  }
  return v24;
}

uint64_t sub_100005DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

uint64_t sub_100005DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a3 + 24);
  int v7 = *(_DWORD *)(a2 + 4);
  if (v7 == 2)
  {
    if (*(double *)(v6 + 3416) < CFAbsoluteTimeGetCurrent() - *(double *)a3)
    {
      do
      {
        *(_DWORD *)(v6 + 3400) = 1;
        uint64_t v6 = *(void *)(v6 + 8608);
      }
      while (v6);
    }
    return 0;
  }
  int v12 = *(_DWORD *)a2;
  if (v7 != 1 || v12 < 1)
  {
    int v14 = 0;
  }
  else
  {
    if ((*(unsigned char *)(v6 + 3424) & 0x40) == 0)
    {
      int v14 = 0;
      goto LABEL_17;
    }
    uint64_t v15 = *(void *)(a2 + 16);
    if (qword_10003CD10 != -1) {
      dispatch_once(&qword_10003CD10, &stru_100034F00);
    }
    int v14 = fcntl(dword_10003B028, 52, v15) >= 0;
    int v12 = *(_DWORD *)a2;
  }
  if (v12 < 1)
  {
LABEL_18:
    int v16 = 0;
    goto LABEL_26;
  }
LABEL_17:
  if ((*(unsigned char *)(v6 + 3424) & 0x20) == 0) {
    goto LABEL_18;
  }
  if ((*(_WORD *)(a5 + *(void *)(v6 + 1104) + 8) & 0x40) == 0)
  {
    uint64_t v17 = *(unsigned char **)(a2 + 32);
    if (!v17)
    {
      int v16 = 0;
      goto LABEL_25;
    }
    if (*v17 != 46)
    {
      int v16 = 0;
      LODWORD(v17) = 0;
      goto LABEL_25;
    }
  }
  LODWORD(v17) = *(_DWORD *)(a2 + 4) == 1;
  int v16 = 1;
LABEL_25:
  v14 |= v17;
LABEL_26:
  int v18 = *(_DWORD *)(a2 + 4);
  if (v18)
  {
    if (v18 == 1)
    {
      int v19 = *(_DWORD *)(v6 + 3424);
      if ((v19 & 4) == 0) {
        return (2 * v14);
      }
    }
    else
    {
      int v19 = *(_DWORD *)(v6 + 3424);
    }
  }
  else
  {
    int v19 = *(_DWORD *)(v6 + 3424);
    if ((v19 & 8) == 0) {
      return (2 * v14);
    }
  }
  if (!sub_100006170(v19, (int *)(v6 + 4176), a5, *(void *)(v6 + 3472), *(void *)(v6 + 3480)) || v16) {
    return (2 * v14);
  }
  if ((*(unsigned char *)(v6 + 1028) & 0x80) == 0)
  {
    sub_1000063C8(v6 + 6392, a5, *(char **)(v6 + 3440));
    a5 = *(void *)(v6 + 3440);
  }
  unsigned int v20 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(a3 + 8))(v6, a2, *(void *)(a3 + 16), a4, a5);
  if (v14) {
    unsigned int v21 = 2;
  }
  else {
    unsigned int v21 = v20;
  }
  if (v20 == 1) {
    return 1;
  }
  else {
    return v21;
  }
}

uint64_t sub_100005FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5)
{
  return sub_100006010(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100005DDC);
}

uint64_t sub_100006010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t (*a6)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))
{
  int v8 = sub_1000038F4();
  if (!v8) {
    return 4294967294;
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_1000049F0((uint64_t)v8, a5, a6);
  sub_100003F14(v9);
  return v10;
}

uint64_t sub_10000606C(uint64_t a1, uint64_t a2, unint64_t a3, int a4, void *a5, unsigned int *a6, unsigned int *a7, char a8, long long *a9)
{
  uint64_t v9 = sub_100004394(0.0, a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v9) {
    return 4294967294;
  }
  uint64_t v10 = v9;
  do
    uint64_t v11 = sub_1000049F0((uint64_t)v10, a9, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100005DDC);
  while (v11 && *__error() == 35);
  sub_100003F14(v10);
  return v11;
}

uint64_t sub_1000060EC(uint64_t a1, uint64_t a2, unint64_t a3, int a4, void *a5, unsigned int *a6, unsigned int *a7, char a8, uint64_t a9, uint64_t a10)
{
  *(void *)&long long v11 = _NSConcreteStackBlock;
  *((void *)&v11 + 1) = 0x40000000;
  int v12 = sub_10000615C;
  uint64_t v13 = &unk_100034E90;
  uint64_t v14 = a10;
  uint64_t v15 = a9;
  return sub_10000606C(a1, a2, a3, a4, a5, a6, a7, a8, &v11);
}

uint64_t sub_10000615C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

BOOL sub_100006170(int a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = *a2;
  if (*a2 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = (unsigned int *)(a5 + 4);
    long long v11 = (unsigned int *)(a4 + 4);
    while (1)
    {
      int v12 = &a2[2 * v9];
      unint64_t v13 = *((void *)v12 + 197);
      uint64_t v14 = *((void *)v12 + 37);
      if (!v14) {
        goto LABEL_26;
      }
      if (*((unsigned char *)a2 + v9 + 136)) {
        break;
      }
      BOOL v20 = 1;
LABEL_28:
      if (++v9 >= v6 || !v20) {
        goto LABEL_42;
      }
    }
    uint64_t v15 = (unsigned int *)(a3 + v14);
    switch(*((unsigned char *)a2 + v9 + 216))
    {
      case 1:
        if (v13 < 4) {
          goto LABEL_26;
        }
        unint64_t v16 = v13 >> 2;
        uint64_t v17 = v10;
        int v18 = v11;
        while (2)
        {
          unsigned int v19 = *v15;
          if (*v15 > *v18 && v19 < *v17) {
            goto LABEL_26;
          }
          if (v19 >= *v18 && v19 <= *v17)
          {
            ++v15;
            ++v18;
            ++v17;
            BOOL v20 = 1;
            if (!--v16) {
              goto LABEL_27;
            }
            continue;
          }
          goto LABEL_40;
        }
      case 2:
        if (v13 < 8) {
          goto LABEL_26;
        }
        unint64_t v21 = v13 >> 3;
        int v22 = (unint64_t *)v10;
        unsigned int v23 = (unint64_t *)v11;
        break;
      case 3:
        int v25 = (char *)v15 + (int)*v15;
        uint64_t v26 = (char *)v11 + (int)*v11;
        if ((a1 & 2) != 0)
        {
          BOOL v20 = strcasestr(v25, v26) != 0;
          int v6 = *a2;
        }
        else
        {
          BOOL v20 = strcasecmp(v25, v26) == 0;
        }
        goto LABEL_27;
      case 4:
        if (v13 < 4) {
          goto LABEL_26;
        }
        if (v13 >> 2 <= 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = v13 >> 2;
        }
        if ((*v10 & *v15) != *v11) {
          goto LABEL_40;
        }
        uint64_t v28 = 1;
        do
        {
          unint64_t v29 = v28;
          if (v27 == v28) {
            break;
          }
          int v30 = v10[v28] & v15[v28];
          int v31 = v11[v28++];
        }
        while (v30 == v31);
        BOOL v20 = v29 >= v13 >> 2;
        goto LABEL_27;
      default:
        goto LABEL_26;
    }
    while (1)
    {
      unint64_t v24 = *(void *)v15;
      if (*(void *)v15 > *v23 && v24 < *v22) {
        break;
      }
      if (v24 < *v23 || v24 > *v22)
      {
LABEL_40:
        BOOL v20 = 0;
        goto LABEL_27;
      }
      v15 += 2;
      ++v23;
      ++v22;
      BOOL v20 = 1;
      if (!--v21) {
        goto LABEL_27;
      }
    }
LABEL_26:
    BOOL v20 = 1;
LABEL_27:
    long long v11 = (unsigned int *)((char *)v11 + v13);
    uint64_t v10 = (unsigned int *)((char *)v10 + v13);
    goto LABEL_28;
  }
  BOOL v20 = 1;
LABEL_42:
  if (a1 >= 0) {
    return v20;
  }
  else {
    return !v20;
  }
}

char *sub_1000063C8(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v14 = &a3[*(void *)(a1 + 40)];
  uint64_t v15 = a3 + 4;
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6)
  {
    int v7 = *(_DWORD *)(a2 + v6);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      int v7 = sub_100006540(*(_DWORD *)(a2 + v8));
    }
    else {
      int v7 = -1;
    }
  }
  if (*(int *)(a1 + 4) < 1) {
    goto LABEL_15;
  }
  uint64_t v9 = 0;
  do
  {
    sub_100006570(*(void *)(a1 + 8 * v9 + 1576), *(char *)(a1 + v9 + 56), *(void *)(a1 + 8 * v9 + 296), a2, &v15, (void **)&v14);
    ++v9;
    uint64_t v10 = *(int *)(a1 + 4);
  }
  while (v9 < v10);
  if (v7 == 2 && (uint64_t v11 = *(unsigned int *)(a1 + 4), (int)v10 >= 1))
  {
    if (*(int *)(a1 + 8) >= 1)
    {
      do
      {
        sub_100006570(*(void *)(a1 + 8 * v11 + 1576), *(char *)(a1 + v11 + 56), *(void *)(a1 + 8 * v11 + 296), a2, &v15, (void **)&v14);
        ++v11;
      }
      while (v11 < *(int *)(a1 + 8) + (uint64_t)*(int *)(a1 + 4));
    }
  }
  else
  {
LABEL_15:
    if (v7 == 1 && *(int *)(a1 + 16) >= 1)
    {
      uint64_t v12 = *(int *)(a1 + 12);
      do
      {
        sub_100006570(*(void *)(a1 + 8 * v12 + 1576), *(char *)(a1 + v12 + 56), *(void *)(a1 + 8 * v12 + 296), a2, &v15, (void **)&v14);
        ++v12;
      }
      while (v12 < *(int *)(a1 + 16) + (uint64_t)*(int *)(a1 + 12));
    }
  }
  uint64_t result = (char *)(v14 - a3);
  *(_DWORD *)a3 = v14 - a3;
  return result;
}

uint64_t sub_100006540(__int16 a1)
{
  unsigned int v1 = (a1 & 0xF000) - 4096;
  if (v1 >> 14 > 2) {
    return 0;
  }
  else {
    return dword_10002BCB0[v1 >> 12];
  }
}

void sub_100006570(size_t __n, int a2, uint64_t a3, uint64_t a4, void **a5, void **a6)
{
  if (a3)
  {
    if (a2)
    {
      uint64_t v9 = a4 + a3;
      unsigned int v10 = *a6 - *(_DWORD *)a5;
      unsigned int v11 = *(_DWORD *)(a4 + a3 + 4);
      memcpy(*a6, (const void *)(a4 + a3 + *(int *)(a4 + a3)), v11);
      uint64_t v12 = *a5;
      *uint64_t v12 = v10;
      v12[1] = v11;
      *a6 = (char *)*a6 + ((*(_DWORD *)(v9 + 4) + 3) & 0xFFFFFFFC);
    }
    else
    {
      memcpy(*a5, (const void *)(a4 + a3), __n);
    }
  }
  else
  {
    bzero(*a5, __n);
  }
  *a5 = (char *)*a5 + __n;
}

uint64_t sub_100006624(uint64_t a1, uint64_t a2, char *a3)
{
  if (a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = a2;
  }
  bzero(a3, 0x8A8uLL);
  uint64_t v6 = (BOOL *)(a3 + 56);
  int v7 = a3 + 136;
  uint64_t v8 = a3 + 216;
  uint64_t v9 = (unint64_t *)(a3 + 296);
  unsigned int v10 = a3 + 936;
  unsigned int v11 = a3 + 1576;
  v30[1] = 0;
  v30[2] = 0;
  v30[0] = 0x800000005;
  *((void *)a3 + 3) = sub_100006838(v5, (uint64_t)v30);
  v29[1] = 0;
  v29[2] = 0;
  v29[0] = 0x2000000000005;
  uint64_t v12 = sub_100006838(v5, (uint64_t)v29);
  unint64_t v13 = 0;
  uint64_t result = 0;
  *((void *)a3 + 4) = v12;
  uint64_t v15 = (_DWORD *)(v5 + 4);
  unint64_t v16 = (_DWORD *)(a2 + 4);
  unint64_t v17 = 4;
  *(int64x2_t *)(a3 + 40) = vdupq_n_s64(4uLL);
  int v18 = off_100034EB0;
  unsigned int v19 = &off_10003B030;
  unint64_t v20 = 4;
  do
  {
    BOOL v21 = v19 != &off_10003AD08;
    if (v19 == &off_10003AD08)
    {
      int v22 = a3 + 4;
      unint64_t v13 = v20;
    }
    else
    {
      if (v19 != &off_10003ADA8)
      {
        BOOL v21 = 0;
        goto LABEL_11;
      }
      int v22 = a3 + 12;
      unint64_t v20 = v13;
    }
    *(_DWORD *)int v22 = result;
LABEL_11:
    int v23 = *((_DWORD *)v19 + 2);
    if (v23)
    {
      unint64_t v24 = v19 + 3;
      do
      {
        int v25 = *v15 & v23;
        if ((*v16 & v23) != 0)
        {
          BOOL v26 = *(v24 - 1) != *v24;
          if (v25) {
            unint64_t v27 = v20;
          }
          else {
            unint64_t v27 = 0;
          }
          *v9++ = v27;
          *v10++ = *((void *)a3 + 5);
          *v11++ = *(v24 - 1);
          *v6++ = v26;
          *v7++ = *((_DWORD *)v24 + 3);
          *v8++ = *((_DWORD *)v24 + 2);
          *((void *)a3 + 5) += *(v24 - 1);
          if (v19 == &off_10003AD08) {
            ++*((_DWORD *)a3 + 2);
          }
          uint64_t result = (result + 1);
          if (v21) {
            ++*((_DWORD *)a3 + 4);
          }
        }
        if (v25) {
          v20 += (unint64_t)*(v24 - 1);
        }
        int v23 = *((_DWORD *)v24 + 6);
        v24 += 5;
      }
      while (v23);
      unint64_t v17 = *((void *)a3 + 6);
    }
    if (v20 > v17) {
      unint64_t v17 = v20;
    }
    *((void *)a3 + 6) = v17;
    uint64_t v28 = v18[1];
    ++v18;
    unsigned int v19 = v28;
    ++v15;
    ++v16;
  }
  while (v28);
  *(_DWORD *)a3 = result;
  return result;
}

uint64_t sub_100006838(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  CFTypeRef v3 = (_DWORD *)(a1 + 4);
  uint64_t v4 = off_100034EB0;
  uint64_t v5 = &off_10003B030;
  uint64_t v6 = (_DWORD *)(a2 + 4);
  uint64_t result = 4;
  do
  {
    if (v5 == &off_10003AD08) {
      uint64_t v8 = result;
    }
    else {
      uint64_t v8 = v2;
    }
    if (v5 == &off_10003ADA8) {
      uint64_t result = v2;
    }
    int v9 = *((_DWORD *)v5 + 2);
    if (v9)
    {
      unsigned int v10 = v5 + 6;
      do
      {
        if ((*v3 & v9) != 0)
        {
          if (v9 == *v6) {
            return result;
          }
          result += *((void *)v10 - 4);
        }
        int v11 = *v10;
        v10 += 10;
        int v9 = v11;
      }
      while (v11);
    }
    uint64_t v12 = v4[1];
    ++v4;
    uint64_t v5 = v12;
    ++v3;
    ++v6;
    uint64_t v2 = v8;
  }
  while (v12);
  return 0;
}

char *sub_1000068C8(char *a1, uint64_t a2, void *a3)
{
  unint64_t v3 = *(unsigned int *)a1;
  if (a2 + 8 > v3) {
    return 0;
  }
  uint64_t v5 = *(unsigned int *)&a1[a2 + 4];
  uint64_t result = &a1[a2 + *(int *)&a1[a2]];
  if (&result[v5] > &a1[v3]) {
    return 0;
  }
  if (a3) {
    *a3 = v5;
  }
  return result;
}

unint64_t sub_100006910(uint64_t a1)
{
  unint64_t v1 = 0;
  unint64_t v2 = 0;
  unint64_t v3 = off_100034EB0;
  uint64_t v4 = &off_10003B030;
  uint64_t v5 = (_DWORD *)(a1 + 4);
  unint64_t v6 = 4;
  do
  {
    if (v4 == &off_10003AD08) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = v2;
    }
    if (v4 == &off_10003ADA8)
    {
      unint64_t v1 = v6;
      unint64_t v6 = v2;
    }
    int v8 = *((_DWORD *)v4 + 2);
    if (v8)
    {
      int v9 = v4 + 3;
      do
      {
        if ((*v5 & v8) != 0) {
          v6 += (unint64_t)*v9;
        }
        int v8 = *((_DWORD *)v9 + 6);
        v9 += 5;
      }
      while (v8);
    }
    unsigned int v10 = v3[1];
    ++v3;
    uint64_t v4 = v10;
    ++v5;
    unint64_t v2 = v7;
  }
  while (v10);
  if (v6 <= v1) {
    return v1;
  }
  else {
    return v6;
  }
}

_WORD *sub_10000699C(_WORD *result, uint64_t a2)
{
  int v2 = (unsigned __int16)*result;
  if (*result)
  {
    unint64_t v3 = (int *)(a2 + 4);
    uint64_t v4 = result + 2;
    do
    {
      int v5 = *v3++;
      *v4++ |= v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_1000069C8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  if (*(unsigned char *)(result + a3 + 56)) {
    sub_1000255B4();
  }
  if (!*(unsigned char *)(result + a3 + 216)) {
    sub_10002555C();
  }
  uint64_t v4 = result + 8 * a3;
  uint64_t v5 = *(void *)(v4 + 296);
  uint64_t v6 = *(void *)(v4 + 1576);
  if (v6 == 8)
  {
    *(void *)(a2 + v5) = a4;
  }
  else
  {
    if (v6 != 4) {
      sub_100025588();
    }
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      int v7 = 0x7FFFFFFF;
    }
    else {
      int v7 = a4;
    }
    *(_DWORD *)(a2 + v5) = v7;
  }
  return result;
}

void *sub_100006A3C(uint64_t a1, uint64_t a2, int a3, void *__src)
{
  if (*(unsigned char *)(a1 + a3 + 56)) {
    sub_10002560C();
  }
  if (!*(unsigned char *)(a1 + a3 + 216)) {
    sub_1000255E0();
  }
  uint64_t v4 = a1 + 8 * a3;
  uint64_t v5 = (void *)(a2 + *(void *)(v4 + 296));
  size_t v6 = *(void *)(v4 + 1576);

  return memcpy(v5, __src, v6);
}

void *sub_100006A98(uint64_t a1, uint64_t a2, int a3, void *__src, size_t __n, void **a6)
{
  if (!*(unsigned char *)(a1 + a3 + 56)) {
    sub_100025638();
  }
  uint64_t v7 = a3;
  if (!*(unsigned char *)(a1 + a3 + 216)) {
    sub_100025664();
  }
  int v11 = *a6;
  if (!*a6)
  {
    int v11 = (void *)(a2 + *(void *)(a1 + 48));
    *a6 = v11;
  }
  uint64_t result = memcpy(v11, __src, __n);
  unint64_t v13 = (_DWORD *)(a2 + *(void *)(a1 + 8 * v7 + 296));
  uint64_t v14 = (char *)*a6;
  *unint64_t v13 = *a6 - v13;
  v13[1] = __n;
  *a6 = &v14[(__n + 3) & 0xFFFFFFFFFFFFFFFCLL];
  return result;
}

void *sub_100006B40(uint64_t a1, uint64_t a2, int a3, char *__s, void **a5)
{
  size_t v10 = strlen(__s) + 1;

  return sub_100006A98(a1, a2, a3, __s, v10, a5);
}

_DWORD *sub_100006BB0(_DWORD *result, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  size_t v10 = result;
  BOOL v21 = 0;
  int v22 = (const char **)&a9;
  if (*a2 < 1) {
    goto LABEL_14;
  }
  uint64_t v11 = 0;
  do
  {
    switch(*((unsigned char *)a2 + v11 + 216))
    {
      case 0:
        sub_100025690();
      case 1:
        if (*(void *)&a2[2 * v11 + 394] != 4) {
          goto LABEL_9;
        }
        uint64_t v12 = v22++;
        LODWORD(v20) = *(_DWORD *)v12;
        goto LABEL_8;
      case 2:
        if (*(void *)&a2[2 * v11 + 394] != 8) {
          goto LABEL_9;
        }
        unint64_t v13 = v22++;
        unint64_t v20 = *v13;
LABEL_8:
        uint64_t v14 = (char *)&v20;
        goto LABEL_10;
      case 3:
        unint64_t v16 = v22++;
        unint64_t v17 = (char *)*v16;
        size_t v18 = strlen(*v16);
        uint64_t result = sub_100006A98((uint64_t)a2, (uint64_t)v10, v11, v17, v18 + 1, &v21);
        break;
      case 4:
LABEL_9:
        uint64_t v15 = v22++;
        uint64_t v14 = (char *)*v15;
LABEL_10:
        uint64_t result = sub_100006A3C((uint64_t)a2, (uint64_t)v10, v11, v14);
        break;
      default:
        break;
    }
    ++v11;
  }
  while (v11 < *a2);
  LODWORD(v19) = v21;
  if (!v21) {
LABEL_14:
  }
    unsigned int v19 = (char *)v10 + *((void *)a2 + 6);
  _DWORD *v10 = v19 - v10;
  return result;
}

uint64_t sub_100006D18(uint64_t result, _DWORD *a2, char **a3)
{
  if (a3) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = (char **)&unk_10003CD08;
  }
  uint64_t v4 = *v3;
  if (!*v3)
  {
    uint64_t v4 = (char *)a2 + *(void *)(result + 48);
    int *v3 = v4;
  }
  *a2 = v4 - a2;
  return result;
}

uint64_t sub_100006D48(uint64_t result, uint64_t a2, _OWORD *a3)
{
  a3[7] = 0u;
  a3[8] = 0u;
  a3[5] = 0u;
  a3[6] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  uint64_t v5 = (uint64_t *)(result + 296);
  uint64_t v6 = *(void *)(result + 24);
  if (v6)
  {
    int v7 = *(_DWORD *)(a2 + v6);
  }
  else
  {
    uint64_t v8 = *(void *)(result + 32);
    if (v8)
    {
      uint64_t result = sub_100006540(*(_DWORD *)(a2 + v8));
      int v7 = result;
    }
    else
    {
      int v7 = -1;
    }
  }
  int v9 = &unk_10002BB80;
  uint64_t v10 = 1;
  do
  {
    uint64_t v11 = *v5;
    size_t v12 = v5[160];
    if (*v5) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      uint64_t v14 = *(v9 - 1);
      if (v12 == *v9)
      {
        uint64_t result = (uint64_t)memcpy((char *)a3 + v14, (const void *)(a2 + v11), v12);
      }
      else
      {
        if (((0xA08000uLL >> v10) & 1) == 0) {
          sub_1000256BC();
        }
        int v15 = *(_DWORD *)(a2 + v11);
        if (v10 == 21)
        {
          *(_WORD *)((char *)a3 + v14) = v15 + 2;
          goto LABEL_19;
        }
        *(_WORD *)((char *)a3 + v14) = v15;
      }
    }
    if (v10 == 19 && v7 == -1) {
      return result;
    }
LABEL_19:
    if (v7 == 2 && v10 == 21) {
      break;
    }
    v9 += 2;
    ++v5;
    BOOL v13 = v10 == 29;
    v10 += 2;
  }
  while (!v13);
  return result;
}

uint64_t sub_100006E6C(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 9696) < 512)
  {
    bzero(v8, 0x440uLL);
    uint64_t v5 = sub_1000037C8(*(uint64_t **)(a1 + 9680), 0x440uLL, v8);
    *((void *)v5 + 6) = a2;
    strcpy((char *)v5 + 64, (const char *)(a1 + 8616));
    *((void *)v5 + 1) = v5;
    uint64_t v6 = *(int *)(a1 + 9696);
    *(void *)(*(void *)(a1 + 9688) + 8 * v6) = v5;
    *(_DWORD *)(a1 + 9696) = v6 + 1;
    if (*(void *)(a1 + 1080))
    {
      uint64_t v7 = *(void *)(a1 + 3352);
      *(void *)(a1 + 9736) = v7;
      *((void *)v5 + 7) = v7;
    }
    return 0;
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
}

void *sub_100006F50(uint64_t a1, unsigned int *a2, size_t a3, const void *a4, int a5)
{
  int v9 = *(_DWORD *)(a1 + 9696);
  if (v9) {
    uint64_t v10 = *(void **)(*(void *)(a1 + 9688) + 8 * (v9 - 1));
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t result = sub_1000037C8(*(uint64_t **)(a1 + 9680), *a2, a2);
  size_t v12 = result;
  if (*(_DWORD *)(a1 + 9712) && !*(void *)(a1 + 1080)) {
    uint64_t result = sub_1000037C8(*(uint64_t **)(a1 + 9680), a3, a4);
  }
  v10[1] = result;
  if (a5)
  {
    unint64_t v13 = v10[3];
    unint64_t v14 = *(void *)(a1 + 9656);
    if (v13 >= v14)
    {
      uint64_t v15 = 2 * v14;
      if (!v14) {
        uint64_t v15 = 8;
      }
      *(void *)(a1 + 9656) = v15;
      uint64_t result = malloc_type_realloc(*(void **)(a1 + 9648), 8 * v15, 0x80040B8603338uLL);
      *(void *)(a1 + 9648) = result;
      unint64_t v13 = v10[3];
    }
    else
    {
      uint64_t result = *(void **)(a1 + 9648);
    }
    result[v13] = v12;
    v10[3] = v13 + 1;
  }
  else if (!*v10)
  {
    void *v10 = v12;
  }
  return result;
}

void sub_100007054(id a1)
{
  dword_10003B028 = open("/System/Library", 4);
}

uint64_t sub_100007080(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = *(void *)(a1 + 1080);
  if (v6)
  {
    unint64_t v7 = *(unsigned int *)a3;
    if (v6 + 8 > v7 || (v8 = &a3[v6], uint64_t v9 = *((unsigned int *)v8 + 1), v10 = &v8[*(int *)v8], &v10[v9] > &a3[v7]))
    {
      a2 = 2;
      uint64_t v11 = -1;
LABEL_5:
      *(void *)(a1 + 3376) = a1 + *(void *)(a1 + 3352) - v11 + 8616;
      *(void *)(a1 + 3368) = v11;
      goto LABEL_6;
    }
    uint64_t v11 = v9 - 1;
    uint64_t v13 = *(void *)(a1 + 9736);
    if (v13 == 1)
    {
      if (*(unsigned char *)(a1 + 8616) == 47)
      {
        strlcpy((char *)(a1 + 8617), v10, 0x3FFuLL);
        goto LABEL_12;
      }
    }
    else if (!v13)
    {
      __strlcpy_chk();
LABEL_12:
      --v9;
LABEL_15:
      *(void *)(a1 + 3352) = *(void *)(a1 + 9736) + v9;
      goto LABEL_5;
    }
    if ((unint64_t)(v13 + v9) > 0x3FF)
    {
      a2 = 63;
      goto LABEL_5;
    }
    *(unsigned char *)(a1 + 8616 + v13) = 47;
    strlcpy((char *)(a1 + 8616 + *(void *)(a1 + 9736) + 1), v10, 1023 - *(void *)(a1 + 9736));
    goto LABEL_15;
  }
LABEL_6:
  *(_DWORD *)(a1 + 3384) = a2;
  *(void *)(a1 + 3392) = a3;
  *(_DWORD *)(a1 + 3344) = *(_DWORD *)(a1 + 9696) - 1;
  return a2;
}

_DWORD *sub_1000071CC(_DWORD *result)
{
  if (*((void *)result + 1208))
  {
    unint64_t v1 = result;
    uint64_t result = (_DWORD *)*((void *)result + 1209);
    if (!result
      || (uint64_t result = (_DWORD *)(*((uint64_t (**)(_DWORD *, _DWORD *))result + 2))(result, v1), result))
    {
      int v2 = v1[2424];
      if (v2) {
        unint64_t v3 = *(void **)(*((void *)v1 + 1211) + 8 * (v2 - 1));
      }
      else {
        unint64_t v3 = 0;
      }
      size_t v4 = v3[5];
      size_t v5 = v3[3];
      if (v4)
      {
        if (v4 < v5)
        {
          if (!*v3) {
            sub_10002576C();
          }
          if (*v3 != *(void *)(v3[4] + 8 * v4 - 8)) {
            sub_100025798();
          }
        }
      }
      else if (v5)
      {
        uint64_t v6 = (void *)*((void *)v1 + 1206);
        __compar[0] = _NSConcreteStackBlock;
        __compar[1] = 0x40000000;
        __compar[2] = sub_1000073E8;
        __compar[3] = &unk_100034F20;
        __compar[4] = v1;
        qsort_b(v6, v5, 8uLL, __compar);
        uint64_t result = sub_1000037C8(*((uint64_t **)v1 + 1210), 8 * v3[3], *((const void **)v1 + 1206));
        v3[4] = result;
        if (*v3) {
          sub_100025740();
        }
        if (v3[5]) {
          sub_100025714();
        }
        v3[5] = 1;
        void *v3 = *(void *)result;
      }
      else if (*v3)
      {
        sub_1000256E8();
      }
      v3[1] = v3[4];
    }
  }
  return result;
}

uint64_t sub_100007320(uint64_t result, uint64_t a2)
{
  if (a2 != -1)
  {
    uint64_t v2 = result;
    if (!*(_DWORD *)(result + 9708))
    {
      unsigned int v3 = a2;
      int v4 = *(_DWORD *)(result + 9696);
      if (v4 && *(void *)(*(void *)(result + 9688) + 8 * (v4 - 1))) {
        pthread_fchdir_np();
      }
      if ((v3 & 0x80000000) == 0)
      {
        atomic_fetch_add_explicit(&dword_10003CD04, 0xFFFFFFFF, memory_order_relaxed);
        if (v3 <= 0x7FF)
        {
          int v5 = *(_DWORD *)(v2 + 9752);
          *(_DWORD *)(v2 + 9752) = v5 - 1;
          uint64_t v6 = v2 + 4 * v3;
          int v7 = *(_DWORD *)(v6 + 9756);
          if (v7 < 0 || v5 <= 0) {
            sub_1000257C4();
          }
          if (v7) {
            *(_DWORD *)(v6 + 9756) = -v7;
          }
        }
      }
      return close(v3);
    }
  }
  return result;
}

uint64_t sub_1000073E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 9664) + 16))();
}

ssize_t sub_100007404(ssize_t result)
{
  unint64_t v1 = (char *)(result + 16);
  *(void *)(result + 4120) = result + 16;
  *(void *)(result + 4112) = result + 16;
  if (!*(_DWORD *)(result + 4128))
  {
    ssize_t v2 = result;
    uint64_t result = pread(*(_DWORD *)result, v1, 0x1000uLL, *(void *)(result + 8));
    if (result == -1)
    {
      unsigned int v3 = __stderrp;
      int v4 = __error();
      int v5 = *v4;
      *(_DWORD *)(v2 + 4128) = *v4;
      return fprintf(v3, "\npread error(%d) offset: 0x%llx \n", v5, *(void *)(v2 + 8));
    }
    else
    {
      *(void *)(v2 + 8) += result;
      *(void *)(v2 + 4112) = v1;
      *(void *)(v2 + 4120) = &v1[result];
      if (!result) {
        *(_DWORD *)(v2 + 4128) = -1;
      }
    }
  }
  return result;
}

ssize_t sub_1000074B8(ssize_t result, int a2, uint64_t a3)
{
  *(_DWORD *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(void *)(result + 4120) = result + 16;
  *(void *)(result + 4112) = result + 16;
  *(_DWORD *)(result + 4128) = 0;
  return sub_100007404(result);
}

uint64_t sub_1000074D4(ssize_t a1)
{
  ssize_t v2 = *(char **)(a1 + 4112);
  if ((uint64_t)(*(void *)(a1 + 4120) - (void)v2) < 11)
  {
    uint64_t v7 = 0;
    memset(v13, 0, sizeof(v13));
    while (1)
    {
      if ((unint64_t)v2 >= *(void *)(a1 + 4120))
      {
        sub_100007404(a1);
        ssize_t v2 = *(char **)(a1 + 4112);
      }
      uint64_t v8 = v2 + 1;
      *(void *)(a1 + 4112) = v2 + 1;
      int v9 = *v2;
      *((unsigned char *)v13 + v7) = v9;
      if ((v9 & 0x80000000) == 0) {
        break;
      }
      ++v7;
      ssize_t v2 = v8;
      if (v7 == 11) {
        return 0;
      }
    }
    uint64_t result = 0;
    if (v7 <= 9)
    {
      int v10 = *(_DWORD *)(a1 + 4128);
      if (!v10)
      {
        uint64_t result = 0;
        uint64_t v11 = (char *)v13;
        do
        {
          char v12 = *v11++;
          result |= (unint64_t)(v12 & 0x7F) << v10;
          v10 += 7;
        }
        while (v12 < 0);
      }
    }
  }
  else
  {
    int v3 = 0;
    uint64_t result = 0;
    int v5 = v2 + 1;
    do
    {
      char v6 = *(v5 - 1);
      *(void *)(a1 + 4112) = v5;
      result |= (unint64_t)(v6 & 0x7F) << v3;
      v3 += 7;
      ++v5;
    }
    while (v6 < 0);
  }
  return result;
}

uint64_t sub_1000075FC(ssize_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(char **)(a1 + 4112);
  if ((uint64_t)(*(void *)(a1 + 4120) - (void)v9) >= 11)
  {
    uint64_t result = *v9;
    if (*v9 < 0)
    {
      int v15 = v9[1];
      if (v9[1] < 0)
      {
        int v16 = v9[2];
        if (v9[2] < 0)
        {
          int v18 = v9[3];
          if (v9[3] < 0)
          {
            int v19 = v9[4];
            if (v19 < 0) {
              sub_1000257F0(result, a2, a3, a4, a5, a6, a7, a8);
            }
            uint64_t v20 = ((v18 & 0x7F) << 21) | (v19 << 28) | ((v16 & 0x7F) << 14) | ((v15 & 0x7F) << 7) | (result & 0x7F);
            uint64_t v11 = 5;
            uint64_t result = v20;
            goto LABEL_22;
          }
          uint64_t v17 = ((v16 & 0x7F) << 14) | (v18 << 21) | ((v15 & 0x7F) << 7) | (result & 0x7F);
          uint64_t v11 = 4;
        }
        else
        {
          uint64_t v17 = ((v15 & 0x7F) << 7) | (v16 << 14) | (result & 0x7F);
          uint64_t v11 = 3;
        }
        uint64_t result = v17;
      }
      else
      {
        uint64_t result = result & 0x7F | (v15 << 7);
        uint64_t v11 = 2;
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
LABEL_22:
    *(void *)(a1 + 4112) = &v9[v11];
    return result;
  }
  uint64_t v12 = 0;
  memset(v21, 0, sizeof(v21));
  while (1)
  {
    if ((unint64_t)v9 >= *(void *)(a1 + 4120))
    {
      sub_100007404(a1);
      int v9 = *(char **)(a1 + 4112);
    }
    uint64_t v13 = (unsigned __int8 *)(v9 + 1);
    *(void *)(a1 + 4112) = v9 + 1;
    int v14 = *v9;
    *((unsigned char *)v21 + v12) = v14;
    if ((v14 & 0x80000000) == 0) {
      break;
    }
    ++v12;
    int v9 = (char *)v13;
    if (v12 == 11) {
      return 0;
    }
  }
  uint64_t result = 0;
  if (v12 <= 9 && !*(_DWORD *)(a1 + 4128))
  {
    uint64_t result = LOBYTE(v21[0]);
    if (SLOBYTE(v21[0]) < 0)
    {
      if (SBYTE1(v21[0]) < 0)
      {
        if (SBYTE2(v21[0]) < 0)
        {
          if (SBYTE3(v21[0]) < 0)
          {
            if (SBYTE4(v21[0]) < 0) {
              sub_1000257F0(LOBYTE(v21[0]), a2, a3, a4, a5, a6, a7, a8);
            }
            return ((BYTE3(v21[0]) & 0x7F) << 21) | (BYTE4(v21[0]) << 28) | ((BYTE2(v21[0]) & 0x7F) << 14) | ((BYTE1(v21[0]) & 0x7F) << 7) | v21[0] & 0x7F;
          }
          else
          {
            return ((BYTE2(v21[0]) & 0x7F) << 14) | (BYTE3(v21[0]) << 21) | ((BYTE1(v21[0]) & 0x7F) << 7) | v21[0] & 0x7F;
          }
        }
        else
        {
          return ((BYTE1(v21[0]) & 0x7F) << 7) | (BYTE2(v21[0]) << 14) | v21[0] & 0x7F;
        }
      }
      else
      {
        return v21[0] & 0x7F | (BYTE1(v21[0]) << 7);
      }
    }
  }
  return result;
}

unint64_t sub_100007814(ssize_t a1)
{
  unint64_t v1 = *(void *)(a1 + 4120);
  ssize_t v2 = (void *)(a1 + 4112);
  int v3 = *(char **)(a1 + 4112);
  if ((uint64_t)(v1 - (void)v3) < 11)
  {
    if ((unint64_t)v3 >= v1)
    {
      sub_100007404(a1);
      int v3 = *(char **)(a1 + 4112);
    }
    memset(v19, 0, sizeof(v19));
    uint64_t v7 = v3 + 1;
    *ssize_t v2 = v3 + 1;
    int v8 = *v3;
    char v18 = v8;
    if (v8 < 0)
    {
      if (v8 >= 0xC0u)
      {
        uint64_t v10 = 4;
        uint64_t v11 = 5;
        uint64_t v12 = 6;
        uint64_t v13 = 7;
        uint64_t v14 = 8;
        if (v8 == 255) {
          uint64_t v14 = 9;
        }
        if (v8 >= 0xFEu) {
          uint64_t v13 = v14;
        }
        if (v8 >= 0xFCu) {
          uint64_t v12 = v13;
        }
        if (v8 >= 0xF8u) {
          uint64_t v11 = v12;
        }
        if (v8 >= 0xF0u) {
          uint64_t v10 = v11;
        }
        if (v8 >= 0xE0u) {
          uint64_t v9 = v10;
        }
        else {
          uint64_t v9 = 3;
        }
      }
      else
      {
        uint64_t v9 = 2;
      }
      int v15 = v19;
      uint64_t v16 = v9 - 1;
      do
      {
        if ((unint64_t)v7 >= *(void *)(a1 + 4120))
        {
          sub_100007404(a1);
          uint64_t v7 = *(unsigned char **)(a1 + 4112);
        }
        *ssize_t v2 = v7 + 1;
        *v15++ = *v7++;
        --v16;
      }
      while (v16);
    }
    uint64_t v17 = &v18;
    return sub_1000079B0(&v17);
  }
  else
  {
    int v4 = (char **)(a1 + 4112);
    return sub_1000079B0(v4);
  }
}

unint64_t sub_1000079B0(char **a1)
{
  unint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (**a1 < 0)
  {
    unsigned int v4 = **a1;
    if (v4 > 0xBF)
    {
      if (v4 > 0xDF)
      {
        if (v4 > 0xEF)
        {
          if (v4 > 0xF7)
          {
            if (v4 > 0xFB)
            {
              if (v4 > 0xFD)
              {
                if (v4 == 255)
                {
                  unint64_t v2 = *(void *)(v1 + 1);
                  uint64_t v3 = 9;
                }
                else
                {
                  unint64_t v2 = ((unint64_t)v1[1] << 48) | ((unint64_t)v1[2] << 40) | ((unint64_t)v1[3] << 32) | ((unint64_t)v1[4] << 24) | ((unint64_t)v1[5] << 16) | ((unint64_t)v1[6] << 8) | v1[7];
                  uint64_t v3 = 8;
                }
              }
              else
              {
                unint64_t v2 = ((v2 & 1) << 48) | ((unint64_t)v1[1] << 40) | ((unint64_t)v1[2] << 32) | ((unint64_t)v1[3] << 24) | ((unint64_t)v1[4] << 16) | ((unint64_t)v1[5] << 8) | v1[6];
                uint64_t v3 = 7;
              }
            }
            else
            {
              unint64_t v2 = ((v2 & 3) << 40) | ((unint64_t)v1[1] << 32) | ((unint64_t)v1[2] << 24) | ((unint64_t)v1[3] << 16) | ((unint64_t)v1[4] << 8) | v1[5];
              uint64_t v3 = 6;
            }
          }
          else
          {
            unint64_t v2 = ((v2 & 7) << 32) | ((unint64_t)v1[1] << 24) | ((unint64_t)v1[2] << 16) | ((unint64_t)v1[3] << 8) | v1[4];
            uint64_t v3 = 5;
          }
        }
        else
        {
          unint64_t v2 = ((v2 & 0xF) << 24) | ((unint64_t)v1[1] << 16) | ((unint64_t)v1[2] << 8) | v1[3];
          uint64_t v3 = 4;
        }
      }
      else
      {
        unint64_t v2 = ((v2 & 0x1F) << 16) | ((unint64_t)v1[1] << 8) | v1[2];
        uint64_t v3 = 3;
      }
    }
    else
    {
      unint64_t v2 = v1[1] | ((v2 & 0x3F) << 8);
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  *a1 = &v1[v3];
  return v2;
}

uint64_t sub_100007B4C(ssize_t a1)
{
  unint64_t v1 = *(void *)(a1 + 4120);
  unint64_t v2 = (void *)(a1 + 4112);
  uint64_t v3 = *(char **)(a1 + 4112);
  if ((uint64_t)(v1 - (void)v3) < 11)
  {
    if ((unint64_t)v3 >= v1)
    {
      sub_100007404(a1);
      uint64_t v3 = *(char **)(a1 + 4112);
    }
    memset(v16, 0, sizeof(v16));
    uint64_t v7 = v3 + 1;
    *unint64_t v2 = v3 + 1;
    int v8 = *v3;
    char v15 = v8;
    if (v8 < 0)
    {
      uint64_t v9 = 3;
      uint64_t v10 = 4;
      if (v8 >= 0xF0u) {
        uint64_t v10 = 5;
      }
      if (v8 >= 0xE0u) {
        uint64_t v9 = v10;
      }
      if (v8 >= 0xC0u) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = 2;
      }
      uint64_t v12 = v16;
      uint64_t v13 = v11 - 1;
      do
      {
        if ((unint64_t)v7 >= *(void *)(a1 + 4120))
        {
          sub_100007404(a1);
          uint64_t v7 = *(unsigned char **)(a1 + 4112);
        }
        *unint64_t v2 = v7 + 1;
        *v12++ = *v7++;
        --v13;
      }
      while (v13);
    }
    uint64_t v14 = &v15;
    return sub_100007CB4(&v14);
  }
  else
  {
    unsigned int v4 = (char **)(a1 + 4112);
    return sub_100007CB4(v4);
  }
}

uint64_t sub_100007CB4(char **a1)
{
  unint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (**a1 < 0)
  {
    if (v2 > 0xBF)
    {
      if (v2 > 0xDF)
      {
        if (v2 > 0xEF)
        {
          uint64_t v2 = *(unsigned int *)(v1 + 1);
          uint64_t v3 = 5;
        }
        else
        {
          uint64_t v2 = ((v2 & 0xF) << 24) | (v1[1] << 16) | (v1[2] << 8) | v1[3];
          uint64_t v3 = 4;
        }
      }
      else
      {
        uint64_t v2 = ((v2 & 0x1F) << 16) | (v1[1] << 8) | v1[2];
        uint64_t v3 = 3;
      }
    }
    else
    {
      uint64_t v3 = 2;
      uint64_t v2 = v1[1] | ((v2 & 0x3F) << 8);
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  *a1 = &v1[v3];
  return v2;
}

size_t sub_100007D50(ssize_t a1, char *__dst, size_t __nbyte)
{
  size_t v3 = *(int *)(a1 + 4128);
  if (!v3)
  {
    size_t v5 = __nbyte;
    int v8 = *(unsigned char **)(a1 + 4120);
    uint64_t v9 = *(unsigned char **)(a1 + 4112);
    size_t v10 = v8 - v9;
    if (v8 != v9)
    {
      if (__nbyte <= v10)
      {
        memcpy(__dst, v9, __nbyte);
        *(void *)(a1 + 4112) += v5;
        return v5;
      }
      memcpy(__dst, v9, v8 - v9);
      *(void *)(a1 + 4112) += v10;
      v5 -= v10;
    }
    if (pread(*(_DWORD *)a1, &__dst[v10], v5, *(void *)(a1 + 8)) == v5)
    {
      size_t v3 = v5 + v10;
      *(void *)(a1 + 8) += v3;
      *(void *)(a1 + 4120) = a1 + 16;
      *(void *)(a1 + 4112) = a1 + 16;
      *(_DWORD *)(a1 + 4128) = 0;
      sub_100007404(a1);
    }
    else
    {
      uint64_t v11 = __stderrp;
      uint64_t v12 = __error();
      int v13 = *v12;
      *(_DWORD *)(a1 + 4128) = *v12;
      fprintf(v11, "\npread error(%d) offset: 0x%llx\n", v13, *(void *)(a1 + 8));
      return -1;
    }
  }
  return v3;
}

void sub_100007E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v9[0] = 0;
  v9[1] = &a9;
  vasprintf((char **)v9, "%s:%u: failed assertion '%s' %s readVInt32: exceeds max size for uint32_t", &a9);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = v9[0];
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  free(v9[0]);
}

void sub_100007F30()
{
  MEMORY[0xBAD] = -559038737;
  abort();
}

_DWORD *sub_100007F50(int a1)
{
  uint64_t result = malloc_type_calloc(1uLL, 0x38uLL, 0x1030040023F4036uLL);
  _DWORD *result = ((a1 + 4127) & 0xFFFFF000) - 32;
  return result;
}

void sub_100007FA0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 24);
    if (v2)
    {
      do
      {
        size_t v3 = (void *)v2[1];
        free(v2);
        uint64_t v2 = v3;
      }
      while (v3);
    }
    free(*(void **)(a1 + 16));
    free((void *)a1);
  }
}

uint64_t sub_100007FFC(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

BOOL sub_100008004(uint64_t a1)
{
  return *(void *)(a1 + 8) == 0;
}

uint64_t sub_100008014(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 24)) != 0)
  {
    if (a2) {
      *a2 = v3;
    }
    return *(void *)(a1 + 40);
  }
  else
  {
    uint64_t result = 0;
    if (a2) {
      *a2 = 0;
    }
  }
  return result;
}

uint64_t sub_100008044(void *a1, unint64_t a2)
{
  uint64_t v3 = (void *)a1[3];
  if (!v3) {
    sub_10002582C();
  }
  unint64_t v5 = v3[3];
  while (1)
  {
    if (a2 >= v5) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = a2;
    }
    v3[3] = v5 - v6;
    a1[1] -= v6;
    uint64_t v7 = a1[5];
    a1[5] = v7 + v6;
    if (!v3[3] && v3 != (void *)a1[4])
    {
      int v8 = (void *)v3[1];
      a1[3] = v8;
      a1[5] = 0;
      if (v8)
      {
        void *v8 = 0;
        a1[5] = a1[3] + 32;
      }
      if (a1[2])
      {
        free(v3);
        --dword_10003CE18;
      }
      else
      {
        a1[2] = v3;
      }
    }
    uint64_t v3 = (void *)a1[3];
    a2 -= v6;
    if (!a2) {
      break;
    }
    unint64_t v5 = v3[3];
    if (!v5)
    {
      uint64_t v9 = v7 + v6;
      unint64_t v11 = a1[1];
      if (!v11) {
        goto LABEL_23;
      }
LABEL_21:
      unint64_t v10 = 0;
LABEL_22:
      if (v10 <= v11)
      {
LABEL_23:
        if (a2) {
          sub_100025884();
        }
        return v9;
      }
LABEL_26:
      sub_100025858();
    }
  }
  uint64_t v9 = v7 + v6;
  if (v3)
  {
    unint64_t v10 = v3[3];
    unint64_t v11 = a1[1];
    if (v10) {
      goto LABEL_22;
    }
    if (v11) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if (a1[1]) {
    goto LABEL_26;
  }
  return v9;
}

BOOL sub_100008170(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    return 0;
  }
  while (v2 + 32 > a2 || v2 + (unint64_t)*(unsigned int *)(v2 + 16) + 32 < a2)
  {
    uint64_t v2 = *(void *)(v2 + 8);
    if (!v2) {
      return 0;
    }
  }
  return *(void *)(v2 + 8) != 0;
}

unint64_t sub_1000081B8(uint64_t a1, unint64_t a2, unint64_t *a3, unsigned char *a4)
{
  unint64_t v4 = *(void *)(a1 + 24);
  if (a2 && v4)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    while (1)
    {
      unint64_t v6 = v5 + 32;
      if (v5 + 32 <= a2 && v5 + (unint64_t)*(unsigned int *)(v5 + 16) + 32 >= a2) {
        break;
      }
      uint64_t v5 = *(void *)(v5 + 8);
      if (!v5) {
        goto LABEL_21;
      }
    }
    if (v5 != v4) {
      goto LABEL_12;
    }
  }
  else if (!v4)
  {
    unint64_t result = 0;
    uint64_t v5 = 0;
    goto LABEL_22;
  }
  unint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 24);
LABEL_12:
  if (a2) {
    unint64_t result = a2;
  }
  else {
    unint64_t result = v6;
  }
  uint64_t v8 = *(void *)(v5 + 24);
  if (v6 + v8 <= result)
  {
    uint64_t v9 = *(void *)(v5 + 8);
    if (v9)
    {
      unint64_t v4 = *(void *)(v9 + 24);
      unint64_t v10 = v9 + 32;
      if (v4) {
        unint64_t result = v10;
      }
      else {
        unint64_t result = 0;
      }
    }
    else
    {
LABEL_21:
      unint64_t result = 0;
      unint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v4 = v8 + v6 - result;
  }
LABEL_22:
  if (a3) {
    *a3 = v4;
  }
  if (a4)
  {
    if (v5) {
      LOBYTE(v5) = *(void *)(v5 + 8) != 0;
    }
    *a4 = v5;
  }
  return result;
}

uint64_t sub_100008284(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2) {
    BOOL v4 = v2 == v3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v3) {
      return 0;
    }
    return (v2 - *(_DWORD *)(a1 + 48) + *(_DWORD *)(v2 + 16) + 32) >= a2;
  }
  if (*(void *)(v2 + 24)) {
    return (v2 - *(_DWORD *)(a1 + 48) + *(_DWORD *)(v2 + 16) + 32) >= a2;
  }
  return 1;
}

void *sub_1000082D4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3) {
    BOOL v5 = v3 == v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (!*(void *)(v3 + 24))
    {
      unint64_t result = (void *)(v3 + 32);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!v4)
    {
      unint64_t v6 = sub_100008380((unsigned int *)a1, a2);
      v6[3] = 0;
      *unint64_t v6 = 0;
      v6[1] = 0;
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = v6;
      unint64_t result = v6 + 4;
LABEL_11:
      *(void *)(a1 + 40) = result;
      goto LABEL_12;
    }
  }
  unint64_t result = *(void **)(a1 + 48);
  if ((v3 - result + *(_DWORD *)(v3 + 16) + 32) >= a2) {
    return result;
  }
  uint64_t v8 = sub_100008380((unsigned int *)a1, a2);
  *(void *)(*(void *)(a1 + 32) + 8) = v8;
  v8[3] = 0;
  void *v8 = *(void *)(a1 + 32);
  v8[1] = 0;
  *(void *)(a1 + 32) = v8;
  unint64_t result = v8 + 4;
LABEL_12:
  *(void *)(a1 + 48) = result;
  return result;
}

_DWORD *sub_100008380(unsigned int *a1, unint64_t a2)
{
  unint64_t result = (_DWORD *)*((void *)a1 + 2);
  if (result && result[4] >= a2)
  {
    *((void *)a1 + 2) = 0;
  }
  else
  {
    unint64_t v4 = *a1;
    if (v4 <= a2) {
      unint64_t v5 = a2;
    }
    else {
      unint64_t v5 = v4;
    }
    unint64_t result = malloc_type_malloc(v5 + 32, 0xCAB03470uLL);
    result[4] = v5;
    ++dword_10003CE18;
  }
  return result;
}

void *sub_1000083EC(void *result, uint64_t a2)
{
  result[6] += a2;
  *(void *)(result[4] + 24) += a2;
  result[1] += a2;
  return result;
}

void *sub_100008418(void *a1, unint64_t a2, const void *a3)
{
  unint64_t v6 = sub_1000082D4((uint64_t)a1, a2);
  uint64_t v7 = v6;
  if (a3) {
    memcpy(v6, a3, a2);
  }
  a1[6] += a2;
  *(void *)(a1[4] + 24) += a2;
  a1[1] += a2;
  return v7;
}

double sub_100008490(void *a1)
{
  uint64_t v3 = a1 + 3;
  uint64_t v2 = (void *)a1[3];
  if (v2)
  {
    do
    {
      unint64_t v4 = (void *)v2[1];
      if (a1[2])
      {
        free(v2);
        --dword_10003CE18;
      }
      else
      {
        a1[2] = v2;
      }
      uint64_t v2 = v4;
    }
    while (v4);
  }
  a1[1] = 0;
  double result = 0.0;
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  return result;
}

void *sub_100008500(void *a1, unint64_t a2)
{
  double result = (void *)a1[3];
  if ((unint64_t)(result + 4) <= a2)
  {
    if ((unint64_t)result + *((unsigned int *)result + 4) + 32 >= a2)
    {
      uint64_t v9 = a1[5];
      uint64_t v8 = a1 + 5;
      result[3] -= a2 - v9;
      *(v8 - 4) -= a2 - v9;
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  if (result)
  {
    do
    {
LABEL_5:
      if ((unint64_t)(result + 4) <= a2 && (unint64_t)result + *((unsigned int *)result + 4) + 32 >= a2) {
        break;
      }
      unint64_t v5 = (void *)result[1];
      uint64_t v6 = a1[2];
      a1[1] -= result[3];
      if (v6)
      {
        free(result);
        --dword_10003CE18;
      }
      else
      {
        a1[2] = result;
      }
      double result = v5;
    }
    while (v5);
  }
  void *result = 0;
  a1[3] = result;
  uint64_t v7 = a2 - (void)result - 32;
  result[3] -= v7;
  a1[1] -= v7;
  uint64_t v8 = a1 + 5;
LABEL_13:
  unint64_t *v8 = a2;
  return result;
}

void *sub_100008608(void *a1, unint64_t a2)
{
  for (double result = (void *)a1[4];
        (unint64_t)(result + 4) > a2 || (unint64_t)result + *((unsigned int *)result + 4) + 32 < a2;
        double result = v5)
  {
    unint64_t v5 = (void *)*result;
    uint64_t v6 = a1[2];
    a1[1] -= result[3];
    if (v6)
    {
      free(result);
      --dword_10003CE18;
    }
    else
    {
      a1[2] = result;
    }
  }
  result[1] = 0;
  a1[4] = result;
  a1[1] -= result[3];
  unint64_t v7 = a2 - (void)(result + 4);
  result[3] = v7;
  if (result == (void *)a1[3])
  {
    unint64_t v7 = a2 - a1[5];
    result[3] = v7;
  }
  a1[1] += v7;
  a1[6] = a2;
  return result;
}

_DWORD *sub_1000086E0(unsigned int *a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  if (a3)
  {
    double result = *(_DWORD **)(a3 + 16);
    unsigned int v9 = *(_DWORD *)(a3 + 24);
    if (a1)
    {
      do
      {
LABEL_3:
        unsigned int v10 = *a1;
        unint64_t v11 = a1;
        if ((*a1 & 1) == 0) {
          break;
        }
        unint64_t v11 = 0;
        if (!a2) {
          break;
        }
        a1 = (unsigned int *)(a2 + 12 * (*a1 >> 1));
      }
      while (v10 > 1);
      goto LABEL_9;
    }
  }
  else
  {
    double result = malloc_type_malloc(0x80uLL, 0x100004000313F17uLL);
    unsigned int v9 = 16;
    if (a1) {
      goto LABEL_3;
    }
  }
  unint64_t v11 = 0;
LABEL_9:
  unsigned int v12 = 0;
  while (1)
  {
    int v13 = v11;
    if (v12 >= v9) {
      break;
    }
    if (!v11) {
      goto LABEL_21;
    }
LABEL_12:
    unsigned int v14 = v13[2];
    if (v12 && result[v12 - 1] <= v14) {
      sub_1000258B0();
    }
    unint64_t v11 = 0;
    unsigned int v15 = v12 + 1;
    result[v12++] = v14;
    if (a2)
    {
      unsigned int v16 = *v13;
      unsigned int v12 = v15;
      if (*v13 >= 2)
      {
        while (1)
        {
          unint64_t v11 = (unsigned int *)(a2 + 12 * (v16 >> 1));
          unsigned int v16 = *v11;
          if ((*v11 & 1) == 0) {
            break;
          }
          if (v16 < 2)
          {
            unint64_t v11 = 0;
            break;
          }
        }
        unsigned int v12 = v15;
      }
    }
  }
  v9 *= 2;
  double result = reallocf(result, 4 * v9);
  if (v13) {
    goto LABEL_12;
  }
LABEL_21:
  result[v12] = 0;
  if (a3)
  {
    *(void *)(a3 + 16) = result;
    *(_DWORD *)(a3 + 24) = v9;
  }
  *a4 = v12;
  return result;
}

void sub_100008824(char *a1, ...)
{
  va_start(va, a1);
  v1[0] = 0;
  va_copy((va_list)&v1[1], va);
  vasprintf((char **)v1, a1, va);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v3 = v1[0];
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  free(v1[0]);
}

uint64_t sub_1000088E0(uint64_t result, unint64_t *a2, unsigned int a3)
{
  unint64_t v3 = *a2;
  if (*a2)
  {
    unint64_t v4 = a2;
    uint64_t v5 = result;
    char v6 = 0;
    unint64_t v7 = a3;
    do
    {
      if (v6)
      {
        unint64_t v8 = *(void *)(v5 + 24);
        if (v8 <= v3) {
          sub_1000258F4();
        }
        size_t v10 = *(void *)(v5 + 8);
        uint64_t v9 = *(void *)(v5 + 16);
        if (v9 + 10 > v10)
        {
          do
            v10 *= 2;
          while (v10 < v9 + 10);
          *(void *)(v5 + 8) = v10;
          unint64_t v11 = malloc_type_realloc(*(void **)v5, v10, 0xBCA72133uLL);
          *(void *)uint64_t v5 = v11;
          uint64_t v9 = *(void *)(v5 + 16);
          unint64_t v8 = *(void *)(v5 + 24);
        }
        else
        {
          unint64_t v11 = *(void **)v5;
        }
        double result = sub_10000A62C((uint64_t)v11, v9, v8 - v3);
        *(void *)(v5 + 16) = result;
        *(void *)(v5 + 24) = v3;
      }
      else
      {
        size_t v12 = *(void *)(v5 + 8);
        uint64_t v13 = *(void *)(v5 + 16);
        if (v13 + 10 > v12)
        {
          do
            v12 *= 2;
          while (v12 < v13 + 10);
          *(void *)(v5 + 8) = v12;
          unsigned int v14 = malloc_type_realloc(*(void **)v5, v12, 0xBCA72133uLL);
          *(void *)uint64_t v5 = v14;
          uint64_t v13 = *(void *)(v5 + 16);
        }
        else
        {
          unsigned int v14 = *(void **)v5;
        }
        uint64_t v15 = sub_10000A62C((uint64_t)v14, v13, v3);
        *(void *)(v5 + 16) = v15;
        *(void *)(v5 + 24) = v3;
        size_t v16 = *(void *)(v5 + 8);
        if (v15 + 10 > v16)
        {
          do
            v16 *= 2;
          while (v16 < v15 + 10);
          *(void *)(v5 + 8) = v16;
          char v18 = malloc_type_realloc(*(void **)v5, v16, 0xBCA72133uLL);
          *(void *)uint64_t v5 = v18;
          uint64_t v17 = *(void *)(v5 + 16);
        }
        else
        {
          uint64_t v17 = v15;
          char v18 = *(void **)v5;
        }
        uint64_t v19 = sub_10000A62C((uint64_t)v18, v17, v3);
        *(void *)(v5 + 16) = v19;
        *(void *)(v5 + 24) = v3;
        size_t v20 = *(void *)(v5 + 8);
        if (v19 + 10 > v20)
        {
          do
            v20 *= 2;
          while (v20 < v19 + 10);
          *(void *)(v5 + 8) = v20;
          int v22 = malloc_type_realloc(*(void **)v5, v20, 0xBCA72133uLL);
          *(void *)uint64_t v5 = v22;
          uint64_t v21 = *(void *)(v5 + 16);
        }
        else
        {
          uint64_t v21 = v19;
          int v22 = *(void **)v5;
        }
        double result = sub_10000A62C((uint64_t)v22, v21, v7);
        *(void *)(v5 + 16) = result;
      }
      unint64_t v23 = v4[1];
      ++v4;
      unint64_t v3 = v23;
      char v6 = 1;
    }
    while (v23);
    size_t v24 = *(void *)(v5 + 8);
    if (result + 10 > v24)
    {
      do
        v24 *= 2;
      while (v24 < result + 10);
      *(void *)(v5 + 8) = v24;
      int v25 = malloc_type_realloc(*(void **)v5, v24, 0xBCA72133uLL);
      *(void *)uint64_t v5 = v25;
      double result = *(void *)(v5 + 16);
    }
    else
    {
      int v25 = *(unsigned char **)v5;
    }
    v25[result] = 0;
    *(void *)(v5 + 16) = result + 1;
    *(void *)(v5 + 24) = 0;
  }
  return result;
}

uint64_t sub_100008ADC(uint64_t a1, unint64_t *a2, unint64_t a3, unsigned int a4, uint64_t a5, void (*a6)(uint64_t, void, uint64_t, void, void, uint64_t), uint64_t a7)
{
  if (*a2 >= a3) {
    goto LABEL_70;
  }
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  unint64_t v15 = *a2;
  while (1)
  {
    unint64_t v16 = v15 + 1;
    v14 |= (unint64_t)(*(unsigned char *)(a1 + v15) & 0x7F) << v13;
    if ((*(unsigned char *)(a1 + v15) & 0x80) == 0 || v13 == 63) {
      break;
    }
    v13 += 7;
    ++v15;
    if (a3 == v16) {
      goto LABEL_70;
    }
  }
  *a2 = v16;
  if (!v14) {
    return 0;
  }
  if (v16 >= a3)
  {
LABEL_70:
    sub_100008824("%s:%u: failed assertion '%s' %s Offset past bounds; incoming %ld, current %ld, buffer length %ld, val %llu from %d",
      "PostingChunk.c",
      90);
    goto LABEL_71;
  }
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  while (1)
  {
    v18 |= (unint64_t)(*(unsigned char *)(a1 + v15 + 1) & 0x7F) << v17;
    if ((*(unsigned char *)(a1 + v15 + 1) & 0x80) == 0 || v17 == 63) {
      break;
    }
    v17 += 7;
    if (a3 - 1 == ++v15) {
      goto LABEL_70;
    }
  }
  unint64_t v19 = v15 + 2;
  *a2 = v15 + 2;
  uint64_t v20 = a3 - v15 - 2;
  if (v14 > v18)
  {
    uint64_t v21 = 1;
    a6(a7, v14, 1, 0, 0, a5);
    if (v18)
    {
      while (1)
      {
        unsigned int v22 = v14 - v18;
        if (v14 <= v18 || v22 >= a4) {
          goto LABEL_69;
        }
        uint64_t v21 = ((uint64_t (*)(uint64_t, void, uint64_t, void, void, uint64_t))a6)(a7, (v14 - v18), 1, 0, 0, a5);
        if (!v21) {
          return v21;
        }
        unint64_t v23 = *a2;
        if (*a2 + 5 <= a3) {
          break;
        }
        LODWORD(v18) = sub_10000A8AC(a1, a2, a3);
LABEL_31:
        LODWORD(v14) = v22;
        if (!v18) {
          return v21;
        }
      }
      unint64_t v24 = v23 + 1;
      LODWORD(v18) = *(unsigned __int8 *)(a1 + v23);
      if (*(char *)(a1 + v23) < 0)
      {
        uint64_t v25 = v23 + 2;
        int v26 = *(char *)(a1 + v24);
        int v27 = *(unsigned __int8 *)(a1 + v24);
        if (v26 < 0)
        {
          int v28 = *(char *)(a1 + v25);
          char v29 = v28;
          if (v28 < 0)
          {
            uint64_t v25 = v23 + 4;
            int v31 = *(char *)(a1 + v23 + 3);
            int v32 = *(unsigned __int8 *)(a1 + v23 + 3);
            if (v31 < 0)
            {
              int v33 = *(char *)(a1 + v25);
              if (v33 < 0) {
                sub_100025938();
              }
              int v34 = ((v32 & 0x7F) << 21) | (v33 << 28) | ((v29 & 0x7F) << 14) | ((v27 & 0x7F) << 7) | v18 & 0x7F;
              uint64_t v25 = *a2 + 5;
              LODWORD(v18) = v34;
              goto LABEL_30;
            }
            int v30 = ((v29 & 0x7F) << 14) | (v32 << 21) | ((v27 & 0x7F) << 7) | v18 & 0x7F;
          }
          else
          {
            int v30 = ((v27 & 0x7F) << 7) | (v28 << 14) | v18 & 0x7F;
            uint64_t v25 = v23 + 3;
          }
          LODWORD(v18) = v30;
        }
        else
        {
          LODWORD(v18) = v18 & 0x7F | (v27 << 7);
        }
      }
      else
      {
        uint64_t v25 = v23 + 1;
      }
LABEL_30:
      *a2 = v25;
      goto LABEL_31;
    }
    return v21;
  }
  if (v14 >= v18)
  {
    if (v14 != v18) {
      return 0;
    }
    if (v19 < a3)
    {
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      unint64_t v38 = v15 + 3;
      uint64_t v39 = (char *)(v19 + a1);
      while (1)
      {
        char v40 = *v39++;
        v37 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0 || v36 == 63) {
          break;
        }
        v36 += 7;
        ++v38;
        if (!--v20) {
          goto LABEL_70;
        }
      }
      *a2 = v38;
      if (v37 <= 1) {
        uint64_t v41 = 1;
      }
      else {
        uint64_t v41 = v37;
      }
      while (1)
      {
        int v42 = ((uint64_t (*)(uint64_t, unint64_t, uint64_t, void, uint64_t, uint64_t))a6)(a7, v14, 1, 0, v41, a5);
        if (!v42 || v37 == 0) {
          break;
        }
        if (*a2 >= a3) {
          goto LABEL_70;
        }
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        unint64_t v46 = *a2;
        while (1)
        {
          unint64_t v47 = v46 + 1;
          char v48 = *(unsigned char *)(a1 + v46);
          v45 |= (unint64_t)(v48 & 0x7F) << v44;
          if ((v48 & 0x80) == 0 || v44 == 63) {
            break;
          }
          v44 += 7;
          unint64_t v46 = v47;
          if (a3 == v47) {
            goto LABEL_70;
          }
        }
        *a2 = v47;
        v14 -= v45;
        if (!v45) {
          return 1;
        }
      }
      return v42 != 0;
    }
    goto LABEL_70;
  }
  if (*(unsigned char *)(a1 + v15 + 2))
  {
    if (v14 >= a4 || v18 > a4)
    {
LABEL_69:
      sub_100008824("%s:%u: failed assertion '%s' %s %d, %d");
    }
    else
    {
      unint64_t v35 = ((v18 - v14 + 7) >> 3) + v15 + 2;
      if (v35 <= a3)
      {
        if (((unsigned int (*)(uint64_t, void))a6)(a7, v14))
        {
          *a2 = v35;
          return 1;
        }
        return 0;
      }
      sub_100008824("%s:%u: failed assertion '%s' %s %ld, %ld");
    }
LABEL_71:
    MEMORY[0xBAD] = -559038737;
    abort();
  }
  return sub_100009054(v14, v18, a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))a6, a7);
}

uint64_t sub_100009054(unsigned int a1, unsigned int a2, uint64_t a3, unint64_t *a4, unint64_t a5, unsigned int a6, uint64_t a7, uint64_t (*a8)(uint64_t), uint64_t a9)
{
  unint64_t v16 = *a4;
  if (*a4 + 5 > a5)
  {
    int v17 = sub_10000A8AC(a3, a4, a5);
    goto LABEL_13;
  }
  unint64_t v18 = v16 + 1;
  int v17 = *(unsigned __int8 *)(a3 + v16);
  if (*(char *)(a3 + v16) < 0)
  {
    uint64_t v19 = v16 + 2;
    int v20 = *(char *)(a3 + v18);
    int v21 = *(unsigned __int8 *)(a3 + v18);
    if (v20 < 0)
    {
      int v22 = *(char *)(a3 + v19);
      char v23 = v22;
      if (v22 < 0)
      {
        uint64_t v19 = v16 + 4;
        int v25 = *(char *)(a3 + v16 + 3);
        int v26 = *(unsigned __int8 *)(a3 + v16 + 3);
        if (v25 < 0)
        {
          int v42 = *(char *)(a3 + v19);
          if (v42 < 0) {
            sub_100025938();
          }
          int v43 = ((v26 & 0x7F) << 21) | (v42 << 28) | ((v23 & 0x7F) << 14) | ((v21 & 0x7F) << 7) | v17 & 0x7F;
          uint64_t v19 = *a4 + 5;
          int v17 = v43;
          goto LABEL_12;
        }
        int v24 = ((v23 & 0x7F) << 14) | (v26 << 21) | ((v21 & 0x7F) << 7) | v17 & 0x7F;
      }
      else
      {
        int v24 = ((v21 & 0x7F) << 7) | (v22 << 14) | v17 & 0x7F;
        uint64_t v19 = v16 + 3;
      }
      int v17 = v24;
    }
    else
    {
      int v17 = v17 & 0x7F | (v21 << 7);
    }
  }
  else
  {
    uint64_t v19 = v16 + 1;
  }
LABEL_12:
  *a4 = v19;
LABEL_13:
  if (v17) {
    sub_10002597C(v17);
  }
  do
  {
    while (1)
    {
      unint64_t v27 = *a4;
      if (*a4 + 5 > a5)
      {
        unsigned int v28 = sub_10000A8AC(a3, a4, a5);
        goto LABEL_26;
      }
      unint64_t v29 = v27 + 1;
      unsigned int v28 = *(unsigned __int8 *)(a3 + v27);
      if (*(char *)(a3 + v27) < 0)
      {
        uint64_t v30 = v27 + 2;
        int v31 = *(char *)(a3 + v29);
        int v32 = *(unsigned __int8 *)(a3 + v29);
        if (v31 < 0)
        {
          int v33 = *(char *)(a3 + v30);
          char v34 = v33;
          if (v33 < 0)
          {
            uint64_t v30 = v27 + 4;
            int v36 = *(char *)(a3 + v27 + 3);
            int v37 = *(unsigned __int8 *)(a3 + v27 + 3);
            if (v36 < 0)
            {
              int v39 = *(char *)(a3 + v30);
              if (v39 < 0) {
                sub_100025938();
              }
              int v40 = ((v37 & 0x7F) << 21) | (v39 << 28) | ((v34 & 0x7F) << 14) | ((v32 & 0x7F) << 7) | v28 & 0x7F;
              uint64_t v30 = *a4 + 5;
              unsigned int v28 = v40;
              goto LABEL_25;
            }
            int v35 = ((v34 & 0x7F) << 14) | (v37 << 21) | ((v32 & 0x7F) << 7) | v28 & 0x7F;
          }
          else
          {
            int v35 = ((v32 & 0x7F) << 7) | (v33 << 14) | v28 & 0x7F;
            uint64_t v30 = v27 + 3;
          }
          unsigned int v28 = v35;
        }
        else
        {
          unsigned int v28 = v28 & 0x7F | (v32 << 7);
        }
      }
      else
      {
        uint64_t v30 = v27 + 1;
      }
LABEL_25:
      *a4 = v30;
LABEL_26:
      unsigned int v38 = a2 - v28;
      if (a2 < v28)
      {
        sub_100008824("%s:%u: failed assertion '%s' %s %d, %d", "PostingChunk.c", 868, "delta <= docID", "", v28, a2);
        goto LABEL_43;
      }
      if (v38 < a1)
      {
        sub_100008824("%s:%u: failed assertion '%s' %s %d, %d", "PostingChunk.c", 871, "docID >= firstDocID", "", a2 - v28, a1);
        goto LABEL_43;
      }
      if (v28 < 2) {
        break;
      }
      if (v38 + 1 >= a6)
      {
        sub_100008824("%s:%u: failed assertion '%s' %s %d, %d", "PostingChunk.c", 875, "docID+1 < maxValidId", "", a2 - v28, a6);
        goto LABEL_43;
      }
      a2 -= v28;
      if ((a8(a9) & 1) == 0) {
        return 0;
      }
    }
    a2 -= v28;
  }
  while (v28);
  if (a1 >= a6)
  {
    sub_100008824("%s:%u: failed assertion '%s' %s %d, %d", "PostingChunk.c", 882, "firstDocID < maxValidId", "", a1, a6);
    goto LABEL_43;
  }
  if (v38 > a6)
  {
    sub_100008824("%s:%u: failed assertion '%s' %s %d, %d", "PostingChunk.c", 883, "docID <= maxValidId", "", v38, a6);
LABEL_43:
    MEMORY[0xBAD] = -559038737;
    abort();
  }

  return ((uint64_t (*)(uint64_t, void, void, void, void, uint64_t))a8)(a9, a1, v38 - a1, 0, 0, a7);
}

uint64_t sub_100009404(uint64_t result, uint64_t a2, unsigned int a3)
{
  *(_OWORD *)double result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  if (a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = v3;
  *(_DWORD *)(result + 36) = v4;
  return result;
}

void sub_100009B70(uint64_t a1, _DWORD *a2, size_t size, uint64_t a4)
{
  uint64_t v4 = a4;
  unsigned int v5 = size;
  uint64_t v7 = a1;
  if (size)
  {
    if (a4)
    {
      unint64_t v8 = *(unsigned __int8 **)(a4 + 32);
      if (*(_DWORD *)(a4 + 40) < size)
      {
        uint64_t v9 = (unsigned __int8 *)malloc_type_realloc(*(void **)(a4 + 32), size, 0x100004077774924uLL);
        *(void *)(v4 + 32) = v9;
        if (!v9) {
          sub_1000259C4();
        }
        unint64_t v8 = v9;
        *(_DWORD *)(v4 + 40) = v5;
      }
      bzero(v8, v5);
    }
    else
    {
      unint64_t v8 = (unsigned __int8 *)malloc_type_calloc(size, 1uLL, 0x100004077774924uLL);
    }
    uint64_t v12 = 0;
    int v13 = 0;
    unsigned int v14 = 0;
    unsigned int v15 = 0;
    int v16 = 0;
    unsigned int v17 = 0;
    int v18 = 0;
    uint64_t v19 = v5 - 1;
    int v20 = a2[v19];
    if (*a2 < 0x200000u) {
      int v21 = 3;
    }
    else {
      int v21 = 4;
    }
    if (*a2 >> 28) {
      int v22 = 5;
    }
    else {
      int v22 = v21;
    }
    if (*a2 < 0x80u) {
      int v23 = 1;
    }
    else {
      int v23 = 2;
    }
    if (*a2 >> 14) {
      int v23 = v22;
    }
    int v24 = 16 * v23;
    int v25 = 8 * v23 + 8;
    int v26 = (2 * v23) | 1;
    unsigned int v27 = v5 - 2;
    uint64_t v49 = v8;
    unsigned int v28 = &v8[v19];
    int v29 = a2[v19];
    do
    {
      int v30 = a2[v19 + v12];
      int v31 = v19 + v12;
      if (v19 + v12) {
        int v32 = a2[v27 + v12] + ~v30;
      }
      else {
        int v32 = 0;
      }
      int v33 = v30 - v20 + 1;
      unsigned int v34 = v25 + v14 - 8 * v13;
      int v35 = v16 + v30;
      unsigned int v36 = v15 + v24 + v33;
      HIDWORD(v52) = v34;
      unsigned int v53 = v36;
      unsigned int v54 = v17 + 8 + 8 * (v26 + v12 + v16 + v30 - v29);
      unsigned int v37 = 2 * (v34 > v54);
      if (v36 <= v54) {
        int v38 = 1;
      }
      else {
        int v38 = 2;
      }
      if (v34 > v36) {
        unsigned int v37 = v38;
      }
      unsigned int v39 = v33 + v15 + v32;
      unsigned int v40 = v17 + 8 + 8 * (v12 + v35 + v32 - v29);
      int v41 = *((_DWORD *)&v52 + v37 + 1);
      unsigned int v42 = v41 + 8;
      BOOL v43 = v40 > v41 + 8;
      unsigned int v44 = v41 + 4;
      unsigned int v45 = (v41 + 7) & 0xFFFFFFF8;
      uint64_t v46 = 3;
      if (v40 <= v42) {
        uint64_t v46 = 1;
      }
      uint64_t v47 = 2 * v43;
      if (v37)
      {
        unsigned int v14 = v45;
        int v13 = v18 + 1;
      }
      if (v39 <= v44) {
        uint64_t v46 = v47;
      }
      v28[v12] = dword_10002BD4C[4 * v37 + v46];
      if (v39 > v44)
      {
        unsigned int v15 = v45;
        int v20 = 0;
      }
      if (v31 && v39 > v44)
      {
        int v20 = a2[v27 + v12];
        unsigned int v15 = v45;
      }
      ++v18;
      if (v40 > v42)
      {
        unsigned int v17 = v45;
        int v16 = v18;
        int v29 = 0;
      }
      if (v31 && v40 > v42)
      {
        int v29 = a2[v27 + v12];
        unsigned int v17 = v45;
        int v16 = v18;
      }
      v25 += 8;
      --v12;
    }
    while (v5 != v18);
    uint64_t v52 = 0;
    size_t v10 = v49;
    int v48 = *v49;
    if ((v48 - 4) < 4)
    {
      int v11 = 1;
      uint64_t v7 = a1;
      uint64_t v4 = a4;
    }
    else
    {
      uint64_t v7 = a1;
      uint64_t v4 = a4;
      if ((v48 - 8) >= 4) {
        int v11 = 0;
      }
      else {
        int v11 = 2;
      }
    }
  }
  else
  {
    size_t v10 = 0;
    int v11 = 0;
    HIDWORD(v52) = 0;
  }
  LODWORD(v52) = v11;
  while (1)
  {
    ((void (*)(uint64_t))loc_100009F18)(v7);
    if (HIDWORD(v52) >= v5) {
      break;
    }
    sub_10000A454((int *)&v52, v10[HIDWORD(v52)]);
  }
  if (!v4)
  {
    free(v10);
  }
}

uint64_t sub_10000A454(int *a1, int a2)
{
  int v2 = 1;
  switch(a2)
  {
    case 1:
      int v2 = 0;
      uint64_t v3 = 0;
      if (*a1 == 1) {
        goto LABEL_20;
      }
      return v3;
    case 2:
      int v2 = 0;
      uint64_t v3 = 0;
      if (*a1 == 2) {
        goto LABEL_20;
      }
      return v3;
    case 3:
      int v2 = 0;
      uint64_t v3 = *a1;
      if (v3) {
        goto LABEL_20;
      }
      return v3;
    case 4:
      if (*a1) {
        goto LABEL_15;
      }
      goto LABEL_20;
    case 5:
      if (*a1 != 2) {
        goto LABEL_20;
      }
      goto LABEL_15;
    case 6:
      if (*a1 != 1) {
        goto LABEL_20;
      }
      goto LABEL_15;
    case 7:
      goto LABEL_20;
    case 8:
      if (*a1) {
        goto LABEL_15;
      }
      goto LABEL_19;
    case 9:
      if (*a1 != 2) {
        goto LABEL_19;
      }
      goto LABEL_15;
    case 10:
      if (*a1 != 1) {
        goto LABEL_19;
      }
      goto LABEL_15;
    case 11:
LABEL_19:
      int v2 = 2;
LABEL_20:
      *a1 = v2;
      uint64_t v3 = 1;
      break;
    default:
LABEL_15:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

void *sub_10000A55C(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 16;
  *(void *)a1 = malloc_type_malloc(0x80uLL, 0x2004093837F09uLL);
  *(_DWORD *)(a1 + 24) = 16;
  *(void *)(a1 + 16) = malloc_type_malloc(0x80uLL, 0x100004000313F17uLL);
  *(_DWORD *)(a1 + 40) = 16;
  double result = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *(void *)(a1 + 32) = result;
  return result;
}

void sub_10000A5E0(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)a1);
    free(*(void **)(a1 + 16));
    int v2 = *(void **)(a1 + 32);
    free(v2);
  }
}

uint64_t sub_10000A62C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (HIDWORD(a3))
  {
    if ((a3 & 0x8000000000000000) != 0)
    {
      uint64x2_t v8 = (uint64x2_t)vdupq_n_s64(a3);
      v9.i32[0] = a3;
      v9.i32[1] = a3 >> 7;
      size_t v10 = (int8x8_t *)(a1 + a2);
      int8x8_t *v10 = vorr_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vmovn_hight_s64(v9, (int64x2_t)vshlq_u64(v8, (uint64x2_t)xmmword_10002BCF0)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_10002BD00), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_10002BD10)))), (int8x8_t)0x8080808080808080);
      uint64_t v4 = a2 + 9;
      v10[1].i8[0] = HIBYTE(a3) | 0x80;
      a3 >>= 63;
    }
    else if ((a3 & 0x7F00000000000000) != 0)
    {
      uint64x2_t v5 = (uint64x2_t)vdupq_n_s64(a3);
      v6.i32[0] = a3;
      uint64_t v4 = a2 + 8;
      v6.i32[1] = a3 >> 7;
      *(int8x8_t *)(a1 + a2) = vorr_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vmovn_hight_s64(v6, (int64x2_t)vshlq_u64(v5, (uint64x2_t)xmmword_10002BCF0)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v5, (uint64x2_t)xmmword_10002BD00), (int32x4_t)vshlq_u64(v5, (uint64x2_t)xmmword_10002BD10)))), (int8x8_t)0x8080808080808080);
      a3 = (a3 & 0x7F00000000000000) >> 56;
    }
    else
    {
      char v11 = a3 | 0x80;
      if ((a3 & 0xFE000000000000) != 0)
      {
        uint64_t v12 = a1 + a2;
        *(unsigned char *)uint64_t v12 = v11;
        uint64x2_t v13 = (uint64x2_t)vdupq_n_s64(a3);
        int16x8_t v14 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_10002BD30), (int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_10002BD20));
        v14.i64[0] = *(void *)&vmovn_s32((int32x4_t)v14) | 0x80008000800080;
        *(_DWORD *)(v12 + 1) = vmovn_s16(v14).u32[0];
        *(unsigned char *)(v12 + 5) = (a3 >> 35) | 0x80;
        uint64_t v4 = a2 + 7;
        *(unsigned char *)(v12 + 6) = (a3 >> 42) | 0x80;
        a3 = (a3 & 0xFE000000000000) >> 49;
      }
      else
      {
        uint64_t v16 = a1 + a2;
        *(unsigned char *)uint64_t v16 = v11;
        uint64x2_t v17 = (uint64x2_t)vdupq_n_s64(a3);
        uint64_t v4 = a2 + 5;
        int16x8_t v18 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v17, (uint64x2_t)xmmword_10002BD30), (int32x4_t)vshlq_u64(v17, (uint64x2_t)xmmword_10002BD20));
        v18.i64[0] = *(void *)&vmovn_s32((int32x4_t)v18) | 0x80008000800080;
        *(_DWORD *)(v16 + 1) = vmovn_s16(v18).u32[0];
        if ((a3 & 0x1FC0000000000) != 0)
        {
          *(unsigned char *)(a1 + v4) = (a3 >> 35) | 0x80;
          uint64_t v4 = a2 + 6;
          a3 = (a3 & 0x1FC0000000000) >> 42;
        }
        else
        {
          a3 = (a3 >> 35) & 0x7F;
        }
      }
    }
  }
  else if ((a3 & 0x7F0000000) != 0)
  {
    uint64_t v3 = (unsigned char *)(a1 + a2);
    unsigned char *v3 = a3 | 0x80;
    v3[1] = (a3 >> 7) | 0x80;
    v3[2] = (a3 >> 14) | 0x80;
    uint64_t v4 = a2 + 4;
    v3[3] = (a3 >> 21) | 0x80;
    a3 = (a3 & 0x7F0000000) >> 28;
  }
  else if ((a3 & 0xFE00000) != 0)
  {
    uint64_t v7 = (unsigned char *)(a1 + a2);
    *uint64_t v7 = a3 | 0x80;
    v7[1] = (a3 >> 7) | 0x80;
    uint64_t v4 = a2 + 3;
    v7[2] = (a3 >> 14) | 0x80;
    a3 = (a3 & 0xFE00000) >> 21;
  }
  else if ((a3 & 0x1FC000) != 0)
  {
    unsigned int v15 = (unsigned char *)(a1 + a2);
    *unsigned int v15 = a3 | 0x80;
    uint64_t v4 = a2 + 2;
    v15[1] = (a3 >> 7) | 0x80;
    a3 = (a3 & 0x1FC000) >> 14;
  }
  else if ((a3 & 0x3F80) != 0)
  {
    uint64_t v4 = a2 + 1;
    *(unsigned char *)(a1 + a2) = a3 | 0x80;
    a3 = (a3 & 0x3F80) >> 7;
  }
  else
  {
    uint64_t v4 = a2;
  }
  *(unsigned char *)(a1 + v4) = a3;
  return v4 + 1;
}

uint64_t sub_10000A8AC(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v3 = *a2;
  if (*a2 >= a3) {
    sub_100025CF4();
  }
  unint64_t v5 = v3 + 1;
  int v6 = *(char *)(a1 + v3);
  uint64_t result = *(unsigned __int8 *)(a1 + v3);
  if (v6 < 0)
  {
    if (v5 >= a3) {
      sub_100025CB0();
    }
    unint64_t v8 = v3 + 2;
    int v9 = *(char *)(a1 + v5);
    int v10 = *(unsigned __int8 *)(a1 + v5);
    if (v9 < 0)
    {
      if (v8 >= a3) {
        sub_100025C6C();
      }
      unint64_t v11 = v3 + 3;
      int v12 = *(char *)(a1 + v8);
      char v13 = v12;
      if (v12 < 0)
      {
        if (v11 >= a3) {
          sub_100025C28();
        }
        unint64_t v8 = v3 + 4;
        int v15 = *(char *)(a1 + v11);
        int v16 = *(unsigned __int8 *)(a1 + v11);
        if (v15 < 0)
        {
          if (v8 >= a3) {
            sub_100025BE4();
          }
          int v18 = *(char *)(a1 + v8);
          if (v18 < 0) {
            sub_100025BA0();
          }
          unint64_t v8 = v3 + 5;
          int v17 = ((v16 & 0x7F) << 21) | (v18 << 28) | ((v13 & 0x7F) << 14);
        }
        else
        {
          int v17 = ((v13 & 0x7F) << 14) | (v16 << 21);
        }
        uint64_t v14 = v17 & 0xFFFFC000 | ((v10 & 0x7F) << 7) | result & 0x7F;
      }
      else
      {
        uint64_t v14 = ((v10 & 0x7F) << 7) | (v12 << 14) | (result & 0x7F);
        unint64_t v8 = v3 + 3;
      }
      uint64_t result = v14;
    }
    else
    {
      uint64_t result = result & 0x7F | (v10 << 7);
    }
  }
  else
  {
    unint64_t v8 = v3 + 1;
  }
  *a2 = v8;
  return result;
}

unsigned char *sub_10000A9A8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int *a5)
{
  int v22 = 0;
  uint64_t v10 = *a5;
  unint64_t v11 = *(unsigned int *)(a2 + 4 * v10);
  size_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 + 10 > v12)
  {
    do
      v12 *= 2;
    while (v12 < v13 + 10);
    *(void *)(a1 + 8) = v12;
    uint64_t v14 = malloc_type_realloc(*(void **)a1, v12, 0xBCA72133uLL);
    *(void *)a1 = v14;
    uint64_t v13 = *(void *)(a1 + 16);
  }
  else
  {
    uint64_t v14 = *(void **)a1;
  }
  uint64_t v15 = sub_10000A62C((uint64_t)v14, v13, v11);
  unsigned int v16 = v10 + 1;
  *(void *)(a1 + 16) = v15;
  *(void *)(a1 + 24) = v11;
  if (v16 < a4)
  {
    while ((sub_10000A454(&v22, *(unsigned __int8 *)(a3 + v16)) & 1) == 0)
    {
      unint64_t v17 = *(unsigned int *)(a2 + 4 * v16);
      if (v11 <= v17) {
        sub_1000258F4();
      }
      size_t v18 = *(void *)(a1 + 8);
      if (v15 + 10 > v18)
      {
        do
          v18 *= 2;
        while (v18 < v15 + 10);
        *(void *)(a1 + 8) = v18;
        uint64_t v19 = malloc_type_realloc(*(void **)a1, v18, 0xBCA72133uLL);
        *(void *)a1 = v19;
        uint64_t v15 = *(void *)(a1 + 16);
        unint64_t v11 = *(void *)(a1 + 24);
      }
      else
      {
        uint64_t v19 = *(void **)a1;
      }
      uint64_t v15 = sub_10000A62C((uint64_t)v19, v15, v11 - v17);
      ++v16;
      *(void *)(a1 + 16) = v15;
      *(void *)(a1 + 24) = v17;
      unint64_t v11 = v17;
      if (v16 == a4)
      {
        unsigned int v16 = a4;
        break;
      }
    }
  }
  size_t v20 = *(void *)(a1 + 8);
  if (v15 + 10 > v20)
  {
    do
      v20 *= 2;
    while (v20 < v15 + 10);
    *(void *)(a1 + 8) = v20;
    uint64_t result = malloc_type_realloc(*(void **)a1, v20, 0xBCA72133uLL);
    *(void *)a1 = result;
    uint64_t v15 = *(void *)(a1 + 16);
  }
  else
  {
    uint64_t result = *(unsigned char **)a1;
  }
  result[v15] = 0;
  *(void *)(a1 + 16) = v15 + 1;
  *(void *)(a1 + 24) = 0;
  *a5 = v16;
  return result;
}

BOOL sub_10000AB4C(int a1, const char *a2)
{
  bzero(&v5, 0x878uLL);
  return !fstatfs(a1, &v5) && !strcmp(v5.f_fstypename, a2);
}

BOOL sub_10000ABE8(int a1)
{
  return sub_10000AB4C(a1, "exfat");
}

BOOL sub_10000ABF4(int a1)
{
  return sub_10000AB4C(a1, "msdos");
}

BOOL sub_10000AC00(int a1)
{
  return sub_10000AB4C(a1, "fat32");
}

uint64_t sub_10000AC0C(unsigned __int8 *a1, unsigned int a2, int a3)
{
  unsigned int v3 = -1640531527;
  if (a2 < 0xC)
  {
    int v5 = -1640531527;
    unsigned int v4 = a2;
  }
  else
  {
    unsigned int v4 = a2;
    int v5 = -1640531527;
    do
    {
      unsigned int v6 = *((_DWORD *)a1 + 1) + v3;
      unsigned int v7 = *((_DWORD *)a1 + 2) + a3;
      int v8 = (*(_DWORD *)a1 + v5 - (v6 + v7)) ^ (v7 >> 13);
      unsigned int v9 = (v6 - v7 - v8) ^ (v8 << 8);
      unsigned int v10 = (v7 - v8 - v9) ^ (v9 >> 13);
      int v11 = (v8 - v9 - v10) ^ (v10 >> 12);
      unsigned int v12 = (v9 - v10 - v11) ^ (v11 << 16);
      unsigned int v13 = (v10 - v11 - v12) ^ (v12 >> 5);
      int v5 = (v11 - v12 - v13) ^ (v13 >> 3);
      unsigned int v3 = (v12 - v13 - v5) ^ (v5 << 10);
      a3 = (v13 - v5 - v3) ^ (v3 >> 15);
      a1 += 12;
      v4 -= 12;
    }
    while (v4 > 0xB);
  }
  unsigned int v14 = a3 + a2;
  switch(v4)
  {
    case 1u:
      goto LABEL_17;
    case 2u:
      goto LABEL_16;
    case 3u:
      goto LABEL_15;
    case 4u:
      goto LABEL_14;
    case 5u:
      goto LABEL_13;
    case 6u:
      goto LABEL_12;
    case 7u:
      goto LABEL_11;
    case 8u:
      goto LABEL_10;
    case 9u:
      goto LABEL_9;
    case 0xAu:
      goto LABEL_8;
    case 0xBu:
      v14 += a1[10] << 24;
LABEL_8:
      v14 += a1[9] << 16;
LABEL_9:
      v14 += a1[8] << 8;
LABEL_10:
      v3 += a1[7] << 24;
LABEL_11:
      v3 += a1[6] << 16;
LABEL_12:
      v3 += a1[5] << 8;
LABEL_13:
      v3 += a1[4];
LABEL_14:
      v5 += a1[3] << 24;
LABEL_15:
      v5 += a1[2] << 16;
LABEL_16:
      v5 += a1[1] << 8;
LABEL_17:
      v5 += *a1;
      break;
    default:
      break;
  }
  int v15 = (v5 - v3 - v14) ^ (v14 >> 13);
  unsigned int v16 = (v3 - v14 - v15) ^ (v15 << 8);
  unsigned int v17 = (v14 - v15 - v16) ^ (v16 >> 13);
  int v18 = (v15 - v16 - v17) ^ (v17 >> 12);
  unsigned int v19 = (v16 - v17 - v18) ^ (v18 << 16);
  unsigned int v20 = (v17 - v18 - v19) ^ (v19 >> 5);
  int v21 = (v18 - v19 - v20) ^ (v20 >> 3);
  return (v20 - v21 - ((v19 - v20 - v21) ^ (v21 << 10))) ^ (((v19 - v20 - v21) ^ (v21 << 10)) >> 15);
}

uint64_t sub_10000ADEC(int a1)
{
  unsigned int v1 = (-1640531527 - a1) ^ ((a1 - 4) << 8);
  unsigned int v2 = (8 - a1 - v1) ^ (v1 >> 13);
  int v3 = (a1 - 4 - v1 - v2) ^ (v2 >> 12);
  unsigned int v4 = (v1 - v2 - v3) ^ (v3 << 16);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 >> 5);
  int v6 = (v3 - v4 - v5) ^ (v5 >> 3);
  return (v5 - v6 - ((v4 - v5 - v6) ^ (v6 << 10))) ^ (((v4 - v5 - v6) ^ (v6 << 10)) >> 15);
}

uint64_t sub_10000AE5C(int a1, int a2)
{
  int v2 = a1 - a2 - 8;
  unsigned int v3 = (a2 - (a1 - a2) - 1640531527) ^ (v2 << 8);
  unsigned int v4 = (16 - (a1 - a2) - v3) ^ (v3 >> 13);
  int v5 = (v2 - v3 - v4) ^ (v4 >> 12);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 << 16);
  unsigned int v7 = (v4 - v5 - v6) ^ (v6 >> 5);
  int v8 = (v5 - v6 - v7) ^ (v7 >> 3);
  return (v7 - v8 - ((v6 - v7 - v8) ^ (v8 << 10))) ^ (((v6 - v7 - v8) ^ (v8 << 10)) >> 15);
}

uint64_t sub_10000AED4(uint64_t a1)
{
  int v1 = HIDWORD(a1) - a1 - 8;
  unsigned int v2 = (a1 - (HIDWORD(a1) - a1) - 1640531527) ^ (v1 << 8);
  unsigned int v3 = (16 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  int v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 << 16);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  int v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  return (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
}

unint64_t sub_10000AF50(uint64_t a1)
{
  int v1 = HIDWORD(a1) - a1 + 608135808;
  unsigned int v2 = (a1 - (HIDWORD(a1) - a1) + 2046299953) ^ (v1 << 8);
  unsigned int v3 = (-608135800 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  int v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 << 16);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  int v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  uint64_t v8 = (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
  int v9 = a1 + 608135808 - HIDWORD(a1);
  unsigned int v10 = (HIDWORD(a1) - (v9 + 8) - 1640531527) ^ (v9 << 8);
  unsigned int v11 = (8 - v9 - v10) ^ (v10 >> 13);
  int v12 = (v9 - v10 - v11) ^ (v11 >> 12);
  unsigned int v13 = (v10 - v11 - v12) ^ (v12 << 16);
  unsigned int v14 = (v11 - v12 - v13) ^ (v13 >> 5);
  int v15 = (v12 - v13 - v14) ^ (v14 >> 3);
  return v8 | ((unint64_t)((v14 - v15 - ((v13 - v14 - v15) ^ (v15 << 10))) ^ (((v13 - v14 - v15) ^ (v15 << 10)) >> 15)) << 32);
}

unint64_t sub_10000B054(int a1)
{
  unsigned int v1 = (2 * a1 + 2046299953) ^ ((608135808 - a1) << 8);
  unsigned int v2 = (a1 - 608135800 - v1) ^ (v1 >> 13);
  int v3 = (608135808 - a1 - v1 - v2) ^ (v2 >> 12);
  unsigned int v4 = (v1 - v2 - v3) ^ (v3 << 16);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 >> 5);
  int v6 = (v3 - v4 - v5) ^ (v5 >> 3);
  uint64_t v7 = (v5 - v6 - ((v4 - v5 - v6) ^ (v6 << 10))) ^ (((v4 - v5 - v6) ^ (v6 << 10)) >> 15);
  unsigned int v8 = (2046299953 - a1) ^ ((a1 + 608135808) << 8);
  unsigned int v9 = (-608135800 - a1 - v8) ^ (v8 >> 13);
  int v10 = (a1 + 608135808 - v8 - v9) ^ (v9 >> 12);
  unsigned int v11 = (v8 - v9 - v10) ^ (v10 << 16);
  unsigned int v12 = (v9 - v10 - v11) ^ (v11 >> 5);
  int v13 = (v10 - v11 - v12) ^ (v12 >> 3);
  return v7 | ((unint64_t)((v12 - v13 - ((v11 - v12 - v13) ^ (v13 << 10))) ^ (((v11 - v12 - v13) ^ (v13 << 10)) >> 15)) << 32);
}

void sub_10000B204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B2E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000B300(uint64_t a1, void *a2, void *a3)
{
  id v46 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v47 = v5;
  if (v5)
  {
    id v45 = WeakRetained;
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 udatedWithAddedMountPoints:0 andRemovedMountPoints:0];

    unsigned int v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100025D38((uint64_t)v5, v8);
    }
LABEL_61:

    id WeakRetained = v45;
    goto LABEL_62;
  }
  if (WeakRetained)
  {
    id v45 = WeakRetained;
    id v51 = [@"com.apple.filesystems.UserFS.FileProvider/" length];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v46;
    id v50 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
    if (!v50)
    {
      unsigned int v9 = 0;
LABEL_40:

      id v25 = v45;
      objc_sync_enter(v25);
      id v54 = v25;
      [v25 _domainsByPath];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v27 = 0;
      id v28 = [v26 countByEnumeratingWithState:&v59 objects:v72 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v60;
        do
        {
          for (char i = 0; i != v28; char i = (char *)i + 1)
          {
            if (*(void *)v60 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            int v32 = [v26 objectForKeyedSubscript:v31];
            int v33 = [v9 objectForKeyedSubscript:v31];
            BOOL v34 = v33 == 0;

            if (v34)
            {
              uint64_t v35 = +[NSMutableDictionary dictionaryWithObject:v32 forKey:v31];

              unsigned int v27 = (void *)v35;
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v59 objects:v72 count:16];
        }
        while (v28);
      }

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      unsigned int v8 = v9;
      unsigned int v36 = 0;
      id v37 = [v8 countByEnumeratingWithState:&v55 objects:v71 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v56;
        do
        {
          for (j = 0; j != v37; j = (char *)j + 1)
          {
            if (*(void *)v56 != v38) {
              objc_enumerationMutation(v8);
            }
            uint64_t v40 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
            int v41 = [v8 objectForKeyedSubscript:v40];
            unsigned int v42 = [v26 objectForKeyedSubscript:v40];
            BOOL v43 = v42 == 0;

            if (v43)
            {
              if (v36)
              {
                [v36 setObject:v41 forKeyedSubscript:v40];
              }
              else
              {
                unsigned int v36 = +[NSMutableDictionary dictionaryWithObject:v41 forKey:v40];
              }
            }
          }
          id v37 = [v8 countByEnumeratingWithState:&v55 objects:v71 count:16];
        }
        while (v37);
      }

      objc_msgSend(v54, "set_domainsByPath:", v8);
      objc_sync_exit(v54);

      unsigned int v44 = [v54 delegate];
      [v44 udatedWithAddedMountPoints:v36 andRemovedMountPoints:v27];

      goto LABEL_61;
    }
    unsigned int v9 = 0;
    uint64_t v49 = *(void *)v68;
    while (1)
    {
      for (k = 0; k != v50; k = (char *)k + 1)
      {
        if (*(void *)v68 != v49) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v67 + 1) + 8 * (void)k);
        if ([v10 length] > v51
          && [v10 hasPrefix:@"com.apple.filesystems.UserFS.FileProvider/"])
        {
          unsigned int v11 = [obj objectForKeyedSubscript:v10];
          id v53 = [v10 substringFromIndex:v51];
          unsigned int v12 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v75 = v11;
            __int16 v76 = 2112;
            id v77 = v53;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "found %@ %@", buf, 0x16u);
          }

          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          int v13 = [v11 storageURLs];
          id v14 = [v13 countByEnumeratingWithState:&v63 objects:v73 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v64;
            do
            {
              for (m = 0; m != v14; m = (char *)m + 1)
              {
                if (*(void *)v64 != v15) {
                  objc_enumerationMutation(v13);
                }
                unsigned int v17 = *(void **)(*((void *)&v63 + 1) + 8 * (void)m);
                if ([v17 isFileURL])
                {
                  int v18 = (const char *)[v17 fileSystemRepresentation];
                  unsigned int v19 = v18;
                  if (v18)
                  {
                    size_t v20 = strlen(v18);
                    if (v20 >= 0x3E)
                    {
                      unint64_t v21 = v20;
                      if (!strncmp(v19, "/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x3CuLL))
                      {
                        uint64_t v22 = +[NSString stringWithFormat:@"%s%s", "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", v19 + 60];
                      }
                      else
                      {
                        if (v21 < 0x46
                          || strncmp(v19, "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x44uLL))
                        {
                          continue;
                        }
                        uint64_t v22 = +[NSString stringWithUTF8String:v19];
                      }
                      int v23 = (void *)v22;
                      if (v22)
                      {
                        if (!v9) {
                          unsigned int v9 = objc_opt_new();
                        }
                        int v24 = logForCSLogCategoryDefault();
                        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          id v75 = v53;
                          __int16 v76 = 2112;
                          id v77 = v23;
                          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "adding %@ %@", buf, 0x16u);
                        }

                        [v9 setObject:v11 forKeyedSubscript:v23];
                      }
                    }
                  }
                }
              }
              id v14 = [v13 countByEnumeratingWithState:&v63 objects:v73 count:16];
            }
            while (v14);
          }
        }
      }
      id v50 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
      if (!v50) {
        goto LABEL_40;
      }
    }
  }
LABEL_62:
}

void sub_10000B9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id obj)
{
}

uint64_t sub_10000BFF8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    if (!*(unsigned char *)(a1 + 64))
    {
      if (*(void *)(a1 + 40))
      {
        unint64_t v5 = *(void *)(a1 + 48);
        if (v5 <= a4) {
          fprintf(__stderrp, "### bad term id %lld >= %lld\n", a4, v5);
        }
      }
    }
  }
  int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

void sub_10000C14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C164(uint64_t result)
{
  return result;
}

void sub_10000C2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C308(uint64_t result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  int v4 = *(_DWORD *)(v3 + 24);
  *(_DWORD *)(v3 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4 + 1;
  if (v4 >= 1)
  {
    if (*(unsigned char *)(result + 40))
    {
      uint64_t result = fprintf(__stderrp, "### unexpected link from 0x%llx to 0x%llx\n", a2, a2);
      *a3 = 1;
    }
  }
  return result;
}

uint64_t sub_10000C378(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C42C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C4D4;
  v10[3] = &unk_100035010;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = a5;
  uint64_t v13 = a6;
  sub_100024E94(a2, a3, (uint64_t)v10);
}

void sub_10000C4D4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D350(id a1, __CFString *a2, BOOL a3, BOOL a4, int64_t a5, id a6)
{
}

int sub_10000D360(id a1, BOOL a2, __CFString *a3, id a4)
{
  return 0;
}

CFTypeRef sub_10000D36C()
{
  if (qword_10003CD20 != -1) {
    dispatch_once(&qword_10003CD20, &stru_100035248);
  }
  uint64_t v0 = (const void *)qword_10003CD18;

  return CFRetain(v0);
}

void sub_10000E030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

void sub_10000E058(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = WeakRetained;
    if (WeakRetained)
    {
      v8.i32[1] = 1;
      v8.i32[0] = *(_DWORD *)(a1 + 48);
      *(int32x2_t *)(WeakRetained + 28) = vadd_s32(*(int32x2_t *)(WeakRetained + 28), v8);
      unsigned int v9 = atomic_load((unsigned int *)WeakRetained + 6);
      if (v9 > 0x80000)
      {
        atomic_store(0, (unsigned int *)WeakRetained + 6);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "issue split", (uint8_t *)v11, 2u);
        }
        _SIIssueSplit();
      }
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "adding %d records canceled", (uint8_t *)v11, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = +[NSError errorWithDomain:@"SIIndexer" code:89 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
LABEL_13:
  }
}

void sub_10000E1F0(void *a1, uint64_t a2)
{
  uint64_t v5 = (void (**)(void, void, void))a1[1];
  v5[2](v5, *a1, a2);
  free(a1);
}

void sub_10000E57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E5A4(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = WeakRetained;
    if (WeakRetained)
    {
      v8.i32[1] = 1;
      v8.i32[0] = *(_DWORD *)(a1 + 48);
      *(int32x2_t *)(WeakRetained + 28) = vadd_s32(*(int32x2_t *)(WeakRetained + 28), v8);
      unsigned int v9 = atomic_load((unsigned int *)WeakRetained + 6);
      if (v9 > 0x80000)
      {
        atomic_store(0, (unsigned int *)WeakRetained + 6);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "issue split", (uint8_t *)v11, 2u);
        }
        _SIIssueSplit();
      }
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "adding %d records canceled", (uint8_t *)v11, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = +[NSError errorWithDomain:@"SIIndexer" code:89 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
LABEL_13:
  }
}

void sub_10000E9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EA08(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109120;
      int v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "deleted %d records canceled", buf, 8u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      int v6 = +[NSError errorWithDomain:@"SIIndexer" code:89 userInfo:0];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained) {
      ++WeakRetained[8];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
    _objc_release_x1();
  }
}

uint64_t sub_10000EC24(uint64_t result, uint64_t a2, int a3)
{
  if (!a3)
  {
    uint64_t result = *(void *)(*(void *)(result + 32) + 136);
    if (result) {
      return SISyncIndex();
    }
  }
  return result;
}

void sub_10000F5E8(void *a1, uint64_t a2)
{
  id v4 = objc_retainBlock(a1);
  id v5 = v4;
  if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, a2);
    id v4 = v5;
  }
  if (a1)
  {
    CFRelease(a1);
    id v4 = v5;
  }
}

void *sub_10000F658(void *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (void *)_SISetCSAttributes(*(void *)(result[4] + 136), result[5], result[6], 0, sub_10000F690, result[7], @"com.apple.test");
  }
  return result;
}

void sub_10000F690(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    sub_100025E90((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  }
  id v8 = a1;
  [v8 lock];
  [v8 unlockWithCondition:1];
}

void sub_10000F9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_10000FA08(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  ++*(void *)(a6 + 24);
  if (*(unsigned char *)(a6 + 16)) {
    int v10 = (void *)_MDPlistBytesCopyPlistAtIndex();
  }
  else {
    int v10 = 0;
  }
  id v19 = v10;
  id v11 = [v10 count];
  if (a4 >= 2)
  {
    uint64_t v12 = (uint64_t)v11;
    uint64_t v13 = a4;
    for (uint64_t i = 1; i != v13; ++i)
    {
      uint64_t v15 = *(void **)a6;
      CFNullRef v16 = kCFNull;
      if (v12 > i)
      {
        uint64_t v17 = [v19 objectAtIndex:i];
        int v6 = (void *)v17;
        if (v17) {
          CFNullRef v16 = (CFNullRef)v17;
        }
        else {
          CFNullRef v16 = kCFNull;
        }
      }
      int v18 = +[NSNumber numberWithLongLong:*(void *)(a3 + 8 * i)];
      [v15 setObject:v16 forKey:v18];

      if (v12 > i) {
    }
      }
  }
}

void sub_10000FE30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v9[0] = 0;
  v9[1] = &a9;
  vasprintf((char **)v9, "%s:%u: failed assertion '%s' %s ", &a9);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = v9[0];
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  free(v9[0]);
}

id sub_10000FEF0(void *a1, int a2, _OWORD *a3)
{
  long long v3 = a3[3];
  v7[2] = a3[2];
  v7[3] = v3;
  long long v4 = a3[5];
  v7[4] = a3[4];
  v7[5] = v4;
  long long v5 = a3[1];
  v7[0] = *a3;
  v7[1] = v5;
  return [a1 _syncFinished:a2 != 0 docCounts:v7];
}

id sub_10000FF38(void *a1, _OWORD *a2)
{
  long long v2 = a2[3];
  v6[2] = a2[2];
  v6[3] = v2;
  long long v3 = a2[5];
  v6[4] = a2[4];
  v6[5] = v3;
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  return [a1 _preSync:v6];
}

id sub_10000FF74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 _reimport:a2 flags:a3 userCtx:a4];
}

id sub_10000FF84(uint64_t a1)
{
  return [*(id *)(a1 + 144) _indexFinalize];
}

id sub_10000FF8C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 _reopen:a4];
}

id sub_10000FF94(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 _repairOid:a2 type:a3 flags:a4];
}

id sub_10000FFC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 _assertPower:a2 line:a3 function:a4];
}

id sub_10000FFD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 _releasePower:a2 file:a3 line:a4 function:a5];
}

id sub_10000FFE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 _scheduleWake:a2 description:a3 block:a4];
}

id sub_10000FFF4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return [a1 _messageTrace:a2 signature:a3 result:a4 operation:a5 message:a6 value:a7];
}

id sub_100010010(void *a1, uint64_t a2)
{
  return [a1 _accountingStart:a2];
}

id sub_100010018(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 _accountingEnd:a2 result:a3];
}

id sub_100010024(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 _delete:a2 bundleId:a3 uniqueId:a4 utiType:a5];
}

id sub_100010038(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [a1 _budget:a2 cost:a5 work:a6];
}

void sub_100010048(id a1)
{
  SI_PersistentIDStoreGetTypeID();
  Instance = (void *)_CFRuntimeCreateInstance();
  Instance[4] = nullsub_5;
  Instance[5] = sub_100010184;
  Instance[6] = sub_1000101F0;
  Instance[7] = sub_10001025C;
  Instance[8] = sub_1000102A4;
  Instance[9] = sub_10001032C;
  Instance[10] = sub_100010334;
  Instance[11] = sub_10001033C;
  Instance[12] = nullsub_6;
  Instance[13] = nullsub_7;
  Instance[14] = nullsub_8;
  Instance[16] = sub_100010350;
  Instance[17] = sub_100010360;
  Instance[18] = sub_1000103B0;
  Instance[19] = sub_1000103B8;
  qword_10003CD18 = (uint64_t)Instance;
}

char *sub_100010184(int a1, uint64_t a2, char *__str)
{
  long long v3 = __str;
  if (a2 < 3)
  {
    if (a2 == 2) {
      strcpy(__str, "/2");
    }
    else {
      return 0;
    }
  }
  else
  {
    snprintf(__str, 0x400uLL, "/2/%llu", a2);
  }
  return v3;
}

char *sub_1000101F0(int a1, uint64_t a2, char *__str)
{
  long long v3 = __str;
  if (a2 < 3)
  {
    if (a2 == 2) {
      strcpy(__str, "/2");
    }
    else {
      return 0;
    }
  }
  else
  {
    snprintf(__str, 0x400uLL, "/2/%llu", a2);
  }
  return v3;
}

uint64_t sub_10001025C(int a1, char *__s)
{
  long long v2 = strrchr(__s, 47);
  if (!v2) {
    return 0;
  }
  int v4 = v2[1];
  long long v3 = v2 + 1;
  if (!v4) {
    return 0;
  }

  return atoll(v3);
}

uint64_t sub_1000102A4(int a1, char *__s, uint64_t a3, void *a4, int a5)
{
  uint64_t result = (uint64_t)strrchr(__s, 47);
  if (result)
  {
    int v9 = *(unsigned __int8 *)(result + 1);
    id v8 = (const char *)(result + 1);
    if (!v9) {
      return 0;
    }
    uint64_t v10 = atoll(v8);
    uint64_t v11 = v10;
    if (v10 >= 3)
    {
      *a4 = 2;
      if (a5)
      {
        a4[1] = v10;
        return 2;
      }
      return 1;
    }
    uint64_t result = 0;
    if (v11 == 2 && a5)
    {
      *a4 = 2;
      return 1;
    }
  }
  return result;
}

uint64_t sub_10001032C()
{
  return 0;
}

uint64_t sub_100010334()
{
  return 1;
}

uint64_t sub_10001033C()
{
  return 0;
}

uint64_t sub_100010350(uint64_t a1, uint64_t a2)
{
  return 2 * (a2 > 2);
}

uint64_t sub_100010360(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5, int *a6)
{
  if (a2 == 2)
  {
    if (a4)
    {
      *a3 = 2;
      goto LABEL_7;
    }
    return 0;
  }
  else
  {
    if (a2 >= 3)
    {
      int v6 = 2;
      *a3 = 2;
      if (!a4)
      {
LABEL_8:
        uint64_t result = 0;
        *a6 = v6;
        return result;
      }
      a3[1] = a2;
LABEL_7:
      int v6 = 1;
      goto LABEL_8;
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_1000103B0()
{
  return 0;
}

uint64_t sub_1000103B8()
{
  return 1;
}

void sub_1000103C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__DADissenter *__cdecl sub_1000106DC(id a1, __DADisk *a2)
{
  return 0;
}

id sub_1000109A0(void *a1)
{
  unsigned int v1 = [a1 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey];
  bzero(v4, 0x400uLL);
  if ([v1 getFileSystemRepresentation:v4 maxLength:1024])
  {
    long long v2 = +[NSString stringWithUTF8String:v4];
  }
  else
  {
    long long v2 = 0;
  }

  return v2;
}

__CFString *sub_100010A68(void *a1)
{
  unsigned int v1 = [a1 objectForKeyedSubscript:kDADiskDescriptionVolumeUUIDKey];

  if (v1 && (CFTypeID v2 = CFGetTypeID(v1), v2 == CFUUIDGetTypeID())) {
    long long v3 = (__CFString *)CFUUIDCreateString(kCFAllocatorDefault, (CFUUIDRef)v1);
  }
  else {
    long long v3 = 0;
  }

  return v3;
}

void sub_100010AE8(__DADisk *a1, void *a2)
{
  id v3 = a2;
  CFDictionaryRef v4 = DADiskCopyDescription(a1);
  long long v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:kDADiskDescriptionVolumeNameKey];
  int v6 = [(__CFDictionary *)v4 objectForKeyedSubscript:kDADiskDescriptionMediaBSDNameKey];
  uint64_t v7 = sub_1000109A0(v4);
  id v8 = sub_100010A68(v4);
  uint64_t v9 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    unint64_t v21 = a1;
    __int16 v22 = 2112;
    int v23 = v6;
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2112;
    unsigned int v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "collectUUIDsFromDisk %p %@ %@ %@ %@", buf, 0x34u);
  }

  if (v8)
  {
    [v3 addObject:v8];
  }
  else
  {
    io_service_t v10 = DADiskCopyIOMedia(a1);
    if (v10)
    {
      io_object_t v11 = v10;
      *(_DWORD *)buf = 0;
      IORegistryEntryCreateIterator(v10, "IOService", 1u, (io_iterator_t *)buf);
      if (*(_DWORD *)buf)
      {
        io_object_t v12 = IOIteratorNext(*(io_iterator_t *)buf);
        if (v12)
        {
          io_service_t v13 = v12;
          do
          {
            if (IOObjectConformsTo(v13, "IOMedia"))
            {
              DADiskRef v14 = DADiskCreateFromIOMedia(kCFAllocatorDefault, (DASessionRef)qword_10003CD38, v13);
              if (v14)
              {
                DADiskRef v15 = v14;
                sub_100010AE8(v14, v3);
                CFRelease(v15);
              }
            }
            IOObjectRelease(v13);
            io_service_t v13 = IOIteratorNext(*(io_iterator_t *)buf);
          }
          while (v13);
        }
        IOObjectRelease(*(io_object_t *)buf);
      }
      IOObjectRelease(v11);
    }
    else if (v7)
    {
      CFNullRef v16 = [(id)qword_10003CD28 indexQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100019F20;
      block[3] = &unk_1000356A8;
      id v18 = v7;
      id v19 = v3;
      dispatch_sync(v16, block);
    }
  }
}

void sub_100010DB0(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      long long v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        int v6 = objc_msgSend((id)qword_10003CD28, "indexerForVolume:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v5), (void)v10);
        uint64_t v7 = v6;
        if (v6)
        {
          id v8 = (void *)qword_10003CD28;
          uint64_t v9 = [v6 path];
          [v8 _closeIndexAtPath:v9];
        }
        long long v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

void sub_100010FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010FE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010FF8(uint64_t a1)
{
}

void sub_100011000(void *a1)
{
  id v1 = qword_10003CD78;
  id v2 = a1;
  dispatch_assert_queue_V2(v1);
  [(id)qword_10003CE20 enumerateKeysAndObjectsUsingBlock:v2];
}

void sub_100011060(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!*(void *)(a1 + 40) && ![v7 readOnly]
    || ([v8 domain],
        id v9 = objc_claimAutoreleasedReturnValue(),
        long long v10 = (const char *)[v9 UTF8String],
        v9,
        v10)
    && !strcmp(v10, *(const char **)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

id sub_1000112EC(void *a1)
{
  id v1 = a1;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003CD78);
  if (v1)
  {
    id v2 = [(id)qword_10003CE20 objectForKeyedSubscript:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_100011358(void *a1, void *a2)
{
  id v3 = qword_10003CD78;
  id v4 = a2;
  id v5 = a1;
  dispatch_assert_queue_V2(v3);
  [(id)qword_10003CE20 setObject:v5 forKeyedSubscript:v4];
}

uint64_t sub_1000114EC(id *a1)
{
  if ([a1[4] count])
  {
    id v2 = [a1[5] fpMonitor];
    id v3 = [v2 domainsByPath];
    id v4 = [v3 count];

    if (!v4)
    {
      __int16 v28 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Quitting -- All providers removed", buf, 2u);
      }

      exit(0);
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = a1[4];
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v41;
    *(void *)&long long v7 = 138412290;
    long long v29 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        long long v12 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          uint64_t v47 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "mount removed: %@", buf, 0xCu);
        }

        if ([v11 length])
        {
          long long v13 = objc_opt_new();
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_1000118F4;
          v38[3] = &unk_100035300;
          v38[4] = v11;
          id v14 = v13;
          id v39 = v14;
          sub_100011000(v38);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v35;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v35 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_msgSend(a1[5], "_closeIndexAtPath:", *(void *)(*((void *)&v34 + 1) + 8 * (void)j), v29);
              }
              id v17 = [v15 countByEnumeratingWithState:&v34 objects:v45 count:16];
            }
            while (v17);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = a1[6];
  id v21 = [v20 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v30 + 1) + 8 * (void)k);
        __int16 v26 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v47 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "mount added: %@", buf, 0xCu);
        }

        [a1[5] _handleMount:v25 force:0];
      }
      id v22 = [v20 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v22);
  }

  [a1[5] queryActiviate];
  return notify_post("com.apple.spotlight.IndexAgent.volumes.changed");
}

void sub_1000118F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasPrefix:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void sub_1000119F0(uint64_t a1)
{
  id v2 = +[NSMutableString string];
  id v3 = [*(id *)(a1 + 32) fpMonitor];
  id v4 = [v3 domainsByPath];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v4 objectForKeyedSubscript:v10];
        [v2 appendFormat:@"domain: %@ path:%@\n", v11, v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011BF0;
  v15[3] = &unk_100035350;
  id v12 = v2;
  id v16 = v12;
  sub_100011000(v15);
  long long v13 = [v12 dataUsingEncoding:4];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v13);
  }
}

id sub_100011BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"indexer: %@ path:%@\n", a3, a2];
}

uint64_t sub_100012CC8(uint64_t a1)
{
  unsigned int v2 = 32 * (*(_DWORD *)(a1 + 64) & 1);
  long long v15 = xmmword_10002BE20;
  uint64_t v16 = 0;
  int v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  if (getattrlist((const char *)(a1 + 88), &v15, &v12, 0x24uLL, 0))
  {
    id v3 = logForCSLogCategoryDefault();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      goto LABEL_10;
    }
    int v4 = *__error();
    *(_DWORD *)buf = 67109120;
    int v18 = v4;
    id v5 = "getattrlist error: %d";
    id v6 = v3;
    uint32_t v7 = 8;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
    goto LABEL_5;
  }
  int v8 = DWORD1(v13);
  id v3 = logForCSLogCategoryDefault();
  BOOL v9 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (!v9) {
      goto LABEL_5;
    }
    *(_WORD *)buf = 0;
    id v5 = "no va_capabilities";
    id v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_4;
  }
  if (v9)
  {
    *(_DWORD *)buf = 67109120;
    int v18 = DWORD1(v12);
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "va_capabilities: 0x%x", buf, 8u);
  }

  unsigned int v2 = v2 & 0xFFFFFF7F | ((BYTE4(v12) & 1) << 7);
LABEL_10:
  uint64_t v10 = (const char *)(a1 + 1112);
  if (!strncmp(v10, "HFS:", 4uLL)) {
    return v2 | 0x100;
  }
  if (!strncmp(v10, "apfs:", 5uLL)) {
    return v2 | 0x200;
  }
  return v2;
}

void sub_100013740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
}

void sub_100013794(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.CoreSpotlight"];
  unsigned int v2 = [v1 pathForResource:@"schema" ofType:@"mdplist"];
  id v3 = v2;
  if (v2)
  {
    int v4 = open((const char *)[v2 UTF8String], 0);
    if (v4 != -1)
    {
      int v5 = v4;
      memset(&v8, 0, sizeof(v8));
      if (!fstat(v4, &v8))
      {
        id v6 = mmap(0, v8.st_size, 1, 1, v5, 0);
        if (v6 != (void *)-1)
        {
          uint32_t v7 = v6;
          qword_10003CD48 = _MDPlistContainerCreateWithBytes();
          if (!qword_10003CD48) {
            munmap(v7, v8.st_size);
          }
        }
      }
      close(v5);
    }
  }
  if (qword_10003CD48)
  {
    _MDPlistContainerGetBytes();
    _MDPlistContainerGetLength();
    SISetDefaultSchemaData();
  }
  _SISetFileOptions();
}

void sub_1000138E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Commiting changes for %@", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained issueCommit];
  }
}

void sub_100013C5C(id a1)
{
  qword_10003CD50 = (uint64_t)dispatch_semaphore_create(4);

  _objc_release_x1();
}

void sub_100013C94(id a1, NSError *a2)
{
  unsigned int v2 = a2;
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_10003CD50);
  id v3 = logForCSLogCategoryDefault();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002608C();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "import complete", v5, 2u);
  }
}

int sub_100013F88(id a1, FSI *a2, $BE29EE10B35F8D1B495DDC58B4A6E89B *a3, int a4, const void *a5)
{
  if (a4) {
    return 2;
  }
  int var1 = a3->var1;
  if (var1 == 2)
  {
    rmdir(a3->var3);
  }
  else if (!var1)
  {
    stat v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      var3 = a3->var3;
      int v10 = 136315138;
      id v11 = var3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "unlink %s", (uint8_t *)&v10, 0xCu);
    }

    unlink(a3->var3);
  }
  return 0;
}

void sub_100014614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100014644(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v1 setQueryTask:0 forID:v2];
}

void sub_1000146A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = a2;
  int v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002632C();
  }

  id v11 = 0;
  BOOL v12 = 0;
  char v13 = 0;
  int v14 = 1;
  switch(a3)
  {
    case 0uLL:
    case 6uLL:
      char v13 = 0;
      id v11 = 0;
      BOOL v12 = *(unsigned char *)(a1 + 96) != 0;
      goto LABEL_10;
    case 1uLL:
      id v11 = 0;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        goto LABEL_36;
      }
      BOOL v12 = 0;
      int v14 = 0;
      char v13 = 1;
LABEL_10:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
        && ([*(id *)(a1 + 32) clientCanceled] & 1) == 0)
      {
        xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v15, "qid", *(void *)(a1 + 80));
        xpc_dictionary_set_uint64(v15, "t", a3);
        long long v31 = (uint64_t *)(a1 + 80);
        uint64_t v16 = v15;
        long long v17 = (const char *)[*(id *)(a1 + 40) UTF8String];
        if (v17) {
          int v18 = v17;
        }
        else {
          int v18 = "";
        }
        xpc_dictionary_set_string(v15, "pc", v18);
        if (v13)
        {
          long long v19 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            sub_10002612C(v31, v19);
          }
        }
        else
        {
          if (v11)
          {
            id v20 = v11;
            xpc_dictionary_set_data(v15, "rd", [v20 bytes], (size_t)objc_msgSend(v20, "length"));
          }
          else if (v14)
          {
            +[CSXPCConnection dictionary:v15 setPlistBytes:a6 forKey:"rd" sizeKey:"rdl"];
            id v21 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
              sub_1000262A8();
            }
          }
          if (v12)
          {
            VectorCFIndex Count = _MDStoreOIDArrayGetVectorCount();
            Vector = (const void *)_MDStoreOIDArrayGetVector();
            xpc_dictionary_set_data(v15, "od", Vector, 8 * VectorCount);
            __int16 v24 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              sub_100026224();
            }
          }
          long long v19 = logForCSLogCategoryQuery();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            sub_1000261A8(v31, v19);
          }
        }

        id v25 = *(_xpc_connection_s **)(a1 + 48);
        __int16 v26 = [*(id *)(a1 + 56) queue];
        xpc_connection_send_message_with_reply(v25, v16, v26, &stru_1000354C8);
      }
LABEL_31:
      if (a3 == 1)
      {
        uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
        if (!*(unsigned char *)(v27 + 24))
        {
          *(unsigned char *)(v27 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
          __int16 v28 = [*(id *)(a1 + 32) queryTask];
          [v28 finishWithError:0];
          [v28 removeJob:v9];
          long long v29 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = *(void *)(a1 + 80);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Finished qid:%d", buf, 8u);
          }

          [v28 schedule];
        }
      }
LABEL_36:

      return;
    case 2uLL:
      BOOL v12 = 0;
      int v14 = 0;
      char v13 = 0;
      id v11 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      goto LABEL_10;
    case 5uLL:
      *(void *)buf = *(void *)(a1 + 88);
      id v11 = +[NSData dataWithBytes:buf length:8];
      BOOL v12 = 0;
      int v14 = 0;
      char v13 = 0;
      goto LABEL_10;
    case 7uLL:
      int v14 = 0;
      char v13 = 0;
      id v11 = 0;
      BOOL v12 = 1;
      goto LABEL_10;
    case 8uLL:
      goto LABEL_10;
    default:
      goto LABEL_31;
  }
}

void sub_100014B24(id a1, OS_xpc_object *a2)
{
  id v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "received query reply", v3, 2u);
  }
}

void sub_100014FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 152));
  _Unwind_Resume(a1);
}

CFTypeRef sub_100015014(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 objectForKeyedSubscript:v5];

  if (!v6)
  {
    if (([v5 isEqualToString:@"kMDItemIsTrashed"] & 1) != 0
      || ([v5 isEqualToString:@"_FPIsTrashed"] & 1) != 0)
    {
      uint32_t v7 = &kCFBooleanTrue;
      if (!*(unsigned char *)(a1 + 32)) {
        uint32_t v7 = &kCFBooleanFalse;
      }
      uint64_t v6 = (__CFString *)*v7;
      if (!*v7) {
        goto LABEL_12;
      }
    }
    else
    {
      if (([v5 isEqualToString:@"kMDItemFileProviderID"] & 1) == 0)
      {
LABEL_12:
        CFTypeRef v8 = 0;
        goto LABEL_11;
      }
      uint64_t v6 = @"com.apple.filesystems.UserFS.FileProvider";
    }
  }
  CFTypeRef v8 = CFRetain(v6);
LABEL_11:

  return v8;
}

void sub_1000150EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 67109376;
    int v56 = v5;
    __int16 v57 = 1024;
    LODWORD(v58) = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Query[%d] found %d items", buf, 0xEu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (([*(id *)(a1 + 32) clientCanceled] & 1) == 0 && WeakRetained)
  {
    id v39 = WeakRetained;
    Mutable = (const void *)_MDPlistBytesCreateMutable();
    _MDPlistBytesBeginPlist();
    _MDPlistBytesBeginArray();
    _MDPlistBytesAddNull();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v38 = v3;
    id v8 = v3;
    id v44 = [v8 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (!v44) {
      goto LABEL_65;
    }
    uint64_t v43 = *(void *)v51;
    uint64_t v42 = a1;
    id v40 = v8;
    while (1)
    {
      for (uint64_t i = 0; i != v44; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v51 != v43) {
          objc_enumerationMutation(v8);
        }
        int v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@":MD:kMDItemPathFromMountPoint"];
        uint64_t v12 = (void *)v11;
        if (v11)
        {
          id v45 = (void *)v11;
          char v13 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = *(void *)(a1 + 80);
            *(_DWORD *)buf = 67109378;
            int v56 = v14;
            __int16 v57 = 2112;
            long long v58 = v45;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Query[%d] found %@", buf, 0x12u);
          }

          if (!*(void *)(a1 + 40))
          {
            uint64_t v12 = v45;
            if (!sub_100022A98(v45)) {
              goto LABEL_63;
            }
LABEL_20:
            if (*(unsigned char *)(a1 + 105))
            {
              long long v17 = [v10 objectForKeyedSubscript:@":MD:_kMDItemOID"];
              id v18 = [v17 integerValue];

              if (v18)
              {
                long long v19 = [v10 objectForKeyedSubscript:@"_kMDItemFileName"];
                if ([v19 length])
                {
                  id v20 = [v10 objectForKeyedSubscript:@":MD:_kMDItemOIDParent"];
                  id v21 = [v20 integerValue];

                  id v22 = [v39 identifierForItem:v18 name:v19 parentID:v21];

                  uint64_t v12 = v45;
                  if (!v22) {
                    goto LABEL_62;
                  }
                  goto LABEL_26;
                }
              }
              id v22 = 0;
LABEL_61:
              uint64_t v12 = v45;
              goto LABEL_62;
            }
            id v22 = v12;
LABEL_26:
            if (!_MDSimpleQueryObjectMatches())
            {
LABEL_62:

              goto LABEL_63;
            }
            id v41 = v22;
            uint64_t v23 = (char *)[v41 UTF8String];
            _MDPlistBytesBeginArray();
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            __int16 v24 = [*(id *)(a1 + 48) fetchAttributes];
            id v25 = [v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (!v25) {
              goto LABEL_58;
            }
            id v26 = v25;
            uint64_t v27 = *(void *)v47;
            while (2)
            {
              uint64_t v28 = 0;
LABEL_30:
              if (*(void *)v47 != v27) {
                objc_enumerationMutation(v24);
              }
              long long v29 = *(void **)(*((void *)&v46 + 1) + 8 * v28);
              uint64_t v30 = [v10 objectForKeyedSubscript:v29];
              if (v30)
              {
LABEL_36:
                long long v31 = (void *)v30;
                __MDPlistBytesAddObject();

                goto LABEL_37;
              }
              if (([v29 isEqualToString:@"kMDItemFilename"] & 1) != 0
                || [v29 isEqualToString:@"FPFilename"])
              {
                uint64_t v30 = [v10 objectForKeyedSubscript:@"_kMDItemFileName"];
                if (v30) {
                  goto LABEL_36;
                }
LABEL_37:
                if (v26 == (id)++v28)
                {
                  id v32 = [v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
                  id v26 = v32;
                  if (!v32)
                  {
LABEL_58:

                    _MDPlistBytesEndArray();
                    id v22 = v41;
                    a1 = v42;
                    id v8 = v40;
                    goto LABEL_61;
                  }
                  continue;
                }
                goto LABEL_30;
              }
              break;
            }
            if (([v29 isEqualToString:@"_FPItemIdentifier"] & 1) != 0
              || [v29 isEqualToString:@"_kMDItemExternalID"])
            {
              strlen(v23);
            }
            else if (([v29 isEqualToString:@"_FPParentFileItemID"] & 1) != 0 {
                   || [v29 isEqualToString:@"FPParentFileItemID"])
            }
            {
              strchr(v23, 47);
            }
            else
            {
              if (([v29 isEqualToString:@"_FPDomainIdentifier"] & 1) != 0
                || [v29 isEqualToString:@"FPDomainIdentifier"])
              {
                __MDPlistBytesAddObject();
                goto LABEL_37;
              }
              if (([v29 isEqualToString:@"kMDItemIsTrashed"] & 1) != 0
                || [v29 isEqualToString:@"_FPIsTrashed"])
              {
                _MDPlistBytesAddBoolean();
                goto LABEL_37;
              }
              if (([v29 isEqualToString:@"_FPUserFSUSBFileProviderID"] & 1) == 0
                && ([v29 isEqualToString:@"kMDItemFileProviderID"] & 1) == 0
                && ![v29 isEqualToString:@"kMDItemFileProviderID"])
              {
                _MDPlistBytesAddNull();
                goto LABEL_37;
              }
            }
            _MDPlistBytesAddCString();
            goto LABEL_37;
          }
          uint64_t v12 = v45;
          if ((unint64_t)[v45 length] > *(void *)(a1 + 88))
          {
            if ([v45 hasPrefix:*(void *)(a1 + 40)])
            {
              if (!*(unsigned char *)(a1 + 104)) {
                goto LABEL_20;
              }
              xpc_object_t v15 = [v45 substringFromIndex:*(void *)(a1 + 88) + 1];
              char v16 = sub_100022A98(v15);

              uint64_t v12 = v45;
              if (v16) {
                goto LABEL_20;
              }
            }
          }
        }
LABEL_63:
      }
      id v44 = [v8 countByEnumeratingWithState:&v50 objects:v59 count:16];
      if (!v44)
      {
LABEL_65:

        _MDPlistBytesEndArray();
        _MDPlistBytesEndPlist();
        xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v33, "qid", *(void *)(a1 + 80));
        xpc_dictionary_set_uint64(v33, "t", 0);
        long long v34 = (const char *)[*(id *)(a1 + 56) UTF8String];
        if (v34) {
          long long v35 = v34;
        }
        else {
          long long v35 = "";
        }
        xpc_dictionary_set_string(v33, "pc", v35);
        +[CSXPCConnection dictionary:v33 setPlistBytes:Mutable forKey:"rd" sizeKey:"rdl"];
        long long v36 = [*(id *)(a1 + 32) clientConnection];
        long long v37 = [*(id *)(a1 + 64) queue];
        xpc_connection_send_message_with_reply(v36, v33, v37, &stru_100035530);

        CFRelease(Mutable);
        id v3 = v38;
        id WeakRetained = v39;
        break;
      }
    }
  }
}

uint64_t sub_100015830(uint64_t a1, int a2)
{
  uint64_t v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 64);
    v17[0] = 67109376;
    v17[1] = v5;
    __int16 v18 = 1024;
    int v19 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Query[%d] complete: %d", (uint8_t *)v17, 0xEu);
  }

  uint64_t v6 = [*(id *)(a1 + 32) searchToken];
  if (v6)
  {
    uint32_t v7 = (void *)v6;
    unsigned __int8 v8 = [*(id *)(a1 + 32) clientCanceled];

    if ((v8 & 1) == 0)
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "qid", *(void *)(a1 + 64));
      xpc_dictionary_set_uint64(v9, "t", 1uLL);
      int v10 = (const char *)[*(id *)(a1 + 40) UTF8String];
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = "";
      }
      xpc_dictionary_set_string(v9, "pc", v11);
      uint64_t v12 = [*(id *)(a1 + 32) clientConnection];
      char v13 = [*(id *)(a1 + 48) queue];
      xpc_connection_send_message_with_reply(v12, v9, v13, &stru_100035578);
    }
  }
  uint64_t v14 = *(void **)(a1 + 56);
  xpc_object_t v15 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v14 setQueryTask:0 forID:v15];

  return _MDSimpleQueryDeallocate();
}

void sub_100015AD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 getQueryTaskForID:*(void *)(a1 + 32)];
  [v3 setClientCanceled:1];
  [v3 cancel];
}

void sub_100015E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015EA0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  switch(a3)
  {
    case 6:
      goto LABEL_4;
    case 1:
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      if (!*(unsigned char *)(v9 + 24))
      {
        *(unsigned char *)(v9 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
        int v10 = [*(id *)(a1 + 40) queryTask];
        [v10 finishWithError:0];
        [v10 removeJob:v5];
        [v10 schedule];
        uint64_t v11 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 134217984;
          uint64_t v19 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "removing oid: %lld", buf, 0xCu);
        }

        uint64_t v14 = *(void *)(a1 + 56);
        uint64_t v13 = a1 + 56;
        xpc_object_t v15 = *(void **)(v13 - 24);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100016180;
        v16[3] = &unk_1000355C0;
        v16[4] = v14;
        [v15 removeRecordsForIDs:v13 count:1 completionHandler:v16];
      }
      break;
    case 0:
LABEL_4:
      VectorCFIndex Count = _MDStoreOIDArrayGetVectorCount();
      uint64_t Vector = _MDStoreOIDArrayGetVector();
      unsigned __int8 v8 = *(void **)(a1 + 32);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      _DWORD v17[2] = sub_1000160A0;
      v17[3] = &unk_1000355C0;
      v17[4] = VectorCount;
      [v8 removeRecordsForIDs:Vector count:VectorCount completionHandler:v17];
      break;
  }
}

void sub_1000160A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100026450();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "removing %lud oids complete", (uint8_t *)&v7, 0xCu);
  }
}

void sub_100016180(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000264BC();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "removing oid: %lld complete", (uint8_t *)&v7, 0xCu);
  }
}

void sub_10001723C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100026528();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%d] removing oid: %lld complete", (uint8_t *)v8, 0x12u);
  }
}

void sub_10001732C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100026590();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%d] update oid: %lld complete", (uint8_t *)v8, 0x12u);
  }
}

void sub_10001741C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000265F8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%d] add oid: %lld complete", (uint8_t *)v8, 0x12u);
  }
}

void sub_1000175AC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100017634;
  v2[3] = &unk_100035630;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _closeAllWithCompletionHandler:v2];
}

uint64_t sub_100017634(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void sub_10001771C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000177AC;
  v3[3] = &unk_100035630;
  id v4 = *(id *)(a1 + 48);
  [v1 _handleScan:v2 completionHandler:v3];
}

uint64_t sub_1000177AC(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_100017894(uint64_t a1)
{
  [*(id *)(a1 + 32) _mountVolume:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_1000179C0(uint64_t a1)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "qid");
  id v3 = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  if (uint64)
  {
    id v4 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "context");
    if (!v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_52:

      goto LABEL_53;
    }
    id v5 = [objc_alloc((Class)CSSearchQueryContext) initWithXPCDictionary:v4];
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "query");
    if (string) {
      uint64_t v7 = string;
    }
    else {
      uint64_t v7 = "false";
    }
    uint64_t v8 = +[NSString stringWithUTF8String:v7];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    __int16 v9 = [v5 mountPoints];
    id v10 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v43 = v5;
      id v44 = v8;
      id v40 = v4;
      id v41 = v3;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v16 = [*(id *)(a1 + 40) indexerForVolume:v15];

          uint64_t v12 = (void *)v16;
          if (!v16)
          {
            long long v17 = *(void **)(a1 + 40);
            __int16 v18 = [@"/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/" stringByAppendingString:v15];
            [v17 _handleMount:v18 force:0];

            uint64_t v12 = [*(id *)(a1 + 40) indexerForVolume:v15];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v11);

      id v4 = v40;
      id v3 = v41;
      id v5 = v43;
      uint64_t v8 = v44;
      if (v12)
      {
        uint64_t v19 = [v12 volumeObject];
        id v20 = [v43 scopes];
        id v21 = objc_msgSend(v19, "processQueryScopes:usePersistentFileIDs:", v20, objc_msgSend(v12, "persistentFileIDs"));
        id v36 = v44;
        [v36 UTF8String];
        uint64_t v42 = (void *)_SIUserCopyUserFSCriteriaForQuery();
        id v39 = v21;
        if (v42)
        {
          id v22 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v42;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "query criteria %@", buf, 0xCu);
          }

          uint64_t v23 = [v42 objectForKeyedSubscript:@"kMDItemIsTrashed"];
          unsigned int v37 = [v23 BOOLValue];

          id v21 = v39;
        }
        else
        {
          unsigned int v37 = 0;
        }
        if ([v20 count] && !objc_msgSend(v21, "count"))
        {
          id v32 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_100026660();
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v24 = v20;
          goto LABEL_50;
        }
        id v24 = v21;

        id v38 = v19;
        if ([v12 isFSOnly]) {
          unsigned __int8 v25 = 1;
        }
        else {
          unsigned __int8 v25 = [v43 fsOnly];
        }
        id v26 = [v24 count];
        if (!v26) {
          goto LABEL_39;
        }
        id v27 = v26;
        [v43 setScopes:v24];
        uint64_t v28 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v24;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "query scopes %@", buf, 0xCu);
        }

        if (v27 == (id)1
          && ([v24 firstObject],
              id v29 = objc_claimAutoreleasedReturnValue(),
              uint64_t v30 = (const char *)[v29 fileSystemRepresentation],
              v29,
              id v5 = v43,
              v30))
        {
          if ((v25 & 1) != 0 || (sub_100022A8C((uint64_t)v30) & 1) == 0)
          {
            xpc_object_t v33 = (const char *)[v38 rootPathUTF8String];
            if (!v33
              || (v34 = v33, size_t v35 = (size_t)[v38 rootPathUTF8StringLength], strncmp(v30, v34, v35))
              || !v30[v35 + 1]
              || v37 && strncmp(&v30[v35 + 1], ".Trashes", 8uLL)
              || (+[NSString stringWithUTF8String:&v30[v35 + 1]],
                  (long long v31 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
              uint64_t v8 = v44;
              goto LABEL_46;
            }
            goto LABEL_43;
          }
          if (v37)
          {
            long long v31 = @".Trashes";
LABEL_43:
            [*(id *)(a1 + 40) _scanQueryStart:v12 scope:v31 queryString:v36 criteria:v42 queryContext:v5 queryID:uint64 remoteConnection:v41];

LABEL_45:
            uint64_t v8 = v44;
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_46:
            uint64_t v19 = v38;
LABEL_50:

            goto LABEL_51;
          }
        }
        else
        {
LABEL_39:
          if (v37) {
            long long v31 = @".Trashes";
          }
          else {
            long long v31 = 0;
          }
          if ((v37 | v25)) {
            goto LABEL_43;
          }
        }
        [*(id *)(a1 + 40) _indexQueryStart:v12 queryString:v36 queryContext:v5 queryID:uint64 remoteConnection:v41];
        goto LABEL_45;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_51:

    goto LABEL_52;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_53:
}

uint64_t sub_100018084(uint64_t a1)
{
  [*(id *)(a1 + 32) _queryCancel:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_1000181E4(uint64_t a1)
{
  return self;
}

void sub_100018368(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) indexerForVolume:*(void *)(a1 + 40)];
  id v3 = [v2 volumeObject];
  if (v3)
  {
    id v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      uint64_t v29 = v5;
      __int16 v30 = 2112;
      uint64_t v31 = v6;
      __int16 v32 = 2112;
      uint64_t v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scan %@ at %@ from %@", buf, 0x20u);
    }

    uint64_t v8 = (void *)os_transaction_create();
    __int16 v9 = +[NSDate date];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 48);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000185F4;
    v25[3] = &unk_1000356D0;
    char v27 = *(unsigned char *)(a1 + 80);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v2;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100018610;
    v18[3] = &unk_1000356F8;
    char v24 = *(unsigned char *)(a1 + 80);
    id v19 = v26;
    id v20 = v9;
    id v21 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 72);
    id v22 = v8;
    id v23 = v13;
    id v14 = v8;
    id v15 = v9;
    id v16 = [v3 scanAtLiveFSHandle:v12 pathFromMountPoint:v10 date:v11 itemHandler:v25 completionHandler:v18];
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 72);
    if (v17) {
      (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
    }
  }
}

id *sub_1000185F4(id *result, uint64_t a2)
{
  if (*((unsigned char *)result + 48)) {
    return (id *)[result[4] importItems:a2 indexer:result[5]];
  }
  return result;
}

id sub_100018610(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 72))
  {
    if (!a2)
    {
      [*(id *)(a1 + 32) index];
      SISetProperty();
    }
    [*(id *)(a1 + 32) issueCommit];
  }
  id v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scan %@ complete: %d", (uint8_t *)&v8, 0x12u);
  }

  uint64_t v6 = *(void *)(a1 + 64);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
  return self;
}

void sub_100018C0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) UTF8String];
  memset(v21, 0, sizeof(v21));
  if (strncmp((const char *)v2, "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x44uLL)
    || ((id v3 = strchr((char *)v2 + 68, 47)) == 0
      ? (size_t v4 = strlen((const char *)v2 + 68), v5 = 0)
      : (size_t v4 = v3 - ((unsigned char *)v2 + 68), v5 = v3 + 1),
        v4 > 0xFF))
  {
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  __strncpy_chk();
  *((unsigned char *)v21 + v4) = 0;
  uint64_t v6 = [*(id *)(a1 + 40) indexerForCStringVolume:v21];
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = [v6 volumeObject];
    if (v8)
    {
LABEL_8:
      uint64_t v9 = [(VolumeScan *)v8 resolveLiveFSHandleForPathFromMountPoint:v5];
      if (v7)
      {
        id v10 = [v7 oidForPath:*(void *)(a1 + 56) allowCreate:0];
        id v19 = v2;
        id v20 = v9;
        id v18 = v10;
        CFStringRef v11 = @"oid: %lld path: %s lfsHandle: %@";
      }
      else
      {
        id v18 = v2;
        id v19 = v9;
        CFStringRef v11 = @"path: %s lfsHandle: %@";
      }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v18, v19, v20, v21[0], v21[1], v21[2], v21[3], v21[4], v21[5], v21[6], v21[7], v21[8], *(void *)&v21[9], *(_OWORD *)((char *)&v21[9] + 8), *((void *)&v21[10] + 1), v21[11],
        *(void *)&v21[12],
        *(_OWORD *)((char *)&v21[12] + 8),
        *((void *)&v21[13] + 1),
        v21[14],
      uint64_t v17 = v21[15]);
      uint64_t v12 = [v17 dataUsingEncoding:4];

      goto LABEL_21;
    }
  }
  else
  {
    id v15 = +[NSString stringWithUTF8String:v21];
    id v16 = [@"/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd" stringByAppendingPathComponent:v15];
    int v8 = [[VolumeScan alloc] initWithVolumeUUID:v15 rootPath:v16];

    if (v8) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = 0;
LABEL_21:

LABEL_11:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    if (v12) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 0xFFFFFFFFLL;
    }
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, v14, v12);
  }
}

void sub_100018F98(uint64_t a1)
{
  bzero(v18, 0x2000uLL);
  if (*(void *)(a1 + 48) <= 2uLL)
  {
    uint64_t v6 = (void (**)(id, uint64_t, void))objc_retainBlock(*(id *)(a1 + 40));
    goto LABEL_14;
  }
  unint64_t v2 = 0;
  unint64_t v3 = 3;
  do
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3 - 1];
    uint64_t v5 = atoll((const char *)[v4 UTF8String]);

    if (v5) {
      v18[v2++] = v5;
    }
    if (v3 >= *(void *)(a1 + 48)) {
      break;
    }
    ++v3;
  }
  while (v2 < 0x400);
  uint64_t v6 = (void (**)(id, uint64_t, void))objc_retainBlock(*(id *)(a1 + 40));
  if (!v2)
  {
LABEL_14:
    if (!v6) {
      goto LABEL_16;
    }
LABEL_15:
    v6[2](v6, 0xFFFFFFFFLL, 0);
    goto LABEL_16;
  }
  uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  int v8 = [@"/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd" stringByAppendingPathComponent:v7];
  uint64_t v9 = [[VolumeScan alloc] initWithVolumeUUID:v7 rootPath:v8];
  if (v9)
  {
    id v10 = +[NSData dataWithBytes:v18 length:8 * v2];
    unsigned int v16 = 0;
    CFStringRef v11 = [(VolumeScan *)v9 bulkResolveOIDData:v10 error:&v16];
    if ([v11 count])
    {
      uint64_t v12 = objc_opt_new();
      uint64_t v13 = (uint64_t *)[v10 bytes];
      do
      {
        uint64_t v14 = *v13++;
        bzero(v17, 0x400uLL);
        objc_msgSend(v12, "appendFormat:", @"0x%llx : %s\n", v14, sub_100023540(v11, v14, (unint64_t)v17, 0, 0));
        --v2;
      }
      while (v2);
      id v15 = [v12 dataUsingEncoding:4];
    }
    else
    {
      id v15 = 0;
    }
    ((void (**)(id, uint64_t, void *))v6)[2](v6, v16, v15);
  }
  if (v6) {
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t sub_1000192D0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4) {
    return 2;
  }
  int v6 = *(_DWORD *)(a3 + 4);
  switch(v6)
  {
    case 2:
      uint64_t v7 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a3 + 16);
        int v14 = 136315138;
        uint64_t v15 = v10;
        uint64_t v9 = "FSI_DIR_POST: %s";
        goto LABEL_10;
      }
LABEL_11:

      return 0;
    case 1:
      uint64_t v12 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a3 + 16);
        int v14 = 136315138;
        uint64_t v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FSI_DIR: %s", (uint8_t *)&v14, 0xCu);
      }

      if (*(unsigned char *)(a1 + 32)) {
        return 2 * (*(_DWORD *)a3 > 0);
      }
      break;
    case 0:
      uint64_t v7 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a3 + 16);
        int v14 = 136315138;
        uint64_t v15 = v8;
        uint64_t v9 = "FSI_FILE: %s";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
  }
  return 0;
}

void sub_1000198B4(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  uint64_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if ([v10 length])
    {
      id v9 = v10;
      xpc_dictionary_set_data(v7, "data", [v9 bytes], (size_t)objc_msgSend(v9, "length"));
    }
    xpc_dictionary_set_int64(v7, "status", a2);
    xpc_connection_send_message(v5, v7);
  }
}

id sub_10001999C(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleQueryStart:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

id sub_1000199AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleQueryCancel:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

void sub_100019A60(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_100019ADC;
  v1[3] = &unk_100035350;
  id v2 = *(id *)(a1 + 32);
  sub_100011000(v1);
}

void sub_100019ADC(uint64_t a1, uint64_t a2, void *a3)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(a3, "allQueryTasks", 0);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 clientConnection];
        CFStringRef v11 = v10;
        if (v10)
        {
          uint64_t v12 = *(void **)(a1 + 32);
          if (v10 == v12 || xpc_equal(v10, v12))
          {
            [v9 setClientCanceled:1];
            [v9 cancel];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

uint64_t start()
{
  uint64_t v0 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "IndexApp launched", v4, 2u);
  }

  id v2 = +[CSIndexAgentApp sharedAgent];
  if (v2)
  {
    [v2 startListener];
    dispatch_main();
  }
  return 1;
}

void sub_100019F20(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100019FBC;
  v2[3] = &unk_100035300;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  sub_100011000(v2);
}

void sub_100019FBC(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  id v6 = [v10 rootPath];
  unsigned int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    BOOL v8 = *(void **)(a1 + 40);
    id v9 = [v10 domain];
    [v8 addObject:v9];

    *a4 = 1;
  }
}

void sub_10001A058(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_10003CE20;
  qword_10003CE20 = v2;

  id v4 = *(void **)(a1 + 32);

  objc_storeStrong((id *)&qword_10003CD78, v4);
}

void sub_10001A0D4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_10001A0F4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10001A124(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001A158(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

char *sub_10001A168(int a1, char *__s1)
{
  return strdup(__s1);
}

void sub_10001A170(int a1, void *a2)
{
}

BOOL sub_10001A178(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_10001A198(char *a1)
{
  unsigned int v2 = strlen(a1);
  return sub_10000AC0C((unsigned __int8 *)a1, v2, -1640531527);
}

void *sub_10001A1D4(uint64_t a1, void *a2)
{
  uint64_t result = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  void *result = *a2;
  return result;
}

void sub_10001A214(int a1, void *a2)
{
}

BOOL sub_10001A21C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001A230(uint64_t a1)
{
  return sub_10000AED4(a1);
}

dispatch_object_t sub_10001A24C(int a1, dispatch_object_t object)
{
  return object;
}

void sub_10001A278(int a1, dispatch_object_t object)
{
}

xpc_object_t sub_10001A280(int a1, xpc_object_t object)
{
  return object;
}

void sub_10001A2AC(int a1, xpc_object_t object)
{
}

CFTypeRef sub_10001A2B4(int a1, CFTypeRef cf)
{
  return cf;
}

void sub_10001A2E0(int a1, CFTypeRef cf)
{
}

uint64_t sub_10001A2E8()
{
  uint64_t result = _MDPlistBytesCreateMutableUsingMalloc();
  if (result)
  {
    uint64_t v1 = (const void *)result;
    _MDPlistBytesAppendPlist();
    Byteuint64_t Vector = (const void *)_MDPlistBytesGetByteVector();
    ByteVectorCFIndex Count = _MDPlistBytesGetByteVectorCount();
    xpc_object_t v4 = xpc_data_create(ByteVector, ByteVectorCount);
    CFRelease(v1);
    return (uint64_t)v4;
  }
  return result;
}

void sub_10001A35C(void *a1, size_t a2)
{
  uint64_t MutableUsingMalloc = _MDPlistBytesCreateMutableUsingMalloc();
  if (MutableUsingMalloc)
  {
    id v5 = (const void *)MutableUsingMalloc;
    _MDPlistBytesAppendPlist();
    Byteuint64_t Vector = (const void *)_MDPlistBytesGetByteVector();
    ByteVectorCFIndex Count = _MDPlistBytesGetByteVectorCount();
    xpc_array_set_data(a1, a2, ByteVector, ByteVectorCount);
    CFRelease(v5);
  }
}

void sub_10001A3FC(void *a1, const char *a2)
{
  uint64_t MutableUsingMalloc = _MDPlistBytesCreateMutableUsingMalloc();
  if (MutableUsingMalloc)
  {
    id v5 = (const void *)MutableUsingMalloc;
    _MDPlistBytesAppendPlist();
    Byteuint64_t Vector = (const void *)_MDPlistBytesGetByteVector();
    ByteVectorCFIndex Count = _MDPlistBytesGetByteVectorCount();
    xpc_dictionary_set_data(a1, a2, ByteVector, ByteVectorCount);
    CFRelease(v5);
  }
}

uint64_t sub_10001A49C(void *a1)
{
  xpc_data_get_bytes_ptr(a1);
  xpc_data_get_length(a1);
  unsigned int v2 = (const void *)_MDPlistBytesCreate();
  uint64_t v3 = _MDPlistBytesCopyPlistAtIndex();
  CFRelease(v2);
  return v3;
}

uint64_t sub_10001A510(void *a1, size_t a2)
{
  size_t length = 0;
  xpc_array_get_data(a1, a2, &length);
  unsigned int v2 = (const void *)_MDPlistBytesCreate();
  uint64_t v3 = _MDPlistBytesCopyPlistAtIndex();
  CFRelease(v2);
  return v3;
}

uint64_t sub_10001A578(void *a1, const char *a2)
{
  size_t length = 0;
  xpc_dictionary_get_data(a1, a2, &length);
  unsigned int v2 = (const void *)_MDPlistBytesCreate();
  uint64_t v3 = _MDPlistBytesCopyPlistAtIndex();
  CFRelease(v2);
  return v3;
}

CFAllocatorRef sub_10001A5E0()
{
  context.version = 0;
  context.info = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  context.retain = (CFAllocatorRetainCallBack)&_CFRetain;
  context.release = (CFAllocatorReleaseCallBack)&_CFRelease;
  context.copyDescription = 0;
  context.allocate = (CFAllocatorAllocateCallBack)sub_10001A688;
  context.reallocate = 0;
  context.deallocate = (CFAllocatorDeallocateCallBack)sub_10001A690;
  context.preferredSize = (CFAllocatorPreferredSizeCallBack)nullsub_9;
  return CFAllocatorCreate(kCFAllocatorDefault, &context);
}

uint64_t sub_10001A688()
{
  return 0;
}

void sub_10001A690(void *key, CFDictionaryRef theDict)
{
  Value = (void (**)(const void *, void *))CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    Value[2](Value, key);
    CFDictionaryRemoveValue(theDict, key);
  }
}

void sub_10001A6FC(const __CFAllocator *a1, const void *a2, const void *a3)
{
  memset(&theDict, 0, sizeof(theDict));
  CFAllocatorGetContext(a1, &theDict);
  if ((void (*)(void *, CFDictionaryRef))theDict.deallocate == sub_10001A690)
  {
    id v5 = _Block_copy(a3);
    CFDictionaryAddValue((CFMutableDictionaryRef)theDict.info, a2, v5);
    _Block_release(v5);
  }
}

void sub_10001A77C(const __CFAllocator *a1, void *a2)
{
  memset(&theDict, 0, sizeof(theDict));
  CFAllocatorGetContext(a1, &theDict);
  if ((void (*)(void *, CFDictionaryRef))theDict.deallocate == sub_10001A690) {
    sub_10001A690(a2, (CFDictionaryRef)theDict.info);
  }
}

uint64_t sub_10001A7E0(__darwin_time_t *a1)
{
  v4.tv_sec = 0;
  *(void *)&v4.tv_usec = 0;
  gettimeofday(&v4, 0);
  uint64_t v2 = 1000 * v4.tv_usec;
  *a1 = v4.tv_sec;
  a1[1] = v2;
  return 0;
}

uint64_t sub_10001A830(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

uint64_t sub_10001A850(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result <= a3) {
    return a3;
  }
  return result;
}

uint64_t sub_10001A874(uint64_t a1, uint64_t a2)
{
  return a1 + a2;
}

uint64_t sub_10001A87C(char **a1, size_t *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = vsnprintf(*a1, *a2, a3, &a9);
  if ((result & 0x80000000) == 0)
  {
    if (*a2 >= result)
    {
      *a2 -= result;
      *a1 += result;
    }
    else
    {
      *a2 = 0;
    }
  }
  return result;
}

BOOL sub_10001A8F0(const char *a1)
{
  int v11 = -1;
  int v12 = -1;
  int v9 = -1;
  int v10 = -1;
  int v8 = -1;
  char v7 = 0;
  return sscanf(a1, "%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n%c", &v12, &v11, &v10, &v9, &v8, &v7) == -1&& v12 == 8&& v11 == 13&& v10 == 18&& v9 == 23&& v8 == 36;
}

unsigned __int8 *sub_10001A984(unsigned char *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = a1 + 1;
    while (v2 == *a2)
    {
      ++a2;
      int v4 = *v3++;
      int v2 = v4;
      if (!v4) {
        return a2;
      }
    }
    return 0;
  }
  return a2;
}

unsigned char *sub_10001A9B8(unsigned char *result, unsigned __int8 *a2)
{
  int v2 = *result;
  if (!*result) {
    return 0;
  }
  while (v2 == *a2)
  {
    int v3 = *++result;
    int v2 = v3;
    ++a2;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001A9E0(unsigned __int8 *a1, unsigned char *a2)
{
  unsigned __int8 v2 = *a1;
  if (*a1)
  {
    int v3 = a1 + 1;
    while (1)
    {
      int v4 = *a2;
      if (v4 != v2) {
        return (2 * ((char)v2 - (char)v4));
      }
      ++a2;
      int v5 = *v3++;
      unsigned __int8 v2 = v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    if (*a2) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_10001AA28(unsigned char *a1, char *a2)
{
  char v3 = *a1;
  if (*a1)
  {
    int v4 = a1 + 1;
    while (1)
    {
      __darwin_ct_rune_t v5 = __tolower(v3);
      if (v5 != __tolower(*a2)) {
        break;
      }
      ++a2;
      int v6 = *v4++;
      char v3 = v6;
      if (!v6) {
        goto LABEL_5;
      }
    }
    __darwin_ct_rune_t v7 = (char)*(v4 - 1);
  }
  else
  {
LABEL_5:
    __darwin_ct_rune_t v7 = 0;
  }
  int v8 = __tolower(v7);
  return v8 - __tolower(*a2);
}

unsigned char *sub_10001AAA4(unsigned char *result, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = a2 - 1;
  if (a2 != 1)
  {
    while ((result[v2] & 0xFE) != 0x2E)
    {
      if (!--v2) {
        goto LABEL_7;
      }
    }
  }
  result += v2;
LABEL_7:
  if (*result != 46) {
    return 0;
  }
  return result;
}

char *sub_10001AAE8(char *__s, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = __s;
  uint64_t v3 = a2 - 1;
  if (a2 == 1)
  {
    uint64_t v2 = &__s[v3];
LABEL_8:
    if (*v2 != 47) {
      return 0;
    }
  }
  else
  {
    while (__s[v3] != 47)
    {
      if (!--v3) {
        goto LABEL_8;
      }
    }
    uint64_t v2 = &__s[v3];
  }
  if (strlen(v2) > 1) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_10001AB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t), void *a6)
{
  uint64_t v6 = a3 - 1;
  if (a3 - 1 < 0)
  {
    uint64_t v18 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    id v20 = a6;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = v6 + v13;
      if (v6 + v13 < 0 != __OFADD__(v6, v13)) {
        ++v14;
      }
      uint64_t v15 = v14 >> 1;
      uint64_t v16 = a2 + (v14 >> 1) * a4;
      int v17 = a5(a1, v16);
      if (!v17)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v16;
        a6 = v20;
        goto LABEL_17;
      }
      uint64_t v18 = v17;
      if (v17 < 0) {
        uint64_t v6 = v15 - 1;
      }
      else {
        uint64_t v13 = v15 + 1;
      }
      if (v17 >= 0)
      {
        uint64_t v12 = v16;
        uint64_t v11 = v17;
      }
    }
    while (v13 <= v6);
    a6 = v20;
    if (v11) {
      goto LABEL_17;
    }
  }
  uint64_t v11 = v18;
  uint64_t v12 = v16;
LABEL_17:
  *a6 = v11;
  return v12;
}

uint64_t sub_10001AC48(uint64_t a1)
{
  if (qword_10003CD88 != -1) {
    dispatch_once(&qword_10003CD88, &stru_1000357F8);
  }
  if (dword_10003CBF0 < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return fcntl(dword_10003CBF0, 52, a1);
  }
}

void sub_10001ACB8(id a1)
{
  dword_10003CBF0 = open("/System/Library", 4);
}

uint64_t sub_10001ACE4()
{
  return 1;
}

uint64_t sub_10001ACEC()
{
  return 0;
}

uint64_t sub_10001ACF4()
{
  if (byte_10003CD90 == 1) {
    return byte_10003CD91;
  }
  int v2 = 0;
  size_t v1 = 4;
  *(void *)uint64_t v3 = 0x2C00000001;
  pid_t v4 = getpid();
  int v5 = 0;
  sysctl(v3, 3u, &v2, &v1, 0, 0);
  if (v2)
  {
    uint64_t result = 1;
    byte_10003CD91 = 1;
  }
  else
  {
    uint64_t result = byte_10003CD91;
  }
  byte_10003CD90 = 1;
  return result;
}

void *sub_10001ADC4(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *result + a2;
  uint64_t v4 = result[1] + a3;
  void *result = v3;
  result[1] = v4;
  if (v4 >= 1000000000)
  {
    void *result = v3 + 1;
    result[1] = v4 - 1000000000;
  }
  return result;
}

uint64_t sub_10001ADFC(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a2 + 8);
  int v4 = *(_DWORD *)(result + 8);
  BOOL v5 = __OFSUB__(v3, v4);
  int v6 = v3 - v4;
  uint64_t v7 = 0xFFFFFFFFLL;
  if (v6 < 0 != v5)
  {
    int v8 = 1000000;
  }
  else
  {
    uint64_t v7 = 0;
    int v8 = 0;
  }
  *(void *)a3 = *(void *)a2 - *(void *)result + v7;
  *(_DWORD *)(a3 + 8) = v6 + v8;
  return result;
}

time_t sub_10001AE3C()
{
  v3[1] = 0;
  time_t v4 = 0;
  *(void *)int v6 = 0x1500000001;
  v3[0] = 0;
  size_t v5 = 16;
  time(&v4);
  int v0 = sysctl(v6, 2u, v3, &v5, 0, 0);
  if (v3[0]) {
    BOOL v1 = v0 == -1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0;
  }
  else {
    return v4 - v3[0];
  }
}

uint64_t sub_10001AEE0()
{
  *(void *)size_t v5 = 0x1500000001;
  v3[0] = 0;
  v3[1] = 0;
  size_t v4 = 16;
  int v0 = sysctl(v5, 2u, v3, &v4, 0, 0);
  if (v3[0]) {
    BOOL v1 = v0 == -1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0;
  }
  else {
    return v3[0];
  }
}

uint64_t sub_10001AF70()
{
  uint64_t result = qword_10003CD98;
  if (!qword_10003CD98)
  {
    long long v5 = 0u;
    long long v6 = 0u;
    *(_OWORD *)host_info_out = 0u;
    mach_port_t v1 = mach_host_self();
    mach_msg_type_number_t host_info_outCnt = 12;
    mach_error_t v2 = host_info(v1, 1, host_info_out, &host_info_outCnt);
    if (v2)
    {
      mach_error("flushsize", v2);
      exit(1);
    }
    uint64_t result = *((void *)&v6 + 1);
    qword_10003CD98 = *((void *)&v6 + 1);
  }
  return result;
}

unint64_t sub_10001AFEC(double a1)
{
  if (qword_10003CDA0 != -1) {
    dispatch_once(&qword_10003CDA0, &stru_100035838);
  }
  return (unint64_t)(*(double *)&qword_10003CDA8 * a1);
}

void sub_10001B044(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_10003CDA8 = (double)v1 * 1000000000.0 / (double)v2;
  }
}

double sub_10001B094(uint64_t a1, uint64_t a2)
{
  if (qword_10003CDA0 != -1) {
    dispatch_once(&qword_10003CDA0, &stru_100035878);
  }
  return (double)(unint64_t)(a2 - a1) / *(double *)&qword_10003CDA8;
}

void sub_10001B0F4(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_10003CDA8 = (double)v1 * 1000000000.0 / (double)v2;
  }
}

uint64_t sub_10001B144()
{
  return notify_register_check("com.apple.system.powermanagement.SystemLoadAdvisory", &dword_10003CDB0);
}

uint64_t sub_10001B158()
{
  return notify_cancel(dword_10003CDB0);
}

uint64_t sub_10001B164()
{
  int check = 0;
  notify_check(dword_10003CDB0, &check);
  if (!check) {
    return qword_10003CBF8[0];
  }
  notify_get_state(dword_10003CDB0, qword_10003CBF8);
  uint64_t result = qword_10003CBF8[0];
  if (!qword_10003CBF8[0])
  {
    uint64_t result = 2;
    qword_10003CBF8[0] = 2;
  }
  return result;
}

BOOL sub_10001B1D8(int a1)
{
  return setiopolicy_np(0, 0, a1) == 0;
}

BOOL sub_10001B204(int a1)
{
  return setiopolicy_np(0, 1, a1) == 0;
}

uint64_t sub_10001B230()
{
  return getiopolicy_np(0, 0);
}

uint64_t sub_10001B23C()
{
  return getiopolicy_np(0, 1);
}

uint64_t sub_10001B248(integer_t a1)
{
  policy_mach_timebase_info info = a1;
  thread_act_t v1 = mach_thread_self();
  uint64_t v2 = thread_policy_set(v1, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v1);
  return v2;
}

uint64_t sub_10001B2A4(int a1)
{
  *(void *)size_t v4 = 0x4400000001;
  if (a1) {
    int v1 = 2;
  }
  else {
    int v1 = 4;
  }
  int v3 = v1;
  return sysctl(v4, 2u, 0, 0, &v3, 4uLL);
}

uint64_t sub_10001B328(int a1)
{
  *(void *)size_t v4 = 0x4400000001;
  if (a1) {
    int v1 = 1;
  }
  else {
    int v1 = 3;
  }
  int v3 = v1;
  return sysctl(v4, 2u, 0, 0, &v3, 4uLL);
}

uint64_t sub_10001B3A8()
{
  if (qword_10003CDD0 != -1) {
    dispatch_once(&qword_10003CDD0, &stru_100035938);
  }
  return byte_10003CDD8;
}

BOOL sub_10001B3F0(mach_port_name_t a1)
{
  kern_return_t v1;
  BOOL result;
  int x;

  x = 0;
  int v1 = pid_for_task(a1, &x);
  uint64_t result = 0;
  if (!v1) {
    return kill(x, 9) == 0;
  }
  return result;
}

__CFString *sub_10001B438(const __CFAllocator *a1, uint64_t a2)
{
  Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    *(void *)int v8 = 0;
    *(void *)refs = 0;
    mach_port_urefs_t v7 = 0;
    uint64_t v4 = mach_port_get_refs(mach_task_self_, a2, 1u, &refs[1]);
    if (v4 || (uint64_t v4 = mach_port_get_refs(mach_task_self_, a2, 0, refs), v4))
    {
      long long v6 = mach_error_string(v4);
      CFStringAppendFormat(Mutable, 0, @"port:%#010x kr:%u (%s)", a2, v4, v6);
    }
    else
    {
      mach_port_get_refs(mach_task_self_, a2, 2u, &v8[1]);
      mach_port_get_refs(mach_task_self_, a2, 4u, v8);
      mach_port_get_refs(mach_task_self_, a2, 3u, &v7);
      CFStringAppendFormat(Mutable, 0, @"port:%#010x receiveRefs:%u sendRefs:%u sendOnceRefs:%u deadNameRefs:%u portSetRefs:%u", a2, refs[1], refs[0], v8[1], v8[0], v7);
    }
  }
  return Mutable;
}

uint64_t sub_10001B548()
{
  if (qword_10003CDB8 != -1) {
    dispatch_once(&qword_10003CDB8, &stru_1000358B8);
  }
  return 0;
}

CFDataRef sub_10001B58C(const __CFAllocator *a1, const __CFURL *a2)
{
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a2, 1u, buffer, 1024)) {
    return 0;
  }
  memset(&v10.st_size, 0, 48);
  int v4 = open((const char *)buffer, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4 == -1) {
    return 0;
  }
  int v5 = v4;
  CFDataRef v6 = 0;
  if (!fstat(v4, &v10) && v10.st_size <= 0xFFFFFF)
  {
    mach_port_urefs_t v7 = (UInt8 *)CFAllocatorAllocate(a1, v10.st_size, 0);
    off_t st_size = v10.st_size;
    if (st_size == pread(v5, v7, v10.st_size, 0))
    {
      CFDataRef v6 = CFDataCreateWithBytesNoCopy(a1, v7, v10.st_size, a1);
    }
    else
    {
      CFAllocatorDeallocate(a1, v7);
      CFDataRef v6 = 0;
    }
  }
  close(v5);
  return v6;
}

char *sub_10001B6D8(const __CFString *a1, char *a2, CFIndex a3, CFStringEncoding a4)
{
  if (CFStringGetCString(a1, a2, a3, a4)) {
    return a2;
  }
  else {
    return 0;
  }
}

BOOL sub_10001B704(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(mach_task_self_, 1u, task_info_out, &task_info_outCnt) == 0;
}

int64x2_t sub_10001B74C(int64x2_t *a1, int64x2_t *a2, int64x2_t *a3)
{
  int64x2_t result = vsubq_s64(*a2, *a1);
  *a3 = result;
  return result;
}

int64x2_t sub_10001B760(int64x2_t *a1, int64x2_t *a2, int64x2_t *a3)
{
  int64x2_t result = vaddq_s64(*a2, *a1);
  *a3 = result;
  return result;
}

uint64_t sub_10001B774(int64x2_t *a1)
{
  memset(v3, 0, sizeof(v3));
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(mach_task_self_, 1u, v3[0].i32, &task_info_outCnt)) {
    return 0;
  }
  *a1 = vsubq_s64(v3[0], *a1);
  return 1;
}

CFNumberRef sub_10001B7E8(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
}

CFNumberRef sub_10001B820(uint64_t a1)
{
  uint64_t valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef sub_10001B858(double a1)
{
  double valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &valuePtr);
}

CFNumberRef sub_10001B890(const __CFNumber *result)
{
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef sub_10001B8C4(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

double sub_10001B8F8(const __CFNumber *a1)
{
  double valuePtr = 0.0;
  if (!a1) {
    return 0.0;
  }
  CFNumberGetValue(a1, kCFNumberDoubleType, &valuePtr);
  return valuePtr;
}

CFMutableDictionaryRef sub_10001B934()
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

CFMutableArrayRef sub_10001B958()
{
  return CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
}

CFMutableSetRef sub_10001B974()
{
  return CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
}

void sub_10001B990(const __CFDictionary *a1, void *context)
{
}

uint64_t sub_10001B9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void sub_10001B9C4(const __CFSet *a1, void *context)
{
}

uint64_t sub_10001B9DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_10001B9F4(const __CFArray *a1, void *a2)
{
  v4.size_t length = CFArrayGetCount(a1);
  v4.location = 0;

  CFArrayApplyFunction(a1, v4, (CFArrayApplierFunction)sub_10001BA4C, a2);
}

uint64_t sub_10001BA4C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_10001BA64()
{
  if (qword_10003CDC8 != -1) {
    dispatch_once(&qword_10003CDC8, &stru_1000358F8);
  }
  return qword_10003CDC0;
}

void sub_10001BAA8(id a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v1, _kCFSystemVersionBuildVersionKey);
  qword_10003CDC0 = (uint64_t)Value;
  if (Value) {
    qword_10003CDC0 = (uint64_t)CFStringCreateCopy(kCFAllocatorDefault, Value);
  }
  CFRelease(v1);
  if (!qword_10003CDC0) {
    qword_10003CDC0 = (uint64_t)&stru_100035E78;
  }
}

void sub_10001BB1C(id a1)
{
  byte_10003CDD8 = 1;
}

uint64_t sub_10001BDC8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4) {
    return 2;
  }
  uint64_t v15 = v4;
  uint64_t v16 = v5;
  if (*(void *)(a3 + 8) > 0x3FuLL) {
    return 2;
  }
  if (!*(_DWORD *)a3) {
    return 0;
  }
  uint64_t v14 = 0;
  if (sub_10001A9E0("journal.", *(unsigned char **)(a3 + 32)) == -1
    && sscanf(*(const char **)(a3 + 32), "journal.%llu", &v14) == 1)
  {
    int v9 = [QueueImportJournalFile alloc];
    uint64_t v10 = *(void *)(a3 + 16);
    uint64_t v11 = v14;
    uint64_t v12 = 0;
  }
  else
  {
    if (sub_10001A9E0("retire.", *(unsigned char **)(a3 + 32)) != -1
      || sscanf(*(const char **)(a3 + 32), "retire.%llu", &v14) != 1)
    {
      return 2;
    }
    int v9 = [QueueImportJournalFile alloc];
    uint64_t v10 = *(void *)(a3 + 16);
    uint64_t v11 = v14;
    uint64_t v12 = 1;
  }
  uint64_t v13 = [(QueueImportJournalFile *)v9 initWithType:v12 partialPath:v10 andSerialNumber:v11];
  if (v13)
  {
    [*(id *)(a1 + 32) addObject:v13];
  }
  return 2;
}

int64_t sub_10001BEE8(id a1, id a2, id a3)
{
  unint64_t v3 = *((void *)a2 + 130);
  unint64_t v4 = *((void *)a3 + 130);
  if (v3 < v4) {
    return -1;
  }
  if (v3 > v4) {
    return 1;
  }
  int v6 = *((_DWORD *)a2 + 2);
  int v7 = *((_DWORD *)a3 + 2);
  BOOL v9 = __OFSUB__(v6, v7);
  BOOL v8 = v6 - v7 < 0;
  int64_t v10 = v6 > v7;
  if (v8 != v9) {
    return -1;
  }
  else {
    return v10;
  }
}

void sub_10001C610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C6B0(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v12 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    memset(v9, 0, sizeof(v9));
    sub_10001C7B8(a2, (void *)(*(void *)(a1[4] + 8) + 32), (int *)v9);
    if ((LODWORD(v9[0]) - 1) <= 1)
    {
      uint64_t v3 = *(void *)(a1[5] + 8);
      unint64_t v4 = *(void *)(v3 + 24);
      if (v4 >= a1[10])
      {
        ++*(_DWORD *)(*(void *)(a1[8] + 8) + 24);
        *(unsigned char *)(*(void *)(a1[9] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
        if (*((void *)&v10 + 1))
        {
          uint64_t v7 = *(void *)(a1[6] + 8);
          if (*((uint64_t *)&v10 + 1) < *(void *)(v7 + 24)) {
            *(void *)(v7 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *((void *)&v10 + 1);
          }
        }
      }
      else
      {
        *(void *)(v3 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4 + 1;
        uint64_t v5 = *((void *)&v10 + 1);
        uint64_t v6 = *(void *)(a1[6] + 8);
        if (!*((void *)&v10 + 1)) {
          uint64_t v5 = *(void *)(v6 + 24);
        }
        *(void *)(v6 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
        ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
      }
    }
  }
  return 0;
}

uint64_t sub_10001C7B8(uint64_t result, void *a2, int *a3)
{
  int v5 = *(_DWORD *)result != 0;
  *a3 = v5;
  *(void *)(a3 + 1) = *(void *)(result + 16);
  *((void *)a3 + 2) = *(void *)(result + 8);
  unsigned int v6 = *(_DWORD *)(result + 28);
  a3[6] = *(_DWORD *)(result + 24);
  *((void *)a3 + 5) = v6;
  a3[18] = -1;
  *((void *)a3 + 10) = -1;
  *((void *)a3 + 4) = 0;
  if (*(int *)(result + 32) >= 1)
  {
    uint64_t v7 = result;
    uint64_t v8 = 0;
    BOOL v9 = (void *)(result + 48);
    do
    {
      if (*((_DWORD *)v9 - 2) == 16 && *v9)
      {
        int64x2_t result = sub_1000218B0(v7, v8);
        switch(*(unsigned char *)result)
        {
          case 1:
            int64x2_t result = sub_1000218B0(v7, v8);
            a2[2] = *(void *)(result + 1);
            break;
          case 2:
            int64x2_t result = sub_1000218B0(v7, v8);
            a2[1] = *(void *)(result + 1);
            break;
          case 3:
            int64x2_t result = sub_1000218B0(v7, v8);
            *a2 = *(void *)(result + 1);
            break;
          case 4:
            *(void *)a3 = 0xFFFFFFFF00000002;
            break;
          case 5:
            int64x2_t result = sub_1000218B0(v7, v8);
            a3[11] = *(unsigned __int8 *)(result + 1);
            break;
          case 6:
            int64x2_t result = sub_1000218B0(v7, v8);
            a3[18] = *(_DWORD *)(result + 1);
            break;
          case 7:
            int64x2_t result = sub_1000218B0(v7, v8);
            *((void *)a3 + 10) = *(void *)(result + 1);
            break;
          case 8:
            int64x2_t result = sub_1000218B0(v7, v8);
            uint64_t v10 = *(unsigned int *)(result + 1);
            goto LABEL_15;
          case 9:
            int64x2_t result = sub_1000218B0(v7, v8);
            uint64_t v10 = *(void *)(result + 1);
LABEL_15:
            *((void *)a3 + 4) = v10;
            break;
          default:
            break;
        }
      }
      v9 += 3;
      ++v8;
    }
    while (v8 < *(int *)(v7 + 32));
    int v5 = *a3;
  }
  a3[7] = *a2;
  long long v11 = *(_OWORD *)(a2 + 1);
  *((_OWORD *)a3 + 3) = v11;
  *((void *)a3 + 8) = 1;
  if (v5 == 2)
  {
    *a2 = -1;
  }
  else if ((v5 - 1) > 1)
  {
    return result;
  }
  a2[1] = v11 + 1;
  return result;
}

unsigned char *sub_10001CA60(unsigned char *result, unsigned char *a2)
{
  void *result = 0;
  *a2 = 0;
  return result;
}

void sub_10001CA70(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void *sub_10001CA8C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64x2_t result = malloc_type_malloc(0x20uLL, 0x1080040A9F9A45FuLL);
  if (result)
  {
    *(_DWORD *)int64x2_t result = a1;
    result[1] = a2;
    result[2] = a3;
    result[3] = a4;
  }
  return result;
}

void sub_10001CAEC()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  char v33 = 0;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  int v5 = *(_DWORD *)v0;
  if (!v4)
  {
LABEL_3:
    while (1)
    {
      bzero(v34, 0x1028uLL);
      sub_1000074B8((ssize_t)v34, v5, v2);
      unint64_t v13 = sub_1000074D4((ssize_t)v34);
      if (v13) {
        break;
      }
      if ((sub_1000074D4((ssize_t)v34) & 1) != 0
        || sub_1000075FC((ssize_t)v34, v14, v15, v16, v17, v18, v19, v20))
      {
        if (!v3) {
          goto LABEL_12;
        }
      }
      else
      {
        sub_1000075FC((ssize_t)v34, v21, v22, v23, v24, v25, v26, v27);
        if (!v3) {
          goto LABEL_12;
        }
      }
      (*(void (**)(uint64_t))(v3 + 16))(v3);
      if (v13 < 2 || v33) {
        return;
      }
LABEL_13:
      uint64_t v2 = v13 >> 1;
      if (v4) {
        goto LABEL_2;
      }
    }
    unsigned int v28 = sub_1000075FC((ssize_t)v34, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v32 = 0;
    memset(v31, 0, sizeof(v31));
    uint64_t v29 = (char *)malloc_type_malloc(v28, 0x3FCF9B56uLL);
    sub_100007D50((ssize_t)v34, v29, v28);
    if (!v35)
    {
      int v30 = 0;
      sub_100009404((uint64_t)v31, (uint64_t)v29, v28);
      while (((uint64_t (*)(_OWORD *, int *))loc_10000942C)(v31, &v30))
      {
        if (v3)
        {
          (*(void (**)(uint64_t))(v3 + 16))(v3);
          if (v33) {
            return;
          }
        }
      }
    }
    free(v29);
LABEL_12:
    if (v13 < 2) {
      return;
    }
    goto LABEL_13;
  }
LABEL_2:
  (*(void (**)(uint64_t, uint64_t, char *))(v4 + 16))(v4, v2, &v33);
  if (!v33) {
    goto LABEL_3;
  }
}

unsigned char *sub_10001CD0C(unsigned char *a1, unsigned char *a2)
{
  char v2 = 0;
  uint64_t v3 = a2;
  while (1)
  {
    int v4 = *a1;
    if (v4 == 47)
    {
      char v2 = 1;
      goto LABEL_10;
    }
    if (!*a1) {
      break;
    }
    if (v3 - a2 > 1022) {
      return 0;
    }
    if (v2)
    {
      *v3++ = 47;
      if (v3 - a2 > 1022) {
        return 0;
      }
      LOBYTE(v4) = *a1;
    }
    char v2 = 0;
    *v3++ = v4;
LABEL_10:
    ++a1;
  }
  if (v3 == a2 && (v2 & 1) != 0)
  {
    *a2 = 47;
    uint64_t v3 = a2 + 1;
  }
  unsigned char *v3 = 0;
  return a2;
}

char *sub_10001CD94(char *__source, char *__s)
{
  if (__s == __source) {
    size_t v3 = strlen(__s);
  }
  else {
    size_t v3 = strlcpy(__s, __source, 0x400uLL);
  }
  size_t v4 = v3;
  size_t v5 = v3 - 1;
  if (v3 - 1 > 0x3FE) {
    return 0;
  }
  uint64_t v6 = &__s[v5];
  if (__s[v5] != 47 || __s[v3])
  {
    uint64_t v6 = strrchr(__s, 47);
    if (!v6)
    {
      if (v4 <= 0x3FE)
      {
        uint64_t v7 = __s + 1;
        memmove(__s + 1, __s, v4 + 1);
        *__s = 0;
        return v7;
      }
      return 0;
    }
  }
  if (v6 == __s)
  {
    if (v4 <= 0x3FE)
    {
      uint64_t v7 = __s + 2;
      memmove(__s + 2, __s + 1, v4);
      *(_WORD *)__s = 47;
      return v7;
    }
    return 0;
  }
  *uint64_t v6 = 0;
  return v6 + 1;
}

char *sub_10001CE80(unsigned char *a1, const char *a2, char *__dst)
{
  size_t v3 = __dst;
  size_t v4 = a2;
  int v6 = *a1;
  if (*a1)
  {
    uint64_t v7 = a1 + 1;
    while (v6 == *(unsigned __int8 *)a2)
    {
      ++a2;
      int v8 = *v7++;
      int v6 = v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    size_t v3 = 0;
    size_t v9 = -(uint64_t)v4;
  }
  else
  {
LABEL_5:
    size_t v9 = a2 - v4;
    if (a2 && v9 <= 0x3FF && (!a1[v9] && !*a2 || a1[v9 - 1] == 47 || (int v10 = *(unsigned __int8 *)a2, ++a2, v10 == 47))) {
      size_t v9 = strlcpy(__dst, a2, 0x400uLL);
    }
    else {
      size_t v3 = 0;
    }
  }
  if (v9 <= 0x3FF) {
    return v3;
  }
  else {
    return 0;
  }
}

const char *sub_10001CF34(const char *__source, const char *a2, char *__dst)
{
  if (__source)
  {
    size_t v5 = __source;
    if (__source == __dst) {
      size_t v6 = 0;
    }
    else {
      size_t v6 = strlcpy(__dst, __source, 0x400uLL);
    }
    int v7 = *(unsigned __int8 *)a2;
    if (*a2)
    {
      if (strcmp(v5, "/"))
      {
        strlcat(__dst, "/", 0x400uLL);
        int v7 = *(unsigned __int8 *)a2;
      }
      if (v7 == 47) {
        int v8 = a2 + 1;
      }
      else {
        int v8 = a2;
      }
      size_t v6 = strlcat(__dst, v8, 0x400uLL);
    }
    if (v6 <= 0x3FF) {
      return __dst;
    }
    else {
      return 0;
    }
  }
  return __source;
}

uint64_t sub_10001CFDC(char *a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  return sub_10001CFF0(-2, a1, 537952260, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_10001CFF0(int a1, char *a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  if ((a3 & 0x200) != 0) {
    uint64_t v12 = a9;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t result = openat(a1, a2, a3, v12);
  if (result == -1)
  {
    uint64_t v14 = __error();
    uint64_t result = 0xFFFFFFFFLL;
    if ((a3 & 0x20000000) != 0 && *v14 == 22) {
      return openat(a1, a2, a3 & 0xDFFFFFFF, v12);
    }
  }
  return result;
}

unsigned char *sub_10001D084(int a1, unsigned char *a2)
{
  char v2 = a2;
  if (fcntl(a1, 50, a2) < 0 || !*v2) {
    return 0;
  }
  return v2;
}

unsigned char *sub_10001D0CC(char *a1, unsigned char *a2)
{
  if (!a1) {
    return 0;
  }
  int v4 = open(a1, 32772);
  if ((v4 & 0x80000000) == 0) {
    goto LABEL_21;
  }
  if (*__error() != 13) {
    return 0;
  }
  if (geteuid()) {
    return 0;
  }
  memset(&v7, 0, sizeof(v7));
  if (sub_10001D1D8(a1, &v7)) {
    return 0;
  }
  if (!v7.st_uid) {
    return 0;
  }
  *(void *)size_t v6 = 0;
  if (pthread_getugid_np(&v6[1], v6) || pthread_setugid_np(v7.st_uid, v7.st_gid)) {
    return 0;
  }
  int v4 = open(a1, 32772);
  if (pthread_setugid_np(v6[1], v6[0])) {
    sub_100026818();
  }
  if (v4 < 0) {
    return 0;
  }
LABEL_21:
  if (fcntl(v4, 50, a2) < 0 || !*a2) {
    a2 = 0;
  }
  close(v4);
  return a2;
}

uint64_t sub_10001D1D8(char *a1, stat *a2)
{
  uint64_t v4 = fstatat(-2, a1, a2, 512);
  if (!v4 || *__error() != 22) {
    return v4;
  }

  return fstatat(-2, a1, a2, 0);
}

unsigned char *sub_10001D264(const char *a1, unsigned char *a2)
{
  if (!a1) {
    return 0;
  }
  int v3 = open(a1, 32772);
  if (v3 < 0) {
    return 0;
  }
  int v4 = v3;
  if (fcntl(v3, 50, a2) < 0 || !*a2) {
    a2 = 0;
  }
  close(v4);
  return a2;
}

uint64_t sub_10001D2D0()
{
  memset(&v2, 0, sizeof(v2));
  bzero(__s, 0x400uLL);
  if ((unint64_t)__strlcpy_chk() > 0x3FF) {
    return 0xFFFFFFFFLL;
  }
  while (sub_10001D1D8(__s, &v2))
  {
    uint64_t v0 = strrchr(__s, 47);
    if (!v0) {
      return 0xFFFFFFFFLL;
    }
    char *v0 = 0;
  }
  return v2.st_dev;
}

char *sub_10001D398(char *a1)
{
  if (*a1 != 47) {
    return 0;
  }
  uint64_t v1 = a1;
  memset(&v8, 0, sizeof(v8));
  if (sub_10001D1D8(a1, &v8)) {
    return 0;
  }
  dev_t st_dev = v8.st_dev;
  size_t v5 = v9;
  bzero(v9, 0x400uLL);
  while (1)
  {
    size_t v6 = strchr(v1, 47);
    if (!v6) {
      break;
    }
    stat v2 = v6 + 1;
    size_t v7 = v6 + 1 - v1;
    memcpy(v5, v1, v7);
    v5 += v7;
    char *v5 = 0;
    if (sub_10001D1D8(v9, &v8)) {
      return 0;
    }
    uint64_t v1 = v2;
    if (v8.st_dev == st_dev) {
      return v2;
    }
  }
  return &v1[strlen(v1)];
}

uint64_t sub_10001D4AC(char *a1, uid_t a2, gid_t a3, int a4)
{
  memset(&v12, 0, sizeof(v12));
  if (sub_10001D1D8(a1, &v12))
  {
LABEL_2:
    if (!mkdir(a1, a4))
    {
      stat v8 = a1;
      mode_t v9 = a4;
      goto LABEL_11;
    }
    return 0xFFFFFFFFLL;
  }
  int v10 = v12.st_mode & 0xF000;
  if (v10 != 0x4000)
  {
    if (v10 == 0x8000)
    {
      if (unlink(a1)) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_2;
    }
    return 0;
  }
  if ((v12.st_mode & 0x1FF) == a4) {
    return 0;
  }
  mode_t v9 = a4;
  stat v8 = a1;
LABEL_11:
  if (chmod(v8, v9)) {
    return 0xFFFFFFFFLL;
  }
  if (chown(a1, a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sub_10001D598(char *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  if ((a2 & 0x200) != 0) {
    unsigned __int16 v9 = a9;
  }
  else {
    unsigned __int16 v9 = 0;
  }
  return sub_10001CFF0(-1, a1, a2 | 0x20000000u, a4, a5, a6, a7, a8, v9);
}

uint64_t sub_10001D5DC(unsigned char *a1, mode_t a2)
{
  bzero(__s, 0x400uLL);
  int v4 = sub_10001CD0C(a1, __s);
  if (!v4 || (size_t v5 = sub_10001CD94(v4, __s)) == 0)
  {
    uint64_t v14 = 0xFFFFFFFFLL;
    int v15 = 22;
LABEL_10:
    *__error() = v15;
    return v14;
  }
  uint64_t v11 = v5;
  int v12 = sub_10001CFF0(-2, __s, 537952260, v6, v7, v8, v9, v10, v17);
  if ((v12 & 0x80000000) == 0)
  {
    int v13 = v12;
    uint64_t v14 = mkdirat(v12, v11, a2);
    if (v14) {
      int v15 = *__error();
    }
    else {
      int v15 = 0;
    }
    close(v13);
    goto LABEL_10;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10001D6D0(const char *a1)
{
  return sub_10001D6E0(-2, a1, 2048);
}

uint64_t sub_10001D6E0(int a1, const char *a2, int a3)
{
  uint64_t v6 = unlinkat(a1, a2, a3);
  if (!v6) {
    return v6;
  }
  int v7 = __error();
  if ((a3 & 0x800) == 0 || *v7 != 22) {
    return v6;
  }

  return unlinkat(a1, a2, a3 & 0xFFFFF7FF);
}

uint64_t sub_10001D760(const char *a1)
{
  return sub_10001D6E0(-2, a1, 2176);
}

uint64_t sub_10001D770(const char *a1, const char *a2)
{
  return sub_10001D778(a1, a2, 0x10u);
}

uint64_t sub_10001D778(const char *a1, const char *a2, unsigned int a3)
{
  uint64_t v6 = renamex_np(a1, a2, a3);
  if (!v6) {
    return v6;
  }
  int v7 = __error();
  if ((a3 & 0x10) == 0 || *v7 != 22) {
    return v6;
  }

  return renamex_np(a1, a2, a3 & 0xFFFFFFEF);
}

uint64_t sub_10001D7F8(int a1, int *a2)
{
  *a2 = -1;
  memset(&v4, 0, sizeof(v4));
  if (sub_10001D898(a1, &v4)) {
    return 0;
  }
  *a2 = open(".", 32772);
  if (!pthread_fchdir_np()) {
    return 1;
  }
  if ((*a2 & 0x80000000) == 0) {
    close(*a2);
  }
  uint64_t result = 0;
  *a2 = -1;
  return result;
}

uint64_t sub_10001D898(int a1, stat *a2)
{
  uint64_t v4 = fstatat(a1, 0, a2, 1536);
  if (!v4 || *__error() != 22) {
    return v4;
  }

  return fstat(a1, a2);
}

uint64_t sub_10001D918(int a1)
{
  uint64_t result = pthread_fchdir_np();
  if ((a1 & 0x80000000) == 0)
  {
    return close(a1);
  }
  return result;
}

size_t sub_10001D964(char *a1, int a2, uint64_t a3)
{
  sprintf(a1, "/.vol/%llu/%llu", a2, a3);

  return strlen(a1);
}

uint64_t sub_10001D9B4(char *a1, stat *a2)
{
  uint64_t v4 = fstatat(-2, a1, a2, 544);
  if (!v4 || *__error() != 22) {
    return v4;
  }

  return fstatat(-2, a1, a2, 32);
}

uint64_t sub_10001DA40(const char *a1, void *a2, void *a3, size_t a4, int a5)
{
  return getattrlist(a1, a2, a3, a4, a5 | 0x200);
}

uint64_t sub_10001DA48(int a1, void *a2, void *a3, size_t a4, int a5)
{
  return fgetattrlist(a1, a2, a3, a4, a5 | 0x200);
}

uint64_t sub_10001DA50(int a1, const char *a2, void *a3, void *a4, size_t a5, int a6)
{
  return getattrlistat(a1, a2, a3, a4, a5, a6 | 0x200u);
}

uint64_t sub_10001DA58(int a1, void *a2, void *a3, size_t a4, int a5)
{
  return getattrlistbulk(a1, a2, a3, a4, a5 | 0x200u);
}

uint64_t sub_10001DA60(int a1, const char *a2, stat *a3, int a4)
{
  uint64_t v8 = fstatat(a1, a2, a3, a4);
  if (!v8) {
    return v8;
  }
  int v9 = __error();
  if ((a4 & 0x800) == 0 || *v9 != 22) {
    return v8;
  }

  return fstatat(a1, a2, a3, a4 & 0xFFFFF7FF);
}

uint64_t sub_10001DAF4(int a1, const char *a2, int a3, int a4)
{
  uint64_t v8 = faccessat(a1, a2, a3, a4);
  if (!v8) {
    return v8;
  }
  int v9 = __error();
  if ((a4 & 0x800) == 0 || *v9 != 22) {
    return v8;
  }

  return faccessat(a1, a2, a3, a4 & 0xFFFFF7FF);
}

uint64_t sub_10001DB88(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  uint64_t v10 = fchownat(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  uint64_t v11 = __error();
  if ((a5 & 0x800) == 0 || *v11 != 22) {
    return v10;
  }

  return fchownat(a1, a2, a3, a4, a5 & 0xFFFFF7FF);
}

uint64_t sub_10001DC24(int a1, const char *a2, int a3, const char *a4, int a5)
{
  uint64_t v10 = linkat(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  uint64_t v11 = __error();
  if ((a5 & 0x800) == 0 || *v11 != 22) {
    return v10;
  }

  return linkat(a1, a2, a3, a4, a5 & 0xFFFFF7FF);
}

uint64_t sub_10001DCC0(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  uint64_t v10 = renameatx_np(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  uint64_t v11 = __error();
  if ((a5 & 0x10) == 0 || *v11 != 22) {
    return v10;
  }

  return renameatx_np(a1, a2, a3, a4, a5 & 0xFFFFFFEF);
}

uint64_t sub_10001DD5C(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  uint64_t v10 = getattrlist(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  uint64_t v11 = __error();
  if ((a5 & 0x800) == 0 || *v11 != 22) {
    return v10;
  }

  return getattrlist(a1, a2, a3, a4, a5 & 0xFFFFF7FF);
}

uint64_t sub_10001DDF8(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  uint64_t v12 = getattrlistat(a1, a2, a3, a4, a5, a6);
  if (!v12) {
    return v12;
  }
  int v13 = __error();
  if ((a6 & 0x800) == 0 || *v13 != 22) {
    return v12;
  }

  return getattrlistat(a1, a2, a3, a4, a5, a6 & 0xFFFFFFFFFFFFF7FFLL);
}

uint64_t sub_10001DEA8(int a1, char *a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  if (qword_10003CDF0 != -1) {
    dispatch_once(&qword_10003CDF0, &stru_100035A08);
  }
  if (*a2 == 47)
  {
    uint64_t v12 = 0;
    int v13 = 47;
    while (v13 == a2[v12])
    {
      int v13 = aSystemVolumesD_0[++v12];
      if (v12 == 37)
      {
LABEL_20:
        BOOL v14 = 1;
        goto LABEL_21;
      }
    }
    uint64_t v15 = 0;
    int v16 = 47;
    while (v16 == a2[v15])
    {
      int v16 = aSystemVolumesD_1[++v15];
      if (v15 == 51) {
        goto LABEL_20;
      }
    }
    uint64_t v17 = 0;
    int v18 = 47;
    while (v18 == a2[v17])
    {
      int v18 = aPrivateVarDbSp[++v17];
      if (v17 == 31) {
        goto LABEL_20;
      }
    }
    uint64_t v19 = 0;
    int v20 = 47;
    while (v20 == a2[v19])
    {
      int v20 = aSystemVolumesD_2[++v19];
      if (v19 == 46) {
        goto LABEL_20;
      }
    }
    uint64_t v26 = 0;
    int v27 = 47;
    do
    {
      int v28 = a2[v26];
      BOOL v14 = v27 == v28;
      if (v27 != v28) {
        break;
      }
      int v27 = aPrivateVarDbSp_0[++v26];
    }
    while (v26 != 26);
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_21:
  if ((a3 & 0x400) != 0) {
    int v21 = a3 & 0xDFFFFBFF | 0x20000000;
  }
  else {
    int v21 = a3 | 0x20000000;
  }
  if ((v21 & 0x200) != 0) {
    unsigned __int16 v22 = a9;
  }
  else {
    unsigned __int16 v22 = 0;
  }
  uint64_t v23 = sub_10001CFF0(a1, a2, v21, a4, a5, a6, a7, a8, v22);
  uint64_t v24 = v23;
  if ((v23 & 0x80000000) == 0)
  {
    memset(&v29, 0, sizeof(v29));
    if (fstat(v23, &v29)
      || v29.st_nlink != 1
      || (bzero(&v30, 0x878uLL), !v14)
      && (fstatfs(v24, &v30) || *(void *)&v30.f_fsid == qword_10003CDE0 || *(void *)&v30.f_fsid == qword_10003CDE8))
    {
      close(v24);
      *__error() = 1;
      return 0xFFFFFFFFLL;
    }
    else if ((a3 & 0x400) != 0)
    {
      ftruncate(v24, 0);
    }
  }
  return v24;
}

void sub_10001E164(id a1)
{
  bzero(&v1, 0x878uLL);
  statfs("/", &v1);
  qword_10003CDE0 = (uint64_t)v1.f_fsid;
  statfs("/System/Volumes/Data", &v1);
  qword_10003CDE8 = (uint64_t)v1.f_fsid;
}

uint64_t sub_10001E1F8(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 1384);
    if (v2) {
      uint64_t result = *(unsigned int *)(v2 + 8);
    }
    else {
      uint64_t result = 0;
    }
    uint64_t v3 = *(void *)(v1 + 1376);
    if (v3) {
      result += *(unsigned int *)(v3 + 8);
    }
  }
  return result;
}

uint64_t sub_10001E228(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10001E250(a1, a2);
  if (v2) {
    return v2 + 15208;
  }
  else {
    return 0;
  }
}

uint64_t sub_10001E250(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 1384);
  if (v2)
  {
    unint64_t v3 = *(unsigned int *)(v2 + 8);
    if (v3)
    {
      BOOL v7 = a2 >= v3;
      unint64_t v4 = a2 - v3;
      if (v7)
      {
        a2 = v4;
      }
      else
      {
        uint64_t v5 = *(void *)(*(void *)v2 + 8 * a2);
        if (v5) {
          return v5;
        }
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 1376);
  if (v5)
  {
    unint64_t v6 = *(unsigned int *)(v5 + 8);
    if (v6) {
      BOOL v7 = a2 >= v6;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      return *(void *)(*(void *)v5 + 8 * a2);
    }
    return 0;
  }
  return v5;
}

uint64_t sub_10001E2B0(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_10001E250(a1, a2);
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

uint64_t sub_10001E2D0(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_10001E250(a1, a2);
  if (result) {
    return atomic_load((unsigned int *)(result + 36));
  }
  return result;
}

void sub_10001E4D8(id a1)
{
  pthread_mutex_lock(&stru_10003CC40);
  uint64_t v1 = (void *)qword_10003CDF8;
  qword_10003CDF8 = 0;

  pthread_mutex_unlock(&stru_10003CC40);
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "exiting, livefs server connection interrupted", v3, 2u);
  }

  exit(0);
}

void sub_10001E560(id a1)
{
  uint64_t v1 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "exiting, livefs server connection invalidated", v2, 2u);
  }

  exit(0);
}

void sub_10001ED38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10001ED94(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  unint64_t v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "exiting, got error %@ while using synchronous connection", (uint8_t *)&v4, 0xCu);
  }

  exit(0);
}

uint64_t sub_10001EE18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001EE28(uint64_t a1)
{
}

void sub_10001EE30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  unsigned int add = atomic_fetch_add(&dword_10003CC84, 1u);
  uint64_t v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    unsigned int v14 = add;
    __int16 v15 = 2080;
    uint64_t v16 = a1;
    __int16 v17 = 2048;
    int v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%d] (%s) start on %p", buf, 0x1Cu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000216D4;
  block[3] = &unk_100035C70;
  id v12 = v6;
  id v9 = v6;
  dispatch_sync(v5, block);
  uint64_t v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v14 = add;
    __int16 v15 = 2080;
    uint64_t v16 = a1;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%d] (%s) complete", buf, 0x12u);
  }
}

id sub_10001EFE8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  int64x2_t v3[2] = sub_10001F05C;
  v3[3] = &unk_100035A90;
  uint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 getRootFileHandleWithError:v3];
}

void sub_10001F05C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v9 = (uint64_t)v7;
    uint64_t v10 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000268F4(v9, v10);
    }

    exit(0);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100026888();
  }
}

id sub_10001F114(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  int v4[2] = sub_10001F1A0;
  v4[3] = &unk_100035AE0;
  v4[4] = a1[6];
  return [v1 otherAttributeOf:v2 named:@"_O_f_uuid" requestID:-1 reply:v4];
}

void sub_10001F1A0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000269D8();
    }
  }
  else if (v5 && [v5 length] == (id)16)
  {
    long long v13 = *(_OWORD *)[v6 bytes];
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v13];
    uint64_t v9 = objc_msgSend(v8, "UUIDString", v13);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10002696C();
    }
  }
}

id sub_10001F2CC(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  int v4[2] = sub_10001F358;
  v4[3] = &unk_100035AE0;
  v4[4] = a1[6];
  return [v1 otherAttributeOf:v2 named:@"_N_mount_time" requestID:-1 reply:v4];
}

void sub_10001F358(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Error %d getting volume mount time", (uint8_t *)v9, 8u);
    }
  }
  else if (v5 && [v5 length] == (id)8)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)[v6 bytes];
  }
}

id sub_10001F44C(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  int v4[2] = sub_10001F4D8;
  v4[3] = &unk_100035AE0;
  v4[4] = a1[6];
  return [v1 otherAttributeOf:v2 named:@"_N_last_mtime" requestID:-1 reply:v4];
}

void sub_10001F4D8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100026A40();
    }
  }
  else if (v5 && [v5 length] == (id)8)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)[v6 bytes];
  }
}

void sub_10001F868(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10001F894(int8x16_t *a1)
{
  uint64_t v2 = (void *)a1[2].i64[0];
  uint64_t v1 = (void *)a1[2].i64[1];
  v5[0] = _NSConcreteStackBlock;
  int8x16_t v3 = vextq_s8(a1[3], a1[3], 8uLL);
  uint64_t v4 = *(void *)(*(void *)(a1[3].i64[0] + 8) + 40);
  v5[1] = 3221225472;
  int v5[2] = sub_10001F944;
  v5[3] = &unk_100035B30;
  int8x16_t v7 = v3;
  id v6 = v1;
  [v2 lookupIn:v4 name:v6 usingFlags:0 requestID:-1 reply:v5];
}

void sub_10001F944(void *a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  *(_DWORD *)(*(void *)(a1[5] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  uint64_t v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
    v11[0] = 67109634;
    v11[1] = a2;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "LILookup: %d %@ - %@", (uint8_t *)v11, 0x1Cu);
  }
}

void sub_10001FDD4(void *a1, void *a2, void *a3, unsigned int a4, void *a5, void *a6)
{
  id v11 = a2;
  id v38 = a3;
  id v12 = a5;
  id v13 = a6;
  id v39 = v11;
  __int16 v14 = (char *)[v11 count];
  unsigned int v37 = v12;
  unsigned int v15 = [v12 count];
  uint64_t v16 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    unsigned int v17 = [v38 length];
    int v18 = (const char *)[v13 UTF8String];
    *(_DWORD *)buf = 67110146;
    uint64_t v19 = "";
    int v41 = (int)v14;
    if (v18) {
      uint64_t v19 = v18;
    }
    __int16 v42 = 1024;
    *(_DWORD *)uint64_t v43 = v15;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v17;
    __int16 v44 = 1024;
    unsigned int v45 = a4;
    __int16 v46 = 2080;
    long long v47 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "results: pc:%d xc:%d abs: %d s:%d ra:%s", buf, 0x24u);
  }
  id v36 = v13;

  id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  if (v14)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = a4;
    *(void *)&long long v21 = 67109378;
    long long v35 = v21;
    do
    {
      uint64_t v25 = objc_msgSend(v39, "objectAtIndexedSubscript:", v23, v35, v36);
      uint64_t v26 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        id v33 = [v25 UTF8String];
        *(_DWORD *)buf = v35;
        int v41 = (int)v23;
        __int16 v42 = 2080;
        *(void *)uint64_t v43 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "result[%d]: %s", buf, 0x12u);
      }

      int v27 = (void *)a1[4];
      if (v27)
      {
        uint64_t v28 = [v27 stringByAppendingPathComponent:v25];

        uint64_t v25 = (void *)v28;
      }
      stat v29 = (char *)[v38 bytes] + v22;
      statfs v30 = (void *)a1[5];
      uint64_t v31 = [v37 objectAtIndexedSubscript:v23];
      uint64_t v32 = sub_100022B04(v30, v25, (uint64_t)v29, v31);

      if (v32) {
        [v20 addObject:v32];
      }

      ++v23;
      v22 += v24;
    }
    while (v14 != v23);
  }
  uint64_t v34 = a1[6];
  if (v34) {
    (*(void (**)(uint64_t, id))(v34 + 16))(v34, v20);
  }
}

uint64_t sub_1000200CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LISearch complete: %d", (uint8_t *)v6, 8u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100020194(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  int8x16_t v3 = (void *)a1[6];
  uint64_t v4 = a1[7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  int v5[2] = sub_100020250;
  v5[3] = &unk_100035BA8;
  void v5[4] = a1[8];
  id v6 = v3;
  [v1 search:v2 token:v6 criteria:v4 resumeAt:0 maxData:0x10000 maxDelay:0 initialCredits:0.5 requestID:-1 reply:v5];
}

void sub_100020250(uint64_t a1, int a2)
{
  uint64_t v4 = logForCSLogCategoryDefault();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100026B14();
    }

    id v5 = [*(id *)(a1 + 32) serviceClient];
    [v5 LISCDropUpdateHandlerForInterestedItem:*(void *)(a1 + 40)];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "startResult: %d", (uint8_t *)v6, 8u);
  }
}

void sub_10002066C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volumeSyncConnection];
  int8x16_t v3 = *(void **)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  int v4[2] = sub_100020714;
  v4[3] = &unk_100035BF8;
  id v5 = v3;
  [v2 abortSearch:v5 requestID:-1 reply:v4];
}

void sub_100020714(uint64_t a1, int a2)
{
  uint64_t v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "complete (%d) cancelWithToken: %@", (uint8_t *)v6, 0x12u);
  }
}

void sub_100020958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_10002097C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  int v4[2] = sub_1000209F8;
  v4[3] = &unk_100035C20;
  long long v5 = *(_OWORD *)(a1 + 48);
  return [v2 parentsAndAttributesForItemsByID:v1 requestID:-1 reply:v4];
}

void sub_1000209F8(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  __int16 v7 = v6;
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    uint64_t v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100026B7C();
    }
  }
  else if ([v6 count])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 2;
  }
}

uint64_t sub_1000216D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000216E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100021700(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100021728(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_10002173C(uint64_t a1)
{
  return *(void *)(a1 + 232) + 240;
}

double sub_100021748(_OWORD *a1)
{
  double result = 0.0;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

double sub_100021770(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 2++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 232) = 1;
  *(unsigned char *)(a1 + 240) = 0;
  return result;
}

void *sub_1000217A4(uint64_t a1, unsigned int a2, size_t a3, void *__src)
{
  if ((a2 & 0x80000000) != 0) {
    sub_100026BE4();
  }
  if (a2 <= 0xF && a3 <= 8)
  {
    uint64_t v4 = (unint64_t *)(a1 + 232);
    long long v5 = (unsigned char *)(a1 + *(void *)(a1 + 232) + 240);
LABEL_8:
    unsigned char *v5 = (a3 - 1) | (8 * a2);
    id v6 = v5 + 1;
    uint64_t v7 = 1;
    goto LABEL_10;
  }
  if (a2 - 32 < 0xFFFFFFE8 || a3 >= 0x801) {
    sub_100026C68();
  }
  uint64_t v4 = (unint64_t *)(a1 + 232);
  long long v5 = (unsigned char *)(a1 + *(void *)(a1 + 232) + 240);
  if (a2 <= 0xF) {
    goto LABEL_8;
  }
  unsigned char *v5 = (8 * a2) | ((unsigned __int16)(a3 - 1) >> 8) | 0x80;
  v5[1] = a3 - 1;
  id v6 = v5 + 2;
  uint64_t v7 = 2;
LABEL_10:
  unint64_t v8 = v7 + a3 + *v4;
  unint64_t *v4 = v8;
  if (v8 > 0x1000) {
    sub_100026C10();
  }
  int v9 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v9 + 1;
  if (v9 >= 8) {
    sub_100026C3C();
  }
  uint64_t v10 = a1 + 24 * v9;
  *(_DWORD *)(v10 + 40) = a2;
  *(void *)(v10 + 48) = a3;
  *(_DWORD *)(v10 + 56) = v6 - a1 - 240;

  return memcpy(v6, __src, a3);
}

uint64_t sub_1000218B0(uint64_t a1, int a2)
{
  return a1 + *(unsigned int *)(a1 + 24 * a2 + 56) + 240;
}

uint64_t sub_100021F20(uint64_t a1, int a2)
{
  uint64_t v2 = 0;
  while (*(_DWORD *)(a1 + 4 * v2) != a2)
  {
    if (++v2 == 4)
    {
      *(_DWORD *)(a1 + 12) = *(_DWORD *)(a1 + 8);
      *(void *)(a1 + 4) = *(void *)a1;
      uint64_t v2 = 0xFFFFFFFFLL;
      goto LABEL_8;
    }
  }
  a2 = *(_DWORD *)(a1 + 4 * v2);
  if (v2)
  {
    unint64_t v3 = v2;
    do
    {
      BOOL v4 = v3 > 1;
      *(_DWORD *)(a1 + 4 * v3) = *(_DWORD *)(a1 + 4 * (v3 - 1));
      --v3;
    }
    while (v4);
  }
LABEL_8:
  *(_DWORD *)a1 = a2;
  return v2;
}

uint64_t sub_100022120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_OWORD *)(a4 + 208) = 0u;
  *(_OWORD *)(a4 + 2++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
  *(_OWORD *)(a4 + 176) = 0u;
  *(_OWORD *)(a4 + 192) = 0u;
  *(_OWORD *)(a4 + 144) = 0u;
  *(_OWORD *)(a4 + 160) = 0u;
  *(_OWORD *)(a4 + 112) = 0u;
  *(_OWORD *)(a4 + 128) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_OWORD *)(a4 + 96) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  int v6 = *(_DWORD *)(a3 + 44);
  if (v6 <= 0)
  {
    uint64_t v13 = 0;
    while (1)
    {
      if (a2 == v13) {
        return 0;
      }
      unsigned int v14 = *(unsigned __int8 *)(a1 + v13);
      unsigned int v15 = v14 >> 6;
      if (v14 >> 6) {
        break;
      }
      *(_DWORD *)(a3 + 8) = 1;
      *(_DWORD *)(a3 + 44) = (v14 >> 4) + 1;
      *(void *)(a3 + 48) = v14 & 0xF;
      if (v14 <= 0xF)
      {
        *(void *)(a3 + 48) = v14 & 1;
        *(_DWORD *)(a3 + 8) = ((v14 >> 1) & 7) + 1;
      }
      *(_OWORD *)(a4 + 208) = 0uLL;
      *(_OWORD *)(a4 + 2++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0uLL;
      *(_OWORD *)(a4 + 176) = 0uLL;
      *(_OWORD *)(a4 + 192) = 0uLL;
      *(_OWORD *)(a4 + 144) = 0uLL;
      *(_OWORD *)(a4 + 160) = 0uLL;
      *(_OWORD *)(a4 + 112) = 0uLL;
      *(_OWORD *)(a4 + 128) = 0uLL;
      *(_OWORD *)(a4 + 80) = 0uLL;
      *(_OWORD *)(a4 + 96) = 0uLL;
      *(_OWORD *)(a4 + 48) = 0uLL;
      *(_OWORD *)(a4 + 64) = 0uLL;
      *(_OWORD *)(a4 + 16) = 0uLL;
      *(_OWORD *)(a4 + 32) = 0uLL;
      *(_OWORD *)a4 = 0uLL;
      ++v13;
      int v6 = *(_DWORD *)(a3 + 44);
      if (v6 > 0) {
        goto LABEL_2;
      }
    }
    if (v15 == 1)
    {
      uint64_t v17 = sub_10002266C((uint64_t *)a3, (unsigned __int8 *)(a1 + v13 + 1), ~v13 + a2, 0, v14, (int8x8_t *)a4);
      uint64_t v11 = v17;
      if (v17 >= 1)
      {
        uint64_t v11 = v17 + 1;
        *(_DWORD *)a4 = 1;
      }
    }
    else
    {
      if (v15 != 2)
      {
        *(_DWORD *)a4 = 0;
        int v18 = (unsigned char *)(a1 + v13 + 1);
        if ((v14 & 0x20) != 0)
        {
          if (a2 - 1 == v13) {
            sub_100026CC0();
          }
          int v22 = *v18;
          int v18 = (unsigned char *)(a1 + v13 + 2);
          size_t v20 = (v22 & 0xFFFFF0FF | ((v14 & 0xF) << 8)) + 1;
          *(void *)(a4 + 232) = v20;
          unint64_t v19 = a2 - v13 - 2;
          uint64_t v21 = 2;
        }
        else
        {
          unint64_t v19 = ~v13 + a2;
          size_t v20 = (v14 & 0x1F) + 1;
          *(void *)(a4 + 232) = v20;
          uint64_t v21 = 1;
        }
        if (v19 < v20) {
          sub_100026C94();
        }
        memcpy((void *)(a4 + 240), v18, v20);
        if (v20 < 2)
        {
          if (!*v18)
          {
            *(void *)(a3 + 48) = 0;
            *(_OWORD *)(a3 + 16) = 0u;
            *(_OWORD *)(a3 + 32) = 0u;
            *(_OWORD *)a3 = 0u;
          }
        }
        else if ((sub_1000228F0(a4) & 0x80000000) != 0)
        {
          return -1;
        }
        return *(void *)(a4 + 232) + v21;
      }
      uint64_t v16 = sub_10002266C((uint64_t *)a3, (unsigned __int8 *)(a1 + v13 + 1), ~v13 + a2, 1, v14, (int8x8_t *)a4);
      uint64_t v11 = v16;
      if (v16 >= 1)
      {
        uint64_t v11 = v16 + 1;
        *(_DWORD *)a4 = 1;
        if (*(void *)(a4 + 232) >= 2uLL && (int)sub_1000228F0(a4) < 0) {
          return -1;
        }
      }
    }
  }
  else
  {
LABEL_2:
    *(_DWORD *)a4 = 1;
    int v7 = *(_DWORD *)(a3 + 12);
    uint64_t v8 = *(void *)a3 + *(int *)(a3 + 8);
    *(void *)a3 = v8;
    *(void *)(a4 + 8) = v8;
    *(_DWORD *)(a4 + 16) = v7;
    int v9 = v6 - 1;
    BOOL v10 = (*(void *)(a3 + 48) & (1 << v9)) != 0;
    *(_DWORD *)(a4 + 20) = *(_DWORD *)(a3 + 28);
    *(_DWORD *)(a4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v10;
    *(_DWORD *)(a4 + 28) = 0;
    *(void *)(a4 + 232) = 0;
    *(_DWORD *)(a3 + 44) = v9;
    return v9 == 0;
  }
  return v11;
}

uint64_t sub_100022484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = __chkstk_darwin(a1, a2, a3, a4, a5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = v5;
  bzero(v17, 0x10F0uLL);
  int v13 = sub_100022120(v12, v11, v9, (uint64_t)v17);
  if (v13 != 0xFFFFFFFFLL)
  {
    (*(void (**)(uint64_t, unsigned char *))(v7 + 16))(v7, v17);
    int v14 = *(_DWORD *)(v9 + 44);
    if ((v13 != 0) != (v14 == 0)) {
      return -99;
    }
    if (v14 >= 1)
    {
      do
      {
        int v16 = sub_100022120(v12, 0, v9, (uint64_t)v17);
        int v13 = v16;
        if (v16 == 1)
        {
          if (*(_DWORD *)(v9 + 44)) {
            goto LABEL_14;
          }
        }
        else if (v16 || !*(_DWORD *)(v9 + 44))
        {
LABEL_14:
          sub_100026CEC();
        }
        (*(void (**)(uint64_t, unsigned char *))(v7 + 16))(v7, v17);
      }
      while (*(int *)(v9 + 44) > 0);
    }
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  return v13;
}

uint64_t sub_1000225F8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      LODWORD(result) = (*(uint64_t (**)(void))(result + 16))();
      if (result == 1)
      {
        [*(id *)(a1 + 32) pushCommand:a2 block:0];
        return 1;
      }
      else
      {
        return (int)result;
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) flushWithBlock:0];
    return 0;
  }
  return result;
}

uint64_t sub_10002266C(uint64_t *a1, unsigned __int8 *a2, unint64_t a3, int a4, unsigned int a5, int8x8_t *a6)
{
  unint64_t v8 = 3;
  if (!a4) {
    unint64_t v8 = 1;
  }
  if (v8 > a3) {
    return -1;
  }
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  int v14 = a2 + 1;
  unint64_t v13 = *a2;
  unint64_t v15 = v13 >> 6;
  unsigned int v16 = a5 & 3;
  uint64_t v17 = ((1 << (a5 & 3)) + 1);
  if ((v13 >> 6) != 3)
  {
    unsigned int v16 = 0;
    uint64_t v17 = 1;
  }
  if (v15 == 2) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v16;
  }
  uint64_t v19 = (v13 >> 3) & 7;
  if (v15 == 2) {
    uint64_t v17 = v13 >> 6;
  }
  int v20 = v13 & 7;
  unint64_t v21 = v17 + dword_10002BE70[v19] + dword_10002BE70[v13 & 7];
  if (a4)
  {
    unint64_t v22 = a2[1];
    if ((char)a2[1] < 0)
    {
      int v14 = a2 + 3;
      unint64_t v22 = a2[2] | ((v22 & 0xF) << 8);
      unint64_t v23 = v21 + 2;
    }
    else
    {
      int v14 = a2 + 2;
      unint64_t v23 = v21 + 1;
    }
    size_t v24 = v22 + 1;
    unint64_t v21 = v22 + 1 + v23;
  }
  else
  {
    size_t v24 = 0;
  }
  uint64_t result = -1;
  if (v21 <= a3 && (v21 & 0x8000000000000000) == 0)
  {
    switch((int)v15)
    {
      case 1:
        uint64_t v25 = *a1 + (a5 & 0x1F) + 24;
        goto LABEL_26;
      case 2:
        int v26 = *v14++;
        *a1 = *a1 + (v26 & 0xFFFFF0FF | ((a5 & 0xF) << 8)) - 512;
        unsigned int v27 = (a5 >> 4) & 3;
        goto LABEL_27;
      case 3:
        int8x8_t v36 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a5), (uint32x2_t)0xFFFFFFFEFFFFFFFCLL), (int8x8_t)0x300000003);
        switch(v18)
        {
          case 1:
            unsigned int v30 = *(unsigned __int16 *)v14;
            v14 += 2;
            uint64_t v29 = v30 + *a1 - 0x4000;
            break;
          case 2:
            unsigned int v31 = *(_DWORD *)v14;
            v14 += 4;
            uint64_t v29 = v31;
            break;
          case 3:
            uint64_t v32 = *(void *)v14;
            v14 += 8;
            uint64_t v29 = v32;
            break;
          default:
            unsigned int v28 = *v14++;
            uint64_t v29 = v28 + *a1 - 64;
            break;
        }
        *a1 = v29;
        goto LABEL_32;
      default:
        uint64_t v25 = *a1 + (a5 & 0x1F) - 8;
LABEL_26:
        *a1 = v25;
        unsigned int v27 = (a5 >> 5) & 1;
LABEL_27:
        int8x8_t v36 = (int8x8_t)v27;
LABEL_32:
        int v38 = 0;
        id v33 = &v14[sub_1000229B4(v14, v19, (uint64_t)a1 + 12, &v38)];
        int v37 = 0;
        uint64_t v34 = sub_1000229B4(v33, v20, (uint64_t)a1 + 28, &v37);
        a6->i32[0] = 1;
        a6[1] = (int8x8_t)*a1;
        int v35 = v37;
        a6[2].i32[0] = v38;
        a6[2].i32[1] = v35;
        a6[3] = v36;
        a6[29] = (int8x8_t)v24;
        if (v24) {
          memcpy(&a6[30], &v33[v34], v24);
        }
        uint64_t result = v21;
        break;
    }
  }
  return result;
}

uint64_t sub_1000228F0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 232);
  if (v1 < 2)
  {
    LODWORD(v2) = 0;
    unsigned int v11 = 0;
  }
  else
  {
    unint64_t v2 = 0;
    unint64_t v3 = (_DWORD *)(a1 + 56);
    BOOL v4 = (char *)(a1 + 240);
    while (1)
    {
      uint64_t v5 = (unsigned __int8 *)(v4 + 1);
      unsigned int v6 = *v4;
      if (*v4 < 0)
      {
        int v7 = (v6 >> 3) | 0x10;
        uint64_t v5 = (unsigned __int8 *)(v4 + 2);
        unsigned int v8 = (v4[1] | ((v6 & 7) << 8)) + 1;
        v1 -= 2;
      }
      else
      {
        --v1;
        int v7 = (v6 >> 3) & 0xF;
        unsigned int v8 = (v6 & 7) + 1;
      }
      if (v1 < v8) {
        break;
      }
      *(v3 - 4) = v7;
      *((void *)v3 - 1) = v8;
      _DWORD *v3 = v5 - (a1 + 240);
      v3 += 6;
      int v9 = v2 + 1;
      v1 -= v8;
      BOOL v4 = (char *)&v5[v8];
      if (v1 < 2 || v2++ >= 7)
      {
        unsigned int v11 = 0;
        LODWORD(v2) = v9;
        goto LABEL_15;
      }
    }
    unsigned int v11 = -1;
  }
LABEL_15:
  if (v1) {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v12 = v11;
  }
  *(_DWORD *)(a1 + 32) = v2;
  return v12;
}

uint64_t sub_1000229B4(unsigned char *a1, int a2, uint64_t a3, int *a4)
{
  if (a2 > 3)
  {
    switch(a2)
    {
      case 4:
        int v4 = *a1;
        if (!*a1) {
          int v4 = -2;
        }
        goto LABEL_12;
      case 5:
        int v4 = *a1 | 0x100;
LABEL_12:
        uint64_t result = 1;
        break;
      case 6:
        int v4 = *(unsigned __int16 *)a1;
        uint64_t result = 2;
        break;
      case 7:
        int v4 = *(_DWORD *)a1;
        uint64_t result = 4;
        break;
      default:
        sub_100026D18();
    }
    *(_DWORD *)(a3 + 12) = *(_DWORD *)(a3 + 8);
    *(void *)(a3 + 4) = *(void *)a3;
  }
  else
  {
    int v4 = *(_DWORD *)(a3 + 4 * a2);
    if (a2 >= 1)
    {
      unint64_t v5 = a2;
      do
      {
        BOOL v6 = v5 > 1;
        *(_DWORD *)(a3 + 4 * v5) = *(_DWORD *)(a3 + 4 * (v5 - 1));
        --v5;
      }
      while (v6);
    }
    uint64_t result = 0;
  }
  *(_DWORD *)a3 = v4;
  *a4 = v4;
  return result;
}

uint64_t sub_100022A8C(uint64_t result)
{
  if (result) {
    return CSIsInterestingPath();
  }
  return result;
}

uint64_t sub_100022A98(void *a1)
{
  id v1 = a1;
  if ([v1 length]
    && ([v1 characterAtIndex:0] & 0xFFFE) != 0x2E
    && [v1 UTF8String])
  {
    uint64_t v2 = CSIsInterestingPath();
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id sub_100022B04(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  id v10 = [v7 length];
  unsigned int v11 = 0;
  if (!a3 || !v10) {
    goto LABEL_65;
  }
  if ((*(void *)(a3 + 8) & 1) == 0 || (int v12 = *(_DWORD *)(a3 + 24), (v12 - 3) < 0xFFFFFFFE))
  {
    unsigned int v11 = 0;
    goto LABEL_65;
  }
  uint64_t v125 = *(void **)(a3 + 8);
  uint64_t v13 = (uint64_t)[v9 count];
  int v119 = &v116;
  uint64_t v118 = v13 + 32;
  size_t v14 = 8 * (v13 + 32);
  __chkstk_darwin(v13, v15, v16, v17, v18);
  uint64_t v19 = (void **)((char *)&v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v19, v14);
  __chkstk_darwin(v20, v21, v22, v23, v24);
  int v126 = v19;
  bzero(v19, v14);
  uint64_t v25 = (char *)[v8 rangeOfString:@"/" options:6];
  LODWORD(v116) = v12;
  if (v25 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v26 = v8;
  }
  else
  {
    id v26 = [v8 substringFromIndex:v25 + 1];
  }
  unsigned int v27 = v26;
  id v28 = objc_msgSend(v26, "rangeOfString:options:", @".", 6, v116);
  if (v28 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v30 = v27;
    int v123 = 0;
    id v124 = v30;
    unsigned int v31 = v27;
  }
  else
  {
    id v32 = v28;
    uint64_t v33 = v29;
    id v124 = [v27 substringToIndex:v28];
    unint64_t v34 = (unint64_t)v32 + v33;
    unsigned int v31 = v27;
    if (v34 >= (unint64_t)[v27 length])
    {
      int v123 = 0;
    }
    else
    {
      int v123 = [v27 substringFromIndex:v34];
    }
  }
  int v35 = *v19;
  const char *v19 = @":MD:kMDItemPathFromMountPoint";

  int8x8_t v36 = v126;
  objc_storeStrong(v126, a2);
  int v37 = v19[1];
  v19[1] = @":MD:kMDItemPath";

  uint64_t v38 = [v7 stringByAppendingFormat:@"/%@", v8];
  id v39 = v36[1];
  v36[1] = (id)v38;

  if (((unsigned __int16)v125 & 0x100) != 0)
  {
    int v41 = v19[2];
    v19[2] = @":MD:_kMDItemOID";

    uint64_t v42 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a3 + 64)];
    id v43 = v36[2];
    v36[2] = (id)v42;

    uint64_t v40 = 3;
  }
  else
  {
    uint64_t v40 = 2;
  }
  id v120 = v8;
  id v122 = v9;
  if (((unsigned __int16)v125 & 0x200) != 0)
  {
    unsigned int v45 = v19[v40];
    v19[v40] = @":MD:_kMDItemOIDParent";

    __int16 v46 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a3 + 72)];
    __int16 v44 = v126;
    id v47 = v126[v40];
    v126[v40] = v46;

    ++v40;
  }
  else
  {
    __int16 v44 = v126;
  }
  long long v48 = v19[v40];
  v19[v40] = @"_kMDItemFileName";

  objc_storeStrong(&v44[v40], v31);
  long long v49 = v19[v40 + 1];
  v19[v40 + 1] = @"kMDItemAlternateNames";

  id v117 = v31;
  objc_storeStrong(&v44[v40 + 1], v31);
  uint64_t v50 = 8 * v40 + 16;
  long long v51 = *(void **)((char *)v19 + v50);
  *(void **)((char *)v19 + v50) = @"kMDItemDisplayName";

  objc_storeStrong((id *)((char *)v44 + v50), v124);
  uint64_t v52 = v40 + 3;
  __int16 v53 = (__int16)v125;
  if ((v125 & 8) != 0)
  {
    id v54 = v19[v52];
    v19[v52] = @"_kMDItemOwnerUserID";

    uint64_t v55 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a3 + 36)];
    id v56 = v44[v52];
    v44[v52] = (id)v55;

    uint64_t v52 = v40 + 4;
  }
  int v57 = v116;
  if ((v53 & 0x10) != 0)
  {
    long long v58 = v19[v52];
    v19[v52] = @"_kMDItemOwnerGroupID";

    uint64_t v59 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a3 + 40)];
    id v60 = v44[v52];
    v44[v52] = (id)v59;

    ++v52;
  }
  id v121 = v7;
  if ((v53 & 0x800) != 0)
  {
    long long v61 = +[NSDate dateWithTimeIntervalSince1970:(double)*(uint64_t *)(a3 + 112)];
    uint64_t v62 = v52;
    long long v63 = v19[v52];
    v19[v52] = @"_kMDItemContentChangeDate";

    objc_storeStrong(&v44[v52], v61);
    long long v64 = v19[v52 + 1];
    v19[v62 + 1] = @"kMDItemContentModificationDate";

    id v65 = v44[v52 + 1];
    v44[v62 + 1] = v61;
    id v66 = v61;

    __int16 v53 = (__int16)v125;
    +[NSDate timeIntervalSinceReferenceDate];
    double v68 = v67;
    [v66 timeIntervalSinceReferenceDate];
    if (v69 <= v68) {
      double v68 = v69;
    }
    long long v70 = v19[v62 + 2];
    v19[v62 + 2] = @"com_apple_metadata_modtime";

    uint64_t v71 = +[NSNumber numberWithDouble:v68];
    id v72 = v44[v62 + 2];
    v44[v62 + 2] = (id)v71;

    v52 += 3;
  }
  if ((v53 & 0x1000) != 0)
  {
    int v73 = +[NSDate dateWithTimeIntervalSince1970:(double)*(uint64_t *)(a3 + 112)];
    int v74 = v19[v52];
    v19[v52] = @"_kMDItemCreationDate";

    objc_storeStrong(&v44[v52], v73);
    id v75 = v19[v52 + 1];
    v19[v52 + 1] = @"kMDItemContentCreationDate";

    LOBYTE(v53) = (_BYTE)v125;
    objc_storeStrong(&v44[v52 + 1], v73);
    uint64_t v76 = 8 * v52 + 16;
    id v77 = *(void **)((char *)v19 + v76);
    *(void **)((char *)v19 + v76) = @"kMDItemDateAdded";

    uint64_t v78 = *(id *)((char *)v44 + v76);
    *(id *)((char *)v44 + v76) = v73;

    v52 += 3;
  }
  if (v57 == 1)
  {
    if ((v53 & 0x40) == 0)
    {
      int v79 = 0;
      goto LABEL_35;
    }
    v80 = v19[v52];
    v19[v52] = @"kMDItemPhysicalSize";

    uint64_t v81 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a3 + 48)];
    id v82 = v44[v52];
    v44[v52] = (id)v81;

    uint64_t v83 = 8 * v52 + 8;
    int v84 = *(void **)((char *)v19 + v83);
    *(void **)((char *)v19 + v83) = @"kMDItemLogicalSize";

    uint64_t v85 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a3 + 48)];
    uint64_t v86 = *(id *)((char *)v44 + v83);
    *(id *)((char *)v44 + v83) = (id)v85;

    v52 += 2;
  }
  int v79 = sub_100023400(v123, v57 != 1);
LABEL_35:
  id v87 = [v79 length];
  if (v87)
  {
    int v92 = v19[v52];
    v19[v52] = @"kMDItemContentType";

    objc_storeStrong(&v44[v52], v79);
    uint64_t v93 = v52 + 1;
    int v94 = v79;
    if ([(__CFString *)v94 length])
    {
      v95 = (__CFString *)sub_100003200(v94);
      if ([(__CFString *)v95 count])
      {
LABEL_40:

        if ([(__CFString *)v95 count])
        {
          v96 = v19[v93];
          v19[v93] = @"kMDItemContentTypeTree";

          objc_storeStrong(&v44[v93], v95);
          uint64_t v93 = v52 + 2;
        }

        uint64_t v52 = v93;
        goto LABEL_43;
      }
    }
    v95 = 0;
    goto LABEL_40;
  }
LABEL_43:
  uint64_t v97 = v13;
  if (v13)
  {
    uint64_t v125 = v79;
    uint64_t v116 = (uint64_t)&v116;
    __chkstk_darwin(v87, v88, v89, v90, v91);
    v98 = (void **)((char *)&v116 - ((v97 * 8 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v98, 8 * v13);
    __chkstk_darwin(v99, v100, v101, v102, v103);
    int v104 = (const __CFNull **)v98;
    bzero(v98, 8 * v13);
    [v122 getObjects:v98 andKeys:v98 count:v13];
    if (v13 >= 1)
    {
      do
      {
        CFNullRef v105 = *v104;
        if (*v98) {
          BOOL v106 = v105 == 0;
        }
        else {
          BOOL v106 = 1;
        }
        if (!v106)
        {
          v107 = sub_100023910(*v98, v105);
          if (v107)
          {
            unint64_t v108 = @":EA:kMDItemFavoriteRank";
            if (([*v98 isEqualToString:off_10003CC88] & 1) != 0
              || (unint64_t v108 = @":EA:kMDItemLastUsedDate",
                  ([*v98 isEqualToString:off_10003CC90] & 1) != 0)
              || [*v98 hasPrefix:@"com.apple.metadata:"]
              && ([*v98 substringFromIndex:objc_msgSend(@"com.apple.metadata:", "length")],
                  uint64_t v109 = objc_claimAutoreleasedReturnValue(),
                  +[NSString stringWithFormat:@":EA:%@", v109],
                  unint64_t v108 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                  v109,
                  v108))
            {
              v110 = v19[v52];
              v19[v52] = v108;
              int v111 = v108;

              __int16 v44 = v126;
              objc_storeStrong(&v126[v52++], v107);
            }
            else
            {
              __int16 v44 = v126;
            }
          }
        }
        ++v104;
        ++v98;
        --v13;
      }
      while (v13);
    }
    int v79 = v125;
  }
  unsigned int v11 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v19 count:v52];

  v112 = v44;
  id v8 = v120;
  id v9 = v122;
  if (v118)
  {
    uint64_t v113 = v112 + 31;
    uint64_t v114 = v97 * 8;
    do
    {

      v114 -= 8;
    }
    while (v114 != -256);
    do
    {

      --v97;
    }
    while (v97 != -32);
  }
  id v7 = v121;
LABEL_65:

  return v11;
}

id sub_100023400(void *a1, int a2)
{
  unint64_t v3 = a1;
  if (![(__CFString *)v3 length])
  {
LABEL_10:
    id v10 = (id *)&kUTTypeFolder;
    if (!a2) {
      id v10 = (id *)&kUTTypeItem;
    }
    id v7 = *v10;
    goto LABEL_13;
  }
  pthread_mutex_lock(&stru_10003CCA8);
  int v4 = (void *)qword_10003CE00;
  if (!qword_10003CE00)
  {
    uint64_t v5 = objc_opt_new();
    BOOL v6 = (void *)qword_10003CE00;
    qword_10003CE00 = v5;

    int v4 = (void *)qword_10003CE00;
  }
  id v7 = [v4 objectForKeyedSubscript:v3];
  pthread_mutex_unlock(&stru_10003CCA8);
  if (!v7)
  {
    id v8 = (CFStringRef *)&kUTTypeData;
    if (a2) {
      id v8 = (CFStringRef *)&kUTTypeDirectory;
    }
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v3, *v8);
    if (PreferredIdentifierForTag)
    {
      id v7 = PreferredIdentifierForTag;
      if (([(__CFString *)PreferredIdentifierForTag hasPrefix:@"dyn."] & 1) == 0)
      {
        pthread_mutex_lock(&stru_10003CCA8);
        [(id)qword_10003CE00 setObject:v7 forKeyedSubscript:v3];
        pthread_mutex_unlock(&stru_10003CCA8);
        goto LABEL_13;
      }
    }
    goto LABEL_10;
  }
LABEL_13:

  return v7;
}

unsigned char *sub_100023540(void *a1, uint64_t a2, unint64_t a3, void *a4, size_t a5)
{
  id v9 = a1;
  *(unsigned char *)(a3 + 1023) = 0;
  if (!a2)
  {
LABEL_21:
    id v10 = 0;
    goto LABEL_22;
  }
  __src = a4;
  size_t __n = a5;
  id v10 = (unsigned char *)(a3 + 1023);
  int v11 = -1;
  while (a2 != 2)
  {
    int v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a2, __src);
    uint64_t v13 = [v9 objectForKeyedSubscript:v12];

    if (!v13) {
      goto LABEL_21;
    }
    size_t v14 = [v13 objectForKeyedSubscript:@"attributes"];
    if (![v14 length]
      || (id v15 = v14, (v16 = [v15 bytes]) == 0)
      || (uint64_t v17 = v16, (~v16[2] & 0x300) != 0)
      || *((void *)v16 + 8) != a2)
    {

LABEL_20:
      goto LABEL_21;
    }
    uint64_t v18 = [v13 objectForKeyedSubscript:@"name"];
    uint64_t v19 = v18;
    if (!v18
      || (id v20 = v18,
          uint64_t v21 = (const char *)[v20 UTF8String],
          size_t v22 = strlen(v21),
          v10 -= v22,
          (unint64_t)v10 < a3)
      || (memcpy(v10, v21, v22), (a2 = *((void *)v17 + 9)) == 0))
    {
LABEL_19:

      goto LABEL_20;
    }
    if (__n || a2 != 2)
    {
      if ((unint64_t)--v10 < a3) {
        goto LABEL_19;
      }
      unsigned char *v10 = 47;
    }

    if (++v11 > 0x1FF) {
      goto LABEL_21;
    }
  }
  if (__n)
  {
    v10 -= __n;
    if ((unint64_t)v10 >= a3)
    {
      memcpy(v10, __src, __n);
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

unint64_t sub_10002371C(void *a1, unint64_t a2, unint64_t *a3, unint64_t a4, int *a5)
{
  id v9 = a1;
  if (a2 > 1)
  {
    if (a4)
    {
      *a3 = a2;
      a4 = 1;
    }
    if (a2 == 2)
    {
      if (a5)
      {
        int v10 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      a4 = a4;
      while (a2 != 2)
      {
        int v11 = +[NSNumber numberWithUnsignedLongLong:a2];
        int v12 = [v9 objectForKeyedSubscript:v11];

        if (!v12) {
          goto LABEL_18;
        }
        uint64_t v13 = [v12 objectForKeyedSubscript:@"attributes"];
        if (![v13 length]
          || (id v14 = v13, (v15 = [v14 bytes]) == 0)
          || (~*((_DWORD *)v15 + 2) & 0x300) != 0)
        {
          int v10 = 2;
LABEL_21:

          if (!a5) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        int v10 = 22;
        if (*((void *)v15 + 8) != a2 || a4 >= 0x1FF) {
          goto LABEL_21;
        }
        a2 = *((void *)v15 + 9);
        a3[a4] = a2;

        ++a4;
        if (!a2)
        {
LABEL_18:
          int v10 = 2;
          if (a5) {
            goto LABEL_22;
          }
          goto LABEL_23;
        }
      }
      int v10 = 0;
      if (a5) {
        goto LABEL_22;
      }
    }
  }
  else
  {
    a4 = 0;
    if (a5)
    {
      int v10 = 2;
LABEL_22:
      *a5 = v10;
    }
  }
LABEL_23:

  return a4;
}

id sub_100023898(void *a1, uint64_t a2)
{
  return [a1 containsObject:a2];
}

void sub_1000238A0(const __CFDictionary *a1, void *context)
{
}

uint64_t sub_1000238B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFNumberRef sub_1000238D4(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)(valuePtr != 0);
  }
  return result;
}

CFNullRef sub_100023910(void *a1, CFNullRef cf)
{
  CFNullRef v4 = kCFNull;
  CFNullRef result = cf;
  if (kCFNull == cf)
  {
LABEL_4:
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDataGetTypeID())
  {
    CFNullRef result = (CFNullRef)MDPropertyCopyDecodedValue();
    goto LABEL_4;
  }
LABEL_5:
  if (![a1 isEqualToString:@"com.apple.metadata:_kMDItemUserTags"]) {
    return 0;
  }
  if (qword_10003CE08 != -1) {
    dispatch_once(&qword_10003CE08, &stru_100035CB8);
  }
  uint64_t v34 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:qword_10003CE10 fromData:cf error:&v34];
  uint64_t v8 = v34;
  if (v34)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v8;
      __int16 v37 = 2112;
      uint64_t v38 = a1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Decoding error: %@ for %@", buf, 0x16u);
    }
    return v4;
  }
  id v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"v"), "isEqual:", &off_100036C38)) {
    return 0;
  }
  id v10 = [v9 objectForKeyedSubscript:@"t"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = (uint64_t)[v10 count];
  uint64_t v16 = v11;
  if (v11 > 99) {
    return 0;
  }
  uint64_t v17 = 8 * v11;
  __chkstk_darwin(v11, v12, v13, v14, v15);
  uint64_t v18 = (id *)((char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v18, 8 * v16);
  id v19 = objc_msgSend(v10, "getObjects:range:", v18, 0, v16);
  __chkstk_darwin(v19, v20, v21, v22, v23);
  uint64_t v24 = v18;
  bzero(v18, 8 * v16);
  if (v16 < 1) {
    return 0;
  }
  uint64_t v25 = 0;
  do
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v27 = *v18;
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      id v30 = *v18;
      goto LABEL_31;
    }
    id v28 = [*v18 count];
    if (v28 == (id)2)
    {
      [v27 objectAtIndexedSubscript:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      id v30 = [v27 objectAtIndexedSubscript:0];
      id v31 = [v27 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = [v31 intValue];
        if ((v32 - 1) <= 6)
        {
          id v29 = objc_msgSend(v30, "stringByAppendingFormat:", @"\n%d", v32);
LABEL_23:
          id v30 = v29;
        }
      }
      if (!v30) {
        goto LABEL_32;
      }
LABEL_31:
      v24[v25++] = v30;
      goto LABEL_32;
    }
    if (v28 == (id)1)
    {
      [v27 objectAtIndexedSubscript:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = [v27 objectAtIndexedSubscript:0];
        goto LABEL_23;
      }
    }
LABEL_32:
    ++v18;
    --v16;
  }
  while (v16);
  if (v25 > 0) {
    return (CFNullRef)[objc_alloc((Class)NSArray) initWithObjects:v24 count:v25];
  }
  return 0;
}

void sub_100023D18(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      objc_end_catch();
      JUMPOUT(0x100023CB4);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_100023D90(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  qword_10003CE10 = (uint64_t)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);
}

CFNullRef sub_100023E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = __chkstk_darwin(a1, a2, a3, a4, a5);
  id v7 = v6;
  id v9 = v8;
  int v10 = v5;
  uint64_t v11 = value;
  bzero(value, 0x1000uLL);
  ssize_t v12 = fgetxattr(v10, v9, value, 0x1000uLL, 0, 0);
  if (v12 == -1)
  {
    if (*__error() != 34) {
      return 0;
    }
    ssize_t v13 = fgetxattr(v10, v9, 0, 0, 0, 0);
    uint64_t v11 = (unsigned __int8 *)malloc_type_malloc(v13, 0x588B3D04uLL);
    ssize_t v12 = fgetxattr(v10, v9, v11, v13, 0, 0);
  }
  else
  {
    ssize_t v13 = v12;
  }
  CFNullRef v14 = 0;
  if (v13 >= 1 && v12 == v13)
  {
    if (((char)*v11 & 0x80000000) == 0)
    {
LABEL_8:
      CFNullRef v15 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v11, v13, kCFAllocatorNull);
      uint64_t v16 = (__CFString *)CFStringCreateWithCString(kCFAllocatorDefault, v9, 0x8000100u);
      CFNullRef v14 = sub_100023910(v16, v15);
      CFRelease(v15);
      CFRelease(v16);
      goto LABEL_9;
    }
    int v18 = *v11;
    if ((v18 - 241) >= 2)
    {
      if (v18 != 129) {
        goto LABEL_8;
      }
      if (v13 != 9) {
        goto LABEL_8;
      }
      CFNullRef v14 = CFDateCreate(kCFAllocatorDefault, *(CFAbsoluteTime *)(v11 + 1));
      if (!v14) {
        goto LABEL_8;
      }
    }
    else if (v7)
    {
      *id v7 = 1;
      CFNullRef v14 = CFDataCreate(kCFAllocatorDefault, v11, v13);
    }
    else
    {
      CFNullRef v14 = 0;
    }
  }
LABEL_9:
  if (v11 != value) {
    free(v11);
  }
  return v14;
}

CFMutableDictionaryRef sub_100024054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = __chkstk_darwin(a1, a2, a3, a4, a5);
  int v7 = v6;
  char v9 = v8;
  uint64_t v10 = v5;
  uint64_t v11 = namebuff;
  bzero(namebuff, 0x1000uLL);
  ssize_t v12 = flistxattr(v10, namebuff, 0x1000uLL, 0);
  if (v12 < 0)
  {
    if (*__error() != 34) {
      return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    ssize_t v13 = flistxattr(v10, 0, 0, 0);
    id v43 = (char *)malloc_type_malloc(v13, 0x87B0ECC2uLL);
    if (!v43) {
      return 0;
    }
    uint64_t v11 = v43;
    if (flistxattr(v10, v43, v13, 0) < 0) {
      return 0;
    }
  }
  else
  {
    ssize_t v13 = v12;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v13 >= 1)
  {
    int v45 = v7;
    __s1 = v11;
    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_10002BE90];
    id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v15, 0);

    id v47 = objc_alloc_init((Class)NSMutableArray);
    id v46 = objc_alloc_init((Class)NSMutableArray);
    if ((unint64_t)v13 >= 3)
    {
      uint64_t v17 = (uint64_t)__s1;
      do
      {
        if (!*(unsigned char *)v17) {
          break;
        }
        if (!strncmp((const char *)v17, "com.apple.metadata", 0x12uLL))
        {
          int v26 = *(unsigned __int8 *)(v17 + 18);
          LOBYTE(valuePtr) = 0;
          if (v26 == 58) {
            goto LABEL_20;
          }
          if (v26 == 46)
          {
            LOBYTE(valuePtr) = 1;
LABEL_20:
            CFNullRef v23 = sub_100023E24(v10, v17, (uint64_t)&valuePtr, v18, v19);
            if (!v23 || (_BYTE)valuePtr)
            {
              if ((_BYTE)valuePtr && !strncmp((const char *)v17, "com.apple.metadata:kMDLabel_", 0x1CuLL))
              {
                bzero(&value, 0x400uLL);
                snprintf((char *)&value, 0x400uLL, "%s.%s", "com.apple.metadata", (const char *)(v17 + 28));
                objc_msgSend(v46, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &value));
                [v47 addObject:v23];
              }
              if (!v23) {
                goto LABEL_47;
              }
            }
            else if ((v9 & 1) == 0)
            {
              CFStringRef v27 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(v17 + 19), 0x8000100u);
              if (v27)
              {
                CFStringRef v28 = v27;
                CFDictionaryAddValue(Mutable, v27, v23);
                CFRelease(v28);
              }
            }
LABEL_36:
            CFRelease(v23);
          }
        }
        else if ((v9 & 1) == 0)
        {
          if (!strcmp((const char *)v17, "com.apple.lastuseddate#PS"))
          {
            uint64_t value = 0;
            uint64_t v59 = 0;
            uint64_t v60 = 0;
            if (v10 == -1) {
              goto LABEL_46;
            }
            ssize_t v29 = fgetxattr(v10, "com.apple.lastuseddate#PS", &value, 0x18uLL, 0, 0);
            if ((v29 & 0x8000000000000000) == 0)
            {
              if (v29 != 16)
              {
LABEL_46:
                *__error() = 22;
                goto LABEL_47;
              }
              if (value)
              {
                CFNullRef v23 = CFDateCreate(kCFAllocatorDefault, (double)v59 / 1000000000.0 + (double)value - kCFAbsoluteTimeIntervalSince1970);
                uint64_t v24 = Mutable;
                CFStringRef v25 = @"kMDItemLastUsedDate";
                goto LABEL_35;
              }
            }
          }
          else if (!strcmp((const char *)v17, "com.apple.TextEncoding"))
          {
            p_uint64_t value = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v10, (const char *)v17, &value, 0x400uLL, 0, 0) > 0) {
              goto LABEL_40;
            }
            if (*__error() == 34)
            {
              ssize_t v31 = fgetxattr(v10, (const char *)v17, 0, 0, 0, 0);
              p_uint64_t value = (uint64_t *)malloc_type_calloc(1uLL, v31 + 1, 0x53B656AAuLL);
              fgetxattr(v10, (const char *)v17, p_value, v31, 0, 0);
LABEL_40:
              id v32 = strchr((char *)p_value, 59);
              if (v32)
              {
                CFStringEncoding encoding = 0;
                if (sscanf(v32 + 1, "%u", &encoding) == 1)
                {
                  if (CFStringIsEncodingAvailable(encoding))
                  {
                    CFStringEncoding valuePtr = encoding;
                    CFNumberRef v33 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
                    CFDictionarySetValue(Mutable, @"--_kMDItemTextEncodingHint", v33);
                    CFRelease(v33);
                  }
                }
              }
              if (p_value != &value) {
                free(p_value);
              }
            }
          }
          else if (!strncmp((const char *)v17, "com.apple.SharedWithYou", 0x17uLL))
          {
            uint64_t v20 = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v10, (const char *)v17, &value, 0x400uLL, 0, 0) <= 0)
            {
              if (*__error() != 34) {
                goto LABEL_47;
              }
              ssize_t v21 = fgetxattr(v10, (const char *)v17, 0, 0, 0, 0);
              uint64_t v20 = (uint64_t *)malloc_type_calloc(1uLL, v21 + 1, 0xFCE0A9DFuLL);
              fgetxattr(v10, (const char *)v17, v20, v21, 0, 0);
            }
            CFStringRef v22 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v20, 0x8000100u);
            if (v22)
            {
              CFNullRef v23 = (CFNullRef)v22;
              uint64_t v24 = Mutable;
              CFStringRef v25 = @"com.apple.SharedWithYou";
LABEL_35:
              CFDictionarySetValue(v24, v25, v23);
              goto LABEL_36;
            }
          }
        }
LABEL_47:
        size_t v34 = strlen((const char *)v17) + 1;
        v17 += v34;
        v13 -= v34;
      }
      while (v13 > 2);
    }
    if ([v46 count])
    {
      if (v45)
      {
        int v35 = (const void *)_MDPlistContainerCreateMutable();
        _MDPlistContainerBeginContainer();
        _MDPlistContainerBeginDictionary();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerAddCString();
        _MDPlistContainerBeginArray();
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v36 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v37; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v50 != v38) {
                objc_enumerationMutation(v16);
              }
              [*(id *)(*((void *)&v49 + 1) + 8 * i) UUIDString];
              _MDPlistContainerAddObject();
            }
            id v37 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v37);
        }
        _MDPlistContainerEndArray();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerEndDictionary();
        _MDPlistContainerEndContainer();
        id v40 = objc_alloc((Class)NSData);
        uint64_t Bytes = _MDPlistContainerGetBytes();
        id v42 = [v40 initWithBytes:Bytes length:_MDPlistContainerGetLength()];
        CFDictionarySetValue(Mutable, @"_kMDItemEncryptedData", v42);

        CFRelease(v35);
      }
      else
      {
        v55[0] = @"xids";
        v55[1] = @"uuids";
        v56[0] = v46;
        v56[1] = v16;
        v55[2] = @"datas";
        v56[2] = v47;
        CFDictionarySetValue(Mutable, @"_kMDItemEncryptedDataDictionary", +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3]);
      }
    }

    if (__s1 != namebuff) {
      free(__s1);
    }
  }
  return Mutable;
}

CFMutableDictionaryRef sub_10002487C(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = open(a1, 33024);
  if (v5 == -1) {
    return 0;
  }
  int v8 = v5;
  CFMutableDictionaryRef v9 = sub_100024054(v5, a2, a3, v6, v7);
  close(v8);
  return v9;
}

uint64_t sub_1000248E0(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    SI_PersistentIDStoreGetTypeID();
    uint64_t Instance = _CFRuntimeCreateInstance();
    *(void *)(Instance + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = malloc_type_malloc(0x450uLL, 0x100004082453793uLL);
    *(void *)(Instance + 16) = v1;
    *(unsigned char *)(Instance + 160) = 0;
    *(void *)(Instance + 32) = sub_100024A14;
    *(void *)(Instance + 40) = sub_100024A58;
    *(void *)(Instance + 48) = sub_100024AB4;
    *(void *)(Instance + 56) = sub_100024B10;
    *(void *)(Instance + 64) = sub_100024C74;
    *(void *)(Instance + 80) = sub_100024D1C;
    *(void *)(Instance + 128) = sub_100024D2C;
    *(void *)(Instance + 136) = sub_100024D7C;
    *(void *)(Instance + 144) = sub_100024DC8;
    *(void *)(Instance + 152) = sub_100024DD0;
    *(void *)(Instance + 184) = sub_100024DD8;
  }
  else
  {
    uint64_t Instance = 0;
  }

  return Instance;
}

void sub_100024A14(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  id v1 = self;
}

id sub_100024A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 16);
  int v7 = 0;
  id v4 = [v3 pathFromOID:a2 pathBuffer:a3 pathBufferSize:1024 fullPath:1 error:&v7];
  int v5 = v7;
  if (v7) {
    *__error() = v5;
  }
  return v4;
}

id sub_100024AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 16);
  int v7 = 0;
  id v4 = [v3 pathFromOID:a2 pathBuffer:a3 pathBufferSize:1024 fullPath:1 error:&v7];
  int v5 = v7;
  if (v7) {
    *__error() = v5;
  }
  return v4;
}

const char *sub_100024B10(uint64_t a1, const char *st_ino)
{
  id v3 = *(id *)(a1 + 16);
  id v4 = v3;
  memset(&v10, 0, sizeof(v10));
  if (st_ino)
  {
    int v5 = (const char *)objc_msgSend(v3, "rootPathUTF8String", *(void *)&v10.st_dev);
    size_t v6 = (size_t)[v4 rootPathUTF8StringLength];
    if (!strncmp(st_ino, v5, v6))
    {
      if (!stat(st_ino, &v10))
      {
        st_ino = (const char *)v10.st_ino;
        goto LABEL_10;
      }
    }
    else if (*st_ino != 47)
    {
      size_t v7 = strlen(st_ino);
      if (v6 + v7 + 2 <= 0x3FF)
      {
        size_t v8 = v7;
        bzero(v11, 0x400uLL);
        __memcpy_chk();
        v11[v6] = 47;
        memcpy(&v11[v6 + 1], st_ino, v8);
        if (stat(st_ino, &v10)) {
          st_ino = 0;
        }
        else {
          st_ino = (const char *)v10.st_ino;
        }
        goto LABEL_10;
      }
    }
    st_ino = 0;
  }
LABEL_10:

  return st_ino;
}

id sub_100024C74(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = *(id *)(a1 + 16);
  stat v10 = sub_100024B10(a1, a2);
  if (v10)
  {
    int v15 = 0;
    id v11 = [v9 oidPath:a4 fromOID:v10 includeLeaf:a5 error:&v15];
    int v12 = v15;
    if (v15)
    {
      id v13 = 0;
      *__error() = v12;
    }
    else
    {
      id v13 = v11;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id sub_100024D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 16), "buildCheckOIDs:oidCount:accessDenied:canceled:", a3, a2, a4);
}

id sub_100024D2C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 16);
  int v6 = 0;
  id v3 = [v2 parentFromOID:a2 error:&v6];
  int v4 = v6;
  if (v6) {
    *__error() = v4;
  }
  return v3;
}

uint64_t sub_100024D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  size_t v7 = *(void **)(a1 + 16);
  unsigned int v10 = 0;
  unsigned int v8 = [v7 oidPath:a3 fromOID:a2 includeLeaf:a4 error:&v10];
  if (a6) {
    *a6 = v8;
  }
  return v10;
}

uint64_t sub_100024DC8()
{
  return 0;
}

uint64_t sub_100024DD0()
{
  return 1;
}

uint64_t sub_100024DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  id v9 = *(id *)(a1 + 16);
  unsigned int v10 = +[NSString stringWithUTF8String:a4];
  id v11 = [v9 identifierForItem:a3 name:v10 parentID:a2];

  if (v11 && CFStringGetCString(v11, a5, 1024, 0x8000100u)) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 2;
  }

  return v12;
}

uint64_t sub_100024E94(uint64_t result, int a2, uint64_t a3)
{
  if (a2 <= 1043)
  {
    uint64_t v5 = result;
    bzero(&v46, 0x415uLL);
    if (!a2) {
      goto LABEL_13;
    }
    uint64_t v13 = 0;
    do
    {
      *(&v46 + v13) = byte_10002BEA0[*(unsigned __int8 *)(v5 + v13)];
      ++v13;
    }
    while (a2 != v13);
    *(&v46 + a2) = 0;
    if (a2 >= 2 && v46 - 1 <= 3)
    {
      switch(v46)
      {
        case 1u:
          uint64_t v14 = 1;
          if (v47 == 2) {
            uint64_t v14 = 2;
          }
          unsigned int v15 = 4 * (v47 == 2);
          if (*(&v46 + (a2 - 1)) != 1 || *(&v46 + (a2 - 2)) != 1)
          {
            uint64_t v27 = v14;
            goto LABEL_44;
          }
          uint64_t v16 = 1;
          break;
        case 2u:
          unsigned int v15 = 16;
          goto LABEL_43;
        case 3u:
          unsigned int v15 = 32;
          goto LABEL_43;
        case 4u:
          unsigned int v15 = 64;
          goto LABEL_43;
        default:
          unsigned int v15 = 0;
LABEL_43:
          uint64_t v27 = 1;
LABEL_44:
          uint64_t v28 = v27 + 1;
          uint64_t v16 = *(&v46 + v27);
          if ((char)*(&v46 + v27) < 0)
          {
            uint64_t v14 = v27 + 2;
            int v29 = (char)*(&v46 + v28);
            int v30 = *(&v46 + v28);
            if (v29 < 0)
            {
              uint64_t v31 = v27 + 3;
              int v32 = (char)*(&v46 + v14);
              char v33 = v32;
              if (v32 < 0)
              {
                uint64_t v14 = v27 | 4;
                int v35 = (char)*(&v46 + v31);
                int v36 = *(&v46 + v31);
                if (v35 < 0)
                {
                  int v44 = (char)*(&v46 + v14);
                  if (v44 < 0) {
                    sub_100026D44(v6, v7, v8, v16, v9, v10, v11, v12);
                  }
                  int v45 = v44;
                  uint64_t v14 = v27 + 5;
                  int v37 = ((v36 & 0x7F) << 21) | (v45 << 28) | ((v33 & 0x7F) << 14);
                }
                else
                {
                  int v37 = ((v33 & 0x7F) << 14) | (v36 << 21);
                }
                uint64_t v34 = v37 & 0xFFFFC000 | ((v30 & 0x7F) << 7) | v16 & 0x7F;
              }
              else
              {
                uint64_t v34 = ((v30 & 0x7F) << 7) | (v32 << 14) | (v16 & 0x7F);
                uint64_t v14 = v31;
              }
              uint64_t v16 = v34;
            }
            else
            {
              uint64_t v16 = v16 & 0x7F | (v30 << 7);
            }
          }
          else
          {
            uint64_t v14 = v27 + 1;
          }
          break;
      }
    }
    else
    {
LABEL_13:
      uint64_t v14 = 0;
      uint64_t v16 = 0;
      unsigned int v15 = 0;
    }
    uint64_t v17 = (char *)(&v46 + v14);
    uint64_t v18 = &v46 + a2 - 1;
    unsigned int v19 = *v18;
    if (v19 == 3) {
      uint64_t v20 = v15 | 2;
    }
    else {
      uint64_t v20 = v15;
    }
    if (v19 <= 5)
    {
      if (v18 <= (unsigned __int8 *)v17)
      {
        if (v19 == 1) {
          goto LABEL_28;
        }
      }
      else
      {
        int v21 = a2 - v14;
        int v22 = 1;
        CFNullRef v23 = &v46 + a2 - 1;
        while (1)
        {
          unsigned int v24 = *--v23;
          if (v24 > 5) {
            break;
          }
          ++v22;
          uint64_t v18 = v23;
          if (v23 <= (unsigned __int8 *)v17)
          {
            uint64_t v18 = &v46 + v14;
            goto LABEL_26;
          }
        }
        int v21 = v22;
LABEL_26:
        if (*v18 == 1)
        {
          if (v21 != 1)
          {
            if (v16 || v21 < 3 || v18[2] != 5)
            {
              int v26 = v18;
            }
            else
            {
              switch(v18[1])
              {
                case 2u:
                  uint64_t v20 = v20 | 0x80;
                  break;
                case 3u:
                  uint64_t v20 = v20 | 0x100;
                  break;
                case 4u:
                  uint64_t v20 = v20 | 0x200;
                  break;
                case 5u:
                  uint64_t v20 = v20 | 0x400;
                  break;
                default:
                  break;
              }
              int v26 = v18 + 3;
              v21 -= 3;
            }
            if (v21 >= 2)
            {
              int v38 = v26[1];
              unsigned int v39 = v38 - 4;
              if (v16 <= 1) {
                unsigned int v40 = 1;
              }
              else {
                unsigned int v40 = v16;
              }
              unsigned int v41 = v20 | 8;
              if (v38 != 2) {
                unsigned int v41 = v20;
              }
              BOOL v42 = v38 == 1;
              if (v38 == 1) {
                unsigned int v43 = v40;
              }
              else {
                unsigned int v43 = v16;
              }
              if (v42) {
                unsigned int v41 = v20;
              }
              if (v39 >= 2) {
                uint64_t v16 = v43;
              }
              else {
                uint64_t v16 = v40;
              }
              if (v39 >= 2) {
                uint64_t v20 = v41;
              }
              else {
                uint64_t v20 = v20 | 1;
              }
            }
            goto LABEL_29;
          }
LABEL_28:
          uint64_t v20 = v20 | 1;
LABEL_29:
          uint64_t v25 = v18 - (unsigned __int8 *)v17;
          unsigned __int8 *v18 = 0;
          return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v17, v25, v16, v20);
        }
      }
    }
    uint64_t v25 = a2 - v14;
    return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v17, v25, v16, v20);
  }
  return result;
}

void sub_100025228()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "allocation function returned null", v0, 2u);
}

void sub_100025270()
{
}

void sub_10002529C()
{
}

void sub_1000252C8()
{
}

void sub_1000252F4()
{
}

void sub_100025320()
{
}

void sub_10002534C()
{
}

void sub_100025378()
{
  __assert_rtn("internalClose", "fsi.c", 1227, "iterator->fdArray[iterator->resumeFd] >= 0 && iterator->fdCount >= 0");
}

void sub_1000253A4()
{
  __assert_rtn("internalClose", "fsi.c", 1216, "iterator->fdArray[(int)tos->fileReference] >= 0 && iterator->fdCount >= 0");
}

void sub_1000253D0()
{
  __assert_rtn("internalIterateWalk", "fsi.c", 1884, "iterator->fdArray[savedFd] >= 0 && iterator->fdCount >= 0");
}

void sub_1000253FC()
{
  __assert_rtn("internalIterateWalk", "fsi.c", 1880, "iterator->fdArray[savedFd] >= 0 && iterator->fdCount >= 0");
}

void sub_100025428()
{
  __assert_rtn("internalIterateWalk", "fsi.c", 1856, "iterator->fdArray[(int)tos->fileReference] >= 0 && iterator->fdCount >= 0");
}

void sub_100025454()
{
  __assert_rtn("internalIterateWalk", "fsi.c", 1767, "iterator->fdArray[fd] >= 0 && iterator->fdCount >= 0");
}

void sub_100025480()
{
  __assert_rtn("pop", "fsi.c", 708, "iterator->fdArray[(int)previousFileReference] >= 0 && iterator->fdCount >= 0");
}

void sub_1000254AC()
{
  __assert_rtn("prepareForPush", "fsi.c", 756, "iterator->fdArray[fd] >= 0 && iterator->fdCount >= 0");
}

void sub_1000254D8()
{
}

void sub_100025504()
{
  __assert_rtn("internalIterateWalk", "fsi.c", 1619, "iterator->fdArray[iterator->resumeFd] >= 0 && iterator->fdCount >= 0");
}

void sub_100025530()
{
  __assert_rtn("internalIterateWalk", "fsi.c", 1615, "iterator->fdArray[savedFd] >= 0 && iterator->fdCount >= 0");
}

void sub_10002555C()
{
  __assert_rtn("fsi_attr_set_scalar", "fsi.c", 2487, "descriptor->fieldType[index] != FSI_TYPE_IGNORE");
}

void sub_100025588()
{
}

void sub_1000255B4()
{
}

void sub_1000255E0()
{
  __assert_rtn("fsi_attr_set_fixed_data", "fsi.c", 2506, "descriptor->fieldType[index] != FSI_TYPE_IGNORE");
}

void sub_10002560C()
{
}

void sub_100025638()
{
}

void sub_100025664()
{
  __assert_rtn("fsi_attr_set_variable_data", "fsi.c", 2516, "descriptor->fieldType[index] != FSI_TYPE_IGNORE");
}

void sub_100025690()
{
}

void sub_1000256BC()
{
}

void sub_1000256E8()
{
  __assert_rtn("finishChildList", "fsi.c", 568, "tos->currentItem==0");
}

void sub_100025714()
{
  __assert_rtn("finishChildList", "fsi.c", 565, "tos->currentChild==0");
}

void sub_100025740()
{
  __assert_rtn("finishChildList", "fsi.c", 564, "tos->currentItem==0");
}

void sub_10002576C()
{
  __assert_rtn("finishChildList", "fsi.c", 574, "tos->currentItem!=0");
}

void sub_100025798()
{
  __assert_rtn("finishChildList", "fsi.c", 575, "tos->currentItem == tos->children[tos->currentChild-1]");
}

void sub_1000257C4()
{
  __assert_rtn("cleanupAfterNoPush", "fsi.c", 776, "iterator->fdArray[(int)fileReference] >= 0 && iterator->fdCount >= 0");
}

void sub_1000257F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002582C()
{
}

void sub_100025858()
{
  __assert_rtn("SQueueDropData", "SlabQueue.c", 179, "(squeue->firstSlab == NULL && squeue->totalSize == 0) || (squeue->firstSlab != NULL && squeue->firstSlab->availableToRead == 0 && squeue->totalSize == 0) || (squeue->firstSlab != NULL && squeue->firstSlab->availableToRead <= squeue->totalSize)");
}

void sub_100025884()
{
  __assert_rtn("SQueueDropData", "SlabQueue.c", 182, "length == 0");
}

void sub_1000258B0()
{
}

void sub_1000258F4()
{
}

void sub_100025938()
{
  sub_100008824("%s:%u: failed assertion '%s' %s readVInt32: exceeds max size for uint32_t", "VIntUtils.h", 341, "(b4 & 0x80) == 0", "");
  sub_100007F30();
}

void sub_10002597C(int a1)
{
  sub_100008824("%s:%u: failed assertion '%s' %s %d", "PostingChunk.c", 864, "zero == 0", "", a1);
  sub_100007F30();
}

void sub_1000259C4()
{
}

void sub_100025A08()
{
}

void sub_100025A4C()
{
  sub_100008824("%s:%u: failed assertion '%s' %s ", "PostingChunk.c", 732, "docIDLast >= docIDs[i]", "");
  sub_100007F30();
}

void sub_100025A90()
{
}

void sub_100025AD4()
{
}

void sub_100025B18()
{
}

void sub_100025B5C()
{
}

void sub_100025BA0()
{
  sub_100008824("%s:%u: failed assertion '%s' %s ", "PostingChunk.c", 33, "(b4 & 0x80) == 0", "");
  sub_100007F30();
}

void sub_100025BE4()
{
}

void sub_100025C28()
{
}

void sub_100025C6C()
{
}

void sub_100025CB0()
{
}

void sub_100025CF4()
{
}

void sub_100025D38(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "monitoring error: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_100025DB0()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, &_os_log_default, v0, "psid.db exists at %@", v1, v2, v3, v4, v5);
}

void sub_100025E20()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, &_os_log_default, v0, "invalid oid %lld", v1, v2, v3, v4, v5);
}

void sub_100025E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  MEMORY[0xBAD] = -559038737;
  abort();
}

void sub_100025EDC()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, v0, v1, "invalid path %@", v2, v3, v4, v5, v6);
}

void sub_100025F44()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, v0, v1, "can't parse statfs.f_mntonname: %s", v2, v3, v4, v5, v6);
}

void sub_100025FAC()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, v0, v1, "Could not create indexer for  %@", v2, v3, v4, v5, v6);
}

void sub_100026014(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&void v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  sub_10001A0F4((void *)&_mh_execute_header, a2, a3, "Invalid options: %llx for  %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10002608C()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, v0, v1, "import error %@", v2, v3, v4, v5, v6);
}

void sub_1000260F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002612C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Finished query qid: %ld", (uint8_t *)&v3, 0xCu);
}

void sub_1000261A8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found query results qid:%ld", (uint8_t *)&v3, 0xCu);
}

void sub_100026224()
{
  sub_10001A114();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
}

void sub_1000262A8()
{
  sub_10001A114();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

void sub_10002632C()
{
  sub_10001A114();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xEu);
}

void sub_1000263B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000263E8()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, v0, v1, "could not rsolve %@", v2, v3, v4, v5, v6);
}

void sub_100026450()
{
  sub_10001A140();
  sub_10001A0F4((void *)&_mh_execute_header, v0, v1, "Error removing %lud oids: error %@");
}

void sub_1000264BC()
{
  sub_10001A140();
  sub_10001A0F4((void *)&_mh_execute_header, v0, v1, "removing oid: %lld error %@");
}

void sub_100026528()
{
  sub_10001A158(__stack_chk_guard);
  sub_10001A0B0();
  sub_10001A0D4((void *)&_mh_execute_header, v0, v1, "[%d] removing oid: %lld error %@");
}

void sub_100026590()
{
  sub_10001A158(__stack_chk_guard);
  sub_10001A0B0();
  sub_10001A0D4((void *)&_mh_execute_header, v0, v1, "[%d] update oid: %lld error %@");
}

void sub_1000265F8()
{
  sub_10001A158(__stack_chk_guard);
  sub_10001A0B0();
  sub_10001A0D4((void *)&_mh_execute_header, v0, v1, "[%d] add oid: %lld error %@");
}

void sub_100026660()
{
  sub_1000103DC();
  sub_1000103C0((void *)&_mh_execute_header, v0, v1, "could not resolve scopes %@", v2, v3, v4, v5, v6);
}

void sub_1000266C8(uint64_t a1, xpc_connection_t connection, NSObject *a3)
{
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  pid_t pid = xpc_connection_get_pid(connection);
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "request %s from pid: %d", (uint8_t *)&v4, 0x12u);
}

void sub_100026768(unsigned char *a1, unsigned char *a2)
{
  sub_10001CA60(a1, a2);
  sub_10001CA70((void *)&_mh_execute_header, v2, v3, "  [QueueImportJournal oldestDateAfterRetirement ERROR! insufficient bytes available", v4);
}

void sub_100026794(unsigned char *a1, unsigned char *a2)
{
  sub_10001CA60(a1, a2);
  sub_10001CA70((void *)&_mh_execute_header, v2, v3, "  [QueueImportJournal oldestDateAfterRetirement ERROR! chunkSize too small", v4);
}

void sub_1000267C0(unsigned char *a1, unsigned char *a2)
{
  sub_10001CA60(a1, a2);
  sub_10001CA70((void *)&_mh_execute_header, v2, v3, "  [QueueImportJournal oldestDateAfterRetirement ERROR! chunkSize bigger than availableBytes", v4);
}

void sub_1000267EC(unsigned char *a1, unsigned char *a2)
{
  sub_10001CA60(a1, a2);
  sub_10001CA70((void *)&_mh_execute_header, v2, v3, "  [QueueImportJournal oldestDateAfterRetirement ERROR! hash mismatch", v4);
}

void sub_100026818()
{
  __assert_rtn("accurate_realpath", "MDFileUtil.c", 394, "rc == 0");
}

void sub_100026844(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "could not connect to livefs server", v1, 2u);
}

void sub_100026888()
{
  sub_100021728(__stack_chk_guard);
  sub_100021700((void *)&_mh_execute_header, v0, v1, "LIGetRootFileHandle: %@", v2, v3, v4, v5, 2u);
}

void sub_1000268F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "exiting, got error %@ querrying root file handle", (uint8_t *)&v2, 0xCu);
}

void sub_10002696C()
{
  sub_100021728(__stack_chk_guard);
  sub_100021700((void *)&_mh_execute_header, v0, v1, "Volume UUID: %@", v2, v3, v4, v5, 2u);
}

void sub_1000269D8()
{
  sub_10002171C();
  sub_1000216E4((void *)&_mh_execute_header, v0, v1, "Error %d getting volume uuid", v2, v3, v4, v5, v6);
}

void sub_100026A40()
{
  sub_10002171C();
  sub_1000216E4((void *)&_mh_execute_header, v0, v1, "Error %d getting volume last mtime", v2, v3, v4, v5, v6);
}

void sub_100026AA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026B14()
{
  sub_10002171C();
  sub_1000216E4((void *)&_mh_execute_header, v0, v1, "startResult: %d", v2, v3, v4, v5, v6);
}

void sub_100026B7C()
{
  sub_10002171C();
  sub_1000216E4((void *)&_mh_execute_header, v0, v1, "LIGetParentsAndAttributesForFileIDs error:%d", v2, v3, v4, v5, v6);
}

void sub_100026BE4()
{
  __assert_rtn("QueueCIR_Pack", "StoreImporterQueueCoding.m", 594, "type >= 0");
}

void sub_100026C10()
{
  __assert_rtn("QueueCIR_Pack", "StoreImporterQueueCoding.m", 607, "info->inlineLength <= 4096");
}

void sub_100026C3C()
{
}

void sub_100026C68()
{
  __assert_rtn("QueueCIR_Pack", "StoreImporterQueueCoding.m", 595, "(type < 16 && length <= 8) || (type >= 8 && type < 32 && length <= 2048)");
}

void sub_100026C94()
{
  __assert_rtn("parseCommand", "StoreImporterQueueCoding.m", 551, "availableLength >= info->inlineLength");
}

void sub_100026CC0()
{
  __assert_rtn("parseCommand", "StoreImporterQueueCoding.m", 545, "availableLength >= 1");
}

void sub_100026CEC()
{
  __assert_rtn("rawDecode", "StoreImporterQueueCoding.m", 986, "(amountConsumed == 0 && rawDecodeState->runLength != 0) || (amountConsumed == 1 && rawDecodeState->runLength == 0)");
}

void sub_100026D18()
{
}

void sub_100026D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  MEMORY[0xBAD] = -559038737;
  abort();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return _CFAllocatorCreate(allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return _CFStringIsEncodingAvailable(encoding);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return _CFUUIDGetTypeID();
}

uint64_t CSIsInterestingPath()
{
  return _CSIsInterestingPath();
}

CFDictionaryRef DADiskCopyDescription(DADiskRef disk)
{
  return _DADiskCopyDescription(disk);
}

io_service_t DADiskCopyIOMedia(DADiskRef disk)
{
  return _DADiskCopyIOMedia(disk);
}

DADiskRef DADiskCreateFromIOMedia(CFAllocatorRef allocator, DASessionRef session, io_service_t media)
{
  return _DADiskCreateFromIOMedia(allocator, session, media);
}

uint64_t DARegisterDiskUnmountApprovalCallbackBlock()
{
  return _DARegisterDiskUnmountApprovalCallbackBlock();
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  return _DASessionCreate(allocator);
}

void DASessionSetDispatchQueue(DASessionRef session, dispatch_queue_t queue)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

uint64_t MDPropertyCopyDecodedValue()
{
  return _MDPropertyCopyDecodedValue();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SIBulkSetAttributes()
{
  return _SIBulkSetAttributes();
}

uint64_t SICancel()
{
  return _SICancel();
}

uint64_t SICopyProperties()
{
  return _SICopyProperties();
}

uint64_t SICopyProperty()
{
  return _SICopyProperty();
}

uint64_t SICreateNewIndex()
{
  return _SICreateNewIndex();
}

uint64_t SIExecuteQuery()
{
  return _SIExecuteQuery();
}

uint64_t SIGetAttributes()
{
  return _SIGetAttributes();
}

uint64_t SIInitialIndexingEnded()
{
  return _SIInitialIndexingEnded();
}

uint64_t SIMoveDirectories()
{
  return _SIMoveDirectories();
}

uint64_t SIMoveFiles()
{
  return _SIMoveFiles();
}

uint64_t SIOpenIndex()
{
  return _SIOpenIndex();
}

uint64_t SIOpenIndexAtPathWithCallbacks()
{
  return _SIOpenIndexAtPathWithCallbacks();
}

uint64_t SIPersistentIDStoreCreate()
{
  return _SIPersistentIDStoreCreate();
}

uint64_t SIPersistentIDStoreSetRootPath()
{
  return _SIPersistentIDStoreSetRootPath();
}

uint64_t SIQueryCreateWithParameters()
{
  return _SIQueryCreateWithParameters();
}

uint64_t SIQueryRelease()
{
  return _SIQueryRelease();
}

uint64_t SIResultBatchFree()
{
  return _SIResultBatchFree();
}

uint64_t SIResultQueueCreate()
{
  return _SIResultQueueCreate();
}

uint64_t SIResultQueueDequeue()
{
  return _SIResultQueueDequeue();
}

uint64_t SIResultQueueRelease()
{
  return _SIResultQueueRelease();
}

uint64_t SISetDefaultSchemaData()
{
  return _SISetDefaultSchemaData();
}

uint64_t SISetLogging()
{
  return _SISetLogging();
}

uint64_t SISetProperty()
{
  return _SISetProperty();
}

uint64_t SISetScanCount()
{
  return _SISetScanCount();
}

uint64_t SISyncIndex()
{
  return _SISyncIndex();
}

uint64_t SISynchedOp()
{
  return _SISynchedOp();
}

uint64_t SITransferAttributes()
{
  return _SITransferAttributes();
}

uint64_t SIUINT64SetAddValue()
{
  return _SIUINT64SetAddValue();
}

uint64_t SIUINT64SetContainsValue()
{
  return _SIUINT64SetContainsValue();
}

uint64_t SIUINT64SetCreate()
{
  return _SIUINT64SetCreate();
}

uint64_t SIUserCtxCreateWithLanguages()
{
  return _SIUserCtxCreateWithLanguages();
}

uint64_t SI_PersistentIDStoreGetTypeID()
{
  return _SI_PersistentIDStoreGetTypeID();
}

uint64_t UTTypeCopyParentIdentifiers()
{
  return _UTTypeCopyParentIdentifiers();
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _MDCreateSimpleQueryEvaluatorWithBlock()
{
  return __MDCreateSimpleQueryEvaluatorWithBlock();
}

uint64_t _MDPlistBytesAddBoolean()
{
  return __MDPlistBytesAddBoolean();
}

uint64_t _MDPlistBytesAddCString()
{
  return __MDPlistBytesAddCString();
}

uint64_t _MDPlistBytesAddNull()
{
  return __MDPlistBytesAddNull();
}

uint64_t _MDPlistBytesAppendPlist()
{
  return __MDPlistBytesAppendPlist();
}

uint64_t _MDPlistBytesBeginArray()
{
  return __MDPlistBytesBeginArray();
}

uint64_t _MDPlistBytesBeginPlist()
{
  return __MDPlistBytesBeginPlist();
}

uint64_t _MDPlistBytesCopyPlistAtIndex()
{
  return __MDPlistBytesCopyPlistAtIndex();
}

uint64_t _MDPlistBytesCreate()
{
  return __MDPlistBytesCreate();
}

uint64_t _MDPlistBytesCreateMutable()
{
  return __MDPlistBytesCreateMutable();
}

uint64_t _MDPlistBytesCreateMutableUsingMalloc()
{
  return __MDPlistBytesCreateMutableUsingMalloc();
}

uint64_t _MDPlistBytesEndArray()
{
  return __MDPlistBytesEndArray();
}

uint64_t _MDPlistBytesEndPlist()
{
  return __MDPlistBytesEndPlist();
}

uint64_t _MDPlistBytesGetByteVector()
{
  return __MDPlistBytesGetByteVector();
}

uint64_t _MDPlistBytesGetByteVectorCount()
{
  return __MDPlistBytesGetByteVectorCount();
}

uint64_t _MDPlistContainerAddCString()
{
  return __MDPlistContainerAddCString();
}

uint64_t _MDPlistContainerAddObject()
{
  return __MDPlistContainerAddObject();
}

uint64_t _MDPlistContainerBeginArray()
{
  return __MDPlistContainerBeginArray();
}

uint64_t _MDPlistContainerBeginContainer()
{
  return __MDPlistContainerBeginContainer();
}

uint64_t _MDPlistContainerBeginDictionary()
{
  return __MDPlistContainerBeginDictionary();
}

uint64_t _MDPlistContainerCopyRootObject()
{
  return __MDPlistContainerCopyRootObject();
}

uint64_t _MDPlistContainerCreateMutable()
{
  return __MDPlistContainerCreateMutable();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return __MDPlistContainerCreateWithBytes();
}

uint64_t _MDPlistContainerEndArray()
{
  return __MDPlistContainerEndArray();
}

uint64_t _MDPlistContainerEndContainer()
{
  return __MDPlistContainerEndContainer();
}

uint64_t _MDPlistContainerEndDictionary()
{
  return __MDPlistContainerEndDictionary();
}

uint64_t _MDPlistContainerGetBytes()
{
  return __MDPlistContainerGetBytes();
}

uint64_t _MDPlistContainerGetLength()
{
  return __MDPlistContainerGetLength();
}

uint64_t _MDSimpleQueryDeallocate()
{
  return __MDSimpleQueryDeallocate();
}

uint64_t _MDSimpleQueryObjectMatches()
{
  return __MDSimpleQueryObjectMatches();
}

uint64_t _MDStoreOIDArrayApplyFunction()
{
  return __MDStoreOIDArrayApplyFunction();
}

uint64_t _MDStoreOIDArrayGetVector()
{
  return __MDStoreOIDArrayGetVector();
}

uint64_t _MDStoreOIDArrayGetVectorCount()
{
  return __MDStoreOIDArrayGetVectorCount();
}

uint64_t _SICheckIndexForDuplicateOids()
{
  return __SICheckIndexForDuplicateOids();
}

uint64_t _SIConsistencyCheck()
{
  return __SIConsistencyCheck();
}

uint64_t _SICopyPropertyIDMap()
{
  return __SICopyPropertyIDMap();
}

uint64_t _SIDirectoryStoreIterate()
{
  return __SIDirectoryStoreIterate();
}

uint64_t _SIGetRecoverTimeStamp()
{
  return __SIGetRecoverTimeStamp();
}

uint64_t _SIIssueSplit()
{
  return __SIIssueSplit();
}

uint64_t _SIReverseStoreIterate()
{
  return __SIReverseStoreIterate();
}

uint64_t _SIScheduleBackgroundOperation()
{
  return __SIScheduleBackgroundOperation();
}

uint64_t _SISetFileOptions()
{
  return __SISetFileOptions();
}

uint64_t _SITermIndexIterate()
{
  return __SITermIndexIterate();
}

uint64_t _SIUserCopyUserFSCriteriaForQuery()
{
  return __SIUserCopyUserFSCriteriaForQuery();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __MDPlistBytesAddObject()
{
  return ___MDPlistBytesAddObject();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
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

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

uint64_t atoll(const char *a1)
{
  return _atoll(a1);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dup(int a1)
{
  return _dup(a1);
}

void exit(int a1)
{
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return _faccessat(a1, a2, a3, a4);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return _fchownat(a1, a2, a3, a4, a5);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return _fdopendir(a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fgetattrlist(a1, a2, a3, a4, a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _fgetxattr(fd, name, value, size, position, options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return _flistxattr(fd, namebuff, size, options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return _fsgetpath(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

int fstatfs(int a1, statfs *a2)
{
  return _fstatfs(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int getattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  return _getattrlistat(a1, a2, a3, a4, a5, a6);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return _getattrlistbulk(a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getiopolicy_np(int a1, int a2)
{
  return _getiopolicy_np(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return _host_info(host, flavor, host_info_out, host_info_outCnt);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  return _linkat(a1, a2, a3, a4, a5);
}

uint64_t logForCSLogCategoryDefault()
{
  return _logForCSLogCategoryDefault();
}

uint64_t logForCSLogCategoryIndex()
{
  return _logForCSLogCategoryIndex();
}

uint64_t logForCSLogCategoryQuery()
{
  return _logForCSLogCategoryQuery();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return _mach_port_get_refs(task, name, right, refs);
}

mach_port_t mach_thread_self(void)
{
  return _mach_thread_self();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

size_t malloc_good_size(size_t size)
{
  return _malloc_good_size(size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_zone_malloc(zone, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_zone_realloc(zone, ptr, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
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

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return _mkdirat(a1, a2, a3);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_check(int token, int *check)
{
  return _notify_check(token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return _pid_for_task(t, x);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

uint64_t pthread_fchdir_np()
{
  return _pthread_fchdir_np();
}

int pthread_getugid_np(uid_t *a1, gid_t *a2)
{
  return _pthread_getugid_np(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_destroy(a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return _pthread_rwlock_init(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return _pthread_setugid_np(a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return _renameatx_np(a1, a2, a3, a4, a5);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int searchfs(const char *a1, fssearchblock *a2, unint64_t *a3, unsigned int a4, unsigned int a5, searchstate *a6)
{
  return _searchfs(a1, a2, a3, a4, a5, a6);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return _xpc_array_get_data(xarray, index, length);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__domainsByPath(void *a1, const char *a2, ...)
{
  return [a1 _domainsByPath];
}

id objc_msgSend__holdImports(void *a1, const char *a2, ...)
{
  return [a1 _holdImports];
}

id objc_msgSend__resumeImports(void *a1, const char *a2, ...)
{
  return [a1 _resumeImports];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allQueryTasks(void *a1, const char *a2, ...)
{
  return [a1 allQueryTasks];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_base(void *a1, const char *a2, ...)
{
  return [a1 base];
}

id objc_msgSend_beginMonitoring(void *a1, const char *a2, ...)
{
  return [a1 beginMonitoring];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cindex(void *a1, const char *a2, ...)
{
  return [a1 cindex];
}

id objc_msgSend_clientCanceled(void *a1, const char *a2, ...)
{
  return [a1 clientCanceled];
}

id objc_msgSend_clientConnection(void *a1, const char *a2, ...)
{
  return [a1 clientConnection];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return [a1 compact];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataPtr(void *a1, const char *a2, ...)
{
  return [a1 dataPtr];
}

id objc_msgSend_dataSize(void *a1, const char *a2, ...)
{
  return [a1 dataSize];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dirty(void *a1, const char *a2, ...)
{
  return [a1 dirty];
}

id objc_msgSend_dirtyIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 dirtyIdleTimer];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainsByPath(void *a1, const char *a2, ...)
{
  return [a1 domainsByPath];
}

id objc_msgSend_exportedClientInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedClientInterface];
}

id objc_msgSend_fetchAttributes(void *a1, const char *a2, ...)
{
  return [a1 fetchAttributes];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fpMonitor(void *a1, const char *a2, ...)
{
  return [a1 fpMonitor];
}

id objc_msgSend_fsOnly(void *a1, const char *a2, ...)
{
  return [a1 fsOnly];
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return [a1 groups];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_indexQueue(void *a1, const char *a2, ...)
{
  return [a1 indexQueue];
}

id objc_msgSend_indexType(void *a1, const char *a2, ...)
{
  return [a1 indexType];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceForListeners(void *a1, const char *a2, ...)
{
  return [a1 interfaceForListeners];
}

id objc_msgSend_isCoreSpotlight(void *a1, const char *a2, ...)
{
  return [a1 isCoreSpotlight];
}

id objc_msgSend_isFSOnly(void *a1, const char *a2, ...)
{
  return [a1 isFSOnly];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return [a1 isOpen];
}

id objc_msgSend_isSpotlightIndex(void *a1, const char *a2, ...)
{
  return [a1 isSpotlightIndex];
}

id objc_msgSend_isXcodeIndex(void *a1, const char *a2, ...)
{
  return [a1 isXcodeIndex];
}

id objc_msgSend_issueCommit(void *a1, const char *a2, ...)
{
  return [a1 issueCommit];
}

id objc_msgSend_lastMTime(void *a1, const char *a2, ...)
{
  return [a1 lastMTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_live(void *a1, const char *a2, ...)
{
  return [a1 live];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mountPoints(void *a1, const char *a2, ...)
{
  return [a1 mountPoints];
}

id objc_msgSend_mountServiceClient(void *a1, const char *a2, ...)
{
  return [a1 mountServiceClient];
}

id objc_msgSend_mountTime(void *a1, const char *a2, ...)
{
  return [a1 mountTime];
}

id objc_msgSend_oldestDateAfterRetirement(void *a1, const char *a2, ...)
{
  return [a1 oldestDateAfterRetirement];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_persistentFileIDs(void *a1, const char *a2, ...)
{
  return [a1 persistentFileIDs];
}

id objc_msgSend_propertyMap(void *a1, const char *a2, ...)
{
  return [a1 propertyMap];
}

id objc_msgSend_propertyNumMap(void *a1, const char *a2, ...)
{
  return [a1 propertyNumMap];
}

id objc_msgSend_queryActiviate(void *a1, const char *a2, ...)
{
  return [a1 queryActiviate];
}

id objc_msgSend_queryTask(void *a1, const char *a2, ...)
{
  return [a1 queryTask];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_readOnly(void *a1, const char *a2, ...)
{
  return [a1 readOnly];
}

id objc_msgSend_resultsQueue(void *a1, const char *a2, ...)
{
  return [a1 resultsQueue];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return [a1 rootPath];
}

id objc_msgSend_rootPathUTF8String(void *a1, const char *a2, ...)
{
  return [a1 rootPathUTF8String];
}

id objc_msgSend_rootPathUTF8StringLength(void *a1, const char *a2, ...)
{
  return [a1 rootPathUTF8StringLength];
}

id objc_msgSend_scanForFiles(void *a1, const char *a2, ...)
{
  return [a1 scanForFiles];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_scopes(void *a1, const char *a2, ...)
{
  return [a1 scopes];
}

id objc_msgSend_searchToken(void *a1, const char *a2, ...)
{
  return [a1 searchToken];
}

id objc_msgSend_serviceClient(void *a1, const char *a2, ...)
{
  return [a1 serviceClient];
}

id objc_msgSend_sharedAgent(void *a1, const char *a2, ...)
{
  return [a1 sharedAgent];
}

id objc_msgSend_siQuery(void *a1, const char *a2, ...)
{
  return [a1 siQuery];
}

id objc_msgSend_siResultsQueue(void *a1, const char *a2, ...)
{
  return [a1 siResultsQueue];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startListener(void *a1, const char *a2, ...)
{
  return [a1 startListener];
}

id objc_msgSend_storageURLs(void *a1, const char *a2, ...)
{
  return [a1 storageURLs];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_termIndex(void *a1, const char *a2, ...)
{
  return [a1 termIndex];
}

id objc_msgSend_termIndexCount(void *a1, const char *a2, ...)
{
  return [a1 termIndexCount];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_volumeNames(void *a1, const char *a2, ...)
{
  return [a1 volumeNames];
}

id objc_msgSend_volumeObject(void *a1, const char *a2, ...)
{
  return [a1 volumeObject];
}

id objc_msgSend_volumeSyncConnection(void *a1, const char *a2, ...)
{
  return [a1 volumeSyncConnection];
}

id objc_msgSend_volumes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumes:");
}