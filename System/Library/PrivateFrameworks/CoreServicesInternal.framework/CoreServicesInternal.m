uint64_t _FSURLCopyResourcePropertyForKey(const __CFURL *a1, const __CFString *a2, void **a3, const void *a4, __CFError **a5)
{
  return _FSURLCopyResourcePropertyForKeyInternal(a1, a2, a3, a4, a5, 1);
}

double _FileCacheInit(const void *a1)
{
  *((void *)a1 + 3) = 0;
  *((void *)a1 + 4) = 0;
  *((void *)a1 + 5) = 0;
  atomic_store(0xFFFFFFFF, (unsigned int *)a1 + 4);
  atomic_store(0, (unsigned int *)a1 + 5);
  atomic_store(0xFFFFFFFF, (unsigned int *)a1 + 4);
  double result = 0.0;
  *((_OWORD *)a1 + 18) = 0u;
  *((_OWORD *)a1 + 19) = 0u;
  *((_OWORD *)a1 + 16) = 0u;
  *((_OWORD *)a1 + 17) = 0u;
  *((_OWORD *)a1 + 14) = 0u;
  *((_OWORD *)a1 + 15) = 0u;
  *((_OWORD *)a1 + 12) = 0u;
  *((_OWORD *)a1 + 13) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 11) = 0u;
  *((_OWORD *)a1 + 8) = 0u;
  *((_OWORD *)a1 + 9) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  return result;
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeys(const __CFURL *a1, const __CFArray *a2, const void *a3, __CFError **a4)
{
  return _FSURLCopyResourcePropertiesForKeysInternal(a1, a2, a3, a4, 1);
}

CFTypeRef FileCachePropertyValueRetainCallBack(const __CFAllocator *a1, CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  else {
    return 0;
  }
}

uint64_t _FileCacheGetName(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

void FileCachePropertyValueReleaseCallBack(const __CFAllocator *a1, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void _FSURLEndResourcePropertyCacheAccess(const __CFURL *a1, const void *a2)
{
  if (a2)
  {
    CFTypeRef v2 = _FileCacheGetForURL(a1, a2);
    _FileCacheLock((uint64_t)v2);
    if (!_FileCacheGetInProvider((uint64_t)v2)
      && _FileCacheNeedsValidSeed((uint64_t)v2)
      && _CFRunLoopCurrentIsMain())
    {
      unsigned int GlobalSeed = _FileCacheGetGlobalSeed();
      _FileCacheSetValidSeed((uint64_t)v2, GlobalSeed);
      Main = CFRunLoopGetMain();
      _FileCacheScheduleGlobalSeedIncrement(Main);
    }
    _FileCacheUnlock((uint64_t)v2);
  }
}

uint64_t _FileCacheGetInProvider(uint64_t a1)
{
  return atomic_load((unsigned int *)(a1 + 20));
}

BOOL _FileCacheNeedsValidSeed(uint64_t a1)
{
  unsigned int v1 = atomic_load((unsigned int *)(a1 + 16));
  return v1 == -1;
}

uint64_t _GetDirectoryURLs(uint64_t a1)
{
  v40[1] = *(void ***)MEMORY[0x1E4F143B8];
  v40[0] = 0;
  uint64_t v2 = MountInfoStorageSize();
  v3 = (char *)&v34 - ((MEMORY[0x1F4188790](v2) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_OWORD **)(a1 + 72);
  if (!v4) {
    return 0;
  }
  v5 = (uint64_t *)(a1 + 80);
  if (*(uint64_t *)(a1 + 80) >= 1)
  {
    uint64_t v6 = 0;
    do
      CFRelease(*(CFTypeRef *)(*(void *)(a1 + 72) + 8 * v6++));
    while (v6 < *(void *)(a1 + 80));
    v4 = *(_OWORD **)(a1 + 72);
  }
  v4[18] = 0u;
  v4[19] = 0u;
  v4[16] = 0u;
  v4[17] = 0u;
  v4[14] = 0u;
  v4[15] = 0u;
  v4[12] = 0u;
  v4[13] = 0u;
  v4[10] = 0u;
  v4[11] = 0u;
  v4[8] = 0u;
  v4[9] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  *(void *)(a1 + 520) = 0;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  uint64_t *v5 = 0;
  *(void *)(a1 + 88) = 0;
  if (*(unsigned char *)(a1 + 121))
  {
    int v7 = *(_DWORD *)(*(void *)(a1 + 160) + 1792);
    if (v7)
    {
      if (!MountInfoPrepare(v40, 0, v7, v3, a1 + 152, 0, 0)) {
        *(unsigned char *)(a1 + 121) = 0;
      }
    }
  }
  v39 = 0;
  uint64_t v8 = DirEnumRead(*(void *)(a1 + 160));
  if (!v8)
  {
    unsigned __int8 v10 = 0;
    goto LABEL_85;
  }
  uint64_t v9 = v8;
  unsigned __int8 v10 = 0;
  CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D690];
  CFStringRef v35 = (const __CFString *)*MEMORY[0x1E4F1D6A0];
  while (1)
  {
    unsigned int v12 = *(_DWORD *)(v9 + 48);
    if (v12 > 6) {
      goto LABEL_76;
    }
    int v13 = 1 << v12;
    if (((1 << v12) & 6) != 0)
    {
      if (!*(_DWORD *)(v9 + 44)) {
        goto LABEL_76;
      }
      if (v12 != 1) {
        goto LABEL_52;
      }
      if (*(unsigned char *)(a1 + 32)) {
        goto LABEL_22;
      }
      DirEnumSkipDescendents(*(void *)(a1 + 160));
      unsigned int v12 = *(_DWORD *)(v9 + 48);
      if (v12 == 2)
      {
LABEL_52:
        if ((*(unsigned char *)(a1 + 32) & 0x20) == 0) {
          goto LABEL_76;
        }
        int v18 = 0;
        int v17 = 1;
        goto LABEL_28;
      }
      if (v12 == 1)
      {
LABEL_22:
        if ((*(void *)(a1 + 32) & 0x30) == 0x20) {
          goto LABEL_76;
        }
        int v17 = 0;
        int v18 = 1;
        goto LABEL_28;
      }
    }
    else if ((v13 & 0x18) == 0)
    {
      if ((v13 & 0x60) == 0) {
        goto LABEL_76;
      }
      CFAllocatorRef v14 = *(const __CFAllocator **)(a1 + 16);
      int v15 = *(_DWORD *)(v9 + 40);
      v16 = *(const char **)(v9 + 8);
      goto LABEL_55;
    }
    if (v12 == 3 && (*(unsigned char *)(a1 + 35) & 0x80) == 0 && !strncmp(*(const char **)(v9 + 24), "._", 2uLL)) {
      goto LABEL_76;
    }
    int v18 = 0;
    int v17 = 0;
LABEL_28:
    if (*(unsigned char *)(a1 + 121) && *(void *)(v9 + 56)) {
      break;
    }
    uint64_t v25 = MEMORY[0x1853003B0](*(void *)(a1 + 16), *(void *)(v9 + 8) + *(void *)(a1 + 544), *(void *)(v9 + 16) - *(void *)(a1 + 544), v18 | v17, *(void *)(a1 + 536));
    if (!v25)
    {
      CFAllocatorRef v14 = *(const __CFAllocator **)(a1 + 16);
      v16 = *(const char **)(v9 + 8);
      int v15 = 63;
LABEL_55:
      CFErrorRef v30 = _CFErrorWithPOSIXPathAndErrno(v14, v15, v16);
      if (v30) {
        goto LABEL_83;
      }
      goto LABEL_77;
    }
    CFURLRef v21 = (const __CFURL *)v25;
    CFArrayRef v26 = *(const __CFArray **)(a1 + 64);
    if (v26)
    {
      v27 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v21, v26, v27, 0);
    }
LABEL_46:
    uint64_t v28 = *(void *)(a1 + 80);
    *(void *)(*(void *)(a1 + 72) + 8 * v28) = v21;
    *(void *)(a1 + 8 * v28 + 168) = *(unsigned int *)(v9 + 44);
    if (*(_DWORD *)(v9 + 48) == 2) {
      *(unsigned char *)(a1 + *(void *)(a1 + 80) + 488) = 1;
    }
    uint64_t v29 = *v5 + 1;
    uint64_t *v5 = v29;
    if (v29 == 40) {
      goto LABEL_84;
    }
    unsigned __int8 v10 = 1;
    if (*(_DWORD *)(v9 + 48) - 1) <= 1 && (*(unsigned char *)(a1 + 32)) {
      goto LABEL_85;
    }
LABEL_79:
    v39 = 0;
    uint64_t v9 = DirEnumRead(*(void *)(a1 + 160));
    if (!v9) {
      goto LABEL_85;
    }
  }
  HasExtendedAttributes = (void *)DirEnumHasExtendedAttributes(*(void *)(a1 + 160));
  CFURLRef v20 = _FSURLCreateWithPathAndExtendedAttributes(*(CFAllocatorRef *)(a1 + 16), *(unsigned __int8 **)(v9 + 8), *(void *)(v9 + 16), *(void *)(a1 + 544), *(const __CFURL **)(a1 + 536), (attrlist *)(*(void *)(a1 + 160) + 1796), *(attrlist **)(v9 + 56), HasExtendedAttributes, (*(unsigned char *)(a1 + 32) & 4) != 0, *(_WORD *)(a1 + 123), HIBYTE(*(_WORD *)(a1 + 123)), -1, v40[0], &v39);
  if (!v20) {
    goto LABEL_76;
  }
  CFURLRef v21 = v20;
  if ((*(unsigned char *)(a1 + 32) & 2) == 0) {
    goto LABEL_32;
  }
  uint64_t v31 = __CFURLResourceInfoPtr();
  uint64_t v37 = 0;
  CFBooleanRef v38 = 0;
  if (!v31 || !_FileCacheGetFlags(v31, (unint64_t *)&v38, &v37, 0, 0) || (v37 & 0x80) == 0)
  {
    CFBooleanRef propertyValueTypeRefPtr = 0;
    if (CFURLCopyResourcePropertyForKey(v21, v11, &propertyValueTypeRefPtr, 0) && propertyValueTypeRefPtr)
    {
      if (CFBooleanGetValue(propertyValueTypeRefPtr))
      {
        if (*(_DWORD *)(v9 + 48) == 1) {
          DirEnumSkipDescendents(*(void *)(a1 + 160));
        }
        CFRelease(v21);
        CFBooleanRef v32 = propertyValueTypeRefPtr;
        goto LABEL_75;
      }
      CFRelease(propertyValueTypeRefPtr);
    }
    goto LABEL_32;
  }
  if ((v38 & 0x80) == 0)
  {
LABEL_32:
    if (*(unsigned char *)(a1 + 122)) {
      _FSURLCacheCheapVolumeInformation(v21, *(_DWORD *)(*(void *)(a1 + 160) + 1792), (uint64_t)v40[0]);
    }
    CFArrayRef v22 = *(const __CFArray **)(a1 + 64);
    if (v22)
    {
      v23 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v21, v22, v23, 0);
    }
    if ((*(unsigned char *)(a1 + 32) & 8) != 0 && *(_DWORD *)(v9 + 48) == 1)
    {
      uint64_t v24 = __CFURLResourceInfoPtr();
      CFBooleanRef v38 = 0;
      if (v24 && _FileCacheGetPropertyValueForKey(v24, v35, (void **)&v38) && v38)
      {
        if (CFBooleanGetValue(v38)) {
          DirEnumSkipDescendents(*(void *)(a1 + 160));
        }
      }
      else if (CFURLCopyResourcePropertyForKey(v21, v35, &v38, 0) && v38)
      {
        if (CFBooleanGetValue(v38)) {
          DirEnumSkipDescendents(*(void *)(a1 + 160));
        }
        CFRelease(v38);
      }
    }
    goto LABEL_46;
  }
  if (*(_DWORD *)(v9 + 48) == 1) {
    DirEnumSkipDescendents(*(void *)(a1 + 160));
  }
  CFBooleanRef v32 = v21;
LABEL_75:
  CFRelease(v32);
LABEL_76:
  CFErrorRef v30 = v39;
  if (!v39)
  {
LABEL_77:
    if (*(_DWORD *)(v9 + 48) - 1) <= 1 && (*(unsigned char *)(a1 + 32)) {
      goto LABEL_84;
    }
    goto LABEL_79;
  }
LABEL_83:
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 528) = *(unsigned int *)(v9 + 44);
LABEL_84:
  unsigned __int8 v10 = 1;
LABEL_85:
  MountInfoDestroy(v40[0]);
  return v10;
}

uint64_t _FileCacheGetFlags(uint64_t result, unint64_t *a2, uint64_t *a3, void *a4, uint64_t *a5)
{
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  _FileCacheLock(result);
  if (a2 && a3)
  {
    unint64_t v10 = *(unsigned int *)(v9 + 48);
    if ((v10 & 1) == 0)
    {
      unint64_t v11 = 0;
      uint64_t v12 = 0;
LABEL_31:
      *a3 = v12;
      *a2 = v11;
      goto LABEL_32;
    }
    int v13 = *(_DWORD *)(v9 + 64) & 0xF000;
    if (v13 == 0x4000)
    {
      uint64_t v14 = 2;
    }
    else if (v13 == 40960)
    {
      uint64_t v14 = 4;
    }
    else
    {
      uint64_t v14 = v13 == 0x8000;
    }
    unint64_t v15 = *(unsigned int *)(v9 + 68);
    uint64_t v16 = v14 | (v10 >> 10) & 8 | (v15 >> 12) & 0x20;
    __int16 v17 = 32 * v15;
    uint64_t v18 = v16 | (32 * (_WORD)v15) & 0x40;
    if (*(_DWORD *)(v9 + 48) & 0x800 | *(_DWORD *)(v9 + 68) & 0x8000)
    {
      v18 |= 0x80uLL;
      if ((v10 & 0x10) == 0)
      {
        char v19 = 1;
LABEL_19:
        uint64_t v20 = 239;
        goto LABEL_23;
      }
    }
    else
    {
      if ((v10 & 0x10) == 0)
      {
        char v19 = 1;
        uint64_t v20 = 111;
LABEL_23:
        uint64_t v21 = v18 | v17 & 0x400;
        uint64_t v22 = v20 | 0x7400;
        if ((v10 & 8) != 0) {
          v21 |= (v10 >> 13) & 0x1000 | (v10 >> 11) & 0x2000 | (v10 >> 9) & 0x4000;
        }
        else {
          uint64_t v22 = v20 | 0x400;
        }
        if ((v21 & 4) != 0)
        {
          v22 |= 0x8000uLL;
          v21 |= 0x8000uLL;
        }
        else if (v21)
        {
          if ((v19 & 1) == 0)
          {
            v22 |= 0x8000uLL;
            if (*(__int16 *)(v9 + 216) < 0) {
              v21 |= 0x8000uLL;
            }
          }
        }
        else
        {
          v22 |= 0x8000uLL;
        }
        uint64_t v12 = v22 | 0x10000;
        unint64_t v11 = v21 & 0xFFFFFFFFFFFEFFFFLL | (((v10 >> 14) & 1) << 16);
        goto LABEL_31;
      }
      v18 |= ((unint64_t)*(unsigned __int16 *)(v9 + 216) >> 7) & 0x80;
    }
    if ((*(_WORD *)(v9 + 216) & 0x10) != 0)
    {
      char v19 = 0;
      v18 |= 0x100uLL;
      uint64_t v20 = 495;
      goto LABEL_23;
    }
    char v19 = 0;
    if ((v10 & 0x8000000) != 0)
    {
      uint64_t v20 = 495;
      if (*(_WORD *)(v9 + 52) == 3) {
        uint64_t v20 = 239;
      }
      goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_32:
  if (a4 && a5)
  {
    CFDataRef v23 = *(const __CFData **)(v9 + 312);
    if (v23)
    {
      uint64_t v24 = *((void *)CFDataGetBytePtr(v23) + 4);
      uint64_t v25 = -1;
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
    }
    *a4 = v24;
    *a5 = v25;
  }
  int v26 = *(_DWORD *)(v9 + 32) - 1;
  *(_DWORD *)(v9 + 32) = v26;
  if (!v26)
  {
    *(void *)(v9 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 36));
  }
  return 1;
}

uint64_t DirEnumRead(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 1840); ; uint64_t i = 0)
  {
    if (!i || *(unsigned char *)(a1 + 1833))
    {
      uint64_t i = 0;
      *(unsigned char *)(a1 + 1833) = 1;
      goto LABEL_43;
    }
    int v16 = 0;
    int v3 = *(_DWORD *)(i + 48);
    if (v3 == 1) {
      break;
    }
    if (!v3)
    {
      uint64_t v4 = *(void *)i;
LABEL_7:
      DirEnumEntryFree(a1, i);
      goto LABEL_31;
    }
    uint64_t v10 = *(void *)i;
    if (*(void *)i)
    {
      *(void *)&v17.st_dev = 0;
      int v11 = NextEntryFromParent(a1, v10, &v17, &v16);
      if (v11 == 2)
      {
        uint64_t v4 = *(void *)i;
      }
      else
      {
        if (v11 == 1)
        {
          uint64_t v4 = *(void *)&v17.st_dev;
          goto LABEL_7;
        }
        uint64_t v4 = *(void *)i;
        *(_DWORD *)(v4 + 40) = v16;
        *(_DWORD *)(v4 + 48) = 6;
      }
      DirEnumEntryFree(a1, i);
      *(unsigned char *)(a1 + *(void *)(v4 + 16)) = 0;
      goto LABEL_31;
    }
    DirEnumEntryFree(a1, i);
LABEL_21:
    *(void *)(a1 + 1840) = 0;
LABEL_32:
    uint64_t v4 = 0;
    if (*(unsigned char *)(a1 + 1833)) {
      return v4;
    }
  }
  *(_DWORD *)(i + 48) = 2;
  if ((*(unsigned char *)(i + 52) & 2) != 0 || *(_DWORD *)(i + 64) != *(_DWORD *)(a1 + 1792)) {
    goto LABEL_43;
  }
  *(unsigned char *)(a1 + *(void *)(i + 16)) = 0;
  v5 = malloc_type_malloc(0x30uLL, 0x10A004010CD0317uLL);
  if (!v5)
  {
    int v14 = *__error();
    goto LABEL_40;
  }
  uint64_t v6 = v5;
  int v7 = open((const char *)a1, 17825792);
  *(_DWORD *)uint64_t v6 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    memset(&v17, 0, sizeof(v17));
    if (!fstat(v7, &v17))
    {
      if (v17.st_dev != *(_DWORD *)(a1 + 1792))
      {
        int v14 = 18;
        goto LABEL_38;
      }
      v6[4] = 0;
      *((void *)v6 + 1) = a1;
      size_t v8 = 20 * *(void *)(a1 + 1824);
      *((void *)v6 + 2) = v8;
      uint64_t v9 = *(void *)(a1 + 1856);
      if (v9)
      {
        *(void *)(a1 + 1856) = 0;
        *((void *)v6 + 3) = v9;
LABEL_23:
        *((void *)v6 + 4) = 0;
        *((void *)v6 + 5) = 0;
        *(void *)(i + 72) = v6;
        *(void *)&v17.st_dev = 0;
        int v13 = NextEntryFromParent(a1, i, &v17, &v16);
        if (v13 != 2)
        {
          if (v13 == 1)
          {
            uint64_t v4 = *(void *)&v17.st_dev;
            goto LABEL_31;
          }
          *(_DWORD *)(i + 40) = v16;
          *(_DWORD *)(i + 48) = 6;
        }
        *(unsigned char *)(a1 + *(void *)(i + 16)) = 0;
        uint64_t v4 = i;
LABEL_31:
        *(void *)(a1 + 1840) = v4;
        if (v4) {
          return v4;
        }
        goto LABEL_32;
      }
      uint64_t v12 = malloc_type_malloc(v8, 0x8C0FF819uLL);
      *((void *)v6 + 3) = v12;
      if (v12) {
        goto LABEL_23;
      }
    }
    int v14 = *__error();
LABEL_38:
    int v16 = v14;
    close(*(_DWORD *)v6);
    goto LABEL_39;
  }
  int v14 = *__error();
  int v16 = v14;
LABEL_39:
  free(v6);
LABEL_40:
  *(void *)(i + 72) = 0;
  *(_DWORD *)(i + 40) = v14;
  if (v14 == 12)
  {
    DirEnumEntryFree(a1, i);
    *(unsigned char *)(a1 + 1833) = 1;
    goto LABEL_21;
  }
  if (v14 == 18) {
    *(_DWORD *)(i + 40) = 0;
  }
  else {
    *(_DWORD *)(i + 48) = 6;
  }
LABEL_43:
  *(void *)(a1 + 1840) = i;
  return i;
}

uint64_t corePropertyProviderCopyAndCacheValues(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _FileCacheLock(a2);
  if (a6 < 1)
  {
LABEL_19:
    _FileCacheUnlock(a2);
    return 1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = (const void *)*MEMORY[0x1E4F1D588];
  int v13 = (const void *)*MEMORY[0x1E4F1D748];
  while (1)
  {
    CFTypeRef cf = 0;
    uint64_t v14 = *(void *)(a5 + 8 * v11);
    if ((*(unsigned char *)(v14 + 8) & 2) == 0
      || !_FileCacheGetPropertyValueForKey(a2, *(const void **)v14, (void **)&cf))
    {
      break;
    }
    if (cf) {
      CFRetain(cf);
    }
LABEL_18:
    *(void *)(a4 + 8 * v11++) = cf;
    if (a6 == v11) {
      goto LABEL_19;
    }
  }
  unint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *))(v14 + 24);
  if (v15)
  {
    uint64_t Attributes = _FileCacheGetAttributes(a2);
    int v17 = v15(a1, Attributes, &cf);
    if (v17 == 2) {
      _FileCacheSetPropertyValueForKey(a2, *(const void **)v14, cf);
    }
    if (cf)
    {
      if (*(void *)(v14 + 16) == 7)
      {
        if (CFEqual(*(CFTypeRef *)v14, v12))
        {
          CFTypeRef v22 = 0;
          if (_FileCacheGetPropertyValueForKey(a2, v13, (void **)&v22))
          {
            if (cf != v22 && CFEqual(cf, v22))
            {
              uint64_t v18 = _FileCacheGetAttributes(a2);
              _FileCacheSetPropertyValueForKey(a2, v13, *(const void **)(v18 + 232));
            }
          }
        }
      }
    }
    if (v17) {
      goto LABEL_18;
    }
  }
  _FileCacheUnlock(a2);
  uint64_t v20 = 0;
  do
  {
    uint64_t v21 = *(const void **)(a4 + 8 * v20);
    if (v21)
    {
      CFRelease(v21);
      *(void *)(a4 + 8 * v20) = 0;
    }
    ++v20;
  }
  while (v11 + 1 != v20);
  return 0;
}

uint64_t parseAttributeBuffer(CFAllocatorRef alloc, const char *a2, _DWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7 = a7;
  uint64_t v136 = a5;
  v131 = a2;
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  uint64_t v139 = a5;
  long long v145 = 0uLL;
  long long v144 = 0uLL;
  unsigned int v10 = a3[1];
  int v11 = a3[3];
  int v12 = a3[4];
  unsigned int v13 = a3[5];
  int v135 = v11;
  if ((v10 & 0x80000000) != 0)
  {
    unsigned int v16 = a4[1];
    int v133 = a4[3];
    unsigned int v15 = a4[5];
    int v137 = a4[4];
    uint64_t v14 = 6;
  }
  else
  {
    uint64_t v14 = 1;
    unsigned int v15 = v13;
    int v137 = v12;
    int v133 = v11;
    unsigned int v16 = v10;
  }
  int v17 = &a4[v14];
  if (*(_DWORD *)a6 & 1 | ((~v16 & 0x79C0D) == 0)) {
    int v18 = 3;
  }
  else {
    int v18 = 0;
  }
  unsigned int v19 = v18 | *(_DWORD *)a6 & 0xFFFFFFFC;
  *(_DWORD *)a6 = v19;
  int v20 = dword_1EB20DE74 & ~v10 | dword_1EB20DE84 & ~v13;
  BOOL v21 = v20 != 0;
  if (!v20)
  {
    v19 |= 4u;
    *(_DWORD *)a6 = v19;
  }
  CFTypeRef v22 = (UInt8 *)v17 + ((v16 >> 27) & 4);
  if ((dword_1EB20DE98 & ~v12) == 0) {
    *(_DWORD *)a6 = v19 | 0x40;
  }
  if (v10)
  {
    if (v16)
    {
      int v23 = *((_DWORD *)v22 + 1);
      if (!v23)
      {
        syslog(3, "parseAttributeBuffer: ATTR_CMN_NAME was returned with 0 attr_length");
        return 22;
      }
      int v130 = v12;
      BOOL v24 = v20 != 0;
      SetNameAndHiddenFlagsFromCString(alloc, &v22[*(int *)v22], (v23 - 1), a6);
      v22 += 8;
      int v7 = a7;
      BOOL v21 = v24;
      int v12 = v130;
    }
    else
    {
      SetNameAndHiddenFlagsFromCString(alloc, (UInt8 *)"", 0, a6);
    }
  }
  int v26 = &v22[(2 * v16) & 4];
  if ((v10 & 4) != 0)
  {
    if ((v16 & 4) != 0)
    {
      uint64_t v28 = *(void *)v26;
      v26 += 8;
      *(void *)(a6 + 104) = v28;
      if ((v16 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_22;
    }
    *(void *)(a6 + 104) = 0;
  }
  if ((v16 & 8) == 0)
  {
LABEL_20:
    int v27 = 0;
    goto LABEL_23;
  }
LABEL_22:
  int v29 = *(_DWORD *)v26;
  v26 += 4;
  int v27 = v29;
LABEL_23:
  CFErrorRef v30 = (uint64_t *)&v26[((v16 >> 4) & 8)
                      + ((v16 >> 2) & 4)
                      + (unint64_t)((v16 >> 2) & 8)
                      + ((v16 >> 3) & 8)
                      + ((v16 >> 6) & 4)];
  if ((v10 & 0x200) != 0)
  {
    if ((v16 & 0x200) != 0)
    {
      uint64_t v32 = *v30;
      uint64_t v33 = v30[1];
      v30 += 2;
      double v31 = (double)v32 - *MEMORY[0x1E4F1CF78] + (double)v33 * 0.000000001;
    }
    else
    {
      double v31 = -1.0 - *MEMORY[0x1E4F1CF68];
    }
    *(double *)(a6 + 80) = v31;
    if ((v10 & 0x400) == 0)
    {
LABEL_25:
      if ((v10 & 0x800) == 0) {
        goto LABEL_26;
      }
      goto LABEL_36;
    }
  }
  else if ((v10 & 0x400) == 0)
  {
    goto LABEL_25;
  }
  if ((v16 & 0x400) != 0)
  {
    uint64_t v35 = *v30;
    uint64_t v36 = v30[1];
    v30 += 2;
    double v34 = (double)v35 - *MEMORY[0x1E4F1CF78] + (double)v36 * 0.000000001;
  }
  else
  {
    double v34 = -*MEMORY[0x1E4F1CF78];
  }
  *(double *)(a6 + 64) = v34;
  if ((v10 & 0x800) == 0)
  {
LABEL_26:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_40;
  }
LABEL_36:
  if ((v16 & 0x800) != 0)
  {
    uint64_t v38 = *v30;
    uint64_t v39 = v30[1];
    v30 += 2;
    double v37 = (double)v38 - *MEMORY[0x1E4F1CF78] + (double)v39 * 0.000000001;
  }
  else
  {
    double v37 = -*MEMORY[0x1E4F1CF78];
  }
  *(double *)(a6 + 72) = v37;
  if ((v10 & 0x1000) != 0)
  {
LABEL_40:
    if ((v16 & 0x1000) != 0)
    {
      uint64_t v41 = *v30;
      uint64_t v42 = v30[1];
      v30 += 2;
      double v40 = (double)v41 - *MEMORY[0x1E4F1CF78] + (double)v42 * 0.000000001;
    }
    else
    {
      double v40 = -*MEMORY[0x1E4F1CF78];
    }
    *(double *)(a6 + 56) = v40;
  }
LABEL_44:
  v43 = (int *)((char *)v30 + ((v16 >> 9) & 0x10));
  if ((v10 & 0x4000) != 0)
  {
    if ((v16 & 0x4000) != 0)
    {
      uint64_t v45 = 0;
      int v46 = *(_DWORD *)a6 | 0x10;
      *(_DWORD *)a6 = v46;
      do
      {
        if (*((unsigned char *)v43 + v45)) {
          break;
        }
        ++v45;
      }
      while (v45 != 32);
      *(_DWORD *)a6 = v46 & 0xFBFFFFFF | ((v45 == 32) << 26);
      long long v47 = *(_OWORD *)v43;
      long long v48 = *((_OWORD *)v43 + 1);
      v43 += 8;
      *(_OWORD *)(a6 + 160) = v47;
      *(_OWORD *)(a6 + 176) = v48;
      if (v45 != 32)
      {
        v49 = (int8x8_t *)(a6 + 160);
        if (v27 == 2) {
          int8x8_t v50 = vrev16_s8(*v49);
        }
        else {
          int8x8_t v50 = vrev32_s8(*v49);
        }
        int8x8_t v51 = vrev16_s8(*(int8x8_t *)(a6 + 168));
        *(int8x8_t *)(a6 + 160) = v50;
        *(int8x8_t *)(a6 + 168) = v51;
        if (v27 == 2)
        {
          *(_WORD *)(a6 + 178) = bswap32(*(unsigned __int16 *)(a6 + 178)) >> 16;
          *(_WORD *)(a6 + 176) = bswap32(*(unsigned __int16 *)(a6 + 176)) >> 16;
          *(_DWORD *)(a6 + 180) = bswap32(*(_DWORD *)(a6 + 180));
        }
        else
        {
          *(int8x8_t *)(a6 + 176) = vrev16_s8(*(int8x8_t *)(a6 + 176));
        }
        *(_WORD *)(a6 + 184) = bswap32(*(unsigned __int16 *)(a6 + 184)) >> 16;
        *(_WORD *)(a6 + 186) = bswap32(*(unsigned __int16 *)(a6 + 186)) >> 16;
        *(_DWORD *)(a6 + 188) = bswap32(*(_DWORD *)(a6 + 188));
      }
    }
    else
    {
      if (v7) {
        int v44 = 67108880;
      }
      else {
        int v44 = 0x4000000;
      }
      *(_DWORD *)a6 = v44 | *(_DWORD *)a6 & 0xFBFFFFEF;
      *(_OWORD *)(a6 + 160) = 0u;
      *(_OWORD *)(a6 + 176) = 0u;
    }
  }
  if ((v10 & 0x8000) != 0)
  {
    if ((v16 & 0x8000) != 0)
    {
      int v52 = *v43++;
      *(_DWORD *)(a6 + 40) = v52;
      if ((v10 & 0x10000) != 0) {
        goto LABEL_69;
      }
    }
    else
    {
      *(_DWORD *)(a6 + 40) = 0;
      if ((v10 & 0x10000) != 0) {
        goto LABEL_69;
      }
    }
LABEL_63:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_73;
  }
  if ((v10 & 0x10000) == 0) {
    goto LABEL_63;
  }
LABEL_69:
  if ((v16 & 0x10000) != 0)
  {
    int v53 = *v43++;
    *(_DWORD *)(a6 + 44) = v53;
    if ((v10 & 0x20000) == 0) {
      goto LABEL_78;
    }
  }
  else
  {
    *(_DWORD *)(a6 + 44) = 0;
    if ((v10 & 0x20000) == 0) {
      goto LABEL_78;
    }
  }
LABEL_73:
  if ((v16 & 0x20000) != 0)
  {
    int v55 = *v43++;
    int v54 = v55;
  }
  else
  {
    int v54 = 0;
  }
  *(_DWORD *)(a6 + 16) = v54;
  if ((v27 - 1) <= 6) {
    *(_DWORD *)(a6 + 16) = v54 | dword_181791300[v27 - 1];
  }
LABEL_78:
  if ((v10 & 0x40000) == 0)
  {
    if ((v10 & 0x80000) == 0) {
      goto LABEL_80;
    }
LABEL_87:
    if ((v16 & 0x80000) != 0)
    {
      int v57 = *v43++;
      *(_DWORD *)(a6 + 32) = v57;
      if ((v10 & 0x100000) != 0) {
        goto LABEL_91;
      }
    }
    else
    {
      *(_DWORD *)(a6 + 32) = 0;
      if ((v10 & 0x100000) != 0) {
        goto LABEL_91;
      }
    }
LABEL_81:
    if ((v10 & 0x200000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_95;
  }
  if ((v16 & 0x40000) != 0)
  {
    int v56 = *v43++;
    *(_DWORD *)(a6 + 20) = v56;
    if ((v10 & 0x80000) != 0) {
      goto LABEL_87;
    }
  }
  else
  {
    *(_DWORD *)(a6 + 20) = 0;
    if ((v10 & 0x80000) != 0) {
      goto LABEL_87;
    }
  }
LABEL_80:
  if ((v10 & 0x100000) == 0) {
    goto LABEL_81;
  }
LABEL_91:
  if ((v16 & 0x100000) != 0)
  {
    int v58 = *v43++;
    *(_DWORD *)(a6 + 36) = v58;
    if ((v10 & 0x200000) == 0) {
      goto LABEL_99;
    }
  }
  else
  {
    *(_DWORD *)(a6 + 36) = 0;
    if ((v10 & 0x200000) == 0) {
      goto LABEL_99;
    }
  }
LABEL_95:
  int v59 = *(_DWORD *)a6 | 8;
  *(_DWORD *)a6 = v59;
  if ((v16 & 0x200000) != 0)
  {
    int v61 = *v43++;
    char v60 = v61;
  }
  else
  {
    char v60 = 0;
  }
  *(_DWORD *)a6 = v59 & 0xFC7FFFFF | ((v60 & 7) << 23);
LABEL_99:
  acl_t v138 = 0;
  if ((v10 & 0x400000) == 0 || (v16 & 0x400000) == 0)
  {
    v62 = v43;
    if ((v16 & 0x800000) != 0) {
      goto LABEL_109;
    }
    goto LABEL_105;
  }
  v62 = v43 + 2;
  if (!v43[1])
  {
    acl_t v138 = 0;
    if ((v16 & 0x800000) != 0) {
      goto LABEL_109;
    }
LABEL_105:
    v134 = 0;
    if ((v16 & 0x1000000) == 0) {
      goto LABEL_110;
    }
    goto LABEL_106;
  }
  int v63 = v27;
  acl_t v64 = acl_copy_int_native((char *)v43 + *v43);
  int v27 = v63;
  acl_t v138 = v64;
  if ((v16 & 0x800000) == 0) {
    goto LABEL_105;
  }
LABEL_109:
  long long v66 = *(_OWORD *)v62;
  v62 += 4;
  long long v145 = v66;
  v134 = (const unsigned __int8 *)&v145;
  if ((v16 & 0x1000000) == 0)
  {
LABEL_110:
    v132 = 0;
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_113;
    }
    goto LABEL_111;
  }
LABEL_106:
  long long v65 = *(_OWORD *)v62;
  v62 += 4;
  long long v144 = v65;
  v132 = (const unsigned __int8 *)&v144;
  if ((v10 & 0x2000000) == 0)
  {
LABEL_113:
    if ((v10 & 0x4000000) == 0) {
      goto LABEL_114;
    }
LABEL_119:
    if ((v16 & 0x4000000) != 0)
    {
      uint64_t v68 = *(void *)v62;
      v62 += 2;
      *(void *)(a6 + 136) = v68;
      if ((v10 & 0x8000000) != 0) {
        goto LABEL_123;
      }
    }
    else
    {
      *(void *)(a6 + 136) = 0;
      if ((v10 & 0x8000000) != 0) {
        goto LABEL_123;
      }
    }
LABEL_115:
    if ((v10 & 0x10000000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_133;
  }
LABEL_111:
  if ((v16 & 0x2000000) == 0)
  {
    *(void *)(a6 + 120) = 0;
    goto LABEL_113;
  }
  uint64_t v67 = *(void *)v62;
  v62 += 2;
  *(void *)(a6 + 120) = v67;
  if ((v10 & 0x4000000) != 0) {
    goto LABEL_119;
  }
LABEL_114:
  if ((v10 & 0x8000000) == 0) {
    goto LABEL_115;
  }
LABEL_123:
  if ((v16 & 0x8000000) != 0)
  {
    BOOL v129 = v21;
    int v130 = v12;
    HIDWORD(v128) = v13;
    unsigned int v71 = v15;
    uint64_t v72 = *v62;
    CFIndex v73 = (v62[1] - 1);
    v74 = *(const void **)(a6 + 232);
    if (v74)
    {
      int v75 = v27;
      CFRelease(v74);
      int v27 = v75;
    }
    v76 = v62 + 2;
    if (v73)
    {
      v77 = (const UInt8 *)v62 + v72;
      int v78 = v27;
      CFStringRef v79 = CFStringCreateWithBytes(alloc, v77, v73, 0x8000100u, 0);
      int v27 = v78;
    }
    else
    {
      CFStringRef v79 = 0;
    }
    *(void *)(a6 + 232) = v79;
    v62 = v76;
    unsigned int v15 = v71;
    LOWORD(v13) = WORD2(v128);
    LOBYTE(v21) = v129;
    int v12 = v130;
  }
  else
  {
    v69 = *(const void **)(a6 + 232);
    if (v69)
    {
      int v70 = v27;
      CFRelease(v69);
      int v27 = v70;
      *(void *)(a6 + 232) = 0;
    }
  }
  *(_DWORD *)a6 |= 0x100u;
  if ((v10 & 0x10000000) == 0)
  {
LABEL_116:
    if ((v10 & 0x40000000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_137;
  }
LABEL_133:
  if ((v16 & 0x10000000) != 0)
  {
    uint64_t v81 = *(void *)v62;
    uint64_t v82 = *((void *)v62 + 1);
    v62 += 4;
    double v80 = (double)v81 - *MEMORY[0x1E4F1CF78] + (double)v82 * 0.000000001;
  }
  else
  {
    double v80 = -1.0 - *MEMORY[0x1E4F1CF68];
  }
  *(double *)(a6 + 88) = v80;
  if ((v10 & 0x40000000) != 0)
  {
LABEL_137:
    if ((v16 & 0x40000000) != 0)
    {
      int v83 = *v62++;
      *(_DWORD *)(a6 + 48) = v83;
    }
    else
    {
      *(_DWORD *)(a6 + 48) = 0;
    }
  }
LABEL_140:
  BOOL v84 = v27 == 2;
  unsigned int v85 = v137;
  if (!v84)
  {
    unsigned int v86 = *(_DWORD *)a6 & 0xFFFFDFFF;
    *(_DWORD *)a6 = v86;
    if (!v12) {
      goto LABEL_185;
    }
    if (v12)
    {
      if (v85)
      {
        int v91 = *v62++;
        int v89 = v91;
      }
      else
      {
        int v89 = 1;
      }
      *(_DWORD *)(a6 + 24) = v89;
    }
    v62 = (int *)((char *)v62 + ((4 * v85) & 8)
                              + ((2 * v85) & 8)
                              + (unint64_t)((v85 >> 1) & 4)
                              + ((v85 >> 3) & 4));
    if ((v12 & 0x200) == 0)
    {
      if ((v12 & 0x400) == 0) {
        goto LABEL_156;
      }
LABEL_169:
      if ((v85 & 0x400) != 0)
      {
        uint64_t v97 = *(void *)v62;
        v62 += 2;
        *(void *)(a6 + 216) = v97;
        if ((v12 & 0x1000) != 0) {
          goto LABEL_178;
        }
      }
      else
      {
        *(void *)(a6 + 216) = 0;
        if ((v12 & 0x1000) != 0) {
          goto LABEL_178;
        }
      }
LABEL_157:
      if ((v12 & 0x2000) == 0) {
        goto LABEL_185;
      }
LABEL_182:
      if ((v85 & 0x2000) != 0)
      {
        uint64_t v99 = *(void *)v62;
        v62 += 2;
        *(void *)(a6 + 200) = v99;
      }
      else
      {
        *(void *)(a6 + 200) = 0;
      }
      goto LABEL_185;
    }
    if ((v85 & 0x200) != 0)
    {
      uint64_t v94 = *(void *)v62;
      v62 += 2;
      *(void *)(a6 + 208) = v94;
      if ((v12 & 0x400) != 0) {
        goto LABEL_169;
      }
    }
    else
    {
      *(void *)(a6 + 208) = 0;
      if ((v12 & 0x400) != 0) {
        goto LABEL_169;
      }
    }
LABEL_156:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_157;
    }
LABEL_178:
    v86 |= 0x20u;
    *(_DWORD *)a6 = v86;
    if ((v85 & 0x1000) != 0)
    {
      uint64_t v98 = *(void *)v62;
      v62 += 2;
      *(void *)(a6 + 192) = v98;
      if ((v12 & 0x2000) == 0) {
        goto LABEL_185;
      }
    }
    else
    {
      *(void *)(a6 + 192) = 0;
      if ((v12 & 0x2000) == 0) {
        goto LABEL_185;
      }
    }
    goto LABEL_182;
  }
  *(_OWORD *)(a6 + 192) = 0u;
  *(_OWORD *)(a6 + 208) = 0u;
  unsigned int v86 = *(_DWORD *)a6 & 0xFFFFFFDF;
  *(_DWORD *)a6 = v86;
  char v87 = v135;
  if (!v135) {
    goto LABEL_185;
  }
  if ((v135 & 1) == 0)
  {
    char v88 = v133;
    if ((v133 & 2) == 0) {
      goto LABEL_165;
    }
LABEL_164:
    int v93 = *v62++;
    *(_DWORD *)(a6 + 28) = v93;
    v86 |= 0x400u;
    *(_DWORD *)a6 = v86;
    goto LABEL_165;
  }
  char v88 = v133;
  if (v133)
  {
    int v92 = *v62++;
    int v90 = v92;
  }
  else
  {
    int v90 = 1;
  }
  *(_DWORD *)(a6 + 24) = v90;
  if ((v88 & 2) != 0) {
    goto LABEL_164;
  }
LABEL_165:
  if ((v87 & 4) != 0)
  {
    if ((v88 & 4) != 0)
    {
      int v95 = *v62++;
      unsigned int v86 = v86 & 0xFFFF9FFF | ((v95 & 3) << 13);
      *(_DWORD *)a6 = v86;
      char v96 = (v95 & 3) == 0 || v21;
      if ((v96 & 1) == 0)
      {
        *(int64x2_t *)(a6 + 120) = vdupq_n_s64(2uLL);
        *(void *)(a6 + 136) = 1;
      }
    }
    else
    {
      v86 &= 0xFFFF9FFF;
      *(_DWORD *)a6 = v86;
    }
  }
LABEL_185:
  uint64_t v100 = 0;
  if ((v13 & 0x10) != 0 && (v15 & 0x10) != 0)
  {
    uint64_t v101 = *(void *)v62;
    v62 += 2;
    uint64_t v100 = v101;
  }
  v102 = (int *)((char *)v62 + ((v15 >> 2) & 8));
  if ((v13 & 0x40) != 0 && (v15 & 0x40) != 0)
  {
    int v103 = *v102++;
    *(_DWORD *)(a6 + 100) = v103;
  }
  if ((v13 & 0x100) != 0 && (v15 & 0x100) != 0)
  {
    uint64_t v104 = *(void *)v102;
    v102 += 2;
    *(void *)(a6 + 144) = v104;
  }
  if ((v13 & 0x200) != 0 && (v15 & 0x200) != 0)
  {
    v86 |= 0x200u;
    *(_DWORD *)a6 = v86;
    *(void *)(a6 + 152) = *(void *)v102;
  }
  BOOL v105 = (dword_1EB20DE5C & ~v10) == 0;
  if ((v86 & 0x4000) != 0)
  {
    *(_DWORD *)a6 = v86 & 0xFF817FFF | 0x400000;
    *(_DWORD *)(a6 + 112) = 0;
    if (!v21)
    {
      *(int64x2_t *)(a6 + 120) = vdupq_n_s64(2uLL);
      *(_OWORD *)(a6 + 136) = xmmword_1817911B0;
    }
    acl_t v113 = v138;
    if (!v105) {
      goto LABEL_244;
    }
    goto LABEL_226;
  }
  BOOL v106 = v21;
  uint64_t v107 = MountInfoStorageSize();
  v108 = (char *)&v128 - ((MEMORY[0x1F4188790](v107) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v136)
  {
    int FSID = MountInfoGetFSID(v136);
    int v110 = *(_DWORD *)(a6 + 104);
    if (v110 == FSID)
    {
      char v111 = v15;
      int v137 = 1;
      uint64_t v112 = v136;
      goto LABEL_208;
    }
  }
  else
  {
    int v110 = *(_DWORD *)(a6 + 104);
  }
  uint64_t v139 = 0;
  if (!MountInfoPrepare(&v139, 0, v110, v108, 0, 0, 0))
  {
    *(void *)(a6 + 128) = *(void *)(a6 + 120);
    acl_t v113 = v138;
    goto LABEL_225;
  }
  char v111 = v15;
  int v137 = 0;
  uint64_t v112 = v139;
LABEL_208:
  unint64_t Capabilities = MountInfoGetCapabilities(v112);
  *(_DWORD *)(a6 + 112) = MountInfoGetMountID(v139);
  *(_DWORD *)a6 = (Capabilities >> 44) & 0x10000 | (Capabilities >> 36) & 0x8000 | ((Capabilities & 0x800000000000) >> 30) | (Capabilities >> 40) & 0x80000 | (Capabilities >> 29) & 0x100000 | (Capabilities >> 37) & 0x200000 | *(_DWORD *)a6 & 0xFFC47FFF;
  *(_DWORD *)a6 = *(_DWORD *)a6 & 0xFFBFFFFF | (((MountInfoGetVolumeFlags(v139) >> 1) & 1) << 22);
  *(_DWORD *)(a6 + 96) = MountInfoGetIOBlockSize(v139);
  if ((Capabilities & 0x800000000000) == 0 && (dword_1EB20DE5C & ~v10 & 0xFE3FFFFF) == 0) {
    BOOL v105 = 1;
  }
  int v115 = *(_DWORD *)a6;
  char v116 = (*(_DWORD *)a6 & 0x8000) == 0 || v106;
  if ((v116 & 1) == 0)
  {
    if ((v111 & 0x10) == 0) {
      uint64_t v100 = *(void *)(a6 + 120);
    }
    *(void *)(a6 + 128) = v100;
  }
  if ((v115 & 0x2000) != 0 && !strcmp(v131, "/"))
  {
    VolumeName = (const char *)MountInfoGetVolumeName(v139);
    if (VolumeName)
    {
      v118 = (UInt8 *)VolumeName;
      size_t v119 = strlen(VolumeName);
      SetNameAndHiddenFlagsFromCString(alloc, v118, v119, a6);
    }
  }
  acl_t v113 = v138;
  if ((v137 & 1) == 0) {
    MountInfoDestroy(v139);
  }
LABEL_225:
  if (v105)
  {
LABEL_226:
    *(_DWORD *)a6 |= 0x80u;
    v120 = *(const void **)(a6 + 224);
    if (v120)
    {
      CFRelease(v120);
      *(void *)(a6 + 224) = 0;
    }
    int v121 = *(_DWORD *)(a6 + 40);
    int v122 = *(_DWORD *)(a6 + 44);
    int v123 = *(_DWORD *)(a6 + 16);
    acl_t v143 = v113;
    int v141 = v122;
    int v142 = v121;
    __int16 v140 = v123;
    v124 = filesec_init();
    if (!v124) {
      goto LABEL_244;
    }
    v125 = v124;
    if (!v113) {
      goto LABEL_252;
    }
    if (filesec_set_property(v124, FILESEC_ACL, &v143)) {
      goto LABEL_243;
    }
    if (!v143)
    {
LABEL_252:
      if (!v134 || uuid_is_null(v134))
      {
LABEL_235:
        if ((!v143 && (!v132 || uuid_is_null(v132)) || !filesec_set_property(v125, FILESEC_GRPUUID, v132))
          && !filesec_set_property(v125, FILESEC_OWNER, &v142)
          && !filesec_set_property(v125, FILESEC_GROUP, &v141)
          && !filesec_set_property(v125, FILESEC_MODE, &v140))
        {
          uint64_t v127 = _CFFileSecurityCreateFromFilesec();
          *(void *)(a6 + 224) = v127;
          if (v127) {
            goto LABEL_244;
          }
        }
        goto LABEL_243;
      }
    }
    if (!filesec_set_property(v125, FILESEC_UUID, v134)) {
      goto LABEL_235;
    }
LABEL_243:
    filesec_free(v125);
  }
LABEL_244:
  if (v113) {
    acl_free(v113);
  }
  return 0;
}

uint64_t MountInfoStorageSize()
{
  return 3024;
}

uint64_t MountInfoPrepare(void *a1, int a2, int a3, char *a4, uint64_t a5, const __CFString *a6, CFErrorRef *a7)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (*a1) {
    return 1;
  }
  if (a2) {
    a3 = a2;
  }
  bzero(a4, 0xBD0uLL);
  if (CreateMountInfo(int,MountInfoBuf *)::onceToken != -1) {
    dispatch_once(&CreateMountInfo(int,MountInfoBuf *)::onceToken, &__block_literal_global_6_0);
  }
  os_unfair_lock_lock(&sMountEntrysSpinLock);
  int v12 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)sEntriesChanged, (unsigned __int8 *)&v12, 0);
  unsigned int v13 = (uint64_t *)sMountEntrys;
  if (v12 == 1 && sMountEntrys != 0)
  {
    do
    {
      sMountEntrys = *v13;
      free(v13);
      unsigned int v13 = (uint64_t *)sMountEntrys;
    }
    while (sMountEntrys);
  }
  unsigned int v15 = &sMountEntrys;
  while (1)
  {
    unsigned int v15 = (uint64_t *)*v15;
    if (!v15) {
      break;
    }
    if (*((_DWORD *)v15 + 14) == a3)
    {
      memcpy(a4, v15 + 1, 0xBD0uLL);
LABEL_16:
      os_unfair_lock_unlock(&sMountEntrysSpinLock);
      *a1 = a4;
      return 1;
    }
  }
  char v96 = 0;
  int v17 = getmntinfo_r_np(&v96, 2);
  if (v17)
  {
    int v18 = v96;
    if (v17 < 1)
    {
LABEL_24:
      int v21 = 2;
    }
    else
    {
      uint64_t v19 = v17;
      int v20 = v96;
      while (v20->f_fsid.val[0] != a3)
      {
        ++v20;
        if (!--v19) {
          goto LABEL_24;
        }
      }
      memcpy(a4, v20, 0x878uLL);
      int v21 = 0;
    }
    free(v18);
    if (!v21)
    {
LABEL_29:
      long long v93 = xmmword_1817914D0;
      uint64_t v94 = 0;
      bzero(&v96, 0x388uLL);
      int v21 = filtered_getattrlist(a4 + 88, &v93, &v96, 0x388uLL, 9u);
      if (!v21)
      {
        __int16 v24 = v97;
        if ((v97 & 0x20000) != 0)
        {
          *(int32x2_t *)v22.i8 = v100;
          *(int32x2_t *)v23.i8 = v101;
          int8x16_t v27 = (int8x16_t)vdupq_lane_s32(v100, 0);
          int8x16_t v28 = (int8x16_t)vdupq_lane_s32(v101, 0);
          int8x16_t v29 = (int8x16_t)vdupq_lane_s32(v100, 1);
          int32x4_t v30 = (int32x4_t)vandq_s8(v29, (int8x16_t)xmmword_1817913C0);
          int32x4_t v31 = vceqzq_s32((int32x4_t)vandq_s8(v29, (int8x16_t)xmmword_1817913D0));
          v32.i64[0] = v31.i32[2];
          v32.i64[1] = v31.i32[3];
          int8x16_t v33 = (int8x16_t)v32;
          int32x4_t v34 = vceqzq_s32(v30);
          v32.i64[0] = v34.i32[2];
          v32.i64[1] = v34.i32[3];
          int8x16_t v35 = (int8x16_t)v32;
          v32.i64[0] = v31.i32[0];
          v32.i64[1] = v31.i32[1];
          int8x16_t v36 = (int8x16_t)v32;
          v32.i64[0] = v34.i32[0];
          v32.i64[1] = v34.i32[1];
          int8x16_t v37 = (int8x16_t)v32;
          int8x16_t v38 = (int8x16_t)vdupq_lane_s32(v101, 1);
          int8x16_t v39 = vandq_s8(v38, (int8x16_t)xmmword_1817913D0);
          int8x16_t v40 = vandq_s8(v38, (int8x16_t)xmmword_1817913C0);
          v32.i64[0] = v40.u32[0];
          v32.i64[1] = v40.u32[1];
          uint64x2_t v41 = v32;
          v32.i64[0] = v39.u32[0];
          v32.i64[1] = v39.u32[1];
          uint64x2_t v42 = v32;
          v32.i64[0] = v40.u32[2];
          v32.i64[1] = v40.u32[3];
          int64x2_t v43 = (int64x2_t)v32;
          v32.i64[0] = v39.u32[2];
          v32.i64[1] = v39.u32[3];
          int8x16_t v44 = (int8x16_t)vshlq_n_s64(v43, 0x2CuLL);
          int8x16_t v45 = vbicq_s8((int8x16_t)vshlq_u64(v41, (uint64x2_t)xmmword_181791400), v37);
          int8x16_t v46 = vbicq_s8((int8x16_t)vshlq_u64(v42, (uint64x2_t)xmmword_1817913F0), v36);
          int8x16_t v47 = vbicq_s8(v44, v35);
          int8x16_t v48 = vbicq_s8((int8x16_t)vshlq_u64(v32, (uint64x2_t)xmmword_1817913E0), v33);
          int32x4_t v49 = (int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_181791410);
          int32x4_t v50 = (int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_181791420);
          int32x4_t v51 = vceqzq_s32((int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_181791440));
          v32.i64[0] = v51.i32[2];
          v32.i64[1] = v51.i32[3];
          int8x16_t v52 = (int8x16_t)v32;
          int32x4_t v53 = vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vzip1q_s32(v22, v22), (int8x16_t)xmmword_181791430));
          v32.i64[0] = v53.i32[2];
          v32.i64[1] = v53.i32[3];
          int8x16_t v54 = (int8x16_t)v32;
          int32x4_t v55 = vceqzq_s32(v50);
          v32.i64[0] = v55.i32[2];
          v32.i64[1] = v55.i32[3];
          int8x16_t v56 = (int8x16_t)v32;
          int32x4_t v57 = vceqzq_s32(v49);
          v32.i64[0] = v57.i32[2];
          v32.i64[1] = v57.i32[3];
          int8x16_t v58 = (int8x16_t)v32;
          v32.i64[0] = v51.i32[0];
          v32.i64[1] = v51.i32[1];
          int8x16_t v59 = (int8x16_t)v32;
          v32.i64[0] = v53.i32[0];
          v32.i64[1] = v53.i32[1];
          int8x16_t v60 = (int8x16_t)v32;
          v32.i64[0] = v55.i32[0];
          v32.i64[1] = v55.i32[1];
          int8x16_t v61 = (int8x16_t)v32;
          v32.i64[0] = v57.i32[0];
          v32.i64[1] = v57.i32[1];
          int8x16_t v62 = (int8x16_t)v32;
          int8x16_t v63 = vandq_s8(v28, (int8x16_t)xmmword_181791440);
          int8x16_t v64 = vandq_s8((int8x16_t)vzip1q_s32(v23, v23), (int8x16_t)xmmword_181791430);
          int8x16_t v65 = vandq_s8(v28, (int8x16_t)xmmword_181791420);
          int8x16_t v66 = vandq_s8(v28, (int8x16_t)xmmword_181791410);
          v32.i64[0] = v66.u32[0];
          v32.i64[1] = v66.u32[1];
          uint64x2_t v67 = v32;
          v32.i64[0] = v65.u32[0];
          v32.i64[1] = v65.u32[1];
          uint64x2_t v68 = v32;
          v32.i64[0] = v64.u32[0];
          v32.i64[1] = v64.u32[1];
          int64x2_t v69 = (int64x2_t)v32;
          v32.i64[0] = v63.u32[0];
          v32.i64[1] = v63.u32[1];
          uint64x2_t v70 = v32;
          v32.i64[0] = v66.u32[2];
          v32.i64[1] = v66.u32[3];
          uint64x2_t v71 = v32;
          v32.i64[0] = v65.u32[2];
          v32.i64[1] = v65.u32[3];
          uint64x2_t v72 = v32;
          v32.i64[0] = v64.u32[2];
          v32.i64[1] = v64.u32[3];
          uint64x2_t v73 = v32;
          v32.i64[0] = v63.u32[2];
          v32.i64[1] = v63.u32[3];
          int8x16_t v74 = vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v68, (uint64x2_t)xmmword_181791490), v61), vbicq_s8((int8x16_t)vshlq_u64(v67, (uint64x2_t)xmmword_1817914A0), v62)), vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v70, (uint64x2_t)xmmword_181791490), v59), vbicq_s8((int8x16_t)vshlq_n_s64(v69, 0x30uLL), v60))), vorrq_s8(vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v72, (uint64x2_t)xmmword_181791470), v56), vbicq_s8((int8x16_t)vshlq_u64(v71, (uint64x2_t)xmmword_181791480), v58)), vorrq_s8(vbicq_s8((int8x16_t)vshlq_u64(v32, (uint64x2_t)xmmword_181791450), v52), vbicq_s8((int8x16_t)vshlq_u64(v73, (uint64x2_t)xmmword_181791460), v54)))), vorrq_s8(vorrq_s8(v46, v45), vorrq_s8(v48, v47)));
          int8x8_t v75 = vorr_s8(*(int8x8_t *)v74.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v74, v74, 8uLL));
          uint64_t v76 = (uint64_t)v75;
          if ((v101.i16[0] & 0x8000) == 0 || (v100.i16[0] & 0x8000) == 0) {
            uint64_t v76 = *(void *)&v75 | 0x100000000000000;
          }
          if (v100.i16[2] < 0) {
            unint64_t v78 = (unint64_t)(v101.i16[2] & 0x8000) << 42;
          }
          else {
            unint64_t v78 = 0;
          }
          unint64_t v79 = (unint64_t)(v101.i16[0] & 0x2000) << 45;
          if ((v100.i16[0] & 0x2000) == 0) {
            unint64_t v79 = 0;
          }
          unint64_t v80 = (unint64_t)(v101.i32[0] & 0x10000) << 43;
          if ((v100.i32[0] & 0x10000) == 0) {
            unint64_t v80 = 0;
          }
          if ((v100.i32[0] & 0x20000) != 0) {
            unint64_t v81 = (unint64_t)(v101.i32[0] & 0x20000) << 43;
          }
          else {
            unint64_t v81 = 0;
          }
          *((void *)a4 + 369) = v80 | v79 | v81 | v78 | v45.i64[1] | v47.i64[0] | v47.i64[1] | v76;
          if ((BYTE5(v96) & 2) != 0) {
            *(_OWORD *)(a4 + 2168) = v98;
          }
          if ((v24 & 0x2000) != 0)
          {
            unsigned int v86 = a4 + 2184;
            char v87 = (char *)v99 + v99[0];
          }
          else
          {
            if ((a4[65] & 0x10) != 0) {
              goto LABEL_58;
            }
            uint64_t v82 = a4 + 1112;
            size_t v83 = strlen(a4 + 1112);
            if (v83)
            {
              size_t v84 = v83 - 1;
              if (v82[v83 - 1] == 47)
              {
                strncpy(__dst, a4 + 1112, v84);
                __dst[v84] = 0;
                uint64_t v82 = __dst;
              }
              size_t v83 = (size_t)strrchr(v82, 47);
              if (!v83) {
LABEL_58:
              }
                size_t v83 = (size_t)strrchr(a4 + 88, 47);
            }
            if (v83) {
              unsigned int v85 = (const char *)v83;
            }
            else {
              unsigned int v85 = a4 + 88;
            }
            if (strlen(v85) != 1 && *v85 == 47) {
              ++v85;
            }
            unsigned int v86 = a4 + 2184;
            char v87 = v85;
          }
          strlcpy(v86, v87, 0x2FEuLL);
          int v88 = v97;
          if ((v97 & 0x40000) != 0)
          {
            uuid_copy((unsigned __int8 *)a4 + 3000, v102);
            int v88 = v97;
          }
          if ((v88 & 0x40000000) != 0)
          {
            long long v89 = v104;
            *((_OWORD *)a4 + 185) = v103;
            *((_OWORD *)a4 + 186) = v89;
            *((void *)a4 + 374) = v105;
          }
          uint64_t v90 = pathconf(a4 + 88, 18);
          if (v90 == -1)
          {
            if (a4[2958]) {
              unint64_t v91 = 0x20000000000;
            }
            else {
              unint64_t v91 = -1;
            }
          }
          else if (v90 < 65)
          {
            if (v90 > 31) {
              unint64_t v91 = 0xFFFFFFFFFFFFFFFFLL >> (65 - v90);
            }
            else {
              unint64_t v91 = 0x7FFFFFFFLL;
            }
          }
          else
          {
            unint64_t v91 = 0x7FFFFFFFFFFFFFFFLL;
          }
          *((void *)a4 + 377) = v91;
          int v92 = malloc_type_malloc(0xBD8uLL, 0x1020040C75464EAuLL);
          memcpy(v92 + 1, a4, 0xBD0uLL);
          *int v92 = sMountEntrys;
          sMountEntrys = (uint64_t)v92;
          goto LABEL_16;
        }
        int v21 = 2;
      }
    }
  }
  else
  {
    int v21 = *__error();
    if (!v21) {
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&sMountEntrysSpinLock);
  uint64_t result = 0;
  if (a6)
  {
    if (a7)
    {
      CFAllocatorRef v25 = CFGetAllocator(a6);
      CFErrorRef v26 = _FSURLCreateStandardError(v25, (const __CFString *)*MEMORY[0x1E4F1D160], v21, 0, a6, 0);
      uint64_t result = 0;
      *a7 = v26;
    }
  }
  return result;
}

uint64_t MountInfoGetCapabilities(uint64_t a1)
{
  return *(void *)(a1 + 2952);
}

uint64_t MountInfoGetVolumeFlags(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 64);
  if ((*(unsigned char *)(a1 + 2136) & 2) != 0)
  {
    uint64_t v3 = 64;
  }
  else
  {
    int v2 = strcmp((const char *)(a1 + 72), "lifs");
    uint64_t v3 = 128;
    if (!v2) {
      uint64_t v3 = 64;
    }
  }
  uint64_t v4 = v3 | (v1 << 9) & 0x800000 | ((v1 >> 21) & 2 | (v1 >> 12) & 1 | (v1 >> 18) & 4 | (8 * (v1 & 1)) | (v1 >> 6) & 0x10) ^ 1;
  if ((v1 & 0x80) != 0) {
    v4 |= 0x3000000uLL;
  }
  return v4 | (32 * v1) & 0x4000000;
}

uint64_t corePropertyProviderPrepareValues(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v37.bitmapcount = xmmword_1817912A0;
  *(void *)&v37.fileattr = 0;
  _FileCacheLock(a2);
  uint64_t v39 = 0;
  if (a5 < 1) {
    goto LABEL_6;
  }
  do
  {
    uint64_t v12 = *a4++;
    *(&v38 + *(void *)(v12 + 16)) = 1;
    --a5;
  }
  while (a5);
  if (!HIBYTE(v39) || (*(unsigned char *)(_FileCacheGetAttributes(a2) + 1) & 4) != 0)
  {
LABEL_6:
    attrgroup_t v17 = 0;
    attrgroup_t v15 = 0;
    attrgroup_t v16 = 0;
    attrgroup_t v13 = 0;
    attrgroup_t v14 = 0;
    int v18 = 0;
  }
  else
  {
    attrgroup_t v14 = dword_1EB20DEBC;
    attrgroup_t v13 = qword_1EB20DEC0;
    v37.commonattr = dword_1EB20DEBC;
    *(void *)&v37.volattr = qword_1EB20DEC0;
    attrgroup_t v16 = HIDWORD(qword_1EB20DEC0);
    attrgroup_t v15 = qword_1EB20DEC8;
    *(void *)&v37.fileattr = qword_1EB20DEC8;
    attrgroup_t v17 = HIDWORD(qword_1EB20DEC8);
    int v18 = 1;
  }
  if (BYTE4(v39) && (*(unsigned char *)_FileCacheGetAttributes(a2) & 4) == 0)
  {
    v14 |= dword_1EB20DE74;
    v13 |= unk_1EB20DE78;
    v16 |= dword_1EB20DE7C;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1EB20DE80;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1EB20DE84;
    v37.forkattr = v17;
    int v18 = 1;
  }
  if (BYTE6(v39) && (*(unsigned char *)(_FileCacheGetAttributes(a2) + 1) & 1) == 0)
  {
    v14 |= dword_1EB20DEA4;
    v13 |= unk_1EB20DEA8;
    v16 |= dword_1EB20DEAC;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1EB20DEB0;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1EB20DEB4;
    v37.forkattr = v17;
    int v18 = 1;
  }
  if (BYTE5(v39) && (*(unsigned char *)_FileCacheGetAttributes(a2) & 0x40) == 0)
  {
    v14 |= dword_1EB20DE8C;
    v13 |= unk_1EB20DE90;
    v16 |= dword_1EB20DE94;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= dword_1EB20DE98;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1EB20DE9C;
    v37.forkattr = v17;
    int v18 = 1;
  }
  if (BYTE3(v39) && (*(unsigned char *)_FileCacheGetAttributes(a2) & 0x80) == 0)
  {
    v14 |= dword_1EB20DE5C;
    v13 |= unk_1EB20DE60;
    v16 |= dword_1EB20DE64;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1EB20DE68;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1EB20DE6C;
    v37.forkattr = v17;
    int v18 = 1;
  }
  if (BYTE2(v39)
    && (*(_DWORD *)(_FileCacheGetAttributes(a2) + 16) & 0xF000) != 0x4000
    && (*(unsigned char *)_FileCacheGetAttributes(a2) & 0x20) == 0)
  {
    v14 |= dword_1EB20DE44;
    v13 |= unk_1EB20DE48;
    v16 |= dword_1EB20DE4C;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1EB20DE50;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1EB20DE54;
    v37.forkattr = v17;
    int v18 = 1;
  }
  if (BYTE1(v39) && (*(unsigned char *)_FileCacheGetAttributes(a2) & 0x10) == 0)
  {
    v14 |= dword_1EB20DE2C;
    v13 |= unk_1EB20DE30;
    v16 |= dword_1EB20DE34;
    v37.commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_1EB20DE38;
    v37.dirattr = v16;
    v37.fileattr = v15;
    v17 |= dword_1EB20DE3C;
    v37.forkattr = v17;
    int v18 = 1;
  }
  if (!(_BYTE)v39 || (*(unsigned char *)_FileCacheGetAttributes(a2) & 8) != 0)
  {
    if (!v18 && (!v38 || (*(unsigned char *)_FileCacheGetAttributes(a2) & 1) != 0))
    {
      uint64_t v28 = 1;
      goto LABEL_50;
    }
  }
  else
  {
    v14 |= dword_1EB20DE14;
    v13 |= unk_1EB20DE18;
    v16 |= dword_1EB20DE1C;
    v15 |= unk_1EB20DE20;
    v17 |= dword_1EB20DE24;
  }
  v37.commonattr = v14 | dword_1EB20DDFC;
  v37.volattr = v13 | unk_1EB20DE00;
  v37.dirattr = v16 | dword_1EB20DE04;
  v37.fileattr = v15 | unk_1EB20DE08;
  v37.forkattr = v17 | dword_1EB20DE0C;
  _FileCacheUnlock(a2);
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)&v38, 1024))
  {
    if (a7)
    {
      CFAllocatorRef v29 = CFGetAllocator(a1);
      *a7 = _FSURLCreateStandardError(v29, (const __CFString *)*MEMORY[0x1E4F1D148], 258, 0, a1, 0);
    }
    _FileCacheLock(a2);
    goto LABEL_39;
  }
  v37.commonattr |= 0x80000000;
  size_t v19 = calculateAttributeBufferSize(&v37, 0);
  MEMORY[0x1F4188790](v19);
  int v21 = (char *)&v37 - v20;
  bzero((char *)&v37 - v20, v19);
  uint64_t v22 = filtered_getattrlist(&v38, &v37, v21, v19, 0x25u);
  if (v22)
  {
    _FileCacheLock(a2);
    goto LABEL_33;
  }
  size_t v30 = *(unsigned int *)v21;
  if (v19 >= v30)
  {
    _FileCacheLock(a2);
    goto LABEL_47;
  }
  MEMORY[0x1F4188790](v22);
  int v21 = (char *)&v37 - ((v30 + 15) & 0x1FFFFFFF0);
  bzero(v21, v30);
  int v31 = filtered_getattrlist(&v38, &v37, v21, v30, 0x21u);
  _FileCacheLock(a2);
  if (!v31)
  {
LABEL_47:
    CFAllocatorRef v32 = CFGetAllocator(a1);
    uint64_t Attributes = _FileCacheGetAttributes(a2);
    uint64_t v28 = 1;
    unsigned int v34 = parseAttributeBuffer(v32, &v38, &v37, v21, 0, Attributes, 1);
    if (!v34) {
      goto LABEL_50;
    }
    if (a7)
    {
      unsigned int v35 = v34;
      CFAllocatorRef v25 = CFGetAllocator(a1);
      CFStringRef v26 = (const __CFString *)*MEMORY[0x1E4F1D158];
      uint64_t v27 = v35;
      goto LABEL_35;
    }
LABEL_39:
    uint64_t v28 = 0;
    goto LABEL_50;
  }
LABEL_33:
  int32x4_t v23 = __error();
  if (!a7) {
    goto LABEL_39;
  }
  uint64_t v24 = *v23;
  CFAllocatorRef v25 = CFGetAllocator(a1);
  CFStringRef v26 = (const __CFString *)*MEMORY[0x1E4F1D160];
  uint64_t v27 = v24;
LABEL_35:
  uint64_t v28 = 0;
  *a7 = _FSURLCreateStandardError(v25, v26, v27, 0, a1, 0);
LABEL_50:
  _FileCacheUnlock(a2);
  return v28;
}

uint64_t _FSURLCopyResourcePropertyForKeyInternal(const __CFURL *a1, const __CFString *a2, void **a3, CFTypeRef cf, __CFError **a5, int a6)
{
  CFStringRef v31 = a2;
  value = 0;
  int v11 = _FileCacheGetForURL(a1, cf);
  uint64_t v12 = (uint64_t *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, a2);
  if (!v12)
  {
    _FileCacheLockTempPermProperties();
    CFDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v11, 0);
    if (TemporaryPropertyDictionary
      && CFDictionaryGetValueIfPresent(TemporaryPropertyDictionary, a2, (const void **)&value)
      || (CFDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v11, 0)) != 0
      && CFDictionaryGetValueIfPresent(PermanentPropertyDictionary, a2, (const void **)&value))
    {
      int32x4_t v23 = value;
      if (value) {
        int32x4_t v23 = (void *)CFRetain(value);
      }
      value = v23;
    }
    _FileCacheUnlockTempPermProperties();
    uint64_t v17 = 1;
    goto LABEL_18;
  }
  attrgroup_t v13 = v12;
  _FileCacheLock((uint64_t)v11);
  uint64_t v29 = *v13;
  uint64_t v14 = *(uint64_t *)((char *)v13 + 140);
  uint64_t v15 = *(void *)(v14 + 8);
  attrgroup_t v16 = *(uint64_t (**)(const __CFURL *, void *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v14 + 16);
  _FileCacheIncrementInProvider((uint64_t)v11);
  uint64_t v17 = v16(a1, v11, &v31, &value, &v29, 1, v15);
  _FileCacheDecrementInProvider((uint64_t)v11);
  if (a6 && !v17)
  {
    if (_FileCacheLockTransitionToPreparer((uint64_t)v11)) {
      goto LABEL_28;
    }
    _FileCacheLock((uint64_t)v11);
    uint64_t v24 = *(uint64_t *)((char *)v13 + 140);
    uint64_t v25 = *(void *)(v24 + 8);
    CFStringRef v26 = *(uint64_t (**)(const __CFURL *, void *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v24 + 16);
    _FileCacheIncrementInProvider((uint64_t)v11);
    uint64_t v17 = v26(a1, v11, &v31, &value, &v29, 1, v25);
    _FileCacheDecrementInProvider((uint64_t)v11);
    _FileCacheUnlock((uint64_t)v11);
    if (!v17)
    {
LABEL_28:
      memset(v28, 0, 60);
      addPropertyAndDependenciesToBitmap((uint64_t)v13, (uint64_t)v28);
      uint64_t v17 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v11, (uint64_t)v28, (uint64_t)a5);
      if (v17)
      {
        _FileCacheLock((uint64_t)v11);
        uint64_t v18 = *(uint64_t *)((char *)v13 + 140);
        size_t v19 = *(void (**)(const __CFURL *, void *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v18 + 32);
        uint64_t v20 = *(void *)(v18 + 8);
        _FileCacheIncrementInProvider((uint64_t)v11);
        v19(a1, v11, &v31, &value, &v29, 1, v20);
        _FileCacheDecrementInProvider((uint64_t)v11);
        _FileCacheUnlock((uint64_t)v11);
      }
    }
    _FileCacheLockTransitionFromPreparer((uint64_t)v11);
  }
  _FileCacheUnlock((uint64_t)v11);
  if (v17)
  {
LABEL_18:
    *a3 = value;
    return v17;
  }
  if (!a5 || *a5) {
    return 0;
  }
  if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
    _FSURLCopyResourcePropertyForKeyInternal();
  }
  uint64_t v17 = 0;
  *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  return v17;
}

pthread_t _FileCacheLock(uint64_t a1)
{
  int v2 = *(_opaque_pthread_t **)(a1 + 24);
  pthread_t result = pthread_self();
  if (v2 == result)
  {
    int v4 = *(_DWORD *)(a1 + 32) + 1;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    pthread_t result = pthread_self();
    *(void *)(a1 + 24) = result;
    int v4 = 1;
  }
  *(_DWORD *)(a1 + 32) = v4;
  return result;
}

void _FileCacheUnlock(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v1;
  if (!v1)
  {
    *(void *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
}

uint64_t _FileCacheIncrementInProvider(uint64_t result)
{
  return result;
}

uint64_t _FileCacheDecrementInProvider(uint64_t result)
{
  return result;
}

CFTypeRef _FileCacheGetForURL(const __CFURL *a1, CFTypeRef cf)
{
  if (cf) {
    return cf;
  }
  CFGetAllocator(a1);
  initGlobalsOnce();
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v5 = (const void *)Instance;
    __CFURLSetResourceInfoPtr();
    CFRelease(v5);
  }
  return (CFTypeRef)__CFURLResourceInfoPtr();
}

uint64_t corePropertyProviderCopyValues(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t *a5, uint64_t a6)
{
  if (!a6) {
    return 1;
  }
  uint64_t v6 = a6;
  if ((*(unsigned char *)_FileCacheGetAttributes(a2) & 1) == 0) {
    return 0;
  }
  if (v6 < 1) {
    return 1;
  }
  while (1)
  {
    CFTypeRef cf = 0;
    uint64_t v12 = *a5;
    if ((*(unsigned char *)(*a5 + 8) & 2) == 0
      || !_FileCacheGetPropertyValueForKey(a2, *(const void **)v12, (void **)&cf))
    {
      break;
    }
    if (cf) {
      CFRetain(cf);
    }
LABEL_12:
    *a4++ = cf;
    ++a5;
    if (!--v6) {
      return 1;
    }
  }
  attrgroup_t v13 = *(unsigned int (**)(uint64_t, uint64_t, CFTypeRef *))(v12 + 24);
  if (v13)
  {
    uint64_t Attributes = _FileCacheGetAttributes(a2);
    if (v13(a1, Attributes, &cf)) {
      goto LABEL_12;
    }
  }
  uint64_t result = 0;
  *a4 = 0;
  return result;
}

uint64_t _FileCacheGetAttributes(uint64_t a1)
{
  return a1 + 48;
}

void _RegisterFilePropertyWithOptions(void *key, char a2, const void **a3, uint64_t a4, uint64_t a5)
{
  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, key);
  if (a2) {
    CFArrayAppendValue((CFMutableArrayRef)qword_1EB20E038, key);
  }
  if (a4)
  {
    if (a4 >= 1)
    {
      do
      {
        int v11 = CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, *a3);
        if (v11) {
          addPropertyAndDependenciesToBitmap((uint64_t)v11, (uint64_t)(Value + 16));
        }
        ++a3;
        --a4;
      }
      while (a4);
    }
    if (qword_1EB20DEF8 >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        uint64_t v13 = (uint64_t)&Value[12 * v12 + 16];
        uint64_t v14 = *(void *)v13;
        int64_t v34 = 0;
        uint64_t v35 = v14;
        int v36 = *(_DWORD *)(v13 + 8);
        int64_t v33 = 0;
        if (PropertyMaskIsNotZero((uint64_t)&v35, (unint64_t *)&v34, &v33) && v34 <= v33)
        {
          uint64_t v15 = v35;
          int v16 = v36;
          unint64_t v17 = v33 - v34 + 1;
          unint64_t v18 = sFileProviderGlobals[7 * v12 + 8] + 148 * v34;
          do
          {
            int v19 = *(_DWORD *)(v18 + 136);
            int v20 = 1 << v19;
            BOOL v21 = v19 < 64;
            if (v19 >= 64) {
              uint64_t v22 = 0;
            }
            else {
              uint64_t v22 = 1 << v19;
            }
            if (v21) {
              int v23 = 0;
            }
            else {
              int v23 = v20;
            }
            int v24 = v16 & v23;
            if ((v22 & v15) != 0 || v24 != 0)
            {
              int v26 = *((_DWORD *)Value + 34);
              int v27 = 1 << v26;
              BOOL v28 = v26 < 64;
              if (v26 >= 64) {
                uint64_t v29 = 0;
              }
              else {
                uint64_t v29 = 1 << v26;
              }
              if (v28) {
                int v30 = 0;
              }
              else {
                int v30 = v27;
              }
              unint64_t v31 = v18 + 12 * **(int **)(Value + 140);
              int v32 = *(_DWORD *)(v31 + 84) | v30;
              *(void *)(v31 + 76) |= v29;
              *(_DWORD *)(v31 + 84) = v32;
            }
            v18 += 148;
            --v17;
          }
          while (v17);
        }
        ++v12;
      }
      while (v12 < qword_1EB20DEF8);
    }
  }
  *(void *)Value = a5;
}

uint64_t addPropertyAndDependenciesToBitmap(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 136);
  int v3 = 1 << v2;
  BOOL v4 = v2 < 64;
  if (v2 >= 64) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 1 << v2;
  }
  if (v4) {
    int v3 = 0;
  }
  uint64_t v6 = a2 + 12 * **(int **)(result + 140);
  int v7 = *(_DWORD *)(v6 + 8) | v3;
  *(void *)v6 |= v5;
  *(_DWORD *)(v6 + 8) = v7;
  uint64_t v8 = qword_1EB20DEF8;
  if (qword_1EB20DEF8 >= 1)
  {
    uint64_t v9 = (_DWORD *)(result + 24);
    unsigned int v10 = (int *)(a2 + 8);
    do
    {
      uint64_t v11 = *((void *)v9 - 1) | *((void *)v10 - 1);
      int v12 = *v9;
      v9 += 3;
      int v13 = v12 | *v10;
      *((void *)v10 - 1) = v11;
      *unsigned int v10 = v13;
      v10 += 3;
      --v8;
    }
    while (v8);
  }
  return result;
}

uint64_t createCanonicalPathValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(unsigned char *)(a2 + 1) & 1) == 0) {
    return 0;
  }
  CFTypeRef v5 = *(CFTypeRef *)(a2 + 232);
  if (v5) {
    CFTypeRef v5 = CFRetain(v5);
  }
  *a3 = v5;
  return 1;
}

uint64_t filtered_getattrlist(char *a1, _DWORD *a2, void *a3, size_t a4, unsigned int a5)
{
  if (filtered_getattrlist::onceToken != -1) {
    dispatch_once(&filtered_getattrlist::onceToken, &__block_literal_global_6);
  }
  if (filtered_getattrlist::isJazz) {
    a2[5] &= 0xFCu;
  }
  return getattrlist(a1, a2, a3, a4, a5);
}

uint64_t _FileCacheLockTransitionFromPreparer(uint64_t a1)
{
  int v2 = *(_opaque_pthread_t **)(a1 + 24);
  if (v2 == pthread_self())
  {
    ++*(_DWORD *)(a1 + 32);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    *(_DWORD *)(a1 + 32) = 1;
    *(void *)(a1 + 24) = pthread_self();
  }
  return MEMORY[0x1F40CD628](a1 + 40);
}

uint64_t _FileCacheLockTransitionToPreparer(uint64_t a1)
{
  int v2 = (os_unfair_lock_s *)(a1 + 36);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 36));
  uint64_t v3 = os_unfair_recursive_lock_trylock();
  int v4 = *(_DWORD *)(a1 + 32);
  *(void *)(a1 + 24) = 0;
  os_unfair_lock_unlock(v2);
  if ((v3 & 1) == 0) {
    os_unfair_recursive_lock_lock_with_options();
  }
  if (v4 >= 2)
  {
    os_unfair_lock_lock(v2);
    *(_DWORD *)(a1 + 32) = v4 - 1;
    *(void *)(a1 + 24) = pthread_self();
  }
  return v3;
}

uint64_t prepareValuesForBitmap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a4;
  uint64_t v32 = a3;
  uint64_t v30 = a1;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (qword_1EB20DEF8 < 1)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v5 = 0;
    LOBYTE(v6) = 1;
    do
    {
      int v7 = (uint64_t *)(v32 + 12 * v5);
      uint64_t v8 = *v7;
      int64_t v34 = 0;
      uint64_t v35 = v8;
      int v36 = *((_DWORD *)v7 + 2);
      int64_t v33 = 0;
      if (PropertyMaskIsNotZero((uint64_t)&v35, (unint64_t *)&v34, &v33))
      {
        unint64_t v9 = 8 * SHIDWORD(sFileProviderGlobals[7 * v5 + 2]);
        MEMORY[0x1F4188790]();
        unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v11 = (char *)&v30 - v10;
        size_t v12 = v9 >= 0x200 ? 512 : v9;
        bzero((char *)&v30 - v10, v12);
        MEMORY[0x1F4188790]();
        int v13 = (char *)&v30 - v10;
        bzero((char *)&v30 - v10, v12);
        if (v34 <= v33)
        {
          uint64_t v14 = 0;
          uint64_t v15 = v35;
          int v16 = v36;
          unint64_t v17 = v33 - v34 + 1;
          unint64_t v18 = sFileProviderGlobals[7 * v5 + 8] + 148 * v34;
          do
          {
            int v19 = *(_DWORD *)(v18 + 136);
            int v20 = 1 << v19;
            BOOL v21 = v19 < 64;
            if (v19 >= 64) {
              uint64_t v22 = 0;
            }
            else {
              uint64_t v22 = 1 << v19;
            }
            if (v21) {
              int v23 = 0;
            }
            else {
              int v23 = v20;
            }
            int v24 = v16 & v23;
            if ((v22 & v15) != 0 || v24 != 0)
            {
              *(void *)&v11[8 * v14] = *(void *)(v18 + 8);
              *(void *)&v13[8 * v14++] = *(void *)v18;
            }
            v18 += 148;
            --v17;
          }
          while (v17);
        }
        else
        {
          uint64_t v14 = 0;
        }
        int v26 = &sFileProviderGlobals[7 * v5];
        int v27 = (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t))v26[5];
        uint64_t v28 = v26[3];
        _FileCacheIncrementInProvider(a2);
        int v6 = v27(v30, a2, v11, v13, v14, v28, v31);
        _FileCacheDecrementInProvider(a2);
        if (!v6) {
          break;
        }
      }
      ++v5;
    }
    while (v5 < qword_1EB20DEF8);
  }
  return v6;
}

uint64_t PropertyMaskIsNotZero(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *(void *)a1;
  uint64_t result = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    unint64_t v8 = __clz(__rbit64(v6));
    int v9 = flsll(result);
    if (v9) {
      uint64_t v10 = v9 + 64;
    }
    else {
      uint64_t v10 = flsll(*(void *)a1);
    }
  }
  else
  {
    if (!result) {
      return result;
    }
    unsigned int v11 = __clz(__rbit32(result));
    uint64_t v10 = flsll(result) + 64;
    unint64_t v8 = v11 | 0x40;
  }
  *a2 = v8;
  *a3 = v10 - 1;
  return 1;
}

void initGlobalsOnce(void)
{
  if (initGlobalsOnce(void)::onceToken != -1) {
    dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
  }
}

uint64_t MountInfoGetMountID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

unint64_t calculateAttributeBufferSize(const attrlist *a1, uint64_t a2)
{
  attrgroup_t commonattr = a1->commonattr;
  if (a2 <= 0) {
    uint64_t v3 = (commonattr >> 17) & 0x400 | (commonattr >> 14) & 0x100 | ((int)(commonattr << 31) >> 31) & 0x2FE;
  }
  else {
    uint64_t v3 = a2;
  }
  uint64_t v4 = v3 + 4;
  if (commonattr)
  {
    uint64_t v5 = v3 + 12;
    if (commonattr) {
      uint64_t v4 = v5;
    }
    if ((commonattr & 2) != 0) {
      v4 += 4;
    }
    if ((commonattr & 4) != 0) {
      v4 += 8;
    }
    if ((commonattr & 8) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x10) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x20) != 0) {
      v4 += 8;
    }
    if ((commonattr & 0x40) != 0) {
      v4 += 8;
    }
    if ((commonattr & 0x80) != 0) {
      v4 += 8;
    }
    if ((commonattr & 0x100) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x200) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x400) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x800) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x1000) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x2000) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x4000) != 0) {
      v4 += 32;
    }
    if ((commonattr & 0x8000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x10000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x20000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x40000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x80000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x100000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x200000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x400000) != 0) {
      v4 += 8;
    }
    if ((commonattr & 0x800000) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x1000000) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x2000000) != 0) {
      v4 += 8;
    }
    if ((commonattr & 0x4000000) != 0) {
      v4 += 8;
    }
    if ((commonattr & 0x8000000) != 0) {
      v4 += 8;
    }
    if ((commonattr & 0x10000000) != 0) {
      v4 += 16;
    }
    if ((commonattr & 0x20000000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x40000000) != 0) {
      v4 += 4;
    }
    if ((commonattr & 0x80000000) != 0) {
      v4 += 20;
    }
  }
  attrgroup_t dirattr = a1->dirattr;
  if (dirattr)
  {
    uint64_t v7 = 4 * (dirattr & 1);
    if ((dirattr & 2) != 0) {
      v7 += 4;
    }
    if ((dirattr & 4) != 0) {
      v7 += 4;
    }
    if ((dirattr & 8) != 0) {
      v7 += 8;
    }
    if ((dirattr & 0x10) != 0) {
      v7 += 4;
    }
    if ((dirattr & 0x20) != 0) {
      unint64_t v8 = v7 + 8;
    }
    else {
      unint64_t v8 = v7;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  attrgroup_t fileattr = a1->fileattr;
  if (fileattr)
  {
    uint64_t v10 = 4 * (fileattr & 3);
    if ((fileattr & 4) != 0) {
      v10 += 8;
    }
    if ((fileattr & 8) != 0) {
      v10 += 4;
    }
    if ((fileattr & 0x20) != 0) {
      v10 += 4;
    }
    if ((fileattr & 0x200) != 0) {
      v10 += 8;
    }
    if ((fileattr & 0x400) != 0) {
      v10 += 8;
    }
    if ((fileattr & 0x1000) != 0) {
      v10 += 8;
    }
    if ((fileattr & 0x2000) != 0) {
      unint64_t v11 = v10 + 8;
    }
    else {
      unint64_t v11 = v10;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  attrgroup_t forkattr = a1->forkattr;
  if (forkattr)
  {
    uint64_t v13 = (2 * forkattr) & 8;
    if ((forkattr & 8) != 0) {
      v13 += 8;
    }
    if ((forkattr & 0x10) != 0) {
      v13 += 8;
    }
    if ((forkattr & 0x20) != 0) {
      v13 += 8;
    }
    if ((forkattr & 0x40) != 0) {
      v13 += 4;
    }
    if ((forkattr & 0x80) != 0) {
      uint64_t v14 = v13 + 8;
    }
    else {
      uint64_t v14 = v13;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v8 <= v11) {
    unint64_t v8 = v11;
  }
  return v8 + v4 + v14;
}

void SetNameAndHiddenFlagsFromCString(CFAllocatorRef alloc, UInt8 *bytes, CFIndex numBytes, uint64_t a4)
{
  unint64_t v8 = *(const void **)(a4 + 8);
  if (v8) {
    CFRelease(v8);
  }
  CFStringRef v9 = CFStringCreateWithBytes(alloc, bytes, numBytes, 0x8000100u, 0);
  *(void *)(a4 + 8) = v9;
  if (!v9)
  {
    syslog(3, "SetNameAndExtensionLengthFromCString: CFStringCreateWithBytes failed with kCFStringEncodingUTF8; retrying with kCF"
      "StringEncodingISOLatin1");
    CFStringRef v10 = CFStringCreateWithBytes(alloc, bytes, numBytes, 0x201u, 0);
    *(void *)(a4 + 8) = v10;
    if (!v10)
    {
      syslog(3, "SetNameAndExtensionLengthFromCString: CFStringCreateWithBytes failed with kCFStringEncodingISOLatin1; setting na"
        "me to empty string");
      *(void *)(a4 + 8) = &stru_1ECA26C08;
    }
  }
  BOOL v11 = *bytes == 46;
  unsigned int v12 = *(_DWORD *)a4 & 0xFFFFF7FF | (v11 << 11);
  *(_DWORD *)a4 = v12;
  if (v11) {
    int v13 = (bytes[1] == 46) << 12;
  }
  else {
    int v13 = 0;
  }
  *(_DWORD *)a4 = v13 | v12 & 0xFFFFEFFF;
}

uint64_t MountInfoGetIOBlockSize(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t _FileCacheGetPropertyValueForKey(uint64_t a1, const void *a2, void **a3)
{
  value = 0;
  _FileCacheLock(a1);
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 288);
  if (v6 && CFDictionaryGetValueIfPresent(v6, a2, (const void **)&value))
  {
    *a3 = value;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  int v8 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v8;
  if (!v8)
  {
    *(void *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
  return v7;
}

void DirEnumEntryFree(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 52))
  {
    uint64_t v4 = *(void **)(a2 + 56);
    if (v4) {
      free(v4);
    }
  }
  uint64_t v5 = *(int **)(a2 + 72);
  if (v5)
  {
    int v6 = *v5;
    uint64_t v7 = *((void *)v5 + 1);
    int v8 = (void *)*((void *)v5 + 3);
    if (*(void *)(v7 + 1856)) {
      free(v8);
    }
    else {
      *(void *)(v7 + 1856) = v8;
    }
    free(v5);
    close(v6);
    *(void *)(a2 + 72) = 0;
  }
  *(void *)a2 = *(void *)(a1 + 1848);
  *(void *)(a1 + 1848) = a2;
}

uint64_t NextEntryFromParent(uint64_t a1, uint64_t a2, void *a3, int *a4)
{
  *a3 = 0;
  *a4 = 0;
  int v8 = DirEnumEntryAllocate(a1);
  *a3 = v8;
  if (!v8)
  {
    *a4 = *__error();
    return 3;
  }
  uint64_t v9 = (uint64_t)v8;
  uint64_t v10 = *(void *)(a2 + 72);
  if (*(unsigned char *)(v10 + 4)) {
    goto LABEL_3;
  }
  int v12 = *(_DWORD *)(v10 + 40);
  int v13 = *(_DWORD *)(v10 + 44);
  if (v13 >= v12)
  {
    *(_DWORD *)(v10 + 44) = 0;
  }
  else if (v13)
  {
    uint64_t v11 = 0;
    if (!v12) {
      goto LABEL_7;
    }
LABEL_16:
    int v16 = *(_DWORD **)(v10 + 32);
    *(void *)(v10 + 32) = (char *)v16 + *v16;
    ++*(_DWORD *)(v10 + 44);
    *a4 = 0;
    *(void *)(v9 + 56) = v16;
    unint64_t v17 = (_DWORD **)(v9 + 56);
    uint64_t v30 = 0;
    __int16 v29 = 0;
    unsigned __int8 v28 = 0;
    unint64_t v18 = (void *)(v9 + 32);
    if ((ParseAttributes(v16, (_DWORD *)&v30 + 1, (void *)(v9 + 24), (void *)(v9 + 32), (_DWORD *)(v9 + 64), &v30, (unsigned char *)&v29 + 1, &v29, &v28) & 1) == 0)
    {
      *(_DWORD *)(v9 + 48) = 5;
      int v26 = HIDWORD(v30);
      goto LABEL_45;
    }
    int v19 = HIDWORD(v30);
    if (HIDWORD(v30))
    {
      *(_DWORD *)(v9 + 48) = 5;
      *(_DWORD *)(v9 + 40) = v19;
      *(unsigned char *)(v9 + 52) &= ~1u;
      goto LABEL_34;
    }
    if (!(HIBYTE(v29) | v28))
    {
      *(unsigned char *)(v9 + 52) &= ~1u;
LABEL_28:
      *(_DWORD *)(v9 + 40) = 0;
      if (v30 == 2)
      {
        int v22 = 1;
      }
      else if (v30 == 1)
      {
        int v22 = 3;
      }
      else
      {
        int v22 = 4;
      }
      *(_DWORD *)(v9 + 48) = v22;
LABEL_34:
      *(void *)uint64_t v9 = a2;
      *(void *)(v9 + 8) = a1;
      uint64_t v23 = *(void *)(a2 + 16);
      if (*(unsigned char *)(v23 + a1 - 1) != 47)
      {
        if ((unint64_t)(v23 + 1) >= 0x6FD)
        {
LABEL_43:
          *(_DWORD *)(v9 + 48) = 5;
          int v26 = 63;
LABEL_45:
          *(_DWORD *)(v9 + 40) = v26;
          return 1;
        }
        *(unsigned char *)(a1 + v23++) = 47;
      }
      *(unsigned char *)(a1 + v23) = 0;
      if ((unint64_t)(*v18 + v23) < 0x6FD)
      {
        memcpy((void *)(a1 + v23), *(const void **)(v9 + 24), *v18 + 1);
        *(_DWORD *)(v9 + 44) = *(_DWORD *)(a2 + 44) + 1;
        unint64_t v24 = *(void *)(v9 + 32) + v23;
        *(void *)(v9 + 16) = v24;
        if (v24 < 0x400)
        {
          *(unsigned char *)(v9 + 52) = *(unsigned char *)(v9 + 52) & 0xFD | (2 * ((v29 | HIBYTE(v29)) != 0));
          *(void *)(v9 + 72) = 0;
          return 1;
        }
      }
      goto LABEL_43;
    }
    uint64_t v20 = *(void *)(a2 + 16);
    if (*(unsigned char *)(v20 + a1 - 1) != 47)
    {
      if ((unint64_t)(v20 + 1) >= 0x6FD) {
        goto LABEL_46;
      }
      *(unsigned char *)(a1 + v20++) = 47;
    }
    *(unsigned char *)(a1 + v20) = 0;
    if ((unint64_t)(*v18 + v20) < 0x6FD)
    {
      memcpy((void *)(a1 + v20), *(const void **)(v9 + 24), *v18 + 1);
      BOOL v21 = malloc_type_malloc(*(void *)(a1 + 1824), 0x50535794uLL);
      *unint64_t v17 = v21;
      if (v21)
      {
        *(unsigned char *)(v9 + 52) |= 1u;
        if (GetattrlistRetry((char *)a1, (_DWORD *)(a1 + 1796), (void **)(v9 + 56), *(void *)(a1 + 1824)))
        {
          *(_DWORD *)(v9 + 48) = 5;
          int v27 = *__error();
        }
        else
        {
          if (ParseAttributes(*v17, (_DWORD *)&v30 + 1, (void *)(v9 + 24), (void *)(v9 + 32), (_DWORD *)(v9 + 64), &v30, (unsigned char *)&v29 + 1, &v29, &v28))goto LABEL_28; {
          *(_DWORD *)(v9 + 48) = 5;
          }
          int v27 = HIDWORD(v30);
        }
      }
      else
      {
        *(_DWORD *)(v9 + 48) = 5;
        int v27 = 12;
      }
LABEL_50:
      *(_DWORD *)(v9 + 40) = v27;
      goto LABEL_34;
    }
LABEL_46:
    *(_DWORD *)(v9 + 48) = 5;
    int v27 = 63;
    goto LABEL_50;
  }
  int v14 = getattrlistbulk(*(_DWORD *)v10, (void *)(*(void *)(v10 + 8) + 1796), *(void **)(v10 + 24), *(void *)(v10 + 16), 0x20uLL);
  if (v14 < 1)
  {
    *(_DWORD *)(v10 + 40) = 0;
    *(unsigned char *)(v10 + 4) = 1;
    if (v14)
    {
      int v15 = *__error();
      uint64_t v11 = 3;
    }
    else
    {
      int v15 = 0;
      uint64_t v11 = 2;
    }
  }
  else
  {
    int v15 = 0;
    uint64_t v11 = 0;
    *(_DWORD *)(v10 + 40) = v14;
    *(void *)(v10 + 32) = *(void *)(v10 + 24);
  }
  *a4 = v15;
  if (*(_DWORD *)(v10 + 40)) {
    goto LABEL_16;
  }
LABEL_7:
  if (v11 != 2)
  {
    DirEnumEntryFree(a1, v9);
    *a3 = 0;
    return v11;
  }
LABEL_3:
  DirEnumEntryFree(a1, v9);
  *a3 = 0;
  return 2;
}

_OWORD *DirEnumEntryAllocate(uint64_t a1)
{
  uint64_t result = *(_OWORD **)(a1 + 1848);
  if (!result) {
    return malloc_type_calloc(1uLL, 0x50uLL, 0x10F004033F4FF7FuLL);
  }
  *(void *)(a1 + 1848) = *(void *)result;
  result[2] = 0u;
  result[3] = 0u;
  result[4] = 0u;
  *uint64_t result = 0u;
  result[1] = 0u;
  return result;
}

uint64_t createIsDirectoryValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x4000) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t ParseAttributes(_DWORD *a1, _DWORD *a2, void *a3, void *a4, _DWORD *a5, _DWORD *a6, unsigned char *a7, unsigned char *a8, unsigned char *a9)
{
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  unint64_t v9 = a1[1];
  if (v9)
  {
    if ((v9 & 0x20000000) != 0)
    {
      *a2 = a1[6];
      uint64_t v19 = (int)a1[7];
      unint64_t v18 = a1 + 7;
      *a3 = (char *)v18 + v19;
      *a4 = (v18[1] - 1);
    }
    else
    {
      int v10 = a1[3];
      *a2 = 0;
      int v11 = a1[7];
      *a3 = (char *)a1 + a1[6] + 24;
      *a4 = (v11 - 1);
      uint64_t v12 = 9;
      if ((v9 & 2) == 0) {
        uint64_t v12 = 8;
      }
      int v13 = &a1[v12];
      if ((v9 & 4) != 0)
      {
        int v14 = *v13;
        v13 += 2;
        *a5 = v14;
      }
      if ((v9 & 8) != 0)
      {
        int v15 = *v13++;
        *a6 = v15;
      }
      int v16 = (int *)((char *)v13
                  + ((v9 >> 2) & 4)
                  + ((v9 >> 2) & 8)
                  + ((v9 >> 3) & 8)
                  + ((v9 >> 4) & 8)
                  + ((v9 >> 6) & 4)
                  + ((v9 >> 5) & 0x10)
                  + ((v9 >> 6) & 0x10)
                  + ((v9 >> 7) & 0x10)
                  + ((v9 >> 8) & 0x10)
                  + ((v9 >> 9) & 0x30)
                  + ((v9 >> 13) & 4)
                  + ((v9 >> 14) & 4)
                  + ((v9 >> 15) & 4));
      if ((v9 & 0x40000) != 0)
      {
        int v20 = *v16++;
        int v17 = v20 & 0x800000;
      }
      else
      {
        int v17 = 0;
      }
      if (*a6 == 2)
      {
        if (v17) {
          *a9 = 1;
        }
        if ((v10 & 4) != 0)
        {
          int v21 = *(int *)((char *)&v16[v10 & 1]
                       + ((v9 >> 22) & 8)
                       + ((v9 >> 17) & 4)
                       + (unint64_t)((v9 >> 18) & 4)
                       + ((v9 >> 19) & 4)
                       + ((v9 >> 19) & 8)
                       + ((v9 >> 19) & 0x10)
                       + ((v9 >> 20) & 0x10)
                       + ((v9 >> 23) & 8)
                       + (BYTE3(v9) & 0x18)
                       + ((v9 >> 28) & 4)
                       + ((2 * v10) & 4));
          if (v21) {
            *a7 = 1;
          }
          if ((v21 & 2) != 0) {
            *a8 = 1;
          }
        }
      }
    }
  }
  else
  {
    *a2 = 22;
  }
  return v9 & 1;
}

uint64_t MountInfoGetFSID(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t createNameValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFTypeRef v4 = *(CFTypeRef *)(a2 + 8);
  if (v4) {
    CFTypeRef v4 = CFRetain(v4);
  }
  *a3 = v4;
  return 1;
}

CFURLRef _FSURLCreateWithPathAndExtendedAttributes(CFAllocatorRef allocator, unsigned __int8 *a2, size_t __n, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, void *a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12, void **a13, __CFError **a14)
{
  return __FSURLCreateWithPathAndAttributes(allocator, a2, __n, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t DirEnumHasExtendedAttributes(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1832);
}

uint64_t volumePropertyProviderCopyValues(uint64_t a1, uint64_t a2, const void **a3, void **a4, uint64_t *a5, uint64_t a6)
{
  if ((*(unsigned char *)_FileCacheGetAttributes(a2) & 2) == 0) {
    return 0;
  }
  if (a6 >= 1)
  {
    CFIndex Length = 0;
    BytePtr = 0;
    do
    {
      uint64_t v15 = *a5;
      if (!*(void *)(*a5 + 24)) {
        goto LABEL_17;
      }
      if (CFEqual(*(CFTypeRef *)(v15 + 8), @"__kCFURLNoDependsVolumeInformationKey")) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = BytePtr == 0;
      }
      if (v16)
      {
        uint64_t result = _FileCacheGetVolumeInfo(a2);
        if (!result) {
          return result;
        }
        CFDataRef v17 = (const __CFData *)result;
        BytePtr = CFDataGetBytePtr((CFDataRef)result);
        CFIndex Length = CFDataGetLength(v17);
      }
      if (CFEqual(*(CFTypeRef *)(v15 + 8), @"__kCFURLExpensiveVolumeInformationKey")
        && (!BytePtr || *(void *)BytePtr == -1))
      {
        return 0;
      }
      if (!(*(unsigned int (**)(uint64_t, uint64_t, const UInt8 *, CFIndex, uint64_t, void, void **))(v15 + 24))(a1, a2, BytePtr, Length, v15, 0, a4))
      {
LABEL_17:
        uint64_t result = _FileCacheGetPropertyValueForKey(a2, *a3, a4);
        if (!result) {
          return result;
        }
        if (*a4) {
          CFRetain(*a4);
        }
      }
      ++a4;
      ++a3;
      ++a5;
      --a6;
    }
    while (a6);
  }
  return 1;
}

uint64_t DirEnumSkipDescendents(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 1840);
  if (*(_DWORD *)(v1 + 48) == 1)
  {
    uint64_t result = 0;
    *(unsigned char *)(v1 + 52) |= 2u;
  }
  else
  {
    *__error() = 20;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _FileCacheGetGlobalSeed(void)
{
  return seedGlobals;
}

void _FileCacheScheduleGlobalSeedIncrement(CFRunLoopRef rl)
{
  int v2 = (__CFRunLoopObserver *)seedGlobals;
  if (!seedGlobals)
  {
    memset(&v3, 0, sizeof(v3));
    int v2 = CFRunLoopObserverCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x40uLL, 1u, 0, (CFRunLoopObserverCallBack)observerCall, &v3);
    seedGlobals = (uint64_t)v2;
  }
  if ((seedGlobals & 1) == 0)
  {
    if (v2)
    {
      CFRunLoopAddObserver(rl, v2, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      seedGlobals = 1;
    }
  }
}

uint64_t _FileCacheSetValidSeed(uint64_t result, unsigned int a2)
{
  int v2 = atomic_load((unsigned int *)(result + 16));
  if (v2 >= -1) {
    atomic_store(a2, (unsigned int *)(result + 16));
  }
  return result;
}

uint64_t createHasHiddenExtensionValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(unsigned char *)a2 & 0x10) == 0)
  {
    CFStringRef v5 = *(const __CFString **)(a2 + 8);
    if (v5)
    {
      CFIndex Length = CFStringGetLength(*(CFStringRef *)(a2 + 8));
      if ((*(unsigned char *)(a2 + 3) & 8) != 0)
      {
        if (*(_WORD *)(a2 + 4) == 3)
        {
          CFStringRef theString = v5;
          CFIndex v51 = Length - 3;
          CFIndex v52 = 3;
          CharactersPtr = CFStringGetCharactersPtr(v5);
          int32x4_t v49 = CharactersPtr;
          if (CharactersPtr) {
            CStringPtr = 0;
          }
          else {
            CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
          }
          uint64_t v20 = 0;
          uint64_t v53 = 0;
          CFIndex v54 = 0;
          int32x4_t v50 = CStringPtr;
          if (!CharactersPtr)
          {
LABEL_32:
            if (v50)
            {
              UniChar v21 = v50[v51 + v20];
            }
            else
            {
              if (v54 <= v20 || (uint64_t v25 = v53, v53 > v20))
              {
                v26.location = v51;
                if (v52 >= 64) {
                  v26.length = 64;
                }
                else {
                  v26.length = v52;
                }
                uint64_t v53 = 0;
                CFIndex v54 = v26.length;
                CFStringGetCharacters(theString, v26, buffer);
                uint64_t v25 = v53;
              }
              UniChar v21 = buffer[v20 - v25];
            }
LABEL_41:
            if ((v21 & 0xFFDF) != 0x41) {
              return 0;
            }
            uint64_t v27 = v20 + 1;
            if (v49)
            {
              UniChar v28 = v49[v51 + v27];
            }
            else if (v50)
            {
              UniChar v28 = v50[v51 + v27];
            }
            else
            {
              if (v54 <= v27 || (uint64_t v29 = v53, v53 > v27))
              {
                v30.location = v51;
                if (v52 >= 64) {
                  v30.length = 64;
                }
                else {
                  v30.length = v52;
                }
                uint64_t v53 = 0;
                CFIndex v54 = v30.length;
                CFStringGetCharacters(theString, v30, buffer);
                uint64_t v29 = v53;
              }
              UniChar v28 = buffer[v27 - v29];
            }
            if ((v28 & 0xFFDF) != 0x50) {
              return 0;
            }
            uint64_t v31 = v20 | 2;
            if (v49)
            {
              UniChar v32 = v49[v51 + v31];
            }
            else if (v50)
            {
              UniChar v32 = v50[v51 + v31];
            }
            else
            {
              if (v54 <= v31 || (uint64_t v37 = v53, v53 > v31))
              {
                v38.location = v51;
                if (v52 >= 64) {
                  v38.length = 64;
                }
                else {
                  v38.length = v52;
                }
                uint64_t v53 = 0;
                CFIndex v54 = v38.length;
                CFStringGetCharacters(theString, v38, buffer);
                uint64_t v37 = v53;
              }
              UniChar v32 = buffer[v31 - v37];
            }
            if ((v32 & 0xFFDF) != 0x50) {
              return 0;
            }
            goto LABEL_104;
          }
LABEL_23:
          UniChar v21 = CharactersPtr[v51 + v20];
          goto LABEL_41;
        }
      }
      else if (Length >= 5)
      {
        CFIndex v7 = Length - 4;
        CFStringRef theString = v5;
        CFIndex v51 = Length - 4;
        CFIndex v52 = 4;
        int v8 = CFStringGetCharactersPtr(v5);
        int32x4_t v49 = v8;
        if (v8)
        {
          uint64_t v53 = 0;
          CFIndex v54 = 0;
          int32x4_t v50 = 0;
          UniChar v9 = v8[v7];
        }
        else
        {
          uint64_t v19 = CFStringGetCStringPtr(v5, 0x600u);
          uint64_t v53 = 0;
          CFIndex v54 = 0;
          int32x4_t v50 = v19;
          if (v19)
          {
            UniChar v9 = v19[v7];
          }
          else
          {
            CFIndex v54 = 4;
            v55.location = v7;
            v55.length = 4;
            CFStringGetCharacters(v5, v55, buffer);
            UniChar v9 = buffer[-v53];
          }
        }
        if (v9 == 46)
        {
          CharactersPtr = v49;
          uint64_t v20 = 1;
          if (!v49) {
            goto LABEL_32;
          }
          goto LABEL_23;
        }
      }
    }
    return 0;
  }
  if ((*(_WORD *)(a2 + 168) & 0x10) == 0)
  {
    CFStringRef v10 = *(const __CFString **)(a2 + 8);
    if (!v10) {
      goto LABEL_106;
    }
    CFIndex v11 = CFStringGetLength(*(CFStringRef *)(a2 + 8));
    if ((*(unsigned char *)(a2 + 3) & 8) != 0)
    {
      if (*(_WORD *)(a2 + 4) != 3) {
        goto LABEL_106;
      }
      CFStringRef theString = v10;
      CFIndex v51 = v11 - 3;
      CFIndex v52 = 3;
      CFDataRef v17 = CFStringGetCharactersPtr(v10);
      int32x4_t v49 = v17;
      if (v17) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = CFStringGetCStringPtr(v10, 0x600u);
      }
      uint64_t v23 = 0;
      uint64_t v53 = 0;
      CFIndex v54 = 0;
      int32x4_t v50 = v18;
      if (!v17) {
        goto LABEL_61;
      }
    }
    else
    {
      if (v11 < 5) {
        goto LABEL_106;
      }
      CFIndex v12 = v11 - 4;
      CFStringRef theString = v10;
      CFIndex v51 = v11 - 4;
      CFIndex v52 = 4;
      int v13 = CFStringGetCharactersPtr(v10);
      int32x4_t v49 = v13;
      if (v13)
      {
        uint64_t v53 = 0;
        CFIndex v54 = 0;
        int32x4_t v50 = 0;
        UniChar v14 = v13[v12];
      }
      else
      {
        int v22 = CFStringGetCStringPtr(v10, 0x600u);
        uint64_t v53 = 0;
        CFIndex v54 = 0;
        int32x4_t v50 = v22;
        if (v22)
        {
          UniChar v14 = v22[v12];
        }
        else
        {
          CFIndex v54 = 4;
          v56.location = v12;
          v56.length = 4;
          CFStringGetCharacters(v10, v56, buffer);
          UniChar v14 = buffer[-v53];
        }
      }
      if (v14 != 46) {
        goto LABEL_106;
      }
      CFDataRef v17 = v49;
      uint64_t v23 = 1;
      if (!v49)
      {
LABEL_61:
        if (v50)
        {
          UniChar v24 = v50[v51 + v23];
        }
        else
        {
          if (v54 <= v23 || (uint64_t v33 = v53, v53 > v23))
          {
            v34.location = v51;
            if (v52 >= 64) {
              v34.length = 64;
            }
            else {
              v34.length = v52;
            }
            uint64_t v53 = 0;
            CFIndex v54 = v34.length;
            CFStringGetCharacters(theString, v34, buffer);
            uint64_t v33 = v53;
          }
          UniChar v24 = buffer[v23 - v33];
        }
LABEL_70:
        if ((v24 & 0xFFDF) == 0x41)
        {
          uint64_t v35 = v23 + 1;
          if (v49)
          {
            UniChar v36 = v49[v51 + v35];
          }
          else if (v50)
          {
            UniChar v36 = v50[v51 + v35];
          }
          else
          {
            if (v54 <= v35 || (uint64_t v40 = v53, v53 > v35))
            {
              v41.location = v51;
              if (v52 >= 64) {
                v41.length = 64;
              }
              else {
                v41.length = v52;
              }
              uint64_t v53 = 0;
              CFIndex v54 = v41.length;
              CFStringGetCharacters(theString, v41, buffer);
              uint64_t v40 = v53;
            }
            UniChar v36 = buffer[v35 - v40];
          }
          if ((v36 & 0xFFDF) == 0x50)
          {
            uint64_t v42 = v23 | 2;
            if (v49)
            {
              UniChar v43 = v49[v51 + v42];
            }
            else if (v50)
            {
              UniChar v43 = v50[v51 + v42];
            }
            else
            {
              if (v54 <= v42 || (uint64_t v44 = v53, v53 > v42))
              {
                v45.location = v51;
                if (v52 >= 64) {
                  v45.length = 64;
                }
                else {
                  v45.length = v52;
                }
                uint64_t v53 = 0;
                CFIndex v54 = v45.length;
                CFStringGetCharacters(theString, v45, buffer);
                uint64_t v44 = v53;
              }
              UniChar v43 = buffer[v42 - v44];
            }
            if ((v43 & 0xFFDF) == 0x50)
            {
LABEL_104:
              *(_WORD *)(a2 + 4) = 3;
              *(_DWORD *)a2 |= 0x8000000u;
              goto LABEL_105;
            }
          }
        }
LABEL_106:
        int8x16_t v46 = (void *)MEMORY[0x1E4F1CFC8];
        goto LABEL_107;
      }
    }
    UniChar v24 = v17[v51 + v23];
    goto LABEL_70;
  }
LABEL_105:
  int8x16_t v46 = (void *)MEMORY[0x1E4F1CFD0];
LABEL_107:
  *a3 = *v46;
  return 1;
}

uint64_t createVolumeIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFTypeRef v4 = (const void *)(a2 + 112);
  if (*(_DWORD *)(a2 + 112))
  {
    CFAllocatorRef v5 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }
  else
  {
    CFNumberRef v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createIsVolumeValue(uint64_t a1, _DWORD *a2, void *a3)
{
  CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*a2 & 0x2000) == 0) {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsMountTriggerValue(uint64_t a1, _DWORD *a2, void *a3)
{
  CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*a2 & 0x4000) == 0) {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsAliasFileValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(unsigned char *)a2 & 0x10) == 0) {
      return 0;
    }
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFD0];
    if (*(__int16 *)(a2 + 168) >= 0) {
      CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFC8];
    }
  }
  else if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else
  {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createCreationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  if (*(double *)(a2 + 80) == -1.0 - *MEMORY[0x1E4F1CF68])
  {
    CFDateRef v4 = 0;
  }
  else
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    CFDateRef v4 = CFDateCreate(v6, *(CFAbsoluteTime *)(a2 + 80));
  }
  *a3 = v4;
  return 1;
}

uint64_t createFileSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(unsigned char *)a2 & 0x40) == 0) {
    return 0;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xD000 | 0x2000) == 0xA000)
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, (const void *)(a2 + 208));
  }
  else
  {
    CFNumberRef v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createIsRegularFileValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000) {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createFinderInfoValue(const void *a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 0x10) == 0) {
    return 0;
  }
  if ((*(_DWORD *)a2 & 0x4000000) != 0)
  {
    if (createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::onceToken != -1) {
      dispatch_once(&createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::onceToken, &__block_literal_global_28);
    }
    CFNumberRef v7 = (void *)CFRetain((CFTypeRef)createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::zeroFinderInfoData);
    uint64_t result = 1;
  }
  else
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFDataCreate(v6, (const UInt8 *)(a2 + 160), 32);
    uint64_t result = 2;
  }
  *a3 = v7;
  return result;
}

uint64_t createFileIDValue(const void *a1, unsigned char *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0;
  }
  CFAllocatorRef v5 = a2 + 128;
  if (*((void *)a2 + 16))
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }
  else
  {
    CFNumberRef v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createInodeNumberValue(const void *a1, unsigned char *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0;
  }
  CFAllocatorRef v5 = a2 + 120;
  if (*((void *)a2 + 15))
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }
  else
  {
    CFNumberRef v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createIsSymbolicLinkValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000) {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFRunLoopObserverContext v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createFileResourceTypeValue(uint64_t a1, uint64_t a2, const void **a3)
{
  unsigned int v3 = (*(_DWORD *)(a2 + 16) & 0xF000) - 4096;
  if (v3 >> 14 > 2) {
    CFDateRef v4 = (const void **)MEMORY[0x1E4F1D630];
  }
  else {
    CFDateRef v4 = (const void **)qword_1E51F2608[v3 >> 12];
  }
  CFAllocatorRef v5 = *v4;
  *a3 = *v4;
  CFRetain(v5);
  return 1;
}

uint64_t createIsReadableValue(uint64_t a1, _DWORD *a2, void *a3)
{
  if ((*a2 & 8) == 0) {
    return 0;
  }
  if ((*a2 & 0x2000000) != 0) {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v4;
  return 1;
}

uint64_t createIsSystemImmutableValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x20000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserImmutableValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 2) == 0) {
    unsigned int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsExecutableValue(uint64_t a1, _DWORD *a2, void *a3)
{
  if ((*a2 & 8) == 0) {
    return 0;
  }
  if ((*a2 & 0x800000) != 0) {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v4;
  return 1;
}

uint64_t createIsCompressedValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x20) == 0) {
    unsigned int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsWriteableValue(uint64_t a1, _DWORD *a2, void *a3)
{
  if ((*a2 & 8) == 0) {
    return 0;
  }
  if ((*a2 & 0x1000000) != 0) {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v4;
  return 1;
}

uint64_t createIsHiddenValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 0x800) != 0 || (*(unsigned char *)(a2 + 21) & 0x80) != 0)
  {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else
  {
    if ((*(_DWORD *)a2 & 0x10) == 0) {
      return 0;
    }
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFD0];
    if ((*(_WORD *)(a2 + 168) & 0x4000) == 0) {
      CFDateRef v4 = (void *)MEMORY[0x1E4F1CFC8];
    }
  }
  *a3 = *v4;
  return 1;
}

uint64_t createAttributeModificationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 72));
  return 1;
}

uint64_t createContentModificationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 64));
  return 1;
}

uint64_t createFileFlagsValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 20));
  return 1;
}

uint64_t createParentDirectoryIDValue(const void *a1, unsigned char *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0;
  }
  CFAllocatorRef v5 = a2 + 136;
  if (*((void *)a2 + 17))
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }
  else
  {
    CFNumberRef v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createVolumeIsHFSStandardValue(uint64_t a1, _DWORD *a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*a2 & 0x40000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createAddedToDirectoryDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  if (*(double *)(a2 + 88) == -1.0 - *MEMORY[0x1E4F1CF68])
  {
    CFDateRef v4 = 0;
  }
  else
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    CFDateRef v4 = CFDateCreate(v6, *(CFAbsoluteTime *)(a2 + 88));
  }
  *a3 = v4;
  return 1;
}

uint64_t createFileAllocatedSizeOfResourceForkValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(unsigned char *)a2 & 0x20) == 0) {
      return 0;
    }
    CFAllocatorRef v7 = CFGetAllocator(a1);
    uint64_t valuePtr = *(void *)(a2 + 200);
    CFNumberRef v6 = CFNumberCreate(v7, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    CFNumberRef v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createParentDirectoryIsVolumeRoot(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(unsigned char *)a2 & 4) == 0) {
    return 0;
  }
  CFDateRef v4 = (void *)MEMORY[0x1E4F1CFD0];
  if (*(void *)(a2 + 136) != 2) {
    CFDateRef v4 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v4;
  return 1;
}

uint64_t createFileSizeOfResourceForkValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(unsigned char *)a2 & 0x20) == 0) {
      return 0;
    }
    CFAllocatorRef v7 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v7, kCFNumberSInt64Type, (const void *)(a2 + 192));
  }
  else
  {
    CFNumberRef v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createFileAllocatedSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(unsigned char *)a2 & 0x40) == 0) {
    return 0;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xD000 | 0x2000) == 0xA000)
  {
    CFAllocatorRef v6 = CFGetAllocator(a1);
    uint64_t valuePtr = *(void *)(a2 + 216);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    CFNumberRef v7 = 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t createIsSystemFirmlinkValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x800000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsSystemDatalessValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x40000000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsRestrictedValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x80000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createLabelNumberValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(unsigned char *)a2 & 0x10) == 0) {
    return 0;
  }
  int valuePtr = (*(unsigned __int16 *)(a2 + 168) >> 1) & 7;
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
  return 1;
}

uint64_t createLinkCountValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 24));
  return 1;
}

uint64_t createFileProtectionValue(uint64_t a1, uint64_t a2, const void **a3)
{
  int v3 = *(_DWORD *)(a2 + 48) - 1;
  if (v3 >= 4)
  {
    *a3 = 0;
  }
  else
  {
    CFDateRef v4 = (const void **)qword_1E51F25E8[v3];
    CFAllocatorRef v5 = *v4;
    *a3 = *v4;
    if (v5) {
      CFRetain(v5);
    }
  }
  return 1;
}

uint64_t createIsSystemNoUnlinkValue(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x100000) == 0) {
    int v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createGenerationIdentifierValue(const void *a1, uint64_t a2, CFDataRef *a3)
{
  int v4 = *(_DWORD *)(a2 + 32);
  if (v4)
  {
    if ((*(unsigned char *)a2 & 4) == 0) {
      return 0;
    }
    uint64_t v7 = *(void *)(a2 + 120);
    int v8 = v4;
    CFAllocatorRef v6 = CFGetAllocator(a1);
    *a3 = CFDataCreate(v6, (const UInt8 *)&v7, 12);
  }
  else
  {
    *a3 = 0;
  }
  return 1;
}

uint64_t createDocumentIdentifierValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  int v4 = (const void *)(a2 + 36);
  if (*(_DWORD *)(a2 + 36))
  {
    CFAllocatorRef v5 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }
  else
  {
    CFNumberRef v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t _FileCacheGetFinderInfo(uint64_t result)
{
  if (result)
  {
    if ((*(unsigned char *)(result + 48) & 0x10) != 0) {
      result += 208;
    }
    else {
      return 0;
    }
  }
  return result;
}

void _FSURLBeginResourcePropertyCacheAccess(const __CFURL *a1, const void *a2)
{
  if (a2 && _CFRunLoopCurrentIsMain())
  {
    CFTypeRef v4 = _FileCacheGetForURL(a1, a2);
    _FileCacheLock((uint64_t)v4);
    if (!_FileCacheGetAutoFlushingEnabled((uint64_t)v4)
      || _FileCacheGetInProvider((uint64_t)v4)
      || (int GlobalSeed = _FileCacheGetGlobalSeed(), _FileCacheIsValid((uint64_t)v4, GlobalSeed)))
    {
      _FileCacheUnlock((uint64_t)v4);
    }
    else
    {
      _FileCacheReleaseContents((uint64_t)v4, 1, 1, 1, 0);
      _FileCacheUnlock((uint64_t)v4);
      CFTypeRef cf = 0;
      if (_FSURLCopyResourcePropertyForKeyInternal(a1, (const __CFString *)*MEMORY[0x1E4F1CEC0], (void **)&cf, a2, 0, 1))
      {
        CFURLRef v6 = (const __CFURL *)cf;
        if (cf)
        {
          if (cf != (CFTypeRef)*MEMORY[0x1E4F1D260])
          {
            uint64_t v7 = (const void *)__CFURLResourceInfoPtr();
            if (v7)
            {
              CFTypeRef v8 = _FileCacheGetForURL(v6, v7);
              _FileCacheLock((uint64_t)v8);
              _FileCacheReleaseContents((uint64_t)v8, 1, 1, 1, 0);
              _FileCacheUnlock((uint64_t)v8);
            }
          }
          CFRelease(v6);
        }
      }
    }
  }
}

BOOL _FileCacheGetAutoFlushingEnabled(uint64_t a1)
{
  unsigned int v1 = atomic_load((unsigned int *)(a1 + 16));
  return v1 != -2;
}

BOOL _FileCacheIsValid(uint64_t a1, int a2)
{
  unsigned int v2 = atomic_load((unsigned int *)(a1 + 16));
  if ((v2 & 0x80000000) != 0) {
    return 1;
  }
  unsigned int v3 = atomic_load((unsigned int *)(a1 + 16));
  return v3 == a2;
}

uint64_t _FSURLCopyResourcePropertyForKeyFromCache(const __CFURL *a1, const __CFString *a2, void **a3, const void *a4)
{
  return _FSURLCopyResourcePropertyForKeyInternal(a1, a2, a3, a4, 0, 0);
}

void _URLEnumeratorFinalize(const void *a1)
{
  unsigned int v2 = (const void *)*((void *)a1 + 5);
  if (v2) {
    CFRelease(v2);
  }
  unsigned int v3 = (const void *)*((void *)a1 + 6);
  if (v3) {
    CFRelease(v3);
  }
  CFTypeRef v4 = (void *)*((void *)a1 + 9);
  if (v4)
  {
    if (*((uint64_t *)a1 + 10) >= 1)
    {
      uint64_t v5 = 0;
      do
        CFRelease(*(CFTypeRef *)(*((void *)a1 + 9) + 8 * v5++));
      while (v5 < *((void *)a1 + 10));
      CFTypeRef v4 = (void *)*((void *)a1 + 9);
    }
    CFAllocatorDeallocate(*((CFAllocatorRef *)a1 + 2), v4);
  }
  CFURLRef v6 = (const void *)*((void *)a1 + 8);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)*((void *)a1 + 12);
  if (v7) {
    CFRelease(v7);
  }
  CFTypeRef v8 = (const void *)*((void *)a1 + 14);
  if (v8) {
    CFRelease(v8);
  }
  UniChar v9 = (void *)*((void *)a1 + 20);
  if (v9) {
    DirEnumClose(v9);
  }
  CFStringRef v10 = (const void *)*((void *)a1 + 67);
  if (v10)
  {
    CFRelease(v10);
  }
}

uint64_t DirEnumClose(void *a1)
{
  unsigned int v2 = (void *)a1[230];
  if (v2)
  {
    do
    {
      unsigned int v3 = (void *)*v2;
      DirEnumEntryFree((uint64_t)a1, (uint64_t)v2);
      unsigned int v2 = v3;
    }
    while (v3);
  }
  CFTypeRef v4 = (void *)a1[231];
  if (v4)
  {
    do
    {
      uint64_t v5 = (void *)*v4;
      free(v4);
      CFTypeRef v4 = v5;
    }
    while (v5);
  }
  CFURLRef v6 = (void *)a1[232];
  if (v6) {
    free(v6);
  }
  free(a1);
  return 0;
}

void _FSURLClearResourcePropertyCacheForKey(const __CFURL *a1, const void *a2, CFTypeRef cf)
{
  if (!cf) {
    return;
  }
  CFURLRef v6 = _FileCacheGetForURL(a1, cf);
  uint64_t v7 = v6;
  if (a2)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, a2);
    if (Value)
    {
      uint64_t v9 = (uint64_t)Value;
      _FileCacheLock((uint64_t)v7);
      clearPropertyAndDependentValues((uint64_t)a1, (uint64_t)v7, v9);
      _FileCacheUnlock((uint64_t)v7);
      goto LABEL_10;
    }
    _FileCacheLockTempPermProperties();
    CFDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v7, 0);
    if (TemporaryPropertyDictionary) {
      CFDictionaryRemoveValue(TemporaryPropertyDictionary, a2);
    }
    _FileCacheUnlockTempPermProperties();
  }
  else
  {
    _FileCacheLock((uint64_t)v6);
    _FileCacheReleaseContents((uint64_t)v7, 1, 0, 1, 0);
    _FileCacheUnlock((uint64_t)v7);
  }
  uint64_t v9 = 0;
LABEL_10:
  CFTypeRef cfa = 0;
  int v11 = _FSURLCopyResourcePropertyForKeyInternal(a1, (const __CFString *)*MEMORY[0x1E4F1CEC0], (void **)&cfa, cf, 0, 1);
  CFURLRef v12 = (const __CFURL *)cfa;
  if (v11) {
    BOOL v13 = cfa == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if (cfa != (CFTypeRef)*MEMORY[0x1E4F1D260])
    {
      UniChar v14 = (const void *)__CFURLResourceInfoPtr();
      if (v14)
      {
        uint64_t v15 = _FileCacheGetForURL(v12, v14);
        BOOL v16 = v15;
        if (a2)
        {
          if (!v9)
          {
            _FileCacheLockTempPermProperties();
            CFDataRef v17 = _FileCacheGetTemporaryPropertyDictionary(v16, 0);
            if (v17) {
              CFDictionaryRemoveValue(v17, a2);
            }
            _FileCacheUnlockTempPermProperties();
            goto LABEL_24;
          }
          _FileCacheLock((uint64_t)v15);
          clearPropertyAndDependentValues((uint64_t)v12, (uint64_t)v16, v9);
        }
        else
        {
          _FileCacheLock((uint64_t)v15);
          _FileCacheReleaseContents((uint64_t)v16, 1, 0, 1, 0);
        }
        _FileCacheUnlock((uint64_t)v16);
      }
    }
LABEL_24:
    CFRelease(v12);
  }
}

uint64_t _FileCacheFinalize(os_unfair_lock_s *a1)
{
  unsigned int v2 = a1 + 10;
  os_unfair_recursive_lock_lock_with_options();
  os_unfair_lock_lock(a1 + 9);
  _FileCacheReleaseContents((uint64_t)a1, 0, 0, 0, 1);
  os_unfair_lock_unlock(a1 + 9);
  return MEMORY[0x1F40CD628](v2);
}

void _FileCacheReleaseContents(uint64_t a1, int a2, int a3, int a4, int a5)
{
  if (!a5)
  {
    _FileCacheLock(a1);
    _FileCacheLockTransitionToPreparer(a1);
  }
  CFStringRef v10 = *(const void **)(a1 + 56);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 56) = 0;
  }
  int v11 = *(const void **)(a1 + 272);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a1 + 272) = 0;
  }
  CFURLRef v12 = *(const void **)(a1 + 280);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(a1 + 280) = 0;
  }
  BOOL v13 = *(const void **)(a1 + 288);
  if (v13)
  {
    *(void *)(a1 + 288) = 0;
    CFRelease(v13);
  }
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  if (a3)
  {
LABEL_12:
    if (a4) {
      goto LABEL_25;
    }
    if (a5)
    {
      UniChar v14 = *(const void **)(a1 + 304);
      if (v14)
      {
        *(void *)(a1 + 304) = 0;
        CFRelease(v14);
      }
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if (a5)
  {
    uint64_t v15 = *(const void **)(a1 + 296);
    if (v15)
    {
      *(void *)(a1 + 296) = 0;
      CFRelease(v15);
    }
    goto LABEL_12;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sTempPermDictionaryLock);
  BOOL v16 = *(const void **)(a1 + 296);
  if (v16)
  {
    *(void *)(a1 + 296) = 0;
    CFRelease(v16);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTempPermDictionaryLock);
  if (!a4)
  {
LABEL_22:
    os_unfair_lock_lock((os_unfair_lock_t)&sTempPermDictionaryLock);
    CFDataRef v17 = *(const void **)(a1 + 304);
    if (v17)
    {
      *(void *)(a1 + 304) = 0;
      CFRelease(v17);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&sTempPermDictionaryLock);
  }
LABEL_25:
  unint64_t v18 = *(const void **)(a1 + 312);
  if (v18)
  {
    CFRelease(v18);
    *(void *)(a1 + 312) = 0;
  }
  if (a2) {
    atomic_store(0xFFFFFFFF, (unsigned int *)(a1 + 16));
  }
  if (!a5)
  {
    _FileCacheLockTransitionFromPreparer(a1);
    int v19 = *(_DWORD *)(a1 + 32) - 1;
    *(_DWORD *)(a1 + 32) = v19;
    if (!v19)
    {
      *(void *)(a1 + 24) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
    }
  }
}

void _CreateVolumeURLsArray(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  size_t v5 = 8 * a3;
  CFURLRef v6 = CFAllocatorAllocate(*(CFAllocatorRef *)(a1 + 16), 8 * a3, 0);
  *(void *)(a1 + 72) = v6;
  if (!v6) {
    goto LABEL_12;
  }
  bzero(v6, v5);
  *(_WORD *)(a1 + 128) = 5;
  *(void *)(a1 + 138) = 0;
  *(void *)(a1 + 130) = 0;
  *(void *)(a1 + 144) = 0;
  uint64_t v35 = (const __CFArray **)(a1 + 64);
  *(unsigned char *)(a1 + 121) = _FSURLGetAttrListForPropertyKeys(0, *(CFArrayRef *)(a1 + 40), a1 + 128, (__CFArray **)(a1 + 64), (Boolean *)(a1 + 122));
  *(_DWORD *)(a1 + 132) &= ~0x8000000u;
  CFArrayRef v7 = *(const __CFArray **)(a1 + 64);
  if (v7)
  {
    v41.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 64));
    v41.location = 0;
    BOOL v8 = CFArrayContainsValue(v7, v41, (const void *)*MEMORY[0x1E4F1D748]) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  *(unsigned char *)(a1 + 123) = v8;
  CFArrayRef v9 = *(const __CFArray **)(a1 + 40);
  if (v9)
  {
    v42.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
    v42.location = 0;
    BOOL v10 = CFArrayContainsValue(v9, v42, (const void *)*MEMORY[0x1E4F1D588]) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  *(unsigned char *)(a1 + 124) = v10;
  if (!*(unsigned char *)(a1 + 121)
    || (int v11 = _FSURLCalculateAttributeBufferSize((const attrlist *)(a1 + 128)), !*(unsigned char *)(a1 + 121)))
  {
    p_attrgroup_t forkattr = 0;
    UniChar v14 = 0;
    char v36 = 1;
    goto LABEL_14;
  }
  *(_DWORD *)(a1 + 132) |= 0x80000000;
  p_attrgroup_t forkattr = (size_t)&v11->forkattr;
  BOOL v13 = (attrlist *)malloc_type_malloc((size_t)&v11->forkattr, 0x470910A4uLL);
  if (!v13)
  {
LABEL_12:
    *(void *)(a1 + 112) = _FSURLCreateStandardError(*(const __CFAllocator **)(a1 + 16), (const __CFString *)*MEMORY[0x1E4F1D160], 12, 0, 0, 0);
    return;
  }
  UniChar v14 = v13;
  char v36 = 0;
LABEL_14:
  *(void *)(a1 + 80) = 0;
  if (a3 >= 1)
  {
    uint64_t v15 = 0;
    CFStringRef v34 = (const __CFString *)*MEMORY[0x1E4F1D690];
    do
    {
      uint64_t v39 = 0;
      uint64_t v16 = MountInfoStorageSize();
      MEMORY[0x1F4188790](v16);
      if (!MountInfoPrepareWithMountPointString()) {
        uint64_t v39 = 0;
      }
      if (v36)
      {
        size_t v17 = strlen(a2);
        CFURLRef v18 = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(a1 + 16), (const UInt8 *)a2, v17, 1u);
        if (v18)
        {
          CFURLRef v19 = v18;
          if (v39) {
            _FSURLCacheCheapVolumeInformationForVolume(v18, (uint64_t)v39);
          }
          CFArrayRef v20 = *v35;
          if (*v35)
          {
            UniChar v21 = (const void *)__CFURLResourceInfoPtr();
            _FSURLCacheResourcePropertiesForKeys(v19, v20, v21, 0);
          }
          uint64_t v22 = *(void *)(a1 + 80);
          *(void *)(*(void *)(a1 + 72) + 8 * v22) = v19;
          *(void *)(a1 + 80) = v22 + 1;
        }
        size_t v23 = p_forkattr;
        goto LABEL_31;
      }
      if (filtered_getattrlist(a2, (_DWORD *)(a1 + 128), v14, p_forkattr, 0x25u))
      {
        size_t v23 = p_forkattr;
        goto LABEL_28;
      }
      size_t v23 = *(unsigned int *)&v14->bitmapcount;
      if (p_forkattr >= v23)
      {
        size_t v23 = p_forkattr;
      }
      else
      {
        uint64_t v27 = (attrlist *)malloc_type_realloc(v14, *(unsigned int *)&v14->bitmapcount, 0x2CBD2195uLL);
        if (!v27) {
          goto LABEL_28;
        }
        UniChar v14 = v27;
        if (filtered_getattrlist(a2, (_DWORD *)(a1 + 128), v27, v23, 0x21u)) {
          goto LABEL_28;
        }
      }
      size_t v28 = strlen(a2);
      CFURLRef v29 = _FSURLCreateWithPathAndAttributes(*(const __CFAllocator **)(a1 + 16), (unsigned __int8 *)a2, v28, 0, 0, (attrlist *)(a1 + 128), v14, (*(unsigned char *)(a1 + 32) & 4) != 0, *(_WORD *)(a1 + 123), HIBYTE(*(_WORD *)(a1 + 123)), v33, 1, v39, 0);
      if (v29)
      {
        CFURLRef v30 = v29;
        if ((*(unsigned char *)(a1 + 32) & 2) != 0)
        {
          CFBooleanRef propertyValueTypeRefPtr = 0;
          if (CFURLCopyResourcePropertyForKey(v29, v34, &propertyValueTypeRefPtr, 0))
          {
            if (propertyValueTypeRefPtr)
            {
              if (CFBooleanGetValue(propertyValueTypeRefPtr))
              {
                CFRelease(v30);
                CFRelease(propertyValueTypeRefPtr);
                goto LABEL_31;
              }
              CFRelease(propertyValueTypeRefPtr);
            }
          }
        }
        if (v39) {
          _FSURLCacheCheapVolumeInformationForVolume(v30, (uint64_t)v39);
        }
        CFArrayRef v31 = *v35;
        if (*v35)
        {
          UniChar v32 = (const void *)__CFURLResourceInfoPtr();
          _FSURLCacheResourcePropertiesForKeys(v30, v31, v32, 0);
        }
        uint64_t v26 = *(void *)(a1 + 80);
        *(void *)(*(void *)(a1 + 72) + 8 * v26) = v30;
        goto LABEL_30;
      }
LABEL_28:
      size_t v24 = strlen(a2);
      CFURLRef v25 = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(a1 + 16), (const UInt8 *)a2, v24, 1u);
      if (v25)
      {
        uint64_t v26 = *(void *)(a1 + 80);
        *(void *)(*(void *)(a1 + 72) + 8 * v26) = v25;
LABEL_30:
        *(void *)(a1 + 80) = v26 + 1;
      }
LABEL_31:
      ++v15;
      MountInfoDestroy(v39);
      a2 += 1024;
      p_attrgroup_t forkattr = v23;
    }
    while (v15 < a3);
  }
  if (v14) {
    free(v14);
  }
  *(void *)(a1 + 88) = 0;
}

uint64_t _FSURLGetAttrListForPropertyKeys(int a1, CFArrayRef theArray, uint64_t a3, __CFArray **a4, Boolean *a5)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (initGlobalsOnce(void)::onceToken == -1)
  {
    if (theArray) {
      goto LABEL_3;
    }
    return 0;
  }
  dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
  if (!theArray) {
    return 0;
  }
LABEL_3:
  if (a5) {
    *a5 = 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (!Count) {
    return 0;
  }
  CFIndex v9 = Count;
  memset(v48, 0, 60);
  memset(v47, 0, 60);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != v9; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      Value = CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, ValueAtIndex);
      if (Value)
      {
        uint64_t v13 = (uint64_t)Value;
        addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v48);
        if (a4 && qword_1EB20E018 != **(_DWORD **)(v13 + 140)) {
          addPropertyAndDependenciesToBitmap(v13, (uint64_t)v47);
        }
        if (a5 && !*a5 && qword_1EB20E020 == **(_DWORD **)(v13 + 140)) {
          *a5 = CFEqual(*(CFTypeRef *)(*(void *)v13 + 8), @"__kCFURLCheapVolumeInformationKey");
        }
      }
    }
  }
  uint64_t v14 = qword_1EB20E018;
  if (a4)
  {
    uint64_t v15 = (char *)v47 + 12 * qword_1EB20E018;
    *((_DWORD *)v15 + 2) = 0;
    *(void *)uint64_t v15 = 0;
    if (qword_1EB20DEF8 < 1)
    {
      Mutable = 0;
    }
    else
    {
      Mutable = 0;
      uint64_t v17 = 0;
      do
      {
        CFURLRef v18 = (char *)v47 + 12 * v17;
        uint64_t v19 = *(void *)v18;
        int64_t v50 = 0;
        uint64_t v51 = v19;
        int v52 = *((_DWORD *)v18 + 2);
        int64_t v49 = 0;
        if (PropertyMaskIsNotZero((uint64_t)&v51, (unint64_t *)&v50, &v49) && v50 <= v49)
        {
          CFArrayRef v20 = &sFileProviderGlobals[7 * v17 + 8];
          uint64_t v21 = v51;
          int v22 = v52;
          unint64_t v23 = 148 * v50;
          unint64_t v24 = v49 - v50 + 1;
          do
          {
            uint64_t v25 = *v20;
            int v26 = *(_DWORD *)(*v20 + v23 + 136);
            int v27 = 1 << v26;
            BOOL v28 = v26 < 64;
            if (v26 >= 64) {
              uint64_t v29 = 0;
            }
            else {
              uint64_t v29 = 1 << v26;
            }
            if (v28) {
              int v30 = 0;
            }
            else {
              int v30 = v27;
            }
            int v31 = v30 & v22;
            if ((v29 & v21) != 0 || v31 != 0)
            {
              if (Mutable
                || (CFAllocatorRef v33 = CFGetAllocator(*(CFTypeRef *)(v25 + v23 + 8)),
                    (Mutable = CFArrayCreateMutable(v33, 0, MEMORY[0x1E4F1D510])) != 0))
              {
                CFArrayAppendValue(Mutable, *(const void **)(v25 + v23 + 8));
              }
            }
            v23 += 148;
            --v24;
          }
          while (v24);
        }
        ++v17;
      }
      while (v17 < qword_1EB20DEF8);
      uint64_t v14 = qword_1EB20E018;
    }
    *a4 = Mutable;
  }
  LOBYTE(v52) = 0;
  uint64_t v51 = 0;
  uint64_t v34 = SHIDWORD(sFileProviderGlobals[7 * v14 + 2]);
  if ((int)v34 >= 1)
  {
    uint64_t v35 = (char *)v48 + 12 * v14;
    uint64_t v36 = *(void *)v35;
    int v37 = *((_DWORD *)v35 + 2);
    CFRange v38 = (_DWORD *)sFileProviderGlobals[7 * v14 + 8];
    do
    {
      int v39 = v38[34];
      uint64_t v40 = 1 << v39;
      if (v39 >= 64) {
        uint64_t v40 = 0;
      }
      if ((v40 & v36) != 0 || (v39 >= 64 ? (int v41 = 1 << v39) : (int v41 = 0), (v41 & v37) != 0))
      {
        *((unsigned char *)&v51 + *(void *)(*(void *)v38 + 16)) = 1;
        LOBYTE(v51) = 1;
      }
      v38 += 37;
      --v34;
    }
    while (v34);
  }
  unsigned __int8 v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &corePropertyAttrListTable[20];
  do
  {
    if (*((unsigned char *)&v51 + v43))
    {
      *(int8x16_t *)(a3 + 4) = vorrq_s8(*(int8x16_t *)(a3 + 4), *((int8x16_t *)v44 - 1));
      *(_DWORD *)(a3 + 20) |= *(_DWORD *)v44;
      unsigned __int8 v42 = 1;
    }
    ++v43;
    v44 += 24;
  }
  while (v43 != 9);
  return v42;
}

uint64_t _FSURLCacheResourcePropertiesForKeys(const __CFURL *a1, CFArrayRef theArray, const void *a3, CFErrorRef *a4)
{
  uint64_t Count = CFArrayGetCount(theArray);
  if (!Count) {
    return 1;
  }
  CFTypeRef v9 = _FileCacheGetForURL(a1, a3);
  _FileCacheLock((uint64_t)v9);
  memset(v12, 0, 60);
  getPropertyBitmapForKeys(theArray, Count, (uint64_t)v12);
  _FileCacheLockTransitionToPreparer((uint64_t)v9);
  uint64_t v10 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v9, (uint64_t)v12, (uint64_t)a4);
  _FileCacheLockTransitionFromPreparer((uint64_t)v9);
  _FileCacheUnlock((uint64_t)v9);
  if (a4 && !v10)
  {
    if (*a4)
    {
      return 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLCacheResourcePropertiesForKeys_cold_1();
      }
      uint64_t v10 = 0;
      *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
    }
  }
  return v10;
}

uint64_t MountInfoPrepareWithMountPointString()
{
  return 1;
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeysInternal(const __CFURL *a1, const __CFArray *a2, CFTypeRef cf, __CFError **a4, int a5)
{
  int v106 = a5;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  CFTypeRef v112 = a1;
  CFArrayRef v7 = _FileCacheGetForURL(a1, cf);
  if (a2) {
    CFArrayRef v8 = a2;
  }
  else {
    CFArrayRef v8 = (const __CFArray *)qword_1EB20E038;
  }
  CFArrayRef v117 = v8;
  CFIndex Count = CFArrayGetCount(v8);
  uint64_t v10 = qword_1EB20DEF8;
  uint64_t v11 = MEMORY[0x1F4188790](Count);
  uint64_t v13 = &v102 - 32 * v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = &v102 - 32 * v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  uint64_t v19 = &v102 - 32 * v18;
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  CFArrayRef v22 = (const __CFArray *)((char *)&v102 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  uint64_t v25 = (char *)&v102 - (((int)v24 + 15) & 0xFF0);
  if ((v26 & 0x600) != 0) {
    size_t v27 = 512;
  }
  else {
    size_t v27 = v24;
  }
  MEMORY[0x1F4188790](v23);
  int v30 = (const void **)((char *)&v102 - v29);
  if (v10 >= 1) {
    bzero(v22, v28);
  }
  bzero(v25, v27);
  bzero(v30, v27);
  LOBYTE(v116) = CFArrayGetCount(v117);
  uint64_t v116 = v116;
  if (!(_BYTE)v116)
  {
    CFIndex v33 = 0;
    goto LABEL_87;
  }
  acl_t v113 = v19;
  CFArrayRef v114 = v22;
  int v115 = v7;
  uint64_t v109 = v10;
  int v31 = 0;
  CFIndex v32 = 0;
  CFIndex v33 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v117, v32);
    uint64_t v35 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, ValueAtIndex);
    if (v35)
    {
      uint64_t v36 = **(int **)(v35 + 140);
      CFArrayRef v37 = v114;
      uint64_t v38 = *((void *)v114 + v36);
      if (v38 <= 95)
      {
        v13[96 * v36 + v38] = *((void *)v35 + 1);
        v16[96 * v36 + v38] = 0;
        v113[96 * v36 + v38] = *(void *)v35;
        *((void *)v37 + v36) = v38 + 1;
      }
      int v31 = 1;
    }
    else
    {
      _FileCacheLockTempPermProperties();
      CFDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v115, 0);
      if (TemporaryPropertyDictionary)
      {
        value[0] = 0;
        if (CFDictionaryGetValueIfPresent(TemporaryPropertyDictionary, ValueAtIndex, (const void **)value))
        {
          uint64_t v40 = value[0];
          if (value[0])
          {
            *(void *)&v25[8 * v33] = ValueAtIndex;
            v30[v33++] = CFRetain(v40);
          }
        }
      }
      CFDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v115, 0);
      if (PermanentPropertyDictionary)
      {
        value[0] = 0;
        if (CFDictionaryGetValueIfPresent(PermanentPropertyDictionary, ValueAtIndex, (const void **)value))
        {
          unsigned __int8 v42 = value[0];
          if (value[0])
          {
            *(void *)&v25[8 * v33] = ValueAtIndex;
            v30[v33++] = CFRetain(v42);
          }
        }
      }
      _FileCacheUnlockTempPermProperties();
    }
    ++v32;
  }
  while (v116 != v32);
  uint64_t v43 = v113;
  if (!v31)
  {
    uint64_t v10 = v109;
    CFArrayRef v22 = v114;
    goto LABEL_87;
  }
  uint64_t v44 = v115;
  _FileCacheLock((uint64_t)v115);
  if (v109 < 1)
  {
    _FileCacheUnlock((uint64_t)v44);
LABEL_94:
    CFAllocatorRef v98 = CFGetAllocator(v112);
    CFDictionaryRef v99 = CFDictionaryCreate(v98, (const void **)v25, v30, v33, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    goto LABEL_95;
  }
  long long v104 = a4;
  uint64_t v103 = -768;
  uint64_t v45 = 768 * v109 - 768;
  v108 = v16;
  int8x16_t v46 = (CFTypeRef *)((char *)v16 + v45);
  uint64_t v47 = (uint64_t)v43 + v45;
  uint64_t v105 = v13;
  int8x16_t v48 = (char *)v13 + v45;
  int64_t v49 = &sFileProviderGlobals[7 * v109 - 4];
  int v50 = 1;
  uint64_t v107 = v109 - 1;
  uint64_t v51 = v109 - 1;
  CFArrayRef v22 = v114;
  int v52 = v115;
  while (1)
  {
    uint64_t v53 = *((void *)v22 + v51);
    if (v53 >= 1)
    {
      CFIndex v54 = (uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))v49[1];
      uint64_t v110 = *v49;
      char v111 = v54;
      _FileCacheIncrementInProvider((uint64_t)v52);
      int v55 = v111(v112, v52, v48, v46, v47, v53, v110);
      _FileCacheDecrementInProvider((uint64_t)v52);
      int v50 = v55;
      if (!v55) {
        break;
      }
    }
    v46 -= 96;
    v47 -= 768;
    v48 -= 768;
    v49 -= 7;
    BOOL v56 = v51-- <= 0;
    CFArrayRef v22 = v114;
    if (v56) {
      goto LABEL_45;
    }
  }
  uint64_t v57 = v109;
  if (v51 >= v109)
  {
    int v50 = 0;
    CFArrayRef v22 = v114;
  }
  else
  {
    CFArrayRef v22 = v114;
    do
    {
      uint64_t v58 = *((void *)v22 + v51);
      int8x16_t v59 = v46;
      if (v58 >= 1)
      {
        do
        {
          if (*v59)
          {
            CFRelease(*v59);
            *int8x16_t v59 = 0;
          }
          ++v59;
          --v58;
        }
        while (v58);
      }
      ++v51;
      v46 += 96;
    }
    while (v51 != v57);
    int v50 = 0;
  }
LABEL_45:
  int v60 = v106;
  if (v106) {
    BOOL v61 = v50 == 0;
  }
  else {
    BOOL v61 = 0;
  }
  int v62 = v61;
  a4 = v104;
  uint64_t v13 = v105;
  uint64_t v16 = v108;
  int8x16_t v63 = v115;
  LODWORD(v110) = v62;
  if (v61)
  {
    if (_FileCacheLockTransitionToPreparer((uint64_t)v115))
    {
      int v50 = 0;
    }
    else
    {
      _FileCacheLock((uint64_t)v63);
      if (v109 < 1)
      {
        int v64 = 0;
      }
      else
      {
        int v64 = 0;
        uint64_t v65 = v103 + 768 * v109;
        int8x16_t v66 = (CFTypeRef *)((char *)v16 + v65);
        uint64x2_t v67 = (char *)v113 + v65;
        uint64x2_t v68 = (char *)v13 + v65;
        int64x2_t v69 = &sFileProviderGlobals[7 * v109 - 4];
        uint64_t v70 = v107;
        uint64x2_t v71 = v115;
        while (1)
        {
          uint64_t v107 = v70;
          uint64_t v72 = *((void *)v22 + v70);
          if (v72 >= 1)
          {
            uint64_t v73 = *v69;
            char v111 = (uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))v69[1];
            _FileCacheIncrementInProvider((uint64_t)v71);
            int v74 = v111(v112, v71, v68, v66, (uint64_t)v67, v72, v73);
            uint64_t v13 = v105;
            int v75 = v74;
            _FileCacheDecrementInProvider((uint64_t)v71);
            int v64 = v75;
            if (!v75) {
              break;
            }
          }
          uint64_t v70 = v107 - 1;
          v66 -= 96;
          v67 -= 768;
          v68 -= 768;
          v69 -= 7;
          CFArrayRef v22 = v114;
          if (v107 <= 0) {
            goto LABEL_71;
          }
        }
        uint64_t v76 = v109;
        uint64_t v77 = v107;
        if (v107 >= v109)
        {
          int v64 = 0;
          uint64_t v13 = v105;
          CFArrayRef v22 = v114;
        }
        else
        {
          CFArrayRef v22 = v114;
          do
          {
            uint64_t v78 = *((void *)v22 + v77);
            unint64_t v79 = v66;
            if (v78 >= 1)
            {
              do
              {
                if (*v79)
                {
                  CFRelease(*v79);
                  *unint64_t v79 = 0;
                }
                ++v79;
                --v78;
              }
              while (v78);
            }
            ++v77;
            v66 += 96;
          }
          while (v77 != v76);
          int v64 = 0;
          uint64_t v13 = v105;
        }
      }
LABEL_71:
      int8x16_t v63 = v115;
      int v80 = v64;
      _FileCacheUnlock((uint64_t)v115);
      int v50 = v80;
      a4 = v104;
      uint64_t v16 = v108;
      int v60 = v106;
    }
    int v62 = v110;
  }
  if (!v60 || v50)
  {
    LODWORD(v107) = v50;
    uint64_t v10 = v109;
    if (!v62) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
  long long v119 = 0u;
  memset(v120, 0, sizeof(v120));
  *(_OWORD *)value = 0u;
  getPropertyBitmapForKeys(v117, v116, (uint64_t)value);
  int v81 = prepareValuesForBitmap((uint64_t)v112, (uint64_t)v63, (uint64_t)value, (uint64_t)a4);
  uint64_t v10 = v109;
  LODWORD(v107) = v81;
  if (v81)
  {
    _FileCacheLock((uint64_t)v63);
    if (v10 >= 1)
    {
      CFArrayRef v82 = v114;
      size_t v83 = v115;
      size_t v84 = v105;
      unsigned int v85 = v16;
      uint64_t v86 = v109;
      char v87 = &qword_1EB20DF20;
      do
      {
        uint64_t v89 = *(void *)v82;
        CFArrayRef v82 = (const __CFArray *)((char *)v82 + 8);
        uint64_t v88 = v89;
        uint64_t v90 = v113;
        if (v89 >= 1)
        {
          uint64_t v116 = *v87;
          CFArrayRef v117 = v82;
          char v111 = (uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))*(v87 - 3);
          uint64_t v91 = v88;
          _FileCacheIncrementInProvider((uint64_t)v83);
          uint64_t v92 = v91;
          uint64_t v16 = v108;
          ((void (*)(CFTypeRef, void *, uint64_t *, uint64_t *, uint64_t *, uint64_t, uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t)))v116)(v112, v83, v84, v85, v90, v92, v111);
          _FileCacheDecrementInProvider((uint64_t)v83);
          CFArrayRef v82 = v117;
        }
        acl_t v113 = v90 + 96;
        v85 += 96;
        v84 += 96;
        v87 += 7;
        --v86;
      }
      while (v86);
    }
    int8x16_t v63 = v115;
    _FileCacheUnlock((uint64_t)v115);
    a4 = v104;
    uint64_t v10 = v109;
    uint64_t v13 = v105;
    CFArrayRef v22 = v114;
  }
  if (v110) {
LABEL_85:
  }
    _FileCacheLockTransitionFromPreparer((uint64_t)v63);
LABEL_86:
  _FileCacheUnlock((uint64_t)v63);
  if (v107)
  {
LABEL_87:
    if (v10 >= 1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        uint64_t v94 = *((void *)v22 + i);
        int v95 = (const void **)v16;
        char v96 = v13;
        if (v94 >= 1)
        {
          do
          {
            int v97 = *v95;
            if (*v95)
            {
              *(void *)&v25[8 * v33] = *v96;
              v30[v33++] = v97;
            }
            ++v96;
            ++v95;
            --v94;
          }
          while (v94);
        }
        v13 += 96;
        v16 += 96;
      }
    }
    goto LABEL_94;
  }
  CFDictionaryRef v99 = 0;
LABEL_95:
  if (v33 >= 1)
  {
    do
    {
      int32x2_t v100 = *v30++;
      CFRelease(v100);
      --v33;
    }
    while (v33);
  }
  if (a4 && !v99 && !*a4)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCopyResourcePropertiesForKeysInternal();
    }
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
  return v99;
}

CFArrayRef getPropertyBitmapForKeys(const __CFArray *theArray, uint64_t a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    CFArrayRef v5 = theArray;
    for (CFIndex i = 0; i != a2; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
      theArray = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, ValueAtIndex);
      if (theArray) {
        theArray = (const __CFArray *)addPropertyAndDependenciesToBitmap((uint64_t)theArray, a3);
      }
    }
  }
  return theArray;
}

uint64_t pathURLPropertyProviderCopyValues(const __CFURL *a1, uint64_t a2, CFTypeRef *a3, void **a4, uint64_t a5, uint64_t a6)
{
  if (a6 < 1) {
    return 1;
  }
  uint64_t v6 = a6;
  uint64_t v11 = (const void *)*MEMORY[0x1E4F1D980];
  uint64_t v12 = (const void *)*MEMORY[0x1E4F1D740];
  uint64_t v13 = (const void *)*MEMORY[0x1E4F1D748];
  CFTypeRef v17 = (CFTypeRef)*MEMORY[0x1E4F1CE10];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F1D680];
  CFTypeRef v16 = (CFTypeRef)*MEMORY[0x1E4F1CE18];
  while (1)
  {
    CFTypeRef v14 = *a3;
    if (!CFEqual(*a3, v11))
    {
      if (!CFEqual(v14, v12) && !CFEqual(v14, v13) && !CFEqual(v14, cf2) && !CFEqual(v14, v17))
      {
        uint64_t result = CFEqual(v14, v16);
        if (!result) {
          return result;
        }
      }
      uint64_t result = _FileCacheGetPropertyValueForKey(a2, v14, a4);
      if (!result) {
        return result;
      }
      goto LABEL_14;
    }
    if (!_FileCacheGetPropertyValueForKey(a2, v11, a4)) {
      break;
    }
LABEL_14:
    if (*a4) {
      CFRetain(*a4);
    }
LABEL_16:
    ++a4;
    ++a3;
    if (!--v6) {
      return 1;
    }
  }
  if ((~*(_DWORD *)_FileCacheGetAttributes(a2) & 0x2001) == 0)
  {
    uint64_t result = CFURLHasDirectoryPath(a1);
    if (!result) {
      return result;
    }
    *a4 = (void *)CFRetain(a1);
    goto LABEL_16;
  }
  return 0;
}

uint64_t pathURLPropertyProviderCopyAndCacheValues(const __CFURL *a1, uint64_t a2, CFTypeRef *a3, void **a4, uint64_t a5, uint64_t a6)
{
  if (a6 < 1) {
    return 1;
  }
  uint64_t v6 = a6;
  uint64_t v11 = (const void *)*MEMORY[0x1E4F1D980];
  uint64_t v12 = (const void *)*MEMORY[0x1E4F1D748];
  uint64_t v13 = (const void *)*MEMORY[0x1E4F1D740];
  CFTypeRef v14 = (const void *)*MEMORY[0x1E4F1D680];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F1CE10];
  CFTypeRef v21 = (CFTypeRef)*MEMORY[0x1E4F1CE18];
  while (1)
  {
    CFTypeRef v15 = *a3;
    if (CFEqual(*a3, v11)) {
      break;
    }
    if (CFEqual(v15, v12))
    {
      uint64_t result = _FileCacheGetPropertyValueForKey(a2, v15, a4);
      if (!result) {
        return result;
      }
      if (!*a4) {
        goto LABEL_24;
      }
      uint64_t Attributes = _FileCacheGetAttributes(a2);
      if (*(unsigned char *)(Attributes + 1))
      {
        uint64_t v18 = Attributes;
        uint64_t v19 = *(void **)(Attributes + 232);
        if (v19)
        {
          if (v19 != *a4)
          {
            if (CFEqual(v19, *a4))
            {
              _FileCacheSetPropertyValueForKey(a2, v12, *(const void **)(v18 + 232));
              *a4 = *(void **)(v18 + 232);
            }
          }
        }
      }
      uint64_t v20 = *a4;
LABEL_23:
      CFRetain(v20);
      goto LABEL_24;
    }
    if (!CFEqual(v15, v13) && !CFEqual(v15, v14) && !CFEqual(v15, cf2))
    {
      uint64_t result = CFEqual(v15, v21);
      if (!result) {
        return result;
      }
    }
    uint64_t result = _FileCacheGetPropertyValueForKey(a2, v15, a4);
    if (!result) {
      return result;
    }
LABEL_22:
    uint64_t v20 = *a4;
    if (*a4) {
      goto LABEL_23;
    }
LABEL_24:
    ++a4;
    ++a3;
    if (!--v6) {
      return 1;
    }
  }
  if (_FileCacheGetPropertyValueForKey(a2, v11, a4)) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)(_FileCacheGetAttributes(a2) + 1) & 0x20) != 0)
  {
    uint64_t result = CFURLHasDirectoryPath(a1);
    if (!result) {
      return result;
    }
    *a4 = (void *)CFRetain(a1);
    goto LABEL_24;
  }
  return 0;
}

uint64_t _FSURLGetVolumePropertyFlags(const __CFURL *a1, uint64_t a2, uint64_t *a3, CFTypeRef cf, CFErrorRef *a5)
{
  CFTypeRef v9 = _FileCacheGetForURL(a1, cf);
  _FileCacheLock((uint64_t)v9);
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, @"__kCFURLCheapVolumeInformationKey");
  memset(v15, 0, 60);
  addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v15);
  _FileCacheLockTransitionToPreparer((uint64_t)v9);
  uint64_t v11 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v9, (uint64_t)v15, (uint64_t)a5);
  _FileCacheLockTransitionFromPreparer((uint64_t)v9);
  if (v11)
  {
    CFDataRef VolumeInfo = (const __CFData *)_FileCacheGetVolumeInfo((uint64_t)v9);
    if (VolumeInfo)
    {
      *a3 = *((void *)CFDataGetBytePtr(VolumeInfo) + 4) & a2;
    }
    else if (a5)
    {
      CFAllocatorRef v13 = CFGetAllocator(a1);
      uint64_t v11 = 0;
      *a5 = _FSURLCreateStandardError(v13, (const __CFString *)*MEMORY[0x1E4F1D148], 256, 0, (const __CFString *)a1, 0);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  _FileCacheUnlock((uint64_t)v9);
  if (a5 && !v11 && !*a5)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLGetVolumePropertyFlags_cold_1();
    }
    *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
  return v11;
}

uint64_t volumePropertyProviderCopyAndCacheValues(uint64_t a1, uint64_t a2, const void **a3, CFTypeRef *a4, uint64_t *a5, uint64_t a6)
{
  if (a6 >= 1)
  {
    uint64_t v6 = a6;
    CFIndex Length = 0;
    BytePtr = 0;
    unsigned __int8 v12 = 0;
    while (1)
    {
      if (_FileCacheGetPropertyValueForKey(a2, *a3, (void **)a4))
      {
        if (*a4) {
          CFRetain(*a4);
        }
        unsigned __int8 v12 = 1;
      }
      else
      {
        uint64_t v13 = *a5;
        if (*(void *)(*a5 + 24))
        {
          if (CFEqual(*(CFTypeRef *)(v13 + 8), @"__kCFURLNoDependsVolumeInformationKey")) {
            BOOL v14 = 0;
          }
          else {
            BOOL v14 = BytePtr == 0;
          }
          if (!v14) {
            goto LABEL_15;
          }
          CFDataRef VolumeInfo = (const __CFData *)_FileCacheGetVolumeInfo(a2);
          if (VolumeInfo)
          {
            CFDataRef v16 = VolumeInfo;
            BytePtr = CFDataGetBytePtr(VolumeInfo);
            CFIndex Length = CFDataGetLength(v16);
LABEL_15:
            unsigned __int8 v12 = 1;
            if ((*(unsigned int (**)(uint64_t, uint64_t, const UInt8 *, CFIndex, uint64_t, uint64_t, CFTypeRef *))(v13 + 24))(a1, a2, BytePtr, Length, v13, 1, a4) == 2)_FileCacheSetPropertyValueForKey(a2, *a3, *a4); {
            goto LABEL_17;
            }
          }
          BytePtr = 0;
          *a4 = 0;
        }
      }
LABEL_17:
      ++a5;
      ++a4;
      ++a3;
      if (!--v6) {
        return v12;
      }
    }
  }
  return 0;
}

BOOL volumePropertyProviderPrepareValues(const __CFString *a1, uint64_t a2, uint64_t a3, CFTypeRef **a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v116 = 0;
  CFArrayRef v117 = 0;
  uint64_t v12 = MountInfoStorageSize();
  uint64_t v13 = (char *)&v92 - ((MEMORY[0x1F4188790](v12) + 15) & 0xFFFFFFFFFFFFFFF0);
  _FileCacheLock(a2);
  uint64_t Attributes = (fsid *)_FileCacheGetAttributes(a2);
  if ((Attributes->val[0] & 2) == 0)
  {
    _FileCacheUnlock(a2);
    if (CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)&v120, 1024))
    {
      long long v118 = xmmword_1817912D0;
      uint64_t v119 = 0;
      int v15 = filtered_getattrlist((char *)&v120, &v118, &v114, 0xCuLL, 0x21u);
      _FileCacheLock(a2);
      if (v15)
      {
        if (a7)
        {
          CFAllocatorRef v16 = CFGetAllocator(a1);
          CFStringRef v94 = (const __CFString *)a2;
          CFTypeRef v17 = Attributes;
          CFStringRef v18 = a1;
          uint64_t v19 = v13;
          uint64_t v20 = a7;
          CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F1D160];
          CFArrayRef v22 = __error();
          CFStringRef v23 = v21;
          a7 = v20;
          uint64_t v13 = v19;
          a1 = v18;
          uint64_t Attributes = v17;
          a2 = (uint64_t)v94;
          *a7 = _FSURLCreateStandardError(v16, v23, *v22, 0, a1, 0);
        }
      }
      else
      {
        int v25 = v115.val[0];
        Attributes[13] = v115;
        int32_t MountID = MountInfoPrepare(&v116, 0, v25, v13, 0, a1, 0);
        if (MountID) {
          int32_t MountID = MountInfoGetMountID((uint64_t)v116);
        }
        Attributes[14].val[0] = MountID;
        Attributes->val[0] |= 2u;
      }
    }
    else
    {
      if (a7)
      {
        CFAllocatorRef v24 = CFGetAllocator(a1);
        *a7 = _FSURLCreateStandardError(v24, (const __CFString *)*MEMORY[0x1E4F1D148], 4, 0, a1, 0);
      }
      _FileCacheLock(a2);
    }
    if ((Attributes->val[0] & 2) == 0)
    {
      BOOL v27 = 0;
      goto LABEL_140;
    }
  }
  uint64_t v110 = &v92;
  if (a5 < 1)
  {
    BOOL v111 = 1;
    goto LABEL_139;
  }
  uint64_t v109 = a7;
  int v112 = Attributes[14].val[0];
  int v113 = 0;
  int v108 = Attributes[13].val[0];
  size_t v28 = (const void *)*MEMORY[0x1E4F1D8B0];
  CFTypeRef v107 = (CFTypeRef)*MEMORY[0x1E4F1D890];
  uint64_t v29 = (const void *)*MEMORY[0x1E4F1CF48];
  f_mntonname = v120.f_mntonname;
  CFTypeRef v105 = (CFTypeRef)*MEMORY[0x1E4F1D918];
  CFAllocatorRef v98 = (const void *)*MEMORY[0x1E4F1CFC8];
  int v97 = (const void *)*MEMORY[0x1E4F1CFD0];
  long long v104 = (const void *)*MEMORY[0x1E4F1D8C8];
  int v30 = (const void *)*MEMORY[0x1E4F1D820];
  CFAllocatorRef v99 = (CFAllocatorRef)*MEMORY[0x1E4F1CF80];
  int v31 = (const void *)*MEMORY[0x1E4F1D818];
  BOOL v111 = 1;
  int32x2_t v100 = (const void *)*MEMORY[0x1E4F1D970];
  char v96 = (const void *)*MEMORY[0x1E4F1D8C0];
  int v95 = (const void *)*MEMORY[0x1E4F1D8A8];
  CFTypeRef v106 = v29;
  int32x2_t v101 = v31;
  uint64_t v102 = v30;
  while (1)
  {
    CFIndex v32 = *a4;
    if ((*a4)[3]) {
      goto LABEL_40;
    }
    CFIndex v33 = v28;
    if (CFEqual(*v32, @"__kCFURLCheapVolumeInformationKey"))
    {
      if (!v113 && !_FileCacheGetVolumeInfo(a2))
      {
        if (v112 && !MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109)) {
          goto LABEL_141;
        }
        prepareCheapVolumeInformation(a1, a2, (uint64_t)v116);
      }
LABEL_38:
      int v113 = 1;
      goto LABEL_39;
    }
    if (!CFEqual(*v32, @"__kCFURLExpensiveVolumeInformationKey")) {
      break;
    }
    if (!v113 && !_FileCacheGetVolumeInfo(a2))
    {
      if (v112 && !MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
      {
LABEL_141:
        BOOL v111 = 0;
        goto LABEL_139;
      }
      prepareCheapVolumeInformation(a1, a2, (uint64_t)v116);
    }
    CFDataRef VolumeInfo = (__CFData *)_FileCacheGetVolumeInfo(a2);
    MutableBytePtr = CFDataGetMutableBytePtr(VolumeInfo);
    if (!MutableBytePtr) {
      goto LABEL_38;
    }
    uint64_t v36 = MutableBytePtr;
    size_t v28 = v33;
    if (*(void *)MutableBytePtr == -1)
    {
      if (v112)
      {
        if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109)) {
          goto LABEL_141;
        }
        MountInfoGetMutableVolumeInfo(v116, v36, (void *)v36 + 1, (void *)v36 + 2, (uint64_t *)v36 + 3);
        goto LABEL_38;
      }
      *(_OWORD *)MutableBytePtr = 0u;
      *((_OWORD *)MutableBytePtr + 1) = 0u;
    }
    int v113 = 1;
LABEL_40:
    ++a4;
    if (!--a5) {
      goto LABEL_139;
    }
  }
  CFArrayRef v37 = Attributes;
  CFStringRef v38 = a1;
  int v39 = v13;
  if (CFEqual(*v32, v33))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v33, &v117))
    {
      size_t v28 = v33;
LABEL_46:
      a1 = v38;
      uint64_t Attributes = v37;
      goto LABEL_40;
    }
    a1 = v38;
    uint64_t Attributes = v37;
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109)) {
        goto LABEL_141;
      }
      uint64_t VolumeName = MountInfoGetVolumeName((uint64_t)v116);
      if (VolumeName)
      {
        uint64_t v44 = (const char *)VolumeName;
        CFAllocatorRef v45 = CFGetAllocator(a1);
        CFStringRef v46 = CFStringCreateWithCString(v45, v44, 0x8000100u);
        uint64_t v47 = a2;
        CFTypeRef v48 = v33;
LABEL_51:
        _FileCacheSetPropertyValueForKey(v47, v48, v46);
        if (v46) {
          CFRelease(v46);
        }
LABEL_39:
        size_t v28 = v33;
        goto LABEL_40;
      }
    }
    uint64_t v49 = a2;
    CFTypeRef v50 = v33;
LABEL_55:
    uint64_t v51 = 0;
LABEL_56:
    _FileCacheSetPropertyValueForKey(v49, v50, v51);
    goto LABEL_39;
  }
  CFTypeRef v40 = v107;
  if (CFEqual(*v32, v107))
  {
    int PropertyValueForKey = _FileCacheGetPropertyValueForKey(a2, v40, &v117);
    unsigned __int8 v42 = v40;
    uint64_t v13 = v39;
    if (!PropertyValueForKey) {
      _FileCacheSetPropertyValueForKey(a2, v42, 0);
    }
    size_t v28 = v33;
    goto LABEL_46;
  }
  CFTypeRef v52 = v106;
  int v53 = CFEqual(*v32, v106);
  long long v93 = v39;
  if (v53)
  {
    a1 = v38;
    if (_FileCacheGetPropertyValueForKey(a2, v52, &v117))
    {
      size_t v28 = v33;
      uint64_t Attributes = v37;
      uint64_t v13 = v93;
      goto LABEL_40;
    }
    uint64_t Attributes = v37;
    fsid v57 = v37[13];
    StatfsByint FSID = GetStatfsByFSID(v57, &v120);
    uint64_t v13 = v93;
    if (!StatfsByFSID)
    {
      CFAllocatorRef v62 = CFGetAllocator(a1);
      CFStringRef v46 = CFStringCreateWithCString(v62, f_mntonname, 0x8000100u);
      uint64_t v47 = a2;
      CFTypeRef v48 = v106;
      goto LABEL_51;
    }
    uint64_t v49 = a2;
    CFTypeRef v50 = v106;
    goto LABEL_55;
  }
  CFTypeRef v54 = v105;
  a1 = v38;
  if (CFEqual(*v32, v105))
  {
    int v55 = _FileCacheGetPropertyValueForKey(a2, v54, &v117);
    uint64_t Attributes = v37;
    uint64_t v13 = v93;
    if (v55) {
      goto LABEL_39;
    }
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v93, 0, a1, v109)) {
        goto LABEL_141;
      }
      MountPoint = (char *)MountInfoGetMountPoint((uint64_t)v116);
      if (!MountPoint)
      {
LABEL_86:
        uint64_t v51 = 0;
        goto LABEL_87;
      }
    }
    else
    {
      fsid v64 = v37[13];
      int v65 = GetStatfsByFSID(v64, &v120);
      MountPoint = f_mntonname;
      if (v65) {
        goto LABEL_86;
      }
    }
    long long v118 = xmmword_1817912E8;
    uint64_t v119 = 0;
    int v66 = filtered_getattrlist(MountPoint, &v118, &v120, 0x24uLL, 0x21u);
    uint64_t v51 = 0;
    if (!v66)
    {
      if ((v120.f_bfree & 0x20000000000000) == 0) {
        goto LABEL_86;
      }
      if ((v120.f_iosize & 0x200000) != 0) {
        uint64_t v51 = v98;
      }
      else {
        uint64_t v51 = v97;
      }
    }
LABEL_87:
    uint64_t v49 = a2;
    CFTypeRef v50 = v105;
    goto LABEL_56;
  }
  int v59 = CFEqual(*v32, v104);
  uint64_t Attributes = v37;
  uint64_t v13 = v93;
  if (v59)
  {
    if (_FileCacheGetPropertyValueForKey(a2, v104, &v117)) {
      goto LABEL_39;
    }
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109)) {
        goto LABEL_141;
      }
      int v60 = (char *)MountInfoGetMountPoint((uint64_t)v116);
      if (v60)
      {
LABEL_73:
        long long v118 = xmmword_1817912E8;
        uint64_t v119 = 0;
        int v61 = filtered_getattrlist(v60, &v118, &v120, 0x24uLL, 0x21u);
        uint64_t v51 = 0;
        CFTypeRef v50 = v104;
        if (!v61)
        {
          if ((v120.f_bfree & 0x40000000000000) != 0)
          {
            if ((v120.f_iosize & 0x400000) != 0) {
              uint64_t v51 = v98;
            }
            else {
              uint64_t v51 = v97;
            }
          }
          else
          {
            uint64_t v51 = 0;
          }
        }
        goto LABEL_96;
      }
    }
    else
    {
      fsid v68 = v37[13];
      int v69 = GetStatfsByFSID(v68, &v120);
      int v60 = f_mntonname;
      if (!v69) {
        goto LABEL_73;
      }
    }
    uint64_t v51 = 0;
    CFTypeRef v50 = v104;
LABEL_96:
    uint64_t v49 = a2;
    goto LABEL_56;
  }
  if (CFEqual(*v32, v102))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v102, &v117)) {
      goto LABEL_39;
    }
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109)) {
        goto LABEL_141;
      }
      int8x16_t v63 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
      if (!v63) {
        goto LABEL_110;
      }
LABEL_108:
      CFStringRef v74 = CFStringCreateWithFileSystemRepresentation(v99, v63);
      if (v74)
      {
        CFStringRef v76 = v74;
        CFStringRef v94 = (const __CFString *)Call_CacheDeleteCopyAvailableSpaceForVolume(v75);
        CFRelease(v76);
        uint64_t v47 = a2;
        CFTypeRef v48 = v102;
LABEL_125:
        CFStringRef v46 = v94;
        goto LABEL_51;
      }
    }
    else
    {
      fsid v72 = v37[13];
      int v73 = GetStatfsByFSID(v72, &v120);
      int8x16_t v63 = f_mntonname;
      if (!v73) {
        goto LABEL_108;
      }
    }
LABEL_110:
    uint64_t v49 = a2;
    CFTypeRef v50 = v102;
    goto LABEL_55;
  }
  if (CFEqual(*v32, v101))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v101, &v117)) {
      goto LABEL_39;
    }
    if (v112)
    {
      if (!MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109)) {
        goto LABEL_141;
      }
      uint64x2_t v67 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
      if (!v67) {
        goto LABEL_117;
      }
LABEL_115:
      CFStringRef v79 = CFStringCreateWithFileSystemRepresentation(v99, v67);
      if (v79)
      {
        CFStringRef v81 = v79;
        CFStringRef v94 = (const __CFString *)Call_CacheDeleteCopyAvailableSpaceForVolume(v80);
        CFRelease(v81);
        uint64_t v47 = a2;
        CFTypeRef v48 = v101;
        goto LABEL_125;
      }
    }
    else
    {
      fsid v77 = v37[13];
      int v78 = GetStatfsByFSID(v77, &v120);
      uint64x2_t v67 = f_mntonname;
      if (!v78) {
        goto LABEL_115;
      }
    }
LABEL_117:
    uint64_t v49 = a2;
    CFTypeRef v50 = v101;
    goto LABEL_55;
  }
  if (CFEqual(*v32, v100) || CFEqual(*v32, v96))
  {
    if (_FileCacheGetPropertyValueForKey(a2, v100, &v117)
      && _FileCacheGetPropertyValueForKey(a2, v96, &v117))
    {
      goto LABEL_39;
    }
    long long v118 = 0uLL;
    unsigned int v114 = 0;
    if (v112)
    {
      if (MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
      {
        uint64_t v70 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
        int v71 = _FSGetTypeInfoForPath(v70, (char *)&v118, 0x10uLL, &v114);
        goto LABEL_120;
      }
    }
    else
    {
      fsid v82 = v37[13];
      if (!GetStatfsByFSID(v82, &v120))
      {
        int v71 = _FSGetTypeInfoFromStatfs((uint64_t)&v120, (char *)&v118, 0x10uLL, &v114);
LABEL_120:
        BOOL v111 = v71 == 0;
      }
    }
    if (!v111) {
      goto LABEL_141;
    }
    *(void *)&v120.f_bsize = v114;
    size_t v83 = strlen((const char *)&v118);
    CFAllocatorRef v84 = v99;
    uint64_t v92 = (fsid *)CFStringCreateWithBytes(v99, (const UInt8 *)&v118, v83, 0x8000100u, 0);
    CFStringRef v94 = (const __CFString *)CFNumberCreate(v84, kCFNumberSInt64Type, &v120);
    unsigned int v85 = v92;
    _FileCacheSetPropertyValueForKey(a2, v100, v92);
    if (v85) {
      CFRelease(v85);
    }
    uint64_t v47 = a2;
    CFTypeRef v48 = v96;
    goto LABEL_125;
  }
  if (!CFEqual(*v32, v95)) {
    goto LABEL_39;
  }
  uint64_t v92 = v37;
  CFStringRef v94 = (const __CFString *)a2;
  if (_FileCacheGetPropertyValueForKey(a2, v95, &v117))
  {
LABEL_137:
    uint64_t Attributes = v92;
    a2 = (uint64_t)v94;
    goto LABEL_39;
  }
  bzero(&v118, 0x400uLL);
  if (v112)
  {
    if (MountInfoPrepare(&v116, v112, v108, v13, 0, a1, v109))
    {
      uint64_t v86 = (const char *)MountInfoGetMountPoint((uint64_t)v116);
      int v87 = _FSGetLocationForPath(v86, (char *)&v118, 0x400uLL);
      goto LABEL_133;
    }
  }
  else
  {
    fsid v88 = v92[13];
    if (!GetStatfsByFSID(v88, &v120))
    {
      int v87 = _FSGetLocationFromStatfs((uint64_t)&v120, (char *)&v118, 0x400uLL);
LABEL_133:
      BOOL v111 = v87 == 0;
    }
  }
  if (v111)
  {
    size_t v89 = strlen((const char *)&v118);
    CFStringRef v90 = CFStringCreateWithBytes(v99, (const UInt8 *)&v118, v89, 0x8000100u, 0);
    _FileCacheSetPropertyValueForKey((uint64_t)v94, v95, v90);
    if (v90) {
      CFRelease(v90);
    }
    goto LABEL_137;
  }
  BOOL v111 = 0;
  a2 = (uint64_t)v94;
LABEL_139:
  MountInfoDestroy(v116);
  BOOL v27 = v111;
LABEL_140:
  _FileCacheUnlock(a2);
  return v27;
}

uint64_t _FileCacheGetVolumeInfo(uint64_t a1)
{
  return *(void *)(a1 + 312);
}

void prepareCheapVolumeInformation(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  *(void *)bytes = -1;
  if (!a3)
  {
    fsid v11 = *(fsid *)(_FileCacheGetAttributes(a2) + 104);
    if (GetStatfsByFSID(v11, &v18))
    {
LABEL_21:
      *(double *)&long long v22 = -1.0 - *MEMORY[0x1E4F1CF68];
      *((void *)&v22 + 1) = -1;
      CFIndex v14 = 56;
      goto LABEL_27;
    }
    if ((v18.f_flags & 0x1000) != 0)
    {
      *((void *)&v21 + 1) |= 1uLL;
      if ((v18.f_flags & 0x400000) == 0)
      {
LABEL_9:
        if ((v18.f_flags & 0x100000) == 0) {
          goto LABEL_10;
        }
        goto LABEL_32;
      }
    }
    else if ((v18.f_flags & 0x400000) == 0)
    {
      goto LABEL_9;
    }
    *((void *)&v21 + 1) |= 2uLL;
    if ((v18.f_flags & 0x100000) == 0)
    {
LABEL_10:
      if ((v18.f_flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_33;
    }
LABEL_32:
    *((void *)&v21 + 1) |= 4uLL;
    if ((v18.f_flags & 1) == 0)
    {
LABEL_11:
      if ((v18.f_flags & 0x400) == 0) {
        goto LABEL_12;
      }
      goto LABEL_34;
    }
LABEL_33:
    *((void *)&v21 + 1) |= 8uLL;
    if ((v18.f_flags & 0x400) == 0)
    {
LABEL_12:
      if ((v18.f_flags & 0x4000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_35;
    }
LABEL_34:
    *((void *)&v21 + 1) |= 0x10uLL;
    if ((v18.f_flags & 0x4000) == 0)
    {
LABEL_13:
      if ((v18.f_flags & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_35:
    *((void *)&v21 + 1) |= 0x4000000uLL;
    if ((v18.f_flags & 0x80) == 0)
    {
LABEL_15:
      unint64_t v12 = *((void *)&v21 + 1) & 0xFEFFFFFFFFFFFFFFLL | (v18.f_flags << 8) & 0x20000000;
      *((void *)&v21 + 1) = v12;
      if (*(_DWORD *)v18.f_fstypename == 1719035236 && *(unsigned __int16 *)&v18.f_fstypename[4] == 115) {
        *((void *)&v21 + 1) = v12 | 0x10000;
      }
      goto LABEL_21;
    }
LABEL_14:
    *((void *)&v21 + 1) |= 0x8000000uLL;
    goto LABEL_15;
  }
  unint64_t VolumeFlags = MountInfoGetVolumeFlags(a3);
  uint64_t v7 = VolumeFlags & 0x7F ^ 1;
  if ((VolumeFlags & 0x80) != 0)
  {
    v7 |= 0x80uLL;
    *((void *)&v21 + 1) = v7;
  }
  *((void *)&v21 + 1) = VolumeFlags & 0x700 | v7 & 0xFFFFFFFFC3FFEFFFLL | (((VolumeFlags >> 11) & 1) << 12) & 0xFFFFFFFFC3FFFFFFLL | (((VolumeFlags >> 23) & 0xF) << 26) | MountInfoGetCapabilities(a3);
  uint64_t VolumeCreationDate = MountInfoGetVolumeCreationDate(a3);
  if (VolumeCreationDate | v9) {
    double v10 = (double)VolumeCreationDate - *MEMORY[0x1E4F1CF78] + (double)v9 * 0.000000001;
  }
  else {
    double v10 = -1.0 - *MEMORY[0x1E4F1CF68];
  }
  *(double *)&long long v22 = v10;
  if (MountInfoGetVolumeUUID(a3, (unsigned __int8 *)&v23)) {
    CFIndex v14 = 72;
  }
  else {
    CFIndex v14 = 56;
  }
  *((void *)&v22 + 1) = MountInfoGetMaxFileSize(a3);
LABEL_27:
  CFAllocatorRef v15 = CFGetAllocator(a1);
  Mutable = CFDataCreateMutable(v15, v14);
  if (Mutable)
  {
    CFTypeRef v17 = Mutable;
    CFDataAppendBytes(Mutable, bytes, v14);
    _FileCacheSetVolumeInfo(a2, v17);
    CFRelease(v17);
  }
}

void _FileCacheSetVolumeInfo(uint64_t a1, CFTypeRef cf)
{
  unsigned int v3 = *(const void **)(a1 + 312);
  if (cf) {
    CFTypeRef v4 = CFRetain(cf);
  }
  else {
    CFTypeRef v4 = 0;
  }
  *(void *)(a1 + 312) = v4;
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t MountInfoGetVolumeUUID(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v3 = (const unsigned __int8 *)(a1 + 3000);
  if (uuid_is_null((const unsigned __int8 *)(a1 + 3000))) {
    return 0;
  }
  uuid_copy(a2, v3);
  return 1;
}

uint64_t MountInfoGetVolumeCreationDate(uint64_t a1)
{
  return *(void *)(a1 + 2168);
}

uint64_t MountInfoGetMaxFileSize(uint64_t a1)
{
  return *(void *)(a1 + 3016);
}

uint64_t createVolumeIdentifierValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFDataRef *a7)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t Attributes = _FileCacheGetAttributes(a2);
  if (*(_DWORD *)(Attributes + 112)) {
    uint64_t v10 = *(unsigned int *)(Attributes + 112);
  }
  else {
    uint64_t v10 = *(void *)(Attributes + 104);
  }
  v13[0] = v10;
  CFAllocatorRef v11 = CFGetAllocator(a1);
  *a7 = CFDataCreate(v11, (const UInt8 *)v13, 8);
  return 1;
}

uint64_t createVolumeFlagValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if ((*(void *)(a5 + 16) & *(void *)(a3 + 32)) != 0) {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a7 = *v7;
  return 1;
}

uint64_t createVolumeUUIDStringValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFStringRef *a7)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a4 == 72)
  {
    if (a6)
    {
      memset(v11, 0, sizeof(v11));
      uuid_unparse_upper((const unsigned __int8 *)(a3 + 56), v11);
      CFAllocatorRef v9 = CFGetAllocator(a1);
      *a7 = CFStringCreateWithCString(v9, v11, 0x8000100u);
      return 2;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    *a7 = 0;
    return 1;
  }
}

void _FSURLSetPermanentResourcePropertyForKey(const __CFURL *a1, const void *a2, const void *a3)
{
  uint64_t v6 = (const void *)__CFURLResourceInfoPtr();
  uint64_t v7 = _FileCacheGetForURL(a1, v6);
  _FileCacheLockTempPermProperties();
  CFDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v7, 0);
  if (TemporaryPropertyDictionary) {
    CFDictionaryRemoveValue(TemporaryPropertyDictionary, a2);
  }
  CFDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v7, 1);
  if (PermanentPropertyDictionary)
  {
    if (a3) {
      CFDictionarySetValue(PermanentPropertyDictionary, a2, a3);
    }
    else {
      CFDictionaryRemoveValue(PermanentPropertyDictionary, a2);
    }
  }
  _FileCacheUnlockTempPermProperties();
}

uint64_t _FSURLSetResourcePropertyForKey(const __CFURL *a1, const void *a2, const void *a3, int a4, CFTypeRef cf, CFErrorRef *a6)
{
  CFArrayRef v8 = a3;
  long long v22 = a3;
  long long v23 = a2;
  CFAllocatorRef v11 = _FileCacheGetForURL(a1, cf);
  Value = (uint64_t *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, a2);
  uint64_t v13 = (uint64_t)Value;
  if (v8)
  {
    if (!a4) {
      goto LABEL_9;
    }
  }
  else
  {
    CFArrayRef v8 = (const void *)*MEMORY[0x1E4F1D260];
    long long v22 = (const void *)*MEMORY[0x1E4F1D260];
    if (!a4)
    {
LABEL_9:
      uint64_t v17 = 1;
      if (!a4 && !Value)
      {
        _FileCacheLockTempPermProperties();
        CFDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v11, 0);
        if (PermanentPropertyDictionary) {
          CFDictionaryRemoveValue(PermanentPropertyDictionary, a2);
        }
        CFDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v11, 1);
        if (TemporaryPropertyDictionary) {
          CFDictionarySetValue(TemporaryPropertyDictionary, a2, v8);
        }
        _FileCacheUnlockTempPermProperties();
      }
      return v17;
    }
  }
  if (!Value) {
    goto LABEL_9;
  }
  if (!*(void *)(*(uint64_t *)((char *)Value + 140) + 40)) {
    return 1;
  }
  uint64_t v21 = *Value;
  _FileCacheLock((uint64_t)v11);
  uint64_t v14 = *(void *)(v13 + 140);
  CFAllocatorRef v15 = *(uint64_t (**)(const __CFURL *, void *, const void **, const void **, uint64_t *, uint64_t, uint64_t, CFErrorRef *))(v14 + 40);
  uint64_t v16 = *(void *)(v14 + 8);
  _FileCacheIncrementInProvider((uint64_t)v11);
  uint64_t v17 = v15(a1, v11, &v23, &v22, &v21, 1, v16, a6);
  _FileCacheDecrementInProvider((uint64_t)v11);
  if (v17)
  {
    clearPropertyAndDependentValues((uint64_t)a1, (uint64_t)v11, v13);
    _FileCacheUnlock((uint64_t)v11);
  }
  else
  {
    _FileCacheUnlock((uint64_t)v11);
    if (a6 && !*a6)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLSetResourcePropertyForKey_cold_1();
      }
      uint64_t v17 = 0;
      *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

CFMutableDictionaryRef _FileCacheGetTemporaryPropertyDictionary(void *cf, int a2)
{
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)cf[37];
  if (a2)
  {
    if (!result)
    {
      CFAllocatorRef v4 = CFGetAllocator(cf);
      CFMutableDictionaryRef result = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      cf[37] = result;
    }
  }
  return result;
}

void _FileCacheLockTempPermProperties(void)
{
}

void _FileCacheUnlockTempPermProperties(void)
{
}

CFMutableDictionaryRef _FileCacheGetPermanentPropertyDictionary(void *cf, int a2)
{
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)cf[38];
  if (a2)
  {
    if (!result)
    {
      CFAllocatorRef v4 = CFGetAllocator(cf);
      CFMutableDictionaryRef result = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      cf[38] = result;
    }
  }
  return result;
}

void clearPropertyAndDependentValues(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1EB20E018 == **(_DWORD **)(a3 + 140))
  {
    if (*(unsigned char *)_FileCacheGetAttributes(a2))
    {
      _FileCacheReleaseContents(a2, 1, 1, 1, 0);
    }
  }
  else
  {
    clearPropertyValue(a1, a2, (uint64_t *)a3);
    if (qword_1EB20DEF8 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = a3 + 76;
      do
      {
        CFArrayRef v8 = (uint64_t *)(v7 + 12 * v6);
        uint64_t v9 = *v8;
        int64_t v23 = 0;
        uint64_t v24 = v9;
        int v25 = *((_DWORD *)v8 + 2);
        int64_t v22 = 0;
        if (PropertyMaskIsNotZero((uint64_t)&v24, (unint64_t *)&v23, &v22) && v23 <= v22)
        {
          uint64_t v10 = v24;
          int v11 = v25;
          unint64_t v12 = v22 - v23 + 1;
          unint64_t v13 = 148 * v23;
          do
          {
            unint64_t v14 = sFileProviderGlobals[7 * v6 + 8] + v13;
            int v15 = *(_DWORD *)(v14 + 136);
            int v16 = 1 << v15;
            BOOL v17 = v15 < 64;
            if (v15 >= 64) {
              uint64_t v18 = 0;
            }
            else {
              uint64_t v18 = 1 << v15;
            }
            if (v17) {
              int v19 = 0;
            }
            else {
              int v19 = v16;
            }
            int v20 = v19 & v11;
            if ((v18 & v10) != 0 || v20 != 0) {
              clearPropertyValue(a1, a2, (uint64_t *)v14);
            }
            v13 += 148;
            --v12;
          }
          while (v12);
        }
        ++v6;
      }
      while (v6 < qword_1EB20DEF8);
    }
  }
}

void clearPropertyValue(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *(uint64_t *)((char *)a3 + 140);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, uint64_t, uint64_t, void))(v5 + 40);
  if (v6)
  {
    uint64_t v8 = *a3;
    uint64_t v10 = 0;
    uint64_t v11 = v8;
    uint64_t v9 = *(void *)(v5 + 8);
    _FileCacheIncrementInProvider(a2);
    v6(a1, a2, (uint64_t)(a3 + 1), &v10, &v11, 1, v9, 0);
    _FileCacheDecrementInProvider(a2);
  }
  _FileCacheClearPropertyValueForKey(a2, (const void *)a3[1]);
}

uint64_t pathURLPropertyProviderSetValues(const __CFURL *a1, uint64_t a2, CFTypeRef *a3, const __CFBoolean **a4, uint64_t a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a6 < 1) {
    return 1;
  }
  uint64_t v8 = a6;
  int v12 = 0;
  unint64_t v13 = (const void *)*MEMORY[0x1E4F1D680];
  CFBooleanRef v14 = (const __CFBoolean *)*MEMORY[0x1E4F1D260];
  int v15 = (const void *)*MEMORY[0x1E4F1CE10];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F1CE18];
  while (1)
  {
    CFBooleanRef v16 = *a4;
    if (*a4) {
      break;
    }
LABEL_50:
    ++a4;
    ++a3;
    if (!--v8) {
      return 1;
    }
  }
  CFTypeRef v17 = *a3;
  if (CFEqual(*a3, v13))
  {
    if (!v12 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)) {
      goto LABEL_60;
    }
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", "com.apple.MobileBackup", 0x16uLL, 0, 1))
      {
        uint64_t v18 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          CFTypeRef v40 = buffer;
          int v19 = v18;
          int v20 = "kExcludedFromBackupXattrName set on path: %{private}s";
LABEL_56:
          _os_log_impl(&dword_181761000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
      goto LABEL_45;
    }
    if (removexattr((const char *)buffer, "com.apple.MobileBackup", 1))
    {
      int v21 = *__error();
      if (v21 == 93) {
        int v22 = 0;
      }
      else {
        int v22 = v21;
      }
    }
    else
    {
      int v22 = 0;
    }
    if (removexattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", 1))
    {
      int v24 = *__error();
      if (v24 == 93) {
        int v24 = 0;
      }
    }
    else
    {
      __int16 v26 = defaultLog;
      BOOL v27 = os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT);
      int v24 = 0;
      if (v27)
      {
        *(_DWORD *)buf = 136380675;
        CFTypeRef v40 = buffer;
        _os_log_impl(&dword_181761000, v26, OS_LOG_TYPE_DEFAULT, "kExcludedFromBackupXattrName removed from path: %{private}s", buf, 0xCu);
        int v24 = 0;
      }
    }
    if (v22) {
      BOOL v28 = v24 == 0;
    }
    else {
      BOOL v28 = 0;
    }
    if (!v28) {
      int v22 = v24;
    }
LABEL_48:
    if (v22)
    {
      CFIndex v32 = a8;
      if (a8)
      {
        CFAllocatorRef v33 = CFGetAllocator(a1);
        CFStringRef v34 = (const __CFString *)*MEMORY[0x1E4F1D160];
        uint64_t v35 = v22;
LABEL_64:
        CFErrorRef v36 = _FSURLCreateStandardError(v33, v34, v35, 1, (const __CFString *)a1, 0);
        uint64_t result = 0;
        *CFIndex v32 = v36;
        return result;
      }
      return 0;
    }
    goto LABEL_49;
  }
  if (CFEqual(v17, v15))
  {
    if (!v12 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)) {
      goto LABEL_60;
    }
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr((const char *)buffer, "com.apple.metadata:com_apple_cloudBackup_excludeItem", "com.apple.MobileBackup", 0x16uLL, 0, 1))
      {
        uint64_t v23 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          CFTypeRef v40 = buffer;
          int v19 = v23;
          int v20 = "kExcludedFromCloudBackupName set on path: %{private}s";
          goto LABEL_56;
        }
LABEL_49:
        int v12 = 1;
        goto LABEL_50;
      }
      goto LABEL_45;
    }
    if (!removexattr((const char *)buffer, "com.apple.metadata:com_apple_cloudBackup_excludeItem", 1))
    {
      uint64_t v25 = defaultLog;
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380675;
        CFTypeRef v40 = buffer;
        int v19 = v25;
        int v20 = "kExcludedFromCloudBackupName removed from path: %{private}s";
        goto LABEL_56;
      }
      goto LABEL_49;
    }
LABEL_47:
    int v22 = *__error();
    if (v22 == 93) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  if (!CFEqual(v17, cf2))
  {
    CFIndex v32 = a8;
    if (a8)
    {
      CFAllocatorRef v33 = CFGetAllocator(a1);
      CFStringRef v34 = (const __CFString *)*MEMORY[0x1E4F1D148];
      uint64_t v35 = 512;
      goto LABEL_64;
    }
    return 0;
  }
  if (v12 || CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr((const char *)buffer, "com.apple.metadata:com_apple_unencryptedBackup_excludeItem", "com.apple.MobileBackup", 0x16uLL, 0, 1))
      {
        uint64_t v30 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          CFTypeRef v40 = buffer;
          int v19 = v30;
          int v20 = "kExcludedFromUnencryptedBackupName set on path: %{private}s";
          goto LABEL_56;
        }
        goto LABEL_49;
      }
LABEL_45:
      int v22 = *__error();
      goto LABEL_48;
    }
    if (!removexattr((const char *)buffer, "com.apple.metadata:com_apple_unencryptedBackup_excludeItem", 1))
    {
      uint64_t v29 = defaultLog;
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380675;
        CFTypeRef v40 = buffer;
        int v19 = v29;
        int v20 = "kExcludedFromUnencryptedBackupName removed from path: %{private}s";
        goto LABEL_56;
      }
      goto LABEL_49;
    }
    goto LABEL_47;
  }
LABEL_60:
  CFIndex v32 = a8;
  if (a8)
  {
    CFAllocatorRef v33 = CFGetAllocator(a1);
    CFStringRef v34 = (const __CFString *)*MEMORY[0x1E4F1D148];
    uint64_t v35 = 4;
    goto LABEL_64;
  }
  return 0;
}

void _FileCacheClearPropertyValueForKey(uint64_t a1, const void *a2)
{
  _FileCacheLock(a1);
  CFAllocatorRef v4 = *(__CFDictionary **)(a1 + 288);
  if (v4) {
    CFDictionaryRemoveValue(v4, a2);
  }
  int v5 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v5;
  if (!v5)
  {
    *(void *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
}

uint64_t valueOfBoolean(const __CFBoolean *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFNumberGetTypeID())
  {
    int valuePtr = 0;
    if (CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr)) {
      BOOL v3 = valuePtr == 0;
    }
    else {
      BOOL v3 = 1;
    }
    return !v3;
  }
  else
  {
    return CFBooleanGetValue(a1);
  }
}

uint64_t MountInfoGetVolumeName(uint64_t a1)
{
  return a1 + 2184;
}

uint64_t MountInfoGetMutableVolumeInfo(const char *a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((~*((_DWORD *)a1 + 741) & 0x614) != 0)
  {
    uint64_t result = statfs(a1 + 88, &v17);
    if (!result)
    {
      *a2 = v17.f_files - v17.f_ffree;
      *a3 = 0;
      uint64_t f_bsize = v17.f_bsize;
      uint64_t f_bavail = v17.f_bavail;
      *a4 = v17.f_blocks * v17.f_bsize;
      uint64_t v12 = f_bavail * f_bsize;
      goto LABEL_8;
    }
  }
  else
  {
    v16[2] = 0;
    v16[0] = 5;
    v16[1] = 2147485204;
    uint64_t result = filtered_getattrlist((char *)a1 + 88, v16, &v17, 0x1CuLL, 0);
    if (!result)
    {
      uint64_t f_bavail_low = LODWORD(v17.f_bavail);
      *a2 = HIDWORD(v17.f_bfree);
      *a3 = f_bavail_low;
      *a4 = *(void *)&v17.f_iosize;
      uint64_t v12 = *(uint64_t *)((char *)&v17.f_blocks + 4);
LABEL_8:
      *a5 = v12;
      return result;
    }
  }
  *a2 = *((void *)a1 + 4) - *((void *)a1 + 5);
  *a3 = 0;
  uint64_t v13 = *(unsigned int *)a1;
  *a4 = *((void *)a1 + 1) * v13;
  *a5 = *((void *)a1 + 3) * v13;
  return result;
}

uint64_t createVolumeAvailableCapacityValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0;
  }
  if (*(unsigned char *)(a3 + 39))
  {
    CFAllocatorRef v11 = CFGetAllocator(a1);
    CFNumberRef v9 = CFNumberCreate(v11, kCFNumberSInt64Type, (const void *)(a3 + 24));
  }
  else
  {
    CFNumberRef v9 = 0;
  }
  *a7 = v9;
  return 2;
}

uint64_t createVolumeTotalCapacityValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0;
  }
  if (*(unsigned char *)(a3 + 39))
  {
    CFAllocatorRef v11 = CFGetAllocator(a1);
    CFNumberRef v9 = CFNumberCreate(v11, kCFNumberSInt64Type, (const void *)(a3 + 16));
  }
  else
  {
    CFNumberRef v9 = 0;
  }
  *a7 = v9;
  return 2;
}

uint64_t GetStatfsByFSID(fsid a1, statfs *a2)
{
  uint64_t v10 = 0;
  int v4 = getmntinfo_r_np(&v10, 2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v10;
  if (v4 < 1)
  {
LABEL_7:
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v6 = (char *)&v10->f_fsid + 4;
    uint64_t v7 = v4;
    while (*(void *)(v6 - 4) != a1)
    {
      v6 += 2168;
      if (!--v7) {
        goto LABEL_7;
      }
    }
    memmove(a2, v6 - 52, 0x878uLL);
    uint64_t v8 = 0;
  }
  free(v5);
  return v8;
}

uint64_t Call_CacheDeleteCopyAvailableSpaceForVolume(double a1)
{
  double v1 = gotLoadHelper_x8__CacheDeleteCopyAvailableSpaceForVolume(a1);
  if (*(void *)(v2 + 1984)) {
    return CacheDeleteCopyAvailableSpaceForVolume_delayInitStub(v1);
  }
  else {
    return 0;
  }
}

void observerCall(__CFRunLoopObserver *a1, unint64_t a2, void *a3)
{
  int v4 = seedGlobals;
  if (seedGlobals < 0) {
    int v4 = -1;
  }
  seedGlobals = v4 + 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveObserver(Current, a1, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  seedGlobals = 0;
}

void _FSURLSetCacheAutoFlushingEnabled(const __CFURL *a1, const void *a2, int a3)
{
  CFTypeRef v4 = _FileCacheGetForURL(a1, a2);
  _FileCacheLock((uint64_t)v4);
  _FileCacheSetAutoFlushingEnabled((uint64_t)v4, a3);
  _FileCacheUnlock((uint64_t)v4);
}

uint64_t _FileCacheSetAutoFlushingEnabled(uint64_t result, int a2)
{
  int v2 = atomic_load((unsigned int *)(result + 16));
  if (a2)
  {
    if (v2 > -2) {
      return result;
    }
    BOOL v3 = (atomic_uint *)(result + 16);
    unsigned int v4 = 1;
    goto LABEL_4;
  }
  if ((v2 & 0x80000000) == 0)
  {
    atomic_store(0xFFFFFFFE, (unsigned int *)(result + 16));
    return result;
  }
  BOOL v3 = (atomic_uint *)(result + 16);
  unsigned int v5 = atomic_load((unsigned int *)(result + 16));
  if (v5 != 0x80000000)
  {
    unsigned int v4 = -1;
LABEL_4:
    atomic_fetch_add(v3, v4);
  }
  return result;
}

uint64_t createVolumeParentURL(const __CFAllocator *a1, unsigned __int8 a2, fsid *a3, size_t *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v20 = 0;
  uint64_t v8 = MountInfoStorageSize();
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  if (MountInfoPrepare(&v20, a3[14].val[0], 0, (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
  {
    MountPoint = (char *)MountInfoGetMountPoint((uint64_t)v20);
    if (!MountPoint) {
      goto LABEL_12;
    }
  }
  else
  {
    fsid v11 = a3[13];
    if (GetStatfsByFSID(v11, &v21)) {
      goto LABEL_12;
    }
    MountPoint = v21.f_mntonname;
  }
  size_t v12 = strlen(MountPoint);
  do
  {
    if (!v12)
    {
LABEL_16:
      *a4 = v12;
      uint64_t v16 = 1;
      goto LABEL_17;
    }
    size_t v13 = v12 - 1;
    int v14 = MountPoint[--v12];
  }
  while (v14 == 47);
  while (v13 != -1)
  {
    int v15 = MountPoint[v13--];
    if (v15 == 47)
    {
      size_t v17 = v13 + 2;
      if (v20) {
        size_t v12 = (size_t)__FSURLCreateWithPathAndAttributes(a1, (unsigned __int8 *)MountPoint, v17, 0, 0, 0, 0, (void *)1, a2, 0, 0, 1, v20, 0);
      }
      else {
        size_t v12 = (size_t)CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)MountPoint, v17, 1u);
      }
      goto LABEL_16;
    }
  }
LABEL_12:
  uint64_t v16 = 0;
LABEL_17:
  if (v20) {
    MountInfoDestroy(v20);
  }
  return v16;
}

CFURLRef __FSURLCreateWithPathAndAttributes(CFAllocatorRef allocator, unsigned __int8 *a2, size_t __n, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, void *a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12, void **a13, __CFError **a14)
{
  CFAllocatorRef v20 = allocator;
  statfs v21 = (void **)a14;
  LODWORD(v55) = a11;
  HIDWORD(v55) = a10;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (initGlobalsOnce(void)::onceToken != -1)
  {
    CFTypeRef v54 = a2;
    CFAllocatorRef v52 = allocator;
    dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
    statfs v21 = (void **)a14;
    a2 = (unsigned __int8 *)v54;
    CFAllocatorRef v20 = v52;
  }
  if (a9) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = a7 == 0;
  }
  if (v22 && a12 != -1)
  {
    JUMPOUT(0x1853003B0);
  }
  int v53 = v21;
  CFAllocatorRef v24 = v20;
  CFTypeRef v54 = a2;
  BaseCacheWithPathAnduint64_t Attributes = createBaseCacheWithPathAndAttributes(v20, (char *)a2, __n, a9, a6, a7, a8, (uint64_t)a13, v21, v51);
  if (!BaseCacheWithPathAndAttributes) {
    return 0;
  }
  __int16 v26 = BaseCacheWithPathAndAttributes;
  uint64_t Attributes = _FileCacheGetAttributes((uint64_t)BaseCacheWithPathAndAttributes);
  uint64_t v28 = Attributes;
  if (a9 && (*(_DWORD *)Attributes & 4) != 0)
  {
    int v29 = *(_DWORD *)(Attributes + 16) & 0xF000;
    if ((*(_DWORD *)Attributes & 0x40000) != 0 && v29 != 0x4000)
    {
      uint64_t v30 = *(unsigned int *)(Attributes + 112);
      uint64_t v34 = *(void *)(Attributes + 136);
      CFStringRef v35 = *(const __CFString **)(Attributes + 8);
      CFAllocatorRef v33 = v24;
      uint64_t v31 = 0;
      Boolean v32 = 0;
    }
    else
    {
      uint64_t v30 = *(unsigned int *)(Attributes + 112);
      uint64_t v31 = *(void *)(Attributes + 128);
      Boolean v32 = v29 == 0x4000;
      CFAllocatorRef v33 = v24;
      uint64_t v34 = 0;
      CFStringRef v35 = 0;
    }
    CFURLRef FileReferenceURLRef = createFileReferenceURLRef(v33, v30, v34, v31, v35, v32);
    CFURLRef v37 = FileReferenceURLRef;
    if (FileReferenceURLRef) {
      goto LABEL_24;
    }
  }
  if (v54)
  {
    BOOL v38 = objectTypeFromAccessMask(*(_DWORD *)(v28 + 16)) == 2;
    CFURLRef FileReferenceURLRef = (CFURLRef)MEMORY[0x1853003B0](v24, &v54[a4], __n - a4, v38, a5);
    CFURLRef v37 = FileReferenceURLRef;
    if (FileReferenceURLRef)
    {
LABEL_24:
      int v39 = v55;
      if (v55)
      {
        MEMORY[0x1F4188790](FileReferenceURLRef);
        memcpy((char *)&v52 - ((__n + 16) & 0xFFFFFFFFFFFFFFF0), v54, __n);
        *((unsigned char *)&v52 + __n - ((__n + 16) & 0xFFFFFFFFFFFFFFF0)) = 0;
        CFStringRef v40 = CFStringCreateWithFileSystemRepresentation(v24, (const char *)&v52 - ((__n + 16) & 0xFFFFFFFFFFFFFFF0));
        if (v40)
        {
          CFStringRef v41 = v40;
          if (HIDWORD(v55)) {
            _FileCacheSetPropertyValueForKey((uint64_t)v26, (const void *)*MEMORY[0x1E4F1D748], v40);
          }
          if (v39)
          {
            uint64_t v42 = *(const void **)(v28 + 232);
            if (v42) {
              CFRelease(v42);
            }
            *(void *)(v28 + 232) = CFRetain(v41);
            *(_DWORD *)v28 |= 0x100u;
          }
          CFRelease(v41);
        }
      }
      __CFURLSetResourceInfoPtr();
      goto LABEL_39;
    }
    syslog(3, "_FSURLCreateWithPathAndAttributes: CFURLCreateFromFileSystemRepresentation failed; pathLen = %ld", __n);
  }
  else
  {
    if ((~*(_DWORD *)v28 & 0x8004) != 0)
    {
      uint64_t v46 = 0;
      CFURLRef v37 = 0;
      goto LABEL_40;
    }
    ssize_t v43 = fsgetpath(v56, 0x400uLL, (fsid_t *)(v28 + 104), *(void *)(v28 + 128));
    CFIndex v44 = v43;
    if (v43 < 0)
    {
      CFURLRef v37 = 0;
      uint64_t v46 = (int)v43;
      goto LABEL_40;
    }
    Boolean v45 = objectTypeFromAccessMask(*(_DWORD *)(v28 + 16)) == 2;
    CFURLRef FileReferenceURLRef = CFURLCreateFromFileSystemRepresentation(v24, (const UInt8 *)v56, v44, v45);
    CFURLRef v37 = FileReferenceURLRef;
    if (FileReferenceURLRef) {
      goto LABEL_24;
    }
  }
LABEL_39:
  uint64_t v46 = 0;
LABEL_40:
  CFRelease(v26);
  if (v53 && !v37)
  {
    CFIndex v47 = __n;
    CFTypeRef v48 = (CFErrorRef *)v53;
    CFStringRef v49 = (const __CFString *)CFURLCreateFromFileSystemRepresentation(v24, v54, v47, 0);
    *CFTypeRef v48 = _FSURLCreateStandardError(v24, (const __CFString *)*MEMORY[0x1E4F1D160], v46, 0, v49, 0);
    if (v49) {
      CFRelease(v49);
    }
    return 0;
  }
  return v37;
}

const void *createBaseCacheWithPathAndAttributes(CFAllocatorRef allocator, char *__src, size_t __n, int a4, _DWORD *a5, attrlist *a6, const void *a7, uint64_t a8, void **a9, __CFError **a10)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CFIndex v12 = __n;
  if (__n <= 0x3FF)
  {
    int v16 = (int)a7;
    strncpy(v30, __src, __n);
    v30[v12] = 0;
    size_t v13 = (const void *)FileCacheCreate(allocator);
    uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v13);
    if (a6)
    {
      int v14 = parseAttributeBuffer(allocator, v30, a5, a6, a8, Attributes, v16);
      if (!v14) {
        return v13;
      }
    }
    else
    {
      attrlist v29 = *(attrlist *)corePropertyAttrListTable;
      if (a4)
      {
        uint64_t v21 = Attributes;
        attrgroup_t commonattr = v29.commonattr | dword_1EB20DE74;
        *(int8x16_t *)&v29.volattr = vorrq_s8(*(int8x16_t *)&v29.volattr, unk_1EB20DE78);
      }
      else
      {
        uint64_t v21 = Attributes;
        attrgroup_t commonattr = v29.commonattr;
      }
      v29.attrgroup_t commonattr = commonattr | 0x80000000;
      unint64_t v23 = calculateAttributeBufferSize(&v29, 0);
      MEMORY[0x1F4188790](v23);
      uint64_t v25 = (_DWORD *)((char *)&v29.bitmapcount - v24);
      if (filtered_getattrlist(v30, &v29, (char *)&v29 - v24, v26, 0x25u)) {
        int v14 = *__error();
      }
      else {
        int v14 = parseAttributeBuffer(allocator, __src, &v29, v25, a8, v21, v16);
      }
      if (!v14) {
        return v13;
      }
    }
  }
  else
  {
    size_t v13 = 0;
    int v14 = 63;
  }
  if (a9)
  {
    CFStringRef v27 = (const __CFString *)CFURLCreateFromFileSystemRepresentation(allocator, (const UInt8 *)__src, v12, 0);
    *a9 = _FSURLCreateStandardError(allocator, (const __CFString *)*MEMORY[0x1E4F1D160], v14, 0, v27, 0);
    if (v27) {
      CFRelease(v27);
    }
  }
  if (v13)
  {
    CFRelease(v13);
    return 0;
  }
  return v13;
}

uint64_t FileCacheCreate(const __CFAllocator *a1)
{
  initGlobalsOnce();
  return _CFRuntimeCreateInstance();
}

uint64_t objectTypeFromAccessMask(__int16 a1)
{
  unsigned int v1 = (a1 & 0xF000) - 4096;
  if (v1 >> 14 > 2) {
    return 0;
  }
  else {
    return dword_18179131C[v1 >> 12];
  }
}

uint64_t pathURLPropertyProviderPrepareValues(const __CFURL *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  _FileCacheLock(a2);
  if (a5 < 1)
  {
    uint64_t v27 = 1;
    goto LABEL_127;
  }
  double v75 = a7;
  uint64_t v12 = 0;
  int v76 = 0;
  uint64_t v13 = 0;
  int v14 = 0;
  int v15 = (const void *)*MEMORY[0x1E4F1D980];
  int v16 = (const void *)*MEMORY[0x1E4F1D740];
  *(void *)int v69 = *MEMORY[0x1E4F1D160];
  CFStringRef v72 = (const __CFString *)*MEMORY[0x1E4F1D148];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F1D748];
  CFTypeRef v77 = (CFTypeRef)*MEMORY[0x1E4F1D680];
  CFStringRef v74 = (const void *)*MEMORY[0x1E4F1CFD0];
  int v71 = (const void *)*MEMORY[0x1E4F1CFC8];
  CFTypeRef v73 = (CFTypeRef)*MEMORY[0x1E4F1CE10];
  CFTypeRef v70 = (CFTypeRef)*MEMORY[0x1E4F1CE18];
  int v78 = (const void *)*MEMORY[0x1E4F1D740];
  uint64_t v79 = a5;
  while (1)
  {
    size_t v17 = *(const void **)(a3 + 8 * v12);
    if (CFEqual(v17, v15))
    {
      uint64_t Attributes = _FileCacheGetAttributes(a2);
      if ((*(unsigned char *)(Attributes + 1) & 0x20) == 0 || !CFURLHasDirectoryPath(a1))
      {
        CFTypeRef cf = 0;
        if (!_FileCacheGetPropertyValueForKey(a2, v15, (void **)&cf))
        {
          if (!v14) {
            uint64_t v13 = CFURLIsFileReferenceURL(a1);
          }
          uint64_t v19 = CFGetAllocator(a1);
          if (!createVolumeURL(v19, v13, (fsid *)Attributes, (CFURLRef *)&cf)) {
            goto LABEL_124;
          }
          _FileCacheSetPropertyValueForKey(a2, v15, cf);
          if (cf) {
            CFRelease(cf);
          }
          int v14 = 1;
        }
      }
      goto LABEL_54;
    }
    if (!CFEqual(v17, v16)) {
      break;
    }
    CFAllocatorRef v84 = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v16, &v84))
    {
      uint64_t v20 = _FileCacheGetAttributes(a2);
      CFURLRef v83 = 0;
      if (!v14) {
        uint64_t v13 = CFURLIsFileReferenceURL(a1);
      }
      if ((*(_DWORD *)v20 & 0x2000) != 0)
      {
        CFAllocatorRef v31 = CFGetAllocator(a1);
        if (!createVolumeParentURL(v31, v13, (fsid *)v20, (size_t *)&v83)) {
          goto LABEL_124;
        }
        CFURLRef v32 = v83;
        _FileCacheSetPropertyValueForKey(a2, v16, v83);
        if (v32) {
          goto LABEL_44;
        }
        goto LABEL_45;
      }
      int v21 = *(_DWORD *)(v20 + 112);
      if (v13)
      {
        if (v21)
        {
          if (*(void *)(v20 + 136))
          {
            BOOL v22 = v16;
            uint64_t v23 = v13;
            CFAllocatorRef v24 = CFGetAllocator(a1);
            uint64_t v25 = *(unsigned int *)(v20 + 112);
            uint64_t v26 = *(void *)(v20 + 136);
            uint64_t v27 = 1;
            CFURLRef FileReferenceURLRef = createFileReferenceURLRef(v24, v25, 0, v26, 0, 1u);
            _FileCacheSetPropertyValueForKey(a2, v22, FileReferenceURLRef);
            if (FileReferenceURLRef) {
              CFRelease(FileReferenceURLRef);
            }
LABEL_91:
            uint64_t v13 = v23;
            int v16 = v78;
LABEL_122:
            int v14 = 1;
            goto LABEL_55;
          }
LABEL_38:
          if ((*(_DWORD *)v20 & 0x8000) != 0)
          {
            if (!getFileSystemPathForFileID(v21, *(void *)(v20 + 136), (char *)__s, (char *)0x400)) {
              goto LABEL_124;
            }
            uint64_t v33 = v13;
            CFAllocatorRef v34 = CFGetAllocator(a1);
            size_t v35 = strlen((const char *)__s);
            if (initGlobalsOnce(void)::onceToken != -1) {
              dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
            }
            CFURLRef v36 = (const __CFURL *)MEMORY[0x1853003B0](v34, __s, v35, 1, 0);
            CFURLRef v83 = v36;
            uint64_t v13 = v33;
            int v16 = v78;
            if (!v36) {
              goto LABEL_124;
            }
            CFURLRef v32 = v36;
            _FileCacheSetPropertyValueForKey(a2, v78, v36);
LABEL_44:
            CFRelease(v32);
LABEL_45:
            uint64_t v27 = 1;
            goto LABEL_122;
          }
        }
      }
      else if (v21)
      {
        goto LABEL_38;
      }
      if (!CFURLGetFileSystemRepresentation(a1, 1u, __s, 1024))
      {
        uint64_t v23 = v13;
        if (v75)
        {
          CFAllocatorRef v46 = CFGetAllocator(a1);
          uint64_t v27 = 0;
          *double v75 = _FSURLCreateStandardError(v46, v72, 4, 0, (const __CFString *)a1, 0);
        }
        else
        {
          uint64_t v27 = 0;
        }
        goto LABEL_91;
      }
      uint64_t v82 = 0;
      long long v81 = xmmword_1817912B8;
      _FileCacheUnlock(a2);
      if (filtered_getattrlist((char *)__s, &v81, &cf, 0x40CuLL, 0x21u))
      {
        uint64_t v37 = v13;
        BOOL v38 = v75;
        if (v75)
        {
          CFAllocatorRef v39 = CFGetAllocator(a1);
          uint64_t v40 = *__error();
          CFAllocatorRef v41 = v39;
          CFStringRef v42 = *(const __CFString **)v69;
          goto LABEL_50;
        }
LABEL_103:
        uint64_t v27 = 0;
        goto LABEL_104;
      }
      CFIndex v47 = (char *)&cf + SHIDWORD(cf) + 4;
      if (v86 < 3)
      {
        if (!strcmp("/", (const char *)&cf + SHIDWORD(cf) + 4))
        {
          _FileCacheSetPropertyValueForKey(a2, v16, 0);
          goto LABEL_116;
        }
        uint64_t v37 = v13;
        BOOL v38 = v75;
        if (!v75) {
          goto LABEL_103;
        }
        CFAllocatorRef v41 = CFGetAllocator(a1);
        CFStringRef v42 = v72;
        uint64_t v40 = 4;
LABEL_50:
        uint64_t v27 = 0;
        *BOOL v38 = _FSURLCreateStandardError(v41, v42, v40, 0, (const __CFString *)a1, 0);
LABEL_104:
        uint64_t v13 = v37;
        int v16 = v78;
      }
      else
      {
        unsigned int v68 = v13;
        if (*v47)
        {
          size_t v48 = strlen((const char *)&cf + SHIDWORD(cf) + 4);
          CFStringRef v49 = (unsigned __int8 *)&cf + v48 + SHIDWORD(cf) + 3;
          CFTypeRef v50 = (char *)&cf + v48 + SHIDWORD(cf) + 2;
          while (v49 > (unsigned __int8 *)v47)
          {
            uint64_t v51 = v50;
            int v52 = *v49--;
            --v50;
            if (v52 != 47)
            {
              while (v51 > v47)
              {
                int v53 = *v51--;
                if (v53 == 47)
                {
                  CFStringRef v49 = (unsigned __int8 *)(v51 + 1);
                  goto LABEL_78;
                }
              }
              goto LABEL_107;
            }
          }
LABEL_78:
          if (v49 != (unsigned __int8 *)v47)
          {
            CFTypeRef v54 = (char *)(v49 - 1);
            do
            {
              uint64_t v55 = v54;
              if (v54 <= v47) {
                break;
              }
              --v54;
            }
            while (*v55 == 47);
            goto LABEL_111;
          }
LABEL_107:
          if (*v47 == 47) {
            uint64_t v58 = "/";
          }
          else {
            uint64_t v58 = ".";
          }
          strlcpy((char *)__s, v58, 0x400uLL);
          uint64_t v55 = v47;
LABEL_111:
          size_t v59 = v55 - v47 + 1;
          if (v59 >= 0x400) {
            *__error() = 63;
          }
          memcpy(__s, v47, v59);
          __s[v59] = 0;
        }
        else
        {
          strncpy((char *)__s, ".", 0x400uLL);
        }
        CFAllocatorRef v60 = CFGetAllocator(a1);
        size_t v61 = strlen((const char *)__s);
        CFURLRef v62 = CFURLCreateFromFileSystemRepresentation(v60, __s, v61, 1u);
        CFURLRef v83 = v62;
        uint64_t v13 = v68;
        if (v62)
        {
          CFURLRef v63 = v62;
          _FileCacheSetPropertyValueForKey(a2, v16, v62);
          CFRelease(v63);
LABEL_116:
          uint64_t v27 = 1;
        }
        else
        {
          if (v75)
          {
            CFAllocatorRef v64 = CFGetAllocator(a1);
            uint64_t v27 = 0;
            *double v75 = _FSURLCreateStandardError(v64, v72, 4, 0, (const __CFString *)a1, 0);
          }
          else
          {
            uint64_t v27 = 0;
          }
          uint64_t v13 = v68;
        }
      }
      _FileCacheLock(a2);
      goto LABEL_122;
    }
LABEL_54:
    uint64_t v27 = 1;
LABEL_55:
    if (++v12 == a5) {
      goto LABEL_127;
    }
  }
  if (CFEqual(v17, cf2))
  {
    CFTypeRef cf = 0;
    a5 = v79;
    if (!_FileCacheGetPropertyValueForKey(a2, cf2, (void **)&cf))
    {
      uint64_t v29 = v13;
      if (CFURLGetBaseURL(a1))
      {
        CFURLRef v30 = CFURLCopyAbsoluteURL(a1);
        if (!v30) {
          goto LABEL_124;
        }
      }
      else
      {
        CFRetain(a1);
        CFURLRef v30 = a1;
        if (!a1) {
          goto LABEL_124;
        }
      }
      CFStringRef v43 = CFURLCopyFileSystemPath(v30, kCFURLPOSIXPathStyle);
      CFRelease(v30);
      if (!v43)
      {
LABEL_124:
        if (v75)
        {
          CFAllocatorRef v65 = CFGetAllocator(a1);
          *double v75 = _FSURLCreateStandardError(v65, v72, 4, 0, (const __CFString *)a1, 0);
        }
        goto LABEL_126;
      }
      _FileCacheSetPropertyValueForKey(a2, cf2, v43);
      CFRelease(v43);
      uint64_t v13 = v29;
      int v16 = v78;
    }
    goto LABEL_54;
  }
  if (CFEqual(v17, v77))
  {
    CFTypeRef cf = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v77, (void **)&cf))
    {
      if (!v76 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)) {
        goto LABEL_124;
      }
      ssize_t v44 = getxattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", 0, 0, 0, 1);
      Boolean v45 = v74;
      if (v44 <= 0)
      {
        if (getxattr((const char *)buffer, "com.apple.MobileBackup", 0, 0, 0, 1) >= 1) {
          Boolean v45 = v74;
        }
        else {
          Boolean v45 = v71;
        }
      }
      _FileCacheSetPropertyValueForKey(a2, v77, v45);
      int v76 = 1;
    }
    uint64_t v27 = 1;
LABEL_99:
    a5 = v79;
    goto LABEL_55;
  }
  if (CFEqual(v17, v73))
  {
    CFTypeRef cf = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v73, (void **)&cf))
    {
      if (!v76 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)) {
        goto LABEL_124;
      }
      int v76 = 1;
      if (getxattr((const char *)buffer, "com.apple.metadata:com_apple_cloudBackup_excludeItem", 0, 0, 0, 1) >= 1) {
        BOOL v56 = v74;
      }
      else {
        BOOL v56 = v71;
      }
      _FileCacheSetPropertyValueForKey(a2, v73, v56);
    }
    uint64_t v27 = 1;
    goto LABEL_99;
  }
  if (CFEqual(v17, v70))
  {
    CFTypeRef cf = 0;
    if (!_FileCacheGetPropertyValueForKey(a2, v70, (void **)&cf))
    {
      if (!v76 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)) {
        goto LABEL_124;
      }
      int v76 = 1;
      if (getxattr((const char *)buffer, "com.apple.metadata:com_apple_unencryptedBackup_excludeItem", 0, 0, 0, 1) >= 1) {
        uint64_t v57 = v74;
      }
      else {
        uint64_t v57 = v71;
      }
      _FileCacheSetPropertyValueForKey(a2, v70, v57);
    }
    uint64_t v27 = 1;
    goto LABEL_99;
  }
  if (!v75)
  {
LABEL_126:
    uint64_t v27 = 0;
    goto LABEL_127;
  }
  CFAllocatorRef v67 = CFGetAllocator(a1);
  uint64_t v27 = 0;
  *double v75 = _FSURLCreateStandardError(v67, v72, 256, 1, (const __CFString *)a1, 0);
LABEL_127:
  _FileCacheUnlock(a2);
  return v27;
}

void _FileCacheSetPropertyValueForKey(uint64_t a1, const void *a2, const void *a3)
{
  _FileCacheLock(a1);
  uint64_t v6 = *(__CFDictionary **)(a1 + 288);
  if (!v6)
  {
    CFDictionaryValueCallBacks v9 = *(CFDictionaryValueCallBacks *)byte_1ECA262C0;
    CFAllocatorRef v7 = CFGetAllocator((CFTypeRef)a1);
    uint64_t v6 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x1E4F1D530], &v9);
    *(void *)(a1 + 288) = v6;
  }
  CFDictionarySetValue(v6, a2, a3);
  int v8 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v8;
  if (!v8)
  {
    *(void *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
}

CFStringRef _FSCreatePathForFileID(const __CFAllocator *a1, int a2, uint64_t a3, CFErrorRef *a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (getFileSystemPathForFileID(a2, a3, cStr, (char *)0x400))
  {
    CFStringRef result = CFStringCreateWithCString(a1, cStr, 0x8000100u);
    if (!a4) {
      return result;
    }
  }
  else
  {
    if (!a4) {
      return 0;
    }
    CFErrorRef v7 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E4F1D148], 4, 0, 0, 0);
    CFStringRef result = 0;
    *a4 = v7;
  }
  if (result) {
    return result;
  }
  if (*a4) {
    return 0;
  }
  if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
    _FSCreatePathForFileID_cold_1();
  }
  CFErrorRef v8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  CFStringRef result = 0;
  *a4 = v8;
  return result;
}

BOOL _FSGetFileSystemRepresentationForFileID(const __CFAllocator *a1, int a2, uint64_t a3, char *a4, char *a5, CFErrorRef *a6)
{
  BOOL FileSystemPathForFileID = getFileSystemPathForFileID(a2, a3, a4, a5);
  BOOL v9 = FileSystemPathForFileID;
  if (a6)
  {
    if (!FileSystemPathForFileID)
    {
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D148];
      CFErrorRef v11 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E4F1D148], 4, 0, 0, 0);
      *a6 = v11;
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
          _FSGetFileSystemRepresentationForFileID_cold_1();
        }
        *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, 256, 0);
      }
    }
  }
  return v9;
}

BOOL getFileSystemPathForFileID(int a1, uint64_t a2, char *a3, char *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = 0;
  uint64_t v8 = MountInfoStorageSize();
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  if (!MountInfoPrepare(v15, a1, 0, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0)) {
    return 0;
  }
  if (a2)
  {
    if ((MountInfoGetCapabilities(v15[0]) & 0x8000000000000) != 0)
    {
      fsid_t FSID = (fsid_t)MountInfoGetFSID(v15[0]);
      BOOL v10 = fsgetpath(a3, (size_t)a4, &FSID, a2) >= 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    MountPoint = (const char *)MountInfoGetMountPoint(v15[0]);
    BOOL v10 = strlcpy(a3, MountPoint, (size_t)a4) < (unint64_t)a4;
  }
  MountInfoDestroy(v15[0]);
  return v10;
}

uint64_t createVolumeURL(__CFAllocator *a1, int a2, fsid *a3, CFURLRef *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v7 = 1;
    *a4 = createFileReferenceURLRef(a1, a3[14].val[0], 0, 2, 0, 1u);
    return v7;
  }
  uint64_t v19 = 0;
  uint64_t v8 = MountInfoStorageSize();
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  if (MountInfoPrepare(&v19, a3[14].val[0], 0, (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
  {
    MountPoint = (const char *)MountInfoGetMountPoint(v19);
    if (!MountPoint) {
      goto LABEL_7;
    }
LABEL_10:
    size_t v14 = strlen(MountPoint);
    if (v14)
    {
      size_t v15 = v14;
      if (v19)
      {
        if (initGlobalsOnce(void)::onceToken != -1) {
          dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
        }
        CFURLRef v16 = (CFURLRef)MEMORY[0x1853003B0](a1, MountPoint, v15, 1, 0);
      }
      else
      {
        CFURLRef v16 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)MountPoint, v14, 1u);
      }
      *a4 = v16;
      uint64_t v7 = 1;
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  fsid v11 = a3[13];
  if (!GetStatfsByFSID(v11, &v24))
  {
    MountPoint = v24.f_mntonname;
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v12 = defaultLog;
  uint64_t v7 = 0;
  if (!os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_18;
  }
  fsid v13 = a3[29];
  int v20 = 136315394;
  int v21 = "createVolumeURL";
  __int16 v22 = 2112;
  fsid v23 = v13;
  _os_log_impl(&dword_181761000, v12, OS_LOG_TYPE_DEFAULT, "%s: no mountpoint for path: %@", (uint8_t *)&v20, 0x16u);
LABEL_15:
  uint64_t v7 = 0;
LABEL_18:
  if (v19) {
    MountInfoDestroy(v19);
  }
  return v7;
}

uint64_t MountInfoGetMountPoint(uint64_t a1)
{
  return a1 + 88;
}

void *_URLEnumeratorCreateForMountedVolumes(const __CFAllocator *a1, uint64_t a2, const __CFArray *a3)
{
  uint64_t v6 = (void *)_URLEnumeratorCreate(a1);
  uint64_t v7 = v6;
  if (v6)
  {
    v6[2] = a1;
    v6[4] = a2;
    if (a3)
    {
      CFArrayRef MutableCopy = CFArrayCreateMutableCopy(a1, 0, a3);
      v7[5] = MutableCopy;
      v7[6] = 0;
      uint64_t v9 = (CFArrayRef *)(v7 + 5);
      uint64_t v10 = v7[4];
      if ((v10 & 6) != 0)
      {
        if (MutableCopy)
        {
          if ((v10 & 2) == 0)
          {
LABEL_12:
            if ((v7[4] & 4) != 0)
            {
              CFIndex Count = CFArrayGetCount(*v9);
              size_t v14 = (const void *)*MEMORY[0x1E4F1CEF8];
              if (!Count
                || (v19.length = Count - 1,
                    v19.location = 0,
                    !CFArrayContainsValue(*v9, v19, (const void *)*MEMORY[0x1E4F1CEF8])))
              {
                CFArrayAppendValue(*v9, v14);
              }
              CFIndex v15 = CFArrayGetCount(*v9);
              CFURLRef v16 = (const void *)*MEMORY[0x1E4F1CDD0];
              if (!v15
                || (v20.length = v15 - 1,
                    v20.location = 0,
                    !CFArrayContainsValue(*v9, v20, (const void *)*MEMORY[0x1E4F1CDD0])))
              {
                CFArrayAppendValue(*v9, v16);
              }
            }
            goto LABEL_19;
          }
LABEL_9:
          CFIndex v11 = CFArrayGetCount(MutableCopy);
          uint64_t v12 = (const void *)*MEMORY[0x1E4F1D690];
          if (!v11
            || (v18.length = v11 - 1,
                v18.location = 0,
                !CFArrayContainsValue(*v9, v18, (const void *)*MEMORY[0x1E4F1D690])))
          {
            CFArrayAppendValue(*v9, v12);
          }
          goto LABEL_12;
        }
LABEL_8:
        CFArrayRef MutableCopy = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
        v7[5] = MutableCopy;
        if ((v7[4] & 2) == 0) {
          goto LABEL_12;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v6[5] = 0;
      v6[6] = 0;
      uint64_t v9 = (CFArrayRef *)(v6 + 5);
      if ((a2 & 6) != 0) {
        goto LABEL_8;
      }
    }
LABEL_19:
    _SetHashCode(v7);
  }
  return v7;
}

uint64_t _URLEnumeratorCreateForDirectoryURL(const __CFAllocator *a1, const void *a2, uint64_t a3, const __CFArray *a4)
{
  uint64_t v8 = _URLEnumeratorCreate(a1);
  uint64_t v9 = v8;
  if (v8)
  {
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 32) = a3;
    if (a4)
    {
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(a1, 0, a4);
      a3 = *(void *)(v9 + 32);
    }
    else
    {
      CFMutableArrayRef MutableCopy = 0;
    }
    *(void *)(v9 + 40) = MutableCopy;
    if ((a3 & 0x40) == 0)
    {
      if (CFURLIsFileReferenceURL((CFURLRef)a2))
      {
        if (_CFURLGetVolumePropertyFlags()) {
          unint64_t v11 = *(void *)(v9 + 32) & 0xFFFFFFFFFFFFFFFBLL;
        }
        else {
          unint64_t v11 = *(void *)(v9 + 32) & 0xFFFFFFFFFFFFFFFBLL;
        }
LABEL_11:
        *(void *)(v9 + 32) = v11;
        if ((v11 & 0xE) == 0)
        {
LABEL_30:
          *(void *)(v9 + 48) = CFRetain(a2);
          _SetHashCode((void *)v9);
          return v9;
        }
        CFArrayRef Mutable = *(const __CFArray **)(v9 + 40);
        if (Mutable)
        {
          if ((v11 & 2) == 0) {
            goto LABEL_19;
          }
        }
        else
        {
          CFArrayRef Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
          *(void *)(v9 + 40) = Mutable;
          if ((*(void *)(v9 + 32) & 2) == 0)
          {
LABEL_19:
            if ((*(unsigned char *)(v9 + 32) & 4) != 0)
            {
              CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              CFURLRef v16 = (const void *)*MEMORY[0x1E4F1CEF8];
              if (!Count
                || (v23.length = Count - 1,
                    v23.location = 0,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v23, (const void *)*MEMORY[0x1E4F1CEF8])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v16);
              }
              CFIndex v17 = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              CFRange v18 = (const void *)*MEMORY[0x1E4F1CDD0];
              if (!v17
                || (v24.length = v17 - 1,
                    v24.location = 0,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v24, (const void *)*MEMORY[0x1E4F1CDD0])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v18);
              }
            }
            if ((*(unsigned char *)(v9 + 32) & 8) != 0)
            {
              CFIndex v19 = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              CFRange v20 = (const void *)*MEMORY[0x1E4F1D6A0];
              if (!v19
                || (v25.length = v19 - 1,
                    v25.location = 0,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v25, (const void *)*MEMORY[0x1E4F1D6A0])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v20);
              }
            }
            goto LABEL_30;
          }
        }
        CFIndex v13 = CFArrayGetCount(Mutable);
        size_t v14 = (const void *)*MEMORY[0x1E4F1D690];
        if (!v13
          || (v22.length = v13 - 1,
              v22.location = 0,
              !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v22, (const void *)*MEMORY[0x1E4F1D690])))
        {
          CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v14);
        }
        goto LABEL_19;
      }
      a3 = *(void *)(v9 + 32);
    }
    unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFFBLL;
    goto LABEL_11;
  }
  return v9;
}

uint64_t _URLEnumeratorCreate(const __CFAllocator *a1)
{
  if (_URLEnumeratorGetTypeID::onceToken != -1) {
    dispatch_once(&_URLEnumeratorGetTypeID::onceToken, &__block_literal_global_4);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v2 = Instance;
  if (Instance) {
    bzero((void *)(Instance + 16), 0x218uLL);
  }
  return v2;
}

CFHashCode _SetHashCode(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (const void *)a1[5];
  if (v2) {
    v3 ^= CFHash(v2);
  }
  CFHashCode result = a1[6];
  if (result)
  {
    CFHashCode result = CFHash((CFTypeRef)result);
    v3 ^= result;
  }
  a1[3] = v3;
  return result;
}

uint64_t ___Z19_FileCacheInitClassv_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  sFileCacheTypeID = result;
  return result;
}

CFTypeRef CFURLCreateByResolvingDataInBookmark(const __CFAllocator *a1, BookmarkData *a2, uint64_t a3, unint64_t a4, const __CFArray *a5, unsigned __int8 *a6, __CFError **a7, const __CFURL **a8)
{
  uint64_t v10 = a3;
  unint64_t v11 = a2;
  uint64_t v333 = *MEMORY[0x1E4F143B8];
  CFTypeRef v323 = 0;
  CFTypeRef v324 = 0;
  unsigned __int8 v322 = 0;
  if (BookmarkData::getMisalignedItemDataPtr(a2, 0x1010u, 0, a3))
  {
    CFIndex v13 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      CFURLRef v32 = copyPathComponentsAsString(v11, v10, 0, 0);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = a4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      _os_log_debug_impl(&dword_181761000, v13, OS_LOG_TYPE_DEBUG, "STARTING RESOLUTION of a bookmark to a filesystem item. options=%#lx, originalItemPath=%@", buf, 0x16u);
      if (v32) {
        CFRelease(v32);
      }
      CFIndex v13 = resolveLog;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      CFURLCreateByResolvingDataInBookmark();
    }
    CFArrayRef Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
    BOOL URLVolumeProperties = BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)&userInfoValues);
    if (URLVolumeProperties) {
      unsigned int v16 = v332 & userInfoValues & 1;
    }
    else {
      unsigned int v16 = 0;
    }
    v308 = a6;
    CFTypeID TypeID = CFStringGetTypeID();
    CFTypeRef cf = BookmarkData::copyItem(v11, 0x2011u, v10, TypeID);
    CFIndex v19 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "copyVolumesArrayForBookmark";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      *(_WORD *)&buf[24] = 2112;
      *(void *)&buf[26] = cf;
      _os_log_debug_impl(&dword_181761000, v19, OS_LOG_TYPE_DEBUG, "%s: (depth=%u bookmarkItemWasLocal=%{BOOL}d volumeUUID=%@", buf, 0x22u);
    }
    CFRange v20 = (const __CFString **)MEMORY[0x1E4F1D988];
    v312 = a1;
    unsigned int v313 = v10;
    v314 = v11;
    theArray = Mutable;
    if (!v16) {
      goto LABEL_31;
    }
    CFTypeID v21 = CFBooleanGetTypeID();
    CFRange v22 = BookmarkData::copyItem(v11, 0x2030u, v10, v21);
    if (!v22) {
      goto LABEL_31;
    }
    CFRange v23 = v22;
    if (CFEqual(v22, (CFTypeRef)*MEMORY[0x1E4F1CFD0]))
    {
      CFTypeID v24 = CFStringGetTypeID();
      CFRange v25 = BookmarkData::copyItem(v11, 0x2002u, v10, v24);
      uint64_t v26 = resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
      {
        CFURLCreateByResolvingDataInBookmark((uint64_t)v25, v26);
        if (v25)
        {
LABEL_16:
          if (CFEqual(v25, @"/"))
          {
            CFURLRef v27 = CFURLCreateWithFileSystemPath(a1, @"/", kCFURLPOSIXPathStyle, 1u);
            if (v27)
            {
              CFURLRef v28 = v27;
              CFStringRef v315 = *v20;
              BOOL matched = matchURLProperty(v27, *v20, cf);
              BOOL v30 = os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG);
              if (matched)
              {
                uint64_t v10 = v313;
                if (v30) {
                  CFURLCreateByResolvingDataInBookmark();
                }
                CFArrayAppendValue(theArray, v28);
                CFRelease(v28);
                CFAllocatorRef v31 = v25;
                CFArrayRef Mutable = theArray;
                CFRelease(v31);
                CFRelease(v23);
                if (CFArrayGetCount(theArray)) {
                  goto LABEL_74;
                }
                goto LABEL_31;
              }
              if (v30) {
                CFURLCreateByResolvingDataInBookmark();
              }
              CFRelease(v28);
              uint64_t v10 = v313;
            }
          }
          CFRelease(v25);
        }
      }
      else if (v25)
      {
        goto LABEL_16;
      }
    }
    CFRelease(v23);
    CFArrayRef Mutable = theArray;
LABEL_31:
    v307 = a7;
    if (URLVolumeProperties)
    {
      int v33 = v332 & ~userInfoValues & 1;
      BOOL v34 = (*(void *)&v332 & 0x10000 & (unint64_t)userInfoValues) != 0;
      BOOL v35 = (*(void *)&v332 & 0x10000 & ~(unint64_t)userInfoValues) != 0;
    }
    else
    {
      BOOL v34 = 0;
      int v33 = 0;
      BOOL v35 = 0;
    }
    CFURLRef v36 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v33;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v34;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v35;
      _os_log_debug_impl(&dword_181761000, v36, OS_LOG_TYPE_DEBUG, "Necessary matching props for volume from bookmark: wasLocal=%{BOOL}d wasNetwork=%{BOOL}d wasDevFS=%{BOOL}d/%{BOOL}d", buf, 0x1Au);
    }
    if (copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::onceToken != -1) {
      dispatch_once(&copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::onceToken, &__block_literal_global_2);
    }
    uint64_t v37 = (const void *)MEMORY[0x185300400](*MEMORY[0x1E4F1CF80], 0, copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::sPropertyKeys);
    CFStringRef v315 = *v20;
    while (1)
    {
      while (1)
      {
        CFURLRef anURL = 0;
        uint64_t v38 = MEMORY[0x185300410](v37, &anURL, 0);
        CFURLRef v39 = anURL;
        if (anURL && v38 == 1) {
          break;
        }
        if (v38 == 2) {
          goto LABEL_72;
        }
      }
      uint64_t inited = 0;
      CFAllocatorRef v41 = resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
        break;
      }
      if (v16)
      {
LABEL_47:
        if (!_CFURLGetVolumePropertyFlags()) {
          goto LABEL_48;
        }
      }
      else
      {
LABEL_48:
        if (v33) {
          _CFURLGetVolumePropertyFlags();
        }
        if (v35) {
          _CFURLGetVolumePropertyFlags();
        }
        if (!v34 || !_CFURLGetVolumePropertyFlags())
        {
          if (cf && matchURLProperty(anURL, v315, cf))
          {
            CFStringRef v42 = CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
            CFStringRef v43 = copyPathComponentsAsString(v314, v10, 0, 1);
            CFStringRef v44 = v43;
            if (v42)
            {
              if (!v43)
              {
                CFStringRef v44 = v42;
                goto LABEL_69;
              }
              CFIndex Length = CFStringGetLength(v42);
              CFIndex v46 = CFStringGetLength(v44);
              if (v46 >= 2 && CFStringGetCharacterAtIndex(v44, v46 - 1) == 47) {
                --v46;
              }
              if (Length != v46
                || (v337.location = 0, v337.length = Length, CFStringCompareWithOptions(v44, v42, v337, 0)))
              {
                CFRelease(v44);
                CFStringRef v44 = v42;
                uint64_t v10 = v313;
LABEL_69:
                CFRelease(v44);
                goto LABEL_70;
              }
              CFArrayRemoveAllValues(theArray);
              CFArrayAppendValue(theArray, anURL);
              CFStringRef v47 = v44;
              CFArrayRef Mutable = theArray;
              CFRelease(v47);
              CFRelease(v42);
              uint64_t v10 = v313;
LABEL_72:
              a7 = v307;
              a1 = v312;
              unint64_t v11 = v314;
              if (v37) {
                CFRelease(v37);
              }
LABEL_74:
              if (cf) {
                CFRelease(cf);
              }
              if (!os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                if (Mutable) {
                  goto LABEL_78;
                }
                goto LABEL_103;
              }
              CFURLCreateByResolvingDataInBookmark();
              if (!Mutable) {
                goto LABEL_103;
              }
LABEL_78:
              if (CFArrayGetCount(Mutable) >= 2 && BookmarkData::getMisalignedItemDataPtr(v11, 0x2011u, 0, v10))
              {
                CFTypeID v48 = CFStringGetTypeID();
                CFStringRef v49 = BookmarkData::copyItem(v11, 0x2011u, v10, v48);
                if (CFArrayGetCount(Mutable) >= 1)
                {
                  CFIndex v50 = 0;
                  char v51 = 0;
                  int v52 = 0;
                  CFArrayRef v53 = theArray;
                  while (1)
                  {
                    ValueAtIndex = CFArrayGetValueAtIndex(v53, v50);
                    if (matchURLProperty((const __CFURL *)ValueAtIndex, v315, v49))
                    {
                      if (v52 && !CFEqual(v52, ValueAtIndex))
                      {
                        char v96 = resolveLog;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412802;
                          *(void *)&uint8_t buf[4] = v52;
                          *(_WORD *)&buf[12] = 2112;
                          *(void *)&buf[14] = ValueAtIndex;
                          *(_WORD *)&buf[22] = 2112;
                          *(void *)&buf[24] = v49;
                          _os_log_debug_impl(&dword_181761000, v96, OS_LOG_TYPE_DEBUG, "ERROR-- two mounted volumes (%@,%@) have the same UUID %@", buf, 0x20u);
                        }
                        CFRelease(v52);
                        int v52 = 0;
                        if (!v49) {
                          goto LABEL_100;
                        }
LABEL_99:
                        CFRelease(v49);
                        goto LABEL_100;
                      }
                      if (ValueAtIndex) {
                        CFRetain(ValueAtIndex);
                      }
                      if (v52 && v52 != ValueAtIndex) {
                        CFRelease(v52);
                      }
                      int v52 = ValueAtIndex;
                    }
                    if (v52)
                    {
                      uint64_t v55 = resolveLog;
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v52;
                        _os_log_debug_impl(&dword_181761000, v55, OS_LOG_TYPE_DEBUG, "Pruning volume list to %@ because its UUID matches the one in the bookmark data.", buf, 0xCu);
                      }
                      CFArrayRemoveAllValues(theArray);
                      CFArrayAppendValue(theArray, v52);
                      char v51 = 1;
                    }
                    ++v50;
                    CFArrayRef v53 = theArray;
                    if (v50 >= CFArrayGetCount(theArray)) {
                      goto LABEL_98;
                    }
                  }
                }
                char v51 = 0;
                int v52 = 0;
LABEL_98:
                if (v49) {
                  goto LABEL_99;
                }
LABEL_100:
                unint64_t v11 = v314;
                CFArrayRef Mutable = theArray;
                if (v52) {
                  CFRelease(v52);
                }
                if (v51)
                {
                  BOOL v74 = 0;
                  goto LABEL_193;
                }
              }
LABEL_103:
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                CFURLCreateByResolvingDataInBookmark();
              }
              BOOL v56 = BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)&userInfoValues);
              if ((a4 & 0x200) != 0)
              {
                CFTypeRef v73 = (void *)v323;
              }
              else
              {
                if (!v56) {
                  goto LABEL_111;
                }
                if ((v332 & 0x200) != 0 && (BYTE1(userInfoValues) & 2) != 0)
                {
                  *(_DWORD *)buf = 0;
                  if (BookmarkData::getItemAs(v11, 0x2040u, v10, (unsigned int *)buf))
                  {
                    double v75 = resolveLog;
                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                      CFURLCreateByResolvingDataInBookmark(v10, v75, v76, v77, v78, v79, v80, (uint64_t)v81);
                    }
                    uint64_t v82 = (const void *)CFURLCreateByResolvingDataInBookmark(a1, v11, *(unsigned int *)buf, a4, (const __CFArray *)&v322, (unsigned __int8 *)&v323, 0, v81);
                    if (v82) {
                      CFRelease(v82);
                    }
                  }
                  CFURLRef v57 = 0;
                  unsigned __int8 v322 = 1;
                }
                else
                {
                  if ((v332 & 2) == 0 || (userInfoValues & 2) == 0)
                  {
LABEL_111:
                    CFURLRef v57 = 0;
                    goto LABEL_112;
                  }
                  CFTypeID v83 = CFStringGetTypeID();
                  CFStringRef v84 = (const __CFString *)BookmarkData::copyItem(v11, 0x2002u, v10, v83);
                  CFStringRef v85 = v84;
                  if (!v84) {
                    goto LABEL_263;
                  }
                  CStringPtr = CFStringGetCStringPtr(v84, 0x8000100u);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (CStringPtr) {
                      goto LABEL_150;
                    }
LABEL_149:
                    CStringPtr = buf;
                    if (CFStringGetCString(v85, buf, 1024, 0x8000100u)) {
                      goto LABEL_150;
                    }
                    goto LABEL_263;
                  }
                  if (!CStringPtr) {
                    goto LABEL_149;
                  }
LABEL_150:
                  size_t v87 = strlen(CStringPtr);
                  CFURLRef anURL = 0;
                  int v88 = getmntinfo_r_np((statfs **)&anURL, 2);
                  if (!v88) {
                    goto LABEL_263;
                  }
                  if (!v87 || v87 > 0x400uLL || v88 <= 0)
                  {
                    free(anURL);
                    goto LABEL_263;
                  }
                  CFURLRef v57 = 0;
                  unint64_t v89 = v88 + 1;
                  do
                  {
                    CFStringRef v90 = (const UInt8 *)anURL + 2168 * (v89 - 2) + 88;
                    if (!v90[v87] && !strcmp(CStringPtr, (const char *)anURL + 2168 * (v89 - 2) + 88))
                    {
                      CFURLRef v91 = CFURLCreateFromFileSystemRepresentation(a1, v90, v87, 1u);
                      if (v57 != v91)
                      {
                        CFURLRef v92 = v91;
                        if (v57) {
                          CFRelease(v57);
                        }
                        CFURLRef v57 = v92;
                      }
                    }
                    --v89;
                  }
                  while (v89 > 1);
                  free(anURL);
                  LODWORD(v10) = v313;
                  CFArrayRef Mutable = theArray;
                  if (!v57)
                  {
LABEL_263:
                    CFURLRef v57 = 0;
                    unsigned __int8 v322 = 1;
                  }
                  if (v85) {
                    CFRelease(v85);
                  }
                }
LABEL_112:
                if (BookmarkData::getMisalignedItemDataPtr(v11, 0x2050u, 0, v10))
                {
                  CFTypeID v58 = CFURLGetTypeID();
                  size_t v59 = BookmarkData::copyItem(v11, 0x2050u, v10, v58);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (v59)
                    {
LABEL_115:
                      uint64_t v60 = *MEMORY[0x1E4F1CF80];
                      size_t v61 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
                      if (!v57)
                      {
                        CFTypeID v62 = CFStringGetTypeID();
                        CFStringRef v63 = (const __CFString *)BookmarkData::copyItem(v11, 0x2010u, v10, v62);
                        uint64_t v64 = MEMORY[0x185300400](v60, 0, 0);
                        CFAllocatorRef v65 = (const __CFString **)MEMORY[0x1E4F1D978];
                        if (!v64) {
                          goto LABEL_165;
                        }
                        int v66 = (const void *)v64;
                        CFURLRef v57 = 0;
                        CFStringRef v67 = (const __CFString *)*MEMORY[0x1E4F1D8B0];
                        CFStringRef cfa = (const __CFString *)*MEMORY[0x1E4F1D978];
                        do
                        {
                          while (1)
                          {
                            *(void *)buf = 0;
                            uint64_t v68 = MEMORY[0x185300410](v66, buf, 0);
                            if (!*(void *)buf || v68 != 1) {
                              break;
                            }
                            CFArrayAppendValue(v61, *(const void **)buf);
                            if (v63)
                            {
                              CFStringRef PathComponent = CFURLCopyLastPathComponent(*(CFURLRef *)buf);
                              if (PathComponent)
                              {
                                CFStringRef v71 = PathComponent;
                                if (CFStringCompare(PathComponent, v63, 0)
                                  || !matchURLProperty(*(const __CFURL **)buf, v67, v63)
                                  || !matchURLProperty(*(const __CFURL **)buf, cfa, v59))
                                {
                                  goto LABEL_134;
                                }
                                CFURLRef v72 = *(const __CFURL **)buf;
                                if (*(void *)buf) {
                                  CFRetain(*(CFTypeRef *)buf);
                                }
                                if (v57 == v72)
                                {
LABEL_134:
                                  CFURLRef v72 = v57;
                                }
                                else if (v57)
                                {
                                  CFRelease(v57);
                                }
                                CFRelease(v71);
                                CFURLRef v57 = v72;
                                unint64_t v11 = v314;
                              }
                            }
                          }
                        }
                        while (v68 != 2);
                        CFRelease(v66);
                        CFArrayRef Mutable = theArray;
                        if (!v57)
                        {
LABEL_165:
                          if (CFArrayGetCount(v61) < 1)
                          {
                            CFURLRef v57 = 0;
                          }
                          else
                          {
                            CFIndex v93 = 0;
                            CFStringRef v94 = *v65;
                            while (1)
                            {
                              CFURLRef v57 = (CFURLRef)CFArrayGetValueAtIndex(v61, v93);
                              BOOL v95 = matchURLProperty(v57, v94, v59);
                              if (v57)
                              {
                                if (v95) {
                                  break;
                                }
                              }
                              if (++v93 >= CFArrayGetCount(v61))
                              {
                                CFURLRef v57 = 0;
                                goto LABEL_179;
                              }
                            }
                            CFRetain(v57);
LABEL_179:
                            CFArrayRef Mutable = theArray;
                          }
                        }
                        if (v63) {
                          CFRelease(v63);
                        }
                        a1 = v312;
                        LODWORD(v10) = v313;
                      }
                      if (v61) {
                        CFRelease(v61);
                      }
                    }
                  }
                  else if (v59)
                  {
                    goto LABEL_115;
                  }
                  if (!v57) {
                    unsigned __int8 v322 = 1;
                  }
                  if (v59) {
                    CFRelease(v59);
                  }
                }
                if (v57)
                {
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                    CFURLCreateByResolvingDataInBookmark();
                  }
                  BOOL v74 = v322 == 0;
                  CFArrayInsertValueAtIndex(Mutable, 0, v57);
                  CFRelease(v57);
LABEL_193:
                  a6 = v308;
LABEL_203:
                  CFAllocatorRef v99 = resolveLog;
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                    CFURLCreateByResolvingDataInBookmark(v313, v99, v100, v101, v102, v103, v104, v105);
                  }
                  if (v324)
                  {
                    CFIndex v17 = 0;
                    goto LABEL_324;
                  }
                  CFTypeID v106 = CFNumberGetTypeID();
                  CFTypeRef v107 = BookmarkData::copyItem(v11, 0xC001u, v313, v106);
                  if (v107)
                  {
                    int v108 = v107;
                    *(_DWORD *)buf = 0;
                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                      CFURLCreateByResolvingDataInBookmark();
                    }
                    CFRetain(v108);
                    int Value = CFNumberGetValue((CFNumberRef)v108, kCFNumberSInt32Type, buf);
                    CFRelease(v108);
                    if (Value)
                    {
                      CFURLRef v112 = (CFURLRef)copyHomeFolderURLForUser(0, v110, v111);
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      if (*(_DWORD *)buf)
                      {
                        CFArrayRef v113 = copyPathComponentsAsArray(v11, v313, 0);
                        CFArrayRef v114 = v113;
                        if (v113) {
                          unsigned int Count = CFArrayGetCount(v113);
                        }
                        else {
                          unsigned int Count = 0;
                        }
                        CFArrayRef v117 = resolveLog;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                          CFURLCreateByResolvingDataInBookmark((uint64_t)buf, v117, v118, v119, v120, v121, v122, v123);
                        }
                        v124.length = *(unsigned int *)buf;
                        if (Count >= *(_DWORD *)buf)
                        {
                          v124.location = Count - *(_DWORD *)buf;
                          CFArrayRef v125 = copyOfArray(v312, v114, v124);
                          CFStringRef v126 = CFStringCreateByCombiningStrings(v312, v125, @"/");
                          BOOL v127 = isDirectory(v11, v313);
                          CFURLRef v128 = (const __CFURL *)MEMORY[0x1853003E0](v312, v126, 0, v127, v112);
                          if (v128)
                          {
                            CFURLRef v129 = v128;
                            CFURLRef v116 = CFURLCopyAbsoluteURL(v128);
                            CFRelease(v129);
                          }
                          else
                          {
                            CFURLRef v116 = 0;
                          }
                          a6 = v308;
                          if (v126) {
                            CFRelease(v126);
                          }
                          if (v125) {
                            CFRelease(v125);
                          }
                        }
                        else
                        {
                          CFURLRef v116 = 0;
                        }
                        if (v114) {
                          CFRelease(v114);
                        }
                      }
                      else
                      {
                        if (v112) {
                          CFRetain(v112);
                        }
                        CFURLRef v116 = v112;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          CFURLCreateByResolvingDataInBookmark();
                          CFURLRef v116 = v112;
                        }
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      if (matchURLToBookmark(v314, v313, v116, (BOOL *)&v322, v130))
                      {
                        if (v116)
                        {
                          CFRetain(v116);
                          CFTypeRef v131 = v116;
                        }
                        else
                        {
                          CFTypeRef v131 = 0;
                        }
                        if (v324 == v131)
                        {
                          CFIndex v17 = 0;
                        }
                        else
                        {
                          if (v324) {
                            CFRelease(v324);
                          }
                          CFIndex v17 = 0;
                          CFTypeRef v324 = v131;
                        }
                      }
                      else
                      {
                        CFIndex v17 = 0;
                        if (a7 && v116)
                        {
                          CFRetain(v116);
                          CFIndex v17 = v116;
                        }
                        CFTypeRef v131 = v324;
                      }
                      if (!v131)
                      {
                        CFTypeID v132 = CFStringGetTypeID();
                        CFAllocatorRef v133 = (const __CFAllocator *)BookmarkData::copyItem(v314, 0xC011u, v313, v132);
                        if (v133)
                        {
                          CFAllocatorRef v134 = v133;
                          int v135 = (const void *)CFCopyUserName();
                          CFAllocatorRef cfb = v134;
                          int v136 = CFEqual(v134, v135);
                          int v139 = v136;
                          if (v135)
                          {
                            CFRelease(v135);
                            if (v139) {
                              goto LABEL_255;
                            }
LABEL_259:
                            CFAllocatorRef v141 = cfb;
                            CFURLRef v316 = (CFURLRef)copyHomeFolderURLForUser(cfb, v137, v138);
                            if (v112 == v316)
                            {
                              CFURLRef v316 = v112;
                            }
                            else if (v112)
                            {
                              CFRelease(v112);
                            }
                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                              CFURLCreateByResolvingDataInBookmark();
                            }
                            if (*(_DWORD *)buf)
                            {
                              CFArrayRef v142 = copyPathComponentsAsArray(v314, v313, 0);
                              CFArrayRef v143 = v142;
                              if (v142) {
                                unsigned int v144 = CFArrayGetCount(v142);
                              }
                              else {
                                unsigned int v144 = 0;
                              }
                              long long v145 = resolveLog;
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                                CFURLCreateByResolvingDataInBookmark((uint64_t)buf, v145, v146, v147, v148, v149, v150, v151);
                              }
                              v152.length = *(unsigned int *)buf;
                              if (v144 >= *(_DWORD *)buf)
                              {
                                v152.location = v144 - *(_DWORD *)buf;
                                CFArrayRef v310 = copyOfArray(v312, v143, v152);
                                CFStringRef v154 = CFStringCreateByCombiningStrings(v312, v310, @"/");
                                BOOL v155 = isDirectory(v314, v313);
                                CFURLRef v156 = (const __CFURL *)MEMORY[0x1853003E0](v312, v154, 0, v155, v316);
                                CFURLRef v157 = v156;
                                if (v156) {
                                  CFURLRef v140 = CFURLCopyAbsoluteURL(v156);
                                }
                                else {
                                  CFURLRef v140 = 0;
                                }
                                if (v116 == v140)
                                {
                                  CFURLRef v140 = v116;
                                }
                                else if (v116)
                                {
                                  CFRelease(v116);
                                }
                                v153 = v314;
                                if (v157) {
                                  CFRelease(v157);
                                }
                                if (v154) {
                                  CFRelease(v154);
                                }
                                CFArrayRef Mutable = theArray;
                                if (v310) {
                                  CFRelease(v310);
                                }
                              }
                              else
                              {
                                CFURLRef v140 = v116;
                                v153 = v314;
                              }
                              CFAllocatorRef v141 = cfb;
                              if (v143) {
                                CFRelease(v143);
                              }
                            }
                            else
                            {
                              if (v316) {
                                CFRetain(v316);
                              }
                              if (v116 == v316)
                              {
                                CFURLRef v140 = v116;
                              }
                              else
                              {
                                CFURLRef v140 = v316;
                                if (v116)
                                {
                                  CFRelease(v116);
                                  CFURLRef v140 = v316;
                                }
                              }
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                                CFURLCreateByResolvingDataInBookmark();
                              }
                              v153 = v314;
                            }
                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                              CFURLCreateByResolvingDataInBookmark();
                            }
                            if (matchURLToBookmark(v153, v313, v140, (BOOL *)&v322, v158))
                            {
                              if (v140)
                              {
                                CFRetain(v140);
                                CFURLRef v159 = v140;
                              }
                              else
                              {
                                CFURLRef v159 = 0;
                              }
                              if (v324 != v159)
                              {
                                if (v324) {
                                  CFRelease(v324);
                                }
                                CFTypeRef v324 = v159;
                              }
                            }
                            CFURLRef v112 = v316;
                          }
                          else
                          {
                            if (!v136) {
                              goto LABEL_259;
                            }
LABEL_255:
                            CFURLRef v140 = v116;
                            CFAllocatorRef v141 = cfb;
                          }
                          CFRelease(v141);
                          CFURLRef v116 = v140;
                        }
                      }
                      if (v112) {
                        CFRelease(v112);
                      }
                      if (v116) {
                        CFRelease(v116);
                      }
                      unint64_t v11 = v314;
                    }
                    else
                    {
                      CFIndex v17 = 0;
                    }
                    if (!v324) {
                      unsigned __int8 v322 = 1;
                    }
                    CFRelease(v108);
                  }
                  else
                  {
                    CFIndex v17 = 0;
                  }
                  a1 = v312;
                  if (v324)
                  {
LABEL_324:
                    LODWORD(v10) = v313;
                    goto LABEL_325;
                  }
                  if (!BookmarkData::getURLResourceProperties(v11, v313, (uint64_t)buf)
                    || (buf[8] & 8) == 0
                    || (buf[0] & 8) == 0)
                  {
                    goto LABEL_608;
                  }
                  CFTypeID v163 = CFBooleanGetTypeID();
                  v164 = BookmarkData::copyItem(v11, 0x2030u, v313, v163);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (!v164) {
                      goto LABEL_595;
                    }
LABEL_335:
                    if (!CFEqual(v164, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
                      goto LABEL_595;
                    }
                    CFTypeRef v167 = CFURLCreateWithFileSystemPath(v312, @"/", kCFURLPOSIXPathStyle, 1u);
                    if (v324 != v167)
                    {
                      if (v324) {
                        CFRelease(v324);
                      }
                      CFTypeRef v324 = v167;
                    }
                    CFRelease(v164);
                  }
                  else
                  {
                    if (v164) {
                      goto LABEL_335;
                    }
LABEL_595:
                    if (v74)
                    {
                      v279 = CFArrayGetValueAtIndex(Mutable, 0);
                      CFTypeRef v167 = v279;
                      if (v279) {
                        CFRetain(v279);
                      }
                    }
                    else
                    {
                      CFTypeRef v167 = matchVolumeURLForBookmark(v11, v313, Mutable, (char *)&v322, v165, v166);
                    }
                    if (v324 != v167)
                    {
                      if (v324) {
                        CFRelease(v324);
                      }
                      CFTypeRef v324 = v167;
                    }
                    if (v164)
                    {
                      CFRelease(v164);
                      if (!v167) {
                        goto LABEL_605;
                      }
LABEL_608:
                      if (v324) {
                        goto LABEL_630;
                      }
                      CFTypeID v280 = CFBooleanGetTypeID();
                      v281 = BookmarkData::copyItem(v11, 0x2030u, v313, v280);
                      if (v281)
                      {
                        v284 = v281;
                        if (CFEqual(v281, (CFTypeRef)*MEMORY[0x1E4F1CFD0]))
                        {
                          v285 = copyPathComponentsAsString(v11, v313, 0, 1);
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            CFURLCreateByResolvingDataInBookmark();
                            if (v285)
                            {
LABEL_613:
                              Boolean v286 = isDirectory(v11, v313);
                              CFURLRef v287 = CFURLCreateWithFileSystemPath(v312, v285, kCFURLPOSIXPathStyle, v286);
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                                CFURLCreateByResolvingDataInBookmark();
                              }
                              a6 = v308;
                              CFArrayRef Mutable = theArray;
                              if (matchURLToBookmark(v11, v313, v287, (BOOL *)&v322, v288))
                              {
                                if (v287) {
                                  CFRetain(v287);
                                }
                                if (v324 != v287)
                                {
                                  if (v324) {
                                    CFRelease(v324);
                                  }
                                  CFTypeRef v324 = v287;
                                }
                              }
                              if (v287) {
                                CFRelease(v287);
                              }
                            }
                          }
                          else if (v285)
                          {
                            goto LABEL_613;
                          }
                          if (!v324) {
                            unsigned __int8 v322 = 1;
                          }
                          if (v285) {
                            CFRelease(v285);
                          }
                        }
                        CFRelease(v284);
                      }
                      if (v324)
                      {
LABEL_630:
                        LODWORD(v10) = v313;
                        goto LABEL_325;
                      }
                      if (v74)
                      {
                        v289 = CFArrayGetValueAtIndex(Mutable, 0);
                        LODWORD(v10) = v313;
                        if (v289)
                        {
                          CFTypeRef v290 = v289;
                          CFRetain(v289);
                          goto LABEL_655;
                        }
LABEL_636:
                        CFTypeID v291 = CFStringGetTypeID();
                        CFStringRef cfc = (const __CFString *)BookmarkData::copyItem(v11, 0x2010u, v10, v291);
                        if (cfc)
                        {
                          unsigned __int8 v322 = 1;
                          v292 = (const void *)MEMORY[0x185300400](*MEMORY[0x1E4F1CF80], 0, 0);
                          *(void *)buf = 0;
                          uint64_t v293 = MEMORY[0x185300410](v292, buf, 0);
                          CFTypeRef v290 = 0;
                          if (v293 != 2)
                          {
                            CFTypeRef v290 = 0;
                            CFStringRef v294 = (const __CFString *)*MEMORY[0x1E4F1D8B0];
                            do
                            {
                              if (v293 != 1 || !*(void *)buf) {
                                goto LABEL_650;
                              }
                              userInfoValues = 0;
                              if (!CFURLCopyResourcePropertyForKey(*(CFURLRef *)buf, v294, &userInfoValues, 0)) {
                                goto LABEL_646;
                              }
                              if (!userInfoValues) {
                                goto LABEL_650;
                              }
                              CFTypeID v295 = CFGetTypeID(userInfoValues);
                              if (v295 == CFStringGetTypeID())
                              {
                                int v296 = 1;
                                if (CFStringCompare(cfc, (CFStringRef)userInfoValues, 1uLL) == kCFCompareEqualTo)
                                {
                                  CFTypeRef v290 = *(CFTypeRef *)buf;
                                  CFRetain(*(CFTypeRef *)buf);
                                  int v296 = 0;
                                }
                              }
                              else
                              {
LABEL_646:
                                int v296 = 1;
                              }
                              if (userInfoValues) {
                                CFRelease(userInfoValues);
                              }
                              if (!v296) {
                                break;
                              }
LABEL_650:
                              uint64_t v293 = MEMORY[0x185300410](v292, buf, 0);
                            }
                            while (v293 != 2);
                          }
                          if (v292) {
                            CFRelease(v292);
                          }
                          CFRelease(cfc);
                          unint64_t v11 = v314;
                        }
                        else
                        {
                          CFTypeRef v290 = 0;
                        }
                      }
                      else
                      {
                        LODWORD(v10) = v313;
                        CFTypeRef v290 = matchVolumeURLForBookmark(v11, v313, Mutable, (char *)&v322, v282, v283);
                        if (!v290) {
                          goto LABEL_636;
                        }
                      }
LABEL_655:
                      CFArrayRef v297 = copyVolumePathComponentsAsArray(v11, v10);
                      CFArrayRef v298 = v297;
                      if (v297) {
                        int v299 = CFArrayGetCount(v297);
                      }
                      else {
                        int v299 = 0;
                      }
                      v300 = copyPathComponentsAsString(v11, v10, v299, 0);
                      v301 = v300;
                      if (v290)
                      {
                        if (v300)
                        {
                          BOOL v302 = isDirectory(v314, v10);
                          CFURLRef v303 = (const __CFURL *)MEMORY[0x1853003E0](v312, v301, 0, v302, v290);
                          v304 = resolveLog;
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138413058;
                            *(void *)&uint8_t buf[4] = v303;
                            *(_WORD *)&buf[12] = 2112;
                            *(void *)&buf[14] = v298;
                            *(_WORD *)&buf[22] = 2112;
                            *(void *)&buf[24] = v301;
                            *(_WORD *)&buf[32] = 2112;
                            *(void *)&buf[34] = v290;
                            _os_log_debug_impl(&dword_181761000, v304, OS_LOG_TYPE_DEBUG, "4. Trying to match by volume name + path components, maybeURL=%@ volumePathElements=%@ pathComponents=%@ volumeURL=%@", buf, 0x2Au);
                            if (!v303) {
                              goto LABEL_672;
                            }
LABEL_662:
                            if (!matchURLToBookmark(v314, v10, v303, (BOOL *)&v322, v305)) {
                              goto LABEL_672;
                            }
                            CFTypeRef v306 = CFURLCopyAbsoluteURL(v303);
                            if (v324 != v306)
                            {
                              if (v324) {
                                CFRelease(v324);
                              }
                              CFTypeRef v324 = v306;
                            }
                          }
                          else
                          {
                            if (v303) {
                              goto LABEL_662;
                            }
LABEL_672:
                            CFTypeRef v306 = v324;
                          }
                          if (!v306) {
                            unsigned __int8 v322 = 1;
                          }
                          if (v303) {
                            CFRelease(v303);
                          }
LABEL_677:
                          CFRelease(v301);
                        }
                      }
                      else if (v300)
                      {
                        goto LABEL_677;
                      }
                      if (v298) {
                        CFRelease(v298);
                      }
                      unint64_t v11 = v314;
                      if (v290) {
                        CFRelease(v290);
                      }
LABEL_325:
                      CFTypeRef v160 = v324;
                      int v161 = 1;
                      if ((a4 & 0x200) != 0 && !v324)
                      {
                        if (BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)buf) && (buf[8] & 2) != 0) {
                          int v162 = (buf[0] >> 1) & 1;
                        }
                        else {
                          int v162 = 0;
                        }
                        int v161 = v162 ^ 1;
                        CFTypeRef v160 = v324;
                      }
                      if (v160 || !v161)
                      {
                        *(void *)buf = *MEMORY[0x1E4F1D138];
                        userInfoValues = @"kCFBookmarkResolutionWithoutMountingMask was passed and the volume needed wasn't available";
                        CFErrorRef v185 = CFErrorCreateWithUserInfoKeysAndValues(a1, (CFErrorDomain)*MEMORY[0x1E4F1D148], 260, (const void *const *)buf, (const void *const *)&userInfoValues, 1);
                        if (v323 != v185)
                        {
                          if (v323) {
                            CFRelease(v323);
                          }
                          CFTypeRef v323 = v185;
                        }
                        CFTypeRef v186 = v324;
                        goto LABEL_382;
                      }
                      unsigned __int8 v322 = 1;
                      if (bookmarkHasPathComponents(v11, v10))
                      {
                        CFTypeID v168 = CFArrayGetTypeID();
                        CFArrayRef v169 = (const __CFArray *)BookmarkData::copyItem(v314, 0x2000u, v10, v168);
                        if (!os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          if (v169) {
                            goto LABEL_348;
                          }
                          goto LABEL_385;
                        }
                        CFURLCreateByResolvingDataInBookmark();
                        if (!v169) {
                          goto LABEL_385;
                        }
LABEL_348:
                        CFIndex v170 = countPathComponents(v314, v313);
                        CFIndex v171 = CFArrayGetCount(v169);
                        if (v171 >= v170) {
                          uint64_t v172 = v170;
                        }
                        else {
                          uint64_t v172 = v171;
                        }
                        if (v172 >= 1)
                        {
                          while (2)
                          {
                            if (v324) {
                              goto LABEL_397;
                            }
                            uint64_t v173 = v172 - 1;
                            *(void *)buf = CFArrayGetValueAtIndex(v169, v172 - 1);
                            CFNumber::CFNumber((CFNumber *)&userInfoValues, (CFTypeRef *)buf);
                            LODWORD(anURL) = 0;
                            if (userInfoValues)
                            {
                              if (CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &anURL))
                              {
                                if (anURL)
                                {
                                  CFTypeRef v176 = matchVolumeURLForBookmark(v314, anURL, theArray, 0, v174, v175);
                                  if (v176)
                                  {
                                    v177 = v176;
                                    if ((unint64_t)v172 > 0x7FFFFFFE) {
                                      v178 = 0;
                                    }
                                    else {
                                      v178 = copyPathComponentsAsString(v314, v313, (int)v172 - 1, 0);
                                    }
                                    v179 = resolveLog;
                                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 138412802;
                                      *(void *)&uint8_t buf[4] = v177;
                                      *(_WORD *)&buf[12] = 2112;
                                      *(void *)&buf[14] = v178;
                                      *(_WORD *)&buf[22] = 1024;
                                      *(_DWORD *)&buf[24] = anURL;
                                      _os_log_debug_impl(&dword_181761000, v179, OS_LOG_TYPE_DEBUG, "5a.  Trying volume url=%@ with partial path %@ volumeDepth=%u", buf, 0x1Cu);
                                      if (v178)
                                      {
LABEL_362:
                                        CFURLRef v180 = (const __CFURL *)MEMORY[0x1853003E0](v312, v178, 0, 0, v177);
                                        if (v180)
                                        {
                                          CFURLRef v182 = v180;
                                          if (matchURLToBookmark(v314, v313, v180, (BOOL *)&v322, v181))
                                          {
                                            CFURLRef v183 = CFURLCopyAbsoluteURL(v182);
                                            if (v324 != v183)
                                            {
                                              if (v324) {
                                                CFRelease(v324);
                                              }
                                              CFTypeRef v324 = v183;
                                            }
                                          }
                                          CFRelease(v182);
                                          a6 = v308;
                                        }
                                        CFRelease(v178);
                                      }
                                    }
                                    else if (v178)
                                    {
                                      goto LABEL_362;
                                    }
                                    CFRelease(v177);
                                  }
                                }
                              }
                              if (userInfoValues) {
                                CFRelease(userInfoValues);
                              }
                            }
                            uint64_t v172 = v173;
                            BOOL v184 = (unint64_t)(v173 + 1) > 1;
                            a1 = v312;
                            if (!v184) {
                              break;
                            }
                            continue;
                          }
                        }
LABEL_385:
                        if (!v324)
                        {
                          v187 = copyPathComponentsAsString(v314, v313, 0, 0);
                          if (v187)
                          {
                            v188 = v187;
                            CFURLRef v189 = CFURLCreateWithFileSystemPath(a1, v187, kCFURLPOSIXPathStyle, 0);
                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                              CFURLCreateByResolvingDataInBookmark();
                            }
                            if (v189)
                            {
                              if (matchURLToBookmark(v314, v313, v189, (BOOL *)&v322, v190))
                              {
                                CFURLRef v191 = CFURLCopyAbsoluteURL(v189);
                                if (v324 != v191)
                                {
                                  if (v324) {
                                    CFRelease(v324);
                                  }
                                  CFTypeRef v324 = v191;
                                }
                              }
                              CFRelease(v189);
                            }
                            CFRelease(v188);
                            a6 = v308;
                          }
                        }
LABEL_397:
                        LODWORD(v10) = v313;
                        if (v169) {
                          CFRelease(v169);
                        }
                      }
                      if (v324) {
                        goto LABEL_426;
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      CFURLRef v194 = (const __CFURL *)matchVolumeURLForBookmark(v314, v10, theArray, (char *)&v322, v192, v193);
                      if (v194)
                      {
                        CFURLRef v195 = v194;
                        if (!volumeSupportsPathFromID((uint64_t)v194)) {
                          goto LABEL_417;
                        }
                        CFTypeID v196 = CFNumberGetTypeID();
                        CFArrayRef v197 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1030u, v10, v196);
                        if (v197) {
                          goto LABEL_405;
                        }
                        CFTypeID v201 = CFArrayGetTypeID();
                        CFArrayRef v202 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1005u, v10, v201);
                        if (v202)
                        {
                          CFArrayRef v197 = v202;
                          if (CFArrayGetCount(v202) < 1) {
                            goto LABEL_418;
                          }
                          CFIndex v203 = CFArrayGetCount(v197);
                          v204 = CFArrayGetValueAtIndex(v197, v203 - 1);
                          if (!v204) {
                            goto LABEL_418;
                          }
                          v205 = v204;
                          CFTypeID v206 = CFGetTypeID(v204);
                          if (v206 != CFNumberGetTypeID())
                          {
                            CFURLRef v198 = 0;
                            a6 = v308;
                            goto LABEL_419;
                          }
                          CFArrayRef v207 = (const __CFArray *)CFRetain(v205);
                          a6 = v308;
                          if (!v207)
                          {
LABEL_418:
                            CFURLRef v198 = 0;
                            goto LABEL_419;
                          }
                          CFArrayRef v208 = v207;
                          CFRelease(v197);
                          CFArrayRef v197 = v208;
LABEL_405:
                          CFURLRef v198 = _CFURLCreateWithVolumeURLAndResourceID(a1, v195, v197);
                          v199 = resolveLog;
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 67109890;
                            *(_DWORD *)&uint8_t buf[4] = v10;
                            *(_WORD *)&buf[8] = 2048;
                            *(void *)&buf[10] = a4;
                            *(_WORD *)&buf[18] = 2112;
                            *(void *)&buf[20] = v197;
                            *(_WORD *)&buf[28] = 2112;
                            *(void *)&buf[30] = v195;
                            _os_log_debug_impl(&dword_181761000, v199, OS_LOG_TYPE_DEBUG, " -- Trying to match by targetFileID, depth=%u  options=%#lx fileID=%@ on volume %@", buf, 0x26u);
                          }
                          if (!matchURLToBookmark(v314, v10, v198, (BOOL *)&v322, v200) && v198)
                          {
                            CFRelease(v198);
                            goto LABEL_418;
                          }
LABEL_419:
                          CFRelease(v197);
                        }
                        else
                        {
LABEL_417:
                          CFURLRef v198 = 0;
                        }
                        CFRelease(v195);
                      }
                      else
                      {
                        CFURLRef v198 = 0;
                      }
                      if (v324 != v198)
                      {
                        if (v324) {
                          CFRelease(v324);
                        }
                        CFTypeRef v324 = v198;
                      }
                      if (v198)
                      {
LABEL_426:
                        CFStringRef v209 = (const __CFString *)*MEMORY[0x1E4F1D5B0];
                        CFTypeID v210 = CFNumberGetTypeID();
                        CFNumberRef v211 = BookmarkData::copyItem(v314, v209, v10, v210);
                        *(void *)buf = 0;
                        CFURLCopyResourcePropertyForKey((CFURLRef)v324, v209, buf, 0);
                        if (v211)
                        {
                          if (!*(void *)buf || !CFEqual(v211, *(CFTypeRef *)buf)) {
LABEL_431:
                          }
                            unsigned __int8 v322 = 1;
                          if (*(void *)buf) {
                            CFRelease(*(CFTypeRef *)buf);
                          }
                          if (v211) {
                            CFRelease(v211);
                          }
                        }
                        else if (*(void *)buf)
                        {
                          goto LABEL_431;
                        }
LABEL_436:
                        unint64_t v11 = v314;
                        if (v324
                          && (BookmarkData::getMisalignedItemDataPtr(v314, 0x1101u, 0, v10)
                           || BookmarkData::getMisalignedItemDataPtr(v314, 0x1102u, 0, v10)))
                        {
                          CFTypeID v212 = CFStringGetTypeID();
                          CFStringRef v213 = (const __CFString *)BookmarkData::copyItem(v314, 0x1102u, v10, v212);
                          CFTypeID v214 = CFStringGetTypeID();
                          CFStringRef v215 = (const __CFString *)BookmarkData::copyItem(v314, 0x1101u, v10, v214);
                          CFIndex v329 = 0;
                          CFMutableStringRef v330 = CFStringCreateMutable(a1, 0);
                          CFStringRef v216 = CFURLGetString((CFURLRef)v324);
                          CFIndex v217 = CFStringGetLength(v216);
                          CFIndex v218 = v329;
                          if (v217 < 1025)
                          {
                            CFIndex v220 = v217;
                            if (v329 + v217 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v218 = 0;
                              CFIndex v329 = 0;
                            }
                            v221 = (UniChar *)&buf[2 * v218];
                            v334.location = 0;
                            v334.length = v220;
                            CFStringGetCharacters(v216, v334, v221);
                            CFIndex v219 = v329 + v220;
                            v329 += v220;
                            if (v213) {
                              goto LABEL_447;
                            }
LABEL_453:
                            if (!v215) {
                              goto LABEL_464;
                            }
LABEL_458:
                            if (v219 >= 1024)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              CFIndex v219 = 0;
                              CFIndex v329 = 0;
                            }
                            *(_WORD *)&buf[2 * v219] = 35;
                            ++v329;
                            CFIndex v226 = CFStringGetLength(v215);
                            CFIndex v227 = v329;
                            if (v226 > 1024)
                            {
                              if (v329)
                              {
                                CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                                CFIndex v329 = 0;
                              }
                              CFStringAppend(v330, v215);
                              CFIndex v219 = v329;
                              goto LABEL_464;
                            }
                            CFIndex v243 = v226;
                            if (v329 + v226 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v227 = 0;
                              CFIndex v329 = 0;
                            }
                            v244 = (UniChar *)&buf[2 * v227];
                            v336.location = 0;
                            v336.length = v243;
                            CFStringGetCharacters(v215, v336, v244);
                            CFIndex v219 = v329 + v243;
                            CFIndex v329 = v219;
                            if (v219)
                            {
LABEL_465:
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              CFIndex v329 = 0;
                            }
                          }
                          else
                          {
                            if (v329)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v329 = 0;
                            }
                            CFStringAppend(v330, v216);
                            CFIndex v219 = v329;
                            if (!v213) {
                              goto LABEL_453;
                            }
LABEL_447:
                            if (v219 >= 1024)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              CFIndex v219 = 0;
                              CFIndex v329 = 0;
                            }
                            *(_WORD *)&buf[2 * v219] = 63;
                            ++v329;
                            CFIndex v222 = CFStringGetLength(v213);
                            CFIndex v223 = v329;
                            if (v222 > 1024)
                            {
                              if (v329)
                              {
                                CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                                CFIndex v329 = 0;
                              }
                              CFStringAppend(v330, v213);
                              CFIndex v219 = v329;
                              goto LABEL_453;
                            }
                            CFIndex v224 = v222;
                            if (v329 + v222 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v223 = 0;
                              CFIndex v329 = 0;
                            }
                            v225 = (UniChar *)&buf[2 * v223];
                            v335.location = 0;
                            v335.length = v224;
                            CFStringGetCharacters(v213, v335, v225);
                            CFIndex v219 = v329 + v224;
                            v329 += v224;
                            if (v215) {
                              goto LABEL_458;
                            }
LABEL_464:
                            if (v219) {
                              goto LABEL_465;
                            }
                          }
                          CFStringRef v228 = v330;
                          CFMutableStringRef v330 = 0;
                          CFURLRef v229 = CFURLGetBaseURL((CFURLRef)v324);
                          userInfoValues = CFURLCreateWithString(a1, v228, v229);
                          CFReleaser<__CFData const*>::operator=(&v324, (CFTypeRef *)&userInfoValues);
                          if (userInfoValues) {
                            CFRelease(userInfoValues);
                          }
                          if (v228) {
                            CFRelease(v228);
                          }
                          if (v215) {
                            CFRelease(v215);
                          }
                          unint64_t v11 = v314;
                          if (v213) {
                            CFRelease(v213);
                          }
                        }
                        CFArrayRef Mutable = theArray;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                          CFURLCreateByResolvingDataInBookmark();
                        }
                        int v98 = 1;
                        if (theArray) {
LABEL_477:
                        }
                          CFRelease(Mutable);
LABEL_478:
                        if (v98)
                        {
                          if (!v324) {
                            goto LABEL_480;
                          }
                          goto LABEL_488;
                        }
                        goto LABEL_495;
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      CFTypeID v245 = CFArrayGetTypeID();
                      CFArrayRef v246 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1005u, v10, v245);
                      unsigned int v247 = countPathComponents(v314, v10);
                      if (v246)
                      {
                        LODWORD(v248) = v247;
                        CFTypeID v249 = CFArrayGetTypeID();
                        CFArrayRef v250 = (const __CFArray *)BookmarkData::copyItem(v314, 0x2000u, v10, v249);
                        if (v250)
                        {
                          CFArrayRef v253 = v250;
                          uint64_t v254 = v248;
                          CFIndex v255 = CFArrayGetCount(v250);
                          if (v255 >= v248) {
                            uint64_t v248 = v248;
                          }
                          else {
                            uint64_t v248 = v255;
                          }
                          if (v248 >= 1)
                          {
                            uint64_t v256 = v254;
                            while (1)
                            {
                              *(void *)buf = CFArrayGetValueAtIndex(v253, (v248 - 1));
                              CFNumber::CFNumber((CFNumber *)&userInfoValues, (CFTypeRef *)buf);
                              LODWORD(anURL) = 0;
                              if (!userInfoValues)
                              {
                                CFTypeRef v186 = 0;
                                goto LABEL_543;
                              }
                              if (!CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &anURL)
                                || anURL == 0)
                              {
                                break;
                              }
                              LOBYTE(inited) = 0;
                              CFURLRef v260 = (const __CFURL *)matchVolumeURLForBookmark(v314, anURL, theArray, (char *)&inited, v257, v258);
                              CFURLRef v261 = v260;
                              if (v260)
                              {
                                v262 = resolveLog;
                                if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  *(void *)&uint8_t buf[4] = v261;
                                  *(_WORD *)&buf[12] = 2112;
                                  *(void *)&buf[14] = v246;
                                  _os_log_debug_impl(&dword_181761000, v262, OS_LOG_TYPE_DEBUG, " --  on volume=%@ fileIDRefs=%@", buf, 0x16u);
                                }
                                uint64_t v263 = resolveBookmarkByRelativePathFromFileIDOnGivenVolume(v312, v314, v313, a4, v261, v246, v248, v256, &v322);
                                CFTypeRef v186 = (CFTypeRef)v263;
                                a6 = v308;
                                if (!v322 && v263) {
                                  unsigned __int8 v322 = inited;
                                }
                                CFRelease(v261);
                                goto LABEL_539;
                              }
                              CFTypeRef v186 = 0;
LABEL_540:
                              if (userInfoValues) {
                                CFRelease(userInfoValues);
                              }
                              if (!v261)
                              {
LABEL_548:
                                LODWORD(v10) = v313;
                                goto LABEL_554;
                              }
LABEL_543:
                              if (v248 >= 2)
                              {
                                --v248;
                                if (!v186) {
                                  continue;
                                }
                              }
                              goto LABEL_548;
                            }
                            CFTypeRef v186 = 0;
LABEL_539:
                            LODWORD(v261) = 1;
                            goto LABEL_540;
                          }
                          CFTypeRef v186 = 0;
LABEL_554:
                          CFRelease(v253);
                        }
                        else
                        {
                          CFArrayRef v253 = (const __CFArray *)matchVolumeURLForBookmark(v314, v10, theArray, (char *)&v322, v251, v252);
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                            CFURLCreateByResolvingDataInBookmark();
                          }
                          CFTypeRef v186 = (CFTypeRef)resolveBookmarkByRelativePathFromFileIDOnGivenVolume(v312, v314, v10, a4, v253, v246, 0, v248, &v322);
                          a6 = v308;
                          if (v253) {
                            goto LABEL_554;
                          }
                        }
                        CFRelease(v246);
                        a1 = v312;
                      }
                      else
                      {
                        CFTypeRef v186 = 0;
                      }
                      if (v324 != v186)
                      {
                        if (v324) {
                          CFRelease(v324);
                        }
                        CFTypeRef v324 = v186;
                      }
                      if (v10 != 1 || v186)
                      {
LABEL_382:
                        if (v186) {
                          goto LABEL_426;
                        }
                        goto LABEL_436;
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      gotLoadHelper_x8__GSLibraryResolveDocumentId2(v264);
                      if (!*(void *)(v265 + 3016))
                      {
                        CFTypeRef v186 = 0;
                        goto LABEL_590;
                      }
                      CFStringRef v266 = (const __CFString *)*MEMORY[0x1E4F1D5B0];
                      CFTypeID v267 = CFNumberGetTypeID();
                      CFNumberRef v268 = BookmarkData::copyItem(v314, v266, 1, v267);
                      if (!v268)
                      {
                        CFTypeRef v186 = 0;
                        goto LABEL_590;
                      }
                      CFNumberRef v271 = v268;
                      CFURLRef v272 = (const __CFURL *)matchVolumeURLForBookmark(v314, 1u, theArray, (char *)&v322, v269, v270);
                      if (!v272)
                      {
                        CFTypeRef v186 = 0;
                        goto LABEL_589;
                      }
                      CFURLRef v273 = v272;
                      if (volumeSupportsPathFromID((uint64_t)v272))
                      {
                        userInfoValues = 0;
                        if (!CFURLCopyResourcePropertyForKey(v273, (CFStringRef)*MEMORY[0x1E4F1CEF0], &userInfoValues, 0))goto LABEL_585; {
                        if (userInfoValues)
                        }
                        {
                          CFURLRef anURL = 0;
                          int valuePtr = 0;
                          if (CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &valuePtr))
                          {
                            if (CFNumberGetValue(v271, kCFNumberSInt64Type, &anURL))
                            {
                              uint64_t inited = GSLibraryResolveDocumentId2_delayInitStub(v274);
                              if (inited)
                              {
                                CFNumberRef v275 = CFNumberCreate(a1, kCFNumberSInt64Type, &inited);
                                if (v275)
                                {
                                  CFNumberRef v276 = v275;
                                  CFTypeRef v186 = _CFURLCreateWithVolumeURLAndResourceID(a1, v273, v275);
                                  v277 = resolveLog;
                                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                  {
                                    *(_DWORD *)buf = 134218498;
                                    *(void *)&uint8_t buf[4] = a4;
                                    *(_WORD *)&buf[12] = 2112;
                                    *(void *)&buf[14] = v276;
                                    *(_WORD *)&buf[22] = 2112;
                                    *(void *)&buf[24] = v273;
                                    _os_log_debug_impl(&dword_181761000, v277, OS_LOG_TYPE_DEBUG, " -- Trying to match by targetFileID from documentID, options=%#lx fileID=%@ on volume %@", buf, 0x20u);
                                  }
                                  if (!matchURLToBookmark(v314, 1u, (const __CFURL *)v186, (BOOL *)&v322, v278) && v186)
                                  {
                                    CFRelease(v186);
                                    CFTypeRef v186 = 0;
                                  }
                                  CFRelease(v276);
                                  a6 = v308;
                                  a1 = v312;
                                  LODWORD(v10) = v313;
LABEL_586:
                                  if (userInfoValues) {
                                    CFRelease(userInfoValues);
                                  }
LABEL_588:
                                  CFRelease(v273);
LABEL_589:
                                  CFRelease(v271);
LABEL_590:
                                  if (v324 != v186)
                                  {
                                    if (v324) {
                                      CFRelease(v324);
                                    }
                                    CFTypeRef v324 = v186;
                                  }
                                  goto LABEL_382;
                                }
                              }
                            }
                          }
LABEL_585:
                          CFTypeRef v186 = 0;
                          goto LABEL_586;
                        }
                      }
                      CFTypeRef v186 = 0;
                      goto LABEL_588;
                    }
                  }
                  if (v167) {
                    goto LABEL_608;
                  }
LABEL_605:
                  int v98 = 0;
                  LODWORD(v10) = v313;
                  if (Mutable) {
                    goto LABEL_477;
                  }
                  goto LABEL_478;
                }
                CFTypeRef v73 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E4F1D148], 4, 0);
                CFTypeRef v323 = v73;
              }
              a6 = v308;
              if (!v73
                || (CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)v73), !CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E4F1D158]))
                || CFErrorGetCode((CFErrorRef)v323) != -128)
              {
                BOOL v74 = 0;
                goto LABEL_203;
              }
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                CFURLCreateByResolvingDataInBookmark();
              }
              CFIndex v17 = 0;
              int v98 = 0;
              if (Mutable) {
                goto LABEL_477;
              }
              goto LABEL_478;
            }
            if (v43) {
              goto LABEL_69;
            }
          }
LABEL_70:
          CFArrayRef Mutable = theArray;
          CFArrayAppendValue(theArray, anURL);
        }
      }
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v39;
    _os_log_debug_impl(&dword_181761000, v41, OS_LOG_TYPE_DEBUG, "Checking volume for match to bookmark, volumeURL=%@", buf, 0xCu);
    if (!v16) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  CFIndex v17 = 0;
LABEL_480:
  uint64_t ItemInTOC = BookmarkData::findItemInTOC(v11, 0x1003u, v10);
  if (ItemInTOC)
  {
    uint64_t v231 = ItemInTOC;
    CFTypeID v232 = CFStringGetTypeID();
    CFStringRef v233 = (const __CFString *)BookmarkData::copyItem(v11, v231, v232);
    if (v233)
    {
      CFStringRef v234 = v233;
      CFURLRef v235 = CFURLCreateWithString(a1, v233, 0);
      if (v324 != v235)
      {
        if (v324) {
          CFRelease(v324);
        }
        CFTypeRef v324 = v235;
      }
      CFRelease(v234);
    }
  }
  if (v324)
  {
LABEL_488:
    CFTypeID v236 = CFBooleanGetTypeID();
    v237 = BookmarkData::copyItem(v11, 0xD001u, v10, v236);
    if (v237)
    {
      v238 = v237;
      if (CFEqual(v237, (CFTypeRef)*MEMORY[0x1E4F1CFD0]))
      {
        CFURLRef v239 = (const __CFURL *)v324;
        if (v323)
        {
          CFRelease(v323);
          CFTypeRef v323 = 0;
        }
        *(void *)buf = CFURLCreateFileReferenceURL(a1, v239, (CFErrorRef *)&v323);
        CFReleaser<__CFData const*>::operator=(&v324, (CFTypeRef *)buf);
        if (*(void *)buf) {
          CFRelease(*(CFTypeRef *)buf);
        }
      }
      CFRelease(v238);
    }
  }
LABEL_495:
  CFTypeRef v240 = v324;
  if (!a6 || v324)
  {
    if (a5 && v324)
    {
      *(unsigned char *)a5 = v322;
      goto LABEL_504;
    }
  }
  else
  {
    CFTypeRef v241 = v323;
    CFTypeRef v323 = 0;
    *(void *)a6 = v241;
  }
  if (a7 && !v240)
  {
    *a7 = v17;
    CFIndex v17 = 0;
  }
LABEL_504:
  CFTypeRef v324 = 0;
  if (v323) {
    CFRelease(v323);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v324) {
    CFRelease(v324);
  }
  return v240;
}

uint64_t _URLEnumeratorGetNextURL(uint64_t a1, void *a2, CFErrorRef *a3)
{
  if (*(unsigned char *)(a1 + 120)) {
    goto LABEL_2;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  *(void *)(a1 + 104) = 0;
  uint64_t v8 = *(const void **)(a1 + 112);
  if (v7)
  {
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a1 + 112) = 0;
    }
    if (!*(void *)(a1 + 160)) {
      _InitalizeDirectoryEnumerator(a1);
    }
    if (*(unsigned char *)(a1 + 120))
    {
      *(void *)(a1 + 56) = 0;
      if (!a3) {
        return 3;
      }
      uint64_t v9 = *(__CFError **)(a1 + 112);
      if (!v9)
      {
LABEL_38:
        *a3 = v9;
        if (!v9)
        {
LABEL_39:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            _URLEnumeratorGetNextURL_cold_1();
          }
          *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
        }
        return 3;
      }
    }
    else
    {
      while (1)
      {
        uint64_t v10 = *(void *)(a1 + 88);
        if (v10 < *(void *)(a1 + 80))
        {
          if (*(unsigned char *)(a1 + v10 + 488)) {
            uint64_t result = 4;
          }
          else {
            uint64_t result = 1;
          }
          if (a2)
          {
            uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8 * v10);
            *(void *)(a1 + 104) = v11;
            *a2 = v11;
            *(void *)(a1 + 56) = *(void *)(a1 + 8 * v10 + 168);
          }
          *(void *)(a1 + 88) = v10 + 1;
          return result;
        }
        uint64_t v9 = *(__CFError **)(a1 + 96);
        if (v9) {
          break;
        }
        if (!_GetDirectoryURLs(a1)) {
          goto LABEL_2;
        }
      }
      *(void *)(a1 + 112) = v9;
      *(void *)(a1 + 56) = *(void *)(a1 + 528);
      *(void *)(a1 + 96) = 0;
      if (!a3) {
        return 3;
      }
    }
    uint64_t v9 = (__CFError *)CFRetain(v9);
    goto LABEL_38;
  }
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 112) = 0;
  }
  if (!*(void *)(a1 + 72)) {
    _InitalizeVolumeEnumerator(a1);
  }
  if (*(unsigned char *)(a1 + 120) || (uint64_t v13 = *(void *)(a1 + 72)) == 0)
  {
    if (!a3) {
      return 3;
    }
    uint64_t v12 = *(void **)(a1 + 112);
    if (v12) {
      uint64_t v12 = (void *)CFRetain(v12);
    }
    *a3 = (CFErrorRef)v12;
    *(void *)(a1 + 56) = 0;
    if (v12) {
      return 3;
    }
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)(a1 + 88);
  if (v14 >= *(void *)(a1 + 80))
  {
LABEL_2:
    *(void *)(a1 + 56) = 0;
    return 2;
  }
  *(void *)(a1 + 56) = 1;
  if (a2)
  {
    uint64_t v15 = *(void *)(v13 + 8 * v14);
    *(void *)(a1 + 104) = v15;
    *a2 = v15;
  }
  *(void *)(a1 + 88) = v14 + 1;
  return 1;
}

CFErrorRef _InitalizeDirectoryEnumerator(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(v1 + 152) = _CFGetEUID();
  uint64_t v2 = CFAllocatorAllocate(*(CFAllocatorRef *)(v1 + 16), 320, 0);
  *(void *)(v1 + 72) = v2;
  if (!v2)
  {
    CFAllocatorRef v4 = *(const __CFAllocator **)(v1 + 16);
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D160];
    uint64_t v7 = 12;
    CFStringRef v6 = 0;
    goto LABEL_11;
  }
  v2[18] = 0u;
  v2[19] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  *uint64_t v2 = 0u;
  v2[1] = 0u;
  if (!CFURLGetFileSystemRepresentation(*(CFURLRef *)(v1 + 48), 1u, buffer, 1024))
  {
    CFAllocatorRef v4 = *(const __CFAllocator **)(v1 + 16);
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D160];
    CFStringRef v6 = *(const __CFString **)(v1 + 48);
    uint64_t v7 = 63;
    goto LABEL_11;
  }
  long long v41 = xmmword_18179134C;
  uint64_t v42 = 0;
  if (filtered_getattrlist((char *)buffer, &v41, v43, 0x428uLL, 0x29u))
  {
    __dst[0] = 0;
    int v3 = *__error();
    if (!v3)
    {
LABEL_5:
      CFAllocatorRef v4 = *(const __CFAllocator **)(v1 + 16);
      CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D160];
      CFStringRef v6 = *(const __CFString **)(v1 + 48);
      uint64_t v7 = 20;
LABEL_11:
      CFErrorRef result = _FSURLCreateStandardError(v4, v5, v7, 0, v6, 0);
      goto LABEL_12;
    }
LABEL_10:
    CFAllocatorRef v4 = *(const __CFAllocator **)(v1 + 16);
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D160];
    uint64_t v7 = v3;
    CFStringRef v6 = *(const __CFString **)(v1 + 48);
    goto LABEL_11;
  }
  if ((v44 & 8) == 0)
  {
    __dst[0] = 0;
    int v3 = 22;
    goto LABEL_10;
  }
  int v9 = v46;
  int v10 = v45;
  BOOL v11 = v46 == 2;
  strlcpy((char *)__dst, (const char *)v47 + v47[0], 0x400uLL);
  if (v9 == 5)
  {
    CFAllocatorRef v12 = *(const __CFAllocator **)(v1 + 16);
    CFURLRef v13 = *(const __CFURL **)(v1 + 48);
    CFURLRef v14 = CFURLCreateWithFileSystemPath(v12, @"/private/", kCFURLPOSIXPathStyle, 1u);
    if (!v14) {
      goto LABEL_5;
    }
    CFURLRef v15 = v14;
    CFTypeRef propertyValueTypeRefPtr = 0;
    CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F1D608];
    if (CFURLCopyResourcePropertyForKey(v14, (CFStringRef)*MEMORY[0x1E4F1D608], &propertyValueTypeRefPtr, 0)
      && propertyValueTypeRefPtr)
    {
      if (CFURLGetFileSystemRepresentation(v13, 1u, v43, 1024)
        && (size_t v17 = strlen((const char *)v43), (v18 = CFURLCreateFromFileSystemRepresentation(v12, v43, v17, 0)) != 0))
      {
        CFURLRef v19 = v18;
        ssize_t v20 = readlink((const char *)v43, (char *)&v41, 0x400uLL);
        if (v20 < 0 || (CFURLRef v21 = (const __CFURL *)MEMORY[0x1853003B0](v12, &v41, v20, 0, v19)) == 0)
        {
          CFURLRef v23 = 0;
        }
        else
        {
          CFURLRef v22 = v21;
          CFURLRef url = 0;
          CFURLRef v23 = 0;
          if (CFURLCopyResourcePropertyForKey(v21, (CFStringRef)*MEMORY[0x1E4F1D740], &url, 0) && url)
          {
            CFTypeRef cf1 = 0;
            CFURLRef v23 = 0;
            if (CFURLCopyResourcePropertyForKey(url, v16, &cf1, 0) && cf1)
            {
              if (CFEqual(cf1, propertyValueTypeRefPtr)) {
                CFURLRef v23 = CFURLCopyAbsoluteURL(v22);
              }
              else {
                CFURLRef v23 = 0;
              }
              CFRelease(cf1);
            }
            CFRelease(url);
          }
          CFRelease(v22);
        }
        CFRelease(v19);
      }
      else
      {
        CFURLRef v23 = 0;
      }
      CFRelease(propertyValueTypeRefPtr);
      CFRelease(v15);
      if (!v23) {
        goto LABEL_5;
      }
      if (CFURLGetFileSystemRepresentation(v23, 1u, buffer, 1024))
      {
        long long v41 = xmmword_18179134C;
        uint64_t v42 = 0;
        if (filtered_getattrlist((char *)buffer, &v41, v43, 0x428uLL, 0x29u))
        {
          __dst[0] = 0;
          if (!*__error())
          {
            BOOL v11 = 0;
            int v10 = 0;
LABEL_47:
            CFRelease(*(CFTypeRef *)(v1 + 48));
            *(void *)(v1 + 48) = v23;
            goto LABEL_48;
          }
        }
        else
        {
          if ((v44 & 8) != 0)
          {
            int v10 = v45;
            BOOL v11 = v46 == 2;
            strlcpy((char *)__dst, (const char *)v47 + v47[0], 0x400uLL);
            goto LABEL_47;
          }
          __dst[0] = 0;
        }
      }
      CFURLRef v24 = v23;
    }
    else
    {
      CFURLRef v24 = v15;
    }
    CFRelease(v24);
    goto LABEL_5;
  }
LABEL_48:
  if (!v11) {
    goto LABEL_5;
  }
  if (!v10)
  {
    CFAllocatorRef v4 = *(const __CFAllocator **)(v1 + 16);
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D160];
    CFStringRef v6 = *(const __CFString **)(v1 + 48);
    uint64_t v7 = 2;
    goto LABEL_11;
  }
  *(_WORD *)(v1 + 128) = 5;
  *(void *)(v1 + 138) = 0;
  *(void *)(v1 + 130) = 0;
  *(void *)(v1 + 144) = 0;
  *(unsigned char *)(v1 + 121) = _FSURLGetAttrListForPropertyKeys(0, *(CFArrayRef *)(v1 + 40), v1 + 128, (__CFArray **)(v1 + 64), (Boolean *)(v1 + 122));
  int v25 = *(_DWORD *)(v1 + 132);
  *(_DWORD *)(v1 + 132) = v25 & 0xF7FFFFFF;
  CFArrayRef v26 = *(const __CFArray **)(v1 + 64);
  if (v26)
  {
    v49.length = CFArrayGetCount(*(CFArrayRef *)(v1 + 64));
    v49.location = 0;
    BOOL v27 = CFArrayContainsValue(v26, v49, (const void *)*MEMORY[0x1E4F1D748]) != 0;
  }
  else
  {
    BOOL v27 = 0;
  }
  *(unsigned char *)(v1 + 123) = v27;
  if ((v25 & 0x8000000) != 0)
  {
    BOOL v29 = 1;
  }
  else
  {
    CFArrayRef v28 = *(const __CFArray **)(v1 + 40);
    if (v28)
    {
      v50.length = CFArrayGetCount(*(CFArrayRef *)(v1 + 40));
      v50.location = 0;
      BOOL v29 = CFArrayContainsValue(v28, v50, (const void *)*MEMORY[0x1E4F1D588]) != 0;
    }
    else
    {
      BOOL v29 = 0;
    }
  }
  *(unsigned char *)(v1 + 124) = v29;
  if ((*(unsigned char *)(v1 + 32) & 0x40) != 0)
  {
    size_t v30 = strlen((const char *)__dst);
    *(void *)(v1 + 544) = v30;
    *(void *)(v1 + 536) = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(v1 + 16), __dst, v30, 1u);
    uint64_t v31 = *(void *)(v1 + 544);
    if (__dst[v31 - 1] != 47) {
      *(void *)(v1 + 544) = v31 + 1;
    }
  }
  if (*(unsigned char *)(v1 + 121)) {
    CFURLRef v32 = (long long *)(v1 + 128);
  }
  else {
    CFURLRef v32 = 0;
  }
  uint64_t v33 = DirEnumOpen((const char *)__dst, v32);
  *(void *)(v1 + 160) = v33;
  if (!v33)
  {
    CFAllocatorRef v34 = *(const __CFAllocator **)(v1 + 16);
    BOOL v35 = __error();
    CFErrorRef result = _CFErrorWithPOSIXPathAndErrno(v34, *v35, (const char *)__dst);
LABEL_12:
    *(void *)(v1 + 112) = result;
    if (!result) {
      return result;
    }
    goto LABEL_13;
  }
  CFErrorRef result = *(CFErrorRef *)(v1 + 112);
  if (result) {
LABEL_13:
  }
    *(unsigned char *)(v1 + 120) = 1;
  return result;
}

BOOL _FSURLResourceIsReachable(const __CFString *a1, CFErrorRef *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (!a2) {
      return 0;
    }
    CFErrorRef v7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 4, 0);
    goto LABEL_11;
  }
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, buffer, 1024))
  {
    if (!a2) {
      return 0;
    }
    CFAllocatorRef v8 = CFGetAllocator(a1);
    CFErrorRef v7 = _FSURLCreateStandardError(v8, (const __CFString *)*MEMORY[0x1E4F1D148], 4, 0, a1, 0);
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  if (faccessat(-2, (const char *)buffer, 0, 48))
  {
    if (*__error() == 22)
    {
      int v4 = lstat((const char *)buffer, &v12);
      BOOL v5 = v4 != 0;
      BOOL v6 = v4 == 0;
      if (!a2)
      {
LABEL_18:
        if (!a2) {
          return v6;
        }
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v6 = 0;
      BOOL v5 = 1;
      if (!a2) {
        goto LABEL_18;
      }
    }
    if (!v5) {
      goto LABEL_18;
    }
    uint64_t v9 = *__error();
    CFAllocatorRef v10 = CFGetAllocator(a1);
    CFErrorRef v7 = _FSURLCreateStandardError(v10, (const __CFString *)*MEMORY[0x1E4F1D160], v9, 0, a1, 0);
LABEL_17:
    *a2 = v7;
    goto LABEL_18;
  }
  BOOL v6 = 1;
  if (!a2) {
    return v6;
  }
LABEL_19:
  if (!v6)
  {
    if (*a2) {
      return 0;
    }
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLResourceIsReachable_cold_1();
    }
    BOOL v6 = 0;
    *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
  return v6;
}

CFErrorRef _FSURLCreateStandardError(const __CFAllocator *a1, const __CFString *a2, uint64_t a3, int a4, const __CFString *cf, void *a6)
{
  CFStringRef v7 = cf;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!cf)
  {
    CFURLRef v13 = 0;
    goto LABEL_10;
  }
  CFTypeID v12 = CFGetTypeID(cf);
  if (v12 == CFURLGetTypeID())
  {
    CFURLRef v13 = (const __CFURL *)CFRetain(v7);
    CFURLRef v14 = CFURLCopyAbsoluteURL(v13);
    if (v14)
    {
      CFURLRef v15 = v14;
      CFStringRef v7 = CFURLCopyFileSystemPath(v14, kCFURLPOSIXPathStyle);
      CFRelease(v15);
      goto LABEL_10;
    }
  }
  else
  {
    if (v12 == CFStringGetTypeID())
    {
      CFStringRef v7 = (const __CFString *)CFRetain(v7);
      CFAllocatorRef v16 = CFGetAllocator(v7);
      Boolean HasSuffix = CFStringHasSuffix(v7, @"/");
      CFURLRef v13 = CFURLCreateWithFileSystemPath(v16, v7, kCFURLPOSIXPathStyle, HasSuffix);
      goto LABEL_10;
    }
    CFURLRef v13 = 0;
  }
  CFStringRef v7 = 0;
LABEL_10:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  *(_OWORD *)userInfoKeys = 0u;
  *(_OWORD *)userInfoValues = 0u;
  long long v25 = 0u;
  CFIndex code = 0;
  _FSURLTranslateDomainAndCodeToCocoaError(a2, a3, a4, &code);
  CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F1D148];
  if ((const __CFString *)*MEMORY[0x1E4F1D148] == a2)
  {
    CFErrorRef v19 = 0;
    if (v13)
    {
LABEL_12:
      userInfoKeys[0] = *(void **)MEMORY[0x1E4F1D188];
      userInfoValues[0] = v13;
      CFIndex v20 = 1;
      if (!v7) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else
  {
    CFErrorRef v19 = CFErrorCreate(a1, a2, a3, 0);
    if (v13) {
      goto LABEL_12;
    }
  }
  CFIndex v20 = 0;
  if (v7)
  {
LABEL_13:
    *(void *)((unint64_t)userInfoKeys | (8 * v20)) = *MEMORY[0x1E4F1D168];
    *(void *)((unint64_t)userInfoValues & 0xFFFFFFFFFFFFFFF7 | (8 * (v20++ & 1))) = v7;
  }
LABEL_14:
  if (a6)
  {
    userInfoKeys[v20] = @"NSURLKeys";
    userInfoValues[v20++] = a6;
  }
  if (v19)
  {
    userInfoKeys[v20] = (void *)*MEMORY[0x1E4F1D190];
    userInfoValues[v20++] = v19;
  }
  CFErrorRef v21 = CFErrorCreateWithUserInfoKeysAndValues(a1, v18, code, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, v20);
  if (v13) {
    CFRelease(v13);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCreateStandardError_cold_1();
    }
    return CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v18, 256, 0);
  }
  return v21;
}

uint64_t _FSURLTranslateDomainAndCodeToCocoaError(const void *a1, uint64_t a2, int a3, uint64_t *a4)
{
  CFStringRef v7 = a1;
  uint64_t result = CFEqual(a1, (CFTypeRef)*MEMORY[0x1E4F1D148]);
  if (!result)
  {
    if (CFEqual(v7, (CFTypeRef)*MEMORY[0x1E4F1D158]))
    {
      if ((int)a2 > -62)
      {
        switch((int)a2)
        {
          case -54:
            a2 = 1;
            goto LABEL_39;
          case -53:
          case -52:
          case -49:
          case -47:
          case -46:
          case -45:
          case -44:
          case -41:
          case -40:
          case -39:
          case -38:
            goto LABEL_25;
          case -51:
            a2 = 9;
            goto LABEL_39;
          case -50:
            a2 = 22;
            goto LABEL_39;
          case -48:
            a2 = 17;
            goto LABEL_39;
          case -43:
            goto LABEL_21;
          case -42:
            a2 = 24;
            goto LABEL_39;
          case -37:
            a2 = 63;
            goto LABEL_39;
          case -36:
            a2 = 5;
            goto LABEL_39;
          case -35:
            a2 = 6;
            goto LABEL_39;
          case -34:
            a2 = 28;
            goto LABEL_39;
          default:
            if (a2 == -61)
            {
              a2 = 30;
            }
            else
            {
              if (a2) {
                goto LABEL_25;
              }
              a2 = 0;
            }
            break;
        }
        goto LABEL_39;
      }
      if ((int)a2 > -1310)
      {
        if ((int)a2 > -129)
        {
          if (a2 == -128)
          {
            a2 = 89;
            goto LABEL_39;
          }
          if (a2 == -120)
          {
LABEL_21:
            a2 = 2;
            goto LABEL_39;
          }
        }
        else
        {
          if (a2 == -1309)
          {
            a2 = 27;
            goto LABEL_39;
          }
          if (a2 == -1303)
          {
            a2 = 18;
            goto LABEL_39;
          }
        }
      }
      else if ((int)a2 > -1426)
      {
        if (a2 == -1425)
        {
          a2 = 69;
          goto LABEL_39;
        }
        if (a2 == -1407)
        {
          a2 = 20;
          goto LABEL_39;
        }
      }
      else
      {
        if (a2 == -5023)
        {
          a2 = 80;
          goto LABEL_39;
        }
        if (a2 == -5000)
        {
          a2 = 13;
LABEL_39:
          uint64_t v9 = (const void *)*MEMORY[0x1E4F1D160];
          CFStringRef v7 = (const void *)*MEMORY[0x1E4F1D160];
LABEL_40:
          uint64_t result = CFEqual(v7, v9);
          if (!result)
          {
            if (a3) {
              a2 = 512;
            }
            else {
              a2 = 256;
            }
            goto LABEL_2;
          }
          if (a3)
          {
            if (a2 > 27)
            {
              if (a2 > 62)
              {
                if (a2 == 63)
                {
                  a2 = 514;
                  goto LABEL_2;
                }
                if (a2 != 69) {
                  goto LABEL_68;
                }
              }
              else if (a2 != 28)
              {
                if (a2 == 30)
                {
                  a2 = 642;
                  goto LABEL_2;
                }
LABEL_68:
                a2 = 512;
                goto LABEL_2;
              }
              a2 = 640;
              goto LABEL_2;
            }
            switch(a2)
            {
              case 1:
                goto LABEL_58;
              case 2:
                a2 = 4;
                goto LABEL_2;
              case 13:
LABEL_58:
                a2 = 513;
                goto LABEL_2;
            }
            goto LABEL_68;
          }
          if (a2 <= 12)
          {
            if (a2 != 1)
            {
              if (a2 == 2)
              {
                a2 = 260;
                goto LABEL_2;
              }
              goto LABEL_70;
            }
          }
          else if (a2 != 13)
          {
            if (a2 == 27)
            {
              a2 = 263;
              goto LABEL_2;
            }
            if (a2 == 63)
            {
              a2 = 258;
              goto LABEL_2;
            }
LABEL_70:
            a2 = 256;
            goto LABEL_2;
          }
          a2 = 257;
          goto LABEL_2;
        }
      }
    }
LABEL_25:
    uint64_t v9 = (const void *)*MEMORY[0x1E4F1D160];
    goto LABEL_40;
  }
LABEL_2:
  *a4 = a2;
  return result;
}

uint64_t DirEnumOpen(const char *a1, long long *a2)
{
  size_t v3 = strlen(a1);
  int v4 = malloc_type_calloc(1uLL, 0x748uLL, 0x10A0040CD28BF90uLL);
  if (!v4)
  {
    int v30 = *__error();
LABEL_124:
    uint64_t v5 = 0;
    *__error() = v30;
    return v5;
  }
  uint64_t v5 = (uint64_t)v4;
  if ((unint64_t)__strlcpy_chk() > 0x6FC)
  {
    int v30 = 63;
LABEL_123:
    free((void *)v5);
    goto LABEL_124;
  }
  unsigned int v6 = -1610350579;
  if (a2)
  {
    long long v7 = *a2;
    *(void *)(v5 + 1812) = *((void *)a2 + 2);
    *(_OWORD *)(v5 + 1796) = v7;
    unsigned int v6 = *(_DWORD *)(v5 + 1800) | 0xA004000D;
    *(_DWORD *)(v5 + 1800) = v6;
    *(_DWORD *)(v5 + 1808) |= 4u;
  }
  else
  {
    *(_DWORD *)(v5 + 1796) = 5;
    *(_OWORD *)(v5 + 1800) = xmmword_181791390;
    *(_DWORD *)(v5 + 1816) = 0;
  }
  uint64_t v8 = 794;
  if ((v6 & 2) == 0) {
    uint64_t v8 = 790;
  }
  if ((v6 & 0x10) != 0) {
    v8 += 4;
  }
  if ((v6 & 0x20) != 0) {
    v8 += 8;
  }
  if ((v6 & 0x40) != 0) {
    v8 += 8;
  }
  if ((v6 & 0x80) != 0) {
    v8 += 8;
  }
  if ((v6 & 0x100) != 0) {
    v8 += 4;
  }
  if ((v6 & 0x200) != 0) {
    v8 += 16;
  }
  if ((v6 & 0x400) != 0) {
    v8 += 16;
  }
  if ((v6 & 0x800) != 0) {
    v8 += 16;
  }
  if ((v6 & 0x1000) != 0) {
    v8 += 16;
  }
  if ((v6 & 0x2000) != 0) {
    v8 += 16;
  }
  if ((v6 & 0x4000) != 0) {
    v8 += 32;
  }
  if ((v6 & 0x8000) != 0) {
    v8 += 4;
  }
  if ((v6 & 0x10000) != 0) {
    v8 += 4;
  }
  if ((v6 & 0x20000) != 0) {
    v8 += 4;
  }
  uint64_t v9 = 8;
  if ((v6 & 0x80000) != 0) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 4;
  }
  uint64_t v11 = v8 + v10;
  if ((v6 & 0x100000) != 0) {
    v11 += 4;
  }
  if ((v6 & 0x200000) != 0) {
    v11 += 4;
  }
  if ((v6 & 0x400000) != 0) {
    v11 += 264;
  }
  if ((v6 & 0x800000) != 0) {
    v11 += 16;
  }
  if ((v6 & 0x1000000) != 0) {
    v11 += 16;
  }
  if ((v6 & 0x2000000) != 0) {
    v11 += 8;
  }
  if ((v6 & 0x4000000) != 0) {
    v11 += 8;
  }
  if ((v6 & 0x8000000) != 0) {
    v11 += 1032;
  }
  if ((v6 & 0x10000000) != 0) {
    v11 += 16;
  }
  if ((v6 & 0x40000000) == 0) {
    uint64_t v9 = 4;
  }
  int v12 = *(_DWORD *)(v5 + 1808);
  if (v12)
  {
    uint64_t v13 = 4 * (v12 & 1);
    if ((v12 & 2) != 0) {
      v13 += 4;
    }
    if ((v12 & 4) != 0) {
      v13 += 4;
    }
    if ((v12 & 8) != 0) {
      v13 += 8;
    }
    if ((v12 & 0x10) != 0) {
      v13 += 4;
    }
    if ((v12 & 0x20) != 0) {
      unint64_t v14 = v13 + 8;
    }
    else {
      unint64_t v14 = v13;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v15 = v11 + v9;
  int v16 = *(_DWORD *)(v5 + 1812);
  if (v16)
  {
    uint64_t v17 = 4 * (v16 & 3);
    if ((v16 & 4) != 0) {
      v17 += 8;
    }
    if ((v16 & 8) != 0) {
      v17 += 4;
    }
    if ((v16 & 0x20) != 0) {
      v17 += 4;
    }
    if ((v16 & 0x80) != 0) {
      v17 += 4;
    }
    if ((v16 & 0x100) != 0) {
      v17 += 8;
    }
    if ((v16 & 0x200) != 0) {
      v17 += 8;
    }
    if ((v16 & 0x400) != 0) {
      v17 += 8;
    }
    if ((v16 & 0x1000) != 0) {
      v17 += 8;
    }
    if ((v16 & 0x2000) != 0) {
      unint64_t v18 = v17 + 8;
    }
    else {
      unint64_t v18 = v17;
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  uint64_t v19 = v15 + 20;
  int v20 = *(_DWORD *)(v5 + 1816);
  if (v20)
  {
    uint64_t v21 = (2 * v20) & 8;
    if ((v20 & 8) != 0) {
      v21 += 8;
    }
    if ((v20 & 0x10) != 0) {
      uint64_t v22 = v21 + 8;
    }
    else {
      uint64_t v22 = v21;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  if (v14 <= v18) {
    unint64_t v14 = v18;
  }
  *(void *)(v5 + 1824) = v14 + v19 + v22;
  *(unsigned char *)(v5 + 1833) = 0;
  *(_OWORD *)(v5 + 1848) = 0u;
  CFURLRef v23 = DirEnumEntryAllocate(v5);
  if (!v23)
  {
    int v30 = *__error();
    goto LABEL_123;
  }
  CFURLRef v24 = v23;
  *(void *)(v5 + 1840) = v23;
  *((_DWORD *)v23 + 12) = 0;
  *((unsigned char *)v23 + 52) &= ~1u;
  long long v25 = DirEnumEntryAllocate(v5);
  if (!v25)
  {
    int v30 = *__error();
LABEL_122:
    free(*(void **)(v5 + 1840));
    goto LABEL_123;
  }
  long long v26 = v25;
  *CFURLRef v24 = v25;
  *(void *)long long v25 = 0;
  *((void *)v25 + 1) = v5;
  *((void *)v25 + 4) = v3;
  BOOL v27 = v25 + 2;
  *((void *)v25 + 2) = v3;
  *((void *)v25 + 5) = 0;
  *((_DWORD *)v25 + 12) = 1;
  *((unsigned char *)v25 + 52) = *((unsigned char *)v25 + 52) & 0xFC | 1;
  long long v28 = malloc_type_malloc(*(void *)(v5 + 1824), 0xADC40DF8uLL);
  *((void *)v26 + 7) = v28;
  if (!v28)
  {
    int v30 = *__error();
LABEL_121:
    free(**(void ***)(v5 + 1840));
    goto LABEL_122;
  }
  if (GetattrlistRetry(*((char **)v26 + 1), (_DWORD *)(v5 + 1796), (void **)v26 + 7, *(void *)(v5 + 1824)))
  {
    int v30 = *__error();
LABEL_120:
    free(*((void **)v26 + 7));
    goto LABEL_121;
  }
  uint64_t v38 = 0;
  if (!ParseAttributes(*((_DWORD **)v26 + 7), (_DWORD *)&v38 + 1, (void *)v26 + 3, v27, (_DWORD *)v26 + 16, &v38, &v37, &v36, &v35))
  {
    int v30 = 22;
    goto LABEL_120;
  }
  if (v38 != 2)
  {
    int v30 = 20;
    goto LABEL_120;
  }
  *(_DWORD *)(v5 + 1792) = *((_DWORD *)v26 + 16);
  uint64_t v34 = 0;
  long long v33 = xmmword_1817913A0;
  memset(v31, 0, sizeof(v31));
  int v32 = 0;
  if (!getattrlist((const char *)v5, &v33, v31, 0x24uLL, 0)) {
    *(unsigned char *)(v5 + 1832) = (WORD4(v31[0]) & 0x4000) != 0;
  }
  *((void *)v26 + 9) = 0;
  return v5;
}

uint64_t GetattrlistRetry(char *a1, _DWORD *a2, void **a3, size_t a4)
{
  uint64_t result = filtered_getattrlist(a1, a2, *a3, a4, 0x25u);
  if (result) {
    return result;
  }
  size_t v9 = *(unsigned int *)*a3;
  if (v9 <= a4) {
    return 0;
  }
  if (v9 > 0x10000)
  {
    syslog(3, "GetattrlistRetry: realloc request too large (%d)", *(_DWORD *)*a3);
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = malloc_type_realloc(*a3, *(unsigned int *)*a3, 0xC3C97953uLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v10;
  return filtered_getattrlist(a1, a2, v10, v9, 0x21u);
}

BOOL matchURLProperty(const __CFURL *a1, const __CFString *a2, CFTypeRef a3)
{
  CFTypeRef propertyValueTypeRefPtr = 0;
  if (!CFURLCopyResourcePropertyForKey(a1, a2, &propertyValueTypeRefPtr, 0)) {
    goto LABEL_8;
  }
  if (propertyValueTypeRefPtr == a3)
  {
    BOOL v4 = 1;
    if (!a3) {
      return v4;
    }
    goto LABEL_10;
  }
  BOOL v4 = 0;
  if (a3 && propertyValueTypeRefPtr)
  {
    CFTypeID v5 = CFGetTypeID(a3);
    if (v5 == CFGetTypeID(propertyValueTypeRefPtr))
    {
      if (v5 == CFURLGetTypeID()) {
        int v6 = sameFileURL(a3, propertyValueTypeRefPtr);
      }
      else {
        int v6 = CFEqual(a3, propertyValueTypeRefPtr);
      }
      BOOL v4 = v6 != 0;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v4 = 0;
  }
LABEL_9:
  a3 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr) {
LABEL_10:
  }
    CFRelease(a3);
  return v4;
}

BOOL matchURLToBookmark(BookmarkData *a1, unsigned int a2, const __CFURL *a3, BOOL *a4, const __CFURL **a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL URLResourceProperties = BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)&v17);
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    matchURLToBookmark();
    if (!a3) {
      return 0;
    }
  }
  else if (!a3)
  {
    return 0;
  }
  propertyValueTypeRefPtr[1] = 0;
  uint64_t v16 = 0;
  int v10 = v18 & 0xF;
  if (!_CFURLCopyResourcePropertyValuesAndFlags()) {
    return 0;
  }
  if (URLResourceProperties)
  {
    if (((v17 ^ v16) & v10) != 0) {
      return 0;
    }
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
      matchURLToBookmark();
    }
  }
  else if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    matchURLToBookmark();
  }
  CFStringRef string = 0;
  propertyValueTypeRefPtr[0] = 0;
  if (!CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x1E4F1D748], propertyValueTypeRefPtr, 0)
    || !CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x1E4F1D588], &string, 0))
  {
    goto LABEL_23;
  }
  CFStringRef v12 = propertyValueTypeRefPtr[0];
  if (!propertyValueTypeRefPtr[0] || !string)
  {
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
      matchURLToBookmark();
    }
LABEL_23:
    int v13 = 1;
    goto LABEL_24;
  }
  if (propertyValueTypeRefPtr[0] == string)
  {
    int v13 = 1;
    goto LABEL_25;
  }
  CFStringGetFileSystemRepresentation(propertyValueTypeRefPtr[0], buffer, 1024);
  CFStringGetFileSystemRepresentation(string, __s2, 1024);
  if (!strcmp(buffer, __s2)) {
    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
    matchURLToBookmark();
  }
  int v13 = 0;
LABEL_24:
  CFStringRef v12 = string;
  if (string) {
LABEL_25:
  }
    CFRelease(v12);
  if (propertyValueTypeRefPtr[0]) {
    CFRelease(propertyValueTypeRefPtr[0]);
  }
  BOOL result = v13 != 0;
  if (a4 && v13)
  {
    if (!*a4) {
      *a4 = fileIDsMatch(a1, a2, a3) == 0;
    }
    return 1;
  }
  return result;
}

BOOL BookmarkData::getURLVolumeProperties(BookmarkData *a1, int a2, uint64_t a3)
{
  MisalignedItemDataPtr = BookmarkData::getMisalignedItemDataPtr(a1, 0x2020u, 0x18u, a2, &v7);
  if (MisalignedItemDataPtr)
  {
    long long v5 = *(_OWORD *)MisalignedItemDataPtr;
    *(void *)(a3 + 16) = *((void *)MisalignedItemDataPtr + 2);
    *(_OWORD *)a3 = v5;
  }
  return MisalignedItemDataPtr != 0;
}

void CFURLCreateByResolvingDataInBookmark()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "-. Constructing array of potential volumes to be considered for items in this bookmark.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "-. Pruning array of potential volumes based on information in the bookmark.", v2, v3, v4, v5, v6);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, "Trying relative to current home directory: %@", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "Checking for home-directory match by relative path for current user ", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "1. Original item was in a home folder, so look for an item in the home directory.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "8. Trying to find target at depth 1 solely by documentID on matched volumes.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_181761000, v0, v1, " -- trying to match by relative path from fileIDsRef=%@ volumeURL=%@");
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "7. Trying to find target by fileID and partial paths, to deal with renamed parent items.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "6. Trying to find target solely by fileID on matched volumes.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_181761000, v0, v1, "5b. Trying to find by partial paths on volume by mount path, partialPath=%@ maybeURL=%@");
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "5. Trying to match by partial path across all of the volumes(in case the volume it was on got renamed.)", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "3. - Trying to match by relative path on current boot volume.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, "3. Original item was on the boot drive, so looking for an item by relative path on the current boot drive.  path=%@", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "2. Bookmark was to a volume, so try to just find a matching volume.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "Checking for home-directory relative match by relative path", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, "Bookmark was to home directory, so trying %@", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, "Trying relative to bookmark user's home directory: %@", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, " -- got userCanceledErr from mount attempt, making further resolution for this bookmark fail.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, " -- Returning volumeURLRef=%@", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, " -- Attempting to find already mounted URLMount volume item, at url %@ which is needed for bookmark resolution.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, " -- Attempting to mount(or find already mounted) possible network filesystem item, at path %@ which is needed for bookmark resolution.", v2, v3, v4, v5, v6);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, "Bookmark was to an item on the boot drive, which appears to match the current boot drive by UUID, so using that volume. uuid=%@", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, "Bookmark was to an item on the boot drive, which does not appear to match the current boot drive by UUID.  Saved uuid=%@", v2, v3, v4, v5, v6);
}

void CFURLCreateByResolvingDataInBookmark(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

{
  OUTLINED_FUNCTION_6(&dword_181761000, a2, a3, "Bookmark was homeDirectoryRelative, depth inside homeDirectory=%u", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_6(&dword_181761000, a2, a3, "-. Resolving url to disk image for volume at depth %u to determine image file to be mounted.", a5, a6, a7, a8, 0);
}

CFErrorRef _InitalizeVolumeEnumerator(uint64_t a1)
{
  uint64_t v4 = 0;
  ptr = 0;
  *(_DWORD *)(a1 + 152) = _CFGetEUID();
  int v2 = CreateMountPointArray(*(const __CFAllocator **)(a1 + 16), *(void *)(a1 + 32), (char **)&ptr, &v4);
  if (v2)
  {
    CFErrorRef result = _FSURLCreateStandardError(*(const __CFAllocator **)(a1 + 16), (const __CFString *)*MEMORY[0x1E4F1D160], v2, 0, 0, 0);
    *(void *)(a1 + 112) = result;
    if (!result) {
      return result;
    }
  }
  else
  {
    _CreateVolumeURLsArray(a1, (char *)ptr, v4);
    CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 16), ptr);
    CFErrorRef result = *(CFErrorRef *)(a1 + 112);
    if (!result) {
      return result;
    }
  }
  *(unsigned char *)(a1 + 120) = 1;
  return result;
}

const void *copyHomeFolderURLForUser(const __CFAllocator *a1, unint64_t a2, const __CFString *a3)
{
  pthread_mutex_lock(&copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sCopyHomeFolderLock);
  if (a1
    || (uint64_t v4 = (const void *)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL) == 0)
  {
    uint64_t v5 = CFCopyHomeDirectoryURLForUser();
    uint64_t v4 = (const void *)v5;
    if (!a1 && v5)
    {
      if (copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL)
      {
        CFRelease((CFTypeRef)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL);
        copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL = 0;
      }
      CFRetain(v4);
      copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL = (uint64_t)v4;
    }
  }
  else
  {
    CFRetain((CFTypeRef)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL);
  }
  pthread_mutex_unlock(&copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sCopyHomeFolderLock);
  return v4;
}

void matchURLToBookmark()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_181761000, v0, v1, "match bookmark, depth=%u matchToURL=%@");
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_181761000, v0, v1, " -- SUCCESS, bookmark, depth=%u is a matchToURL=%@ because the item properties matched those of the original item, and the item exists.");
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, " -- matchURLToBookmark: the path or canonical path is NULL.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, " -- REJECTED: canonical path does not match the path under test.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_181761000, v0, v1, " -- SUCCESS, bookmark, depth=%u is a matchToURL=%@ because the bookmark doesn't contain any properties to match, and the item exists.");
}

BOOL isDirectory(BookmarkData *a1, int a2)
{
  BOOL result = BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v3);
  if (result)
  {
    if ((v3[8] & 2) != 0) {
      return (v3[0] >> 1) & 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

CFArrayRef copyOfArray(const __CFAllocator *a1, CFArrayRef theArray, CFRange a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!theArray) {
    return 0;
  }
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  if (CFArrayGetCount(theArray) >= a3.length)
  {
    CFArrayRef Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
    v13.CFIndex location = location;
    v13.CFIndex length = length;
    CFArrayAppendArray(Mutable, theArray, v13);
    CFArrayRef Copy = CFArrayCreateCopy(a1, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    memset(v10, 0, 512);
    v12.CFIndex location = location;
    v12.CFIndex length = length;
    CFArrayGetValues(theArray, v12, (const void **)v10);
    return CFArrayCreate(a1, (const void **)v10 + location, length, MEMORY[0x1E4F1D510]);
  }
  return Copy;
}

uint64_t CreateMountPointArray(const __CFAllocator *a1, char a2, char **a3, void *a4)
{
  *a4 = 0;
  uint64_t v19 = 0;
  int v8 = getmntinfo_r_np(&v19, 2);
  if (v8 < 1)
  {
    int v10 = 0;
    uint64_t v13 = *__error();
  }
  else
  {
    unsigned int v9 = v8;
    int v10 = (char *)CFAllocatorAllocate(a1, (unint64_t)v8 << 10, 0);
    if (v10)
    {
      unint64_t v11 = 0;
      uint64_t v12 = 2168 * v9;
      do
      {
        if ((a2 & 2) == 0 || (v19[v11 / 0x878].f_flags & 0x500000) == 0)
        {
          long long v15 = xmmword_1817914B8;
          uint64_t v16 = 0;
          memset(v17, 0, sizeof(v17));
          int v18 = 0;
          if (!filtered_getattrlist(v19[v11 / 0x878].f_mntonname, &v15, v17, 0x24uLL, 1u)
            && strlcpy(&v10[1024 * *a4], v19[v11 / 0x878].f_mntonname, 0x400uLL) <= 0x3FF)
          {
            ++*a4;
          }
        }
        v11 += 2168;
      }
      while (v12 != v11);
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = 12;
    }
    free(v19);
  }
  *a3 = v10;
  return v13;
}

uint64_t __filtered_getattrlist_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  size_t v3 = 16;
  uint64_t result = sysctlbyname("kern.osproductversion", &v4, &v3, 0, 0);
  if (!result)
  {
    BOOL v2 = v4 == 825110577 && v5 == 53;
    filtered_getattrlist::isJazz = v2;
  }
  return result;
}

void ___ZL15CreateMountInfoiP12MountInfoBuf_block_invoke()
{
  atomic_store(0, sEntriesChanged);
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  os_log_t v1 = dispatch_queue_create("com.apple.coreservicesinternal.vfs_notifications", v0);
  if (v1)
  {
    CreateMountInfo(int,MountInfoBuf *)::source = (uint64_t)dispatch_source_create(MEMORY[0x1E4F14498], 0, 0x118uLL, v1);
    dispatch_source_set_event_handler((dispatch_source_t)CreateMountInfo(int,MountInfoBuf *)::source, &__block_literal_global_10);
    BOOL v2 = CreateMountInfo(int,MountInfoBuf *)::source;
    dispatch_resume(v2);
  }
}

uint64_t _FSURLCopyResourcePropertyValuesAndFlags(const void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef cf, CFErrorRef *a8)
{
  uint64_t v89 = a2;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  CFTypeRef v92 = a1;
  CFTypeRef v13 = _FileCacheGetForURL((const __CFURL *)a1, cf);
  uint64_t v93 = (uint64_t)v13;
  uint64_t v14 = qword_1EB20DEF8;
  if (_FSURLCopyResourcePropertyValuesAndFlags::sOnce != -1) {
    dispatch_once(&_FSURLCopyResourcePropertyValuesAndFlags::sOnce, &__block_literal_global_3);
  }
  if (_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTableCount) {
    uint64_t v15 = 31;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v80 - v18;
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  MEMORY[0x1F4188790](v21);
  long long v26 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v27 = 0;
  if (a3 && a4 && a6)
  {
    CFStringRef v85 = a3;
    uint64_t v86 = a4;
    size_t v87 = (uint64_t *)((char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v14 >= 1)
    {
      long long v28 = v23;
      uint64_t v29 = v24;
      uint64_t v30 = v25;
      bzero(v26, v22);
      uint64_t v25 = v30;
      uint64_t v24 = v29;
      long long v26 = (char *)v87;
      CFURLRef v23 = v28;
    }
    uint64_t v31 = _ZZZ40_FSURLCopyResourcePropertyValuesAndFlagsEUb_E8theTable;
    int v32 = (void *)(_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTable + 32);
    uint64_t v33 = v89;
    do
    {
      int v34 = *((_DWORD *)v32 - 6);
      if (v34) {
        uint64_t v35 = a5;
      }
      else {
        uint64_t v35 = v33;
      }
      if ((v35 & v31) != 0)
      {
        uint64_t v36 = *(v32 - 1);
        uint64_t v37 = **(int **)(v36 + 140);
        uint64_t v38 = *(void *)&v26[8 * v37];
        if (v38 <= 95)
        {
          uint64_t v39 = (int)v15 * (uint64_t)(int)v37;
          *(void *)(v24 + 8 * v39 + 8 * v38) = *(void *)(v36 + 8);
          *(void *)&v19[8 * v39 + 8 * v38] = 0;
          *(void *)(v25 + 8 * v39 + 8 * v38) = *(void *)v36;
          if (v34 == 1)
          {
            v23[v39 + v38] = v31;
            *(void *)&v26[8 * v37] = v38 + 1;
          }
        }
      }
      uint64_t v40 = *v32;
      v32 += 4;
      uint64_t v31 = v40;
    }
    while (v40);
    uint64_t v90 = v25;
    uint64_t v91 = v24;
    CFStringRef v84 = v23;
    _FileCacheLock(v93);
    memset(v96, 0, 60);
    uint64_t v41 = _ZZZ40_FSURLCopyResourcePropertyValuesAndFlagsEUb_E8theTable;
    uint64_t v42 = (void *)(_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTable + 32);
    char v44 = v85;
    uint64_t v43 = v86;
    do
    {
      if (*((_DWORD *)v42 - 6)) {
        uint64_t v45 = a5;
      }
      else {
        uint64_t v45 = v33;
      }
      if ((v45 & v41) != 0) {
        addPropertyAndDependenciesToBitmap(*(v42 - 1), (uint64_t)v96);
      }
      uint64_t v46 = *v42;
      v42 += 4;
      uint64_t v41 = v46;
    }
    while (v46);
    uint64_t v47 = v93;
    _FileCacheLockTransitionToPreparer(v93);
    int v27 = prepareValuesForBitmap((uint64_t)v92, v47, (uint64_t)v96, (uint64_t)a8);
    _FileCacheLockTransitionFromPreparer(v47);
    if (v27)
    {
      CFTypeID v83 = a6;
      uint64_t v48 = 8 * v15;
      if (v14 < 1) {
        goto LABEL_34;
      }
      uint64_t v82 = a8;
      uint64_t v49 = 0;
      CFRange v50 = v87;
      uint64_t v81 = v14;
      char v51 = &qword_1EB20DF10;
      uint64_t v88 = 8 * v15;
      do
      {
        uint64_t v53 = *v50++;
        uint64_t v52 = v53;
        if (v53 >= 1)
        {
          CFStringRef v94 = (uint64_t (*)(CFTypeRef, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))*v51;
          BOOL v95 = v50;
          uint64_t v54 = v91 + v49;
          uint64_t v55 = &v19[v49];
          uint64_t v56 = v90 + v49;
          CFURLRef v57 = v19;
          uint64_t v58 = *(v51 - 1);
          uint64_t v59 = v93;
          _FileCacheIncrementInProvider(v93);
          uint64_t v60 = v58;
          uint64_t v19 = v57;
          int v27 = v94(v92, v59, v54, v55, v56, v52, v60);
          uint64_t v61 = v59;
          uint64_t v48 = v88;
          _FileCacheDecrementInProvider(v61);
          CFRange v50 = v95;
        }
        v49 += v48;
        v51 += 7;
        --v14;
      }
      while (v14);
      a8 = v82;
      uint64_t v14 = v81;
      char v44 = v85;
      uint64_t v43 = v86;
      if (v27)
      {
LABEL_34:
        CFTypeID v62 = v83;
        *CFTypeID v83 = 0;
        *char v44 = 0;
        uint64_t Attributes = _FileCacheGetAttributes(v93);
        uint64_t v64 = Attributes;
        if (v89)
        {
          CFAllocatorRef v65 = *(const void **)(Attributes + 8);
          if (v65)
          {
            *(void *)uint64_t v43 = CFRetain(v65);
            *v44 |= 1uLL;
          }
          else
          {
            *(void *)uint64_t v43 = 0;
          }
        }
        if ((v89 & 2) != 0)
        {
          *v44 |= 2uLL;
          *(_DWORD *)(v43 + 8) = *(_DWORD *)(v64 + 24);
        }
        int v66 = v84;
        CFStringRef v67 = (char *)v87;
        if ((v89 & 4) != 0)
        {
          *v44 |= 4uLL;
          unsigned int v68 = *(_DWORD *)(v64 + 112);
          if (v68)
          {
            uint64_t v69 = 0;
          }
          else
          {
            unsigned int v68 = *(_DWORD *)(v64 + 104);
            uint64_t v69 = *(unsigned int *)(v64 + 108);
          }
          *(void *)(v43 + 16) = v68 | (unint64_t)(v69 << 32);
        }
        if ((v89 & 8) != 0)
        {
          *v44 |= 8uLL;
          *(void *)(v43 + 24) = *(void *)(v64 + 120);
        }
        if ((v89 & 0x10) != 0)
        {
          double v70 = *(double *)(v64 + 80);
          if (v70 == -1.0 - *MEMORY[0x1E4F1CF68]) {
            double v70 = -*MEMORY[0x1E4F1CF78];
          }
          else {
            *v44 |= 0x10uLL;
          }
          *(double *)(v43 + 32) = v70;
        }
        if ((v89 & 0x20) != 0)
        {
          *v44 |= 0x20uLL;
          *(void *)(v43 + 40) = *(void *)(v64 + 64);
        }
        if ((v89 & 0x40) != 0)
        {
          *v44 |= 0x40uLL;
          *(void *)(v43 + 48) = *(void *)(v64 + 72);
        }
        if ((v89 & 0x80) != 0)
        {
          *v44 |= 0x80uLL;
          *(void *)(v43 + 56) = *(void *)(v64 + 208);
        }
        if ((v89 & 0x100) != 0)
        {
          *v44 |= 0x100uLL;
          *(void *)(v43 + 64) = *(void *)(v64 + 216);
        }
        if ((v89 & 0x200) != 0)
        {
          *v44 |= 0x200uLL;
          *(void *)(v43 + 72) = *(void *)(v64 + 192);
        }
        if ((v89 & 0x400) != 0)
        {
          *v44 |= 0x400uLL;
          *(void *)(v43 + 80) = *(void *)(v64 + 200);
        }
        if ((v89 & 0x800) != 0)
        {
          CFStringRef v71 = (_OWORD *)(v43 + 88);
          *v44 |= 0x800uLL;
          if ((*(_DWORD *)v64 & 0x4000010) == 0x10)
          {
            *CFStringRef v71 = *(_OWORD *)(v64 + 160);
            *(_OWORD *)(v43 + 104) = *(_OWORD *)(v64 + 176);
          }
          else
          {
            *CFStringRef v71 = 0u;
            *(_OWORD *)(v43 + 104) = 0u;
          }
          if ((*(_DWORD *)(v64 + 16) & 0xF000) == 0xA000)
          {
            *(void *)(v43 + 88) = 0x72686170736C6E6BLL;
            *(_WORD *)(v43 + 96) = *(_WORD *)(v43 + 96) & 0x4000 | 0x8000;
            *(void *)(v43 + 104) = 0;
            *(void *)(v43 + 112) = 0;
          }
        }
        if ((v89 & 0x1000) != 0)
        {
          if ((*(unsigned char *)v64 & 0x80) != 0)
          {
            *v44 |= 0x1000uLL;
            CFAllocatorRef v73 = CFGetAllocator(v92);
            CFFileSecurityRef Copy = CFFileSecurityCreateCopy(v73, *(CFFileSecurityRef *)(v64 + 224));
            CFStringRef v67 = (char *)v87;
          }
          else
          {
            CFFileSecurityRef Copy = 0;
          }
          *(void *)(v43 + 120) = Copy;
          int v66 = v84;
        }
        if (v14 >= 1)
        {
          uint64_t v74 = 0;
          uint64_t v75 = *MEMORY[0x1E4F1CFD0];
          do
          {
            uint64_t v76 = *(void *)&v67[8 * v74];
            if (v76 >= 1)
            {
              uint64_t v77 = v19;
              uint64_t v78 = v66;
              do
              {
                if (*v77 == v75) {
                  *v62 |= *v78;
                }
                ++v78;
                ++v77;
                --v76;
              }
              while (v76);
            }
            ++v74;
            int v66 = (void *)((char *)v66 + v48);
            v19 += v48;
          }
          while (v74 != v14);
        }
      }
    }
    _FileCacheUnlock(v93);
  }
  if (a8 && !v27 && !*a8)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCopyResourcePropertyValuesAndFlags_cold_1();
    }
    *a8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
  return v27;
}

CFArrayRef copyPathComponentsAsArray(BookmarkData *a1, int a2, unsigned int a3)
{
  unsigned int v6 = countPathComponents(a1, a2);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(*(CFAllocatorRef *)a1, 0, MEMORY[0x1E4F1D510]);
  int v8 = Mutable;
  if (Mutable) {
    BOOL v9 = v6 > a3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    while (1)
    {
      CFNumberRef v11 = copyIndexedPathComponent(a1, a2, a3);
      if (!v11) {
        break;
      }
      CFNumberRef v12 = v11;
      CFArrayAppendValue(v8, v11);
      CFRelease(v12);
      if (++a3 >= v6) {
        goto LABEL_9;
      }
    }
    CFArrayRef Copy = 0;
    goto LABEL_11;
  }
  if (Mutable)
  {
LABEL_9:
    CFArrayRef Copy = CFArrayCreateCopy(*(CFAllocatorRef *)a1, v8);
LABEL_11:
    CFRelease(v8);
    return Copy;
  }
  return 0;
}

__CFString *copyPathComponentsAsString(BookmarkData *a1, int a2, int a3, char a4)
{
  unsigned int v8 = countPathComponents(a1, a2);
  if (v8)
  {
    unsigned int v9 = v8;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex numChars = 0;
    CFMutableStringRef theString = CFStringCreateMutable(v10, 0);
    int v11 = v9 & (a3 >> 31);
    if (v11 + a3 >= v9)
    {
      BOOL v13 = 1;
    }
    else
    {
      CFNumberRef v12 = copyIndexedPathComponent(a1, a2, v11 + a3);
      BOOL v13 = v12 == 0;
      if (v12)
      {
        CFStringRef v14 = (const __CFString *)v12;
        char v15 = a4 ^ 1;
        if (v11 + a3) {
          char v15 = 1;
        }
        unsigned int v16 = v11 + a3 + 1;
        do
        {
          if ((v15 & 1) == 0)
          {
            CFIndex v17 = numChars;
            if (numChars >= 1024)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              CFIndex v17 = 0;
              CFIndex numChars = 0;
            }
            chars[v17] = 47;
            ++numChars;
          }
          CFIndex Length = CFStringGetLength(v14);
          CFIndex v19 = numChars;
          if (Length < 1025)
          {
            CFIndex v20 = Length;
            if (numChars + Length >= 1025)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              CFIndex v19 = 0;
              CFIndex numChars = 0;
            }
            uint64_t v21 = &chars[v19];
            v29.CFIndex location = 0;
            v29.CFIndex length = v20;
            CFStringGetCharacters(v14, v29, v21);
            numChars += v20;
          }
          else
          {
            if (numChars)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              CFIndex numChars = 0;
            }
            CFStringAppend(theString, v14);
          }
          CFRelease(v14);
          if (v16 >= v9) {
            break;
          }
          CFStringRef v14 = (const __CFString *)copyIndexedPathComponent(a1, a2, v16);
          char v15 = 0;
          ++v16;
        }
        while (v14);
      }
    }
    if (BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v25) && (v25[8] & 2) != 0 && (v25[0] & 2) != 0)
    {
      CFIndex v24 = numChars;
      if (numChars >= 1024)
      {
        CFStringAppendCharacters(theString, chars, numChars);
        CFIndex v24 = 0;
        CFIndex numChars = 0;
      }
      chars[v24] = 47;
      CFIndex v23 = numChars + 1;
      CFIndex numChars = v23;
      if (!v23) {
        return theString;
      }
    }
    else
    {
      if (v13)
      {
        uint64_t result = theString;
        if (theString)
        {
          CFRelease(theString);
          return 0;
        }
        return result;
      }
      CFIndex v23 = numChars;
      if (!numChars) {
        return theString;
      }
    }
    CFStringAppendCharacters(theString, chars, v23);
    return theString;
  }
  if (a3) {
    return &stru_1ECA26C08;
  }
  else {
    return @"/";
  }
}

CFNumberRef BookmarkData::copyItem(CFAllocatorRef *a1, unsigned int *a2, uint64_t a3)
{
  v6[0] = 0;
  v6[1] = 0;
  char v5 = v6;
  CFNumberRef v3 = BookmarkData::copyItem(a1, a2, (uint64_t)&v5, a3);
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)&v5, v6[0]);
  return v3;
}

CFNumberRef BookmarkData::copyItem(CFAllocatorRef *a1, unsigned int *a2, uint64_t a3, uint64_t a4)
{
  BOOL v95 = a2;
  if (!a2) {
    return 0;
  }
  unsigned int v8 = *(void **)(a3 + 8);
  if (v8)
  {
    uint64_t v9 = a3 + 8;
    do
    {
      unint64_t v10 = v8[4];
      BOOL v11 = v10 >= (unint64_t)a2;
      if (v10 >= (unint64_t)a2) {
        CFNumberRef v12 = v8;
      }
      else {
        CFNumberRef v12 = v8 + 1;
      }
      if (v11) {
        uint64_t v9 = (uint64_t)v8;
      }
      unsigned int v8 = (void *)*v12;
    }
    while (*v12);
    if (v9 != a3 + 8 && *(void *)(v9 + 32) <= (unint64_t)a2)
    {
      CFIndex v19 = bmarkLog;
      if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
        BookmarkData::copyItem((uint64_t)a2, v19);
      }
      return 0;
    }
  }
  CFNumberRef v13 = 0;
  CFIndex v14 = *a2;
  int v15 = a2[1];
  if (v15 <= 1023)
  {
    switch(v15)
    {
      case 769:
        if (!v14) {
          goto LABEL_95;
        }
        LOBYTE(__p) = *((unsigned char *)a2 + 8);
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberSInt8Type;
        goto LABEL_196;
      case 770:
        if (v14 < 2) {
          goto LABEL_95;
        }
        LOWORD(__p) = *((_WORD *)a2 + 4);
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberSInt16Type;
        goto LABEL_196;
      case 771:
        if (v14 < 4) {
          goto LABEL_95;
        }
        LODWORD(__p) = a2[2];
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberSInt32Type;
        goto LABEL_196;
      case 772:
        if (v14 < 8) {
          goto LABEL_95;
        }
        __p = *((void **)a2 + 1);
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberSInt64Type;
        goto LABEL_196;
      case 773:
        if (v14 < 4) {
          goto LABEL_95;
        }
        LODWORD(__p) = a2[2];
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberFloat32Type;
        goto LABEL_196;
      case 774:
        if (v14 < 8) {
          goto LABEL_95;
        }
        __p = *((void **)a2 + 1);
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberFloat64Type;
        goto LABEL_196;
      case 775:
        if (!v14) {
          goto LABEL_95;
        }
        LOBYTE(__p) = *((unsigned char *)a2 + 8);
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberCharType;
        goto LABEL_196;
      case 776:
        if (v14 < 2) {
          goto LABEL_95;
        }
        LOWORD(__p) = *((_WORD *)a2 + 4);
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberShortType;
        goto LABEL_196;
      case 777:
        if (v14 < 4) {
          goto LABEL_95;
        }
        LODWORD(__p) = a2[2];
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberIntType;
        goto LABEL_196;
      case 778:
        if (v14 == 8)
        {
          uint64_t v40 = (void *)*((void *)a2 + 1);
        }
        else
        {
          if (v14 != 4) {
            return 0;
          }
          uint64_t v40 = (void *)(int)a2[2];
        }
        __p = v40;
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberLongType;
        goto LABEL_196;
      case 779:
        if (v14 < 8) {
          goto LABEL_95;
        }
        __p = *((void **)a2 + 1);
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberLongLongType;
        goto LABEL_196;
      case 780:
        if (v14 < 4) {
          goto LABEL_95;
        }
        LODWORD(__p) = a2[2];
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberFloatType;
        goto LABEL_196;
      case 781:
        if (v14 >= 8)
        {
          __p = *((void **)a2 + 1);
          CFAllocatorRef v16 = *a1;
          CFNumberType v17 = kCFNumberDoubleType;
          goto LABEL_196;
        }
LABEL_95:
        CFNumberRef v13 = 0;
        if (a4) {
          goto LABEL_198;
        }
        return v13;
      case 782:
        if (v14 == 8)
        {
          uint64_t v41 = (void *)*((void *)a2 + 1);
        }
        else
        {
          if (v14 != 4) {
            return 0;
          }
          uint64_t v41 = (void *)(int)a2[2];
        }
        __p = v41;
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberCFIndexType;
        goto LABEL_196;
      case 783:
        if (v14 == 8)
        {
          uint64_t v42 = (void *)*((void *)a2 + 1);
        }
        else
        {
          if (v14 != 4) {
            return 0;
          }
          uint64_t v42 = (void *)(int)a2[2];
        }
        __p = v42;
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberNSIntegerType;
        goto LABEL_196;
      case 784:
        if (v14 == 8)
        {
          __p = *((void **)a2 + 1);
        }
        else
        {
          if (v14 != 4) {
            return 0;
          }
          *(double *)&__p = *((float *)a2 + 2);
        }
        CFAllocatorRef v16 = *a1;
        CFNumberType v17 = kCFNumberCGFloatType;
LABEL_196:
        CFNumberRef v13 = CFNumberCreate(v16, v17, &__p);
        goto LABEL_197;
      default:
        if (v15 == 257)
        {
          CFNumberRef v20 = (const __CFNumber *)CFStringCreateWithBytes(*a1, (const UInt8 *)a2 + 8, v14, 0x8000100u, 0);
        }
        else
        {
          if (v15 != 513) {
            return v13;
          }
          CFNumberRef v20 = CFDataCreate(*a1, (const UInt8 *)a2 + 8, v14);
        }
        break;
    }
LABEL_115:
    CFNumberRef v13 = v20;
    if (!a4) {
      return v13;
    }
    goto LABEL_198;
  }
  if (v15 <= 1792)
  {
    if (v15 > 1280)
    {
      if (v15 != 1281)
      {
        if (v15 != 1537) {
          return v13;
        }
        if (v14 < 4) {
          return 0;
        }
        unsigned int v21 = v14 >> 2;
        *(double *)&__p = 0.0;
        uint64_t v93 = 0;
        CFStringRef v94 = 0;
        std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>((uint64_t **)a3, (unint64_t *)&v95, (uint64_t *)&v95);
        uint64_t v22 = 0;
        if (v21 <= 1) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = v21;
        }
        do
        {
          if (v95)
          {
            if (4 * v22 + 4 <= (unint64_t)*v95)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, v95[v22 + 2]);
              if (DataItemAtOffset)
              {
                uint64_t v25 = BookmarkData::copyItem(a1, DataItemAtOffset, a3, 0);
                if (v25)
                {
                  uint64_t v26 = v25;
                  int v27 = v93;
                  if (v93 >= (uint64_t *)v94)
                  {
                    uint64_t v29 = ((char *)v93 - (unsigned char *)__p) >> 3;
                    if ((unint64_t)(v29 + 1) >> 61) {
LABEL_210:
                    }
                      abort();
                    unint64_t v30 = (v94 - (unsigned char *)__p) >> 2;
                    if (v30 <= v29 + 1) {
                      unint64_t v30 = v29 + 1;
                    }
                    if ((unint64_t)(v94 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v31 = v30;
                    }
                    if (v31) {
                      int v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v94, v31);
                    }
                    else {
                      int v32 = 0;
                    }
                    uint64_t v33 = (uint64_t *)&v32[8 * v29];
                    *uint64_t v33 = v26;
                    long long v28 = v33 + 1;
                    uint64_t v35 = (char *)__p;
                    int v34 = (char *)v93;
                    if (v93 != __p)
                    {
                      do
                      {
                        uint64_t v36 = *((void *)v34 - 1);
                        v34 -= 8;
                        *--uint64_t v33 = v36;
                      }
                      while (v34 != v35);
                      int v34 = (char *)__p;
                    }
                    __p = v33;
                    uint64_t v93 = v28;
                    CFStringRef v94 = &v32[8 * v31];
                    if (v34) {
                      operator delete(v34);
                    }
                  }
                  else
                  {
                    *uint64_t v93 = v25;
                    long long v28 = v27 + 1;
                  }
                  uint64_t v93 = v28;
                }
              }
            }
          }
          ++v22;
        }
        while (v22 != v23);
        std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
        CFNumberRef v13 = CFArrayCreate(*a1, (const void **)__p, ((char *)v93 - (unsigned char *)__p) >> 3, MEMORY[0x1E4F1D510]);
        uint64_t v38 = (CFTypeRef *)__p;
        uint64_t v37 = v93;
        if (__p < v93)
        {
          do
          {
            if (*v38)
            {
              CFRelease(*v38);
              *uint64_t v38 = 0;
              uint64_t v37 = v93;
            }
            ++v38;
          }
          while (v38 < (CFTypeRef *)v37);
          uint64_t v38 = (CFTypeRef *)__p;
        }
        if (v38)
        {
          uint64_t v93 = (uint64_t *)v38;
          uint64_t v39 = v38;
          goto LABEL_186;
        }
        goto LABEL_197;
      }
      uint64_t v18 = (CFNumberRef *)MEMORY[0x1E4F1CFD0];
    }
    else
    {
      if (v15 == 1024)
      {
        if (v14 >= 8)
        {
          CFNumberRef v20 = CFDateCreate(*a1, COERCE_CFABSOLUTETIME(bswap64(*((void *)a2 + 1))));
          goto LABEL_115;
        }
        return 0;
      }
      if (v15 != 1280) {
        return v13;
      }
      uint64_t v18 = (CFNumberRef *)MEMORY[0x1E4F1CFC8];
    }
LABEL_174:
    CFNumberRef v13 = *v18;
    if (!a4) {
      return v13;
    }
    goto LABEL_198;
  }
  if (v15 > 2304)
  {
    if (v15 != 2305)
    {
      if (v15 != 2306)
      {
        if (v15 != 2561) {
          return v13;
        }
        uint64_t v18 = (CFNumberRef *)MEMORY[0x1E4F1D260];
        goto LABEL_174;
      }
      if (v14 >= 8)
      {
        std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>((uint64_t **)a3, (unint64_t *)&v95, (uint64_t *)&v95);
        uint64_t v45 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, a2[2]);
        uint64_t v46 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, a2[3]);
        CFTypeID v47 = CFURLGetTypeID();
        CFURLRef v48 = (const __CFURL *)BookmarkData::copyItem(a1, v45, a3, v47);
        CFTypeID TypeID = CFStringGetTypeID();
        CFStringRef v50 = (const __CFString *)BookmarkData::copyItem(a1, v46, a3, TypeID);
        std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
        if (!v48)
        {
          if (!v50) {
            return 0;
          }
          uint64_t v86 = v50;
          goto LABEL_201;
        }
        if (v50)
        {
          CFNumberRef v13 = CFURLCreateWithString(*a1, v50, v48);
          CFRelease(v50);
        }
        else
        {
          CFNumberRef v13 = 0;
        }
        char v44 = v48;
        goto LABEL_208;
      }
      return 0;
    }
    CFStringRef v43 = CFStringCreateWithBytes(*a1, (const UInt8 *)a2 + 8, v14, 0x8000100u, 0);
    CFNumberRef v13 = CFURLCreateWithString(*a1, v43, 0);
    if (v43)
    {
      char v44 = v43;
LABEL_208:
      CFRelease(v44);
      if (!a4) {
        return v13;
      }
      goto LABEL_198;
    }
LABEL_197:
    if (!a4) {
      return v13;
    }
    goto LABEL_198;
  }
  if (v15 != 1793)
  {
    if (v15 != 2049) {
      return v13;
    }
    if (v14 == 16)
    {
      *(void *)byte7 = *(void *)((char *)a2 + 15);
      CFNumberRef v20 = CFUUIDCreateWithBytes(*a1, *((unsigned char *)a2 + 8), *((unsigned char *)a2 + 9), *((unsigned char *)a2 + 10), *((unsigned char *)a2 + 11), *((unsigned char *)a2 + 12), *((unsigned char *)a2 + 13), *((unsigned char *)a2 + 14), byte7[0], byte7[1], byte7[2], byte7[3], byte7[4], byte7[5], byte7[6], byte7[7], *((unsigned char *)a2 + 23));
      goto LABEL_115;
    }
    return 0;
  }
  if (v14 < 8) {
    return 0;
  }
  unsigned int v51 = v14 >> 3;
  *(double *)&__p = 0.0;
  uint64_t v93 = 0;
  CFStringRef v94 = 0;
  values = 0;
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>((uint64_t **)a3, (unint64_t *)&v95, (uint64_t *)&v95);
  uint64_t v52 = 0;
  if (v51 <= 1) {
    uint64_t v53 = 1;
  }
  else {
    uint64_t v53 = v51;
  }
  do
  {
    uint64_t v54 = v95;
    if (!v95) {
      goto LABEL_167;
    }
    uint64_t v55 = 2 * v52;
    unint64_t v56 = *v95;
    unint64_t v57 = (8 * v52) | 4;
    uint64_t v58 = v57 <= v56 ? BookmarkData::getDataItemAtOffset((BookmarkData *)a1, v95[v55 + 2]) : 0;
    if (v55 * 4 + 8 > v56) {
      goto LABEL_167;
    }
    uint64_t v59 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, *(unsigned int *)((char *)v54 + v57 + 8));
    if (!v58) {
      goto LABEL_167;
    }
    uint64_t v60 = v59;
    if (!v59) {
      goto LABEL_167;
    }
    uint64_t v61 = BookmarkData::copyItem(a1, v58, a3, 0);
    CFTypeID v62 = (void *)BookmarkData::copyItem(a1, v60, a3, 0);
    CFStringRef v63 = v62;
    if (!v61)
    {
      if (!v62) {
        goto LABEL_167;
      }
      goto LABEL_135;
    }
    if (!v62)
    {
      CFTypeID v62 = (void *)v61;
LABEL_135:
      CFRelease(v62);
      goto LABEL_167;
    }
    uint64_t v64 = v93;
    if (v93 >= (uint64_t *)v94)
    {
      uint64_t v66 = ((char *)v93 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v66 + 1) >> 61) {
        goto LABEL_210;
      }
      unint64_t v67 = (v94 - (unsigned char *)__p) >> 2;
      if (v67 <= v66 + 1) {
        unint64_t v67 = v66 + 1;
      }
      if ((unint64_t)(v94 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v68 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v68 = v67;
      }
      if (v68) {
        uint64_t v69 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v94, v68);
      }
      else {
        uint64_t v69 = 0;
      }
      double v70 = (uint64_t *)&v69[8 * v66];
      *double v70 = v61;
      CFAllocatorRef v65 = v70 + 1;
      CFURLRef v72 = (char *)__p;
      CFStringRef v71 = (char *)v93;
      if (v93 != __p)
      {
        do
        {
          uint64_t v73 = *((void *)v71 - 1);
          v71 -= 8;
          *--double v70 = v73;
        }
        while (v71 != v72);
        CFStringRef v71 = (char *)__p;
      }
      __p = v70;
      uint64_t v93 = v65;
      CFStringRef v94 = &v69[8 * v68];
      if (v71) {
        operator delete(v71);
      }
    }
    else
    {
      *uint64_t v93 = v61;
      CFAllocatorRef v65 = v64 + 1;
    }
    uint64_t v93 = v65;
    if (v90 >= v91)
    {
      uint64_t v75 = v90 - values;
      if ((unint64_t)(v75 + 1) >> 61) {
        goto LABEL_210;
      }
      unint64_t v76 = ((char *)v91 - (char *)values) >> 2;
      if (v76 <= v75 + 1) {
        unint64_t v76 = v75 + 1;
      }
      if ((unint64_t)((char *)v91 - (char *)values) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v77 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v77 = v76;
      }
      if (v77) {
        uint64_t v78 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v91, v77);
      }
      else {
        uint64_t v78 = 0;
      }
      uint64_t v79 = (void **)&v78[8 * v75];
      *uint64_t v79 = v63;
      uint64_t v74 = v79 + 1;
      uint64_t v80 = v90;
      if (v90 != values)
      {
        do
        {
          uint64_t v81 = *--v80;
          *--uint64_t v79 = v81;
        }
        while (v80 != values);
        uint64_t v80 = values;
      }
      values = v79;
      uint64_t v91 = (void **)&v78[8 * v77];
      if (v80) {
        operator delete(v80);
      }
    }
    else
    {
      *uint64_t v90 = v63;
      uint64_t v74 = v90 + 1;
    }
    uint64_t v90 = v74;
LABEL_167:
    ++v52;
  }
  while (v52 != v53);
  std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
  CFNumberRef v13 = CFDictionaryCreate(*a1, (const void **)__p, (const void **)values, ((char *)v93 - (unsigned char *)__p) >> 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFTypeID v83 = (CFTypeRef *)__p;
  uint64_t v82 = (CFTypeRef *)v93;
  while (v83 != v82)
  {
    if (*v83)
    {
      CFRelease(*v83);
      *CFTypeID v83 = 0;
      uint64_t v82 = (CFTypeRef *)v93;
    }
    ++v83;
  }
  CFStringRef v85 = (CFTypeRef *)values;
  CFStringRef v84 = (CFTypeRef *)v90;
  if (values != v90)
  {
    do
    {
      if (*v85)
      {
        CFRelease(*v85);
        *CFStringRef v85 = 0;
        CFStringRef v84 = (CFTypeRef *)v90;
      }
      ++v85;
    }
    while (v85 != v84);
    CFStringRef v85 = (CFTypeRef *)values;
  }
  if (v85) {
    operator delete(v85);
  }
  uint64_t v39 = __p;
  if (*(double *)&__p == 0.0) {
    goto LABEL_197;
  }
  uint64_t v93 = (uint64_t *)__p;
LABEL_186:
  operator delete(v39);
  if (a4)
  {
LABEL_198:
    if (!v13 || CFGetTypeID(v13) == a4) {
      return v13;
    }
    uint64_t v86 = v13;
LABEL_201:
    CFRelease(v86);
    return 0;
  }
  return v13;
}

void std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

BOOL BookmarkData::getURLResourceProperties(BookmarkData *a1, int a2, uint64_t a3)
{
  MisalignedItemDataPtr = BookmarkData::getMisalignedItemDataPtr(a1, 0x1010u, 0x18u, a2, &v7);
  if (MisalignedItemDataPtr)
  {
    long long v5 = *(_OWORD *)MisalignedItemDataPtr;
    *(void *)(a3 + 16) = *((void *)MisalignedItemDataPtr + 2);
    *(_OWORD *)a3 = v5;
  }
  return MisalignedItemDataPtr != 0;
}

unsigned int *BookmarkData::getMisalignedItemDataPtr(BookmarkData *this, unsigned int a2, unsigned int a3, int a4)
{
  return BookmarkData::getMisalignedItemDataPtr(this, a2, a3, a4, &v5);
}

unsigned int *BookmarkData::getMisalignedItemDataPtr(BookmarkData *this, unsigned int a2, unsigned int a3, int a4, unsigned int *a5)
{
  uint64_t result = (unsigned int *)BookmarkData::findItemInTOC(this, a2, a4);
  if (result)
  {
    uint64_t result = BookmarkData::getDataItemAtOffset(this, result[1]);
    if (result)
    {
      unsigned int v9 = *result;
      result += 2;
      *a5 = v9;
      if (v9 < a3) {
        return 0;
      }
    }
  }
  return result;
}

_DWORD *countPathComponents(BookmarkData *a1, int a2)
{
  uint64_t result = (_DWORD *)BookmarkData::findItemInTOC(a1, 0x1004u, a2);
  if (result)
  {
    uint64_t result = BookmarkData::getDataItemForTOCItem(a1, (uint64_t)result);
    if (result)
    {
      if (result[1] == 1537) {
        return (_DWORD *)(*result >> 2);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  unsigned int v6 = a1 + 1;
  unsigned int v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        unsigned int v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        unsigned int v5 = *v8;
        unsigned int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      unsigned int v5 = v8[1];
      if (!v5)
      {
        unsigned int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unsigned int v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<CFBookmarkDataItem const*>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(uint64_t a1, unint64_t *a2)
{
  BOOL v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  int v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = v2 + 1;
    }
    if (v6) {
      int v4 = v2;
    }
    BOOL v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  std::__tree<CFBookmarkDataItem const*>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  BOOL v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      BOOL v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    int v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      int v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    int v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      int v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  unint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      unint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      unint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      CFNumberRef v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      void v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *CFNumberRef v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      unint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    int v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      CFAllocatorRef v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *unint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        uint64_t v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        CFAllocatorRef v16 = v7;
      }
      else
      {
        int v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      CFIndex v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *CFIndex v24 = v23;
      goto LABEL_72;
    }
    CFAllocatorRef v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    CFNumberType v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      CFNumberType v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    unint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    unint64_t v7 = *(uint64_t **)v12;
  }
  CFIndex v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  CFNumberRef v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    CFNumberType v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    CFNumberRef v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *CFNumberRef v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    CFIndex v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  CFIndex v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void BookmarkData::BookmarkData(BookmarkData *this, const __CFAllocator *a2, CFTypeRef cf)
{
  *(void *)this = a2;
  int v4 = (char *)this + 8;
  if (cf)
  {
    CFRetain(cf);
    *((void *)this + 1) = cf;
    *((void *)this + 2) = 0;
    BOOL v6 = (CFBookmarkHeader **)((char *)this + 16);
    *((void *)this + 3) = CFDataGetBytePtr((CFDataRef)cf);
    unint64_t v7 = (CFBookmarkHeader **)((char *)this + 24);
    CFDataRef v8 = (const __CFData *)*((void *)this + 1);
    if (v8)
    {
      if (CFDataGetLength(v8) < 1 || (unint64_t)CFDataGetLength(*(CFDataRef *)v4) > 0xFFFFFFFE) {
        LODWORD(v8) = 0;
      }
      else {
        LODWORD(v8) = CFDataGetLength(*(CFDataRef *)v4);
      }
    }
  }
  else
  {
    LODWORD(v8) = 0;
    BOOL v6 = (CFBookmarkHeader **)((char *)this + 16);
    unint64_t v7 = (CFBookmarkHeader **)((char *)this + 24);
    *(void *)int v4 = 0;
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
  }
  *((void *)this + 7) = 0;
  *(void *)((char *)this + 36) = 0;
  *((_DWORD *)this + 8) = v8;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = (char *)this + 56;
  uint64_t v9 = "invalid bookmark length";
  if (v8 >= 0x10)
  {
    uint64_t v10 = *v7;
    if (CFBookmarkHeader::validate(*v7) && (unsigned int v11 = *((_DWORD *)this + 8), *((_DWORD *)v10 + 1) <= v11))
    {
      *BOOL v6 = v10;
      uint64_t v12 = *((unsigned int *)v10 + 3);
      if (v12 >= 0x10
        && ((v12 & 3) == 0 ? (BOOL v13 = v11 > v12) : (BOOL v13 = 0),
            v13 && (unsigned int v14 = v11 - v12, *((_DWORD *)this + 9) = v12, *((_DWORD *)this + 10) = v14, v14 >= 4)))
      {
        if (*v7) {
          unsigned int v15 = *(_DWORD *)((char *)*v7 + v12);
        }
        else {
          unsigned int v15 = 0;
        }
        uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, v15);
        if (!TOCAtOffset) {
          return;
        }
        uint64_t v18 = TOCAtOffset;
        uint64_t v19 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(TOCAtOffset + 12));
        uint64_t v9 = "invalid TOC: cycle";
        while (!v19 || v18 != v19)
        {
          uint64_t v20 = *(unsigned int *)(v18 + 16);
          if (v20)
          {
            BOOL v21 = (unsigned int *)(v18 + 24);
            while (1)
            {
              unsigned int v22 = *v21;
              v21 += 3;
              if (!BookmarkData::getDataItemAtOffset(this, v22)) {
                break;
              }
              if (!--v20) {
                goto LABEL_38;
              }
            }
            uint64_t v9 = "invalid data item pointer";
            break;
          }
LABEL_38:
          uint64_t v18 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v18 + 12));
          if (v19)
          {
            uint64_t v23 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v19 + 12));
            if (v23) {
              uint64_t v19 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v23 + 12));
            }
            else {
              uint64_t v19 = 0;
            }
          }
          if (!v18) {
            return;
          }
        }
      }
      else
      {
        uint64_t v9 = "invalid data section length";
      }
    }
    else if (!CFBookmarkHeader::validate(v10))
    {
      uint64_t v9 = "invalid header";
    }
  }
  if (*(void *)v4)
  {
    CFRelease(*(CFTypeRef *)v4);
    *(void *)int v4 = 0;
  }
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 10) = 0;
  *((void *)this + 4) = 0;
  CFAllocatorRef v16 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
    BookmarkData::BookmarkData((uint64_t)v9, v16);
  }
}

CFNumberRef copyIndexedPathComponent(BookmarkData *a1, int a2, unsigned int a3)
{
  uint64_t ItemInTOC = BookmarkData::findItemInTOC(a1, 0x1004u, a2);
  if (!ItemInTOC) {
    return 0;
  }
  DataItemForTOCItem = BookmarkData::getDataItemForTOCItem(a1, ItemInTOC);
  if (!DataItemForTOCItem) {
    return 0;
  }
  if (DataItemForTOCItem[1] != 1537) {
    return 0;
  }
  if (a3 >= *DataItemForTOCItem >> 2) {
    return 0;
  }
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(a1, DataItemForTOCItem[a3 + 2]);
  if (!DataItemAtOffset) {
    return 0;
  }
  CFDataRef v8 = DataItemAtOffset;
  CFTypeID TypeID = CFStringGetTypeID();
  return BookmarkData::copyItem((CFAllocatorRef *)a1, v8, TypeID);
}

unsigned int *BookmarkData::getDataItemAtOffset(BookmarkData *this, unsigned int a2)
{
  unint64_t v2 = *((unsigned int *)this + 10);
  if (v2 < a2 || (unint64_t)a2 + 8 > v2) {
    return 0;
  }
  uint64_t v4 = *((unsigned int *)this + 9);
  if ((((_BYTE)v4 + (_BYTE)a2) & 3) != 0) {
    return 0;
  }
  uint64_t v6 = *((void *)this + 3);
  if (!v6) {
    return 0;
  }
  unint64_t v7 = (unsigned int *)(v6 + v4 + a2);
  uint64_t v8 = *v7;
  if (v8 > 0xFFFFFFF6) {
    return 0;
  }
  if (v8 + (unint64_t)a2 + 8 <= v2) {
    return v7;
  }
  return 0;
}

uint64_t BookmarkData::findItemInTOC(BookmarkData *this, unsigned int a2, int a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t FirstTOC = BookmarkData::getFirstTOC(this, a3);
  if (!FirstTOC) {
    return 0;
  }
  uint64_t v7 = FirstTOC;
  do
  {
    if (a3 && *(_DWORD *)(v7 + 8) != a3) {
      uint64_t ItemInSingleTOCByItemType = 0;
    }
    else {
      uint64_t ItemInSingleTOCByItemType = BookmarkData::findItemInSingleTOCByItemType(FirstTOC, v7, a2);
    }
    uint64_t FirstTOC = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v7 + 12));
    BOOL v9 = FirstTOC != 0 && FirstTOC != v7;
    if (FirstTOC != 0 && FirstTOC != v7) {
      uint64_t v7 = FirstTOC;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  while (v9 && ItemInSingleTOCByItemType == 0);
  return ItemInSingleTOCByItemType;
}

uint64_t BookmarkData::getTOCAtOffset(BookmarkData *this, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v2 = *((unsigned int *)this + 10);
  unint64_t v3 = a2 + 20;
  if (v2 >= a2)
  {
    BOOL v4 = v3 >= v2;
    BOOL v5 = v3 == v2;
  }
  else
  {
    BOOL v4 = 1;
    BOOL v5 = 0;
  }
  if (!v5 && v4) {
    return 0;
  }
  uint64_t v6 = *((unsigned int *)this + 9);
  if ((((_BYTE)v6 + (_BYTE)a2) & 3) != 0) {
    return 0;
  }
  uint64_t v7 = *((void *)this + 3) + v6 + a2;
  if (*(_DWORD *)(v7 + 4) != -2) {
    return 0;
  }
  unsigned int v8 = *(_DWORD *)(v7 + 16);
  if (v8 > 0x15555552) {
    return 0;
  }
  if (a2 + 12 * (unint64_t)v8 + 20 <= v2) {
    return v7;
  }
  return 0;
}

uint64_t BookmarkData::getFirstTOC(BookmarkData *this, int a2)
{
  uint64_t v4 = *((void *)this + 3);
  if (v4) {
    unsigned int v5 = *(_DWORD *)(v4 + *((unsigned int *)this + 9));
  }
  else {
    unsigned int v5 = 0;
  }
  uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, v5);
  uint64_t result = 0;
  if (a2 && TOCAtOffset)
  {
    while (*(_DWORD *)(TOCAtOffset + 8) != a2)
    {
      uint64_t v8 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(TOCAtOffset + 12));
      if (v8) {
        BOOL v9 = v8 == TOCAtOffset;
      }
      else {
        BOOL v9 = 1;
      }
      uint64_t TOCAtOffset = v8;
      if (v9) {
        return 0;
      }
    }
    return TOCAtOffset;
  }
  return result;
}

uint64_t BookmarkData::findItemInSingleTOCByItemType(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3 = *(_DWORD *)(a2 + 16);
  if (a3 == -1)
  {
    if (v3) {
      return a2 + 20;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t result = 0;
    if (a3)
    {
      if (v3)
      {
        signed int v5 = v3 - 1;
        if ((v5 & 0x80000000) == 0)
        {
          signed int v6 = 0;
          while (1)
          {
            int v7 = v5 + v6;
            if (v5 + v6 < 0 != __OFADD__(v5, v6)) {
              ++v7;
            }
            unsigned int v8 = v7 >> 1;
            uint64_t v9 = a2 + 12 * v8;
            unsigned int v11 = *(_DWORD *)(v9 + 20);
            uint64_t result = v9 + 20;
            unsigned int v10 = v11;
            if (v11 == a3) {
              break;
            }
            if (v10 > a3) {
              signed int v5 = v8 - 1;
            }
            else {
              signed int v6 = v8 + 1;
            }
            if (v6 > v5) {
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned int *BookmarkData::getDataItemForTOCItem(BookmarkData *a1, uint64_t a2)
{
  if (a2) {
    return BookmarkData::getDataItemAtOffset(a1, *(_DWORD *)(a2 + 4));
  }
  else {
    return 0;
  }
}

BOOL CFBookmarkHeader::validate(CFBookmarkHeader *this)
{
  BOOL v1 = *(_DWORD *)this == 1936288865 || *(_DWORD *)this == 1802465122;
  return v1 && *((_DWORD *)this + 3) >= 0x10u && bookmarkVersionOK(*((_DWORD *)this + 2));
}

BOOL bookmarkVersionOK(int a1)
{
  return (a1 - 1) < 0x1FFFFFFF;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void *_FileCacheCreateShallowCopy(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  _FileCacheLock(a1);
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  initGlobalsOnce();
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  uint64_t v4 = Instance;
  if (Instance)
  {
    long long v5 = *(_OWORD *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 80);
    Instance[4] = *(_OWORD *)(a1 + 64);
    Instance[5] = v6;
    Instance[3] = v5;
    long long v7 = *(_OWORD *)(a1 + 96);
    long long v8 = *(_OWORD *)(a1 + 112);
    long long v9 = *(_OWORD *)(a1 + 144);
    Instance[8] = *(_OWORD *)(a1 + 128);
    Instance[9] = v9;
    Instance[6] = v7;
    Instance[7] = v8;
    long long v10 = *(_OWORD *)(a1 + 160);
    long long v11 = *(_OWORD *)(a1 + 176);
    long long v12 = *(_OWORD *)(a1 + 208);
    Instance[12] = *(_OWORD *)(a1 + 192);
    Instance[13] = v12;
    Instance[10] = v10;
    Instance[11] = v11;
    long long v13 = *(_OWORD *)(a1 + 224);
    long long v14 = *(_OWORD *)(a1 + 240);
    long long v15 = *(_OWORD *)(a1 + 272);
    Instance[16] = *(_OWORD *)(a1 + 256);
    Instance[17] = v15;
    Instance[14] = v13;
    Instance[15] = v14;
    CFAllocatorRef v16 = *(const void **)(a1 + 56);
    if (v16) {
      v4[7] = CFRetain(v16);
    }
    CFNumberType v17 = (unsigned char *)(a1 + 48);
    uint64_t v18 = *(const void **)(a1 + 280);
    if (v18) {
      v4[35] = CFRetain(v18);
    }
    if ((*v17 & 0x80) == 0) {
      goto LABEL_11;
    }
    uint64_t v19 = *(__CFFileSecurity **)(a1 + 272);
    if (v19)
    {
      CFFileSecurityRef Copy = CFFileSecurityCreateCopy(v2, v19);
      v4[34] = Copy;
      if (Copy) {
        goto LABEL_11;
      }
    }
    else if (v4[34])
    {
LABEL_11:
      CFDictionaryRef v21 = *(const __CFDictionary **)(a1 + 288);
      if (v21)
      {
        CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 288));
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v2, Count, v21);
      }
      else
      {
        CFMutableDictionaryRef MutableCopy = 0;
      }
      v4[36] = MutableCopy;
      CFDictionaryRef v24 = *(const __CFDictionary **)(a1 + 296);
      if (v24)
      {
        CFIndex v25 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 296));
        CFMutableDictionaryRef v26 = CFDictionaryCreateMutableCopy(v2, v25, v24);
      }
      else
      {
        CFMutableDictionaryRef v26 = 0;
      }
      v4[37] = v26;
      CFDictionaryRef v27 = *(const __CFDictionary **)(a1 + 304);
      if (v27)
      {
        CFIndex v28 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 304));
        CFMutableDictionaryRef v29 = CFDictionaryCreateMutableCopy(v2, v28, v27);
      }
      else
      {
        CFMutableDictionaryRef v29 = 0;
      }
      v4[38] = v29;
      CFDataRef v30 = *(const __CFData **)(a1 + 312);
      if (v30) {
        v4[39] = CFDataCreateMutableCopy(v2, 0, v30);
      }
      goto LABEL_23;
    }
    *(_DWORD *)v17 &= ~0x80u;
    goto LABEL_11;
  }
LABEL_23:
  int v31 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v31;
  if (!v31)
  {
    *(void *)(a1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }
  return v4;
}

void registerCoreProperties(uint64_t a1)
{
  v22[69] = *(const __CFString **)MEMORY[0x1E4F143B8];
  {
    registerCoreProperties(void)::corePropertyTable = *MEMORY[0x1E4F1D678];
    *(_OWORD *)&qword_1EB20EE18 = xmmword_1817911B0;
    uint64_t v6 = *MEMORY[0x1E4F1D738];
    qword_1EB20EE28 = (uint64_t)createIsDirectoryValue;
    qword_1EB20EE30[0] = v6;
    *(_OWORD *)&qword_1EB20EE30[1] = xmmword_1817911B0;
    uint64_t v7 = *MEMORY[0x1E4F1D690];
    qword_1EB20EE48 = (uint64_t)createNameValue;
    unk_1EB20EE50 = v7;
    unk_1EB20EE58 = xmmword_1817911C0;
    uint64_t v8 = *MEMORY[0x1E4F1D6E0];
    qword_1EB20EE68 = (uint64_t)createIsHiddenValue;
    unk_1EB20EE70 = v8;
    unk_1EB20EE78 = xmmword_1817911B0;
    uint64_t v9 = *MEMORY[0x1E4F1D6D0];
    qword_1EB20EE88 = (uint64_t)createIsUserImmutableValue;
    unk_1EB20EE90 = v9;
    unk_1EB20EE98 = xmmword_1817911B0;
    uint64_t v10 = *MEMORY[0x1E4F1D708];
    qword_1EB20EEA8 = (uint64_t)createIsSystemImmutableValue;
    unk_1EB20EEB0 = v10;
    unk_1EB20EEB8 = xmmword_1817911B0;
    uint64_t v11 = *MEMORY[0x1E4F1CE50];
    qword_1EB20EEC8 = (uint64_t)createLinkCountValue;
    unk_1EB20EED0 = v11;
    qword_1EB20EED8 = 0;
    unk_1EB20EEE0 = 0;
    uint64_t v12 = *MEMORY[0x1E4F1CE28];
    qword_1EB20EEE8 = (uint64_t)createIsSystemNoUnlinkValue;
    unk_1EB20EEF0 = v12;
    qword_1EB20EEF8 = 0;
    unk_1EB20EF00 = 0;
    uint64_t v13 = *MEMORY[0x1E4F1CE30];
    qword_1EB20EF08 = (uint64_t)createIsRestrictedValue;
    unk_1EB20EF10 = v13;
    qword_1EB20EF18 = 0;
    unk_1EB20EF20 = 0;
    uint64_t v14 = *MEMORY[0x1E4F1CE58];
    qword_1EB20EF28 = (uint64_t)createIsSystemAppendValue;
    unk_1EB20EF30 = v14;
    qword_1EB20EF38 = 0;
    unk_1EB20EF40 = 0;
    uint64_t v15 = *MEMORY[0x1E4F1D550];
    qword_1EB20EF48 = (uint64_t)createIsUserAppendValue;
    unk_1EB20EF50 = v15;
    unk_1EB20EF58 = xmmword_1817911B0;
    uint64_t v16 = *MEMORY[0x1E4F1D640];
    qword_1EB20EF68 = (uint64_t)createAddedToDirectoryDateValue;
    unk_1EB20EF70 = v16;
    unk_1EB20EF78 = xmmword_1817911D0;
    uint64_t v17 = *MEMORY[0x1E4F1D6B8];
    qword_1EB20EF88 = (uint64_t)createFileSizeValue;
    unk_1EB20EF90 = v17;
    unk_1EB20EF98 = xmmword_1817911B0;
    uint64_t v18 = *MEMORY[0x1E4F1D6C8];
    qword_1EB20EFA8 = (uint64_t)createIsRegularFileValue;
    unk_1EB20EFB0 = v18;
    unk_1EB20EFB8 = xmmword_1817911B0;
    uint64_t v19 = *MEMORY[0x1E4F1D668];
    qword_1EB20EFC8 = (uint64_t)createIsSymbolicLinkValue;
    unk_1EB20EFD0 = v19;
    unk_1EB20EFD8 = xmmword_1817911C0;
    uint64_t v20 = *MEMORY[0x1E4F1D6E8];
    qword_1EB20EFE8 = (uint64_t)createIsAliasFileValue;
    unk_1EB20EFF0 = v20;
    unk_1EB20EFF8 = xmmword_1817911B0;
    uint64_t v21 = *MEMORY[0x1E4F1D5B8];
    qword_1EB20F008 = (uint64_t)createIsVolumeValue;
    unk_1EB20F010 = v21;
    unk_1EB20F018 = xmmword_1817911D0;
    qword_1EB20F028 = (uint64_t)createFileAllocatedSizeValue;
    qword_1EB20F030 = *MEMORY[0x1E4F1CDE0];
    unk_1EB20F038 = vdupq_n_s64(2uLL);
    qword_1EB20F048 = (uint64_t)createFinderInfoValue;
    qword_1EB20F050 = *MEMORY[0x1E4F1CDD8];
    unk_1EB20F058 = xmmword_1817911E0;
    qword_1EB20F068 = (uint64_t)createFileSizeOfResourceForkValue;
    qword_1EB20F070 = *MEMORY[0x1E4F1CDC0];
    unk_1EB20F078 = xmmword_1817911E0;
    qword_1EB20F088 = (uint64_t)createFileAllocatedSizeOfResourceForkValue;
    qword_1EB20F090 = *MEMORY[0x1E4F1CE08];
    qword_1EB20F098 = 0;
    qword_1EB20F0A0 = 0;
    qword_1EB20F0A8 = (uint64_t)createIsCompressedValue;
    qword_1EB20F0B0 = *MEMORY[0x1E4F1CEB8];
    unk_1EB20F0B8 = xmmword_1817911F0;
    qword_1EB20F0C8 = (uint64_t)createParentDirectoryIsVolumeRoot;
    qword_1EB20F0D0 = *MEMORY[0x1E4F1CDD0];
    unk_1EB20F0D8 = xmmword_1817911F0;
    qword_1EB20F0E8 = (uint64_t)createFileIDValue;
    qword_1EB20F0F0 = *MEMORY[0x1E4F1D598];
    unk_1EB20F0F8 = xmmword_1817911B0;
    qword_1EB20F108 = (uint64_t)createContentModificationDateValue;
    qword_1EB20F110 = *MEMORY[0x1E4F1D558];
    unk_1EB20F118 = xmmword_1817911B0;
    qword_1EB20F128 = (uint64_t)createAttributeModificationDateValue;
    qword_1EB20F130 = *MEMORY[0x1E4F1D5A0];
    unk_1EB20F138 = xmmword_1817911B0;
    qword_1EB20F148 = (uint64_t)createCreationDateValue;
    qword_1EB20F150 = *MEMORY[0x1E4F1D660];
    unk_1EB20F158 = xmmword_1817911C0;
    qword_1EB20F168 = (uint64_t)createHasHiddenExtensionValue;
    qword_1EB20F170 = *MEMORY[0x1E4F1D6B0];
    unk_1EB20F178 = vdupq_n_s64(1uLL);
    qword_1EB20F188 = (uint64_t)createIsReadableValue;
    qword_1EB20F190 = *MEMORY[0x1E4F1D6F0];
    unk_1EB20F198 = unk_1EB20F178;
    qword_1EB20F1A8 = (uint64_t)createIsWriteableValue;
    qword_1EB20F1B0 = *MEMORY[0x1E4F1D688];
    unk_1EB20F1B8 = unk_1EB20F178;
    qword_1EB20F1C8 = (uint64_t)createIsExecutableValue;
    qword_1EB20F1D0 = *MEMORY[0x1E4F1D700];
    unk_1EB20F1D8 = xmmword_1817911C0;
    qword_1EB20F1E8 = (uint64_t)createLabelNumberValue;
    qword_1EB20F1F0 = *MEMORY[0x1E4F1D638];
    unk_1EB20F1F8 = xmmword_181791200;
    qword_1EB20F208 = (uint64_t)createFileSecurityValue;
    qword_1EB20F210 = *MEMORY[0x1E4F1D5F8];
    unk_1EB20F218 = xmmword_1817911B0;
    qword_1EB20F228 = (uint64_t)createFileProtectionValue;
    qword_1EB20F230 = *MEMORY[0x1E4F1D590];
    unk_1EB20F238 = xmmword_1817911B0;
    qword_1EB20F248 = (uint64_t)createContentAccessDateValue;
    qword_1EB20F250 = *MEMORY[0x1E4F1D770];
    unk_1EB20F258 = xmmword_181791210;
    qword_1EB20F268 = (uint64_t)createTotalFileSizeValue;
    qword_1EB20F270 = *MEMORY[0x1E4F1D768];
    unk_1EB20F278 = xmmword_181791210;
    qword_1EB20F288 = (uint64_t)createTotalFileAllocatedSizeValue;
    qword_1EB20F290 = *MEMORY[0x1E4F1D608];
    unk_1EB20F298 = xmmword_181791220;
    qword_1EB20F2A8 = (uint64_t)createFileResourceIdentifierValue;
    qword_1EB20F2B0 = *MEMORY[0x1E4F1D648];
    unk_1EB20F2B8 = xmmword_181791220;
    qword_1EB20F2C8 = (uint64_t)createGenerationIdentifierValue;
    qword_1EB20F2D0 = *MEMORY[0x1E4F1D5B0];
    unk_1EB20F2D8 = xmmword_1817911B0;
    qword_1EB20F2E8 = (uint64_t)createDocumentIdentifierValue;
    qword_1EB20F2F0 = *MEMORY[0x1E4F1D618];
    unk_1EB20F2F8 = xmmword_1817911B0;
    qword_1EB20F308 = (uint64_t)createFileResourceTypeValue;
    qword_1EB20F310 = *MEMORY[0x1E4F1D750];
    unk_1EB20F318 = xmmword_1817911B0;
    qword_1EB20F328 = (uint64_t)createPreferredIOBlockSizeValue;
    qword_1EB20F330 = *MEMORY[0x1E4F1D698];
    unk_1EB20F338 = xmmword_1817911B0;
    qword_1EB20F348 = (uint64_t)createIsMountTriggerValue;
    qword_1EB20F350 = *MEMORY[0x1E4F1D588];
    unk_1EB20F358 = xmmword_181791230;
    qword_1EB20F368 = (uint64_t)createCanonicalPathValue;
    qword_1EB20F370 = *MEMORY[0x1E4F1D5D8];
    unk_1EB20F378 = xmmword_1817911F0;
    qword_1EB20F388 = (uint64_t)createInodeNumberValue;
    qword_1EB20F390 = *MEMORY[0x1E4F1D5C0];
    unk_1EB20F398 = xmmword_1817911F0;
    qword_1EB20F3A8 = (uint64_t)createFileContentIdentifierValue;
    qword_1EB20F3B0 = *MEMORY[0x1E4F1D730];
    qword_1EB20F3C0 = 0;
    qword_1EB20F3B8 = 0;
    qword_1EB20F3C8 = (uint64_t)createMayShareFileContentValue;
    qword_1EB20F3D0 = *MEMORY[0x1E4F1D728];
    qword_1EB20F3E0 = 0;
    qword_1EB20F3D8 = 0;
    qword_1EB20F3E8 = (uint64_t)createMayHaveExtendedAttributesValue;
    qword_1EB20F3F0 = *MEMORY[0x1E4F1D6A8];
    qword_1EB20F3F8 = 0;
    qword_1EB20F400 = 0;
    qword_1EB20F408 = (uint64_t)createIsPurgeableValue;
    qword_1EB20F410 = *MEMORY[0x1E4F1D6C0];
    qword_1EB20F418 = 0;
    qword_1EB20F420 = 0;
    qword_1EB20F428 = (uint64_t)createIsSparseValue;
    qword_1EB20F430 = @"NSURLDirectoryEntryCountKey";
    unk_1EB20F438 = xmmword_181791240;
    qword_1EB20F448 = (uint64_t)createDirectoryEntryCountValue;
    qword_1EB20F450 = *MEMORY[0x1E4F1CDB8];
    unk_1EB20F458 = xmmword_181791250;
    qword_1EB20F468 = (uint64_t)createFaultLogicalFileIsHiddenValue;
    qword_1EB20F470 = *MEMORY[0x1E4F1CEA0];
    qword_1EB20F478 = 0;
    qword_1EB20F480 = 0;
    qword_1EB20F488 = (uint64_t)createNameExtensionValue;
    qword_1EB20F490 = *MEMORY[0x1E4F1CF28];
    qword_1EB20F4A0 = 0;
    qword_1EB20F498 = 0;
    qword_1EB20F4A8 = (uint64_t)createVolumeIsHFSStandardValue;
    qword_1EB20F4B0 = *MEMORY[0x1E4F1CE68];
    qword_1EB20F4B8 = 0;
    qword_1EB20F4C0 = 0;
    qword_1EB20F4C8 = (uint64_t)createIsUserNoDumpValue;
    qword_1EB20F4D0 = *MEMORY[0x1E4F1CE70];
    qword_1EB20F4D8 = 0;
    qword_1EB20F4E0 = 0;
    qword_1EB20F4E8 = (uint64_t)createIsUserOpaqueValue;
    qword_1EB20F4F0 = *MEMORY[0x1E4F1CE78];
    qword_1EB20F4F8 = 0;
    qword_1EB20F500 = 0;
    qword_1EB20F508 = (uint64_t)createIsUserTrackedValue;
    qword_1EB20F510 = *MEMORY[0x1E4F1CE60];
    qword_1EB20F518 = 0;
    qword_1EB20F520 = 0;
    qword_1EB20F528 = (uint64_t)createIsUserDataVaultValue;
    qword_1EB20F530 = *MEMORY[0x1E4F1CE38];
    qword_1EB20F540 = 0;
    qword_1EB20F538 = 0;
    qword_1EB20F548 = (uint64_t)createIsSystemArchivedValue;
    qword_1EB20F550 = *MEMORY[0x1E4F1CEF8];
    qword_1EB20F560 = 0;
    qword_1EB20F558 = 0;
    qword_1EB20F568 = (uint64_t)createVolumeIDValue;
    qword_1EB20F570 = *MEMORY[0x1E4F1CE00];
    unk_1EB20F578 = xmmword_1817911F0;
    qword_1EB20F588 = (uint64_t)createInodeNumberValue;
    qword_1EB20F590 = *MEMORY[0x1E4F1CEB0];
    unk_1EB20F598 = xmmword_1817911F0;
    qword_1EB20F5A8 = (uint64_t)createParentDirectoryIDValue;
    qword_1EB20F5B0 = *MEMORY[0x1E4F1CEA8];
    qword_1EB20F5C0 = 0;
    qword_1EB20F5B8 = 0;
    qword_1EB20F5C8 = (uint64_t)createOwnerIDValue;
    qword_1EB20F5D0 = *MEMORY[0x1E4F1CDF0];
    qword_1EB20F5E0 = 0;
    qword_1EB20F5D8 = 0;
    qword_1EB20F5E8 = (uint64_t)createGroupIDValue;
    qword_1EB20F5F0 = *MEMORY[0x1E4F1CED0];
    qword_1EB20F600 = 0;
    qword_1EB20F5F8 = 0;
    qword_1EB20F608 = (uint64_t)createStatModeValue;
    qword_1EB20F610 = *MEMORY[0x1E4F1CE48];
    qword_1EB20F620 = 0;
    qword_1EB20F618 = 0;
    qword_1EB20F628 = (uint64_t)createIsSystemFirmlinkValue;
    qword_1EB20F630 = *MEMORY[0x1E4F1CE40];
    qword_1EB20F640 = 0;
    qword_1EB20F638 = 0;
    qword_1EB20F648 = (uint64_t)createIsSystemDatalessValue;
    qword_1EB20F650 = *MEMORY[0x1E4F1CDC8];
    qword_1EB20F660 = 0;
    qword_1EB20F658 = 0;
    qword_1EB20F668 = (uint64_t)createFileFlagsValue;
    qword_1EB20F670 = *MEMORY[0x1E4F1CDE8];
    qword_1EB20F680 = 0;
    qword_1EB20F678 = 0;
    qword_1EB20F688 = (uint64_t)createGenerationCountValue;
  }
  MEMORY[0x1F4188790](a1);
  uint64_t v1 = 0;
  CFAllocatorRef v2 = qword_1EB20EE30;
  memset(v22, 0, 512);
  do
  {
    *(void *)&long long v3 = *(v2 - 4);
    *((void *)&v3 + 1) = *v2;
    *(_OWORD *)&v22[v1] = v3;
    v2 += 8;
    v1 += 2;
  }
  while (v1 != 68);
  uint64_t v4 = 0;
  qword_1EB20E018 = _RegisterFilePropertyProvider(&off_1ECA262E8, 0, v22, 0x44uLL);
  long long v5 = &registerCoreProperties(void)::corePropertyTable;
  do
  {
    _RegisterFilePropertyWithOptions((void *)v22[v4++], v5[1], 0, 0, (uint64_t)v5);
    v5 += 4;
  }
  while (v4 != 68);
}

void registerVolumeProperties(uint64_t a1)
{
  v21[59] = *(const __CFString **)MEMORY[0x1E4F143B8];
  {
    registerVolumeProperties(void)::propertyTable = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E6D0 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20E6D8 = 0;
    unk_1EB20E6E0 = 0;
    qword_1EB20E6E8 = @"__kCFURLExpensiveVolumeInformationKey";
    unk_1EB20E6F0 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20E6F8 = 0;
    unk_1EB20E700 = 0;
    qword_1EB20E708 = *MEMORY[0x1E4F1D8B0];
    unk_1EB20E710 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20E718 = 0;
    unk_1EB20E720 = 0;
    qword_1EB20E728 = *MEMORY[0x1E4F1D890];
    unk_1EB20E730 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20E738 = 0;
    unk_1EB20E740 = 0;
    qword_1EB20E748 = *MEMORY[0x1E4F1D978];
    unk_1EB20E750 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20E758 = 0;
    unk_1EB20E760 = 0;
    qword_1EB20E768 = *MEMORY[0x1E4F1D870];
    unk_1EB20E770 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E778 = 1;
    uint64_t v10 = *MEMORY[0x1E4F1D840];
    qword_1EB20E780 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E788 = v10;
    qword_1EB20E790 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E798 = 2;
    uint64_t v11 = *MEMORY[0x1E4F1D848];
    qword_1EB20E7A0 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E7A8 = v11;
    qword_1EB20E7B0 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E7B8 = 4;
    uint64_t v12 = *MEMORY[0x1E4F1D878];
    qword_1EB20E7C0 = (uint64_t)createNegatedVolumeFlagValue;
    unk_1EB20E7C8 = v12;
    qword_1EB20E7D0 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E7D8 = 8;
    uint64_t v13 = *MEMORY[0x1E4F1D850];
    qword_1EB20E7E0 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E7E8 = v13;
    qword_1EB20E7F0 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E7F8 = 32;
    uint64_t v14 = *MEMORY[0x1E4F1D880];
    qword_1EB20E800 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E808 = v14;
    qword_1EB20E810 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E818 = 64;
    uint64_t v15 = *MEMORY[0x1E4F1D858];
    qword_1EB20E820 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E828 = v15;
    qword_1EB20E830 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E838 = 0x8000000;
    uint64_t v16 = *MEMORY[0x1E4F1D908];
    qword_1EB20E840 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E848 = v16;
    qword_1EB20E850 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E858 = 0x10000000;
    uint64_t v17 = *MEMORY[0x1E4F1D888];
    qword_1EB20E860 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E868 = v17;
    qword_1EB20E870 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E878 = 0x4000000;
    uint64_t v18 = *MEMORY[0x1E4F1D8E8];
    qword_1EB20E880 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E888 = v18;
    qword_1EB20E890 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E898 = 0x800000000000000;
    uint64_t v19 = *MEMORY[0x1E4F1D928];
    qword_1EB20E8A0 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E8A8 = v19;
    qword_1EB20E8B0 = @"__kCFURLCheapVolumeInformationKey";
    unk_1EB20E8B8 = 0x100000000;
    uint64_t v20 = *MEMORY[0x1E4F1D950];
    qword_1EB20E8C0 = (uint64_t)createVolumeFlagValue;
    unk_1EB20E8C8 = v20;
    qword_1EB20E8D0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E8D8 = 0x1000000000;
    qword_1EB20E8E0 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E8E8 = *MEMORY[0x1E4F1D920];
    qword_1EB20E8F0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E8F8 = 0x10000000000;
    qword_1EB20E900 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E908 = *MEMORY[0x1E4F1D930];
    qword_1EB20E910 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E918 = 0x20000000000;
    qword_1EB20E920 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E928 = *MEMORY[0x1E4F1D8E0];
    qword_1EB20E930 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E938 = 0x80000000000;
    qword_1EB20E940 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E948 = *MEMORY[0x1E4F1D8D8];
    qword_1EB20E950 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E958 = 0x100000000000;
    qword_1EB20E960 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E968 = *MEMORY[0x1E4F1D8D0];
    qword_1EB20E970 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E978 = 0x200000000000;
    qword_1EB20E980 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E988 = *MEMORY[0x1E4F1D938];
    qword_1EB20E990 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E998 = 0x400000000000;
    qword_1EB20E9A0 = (uint64_t)createNegatedVolumeFlagValue;
    qword_1EB20E9A8 = *MEMORY[0x1E4F1D8F8];
    qword_1EB20E9B0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E9B8 = 0x800000000000;
    qword_1EB20E9C0 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E9C8 = *MEMORY[0x1E4F1D910];
    qword_1EB20E9D0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E9D8 = 0x2000000000000;
    qword_1EB20E9E0 = (uint64_t)createVolumeFlagValue;
    qword_1EB20E9E8 = *MEMORY[0x1E4F1D868];
    qword_1EB20E9F0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20E9F8 = 0x20000000000000;
    qword_1EB20EA00 = (uint64_t)createVolumeFlagValue;
    qword_1EB20EA08 = *MEMORY[0x1E4F1D940];
    qword_1EB20EA10 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EA18 = 0x40000000000000;
    qword_1EB20EA20 = (uint64_t)createVolumeFlagValue;
    qword_1EB20EA28 = *MEMORY[0x1E4F1D960];
    qword_1EB20EA30 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EA38 = 0x80000000000000;
    qword_1EB20EA40 = (uint64_t)createVolumeFlagValue;
    qword_1EB20EA48 = *MEMORY[0x1E4F1D958];
    qword_1EB20EA50 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EA58 = 0x100000000000000;
    qword_1EB20EA60 = (uint64_t)createVolumeFlagValue;
    qword_1EB20EA68 = *MEMORY[0x1E4F1D900];
    qword_1EB20EA70 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EA78 = 0x2000000000000000;
    qword_1EB20EA80 = (uint64_t)createVolumeFlagValue;
    qword_1EB20EA88 = *MEMORY[0x1E4F1D948];
    qword_1EB20EA90 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EA98 = 0x4000000000000000;
    qword_1EB20EAA0 = (uint64_t)createVolumeFlagValue;
    qword_1EB20EAA8 = *MEMORY[0x1E4F1D8F0];
    qword_1EB20EAB0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EAB8 = 0x8000000000000000;
    qword_1EB20EAC0 = (uint64_t)createVolumeFlagValue;
    qword_1EB20EAC8 = *MEMORY[0x1E4F1D918];
    qword_1EB20EAD0 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20EAE0 = 0;
    qword_1EB20EAD8 = 0;
    qword_1EB20EAE8 = *MEMORY[0x1E4F1D8C8];
    qword_1EB20EAF0 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20EB00 = 0;
    qword_1EB20EAF8 = 0;
    qword_1EB20EB08 = *MEMORY[0x1E4F1D860];
    qword_1EB20EB10 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EB18 = 0;
    qword_1EB20EB20 = (uint64_t)createVolumeIsInternalValue;
    qword_1EB20EB28 = *MEMORY[0x1E4F1D8A0];
    qword_1EB20EB30 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EB38 = 0;
    qword_1EB20EB40 = (uint64_t)createVolumeMaximumFileSizeValue;
    qword_1EB20EB48 = *MEMORY[0x1E4F1D830];
    qword_1EB20EB50 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EB58 = 0;
    qword_1EB20EB60 = (uint64_t)createVolumeCreationDateValue;
    qword_1EB20EB68 = *MEMORY[0x1E4F1D988];
    qword_1EB20EB70 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EB78 = 0;
    qword_1EB20EB80 = (uint64_t)createVolumeUUIDStringValue;
    qword_1EB20EB88 = *MEMORY[0x1E4F1D838];
    qword_1EB20EB90 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EB98 = 0;
    qword_1EB20EBA0 = (uint64_t)createVolumeIdentifierValue;
    qword_1EB20EBA8 = *MEMORY[0x1E4F1D968];
    qword_1EB20EBB0 = @"__kCFURLExpensiveVolumeInformationKey";
    qword_1EB20EBB8 = 0;
    qword_1EB20EBC0 = (uint64_t)createVolumeTotalCapacityValue;
    qword_1EB20EBC8 = *MEMORY[0x1E4F1D828];
    qword_1EB20EBD0 = @"__kCFURLExpensiveVolumeInformationKey";
    qword_1EB20EBD8 = 0;
    qword_1EB20EBE0 = (uint64_t)createVolumeAvailableCapacityValue;
    qword_1EB20EBE8 = *MEMORY[0x1E4F1D8B8];
    qword_1EB20EBF0 = @"__kCFURLExpensiveVolumeInformationKey";
    qword_1EB20EBF8 = 0;
    qword_1EB20EC00 = (uint64_t)createVolumeResourceCountValue;
    qword_1EB20EC08 = *MEMORY[0x1E4F1CD98];
    qword_1EB20EC10 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20EC18 = 0;
    qword_1EB20EC20 = 0;
    qword_1EB20EC28 = *MEMORY[0x1E4F1CF48];
    qword_1EB20EC30 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20EC40 = 0;
    qword_1EB20EC38 = 0;
    qword_1EB20EC48 = *MEMORY[0x1E4F1D970];
    qword_1EB20EC50 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EC58 = 0;
    qword_1EB20EC60 = 0;
    qword_1EB20EC68 = *MEMORY[0x1E4F1D8C0];
    qword_1EB20EC70 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EC78 = 0;
    qword_1EB20EC80 = 0;
    qword_1EB20EC88 = *MEMORY[0x1E4F1D8A8];
    qword_1EB20EC90 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EC98 = 0;
    qword_1EB20ECA0 = 0;
    qword_1EB20ECA8 = *MEMORY[0x1E4F1CF38];
    qword_1EB20ECB0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ECB8 = 16;
    qword_1EB20ECC0 = (uint64_t)createVolumeFlagValue;
    qword_1EB20ECC8 = *MEMORY[0x1E4F1CF18];
    qword_1EB20ECD0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ECD8 = 512;
    qword_1EB20ECE0 = (uint64_t)createVolumeFlagValue;
    qword_1EB20ECE8 = *MEMORY[0x1E4F1CF20];
    qword_1EB20ECF0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ECF8 = 1024;
    qword_1EB20ED00 = (uint64_t)createVolumeFlagValue;
    qword_1EB20ED08 = *MEMORY[0x1E4F1CF40];
    qword_1EB20ED10 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ED18 = 4096;
    qword_1EB20ED20 = (uint64_t)createVolumeFlagValue;
    qword_1EB20ED28 = *MEMORY[0x1E4F1CF00];
    qword_1EB20ED30 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ED38 = 0x4000;
    qword_1EB20ED40 = (uint64_t)createVolumeFlagValue;
    qword_1EB20ED48 = *MEMORY[0x1E4F1CF08];
    qword_1EB20ED50 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ED58 = 0x8000;
    qword_1EB20ED60 = (uint64_t)createVolumeFlagValue;
    qword_1EB20ED68 = *MEMORY[0x1E4F1CF10];
    qword_1EB20ED70 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ED78 = 0x10000;
    qword_1EB20ED80 = (uint64_t)createVolumeFlagValue;
    qword_1EB20ED88 = *MEMORY[0x1E4F1CEF0];
    qword_1EB20ED90 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20ED98 = 0;
    qword_1EB20EDA0 = (uint64_t)createVolumeDeviceIDValue;
    qword_1EB20EDA8 = *MEMORY[0x1E4F1D820];
    qword_1EB20EDB0 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20EDB8 = 0;
    qword_1EB20EDC0 = 0;
    qword_1EB20EDC8 = *MEMORY[0x1E4F1D818];
    qword_1EB20EDD0 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_1EB20EDE0 = 0;
    qword_1EB20EDD8 = 0;
    qword_1EB20EDE8 = *MEMORY[0x1E4F1CF30];
    qword_1EB20EDF0 = @"__kCFURLCheapVolumeInformationKey";
    qword_1EB20EDF8 = 0x20000000;
    qword_1EB20EE00 = (uint64_t)createVolumeFlagValue;
  }
  MEMORY[0x1F4188790](a1);
  uint64_t v1 = 0;
  CFAllocatorRef v2 = &qword_1EB20E6E8;
  memset(v21, 0, 464);
  do
  {
    *(void *)&long long v3 = *(v2 - 4);
    *((void *)&v3 + 1) = *v2;
    *(_OWORD *)&v21[v1] = v3;
    v2 += 8;
    v1 += 2;
  }
  while (v1 != 58);
  uint64_t v4 = 0;
  qword_1EB20E020 = _RegisterFilePropertyProvider(&off_1ECA26328, 0, v21, 0x3AuLL);
  long long v5 = (const void **)&qword_1EB20E6D0;
  uint64_t v6 = (const void **)&qword_1EB20E6D0;
  do
  {
    uint64_t v7 = (__CFString *)v21[v4];
    uint64_t v8 = *v6;
    v6 += 4;
    BOOL v9 = CFEqual(v8, @"__kCFURLNoDependsVolumeInformationKey") == 0;
    _RegisterFilePropertyWithOptions(v7, 0, v5, v9, (uint64_t)(v5 - 1));
    ++v4;
    long long v5 = v6;
  }
  while (v4 != 58);
}

void ___Z15initGlobalsOncev_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  init_logging();
  size_t v10 = 16;
  if (sysctlbyname("kern.osproductversion", buf, &v10, 0, 0)
    || bswap32(*(unsigned int *)buf) == 825241137 && 53 == v12)
  {
    int v0 = 252;
  }
  else
  {
    int v0 = 8188;
  }
  v1.i64[0] = 0x3FF0BFFFFFLL;
  v1.i32[2] = 14335;
  v1.i32[3] = v0;
  uint64_t v2 = 8u;
  do
  {
    *(int8x16_t *)&corePropertyAttrListTable[v2] = vandq_s8(*(int8x16_t *)&corePropertyAttrListTable[v2], v1);
    v2 += 24;
  }
  while (v2 != 224);
  sFileProviderGlobals[0] = _FileCacheInitClass();
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  qword_1EB20E028 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
  qword_1EB20E038 = (uint64_t)CFArrayCreateMutable(v3, 0, MEMORY[0x1E4F1D510]);
  uint64_t v4 = defaultLog;
  BOOL v5 = os_signpost_enabled((os_log_t)defaultLog);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_181761000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Register Property Providers", "", buf, 2u);
  }
  registerCoreProperties(v5);
  registerPathURLProperties(v6);
  registerVolumeProperties(v7);
  uint64_t v8 = _LSRegisterFilePropertyProvider();
  registerExternalProviderProperties(v8);
  BOOL v9 = defaultLog;
  if (os_signpost_enabled((os_log_t)defaultLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_181761000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Register Property Providers", "", buf, 2u);
  }
}

void registerExternalProviderProperties(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  {
    registerExternalProviderProperties::thumbnailsDependencyKeys = *MEMORY[0x1E4F1D5B0];
  }
  {
    registerExternalProviderProperties::propertyTable[0] = *MEMORY[0x1E4F1D6D8];
    *(void *)algn_1EB20E128 = 0;
    qword_1EB20E130 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E138 = 0;
    qword_1EB20E140 = 0;
    unk_1EB20E148 = 0;
    qword_1EB20E150 = *MEMORY[0x1E4F1D7A0];
    unk_1EB20E158 = 0;
    qword_1EB20E160 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E168 = 0;
    qword_1EB20E170 = 0;
    unk_1EB20E178 = 0;
    qword_1EB20E180 = *MEMORY[0x1E4F1D7B0];
    unk_1EB20E188 = 0;
    qword_1EB20E190 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E198 = 0;
    qword_1EB20E1A0 = 0;
    unk_1EB20E1A8 = 0;
    qword_1EB20E1B0 = *MEMORY[0x1E4F1CEE0];
    unk_1EB20E1B8 = 0;
    qword_1EB20E1C0 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E1C8 = 0;
    qword_1EB20E1D0 = 0;
    unk_1EB20E1D8 = 0;
    qword_1EB20E1E0 = *MEMORY[0x1E4F1D798];
    unk_1EB20E1E8 = 0;
    qword_1EB20E1F0 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E1F8 = 0;
    qword_1EB20E200 = 0;
    unk_1EB20E208 = 0;
    qword_1EB20E210 = *MEMORY[0x1E4F1D790];
    unk_1EB20E218 = 0;
    qword_1EB20E220 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E228 = 0;
    qword_1EB20E230 = 0;
    unk_1EB20E238 = 0;
    qword_1EB20E240 = *MEMORY[0x1E4F1D7E0];
    unk_1EB20E248 = 0;
    qword_1EB20E250 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E258 = 0;
    qword_1EB20E260 = 0;
    unk_1EB20E268 = 0;
    qword_1EB20E270 = *MEMORY[0x1E4F1D7C0];
    unk_1EB20E278 = 0;
    qword_1EB20E280 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E288 = 0;
    qword_1EB20E290 = 0;
    unk_1EB20E298 = 0;
    qword_1EB20E2A0 = *MEMORY[0x1E4F1D7C8];
    unk_1EB20E2A8 = 0;
    qword_1EB20E2B0 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E2B8 = 0;
    qword_1EB20E2C0 = 0;
    unk_1EB20E2C8 = 0;
    qword_1EB20E2D0 = *MEMORY[0x1E4F1D788];
    unk_1EB20E2D8 = 0;
    qword_1EB20E2E0 = (uint64_t)CopyFromFileProvider;
    unk_1EB20E2E8 = 0;
    qword_1EB20E2F0 = 0;
    unk_1EB20E2F8 = 0;
    qword_1EB20E300 = *MEMORY[0x1E4F1D780];
    unk_1EB20E308 = 0;
    qword_1EB20E318 = 0;
    unk_1EB20E320 = 0;
    qword_1EB20E310 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E328 = 0;
    qword_1EB20E330 = *MEMORY[0x1E4F1D7B8];
    qword_1EB20E338 = 0;
    qword_1EB20E340 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E350 = 0;
    qword_1EB20E348 = 0;
    qword_1EB20E358 = 0;
    qword_1EB20E360 = *MEMORY[0x1E4F1D800];
    qword_1EB20E368 = 0;
    qword_1EB20E370 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E380 = 0;
    qword_1EB20E378 = 0;
    qword_1EB20E388 = 0;
    qword_1EB20E390 = *MEMORY[0x1E4F1D808];
    qword_1EB20E398 = 0;
    qword_1EB20E3A0 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E3B0 = 0;
    qword_1EB20E3A8 = 0;
    qword_1EB20E3B8 = 0;
    qword_1EB20E3C0 = *MEMORY[0x1E4F1D810];
    qword_1EB20E3C8 = 0;
    qword_1EB20E3D0 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E3E0 = 0;
    qword_1EB20E3D8 = 0;
    qword_1EB20E3E8 = 0;
    qword_1EB20E3F0 = *MEMORY[0x1E4F1D7F0];
    qword_1EB20E3F8 = 0;
    qword_1EB20E400 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E410 = 0;
    qword_1EB20E408 = 0;
    qword_1EB20E418 = 0;
    qword_1EB20E420 = *MEMORY[0x1E4F1D7E8];
    qword_1EB20E428 = 0;
    qword_1EB20E430 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E440 = 0;
    qword_1EB20E438 = 0;
    qword_1EB20E448 = 0;
    qword_1EB20E450 = *MEMORY[0x1E4F1D7F8];
    qword_1EB20E458 = 0;
    qword_1EB20E460 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E470 = 0;
    qword_1EB20E468 = 0;
    qword_1EB20E478 = 0;
    qword_1EB20E480 = @"NSURLUbiquitousItemIsExcludedFromSyncKey";
    qword_1EB20E488 = 0;
    qword_1EB20E490 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E498 = (uint64_t)SetWithFileProvider;
    qword_1EB20E4A8 = 0;
    qword_1EB20E4A0 = 0;
    qword_1EB20E4B0 = *MEMORY[0x1E4F1D7D0];
    qword_1EB20E4B8 = 0;
    qword_1EB20E4C0 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E4D0 = 0;
    qword_1EB20E4C8 = 0;
    qword_1EB20E4D8 = 0;
    qword_1EB20E4E0 = *MEMORY[0x1E4F1D7D8];
    qword_1EB20E4E8 = 0;
    qword_1EB20E4F0 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E500 = 0;
    qword_1EB20E4F8 = 0;
    qword_1EB20E508 = 0;
    qword_1EB20E510 = *MEMORY[0x1E4F1D7A8];
    qword_1EB20E518 = 0;
    qword_1EB20E520 = (uint64_t)CopyFromFileProvider;
    qword_1EB20E530 = 0;
    qword_1EB20E528 = 0;
    qword_1EB20E538 = 0;
    qword_1EB20E540 = *MEMORY[0x1E4F1CD80];
    qword_1EB20E548 = 0;
    qword_1EB20E550 = (uint64_t)GetFromCFURLPromises;
    qword_1EB20E558 = (uint64_t)SetWithCFURLPromises;
    qword_1EB20E568 = 0;
    qword_1EB20E560 = 0;
    qword_1EB20E570 = *MEMORY[0x1E4F1CD88];
    qword_1EB20E578 = 0;
    qword_1EB20E580 = (uint64_t)GetFromCFURLPromises;
    qword_1EB20E588 = (uint64_t)SetWithCFURLPromises;
    qword_1EB20E598 = 0;
    qword_1EB20E590 = 0;
    qword_1EB20E5A0 = *MEMORY[0x1E4F1D758];
    qword_1EB20E5A8 = 2;
    qword_1EB20E5B0 = (uint64_t)GetFromQuickLook;
    qword_1EB20E5B8 = (uint64_t)SetWithQuickLook;
    qword_1EB20E5C0 = (uint64_t)&registerExternalProviderProperties::thumbnailsDependencyKeys;
    qword_1EB20E5C8 = 1;
    qword_1EB20E5D0 = *MEMORY[0x1E4F1D760];
    qword_1EB20E5D8 = 2;
    qword_1EB20E5E0 = (uint64_t)GetFromQuickLook;
    qword_1EB20E5E8 = (uint64_t)SetWithQuickLook;
    qword_1EB20E5F0 = (uint64_t)&registerExternalProviderProperties::thumbnailsDependencyKeys;
    qword_1EB20E5F8 = 1;
  }
  v8[0] = xmmword_1ECA26348;
  v8[1] = *(_OWORD *)&off_1ECA26358;
  MEMORY[0x1F4188790](a1);
  uint64_t v1 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v2 = registerExternalProviderProperties::propertyTable;
  do
  {
    CFAllocatorRef v3 = v2 + 6;
    uint64_t v4 = *v2;
    v2 += 12;
    *(void *)&long long v5 = v4;
    *((void *)&v5 + 1) = *v3;
    *(_OWORD *)&v7[v1] = v5;
    v1 += 2;
  }
  while (v1 != 26);
  _RegisterFilePropertyProvider(v8, 0, v7, 0x1AuLL);
  for (uint64_t i = 0; i != 156; i += 6)
    _RegisterFilePropertyWithOptions((void *)registerExternalProviderProperties::propertyTable[i], registerExternalProviderProperties::propertyTable[i + 1], (const void **)registerExternalProviderProperties::propertyTable[i + 4], registerExternalProviderProperties::propertyTable[i + 5], (uint64_t)&registerExternalProviderProperties::propertyTable[i]);
}

uint64_t _RegisterFilePropertyProvider(_OWORD *a1, uint64_t a2, const __CFString **a3, size_t count)
{
  uint64_t v4 = count;
  uint64_t v6 = qword_1EB20DEF8++;
  uint64_t v7 = &sFileProviderGlobals[7 * v6];
  *((_DWORD *)v7 + 4) = v6;
  uint64_t v8 = v7 + 2;
  v7[3] = a2;
  *((_OWORD *)v7 + 2) = *a1;
  *((_OWORD *)v7 + 3) = a1[1];
  *((_DWORD *)v7 + 5) = 0;
  uint64_t v9 = (_DWORD *)v7 + 5;
  v7[8] = (uint64_t)malloc_type_calloc(count, 0x94uLL, 0x10E0040CEEF78F5uLL);
  size_t v10 = v7 + 8;
  if (v4 >= 1)
  {
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      CFStringRef v12 = *a3++;
      int v13 = (*v9)++;
      uint64_t v14 = *v10 + 148 * v13;
      *(_DWORD *)(v14 + 136) = v13;
      CFStringRef Copy = CFStringCreateCopy(v11, v12);
      *(void *)(v14 + 8) = Copy;
      *(void *)(v14 + 140) = v8;
      CFDictionaryAddValue((CFMutableDictionaryRef)qword_1EB20E028, Copy, (const void *)v14);
      --v4;
    }
    while (v4);
  }
  return v6;
}

void registerPathURLProperties(uint64_t a1)
{
  v7[7] = *(const __CFString **)MEMORY[0x1E4F143B8];
  {
    uint64_t v6 = *MEMORY[0x1E4F1CEB0];
    registerPathURLProperties(void)::parentDependencyKeys = *MEMORY[0x1E4F1D6E8];
    unk_1EB20E0F0 = v6;
  }
  {
    registerPathURLProperties(void)::propertyTable = *MEMORY[0x1E4F1D980];
    qword_1EB20E610 = 1;
    qword_1EB20E618 = MEMORY[0x1E4F1D6E8];
    qword_1EB20E620 = 1;
    qword_1EB20E628 = *MEMORY[0x1E4F1D740];
    unk_1EB20E630 = 1;
    qword_1EB20E638 = (uint64_t)&registerPathURLProperties(void)::parentDependencyKeys;
    unk_1EB20E640 = 2;
    qword_1EB20E648 = *MEMORY[0x1E4F1D680];
    unk_1EB20E650 = 1;
    qword_1EB20E658 = 0;
    unk_1EB20E660 = 0;
    qword_1EB20E668 = *MEMORY[0x1E4F1D748];
    unk_1EB20E670 = 1;
    qword_1EB20E678 = 0;
    unk_1EB20E680 = 0;
    qword_1EB20E688 = *MEMORY[0x1E4F1CE10];
    unk_1EB20E690 = 0;
    qword_1EB20E698 = 0;
    unk_1EB20E6A0 = 0;
    qword_1EB20E6A8 = *MEMORY[0x1E4F1CE18];
    unk_1EB20E6B0 = 0;
    qword_1EB20E6B8 = 0;
    unk_1EB20E6C0 = 0;
  }
  MEMORY[0x1F4188790](a1);
  uint64_t v1 = 0;
  memset(v7, 0, 48);
  uint64_t v2 = &qword_1EB20E628;
  do
  {
    *(void *)&long long v3 = *(v2 - 4);
    *((void *)&v3 + 1) = *v2;
    *(_OWORD *)&v7[v1] = v3;
    v2 += 8;
    v1 += 2;
  }
  while (v1 != 6);
  _RegisterFilePropertyProvider(&off_1ECA26308, 0, v7, 6uLL);
  uint64_t v4 = 0;
  long long v5 = &registerPathURLProperties(void)::propertyTable;
  do
  {
    _RegisterFilePropertyWithOptions((void *)v7[v4++], v5[1], (const void **)v5[2], v5[3], (uint64_t)v5);
    v5 += 4;
  }
  while (v4 != 6);
}

uint64_t _FileCacheInitClass(void)
{
  if (_FileCacheInitClass(void)::once != -1) {
    dispatch_once(&_FileCacheInitClass(void)::once, &__block_literal_global_0);
  }
  return sFileCacheTypeID;
}

os_log_t init_logging(void)
{
  defaultLog = (uint64_t)os_log_create("com.apple.FileURL", "default");
  securityScopedLog = (uint64_t)os_log_create("com.apple.FileURL", "scoped");
  bmarkLog = (uint64_t)os_log_create("com.apple.FileURL", "bookmark");
  resolveLog = (uint64_t)os_log_create("com.apple.FileURL", "resolve");
  os_log_t result = os_log_create("com.apple.FileURL", "alias");
  aliasLog = (uint64_t)result;
  return result;
}

CFDataRef _CFURLCreateBookmarkData(const __CFAllocator *a1, const __CFURL *a2, unint64_t a3, const __CFArray *a4, const __CFURL *a5, __CFError **a6)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CFStringRef v12 = _os_activity_create(&dword_181761000, "CFURLCreateBookmarkData", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &v17);
  int v13 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v19 = "_CFURLCreateBookmarkData";
    __int16 v20 = 2048;
    CFURLRef v21 = a2;
    __int16 v22 = 2112;
    CFURLRef v23 = a2;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2112;
    CFArrayRef v27 = a4;
    __int16 v28 = 2112;
    CFURLRef v29 = a5;
    _os_log_debug_impl(&dword_181761000, v13, OS_LOG_TYPE_DEBUG, "%s: <%p: %@> options=%#lx propertiesToInclude=%@ relativeToURL=%@", buf, 0x3Eu);
  }
  CFDataRef v14 = __CFURLCreateBookmarkData(a1, a2, a3, a4, a5, a6);
  uint64_t v15 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_DEBUG)) {
    _CFURLCreateBookmarkData_cold_1((uint64_t)v14, v15);
  }
  os_release(v12);
  os_activity_scope_leave(&v17);
  return v14;
}

CFDataRef __CFURLCreateBookmarkData(const __CFAllocator *a1, const __CFURL *a2, unint64_t a3, const __CFArray *a4, const __CFURL *a5, __CFError **a6)
{
  BookmarkMutableData::BookmarkMutableData((BookmarkMutableData *)v17, a1, 0x6B6F6F62u);
  if (a2)
  {
    CFRetain(a2);
    int IsReachable = CFURLResourceIsReachable(a2, 0);
    int v13 = _CFURLIsFileURL();
    if ((a3 & 0x10000400) == 0x10000000 || !v13 || IsReachable)
    {
      createBookmarkWithURLAtDepth(a1, a2, a3, a5, a4, (BookmarkMutableData *)v17, 1, IsReachable != 0, a6);
      CFDataRef v14 = BookmarkMutableData::Finalize(v17, 0, 0);
      if (!a6) {
        goto LABEL_15;
      }
    }
    else
    {
      if (!a6)
      {
        CFDataRef v14 = 0;
        goto LABEL_16;
      }
      CFDataRef v14 = 0;
      *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 260, 0);
    }
  }
  else
  {
    CFDataRef v14 = 0;
    if (!a6) {
      goto LABEL_15;
    }
  }
  if (!v14 && !*a6)
  {
    uint64_t v15 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
      __CFURLCreateBookmarkData(v15);
    }
    *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
LABEL_15:
  if (a2) {
LABEL_16:
  }
    CFRelease(a2);
  BookmarkMutableData::~BookmarkMutableData((BookmarkMutableData *)v17);
  return v14;
}

void BookmarkMutableData::~BookmarkMutableData(BookmarkMutableData *this)
{
  while (*((void *)this + 7))
  {
    free(*(void **)(*((void *)this + 6) + 16));
    uint64_t v2 = (uint64_t *)*((void *)this + 6);
    uint64_t v3 = *((void *)this + 7);
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = v2[1];
    *(void *)v2[1] = v4;
    *((void *)this + 7) = v3 - 1;
    operator delete(v2);
  }
  long long v5 = (void *)*((void *)this + 2);
  if (v5) {
    free(v5);
  }
  *((void *)this + 2) = 0;
  std::__list_imp<CFBookmarkTOC *>::clear((void *)this + 5);
}

void *std::__list_imp<CFBookmarkTOC *>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    os_log_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        os_log_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void BookmarkMutableData::BookmarkMutableData(BookmarkMutableData *this, const __CFAllocator *a2, int a3)
{
  *(void *)this = a2;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = currentBookmarkVersion();
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = (char *)this + 40;
  *((void *)this + 6) = (char *)this + 40;
  *((void *)this + 7) = 0;
  *((void *)this + 3) = 0x20000000004;
  uint64_t v4 = malloc_type_malloc(0x200uLL, 0x9C87C9CuLL);
  *((void *)this + 2) = v4;
  _DWORD *v4 = 0;
}

CFDataRef BookmarkMutableData::Finalize(CFAllocatorRef *this, const void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef Mutable = CFDataCreateMutable(*this, 0);
  long long v22 = 0u;
  long long v21 = 0u;
  int v7 = *((_DWORD *)this + 3);
  *(_DWORD *)bytes = *((_DWORD *)this + 2);
  int v18 = 0;
  int v19 = v7;
  int v20 = 48;
  CFDataAppendBytes(Mutable, bytes, 48);
  if (this[7])
  {
    uint64_t v8 = (char *)(this + 5);
    while (1)
    {
      CFAllocatorRef v9 = this[6];
      if (v9 != (CFAllocatorRef)v8) {
        break;
      }
      size_t v10 = 0;
LABEL_13:
      BookmarkMutableData::finalizeTOC((BookmarkMutableData *)this, v10);
      if (!this[7]) {
        goto LABEL_14;
      }
    }
    size_t v10 = 0;
    while (1)
    {
      if (v10)
      {
        CFAllocatorRef v11 = (_DWORD *)*((void *)v9 + 2);
        if (v10[2] <= v11[2]) {
          goto LABEL_10;
        }
      }
      else
      {
        CFAllocatorRef v11 = (_DWORD *)*((void *)v9 + 2);
      }
      size_t v10 = v11;
LABEL_10:
      CFAllocatorRef v9 = (CFAllocatorRef)*((void *)v9 + 1);
      if (v9 == (CFAllocatorRef)v8) {
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  CFStringRef v12 = (UInt8 *)this[2];
  *(_DWORD *)CFStringRef v12 = *((_DWORD *)this + 8);
  CFDataAppendBytes(Mutable, v12, *((unsigned int *)this + 6));
  if (CFDataGetLength(Mutable) > 2147483646)
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((_DWORD *)MutableBytePtr + 1) = CFDataGetLength(Mutable);
  if (a2)
  {
    if (a3 != 32) {
      BookmarkMutableData::Finalize();
    }
    size_t Length = CFDataGetLength(Mutable);
    CCHmac(2u, a2, 0x20uLL, MutableBytePtr, Length, MutableBytePtr + 16);
  }
  if (!Mutable) {
    return 0;
  }
  CFDataRef Copy = CFDataCreateCopy(*this, Mutable);
  CFRelease(Mutable);
  return Copy;
}

void createBookmarkWithURLAtDepth(const __CFAllocator *a1, const __CFURL *cf, unint64_t a3, const __CFURL *a4, const __CFArray *a5, BookmarkMutableData *this, int a7, char a8, __CFError **a9)
{
  CFURLRef v15 = cf;
  cfa[128] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFTypeRef v143 = 0;
  if (cf) {
    CFRetain(cf);
  }
  int TOC = BookmarkMutableData::createTOC(this, a7);
  int v18 = TOC;
  if (a3 && TOC) {
    BookmarkMutableData::encodeValue((void **)this, 0xD010u, a3, 0);
  }
  uint64_t inited = 0;
  unint64_t v20 = a3 & 0xFBFFFFFF;
  if ((a3 & 0x1000000) == 0) {
    unint64_t v20 = a3;
  }
  unint64_t v142 = v20;
  if ((a3 & 0x1000000) != 0) {
    int v21 = 0;
  }
  else {
    int v21 = v18;
  }
  if (v21 == 1)
  {
    double Helper_x8__FPCreateBookmarkableStringFromDocumentURL = gotLoadHelper_x8__FPCreateBookmarkableStringFromDocumentURL(v17);
    if (*(void *)(v23 + 2424)) {
      uint64_t inited = FPCreateBookmarkableStringFromDocumentURL_delayInitStub(Helper_x8__FPCreateBookmarkableStringFromDocumentURL);
    }
  }
  CFStringRef v135 = (const __CFString *)inited;
  __int16 v24 = a9;
  CFURLRef v25 = CFURLCopyAbsoluteURL(v15);
  if (!v18) {
    goto LABEL_210;
  }
  if (!_CFURLIsFileURL())
  {
    CFStringRef v29 = CFURLGetString(v25);
    BookmarkMutableData::encodeItem((void **)this, 0x1003u, v29, 0);
    goto LABEL_189;
  }
  CFArrayRef v136 = a5;
  CFURLRef cf1 = a4;
  CFURLRef v131 = v25;
  if (a8)
  {
    CFStringRef String = CFURLCopyQueryString(v25, 0);
    if (String) {
      BookmarkMutableData::encodeItem((void **)this, 0x1102u, String, 0);
    }
    CFStringRef v27 = CFURLCopyFragment(v25, 0);
    if (v27)
    {
      CFStringRef v28 = v27;
      BookmarkMutableData::encodeItem((void **)this, 0x1101u, v27, 0);
      CFRelease(v28);
    }
    if (String) {
      CFRelease(String);
    }
  }
  else
  {
    CFStringRef v30 = CFURLGetString(v25);
    BookmarkMutableData::encodeItem((void **)this, 0x1003u, v30, 0);
  }
  CFURLRef NormalizedFileURL = createNormalizedFileURL(v15);
  CFArrayRef URLParentageArray = createURLParentageArray(a1, NormalizedFileURL);
  uint64_t Count = CFArrayGetCount(URLParentageArray);
  uint64_t v33 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, Count, MEMORY[0x1E4F1D510]);
  CFMutableArrayRef theArray = CFArrayCreateMutable(a1, 0, v33);
  CFURLRef v140 = CFArrayCreateMutable(a1, 0, v33);
  int v132 = a7;
  CFStringRef v138 = this;
  int v130 = a3;
  if (Count < 1)
  {
    int v46 = 0;
    char v127 = 0;
    goto LABEL_65;
  }
  char v34 = 0;
  CFIndex v35 = 0;
  CFStringRef v36 = (const __CFString *)*MEMORY[0x1E4F1D980];
  CFStringRef v37 = (const __CFString *)*MEMORY[0x1E4F1D260];
  do
  {
    cfa[0] = 0;
    CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(URLParentageArray, v35);
    if (cfa[0])
    {
      CFRelease(cfa[0]);
      cfa[0] = 0;
    }
    if (CFURLCopyResourcePropertyForKey(ValueAtIndex, v36, cfa, 0)
      && cfa[0]
      && sameFileURL(ValueAtIndex, cfa[0]))
    {
      CFArrayAppendValue(Mutable, cfa[0]);
      v34 |= v35 != 0;
    }
    else
    {
      CFArrayAppendValue(Mutable, v37);
    }
    if (cfa[0]) {
      CFRelease(cfa[0]);
    }
    ++v35;
  }
  while (Count != v35);
  char v127 = v34;
  if (Count < 2)
  {
    int v46 = 0;
    goto LABEL_65;
  }
  char v125 = v18;
  CFURLRef v39 = v15;
  CFStringRef v40 = (const __CFString *)*MEMORY[0x1E4F1D738];
  for (CFIndex i = 1; i != Count; ++i)
  {
    CFURLRef v42 = (const __CFURL *)CFArrayGetValueAtIndex(URLParentageArray, i);
    cfa[0] = 0;
    if (v143)
    {
      CFRelease(v143);
      CFTypeRef v143 = 0;
    }
    if (CFURLCopyResourcePropertyForKey(v42, v40, cfa, (CFErrorRef *)&v143))
    {
      CFStringRef PathComponent = (CFStringRef)cfa[0];
      goto LABEL_43;
    }
    if ((v142 & 0x10000000) != 0)
    {
      CFStringRef PathComponent = CFURLCopyLastPathComponent(v42);
      if (cfa[0] != PathComponent)
      {
        if (cfa[0]) {
          CFRelease(cfa[0]);
        }
        cfa[0] = PathComponent;
      }
LABEL_43:
      char v44 = theArray;
      if (PathComponent) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (cfa[0]) {
      CFRelease(cfa[0]);
    }
    cfa[0] = 0;
    char v44 = theArray;
LABEL_49:
    CFStringRef PathComponent = v37;
LABEL_50:
    CFArrayAppendValue(v44, PathComponent);
    CFTypeRef propertyValueTypeRefPtr = 0;
    _CFURLGetVolumePropertyFlags();
    if (propertyValueTypeRefPtr) {
      CFTypeRef v45 = propertyValueTypeRefPtr;
    }
    else {
      CFTypeRef v45 = v37;
    }
    CFArrayAppendValue(v140, v45);
    if (propertyValueTypeRefPtr) {
      CFRelease(propertyValueTypeRefPtr);
    }
    if (cfa[0]) {
      CFRelease(cfa[0]);
    }
  }
  int v46 = 1;
  CFURLRef v15 = v39;
  LOBYTE(v18) = v125;
LABEL_65:
  BookmarkMutableData::encodeItem((void **)v138, 0x1004u, (const __CFString *)theArray, 0);
  if (!CFArrayGetCount(theArray))
  {
    cfa[0] = 0;
    if (CFURLCopyResourcePropertyForKey(v15, (CFStringRef)*MEMORY[0x1E4F1D738], cfa, 0))
    {
      if (cfa[0])
      {
        BookmarkMutableData::encodeItem((void **)v138, 0x1020u, (const __CFString *)cfa[0], 0);
        CFRelease(cfa[0]);
      }
    }
  }
  if (v143) {
    CFTypeID v47 = 0;
  }
  else {
    CFTypeID v47 = &v143;
  }
  this = v138;
  encodeResourcePropertyIntoBookmark((void **)v138, v15, (CFStringRef)*MEMORY[0x1E4F1D5A0], 0x1040u, (CFErrorRef *)v47);
  if (v136)
  {
    CFIndex v48 = CFArrayGetCount(v136);
    v146.CFIndex location = 0;
    v146.CFIndex length = v48;
    BOOL v49 = CFArrayContainsValue(v136, v146, (const void *)*MEMORY[0x1E4F1D6B8]) != 0;
    v147.CFIndex location = 0;
    v147.CFIndex length = v48;
    uint64_t v50 = v49 | (2 * (CFArrayContainsValue(v136, v147, (const void *)*MEMORY[0x1E4F1D678]) != 0));
    v148.CFIndex location = 0;
    v148.CFIndex length = v48;
    uint64_t v51 = v50 | (4 * (CFArrayContainsValue(v136, v148, (const void *)*MEMORY[0x1E4F1D6C8]) != 0));
    v149.CFIndex location = 0;
    v149.CFIndex length = v48;
    uint64_t v52 = v51 | (8 * (CFArrayContainsValue(v136, v149, (const void *)*MEMORY[0x1E4F1D6E8]) != 0));
    v150.CFIndex location = 0;
    v150.CFIndex length = v48;
    uint64_t v53 = v52 | (16 * (CFArrayContainsValue(v136, v150, (const void *)*MEMORY[0x1E4F1D6A0]) != 0));
    v151.CFIndex location = 0;
    v151.CFIndex length = v48;
    uint64_t v54 = v53 | (32 * (CFArrayContainsValue(v136, v151, (const void *)*MEMORY[0x1E4F1D6D0]) != 0));
    v152.CFIndex location = 0;
    v152.CFIndex length = v48;
    unint64_t v55 = v54 | ((unint64_t)(CFArrayContainsValue(v136, v152, (const void *)*MEMORY[0x1E4F1D6E0]) != 0) << 6);
    v153.CFIndex location = 0;
    v153.CFIndex length = v48;
    unint64_t v56 = v55 | ((unint64_t)(CFArrayContainsValue(v136, v153, (const void *)*MEMORY[0x1E4F1D690]) != 0) << 7);
    v154.CFIndex location = 0;
    v154.CFIndex length = v48;
    unint64_t v57 = v56 | ((unint64_t)(CFArrayContainsValue(v136, v154, (const void *)*MEMORY[0x1E4F1D660]) != 0) << 8);
    v155.CFIndex location = 0;
    v155.CFIndex length = v48;
    unint64_t v58 = v57 | ((unint64_t)(CFArrayContainsValue(v136, v155, (const void *)*MEMORY[0x1E4F1D670]) != 0) << 9);
  }
  else
  {
    unint64_t v58 = 0;
  }
  if (v143)
  {
    CFRelease(v143);
    CFTypeRef v143 = 0;
  }
  if ((v142 & 0x400) != 0) {
    uint64_t v59 = v58 | 0x21F;
  }
  else {
    uint64_t v59 = v58;
  }
  CFTypeRef propertyValueTypeRefPtr = 0;
  if (_CFURLGetResourcePropertyFlags())
  {
    cfa[0] = propertyValueTypeRefPtr;
    cfa[1] = (CFTypeRef)(v59 | 0xF);
    cfa[2] = (CFTypeRef)v59;
    BookmarkMutableData::encodeRawData((void **)v138, 0x1010u, (UInt8 *)cfa, 24);
  }
  if (CFURLIsFileReferenceURL(v15)) {
    BookmarkMutableData::encodeItem((void **)v138, 0xD001u, (const __CFString *)*MEMORY[0x1E4F1CFD0], 0);
  }
  if (CFURLGetBaseURL(v15))
  {
    CFURLRef v60 = CFURLGetBaseURL(v15);
    uint64_t v61 = CFArrayCreateMutable(a1, 0, MEMORY[0x1E4F1D510]);
    CFAllocatorRef v62 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    int v63 = 0;
    if (v46)
    {
      uint64_t v64 = Count + 1;
      do
      {
        CFAllocatorRef v65 = CFArrayGetValueAtIndex(URLParentageArray, v64 - 2);
        if (v60 && sameFileURL(v65, v60))
        {
          LODWORD(propertyValueTypeRefPtr) = v63;
          CFNumberRef v66 = CFNumberCreate(v62, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
          CFArrayInsertValueAtIndex(v61, 0, v66);
          if (v66) {
            CFRelease(v66);
          }
          CFURLRef v60 = CFURLGetBaseURL(v60);
          int v63 = 0;
        }
        ++v63;
        --v64;
      }
      while (v64 > 2);
    }
    LODWORD(propertyValueTypeRefPtr) = v63;
    CFNumberRef v67 = CFNumberCreate(v62, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
    CFArrayInsertValueAtIndex(v61, 0, v67);
    if (v67) {
      CFRelease(v67);
    }
    this = v138;
    BookmarkMutableData::encodeItem((void **)v138, 0xE003u, (const __CFString *)v61, 0);
    if (v61) {
      CFRelease(v61);
    }
  }
  if (cf1)
  {
    CFTypeID v68 = CFGetTypeID(cf1);
    if (v68 == CFURLGetTypeID() && !sameFileURL(cf1, v15))
    {
      CFURLRef v69 = createNormalizedFileURL(cf1);
      CFArrayRef v70 = createURLParentageArray(a1, v69);
      CFIndex v71 = CFArrayGetCount(URLParentageArray);
      CFIndex v72 = CFArrayGetCount(v70);
      if (v72 >= v71) {
        uint64_t v73 = v71;
      }
      else {
        uint64_t v73 = v72;
      }
      if (v73 >= 1)
      {
        CFIndex v74 = 0;
        while (1)
        {
          uint64_t v75 = CFArrayGetValueAtIndex(URLParentageArray, v74);
          unint64_t v76 = CFArrayGetValueAtIndex(v70, v74);
          if (!sameFileURL(v75, v76)) {
            break;
          }
          if (v73 == ++v74)
          {
            CFIndex v74 = v73;
            break;
          }
        }
        if ((unint64_t)v74 > 1)
        {
          BookmarkMutableData::encodeItem((void **)this, 0x1056u, (const __CFString *)*MEMORY[0x1E4F1CFD0], 0);
          if (CFArrayGetCount(v70) > v74)
          {
            CFIndex v77 = CFArrayGetCount(v70);
            if (v77 - v74 <= 2147483646) {
              BookmarkMutableData::encodeValue((void **)this, 0x1054u, v77 - v74, 0);
            }
          }
          if (CFArrayGetCount(URLParentageArray) > v74)
          {
            CFIndex v78 = CFArrayGetCount(URLParentageArray);
            if (v78 - v74 <= 2147483646) {
              BookmarkMutableData::encodeValue((void **)this, 0x1055u, v78 - v74, 0);
            }
          }
        }
      }
      if (v70) {
        CFRelease(v70);
      }
      if (v69) {
        CFRelease(v69);
      }
    }
  }
  CFURLRef v79 = copyUserHomeFolderURL(a1);
  if (v79)
  {
    CFURLRef v80 = v79;
    if (sameFileURL(v15, v79))
    {
      CFRelease(v80);
      goto LABEL_122;
    }
    CFIndex v90 = CFArrayGetCount(URLParentageArray);
    if (v90 >= 1)
    {
      unint64_t v91 = v90;
      BOOL v92 = 0;
      do
      {
        uint64_t v93 = CFArrayGetValueAtIndex(URLParentageArray, v91 - 1);
        if (v93) {
          BOOL v92 = sameFileURL(v93, v80) != 0;
        }
        if (v91 < 2) {
          break;
        }
        --v91;
      }
      while (!v92);
      CFRelease(v80);
      if (!v92) {
        goto LABEL_141;
      }
LABEL_122:
      CFURLRef v81 = copyUserHomeFolderURL(a1);
      if (!v81) {
        goto LABEL_141;
      }
      CFURLRef v80 = v81;
      CFIndex v82 = CFArrayGetCount(URLParentageArray);
      while (v82-- >= 1)
      {
        CFStringRef v84 = CFArrayGetValueAtIndex(URLParentageArray, v82);
        if (sameFileURL(v84, v80))
        {
          CFStringRef v85 = (const void *)(~v82 + CFArrayGetCount(URLParentageArray));
          CFAllocatorRef v86 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CFTypeRef propertyValueTypeRefPtr = v85;
          CFStringRef v87 = (const __CFString *)CFNumberCreate(v86, kCFNumberLongType, &propertyValueTypeRefPtr);
          BookmarkMutableData::encodeItem((void **)this, 0xC001u, v87, 0);
          if (v87) {
            CFRelease(v87);
          }
          CFStringRef v88 = (const __CFString *)CFCopyUserName();
          BookmarkMutableData::encodeItem((void **)this, 0xC011u, v88, 0);
          if (v88) {
            CFRelease(v88);
          }
          LODWORD(propertyValueTypeRefPtr) = _CFGetEUID();
          CFStringRef v89 = (const __CFString *)CFNumberCreate(v86, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
          BookmarkMutableData::encodeItem((void **)this, 0xC012u, v89, 0);
          if (v89) {
            CFRelease(v89);
          }
          break;
        }
      }
    }
    CFRelease(v80);
  }
LABEL_141:
  if (v127)
  {
    char v126 = v18;
    CFURLRef cf1a = v15;
    CFStringRef v94 = CFArrayCreateMutable(a1, Count, MEMORY[0x1E4F1D510]);
    CFAllocatorRef v95 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    LODWORD(propertyValueTypeRefPtr) = 0;
    CFAllocatorRef v128 = v95;
    CFNumberRef v96 = CFNumberCreate(v95, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
    if (Count >= 1)
    {
      for (CFIndex j = 0; j != Count; ++j)
        CFArrayInsertValueAtIndex(v94, j, v96);
      CFIndex v98 = Count;
      int v99 = v132;
      do
      {
        CFIndex v100 = v98--;
        uint64_t v101 = CFArrayGetValueAtIndex(Mutable, v98);
        if (v101)
        {
          uint64_t v102 = v101;
          CFTypeID v103 = CFGetTypeID(v101);
          if (v103 == CFURLGetTypeID())
          {
            v156.CFIndex length = Count - v100;
            v156.CFIndex location = v100;
            FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(Mutable, v156, v102);
            this = v138;
            if (FirstIndexOfValue == -1)
            {
              if (v143)
              {
                CFRelease(v143);
                CFTypeRef v143 = 0;
              }
              if (addVolumeInfoForURLToBookmark(a1, v138, v102, v142, v99, v136, (__CFError **)&v143))
              {
                LODWORD(propertyValueTypeRefPtr) = v99;
                CFNumberRef v106 = CFNumberCreate(v128, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
                CFArraySetValueAtIndex(v94, v98, v106);
                if (v106) {
                  CFRelease(v106);
                }
              }
            }
            else
            {
              uint64_t v105 = CFArrayGetValueAtIndex(v94, FirstIndexOfValue);
              CFArraySetValueAtIndex(v94, v98, v105);
            }
            if (BookmarkMutableData::tocExists(v138, v99))
            {
              do
              {
                if ((v99 + 1) > 0xF000) {
                  ++v99;
                }
                else {
                  int v99 = 61440;
                }
              }
              while ((BookmarkMutableData::tocExists(v138, v99) & 1) != 0);
            }
          }
          else
          {
            this = v138;
          }
        }
      }
      while (v100 > 1);
    }
    BookmarkMutableData::encodeItem((void **)this, 0x2000u, (const __CFString *)v94, 0);
    if (v96) {
      CFRelease(v96);
    }
    CFURLRef v15 = cf1a;
    a7 = v132;
    LOBYTE(v18) = v126;
    goto LABEL_172;
  }
  a7 = v132;
  if (CFArrayGetCount(Mutable) >= 1)
  {
    CFStringRef v94 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"/", kCFURLPOSIXPathStyle, 1u);
    CFTypeRef v107 = CFArrayGetValueAtIndex(Mutable, 0);
    if (v143)
    {
      CFRelease(v143);
      CFTypeRef v143 = 0;
    }
    addVolumeInfoForURLToBookmark(a1, this, v107, v142, v132, v136, (__CFError **)&v143);
    if (sameFileURL(v107, v94)) {
      BookmarkMutableData::encodeItem((void **)this, 0x2030u, (const __CFString *)*MEMORY[0x1E4F1CFD0], 0);
    }
LABEL_172:
    if (v94) {
      CFRelease(v94);
    }
  }
  CFTypeRef propertyValueTypeRefPtr = 0;
  CFStringRef v108 = (const __CFString *)*MEMORY[0x1E4F1D5B0];
  if (CFURLCopyResourcePropertyForKey(v15, (CFStringRef)*MEMORY[0x1E4F1D5B0], &propertyValueTypeRefPtr, 0)) {
    BOOL v109 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v109 = 1;
  }
  if (!v109)
  {
    BookmarkMutableData::encodeItem((void **)this, v108, (const __CFString *)propertyValueTypeRefPtr, 0);
    CFRelease(propertyValueTypeRefPtr);
  }
  LODWORD(a3) = v130;
  if (v140) {
    CFRelease(v140);
  }
  if (theArray) {
    CFRelease(theArray);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (URLParentageArray) {
    CFRelease(URLParentageArray);
  }
  __int16 v24 = a9;
  CFURLRef v25 = v131;
  a5 = v136;
  if (NormalizedFileURL) {
    CFRelease(NormalizedFileURL);
  }
LABEL_189:
  if ((a3 & 0x1000000) == 0 && v135)
  {
    BookmarkMutableData::encodeItem((void **)this, 0x2070u, v135, 0);
    CFRelease(v135);
  }
  if ((v142 & 0x400) != 0 && a7 == 1)
  {
    encodeResourcePropertyIntoBookmark((void **)this, v15, (CFStringRef)*MEMORY[0x1E4F1D718], 0xF017u, 0);
    encodeResourcePropertyIntoBookmark((void **)this, v15, (CFStringRef)*MEMORY[0x1E4F1CED8], 0xF022u, 0);
  }
  if (a5)
  {
    CFTypeID v110 = CFGetTypeID(a5);
    if (v110 == CFArrayGetTypeID() && CFArrayGetCount(a5) >= 1)
    {
      CFIndex v111 = 0;
      do
      {
        CFStringRef v112 = (const __CFString *)CFArrayGetValueAtIndex(a5, v111);
        if (v112)
        {
          CFStringRef v113 = v112;
          CFTypeID v114 = CFGetTypeID(v112);
          if (v114 == CFStringGetTypeID())
          {
            cfa[0] = 0;
            if (v143)
            {
              CFRelease(v143);
              CFTypeRef v143 = 0;
            }
            int v115 = CFURLCopyResourcePropertyForKey(v15, v113, cfa, (CFErrorRef *)&v143);
            CFTypeRef v116 = cfa[0];
            if (v115 && cfa[0])
            {
              BookmarkMutableData::encodeItem((void **)this, v113, (const __CFString *)cfa[0], 0);
              CFTypeRef v116 = cfa[0];
            }
            if (v116) {
              CFRelease(v116);
            }
          }
        }
        ++v111;
      }
      while (v111 < CFArrayGetCount(a5));
    }
  }
  if ((v142 & 0x20000400) == 0 && CFURLGetFileSystemRepresentation(v15, 1u, (UInt8 *)cfa, 1024))
  {
    if ((v142 & 0x40000000) == 0)
    {
      getpid();
      if (!sandbox_check())
      {
        uint64_t v119 = (const char *)sandbox_extension_issue_file();
        if (v119)
        {
          uint64_t v120 = (UInt8 *)v119;
          CFIndex v121 = strlen(v119) + 1;
          uint64_t v122 = (void **)this;
          unsigned int v123 = 61568;
          goto LABEL_233;
        }
      }
    }
    getpid();
    if (!sandbox_check())
    {
      CFRange v124 = (const char *)sandbox_extension_issue_file();
      if (v124)
      {
        uint64_t v120 = (UInt8 *)v124;
        CFIndex v121 = strlen(v124) + 1;
        uint64_t v122 = (void **)this;
        unsigned int v123 = 61569;
LABEL_233:
        BookmarkMutableData::encodeRawData(v122, v123, v120, v121);
        free(v120);
      }
    }
  }
LABEL_210:
  BookmarkMutableData::finalizeTOC(this, a7);
  if (v24) {
    char v117 = v18;
  }
  else {
    char v117 = 1;
  }
  if ((v117 & 1) == 0)
  {
    uint64_t v118 = (__CFError *)v143;
    if (v143) {
      CFTypeRef v143 = 0;
    }
    else {
      uint64_t v118 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
    }
    *__int16 v24 = v118;
  }
  if (v25) {
    CFRelease(v25);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v143) {
    CFRelease(v143);
  }
}

uint64_t sameFileURL(CFTypeRef cf1, CFTypeRef cf2)
{
  uint64_t result = cf1 == cf2;
  if (cf2)
  {
    if (cf1)
    {
      if (cf1 != cf2)
      {
        uint64_t result = CFEqual(cf1, cf2);
        if (!result)
        {
          CFTypeID v5 = CFGetTypeID(cf1);
          if (v5 == CFURLGetTypeID() && (CFTypeID v6 = CFGetTypeID(cf2), v6 == CFURLGetTypeID()))
          {
            _CFURLCopyResourcePropertyValuesAndFlags();
            return 0;
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t BookmarkMutableData::tocExists(BookmarkMutableData *this, int a2)
{
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2 == (void *)((char *)this + 40)) {
    goto LABEL_9;
  }
  do
  {
    uint64_t v3 = v2[2];
    if (a2 && *(_DWORD *)(v3 + 8) != a2) {
      uint64_t v3 = 0;
    }
    if (v3) {
      break;
    }
    uint64_t v2 = (void *)v2[1];
  }
  while (v2 != (void *)((char *)this + 40));
  if (!v3)
  {
LABEL_9:
    uint64_t v4 = *((unsigned int *)this + 8);
    if (v4)
    {
      unint64_t v5 = *((unsigned int *)this + 6);
      if (v4 + 20 <= v5)
      {
        for (uint64_t i = *((void *)this + 2) + v4; ; uint64_t i = *((void *)this + 2) + v8)
        {
          LOBYTE(v4) = *(_DWORD *)(i + 8) == a2;
          if (*(_DWORD *)(i + 8) == a2) {
            break;
          }
          uint64_t v8 = *(unsigned int *)(i + 12);
          if (!v8) {
            goto LABEL_11;
          }
          if (v8 + 20 > v5) {
            break;
          }
        }
      }
      else
      {
LABEL_11:
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4 & 1;
}

uint64_t addVolumeInfoForURLToBookmark(const __CFAllocator *a1, BookmarkMutableData *a2, CFTypeRef cf, unint64_t a4, int a5, const __CFArray *a6, __CFError **a7)
{
  CFStringRef propertyValueTypeRefPtr = 0;
  if (!cf) {
    return 0;
  }
  CFTypeID v14 = CFGetTypeID(cf);
  if (v14 != CFURLGetTypeID()) {
    return 0;
  }
  int v15 = CFURLCopyResourcePropertyForKey((CFURLRef)cf, (CFStringRef)*MEMORY[0x1E4F1D980], &propertyValueTypeRefPtr, a7);
  CFStringRef v16 = propertyValueTypeRefPtr;
  if (!v15)
  {
    uint64_t v22 = 0;
    if (!propertyValueTypeRefPtr) {
      return v22;
    }
    goto LABEL_51;
  }
  if (!propertyValueTypeRefPtr) {
    return 0;
  }
  char v17 = BookmarkMutableData::tocExists(a2, a5);
  BookmarkMutableData::createTOC(a2, a5);
  if (_CFURLIsFileURL()) {
    BookmarkMutableData::encodeItem((void **)a2, 0x2005u, propertyValueTypeRefPtr, 0);
  }
  encodeResourcePropertyIntoBookmark((void **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E4F1D8B0], 0x2010u, a7);
  encodeResourcePropertyIntoBookmark((void **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E4F1D968], 0x2012u, a7);
  encodeResourcePropertyIntoBookmark((void **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E4F1D5A0], 0x2013u, a7);
  encodeResourcePropertyIntoBookmark((void **)a2, (CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E4F1D988], 0x2011u, a7);
  if (a6)
  {
    CFIndex Count = CFArrayGetCount(a6);
    v36.CFIndex location = 0;
    v36.CFIndex length = Count;
    uint64_t v19 = CFArrayContainsValue(a6, v36, (const void *)*MEMORY[0x1E4F1D928]) != 0;
    v37.CFIndex location = 0;
    v37.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v37, (const void *)*MEMORY[0x1E4F1D950])) {
      uint64_t v20 = ((unint64_t)(v19 & 1) << 32) | 0x1000000000;
    }
    else {
      uint64_t v20 = v19 << 32;
    }
    v38.CFIndex location = 0;
    v38.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v38, (const void *)*MEMORY[0x1E4F1D910])) {
      v20 |= 0x2000000000000uLL;
    }
    v39.CFIndex location = 0;
    v39.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v39, (const void *)*MEMORY[0x1E4F1D920])) {
      v20 |= 0x10000000000uLL;
    }
    v40.CFIndex location = 0;
    v40.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v40, (const void *)*MEMORY[0x1E4F1D868])) {
      v20 |= 0x20000000000000uLL;
    }
    v41.CFIndex location = 0;
    v41.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v41, (const void *)*MEMORY[0x1E4F1D940])) {
      v20 |= 0x40000000000000uLL;
    }
    v42.CFIndex location = 0;
    v42.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v42, (const void *)*MEMORY[0x1E4F1D960])) {
      v20 |= 0x80000000000000uLL;
    }
    v43.CFIndex location = 0;
    v43.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v43, (const void *)*MEMORY[0x1E4F1D8E0])) {
      v20 |= 0x80000000000uLL;
    }
    v44.CFIndex location = 0;
    v44.CFIndex length = Count;
    if (CFArrayContainsValue(a6, v44, (const void *)*MEMORY[0x1E4F1D8D8])) {
      uint64_t v21 = v20 | 0x100000000000;
    }
    else {
      uint64_t v21 = v20;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  *(void *)bytes = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  CFTypeRef cfa = 0;
  if (_CFURLGetVolumePropertyFlags())
  {
    uint64_t v24 = (a4 & 0x400) != 0 ? v21 | 0x1000013EFLL : v21;
    *(void *)bytes = cfa;
    uint64_t v32 = v21 | 0x1000013EFLL;
    uint64_t v33 = v24;
    BookmarkMutableData::encodeRawData((void **)a2, 0x2020u, bytes, 24);
    if ((bytes[1] & 2) != 0)
    {
      CFTypeRef cfa = 0;
      int v25 = CFURLCopyResourcePropertyForKey((CFURLRef)propertyValueTypeRefPtr, (CFStringRef)*MEMORY[0x1E4F1CD98], &cfa, 0);
      CFTypeRef v26 = cfa;
      if (v25 && cfa)
      {
        CFTypeID v27 = CFGetTypeID(cfa);
        if (v27 == CFURLGetTypeID())
        {
          int UnusedDepth = BookmarkMutableData::findUnusedDepth(a2, 4000, 0xFFFFFFFF);
          if (UnusedDepth)
          {
            unsigned int v29 = UnusedDepth;
            BookmarkMutableData::encodeValue((void **)a2, 0x2040u, UnusedDepth, 0);
            createBookmarkWithURLAtDepth(a1, cfa, a4, 0, 0, a2, v29, 1, a7);
          }
        }
        CFTypeRef v26 = cfa;
      }
      if (v26) {
        CFRelease(v26);
      }
    }
  }
  CFStringRef v30 = CFURLCopyFileSystemPath((CFURLRef)propertyValueTypeRefPtr, kCFURLPOSIXPathStyle);
  if (v30) {
    BookmarkMutableData::encodeItem((void **)a2, 0x2002u, v30, 0);
  }
  if ((v17 & 1) == 0) {
    BookmarkMutableData::finalizeTOC(a2, a5);
  }
  if (v30) {
    CFRelease(v30);
  }
  uint64_t v22 = 1;
  CFStringRef v16 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr) {
LABEL_51:
  }
    CFRelease(v16);
  return v22;
}

void encodeResourcePropertyIntoBookmark(void **a1, CFURLRef url, CFStringRef key, unsigned int a4, CFErrorRef *error)
{
  CFStringRef propertyValueTypeRefPtr = 0;
  int v7 = CFURLCopyResourcePropertyForKey(url, key, &propertyValueTypeRefPtr, error);
  CFStringRef v8 = propertyValueTypeRefPtr;
  if (v7 && propertyValueTypeRefPtr)
  {
    BookmarkMutableData::encodeItem(a1, a4, propertyValueTypeRefPtr, 0);
    CFStringRef v8 = propertyValueTypeRefPtr;
  }
  if (v8) {
    CFRelease(v8);
  }
}

uint64_t BookmarkMutableData::appendTOCItem(uint64_t **this, unsigned int a2, int a3, int a4)
{
  if (!this[7]) {
    BookmarkMutableData::createTOC((BookmarkMutableData *)this, 1);
  }
  CFStringRef v8 = this[6];
  CFAllocatorRef v9 = (_DWORD *)v8[2];
  int v10 = v9[4];
  if (v10)
  {
    char v11 = 0;
    CFStringRef v12 = v9 + 6;
    uint64_t v13 = v9[4];
    do
    {
      if (a2 == *(v12 - 1))
      {
        v11 |= *v12 == a3;
        if (*v12 == a3) {
          a2 = 0;
        }
      }
      v12 += 3;
      --v13;
    }
    while (v13);
    if (!a2) {
      return v11 & 1;
    }
  }
  else
  {
    char v11 = 0;
    if (!a2) {
      return v11 & 1;
    }
  }
  CFTypeID v14 = (uint64_t *)(this + 5);
  size_t v15 = 12 * (v10 + 1) + 20;
  while (v8 != v14)
  {
    if ((_DWORD *)v8[2] == v9)
    {
      CFTypeID v14 = v8;
      break;
    }
    CFStringRef v8 = (uint64_t *)v8[1];
  }
  uint64_t v16 = *v14;
  *(void *)(v16 + 8) = v14[1];
  *(void *)v14[1] = v16;
  this[7] = (uint64_t *)((char *)this[7] - 1);
  operator delete(v14);
  char v17 = malloc_type_realloc(v9, v15, 0x8DD0CEAAuLL);
  int v18 = this[6];
  uint64_t v19 = operator new(0x18uLL);
  v19[2] = v17;
  uint64_t v20 = *v18;
  *(void *)(v20 + 8) = v19;
  *uint64_t v19 = v20;
  *int v18 = (uint64_t)v19;
  v19[1] = v18;
  this[7] = (uint64_t *)((char *)this[7] + 1);
  *char v17 = v15;
  v17[4] = v10 + 1;
  if (v10)
  {
    uint64_t v21 = (uint64_t)&v17[3 * v10 + 5];
    while (1)
    {
      uint64_t v22 = (v10 - 1);
      uint64_t v23 = &v17[3 * v22];
      unsigned int v25 = v23[5];
      uint64_t v24 = v23 + 5;
      if (a2 >= v25) {
        break;
      }
      uint64_t v26 = *(void *)v24;
      *(_DWORD *)(v21 + 8) = v24[2];
      *(void *)uint64_t v21 = v26;
      v21 -= 12;
      --v10;
      if (!v22) {
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    int v10 = 0;
  }
  CFTypeID v27 = &v17[3 * v10];
  v27[5] = a2;
  v27[6] = a3;
  v27[7] = a4;
  char v11 = 1;
  return v11 & 1;
}

uint64_t BookmarkMutableData::encodeItem(void **this, unsigned int a2, const __CFString *a3, int a4)
{
  if (!a3) {
    return 0;
  }
  int v7 = BookmarkMutableData::encodeItem(this, a3);
  if (!v7) {
    return 0;
  }
  return BookmarkMutableData::appendTOCItem((uint64_t **)this, a2, v7, a4);
}

_DWORD *BookmarkMutableData::encodeItem(void **this, const __CFString *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a2);
  if ((const __CFString *)*MEMORY[0x1E4F1CFD0] == a2)
  {
    int v7 = this;
    int v8 = 1281;
LABEL_10:
    CFAllocatorRef v9 = 0;
    size_t Length = 0;
LABEL_11:
    return (_DWORD *)BookmarkMutableData::appendDataItem(v7, v8, v9, Length);
  }
  if ((const __CFString *)*MEMORY[0x1E4F1CFC8] == a2)
  {
    int v7 = this;
    int v8 = 1280;
    goto LABEL_10;
  }
  CFTypeID v5 = v4;
  if (v4 == CFStringGetTypeID())
  {
    return (_DWORD *)BookmarkMutableData::encodeCFStringAs(this, a2, 257);
  }
  if (v5 == CFNumberGetTypeID())
  {
    char v11 = 0;
    switch(CFNumberGetType((CFNumberRef)a2))
    {
      case kCFNumberSInt8Type:
        valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt8Type, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 769;
        goto LABEL_54;
      case kCFNumberSInt16Type:
        *(_WORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt16Type, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 770;
        goto LABEL_57;
      case kCFNumberSInt32Type:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 771;
        goto LABEL_60;
      case kCFNumberSInt64Type:
        *(void *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 772;
        goto LABEL_22;
      case kCFNumberFloat32Type:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat32Type, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 773;
        goto LABEL_60;
      case kCFNumberFloat64Type:
        *(void *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 774;
        goto LABEL_22;
      case kCFNumberCharType:
        valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCharType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 775;
LABEL_54:
        size_t v15 = 1;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v12, v13, &valuePtr, v15);
      case kCFNumberShortType:
        *(_WORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberShortType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 776;
LABEL_57:
        size_t v15 = 2;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v12, v13, &valuePtr, v15);
      case kCFNumberIntType:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 777;
LABEL_60:
        size_t v15 = 4;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v12, v13, &valuePtr, v15);
      case kCFNumberLongType:
        *(void *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberLongType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 778;
        goto LABEL_22;
      case kCFNumberLongLongType:
        *(void *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 779;
        goto LABEL_22;
      case kCFNumberCFIndexType:
        *(void *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCFIndexType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 782;
        goto LABEL_22;
      case kCFNumberNSIntegerType:
        *(void *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberNSIntegerType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 783;
        goto LABEL_22;
      case kCFNumberCGFloatType:
        *(void *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCGFloatType, &valuePtr)) {
          return 0;
        }
        CFStringRef v12 = this;
        int v13 = 784;
        goto LABEL_22;
      default:
        return v11;
    }
  }
  if (v5 == CFDataGetTypeID())
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)a2);
    size_t Length = CFDataGetLength((CFDataRef)a2);
    int v7 = this;
    int v8 = 513;
    CFAllocatorRef v9 = BytePtr;
    goto LABEL_11;
  }
  if (v5 == CFDateGetTypeID())
  {
    *(void *)&valuePtr.byte0 = bswap64(COERCE_UNSIGNED_INT64(MEMORY[0x1852FFDA0](a2)));
    CFStringRef v12 = this;
    int v13 = 1024;
LABEL_22:
    size_t v15 = 8;
    return (_DWORD *)BookmarkMutableData::appendDataItem(v12, v13, &valuePtr, v15);
  }
  if (v5 != CFArrayGetTypeID())
  {
    if (v5 == CFDictionaryGetTypeID())
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a2);
      uint64_t v22 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      uint64_t v23 = malloc_type_malloc(8 * Count, 0x738D9100uLL);
      uint64_t v24 = v23;
      if (v22 && v23)
      {
        CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v22, 0);
        if (Count < 1)
        {
          uint64_t v25 = 0;
        }
        else
        {
          uint64_t v25 = 0;
          uint64_t v26 = v22;
          do
          {
            int v27 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, *v26);
            v24[v25] = v27;
            if (v27)
            {
              int Value = CFDictionaryGetValue((CFDictionaryRef)a2, *v26);
              int v29 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, Value);
              if (v29)
              {
                v24[v25 + 1] = v29;
                v25 += 2;
              }
            }
            ++v26;
            --Count;
          }
          while (Count);
        }
        uint64_t appended = BookmarkMutableData::appendDataItem(this, 1793, v24, 4 * v25);
      }
      else
      {
        uint64_t appended = 0;
        char v11 = 0;
        if (!v22)
        {
LABEL_90:
          if (v24) {
            free(v24);
          }
          return v11;
        }
      }
      free(v22);
      char v11 = (_DWORD *)appended;
      goto LABEL_90;
    }
    if (v5 == CFUUIDGetTypeID())
    {
      CFUUIDBytes valuePtr = CFUUIDGetUUIDBytes((CFUUIDRef)a2);
      CFStringRef v12 = this;
      int v13 = 2049;
      size_t v15 = 16;
      return (_DWORD *)BookmarkMutableData::appendDataItem(v12, v13, &valuePtr, v15);
    }
    if (v5 == CFURLGetTypeID())
    {
      if (!CFURLIsFileReferenceURL((CFURLRef)a2)
        || (CFAllocatorRef v31 = CFGetAllocator(a2), (v32 = CFURLCreateFilePathURL(v31, (CFURLRef)a2, 0)) == 0))
      {
        CFRetain(a2);
        CFURLRef v32 = (const __CFURL *)a2;
      }
      CFURLRef v33 = CFURLGetBaseURL(v32);
      if (v33)
      {
        *(_DWORD *)&valuePtr.byte0 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, v33);
        CFStringRef v34 = CFURLGetString(v32);
        *(_DWORD *)&valuePtr.byte4 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, v34);
        uint64_t v35 = BookmarkMutableData::appendDataItem(this, 2306, &valuePtr, 8uLL);
      }
      else
      {
        CFStringRef v37 = CFURLGetString(v32);
        uint64_t v35 = BookmarkMutableData::encodeCFStringAs(this, v37, 2305);
      }
      char v11 = (_DWORD *)v35;
      CFRelease(v32);
      return v11;
    }
    if (v5 == CFNullGetTypeID())
    {
      int v7 = this;
      int v8 = 2561;
      goto LABEL_10;
    }
    return 0;
  }
  CFIndex v16 = CFArrayGetCount((CFArrayRef)a2);
  char v11 = malloc_type_malloc(4 * v16, 0x100004052888210uLL);
  if (!v11) {
    return v11;
  }
  if (v16 < 1)
  {
    uint64_t v18 = 0;
  }
  else
  {
    CFIndex v17 = 0;
    uint64_t v18 = 0;
    do
    {
      CFURLRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, v17);
      int v20 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, ValueAtIndex);
      if (v20) {
        v11[v18++] = v20;
      }
      ++v17;
    }
    while (v16 != v17);
  }
  uint64_t v36 = BookmarkMutableData::appendDataItem(this, 1537, v11, 4 * v18);
  free(v11);
  return (_DWORD *)v36;
}

uint64_t BookmarkMutableData::appendDataItem(void **this, int a2, const void *a3, size_t a4)
{
  uint64_t DataItem = BookmarkMutableData::findDataItem((BookmarkMutableData *)this, a2, a3, a4);
  uint64_t v9 = DataItem;
  if (a4 <= 0x7FFFFFFE && !DataItem)
  {
    if ((a4 & 3) != 0) {
      uint64_t v10 = 4 - (a4 & 3);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v9 = *((unsigned int *)this + 6);
    unint64_t v11 = a4 + 8 + v10 + v9;
    if (v11 > 0x7FFFFFFE)
    {
      return 0;
    }
    else
    {
      unint64_t v12 = *((unsigned int *)this + 7);
      if (v11 <= v12)
      {
        size_t v15 = (char *)this[2];
      }
      else
      {
        unint64_t v13 = 2 * v12;
        if (v13 >= 0x7FFFFFFF) {
          unint64_t v13 = 0x7FFFFFFFLL;
        }
        if (v11 <= v13) {
          size_t v14 = v13;
        }
        else {
          size_t v14 = v11;
        }
        *((_DWORD *)this + 7) = v14;
        size_t v15 = (char *)malloc_type_realloc(this[2], v14, 0xC102FDF2uLL);
        this[2] = v15;
        uint64_t v9 = *((unsigned int *)this + 6);
      }
      *((_DWORD *)this + 6) = v11;
      CFIndex v16 = &v15[v9];
      *(_DWORD *)CFIndex v16 = a4;
      *((_DWORD *)v16 + 1) = a2;
      if (a3)
      {
        if ((v9 + 8) <= *((_DWORD *)this + 6)) {
          CFIndex v17 = (char *)this[2] + (v9 + 8);
        }
        else {
          CFIndex v17 = 0;
        }
        memcpy(v17, a3, a4);
      }
      if ((a4 & 3) != 0) {
        bzero((char *)this[2] + (a4 + 8 + v9), 4 - (a4 & 3));
      }
    }
  }
  return v9;
}

uint64_t BookmarkMutableData::findDataItem(BookmarkMutableData *this, int a2, const void *__s1, size_t __n)
{
  if (a2)
  {
    unint64_t v5 = *((unsigned int *)this + 6);
    if (v5 >= 5)
    {
      uint64_t v9 = 4;
      do
      {
        if ((unint64_t)v9 + 8 > v5) {
          break;
        }
        uint64_t v10 = *((void *)this + 2);
        if (!v10) {
          break;
        }
        unint64_t v11 = (unsigned int *)(v10 + v9);
        uint64_t v12 = *v11;
        if (v12 <= 0xFFFFFFF6 && v12 + (unint64_t)v9 + 8 > v5) {
          break;
        }
        if (v12 == __n && v11[1] == a2 && (!__s1 || !memcmp(__s1, v11 + 2, __n))) {
          return v9;
        }
        uint64_t v9 = (v9 + v12 + 11) & 0xFFFFFFFC;
      }
      while (v9 < v5);
    }
  }
  return 0;
}

uint64_t BookmarkMutableData::encodeCFStringAs(void **this, CFStringRef theString, int a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFIndex Length = CFStringGetLength(theString);
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    int v8 = CStringPtr;
    size_t v9 = strlen(CStringPtr);
    uint64_t v10 = this;
    int v11 = a3;
    uint64_t v12 = v8;
LABEL_3:
    return BookmarkMutableData::appendDataItem(v10, v11, v12, v9);
  }
  if (!Length)
  {
    uint64_t v10 = this;
    int v11 = a3;
    uint64_t v12 = 0;
    size_t v9 = 0;
    goto LABEL_3;
  }
  CFIndex maxBufLen = 0;
  v23.CFIndex location = 0;
  v23.CFIndex length = Length;
  if (CFStringGetBytes(theString, v23, 0x8000100u, 0, 0, buffer, 128, &maxBufLen) == Length) {
    return BookmarkMutableData::appendDataItem(this, a3, buffer, maxBufLen);
  }
  v24.CFIndex location = 0;
  v24.CFIndex length = Length;
  uint64_t v14 = 0;
  if (CFStringGetBytes(theString, v24, 0x8000100u, 0, 0, 0, 0, &maxBufLen) == Length)
  {
    uint64_t appended = BookmarkMutableData::appendDataItem(this, a3, 0, maxBufLen);
    uint64_t v14 = appended;
    if (appended)
    {
      if ((appended + 8) <= *((_DWORD *)this + 6)) {
        CFIndex v16 = (UInt8 *)this[2] + (appended + 8);
      }
      else {
        CFIndex v16 = 0;
      }
      v25.CFIndex location = 0;
      v25.CFIndex length = Length;
      if (CFStringGetBytes(theString, v25, 0x8000100u, 0, 0, v16, maxBufLen, 0) == Length) {
        uint64_t v14 = v14;
      }
      else {
        uint64_t v14 = 0;
      }
    }
    if ((v14 + 8) <= *((_DWORD *)this + 6)) {
      CFIndex v17 = (char *)this[2] + (v14 + 8);
    }
    else {
      CFIndex v17 = 0;
    }
    int DataItem = BookmarkMutableData::findDataItem((BookmarkMutableData *)this, a3, v17, maxBufLen);
    if (v14 && DataItem != v14)
    {
      *((_DWORD *)this + 6) = v14;
      return 1;
    }
  }
  return v14;
}

uint64_t BookmarkMutableData::encodeRawData(void **this, unsigned int a2, UInt8 *bytes, CFIndex length)
{
  CFStringRef v6 = (const __CFString *)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (!v6) {
    return 0;
  }
  CFStringRef v7 = v6;
  uint64_t v8 = BookmarkMutableData::encodeItem(this, a2, v6, 0);
  CFRelease(v7);
  return v8;
}

uint64_t BookmarkMutableData::createTOC(BookmarkMutableData *this, int a2)
{
  CFTypeID v4 = (char *)this + 40;
  unint64_t v5 = (char *)*((void *)this + 6);
  if (v5 == v4) {
    goto LABEL_18;
  }
  CFStringRef v6 = v5;
  do
  {
    uint64_t v7 = *((void *)v6 + 2);
    if (a2 && *(_DWORD *)(v7 + 8) != a2) {
      uint64_t v7 = 0;
    }
    if (v7) {
      break;
    }
    CFStringRef v6 = (char *)*((void *)v6 + 1);
  }
  while (v6 != v4);
  if (!v7)
  {
LABEL_18:
    size_t v15 = malloc_type_malloc(0x14uLL, 0x3BC47EBCuLL);
    *(void *)size_t v15 = 0xFFFFFFFE00000014;
    v15[3] = 0;
    _OWORD v15[4] = 0;
    uint64_t v15[2] = a2;
    CFIndex v16 = (uint64_t *)*((void *)this + 6);
    CFIndex v17 = operator new(0x18uLL);
    _OWORD v17[2] = v15;
    uint64_t v18 = *v16;
    *(void *)(v18 + 8) = v17;
    *CFIndex v17 = v18;
    uint64_t *v16 = (uint64_t)v17;
    v17[1] = v16;
    uint64_t v10 = (void *)((char *)this + 56);
LABEL_19:
    ++*v10;
    return 1;
  }
  uint64_t v8 = v5;
  while (*((void *)v8 + 2) != v7)
  {
    uint64_t v8 = (char *)*((void *)v8 + 1);
    if (v8 == v4)
    {
      uint64_t v8 = v4;
      break;
    }
  }
  if (v8 != v5)
  {
    while (*((void *)v5 + 2) != v7)
    {
      unint64_t v5 = (char *)*((void *)v5 + 1);
      if (v5 == v4)
      {
        unint64_t v5 = v4;
        break;
      }
    }
    uint64_t v9 = *(void *)v5;
    *(void *)(v9 + 8) = *((void *)v5 + 1);
    **((void **)v5 + 1) = v9;
    uint64_t v11 = *((void *)this + 7);
    uint64_t v10 = (void *)((char *)this + 56);
    *uint64_t v10 = v11 - 1;
    operator delete(v5);
    uint64_t v12 = (uint64_t *)*(v10 - 1);
    unint64_t v13 = operator new(0x18uLL);
    void v13[2] = v7;
    uint64_t v14 = *v12;
    *(void *)(v14 + 8) = v13;
    *unint64_t v13 = v14;
    *uint64_t v12 = (uint64_t)v13;
    v13[1] = v12;
    goto LABEL_19;
  }
  return 1;
}

BOOL BookmarkMutableData::finalizeTOC(BookmarkMutableData *this, int a2)
{
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2 == (void *)((char *)this + 40)) {
    return 0;
  }
  do
  {
    uint64_t v3 = (_DWORD *)v2[2];
    if (a2 && v3[2] != a2) {
      uint64_t v3 = 0;
    }
    if (v3) {
      break;
    }
    uint64_t v2 = (void *)v2[1];
  }
  while (v2 != (void *)((char *)this + 40));
  return v3 && BookmarkMutableData::finalizeTOC(this, v3);
}

BOOL BookmarkMutableData::finalizeTOC(BookmarkMutableData *this, _DWORD *a2)
{
  if (a2)
  {
    int v4 = a2[4];
    if (v4)
    {
      uint64_t v5 = (12 * v4 + 20);
      *a2 = v5;
      a2[3] = *((_DWORD *)this + 8);
      *((_DWORD *)this + 8) = BookmarkMutableData::appendDataItem((void **)this, -2, a2 + 2, v5 - 8);
    }
    CFStringRef v6 = (void **)((char *)this + 40);
    for (uint64_t i = (void **)*((void *)this + 6); i != v6; uint64_t i = (void **)i[1])
    {
      if (i[2] == a2)
      {
        if (i != v6)
        {
          uint64_t v8 = *i;
          v8[1] = i[1];
          *(void *)i[1] = v8;
          --*((void *)this + 7);
          operator delete(i);
        }
        break;
      }
    }
    free(a2);
  }
  return a2 != 0;
}

CFURLRef copyUserHomeFolderURL(const __CFAllocator *a1)
{
  pthread_mutex_lock(&copyUserHomeFolderURL(__CFAllocator const*,unsigned long)::sCopyHomeFolderLock);
  CFURLRef v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v2)
  {
    CFURLRef v3 = v2;
    CFStringRef v4 = CFURLGetString(v2);
    CFURLRef v5 = CFURLCreateWithString(a1, v4, 0);
    CFRelease(v3);
  }
  else
  {
    CFURLRef v5 = 0;
  }
  pthread_mutex_unlock(&copyUserHomeFolderURL(__CFAllocator const*,unsigned long)::sCopyHomeFolderLock);
  return v5;
}

uint64_t BookmarkMutableData::encodeValue(void **this, unsigned int a2, int a3, int a4)
{
  int v8 = a3;
  uint64_t result = BookmarkMutableData::appendDataItem(this, 771, &v8, 4uLL);
  if (result) {
    return BookmarkMutableData::appendTOCItem((uint64_t **)this, a2, result, a4);
  }
  return result;
}

CFURLRef createNormalizedFileURL(const __CFURL *a1)
{
  if (_CFURLIsFileURL())
  {
    CFAllocatorRef v2 = CFGetAllocator(a1);
    uint64_t v32 = 0;
    int v3 = _CFURLGetResourcePropertyFlags() ? (v32 >> 1) & 1 : CFURLHasDirectoryPath(a1);
    CFURLRef v4 = CFURLCopyAbsoluteURL(a1);
    if (v4)
    {
      CFURLRef v5 = v4;
      CFStringRef v6 = CFURLCopyPath(v4);
      if (!v6)
      {
        CFURLRef v11 = 0;
LABEL_48:
        CFRelease(v5);
        return v11;
      }
      CFStringRef v7 = v6;
      CFStringRef CleanPath = CreateCleanPath(v2, v6);
      if (!CleanPath)
      {
        CFURLRef v11 = 0;
LABEL_47:
        CFRelease(v7);
        goto LABEL_48;
      }
      CFStringRef v9 = CleanPath;
      if (CFEqual(CleanPath, @"/"))
      {
        CFStringRef v12 = (const __CFString *)CFRetain(@"file:///");
        if (v12)
        {
LABEL_45:
          CFURLRef v11 = CFURLCreateWithString(v2, v12, 0);
          CFRelease(v12);
          goto LABEL_46;
        }
LABEL_15:
        CFURLRef v11 = 0;
LABEL_46:
        CFRelease(v9);
        goto LABEL_47;
      }
      CFIndex numChars = 0;
      CFMutableStringRef theString = CFStringCreateMutable(v2, 0);
      CFIndex Length = CFStringGetLength(@"file://");
      if (Length < 1025)
      {
        CFIndex v13 = Length;
        if (numChars + Length >= 1025)
        {
          CFStringAppendCharacters(theString, chars, 0);
          CFIndex numChars = 0;
        }
        v33.CFIndex location = 0;
        v33.CFIndex length = v13;
        CFStringGetCharacters(@"file://", v33, chars);
        numChars += v13;
      }
      else
      {
        CFStringAppend(theString, @"file://");
      }
      CFIndex v14 = CFStringGetLength(v9);
      int CharacterAtIndex = CFStringGetCharacterAtIndex(v9, v14 - 1);
      int v16 = CharacterAtIndex;
      if (v3)
      {
        CFIndex v17 = CFStringGetLength(v9);
        CFIndex v18 = numChars;
        if (v17 < 1025)
        {
          CFIndex v24 = v17;
          if (numChars + v17 >= 1025)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            CFIndex v18 = 0;
            CFIndex numChars = 0;
          }
          CFRange v25 = &chars[v18];
          v34.CFIndex location = 0;
          v34.CFIndex length = v24;
          CFStringGetCharacters(v9, v34, v25);
          CFIndex v19 = numChars + v24;
          numChars += v24;
        }
        else
        {
          if (numChars)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            CFIndex numChars = 0;
          }
          CFStringAppend(theString, v9);
          CFIndex v19 = numChars;
        }
        if (v16 != 47)
        {
          if (v19 >= 1024)
          {
            CFStringAppendCharacters(theString, chars, v19);
            CFIndex v19 = 0;
            CFIndex numChars = 0;
          }
          chars[v19] = 47;
          CFIndex v19 = numChars + 1;
LABEL_41:
          CFIndex numChars = v19;
        }
      }
      else
      {
        if (CharacterAtIndex == 47)
        {
          v36.CFIndex length = CFStringGetLength(v9) - 1;
          v36.CFIndex location = 0;
          CFStringRef v20 = CFStringCreateWithSubstring(v2, v9, v36);
          if (v20)
          {
            CFStringRef v21 = v20;
            CFRelease(v9);
            CFStringRef v9 = v21;
          }
        }
        CFIndex v22 = CFStringGetLength(v9);
        CFIndex v23 = numChars;
        if (v22 < 1025)
        {
          CFIndex v26 = v22;
          if (numChars + v22 >= 1025)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            CFIndex v23 = 0;
            CFIndex numChars = 0;
          }
          int v27 = &chars[v23];
          v35.CFIndex location = 0;
          v35.CFIndex length = v26;
          CFStringGetCharacters(v9, v35, v27);
          CFIndex v19 = numChars + v26;
          goto LABEL_41;
        }
        if (numChars)
        {
          CFStringAppendCharacters(theString, chars, numChars);
          CFIndex numChars = 0;
        }
        CFStringAppend(theString, v9);
        CFIndex v19 = numChars;
      }
      if (v19) {
        CFStringAppendCharacters(theString, chars, v19);
      }
      CFStringRef v12 = theString;
      if (theString) {
        goto LABEL_45;
      }
      goto LABEL_15;
    }
  }
  return 0;
}

CFStringRef CreateCleanPath(const __CFAllocator *a1, CFStringRef theString)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  CFIndex Length = CFStringGetLength(theString);
  if (Length)
  {
    CFIndex v5 = Length;
    if (Length <= 1024)
    {
      uint64_t v6 = MEMORY[0x1F4188790](Length);
      int v8 = (UniChar *)((char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      MEMORY[0x1F4188790](v6);
      uint64_t v10 = (UniChar *)((char *)v17 - ((v9 + 17) & 0xFFFFFFFFFFFFFFF0));
      v19.CFIndex location = 0;
      v19.CFIndex length = v5;
      CFStringGetCharacters(theString, v19, v8);
      return CreateCleanPathInternal(a1, v5, v8, v10);
    }
    CFIndex v13 = (UniChar *)CFAllocatorAllocate(a1, 2 * Length, 0);
    CFIndex v14 = (UniChar *)CFAllocatorAllocate(a1, 2 * v5 + 2, 0);
    size_t v15 = v14;
    if (v13 && v14)
    {
      v20.CFIndex location = 0;
      v20.CFIndex length = v5;
      CFStringGetCharacters(theString, v20, v13);
      CFStringRef CleanPathInternal = CreateCleanPathInternal(a1, v5, v13, v15);
    }
    else
    {
      CFStringRef CleanPathInternal = 0;
      CFStringRef v11 = 0;
      if (!v13) {
        goto LABEL_12;
      }
    }
    CFAllocatorDeallocate(a1, v13);
    CFStringRef v11 = CleanPathInternal;
LABEL_12:
    if (v15) {
      CFAllocatorDeallocate(a1, v15);
    }
    return v11;
  }
  return CFStringCreateCopy(a1, theString);
}

CFStringRef CreateCleanPathInternal(CFAllocatorRef alloc, uint64_t a2, unsigned __int16 *a3, UniChar *chars)
{
  if (*a3 == 47)
  {
    *chars = 47;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v8 < a2)
  {
    uint64_t v9 = v8;
    while (1)
    {
      int v10 = 0;
      int v11 = 0;
      if (a2 <= v9 + 1) {
        uint64_t v12 = v9 + 1;
      }
      else {
        uint64_t v12 = a2;
      }
      uint64_t v13 = v9;
      while (a3[v13] != 47)
      {
        if (v10) {
          int v14 = v10;
        }
        else {
          int v14 = a3[v13];
        }
        if (v11) {
          int v10 = v14;
        }
        else {
          int v11 = a3[v13];
        }
        if (v12 == ++v13)
        {
          uint64_t v13 = v12;
          break;
        }
      }
      uint64_t v15 = v13 - v9;
      if (v11 == 46)
      {
        if (v13 != v9 && v15 != 1)
        {
          if (v10 != 46 || v15 != 2)
          {
LABEL_30:
            memcpy(&chars[v8], &a3[v9], 2 * v15);
            chars[v15 + v8] = 47;
            uint64_t v16 = v15 + v8 + 1;
            goto LABEL_31;
          }
          if (v8 >= 2)
          {
            do
            {
              uint64_t v16 = v8 - 1;
              if (v8 == 1) {
                break;
              }
              int v17 = chars[v8-- - 2];
            }
            while (v17 != 47);
            goto LABEL_31;
          }
        }
      }
      else if (v13 != v9)
      {
        goto LABEL_30;
      }
      uint64_t v16 = v8;
LABEL_31:
      uint64_t v9 = v13 + 1;
      uint64_t v8 = v16;
      if (v13 + 1 >= a2) {
        goto LABEL_34;
      }
    }
  }
  uint64_t v16 = v8;
LABEL_34:
  return CFStringCreateWithCharacters(alloc, chars, v16 - (v16 > 1));
}

CFArrayRef createURLParentageArray(const __CFAllocator *a1, const __CFURL *a2)
{
  CFAllocatorRef v2 = (const __CFAllocator *)MEMORY[0x1F4188790](a1);
  CFAllocatorRef v5 = v2;
  values[512] = *(void **)MEMORY[0x1E4F143B8];
  if (v3)
  {
    int v6 = v4;
    CFURLRef v7 = v3;
    bzero(values, 0xFF8uLL);
    uint64_t v8 = 0;
    values[511] = v7;
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D740];
    unint64_t v10 = -4088;
    while (1)
    {
      CFURLRef PathComponent = 0;
      int v11 = CFURLCopyResourcePropertyForKey(v7, v9, &PathComponent, 0);
      if ((v6 & 0x10000000) != 0 && !v11)
      {
        CFStringRef v12 = CFURLCopyPath(v7);
        if (v12)
        {
          CFStringRef v13 = v12;
          if (CFStringGetLength(v12) >= 1) {
            CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(v5, v7);
          }
          CFRelease(v13);
        }
      }
      CFURLRef v7 = PathComponent;
      values[v8 + 510] = PathComponent;
      if (!v7) {
        break;
      }
      --v8;
      v10 += 8;
      if (v8 == -511)
      {
        CFArrayRef v14 = CFArrayCreate(v5, (const void **)values, 512, MEMORY[0x1E4F1D510]);
        uint64_t v15 = 0;
        goto LABEL_17;
      }
    }
    CFArrayRef v14 = CFArrayCreate(v5, (const void **)&values[v10 / 0xFFFFFFFFFFFFFFF8], 1 - v8, MEMORY[0x1E4F1D510]);
    if ((1 - v8) < 2) {
      return v14;
    }
    uint64_t v15 = v8 + 511;
    do
    {
LABEL_17:
      CFIndex v18 = values[v15];
      if (v18)
      {
        CFRelease(v18);
        values[v15] = 0;
      }
      ++v15;
    }
    while (v15 != 511);
    return v14;
  }
  else
  {
    uint64_t v16 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    return CFArrayCreate(v2, 0, 0, v16);
  }
}

uint64_t currentBookmarkVersion(void)
{
  return 268697600;
}

void *_CFURLCreateByResolvingBookmarkData(const __CFAllocator *a1, const __CFData *a2, unint64_t a3, const __CFURL *a4, const __CFArray *a5, BOOL *a6, CFErrorRef *a7)
{
  CFArrayRef v14 = _os_activity_create(&dword_181761000, "CFURLResolveBookmarkData", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);
  CFTypeRef cf = 0;
  CFTypeRef v28 = 0;
  uint64_t v15 = createByResolvingBookmarkDataInternal(a1, a2, a3, a4, a5, a6, (__CFError **)&v28, (const __CFURL **)&cf);
  if (v15)
  {
LABEL_2:
    uint64_t v16 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
      _CFURLCreateByResolvingBookmarkData_cold_2((uint64_t)v15, v16);
    }
    goto LABEL_4;
  }
  CFURLRef v18 = (const __CFURL *)cf;
  if (!cf) {
    goto LABEL_30;
  }
  if (!a2) {
    goto LABEL_30;
  }
  if ((a3 & 0x4000) != 0) {
    goto LABEL_30;
  }
  CFTypeID v19 = CFGetTypeID(a2);
  if (v19 != CFDataGetTypeID()) {
    goto LABEL_30;
  }
  BookmarkData::BookmarkData((BookmarkData *)v32, a1, a2);
  if (!v33) {
    goto LABEL_29;
  }
  if (!BookmarkData::getURLResourceProperties((BookmarkData *)v32, 1, (uint64_t)&v30)) {
    goto LABEL_19;
  }
  if ((v31 & v30 & 8) != 0)
  {
LABEL_29:
    BookmarkData::~BookmarkData((BookmarkData *)v32);
    goto LABEL_30;
  }
  if ((v31 & 0x10) != 0 && (v31 & v30 & 2) != 0)
  {
    int IsReachable = v30 & 0x10;
    goto LABEL_21;
  }
LABEL_19:
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(a1, v18);
  if (!PathComponent) {
    goto LABEL_29;
  }
  CFURLRef v22 = PathComponent;
  int IsReachable = CFURLResourceIsReachable(PathComponent, 0);
  CFRelease(v22);
LABEL_21:
  BookmarkData::~BookmarkData((BookmarkData *)v32);
  if (IsReachable)
  {
    if ((a3 & 0x1000) != 0)
    {
      CFURLRef v25 = (const __CFURL *)_CFURLCopyPromiseURLOfLogicalURL();
      if (!v25) {
        goto LABEL_30;
      }
      CFURLRef v26 = v25;
      if (CFURLResourceIsReachable(v25, 0))
      {
        _CFURLPromiseSetPhysicalURL();
        uint64_t v15 = (void *)cf;
        CFTypeRef cf = 0;
      }
      else
      {
        uint64_t v15 = 0;
      }
      CFRelease(v26);
    }
    else
    {
      if (!DownloadCloudDocumentSync((const __CFURL *)cf)) {
        goto LABEL_30;
      }
      if (v28)
      {
        CFRelease(v28);
        CFTypeRef v28 = 0;
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      uint64_t v15 = createByResolvingBookmarkDataInternal(a1, a2, a3, a4, a5, a6, (__CFError **)&v28, (const __CFURL **)&cf);
    }
    if (v15) {
      goto LABEL_2;
    }
  }
LABEL_30:
  uint64_t v15 = 0;
  if (a7)
  {
    CFIndex v23 = (__CFError *)v28;
    CFTypeRef v28 = 0;
    *a7 = v23;
    if (!v23)
    {
      CFIndex v24 = resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_ERROR)) {
        _CFURLCreateByResolvingBookmarkData_cold_1(v24);
      }
      uint64_t v15 = 0;
      *a7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
    }
  }
LABEL_4:
  os_release(v14);
  if (cf) {
    CFRelease(cf);
  }
  if (v28) {
    CFRelease(v28);
  }
  os_activity_scope_leave(&state);
  return v15;
}

CFURLRef createByResolvingBookmarkDataInternal(const __CFAllocator *a1, const __CFData *a2, unint64_t a3, CFURLRef relativeURL, const __CFArray *a5, BOOL *a6, __CFError **a7, const __CFURL **a8)
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  if (relativeURL) {
    CFURLRef v14 = CFURLCopyAbsoluteURL(relativeURL);
  }
  else {
    CFURLRef v14 = 0;
  }
  uint64_t v15 = resolveLog;
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)CFNumberRef v96 = 134219522;
    *(void *)uint64_t v97 = a2;
    *(_WORD *)&v97[8] = 2112;
    *(void *)&v97[10] = a2;
    *(_WORD *)&v97[18] = 2048;
    unint64_t v98 = a3;
    __int16 v99 = 2112;
    CFURLRef v100 = v14;
    __int16 v101 = 2112;
    CFArrayRef v102 = a5;
    __int16 v103 = 2048;
    uint64_t v104 = a6;
    __int16 v105 = 2048;
    CFNumberRef v106 = a7;
    _os_log_debug_impl(&dword_181761000, v15, OS_LOG_TYPE_DEBUG, "bookmarkRef=<%p %@>  options=%#lx relativeToURL=%@ propertiesToInclude=%@ repIsStaleP=%p errorRefP=%p", v96, 0x48u);
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a6) {
LABEL_6:
  }
    *a6 = 0;
LABEL_7:
  if (a2)
  {
    CFTypeID v16 = CFGetTypeID(a2);
    if (v16 == CFDataGetTypeID())
    {
      BookmarkData::BookmarkData((BookmarkData *)v96, a1, a2);
      if (!*(void *)&v97[12])
      {
        CFErrorRef v24 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E4F1D148], 259, 0);
        if (cf == v24)
        {
          CFURLRef v23 = 0;
        }
        else
        {
          if (cf) {
            CFRelease(cf);
          }
          CFURLRef v23 = 0;
          CFTypeRef cf = v24;
        }
        goto LABEL_180;
      }
      CFTypeID TypeID = CFBooleanGetTypeID();
      CFBooleanRef v18 = BookmarkData::copyItem((BookmarkData *)v96, @"NSURLBookmarkQuarantineMountedNetworkVolumesKey", 1, TypeID);
      CFBooleanRef v85 = v18;
      if (v18 && CFBooleanGetValue(v18)) {
        a3 |= 0x2000uLL;
      }
      LODWORD(length) = 0;
      BookmarkSandboxExtensionForTag = getBookmarkSandboxExtensionForTag((BookmarkData *)v96, 0xF080u, (unsigned int *)&length);
      if (BookmarkSandboxExtensionForTag
        || (BookmarkSandboxExtensionForTag = getBookmarkSandboxExtensionForTag((BookmarkData *)v96, 0xF081u, (unsigned int *)&length)) != 0)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
          createByResolvingBookmarkDataInternal();
        }
        uint64_t v20 = sandbox_extension_consume();
        uint64_t v21 = v20;
        if (v20 >= 1)
        {
          CFDataRef v86 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)BookmarkSandboxExtensionForTag, length);
LABEL_36:
          CFTypeID v27 = CFStringGetTypeID();
          int v29 = BookmarkData::copyItem((BookmarkData *)v96, 0x2070u, 1u, v27);
          if (v29)
          {
            Helper_x8__FPCreateDocumentURLFromBookmarkableCFStringRef String = gotLoadHelper_x8__FPCreateDocumentURLFromBookmarkableString(v30);
            if (*(void *)(v32 + 2432))
            {
              if (cf)
              {
                uint64_t v33 = v29;
                CFRelease(cf);
                int v29 = v33;
                CFTypeRef cf = 0;
              }
              CFRange v34 = v29;
              uint64_t inited = FPCreateDocumentURLFromBookmarkableString_delayInitStub(Helper_x8__FPCreateDocumentURLFromBookmarkableString);
              CFRange v36 = v34;
              CFURLRef v23 = (const __CFURL *)inited;
              goto LABEL_164;
            }
          }
          CFStringRef v84 = v29;
          if (!v14) {
            goto LABEL_160;
          }
          BOOL v95 = 0;
          if (!_CFURLIsFileURL()
            || !BookmarkData::getItemAs((BookmarkData *)v96, 0x1056u, 1, &v95)
            || !v95)
          {
            goto LABEL_160;
          }
          uint64_t v83 = v21;
          CFRetain(v14);
          CFURLRef length = v14;
          unsigned int v93 = 0;
          if (BookmarkData::getItemAs((BookmarkData *)v96, 0x1054u, 1, &v93) && (unsigned int v37 = v93) != 0
            || BookmarkData::getItemAs((BookmarkData *)v96, 0x1051u, 1, &v93)
            && (v38 = __CFADD__(v93, 1), unsigned int v37 = v93 + 1, ++v93, !v38))
          {
            CFIndex v48 = resolveLog;
            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v37;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = length;
              _os_log_debug_impl(&dword_181761000, v48, OS_LOG_TYPE_DEBUG, "REMOVING %u from relative url=%@", buf, 0x12u);
              if (!v93--) {
                goto LABEL_50;
              }
            }
            else
            {
              unsigned int v93 = v37 - 1;
            }
            CFStringRef v49 = (const __CFString *)*MEMORY[0x1E4F1D740];
            do
            {
              if (!length) {
                break;
              }
              CFTypeRef propertyValueTypeRefPtr = 0;
              int v50 = CFURLCopyResourcePropertyForKey(length, v49, &propertyValueTypeRefPtr, 0);
              CFURLRef v51 = (const __CFURL *)propertyValueTypeRefPtr;
              if (!v50 && propertyValueTypeRefPtr)
              {
                CFRelease(propertyValueTypeRefPtr);
                CFURLRef v51 = 0;
                CFTypeRef propertyValueTypeRefPtr = 0;
              }
              uint64_t v52 = resolveLog;
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v51;
                _os_log_debug_impl(&dword_181761000, v52, OS_LOG_TYPE_DEBUG, " provisionalURL=%@", buf, 0xCu);
                CFURLRef v51 = (const __CFURL *)propertyValueTypeRefPtr;
              }
              CFTypeRef propertyValueTypeRefPtr = 0;
              if (length != v51)
              {
                if (length)
                {
                  CFRelease(length);
                  CFURLRef length = v51;
                  if (propertyValueTypeRefPtr) {
                    CFRelease(propertyValueTypeRefPtr);
                  }
                }
                else
                {
                  CFURLRef length = v51;
                }
              }
            }
            while (v93--);
          }
LABEL_50:
          unsigned int v91 = 0;
          CFArrayRef v82 = a5;
          if ((BookmarkData::getItemAs((BookmarkData *)v96, 0x1055u, 1, &v91) && v91
             || BookmarkData::getItemAs((BookmarkData *)v96, 0x1053u, 1, &v91) && (BOOL v38 = __CFADD__(v91, 1), ++v91, !v38))
            && (uint64_t v39 = countPathComponents((BookmarkData *)v96, 1), (v40 = v91) != 0)
            && (CFRange v41 = v39, v91 < v39))
          {
            CFRange v42 = resolveLog;
            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v40;
              _os_log_debug_impl(&dword_181761000, v42, OS_LOG_TYPE_DEBUG, "Adding %u from path components to relative URL", buf, 8u);
              unsigned int v40 = v91;
            }
            CFURLRef v43 = length;
            if (length)
            {
              unsigned int v44 = v41 - v40;
              uint64_t v21 = v83;
              if (v44 < v41)
              {
                do
                {
                  CFTypeRef v45 = v41;
                  CFStringRef v46 = (const __CFString *)copyIndexedPathComponent((BookmarkData *)v96, 1, v44);
                  CFTypeRef propertyValueTypeRefPtr = CFURLCreateCopyAppendingPathComponent(a1, length, v46, 1u);
                  CFReleaser<__CFData const*>::operator=((const void **)&length, &propertyValueTypeRefPtr);
                  CFTypeID v47 = resolveLog;
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = length;
                    _os_log_debug_impl(&dword_181761000, v47, OS_LOG_TYPE_DEBUG, " - provisionalURL=%@", buf, 0xCu);
                  }
                  if (length && !CFURLResourceIsReachable(length, 0) && length)
                  {
                    CFRelease(length);
                    CFURLRef length = 0;
                  }
                  uint64_t v21 = v83;
                  if (propertyValueTypeRefPtr) {
                    CFRelease(propertyValueTypeRefPtr);
                  }
                  if (v46) {
                    CFRelease(v46);
                  }
                  CFURLRef v43 = length;
                  if (!length) {
                    break;
                  }
                  ++v44;
                  CFRange v41 = v45;
                }
                while (v44 < v45);
              }
LABEL_75:
              if (!v43) {
                goto LABEL_127;
              }
              if (sameFileURL(v43, v14))
              {
                if (length)
                {
                  CFRelease(length);
                  CFURLRef length = 0;
                }
                goto LABEL_127;
              }
              *(void *)buf = 0;
              if (!CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x1E4F1D678], buf, 0))
              {
                if (length)
                {
                  CFRelease(length);
                  CFURLRef length = 0;
                }
                goto LABEL_125;
              }
              if (*(void *)buf && CFBooleanGetValue(*(CFBooleanRef *)buf))
              {
                if (CFURLHasDirectoryPath(length)) {
                  goto LABEL_107;
                }
                Boolean v54 = 1;
              }
              else
              {
                if (!CFURLHasDirectoryPath(length)) {
                  goto LABEL_107;
                }
                Boolean v54 = 0;
              }
              CFStringRef v55 = CFURLCopyFileSystemPath(length, kCFURLPOSIXPathStyle);
              if (v55)
              {
                CFStringRef v56 = v55;
                CFTypeRef propertyValueTypeRefPtr = CFURLCreateWithFileSystemPath(a1, v55, kCFURLPOSIXPathStyle, v54);
                if (propertyValueTypeRefPtr)
                {
                  CFReleaser<__CFData const*>::operator=((const void **)&length, &propertyValueTypeRefPtr);
                  if (propertyValueTypeRefPtr) {
                    CFRelease(propertyValueTypeRefPtr);
                  }
                }
                CFRelease(v56);
              }
LABEL_107:
              CFTypeRef propertyValueTypeRefPtr = 0;
              CFTypeRef cf2 = 0;
              CFStringRef v57 = (const __CFString *)*MEMORY[0x1E4F1D838];
              if (!CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x1E4F1D838], &propertyValueTypeRefPtr, 0)|| !CFURLCopyResourcePropertyForKey(v14, v57, &cf2, 0)|| !propertyValueTypeRefPtr|| !cf2)
              {
                if (length)
                {
                  CFRelease(length);
                  CFURLRef length = 0;
                }
                goto LABEL_119;
              }
              if (CFEqual(propertyValueTypeRefPtr, cf2))
              {
LABEL_119:
                if (cf2) {
                  CFRelease(cf2);
                }
                if (propertyValueTypeRefPtr) {
                  CFRelease(propertyValueTypeRefPtr);
                }
LABEL_125:
                if (*(void *)buf) {
                  CFRelease(*(CFTypeRef *)buf);
                }
LABEL_127:
                CFStringRef v63 = (const __CFString *)*MEMORY[0x1E4F1D5B0];
                CFTypeID v64 = CFNumberGetTypeID();
                CFNumberRef v65 = BookmarkData::copyItem((BookmarkData *)v96, v63, 1, v64);
                *(void *)buf = 0;
                a5 = v82;
                if (!length)
                {
                  CFURLRef v23 = 0;
                  goto LABEL_155;
                }
                CFNumberRef cf1 = v65;
                int v66 = CFURLCopyResourcePropertyForKey(length, v63, buf, 0);
                if (a6 && v66)
                {
                  if (!cf1)
                  {
                    if (!*(void *)buf) {
                      goto LABEL_137;
                    }
                    goto LABEL_136;
                  }
                  if (!*(void *)buf || !CFEqual(cf1, *(CFTypeRef *)buf)) {
LABEL_136:
                  }
                    *a6 = 1;
                }
LABEL_137:
                if (length)
                {
                  CFRetain(length);
                  CFURLRef v23 = length;
                  if (a6)
                  {
                    if (!*a6)
                    {
                      int v67 = fileIDsMatch((BookmarkData *)v96, 1u, length);
                      *a6 = v67 == 0;
                      if (v67)
                      {
                        CFTypeRef propertyValueTypeRefPtr = 0;
                        if (!CFURLCopyResourcePropertyForKey(v23, (CFStringRef)*MEMORY[0x1E4F1D588], &propertyValueTypeRefPtr, 0))
                        {
LABEL_149:
                          uint64_t v21 = v83;
                          if (propertyValueTypeRefPtr) {
                            CFRelease(propertyValueTypeRefPtr);
                          }
                          goto LABEL_152;
                        }
                        uint64_t v21 = v83;
                        if (propertyValueTypeRefPtr)
                        {
                          uint64_t v68 = *MEMORY[0x1E4F1CF80];
                          CFArrayRef v69 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F1D748], 1, MEMORY[0x1E4F1D510]);
                          if (v69)
                          {
                            CFArrayRef v70 = v69;
                            CFDictionaryRef v71 = (const __CFDictionary *)MEMORY[0x1853003C0](v68, v69, *(void *)&v97[4]);
                            if (v71)
                            {
                              CFDictionaryRef v72 = v71;
                              CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v71, (const void *)*MEMORY[0x1E4F1D748]);
                              if (Value) {
                                *a6 = CFStringCompare((CFStringRef)propertyValueTypeRefPtr, Value, 0) != kCFCompareEqualTo;
                              }
                              CFRelease(v72);
                            }
                            CFRelease(v70);
                          }
                          goto LABEL_149;
                        }
                      }
                    }
                  }
                }
                else
                {
                  CFURLRef v23 = 0;
                }
LABEL_152:
                if (*(void *)buf) {
                  CFRelease(*(CFTypeRef *)buf);
                }
                CFNumberRef v65 = cf1;
LABEL_155:
                if (v65) {
                  CFRelease(v65);
                }
                if (length) {
                  CFRelease(length);
                }
                if (v23)
                {
LABEL_163:
                  CFRange v36 = v84;
                  if (!v84)
                  {
LABEL_165:
                    if (!v86)
                    {
LABEL_171:
                      if (v85) {
                        CFRelease(v85);
                      }
                      if (v23)
                      {
                        if (!a6 || !*a6)
                        {
                          CFURLSetTemporaryResourcePropertyForKey(v23, @"CFURLCreatedFromBookmark", a2);
                          *(_DWORD *)buf = 0;
                          BookmarkData::getItemAs((BookmarkData *)v96, 0xD010u, 1, (unsigned int *)buf);
                        }
                        if (a5)
                        {
                          CFTypeID v75 = CFGetTypeID(a5);
                          if (v75 == CFArrayGetTypeID())
                          {
                            unint64_t v76 = (const void *)__CFURLResourceInfoPtr();
                            _FSURLCacheResourcePropertiesForKeys(v23, a5, v76, 0);
                          }
                        }
                      }
LABEL_180:
                      BookmarkData::~BookmarkData((BookmarkData *)v96);
                      goto LABEL_181;
                    }
                    if (!v23) {
                      goto LABEL_169;
                    }
                    CFIndex v74 = (const void *)MEMORY[0x1853005E0](v23);
                    if (!v74)
                    {
                      releaseBookmarkExtension(v21);
                      _URLAttachSecurityScopeToFileURL(v23, v86);
                      if ((a3 & 0x8000) == 0) {
                        _CFURLStartAccessingSecurityScopedResource(v23);
                      }
                      goto LABEL_170;
                    }
                    CFRelease(v74);
                    if ((a3 & 0x8000) != 0) {
LABEL_169:
                    }
                      releaseBookmarkExtension(v21);
LABEL_170:
                    CFRelease(v86);
                    goto LABEL_171;
                  }
LABEL_164:
                  CFRelease(v36);
                  goto LABEL_165;
                }
LABEL_160:
                if (cf)
                {
                  CFRelease(cf);
                  CFTypeRef cf = 0;
                }
                CFURLRef v23 = (const __CFURL *)CFURLCreateByResolvingDataInBookmark(a1, (BookmarkData *)v96, 1, a3, (const __CFArray *)a6, (unsigned __int8 *)&cf, a8, v28);
                goto LABEL_163;
              }
              values = 0;
              if (CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x1E4F1D980], &values, 0) && values)
              {
                CFArrayRef v58 = CFArrayCreate(a1, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
                if (v58)
                {
                  CFArrayRef v61 = v58;
                  CFTypeRef matched = matchVolumeURLForBookmark((BookmarkData *)v96, 1u, v58, (char *)a6, v59, v60);
                  if (matched)
                  {
                    CFRelease(matched);
                  }
                  else if (length)
                  {
                    CFRelease(length);
                    CFURLRef length = 0;
                  }
                  CFRelease(v61);
                  uint64_t v21 = v83;
                  goto LABEL_206;
                }
                CFURLRef v80 = length;
                uint64_t v21 = v83;
                if (length) {
                  goto LABEL_202;
                }
              }
              else
              {
                CFURLRef v80 = length;
                if (length)
                {
LABEL_202:
                  CFRelease(v80);
                  CFURLRef length = 0;
                }
              }
LABEL_206:
              if (values) {
                CFRelease(values);
              }
              goto LABEL_119;
            }
          }
          else
          {
            CFURLRef v43 = length;
          }
          uint64_t v21 = v83;
          goto LABEL_75;
        }
        if (v20)
        {
          CFURLRef v25 = resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_INFO))
          {
            int v26 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v26;
            _os_log_impl(&dword_181761000, v25, OS_LOG_TYPE_INFO, "failed to consume sandbox extension: %{errno}d", buf, 8u);
          }
        }
      }
      else
      {
        uint64_t v21 = 0;
      }
      CFDataRef v86 = 0;
      goto LABEL_36;
    }
  }
  CFErrorRef v22 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E4F1D148], 259, 0);
  if (cf == v22)
  {
    CFURLRef v23 = 0;
  }
  else
  {
    if (cf) {
      CFRelease(cf);
    }
    CFURLRef v23 = 0;
    CFTypeRef cf = v22;
  }
LABEL_181:
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    createByResolvingBookmarkDataInternal();
    if (!a7) {
      goto LABEL_188;
    }
  }
  else if (!a7)
  {
    goto LABEL_188;
  }
  if (!v23)
  {
    CFIndex v77 = (__CFError *)cf;
    if (cf) {
      CFTypeRef cf = 0;
    }
    else {
      CFIndex v77 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E4F1D148], 4, 0);
    }
    *a7 = v77;
  }
LABEL_188:
  if (v14) {
    CFRelease(v14);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v23;
}

BOOL _FSURLStopAccessingSecurityScopedResource(const __CFURL *a1)
{
  CFDataRef propertyValueTypeRefPtr = 0;
  if (!a1 || !_CFURLIsFileURL()) {
    return 0;
  }
  CFAllocatorRef v2 = (SandboxExtensionCache *)CFURLCopyResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", &propertyValueTypeRefPtr, 0);
  CFURLRef v3 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v2);
  BOOL v4 = SandboxExtensionCache::release(v3, a1, propertyValueTypeRefPtr);
  if (propertyValueTypeRefPtr) {
    CFRelease(propertyValueTypeRefPtr);
  }
  CFTypeRef cf = 0;
  int v5 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1CEC0], &cf, 0);
  CFTypeRef v6 = cf;
  if (v5) {
    BOOL v7 = cf == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (cf != (CFTypeRef)*MEMORY[0x1E4F1D260])
    {
      _FSURLStopAccessingSecurityScopedResource();
      CFTypeRef v6 = cf;
    }
    CFRelease(v6);
  }
  return v4;
}

void _URLAttachSecurityScopeToFileURL(const __CFURL *a1, CFDataRef Copy)
{
  if (a1 && _CFURLIsFileURL())
  {
    if (Copy)
    {
      CFTypeID v4 = CFGetTypeID(Copy);
      if (v4 == CFDataGetTypeID())
      {
        CFIndex Length = CFDataGetLength(Copy);
        if (Length && !CFDataGetBytePtr(Copy)[Length - 1])
        {
          CFDataRef v10 = 0;
        }
        else
        {
          CFAllocatorRef v6 = CFGetAllocator(Copy);
          CFMutableDictionaryRef MutableCopy = CFDataCreateMutableCopy(v6, 0, Copy);
          if (!MutableCopy) {
            return;
          }
          CFDataRef v8 = MutableCopy;
          CFDataAppendBytes(MutableCopy, (const UInt8 *)&_URLAttachSecurityScopeToFileURL::zero, 1);
          CFAllocatorRef v9 = CFGetAllocator(Copy);
          CFDataRef Copy = CFDataCreateCopy(v9, v8);
          CFRelease(v8);
          CFDataRef v10 = Copy;
          if (!Copy) {
            return;
          }
        }
        CFURLRef v14 = securityScopedLog;
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
          _URLAttachSecurityScopeToFileURL_cold_3((uint64_t)a1, Copy, v14);
        }
        _FSURLSetPermanentResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", Copy);
        CFTypeID v16 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v15);
        SandboxExtensionCache::insert(v16, a1, Copy);
        if (v10) {
          CFRelease(v10);
        }
      }
      else
      {
        CFStringRef v13 = securityScopedLog;
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
          _URLAttachSecurityScopeToFileURL_cold_4(v13);
        }
      }
    }
    else
    {
      CFStringRef v12 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
        _URLAttachSecurityScopeToFileURL_cold_2((uint64_t)a1, v12);
      }
      _FSURLSetPermanentResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", 0);
    }
  }
  else
  {
    int v11 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
      _URLAttachSecurityScopeToFileURL_cold_1((uint64_t)a1, v11);
    }
  }
}

BOOL _FSURLStartAccessingSecurityScopedResource(const __CFURL *a1)
{
  CFDataRef propertyValueTypeRefPtr = 0;
  if (!a1 || !_CFURLIsFileURL()) {
    return 0;
  }
  CFAllocatorRef v2 = (SandboxExtensionCache *)CFURLCopyResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", &propertyValueTypeRefPtr, 0);
  CFURLRef v3 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v2);
  CFTypeID v4 = SandboxExtensionCache::consume(v3, a1, propertyValueTypeRefPtr);
  if (v4)
  {
    if (v4 == propertyValueTypeRefPtr)
    {
      CFRelease(v4);
      CFTypeRef cf = 0;
      BOOL v6 = 1;
LABEL_14:
      int v9 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1CEC0], &cf, 0);
      CFTypeRef v10 = cf;
      if (v9) {
        BOOL v11 = cf == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        if (cf != (CFTypeRef)*MEMORY[0x1E4F1D260])
        {
          _FSURLStartAccessingSecurityScopedResource();
          CFTypeRef v10 = cf;
        }
        CFRelease(v10);
      }
      return v6;
    }
    _FSURLSetPermanentResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", v4);
    BOOL v5 = 0;
    BOOL v6 = 1;
  }
  else
  {
    getpid();
    int v8 = sandbox_check();
    BOOL v5 = v8 != 0;
    BOOL v6 = v8 == 0;
  }
  if (propertyValueTypeRefPtr) {
    CFRelease(propertyValueTypeRefPtr);
  }
  CFTypeRef cf = 0;
  if (!v5) {
    goto LABEL_14;
  }
  return v6;
}

uint64_t SandboxExtensionCache::shared(SandboxExtensionCache *this)
{
  if (SandboxExtensionCache::shared(void)::onceToken != -1) {
    dispatch_once(&SandboxExtensionCache::shared(void)::onceToken, &__block_literal_global_5);
  }
  return SandboxExtensionCache::shared(void)::shared;
}

__CFData *SandboxExtensionCache::consume(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  CFTypeRef cf = 0;
  CFTypeRef v10 = 0;
  int v5 = CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E4F1D748], &cf, 0);
  uint64_t result = 0;
  if (v5) {
    BOOL v7 = cf == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    os_unfair_lock_lock(this);
    int v8 = SandboxExtensionCache::_consume((CFDictionaryRef *)this, (const __CFString *)cf, a3, &v10);
    os_unfair_lock_unlock(this);
    CFRelease(cf);
    if ((v8 & 5) != 0)
    {
      if (v8 == 3)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
          SandboxExtensionCache::consume();
        }
      }
      else if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      {
        SandboxExtensionCache::consume();
      }
      return 0;
    }
    else
    {
      return v10;
    }
  }
  return result;
}

uint64_t SandboxExtensionCache::_consume(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3, const __CFData **a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    SandboxExtensionCache::_consume();
  }
  *a4 = 0;
  Item = (CFTypeRef *)SandboxExtensionCache::_findItem(this, a2, a3);
  int v9 = Item;
  if (a3 && !Item) {
    int v9 = SandboxExtensionCache::_insert(this, a2, a3);
  }
  if (v9)
  {
    CFTypeRef v10 = (char *)*v9;
    if (*v9)
    {
      BOOL v11 = v10 + 1;
      *int v9 = v10 + 1;
      CFStringRef v12 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
      {
        CFTypeRef v17 = v9[1];
        int v18 = 134218498;
        CFTypeRef v19 = v17;
        __int16 v20 = 2048;
        uint64_t v21 = v11;
        __int16 v22 = 2112;
        CFStringRef v23 = a2;
        _os_log_debug_impl(&dword_181761000, v12, OS_LOG_TYPE_DEBUG, "handle %lld: incrementing ref count to %lld for path %@", (uint8_t *)&v18, 0x20u);
      }
      uint64_t result = 0;
LABEL_17:
      *a4 = (const __CFData *)v9[2];
      return result;
    }
    CFDataGetBytePtr((CFDataRef)v9[2]);
    uint64_t v14 = sandbox_extension_consume();
    v9[1] = (CFTypeRef)v14;
    if ((v14 & 0x8000000000000000) == 0)
    {
      uint64_t v15 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
        SandboxExtensionCache::_consume((uint64_t)a2, v14, v15);
      }
      uint64_t result = 0;
      *int v9 = (CFTypeRef)1;
      goto LABEL_17;
    }
    BOOL v16 = os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR);
    if (v14 == -1)
    {
      if (v16) {
        SandboxExtensionCache::_consume();
      }
    }
    else if (v16)
    {
      SandboxExtensionCache::_consume();
    }
    return 4;
  }
  else
  {
    getpid();
    if (sandbox_check()) {
      return 3;
    }
    else {
      return 2;
    }
  }
}

const void *SandboxExtensionCache::_findItem(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  CFStringRef Value = CFDictionaryGetValue(this[1], a2);
  int v5 = Value;
  if (Value && a3)
  {
    BOOL v6 = Value;
    while (!CFEqual(a3, *((CFTypeRef *)v6 + 2)))
    {
      BOOL v6 = (const void *)*((void *)v6 + 3);
      if (!v6) {
        return v5;
      }
    }
    return v6;
  }
  return v5;
}

BOOL SandboxExtensionCache::insert(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  if (!url) {
    SandboxExtensionCache::insert();
  }
  if (!a3) {
    SandboxExtensionCache::insert();
  }
  CFStringRef propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E4F1D748], &propertyValueTypeRefPtr, 0)) {
    BOOL v5 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  os_unfair_lock_lock(this);
  BOOL v6 = SandboxExtensionCache::_insert((CFDictionaryRef *)this, propertyValueTypeRefPtr, a3) != 0;
  os_unfair_lock_unlock(this);
  CFRelease(propertyValueTypeRefPtr);
  return v6;
}

CFTypeRef *SandboxExtensionCache::_insert(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  if (!a2) {
    SandboxExtensionCache::_insert();
  }
  if (!a3) {
    SandboxExtensionCache::_insert();
  }
  Item = (CFTypeRef *)SandboxExtensionCache::_findItem(this, a2, a3);
  if (!Item) {
    operator new();
  }
  BOOL v6 = Item;
  if (!CFEqual(a3, Item[2])) {
    operator new();
  }
  BOOL v7 = securityScopedLog;
  if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
    SandboxExtensionCache::_insert((uint64_t)this, v7);
  }
  return v6;
}

BOOL SandboxExtensionCache::release(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef string = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E4F1D748], &string, 0)) {
    BOOL v5 = string == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    os_unfair_lock_lock(this);
    int v7 = SandboxExtensionCache::_release((CFDictionaryRef *)this, string, a3);
    os_unfair_lock_unlock(this);
    if ((v7 & 5) != 0)
    {
      if (v7 == 3)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
          SandboxExtensionCache::release();
        }
        bzero(buffer, 0x400uLL);
        if (CFStringGetFileSystemRepresentation(string, buffer, 1024))
        {
          if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
            SandboxExtensionCache::release();
          }
          int v8 = sandbox_extension_release_file();
          BOOL v6 = v8 == 0;
          if (v8) {
            int v9 = -2;
          }
          else {
            int v9 = 2;
          }
          *__error() = v9;
          goto LABEL_22;
        }
      }
      else if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      {
        SandboxExtensionCache::release();
      }
      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = 1;
    }
LABEL_22:
    CFRelease(string);
    return v6;
  }
  return 0;
}

uint64_t SandboxExtensionCache::_release(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  Item = (CacheItem *)SandboxExtensionCache::_findItem(this, a2, a3);
  if (!Item) {
    return 3;
  }
  BOOL v6 = Item;
  uint64_t v7 = *(void *)Item;
  if (*(uint64_t *)Item < 2)
  {
    CFStringRef Value = (CacheItem *)CFDictionaryGetValue(this[1], a2);
    if (Value) {
      BOOL v12 = v6 == Value;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      uint64_t v13 = (const void *)*((void *)v6 + 3);
      uint64_t v14 = this[1];
      if (v13)
      {
        CFDictionarySetValue(v14, a2, v13);
        *((void *)v6 + 3) = 0;
      }
      else
      {
        CFDictionaryRemoveValue(v14, a2);
      }
    }
    else
    {
      remove(Value, v6);
    }
    int v15 = sandbox_extension_release();
    BOOL v16 = securityScopedLog;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
        SandboxExtensionCache::_release();
      }
      uint64_t v10 = 4;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
        SandboxExtensionCache::_release((void *)v6 + 1, (uint64_t)a2, v16);
      }
      uint64_t v10 = 0;
      *__error() = 1;
    }
    CFTypeRef v17 = (const void *)*((void *)v6 + 2);
    if (v17) {
      CFRelease(v17);
    }
    MEMORY[0x185300760](v6, 0x1060C40E6D94C38);
  }
  else
  {
    uint64_t v8 = v7 - 1;
    *(void *)Item = v7 - 1;
    int v9 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
      SandboxExtensionCache::_release((uint64_t)v6, v8, v9);
    }
    uint64_t v10 = 0;
    *__error() = 3;
  }
  return v10;
}

CFNumberRef BookmarkData::copyItem(BookmarkData *this, const __CFString *a2, int a3, uint64_t a4)
{
  CFNumberRef result = (CFNumberRef)BookmarkData::findItemInTOC(this, a2, a3);
  if (result)
  {
    unsigned int v7 = *((_DWORD *)result + 1);
    return BookmarkData::copyDataItemAtOffset(this, v7, a4);
  }
  return result;
}

uint64_t BookmarkData::findItemInTOC(BookmarkData *this, CFStringRef theString, int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!theString) {
    return 0;
  }
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    unsigned int v7 = (UInt8 *)CStringPtr;
    CFIndex Length = CFStringGetLength(theString);
    int v9 = 0;
    CFIndex usedBufLen = Length;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v21.CFURLRef length = CFStringGetLength(theString);
    unsigned int v7 = buffer;
    v21.CFIndex location = 0;
    if (CFStringGetBytes(theString, v21, 0x8000100u, 0, 0, buffer, 128, &usedBufLen))
    {
      int v9 = 0;
    }
    else
    {
      CFIndex maxBufLen = 0;
      v22.CFURLRef length = CFStringGetLength(theString);
      v22.CFIndex location = 0;
      if (CFStringGetBytes(theString, v22, 0x8000100u, 0, 0, 0, 0, &maxBufLen))
      {
        unsigned int v7 = (UInt8 *)malloc_type_malloc(maxBufLen, 0xC31A1981uLL);
        v23.CFURLRef length = CFStringGetLength(theString);
        v23.CFIndex location = 0;
        if (!CFStringGetBytes(theString, v23, 0x8000100u, 0, 0, v7, maxBufLen, &usedBufLen)) {
          CFIndex usedBufLen = 0;
        }
      }
      else
      {
        unsigned int v7 = 0;
      }
      int v9 = v7;
    }
  }
  uint64_t ItemInSingleTOCByKeyStringBytes = 0;
  if (v7)
  {
    size_t v11 = usedBufLen;
    if (usedBufLen >= 1)
    {
      uint64_t FirstTOC = BookmarkData::getFirstTOC(this, a3);
      if (!FirstTOC)
      {
        uint64_t ItemInSingleTOCByKeyStringBytes = 0;
        if (!v9) {
          return ItemInSingleTOCByKeyStringBytes;
        }
        goto LABEL_24;
      }
      uint64_t v13 = FirstTOC;
      uint64_t ItemInSingleTOCByKeyStringBytes = 0;
      do
      {
        if (*(_DWORD *)(v13 + 8) == a3) {
          uint64_t ItemInSingleTOCByKeyStringBytes = BookmarkData::findItemInSingleTOCByKeyStringBytes(this, v13, v7, v11);
        }
        uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v13 + 12));
        if (TOCAtOffset) {
          BOOL v15 = TOCAtOffset == v13;
        }
        else {
          BOOL v15 = 1;
        }
        uint64_t v13 = TOCAtOffset;
      }
      while (!v15);
    }
  }
  if (v9) {
LABEL_24:
  }
    free(v9);
  return ItemInSingleTOCByKeyStringBytes;
}

uint64_t BookmarkData::findItemInSingleTOCByKeyStringBytes(BookmarkData *this, uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v4 = *(unsigned int *)(a2 + 16);
  if (v4)
  {
    uint64_t v9 = 12 * v4;
    uint64_t v10 = a2 + 8;
    do
    {
      int v11 = *(_DWORD *)(v10 + v9);
      if ((v11 & 0x80000000) == 0) {
        break;
      }
      DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, v11 & 0x7FFFFFFF);
      if (DataItemAtOffset
        && DataItemAtOffset[1] == 257
        && *DataItemAtOffset == a4
        && !memcmp(a3, DataItemAtOffset + 2, a4))
      {
        return a2 + v9 + 8;
      }
      v9 -= 12;
    }
    while (v9);
  }
  return 0;
}

BOOL BookmarkData::getItemAs(BookmarkData *this, unsigned int a2, int a3, unsigned int *a4)
{
  uint64_t ItemInTOC = BookmarkData::findItemInTOC(this, a2, a3);
  if (!ItemInTOC) {
    return 0;
  }
  unsigned int v7 = *(_DWORD *)(ItemInTOC + 4);
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, v7);
  if (!DataItemAtOffset) {
    return 0;
  }
  unsigned int v9 = DataItemAtOffset[1];
  if (v9 != 771 && v9 != 513)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    CFNumberRef v12 = BookmarkData::copyDataItemAtOffset(this, v7, TypeID);
    if (v12)
    {
      CFNumberRef v13 = v12;
      BOOL v10 = CFNumberGetValue(v12, kCFNumberSInt32Type, a4) != 0;
      CFRelease(v13);
      return v10;
    }
    return 0;
  }
  if (*DataItemAtOffset != 4) {
    return 0;
  }
  *a4 = DataItemAtOffset[2];
  return 1;
}

void SandboxExtensionCache::_consume(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)CFURLRef v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_9(&dword_181761000, a2, a3, "handle %lld: new handle for path %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void SandboxExtensionCache::_insert(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8));
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_181761000, a2, OS_LOG_TYPE_DEBUG, "sandbox extension cache path count: %ld", v3, 0xCu);
}

void BookmarkData::~BookmarkData(BookmarkData *this)
{
  CFAllocatorRef v2 = (char *)this + 48;
  CFURLRef v3 = (char *)*((void *)this + 6);
  uint64_t v4 = (char *)this + 56;
  if (v3 != (char *)this + 56)
  {
    do
    {
      BOOL v5 = (const void *)*((void *)v3 + 5);
      if (v5)
      {
        CFRelease(v5);
        *((void *)v3 + 5) = 0;
      }
      BOOL v6 = (char *)*((void *)v3 + 1);
      if (v6)
      {
        do
        {
          unsigned int v7 = v6;
          BOOL v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          unsigned int v7 = (char *)*((void *)v3 + 2);
          BOOL v8 = *(void *)v7 == (void)v3;
          CFURLRef v3 = v7;
        }
        while (!v8);
      }
      CFURLRef v3 = v7;
    }
    while (v7 != v4);
  }
  unsigned int v9 = (const void *)*((void *)this + 1);
  if (v9)
  {
    CFRelease(v9);
    *((void *)this + 1) = 0;
  }
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)v2, *((void **)this + 7));
}

void createByResolvingBookmarkDataInternal()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_181761000, v0, v1, "Consuming sandbox extension in bookmark: %s", v2, v3, v4, v5, v6);
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x2Au);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

unsigned int *getBookmarkSandboxExtensionForTag(BookmarkData *a1, unsigned int a2, unsigned int *a3)
{
  CFNumberRef result = BookmarkData::getMisalignedItemDataPtr(a1, a2, 0, 1, a3);
  if (result)
  {
    if (*a3 && (v5 = result, uint64_t v6 = *a3 - 1, !*((unsigned char *)result + v6)))
    {
      if (strlen((const char *)result) == v6) {
        return v5;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void releaseBookmarkExtension(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1 >= 1 && sandbox_extension_release())
  {
    uint64_t v2 = resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_INFO))
    {
      int v3 = *__error();
      int v4 = 134218240;
      uint64_t v5 = a1;
      __int16 v6 = 1024;
      int v7 = v3;
      _os_log_impl(&dword_181761000, v2, OS_LOG_TYPE_INFO, "failed to release sandbox extension handle %lld, error=%{errno}d", (uint8_t *)&v4, 0x12u);
    }
  }
}

uint64_t fileIDsMatch(BookmarkData *a1, unsigned int a2, const __CFURL *a3)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  int v7 = BookmarkData::copyItem(a1, 0x1030u, a2, TypeID);
  if (v7)
  {
LABEL_2:
    if (volumeSupportsPersistentIDs((uint64_t)a3))
    {
      CFTypeRef propertyValueTypeRefPtr = 0;
      if (!CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x1E4F1CDD0], &propertyValueTypeRefPtr, 0))
      {
        uint64_t v8 = 0;
LABEL_16:
        if (propertyValueTypeRefPtr) {
          CFRelease(propertyValueTypeRefPtr);
        }
        goto LABEL_18;
      }
      if (propertyValueTypeRefPtr)
      {
        uint64_t v8 = CFEqual(v7, propertyValueTypeRefPtr);
        goto LABEL_16;
      }
    }
    uint64_t v8 = 0;
LABEL_18:
    CFRelease(v7);
    return v8;
  }
  CFTypeID v9 = CFArrayGetTypeID();
  CFArrayRef v10 = (const __CFArray *)BookmarkData::copyItem(a1, 0x1005u, a2, v9);
  if (v10)
  {
    CFArrayRef v11 = v10;
    if (CFArrayGetCount(v10) >= 1)
    {
      CFIndex Count = CFArrayGetCount(v11);
      CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(v11, Count - 1);
      if (ValueAtIndex)
      {
        uint64_t v14 = ValueAtIndex;
        CFTypeID v15 = CFGetTypeID(ValueAtIndex);
        if (v15 == CFNumberGetTypeID())
        {
          CFTypeRef v16 = CFRetain(v14);
          if (v16)
          {
            int v7 = v16;
            CFRelease(v11);
            goto LABEL_2;
          }
        }
      }
    }
    CFRelease(v11);
  }
  return volumeSupportsPersistentIDs((uint64_t)a3) ^ 1;
}

uint64_t BookmarkData::addItemToCache(BookmarkData *this, unsigned int a2, unsigned int a3, const void *a4)
{
  if (a2 && a3)
  {
    unint64_t v11 = __PAIR64__(a3, a2);
    __int16 v6 = (uint64_t **)((char *)this + 48);
    int v7 = std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>((uint64_t)this + 48, (unsigned int *)&v11);
    if ((uint64_t *)((char *)this + 56) == v7)
    {
      if (a4) {
        CFRetain(a4);
      }
      *(void *)&long long v10 = v11;
      *((void *)&v10 + 1) = a4;
      std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>(v6, (unsigned int *)&v10, &v10);
    }
    else
    {
      uint64_t v8 = (const void *)v7[5];
      if (v8 != a4)
      {
        if (a4) {
          CFRetain(a4);
        }
        *(void *)&long long v10 = v11;
        *((void *)&v10 + 1) = a4;
        std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>(v6, (unsigned int *)&v10, &v10);
        if (v8) {
          CFRelease(v8);
        }
      }
    }
  }
  return 0;
}

const void *BookmarkData::copyItem(BookmarkData *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = BookmarkData::copyItemFromCache(this, a2, a3);
  if (!v8)
  {
    uint64_t ItemInTOC = BookmarkData::findItemInTOC(this, a2, a3);
    if (ItemInTOC)
    {
      uint64_t v8 = BookmarkData::copyDataItemAtOffset(this, *(_DWORD *)(ItemInTOC + 4), a4);
      if (v8) {
        BookmarkData::addItemToCache(this, a2, a3, v8);
      }
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

CFTypeRef BookmarkData::copyItemFromCache(BookmarkData *this, unsigned int a2, unsigned int a3)
{
  CFTypeRef v3 = 0;
  if (a2 && a3)
  {
    v7[0] = a2;
    v7[1] = a3;
    uint64_t v5 = (CFTypeRef *)std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>((uint64_t)this + 48, v7);
    if ((CFTypeRef *)((char *)this + 56) == v5)
    {
      return 0;
    }
    else
    {
      CFTypeRef v3 = v5[5];
      if (v3) {
        CFRetain(v5[5]);
      }
    }
  }
  return v3;
}

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>(uint64_t a1, unsigned int *a2)
{
  int v4 = *(uint64_t **)(a1 + 8);
  uint64_t v2 = (uint64_t *)(a1 + 8);
  CFTypeRef v3 = v4;
  if (!v4) {
    return v2;
  }
  unsigned int v6 = *a2;
  unsigned int v5 = a2[1];
  int v7 = v2;
  do
  {
    unsigned int v8 = *((_DWORD *)v3 + 8);
    if (v8 >= v6)
    {
      if (v6 >= v8)
      {
        if (*((_DWORD *)v3 + 9) < v5) {
          ++v3;
        }
        else {
          int v7 = v3;
        }
      }
      else
      {
        int v7 = v3;
      }
    }
    else
    {
      ++v3;
    }
    CFTypeRef v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v7 == v2) {
    return v2;
  }
  unsigned int v9 = *((_DWORD *)v7 + 8);
  if (v6 < v9 || v9 >= v6 && v5 < *((_DWORD *)v7 + 9)) {
    return v2;
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>(uint64_t **a1, unsigned int *a2, _OWORD *a3)
{
  unsigned int v5 = std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__find_equal<std::pair<unsigned int,unsigned int>>((uint64_t)a1, &v9, a2);
  unsigned int v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    int v7 = (uint64_t **)v5;
    unsigned int v6 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v6 + 2) = *a3;
    std::__tree<CFBookmarkDataItem const*>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unsigned int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  CFNumberRef result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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
      CFTypeRef v3 = (uint64_t *)v2[2];
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
            long long v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              CFTypeRef v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            CFTypeRef v3 = v9[2];
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
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            CFTypeRef v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          CFTypeRef v3 = (uint64_t *)a2[2];
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

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__find_equal<std::pair<unsigned int,unsigned int>>(uint64_t a1, void *a2, unsigned int *a3)
{
  unsigned int v5 = *(uint64_t **)(a1 + 8);
  CFNumberRef result = (uint64_t *)(a1 + 8);
  int v4 = v5;
  if (v5)
  {
    unsigned int v6 = *a3;
    unsigned int v7 = a3[1];
    while (1)
    {
      while (1)
      {
        int v8 = v4;
        unsigned int v9 = *((_DWORD *)v4 + 8);
        if (v6 >= v9) {
          break;
        }
LABEL_4:
        int v4 = (uint64_t *)*v8;
        CFNumberRef result = v8;
        if (!*v8) {
          goto LABEL_12;
        }
      }
      if (v9 >= v6)
      {
        unsigned int v10 = *((_DWORD *)v8 + 9);
        if (v7 < v10) {
          goto LABEL_4;
        }
        if (v10 >= v7) {
          goto LABEL_12;
        }
      }
      CFNumberRef result = v8 + 1;
      int v4 = (uint64_t *)v8[1];
      if (!v4) {
        goto LABEL_12;
      }
    }
  }
  int v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

CFNumberRef BookmarkData::copyDataItemAtOffset(BookmarkData *this, unsigned int a2, uint64_t a3)
{
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, a2);
  v9[0] = 0;
  v9[1] = 0;
  int v8 = v9;
  CFNumberRef v6 = BookmarkData::copyItem((CFAllocatorRef *)this, DataItemAtOffset, (uint64_t)&v8, a3);
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)&v8, v9[0]);
  return v6;
}

uint64_t volumeSupportsPersistentIDs(uint64_t result)
{
  if (result)
  {
    CFNumberRef result = _CFURLGetVolumePropertyFlags();
    if (result) {
      return 0;
    }
  }
  return result;
}

CFDataRef _URLCopySecurityScopeFromFileURL(CFDataRef result)
{
  CFDataRef propertyValueTypeRefPtr = 0;
  if (result)
  {
    CFURLRef v1 = result;
    if (!_CFURLIsFileURL()) {
      return 0;
    }
    CFNumberRef result = (CFDataRef)CFURLCopyResourcePropertyForKey(v1, @"_NSURLSecuritySandboxExtensionKey", &propertyValueTypeRefPtr, 0);
    if (result && (CFNumberRef result = propertyValueTypeRefPtr) != 0
      || (uint64_t v2 = (SandboxExtensionCache *)SandboxExtensionCache::shared(result),
          CFNumberRef result = SandboxExtensionCache::copyExtensionForURL(v2, v1),
          (CFDataRef propertyValueTypeRefPtr = result) != 0))
    {
      CFTypeID v3 = CFGetTypeID(result);
      CFTypeID TypeID = CFDataGetTypeID();
      CFNumberRef result = propertyValueTypeRefPtr;
      if (v3 != TypeID)
      {
        CFRelease(propertyValueTypeRefPtr);
        return 0;
      }
    }
  }
  return result;
}

CFDataRef SandboxExtensionCache::copyExtensionForURL(SandboxExtensionCache *this, CFURLRef url)
{
  CFDataRef propertyValueTypeRefPtr = 0;
  CFDataRef Copy = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E4F1D748], &propertyValueTypeRefPtr, 0)) {
    BOOL v4 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)this);
    CFStringRef Value = (CFDataRef *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 1), propertyValueTypeRefPtr);
    if (Value) {
      CFDataRef Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Value[2]);
    }
    else {
      CFDataRef Copy = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)this);
    CFRelease(propertyValueTypeRefPtr);
  }
  return Copy;
}

void _URLAttachSecurityScopeToFileURL_cold_3(uint64_t a1, CFDataRef theData, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218243;
  uint64_t v5 = a1;
  __int16 v6 = 2081;
  BytePtr = CFDataGetBytePtr(theData);
  _os_log_debug_impl(&dword_181761000, a3, OS_LOG_TYPE_DEBUG, "%p: attaching sandbox extension %{private}s", (uint8_t *)&v4, 0x16u);
}

void _CFURLCreateByResolvingBookmarkData_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  CFTypeID v3 = "_CFURLCreateByResolvingBookmarkData";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl(&dword_181761000, a2, OS_LOG_TYPE_DEBUG, "%s: returning <%p %@>", (uint8_t *)&v2, 0x20u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void ___ZN21SandboxExtensionCache6sharedEv_block_invoke()
{
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

CFDataRef ___ZL21createFinderInfoValuePK7__CFURLPK15_FileAttributesPv_block_invoke()
{
  CFDataRef result = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], zeroFinderInfoBytes, 32, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::zeroFinderInfoData = (uint64_t)result;
  return result;
}

CFArrayRef ___ZL27copyVolumesArrayForBookmarkPK13__CFAllocatorR12BookmarkDataj_block_invoke()
{
  values[2] = *(void **)MEMORY[0x1E4F143B8];
  int v0 = (void *)*MEMORY[0x1E4F1D988];
  values[0] = *(void **)MEMORY[0x1E4F1D870];
  values[1] = v0;
  CFArrayRef result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 2, MEMORY[0x1E4F1D510]);
  copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::sPropertyKeys = (uint64_t)result;
  return result;
}

uint64_t _FSURLSetResourcePropertiesForKeys(const __CFURL *a1, const __CFDictionary *a2, CFTypeRef cf, CFErrorRef *a4)
{
  v113[1] = *MEMORY[0x1E4F143B8];
  CFTypeRef v7 = _FileCacheGetForURL(a1, cf);
  CFIndex Count = CFDictionaryGetCount(a2);
  uint64_t v9 = MEMORY[0x1F4188790](Count);
  CFTypeID v110 = (const void **)(&v101 - 32 * v10);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v108 = &v101 - 32 * v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  MEMORY[0x1F4188790](v13);
  CFTypeRef v17 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113[0] = 0;
  if (Count < 1)
  {
    LOBYTE(v33) = 1;
    return v33;
  }
  BOOL v109 = (uint64_t *)((char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = v16;
  uint64_t v105 = v16;
  uint64_t v107 = v15;
  if (v16 >= 1)
  {
    bzero(v17, v14);
    if ((unint64_t)Count >= 0x100)
    {
      __int16 v103 = a4;
      CFURLRef v104 = a1;
      CFTypeRef v102 = v7;
      CFTypeRef v19 = 0;
      uint64_t v20 = 0;
      CFNumberRef v106 = (uint64_t *)*MEMORY[0x1E4F1D260];
      CFRange v21 = (const void *)*MEMORY[0x1E4F1D738];
      while (1)
      {
        CFRange v22 = &sFileProviderGlobals[7 * v20];
        int v24 = *((_DWORD *)v22 + 5);
        CFRange v23 = (int *)v22 + 5;
        if (v24 >= 1) {
          break;
        }
        CFTypeRef v28 = v19;
LABEL_17:
        ++v20;
        CFTypeRef v19 = v28;
        uint64_t v18 = v105;
        if (v20 == v105) {
          goto LABEL_37;
        }
      }
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      while (1)
      {
        uint64_t v27 = sFileProviderGlobals[7 * v20 + 8] + v25;
        value = 0;
        if (CFDictionaryGetValueIfPresent(a2, *(const void **)(v27 + 8), (const void **)&value))
        {
          CFTypeRef v28 = value;
          if (!value)
          {
            CFTypeRef v28 = v106;
            value = v106;
          }
          int v29 = *(const void **)(v27 + 8);
          if (v29 == v21)
          {
            v113[0] = v28;
            goto LABEL_14;
          }
          double v30 = (char *)v109;
          uint64_t v31 = v109[v20];
          *(&v110[96 * v20] + v31) = v29;
          uint64_t v32 = v107;
          v108[96 * v20 + v31] = (uint64_t)v28;
          *(void *)(v32 + 768 * v20 + 8 * v31) = *(void *)v27;
          *(void *)&v30[8 * v20] = v31 + 1;
        }
        CFTypeRef v28 = v19;
LABEL_14:
        ++v26;
        v25 += 148;
        CFTypeRef v19 = v28;
        if (v26 >= *v23) {
          goto LABEL_17;
        }
      }
    }
    goto LABEL_21;
  }
  if ((unint64_t)Count < 0x100)
  {
LABEL_21:
    CFURLRef v104 = a1;
    CFTypeRef v102 = v7;
    CFNumberRef v106 = &v101;
    MEMORY[0x1F4188790](v17);
    unint64_t v34 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
    CFRange v35 = (const void **)((char *)&v101 - v34);
    if ((unint64_t)(8 * Count) >= 0x200) {
      size_t v36 = 512;
    }
    else {
      size_t v36 = 8 * Count;
    }
    bzero((char *)&v101 - v34, v36);
    MEMORY[0x1F4188790](v37);
    BOOL v38 = (void **)((char *)&v101 - v34);
    bzero((char *)&v101 - v34, v36);
    CFDictionaryGetKeysAndValues(a2, (const void **)((char *)&v101 - v34), (const void **)((char *)&v101 - v34));
    CFTypeRef v28 = 0;
    uint64_t v39 = (const void *)*MEMORY[0x1E4F1D738];
    unsigned int v40 = (void *)*MEMORY[0x1E4F1D260];
    do
    {
      CFRange v41 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, *v35);
      if (v41)
      {
        CFRange v42 = (const void *)*((void *)v41 + 1);
        if (v42 == v39)
        {
          if (*v38) {
            CFTypeRef v28 = *v38;
          }
          else {
            CFTypeRef v28 = v40;
          }
          v113[0] = v28;
        }
        else
        {
          uint64_t v43 = **(int **)(v41 + 140);
          unsigned int v44 = (char *)v109;
          uint64_t v45 = v109[v43];
          if (v45 <= 95)
          {
            *(&v110[96 * v43] + v45) = v42;
            CFStringRef v46 = *v38;
            if (!*v38) {
              CFStringRef v46 = v40;
            }
            v108[96 * v43 + v45] = (uint64_t)v46;
            *(void *)(v107 + 768 * v43 + 8 * v45) = *(void *)v41;
            *(void *)&v44[8 * v43] = v45 + 1;
          }
        }
      }
      ++v38;
      ++v35;
      --Count;
    }
    while (Count);
    __int16 v103 = a4;
LABEL_37:
    CFTypeRef v7 = v102;
    _FileCacheLock((uint64_t)v102);
    if (v18 < 1)
    {
      uint64_t v59 = 0;
      int v33 = 1;
LABEL_44:
      a4 = v103;
      uint64_t v60 = (uint64_t)v104;
      CFArrayRef v61 = (CFDictionaryRef *)&unk_1EB20E000;
      if (v28)
      {
        uint64_t v62 = MEMORY[0x1E4F1D738];
        uint64_t v63 = (uint64_t)v7;
        CFTypeID v64 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, (const void *)*MEMORY[0x1E4F1D738]);
        value = *(void **)v64;
        uint64_t v65 = *(void *)(v64 + 140);
        int v66 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *, void **, uint64_t, uint64_t, CFErrorRef *))(v65 + 40);
        int v67 = a4;
        uint64_t v68 = *(void *)(v65 + 8);
        _FileCacheIncrementInProvider(v63);
        uint64_t v69 = v68;
        a4 = v67;
        int v33 = v66(v60, v63, v62, v113, &value, 1, v69, v67);
        _FileCacheDecrementInProvider(v63);
        if (v33) {
          clearPropertyAndDependentValues(v60, v63, (uint64_t)v64);
        }
        CFTypeRef v7 = (CFTypeRef)v63;
      }
      CFArrayRef v70 = (char *)v109;
    }
    else
    {
      uint64_t v47 = v18;
      uint64_t v48 = 0;
      int v33 = 1;
      int v50 = v109;
      CFStringRef v49 = v110;
      CFURLRef v51 = &qword_1EB20DF28;
      uint64_t v53 = v107;
      uint64_t v52 = v108;
      while (1)
      {
        uint64_t v54 = *v50;
        if (*v50 >= 1)
        {
          uint64_t v108 = (uint64_t *)*v51;
          uint64_t v55 = *(v51 - 4);
          _FileCacheIncrementInProvider((uint64_t)v7);
          int v56 = ((uint64_t (*)(const __CFURL *, CFTypeRef, const void **, uint64_t *, uint64_t, uint64_t, uint64_t, CFErrorRef *))v108)(v104, v7, v49, v52, v53, v54, v55, v103);
          uint64_t v57 = v105;
          int v33 = v56;
          uint64_t v58 = _FileCacheDecrementInProvider((uint64_t)v7);
          uint64_t v47 = v57;
          if (!v33) {
            break;
          }
        }
        v49 += 96;
        ++v50;
        v51 += 7;
        v52 += 96;
        v53 += 768;
        if (v47 == ++v48)
        {
          uint64_t v59 = v47;
          goto LABEL_44;
        }
      }
      a4 = v103;
      if (v103)
      {
        CFTypeRef v76 = v7;
        uint64_t v59 = v48;
        if (*v103)
        {
          uint64_t v77 = v47;
          CFIndex v78 = v103;
          MEMORY[0x1F4188790](v58);
          CFURLRef v81 = (const void **)(&v101 - 32 * v80);
          if (v79 >= 0x200) {
            size_t v82 = 512;
          }
          else {
            size_t v82 = v79;
          }
          bzero(&v101 - 32 * v80, v82);
          if (v77 <= v59)
          {
            CFIndex v83 = 0;
          }
          else
          {
            CFIndex v83 = 0;
            uint64_t v84 = v77 - v59;
            do
            {
              uint64_t v86 = *v50++;
              uint64_t v85 = v86;
              if (v86 >= 1)
              {
                memcpy(&v81[v83], v49, 8 * v85);
                v83 += v85;
              }
              v49 += 96;
              --v84;
            }
            while (v84);
          }
          CFURLRef v88 = v104;
          CFAllocatorRef v89 = CFGetAllocator(v104);
          CFArrayRef v90 = CFArrayCreate(v89, v81, v83, MEMORY[0x1E4F1D510]);
          value = v90;
          CFDictionaryRef v91 = CFErrorCopyUserInfo(*v78);
          if (v91)
          {
            CFDictionaryRef v92 = v91;
            CFAllocatorRef v93 = CFGetAllocator(v88);
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v93, 0, v92);
            CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1E4F1D6F8], v90);
            CFRelease(v92);
          }
          else
          {
            keys = (void *)*MEMORY[0x1E4F1D6F8];
            CFAllocatorRef v95 = CFGetAllocator(v88);
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreate(v95, (const void **)&keys, (const void **)&value, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          }
          CFAllocatorRef v96 = CFGetAllocator(v88);
          CFErrorDomain Domain = CFErrorGetDomain(*v78);
          CFIndex Code = CFErrorGetCode(*v78);
          CFStringRef v99 = Domain;
          a4 = v78;
          CFErrorRef v100 = CFErrorCreate(v96, v99, Code, MutableCopy);
          CFRelease(*v78);
          CFRelease(value);
          CFRelease(MutableCopy);
          *CFIndex v78 = v100;
          int v33 = 0;
          CFTypeRef v7 = v76;
          uint64_t v60 = (uint64_t)v88;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
            _FSURLSetResourcePropertiesForKeys_cold_2();
          }
          int v33 = 0;
          uint64_t v60 = (uint64_t)v104;
        }
        CFArrayRef v70 = (char *)v109;
        CFArrayRef v61 = (CFDictionaryRef *)&unk_1EB20E000;
      }
      else
      {
        int v33 = 0;
        uint64_t v60 = (uint64_t)v104;
        CFArrayRef v70 = (char *)v109;
        CFArrayRef v61 = (CFDictionaryRef *)&unk_1EB20E000;
        uint64_t v59 = v48;
      }
    }
    if (v59)
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        uint64_t v72 = *(void *)&v70[8 * i];
        if (v72 >= 1)
        {
          uint64_t v73 = v110;
          do
          {
            CFIndex v74 = *v73++;
            CFTypeID v75 = CFDictionaryGetValue(v61[5], v74);
            clearPropertyAndDependentValues(v60, (uint64_t)v7, (uint64_t)v75);
            --v72;
          }
          while (v72);
        }
        v110 += 96;
      }
    }
    goto LABEL_68;
  }
  _FileCacheLock((uint64_t)v7);
  int v33 = 1;
LABEL_68:
  _FileCacheUnlock((uint64_t)v7);
  if (a4 && !v33)
  {
    if (*a4)
    {
      LOBYTE(v33) = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLSetResourcePropertiesForKeys_cold_1();
      }
      LOBYTE(v33) = 0;
      *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
    }
  }
  return v33;
}

uint64_t _FSURLGetResourcePropertyFlags(const __CFURL *a1, uint64_t a2, void *a3, CFTypeRef cf, CFErrorRef *a5)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  CFURLRef v93 = a1;
  CFTypeRef v8 = _FileCacheGetForURL(a1, cf);
  uint64_t v98 = (uint64_t)v8;
  uint64_t v9 = qword_1EB20DEF8;
  CFURLRef v88 = a5;
  if (_FSURLGetResourcePropertyFlags::sOnce != -1) {
    dispatch_once(&_FSURLGetResourcePropertyFlags::sOnce, &__block_literal_global_6);
  }
  if (_FSURLGetResourcePropertyFlags::maskToPropertyTableCount) {
    uint64_t v10 = 18;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v97 = &v85 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = &v85 - v14;
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  CFAllocatorRef v96 = &v85 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = &v85 - v19;
  MEMORY[0x1F4188790](v18);
  CFRange v22 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    if (v9 >= 1) {
      bzero((char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    }
    uint64_t v23 = _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
    int v24 = (uint64_t *)(_FSURLGetResourcePropertyFlags::maskToPropertyTable + 24);
    do
    {
      if ((v23 & a2) != 0)
      {
        uint64_t v25 = *(v24 - 1);
        uint64_t v26 = **(int **)(v25 + 140);
        uint64_t v27 = *(void *)&v22[8 * v26];
        if (v27 <= 95)
        {
          uint64_t v28 = (int)v10 * (uint64_t)(int)v26;
          v97[v28 + v27] = *(void *)(v25 + 8);
          v15[v28 + v27] = 0;
          v96[v28 + v27] = *(void *)v25;
          v20[v28 + v27] = v23;
          *(void *)&v22[8 * v26] = v27 + 1;
        }
      }
      uint64_t v29 = *v24;
      v24 += 3;
      uint64_t v23 = v29;
    }
    while (v29);
    CFAllocatorRef v89 = v20;
    CFArrayRef v90 = a3;
    uint64_t v30 = v98;
    _FileCacheLock(v98);
    uint64_t v31 = 8 * v10;
    uint64_t v94 = 8 * v10;
    uint64_t v91 = v9;
    CFStringRef v87 = v22;
    if (v9 < 1)
    {
      int v34 = 1;
LABEL_31:
      _FileCacheUnlock(v30);
      unsigned int v44 = v90;
      uint64_t v45 = v91;
      CFStringRef v46 = v89;
    }
    else
    {
      uint64_t v86 = a2;
      CFAllocatorRef v95 = v22 - 8;
      uint64_t v32 = v9;
      int v33 = &sFileProviderGlobals[7 * v9 - 4];
      int v34 = 1;
      uint64_t v92 = 8 * v10 * (v9 - 1);
      uint64_t v35 = v92;
      while (1)
      {
        uint64_t v36 = *(void *)&v95[8 * v32];
        if (v36 >= 1)
        {
          uint64_t v37 = (char *)v97 + v35;
          BOOL v38 = (char *)v96 + v35;
          uint64_t v39 = *v33;
          unsigned int v40 = (uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v33[1];
          _FileCacheIncrementInProvider(v98);
          int v41 = v40(v93, v98, v37, (char *)v15 + v35, v38, v36, v39);
          uint64_t v30 = v98;
          int v34 = v41;
          _FileCacheDecrementInProvider(v98);
          uint64_t v31 = v94;
          if (!v34) {
            break;
          }
        }
        v35 -= v31;
        v33 -= 7;
        BOOL v42 = v32-- <= 1;
        if (v42) {
          goto LABEL_31;
        }
      }
      int v43 = _FileCacheLockTransitionToPreparer(v30);
      unsigned int v44 = v90;
      uint64_t v45 = v91;
      CFStringRef v46 = v89;
      if (!v43)
      {
        _FileCacheLock(v98);
        BOOL v42 = v45 < 1;
        uint64_t v47 = v94;
        uint64_t v48 = v92;
        if (!v42)
        {
          int v34 = 0;
          uint64_t v49 = v91;
          int v50 = &sFileProviderGlobals[7 * v91 - 4];
          uint64_t v51 = v98;
          while (1)
          {
            uint64_t v52 = *(void *)&v95[8 * v49];
            if (v52 >= 1)
            {
              uint64_t v53 = (char *)v97 + v48;
              uint64_t v54 = (char *)v15 + v48;
              uint64_t v55 = (char *)v96 + v48;
              uint64_t v92 = v48;
              uint64_t v57 = *v50;
              int v56 = (uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v50[1];
              _FileCacheIncrementInProvider(v51);
              int v58 = v56(v93, v51, v53, v54, v55, v52, v57);
              uint64_t v48 = v92;
              int v34 = v58;
              _FileCacheDecrementInProvider(v51);
              uint64_t v47 = v94;
              if (!v34) {
                break;
              }
            }
            v48 -= v47;
            v50 -= 7;
            BOOL v42 = v49-- <= 1;
            if (v42)
            {
              _FileCacheUnlock(v98);
              unsigned int v44 = v90;
              uint64_t v45 = v91;
              CFStringRef v46 = v89;
              if (v34) {
                goto LABEL_44;
              }
              goto LABEL_33;
            }
          }
        }
        _FileCacheUnlock(v98);
        unsigned int v44 = v90;
        uint64_t v45 = v91;
        CFStringRef v46 = v89;
      }
LABEL_33:
      memset(v99, 0, 60);
      uint64_t v59 = _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
      uint64_t v60 = (uint64_t *)(_FSURLGetResourcePropertyFlags::maskToPropertyTable + 24);
      CFArrayRef v61 = (uint64_t *)v87;
      uint64_t v62 = v86;
      do
      {
        if ((v59 & v62) != 0) {
          addPropertyAndDependenciesToBitmap(*(v60 - 1), (uint64_t)v99);
        }
        uint64_t v63 = *v60;
        v60 += 3;
        uint64_t v59 = v63;
      }
      while (v63);
      uint64_t v64 = v98;
      int v34 = prepareValuesForBitmap((uint64_t)v93, v98, (uint64_t)v99, (uint64_t)v88);
      if (v34)
      {
        _FileCacheLock(v64);
        if (v45 >= 1)
        {
          uint64_t v65 = 0;
          int v66 = v61;
          int v67 = &qword_1EB20DF10;
          uint64_t v68 = v94;
          uint64_t v69 = v98;
          do
          {
            uint64_t v71 = *v66++;
            uint64_t v70 = v71;
            if (v71 >= 1)
            {
              CFAllocatorRef v95 = (char *)*v67;
              uint64_t v72 = (char *)v97 + v65;
              uint64_t v73 = (char *)v96 + v65;
              uint64_t v92 = *(v67 - 1);
              _FileCacheIncrementInProvider(v69);
              int v34 = ((uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v95)(v93, v69, v72, (char *)v15 + v65, v73, v70, v92);
              _FileCacheDecrementInProvider(v69);
              uint64_t v68 = v94;
            }
            v65 += v68;
            v67 += 7;
            --v45;
          }
          while (v45);
        }
        _FileCacheUnlock(v98);
        unsigned int v44 = v90;
        uint64_t v45 = v91;
        CFStringRef v46 = v89;
      }
LABEL_44:
      uint64_t v74 = v98;
      _FileCacheLockTransitionFromPreparer(v98);
      _FileCacheUnlock(v74);
      if (!v34) {
        goto LABEL_53;
      }
    }
    *unsigned int v44 = 0;
    if (v45 < 1) {
      return v34;
    }
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = *MEMORY[0x1E4F1CFD0];
    CFIndex v78 = v87;
    uint64_t v79 = v94;
    do
    {
      uint64_t v80 = *(void *)&v78[8 * v76];
      if (v80 >= 1)
      {
        CFURLRef v81 = v15;
        size_t v82 = v46;
        do
        {
          if (*v81 == v77)
          {
            v75 |= *v82;
            *unsigned int v44 = v75;
          }
          ++v82;
          ++v81;
          --v80;
        }
        while (v80);
      }
      ++v76;
      CFStringRef v46 = (uint64_t *)((char *)v46 + v79);
      uint64_t v15 = (uint64_t *)((char *)v15 + v79);
    }
    while (v76 != v45);
  }
  else
  {
    int v34 = 0;
  }
LABEL_53:
  CFIndex v83 = v88;
  if (v88 && !v34)
  {
    if (*v88)
    {
      LOBYTE(v34) = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLGetResourcePropertyFlags_cold_1();
      }
      LOBYTE(v34) = 0;
      *CFIndex v83 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
    }
  }
  return v34;
}

uint64_t VolumePropertyProviderSetValues(const __CFString *a1, uint64_t a2, CFTypeRef *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  if (a6 < 1) {
    return 1;
  }
  uint64_t v8 = a6;
  char v12 = 0;
  uint64_t v13 = (const void *)*MEMORY[0x1E4F1D8B0];
  uint64_t v14 = *MEMORY[0x1E4F1D260];
  int v15 = 1;
  int v16 = 1;
  do
  {
    uint64_t v17 = *a4;
    if (*a4)
    {
      int v18 = CFEqual(*a3, v13);
      if (v17 != v14 && v18 != 0) {
        char v12 = 1;
      }
    }
    else
    {
      if (!v16) {
        goto LABEL_9;
      }
      uint64_t v20 = *a5;
      if (CFEqual(*(CFTypeRef *)(*a5 + 8), @"__kCFURLCheapVolumeInformationKey"))
      {
        _FileCacheSetVolumeInfo(a2, 0);
        int v16 = 0;
        goto LABEL_9;
      }
      if (!v15) {
        goto LABEL_18;
      }
      if (CFEqual(*(CFTypeRef *)(v20 + 8), @"__kCFURLExpensiveVolumeInformationKey"))
      {
        CFDataRef VolumeInfo = (__CFData *)_FileCacheGetVolumeInfo(a2);
        if (VolumeInfo)
        {
          int v15 = 0;
          *(void *)CFDataGetMutableBytePtr(VolumeInfo) = -1;
LABEL_18:
          int v16 = 1;
          goto LABEL_9;
        }
        int v16 = 0;
      }
      else
      {
        int v16 = 1;
      }
      int v15 = 1;
    }
LABEL_9:
    ++a5;
    ++a4;
    ++a3;
    --v8;
  }
  while (v8);
  if (!v12) {
    return 1;
  }
  if (!a8) {
    return 0;
  }
  CFAllocatorRef v22 = CFGetAllocator(a1);
  CFErrorRef v23 = _FSURLCreateStandardError(v22, (const __CFString *)*MEMORY[0x1E4F1D160], 45, 1, a1, 0);
  uint64_t result = 0;
  *a8 = v23;
  return result;
}

CFArrayRef createArrayOfPathComponentsFromString(const __CFAllocator *a1, const __CFString *a2, int a3)
{
  if (!a2) {
    return 0;
  }
  LODWORD(v3) = a3;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(a1, a2, @"/");
  CFArrayRef v6 = ArrayBySeparatingStrings;
  if (ArrayBySeparatingStrings && CFArrayGetCount(ArrayBySeparatingStrings) >= 1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    if (CFStringGetLength(ValueAtIndex)) {
      CFIndex v3 = v3;
    }
    else {
      CFIndex v3 = (v3 + 1);
    }
    if (v3)
    {
      v11.CFURLRef length = CFArrayGetCount(v6) - v3;
      v11.CFIndex location = v3;
      CFArrayRef v8 = copyOfArray(a1, v6, v11);
      if (v6 != v8)
      {
        CFArrayRef v9 = v8;
        CFRelease(v6);
        return v9;
      }
    }
  }
  return v6;
}

CFDictionaryRef CFDictionaryCreateWithItems(const __CFAllocator *a1, void *a2, void *a3, void *a4, void *a5)
{
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  keys[0] = 0;
  keys[1] = 0;
  values[0] = 0;
  values[1] = 0;
  if (a2 && a3)
  {
    keys[0] = a2;
    values[0] = a3;
    CFIndex v5 = 1;
    if (!a4 || !a5) {
      return CFDictionaryCreate(a1, (const void **)keys, (const void **)values, v5, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    goto LABEL_8;
  }
  if (!a4) {
    return 0;
  }
  CFIndex v5 = 0;
  uint64_t v6 = 0;
  if (a5)
  {
LABEL_8:
    keys[v5] = a4;
    values[v5++] = a5;
    return CFDictionaryCreate(a1, (const void **)keys, (const void **)values, v5, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  return (CFDictionaryRef)v6;
}

uint64_t asString(const void *const *a1)
{
  CFURLRef v1 = (CFTypeRef *)MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v75);
  if (!*v1)
  {
    CFArrayRef v9 = "<NULL>";
LABEL_9:
    CFArrayRef v8 = v75;
    uint64_t v10 = 6;
    goto LABEL_34;
  }
  CFTypeID v4 = CFGetTypeID(*v1);
  if (v4 == CFStringGetTypeID())
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0x8000100u);
    if (CStringPtr
      || (CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0x600u)) != 0
      || (CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0)) != 0)
    {
      LOBYTE(v78) = 34;
      uint64_t v6 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)&v78, 1);
      size_t v7 = strlen(CStringPtr);
      CFArrayRef v8 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v6, (uint64_t)CStringPtr, v7);
      LOBYTE(v78) = 34;
      CFArrayRef v9 = (const char *)&v78;
    }
    else
    {
      uint64_t v72 = 0;
      CFStringRef v38 = (const __CFString *)*v1;
      v82.CFURLRef length = CFStringGetLength(v38);
      v82.CFIndex location = 0;
      if (!CFStringGetBytes(v38, v82, 0x8000100u, 0, 0, (UInt8 *)&v78, 0xFFFFLL, (CFIndex *)&v72))
      {
        CFArrayRef v9 = "< unrepresentable string>";
        CFArrayRef v8 = v75;
        uint64_t v10 = 25;
        goto LABEL_34;
      }
      *((unsigned char *)&v78 + (void)v72) = 0;
      LOBYTE(v70[0]) = 34;
      uint64_t v39 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v70, 1);
      size_t v40 = strlen((const char *)&v78);
      CFArrayRef v8 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v39, (uint64_t)&v78, v40);
      LOBYTE(v70[0]) = 34;
      CFArrayRef v9 = (const char *)v70;
    }
    goto LABEL_7;
  }
  if (v4 == CFArrayGetTypeID())
  {
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"[", 1);
    if (CFArrayGetCount((CFArrayRef)*v1) >= 1)
    {
      CFIndex v11 = 0;
      do
      {
        v70[0] = CFArrayGetValueAtIndex((CFArrayRef)*v1, v11);
        if (v11) {
          char v12 = ", ";
        }
        else {
          char v12 = "";
        }
        std::string::basic_string[abi:nn180100]<0>(&v78, v12);
        if ((v80 & 0x80u) == 0) {
          uint64_t v13 = (void **)&v78;
        }
        else {
          uint64_t v13 = v78;
        }
        if ((v80 & 0x80u) == 0) {
          uint64_t v14 = v80;
        }
        else {
          uint64_t v14 = v79;
        }
        int v15 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v13, v14);
        asString((uint64_t *)&v72, v70);
        if ((v74 & 0x80u) == 0) {
          int v16 = &v72;
        }
        else {
          int v16 = (__CFString **)v72;
        }
        if ((v74 & 0x80u) == 0) {
          uint64_t v17 = v74;
        }
        else {
          uint64_t v17 = v73;
        }
        std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)v16, v17);
        if ((char)v74 < 0) {
          operator delete(v72);
        }
        if ((char)v80 < 0) {
          operator delete(v78);
        }
        ++v11;
      }
      while (v11 < CFArrayGetCount((CFArrayRef)*v1));
    }
    CFArrayRef v9 = "] ";
    CFArrayRef v8 = v75;
    uint64_t v10 = 2;
    goto LABEL_34;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryRef v20 = (const __CFDictionary *)*v1;
  if (v4 == TypeID)
  {
    v66[2] = v3;
    int64_t Count = CFDictionaryGetCount(v20);
    v66[1] = v66;
    MEMORY[0x1F4188790](Count);
    CFErrorRef v23 = (const void **)((char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v22 >= 0x200) {
      size_t v24 = 512;
    }
    else {
      size_t v24 = v22;
    }
    bzero((char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v24);
    CFDictionaryGetKeysAndValues(v20, v23, 0);
    qsort_b(v23, Count, 8uLL, &__block_literal_global);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"{", 1);
    if (Count >= 1)
    {
      uint64_t v25 = 0;
      do
      {
        if (v25) {
          uint64_t v26 = ", ";
        }
        else {
          uint64_t v26 = "";
        }
        std::string::basic_string[abi:nn180100]<0>(&v78, v26);
        if ((v80 & 0x80u) == 0) {
          uint64_t v27 = (void **)&v78;
        }
        else {
          uint64_t v27 = v78;
        }
        if ((v80 & 0x80u) == 0) {
          uint64_t v28 = v80;
        }
        else {
          uint64_t v28 = v79;
        }
        uint64_t v29 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v27, v28);
        asString((uint64_t *)&v72, v23);
        if ((v74 & 0x80u) == 0) {
          uint64_t v30 = &v72;
        }
        else {
          uint64_t v30 = (__CFString **)v72;
        }
        if ((v74 & 0x80u) == 0) {
          uint64_t v31 = v74;
        }
        else {
          uint64_t v31 = v73;
        }
        uint64_t v32 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v29, (uint64_t)v30, v31);
        int v33 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v32, (uint64_t)"=", 1);
        CFStringRef Value = CFDictionaryGetValue(v20, *v23);
        asString((uint64_t *)v70, &Value);
        if ((v71 & 0x80u) == 0) {
          int v34 = v70;
        }
        else {
          int v34 = (const void **)v70[0];
        }
        if ((v71 & 0x80u) == 0) {
          uint64_t v35 = v71;
        }
        else {
          uint64_t v35 = (uint64_t)v70[1];
        }
        std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v33, (uint64_t)v34, v35);
        if ((char)v71 < 0) {
          operator delete((void *)v70[0]);
        }
        if ((char)v74 < 0) {
          operator delete(v72);
        }
        if ((char)v80 < 0) {
          operator delete(v78);
        }
        --v25;
        ++v23;
      }
      while (-Count != v25);
    }
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"} ", 2);
    goto LABEL_35;
  }
  if (v20 == (const __CFDictionary *)*MEMORY[0x1E4F1CFD0])
  {
    CFArrayRef v9 = "TRUE ";
    CFArrayRef v8 = v75;
    uint64_t v10 = 5;
    goto LABEL_34;
  }
  if (v20 == (const __CFDictionary *)*MEMORY[0x1E4F1CFC8])
  {
    CFArrayRef v9 = "FALSE ";
    goto LABEL_9;
  }
  if (v4 == CFNumberGetTypeID())
  {
    LODWORD(v72) = 0;
    CFIndex v78 = 0;
    if (CFNumberGetValue((CFNumberRef)*v1, kCFNumberSInt32Type, &v72))
    {
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"#", 1);
      uint64_t v36 = (void *)std::ostream::operator<<();
      uint64_t v37 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v36, (uint64_t)"/0x", 3);
      *(_DWORD *)((char *)v37 + *(void *)(*v37 - 24) + 8) = *(_DWORD *)((unsigned char *)v37 + *(void *)(*v37 - 24) + 8) & 0xFFFFFFB5 | 8;
      CFArrayRef v8 = (void *)std::ostream::operator<<();
    }
    else
    {
      if (!CFNumberGetValue((CFNumberRef)*v1, kCFNumberSInt64Type, &v78))
      {
        CFArrayRef v9 = "[CFNumber?] ";
        CFArrayRef v8 = v75;
        uint64_t v10 = 12;
        goto LABEL_34;
      }
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)"#", 1);
      uint64_t v62 = (void *)std::ostream::operator<<();
      uint64_t v63 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v62, (uint64_t)"/0x", 3);
      *(_DWORD *)((char *)v63 + *(void *)(*v63 - 24) + 8) = *(_DWORD *)((unsigned char *)v63 + *(void *)(*v63 - 24) + 8) & 0xFFFFFFB5 | 8;
      CFArrayRef v8 = (void *)std::ostream::operator<<();
    }
    *(_DWORD *)((char *)v8 + *(void *)(*v8 - 24) + 8) = *(_DWORD *)((unsigned char *)v8 + *(void *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 2;
    CFArrayRef v9 = " ";
LABEL_7:
    uint64_t v10 = 1;
LABEL_34:
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v8, (uint64_t)v9, v10);
    goto LABEL_35;
  }
  if (v4 == CFDateGetTypeID())
  {
    CFAbsoluteTime v41 = MEMORY[0x1852FFDA0](*v1);
    CFAbsoluteTimeGetGregorianDate(v41, 0);
    *(void *)((char *)&v75[3] + *(void *)(v75[0] - 24)) = 4;
    LOBYTE(v78) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v75, (char *)&v78);
    BOOL v42 = (void *)std::ostream::operator<<();
    int v43 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v42, (uint64_t)"/", 1);
    *(void *)((char *)v43 + *(void *)(*v43 - 24) + 24) = 2;
    LOBYTE(v72) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v43, (char *)&v72);
    unsigned int v44 = (void *)std::ostream::operator<<();
    uint64_t v45 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v44, (uint64_t)"/", 1);
    *(void *)((char *)v45 + *(void *)(*v45 - 24) + 24) = 2;
    LOBYTE(v70[0]) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v45, (char *)v70);
    CFStringRef v46 = (void *)std::ostream::operator<<();
    uint64_t v47 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v46, (uint64_t)" ", 1);
    *(void *)((char *)v47 + *(void *)(*v47 - 24) + 24) = 2;
    LOBYTE(Value) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v47, (char *)&Value);
    uint64_t v48 = (void *)std::ostream::operator<<();
    uint64_t v49 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v48, (uint64_t)":", 1);
    *(void *)((char *)v49 + *(void *)(*v49 - 24) + 24) = 2;
    char v68 = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v49, &v68);
    int v50 = (void *)std::ostream::operator<<();
    uint64_t v51 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v50, (uint64_t)":", 1);
    *(void *)((char *)v51 + *(void *)(*v51 - 24) + 24) = 2;
    char v67 = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v51, &v67);
    std::ostream::operator<<();
    goto LABEL_35;
  }
  CFTypeID v52 = CFURLGetTypeID();
  CFTypeRef v53 = *v1;
  if (v4 != v52)
  {
    int v56 = (__CFString *)CFCopyDescription(v53);
    uint64_t v72 = v56;
    asString((uint64_t *)&v78, (const void *const *)&v72);
    if ((v80 & 0x80u) == 0) {
      uint64_t v60 = (const char *)&v78;
    }
    else {
      uint64_t v60 = (const char *)v78;
    }
    if ((v80 & 0x80u) == 0) {
      uint64_t v61 = v80;
    }
    else {
      uint64_t v61 = v79;
    }
    uint64_t v59 = v75;
    goto LABEL_104;
  }
  CFURLRef v54 = CFURLGetBaseURL((CFURLRef)v53);
  CFURLRef v55 = (const __CFURL *)*v1;
  if (v54)
  {
    int v56 = (__CFString *)CFURLCopyAbsoluteURL(v55);
    uint64_t v72 = (__CFString *)CFURLGetString((CFURLRef)v56);
    asString((uint64_t *)&v78, (const void *const *)&v72);
    if ((v80 & 0x80u) == 0) {
      uint64_t v57 = (void **)&v78;
    }
    else {
      uint64_t v57 = v78;
    }
    if ((v80 & 0x80u) == 0) {
      uint64_t v58 = v80;
    }
    else {
      uint64_t v58 = v79;
    }
    uint64_t v59 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v57, v58);
    uint64_t v60 = "(*)";
    uint64_t v61 = 3;
LABEL_104:
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v59, (uint64_t)v60, v61);
    if ((char)v80 < 0) {
      operator delete(v78);
    }
    if (v56) {
      CFRelease(v56);
    }
    goto LABEL_35;
  }
  uint64_t v72 = (__CFString *)CFURLGetString(v55);
  asString((uint64_t *)&v78, (const void *const *)&v72);
  if ((v80 & 0x80u) == 0) {
    uint64_t v64 = (void **)&v78;
  }
  else {
    uint64_t v64 = v78;
  }
  if ((v80 & 0x80u) == 0) {
    uint64_t v65 = v80;
  }
  else {
    uint64_t v65 = v79;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v75, (uint64_t)v64, v65);
  if ((char)v80 < 0) {
    operator delete(v78);
  }
LABEL_35:
  std::stringbuf::str();
  v75[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v75 + *(void *)(v75[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v75[1] = MEMORY[0x1E4FBA470] + 16;
  if (v76 < 0) {
    operator delete((void *)v75[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x185300740](&v77);
}

uint64_t std::ostringstream::basic_ostringstream[abi:nn180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA498] + 24;
  uint64_t v3 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v5;
  *(void *)(a1 + *(void *)(v5 - 24)) = v4;
  uint64_t v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(void *)a1 = v2;
  *(void *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

CFComparisonResult ___Z8asStringRKPKv_block_invoke(uint64_t a1, CFStringRef *a2, CFStringRef *a3)
{
  return CFStringCompare(*a2, *a3, 0);
}

void *std::operator<<[abi:nn180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v5 = std::locale::use_facet(&v7, MEMORY[0x1E4FBA258]);
    ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v7);
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1853006A0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    uint64_t v8 = a2 + a3;
    if ((*(_DWORD *)(v6 + 8) & 0xB0) == 0x20) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a2;
    }
    int v10 = *(_DWORD *)(v6 + 144);
    if (v10 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      CFIndex v11 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v10;
    }
    if (!std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(v7, a2, v9, v8, v6, (char)v10)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1853006B0](v13);
  return a1;
}

uint64_t std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      std::string::basic_string[abi:nn180100](__p, v12, __c);
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

void *std::string::basic_string[abi:nn180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    abort();
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

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t BookmarkData::dataSectionAtOffset(BookmarkData *this, unsigned int a2, unsigned int a3)
{
  unint64_t v3 = *((unsigned int *)this + 10);
  if (v3 < a2 || a3 + (unint64_t)a2 > v3) {
    return 0;
  }
  uint64_t v5 = *((unsigned int *)this + 9);
  if ((((_BYTE)v5 + (_BYTE)a2) & 3) != 0) {
    return 0;
  }
  else {
    return *((void *)this + 3) + v5 + a2;
  }
}

CFNumberRef BookmarkData::copyItem(BookmarkData *a1, uint64_t a2, uint64_t a3)
{
  return BookmarkData::copyDataItemAtOffset(a1, *(_DWORD *)(a2 + 4), a3);
}

uint64_t BookmarkData::getItemAs(BookmarkData *this, unsigned int a2, int a3, BOOL *a4)
{
  uint64_t result = BookmarkData::findItemInTOC(this, a2, a3);
  if (result)
  {
    uint64_t result = (uint64_t)BookmarkData::getDataItemAtOffset(this, *(_DWORD *)(result + 4));
    if (result)
    {
      int v7 = *(_DWORD *)(result + 4);
      if (v7 == 1281)
      {
        BOOL v8 = 1;
        goto LABEL_7;
      }
      if (v7 == 1280)
      {
        BOOL v8 = 0;
LABEL_7:
        *a4 = v8;
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t BookmarkData::getNextTOC(BookmarkData *a1, uint64_t a2)
{
  if (a2) {
    uint64_t result = BookmarkData::getTOCAtOffset(a1, *(_DWORD *)(a2 + 12));
  }
  else {
    uint64_t result = 0;
  }
  if (result == a2 || result == 0) {
    return 0;
  }
  return result;
}

_DWORD *BookmarkData::getIndexedItemInTOC(BookmarkData *this, unsigned int a2, int a3)
{
  uint64_t result = (_DWORD *)BookmarkData::getFirstTOC(this, a3);
  if (result)
  {
    int v7 = result;
    while (1)
    {
      if (!a3 || v7[2] == a3)
      {
        unsigned int v8 = v7[4];
        BOOL v9 = a2 >= v8;
        unsigned int v10 = a2 - v8;
        if (v10 == 0 || !v9)
        {
          if (v9) {
            return 0;
          }
          else {
            return &v7[3 * a2 + 5];
          }
        }
        a2 = v10;
      }
      uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, v7[3]);
      if (TOCAtOffset) {
        BOOL v12 = TOCAtOffset == (void)v7;
      }
      else {
        BOOL v12 = 1;
      }
      int v7 = (_DWORD *)TOCAtOffset;
      if (v12) {
        return 0;
      }
    }
  }
  return result;
}

void BookmarkMutableData::BookmarkMutableData(BookmarkMutableData *this, const __CFAllocator *a2, const __CFData *a3)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = a2;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = (char *)this + 40;
  *((void *)this + 6) = (char *)this + 40;
  *((void *)this + 7) = 0;
  *((void *)this + 3) = 0x20000000004;
  uint64_t v6 = malloc_type_malloc(0x200uLL, 0xFD736F9DuLL);
  *((void *)this + 2) = v6;
  *uint64_t v6 = 0;
  BookmarkData::BookmarkData((BookmarkData *)v19, a2, a3);
  int v7 = v20;
  if (v20)
  {
    *((_DWORD *)this + 2) = *v20;
    *((_DWORD *)this + 3) = v7[2];
    uint64_t FirstTOC = BookmarkData::getFirstTOC((BookmarkData *)v19, 1);
    if (FirstTOC)
    {
      uint64_t v9 = FirstTOC;
      do
      {
        BookmarkMutableData::createTOC(this, *(_DWORD *)(v9 + 8));
        uint64_t v10 = *(unsigned int *)(v9 + 16);
        if (v10)
        {
          uint64_t v11 = (int *)(v9 + 28);
          do
          {
            int v12 = *(v11 - 2);
            if (v12 < 0)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)v19, v12 & 0x7FFFFFFF);
              v22[0] = 0;
              v22[1] = 0;
              size_t v21 = v22;
              CFStringRef v13 = (const __CFString *)BookmarkData::copyItem(v19, DataItemAtOffset, (uint64_t)&v21, 0);
              std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy((uint64_t)&v21, v22[0]);
              CFStringRef v15 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v19, *(v11 - 1), 0);
              BookmarkMutableData::encodeItem((void **)this, v13, v15, *v11);
              if (v15) {
                CFRelease(v15);
              }
            }
            else
            {
              CFStringRef v13 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v19, *(v11 - 1), 0);
              BookmarkMutableData::encodeItem((void **)this, *(v11 - 2), v13, *v11);
            }
            if (v13) {
              CFRelease(v13);
            }
            v11 += 3;
            --v10;
          }
          while (v10);
        }
        int v16 = *(_DWORD *)(v9 + 8);
        if (v16 != 1) {
          BookmarkMutableData::finalizeTOC(this, v16);
        }
        uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset((BookmarkData *)v19, *(_DWORD *)(v9 + 12));
        if (TOCAtOffset) {
          BOOL v18 = TOCAtOffset == v9;
        }
        else {
          BOOL v18 = 1;
        }
        uint64_t v9 = TOCAtOffset;
      }
      while (!v18);
    }
  }
  BookmarkData::~BookmarkData((BookmarkData *)v19);
}

uint64_t BookmarkMutableData::encodeItem(void **this, const __CFString *cf2, const __CFString *a3, int a4)
{
  if (!a3) {
    return 0;
  }
  unsigned int v8 = CFBookmarkPropertyKeyToKnownType(cf2);
  if (!v8)
  {
    unsigned int v9 = BookmarkMutableData::encodeItem(this, cf2);
    if (v9) {
      unsigned int v8 = v9 | 0x80000000;
    }
    else {
      unsigned int v8 = 0;
    }
  }
  if (BookmarkMutableData::itemInTOC((BookmarkMutableData *)this, v8, 0)) {
    return 0;
  }
  int v10 = BookmarkMutableData::encodeItem(this, a3);
  if (!v8 || !v10) {
    return 0;
  }
  return BookmarkMutableData::appendTOCItem((uint64_t **)this, v8, v10, a4);
}

unsigned int *BookmarkMutableData::getDataItemAtOffset(BookmarkMutableData *this, unsigned int a2)
{
  unint64_t v2 = *((unsigned int *)this + 6);
  if ((unint64_t)a2 + 8 > v2) {
    return 0;
  }
  uint64_t v3 = *((void *)this + 2);
  if (!v3) {
    return 0;
  }
  uint64_t result = (unsigned int *)(v3 + a2);
  uint64_t v5 = *result;
  if (v5 <= 0xFFFFFFF6 && v5 + (unint64_t)a2 + 8 > v2) {
    return 0;
  }
  return result;
}

uint64_t BookmarkMutableData::getTOCAtOffset(BookmarkMutableData *this, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v2 = *((unsigned int *)this + 6);
  if ((unint64_t)a2 + 20 > v2) {
    return 0;
  }
  uint64_t v3 = *((void *)this + 2) + a2;
  if (*(_DWORD *)(v3 + 4) != -2) {
    return 0;
  }
  unsigned int v4 = *(_DWORD *)(v3 + 16);
  if (v4 > 0x15555552) {
    return 0;
  }
  if (a2 + 12 * (unint64_t)v4 + 20 <= v2) {
    return *((void *)this + 2) + a2;
  }
  return 0;
}

BOOL BookmarkMutableData::itemInTOC(BookmarkMutableData *this, int a2, int a3)
{
  int v3 = a3;
  if (!a3)
  {
    if (*((void *)this + 7)) {
      int v3 = *(_DWORD *)(*(void *)(*((void *)this + 6) + 16) + 8);
    }
    else {
      int v3 = 0;
    }
  }
  uint64_t v6 = (void *)*((void *)this + 6);
  if (v6 == (void *)((char *)this + 40)) {
    goto LABEL_15;
  }
  BOOL v7 = 0;
  do
  {
    uint64_t v8 = v6[2];
    unint64_t v9 = *(unsigned int *)(v8 + 16);
    if (v9 && !v7)
    {
      int v10 = (int *)(v8 + 20);
      unint64_t v11 = 1;
      do
      {
        int v13 = *v10;
        v10 += 3;
        int v12 = v13;
        BOOL v7 = v13 == a2;
        if (v11 >= v9) {
          break;
        }
        ++v11;
      }
      while (v12 != a2);
    }
    uint64_t v6 = (void *)v6[1];
  }
  while (v6 != (void *)((char *)this + 40));
  if (v7) {
    return 1;
  }
LABEL_15:
  unsigned int v15 = *((_DWORD *)this + 8);
  if (!v15) {
    return 0;
  }
  uint64_t TOCAtOffset = (_DWORD *)BookmarkMutableData::getTOCAtOffset(this, v15);
  if (!TOCAtOffset) {
    return 0;
  }
  do
  {
    if (TOCAtOffset[2] == v3 && (unint64_t v17 = TOCAtOffset[4], v17))
    {
      BOOL v18 = TOCAtOffset + 5;
      unint64_t v19 = 1;
      do
      {
        int v21 = *v18;
        v18 += 3;
        int v20 = v21;
        BOOL v14 = v21 == a2;
        if (v19 >= v17) {
          break;
        }
        ++v19;
      }
      while (v20 != a2);
    }
    else
    {
      BOOL v14 = 0;
    }
    uint64_t TOCAtOffset = (_DWORD *)BookmarkMutableData::getTOCAtOffset(this, TOCAtOffset[3]);
    if (TOCAtOffset) {
      BOOL v22 = !v14;
    }
    else {
      BOOL v22 = 0;
    }
  }
  while (v22);
  return v14;
}

uint64_t BookmarkMutableData::findOpenTOC(BookmarkMutableData *this, int a2)
{
  unint64_t v2 = (char *)this + 40;
  int v3 = (char *)*((void *)this + 6);
  if (v3 == (char *)this + 40) {
    return 0;
  }
  do
  {
    uint64_t result = *((void *)v3 + 2);
    if (a2 && *(_DWORD *)(result + 8) != a2) {
      uint64_t result = 0;
    }
    if (result) {
      break;
    }
    int v3 = (char *)*((void *)v3 + 1);
  }
  while (v3 != v2);
  return result;
}

uint64_t BookmarkMutableData::findUnusedDepth(BookmarkMutableData *this, uint64_t a2, unsigned int a3)
{
  if (a2 >= a3) {
    return 0;
  }
  uint64_t v4 = a2;
  while (BookmarkMutableData::tocExists(this, v4))
  {
    uint64_t v4 = (v4 + 1);
    if (a3 == v4) {
      return 0;
    }
  }
  return v4;
}

uint64_t BookmarkMutableData::setRevocable(uint64_t this, int a2)
{
  *(_DWORD *)(this + 12) = *(_DWORD *)(this + 12) & 0xFFFFFFFE | a2;
  return this;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t _CFURLCreateBookmarkDataFromAliasRecord()
{
  return 0;
}

uint64_t _CFURLBookmarkToAliasHandle()
{
  return 4294967253;
}

__CFString *_FileCacheCopyDebugDesc(unsigned int *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = CFGetAllocator(a1);
  _FileCacheLock((uint64_t)a1);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFLocaleRef System = CFLocaleGetSystem();
  uint64_t v5 = CFDateFormatterCreate(v3, System, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (!v5) {
    _FileCacheCopyDebugDesc();
  }
  uint64_t v6 = v5;
  CFDateFormatterSetFormat(v5, @"MM/dd/yyyy HH:mm:ss.SSS");
  CFMutableArrayRef Mutable = CFStringCreateMutable(v2, 0);
  if (!Mutable) {
    _FileCacheCopyDebugDesc();
  }
  uint64_t v8 = Mutable;
  uint64_t v9 = atomic_load(a1 + 4);
  CFStringAppendFormat(Mutable, 0, @"<_FileCacheRef %p>{\n\tvalidSeed = %d\n\tattributes = (\n"), a1, v9;
  unsigned int v10 = a1[12];
  if (v10)
  {
    unint64_t v11 = @"NameIsHidden";
    if ((v10 & 0x800) == 0) {
      unint64_t v11 = @"!NameIsHidden";
    }
    int v12 = @"FaultLogicalFileIsHidden";
    if ((v10 & 0x1000) == 0) {
      int v12 = @"!FaultLogicalFileIsHidden";
    }
    int v13 = @"IsMountPoint";
    if ((v10 & 0x2000) == 0) {
      int v13 = @"!IsMountPoint";
    }
    BOOL v14 = @"IsTrigger";
    if ((v10 & 0x4000) == 0) {
      BOOL v14 = @"!IsTrigger";
    }
    unsigned int v15 = @"HasPathFromID";
    if ((v10 & 0x8000) == 0) {
      unsigned int v15 = @"!HasPathFromID";
    }
    int v16 = @"Has64BitObjectIDs";
    if ((v10 & 0x10000) == 0) {
      int v16 = @"!Has64BitObjectIDs";
    }
    unint64_t v17 = @"HasExtendedSecurity";
    if ((v10 & 0x20000) == 0) {
      unint64_t v17 = @"!HasExtendedSecurity";
    }
    BOOL v18 = @"IsHFSStandard";
    if ((v10 & 0x40000) == 0) {
      BOOL v18 = @"!IsHFSStandard";
    }
    unint64_t v19 = @"HasDecmpFSCompression";
    if ((v10 & 0x80000) == 0) {
      unint64_t v19 = @"!HasDecmpFSCompression";
    }
    int v20 = @"SupportsHardLinks";
    if ((v10 & 0x100000) == 0) {
      int v20 = @"!SupportsHardLinks";
    }
    if ((v10 & 0x200000) != 0) {
      int v21 = @"SupportsHiddenFiles";
    }
    else {
      int v21 = @"!SupportsHiddenFiles";
    }
    CFStringAppendFormat(v8, 0, @"\t\thasBase\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t", v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    CFStringAppendFormat(v8, 0, @"Name = <CFString %p> %@\n\t\t\tAccessMask = 0%.4lo\n\t\t\tFlags = %lu\n\t\t\tDirFileLinkint64_t Count = %lu\n\t\t\tGenint64_t Count = %lu\n\t\t\tDocumentID = %lu\n\t\t\tOwnerID = %d\n\t\t\tGrpID = %d\n\t\t\t", *((void *)a1 + 7), *((void *)a1 + 7), a1[16], a1[17], a1[18], a1[20], a1[21], a1[22], a1[23]);
    if ((*((unsigned char *)a1 + 51) & 8) != 0) {
      CFStringAppendFormat(v8, 0, @"extensionCFIndex Length = %hu\n\t\t\t", *((unsigned __int16 *)a1 + 26));
    }
    CFStringAppendFormat(v8, 0, @"DataProtectFlags = %lu\n\t\t\t", a1[24]);
    CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 13));
    CFStringAppendFormat(v8, 0, @"AccTime = %@\n\t\t\t", StringWithAbsoluteTime);
    if (StringWithAbsoluteTime) {
      CFRelease(StringWithAbsoluteTime);
    }
    CFStringRef v23 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 14));
    CFStringAppendFormat(v8, 0, @"ModTime = %@\n\t\t\t", v23);
    if (v23) {
      CFRelease(v23);
    }
    CFStringRef v24 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 15));
    CFStringAppendFormat(v8, 0, @"ChgTime = %@\n\t\t\t", v24);
    if (v24) {
      CFRelease(v24);
    }
    double v25 = *((double *)a1 + 16);
    double v26 = -1.0 - *MEMORY[0x1E4F1CF68];
    if (v25 == v26)
    {
      CFStringAppend(v8, @"CrTime  = <n/a>\n\t\t\t");
    }
    else
    {
      CFStringRef v27 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, v25);
      CFStringAppendFormat(v8, 0, @"CrTime  = %@\n\t\t\t", v27);
      if (v27) {
        CFRelease(v27);
      }
    }
    double v28 = *((double *)a1 + 17);
    if (v28 == v26)
    {
      CFStringAppend(v8, @"AddedTime = <n/a>\n\t\t\t");
    }
    else
    {
      CFStringRef v29 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, v28);
      CFStringAppendFormat(v8, 0, @"AddedTime = %@\n\t\t\t", v29);
      if (v29) {
        CFRelease(v29);
      }
    }
    CFStringAppendFormat(v8, 0, @"IOBlockSize = %lu", a1[36]);
    CFStringAppend(v8, @"\n");
    CFStringAppendFormat(v8, 0, @"\t\thasDevice\n\t\t\tfsid_t FSID = {0x%.8x 0x%.8x}\n\t\t\tVolumeID = %lu\n", a1[38], a1[39], a1[40]);
    unsigned int v30 = a1[12];
    if ((v30 & 4) != 0)
    {
      CFStringAppendFormat(v8, 0, @"\t\thasFileIDs\n\t\t\tInodeNumber = %llu\n\t\t\tFileID = %llu\n\t\t\tParentID = %llu\n", *((void *)a1 + 21), *((void *)a1 + 22), *((void *)a1 + 23));
      unsigned int v30 = a1[12];
      if ((v30 & 8) == 0)
      {
LABEL_47:
        if ((v30 & 0x10) == 0) {
          goto LABEL_48;
        }
        goto LABEL_62;
      }
    }
    else if ((v30 & 8) == 0)
    {
      goto LABEL_47;
    }
    uint64_t v31 = @"userAccessExecuteOK";
    if ((v30 & 0x800000) == 0) {
      uint64_t v31 = @"!userAccessExecuteOK";
    }
    uint64_t v32 = @"userAccessWriteOK";
    if ((v30 & 0x1000000) == 0) {
      uint64_t v32 = @"!userAccessWriteOK";
    }
    if ((v30 & 0x2000000) != 0) {
      int v33 = @"userAccessReadOK";
    }
    else {
      int v33 = @"!userAccessReadOK";
    }
    CFStringAppendFormat(v8, 0, @"\t\thasUserAccess\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n", v31, v32, v33);
    unsigned int v30 = a1[12];
    if ((v30 & 0x10) == 0)
    {
LABEL_48:
      if ((v30 & 0x20) == 0) {
        goto LABEL_49;
      }
      goto LABEL_66;
    }
LABEL_62:
    if ((v30 & 0x4000000) != 0) {
      int v34 = @"finderInfoZeros";
    }
    else {
      int v34 = @"!finderInfoZeros";
    }
    CFStringAppendFormat(v8, 0, @"\t\thasFinderInfo\n\t\t\t%@\n\t\t\tfinderInfo    = %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x\n\t\t\textFinderInfo = %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x\n", v34, *((unsigned __int8 *)a1 + 208), *((unsigned __int8 *)a1 + 209), *((unsigned __int8 *)a1 + 210), *((unsigned __int8 *)a1 + 211), *((unsigned __int8 *)a1 + 212), *((unsigned __int8 *)a1 + 213), *((unsigned __int8 *)a1 + 214), *((unsigned __int8 *)a1 + 215), *((unsigned __int8 *)a1 + 216), *((unsigned __int8 *)a1 + 217), *((unsigned __int8 *)a1 + 218), *((unsigned __int8 *)a1 + 219), *((unsigned __int8 *)a1 + 220), *((unsigned __int8 *)a1 + 221), *((unsigned __int8 *)a1 + 222),
      *((unsigned __int8 *)a1 + 223),
      *((unsigned __int8 *)a1 + 224),
      *((unsigned __int8 *)a1 + 225),
      *((unsigned __int8 *)a1 + 226),
      *((unsigned __int8 *)a1 + 227),
      *((unsigned __int8 *)a1 + 228),
      *((unsigned __int8 *)a1 + 229),
      *((unsigned __int8 *)a1 + 230),
      *((unsigned __int8 *)a1 + 231),
      *((unsigned __int8 *)a1 + 232),
      *((unsigned __int8 *)a1 + 233),
      *((unsigned __int8 *)a1 + 234),
      *((unsigned __int8 *)a1 + 235),
      *((unsigned __int8 *)a1 + 236),
      *((unsigned __int8 *)a1 + 237),
      *((unsigned __int8 *)a1 + 238),
      *((unsigned __int8 *)a1 + 239),
      *((unsigned __int8 *)a1 + 215),
      *((unsigned __int8 *)a1 + 214),
      *((unsigned __int8 *)a1 + 213),
      *((unsigned __int8 *)a1 + 212),
      *((unsigned __int8 *)a1 + 211));
    unsigned int v30 = a1[12];
    if ((v30 & 0x20) == 0)
    {
LABEL_49:
      if ((v30 & 0x40) == 0) {
        goto LABEL_50;
      }
      goto LABEL_67;
    }
LABEL_66:
    CFStringAppendFormat(v8, 0, @"\t\thasRsrcInfo\n\t\t\trsrcCFIndex Length = %llu\n\t\t\trsrcAllocSize = %llu\n", *((void *)a1 + 30), *((void *)a1 + 31));
    unsigned int v30 = a1[12];
    if ((v30 & 0x40) == 0)
    {
LABEL_50:
      if ((v30 & 0x80) == 0) {
        goto LABEL_51;
      }
      goto LABEL_68;
    }
LABEL_67:
    CFStringAppendFormat(v8, 0, @"\t\thasFileDataLength\n\t\t\tFileDataCFIndex Length = %llu\n\t\t\tFileDataAllocSize = %llu\n", *((void *)a1 + 32), *((void *)a1 + 33));
    unsigned int v30 = a1[12];
    if ((v30 & 0x80) == 0)
    {
LABEL_51:
      if ((v30 & 0x100) == 0) {
        goto LABEL_70;
      }
LABEL_69:
      CFStringAppendFormat(v8, 0, @"\t\thasFullPath\n\t\t\t<CFString %p> %@\n", *((void *)a1 + 35), *((void *)a1 + 35), v41);
      goto LABEL_70;
    }
LABEL_68:
    CFStringAppendFormat(v8, 0, @"\t\thasFileSecurity\n\t\t\t%@\n", *((void *)a1 + 34));
    if ((a1[12] & 0x100) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  if ((v10 & 2) != 0) {
    CFStringAppendFormat(v8, 0, @"\t\thasDevice\n\t\t\tfsid_t FSID = {0x%.8x 0x%.8x}\n\t\t\tVolumeID = %lu\n", a1[38], a1[39], a1[40]);
  }
LABEL_70:
  CFStringAppend(v8, @"\t\n"));
  CFStringAppendFormat(v8, 0, @"\tpropertyValues = %@\n\ttemporaryPropertyValues = %@\n\tpermanentPropertyValues = %@\n\tvolumeInfo = %@\n", *((void *)a1 + 36), *((void *)a1 + 37), *((void *)a1 + 38), *((void *)a1 + 39));
  if (*((void *)a1 + 39))
  {
    CFStringAppend(v8, @"\tvolumeInfo = (\n");
    BytePtr = CFDataGetBytePtr(*((CFDataRef *)a1 + 39));
    CFIndex Length = CFDataGetLength(*((CFDataRef *)a1 + 39));
    if (*(void *)BytePtr != -1) {
      CFStringAppendFormat(v8, 0, @"\t\tvolFileint64_t Count = %llu\n\t\tvolDirint64_t Count = %llu\n\t\tvolSize = %llu\n\t\tvolSpaceAvail = %llu\n", *(void *)BytePtr, *((void *)BytePtr + 1), *((void *)BytePtr + 2), *((void *)BytePtr + 3));
    }
    CFStringAppendFormat(v8, 0, @"\t\tflags = 0x%llx\n", *((void *)BytePtr + 4));
    CFStringRef v37 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)BytePtr + 5));
    CFStringAppendFormat(v8, 0, @"\t\tcreationDate = %@\n", v37);
    if (v37) {
      CFRelease(v37);
    }
    CFStringAppendFormat(v8, 0, @"\t\tmaxFileSize = %llu\n", *((void *)BytePtr + 6));
    if (Length == 72)
    {
      memset(out, 0, 37);
      uuid_unparse_upper(BytePtr + 56, out);
      CFStringRef v38 = CFStringCreateWithCString(v2, out, 0x8000100u);
      CFStringAppendFormat(v8, 0, @"\t\tuuid = %@\n", v38);
      if (v38) {
        CFRelease(v38);
      }
    }
    CFStringAppend(v8, @"\t\n"));
  }
  CFStringAppend(v8, @"}");
  CFRelease(v6);
  int v39 = a1[8] - 1;
  a1[8] = v39;
  if (!v39)
  {
    *((void *)a1 + 3) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)a1 + 9);
  }
  return v8;
}

uint64_t _FileCacheGetTypeID()
{
  return sFileCacheTypeID;
}

uint64_t _FileCachePreparerLock(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_not_owner(a1 + 10);
  return os_unfair_recursive_lock_lock_with_options();
}

uint64_t _FileCachePreparerUnlock(uint64_t a1)
{
  return MEMORY[0x1F40CD628](a1 + 40);
}

uint64_t FileCachePropertyValueEqualCallBack(unint64_t cf1, unint64_t a2)
{
  if (!(cf1 | a2)) {
    return 1;
  }
  uint64_t result = 0;
  if (cf1)
  {
    if (a2) {
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
    }
  }
  return result;
}

CFDataRef _CFURLCreateBookmarkDataFromFile(CFAllocatorRef allocator, const __CFURL *a2, CFErrorRef *a3)
{
  uint64_t v36 = 0;
  CFDataRef v37 = 0;
  if (!a2)
  {
    if (!a3) {
      return 0;
    }
    goto LABEL_29;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  BOOL v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  if (!v7)
  {
    CFErrorRef v13 = 0;
    CFDataRef Mutable = 0;
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  if (CFReadStreamOpen(v7))
  {
    BOOL v11 = CFReadStreamRead(v8, buffer, 56) == 56 && *(_DWORD *)buffer == 1802465122 && v32 == 1802658157 && v31 == 0;
    if (v11 && !v33 && v35[0] <= 0xFFFFFFE && bookmarkVersionOK(v35[1]))
    {
      CFDataRef Mutable = CFDataCreateMutable(allocator, v35[0] + 16);
      unsigned int v21 = v35[0];
      unsigned int v20 = v35[1];
      if (!CFDataIncreaseLengthSafe(Mutable, 16)
        || (MutableBytePtr = CFDataGetMutableBytePtr(Mutable),
            *(_DWORD *)MutableBytePtr = 1802465122,
            *((_DWORD *)MutableBytePtr + 1) = v21 + 16,
            *((_DWORD *)MutableBytePtr + 2) = v20,
            *((_DWORD *)MutableBytePtr + 3) = 16,
            !CFDataIncreaseLengthSafe(Mutable, v35[0])))
      {
        if (a3) {
          CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E4F1D148], 263, 0);
        }
        else {
          CFErrorRef v13 = 0;
        }
LABEL_68:
        if (Mutable)
        {
          BookmarkData::BookmarkData((BookmarkData *)v28, allocator, Mutable);
          if (v29)
          {
            CFDataRef Copy = CFDataCreateCopy(allocator, Mutable);
            if (v37 != Copy)
            {
              if (v37) {
                CFRelease(v37);
              }
              CFDataRef v37 = Copy;
            }
          }
          else if (a3 && !v13)
          {
            CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E4F1D148], 259, 0);
          }
          BookmarkData::~BookmarkData((BookmarkData *)v28);
          CFRelease(Mutable);
          unsigned int v15 = v36;
          CFDataRef Mutable = v37;
        }
        else
        {
          unsigned int v15 = 0;
        }
        CFReadStreamClose(v8);
        goto LABEL_23;
      }
      v28[0] = v34;
      CFNumberRef v23 = CFNumberCreate(v6, kCFNumberSInt32Type, v28);
      CFReadStreamSetProperty(v8, (CFStreamPropertyKey)*MEMORY[0x1E4F1D448], v23);
      if (v35[0])
      {
        unsigned int v24 = 0;
        while (1)
        {
          double v25 = CFDataGetMutableBytePtr(Mutable);
          CFIndex v26 = CFReadStreamRead(v8, &v25[v24 + 16], v35[0] - v24);
          if (v26 <= 0) {
            break;
          }
          v24 += v26;
          if (v24 >= v35[0]) {
            goto LABEL_65;
          }
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        if (a3)
        {
          CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E4F1D148], 259, 0);
          CFDataRef Mutable = 0;
          goto LABEL_66;
        }
        CFDataRef Mutable = 0;
      }
LABEL_65:
      CFErrorRef v13 = 0;
LABEL_66:
      if (v23) {
        CFRelease(v23);
      }
      goto LABEL_68;
    }
    CFReadStreamClose(v8);
    goto LABEL_21;
  }
  if (!a3)
  {
LABEL_21:
    unsigned int v15 = 0;
    goto LABEL_22;
  }
  BOOL v14 = CFReadStreamCopyError(v8);
  unsigned int v15 = v14;
  if (!v14)
  {
LABEL_22:
    CFDataRef Mutable = 0;
    CFErrorRef v13 = 0;
    goto LABEL_23;
  }
  CFStringRef Domain = CFErrorGetDomain(v14);
  CFIndex Code = CFErrorGetCode(v15);
  CFErrorRef v13 = _FSURLCreateStandardError(v6, Domain, Code, 1, (const __CFString *)a2, 0);
  CFRelease(v15);
  unsigned int v15 = 0;
  CFDataRef Mutable = 0;
LABEL_23:
  CFRelease(v8);
  if (!Mutable && v15)
  {
    CFReleaser<__CFData const*>::operator=((const void **)&v37, (CFTypeRef *)&v36);
    CFDataRef Mutable = v37;
  }
LABEL_26:
  BOOL v18 = a3 != 0;
  if (a3 && !Mutable && !v13)
  {
LABEL_29:
    CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
    BOOL v18 = 1;
    CFDataRef Mutable = v37;
  }
  if (v18 && !Mutable)
  {
    if (v13)
    {
      CFDataRef Mutable = 0;
      *a3 = v13;
    }
    else
    {
      if (!*a3)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          _CFURLCreateBookmarkDataFromFile_cold_1();
        }
        CFErrorRef v13 = 0;
        *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
        CFDataRef Mutable = v37;
        goto LABEL_37;
      }
      CFDataRef Mutable = 0;
    }
    CFErrorRef v13 = 0;
  }
LABEL_37:
  CFDataRef v37 = 0;
  if (v36) {
    CFRelease(v36);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v37) {
    CFRelease(v37);
  }
  return Mutable;
}

BOOL CFDataIncreaseLengthSafe(__CFData *a1, CFIndex a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFDataIncreaseLength(a1, a2);
  CFIndex v5 = CFDataGetLength(a1);
  return v5 >= Length && v5 >= Length + a2 && a2 >= 0;
}

const void **CFReleaser<__CFData const*>::operator=(const void **a1, CFTypeRef *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  if (*a2)
  {
    CFRetain(*a2);
    CFTypeRef v5 = *a2;
  }
  else
  {
    CFTypeRef v5 = 0;
  }
  *a1 = v5;
  return a1;
}

uint64_t _CFURLWriteBookmarkDataToFile(__CFData *a1, const __CFString *a2, uint64_t a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  BookmarkData::BookmarkData((BookmarkData *)v36, (const __CFAllocator *)*MEMORY[0x1E4F1CF80], a1);
  unsigned int v35 = 0;
  if (!a2 || !v37 || !BookmarkData::getItemAs((BookmarkData *)v36, 0xD010u, 1, &v35) || (v35 & 0x400) == 0 || v40 >> 28)
  {
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v34 = 0;
  int v7 = _CFURLGetResourcePropertyFlags();
  if (v7 && ((v7 != 0) & v34) == 0)
  {
    uint64_t v8 = _FSURLCreateStandardError(v6, (const __CFString *)*MEMORY[0x1E4F1D148], 512, 1, a2, 0);
    uint64_t v9 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
      _CFURLWriteBookmarkDataToFile_cold_2((uint64_t)a2, (uint64_t)v8, v9);
    }
    CFURLClearResourcePropertyCache((CFURLRef)a2);
    goto LABEL_12;
  }
  unint64_t v19 = CFWriteStreamCreateWithFile(v6, (CFURLRef)a2);
  if (v19)
  {
    unsigned int v20 = v19;
    if (CFWriteStreamOpen(v19))
    {
      *(_OWORD *)buffer = xmmword_181791120;
      uint64_t v42 = 0x3800000038;
      unsigned int v43 = v40;
      int v21 = v37;
      if (v37) {
        int v21 = *(_DWORD *)(v37 + 8);
      }
      int v44 = v21;
      int v45 = 0;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      int v47 = 0;
      BOOL v22 = 0;
      if (CFWriteStreamWrite(v20, buffer, 56) == 56)
      {
        CFIndex v23 = CFWriteStreamWrite(v20, (const UInt8 *)(v38 + v39), v40);
        BOOL v22 = v23 >= 0 && v40 == v23;
      }
      uint64_t v8 = 0;
      if (a4)
      {
        if (!v22)
        {
          uint64_t v8 = CFWriteStreamCopyError(v20);
          if (!v8) {
            uint64_t v8 = CFErrorCreate(v6, (CFErrorDomain)*MEMORY[0x1E4F1D148], 640, 0);
          }
        }
      }
      int v25 = !v22;
    }
    else
    {
      if (a4) {
        uint64_t v8 = CFWriteStreamCopyError(v20);
      }
      else {
        uint64_t v8 = 0;
      }
      int v25 = 0;
      BOOL v22 = 0;
    }
    CFWriteStreamClose(v20);
    CFRelease(v20);
  }
  else
  {
    BOOL v22 = 0;
    int v25 = 0;
    uint64_t v8 = 0;
  }
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a2, 1u, buffer, 1024)) {
    buffer[0] = 0;
  }
  if (v22)
  {
    if (v7 && buffer[0]) {
      removexattr((const char *)buffer, "com.apple.ResourceFork", 1);
    }
    CFDataRef Mutable = CFDataCreateMutable(v6, 32);
    if (Mutable)
    {
      CFStringRef v27 = Mutable;
      *(void *)bytes = 0;
      *(void *)unsigned int v30 = 0;
      uint64_t v31 = 0;
      uint64_t v33 = 0x8000;
      CFDataAppendBytes(Mutable, bytes, 16);
      CFDataAppendBytes(v27, v30, 16);
      CFURLSetResourcePropertyForKey((CFURLRef)a2, (CFStringRef)*MEMORY[0x1E4F1CDE0], v27, 0);
      CFRelease(v27);
    }
  }
  if (v25 && !v7 && buffer[0]) {
    removefile((const char *)buffer, 0, 0);
  }
  CFURLClearResourcePropertyCache((CFURLRef)a2);
  if (!v22)
  {
LABEL_12:
    unsigned int v10 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
      _CFURLWriteBookmarkDataToFile_cold_1((uint64_t)a2, (uint64_t)v8, v10);
    }
    uint64_t v11 = 0;
    char v12 = 1;
    if (v8) {
      goto LABEL_15;
    }
    goto LABEL_61;
  }
  char v12 = 0;
  uint64_t v11 = 1;
  if (v8)
  {
LABEL_15:
    CFErrorDomain Domain = CFErrorGetDomain(v8);
    CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D148];
    if (!CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E4F1D148]))
    {
      CFStringRef v15 = CFErrorGetDomain(v8);
      CFIndex Code = CFErrorGetCode(v8);
      CFErrorRef v17 = _FSURLCreateStandardError(v6, v15, Code, 1, a2, 0);
      CFRelease(v8);
      uint64_t v8 = v17;
    }
    if (a4) {
      char v18 = v12;
    }
    else {
      char v18 = 0;
    }
    if (v18)
    {
      if (v8)
      {
        *a4 = CFRetain(v8);
LABEL_24:
        CFRelease(v8);
        goto LABEL_66;
      }
LABEL_65:
      *a4 = CFErrorCreate(v6, v14, 512, 0);
      goto LABEL_66;
    }
    if (v8) {
      goto LABEL_24;
    }
    goto LABEL_66;
  }
LABEL_61:
  char v28 = v12 ^ 1;
  if (!a4) {
    char v28 = 1;
  }
  if ((v28 & 1) == 0)
  {
    CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D148];
    goto LABEL_65;
  }
LABEL_66:
  BookmarkData::~BookmarkData((BookmarkData *)v36);
  return v11;
}

uint64_t CFBookmarkPropertyKeyToKnownType(CFTypeRef cf2)
{
  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1) {
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  }
  if (GetBookmarkResourcePropertyToInfo(cf2, &v3)) {
    return DWORD2(v3);
  }
  else {
    return 0;
  }
}

uint64_t GetBookmarkResourcePropertyToInfo(CFTypeRef cf2, _OWORD *a2)
{
  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1) {
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  }
  if (sResourcePropertiesInfoCount != 1) {
    return 0;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  while (1)
  {
    uint64_t result = CFEqual(*(CFTypeRef *)(sResourcePropertiesInfoPtr + v4), cf2);
    if (result) {
      break;
    }
    if (sResourcePropertiesInfoCount == 1)
    {
      v4 += 32;
      if (v5++ <= 0x44) {
        continue;
      }
    }
    return result;
  }
  if (a2)
  {
    long long v8 = *(_OWORD *)(sResourcePropertiesInfoPtr + v4 + 16);
    *a2 = *(_OWORD *)(sResourcePropertiesInfoPtr + v4);
    a2[1] = v8;
  }
  return 1;
}

uint64_t CFBookmarkPropertyEnumToStringKey(int a1)
{
  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1) {
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  }
  if (sResourcePropertiesInfoCount != 1) {
    return 0;
  }
  CFAllocatorRef v2 = (_DWORD *)(sResourcePropertiesInfoPtr + 8);
  uint64_t v3 = -1;
  while (*v2 != a1)
  {
    v2 += 8;
    if ((unint64_t)++v3 > 0x44) {
      return 0;
    }
  }
  return *((void *)v2 - 1);
}

BOOL bookmarkHasPathComponents(BookmarkData *a1, int a2)
{
  return BookmarkData::findItemInTOC(a1, 0x1004u, a2) != 0;
}

CFArrayRef copyVolumePathComponentsAsArray(BookmarkData *a1, unsigned int a2)
{
  BOOL v10 = 0;
  if (!BookmarkData::getItemAs(a1, 0x2030u, a2, &v10)
    || !v10
    || (uint64_t v9 = @"/",
        (ArrayOfPathComponentsFromCFStringRef String = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&v9, 1, MEMORY[0x1E4F1D510])) == 0))
  {
    CFTypeID TypeID = CFStringGetTypeID();
    CFStringRef v6 = (const __CFString *)BookmarkData::copyItem(a1, 0x2002u, a2, TypeID);
    ArrayOfPathComponentsFromCFStringRef String = createArrayOfPathComponentsFromString(*(const __CFAllocator **)a1, v6, 0);
    if (v6) {
      CFRelease(v6);
    }
    if (!ArrayOfPathComponentsFromString)
    {
      CFTypeID v7 = CFArrayGetTypeID();
      return (const __CFArray *)BookmarkData::copyItem(a1, 0x2004u, a2, v7);
    }
  }
  return ArrayOfPathComponentsFromString;
}

CFDictionaryRef _CFURLCreateResourcePropertiesForKeysFromBookmarkData(const __CFAllocator *a1, CFTypeRef cf, const void *a3)
{
  if (!cf) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  CFTypeID TypeID = CFArrayGetTypeID();
  CFDictionaryRef Copy = 0;
  if (!a3 || v6 != TypeID) {
    return Copy;
  }
  CFTypeID v9 = CFGetTypeID(a3);
  if (v9 != CFDataGetTypeID()) {
    return 0;
  }
  BookmarkData::BookmarkData((BookmarkData *)v20, a1, (const __CFData *)a3);
  if (v21)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
    CFDataRef Mutable = CFDictionaryCreateMutable(a1, Count, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFIndex v12 = CFArrayGetCount((CFArrayRef)cf);
    if (v12 >= 1)
    {
      unint64_t v13 = v12 + 1;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)cf, v13 - 2);
        if (ValueAtIndex)
        {
          CFStringRef v15 = ValueAtIndex;
          CFTypeID v16 = CFGetTypeID(ValueAtIndex);
          if (v16 == CFStringGetTypeID() && !CFDictionaryContainsKey(Mutable, v15))
          {
            CFNumberRef v17 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v20, v15, 0);
            if (v17)
            {
              CFNumberRef v18 = v17;
              CFDictionaryAddValue(Mutable, v15, v17);
              CFRelease(v18);
            }
          }
        }
        --v13;
      }
      while (v13 > 1);
    }
    CFDictionaryRef Copy = CFDictionaryCreateCopy(a1, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    CFDictionaryRef Copy = 0;
  }
  BookmarkData::~BookmarkData((BookmarkData *)v20);
  return Copy;
}

CFNumberRef BookmarkCopyPropertyFromBookmarkData(BookmarkData *a1, const __CFString *cf2, uint64_t a3)
{
  if (!cf2) {
    return 0;
  }
  if (!GetBookmarkResourcePropertyToInfo(cf2, &v10))
  {
    uint64_t ItemInTOC = BookmarkData::findItemInTOC(a1, cf2, 1);
    if (!ItemInTOC) {
      return 0;
    }
LABEL_8:
    CFNumberRef v6 = BookmarkData::copyItem(a1, ItemInTOC, 0);
    goto LABEL_9;
  }
  if (!v11)
  {
    uint64_t ItemInTOC = BookmarkData::findItemInTOC(a1, DWORD2(v10), 1);
    if (!ItemInTOC) {
      return 0;
    }
    goto LABEL_8;
  }
  CFNumberRef v6 = (CFNumberRef)v11(a1, 1, v12);
LABEL_9:
  CFNumberRef v8 = v6;
  if (a3 && v6 && CFGetTypeID(v6) != a3)
  {
    CFRelease(v8);
    return 0;
  }
  return v8;
}

CFNumberRef _CFURLCreateResourcePropertyForKeyFromBookmarkData(const __CFAllocator *a1, const __CFString *a2, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  CFTypeID TypeID = CFDataGetTypeID();
  CFNumberRef v8 = 0;
  if (a2 && v6 == TypeID)
  {
    CFTypeID v9 = CFGetTypeID(a2);
    if (v9 == CFStringGetTypeID())
    {
      BookmarkData::BookmarkData((BookmarkData *)v11, a1, (const __CFData *)cf);
      CFNumberRef v8 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v11, a2, 0);
      BookmarkData::~BookmarkData((BookmarkData *)v11);
      return v8;
    }
    return 0;
  }
  return v8;
}

__CFString *_CFURLBookmarkDataCopyDescription(const void *a1)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  CFDataRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (a1)
  {
    CFTypeID v3 = CFGetTypeID(a1);
    if (v3 == CFDataGetTypeID())
    {
      CFAllocatorRef v4 = CFGetAllocator(a1);
      BookmarkData::BookmarkData((BookmarkData *)v103, v4, (const __CFData *)a1);
      unint64_t v5 = v104;
      BytePtr = CFDataGetBytePtr((CFDataRef)a1);
      CFIndex Length = CFDataGetLength((CFDataRef)a1);
      CFStringAppendFormat(Mutable, 0, @"Bookmark: dataRef=%p len=%d\n", BytePtr, Length);
      if (v5)
      {
        CFStringAppendFormat(Mutable, 0, @"  signature = 0x%x\n", *v5);
        CFStringAppendFormat(Mutable, 0, @"  CFURLRef length = 0x%x\n", v5[1]);
        CFStringAppendFormat(Mutable, 0, @"  version = 0x%x\n", v5[2]);
        CFStringAppendFormat(Mutable, 0, @"  bookmarkDataSectionOffset = 0x%x\n", v106);
        uint64_t v8 = v105;
        uint64_t v101 = v5;
        if (v105) {
          uint64_t v8 = *(unsigned int *)(v105 + v106);
        }
        CFStringAppendFormat(Mutable, 0, @"  bookmarkDataSectionFirstTOCOffset = 0x%x\n", v8);
        CFTypeID v9 = CFDataGetBytePtr((CFDataRef)a1);
        if (CFDataGetLength((CFDataRef)a1) >= 1)
        {
          CFIndex v10 = 0;
          uint64_t v11 = MEMORY[0x1E4F14390];
          do
          {
            CFStringAppendFormat(Mutable, 0, @" 0x%5.5lx:", v10);
            for (uint64_t i = 0; i != 16; ++i)
            {
              if (v10 + i >= CFDataGetLength((CFDataRef)a1)) {
                CFStringAppendFormat(Mutable, 0, @"  ", usedBufLen);
              }
              else {
                CFStringAppendFormat(Mutable, 0, @"%2.2x", v9[i]);
              }
              if ((~i & 3) == 0) {
                CFStringAppend(Mutable, @" ");
              }
            }
            CFStringAppendFormat(Mutable, 0, @"  | ");
            for (uint64_t j = 0; j != 16; ++j)
            {
              uint64_t v14 = v9[j];
              if ((char)v9[j] < 0)
              {
                if (__maskrune(v14, 0x40000uLL))
                {
LABEL_18:
                  uint64_t v15 = v9[j];
                  goto LABEL_21;
                }
              }
              else if ((*(_DWORD *)(v11 + 4 * v14 + 60) & 0x40000) != 0)
              {
                goto LABEL_18;
              }
              uint64_t v15 = 46;
LABEL_21:
              CFStringAppendFormat(Mutable, 0, @"%c", v15);
              if ((~j & 3) == 0) {
                CFStringAppendFormat(Mutable, 0, @" ");
              }
            }
            CFStringAppendFormat(Mutable, 0, @" \n");
            v10 += 16;
            v9 += 16;
          }
          while (v10 < CFDataGetLength((CFDataRef)a1));
        }
        uint64_t FirstTOC = BookmarkData::getFirstTOC((BookmarkData *)v103, 1);
        if (FirstTOC)
        {
          uint64_t TOCAtOffset = (unsigned int *)FirstTOC;
          while (1)
          {
            CFNumberRef v18 = CFDataGetBytePtr((CFDataRef)a1);
            CFStringAppendFormat(Mutable, 0, @" toc @ offset:0x%x(0x%p) level=%d count=%d next=0x%d\n", (char *)TOCAtOffset - (char *)v18, TOCAtOffset, TOCAtOffset[2], TOCAtOffset[4], TOCAtOffset[3]);
            if (TOCAtOffset[4]) {
              break;
            }
LABEL_341:
            uint64_t TOCAtOffset = (unsigned int *)BookmarkData::getTOCAtOffset((BookmarkData *)v103, TOCAtOffset[3]);
            if (!TOCAtOffset) {
              goto LABEL_342;
            }
          }
          unint64_t v19 = 0;
          unsigned int v20 = TOCAtOffset + 5;
          while (1)
          {
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            *(_OWORD *)buffer = 0u;
            long long v108 = 0u;
            int v21 = *v20;
            if ((int)*v20 > 8223)
            {
              if (v21 > 61461)
              {
                if (v21 > 61568)
                {
                  if (v21 <= 983060)
                  {
                    switch(v21)
                    {
                      case 61569:
                        BOOL v22 = "sandboxROExtension:";
                        goto LABEL_143;
                      case 61570:
                        BOOL v22 = "securityScopeCookie:";
                        goto LABEL_143;
                      case 65024:
                        BOOL v22 = "aliasData:";
                        goto LABEL_143;
                    }
                  }
                  else if (v21 > 1048577)
                  {
                    if (v21 == 1048578)
                    {
                      BOOL v22 = "testKey2";
                      goto LABEL_143;
                    }
                    if (v21 == 251658516)
                    {
                      BOOL v22 = "version:";
                      goto LABEL_143;
                    }
                  }
                  else
                  {
                    if (v21 == 983061)
                    {
                      BOOL v22 = "shortVersion:";
                      goto LABEL_143;
                    }
                    if (v21 == 1048561)
                    {
                      BOOL v22 = "testKey1";
                      goto LABEL_143;
                    }
                  }
                }
                else if (v21 <= 61472)
                {
                  switch(v21)
                  {
                    case 61462:
                      BOOL v22 = "displayNamesDict:";
                      goto LABEL_143;
                    case 61463:
                      BOOL v22 = "displayName:";
                      goto LABEL_143;
                    case 61472:
                      BOOL v22 = "effectiveIconData:";
                      goto LABEL_143;
                  }
                }
                else if (v21 > 61487)
                {
                  if (v21 == 61488)
                  {
                    BOOL v22 = "bookmarkCreationTime:";
                    goto LABEL_143;
                  }
                  if (v21 == 61568)
                  {
                    BOOL v22 = "sandboxRWExtension:";
                    goto LABEL_143;
                  }
                }
                else
                {
                  if (v21 == 61473)
                  {
                    BOOL v22 = "effectiveFlattenedIconRef:";
                    goto LABEL_143;
                  }
                  if (v21 == 61474)
                  {
                    BOOL v22 = "typeBindingData:";
                    goto LABEL_143;
                  }
                }
              }
              else if (v21 > 49152)
              {
                if (v21 <= 53248)
                {
                  switch(v21)
                  {
                    case 49153:
                      BOOL v22 = "volHomeDirRelativePathComponentCount:";
                      goto LABEL_143;
                    case 49169:
                      BOOL v22 = "userName:";
                      goto LABEL_143;
                    case 49170:
                      BOOL v22 = "userUID:";
                      goto LABEL_143;
                  }
                }
                else if (v21 > 57345)
                {
                  if (v21 == 57346)
                  {
                    BOOL v22 = "haseBaseURL:";
                    goto LABEL_143;
                  }
                  if (v21 == 57347)
                  {
                    BOOL v22 = "baseURLComponentCount:";
                    goto LABEL_143;
                  }
                }
                else
                {
                  if (v21 == 53249)
                  {
                    BOOL v22 = "wasFileIDFormat:";
                    goto LABEL_143;
                  }
                  if (v21 == 53264)
                  {
                    BOOL v22 = "creationOptions:";
                    goto LABEL_143;
                  }
                }
              }
              else if (v21 <= 8255)
              {
                switch(v21)
                {
                  case 8224:
                    BOOL v22 = "volProps:";
                    goto LABEL_143;
                  case 8240:
                    BOOL v22 = "volWasBoot:";
                    goto LABEL_143;
                  case 8242:
                    BOOL v22 = "volIDiskUserName:";
                    goto LABEL_143;
                }
              }
              else if (v21 > 8287)
              {
                if (v21 == 8288)
                {
                  BOOL v22 = "volAutomountPath:";
                  goto LABEL_143;
                }
                if (v21 == 8304)
                {
                  BOOL v22 = "bookmarkFileProviderString:";
                  goto LABEL_143;
                }
              }
              else
              {
                if (v21 == 8256)
                {
                  BOOL v22 = "diskImageDepth:";
                  goto LABEL_143;
                }
                if (v21 == 8272)
                {
                  BOOL v22 = "volMountURL:";
                  goto LABEL_143;
                }
              }
LABEL_136:
              if (v21 < 0)
              {
                unsigned int v24 = v21 & 0x7FFFFFFF;
                CFTypeID TypeID = CFStringGetTypeID();
                CFStringRef v23 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v103, v24, TypeID);
              }
              else
              {
                CFStringRef v23 = (const __CFString *)CFBookmarkPropertyEnumToStringKey(v21);
              }
              CFStringRef v26 = v23;
              BOOL v22 = (const char *)buffer;
              if (v23)
              {
                CFIndex v102 = 0;
                v116.CFURLRef length = CFStringGetLength(v23);
                v116.CFIndex location = 0;
                CFIndex Bytes = CFStringGetBytes(v26, v116, 0x8000100u, 0, 0, buffer, 128, &v102);
                CFIndex v28 = v102;
                if (!Bytes) {
                  CFIndex v28 = 0;
                }
                buffer[v28] = 0;
              }
            }
            else if (v21 <= 4176)
            {
              if (v21 > 4127)
              {
                switch(v21)
                {
                  case 4160:
                    BOOL v22 = "creationDate:";
                    break;
                  case 4161:
                    BOOL v22 = "accessDate:";
                    break;
                  case 4162:
                    BOOL v22 = "modificationDate:";
                    break;
                  case 4163:
                    BOOL v22 = "attrModificationDate:";
                    break;
                  default:
                    if (v21 == 4128)
                    {
                      BOOL v22 = "fileName:";
                    }
                    else
                    {
                      if (v21 != 4144) {
                        goto LABEL_136;
                      }
                      BOOL v22 = "fileID:";
                    }
                    break;
                }
              }
              else
              {
                BOOL v22 = "pathComponents:";
                switch(v21)
                {
                  case 4099:
                    BOOL v22 = "urlString:";
                    break;
                  case 4100:
                    break;
                  case 4101:
                    BOOL v22 = "fileIDs:";
                    break;
                  case 4102:
                    BOOL v22 = "pathComponentProps:";
                    break;
                  case 4103:
                  case 4105:
                  case 4106:
                  case 4107:
                  case 4108:
                  case 4109:
                  case 4110:
                  case 4111:
                    goto LABEL_136;
                  case 4104:
                    BOOL v22 = "tagStyle:";
                    break;
                  case 4112:
                    BOOL v22 = "resourceProps:";
                    break;
                  default:
                    if (v21 != -2) {
                      goto LABEL_136;
                    }
                    BOOL v22 = "toc:";
                    break;
                }
              }
            }
            else if (v21 < 0x2000)
            {
              switch(v21)
              {
                case 4177:
                  BOOL v22 = "relativeDirsUpMinusOne:";
                  break;
                case 4178:
                  goto LABEL_136;
                case 4179:
                  BOOL v22 = "relativeDirsDownMinusOne:";
                  break;
                case 4180:
                  BOOL v22 = "relativeDirsUp:";
                  break;
                case 4181:
                  BOOL v22 = "relativeDirsDown:";
                  break;
                case 4182:
                  BOOL v22 = "createdWithRelativeURL";
                  break;
                default:
                  if (v21 == 4353)
                  {
                    BOOL v22 = "fragmentString:";
                  }
                  else
                  {
                    if (v21 != 4354) {
                      goto LABEL_136;
                    }
                    BOOL v22 = "queryString:";
                  }
                  break;
              }
            }
            else
            {
              switch(v21)
              {
                case 8192:
                  BOOL v22 = "volInfoDepths:";
                  break;
                case 8194:
                  BOOL v22 = "volPath:";
                  break;
                case 8196:
                  BOOL v22 = "volPathComponents:";
                  break;
                case 8197:
                  BOOL v22 = "volURL:";
                  break;
                case 8208:
                  BOOL v22 = "volName:";
                  break;
                case 8209:
                  BOOL v22 = "volUUID:";
                  break;
                case 8210:
                  BOOL v22 = "volCapacity:";
                  break;
                case 8211:
                  BOOL v22 = "volCreationDate:";
                  break;
                default:
                  goto LABEL_136;
              }
            }
LABEL_143:
            CFStringAppendFormat(Mutable, 0, @" %3d itemType=0x%x flags=0x%x dataOffset=0x%x %s"), v19, *v20, v20[2], v101[3] + v20[1], v22);
            unsigned int v29 = *v20;
            if (*v20 == 53264)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
              if (!DataItemAtOffset || *DataItemAtOffset < 4) {
                goto LABEL_335;
              }
              unsigned int v39 = DataItemAtOffset[2];
              if ((v39 & 0x10000000) != 0)
              {
                CFStringAppendFormat(Mutable, 0, @"%s ", "kCFURLBookmarkCreationAllowCreationIfResourceDoesNotExistMask");
                if ((v39 & 0x20000000) == 0) {
                  goto LABEL_185;
                }
              }
              else if ((v39 & 0x20000000) == 0)
              {
LABEL_185:
                if ((v39 & 0x200) == 0) {
                  goto LABEL_186;
                }
LABEL_339:
                CFStringAppendFormat(Mutable, 0, @"%s ", "kCFURLBookmarkCreationMinimalBookmarkMask");
                if ((v39 & 0x400) != 0)
                {
LABEL_340:
                  CFStringAppendFormat(Mutable, 0, @"%s ", "kCFURLBookmarkCreationSuitableForBookmarkFile");
                  goto LABEL_335;
                }
                goto LABEL_335;
              }
              CFStringAppendFormat(Mutable, 0, @"%s ", "kCFURLBookmarkCreationDoNotIncludeSandboxExtensionsMask");
              if ((v39 & 0x200) == 0)
              {
LABEL_186:
                if ((v39 & 0x400) != 0) {
                  goto LABEL_340;
                }
                goto LABEL_335;
              }
              goto LABEL_339;
            }
            if (v29 == 8224)
            {
              uint64_t v34 = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
              if (!v34 || *v34 < 0x18) {
                goto LABEL_335;
              }
              uint64_t v35 = *((void *)v34 + 1);
              uint64_t v36 = *((void *)v34 + 2);
              uint64_t v37 = *((void *)v34 + 3);
              CFStringAppendFormat(Mutable, 0, @"Props:[");
              if (v36)
              {
                uint64_t v42 = "local";
                if ((v35 & 1) == 0) {
                  uint64_t v42 = "!local";
                }
                unsigned int v43 = "**";
                if ((v37 & 1) == 0) {
                  unsigned int v43 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v42, v43);
                if ((v36 & 2) != 0) {
                  goto LABEL_195;
                }
LABEL_163:
                if ((v36 & 4) == 0) {
                  goto LABEL_164;
                }
LABEL_200:
                CFStringRef v46 = "browse";
                if ((v35 & 4) == 0) {
                  CFStringRef v46 = "!browse";
                }
                int v47 = "**";
                if ((v37 & 4) == 0) {
                  int v47 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v46, v47);
                if ((v36 & 8) != 0) {
                  goto LABEL_205;
                }
LABEL_165:
                if ((v36 & 0x20) == 0) {
                  goto LABEL_166;
                }
LABEL_210:
                int v50 = "eject";
                if ((v35 & 0x20) == 0) {
                  int v50 = "!eject";
                }
                uint64_t v51 = "**";
                if ((v37 & 0x20) == 0) {
                  uint64_t v51 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v50, v51);
                if ((v36 & 0x40) != 0) {
                  goto LABEL_215;
                }
LABEL_167:
                if ((v36 & 0x80) == 0) {
                  goto LABEL_168;
                }
LABEL_220:
                CFURLRef v54 = "internal";
                if ((v35 & 0x80) == 0) {
                  CFURLRef v54 = "!internal";
                }
                CFURLRef v55 = "**";
                if ((v37 & 0x80) == 0) {
                  CFURLRef v55 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v54, v55);
                if ((v36 & 0x100) != 0) {
                  goto LABEL_225;
                }
LABEL_169:
                if ((v36 & 0x200) == 0) {
                  goto LABEL_170;
                }
LABEL_230:
                uint64_t v58 = "diskimage";
                if ((v35 & 0x200) == 0) {
                  uint64_t v58 = "!diskimage";
                }
                uint64_t v59 = "**";
                if ((v37 & 0x200) == 0) {
                  uint64_t v59 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v58, v59);
                if ((v36 & 0x1000) != 0) {
                  goto LABEL_235;
                }
LABEL_171:
                if ((v36 & 0x100000000) == 0) {
                  goto LABEL_172;
                }
LABEL_240:
                uint64_t v62 = "file-ids";
                if ((v35 & 0x100000000) == 0) {
                  uint64_t v62 = "!file-ids";
                }
                uint64_t v63 = "**";
                if ((v37 & 0x100000000) == 0) {
                  uint64_t v63 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v62, v63);
                if ((v36 & 0x1000000000) != 0) {
                  goto LABEL_245;
                }
LABEL_173:
                if ((v36 & 0x2000000000000) == 0) {
                  goto LABEL_174;
                }
LABEL_250:
                int v66 = "hard-links";
                if ((v35 & 0x2000000000000) == 0) {
                  int v66 = "!hard-links";
                }
                char v67 = "**";
                if ((v37 & 0x2000000000000) == 0) {
                  char v67 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v66, v67);
                if ((v36 & 0x10000000000) != 0) {
                  goto LABEL_255;
                }
LABEL_175:
                if ((v36 & 0x20000000000000) == 0) {
                  goto LABEL_176;
                }
LABEL_260:
                uint64_t v70 = "isJournaling";
                if ((v35 & 0x20000000000000) == 0) {
                  uint64_t v70 = "!isJournaling";
                }
                unsigned __int8 v71 = "**";
                if ((v37 & 0x20000000000000) == 0) {
                  unsigned __int8 v71 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v70, v71);
                if ((v36 & 0x40000000000000) != 0) {
                  goto LABEL_265;
                }
LABEL_177:
                if ((v36 & 0x80000000000000) == 0) {
                  goto LABEL_178;
                }
LABEL_270:
                unsigned __int8 v74 = "zeroRuns";
                if ((v35 & 0x80000000000000) == 0) {
                  unsigned __int8 v74 = "!zeroRuns";
                }
                uint64_t v75 = "**";
                if ((v37 & 0x80000000000000) == 0) {
                  uint64_t v75 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v74, v75);
                if ((v36 & 0x80000000000) != 0) {
                  goto LABEL_275;
                }
LABEL_179:
                if ((v36 & 0x100000000000) == 0) {
                  goto LABEL_334;
                }
              }
              else
              {
                if ((v36 & 2) == 0) {
                  goto LABEL_163;
                }
LABEL_195:
                int v44 = "auto";
                if ((v35 & 2) == 0) {
                  int v44 = "!auto";
                }
                int v45 = "**";
                if ((v37 & 2) == 0) {
                  int v45 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v44, v45);
                if ((v36 & 4) != 0) {
                  goto LABEL_200;
                }
LABEL_164:
                if ((v36 & 8) == 0) {
                  goto LABEL_165;
                }
LABEL_205:
                uint64_t v48 = "ro";
                if ((v35 & 8) == 0) {
                  uint64_t v48 = "rw";
                }
                uint64_t v49 = "**";
                if ((v37 & 8) == 0) {
                  uint64_t v49 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v48, v49);
                if ((v36 & 0x20) != 0) {
                  goto LABEL_210;
                }
LABEL_166:
                if ((v36 & 0x40) == 0) {
                  goto LABEL_167;
                }
LABEL_215:
                CFTypeID v52 = "rmvbl";
                if ((v35 & 0x40) == 0) {
                  CFTypeID v52 = "!rmvbl";
                }
                CFTypeRef v53 = "**";
                if ((v37 & 0x40) == 0) {
                  CFTypeRef v53 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v52, v53);
                if ((v36 & 0x80) != 0) {
                  goto LABEL_220;
                }
LABEL_168:
                if ((v36 & 0x100) == 0) {
                  goto LABEL_169;
                }
LABEL_225:
                int v56 = "external";
                if ((v35 & 0x100) == 0) {
                  int v56 = "!external";
                }
                uint64_t v57 = "**";
                if ((v37 & 0x100) == 0) {
                  uint64_t v57 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v56, v57);
                if ((v36 & 0x200) != 0) {
                  goto LABEL_230;
                }
LABEL_170:
                if ((v36 & 0x1000) == 0) {
                  goto LABEL_171;
                }
LABEL_235:
                uint64_t v60 = "ipod";
                if ((v35 & 0x1000) == 0) {
                  uint64_t v60 = "!ipod";
                }
                uint64_t v61 = "**";
                if ((v37 & 0x1000) == 0) {
                  uint64_t v61 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v60, v61);
                if ((v36 & 0x100000000) != 0) {
                  goto LABEL_240;
                }
LABEL_172:
                if ((v36 & 0x1000000000) == 0) {
                  goto LABEL_173;
                }
LABEL_245:
                uint64_t v64 = "symlinks";
                if ((v35 & 0x1000000000) == 0) {
                  uint64_t v64 = "!symlinks";
                }
                uint64_t v65 = "**";
                if ((v37 & 0x1000000000) == 0) {
                  uint64_t v65 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v64, v65);
                if ((v36 & 0x2000000000000) != 0) {
                  goto LABEL_250;
                }
LABEL_174:
                if ((v36 & 0x10000000000) == 0) {
                  goto LABEL_175;
                }
LABEL_255:
                char v68 = "journal";
                if ((v35 & 0x10000000000) == 0) {
                  char v68 = "!journal";
                }
                uint64_t v69 = "**";
                if ((v37 & 0x10000000000) == 0) {
                  uint64_t v69 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v68, v69);
                if ((v36 & 0x20000000000000) != 0) {
                  goto LABEL_260;
                }
LABEL_176:
                if ((v36 & 0x40000000000000) == 0) {
                  goto LABEL_177;
                }
LABEL_265:
                uint64_t v72 = "sparseFiles";
                if ((v35 & 0x40000000000000) == 0) {
                  uint64_t v72 = "!sparseFiles";
                }
                uint64_t v73 = "**";
                if ((v37 & 0x40000000000000) == 0) {
                  uint64_t v73 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v72, v73);
                if ((v36 & 0x80000000000000) != 0) {
                  goto LABEL_270;
                }
LABEL_178:
                if ((v36 & 0x80000000000) == 0) {
                  goto LABEL_179;
                }
LABEL_275:
                char v76 = "case-sens";
                if ((v35 & 0x80000000000) == 0) {
                  char v76 = "!case-sens";
                }
                uint64_t v77 = "**";
                if ((v37 & 0x80000000000) == 0) {
                  uint64_t v77 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v76, v77);
                if ((v36 & 0x100000000000) == 0) {
                  goto LABEL_334;
                }
              }
              CFIndex v78 = "case-presrv";
              if ((v35 & 0x100000000000) == 0) {
                CFIndex v78 = "!case-presrv";
              }
              BOOL v79 = (v37 & 0x100000000000) == 0;
              goto LABEL_331;
            }
            if (v29 != 4112)
            {
              CFStringRef v40 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v103, v20[1], 0);
              if (v40)
              {
                CFStringRef v41 = v40;
                describeURLType(v40, Mutable);
                CFRelease(v41);
              }
              goto LABEL_335;
            }
            unsigned int v30 = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
            if (v30 && *v30 >= 0x18)
            {
              uint64_t v31 = *((void *)v30 + 1);
              uint64_t v32 = *((void *)v30 + 2);
              uint64_t v33 = *((void *)v30 + 3);
              CFStringAppendFormat(Mutable, 0, @"Props:[");
              if (v32)
              {
                unsigned __int8 v80 = "file";
                if ((v31 & 1) == 0) {
                  unsigned __int8 v80 = "!file";
                }
                uint64_t v81 = "**";
                if ((v33 & 1) == 0) {
                  uint64_t v81 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v80, v81);
                if ((v32 & 2) != 0) {
                  goto LABEL_288;
                }
LABEL_150:
                if ((v32 & 4) == 0) {
                  goto LABEL_151;
                }
LABEL_293:
                uint64_t v84 = "sym";
                if ((v31 & 4) == 0) {
                  uint64_t v84 = "!sym";
                }
                uint64_t v85 = "**";
                if ((v33 & 4) == 0) {
                  uint64_t v85 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v84, v85);
                if ((v32 & 8) != 0) {
                  goto LABEL_298;
                }
LABEL_152:
                if ((v32 & 0x10) == 0) {
                  goto LABEL_153;
                }
LABEL_303:
                CFURLRef v88 = "pkg";
                if ((v31 & 0x10) == 0) {
                  CFURLRef v88 = "!pkg";
                }
                CFAllocatorRef v89 = "**";
                if ((v33 & 0x10) == 0) {
                  CFAllocatorRef v89 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v88, v89);
                if ((v32 & 0x20) != 0) {
                  goto LABEL_308;
                }
LABEL_154:
                if ((v32 & 0x40) == 0) {
                  goto LABEL_155;
                }
LABEL_313:
                uint64_t v92 = "user-immut";
                if ((v31 & 0x40) == 0) {
                  uint64_t v92 = "user-mut";
                }
                CFURLRef v93 = "**";
                if ((v33 & 0x40) == 0) {
                  CFURLRef v93 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v92, v93);
                if ((v32 & 0x80) != 0) {
                  goto LABEL_318;
                }
LABEL_156:
                if ((v32 & 0x100) == 0) {
                  goto LABEL_157;
                }
LABEL_323:
                CFAllocatorRef v96 = "ext-hid";
                if ((v31 & 0x100) == 0) {
                  CFAllocatorRef v96 = "ext-vis";
                }
                uint64_t v97 = "**";
                if ((v33 & 0x100) == 0) {
                  uint64_t v97 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v96, v97);
                if ((v32 & 0x200) == 0)
                {
LABEL_334:
                  CFStringAppendFormat(Mutable, 0, @"]");
                  goto LABEL_335;
                }
              }
              else
              {
                if ((v32 & 2) == 0) {
                  goto LABEL_150;
                }
LABEL_288:
                CFRange v82 = "dir";
                if ((v31 & 2) == 0) {
                  CFRange v82 = "!dir";
                }
                CFIndex v83 = "**";
                if ((v33 & 2) == 0) {
                  CFIndex v83 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v82, v83);
                if ((v32 & 4) != 0) {
                  goto LABEL_293;
                }
LABEL_151:
                if ((v32 & 8) == 0) {
                  goto LABEL_152;
                }
LABEL_298:
                uint64_t v86 = "vol";
                if ((v31 & 8) == 0) {
                  uint64_t v86 = "!vol";
                }
                CFStringRef v87 = "**";
                if ((v33 & 8) == 0) {
                  CFStringRef v87 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v86, v87);
                if ((v32 & 0x10) != 0) {
                  goto LABEL_303;
                }
LABEL_153:
                if ((v32 & 0x20) == 0) {
                  goto LABEL_154;
                }
LABEL_308:
                CFArrayRef v90 = "sys-immut";
                if ((v31 & 0x20) == 0) {
                  CFArrayRef v90 = "sys-mut";
                }
                uint64_t v91 = "**";
                if ((v33 & 0x20) == 0) {
                  uint64_t v91 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v90, v91);
                if ((v32 & 0x40) != 0) {
                  goto LABEL_313;
                }
LABEL_155:
                if ((v32 & 0x80) == 0) {
                  goto LABEL_156;
                }
LABEL_318:
                uint64_t v94 = "hid";
                if ((v31 & 0x80) == 0) {
                  uint64_t v94 = "vis";
                }
                CFAllocatorRef v95 = "**";
                if ((v33 & 0x80) == 0) {
                  CFAllocatorRef v95 = "";
                }
                CFStringAppendFormat(Mutable, 0, @"%s%s ", v94, v95);
                if ((v32 & 0x100) != 0) {
                  goto LABEL_323;
                }
LABEL_157:
                if ((v32 & 0x200) == 0) {
                  goto LABEL_334;
                }
              }
              CFIndex v78 = "app";
              if ((v31 & 0x200) == 0) {
                CFIndex v78 = "!app";
              }
              BOOL v79 = (v33 & 0x200) == 0;
LABEL_331:
              uint64_t v98 = "**";
              if (v79) {
                uint64_t v98 = "";
              }
              CFStringAppendFormat(Mutable, 0, @"%s%s ", v78, v98);
              goto LABEL_334;
            }
LABEL_335:
            CFStringAppendFormat(Mutable, 0, @" \n");
            ++v19;
            v20 += 3;
            if (v19 >= TOCAtOffset[4]) {
              goto LABEL_341;
            }
          }
        }
      }
LABEL_342:
      BookmarkData::~BookmarkData((BookmarkData *)v103);
    }
  }
  return Mutable;
}

void describeURLType(const __CFString *a1, __CFString *a2)
{
  if (!a1)
  {
    CFStringRef v5 = @"NULL";
LABEL_7:
    CFStringAppendFormat(a2, 0, v5);
    return;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID())
  {
    CFStringAppend(a2, @"\"");
    CFStringAppend(a2, a1);
    CFStringAppend(a2, @"\"");
    return;
  }
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 == CFNumberGetTypeID())
  {
    uint64_t v23 = 0;
    uint64_t valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
    {
      CFStringAppendFormat(a2, 0, @" %ld/0x%x ", valuePtr, valuePtr);
    }
    else if (CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &v23))
    {
      CFStringAppendFormat(a2, 0, @" %lg ", v23);
    }
    else
    {
      CFStringAppendFormat(a2, 0, @" <number> ");
    }
    return;
  }
  CFTypeID v7 = CFGetTypeID(a1);
  if (v7 == CFDataGetTypeID())
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    CFIndex v10 = Length;
    if (Length >= 32)
    {
      for (uint64_t i = 0; i != 16; ++i)
      {
        CFStringAppendFormat(a2, 0, @" %2.2x", BytePtr[i]);
        if ((~(_BYTE)i & 3) == 0) {
          CFStringAppend(a2, @" ");
        }
      }
      CFStringAppend(a2, @"...");
      CFIndex v16 = v10 - 16;
      do
      {
        CFStringAppendFormat(a2, 0, @" %2.2x", BytePtr[v16]);
        if ((v16 & 0x8000000000000003) == 3) {
          CFStringAppend(a2, @" ");
        }
        ++v16;
      }
      while (v16 < v10);
    }
    else if (Length >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        CFStringAppendFormat(a2, 0, @" %2.2x", BytePtr[v11]);
        if ((~(_BYTE)v11 & 3) == 0) {
          CFStringAppend(a2, @" ");
        }
        ++v11;
      }
      while (v10 != v11);
    }
    return;
  }
  CFTypeID v12 = CFGetTypeID(a1);
  if (v12 == CFDateGetTypeID())
  {
    CFAbsoluteTime v13 = MEMORY[0x1852FFDA0](a1);
    CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(v13, 0);
    CFStringAppendFormat(a2, 0, @" %4.4d/%2.2d/%2.2d %2.2d:%2.2d:%-6.4f ", *(void *)&GregorianDate.year, ((int)(*(void *)&GregorianDate.year >> 8) >> 24), ((int)(*(void *)&GregorianDate.year >> 16) >> 24), ((int)(*(void *)&GregorianDate.year >> 24) >> 24), (*(int *)&GregorianDate.month >> 24), *(void *)&GregorianDate.second);
    return;
  }
  if ((const __CFString *)*MEMORY[0x1E4F1CFD0] == a1)
  {
    CFStringRef v5 = @" true  ";
    goto LABEL_7;
  }
  if ((const __CFString *)*MEMORY[0x1E4F1CFC8] == a1)
  {
    CFStringRef v5 = @" false ";
    goto LABEL_7;
  }
  CFTypeID v17 = CFGetTypeID(a1);
  if (v17 == CFArrayGetTypeID())
  {
    CFStringAppendFormat(a2, 0, @"[ ");
    if (CFArrayGetCount((CFArrayRef)a1) >= 1)
    {
      CFIndex v18 = 0;
      do
      {
        if (v18) {
          CFStringAppendFormat(a2, 0, @", ");
        }
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v18);
        describeURLType(ValueAtIndex, a2);
        ++v18;
      }
      while (v18 < CFArrayGetCount((CFArrayRef)a1));
    }
    CFStringRef v5 = @"] ";
    goto LABEL_7;
  }
  CFStringRef v20 = CFCopyDescription(a1);
  if (v20)
  {
    CFStringRef v21 = v20;
    CFStringAppend(a2, @"\"");
    CFStringAppend(a2, v21);
    CFStringAppend(a2, @"\"");
    CFRelease(v21);
  }
  else
  {
    CFTypeID v22 = CFGetTypeID(a1);
    CFStringAppendFormat(a2, 0, @" Unknown encoded type, typeID=%d", v22);
  }
}

uint64_t _CFURLCompareBookmarkData(CFTypeRef cf, const void *a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (!cf) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t v8 = 0;
  if (a2 && v6 == TypeID)
  {
    CFTypeID v9 = CFGetTypeID(a2);
    if (v9 == CFDataGetTypeID())
    {
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      BookmarkData::BookmarkData((BookmarkData *)v123, (const __CFAllocator *)*MEMORY[0x1E4F1CF80], (const __CFData *)cf);
      BookmarkData::BookmarkData((BookmarkData *)v121, v10, (const __CFData *)a2);
      if (v124 && v122)
      {
        CFIndex Length = CFDataGetLength((CFDataRef)cf);
        if (Length != CFDataGetLength((CFDataRef)a2)
          || (BytePtr = CFDataGetBytePtr((CFDataRef)cf),
              CFAbsoluteTime v13 = CFDataGetBytePtr((CFDataRef)a2),
              size_t v14 = CFDataGetLength((CFDataRef)cf),
              memcmp(BytePtr, v13, v14)))
        {
          uint64_t ItemInTOC = BookmarkData::findItemInTOC((BookmarkData *)v123, 0x1003u, 1);
          uint64_t v16 = BookmarkData::findItemInTOC((BookmarkData *)v121, 0x1003u, 1);
          if (ItemInTOC | v16)
          {
            uint64_t v8 = 4096;
            if (!ItemInTOC) {
              goto LABEL_51;
            }
            uint64_t v17 = v16;
            if (!v16) {
              goto LABEL_51;
            }
            CFTypeID v18 = CFStringGetTypeID();
            CFStringRef v19 = (const __CFString *)BookmarkData::copyItem((BookmarkData *)v123, ItemInTOC, v18);
            CFTypeID v20 = CFStringGetTypeID();
            CFStringRef v21 = (const __CFString *)BookmarkData::copyItem((BookmarkData *)v121, v17, v20);
            CFNumberRef v22 = (CFNumberRef)v21;
            if (v19)
            {
              if (v21)
              {
                if (CFStringCompare(v19, v21, 0)) {
                  uint64_t v8 = 4096;
                }
                else {
                  uint64_t v8 = 0x8000;
                }
                CFRelease(v22);
              }
              else
              {
                uint64_t v8 = 4096;
              }
              CFNumberRef v22 = (CFNumberRef)v19;
LABEL_50:
              CFRelease(v22);
              goto LABEL_51;
            }
            uint64_t v8 = 4096;
LABEL_46:
            if (!v22) {
              goto LABEL_51;
            }
            goto LABEL_50;
          }
          BOOL v23 = compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E4F1D870])&& compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E4F1D928])&& compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E4F1D840]);
          CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F1D6E8];
          CFTypeID v25 = CFBooleanGetTypeID();
          CFNumberRef v22 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v24, v25);
          CFTypeID v26 = CFBooleanGetTypeID();
          CFBooleanRef v27 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v24, v26);
          if (v22 && CFBooleanGetValue(v22) && v27 && CFBooleanGetValue(v27) && !v23)
          {
            uint64_t v8 = 4096;
            goto LABEL_45;
          }
          if (!compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E4F1D6B8])|| !compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E4F1D678])|| !compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, (const __CFString *)*MEMORY[0x1E4F1D6C8])|| !compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, v24))
          {
            uint64_t v8 = 4096;
            goto LABEL_40;
          }
          if (v124) {
            int v29 = *v124;
          }
          else {
            int v29 = 0;
          }
          if (v122) {
            int v31 = *v122;
          }
          else {
            int v31 = 0;
          }
          *(_WORD *)uint64_t v120 = 0;
          if (v29 != 1936288865) {
            BookmarkData::getItemAs((BookmarkData *)v123, 0x2030u, 1, &v120[1]);
          }
          if (v31 != 1936288865) {
            BookmarkData::getItemAs((BookmarkData *)v121, 0x2030u, 1, v120);
          }
          BOOL v33 = v120[1] && v120[0];
          BOOL v109 = v33;
          CFTypeID v34 = CFNumberGetTypeID();
          uint64_t v35 = BookmarkData::copyItem((BookmarkData *)v123, 0xC001u, 1u, v34);
          CFTypeID v36 = CFNumberGetTypeID();
          uint64_t v37 = BookmarkData::copyItem((BookmarkData *)v121, 0xC001u, 1u, v36);
          CFTypeRef cfa = v35;
          CFTypeRef v110 = v37;
          if (v35) {
            BOOL v38 = v37 == 0;
          }
          else {
            BOOL v38 = 1;
          }
          int v39 = !v38;
          CFStringRef v40 = (const __CFString *)*MEMORY[0x1E4F1D988];
          CFTypeID v41 = CFStringGetTypeID();
          CFStringRef v42 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v40, v41);
          CFTypeID v43 = CFStringGetTypeID();
          CFStringRef v44 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v40, v43);
          CFStringRef v45 = (const __CFString *)*MEMORY[0x1E4F1D830];
          CFTypeID v46 = CFDateGetTypeID();
          CFNumberRef cf1 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v45, v46);
          CFTypeID v47 = CFDateGetTypeID();
          CFNumberRef cf2 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v45, v47);
          CFTypeID v48 = CFURLGetTypeID();
          CFTypeRef v118 = BookmarkData::copyItem((BookmarkData *)v123, 0x2050u, 1u, v48);
          CFTypeID v49 = CFURLGetTypeID();
          CFTypeRef v114 = BookmarkData::copyItem((BookmarkData *)v121, 0x2050u, 1u, v49);
          CFStringRef v50 = (const __CFString *)*MEMORY[0x1E4F1D580];
          CFTypeID v51 = CFStringGetTypeID();
          CFStringRef theString1 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v50, v51);
          CFTypeID v52 = CFStringGetTypeID();
          CFStringRef v116 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v50, v52);
          BOOL v53 = 0;
          CFStringRef theString2 = v44;
          if (v42 && v44) {
            BOOL v53 = CFStringCompare(v42, v44, 1uLL) == kCFCompareEqualTo;
          }
          CFStringRef v108 = v42;
          BOOL v54 = 0;
          if (cf1)
          {
            CFURLRef v55 = v114;
            if (cf2)
            {
              if (v29 == 1936288865)
              {
                double v56 = floor(MEMORY[0x1852FFDA0](cf1));
                BOOL v54 = v56 == floor(MEMORY[0x1852FFDA0](cf2));
              }
              else
              {
                BOOL v54 = CFEqual(cf1, cf2) != 0;
              }
            }
          }
          else
          {
            CFURLRef v55 = v114;
          }
          BOOL v57 = 0;
          if (v118 && v55) {
            BOOL v57 = CFEqual(v118, v55) != 0;
          }
          BOOL v58 = 0;
          if (theString1 && v116) {
            BOOL v58 = CFStringCompare(theString1, v116, 1uLL) == kCFCompareEqualTo;
          }
          if ((v109 | v39) == 1)
          {
            if (v58 || v53 || v54 || v57) {
              uint64_t v8 = 0x8000;
            }
            else {
              uint64_t v8 = 0x4000;
            }
          }
          else if (!v23 {
                 || ((v79 = v53 || v54 || v57, (v79 & v58) == 0) ? (uint64_t v8 = 0x4000) : (uint64_t v8 = 0x8000), (v79 | v58) != 1))
          }
          {
            uint64_t v8 = 4096;
            unsigned __int8 v80 = cfa;
LABEL_138:
            CFAllocatorRef v96 = v110;
            CFStringRef v97 = theString2;
            CFStringRef v98 = v108;
            CFNumberRef v99 = cf1;
            uint64_t v100 = v118;
            CFNumberRef v101 = cf2;
LABEL_153:
            if (v116) {
              CFRelease(v116);
            }
            if (theString1) {
              CFRelease(theString1);
            }
            if (v114) {
              CFRelease(v114);
            }
            if (v100) {
              CFRelease(v100);
            }
            if (v101) {
              CFRelease(v101);
            }
            if (v99) {
              CFRelease(v99);
            }
            if (v97) {
              CFRelease(v97);
            }
            if (v98) {
              CFRelease(v98);
            }
            if (v96) {
              CFRelease(v96);
            }
            if (v80) {
              CFRelease(v80);
            }
LABEL_40:
            if (!v27) {
              goto LABEL_46;
            }
LABEL_45:
            CFRelease(v27);
            goto LABEL_46;
          }
          unsigned int valuePtr = 0;
          if (v39)
          {
            if (CFEqual(cfa, v110))
            {
              CFRetain(cfa);
              int Value = CFNumberGetValue((CFNumberRef)cfa, kCFNumberSInt32Type, &valuePtr);
              CFRelease(cfa);
              if (Value)
              {
                if (!valuePtr)
                {
                  BOOL v72 = 1;
                  goto LABEL_126;
                }
                CFArrayRef v60 = copyPathComponentsAsArray((BookmarkData *)v123, 1, 0);
                CFArrayRef v61 = v60;
                if (v60) {
                  LODWORD(v60) = CFArrayGetCount(v60);
                }
                v62.CFURLRef length = valuePtr;
                if (v60 >= valuePtr)
                {
                  v62.CFIndex location = v60 - valuePtr;
                  CFArrayRef v102 = copyOfArray(v10, v61, v62);
                  CFStringRef v63 = CFStringCreateByCombiningStrings(v10, v102, @"/");
                  if (v102) {
                    CFRelease(v102);
                  }
                }
                else
                {
                  CFStringRef v63 = 0;
                }
                CFArrayRef v103 = copyPathComponentsAsArray((BookmarkData *)v121, 1, 0);
                CFArrayRef v64 = v103;
                if (v61 && v61 != v103) {
                  CFRelease(v61);
                }
                if (v64) {
                  unsigned int Count = CFArrayGetCount(v64);
                }
                else {
                  unsigned int Count = 0;
                }
                v105.CFURLRef length = valuePtr;
                if (Count >= valuePtr)
                {
                  v105.CFIndex location = Count - valuePtr;
                  CFArrayRef v106 = copyOfArray(v10, v64, v105);
                  CFStringRef v107 = CFStringCreateByCombiningStrings(v10, v106, @"/");
                  if (v106) {
                    CFRelease(v106);
                  }
                  if (v63)
                  {
                    if (v107)
                    {
                      BOOL v72 = CFStringCompare(v63, v107, 1uLL) == kCFCompareEqualTo;
                      CFRelease(v107);
                    }
                    else
                    {
                      BOOL v72 = 0;
                    }
                  }
                  else
                  {
                    BOOL v72 = 0;
                    CFStringRef v63 = v107;
                    if (!v107)
                    {
LABEL_124:
                      if (v64) {
                        CFRelease(v64);
                      }
LABEL_126:
                      CFStringRef v82 = (const __CFString *)*MEMORY[0x1E4F1CDD0];
                      CFTypeID v83 = CFNumberGetTypeID();
                      CFNumberRef v84 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v82, v83);
                      CFTypeID v85 = CFNumberGetTypeID();
                      CFNumberRef v86 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v82, v85);
                      CFNumberRef v87 = v86;
                      BOOL v88 = 0;
                      if (v84 && v86) {
                        BOOL v88 = CFEqual(v84, v86) != 0;
                      }
                      CFStringRef v89 = (const __CFString *)*MEMORY[0x1E4F1D5B0];
                      CFTypeID v90 = CFNumberGetTypeID();
                      CFNumberRef v91 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v89, v90);
                      CFTypeID v92 = CFNumberGetTypeID();
                      CFNumberRef v93 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v89, v92);
                      CFNumberRef v94 = v93;
                      BOOL v95 = 0;
                      if (v91)
                      {
                        unsigned __int8 v80 = cfa;
                        if (v93) {
                          BOOL v95 = CFEqual(v91, v93) != 0;
                        }
                      }
                      else
                      {
                        unsigned __int8 v80 = cfa;
                      }
                      if (v72)
                      {
                        if (!v84 && !v87 && !v91 && !v94) {
                          goto LABEL_138;
                        }
                        if (!v88) {
                          uint64_t v8 = 0x4000;
                        }
                      }
                      else if (v88 || v95)
                      {
                        uint64_t v8 = 0x4000;
                      }
                      else
                      {
                        uint64_t v8 = 0x2000;
                      }
                      if (v94) {
                        CFRelease(v94);
                      }
                      if (v91) {
                        CFRelease(v91);
                      }
                      CFStringRef v98 = v108;
                      CFNumberRef v101 = cf2;
                      uint64_t v100 = v118;
                      if (v87) {
                        CFRelease(v87);
                      }
                      CFAllocatorRef v96 = v110;
                      if (v84) {
                        CFRelease(v84);
                      }
                      CFStringRef v97 = theString2;
                      CFNumberRef v99 = cf1;
                      goto LABEL_153;
                    }
                  }
                }
                else
                {
                  BOOL v72 = 0;
                  if (!v63) {
                    goto LABEL_124;
                  }
                }
                CFStringRef v81 = v63;
LABEL_123:
                CFRelease(v81);
                goto LABEL_124;
              }
            }
          }
          CFArrayRef v64 = copyVolumePathComponentsAsArray((BookmarkData *)v123, 1u);
          CFStringRef v65 = (const __CFString *)*MEMORY[0x1E4F1D578];
          CFTypeID v66 = CFStringGetTypeID();
          CFStringRef v67 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v65, v66);
          CFArrayRef v68 = copyVolumePathComponentsAsArray((BookmarkData *)v121, 1u);
          CFTypeID v69 = CFStringGetTypeID();
          CFStringRef v70 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v65, v69);
          CFStringRef v71 = v70;
          if (v67)
          {
            if (v70)
            {
              BOOL v72 = 1;
              if (CFStringCompare(v67, v70, 1uLL) == kCFCompareEqualTo) {
                goto LABEL_118;
              }
            }
          }
          CFStringRef v73 = (const __CFString *)*MEMORY[0x1E4F1D568];
          CFTypeID v74 = CFStringGetTypeID();
          CFStringRef v75 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v73, v74);
          CFTypeID v76 = CFStringGetTypeID();
          CFStringRef v77 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v73, v76);
          CFStringRef v78 = v77;
          if (v75)
          {
            if (v77)
            {
              BOOL v72 = CFStringCompare(v75, v77, 1uLL) == kCFCompareEqualTo;
              CFRelease(v78);
            }
            else
            {
              BOOL v72 = 0;
            }
            CFStringRef v78 = v75;
          }
          else
          {
            BOOL v72 = 0;
            if (!v77)
            {
LABEL_117:
              if (!v71)
              {
LABEL_119:
                if (v68) {
                  CFRelease(v68);
                }
                if (!v67) {
                  goto LABEL_124;
                }
                CFStringRef v81 = v67;
                goto LABEL_123;
              }
LABEL_118:
              CFRelease(v71);
              goto LABEL_119;
            }
          }
          CFRelease(v78);
          goto LABEL_117;
        }
        uint64_t v8 = 61440;
      }
      else
      {
        uint64_t v8 = 0;
      }
LABEL_51:
      BookmarkData::~BookmarkData((BookmarkData *)v121);
      BookmarkData::~BookmarkData((BookmarkData *)v123);
      return v8;
    }
    return 0;
  }
  return v8;
}

BOOL compareBookmarkProperties(BookmarkData *a1, BookmarkData *a2, const __CFString *cf2)
{
  CFNumberRef v5 = BookmarkCopyPropertyFromBookmarkData(a1, cf2, 0);
  CFNumberRef v6 = BookmarkCopyPropertyFromBookmarkData(a2, cf2, 0);
  CFNumberRef v7 = v6;
  if (v5)
  {
    if (v6)
    {
      BOOL v8 = CFEqual(v5, v6) != 0;
      CFRelease(v7);
    }
    else
    {
      BOOL v8 = 1;
    }
    CFNumberRef v7 = v5;
  }
  else
  {
    BOOL v8 = 1;
    if (!v6) {
      return v8;
    }
  }
  CFRelease(v7);
  return v8;
}

double ___ZL43BookmarkResourcePropertyKeyToInfoStructInitv_block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F1D6B8];
  uint64_t v1 = *MEMORY[0x1E4F1D678];
  uint64_t v2 = *MEMORY[0x1E4F1D6C8];
  uint64_t v3 = *MEMORY[0x1E4F1D6E8];
  uint64_t v4 = *MEMORY[0x1E4F1D6A0];
  uint64_t v12 = *MEMORY[0x1E4F1D6D0];
  uint64_t v13 = *MEMORY[0x1E4F1D6E0];
  uint64_t v15 = *MEMORY[0x1E4F1D690];
  uint64_t v16 = *MEMORY[0x1E4F1D660];
  uint64_t v23 = *MEMORY[0x1E4F1D670];
  uint64_t v19 = *MEMORY[0x1E4F1D870];
  uint64_t v30 = *MEMORY[0x1E4F1D840];
  uint64_t v29 = *MEMORY[0x1E4F1D878];
  uint64_t v28 = *MEMORY[0x1E4F1D850];
  uint64_t v27 = *MEMORY[0x1E4F1D880];
  uint64_t v26 = *MEMORY[0x1E4F1D860];
  uint64_t v25 = *MEMORY[0x1E4F1CF18];
  uint64_t v24 = *MEMORY[0x1E4F1CF40];
  uint64_t v32 = *MEMORY[0x1E4F1D928];
  uint64_t v35 = *MEMORY[0x1E4F1D950];
  uint64_t v37 = *MEMORY[0x1E4F1D910];
  uint64_t v38 = *MEMORY[0x1E4F1D920];
  uint64_t v40 = *MEMORY[0x1E4F1D868];
  uint64_t v42 = *MEMORY[0x1E4F1D940];
  uint64_t v44 = *MEMORY[0x1E4F1D960];
  uint64_t v46 = *MEMORY[0x1E4F1D8E0];
  uint64_t v48 = *MEMORY[0x1E4F1D8D8];
  uint64_t v51 = *MEMORY[0x1E4F1D738];
  uint64_t v55 = *MEMORY[0x1E4F1CDD0];
  sResourcePropertiesInfounsigned int Count = 1;
  sResourcePropertiesInfoCountIncludedInAll = 1;
  uint64_t v5 = *MEMORY[0x1E4F1D718];
  uint64_t v6 = *MEMORY[0x1E4F1CDA8];
  uint64_t v7 = *MEMORY[0x1E4F1CDB0];
  uint64_t v8 = *MEMORY[0x1E4F1D5A0];
  uint64_t v9 = *MEMORY[0x1E4F1D590];
  uint64_t v14 = *MEMORY[0x1E4F1D598];
  uint64_t v17 = *MEMORY[0x1E4F1D558];
  uint64_t v18 = *MEMORY[0x1E4F1D708];
  uint64_t v20 = *MEMORY[0x1E4F1D778];
  uint64_t v21 = *MEMORY[0x1E4F1D720];
  uint64_t v22 = *MEMORY[0x1E4F1D700];
  uint64_t v31 = *MEMORY[0x1E4F1D710];
  uint64_t v33 = *MEMORY[0x1E4F1CED8];
  uint64_t v34 = *MEMORY[0x1E4F1D640];
  uint64_t v36 = *MEMORY[0x1E4F1D5B8];
  uint64_t v39 = *MEMORY[0x1E4F1CD78];
  uint64_t v41 = *MEMORY[0x1E4F1D6B0];
  uint64_t v43 = *MEMORY[0x1E4F1D6F0];
  uint64_t v45 = *MEMORY[0x1E4F1D688];
  uint64_t v47 = *MEMORY[0x1E4F1CDD8];
  uint64_t v49 = *MEMORY[0x1E4F1CDC0];
  uint64_t v50 = *MEMORY[0x1E4F1CD70];
  uint64_t v52 = *MEMORY[0x1E4F1CEE8];
  uint64_t v53 = *MEMORY[0x1E4F1CEC8];
  uint64_t v54 = *MEMORY[0x1E4F1D568];
  uint64_t v56 = *MEMORY[0x1E4F1D578];
  uint64_t v57 = *MEMORY[0x1E4F1D570];
  uint64_t v58 = *MEMORY[0x1E4F1D580];
  uint64_t v59 = *MEMORY[0x1E4F1D8B0];
  uint64_t v60 = *MEMORY[0x1E4F1D748];
  uint64_t v61 = *MEMORY[0x1E4F1D848];
  uint64_t v62 = *MEMORY[0x1E4F1D988];
  uint64_t v63 = *MEMORY[0x1E4F1D980];
  uint64_t v64 = *MEMORY[0x1E4F1CD68];
  uint64_t v65 = *MEMORY[0x1E4F1D968];
  uint64_t v66 = *MEMORY[0x1E4F1D830];
  uint64_t v67 = *MEMORY[0x1E4F1D560];
  CFAllocatorRef v10 = malloc_type_malloc(0x8C0uLL, 0x10E00408BA53399uLL);
  *(void *)CFAllocatorRef v10 = v0;
  sResourcePropertiesInfoPtr = (uint64_t)v10;
  v10[2] = 4112;
  *((void *)v10 + 4) = v1;
  *((void *)v10 + 8) = v2;
  *((void *)v10 + 12) = v3;
  *((void *)v10 + 16) = v4;
  *((void *)v10 + 19) = 16;
  *((void *)v10 + 20) = v12;
  *((void *)v10 + 24) = v13;
  *((void *)v10 + 28) = v15;
  *((void *)v10 + 32) = v16;
  *((void *)v10 + 34) = extractRPFlags;
  *((void *)v10 + 35) = 256;
  v10[10] = 4112;
  v10[18] = 4112;
  v10[26] = 4112;
  v10[34] = 4112;
  v10[42] = 4112;
  _OWORD v10[50] = 4112;
  v10[58] = 4112;
  v10[66] = 4112;
  v10[74] = 4112;
  *((void *)v10 + 40) = v19;
  *((void *)v10 + 18) = extractRPFlags;
  *((void *)v10 + 6) = extractRPFlags;
  *((void *)v10 + 7) = 2;
  *((void *)v10 + 10) = extractRPFlags;
  *((void *)v10 + 11) = 4;
  *((void *)v10 + 14) = extractRPFlags;
  *((void *)v10 + 15) = 8;
  *((void *)v10 + 22) = extractRPFlags;
  *((void *)v10 + 23) = 32;
  *((void *)v10 + 26) = extractRPFlags;
  *((void *)v10 + 27) = 64;
  *((void *)v10 + 30) = extractRPFlags;
  *((void *)v10 + 31) = 128;
  *((void *)v10 + 38) = extractRPFlags;
  *((void *)v10 + 39) = 512;
  *((void *)v10 + 2) = extractRPFlags;
  *((void *)v10 + 3) = 1;
  *((void *)v10 + 36) = v23;
  v10[82] = 8224;
  *((void *)v10 + 44) = v30;
  *((void *)v10 + 47) = 2;
  *((void *)v10 + 48) = v29;
  *((void *)v10 + 51) = 8;
  *((void *)v10 + 52) = v28;
  *((void *)v10 + 55) = 32;
  *((void *)v10 + 56) = v27;
  *((void *)v10 + 59) = 64;
  *((void *)v10 + 60) = v26;
  *((void *)v10 + 63) = 128;
  *((void *)v10 + 64) = v25;
  *((void *)v10 + 67) = 512;
  *((void *)v10 + 68) = v24;
  *((void *)v10 + 71) = 4096;
  *((void *)v10 + 72) = v32;
  *((void *)v10 + 75) = 0x100000000;
  *((void *)v10 + 76) = v35;
  *((void *)v10 + 79) = 0x1000000000;
  *((void *)v10 + 80) = v37;
  *((void *)v10 + 83) = 0x2000000000000;
  *((void *)v10 + 84) = v38;
  *((void *)v10 + 87) = 0x10000000000;
  *((void *)v10 + 88) = v40;
  *((void *)v10 + 91) = 0x20000000000000;
  *((void *)v10 + 92) = v42;
  *((void *)v10 + 95) = 0x40000000000000;
  *((void *)v10 + 96) = v44;
  *((void *)v10 + 99) = 0x80000000000000;
  *((void *)v10 + 100) = v46;
  *((void *)v10 + 103) = 0x80000000000;
  *((void *)v10 + 104) = v48;
  v10[90] = 8224;
  v10[98] = 8224;
  v10[106] = 8224;
  v10[114] = 8224;
  v10[122] = 8224;
  v10[130] = 8224;
  v10[138] = 8224;
  v10[146] = 8224;
  v10[154] = 8224;
  v10[162] = 8224;
  v10[170] = 8224;
  v10[178] = 8224;
  v10[186] = 8224;
  v10[194] = 8224;
  v10[202] = 8224;
  v10[210] = 8224;
  *((void *)v10 + 107) = 0x100000000000;
  *((void *)v10 + 108) = v51;
  v10[218] = 4128;
  *((void *)v10 + 46) = extractVPFlags;
  *((void *)v10 + 50) = extractVPFlags;
  *((void *)v10 + 54) = extractVPFlags;
  *((void *)v10 + 58) = extractVPFlags;
  *((void *)v10 + 62) = extractVPFlags;
  *((void *)v10 + 66) = extractVPFlags;
  *((void *)v10 + 70) = extractVPFlags;
  *((void *)v10 + 74) = extractVPFlags;
  *((void *)v10 + 78) = extractVPFlags;
  *((void *)v10 + 82) = extractVPFlags;
  *((void *)v10 + 86) = extractVPFlags;
  *((void *)v10 + 90) = extractVPFlags;
  *((void *)v10 + 94) = extractVPFlags;
  *((void *)v10 + 98) = extractVPFlags;
  *((void *)v10 + 102) = extractVPFlags;
  *((void *)v10 + 106) = extractVPFlags;
  *((void *)v10 + 42) = extractVPFlags;
  *((void *)v10 + 43) = 1;
  *((void *)v10 + 110) = extractNameKey;
  *((void *)v10 + 112) = v55;
  v10[226] = 4144;
  *((void *)v10 + 111) = 0;
  *((void *)v10 + 114) = extractFileIDKey;
  *((void *)v10 + 116) = v5;
  v10[234] = 61463;
  *((void *)v10 + 120) = v6;
  v10[242] = 61473;
  *((void *)v10 + 124) = v7;
  v10[250] = 61472;
  *((void *)v10 + 128) = v8;
  v10[258] = 4160;
  *((void *)v10 + 132) = v9;
  v10[266] = 4161;
  *((void *)v10 + 136) = v14;
  v10[274] = 4162;
  *((void *)v10 + 140) = v17;
  v10[282] = 4163;
  *((void *)v10 + 144) = v18;
  *((void *)v10 + 148) = v20;
  v10[298] = 983044;
  *((void *)v10 + 152) = v21;
  v10[306] = 983045;
  *((void *)v10 + 156) = v22;
  v10[314] = 983046;
  *((void *)v10 + 115) = 0;
  double result = 0.0;
  *((_OWORD *)v10 + 59) = 0u;
  *((_OWORD *)v10 + 61) = 0u;
  *((_OWORD *)v10 + 63) = 0u;
  *((_OWORD *)v10 + 65) = 0u;
  *((_OWORD *)v10 + 67) = 0u;
  *((_OWORD *)v10 + 69) = 0u;
  *((_OWORD *)v10 + 71) = 0u;
  v10[290] = 983041;
  *((_OWORD *)v10 + 73) = 0u;
  *((_OWORD *)v10 + 75) = 0u;
  *((_OWORD *)v10 + 77) = 0u;
  *((_OWORD *)v10 + 79) = 0u;
  *((void *)v10 + 160) = v31;
  v10[322] = 983048;
  *((_OWORD *)v10 + 81) = 0u;
  *((void *)v10 + 164) = v33;
  v10[330] = 61474;
  *((_OWORD *)v10 + 83) = 0u;
  *((void *)v10 + 168) = v34;
  v10[338] = 983049;
  *((_OWORD *)v10 + 85) = 0u;
  *((void *)v10 + 172) = v36;
  v10[346] = 61450;
  *((_OWORD *)v10 + 87) = 0u;
  *((void *)v10 + 176) = v23;
  v10[354] = 983051;
  *((_OWORD *)v10 + 89) = 0u;
  *((void *)v10 + 180) = v39;
  v10[362] = 983052;
  *((_OWORD *)v10 + 91) = 0u;
  *((void *)v10 + 184) = v41;
  v10[370] = 983053;
  *((_OWORD *)v10 + 93) = 0u;
  *((void *)v10 + 188) = v43;
  v10[378] = 983054;
  *((_OWORD *)v10 + 95) = 0u;
  *((void *)v10 + 192) = v45;
  v10[386] = 983055;
  *((_OWORD *)v10 + 97) = 0u;
  *((void *)v10 + 196) = v47;
  v10[394] = 983057;
  *((_OWORD *)v10 + 99) = 0u;
  *((void *)v10 + 200) = v49;
  v10[402] = 983058;
  *((_OWORD *)v10 + 101) = 0u;
  *((void *)v10 + 204) = v50;
  v10[410] = 983059;
  *((_OWORD *)v10 + 103) = 0u;
  *((void *)v10 + 208) = v52;
  v10[418] = 251658516;
  *((_OWORD *)v10 + 105) = 0u;
  *((void *)v10 + 212) = v53;
  v10[426] = 983061;
  *((_OWORD *)v10 + 107) = 0u;
  *((void *)v10 + 216) = v54;
  v10[434] = 65280;
  *((void *)v10 + 218) = returnPathComponentsAsString;
  *((void *)v10 + 219) = 0;
  *((void *)v10 + 220) = v56;
  v10[442] = 65281;
  *((void *)v10 + 222) = returnRelativePathComponentsAsStringForVolume;
  *((void *)v10 + 223) = 1;
  *((void *)v10 + 224) = v57;
  v10[450] = 65283;
  *((void *)v10 + 226) = returnPathComponentsArray;
  *((void *)v10 + 227) = 0;
  *((void *)v10 + 228) = v58;
  v10[458] = 65282;
  *((void *)v10 + 230) = returnVolumeNameAsString;
  *((void *)v10 + 231) = 0;
  *((void *)v10 + 232) = v59;
  v10[466] = 0;
  *((void *)v10 + 234) = returnVolumeNameAsString;
  *((void *)v10 + 235) = 0;
  *((void *)v10 + 236) = v60;
  v10[474] = 0;
  *((void *)v10 + 238) = returnPathComponentsAsString;
  *((void *)v10 + 239) = 0;
  *((void *)v10 + 240) = v61;
  v10[482] = 0;
  *((void *)v10 + 242) = extractVPFlagsAndNegate;
  *((void *)v10 + 243) = 4;
  *((void *)v10 + 244) = v62;
  v10[490] = 8209;
  *((_OWORD *)v10 + 123) = 0u;
  *((void *)v10 + 248) = v63;
  v10[498] = 0;
  *((void *)v10 + 250) = returnVolumeURL;
  *((void *)v10 + 251) = 0;
  *((void *)v10 + 252) = v64;
  v10[506] = 0;
  *((void *)v10 + 254) = returnURLString;
  *((void *)v10 + 255) = 0;
  *((void *)v10 + 256) = v65;
  v10[514] = 8210;
  *((_OWORD *)v10 + 129) = 0u;
  *((void *)v10 + 260) = v66;
  v10[522] = 8211;
  *((_OWORD *)v10 + 131) = 0u;
  *((void *)v10 + 264) = v67;
  v10[530] = 8304;
  *((_OWORD *)v10 + 133) = 0u;
  *((void *)v10 + 268) = @"NSURLBookmarkAllPropertiesKey";
  v10[538] = 0;
  *((void *)v10 + 270) = returnAllPropertiesInBookmark;
  *((void *)v10 + 271) = 0;
  *((void *)v10 + 272) = @"NSURLBookmarkAllPropertyKeysKey";
  v10[546] = 0;
  *((void *)v10 + 274) = returnAllPropertyKeysInBookmark;
  *((void *)v10 + 275) = 0;
  *((void *)v10 + 276) = @"NSURLBookmarkDetailedDescription";
  v10[554] = 0;
  *((void *)v10 + 278) = returnDetailedDump;
  *((void *)v10 + 279) = 0;
  return result;
}

CFTypeRef extractRPFlags(BookmarkData *a1, int a2, uint64_t a3)
{
  if (!BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v7) || (v7[1] & a3) == 0) {
    return 0;
  }
  uint64_t v4 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  if ((v7[0] & a3) != 0) {
    uint64_t v4 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  }
  CFTypeRef v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFTypeRef extractVPFlags(BookmarkData *a1, int a2, uint64_t a3)
{
  if (!BookmarkData::getURLVolumeProperties(a1, a2, (uint64_t)v7) || (v7[1] & a3) == 0) {
    return 0;
  }
  uint64_t v4 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  if ((v7[0] & a3) != 0) {
    uint64_t v4 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  }
  CFTypeRef v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFNumberRef extractNameKey(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFNumberRef result = (CFNumberRef)BookmarkData::copyItem(a1, 0x1020u, a2, TypeID);
  if (!result)
  {
    unsigned int v6 = countPathComponents(a1, a2);
    if (v6)
    {
      return copyIndexedPathComponent(a1, a2, v6 - 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const void *extractFileIDKey(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  CFTypeRef v5 = BookmarkData::copyItem(a1, 0x1030u, 1u, TypeID);
  if (!v5)
  {
    CFTypeID v6 = CFArrayGetTypeID();
    CFArrayRef v7 = (const __CFArray *)BookmarkData::copyItem(a1, 0x1005u, a2, v6);
    if (v7)
    {
      CFArrayRef v8 = v7;
      CFIndex Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v8, Count - 1);
        CFTypeRef v5 = ValueAtIndex;
        if (!ValueAtIndex)
        {
LABEL_9:
          CFRelease(v8);
          return v5;
        }
        if (CFGetTypeID(ValueAtIndex) == TypeID)
        {
          CFRetain(v5);
          goto LABEL_9;
        }
      }
      CFTypeRef v5 = 0;
      goto LABEL_9;
    }
    return 0;
  }
  return v5;
}

CFStringRef returnPathComponentsAsString(BookmarkData *a1, int a2, unint64_t a3)
{
  if (HIDWORD(a3)) {
    return 0;
  }
  uint64_t v3 = copyPathComponentsAsString(a1, a2, a3, 1);
  CFStringRef v4 = v3;
  if (v3)
  {
    CFIndex Length = CFStringGetLength(v3);
    if (Length >= 2)
    {
      CFIndex v6 = Length - 1;
      if (CFStringGetCharacterAtIndex(v4, Length - 1) == 47)
      {
        v9.CFIndex location = 0;
        v9.CFURLRef length = v6;
        CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, v9);
        CFRelease(v4);
        return v7;
      }
    }
  }
  return v4;
}

CFStringRef returnRelativePathComponentsAsStringForVolume(BookmarkData *a1, int a2, uint64_t a3)
{
  if (a3)
  {
    CFTypeID TypeID = CFArrayGetTypeID();
    CFArrayRef v7 = (const __CFArray *)BookmarkData::copyItem(a1, 0x2000u, 1u, TypeID);
    if (v7)
    {
      CFArrayRef v8 = v7;
      if (CFArrayGetCount(v7) < 1)
      {
        uint64_t v12 = copyPathComponentsAsString(a1, a2, 0, 0);
        goto LABEL_14;
      }
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      uint64_t valuePtr = a3;
      CFNumberRef v10 = CFNumberCreate(v9, kCFNumberSInt64Type, &valuePtr);
      v19.CFURLRef length = CFArrayGetCount(v8);
      v19.CFIndex location = 0;
      LastIndexOfint Value = CFArrayGetLastIndexOfValue(v8, v19, v10);
      if (LastIndexOfValue == -1)
      {
        uint64_t v12 = 0;
        if (!v10) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v12 = copyPathComponentsAsString(a1, a2, LastIndexOfValue, 0);
        if (!v10)
        {
LABEL_14:
          CFRelease(v8);
          if (!v12) {
            return v12;
          }
          goto LABEL_15;
        }
      }
      CFRelease(v10);
      goto LABEL_14;
    }
    uint64_t v13 = copyPathComponentsAsString(a1, a2, 0, 0);
  }
  else
  {
    uint64_t v13 = (__CFString *)returnPathComponentsAsString(a1, a2, 0);
  }
  uint64_t v12 = v13;
  if (!v13) {
    return v12;
  }
LABEL_15:
  CFIndex Length = CFStringGetLength(v12);
  if (Length >= 2)
  {
    CFIndex v15 = Length - 1;
    if (CFStringGetCharacterAtIndex(v12, Length - 1) == 47)
    {
      v20.CFIndex location = 0;
      v20.CFURLRef length = v15;
      CFStringRef v16 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, v20);
      CFRelease(v12);
      return v16;
    }
  }
  return v12;
}

CFArrayRef returnPathComponentsArray(BookmarkData *a1, int a2)
{
  return copyPathComponentsAsArray(a1, a2, 0);
}

const void *returnVolumeNameAsString(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  return BookmarkData::copyItem(a1, 0x2010u, a2, TypeID);
}

CFTypeRef extractVPFlagsAndNegate(BookmarkData *a1, int a2, uint64_t a3)
{
  if (!BookmarkData::getURLVolumeProperties(a1, a2, (uint64_t)v7) || (v7[1] & a3) == 0) {
    return 0;
  }
  CFStringRef v4 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  if ((v7[0] & a3) != 0) {
    CFStringRef v4 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  }
  CFTypeRef v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFURLRef returnVolumeURL(BookmarkData *a1, unsigned int a2)
{
  BOOL v9 = 0;
  if (!BookmarkData::getItemAs(a1, 0x2030u, a2, &v9)
    || !v9
    || (CFURLRef v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"/", kCFURLPOSIXPathStyle, 1u)) == 0)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    CFStringRef v6 = (const __CFString *)BookmarkData::copyItem(a1, 0x2002u, a2, TypeID);
    if (v6)
    {
      CFStringRef v7 = v6;
      CFURLRef v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, kCFURLPOSIXPathStyle, 1u);
      CFRelease(v7);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

void *returnURLString(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef v5 = (void *)BookmarkData::copyItem(a1, 0x1003u, a2, TypeID);
  if (!v5)
  {
    CFStringRef v6 = returnPathComponentsAsString(a1, a2, 0);
    if (v6)
    {
      CFStringRef v7 = v6;
      CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D678];
      CFTypeID v9 = CFBooleanGetTypeID();
      CFBooleanRef v10 = BookmarkCopyPropertyFromBookmarkData(a1, v8, v9);
      CFBooleanRef v11 = v10;
      if (v10) {
        Boolean Value = CFBooleanGetValue(v10);
      }
      else {
        Boolean Value = 0;
      }
      CFURLRef v13 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, kCFURLPOSIXPathStyle, Value);
      if (v13)
      {
        CFURLRef v14 = v13;
        CFStringRef v15 = CFURLGetString(v13);
        CFTypeRef v5 = (void *)v15;
        if (v15) {
          CFRetain(v15);
        }
        CFRelease(v14);
        if (!v11) {
          goto LABEL_12;
        }
      }
      else
      {
        CFTypeRef v5 = 0;
        if (!v11) {
          goto LABEL_12;
        }
      }
      CFRelease(v11);
LABEL_12:
      CFRelease(v7);
      return v5;
    }
    return 0;
  }
  return v5;
}

CFArrayRef returnAllPropertyKeysInBookmark(BookmarkData *a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = copyAllPropertiesInBookmark(a1, a2);
  if (!v3) {
    return 0;
  }
  CFDictionaryRef v4 = v3;
  if (CFDictionaryGetCount(v3) < 1)
  {
    CFArrayRef v11 = 0;
  }
  else
  {
    CFIndex Count = CFDictionaryGetCount(v4);
    MEMORY[0x1F4188790](Count);
    CFStringRef v7 = (const void **)((char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v6 >= 0x200) {
      size_t v8 = 512;
    }
    else {
      size_t v8 = v6;
    }
    bzero((char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    CFDictionaryGetKeysAndValues(v4, v7, 0);
    CFAllocatorRef v9 = *(const __CFAllocator **)a1;
    CFIndex v10 = CFDictionaryGetCount(v4);
    CFArrayRef v11 = CFArrayCreate(v9, v7, v10, MEMORY[0x1E4F1D510]);
  }
  CFRelease(v4);
  return v11;
}

__CFString *returnDetailedDump(const void **a1)
{
  return _CFURLBookmarkDataCopyDescription(a1[1]);
}

__CFDictionary *copyAllPropertiesInBookmark(BookmarkData *a1, uint64_t a2)
{
  CFDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken != -1) {
    dispatch_once(&BookmarkResourcePropertyKeyToInfoStructInit(void)::onceToken, &__block_literal_global_1);
  }
  Indexeduint64_t ItemInTOC = BookmarkData::getIndexedItemInTOC(a1, 0, 1);
  if (IndexedItemInTOC)
  {
    unint64_t v6 = IndexedItemInTOC;
    unsigned int v7 = 1;
    while ((*v6 & 0x80000000) == 0)
    {
LABEL_16:
      unint64_t v6 = BookmarkData::getIndexedItemInTOC(a1, v7++, 1);
      if (!v6) {
        goto LABEL_17;
      }
    }
    DataItemAtOffset = BookmarkData::getDataItemAtOffset(a1, *v6 & 0x7FFFFFFF);
    CFNumberRef v9 = BookmarkData::copyItem((CFAllocatorRef *)a1, DataItemAtOffset, 0);
    CFNumberRef v10 = BookmarkData::copyItem(a1, (uint64_t)v6, 0);
    CFNumberRef v11 = v10;
    if (!Mutable || (v9 ? (BOOL v12 = v10 == 0) : (BOOL v12 = 1), v12))
    {
      if (!v10) {
        goto LABEL_14;
      }
    }
    else
    {
      CFDictionaryAddValue(Mutable, v9, v10);
    }
    CFRelease(v11);
LABEL_14:
    if (v9) {
      CFRelease(v9);
    }
    goto LABEL_16;
  }
LABEL_17:
  if (sResourcePropertiesInfoCountIncludedInAll == 1)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    while (1)
    {
      CFStringRef v15 = *(const void **)(sResourcePropertiesInfoPtr + v13);
      if (!v15 || CFDictionaryContainsKey(Mutable, v15)) {
        goto LABEL_36;
      }
      uint64_t v16 = sResourcePropertiesInfoPtr + v13;
      uint64_t v17 = *(uint64_t (**)(BookmarkData *, uint64_t, void))(sResourcePropertiesInfoPtr + v13 + 16);
      if (v17) {
        break;
      }
      unsigned int v19 = *(_DWORD *)(v16 + 8);
      if (v19 >> 8 <= 0xFE)
      {
        uint64_t v18 = BookmarkData::copyItem(a1, v19, a2, 0);
        goto LABEL_25;
      }
      CFRange v20 = 0;
LABEL_26:
      uint64_t v21 = *(const void **)(sResourcePropertiesInfoPtr + v13);
      if (v20) {
        BOOL v22 = Mutable == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22 || v21 == 0)
      {
        if (!v20) {
          goto LABEL_36;
        }
      }
      else
      {
        CFDictionaryAddValue(Mutable, v21, v20);
      }
      CFRelease(v20);
LABEL_36:
      if (sResourcePropertiesInfoCountIncludedInAll == 1)
      {
        v13 += 32;
        BOOL v24 = v14++ >= 0x42;
        if (!v24) {
          continue;
        }
      }
      goto LABEL_41;
    }
    uint64_t v18 = (const void *)v17(a1, a2, *(void *)(v16 + 24));
LABEL_25:
    CFRange v20 = v18;
    goto LABEL_26;
  }
LABEL_41:
  if (sResourcePropertiesInfoCount == 1)
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    do
    {
      if (*(_DWORD *)(sResourcePropertiesInfoPtr + v25 + 8) >= 0xF000u)
      {
        if (*(void *)(sResourcePropertiesInfoPtr + v25))
        {
          uint64_t v27 = *(uint64_t (**)(BookmarkData *, uint64_t, void))(sResourcePropertiesInfoPtr + v25 + 16);
          if (v27)
          {
            uint64_t v28 = (const void *)v27(a1, a2, *(void *)(sResourcePropertiesInfoPtr + v25 + 24));
            if (v28)
            {
              uint64_t v29 = v28;
              if (Mutable)
              {
                uint64_t v30 = *(const void **)(sResourcePropertiesInfoPtr + v25);
                if (v30) {
                  CFDictionaryAddValue(Mutable, v30, v28);
                }
              }
              CFRelease(v29);
            }
          }
        }
      }
      if (sResourcePropertiesInfoCount != 1) {
        break;
      }
      v25 += 32;
      BOOL v24 = v26++ >= 0x45;
    }
    while (!v24);
  }
  if (!Mutable) {
    return 0;
  }
  if (CFDictionaryGetCount(Mutable) < 1)
  {
    uint64_t v31 = 0;
  }
  else
  {
    CFRetain(Mutable);
    uint64_t v31 = Mutable;
  }
  CFRelease(Mutable);
  return v31;
}

uint64_t DownloadCloudDocumentSync(const __CFURL *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  size_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  dispatch_group_t v2 = dispatch_group_create();
  if (v2)
  {
    uint64_t v3 = v2;
    CFDictionaryRef v4 = bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v12 = "DownloadCloudDocumentSync";
      __int16 v13 = 2112;
      CFURLRef v14 = a1;
      _os_log_impl(&dword_181761000, v4, OS_LOG_TYPE_INFO, "%s: downloading %@", buf, 0x16u);
    }
    dispatch_group_enter(v3);
    _CFFileCoordinateReadingItemAtURL2();
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v3);
    uint64_t v5 = *((unsigned __int8 *)v8 + 24);
  }
  else
  {
    uint64_t v5 = 0;
    *((unsigned char *)v8 + 24) = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v5;
}

CFURLRef _URLCreateByResolvingAliasFile(const __CFAllocator *a1, const void *a2, unint64_t a3, const void *a4, __CFError **a5)
{
  char v10 = _os_activity_create(&dword_181761000, "CFURLResolveBookmarkData", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);
  unsigned __int8 v20 = 0;
  CFURLRef v11 = _CreateByResolvingAliasFile(a1, a2, a3, &v20, a5);
  if (v11)
  {
    if (v20)
    {
      CFDataRef Mutable = CFSetCreateMutable(a1, 0, MEMORY[0x1E4F1D548]);
      if (Mutable)
      {
        CFSetRef v13 = Mutable;
        CFSetAddValue(Mutable, v11);
        CFURLRef v14 = _CreateByResolvingAliasFile(a1, v11, a3, &v20, a5);
        CFRelease(v11);
        if (v14)
        {
          CFURLRef v11 = v14;
          while (v20)
          {
            if (CFSetContainsValue(v13, v11) || CFSetGetCount(v13) >= 32)
            {
              if (a5) {
                *a5 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x1E4F1D148], 260, 0);
              }
              CFRelease(v11);
              goto LABEL_14;
            }
            CFSetAddValue(v13, v11);
            CFURLRef v15 = _CreateByResolvingAliasFile(a1, v11, a3, &v20, a5);
            CFRelease(v11);
            CFURLRef v11 = v15;
            if (!v15) {
              break;
            }
          }
        }
        else
        {
LABEL_14:
          CFURLRef v11 = 0;
        }
        CFRelease(v13);
      }
    }
  }
  if (a4 && v11)
  {
    CFTypeID v16 = CFGetTypeID(a4);
    if (v16 == CFArrayGetTypeID())
    {
      uint64_t v17 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v11, (CFArrayRef)a4, v17, 0);
    }
  }
  else if (a5 && !v11 && !*a5)
  {
    uint64_t v18 = aliasLog;
    if (os_log_type_enabled((os_log_t)aliasLog, OS_LOG_TYPE_ERROR)) {
      _URLCreateByResolvingAliasFile_cold_1(v18);
    }
    *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
  os_release(v10);
  os_activity_scope_leave(&state);
  return v11;
}

CFURLRef _CreateByResolvingAliasFile(const __CFAllocator *a1, CFTypeRef cf, unint64_t a3, unsigned __int8 *a4, __CFError **a5)
{
  cf1[128] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFBooleanRef propertyValueTypeRefPtr = 0;
  CFURLRef v9 = (const __CFURL *)CFRetain(cf);
  *a4 = 0;
  if (CFURLCopyResourcePropertyForKey(v9, (CFStringRef)*MEMORY[0x1E4F1D668], &propertyValueTypeRefPtr, 0)) {
    BOOL v10 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    goto LABEL_12;
  }
  if (!CFBooleanGetValue(propertyValueTypeRefPtr)
    || ((cf1[0] = 0, CFURLCopyResourcePropertyForKey(v9, (CFStringRef)*MEMORY[0x1E4F1D618], cf1, 0))
      ? (BOOL v11 = cf1[0] == 0)
      : (BOOL v11 = 1),
        v11))
  {
    CFRelease(propertyValueTypeRefPtr);
    goto LABEL_12;
  }
  int v14 = CFEqual(cf1[0], (CFTypeRef)*MEMORY[0x1E4F1D628]);
  int v15 = v14;
  if (v14)
  {
    *a4 = 1;
  }
  else if (CFEqual(cf1[0], (CFTypeRef)*MEMORY[0x1E4F1D620]))
  {
    *a4 = 1;
    CFRelease(cf1[0]);
    CFRelease(propertyValueTypeRefPtr);
    CFDataRef v25 = (const __CFData *)MEMORY[0x185300350](a1, v9, a5);
    if (v25)
    {
      CFDataRef v26 = v25;
      CFURLRef v12 = (const __CFURL *)_CFURLCreateByResolvingBookmarkData(a1, v25, a3, v9, 0, 0, a5);
      CFRelease(v26);
      if (v12 && CFURLIsFileReferenceURL(v12))
      {
        CFURLRef v27 = CFURLCreateFilePathURL(a1, v12, a5);
        CFRelease(v12);
        CFURLRef v12 = v27;
      }
      goto LABEL_13;
    }
LABEL_39:
    CFURLRef v12 = 0;
    goto LABEL_13;
  }
  CFRelease(cf1[0]);
  CFRelease(propertyValueTypeRefPtr);
  if (!v15)
  {
LABEL_12:
    CFURLRef v12 = (const __CFURL *)CFRetain(v9);
    goto LABEL_13;
  }
  if (!CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)cf1, 1024))
  {
    if (a5)
    {
LABEL_45:
      CFStringRef v29 = (const __CFString *)*MEMORY[0x1E4F1D148];
      CFAllocatorRef v30 = a1;
      uint64_t v28 = 260;
      goto LABEL_46;
    }
    goto LABEL_39;
  }
  ssize_t v16 = readlink((const char *)cf1, v33, 0x400uLL);
  if (v16 < 0)
  {
    if (a5)
    {
      uint64_t v28 = *__error();
      CFStringRef v29 = (const __CFString *)*MEMORY[0x1E4F1D160];
      CFAllocatorRef v30 = a1;
LABEL_46:
      CFURLRef v12 = 0;
      *a5 = _FSURLCreateStandardError(v30, v29, v28, 0, (const __CFString *)v9, 0);
      goto LABEL_13;
    }
    goto LABEL_39;
  }
  ssize_t v17 = v16;
  if (CFURLHasDirectoryPath(v9))
  {
    size_t v18 = strlen((const char *)cf1);
    CFURLRef v19 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)cf1, v18, 0);
    CFRelease(v9);
    CFURLRef v9 = v19;
  }
  CFURLRef v20 = (const __CFURL *)MEMORY[0x1853003B0](a1, v33, v17, 0, v9);
  if (v20)
  {
    CFURLRef v21 = v20;
    if (CFURLGetFileSystemRepresentation(v20, 1u, (UInt8 *)cf1, 1024))
    {
      size_t v22 = strlen((const char *)cf1);
      if (lstat((const char *)cf1, &v31)) {
        BOOL v23 = 0;
      }
      else {
        BOOL v23 = (v31.st_mode & 0xF000) == 0x4000;
      }
      Boolean v24 = v23;
      CFURLRef v12 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)cf1, v22, v24);
    }
    else
    {
      CFURLRef v12 = 0;
    }
    CFRelease(v21);
  }
  else
  {
    CFURLRef v12 = 0;
  }
  if (a5 && !v12) {
    goto LABEL_45;
  }
LABEL_13:
  CFRelease(v9);
  return v12;
}

CFTypeRef matchVolumeURLForBookmark(BookmarkData *a1, unsigned int a2, CFArrayRef theArray, char *a4, const __CFArray *a5, unsigned __int8 *a6)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CFIndex Count = CFArrayGetCount(theArray);
  CFTypeID TypeID = CFStringGetTypeID();
  BOOL v11 = (__CFString *)BookmarkData::copyItem(a1, 0x2010u, a2, TypeID);
  CFTypeID v12 = CFURLGetTypeID();
  CFSetRef v13 = (__CFString *)BookmarkData::copyItem(a1, 0x2050u, a2, v12);
  CFTypeID v14 = CFStringGetTypeID();
  int v15 = (__CFString *)BookmarkData::copyItem(a1, 0x2011u, a2, v14);
  CFTypeID v16 = CFNumberGetTypeID();
  ssize_t v17 = (__CFString *)BookmarkData::copyItem(a1, 0x2012u, a2, v16);
  CFTypeID v18 = CFDateGetTypeID();
  CFURLRef v19 = (__CFString *)BookmarkData::copyItem(a1, 0x2013u, a2, v18);
  BOOL URLVolumeProperties = BookmarkData::getURLVolumeProperties(a1, a2, (uint64_t)&v55);
  if (v15)
  {
    if (Count >= 1)
    {
      uint64_t v47 = v11;
      uint64_t v50 = v17;
      CFURLRef v21 = v19;
      CFIndex v22 = 0;
      CFStringRef v23 = (const __CFString *)*MEMORY[0x1E4F1D988];
      while (1)
      {
        CFTypeRef v24 = cf;
        if (cf) {
          break;
        }
        CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v22);
        if (matchURLProperty((const __CFURL *)ValueAtIndex, v23, v15))
        {
          if (ValueAtIndex) {
            CFRetain(ValueAtIndex);
          }
          if (cf != ValueAtIndex)
          {
            if (cf) {
              CFRelease(cf);
            }
            CFTypeRef cf = ValueAtIndex;
          }
          CFDataRef v26 = resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            CFTypeRef v59 = ValueAtIndex;
            __int16 v60 = 2112;
            uint64_t v61 = v15;
            _os_log_debug_impl(&dword_181761000, v26, OS_LOG_TYPE_DEBUG, "matched volume %@ by uuid %@", buf, 0x16u);
          }
        }
        if (Count == ++v22) {
          goto LABEL_34;
        }
      }
LABEL_31:
      char v31 = 0;
      BOOL v11 = v47;
      CFURLRef v19 = v21;
      goto LABEL_32;
    }
    goto LABEL_62;
  }
  if (v13)
  {
    if (Count >= 1)
    {
      uint64_t v47 = v11;
      uint64_t v50 = v17;
      CFURLRef v21 = v19;
      CFIndex v27 = 0;
      CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F1D978];
      while (1)
      {
        CFTypeRef v24 = cf;
        if (cf) {
          goto LABEL_31;
        }
        CFTypeRef v29 = CFArrayGetValueAtIndex(theArray, v27);
        if (matchURLProperty((const __CFURL *)v29, v28, v13))
        {
          if (v29) {
            CFRetain(v29);
          }
          if (cf != v29)
          {
            if (cf) {
              CFRelease(cf);
            }
            CFTypeRef cf = v29;
          }
          CFAllocatorRef v30 = resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            CFTypeRef v59 = v29;
            __int16 v60 = 2112;
            uint64_t v61 = v13;
            _os_log_debug_impl(&dword_181761000, v30, OS_LOG_TYPE_DEBUG, "matched volume %@ by VolumeMountURL %@", buf, 0x16u);
          }
        }
        if (Count == ++v27)
        {
LABEL_34:
          CFTypeRef v24 = cf;
          CFURLRef v19 = v21;
          uint64_t v32 = a4;
          if (!cf)
          {
            BOOL v11 = v47;
            ssize_t v17 = v50;
            goto LABEL_89;
          }
          char v31 = 0;
          BOOL v11 = v47;
          if (!a4) {
            goto LABEL_87;
          }
          goto LABEL_36;
        }
      }
    }
LABEL_62:
    CFTypeRef v24 = 0;
    goto LABEL_89;
  }
  BOOL v33 = URLVolumeProperties;
  if (!v11)
  {
    CFTypeRef v24 = 0;
    if (!v17 || !v19) {
      goto LABEL_88;
    }
    if (Count >= 1)
    {
      uint64_t v52 = v19;
      CFIndex v38 = 0;
      unsigned int v46 = 0;
      CFStringRef v39 = (const __CFString *)*MEMORY[0x1E4F1D968];
      uint64_t v49 = (__CFString *)*MEMORY[0x1E4F1D5A0];
      do
      {
        CFTypeRef v54 = 0;
        uint64_t v40 = CFArrayGetValueAtIndex(theArray, v38);
        CFTypeRef v41 = CFRetain(v40);
        if (v54 != v41)
        {
          if (v54) {
            CFRelease(v54);
          }
          CFTypeRef v54 = v41;
        }
        if (matchURLProperty((const __CFURL *)v41, v39, v17) && matchURLProperty((const __CFURL *)v54, v49, v52) && v33)
        {
          if (_CFURLGetVolumePropertyFlags())
          {
            if ((v56 & 1) != 0 && (v55 & 1) == 0)
            {
              CFReleaser<__CFData const*>::operator=(&cf, &v54);
              ++v46;
              uint64_t v42 = resolveLog;
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                CFTypeRef v59 = cf;
                __int16 v60 = 2112;
                uint64_t v61 = v17;
                __int16 v62 = 2112;
                uint64_t v63 = v52;
                _os_log_debug_impl(&dword_181761000, v42, OS_LOG_TYPE_DEBUG, "(possible) matched volume %@ by capacity=%@ and creationDate=%@ (renamed volume case)", buf, 0x20u);
              }
            }
          }
        }
        if (v54) {
          CFRelease(v54);
        }
        ++v38;
      }
      while (Count != v38);
      CFURLRef v19 = v52;
      if (v46 > 1)
      {
        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
          matchVolumeURLForBookmark();
        }
        if (cf) {
          CFRelease(cf);
        }
        CFTypeRef v24 = 0;
        goto LABEL_88;
      }
    }
    uint64_t v50 = v17;
    char v31 = 1;
    CFTypeRef v24 = cf;
LABEL_32:
    uint64_t v32 = a4;
    if (!a4) {
      goto LABEL_87;
    }
    goto LABEL_36;
  }
  if (Count < 1) {
    goto LABEL_62;
  }
  uint64_t v34 = v19;
  CFIndex v35 = 0;
  uint64_t v51 = (__CFString *)*MEMORY[0x1E4F1D968];
  uint64_t v48 = (__CFString *)*MEMORY[0x1E4F1D5A0];
  CFStringRef v45 = (const __CFString *)*MEMORY[0x1E4F1D8B0];
  do
  {
    CFTypeRef v24 = cf;
    if (cf)
    {
      uint64_t v50 = v17;
      char v31 = 0;
      CFURLRef v19 = v34;
      goto LABEL_32;
    }
    CFURLRef v36 = (const __CFURL *)CFArrayGetValueAtIndex(theArray, v35);
    CFURLRef v37 = v36;
    if ((!v17 || matchURLProperty(v36, v51, v17)) && (!v34 || matchURLProperty(v37, v48, v34)))
    {
      CFTypeRef v54 = 0;
      if (v33
        && (v56 & 1) != 0
        && _CFURLGetVolumePropertyFlags()
        && ((v55 ^ v54) & 1) == 0
        && matchURLProperty(v37, v45, v11))
      {
        if (v37) {
          CFRetain(v37);
        }
        if (cf != v37)
        {
          if (cf) {
            CFRelease(cf);
          }
          CFTypeRef cf = v37;
        }
        log = resolveLog;
        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          CFTypeRef v59 = v37;
          __int16 v60 = 2112;
          uint64_t v61 = v11;
          __int16 v62 = 2112;
          uint64_t v63 = v17;
          __int16 v64 = 2112;
          uint64_t v65 = v34;
          _os_log_debug_impl(&dword_181761000, log, OS_LOG_TYPE_DEBUG, "matched volume %@ by name=%@ and capacity=%@ and creationDate=%@", buf, 0x2Au);
        }
      }
    }
    ++v35;
  }
  while (Count != v35);
  CFTypeRef v24 = cf;
  CFURLRef v19 = v34;
  uint64_t v32 = a4;
  if (cf)
  {
    uint64_t v50 = v17;
    char v31 = 0;
    if (!a4)
    {
LABEL_87:
      ssize_t v17 = v50;
LABEL_88:
      CFTypeRef cf = 0;
      goto LABEL_89;
    }
LABEL_36:
    if (v24)
    {
      ssize_t v17 = v50;
      if (!*v32) {
        *uint64_t v32 = v31;
      }
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_89:
  if (v19) {
    CFRelease(v19);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v24;
}

void CFNumber::CFNumber(CFNumber *this, CFTypeRef *a2)
{
  if (*a2 && (CFTypeID v4 = CFGetTypeID(*a2), v4 == CFNumberGetTypeID()))
  {
    CFTypeRef v5 = *a2;
    if (v5) {
      CFRetain(v5);
    }
  }
  else
  {
    CFTypeRef v5 = 0;
  }
  *(void *)this = v5;
}

uint64_t volumeSupportsPathFromID(uint64_t result)
{
  if (result)
  {
    CFNumberRef result = _CFURLGetVolumePropertyFlags();
    if (result) {
      return 0;
    }
  }
  return result;
}

uint64_t resolveBookmarkByRelativePathFromFileIDOnGivenVolume(const __CFAllocator *a1, BookmarkData *a2, unsigned int a3, unint64_t a4, const __CFURL *a5, const __CFArray *a6, uint64_t a7, uint64_t a8, unsigned __int8 *a9)
{
  if (a5) {
    _CFURLGetResourcePropertyFlags();
  }
  return 0;
}

void ___ZL25DownloadCloudDocumentSyncPK7__CFURL_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 136315650;
    BOOL v10 = "DownloadCloudDocumentSync";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = a3;
    _os_log_impl(&dword_181761000, v7, OS_LOG_TYPE_INFO, "%s: finished %@, error=%@", (uint8_t *)&v9, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3 == 0;
  (*(void (**)(uint64_t))(a4 + 16))(a4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

__CFDictionary *_FSURLCopyTemporaryPropertiesForKeys(const __CFURL *a1, const __CFArray *a2)
{
  CFTypeID v4 = (const void *)__CFURLResourceInfoPtr();
  CFTypeRef v5 = _FileCacheGetForURL(a1, v4);
  _FileCacheLockTempPermProperties();
  CFMutableDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v5, 0);
  if (TemporaryPropertyDictionary && (CFDictionaryRef v7 = TemporaryPropertyDictionary, Count = CFArrayGetCount(a2), Count >= 1))
  {
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    CFDataRef Mutable = 0;
    uint64_t v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    __int16 v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    do
    {
      CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(a2, v10);
      value = 0;
      if (CFDictionaryGetValueIfPresent(v7, ValueAtIndex, (const void **)&value))
      {
        if (!Mutable)
        {
          CFAllocatorRef v15 = CFGetAllocator(a1);
          CFDataRef Mutable = CFDictionaryCreateMutable(v15, 0, v12, v13);
        }
        CFDictionaryAddValue(Mutable, ValueAtIndex, value);
      }
      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    CFDataRef Mutable = 0;
  }
  CFMutableDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v5, 0);
  if (PermanentPropertyDictionary)
  {
    CFDictionaryRef v17 = PermanentPropertyDictionary;
    CFIndex v18 = CFArrayGetCount(a2);
    if (v18 >= 1)
    {
      CFIndex v19 = v18;
      CFIndex v20 = 0;
      CFURLRef v21 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
      CFIndex v22 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
      do
      {
        CFStringRef v23 = CFArrayGetValueAtIndex(a2, v20);
        value = 0;
        if (CFDictionaryGetValueIfPresent(v17, v23, (const void **)&value))
        {
          if (!Mutable)
          {
            CFAllocatorRef v24 = CFGetAllocator(a1);
            CFDataRef Mutable = CFDictionaryCreateMutable(v24, 0, v21, v22);
          }
          CFDictionaryAddValue(Mutable, v23, value);
        }
        ++v20;
      }
      while (v19 != v20);
    }
  }
  _FileCacheUnlockTempPermProperties();
  return Mutable;
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeysFromCache(const __CFURL *a1, const __CFArray *a2, const void *a3)
{
  return _FSURLCopyResourcePropertiesForKeysInternal(a1, a2, a3, 0, 0);
}

BOOL _FSURLGetCacheAutoFlushingEnabled(const __CFURL *a1, const void *a2)
{
  CFTypeRef v2 = _FileCacheGetForURL(a1, a2);
  _FileCacheLock((uint64_t)v2);
  BOOL AutoFlushingEnabled = _FileCacheGetAutoFlushingEnabled((uint64_t)v2);
  _FileCacheUnlock((uint64_t)v2);
  return AutoFlushingEnabled;
}

uint64_t _FSURLCreateFileReferenceURLFromFSRef()
{
  return 0;
}

uint64_t _FSURLGetFSRef()
{
  return 0;
}

uint64_t _FSURLGetObjectInformationNoIO(const __CFURL *a1, unint64_t *a2, uint64_t *a3, _DWORD *a4)
{
  __endptr[1] = *(char **)MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v8 = (const void *)__CFURLResourceInfoPtr();
  if (!v8)
  {
    uint64_t v11 = 0;
    if (a4) {
      return v11;
    }
LABEL_18:
    if (v11) {
      return v11;
    }
    if (CFURLIsFileReferenceURL(a1))
    {
      CFStringRef v14 = CFURLCopyPath(a1);
      if (v14)
      {
        CFStringRef v15 = v14;
        MEMORY[0x1F4188790](v14);
        bzero(&v22, 0x800uLL);
        if (!CFStringGetCString(v15, (char *)&v22, 2048, 0x8000100u)) {
          goto LABEL_31;
        }
        if (v22 != 0x692F656C69662E2FLL || v23 != 15716) {
          goto LABEL_31;
        }
        __endptr[0] = 0;
        uint64_t v17 = strtoll(&v24, __endptr, 10);
        if (*__endptr[0] != 46) {
          goto LABEL_31;
        }
        uint64_t v18 = v17;
        uint64_t v19 = strtoll(__endptr[0] + 1, __endptr, 10);
        CFIndex v20 = __endptr[0];
        if (*__endptr[0] == 47) {
          CFIndex v20 = __endptr[0] + 1;
        }
        if (!*v20)
        {
          if (a2) {
            *a2 = v18;
          }
          if (a3) {
            *a3 = v19;
          }
          uint64_t v11 = 1;
        }
        else
        {
LABEL_31:
          uint64_t v11 = 0;
        }
        CFRelease(v15);
        return v11;
      }
    }
    return 0;
  }
  CFTypeRef v9 = _FileCacheGetForURL(a1, v8);
  _FileCacheLock((uint64_t)v9);
  uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v9);
  if ((*(unsigned char *)Attributes & 4) != 0)
  {
    if (a2)
    {
      unsigned int v12 = *(_DWORD *)(Attributes + 112);
      if (v12)
      {
        unint64_t v13 = 0;
      }
      else
      {
        unsigned int v12 = *(_DWORD *)(Attributes + 104);
        unint64_t v13 = (unint64_t)*(unsigned int *)(Attributes + 108) << 32;
      }
      *a2 = v13 | v12;
    }
    if (a3) {
      *a3 = *(void *)(Attributes + 120);
    }
    if (a4) {
      *a4 = *(_DWORD *)(Attributes + 16);
    }
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  _FileCacheUnlock((uint64_t)v9);
  if (!a4) {
    goto LABEL_18;
  }
  return v11;
}

uint64_t _FSURLGetCatalogInfo(const __CFURL *a1, int a2, uint64_t a3, unsigned __int16 *a4)
{
  v82[7] = *MEMORY[0x1E4F143B8];
  if (!a1 || (a2 & 0xBFFFFFFF) != 0 && !a3) {
    return 4294967246;
  }
  uint64_t v8 = v76;
  if (a3) {
    CFTypeRef v9 = (_WORD *)a3;
  }
  else {
    CFTypeRef v9 = v76;
  }
  if (a4) {
    unsigned int v10 = a2 & 0x3FFFFFFF | 0x80000000;
  }
  else {
    unsigned int v10 = a2 & 0x3FFFFFFF;
  }
  if (v10)
  {
    v10 &= 0xBFFFFFFE;
    if (a3) {
      uint64_t v8 = (unsigned char *)a3;
    }
    *((_DWORD *)v8 + 36) = 0;
    if ((v10 & 0x2000) == 0)
    {
LABEL_12:
      if ((v10 & 0x200) == 0) {
        goto LABEL_13;
      }
      goto LABEL_58;
    }
  }
  else if ((v10 & 0x2000) == 0)
  {
    goto LABEL_12;
  }
  v10 &= ~0x2000u;
  char v24 = v76;
  if (a3) {
    char v24 = (unsigned char *)a3;
  }
  *((_DWORD *)v24 + 35) = 0;
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_58:
  v10 &= ~0x200u;
  CFDataRef v25 = v76;
  if (a3) {
    CFDataRef v25 = (unsigned char *)a3;
  }
  *((void *)v25 + 6) = 0;
  if ((v10 & 0x10000) != 0)
  {
LABEL_14:
    v10 &= ~0x10000u;
    uint64_t v11 = v76;
    if (a3) {
      uint64_t v11 = (unsigned char *)a3;
    }
    v11[12] = 0;
  }
LABEL_17:
  if ((v10 & 0xFFFDFFFF) != 0)
  {
    unsigned int v12 = (const void *)__CFURLResourceInfoPtr();
    CFTypeRef v13 = _FileCacheGetForURL(a1, v12);
    _FileCacheLock((uint64_t)v13);
    uint64_t Attributes = (_DWORD *)_FileCacheGetAttributes((uint64_t)v13);
    CFStringRef v15 = Attributes;
    int v16 = *Attributes;
    if ((*Attributes & 1) != 0
      && ((v10 & 0x18) == 0 || (v16 & 4) != 0)
      && ((v10 & 0x80000) == 0 || (v16 & 8) != 0)
      && ((v10 & 0x41800) == 0 || (v16 & 0x10) != 0)
      && ((v10 & 0x8000) == 0 || (v16 & 0x20) != 0 || (Attributes[4] & 0xF000) == 0x4000)
      && ((v10 & 0x400000) == 0 || (v16 & 0x80) != 0))
    {
      goto LABEL_40;
    }
    _FileCacheLockTransitionToPreparer((uint64_t)v13);
    if ((a2 & 0x40000000) != 0)
    {
      uint64_t v26 = 4294956641;
      goto LABEL_202;
    }
    if (_FSURLGetCatalogInfo::sOnce != -1) {
      dispatch_once(&_FSURLGetCatalogInfo::sOnce, &__block_literal_global_11);
    }
    int v17 = _ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable;
    uint64_t v18 = (int *)(_FSURLGetCatalogInfo::maskToPropertyTable + 24);
    do
    {
      int v19 = *v18;
      v18 += 6;
    }
    while (v19);
    memset(v75, 0, sizeof(v75));
    CFIndex v20 = (_DWORD *)(_FSURLGetCatalogInfo::maskToPropertyTable + 24);
    do
    {
      if ((v17 & v10 & 0xFFFDFFFF) != 0) {
        addPropertyAndDependenciesToBitmap(*((void *)v20 - 1), (uint64_t)v75);
      }
      int v21 = *v20;
      v20 += 6;
      int v17 = v21;
    }
    while (v21);
    CFTypeID v74 = 0;
    int v22 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v13, (uint64_t)v75, (uint64_t)&v74);
    _FileCacheLockTransitionFromPreparer((uint64_t)v13);
    if (v22)
    {
LABEL_40:
      if ((v10 & 2) != 0)
      {
        __int16 v23 = (v15[5] & 0x20002) != 0;
        *CFTypeRef v9 = v23;
        if ((v15[4] & 0xF000) == 0x4000)
        {
          v23 |= 0x10u;
          *CFTypeRef v9 = v23;
        }
        if (v15[6] >= 2u)
        {
          v23 |= 0x100u;
          *CFTypeRef v9 = v23;
        }
        if ((*((unsigned char *)v15 + 1) & 0x40) != 0) {
          *CFTypeRef v9 = v23 | 0x100;
        }
      }
      if ((v10 & 4) != 0)
      {
        CFAllocatorRef v30 = v76;
        if (a3) {
          CFAllocatorRef v30 = (unsigned char *)a3;
        }
        *((_WORD *)v30 + 1) = -100;
        if ((v10 & 0x10) == 0)
        {
LABEL_49:
          if ((v10 & 8) == 0) {
            goto LABEL_50;
          }
          goto LABEL_72;
        }
      }
      else if ((v10 & 0x10) == 0)
      {
        goto LABEL_49;
      }
      char v31 = v76;
      if (a3) {
        char v31 = (unsigned char *)a3;
      }
      *((_DWORD *)v31 + 2) = *((void *)v15 + 16);
      if ((v10 & 8) == 0)
      {
LABEL_50:
        if ((v10 & 0x20) == 0) {
          goto LABEL_84;
        }
LABEL_78:
        double v34 = *((double *)v15 + 10);
        if (v34 == -1.0 - *MEMORY[0x1E4F1CF68] || v34 == -*MEMORY[0x1E4F1CF78])
        {
          CFURLRef v37 = v76;
          if (a3) {
            CFURLRef v37 = (unsigned char *)a3;
          }
          *((void *)v37 + 2) = 0;
          if ((v10 & 0x40) == 0) {
            goto LABEL_94;
          }
          goto LABEL_89;
        }
        if (a3) {
          CFIndex v35 = (int *)(a3 + 16);
        }
        else {
          CFIndex v35 = &v77;
        }
        uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v35, v34);
        if (v36) {
          goto LABEL_109;
        }
LABEL_84:
        if ((v10 & 0x40) == 0) {
          goto LABEL_94;
        }
LABEL_89:
        double v38 = *((double *)v15 + 8);
        CFStringRef v39 = v76;
        if (a3)
        {
          CFStringRef v39 = (unsigned char *)a3;
          uint64_t v40 = (int *)(a3 + 24);
        }
        else
        {
          uint64_t v40 = &v78;
        }
        if (v38 == -*MEMORY[0x1E4F1CF78])
        {
          *((void *)v39 + 3) = 0;
          if ((v10 & 0x80) == 0) {
            goto LABEL_103;
          }
          goto LABEL_95;
        }
        uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v40, v38);
        if (v36)
        {
LABEL_109:
          uint64_t v26 = v36;
          goto LABEL_202;
        }
LABEL_94:
        if ((v10 & 0x80) == 0) {
          goto LABEL_103;
        }
LABEL_95:
        double v41 = *((double *)v15 + 9);
        uint64_t v42 = v76;
        if (a3)
        {
          uint64_t v42 = (unsigned char *)a3;
          uint64_t v43 = (int *)(a3 + 32);
        }
        else
        {
          uint64_t v43 = &v79;
        }
        if (v41 == -*MEMORY[0x1E4F1CF78])
        {
          *((void *)v42 + 4) = 0;
          if ((v10 & 0x100) == 0) {
            goto LABEL_113;
          }
          goto LABEL_104;
        }
        uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v43, v41);
        if (v36) {
          goto LABEL_109;
        }
LABEL_103:
        if ((v10 & 0x100) == 0) {
          goto LABEL_113;
        }
LABEL_104:
        double v44 = *((double *)v15 + 7);
        CFStringRef v45 = v76;
        if (a3)
        {
          CFStringRef v45 = (unsigned char *)a3;
          unsigned int v46 = (int *)(a3 + 40);
        }
        else
        {
          unsigned int v46 = &v80;
        }
        if (v44 == -*MEMORY[0x1E4F1CF78])
        {
          *((void *)v45 + 5) = 0;
        }
        else
        {
          uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v46, v44);
          if (v36) {
            goto LABEL_109;
          }
        }
LABEL_113:
        if ((v10 & 0x400) != 0)
        {
          uint64_t v47 = v76;
          if (a3) {
            uint64_t v47 = (unsigned char *)a3;
          }
          *((_DWORD *)v47 + 14) = v15[10];
          *((_DWORD *)v47 + 15) = v15[11];
          *((_WORD *)v47 + 33) = v15[4];
        }
        if ((v10 & 0x400000) != 0)
        {
          if ((*(unsigned char *)v15 & 0x80) != 0)
          {
            CFAllocatorRef v49 = CFGetAllocator(a1);
            CFFileSecurityRef Copy = CFFileSecurityCreateCopy(v49, *((CFFileSecurityRef *)v15 + 28));
          }
          else
          {
            CFFileSecurityRef Copy = 0;
          }
          uint64_t v50 = v76;
          if (a3) {
            uint64_t v50 = (unsigned char *)a3;
          }
          *(void *)(v50 + 68) = Copy;
        }
        if ((v10 & 0x41800) != 0)
        {
          if ((*v15 & 0x4000010) == 0x10)
          {
            uint64_t v51 = v81;
            if (a3) {
              uint64_t v51 = (_OWORD *)(a3 + 76);
            }
            *uint64_t v51 = *((_OWORD *)v15 + 10);
            uint64_t v52 = v82;
            if (a3) {
              uint64_t v52 = (_OWORD *)(a3 + 92);
            }
            *uint64_t v52 = *((_OWORD *)v15 + 11);
          }
          else
          {
            uint64_t v53 = v81;
            if (a3) {
              uint64_t v53 = (void *)(a3 + 76);
            }
            *uint64_t v53 = 0;
            v53[1] = 0;
            CFTypeRef v54 = v82;
            if (a3) {
              CFTypeRef v54 = (void *)(a3 + 92);
            }
            *CFTypeRef v54 = 0;
            v54[1] = 0;
          }
          if ((v15[4] & 0xF000) == 0xA000)
          {
            if (a3) {
              int v55 = (unsigned char *)a3;
            }
            else {
              int v55 = v76;
            }
            *(void *)(v55 + 76) = 0x72686170736C6E6BLL;
            *((_WORD *)v55 + 42) = *((_WORD *)v55 + 42) & 0x4000 | 0x8000;
            uint64_t v56 = v82;
            if (a3) {
              uint64_t v56 = (void *)(a3 + 92);
            }
            *uint64_t v56 = 0;
            v56[1] = 0;
          }
        }
        if ((v15[4] & 0xF000) == 0x4000)
        {
          uint64_t v57 = v76;
          if (a3) {
            uint64_t v57 = (unsigned char *)a3;
          }
          *(void *)(v57 + 132) = 0;
          *(void *)(v57 + 124) = 0;
          *(void *)(v57 + 116) = 0;
          *(void *)(v57 + 108) = 0;
          if ((v10 & 0x80000) == 0) {
            goto LABEL_163;
          }
          goto LABEL_151;
        }
        if ((v10 & 0x4000) != 0)
        {
          uint64_t v61 = v76;
          if (a3) {
            uint64_t v61 = (unsigned char *)a3;
          }
          *(void *)(v61 + 108) = *((void *)v15 + 26);
          *(void *)(v61 + 116) = *((void *)v15 + 27);
          if ((v10 & 0x8000) == 0)
          {
LABEL_150:
            if ((v10 & 0x80000) == 0) {
              goto LABEL_163;
            }
            goto LABEL_151;
          }
        }
        else if ((v10 & 0x8000) == 0)
        {
          goto LABEL_150;
        }
        __int16 v62 = v76;
        if (a3) {
          __int16 v62 = (unsigned char *)a3;
        }
        *(void *)(v62 + 124) = *((void *)v15 + 24);
        *(void *)(v62 + 132) = *((void *)v15 + 25);
        if ((v10 & 0x80000) == 0)
        {
LABEL_163:
          uint64_t v26 = 0;
          if (a4 && (v10 & 0x80000000) != 0)
          {
            if ((*((unsigned char *)v15 + 1) & 0x20) != 0)
            {
              *(void *)CFStringRef v75 = 0;
              uint64_t v63 = MountInfoStorageSize();
              uint64_t v64 = MEMORY[0x1F4188790](v63);
              if (MountInfoPrepare(v75, v15[28], 0, (char *)&v73 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0))
              {
                uint64_t VolumeName = MountInfoGetVolumeName(*(uint64_t *)v75);
                if (VolumeName)
                {
                  uint64_t v66 = (const char *)VolumeName;
                  CFAllocatorRef v67 = CFGetAllocator(a1);
                  CFStringRef v68 = CFStringCreateWithCString(v67, v66, 0x8000100u);
                }
                else
                {
                  CFStringRef v68 = 0;
                }
                MountInfoDestroy(*(void *)v75);
                if (v68) {
                  goto LABEL_175;
                }
              }
            }
            CFStringRef v68 = (const __CFString *)*((void *)v15 + 1);
            if (v68)
            {
LABEL_175:
              uint64_t Length = CFStringGetLength(v68);
              if (Length < 256)
              {
                v83.CFURLRef length = Length;
                *a4 = Length;
                v83.CFIndex location = 0;
                CFStringGetCharacters(v68, v83, a4 + 1);
                if (v68 != *((const __CFString **)v15 + 1)) {
                  CFRelease(v68);
                }
                uint64_t v70 = *a4;
                if (*a4)
                {
                  CFStringRef v71 = a4 + 1;
                  do
                  {
                    if (*v71 == 58) {
                      *CFStringRef v71 = 47;
                    }
                    ++v71;
                    --v70;
                  }
                  while (v70);
                }
                uint64_t v26 = 0;
                goto LABEL_202;
              }
              if (v68 != *((const __CFString **)v15 + 1)) {
                CFRelease(v68);
              }
            }
            uint64_t v26 = 4294967259;
          }
LABEL_202:
          _FileCacheUnlock((uint64_t)v13);
          return v26;
        }
LABEL_151:
        uint64_t v58 = v76;
        if (a3) {
          uint64_t v58 = (unsigned char *)a3;
        }
        v58[65] = 0;
        int v59 = (*v15 >> 23) & 1;
        v58[65] = (*v15 & 0x800000) != 0;
        int v60 = *v15;
        if ((*v15 & 0x1000000) != 0)
        {
          LOBYTE(v59) = v59 | 2;
          v58[65] = v59;
          int v60 = *v15;
        }
        if ((v60 & 0x2000000) != 0) {
          v58[65] = v59 | 4;
        }
        goto LABEL_163;
      }
LABEL_72:
      if (*((void *)v15 + 16) == 2) {
        int v32 = 1;
      }
      else {
        int v32 = v15[34];
      }
      BOOL v33 = v76;
      if (a3) {
        BOOL v33 = (unsigned char *)a3;
      }
      *((_DWORD *)v33 + 1) = v32;
      if ((v10 & 0x20) == 0) {
        goto LABEL_84;
      }
      goto LABEL_78;
    }
    CFIndex v27 = v74;
    if (!v74)
    {
      uint64_t v26 = 4294967260;
      goto LABEL_202;
    }
    CFErrorDomain Domain = CFErrorGetDomain(v74);
    CFIndex Code = CFErrorGetCode(v27);
    if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E4F1D158]))
    {
      uint64_t v26 = Code;
    }
    else if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E4F1D160]))
    {
      uint64_t v26 = PosixToOSStatusTranslate(Code);
    }
    else
    {
      if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E4F1D148]))
      {
        if (Code <= 512)
        {
          uint64_t v26 = 4294967253;
          switch(Code)
          {
            case 257:
              goto LABEL_197;
            case 258:
              goto LABEL_193;
            case 259:
            case 261:
            case 262:
              goto LABEL_189;
            case 260:
              goto LABEL_201;
            case 263:
              uint64_t v26 = 4294965987;
              break;
            default:
              if (Code != 4) {
                goto LABEL_189;
              }
              break;
          }
          goto LABEL_201;
        }
        if (Code > 639)
        {
          if (Code == 640)
          {
            uint64_t v26 = 4294967262;
            goto LABEL_201;
          }
          if (Code == 642)
          {
            uint64_t v26 = 4294967235;
            goto LABEL_201;
          }
        }
        else
        {
          if (Code == 513)
          {
LABEL_197:
            uint64_t v26 = 4294962296;
            goto LABEL_201;
          }
          if (Code == 514)
          {
LABEL_193:
            uint64_t v26 = 4294967259;
            goto LABEL_201;
          }
        }
      }
      else
      {
        CFEqual(Domain, (CFTypeRef)*MEMORY[0x1E4F1D150]);
      }
LABEL_189:
      uint64_t v26 = 4294967260;
    }
LABEL_201:
    CFRelease(v74);
    goto LABEL_202;
  }
  return 0;
}

CFURLRef _FSCreateFileReferenceURLFromIDs(const __CFAllocator *a1, int a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  uint64_t v6 = MountInfoStorageSize();
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  if (!MountInfoPrepare(v11, 0, a2, (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 0, 0)) {
    return 0;
  }
  if ((MountInfoGetCapabilities(v11[0]) & 0x8000000000000) != 0)
  {
    unsigned int MountID = MountInfoGetMountID(v11[0]);
    CFURLRef FileReferenceURLRef = createFileReferenceURLRef(a1, MountID, 0, a3, 0, 0);
  }
  else
  {
    CFURLRef FileReferenceURLRef = 0;
  }
  MountInfoDestroy(v11[0]);
  return FileReferenceURLRef;
}

CFURLRef createFileReferenceURLRef(const __CFAllocator *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef theString, Boolean a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  if (!theString)
  {
    if (snprintf(v23, 0x400uLL, "/.file/id=%lld.%lld", a2, a4) <= 0x3FF)
    {
      size_t v20 = strlen(v23);
      return CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)v23, v20, a6);
    }
    return 0;
  }
  if (!CFStringGetCString(theString, v22, 1024, 0x8000100u)) {
    return 0;
  }
  size_t v10 = strlen(v22);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  CFTypeRef v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  CFStringRef v14 = (char *)v13;
  if (v11 >= 1)
  {
    CFStringRef v15 = v22;
    CFStringRef v14 = (char *)v13;
    do
    {
      unint64_t v16 = *v15;
      BOOL v17 = (v16 - 34) > 0x3E || ((1 << (v16 - 34)) & 0x5A0000003600000BLL) == 0;
      if (v17 && (v16 - 123) >= 3 && (v16 - 127) > 0xFFFFFFA1)
      {
        *v14++ = v16;
      }
      else
      {
        *CFStringRef v14 = 37;
        v14[1] = createFileReferenceURLRef(__CFAllocator const*,unsigned long long,unsigned long long,unsigned long long,__CFString const*,unsigned char)::hexchars[v16 >> 4];
        v14[2] = createFileReferenceURLRef(__CFAllocator const*,unsigned long long,unsigned long long,unsigned long long,__CFString const*,unsigned char)::hexchars[v16 & 0xF];
        v14 += 3;
      }
      ++v15;
      --v11;
    }
    while (v11);
  }
  *CFStringRef v14 = 0;
  if (snprintf(v23, 0x400uLL, "/.file/id=%lld.%lld/%s", a2, a3, v13) > 0x3FF) {
    return 0;
  }
  size_t v18 = strlen(v23);
  return CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)v23, v18, a6);
}

CFURLRef _CFURLCreateWithVolumeURLAndResourceID(const __CFAllocator *a1, CFURLRef url, const __CFNumber *a3)
{
  CFURLRef v3 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (url && a3)
  {
    CFNumberRef propertyValueTypeRefPtr = 0;
    CFURLRef v3 = 0;
    if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E4F1CEF8], &propertyValueTypeRefPtr, 0)
      && propertyValueTypeRefPtr != 0)
    {
      uint64_t valuePtr = 0;
      CFURLRef v3 = 0;
      if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberSInt64Type, &valuePtr))
      {
        if (valuePtr)
        {
          unint64_t v11 = 0;
          CFURLRef v3 = 0;
          if (CFNumberGetValue(a3, kCFNumberSInt64Type, &v11))
          {
            if (v11)
            {
              if (getFileSystemPathForFileID(valuePtr, v11, cStr, (char *)0x400)
                && !lstat(cStr, &v10)
                && (CFStringRef v8 = CFStringCreateWithCString(a1, cStr, 0x8000100u)) != 0)
              {
                CFStringRef v9 = v8;
                CFURLRef v3 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, (v10.st_mode & 0xF000) == 0x4000);
                CFRelease(v9);
              }
              else
              {
                CFURLRef v3 = 0;
              }
            }
          }
        }
      }
      CFRelease(propertyValueTypeRefPtr);
    }
  }
  return v3;
}

CFURLRef _FSURLCreateWithPathAndAttributes(const __CFAllocator *a1, unsigned __int8 *a2, size_t a3, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, unsigned __int8 a8, char a9, char a10, char a11, int a12, void **a13, __CFError **a14)
{
  return __FSURLCreateWithPathAndAttributes(a1, a2, a3, a4, a5, a6, a7, (void *)1, a8, a9, a10, a12, a13, a14);
}

const attrlist *_FSURLCalculateAttributeBufferSize(const attrlist *result)
{
  if (result) {
    return (const attrlist *)calculateAttributeBufferSize(result, 0);
  }
  return result;
}

void _FSURLCacheCheapVolumeInformation(const __CFURL *a1, int a2, uint64_t a3)
{
  uint64_t v6 = (const void *)__CFURLResourceInfoPtr();
  if (v6)
  {
    CFTypeRef v7 = _FileCacheGetForURL(a1, v6);
    _FileCacheLock((uint64_t)v7);
    uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v7);
    if ((*(unsigned char *)Attributes & 2) != 0 && *(_DWORD *)(Attributes + 104) == a2 && !_FileCacheGetVolumeInfo((uint64_t)v7))
    {
      _FileCacheLockTransitionToPreparer((uint64_t)v7);
      prepareCheapVolumeInformation(a1, (uint64_t)v7, a3);
      _FileCacheLockTransitionFromPreparer((uint64_t)v7);
    }
    _FileCacheUnlock((uint64_t)v7);
  }
}

void _FSURLCacheCheapVolumeInformationForVolume(const __CFURL *a1, uint64_t a2)
{
  CFTypeID v4 = (const void *)__CFURLResourceInfoPtr();
  CFTypeRef v5 = _FileCacheGetForURL(a1, v4);
  _FileCacheLock((uint64_t)v5);
  uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v5);
  if ((*(unsigned char *)Attributes & 2) == 0)
  {
    CFTypeRef v7 = (_DWORD *)Attributes;
    *(void *)(Attributes + 104) = MountInfoGetFSID(a2);
    v7[28] = MountInfoGetMountID(a2);
    *v7 |= 2u;
  }
  if (!_FileCacheGetVolumeInfo((uint64_t)v5))
  {
    _FileCacheLockTransitionToPreparer((uint64_t)v5);
    prepareCheapVolumeInformation(a1, (uint64_t)v5, a2);
    _FileCacheLockTransitionFromPreparer((uint64_t)v5);
  }
  _FileCacheUnlock((uint64_t)v5);
}

uint64_t _FSURLCacheResourcePropertyForKey(const __CFURL *a1, const void *a2, CFTypeRef cf, CFErrorRef *a4)
{
  CFTypeRef v7 = _FileCacheGetForURL(a1, cf);
  _FileCacheLock((uint64_t)v7);
  Boolean Value = CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, a2);
  if (Value)
  {
    memset(v11, 0, 60);
    addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v11);
    _FileCacheLockTransitionToPreparer((uint64_t)v7);
    uint64_t v9 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v7, (uint64_t)v11, (uint64_t)a4);
    _FileCacheLockTransitionFromPreparer((uint64_t)v7);
  }
  else
  {
    uint64_t v9 = 1;
  }
  _FileCacheUnlock((uint64_t)v7);
  if (a4 && !v9 && !*a4)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCacheResourcePropertyForKey_cold_1();
    }
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
  return v9;
}

__CFArray *_FileURLCreateDisplayPathComponentsArray(const void *a1, __CFError **a2)
{
  CFAllocatorRef v4 = CFGetAllocator(a1);
  CFTypeRef v5 = CFRetain(a1);
  CFDataRef Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D6E8];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D840];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D740];
    while (1)
    {
      CFNumberRef propertyValueTypeRefPtr = 0;
      unsigned __int8 v12 = 0;
      CFArrayAppendValue(Mutable, v5);
      if (!GetBooleanPropertyValue((const __CFURL *)v5, v7, &v12, a2)) {
        break;
      }
      if (v12)
      {
        unsigned __int8 v11 = 0;
        if (!GetBooleanPropertyValue((const __CFURL *)v5, v8, &v11, a2)) {
          break;
        }
        if (!v11) {
          goto LABEL_13;
        }
      }
      if (!CFURLCopyResourcePropertyForKey((CFURLRef)v5, v9, &propertyValueTypeRefPtr, a2)) {
        break;
      }
      if (!propertyValueTypeRefPtr) {
        goto LABEL_13;
      }
      CFRelease(v5);
      CFTypeRef v5 = propertyValueTypeRefPtr;
    }
    if (v5) {
      CFRelease(v5);
    }
    CFRelease(Mutable);
    if (a2 && !*a2)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FileURLCreateDisplayPathComponentsArray_cold_2();
      }
      goto LABEL_21;
    }
    return 0;
  }
  if (a2) {
    *a2 = _FSURLCreateStandardError(v4, (const __CFString *)*MEMORY[0x1E4F1D160], 12, 0, 0, 0);
  }
LABEL_13:
  if (v5) {
    CFRelease(v5);
  }
  if (a2 && !Mutable)
  {
    if (!*a2)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FileURLCreateDisplayPathComponentsArray_cold_1();
      }
LABEL_21:
      CFDataRef Mutable = 0;
      *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
      return Mutable;
    }
    return 0;
  }
  return Mutable;
}

uint64_t GetBooleanPropertyValue(const __CFURL *a1, const __CFString *a2, unsigned __int8 *a3, __CFError **a4)
{
  CFBooleanRef propertyValueTypeRefPtr = 0;
  uint64_t result = CFURLCopyResourcePropertyForKey(a1, a2, &propertyValueTypeRefPtr, a4);
  if (result)
  {
    if (propertyValueTypeRefPtr)
    {
      *a3 = valueOfBoolean(propertyValueTypeRefPtr);
      CFRelease(propertyValueTypeRefPtr);
    }
    else
    {
      *a3 = 0;
    }
    return 1;
  }
  return result;
}

CFDataRef _FSURLNoteSecurityScopedResourceMoved(SandboxExtensionCache *a1, const __CFURL *a2)
{
  CFAllocatorRef v4 = (os_unfair_lock_s *)SandboxExtensionCache::shared(a1);
  CFDataRef result = SandboxExtensionCache::move(v4, a1, a2, 0, 0);
  if (result)
  {
    uint64_t v6 = result;
    _FSURLSetPermanentResourcePropertyForKey(a2, @"_NSURLSecuritySandboxExtensionKey", result);
    CFRelease(v6);
    return (CFDataRef)1;
  }
  return result;
}

CFDataRef _FSURLNoteSecurityScopedResourceMovedWithFileIdentifier(SandboxExtensionCache *a1, const __CFURL *a2, fsid a3, uint64_t a4)
{
  fsid v10 = a3;
  CFStringRef v7 = (os_unfair_lock_s *)SandboxExtensionCache::shared(a1);
  CFDataRef result = SandboxExtensionCache::move(v7, a1, a2, &v10, a4);
  if (result)
  {
    CFStringRef v9 = result;
    _FSURLSetPermanentResourcePropertyForKey(a2, @"_NSURLSecuritySandboxExtensionKey", result);
    CFRelease(v9);
    return (CFDataRef)1;
  }
  return result;
}

uint64_t createIsSystemAppendValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x40000) == 0) {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserAppendValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 4) == 0) {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createFileSecurityValue(uint64_t a1, uint64_t a2, CFFileSecurityRef *a3)
{
  if ((*(unsigned char *)a2 & 0x80) == 0) {
    return 0;
  }
  CFAllocatorRef v6 = CFGetAllocator(*(CFTypeRef *)(a2 + 224));
  *a3 = CFFileSecurityCreateCopy(v6, *(CFFileSecurityRef *)(a2 + 224));
  return 1;
}

uint64_t createContentAccessDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 56));
  return 1;
}

uint64_t createTotalFileSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    if ((*(unsigned char *)a2 & 0x40) != 0)
    {
      CFAllocatorRef v5 = CFGetAllocator(a1);
      CFAllocatorRef v6 = (uint64_t *)(a2 + 208);
      goto LABEL_9;
    }
    return 0;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((~*(_DWORD *)a2 & 0x60) == 0)
    {
      uint64_t v8 = *(void *)(a2 + 192) + *(void *)(a2 + 208);
      CFAllocatorRef v5 = CFGetAllocator(a1);
      CFAllocatorRef v6 = &v8;
LABEL_9:
      *a3 = CFNumberCreate(v5, kCFNumberSInt64Type, v6);
      return 1;
    }
    return 0;
  }
  *a3 = 0;
  return 1;
}

uint64_t createTotalFileAllocatedSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    if ((*(unsigned char *)a2 & 0x40) != 0)
    {
      CFAllocatorRef v6 = CFGetAllocator(a1);
      uint64_t valuePtr = *(void *)(a2 + 216);
      goto LABEL_9;
    }
    return 0;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((~*(_DWORD *)a2 & 0x60) == 0)
    {
      uint64_t v5 = *(void *)(a2 + 200) + *(void *)(a2 + 216);
      CFAllocatorRef v6 = CFGetAllocator(a1);
      uint64_t valuePtr = v5;
LABEL_9:
      CFNumberRef v8 = CFNumberCreate(v6, kCFNumberSInt64Type, &valuePtr);
      goto LABEL_10;
    }
    return 0;
  }
  CFNumberRef v8 = 0;
LABEL_10:
  *a3 = v8;
  return 1;
}

uint64_t createFileResourceIdentifierValue(const void *a1, uint64_t a2, CFDataRef *a3)
{
  if ((*(unsigned char *)a2 & 4) == 0) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 112)) {
    uint64_t v5 = *(unsigned int *)(a2 + 112);
  }
  else {
    uint64_t v5 = *(void *)(a2 + 104);
  }
  v7[0] = *(void *)(a2 + 120);
  v7[1] = v5;
  CFAllocatorRef v6 = CFGetAllocator(a1);
  *a3 = CFDataCreate(v6, (const UInt8 *)v7, 16);
  return 1;
}

uint64_t createPreferredIOBlockSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if (*(_DWORD *)(a2 + 96))
  {
    CFAllocatorRef v5 = CFGetAllocator(a1);
    uint64_t valuePtr = *(unsigned int *)(a2 + 96);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  }
  else
  {
    CFNumberRef v6 = 0;
  }
  *a3 = v6;
  return 1;
}

uint64_t createFileContentIdentifierValue(uint64_t a1, unsigned char *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0;
  }
  if (*((void *)a2 + 18)) {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, a2 + 144);
  }
  else {
    CFNumberRef v5 = 0;
  }
  *a3 = v5;
  return 1;
}

uint64_t createMayShareFileContentValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFD0];
    if ((*(unsigned char *)(a2 + 152) & 1) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v4 = *v5;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createMayHaveExtendedAttributesValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFC8];
    if ((*(unsigned char *)(a2 + 152) & 2) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFD0];
    }
    uint64_t v4 = *v5;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createIsPurgeableValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFD0];
    if ((*(unsigned char *)(a2 + 152) & 8) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v4 = *v5;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createIsSparseValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFD0];
    if ((*(unsigned char *)(a2 + 152) & 0x10) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v4 = *v5;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a3 = v4;
  return 1;
}

uint64_t createDirectoryEntryCountValue(uint64_t a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(unsigned char *)(a2 + 1) & 4) == 0) {
    return 0;
  }
  uint64_t valuePtr = *(unsigned int *)(a2 + 28);
  *a3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  return 2;
}

uint64_t createFaultLogicalFileIsHiddenValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 0x1000) != 0 || (*(unsigned char *)(a2 + 21) & 0x80) != 0)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else
  {
    if ((*(_DWORD *)a2 & 0x10) == 0) {
      return 0;
    }
    uint64_t v4 = (void *)MEMORY[0x1E4F1CFD0];
    if ((*(_WORD *)(a2 + 168) & 0x4000) == 0) {
      uint64_t v4 = (void *)MEMORY[0x1E4F1CFC8];
    }
  }
  *a3 = *v4;
  return 1;
}

uint64_t createNameExtensionValue(CFTypeRef cf, uint64_t a2, CFStringRef *a3)
{
  if ((*(unsigned char *)(a2 + 3) & 8) == 0 && *(void *)(a2 + 8))
  {
    _CFGetPathExtensionRangesFromPathComponent();
    if (v12 == -1) {
      __int16 v6 = 0;
    }
    else {
      __int16 v6 = v13;
    }
    *(_WORD *)(a2 + 4) = v6;
    *(_DWORD *)a2 |= 0x8000000u;
  }
  if (*(void *)(a2 + 8) && *(_WORD *)(a2 + 4))
  {
    CFAllocatorRef v7 = CFGetAllocator(cf);
    CFStringRef v8 = *(const __CFString **)(a2 + 8);
    CFIndex Length = CFStringGetLength(v8);
    v14.CFURLRef length = *(unsigned __int16 *)(a2 + 4);
    v14.CFIndex location = Length - v14.length;
    CFStringRef v10 = CFStringCreateWithSubstring(v7, v8, v14);
  }
  else
  {
    CFStringRef v10 = 0;
  }
  *a3 = v10;
  return 1;
}

uint64_t createIsUserNoDumpValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 1) == 0) {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserOpaqueValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 8) == 0) {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserTrackedValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x40) == 0) {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsUserDataVaultValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x80) == 0) {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createIsSystemArchivedValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFURLRef v3 = (void *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)(a2 + 20) & 0x10000) == 0) {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CFC8];
  }
  *a3 = *v3;
  return 1;
}

uint64_t createOwnerIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 40));
  return 1;
}

uint64_t createGroupIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 44));
  return 1;
}

uint64_t createStatModeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFAllocatorRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 16));
  return 1;
}

uint64_t createGenerationCountValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  uint64_t v4 = (const void *)(a2 + 32);
  if (*(_DWORD *)(a2 + 32))
  {
    CFAllocatorRef v5 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }
  else
  {
    CFNumberRef v6 = 0;
  }
  *a3 = v6;
  return 1;
}

BOOL corePropertyProviderSetValues(const __CFString *a1, uint64_t a2, CFTypeRef *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  uint64_t Attributes = _FileCacheGetAttributes(a2);
  *(_OWORD *)&v223.bitmapcount = xmmword_1817912A0;
  *(void *)&v223.attrgroup_t fileattr = 0;
  *(_OWORD *)&v222.bitmapcount = xmmword_1817912A0;
  *(void *)&v222.attrgroup_t fileattr = 0;
  acl_t v221 = 0;
  long long v219 = 0u;
  long long v220 = 0u;
  uint64_t v218 = 0;
  uint64_t v15 = MountInfoStorageSize();
  unint64_t v16 = (char *)&v158 - ((MEMORY[0x1F4188790](v15) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)v225, 1024))
  {
    if (!a8) {
      return 0;
    }
    CFAllocatorRef v29 = CFGetAllocator(a1);
    CFErrorRef v30 = _FSURLCreateStandardError(v29, (const __CFString *)*MEMORY[0x1E4F1D148], 4, 1, a1, 0);
    BOOL v31 = 0;
    *a8 = v30;
    return v31;
  }
  uint64_t v201 = Attributes;
  CFURLRef v182 = v16;
  uint64_t v180 = a2;
  CFStringRef v192 = a1;
  v199 = a8;
  v190 = &v158;
  uint64_t v185 = a6;
  if (a6 >= 1)
  {
    CFStringRef v18 = 0;
    CFStringRef v19 = 0;
    CFStringRef v210 = 0;
    CFBooleanRef v211 = 0;
    CFStringRef v191 = 0;
    CFStringRef v193 = 0;
    CFBooleanRef v194 = 0;
    CFDataRef v214 = 0;
    CFBooleanRef v215 = 0;
    CFStringRef v216 = 0;
    int v186 = 0;
    BOOL v183 = 0;
    CFFileSecurityRef v208 = 0;
    CFBooleanRef v209 = 0;
    CFBooleanRef v206 = 0;
    CFNumberRef v207 = 0;
    CFBooleanRef v195 = 0;
    CFBooleanRef v196 = 0;
    CFBooleanRef v197 = 0;
    CFBooleanRef v198 = 0;
    CFBooleanRef v204 = 0;
    CFBooleanRef v205 = 0;
    CFBooleanRef v202 = 0;
    CFBooleanRef v203 = 0;
    CFBooleanRef v200 = 0;
    uint64_t v213 = 0;
    size_t v20 = (const void *)*MEMORY[0x1E4F1D738];
    int v21 = (const void *)*MEMORY[0x1E4F1D5A0];
    CFTypeRef v212 = (CFTypeRef)*MEMORY[0x1E4F1D598];
    CFTypeRef v189 = (CFTypeRef)*MEMORY[0x1E4F1D590];
    *(void *)&long long v17 = 138412546;
    long long v166 = v17;
    CFTypeRef v188 = (CFTypeRef)*MEMORY[0x1E4F1D550];
    CFTypeRef v187 = (CFTypeRef)*MEMORY[0x1E4F1CDE0];
    CFTypeRef v184 = (CFTypeRef)*MEMORY[0x1E4F1D690];
    CFTypeRef v181 = (CFTypeRef)*MEMORY[0x1E4F1D668];
    CFTypeRef v179 = (CFTypeRef)*MEMORY[0x1E4F1D660];
    CFTypeRef v178 = (CFTypeRef)*MEMORY[0x1E4F1D700];
    CFTypeRef v177 = (CFTypeRef)*MEMORY[0x1E4F1CE68];
    CFTypeRef v176 = (CFTypeRef)*MEMORY[0x1E4F1D6E0];
    CFTypeRef v175 = (CFTypeRef)*MEMORY[0x1E4F1CE58];
    CFTypeRef v174 = (CFTypeRef)*MEMORY[0x1E4F1CE70];
    CFTypeRef v173 = (CFTypeRef)*MEMORY[0x1E4F1CE08];
    CFTypeRef v172 = (CFTypeRef)*MEMORY[0x1E4F1CE78];
    CFTypeRef v171 = (CFTypeRef)*MEMORY[0x1E4F1CE60];
    CFTypeRef v170 = (CFTypeRef)*MEMORY[0x1E4F1CE38];
    CFTypeRef v169 = (CFTypeRef)*MEMORY[0x1E4F1D6D0];
    CFTypeRef v168 = (CFTypeRef)*MEMORY[0x1E4F1CE30];
    CFTypeRef v167 = (CFTypeRef)*MEMORY[0x1E4F1CE28];
    CFTypeRef v165 = (CFTypeRef)*MEMORY[0x1E4F1CE50];
    CFTypeRef v164 = (CFTypeRef)*MEMORY[0x1E4F1D638];
    CFTypeRef v163 = (CFTypeRef)*MEMORY[0x1E4F1D5F8];
    CFTypeRef v162 = (CFTypeRef)*MEMORY[0x1E4F1D600];
    CFTypeRef v161 = (CFTypeRef)*MEMORY[0x1E4F1D5E0];
    CFTypeRef v160 = (CFTypeRef)*MEMORY[0x1E4F1D5E8];
    CFTypeRef v159 = (CFTypeRef)*MEMORY[0x1E4F1D5F0];
    uint64_t v22 = a6;
    while (1)
    {
      CFTypeRef v23 = *a3;
      CFStringRef v24 = (const __CFString *)*a4;
      if (CFEqual(*a3, v20))
      {
        CFStringRef v18 = v24;
      }
      else if (CFEqual(v23, v21))
      {
        v223.commonattr |= 0x200u;
        CFStringRef v19 = v24;
      }
      else if (CFEqual(v23, v212))
      {
        v223.commonattr |= 0x400u;
        CFStringRef v210 = v24;
      }
      else if (CFEqual(v23, v189))
      {
        v223.commonattr |= 0x1000u;
        CFStringRef v191 = v24;
      }
      else if (CFEqual(v23, v188))
      {
        v223.commonattr |= 0x10000000u;
        CFStringRef v193 = v24;
      }
      else if (CFEqual(v23, v187))
      {
        v223.commonattr |= 0x4000u;
        CFDataRef v214 = (CFDataRef)v24;
      }
      else if (CFEqual(v23, v184))
      {
        int v186 = valueOfBoolean((const __CFBoolean *)v24);
        if (v186) {
          BOOL v25 = (~*(_DWORD *)v201 & 0x801) != 0;
        }
        else {
          BOOL v25 = 1;
        }
        BOOL v183 = v25;
        v223.commonattr |= 0x44000u;
        CFStringRef v216 = v24;
      }
      else if (CFEqual(v23, v181))
      {
        v223.commonattr |= 0x4000u;
        CFBooleanRef v211 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v179))
      {
        v223.commonattr |= 0x4000u;
        CFBooleanRef v209 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v178))
      {
        v223.commonattr |= 0x4000u;
        CFNumberRef v207 = (CFNumberRef)v24;
      }
      else if (CFEqual(v23, v177))
      {
        v223.commonattr |= 0x40000u;
        CFBooleanRef v196 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v176))
      {
        v223.commonattr |= 0x40000u;
        CFBooleanRef v198 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v175))
      {
        v223.commonattr |= 0x40000u;
        CFBooleanRef v195 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v174))
      {
        v223.commonattr |= 0x40000u;
        CFBooleanRef v194 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v173))
      {
        v223.commonattr |= 0x40000u;
        CFBooleanRef v215 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v172))
      {
        v223.commonattr |= 0x40000u;
        CFBooleanRef v206 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v171))
      {
        v223.commonattr |= 0x40000u;
        CFBooleanRef v205 = (const __CFBoolean *)v24;
      }
      else if (CFEqual(v23, v170))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          CFBooleanRef v204 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v169))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          CFBooleanRef v203 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v168))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          CFBooleanRef v202 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v167))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          CFBooleanRef v200 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v165))
      {
        if (!_CFGetEUID())
        {
          v223.commonattr |= 0x40000u;
          CFBooleanRef v197 = (const __CFBoolean *)v24;
        }
      }
      else if (CFEqual(v23, v164))
      {
        v223.commonattr |= 0x1C38000u;
        CFFileSecurityRef v208 = (CFFileSecurityRef)v24;
      }
      else if (CFEqual(v23, v163))
      {
        if (CFEqual(v24, v162))
        {
          uint64_t v26 = 4;
        }
        else if (CFEqual(v24, v161))
        {
          uint64_t v26 = 1;
        }
        else if (CFEqual(v24, v160))
        {
          uint64_t v26 = 2;
        }
        else
        {
          if (!CFEqual(v24, v159))
          {
            CFIndex v27 = defaultLog;
            BOOL v28 = os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT);
            uint64_t v213 = 0;
            if (v28)
            {
              *(_DWORD *)CFIndex v224 = v166;
              *(void *)&v224[4] = v24;
              *(_WORD *)&v224[12] = 2112;
              *(void *)&v224[14] = v192;
              _os_log_impl(&dword_181761000, v27, OS_LOG_TYPE_DEFAULT, "ignoring unsupported value: kCFURLFileProtectionKey=%@ for %@", v224, 0x16u);
              uint64_t v213 = 0;
            }
            goto LABEL_23;
          }
          uint64_t v26 = 3;
        }
        uint64_t v213 = v26;
      }
LABEL_23:
      ++a4;
      ++a3;
      if (!--v22) {
        goto LABEL_75;
      }
    }
  }
  CFBooleanRef v197 = 0;
  CFBooleanRef v198 = 0;
  CFNumberRef v207 = 0;
  CFFileSecurityRef v208 = 0;
  uint64_t v213 = 0;
  CFDataRef v214 = 0;
  CFBooleanRef v200 = 0;
  CFBooleanRef v202 = 0;
  CFBooleanRef v203 = 0;
  CFBooleanRef v204 = 0;
  CFBooleanRef v205 = 0;
  CFBooleanRef v206 = 0;
  CFBooleanRef v215 = 0;
  CFStringRef v216 = 0;
  CFBooleanRef v194 = 0;
  CFBooleanRef v195 = 0;
  CFBooleanRef v196 = 0;
  CFBooleanRef v209 = 0;
  CFStringRef v210 = 0;
  CFBooleanRef v211 = 0;
  BOOL v183 = 0;
  int v186 = 0;
  CFStringRef v193 = 0;
  CFStringRef v191 = 0;
  CFStringRef v19 = 0;
  CFStringRef v18 = 0;
LABEL_75:
  if (!v18 && !v214 && !v216 && !v211 && !v209 && !v207 && !v213)
  {
    LODWORD(v181) = 0;
    int v32 = 0;
    LODWORD(v212) = 0;
    unint64_t v33 = (unint64_t)v208;
    CFBooleanRef v34 = v202;
    CFBooleanRef v35 = v203;
    CFBooleanRef v36 = v204;
    CFBooleanRef v37 = v205;
    goto LABEL_102;
  }
  CFBooleanRef v34 = v202;
  int v38 = *(_DWORD *)v201;
  CFBooleanRef v35 = v203;
  CFBooleanRef v36 = v204;
  CFBooleanRef v37 = v205;
  if (*(_DWORD *)v201)
  {
    LODWORD(v181) = *(_DWORD *)(v201 + 112);
    int v32 = *(_DWORD *)(v201 + 104);
    LODWORD(v212) = objectTypeFromAccessMask(*(_DWORD *)(v201 + 16));
  }
  else
  {
    LODWORD(v181) = 0;
    int v32 = 0;
    LODWORD(v212) = 0;
    v222.commonattr |= 0x8000000C;
  }
  if (v214 || v216 || v211 || v209 || v207)
  {
    if (v214)
    {
      CFDataRef v39 = v214;
      if (CFDataGetLength(v214) == 32)
      {
        v227.CFIndex location = 0;
        v227.CFURLRef length = 32;
        CFDataGetBytes(v39, v227, (UInt8 *)&v219);
        goto LABEL_99;
      }
      int v38 = *(_DWORD *)v201;
    }
    if ((v38 & 0x10) != 0)
    {
      long long v40 = *(_OWORD *)(v201 + 176);
      long long v219 = *(_OWORD *)(v201 + 160);
      long long v220 = v40;
    }
    else
    {
      v222.commonattr |= 0x8004400C;
    }
  }
LABEL_99:
  if (v213) {
    v222.commonattr |= 0xC0000008;
  }
  unint64_t v33 = (unint64_t)v208;
LABEL_102:
  unint64_t v41 = (unint64_t)v216 | (unint64_t)v196 | (unint64_t)v198 | (unint64_t)v195 | (unint64_t)v194;
  LODWORD(v187) = v41 != 0;
  if (v41 || v215 || v206 || v37 || v36 || v35 || v34 || v200 || v197)
  {
    v222.commonattr |= 0x8004000C;
    if (v18)
    {
LABEL_112:
      uint64_t v42 = (unsigned int *)v201;
      if (*(_DWORD *)v201)
      {
        LODWORD(v188) = (*(_DWORD *)v201 >> 13) & 1;
      }
      else
      {
        LODWORD(v188) = 0;
        v222.dirattr |= 4u;
      }
      goto LABEL_117;
    }
  }
  else if (v18)
  {
    goto LABEL_112;
  }
  LODWORD(v188) = 0;
  uint64_t v42 = (unsigned int *)v201;
LABEL_117:
  unint64_t v43 = (unint64_t)v216 | (unint64_t)v215 | v33;
  BOOL v44 = v43 != 0;
  if (v43)
  {
    unsigned int v45 = *v42;
    if (*v42)
    {
      uint64_t v201 = (v45 >> 17) & 1;
      LODWORD(v46) = (v45 >> 19) & 1;
      uint64_t v47 = (const void *)((v45 >> 21) & 1);
    }
    else
    {
      uint64_t v201 = 0;
      LODWORD(v46) = 0;
      uint64_t v47 = 0;
      v222.commonattr |= 0x80000004;
    }
  }
  else
  {
    uint64_t v201 = 0;
    LODWORD(v46) = 0;
    uint64_t v47 = 0;
  }
  CFTypeRef v184 = v47;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)&v222.commonattr, *(int32x4_t *)&v222.commonattr))) & 1) == 0
    && !v222.forkattr)
  {
    int v48 = 0;
    LODWORD(v189) = 0;
    BOOL v31 = 1;
    CFAllocatorRef v49 = v199;
    goto LABEL_149;
  }
  unint64_t v50 = calculateAttributeBufferSize(&v222, 0);
  MEMORY[0x1F4188790](v50);
  uint64_t v52 = (char *)&v158 - v51;
  int v54 = filtered_getattrlist((char *)v225, &v222, (char *)&v158 - v51, v53, 0x21u);
  BOOL v31 = v54 == 0;
  if (v54)
  {
    CFAllocatorRef v49 = v199;
    if (v199)
    {
      CFStringRef v56 = v192;
      CFAllocatorRef v57 = CFGetAllocator(v192);
      CFStringRef v58 = (const __CFString *)*MEMORY[0x1E4F1D160];
      int v59 = __error();
      CFErrorRef v60 = _FSURLCreateStandardError(v57, v58, *v59, 1, v56, 0);
      int v48 = 0;
      LODWORD(v189) = 0;
      CFErrorRef *v49 = v60;
    }
    else
    {
      int v48 = 0;
      LODWORD(v189) = 0;
    }
    goto LABEL_149;
  }
  int v61 = *((_DWORD *)v52 + 1);
  if ((v61 & 4) != 0)
  {
    int v32 = *((_DWORD *)v52 + 6);
    __int16 v62 = v52 + 32;
    if ((v61 & 8) == 0) {
      goto LABEL_134;
    }
    goto LABEL_133;
  }
  __int16 v62 = v52 + 24;
  if ((v61 & 8) != 0)
  {
LABEL_133:
    int v63 = *(_DWORD *)v62;
    v62 += 4;
    LODWORD(v212) = v63;
  }
LABEL_134:
  if ((v61 & 0x4000) == 0)
  {
    if ((v61 & 0x40000) == 0) {
      goto LABEL_136;
    }
LABEL_142:
    int v67 = *(_DWORD *)v62;
    v62 += 4;
    LODWORD(v189) = v67;
    if ((v61 & 0x40000000) != 0) {
      goto LABEL_137;
    }
LABEL_143:
    int v48 = 0;
    goto LABEL_144;
  }
  long long v65 = *((_OWORD *)v62 + 1);
  long long v219 = *(_OWORD *)v62;
  v66.i32[1] = DWORD1(v219);
  long long v220 = v65;
  v66.i32[0] = 2;
  v55.i32[0] = (int)v212;
  *(int8x8_t *)&long long v219 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v55, v66), 0), vrev16_s8(*(int8x8_t *)&v219), vrev32_s8(*(int8x8_t *)&v219));
  *((int8x8_t *)&v219 + 1) = vrev16_s8(*(int8x8_t *)((char *)&v219 + 8));
  if (v212 == 2)
  {
    WORD1(v220) = bswap32(WORD1(v220)) >> 16;
    LOWORD(v220) = bswap32((unsigned __int16)v220) >> 16;
    DWORD1(v220) = bswap32(DWORD1(v220));
  }
  else
  {
    *(int8x8_t *)&long long v220 = vrev16_s8(*(int8x8_t *)&v220);
  }
  WORD4(v220) = bswap32(WORD4(v220)) >> 16;
  WORD5(v220) = bswap32(WORD5(v220)) >> 16;
  HIDWORD(v220) = bswap32(HIDWORD(v220));
  v62 += 32;
  if ((v61 & 0x40000) != 0) {
    goto LABEL_142;
  }
LABEL_136:
  LODWORD(v189) = 0;
  if ((v61 & 0x40000000) == 0) {
    goto LABEL_143;
  }
LABEL_137:
  int v64 = *(_DWORD *)v62;
  v62 += 4;
  int v48 = v64;
LABEL_144:
  if ((v52[12] & 4) != 0) {
    LODWORD(v188) = *(_DWORD *)v62 & 1;
  }
  CFAllocatorRef v49 = v199;
  if (v44 && MountInfoPrepare(&v218, (int)v181, v32, v182, 0, 0, 0))
  {
    unint64_t Capabilities = MountInfoGetCapabilities(v218);
    uint64_t v201 = (Capabilities >> 47) & 1;
    uint64_t v46 = (Capabilities >> 59) & 1;
    CFTypeRef v184 = (CFTypeRef)((Capabilities >> 58) & 1);
  }
LABEL_149:
  CFStringRef v69 = v192;
  CFStringRef v70 = v193;
  CFBooleanRef v71 = 0;
  if (v215 && v46)
  {
    v223.commonattr |= 0x40000u;
    CFBooleanRef v71 = v215;
  }
  BOOL v72 = v208;
  if (v208 && v201 && !CFFileSecurityCopyAccessControlList(v208, &v221)) {
    acl_t v221 = 0;
  }
  if (v31 && v223.commonattr)
  {
    LODWORD(v193) = v48;
    if (v221) {
      ssize_t v73 = acl_size(v221);
    }
    else {
      ssize_t v73 = 0;
    }
    unint64_t v74 = calculateAttributeBufferSize(&v223, v73);
    CFBooleanRef v215 = (const __CFBoolean *)&v158;
    MEMORY[0x1F4188790](v74);
    CFTypeID v76 = (int8x8_t *)((char *)&v158 - v75);
    v223.attrgroup_t commonattr = 0;
    int v77 = (int8x8_t *)((char *)&v158 - v75);
    if (v19)
    {
      if (CFEqual(v19, (CFTypeRef)*MEMORY[0x1E4F1D260]))
      {
        int8x8_t *v76 = 0;
        v76[1] = 0;
      }
      else
      {
        long double v78 = MEMORY[0x1852FFDA0](v19);
        *(void *)CFIndex v224 = 0;
        double v79 = modf(v78, (long double *)v224);
        double v80 = *(double *)v224;
        if (v79 < 0.0)
        {
          double v80 = *(double *)v224 + -1.0;
          double v79 = v79 + 1.0;
        }
        int8x8_t *v76 = (int8x8_t)(uint64_t)(v80 + *MEMORY[0x1E4F1CF78]);
        v76[1] = (int8x8_t)(uint64_t)(v79 * 1000000000.0 + 0.5);
      }
      int v77 = v76 + 2;
      v223.commonattr |= 0x200u;
    }
    size_t v81 = v74;
    if (v210)
    {
      CFStringRef v82 = v70;
      CFStringRef v83 = v69;
      CFStringRef v84 = v210;
      if (CFEqual(v210, (CFTypeRef)*MEMORY[0x1E4F1D260]))
      {
        int8x8_t *v77 = 0;
        v77[1] = 0;
      }
      else
      {
        long double v86 = MEMORY[0x1852FFDA0](v84);
        *(void *)CFIndex v224 = 0;
        double v87 = modf(v86, (long double *)v224);
        double v88 = *(double *)v224;
        if (v87 < 0.0)
        {
          double v88 = *(double *)v224 + -1.0;
          double v87 = v87 + 1.0;
        }
        int8x8_t *v77 = (int8x8_t)(uint64_t)(v88 + *MEMORY[0x1E4F1CF78]);
        v77[1] = (int8x8_t)(uint64_t)(v87 * 1000000000.0 + 0.5);
      }
      CFStringRef v85 = v191;
      v77 += 2;
      v223.commonattr |= 0x400u;
      CFStringRef v69 = v83;
      if (!v191)
      {
LABEL_183:
        CFStringRef v94 = v82;
        if (v214 || v216 || v211 || v209 || v207)
        {
          *(_OWORD *)CFIndex v224 = v219;
          *(_OWORD *)&v224[16] = v220;
          size_t v95 = v81;
          if (v216 && v183) {
            WORD4(v219) = WORD4(v219) & 0xBFFF | ((v186 != 0) << 14);
          }
          char v96 = (char)v187;
          if (v211 && v212 == 1)
          {
            BOOL v97 = valueOfBoolean(v211) != 0;
            WORD4(v219) = WORD4(v219) & 0x7FFF | (v97 << 15);
          }
          if (v209)
          {
            __int16 v98 = valueOfBoolean(v209) != 0;
            WORD4(v219) = WORD4(v219) & 0xFFEF | (16 * v98);
          }
          if (v207)
          {
            LODWORD(v217) = 0;
            if (CFNumberGetValue(v207, kCFNumberSInt32Type, &v217))
            {
              if ((v217 & 0x80000000) == 0 && (int)v217 <= 7) {
                WORD4(v219) = WORD4(v219) & 0xFFF1 | (2 * (_WORD)v217);
              }
            }
          }
          if (v214
            || (*(void *)v224 == (void)v219 ? (BOOL v99 = *(void *)&v224[8] == *((void *)&v219 + 1)) : (BOOL v99 = 0),
                v99 ? (BOOL v100 = *(void *)&v224[16] == (void)v220) : (BOOL v100 = 0),
                v100 ? (BOOL v101 = *(void *)&v224[24] == *((void *)&v220 + 1)) : (BOOL v101 = 0),
                !v101))
          {
            long long v102 = v220;
            *(_OWORD *)v77->i8 = v219;
            *(_OWORD *)v77[2].i8 = v102;
            if (v212 == 2) {
              int8x8_t v103 = vrev16_s8(*v77);
            }
            else {
              int8x8_t v103 = vrev32_s8(*v77);
            }
            int8x8_t v104 = vrev16_s8(v77[1]);
            int8x8_t *v77 = v103;
            v77[1] = v104;
            if (v212 == 2)
            {
              v77[2].i16[1] = bswap32(v77[2].u16[1]) >> 16;
              v77[2].i16[0] = bswap32(v77[2].u16[0]) >> 16;
              v77[2].i32[1] = bswap32(v77[2].u32[1]);
            }
            else
            {
              v77[2] = vrev16_s8(v77[2]);
            }
            v77[3].i16[0] = bswap32(v77[3].u16[0]) >> 16;
            v77[3].i16[1] = bswap32(v77[3].u16[1]) >> 16;
            v77[3].i32[1] = bswap32(v77[3].u32[1]);
            v77 += 4;
            v223.commonattr |= 0x4000u;
          }
        }
        else
        {
          size_t v95 = v81;
          char v96 = (char)v187;
        }
        if (v72)
        {
          *(_WORD *)CFIndex v224 = 0;
          if (CFFileSecurityGetOwner(v72, (uid_t *)v77))
          {
            int v77 = (int8x8_t *)((char *)v77 + 4);
            v223.commonattr |= 0x8000u;
          }
          if (CFFileSecurityGetGroup(v72, (gid_t *)v77))
          {
            int v77 = (int8x8_t *)((char *)v77 + 4);
            v223.commonattr |= 0x10000u;
          }
          if (CFFileSecurityGetMode(v72, (mode_t *)v224))
          {
            v77->i32[0] = *(unsigned __int16 *)v224;
            int v77 = (int8x8_t *)((char *)v77 + 4);
            v223.commonattr |= 0x20000u;
          }
        }
        if (v71) {
          char v105 = 1;
        }
        else {
          char v105 = v96;
        }
        if ((v105 & 1) == 0 && !v206 && !v205 && !v204 && !v203 && !v202 && !v200 && !v197)
        {
LABEL_295:
          if (v72)
          {
            if (v221)
            {
              BOOL v109 = (CFUUIDBytes *)&v77[1];
              v223.commonattr |= 0x400000u;
            }
            else
            {
              BOOL v109 = (CFUUIDBytes *)v77;
              int v77 = 0;
            }
            if (v201)
            {
              *(void *)CFIndex v224 = 0;
              if (CFFileSecurityCopyOwnerUUID(v72, (CFUUIDRef *)v224))
              {
                *v109++ = CFUUIDGetUUIDBytes(*(CFUUIDRef *)v224);
                CFRelease(*(CFTypeRef *)v224);
                v223.commonattr |= 0x800000u;
              }
              if (CFFileSecurityCopyGroupUUID(v72, (CFUUIDRef *)v224))
              {
                *v109++ = CFUUIDGetUUIDBytes(*(CFUUIDRef *)v224);
                CFRelease(*(CFTypeRef *)v224);
                v223.commonattr |= 0x1000000u;
              }
            }
            if (v77)
            {
              ssize_t v110 = acl_size(v221);
              bzero(v109, v110);
              v77->i32[0] = v109 - v77;
              long long v111 = v221;
              ssize_t v112 = acl_size(v221);
              ssize_t v113 = acl_copy_ext_native(v109, v111, v112);
              v77->i32[1] = v113;
              int v77 = (int8x8_t *)(&v109->byte0 + v113);
              if (!v94)
              {
LABEL_316:
                int v117 = setattrlist((const char *)v225, &v223, v76, v95, 1u);
                BOOL v31 = v117 == 0;
                CFAllocatorRef v49 = v199;
                if (v199 && v117)
                {
                  CFAllocatorRef v118 = CFGetAllocator(v69);
                  CFStringRef v119 = (const __CFString *)*MEMORY[0x1E4F1D160];
                  uint64_t v120 = __error();
                  CFErrorRef *v49 = _FSURLCreateStandardError(v118, v119, *v120, 1, v69, 0);
                }
                int v48 = (int)v193;
                goto LABEL_320;
              }
            }
            else
            {
              int v77 = (int8x8_t *)v109;
              if (!v94) {
                goto LABEL_316;
              }
            }
          }
          else if (!v94)
          {
            goto LABEL_316;
          }
          if (CFEqual(v94, (CFTypeRef)*MEMORY[0x1E4F1D260]))
          {
            int8x8_t *v77 = 0;
            v77[1] = 0;
          }
          else
          {
            long double v114 = MEMORY[0x1852FFDA0](v94);
            *(void *)CFIndex v224 = 0;
            double v115 = modf(v114, (long double *)v224);
            double v116 = *(double *)v224;
            if (v115 < 0.0)
            {
              double v116 = *(double *)v224 + -1.0;
              double v115 = v115 + 1.0;
            }
            int8x8_t *v77 = (int8x8_t)(uint64_t)(v116 + *MEMORY[0x1E4F1CF78]);
            v77[1] = (int8x8_t)(uint64_t)(v115 * 1000000000.0 + 0.5);
          }
          v223.commonattr |= 0x10000000u;
          goto LABEL_316;
        }
        unsigned int v106 = v189;
        CFBooleanRef v107 = v198;
        if (v216)
        {
          unsigned int v106 = v189;
          if (v184)
          {
            if (!v186)
            {
              unsigned int v106 = v189 & 0xFFFF7FFF;
              if (!v196) {
                goto LABEL_247;
              }
              goto LABEL_243;
            }
            unsigned int v106 = v189 | 0x8000;
          }
        }
        if (!v196) {
          goto LABEL_247;
        }
LABEL_243:
        if (valueOfBoolean(v196)) {
          v106 |= 1u;
        }
        else {
          v106 &= ~1u;
        }
        CFBooleanRef v107 = v198;
LABEL_247:
        if (v107)
        {
          if (valueOfBoolean(v107)) {
            v106 |= 2u;
          }
          else {
            v106 &= ~2u;
          }
        }
        if (v195)
        {
          if (valueOfBoolean(v195)) {
            v106 |= 4u;
          }
          else {
            v106 &= ~4u;
          }
        }
        if (v194)
        {
          if (!valueOfBoolean(v194))
          {
            v106 &= ~8u;
            if (!v71) {
              goto LABEL_264;
            }
            goto LABEL_259;
          }
          v106 |= 8u;
        }
        if (!v71) {
          goto LABEL_264;
        }
LABEL_259:
        if (valueOfBoolean(v71)) {
          v106 |= 0x20u;
        }
        else {
          v106 &= ~0x20u;
        }
LABEL_264:
        CFBooleanRef v108 = v197;
        if (v206)
        {
          if (valueOfBoolean(v206)) {
            v106 |= 0x40u;
          }
          else {
            v106 &= ~0x40u;
          }
        }
        if (v205)
        {
          if (valueOfBoolean(v205)) {
            v106 |= 0x80u;
          }
          else {
            v106 &= ~0x80u;
          }
        }
        if (v204)
        {
          if (valueOfBoolean(v204)) {
            v106 |= 0x10000u;
          }
          else {
            v106 &= ~0x10000u;
          }
        }
        if (v203)
        {
          if (valueOfBoolean(v203)) {
            v106 |= 0x20000u;
          }
          else {
            v106 &= ~0x20000u;
          }
        }
        if (v202)
        {
          if (valueOfBoolean(v202)) {
            v106 |= 0x40000u;
          }
          else {
            v106 &= ~0x40000u;
          }
        }
        if (v200)
        {
          if (!valueOfBoolean(v200))
          {
            v106 &= ~0x80000u;
            if (!v108) {
              goto LABEL_293;
            }
            goto LABEL_288;
          }
          v106 |= 0x80000u;
        }
        if (!v108) {
          goto LABEL_293;
        }
LABEL_288:
        if (valueOfBoolean(v108)) {
          v106 |= 0x100000u;
        }
        else {
          v106 &= ~0x100000u;
        }
LABEL_293:
        if (v106 != v189)
        {
          v77->i32[0] = v106;
          int v77 = (int8x8_t *)((char *)v77 + 4);
          v223.commonattr |= 0x40000u;
        }
        goto LABEL_295;
      }
    }
    else
    {
      CFStringRef v82 = v70;
      CFStringRef v85 = v191;
      if (!v191) {
        goto LABEL_183;
      }
    }
    CFStringRef v89 = v69;
    CFStringRef v90 = v85;
    if (CFEqual(v85, (CFTypeRef)*MEMORY[0x1E4F1D260]))
    {
      int8x8_t *v77 = 0;
      v77[1] = 0;
    }
    else
    {
      long double v91 = MEMORY[0x1852FFDA0](v90);
      *(void *)CFIndex v224 = 0;
      double v92 = modf(v91, (long double *)v224);
      double v93 = *(double *)v224;
      if (v92 < 0.0)
      {
        double v93 = *(double *)v224 + -1.0;
        double v92 = v92 + 1.0;
      }
      int8x8_t *v77 = (int8x8_t)(uint64_t)(v93 + *MEMORY[0x1E4F1CF78]);
      v77[1] = (int8x8_t)(uint64_t)(v92 * 1000000000.0 + 0.5);
    }
    v77 += 2;
    v223.commonattr |= 0x1000u;
    CFStringRef v69 = v89;
    goto LABEL_183;
  }
LABEL_320:
  if (v31 && v213 && v213 != v48 && (v212 - 1) <= 1)
  {
    if (v212 == 1)
    {
      int v121 = open((const char *)v225, 1);
      uint64_t v122 = 0;
      if (v121 < 0)
      {
LABEL_334:
        int v127 = 0;
        goto LABEL_340;
      }
    }
    else
    {
      unsigned int v123 = opendir((const char *)v225);
      if (!v123) {
        goto LABEL_334;
      }
      uint64_t v122 = v123;
      int v121 = dirfd(v123);
      if (v121 < 0) {
        goto LABEL_334;
      }
    }
    CFIndex v217 = 0;
    CFStringRef v124 = (const __CFString *)*MEMORY[0x1E4F1D908];
    char v125 = (const void *)__CFURLResourceInfoPtr();
    if (_FSURLCopyResourcePropertyForKeyInternal((const __CFURL *)v69, v124, (void **)&v217, v125, 0, 1))
    {
      if (v217 == (unsigned char *)*MEMORY[0x1E4F1CFD0] && fcntl(v121, 64, v213) == -1)
      {
        char v126 = defaultLog;
        int v127 = 0;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          int v128 = *__error();
          *(_DWORD *)CFIndex v224 = 138412546;
          *(void *)&v224[4] = v69;
          *(_WORD *)&v224[12] = 1024;
          *(_DWORD *)&v224[14] = v128;
          _os_log_impl(&dword_181761000, v126, OS_LOG_TYPE_DEFAULT, "%@: error setting protection class: %{errno}d", v224, 0x12u);
          int v127 = 0;
        }
        goto LABEL_337;
      }
    }
    else
    {
      fcntl(v121, 64, v213);
    }
    int v127 = 1;
LABEL_337:
    if (v122) {
      closedir(v122);
    }
    else {
      close(v121);
    }
LABEL_340:
    if (v185 == 1 && !v127)
    {
      if (v49)
      {
        CFAllocatorRef v129 = CFGetAllocator(v69);
        BOOL v31 = 0;
        CFErrorRef *v49 = _FSURLCreateStandardError(v129, (const __CFString *)*MEMORY[0x1E4F1D148], 513, 1, v69, 0);
      }
      else
      {
        BOOL v31 = 0;
      }
      goto LABEL_384;
    }
  }
  if (!v18 || !v31) {
    goto LABEL_384;
  }
  CFIndex v217 = 0;
  if (v188)
  {
    if (v49)
    {
      CFAllocatorRef v130 = CFGetAllocator(v69);
      BOOL v31 = 0;
      CFErrorRef *v49 = _FSURLCreateStandardError(v130, (const __CFString *)*MEMORY[0x1E4F1D160], 45, 1, v69, 0);
      goto LABEL_384;
    }
    goto LABEL_380;
  }
  size_t v131 = strlcpy(v224, (const char *)v225, 0x400uLL);
  if (!v131)
  {
LABEL_377:
    if (v49)
    {
      CFAllocatorRef v141 = CFGetAllocator(v69);
      CFStringRef v142 = (const __CFString *)*MEMORY[0x1E4F1D148];
      uint64_t v143 = 4;
      int v144 = 0;
LABEL_379:
      CFErrorRef *v49 = _FSURLCreateStandardError(v141, v142, v143, v144, v69, 0);
    }
LABEL_380:
    BOOL v31 = 0;
    goto LABEL_384;
  }
  int v132 = 0;
  CFAllocatorRef v133 = &v224[v131];
  do
  {
    if (v133 - 1 <= v224) {
      goto LABEL_377;
    }
    CFAllocatorRef v134 = &v133[-(*(v133 - 1) == 0) - 1];
    if (v134 > v224)
    {
      while (*v134 == 47)
      {
        if (--v134 <= v224)
        {
          CFAllocatorRef v134 = v224;
          break;
        }
      }
    }
    if (v134 == v224) {
      goto LABEL_377;
    }
    CFStringRef v135 = v134;
    if (v134 > v224)
    {
      CFStringRef v135 = v134;
      while (*v135 != 47)
      {
        if (--v135 <= v224)
        {
          CFStringRef v135 = v224;
          break;
        }
      }
    }
    CFArrayRef v136 = v134 + 1;
    if (*v135 == 47) {
      CFAllocatorRef v133 = v135 + 1;
    }
    else {
      CFAllocatorRef v133 = v135;
    }
    uint64_t v137 = v136 - v133;
    if (v137 == 1)
    {
      if (*v133 == 46) {
        continue;
      }
    }
    else if (v137 == 2 && *v133 == 46 && v133[1] == 46)
    {
      ++v132;
      continue;
    }
    --v132;
  }
  while (v132 != -1);
  v228.CFURLRef length = CFStringGetLength(v18);
  v228.CFIndex location = 0;
  CFIndex Bytes = CFStringGetBytes(v18, v228, 0x8000100u, 0, 0, v133, (CFIndex)&v224[~(unint64_t)v133 + 1024], (CFIndex *)&v217);
  if (Bytes != CFStringGetLength(v18)) {
    goto LABEL_391;
  }
  if (v217 != (unsigned char *)2)
  {
    if (v217 == (unsigned char *)1)
    {
      int v140 = *v133;
      goto LABEL_390;
    }
    goto LABEL_393;
  }
  if (*v133 == 46)
  {
    int v140 = v133[1];
LABEL_390:
    if (v140 == 46)
    {
LABEL_391:
      if (!v49) {
        goto LABEL_380;
      }
      CFAllocatorRef v141 = CFGetAllocator(v69);
      CFStringRef v142 = (const __CFString *)*MEMORY[0x1E4F1D148];
      uint64_t v143 = 514;
      goto LABEL_396;
    }
  }
LABEL_393:
  v217[(void)v133] = 0;
  rename(v225, (const std::__fs::filesystem::path *)v224, v139);
  if (v49 && v146)
  {
    CFAllocatorRef v147 = CFGetAllocator(v69);
    CFStringRef v148 = (const __CFString *)*MEMORY[0x1E4F1D160];
    uint64_t v143 = *__error();
    CFAllocatorRef v141 = v147;
    CFStringRef v142 = v148;
LABEL_396:
    int v144 = 1;
    goto LABEL_379;
  }
  if (v146) {
    goto LABEL_380;
  }
  uint64_t v149 = v180;
  if (*(unsigned char *)_FileCacheGetAttributes(v180))
  {
    uint64_t v150 = _FileCacheGetAttributes(v149);
    CFAllocatorRef v151 = CFGetAllocator(v69);
    CFStringRef Copy = CFStringCreateCopy(v151, v18);
    CFRange v153 = *(const void **)(v150 + 8);
    if (v153) {
      CFRelease(v153);
    }
    *(void *)(v150 + 8) = Copy;
    CFIndex Length = CFStringGetLength(Copy);
    if (Length < 1) {
      int v155 = 0;
    }
    else {
      int v155 = (CFStringGetCharacterAtIndex(Copy, 0) == 46) << 11;
    }
    int v156 = 0;
    unsigned int v157 = *(_DWORD *)v150 & 0xFFFFF7FF | v155;
    *(_DWORD *)uint64_t v150 = v157;
    if (Length > 1 && v155)
    {
      int v156 = (CFStringGetCharacterAtIndex(Copy, 1) == 46) << 12;
      unsigned int v157 = *(_DWORD *)v150;
    }
    *(_DWORD *)uint64_t v150 = v157 & 0xFFFFEFFF | v156;
  }
  BOOL v31 = 1;
LABEL_384:
  if (v221) {
    acl_free(v221);
  }
  MountInfoDestroy(v218);
  return v31;
}

uint64_t createNegatedVolumeFlagValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if ((*(void *)(a5 + 16) & *(void *)(a3 + 32)) != 0) {
    CFAllocatorRef v7 = (void *)MEMORY[0x1E4F1CFC8];
  }
  else {
    CFAllocatorRef v7 = (void *)MEMORY[0x1E4F1CFD0];
  }
  *a7 = *v7;
  return 1;
}

uint64_t createVolumeIsInternalValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7 = *(void *)(a3 + 32) & 0x180;
  if (v7 == 256)
  {
    CFStringRef v8 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  else
  {
    if (v7 != 128)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    CFStringRef v8 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  uint64_t v9 = *v8;
LABEL_7:
  *a7 = v9;
  return 1;
}

uint64_t createVolumeMaximumFileSizeValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  CFStringRef v8 = (const void *)(a3 + 48);
  if ((*(void *)(a3 + 48) & 0x8000000000000000) != 0)
  {
    CFNumberRef v10 = 0;
    uint64_t result = 1;
    goto LABEL_5;
  }
  if (a6)
  {
    CFAllocatorRef v9 = CFGetAllocator(a1);
    CFNumberRef v10 = CFNumberCreate(v9, kCFNumberSInt64Type, v8);
    uint64_t result = 2;
LABEL_5:
    *a7 = v10;
    return result;
  }
  return 0;
}

uint64_t createVolumeCreationDateValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFDateRef *a7)
{
  if (*(double *)(a3 + 40) == -1.0 - *MEMORY[0x1E4F1CF68])
  {
    CFDateRef v8 = 0;
    uint64_t result = 1;
LABEL_5:
    *a7 = v8;
    return result;
  }
  if (a6)
  {
    CFAllocatorRef v11 = CFGetAllocator(a1);
    CFDateRef v8 = CFDateCreate(v11, *(CFAbsoluteTime *)(a3 + 40));
    uint64_t result = 2;
    goto LABEL_5;
  }
  return 0;
}

uint64_t createVolumeResourceCountValue(const void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0;
  }
  uint64_t valuePtr = a3[1] + *a3;
  CFAllocatorRef v8 = CFGetAllocator(a1);
  *a7 = CFNumberCreate(v8, kCFNumberSInt64Type, &valuePtr);
  return 2;
}

uint64_t createVolumeDeviceIDValue(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0;
  }
  uint64_t Attributes = _FileCacheGetAttributes(a2);
  CFAllocatorRef v10 = CFGetAllocator(a1);
  *a7 = CFNumberCreate(v10, kCFNumberSInt32Type, (const void *)(Attributes + 104));
  return 2;
}

uint64_t _URLEnumeratorGetTypeID()
{
  if (_URLEnumeratorGetTypeID::onceToken != -1) {
    dispatch_once(&_URLEnumeratorGetTypeID::onceToken, &__block_literal_global_4);
  }
  return _kCFURLEnumeratorTypeID;
}

uint64_t _URLEnumeratorGetURLsBulk(uint64_t a1, uint64_t a2, void *a3, void *a4, CFErrorRef *a5)
{
  if (*(unsigned char *)(a1 + 120)) {
    goto LABEL_2;
  }
  if (*(void *)(a1 + 48))
  {
    *(void *)(a1 + 56) = 0;
    *a3 = 0;
    *(void *)(a1 + 104) = 0;
    CFAllocatorRef v11 = *(const void **)(a1 + 112);
    if (v11)
    {
      CFRelease(v11);
      *(void *)(a1 + 112) = 0;
    }
    if (!*(void *)(a1 + 160)) {
      _InitalizeDirectoryEnumerator(a1);
    }
    if (!*(unsigned char *)(a1 + 120))
    {
      uint64_t i = 2;
      while (1)
      {
        uint64_t v12 = *(void *)(a1 + 88);
        if (v12 < *(void *)(a1 + 80))
        {
          *(void *)(a1 + 56) = *(void *)(a1 + 8 * v12 + 168);
          if (!a2) {
            return 2;
          }
          uint64_t v19 = a2 - 1;
          do
          {
            int v20 = *(unsigned __int8 *)(a1 + v12 + 488);
            ++*a3;
            uint64_t v21 = *(void *)(a1 + 80);
            uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8 * v12);
            *(void *)(a1 + 104) = v22;
            *a4 = v22;
            uint64_t v12 = *(void *)(a1 + 88) + 1;
            *(void *)(a1 + 88) = v12;
            if (v12 >= v21) {
              break;
            }
            ++a4;
          }
          while (v20 == *(unsigned __int8 *)(a1 + v12 + 488) && v19-- != 0);
          if (v20) {
            return 4;
          }
          else {
            return 1;
          }
        }
        __int16 v13 = *(const void **)(a1 + 96);
        if (v13) {
          break;
        }
        if (!_GetDirectoryURLs(a1)) {
          return i;
        }
      }
      *(void *)(a1 + 112) = v13;
      *(void *)(a1 + 96) = 0;
      if (a5) {
        goto LABEL_22;
      }
      return 3;
    }
LABEL_20:
    *(void *)(a1 + 56) = 0;
    if (a5)
    {
      __int16 v13 = *(const void **)(a1 + 112);
      if (!v13)
      {
        *a5 = 0;
LABEL_25:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          _URLEnumeratorGetURLsBulk_cold_1();
        }
        *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
        return 3;
      }
LABEL_22:
      uint64_t v15 = (__CFError *)CFRetain(v13);
      *a5 = v15;
      if (!v15) {
        goto LABEL_25;
      }
    }
    return 3;
  }
  *a3 = 0;
  *(void *)(a1 + 104) = 0;
  CFRange v14 = *(const void **)(a1 + 112);
  if (v14)
  {
    CFRelease(v14);
    *(void *)(a1 + 112) = 0;
  }
  if (!*(void *)(a1 + 72)) {
    _InitalizeVolumeEnumerator(a1);
  }
  if (*(unsigned char *)(a1 + 120) || !*(void *)(a1 + 72)) {
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)(a1 + 88);
  if (v17 < *(void *)(a1 + 80))
  {
    *(void *)(a1 + 56) = *(void *)(a1 + 8 * v17 + 168);
    for (uint64_t i = 1; a2; --a2)
    {
      if (v17 >= *(void *)(a1 + 80)) {
        break;
      }
      uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8 * v17);
      *(void *)(a1 + 104) = v18;
      *a4++ = v18;
      ++*a3;
      uint64_t v17 = *(void *)(a1 + 88) + 1;
      *(void *)(a1 + 88) = v17;
    }
    return i;
  }
LABEL_2:
  *(void *)(a1 + 56) = 0;
  return 2;
}

uint64_t _URLEnumeratorSkipDescendents(uint64_t result)
{
  if (*(void *)(result + 48))
  {
    if (*(unsigned char *)(result + 32))
    {
      uint64_t result = *(void *)(result + 160);
      if (result)
      {
        uint64_t v1 = *(void *)(result + 1840);
        if (v1)
        {
          if (*(_DWORD *)(v1 + 48) == 1) {
            return DirEnumSkipDescendents(result);
          }
        }
      }
    }
  }
  return result;
}

uint64_t _URLEnumeratorGetDescendentLevel(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t _URLEnumeratorGetSourceDidChange()
{
  return 0;
}

uint64_t _URLEnumeratorEqual(void *a1, void *a2)
{
  uint64_t v5 = a1[4] == a2[4] && a1[3] == a2[3];
  CFNumberRef v6 = (const void *)a1[5];
  uint64_t v7 = (const void *)a2[5];
  if (v6)
  {
    if (!v7 || !CFEqual(v6, v7)) {
      uint64_t v5 = 0;
    }
  }
  else if (v7)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = v5;
  }
  CFAllocatorRef v8 = (const void *)a1[6];
  CFAllocatorRef v9 = (const void *)a2[6];
  if (v8)
  {
    if (!v9 || !CFEqual(v8, v9)) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  else
  {
    return v5;
  }
  return v5;
}

uint64_t _URLEnumeratorHash(void *a1)
{
  return a1[3];
}

__CFString *_URLEnumeratorCopyDebugDesc(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFDataRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<CFURLEnumerator %p>{enumeratorOptions = %ld, propertyKeys = %@", a1, *((void *)a1 + 4), *((void *)a1 + 5));
  if (*((void *)a1 + 6)) {
    CFStringAppendFormat(Mutable, 0, @", directoryURL = %@, currentLevel = %ld", *((void *)a1 + 6), *((void *)a1 + 7));
  }
  if (*((void *)a1 + 14))
  {
    CFStringAppendFormat(Mutable, 0, @", currentError = %@", *((void *)a1 + 14));
  }
  else if (*((void *)a1 + 13))
  {
    CFStringAppendFormat(Mutable, 0, @", currentURL = %@", *((void *)a1 + 13));
  }
  CFStringAppend(Mutable, @"}");
  return Mutable;
}

CFErrorRef _CFErrorWithPOSIXPathAndErrno(CFAllocatorRef alloc, int a2, const char *cStr)
{
  if (cStr)
  {
    CFStringRef v6 = CFStringCreateWithCString(alloc, cStr, 0x8000100u);
    if (!v6) {
      CFStringRef v6 = CFStringCreateWithCString(alloc, cStr, 0);
    }
  }
  else
  {
    CFStringRef v6 = 0;
  }
  CFErrorRef v7 = _FSURLCreateStandardError(alloc, (const __CFString *)*MEMORY[0x1E4F1D160], a2, 0, v6, 0);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

void CacheItem::CacheItem(CacheItem *this, const __CFData *a2)
{
  *((void *)this + 3) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  if (a2) {
    CFDataRef Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  }
  else {
    CFDataRef Copy = 0;
  }
  *((void *)this + 2) = Copy;
}

void CacheItem::~CacheItem(CacheItem *this)
{
  uint64_t v1 = (const void *)*((void *)this + 2);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t append(uint64_t result, CacheItem *a2)
{
  if (!result) {
    append();
  }
  if (!a2) {
    append();
  }
  do
  {
    uint64_t v2 = result;
    uint64_t result = *(void *)(result + 24);
  }
  while (result);
  *(void *)(v2 + 24) = a2;
  return result;
}

void remove(CacheItem *a1, CacheItem *a2)
{
  if (!a1) {
    remove();
  }
  if (!a2) {
    remove();
  }
  while (a1)
  {
    CFURLRef v3 = a1;
    a1 = (CacheItem *)*((void *)a1 + 3);
    if (a1 == a2)
    {
      *((void *)v3 + 3) = *((void *)a2 + 3);
      *((void *)a2 + 3) = 0;
      return;
    }
  }
  uint64_t v4 = securityScopedLog;
  if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
    remove((uint64_t)a2, v4);
  }
}

void SandboxExtensionCache::SandboxExtensionCache(SandboxExtensionCache *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 1) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
}

void SandboxExtensionCache::~SandboxExtensionCache(SandboxExtensionCache *this)
{
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

CFDataRef SandboxExtensionCache::move(os_unfair_lock_t lock, const __CFURL *a2, CFURLRef url, fsid *a4, uint64_t a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!url && (!a4 || !a5)) {
    SandboxExtensionCache::move();
  }
  CFStringRef propertyValueTypeRefPtr = 0;
  CFErrorRef v33 = 0;
  if (a4) {
    BOOL v7 = a5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  char v8 = v7;
  if (v7) {
    CFAllocatorRef v9 = 0;
  }
  else {
    CFAllocatorRef v9 = a4;
  }
  if (v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a5;
  }
  if (url)
  {
    if (!CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E4F1D748], &propertyValueTypeRefPtr, &v33))
    {
      CFAllocatorRef v11 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
        SandboxExtensionCache::move((uint64_t)url, (uint64_t *)&v33, v11);
      }
    }
  }
  char v12 = v8 ^ 1;
  if (!propertyValueTypeRefPtr) {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    if (CFStringGetFileSystemRepresentation(propertyValueTypeRefPtr, buffer, 1024))
    {
      *(void *)&v41[16] = 0;
      *(_OWORD *)unint64_t v41 = xmmword_181791370;
      if (!getattrlist(buffer, v41, v36, 0x28uLL, 1u) && *(_OWORD *)&v41[4] == v37 && *(_DWORD *)&v41[20] == v38)
      {
        uint64_t v10 = v40;
        uint64_t v34 = v39;
        CFAllocatorRef v9 = (fsid *)&v34;
        goto LABEL_33;
      }
      __int16 v13 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
        SandboxExtensionCache::move((uint64_t)buffer, v13);
      }
    }
    else
    {
      CFRange v14 = securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
        SandboxExtensionCache::move(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    CFAllocatorRef v9 = 0;
    uint64_t v10 = 0;
  }
LABEL_33:
  if (v9) {
    BOOL v22 = v10 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22)
  {
    CFTypeRef v23 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
      SandboxExtensionCache::move(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    CFDataRef v31 = 0;
  }
  else
  {
    os_unfair_lock_lock(lock);
    CFDataRef v31 = SandboxExtensionCache::_move((CFDictionaryRef *)lock, propertyValueTypeRefPtr, v9, v10);
    os_unfair_lock_unlock(lock);
  }
  if (propertyValueTypeRefPtr) {
    CFRelease(propertyValueTypeRefPtr);
  }
  return v31;
}

CFDataRef SandboxExtensionCache::_move(CFDictionaryRef *this, const __CFString *a2, fsid *a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int updated = sandbox_extension_update_file_by_fileid();
  if (updated)
  {
    int v9 = updated;
    uint64_t v10 = securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
    {
      int32_t v18 = a3->val[0];
      int32_t v19 = a3->val[1];
      v20[0] = 67109888;
      v20[1] = v18;
      __int16 v21 = 1024;
      int32_t v22 = v19;
      __int16 v23 = 2048;
      uint64_t v24 = a4;
      __int16 v25 = 1024;
      int v26 = v9;
      _os_log_error_impl(&dword_181761000, v10, OS_LOG_TYPE_ERROR, "sandbox_extension_update_file_by_fileid error for fsid={%#x, %#x}, id=%#llx: %{errno}d", (uint8_t *)v20, 0x1Eu);
    }
    return 0;
  }
  if (a2 && CFStringGetFileSystemRepresentation(a2, (char *)v20, 1024))
  {
    CFStringRef v13 = (const __CFString *)CFRetain(a2);
  }
  else
  {
    if (fsgetpath((char *)v20, 0x400uLL, a3, a4) < 1) {
      return 0;
    }
    CFStringRef v13 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)v20);
  }
  CFStringRef v14 = v13;
  if (!v13) {
    return 0;
  }
  access((const char *)v20, 2);
  uint64_t v15 = (const char *)sandbox_extension_issue_file();
  if (v15)
  {
    uint64_t v16 = (UInt8 *)v15;
    size_t v17 = strlen(v15);
    CFDataRef v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v16, v17 + 1);
    if (v11 && !SandboxExtensionCache::_insert(this, v14, v11))
    {
      CFRelease(v11);
      CFDataRef v11 = 0;
    }
    free(v16);
  }
  else
  {
    CFDataRef v11 = 0;
  }
  CFRelease(v14);
  return v11;
}

BOOL SandboxExtensionCache::containsPath(SandboxExtensionCache *this, const __CFString *a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)this);
  BOOL v4 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 1), a2) != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  return v4;
}

BOOL SandboxExtensionCache::_containsPath(CFDictionaryRef *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(this[1], a2) != 0;
}

BOOL SandboxExtensionCache::containsURL(SandboxExtensionCache *this, CFURLRef url)
{
  CFStringRef propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x1E4F1D748], &propertyValueTypeRefPtr, 0)) {
    BOOL v3 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)this);
  BOOL v4 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 1), propertyValueTypeRefPtr) != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  CFRelease(propertyValueTypeRefPtr);
  return v4;
}

uint64_t _URLReplaceObject(const __CFAllocator *MutableCopy, const __CFURL *cf, const void *a3, const __CFString *a4, const __CFString *a5, unint64_t a6, CFTypeRef *a7, CFErrorRef *a8)
{
  CFURLRef v14 = cf;
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  *(_WORD *)int v156 = 0;
  CFTypeRef cf2 = 0;
  CFURLRef url = 0;
  unsigned __int8 v153 = 0;
  CFTypeRef v16 = CFRetain(cf);
  CFTypeRef v148 = CFRetain(a3);
  CFIndex code = 22;
  CFErrorRef error = 0;
  CFStringRef domain = (const __CFString *)*MEMORY[0x1E4F1D160];
  if (a5) {
    int v17 = (a6 >> 4) & 1;
  }
  else {
    int v17 = 0;
  }
  if (a4 && CFStringFind(a4, @"/", 0).location != -1 || a5 && CFStringFind(a5, @"/", 0).location != -1) {
    goto LABEL_14;
  }
  if (CFURLResourceIsReachable(v14, 0))
  {
    CFStringRef v138 = a5;
    CFURLRef v18 = CFURLCreateFilePathURL(MutableCopy, v14, &error);
    CFURLRef value = v14;
    CFAllocatorRef v147 = (void *)v16;
    CFAllocatorRef allocator = MutableCopy;
    if (!v18)
    {
      LODWORD(MutableCopy) = 0;
      uint64_t v35 = 0;
      CFURLRef v36 = 0;
      int v37 = 0;
      int v38 = 0;
      goto LABEL_71;
    }
    CFURLRef v19 = CFURLCreateFilePathURL(MutableCopy, (CFURLRef)a3, &error);
    CFURLRef v149 = v18;
    if (!v19)
    {
      uint64_t v35 = 0;
      CFURLRef v36 = 0;
      int v37 = 0;
      int v38 = 0;
      CFURLRef v18 = 0;
      LODWORD(MutableCopy) = 1;
      goto LABEL_70;
    }
    CFStringRef pathComponent = a4;
    CFStringRef v142 = a3;
    int v137 = v17;
    CFAllocatorRef v134 = a7;
    CFURLRef cfa = v19;
    uint64_t v143 = a8;
    uint64_t v20 = *MEMORY[0x1E4F1D6B8];
    uint64_t v21 = *MEMORY[0x1E4F1D678];
    *(void *)&values.ad_name_offset = *MEMORY[0x1E4F1D6B8];
    *(void *)values.ad_pad = v21;
    uint64_t v22 = *MEMORY[0x1E4F1D6E0];
    uint64_t v23 = *MEMORY[0x1E4F1D6D0];
    uint64_t v166 = *MEMORY[0x1E4F1D6E0];
    uint64_t v167 = v23;
    CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F1D740];
    CFStringRef v133 = (const __CFString *)*MEMORY[0x1E4F1D738];
    CFStringRef v168 = (const __CFString *)*MEMORY[0x1E4F1D738];
    CFStringRef v169 = v24;
    CFStringRef v135 = v24;
    CFStringRef v25 = (const __CFString *)*MEMORY[0x1E4F1D838];
    CFStringRef v26 = (const __CFString *)*MEMORY[0x1E4F1D608];
    uint64_t v170 = *MEMORY[0x1E4F1D838];
    CFStringRef v171 = v26;
    if ((a6 & 2) != 0)
    {
      CFStringRef v29 = (const __CFString *)*MEMORY[0x1E4F1D948];
      CFStringRef v39 = (const __CFString *)*MEMORY[0x1E4F1D910];
      uint64_t v172 = *MEMORY[0x1E4F1D948];
      CFStringRef v173 = v39;
      CFStringRef key = v39;
      CFDataRef v31 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      CFAllocatorRef v32 = MutableCopy;
      CFIndex v33 = 10;
    }
    else
    {
      CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F1CDD8];
      uint64_t v172 = *MEMORY[0x1E4F1D5A0];
      CFStringRef v173 = v27;
      uint64_t v28 = *MEMORY[0x1E4F1D638];
      uint64_t v174 = *MEMORY[0x1E4F1CDE0];
      uint64_t v175 = v28;
      CFStringRef v29 = (const __CFString *)*MEMORY[0x1E4F1D948];
      CFStringRef v30 = (const __CFString *)*MEMORY[0x1E4F1D910];
      uint64_t v176 = *MEMORY[0x1E4F1D948];
      CFStringRef v177 = v30;
      CFStringRef key = v30;
      CFDataRef v31 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      CFAllocatorRef v32 = MutableCopy;
      CFIndex v33 = 14;
    }
    CFMutableDictionaryRef MutableCopy = CFArrayCreate(v32, (const void **)&values, v33, v31);
    if (MutableCopy)
    {
      uint64_t v40 = (const void *)__CFURLResourceInfoPtr();
      int v38 = _FSURLCacheResourcePropertiesForKeys(v149, MutableCopy, v40, &error);
      CFRelease(MutableCopy);
      if (v38)
      {
        *(void *)&values.ad_name_offset = v20;
        *(void *)values.ad_pad = v21;
        uint64_t v166 = v22;
        uint64_t v167 = v23;
        CFStringRef v168 = v25;
        CFStringRef v169 = v26;
        if ((a6 & 2) != 0)
        {
          uint64_t v42 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
          CFAllocatorRef v43 = allocator;
          CFIndex v44 = 6;
        }
        else
        {
          CFStringRef v41 = (const __CFString *)*MEMORY[0x1E4F1D638];
          uint64_t v170 = *MEMORY[0x1E4F1CDE0];
          CFStringRef v171 = v41;
          uint64_t v42 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
          CFAllocatorRef v43 = allocator;
          CFIndex v44 = 8;
        }
        CFArrayRef v45 = CFArrayCreate(v43, (const void **)&values, v44, v42);
        a3 = v142;
        a8 = v143;
        CFURLRef v46 = v149;
        if (v45)
        {
          uint64_t v47 = (const void *)__CFURLResourceInfoPtr();
          int v38 = _FSURLCacheResourcePropertiesForKeys(cfa, v45, v47, &error);
          CFRelease(v45);
          if (v38)
          {
            if (!_URLIsDirectory(v149, (BOOL *)&v156[1], &error)) {
              goto LABEL_64;
            }
            int v48 = v156[1];
            if (!v156[1])
            {
              LOBYTE(values.ad_name_offset) = 0;
              if (!_URLIsFile(v149, (BOOL *)&values, &error))
              {
                CFURLRef v18 = 0;
                goto LABEL_68;
              }
              if (!LOBYTE(values.ad_name_offset))
              {
                CFIndex v52 = 2;
                goto LABEL_67;
              }
            }
            if (!_URLIsDirectory(cfa, (BOOL *)v156, &error)) {
              goto LABEL_64;
            }
            int v49 = v156[0];
            if (!v156[0])
            {
              LOBYTE(values.ad_name_offset) = 0;
              if (!_URLIsFile(cfa, (BOOL *)&values, &error))
              {
                CFURLRef v18 = 0;
LABEL_174:
                uint64_t v35 = 0;
                CFURLRef v36 = 0;
                int v37 = 0;
                int v38 = 0;
                goto LABEL_175;
              }
              if (!LOBYTE(values.ad_name_offset))
              {
                CFIndex v92 = 2;
LABEL_173:
                CFIndex code = v92;
                CFURLRef v18 = (const __CFURL *)CFRetain(cfa);
                goto LABEL_174;
              }
            }
            if (!_URLIsLocked(v149, (BOOL *)&v153, &error)) {
              goto LABEL_64;
            }
            if (v153)
            {
LABEL_38:
              CFIndex v52 = 13;
LABEL_67:
              CFIndex code = v52;
              CFURLRef v18 = (const __CFURL *)CFRetain(v149);
LABEL_68:
              LODWORD(MutableCopy) = 0;
              uint64_t v35 = 0;
              CFURLRef v36 = 0;
              int v37 = 0;
              int v38 = 0;
              goto LABEL_69;
            }
            if (_URLIsLocked(cfa, (BOOL *)&v153, &error))
            {
              if (!v153)
              {
                propertyValueTypeRefPtr[0] = 0;
                *(void *)&values.ad_name_offset = 0x40000000010;
                if (!CFURLGetFileSystemRepresentation(v149, 1u, (UInt8 *)&v166, 1024))
                {
                  int v51 = 2;
LABEL_40:
                  CFAllocatorRef v53 = CFGetAllocator(v149);
                  LODWORD(MutableCopy) = 0;
                  uint64_t v35 = 0;
                  CFURLRef v36 = 0;
                  int v37 = 0;
                  int v38 = 0;
                  CFURLRef v18 = 0;
                  CFErrorRef error = _FSURLCreateStandardError(v53, domain, v51, 1, (const __CFString *)v149, 0);
LABEL_69:
                  CFRelease(cfa);
LABEL_70:
                  CFRelease(v149);
                  goto LABEL_71;
                }
                uid_t v50 = _CFGetEUID();
                if (accessx_np(&values, 0x410uLL, propertyValueTypeRefPtr, v50))
                {
                  int v51 = *__error();
                  if (!v51) {
                    goto LABEL_38;
                  }
                  goto LABEL_40;
                }
                if (propertyValueTypeRefPtr[0]) {
                  goto LABEL_38;
                }
                if (pathComponent)
                {
                  int v132 = 0;
                }
                else
                {
                  *(void *)&values.ad_name_offset = 0;
                  if (!CFURLCopyResourcePropertyForKey(v149, v29, &values, &error)) {
                    goto LABEL_64;
                  }
                  int v132 = CFBooleanGetValue(*(CFBooleanRef *)&values.ad_name_offset);
                  CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                }
                *(void *)&values.ad_name_offset = 0;
                CFAllocatorRef v58 = allocator;
                if (!CFURLCopyResourcePropertyForKey(v149, key, &values, &error)) {
                  goto LABEL_64;
                }
                int v131 = CFBooleanGetValue(*(CFBooleanRef *)&values.ad_name_offset);
                CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                *(void *)&values.ad_name_offset = 0;
                *(void *)CFStringRef propertyValueTypeRefPtr = 0;
                if (CFURLCopyResourcePropertyForKey(v149, v26, &values, 0))
                {
                  if (CFURLCopyResourcePropertyForKey(cfa, v26, propertyValueTypeRefPtr, 0))
                  {
                    int v59 = CFEqual(*(CFTypeRef *)&values.ad_name_offset, *(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                    if (v59)
                    {
                      CFIndex v52 = 22;
                      goto LABEL_67;
                    }
                  }
                  else
                  {
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                  }
                }
                *(void *)&values.ad_name_offset = 0;
                *(void *)CFStringRef propertyValueTypeRefPtr = 0;
                if (CFURLCopyResourcePropertyForKey(v149, v25, &values, 0))
                {
                  if (CFURLCopyResourcePropertyForKey(cfa, v25, propertyValueTypeRefPtr, 0))
                  {
                    int v60 = CFEqual(*(CFTypeRef *)&values.ad_name_offset, *(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)propertyValueTypeRefPtr);
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                    if (v60)
                    {
                      if (CFURLCopyResourcePropertyForKey(v149, v135, &url, &error))
                      {
                        if (pathComponent) {
                          CFStringRef v61 = (const __CFString *)CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, v49);
                        }
                        else {
                          CFStringRef v61 = (const __CFString *)CFRetain(v149);
                        }
                        CFStringRef v70 = v61;
                        if (!v61)
                        {
                          CFIndex code = 2;
                          CFURLRef v18 = (const __CFURL *)CFRetain(v149);
                          LODWORD(MutableCopy) = 0;
                          uint64_t v35 = 0;
                          CFURLRef v36 = 0;
                          int v37 = 0;
                          int v38 = 0;
LABEL_315:
                          CFRelease(url);
                          goto LABEL_69;
                        }
                        if (v132)
                        {
                          if ((v137 & 1) == 0)
                          {
LABEL_127:
                            CFURLRef v36 = 0;
                            goto LABEL_130;
                          }
LABEL_122:
                          CFURLRef v36 = CFURLCreateCopyAppendingPathComponent(allocator, url, v138, v48);
                          if (!v36)
                          {
                            CFIndex code = 2;
                            CFURLRef v18 = (const __CFURL *)CFRetain(url);
                            LODWORD(MutableCopy) = 0;
                            uint64_t v35 = 0;
                            int v37 = 0;
LABEL_313:
                            int v38 = 0;
LABEL_314:
                            CFRelease(v70);
                            goto LABEL_315;
                          }
LABEL_123:
                          CFStringRef v72 = CFURLCopyLastPathComponent((CFURLRef)v70);
                          if (v72)
                          {
                            CFStringRef v73 = v72;
                            CFStringRef v129 = v70;
                            CFStringRef v74 = CFURLCopyLastPathComponent(v36);
                            if (v74)
                            {
                              CFStringRef v75 = v74;
                              int v76 = CFEqual(v73, v74);
                              CFRelease(v75);
                              CFRelease(v73);
                              if (v76)
                              {
                                CFIndex code = 22;
                                CFStringRef v70 = v129;
                                CFURLRef v18 = (const __CFURL *)CFRetain(v129);
                                LODWORD(MutableCopy) = 0;
                                uint64_t v35 = 0;
                                int v37 = 0;
                                int v38 = 0;
                                goto LABEL_310;
                              }
                              CFAllocatorRef v58 = allocator;
                            }
                            else
                            {
                              CFRelease(v73);
                            }
                            CFStringRef v70 = v129;
                          }
LABEL_130:
                          if ((a6 & 2) != 0)
                          {
                            CFStringRef v136 = 0;
                            keya = 0;
                            CFTypeRef v81 = v147;
                            goto LABEL_261;
                          }
                          keya = CFDictionaryCreateMutable(v58, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                          if (keya)
                          {
                            CFFileSecurityRef v162 = 0;
                            CFFileSecurityRef fileSec = 0;
                            mode_t mode = 0;
                            gid_t v159 = 0;
                            gid_t group = 0;
                            acl_t accessControlList = 0;
                            CFStringRef v77 = (const __CFString *)*MEMORY[0x1E4F1D638];
                            if (CFURLCopyResourcePropertyForKey(v149, (CFStringRef)*MEMORY[0x1E4F1D638], &fileSec, &error)&& fileSec)
                            {
                              CFStringRef v128 = v77;
                              if (CFURLCopyResourcePropertyForKey(cfa, v77, &v162, &error) && v162)
                              {
                                CFFileSecurityRef v78 = CFFileSecurityCreate(v58);
                                if (!v78)
                                {
                                  CFStringRef v136 = 0;
                                  int v93 = 0;
                                  CFTypeRef v81 = v147;
LABEL_236:
                                  CFRelease(v162);
                                  CFRelease(fileSec);
                                  if (v93)
                                  {
                                    if (TransferExtendedAttributes(v58, v46, cfa, &error)
                                      && (*(void *)&values.ad_name_offset = 0,
                                          *(void *)CFStringRef propertyValueTypeRefPtr = 0,
                                          CFStringRef v112 = (const __CFString *)*MEMORY[0x1E4F1CDE0],
                                          CFURLCopyResourcePropertyForKey(v46, (CFStringRef)*MEMORY[0x1E4F1CDE0], &values, &error))&& *(void *)&values.ad_name_offset&& CFDataGetLength(*(CFDataRef *)&values.ad_name_offset) == 32)
                                    {
                                      BytePtr = CFDataGetBytePtr(*(CFDataRef *)&values.ad_name_offset);
                                      LODWORD(MutableCopy) = 1;
                                      if (CFURLCopyResourcePropertyForKey(cfa, v112, propertyValueTypeRefPtr, &error))
                                      {
                                        if (*(void *)propertyValueTypeRefPtr)
                                        {
                                          if (CFDataGetLength(*(CFDataRef *)propertyValueTypeRefPtr) == 32)
                                          {
                                            CFMutableDictionaryRef MutableCopy = CFDataCreateMutableCopy(v58, 0, *(CFDataRef *)propertyValueTypeRefPtr);
                                            CFRelease(*(CFTypeRef *)propertyValueTypeRefPtr);
                                            if (MutableCopy)
                                            {
                                              MutableBytePtr = CFDataGetMutableBytePtr(MutableCopy);
                                              __int16 v115 = *((_WORD *)BytePtr + 4);
                                              if ((v115 & 0xE) != 0
                                                && (__int16 v116 = *((_WORD *)MutableBytePtr + 4), (v116 & 0xE) == 0))
                                              {
                                                char v117 = 0;
                                                *((_WORD *)MutableBytePtr + 4) = v116 | *((_WORD *)BytePtr + 4) & 0xE;
                                                __int16 v115 = *((_WORD *)BytePtr + 4);
                                              }
                                              else
                                              {
                                                char v117 = 1;
                                              }
                                              if ((v115 & 0x10) == 0
                                                || (__int16 v118 = *((_WORD *)MutableBytePtr + 4), (v118 & 0x10) != 0))
                                              {
                                                if (v117) {
                                                  goto LABEL_254;
                                                }
                                              }
                                              else
                                              {
                                                *((_WORD *)MutableBytePtr + 4) = v118 | 0x10;
                                              }
                                              CFDictionaryAddValue(keya, v112, MutableCopy);
LABEL_254:
                                              CFRelease(MutableCopy);
                                              CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                                              CFStringRef v119 = (const void *)*MEMORY[0x1E4F1D5A0];
                                              if (CFURLCopyResourcePropertyForKey(v46, (CFStringRef)*MEMORY[0x1E4F1D5A0], &cf2, 0)&& cf2)
                                              {
                                                CFDictionaryAddValue(keya, v119, cf2);
                                                CFRelease(cf2);
                                              }
                                              if (!CFURLSetResourcePropertiesForKeys(cfa, keya, &error))
                                              {
                                                uint64_t v35 = 0;
                                                int v37 = 0;
                                                int v38 = 0;
                                                CFURLRef v18 = 0;
                                                LODWORD(MutableCopy) = 1;
                                                goto LABEL_306;
                                              }
                                              if (v136) {
                                                CFURLSetResourcePropertyForKey(cfa, v128, v136, 0);
                                              }
                                              else {
                                                CFStringRef v136 = 0;
                                              }
LABEL_261:
                                              if (!v138 || !v36 || !CFURLResourceIsReachable(v36, 0))
                                              {
LABEL_267:
                                                if (v132)
                                                {
                                                  if (CFURLGetFileSystemRepresentation(cfa, 1u, (UInt8 *)&values, 1024))
                                                  {
                                                    if (CFURLGetFileSystemRepresentation((CFURLRef)v70, 1u, (UInt8 *)propertyValueTypeRefPtr, 1024))
                                                    {
                                                      if (!renamex_np((const char *)&values, (const char *)propertyValueTypeRefPtr, 2u)|| (v120 = *__error(), CFStringRef v121 = (const __CFString *)cfa, !v120))
                                                      {
                                                        CFRelease(v148);
                                                        CFTypeRef v148 = CFRetain(v70);
                                                        CFRelease(v81);
                                                        CFTypeRef v122 = CFRetain(cfa);
                                                        if (v137)
                                                        {
                                                          if (_RenameURL(v58, cfa, v36, &error))
                                                          {
                                                            CFRelease(v122);
                                                            CFTypeRef v81 = CFRetain(v36);
LABEL_302:
                                                            char v126 = v134;
LABEL_303:
                                                            CFAllocatorRef v147 = (void *)v81;
                                                            LODWORD(MutableCopy) = 0;
                                                            int v37 = 0;
                                                            int v38 = 0;
                                                            CFURLRef v18 = 0;
                                                            if (v126) {
                                                              *char v126 = CFRetain(v70);
                                                            }
                                                            uint64_t v35 = 1;
                                                            goto LABEL_306;
                                                          }
                                                          CFAllocatorRef v147 = (void *)v122;
                                                          goto LABEL_342;
                                                        }
                                                        if (_RemoveObjectAtURL(v58, cfa, &error))
                                                        {
                                                          CFStringRef v124 = v122;
                                                          goto LABEL_301;
                                                        }
                                                        CFAllocatorRef v147 = (void *)v122;
                                                        CFURLRef v127 = cfa;
                                                        goto LABEL_349;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      int v120 = 2;
                                                      CFStringRef v121 = v70;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    int v120 = 2;
                                                    CFStringRef v121 = (const __CFString *)cfa;
                                                  }
                                                  char v125 = _FSURLCreateStandardError(v58, domain, v120, 1, v121, 0);
                                                  LODWORD(MutableCopy) = 0;
                                                  uint64_t v35 = 0;
                                                  int v37 = 0;
                                                  int v38 = 0;
                                                  CFURLRef v18 = 0;
                                                  CFErrorRef error = v125;
LABEL_306:
                                                  if (keya) {
                                                    CFRelease(keya);
                                                  }
                                                  if (v136) {
                                                    CFRelease(v136);
                                                  }
                                                  goto LABEL_310;
                                                }
                                                if (v36)
                                                {
                                                  if ((v156[1]
                                                     || v156[0]
                                                     || !v131
                                                     || !_HardLinkURL(v58, v46, v36, &error))
                                                    && !_RenameURL(v58, v46, v36, &error))
                                                  {
                                                    goto LABEL_342;
                                                  }
                                                  CFRelease(v81);
                                                  CFTypeRef v81 = CFRetain(v36);
                                                }
                                                if (_RenameURL(v58, cfa, (const __CFURL *)v70, &error))
                                                {
                                                  if (pathComponent)
                                                  {
                                                    CFURLRef v123 = v36 ? v36 : v46;
                                                    if (CFURLCopyResourcePropertyForKey(v123, v133, &cf2, 0) && cf2)
                                                    {
                                                      if (!CFEqual(pathComponent, cf2)) {
                                                        TransferDocumentIdentifier(v123, (const __CFURL *)v70);
                                                      }
                                                      CFRelease(cf2);
                                                    }
                                                  }
                                                  CFRelease(v148);
                                                  CFTypeRef v148 = CFRetain(v70);
                                                  if (v137) {
                                                    goto LABEL_302;
                                                  }
                                                  if (v36)
                                                  {
                                                    if (_RemoveObjectAtURL(v58, v36, &error))
                                                    {
                                                      CFStringRef v124 = v81;
LABEL_301:
                                                      CFRelease(v124);
                                                      CFTypeRef v81 = 0;
                                                      goto LABEL_302;
                                                    }
                                                    CFAllocatorRef v147 = (void *)v81;
LABEL_350:
                                                    LODWORD(MutableCopy) = 0;
                                                    uint64_t v35 = 0;
                                                    int v37 = 0;
                                                    CFURLRef v18 = 0;
                                                    int v38 = 1;
                                                    goto LABEL_306;
                                                  }
                                                  if (!pathComponent
                                                    || !CFURLCopyResourcePropertyForKey(v46, v133, &cf2, 0)
                                                    || !cf2)
                                                  {
                                                    goto LABEL_302;
                                                  }
                                                  if (!CFEqual(pathComponent, cf2))
                                                  {
                                                    if (!_RemoveObjectAtURL(v58, v46, &error))
                                                    {
                                                      CFAllocatorRef v147 = (void *)v81;
                                                      CFURLRef v127 = v46;
LABEL_349:
                                                      CFURLRef v36 = (const __CFURL *)CFRetain(v127);
                                                      goto LABEL_350;
                                                    }
                                                    CFRelease(v81);
                                                    CFTypeRef v81 = 0;
                                                  }
                                                  char v126 = v134;
                                                  CFRelease(cf2);
                                                  goto LABEL_303;
                                                }
                                                CFAllocatorRef v147 = (void *)v81;
LABEL_342:
                                                LODWORD(MutableCopy) = 0;
                                                uint64_t v35 = 0;
                                                int v37 = 0;
                                                int v38 = 0;
                                                CFURLRef v18 = 0;
                                                goto LABEL_306;
                                              }
                                              if (_URLIsLocked(v36, (BOOL *)&v153, &error))
                                              {
                                                if (v153)
                                                {
                                                  CFIndex code = 13;
                                                  CFURLRef v18 = (const __CFURL *)CFRetain(v36);
                                                  LODWORD(MutableCopy) = 0;
                                                  uint64_t v35 = 0;
                                                  int v38 = 0;
                                                  goto LABEL_344;
                                                }
                                                if (_RemoveObjectAtURL(v58, v36, &error)) {
                                                  goto LABEL_267;
                                                }
                                              }
                                              LODWORD(MutableCopy) = 0;
                                              uint64_t v35 = 0;
                                              int v38 = 0;
                                              CFURLRef v18 = 0;
LABEL_344:
                                              int v37 = 1;
                                              goto LABEL_306;
                                            }
                                          }
                                        }
                                      }
                                      CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                                    }
                                    else
                                    {
                                      LODWORD(MutableCopy) = 0;
                                    }
                                    if (!error)
                                    {
                                      CFIndex code = 512;
                                      CFStringRef domain = (const __CFString *)*MEMORY[0x1E4F1D148];
                                      CFURLRef v18 = (const __CFURL *)CFRetain(v149);
LABEL_339:
                                      uint64_t v35 = 0;
                                      int v37 = 0;
                                      int v38 = 0;
                                      goto LABEL_340;
                                    }
                                    goto LABEL_334;
                                  }
LABEL_332:
                                  if (!error)
                                  {
                                    CFIndex code = 512;
                                    CFStringRef domain = (const __CFString *)*MEMORY[0x1E4F1D148];
                                    CFURLRef v18 = (const __CFURL *)CFRetain(v149);
                                    LODWORD(MutableCopy) = 0;
                                    goto LABEL_339;
                                  }
                                  LODWORD(MutableCopy) = 0;
LABEL_334:
                                  uint64_t v35 = 0;
                                  int v37 = 0;
                                  int v38 = 0;
                                  CFURLRef v18 = 0;
LABEL_340:
                                  a3 = v142;
                                  a8 = v143;
                                  goto LABEL_306;
                                }
                                double v79 = v78;
                                if (!CFFileSecurityGetMode(fileSec, &mode)) {
                                  goto LABEL_177;
                                }
                                if (!v48 || v49)
                                {
                                  if (v48 || !v49)
                                  {
LABEL_152:
                                    if (CFFileSecurityGetGroup(fileSec, &group) && CFFileSecurityGetGroup(v162, &v159))
                                    {
                                      gid_t v86 = group;
                                      CFStringRef v130 = v70;
                                      if (v159 == group)
                                      {
                                        int v87 = 0;
                                        mode_t v88 = 0;
                                        mode_t v89 = mode;
                                        goto LABEL_182;
                                      }
                                      *(void *)&values.ad_name_offset = 0;
                                      *(void *)values.ad_pad = 0;
                                      uint64_t v179 = 0;
                                      *(void *)CFStringRef propertyValueTypeRefPtr = 0;
                                      int ismember = 0;
                                      uid_t v90 = _CFGetEUID();
                                      if (mbr_uid_to_uuid(v90, (unsigned __int8 *)&values)
                                        || mbr_gid_to_uuid(v86, (unsigned __int8 *)propertyValueTypeRefPtr)
                                        || mbr_check_membership((const unsigned __int8 *)&values, (const unsigned __int8 *)propertyValueTypeRefPtr, &ismember))
                                      {
                                        mode_t v91 = mode;
                                      }
                                      else
                                      {
                                        mode_t v91 = mode;
                                        int v87 = ismember;
                                        if ((_BYTE)ismember)
                                        {
                                          mode_t v88 = mode;
LABEL_181:
                                          mode_t v89 = (8 * (v91 & 7)) | v91 & 0xFFC7;
                                          mode_t mode = v89;
LABEL_182:
                                          if (CFFileSecuritySetMode(v79, v89))
                                          {
                                            if (CFFileSecurityCopyAccessControlList(fileSec, &accessControlList))
                                            {
                                              if (v48 != v49)
                                              {
                                                CFStringRef v94 = accessControlList;
                                                int v95 = 0;
                                                if (v48)
                                                {
                                                  *(void *)&values.ad_name_offset = 0;
                                                  *(void *)CFStringRef propertyValueTypeRefPtr = 0;
                                                  while (1)
                                                  {
                                                    int entry = acl_get_entry(v94, v95, (acl_entry_t *)&values);
                                                    if (entry) {
                                                      break;
                                                    }
                                                    int permset = acl_get_permset(*(acl_entry_t *)&values.ad_name_offset, (acl_permset_t *)propertyValueTypeRefPtr);
                                                    int v95 = -1;
                                                    if (!permset)
                                                    {
                                                      int v98 = acl_delete_perm(*(acl_permset_t *)propertyValueTypeRefPtr, ACL_DELETE_CHILD|ACL_SEARCH);
                                                      int v95 = -1;
                                                      if (!v98)
                                                      {
                                                        acl_set_permset(*(acl_entry_t *)&values.ad_name_offset, *(acl_permset_t *)propertyValueTypeRefPtr);
                                                        int v95 = -1;
                                                      }
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  *(void *)&values.ad_name_offset = 0;
                                                  *(void *)CFStringRef propertyValueTypeRefPtr = 0;
                                                  while (1)
                                                  {
                                                    int entry = acl_get_entry(v94, v95, (acl_entry_t *)&values);
                                                    if (entry) {
                                                      break;
                                                    }
                                                    int v99 = acl_get_permset(*(acl_entry_t *)&values.ad_name_offset, (acl_permset_t *)propertyValueTypeRefPtr);
                                                    int v95 = -1;
                                                    if (!v99)
                                                    {
                                                      int v100 = acl_add_perm(*(acl_permset_t *)propertyValueTypeRefPtr, ACL_EXECUTE);
                                                      int v95 = -1;
                                                      if (!v100)
                                                      {
                                                        acl_set_permset(*(acl_entry_t *)&values.ad_name_offset, *(acl_permset_t *)propertyValueTypeRefPtr);
                                                        int v95 = -1;
                                                      }
                                                    }
                                                  }
                                                }
                                                if (entry == -1)
                                                {
                                                  if (*__error() == 22) {
                                                    int entry = 0;
                                                  }
                                                  else {
                                                    int entry = -1;
                                                  }
                                                }
                                                if (entry) {
                                                  goto LABEL_203;
                                                }
                                              }
                                              int v93 = CFFileSecuritySetAccessControlList(v79, accessControlList);
                                              acl_free(accessControlList);
                                              if (!v93)
                                              {
                                                CFStringRef v136 = 0;
                                                goto LABEL_204;
                                              }
LABEL_206:
                                              if (v87)
                                              {
                                                CFDataRef Copy = CFFileSecurityCreateCopy(v58, v79);
                                                CFTypeRef v81 = v147;
                                                if (Copy)
                                                {
                                                  long long v102 = Copy;
                                                  CFStringRef v70 = v130;
                                                  if (CFFileSecuritySetMode(Copy, v88)
                                                    && CFFileSecuritySetGroup(v102, group))
                                                  {
                                                    CFStringRef v136 = (CFStringRef)v102;
                                                  }
                                                  else
                                                  {
                                                    CFRelease(v102);
                                                    CFStringRef v136 = 0;
                                                  }
LABEL_215:
                                                  mode_t v157 = 0;
                                                  if (!CFFileSecurityGetMode(v162, &v157) || v157 != mode) {
                                                    goto LABEL_233;
                                                  }
                                                  *(void *)&values.ad_name_offset = 0;
                                                  *(void *)CFStringRef propertyValueTypeRefPtr = 0;
                                                  int v103 = CFFileSecurityCopyAccessControlList(v162, (acl_t *)&values);
                                                  int v104 = CFFileSecurityCopyAccessControlList(v79, (acl_t *)propertyValueTypeRefPtr);
                                                  if (v103 | v104)
                                                  {
                                                    int v105 = v104;
                                                    if (!v103) {
                                                      *(void *)&values.ad_name_offset = acl_init(0);
                                                    }
                                                    if (!v105) {
                                                      *(void *)CFStringRef propertyValueTypeRefPtr = acl_init(0);
                                                    }
                                                    ssize_t v106 = acl_size(*(acl_t *)&values.ad_name_offset);
                                                    if (v106 >= 1
                                                      && (size_t v107 = v106,
                                                          v106 == acl_size(*(acl_t *)propertyValueTypeRefPtr)))
                                                    {
                                                      CFBooleanRef v108 = malloc_type_malloc(v107, 0x509991C8uLL);
                                                      BOOL v109 = malloc_type_malloc(v107, 0x302F95CDuLL);
                                                      ssize_t v110 = v109;
                                                      BOOL v111 = 0;
                                                      if (v108 && v109) {
                                                        BOOL v111 = acl_copy_ext(v108, *(acl_t *)&values.ad_name_offset, v107) >= 1&& acl_copy_ext(v110, *(acl_t *)propertyValueTypeRefPtr, v107) >= 1&& memcmp(v108, v110, v107) == 0;
                                                      }
                                                      free(v108);
                                                      free(v110);
                                                      CFTypeRef v81 = v147;
                                                    }
                                                    else
                                                    {
                                                      BOOL v111 = 0;
                                                    }
                                                    acl_free(*(void **)&values.ad_name_offset);
                                                    acl_free(*(void **)propertyValueTypeRefPtr);
                                                    if (!v111) {
LABEL_233:
                                                    }
                                                      CFDictionaryAddValue(keya, v128, v79);
                                                  }
                                                  int v93 = 1;
                                                  CFURLRef v46 = v149;
                                                  goto LABEL_235;
                                                }
                                                CFStringRef v136 = 0;
                                              }
                                              else
                                              {
                                                CFStringRef v136 = 0;
                                                CFTypeRef v81 = v147;
                                              }
                                              CFStringRef v70 = v130;
                                              goto LABEL_215;
                                            }
                                            if (CFFileSecuritySetAccessControlList(v79, (acl_t)1)) {
                                              goto LABEL_206;
                                            }
                                          }
LABEL_203:
                                          CFStringRef v136 = 0;
                                          int v93 = 0;
LABEL_204:
                                          CFTypeRef v81 = v147;
                                          CFStringRef v70 = v130;
                                          goto LABEL_235;
                                        }
                                      }
                                      int v87 = 0;
                                      mode_t v88 = 0;
                                      goto LABEL_181;
                                    }
LABEL_177:
                                    CFStringRef v136 = 0;
                                    int v93 = 0;
                                    CFTypeRef v81 = v147;
LABEL_235:
                                    CFRelease(v79);
                                    goto LABEL_236;
                                  }
                                  if ((mode & 6) != 0) {
                                    mode_t v80 = mode & 0xFFB7 | (8 * ((mode & 0x30) != 0)) | (((mode & 0x180) != 0) << 6) | 1;
                                  }
                                  else {
                                    mode_t v80 = mode & 0xFFB6 | (8 * ((mode & 0x30) != 0)) | (((mode & 0x180) != 0) << 6);
                                  }
                                }
                                else
                                {
                                  mode_t v80 = mode & 0xFFB6;
                                }
                                mode_t mode = v80;
                                goto LABEL_152;
                              }
                              CFRelease(fileSec);
                            }
                            CFStringRef v136 = 0;
                            goto LABEL_332;
                          }
                          LODWORD(MutableCopy) = 0;
                          uint64_t v35 = 0;
                          int v37 = 0;
                          int v38 = 0;
                          CFURLRef v18 = 0;
                          CFIndex code = 12;
LABEL_310:
                          if (v38 || !v36) {
                            goto LABEL_314;
                          }
                          CFRelease(v36);
                          CFURLRef v36 = 0;
                          goto LABEL_313;
                        }
                        char v71 = v137;
                        if (v48 | v49) {
                          char v71 = 1;
                        }
                        if ((v71 & 1) == 0) {
                          goto LABEL_127;
                        }
                        if (v138) {
                          goto LABEL_122;
                        }
                        if (CFURLGetFileSystemRepresentation(v149, 1u, (UInt8 *)&values, 1024))
                        {
                          CFStringRef v82 = (const char *)_amkrtemp();
                          if (!v82)
                          {
                            int v85 = *__error();
                            goto LABEL_352;
                          }
                          CFStringRef v83 = (UInt8 *)v82;
                          size_t v84 = strlen(v82);
                          CFURLRef v36 = CFURLCreateFromFileSystemRepresentation(allocator, v83, v84, v48);
                          free(v83);
                          if (v36) {
                            goto LABEL_123;
                          }
                        }
                        int v85 = 2;
LABEL_352:
                        CFIndex code = v85;
                        CFURLRef v18 = (const __CFURL *)CFRetain(url);
                        LODWORD(MutableCopy) = 0;
                        uint64_t v35 = 0;
                        CFURLRef v36 = 0;
                        int v37 = 0;
                        int v38 = 0;
                        a3 = v142;
                        a8 = v143;
                        goto LABEL_314;
                      }
LABEL_64:
                      LODWORD(MutableCopy) = 0;
                      uint64_t v35 = 0;
                      CFURLRef v36 = 0;
                      int v37 = 0;
                      int v38 = 0;
                      CFURLRef v18 = 0;
                      goto LABEL_69;
                    }
                  }
                  else
                  {
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                  }
                }
                CFIndex v52 = 18;
                goto LABEL_67;
              }
              CFIndex v92 = 13;
              goto LABEL_173;
            }
            uint64_t v35 = 0;
            CFURLRef v36 = 0;
            int v37 = 0;
            int v38 = 0;
          }
          else
          {
            uint64_t v35 = 0;
            CFURLRef v36 = 0;
            int v37 = 0;
          }
          CFURLRef v18 = 0;
        }
        else
        {
          uint64_t v35 = 0;
          CFURLRef v36 = 0;
          int v37 = 0;
          int v38 = 0;
          CFURLRef v18 = 0;
          CFErrorRef error = CFErrorCreate(allocator, domain, 12, 0);
        }
LABEL_175:
        LODWORD(MutableCopy) = 1;
        goto LABEL_69;
      }
      LODWORD(MutableCopy) = 0;
      uint64_t v35 = 0;
      CFURLRef v36 = 0;
      int v37 = 0;
      CFURLRef v18 = 0;
    }
    else
    {
      uint64_t v35 = 0;
      CFURLRef v36 = 0;
      int v37 = 0;
      int v38 = 0;
      CFURLRef v18 = 0;
      CFErrorRef error = CFErrorCreate(allocator, domain, 12, 0);
    }
    a3 = v142;
    a8 = v143;
    goto LABEL_69;
  }
  if (a4)
  {
LABEL_14:
    CFURLRef value = v14;
    CFAllocatorRef v147 = (void *)v16;
    CFAllocatorRef allocator = MutableCopy;
    uint64_t v34 = CFErrorCreate(MutableCopy, (CFErrorDomain)*MEMORY[0x1E4F1D158], -50, 0);
    LODWORD(MutableCopy) = 0;
    uint64_t v35 = 0;
    CFURLRef v36 = 0;
    int v37 = 0;
    int v38 = 0;
    CFURLRef v18 = 0;
    CFErrorRef error = v34;
  }
  else
  {
    if (_RenameURL(MutableCopy, (CFURLRef)a3, v14, &error))
    {
      if (a7) {
        *a7 = CFRetain(v14);
      }
      CFURLRef v54 = (const __CFURL *)_CFURLPromiseCopyPhysicalURL();
      if (!v54)
      {
        int v56 = 0;
        CFURLRef v18 = 0;
        CFURLRef v36 = 0;
        uint64_t v35 = 1;
        goto LABEL_99;
      }
      CFURLRef v55 = v54;
      TransferDocumentIdentifier(v54, v14);
      int v56 = 0;
      CFURLRef v18 = 0;
      CFURLRef v36 = 0;
      uint64_t v57 = 1;
LABEL_98:
      CFRelease(v55);
      uint64_t v35 = v57;
      goto LABEL_99;
    }
    CFAllocatorRef allocator = MutableCopy;
    CFURLRef value = v14;
    CFAllocatorRef v147 = (void *)v16;
    LODWORD(MutableCopy) = 0;
    uint64_t v35 = 0;
    CFURLRef v36 = 0;
    int v37 = 0;
    int v38 = 0;
    CFURLRef v18 = 0;
  }
LABEL_71:
  int v56 = 0;
  if (!a8 || v35)
  {
    CFURLRef v14 = value;
    CFTypeRef v16 = v147;
    goto LABEL_99;
  }
  __int16 v62 = error;
  if (!error)
  {
    if (v18)
    {
      *(void *)&values.ad_name_offset = @"NSURL";
      *(void *)CFStringRef propertyValueTypeRefPtr = v18;
      __int16 v62 = CFErrorCreateWithUserInfoKeysAndValues(allocator, domain, code, (const void *const *)&values, (const void *const *)propertyValueTypeRefPtr, 1);
    }
    else
    {
      __int16 v62 = CFErrorCreate(allocator, domain, code, 0);
    }
    CFErrorRef error = v62;
  }
  if (v37 | MutableCopy)
  {
    CFIndex code = 512;
  }
  else
  {
    if (v62)
    {
      CFErrorDomain v63 = CFErrorGetDomain(v62);
      CFIndex v64 = CFErrorGetCode(error);
      CFErrorDomain v65 = v63;
    }
    else
    {
      CFIndex v64 = code;
      CFErrorDomain v65 = domain;
    }
    _FSURLTranslateDomainAndCodeToCocoaError(v65, v64, 1, &code);
  }
  CFStringRef v66 = (const __CFString *)*MEMORY[0x1E4F1D148];
  CFDataRef Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFURLRef v55 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"NSURL", value);
    if (v147) {
      CFDictionarySetValue(v55, @"NSFileOriginalItemLocationKey", v147);
    }
    CFDictionarySetValue(v55, @"NSFileNewItemLocationKey", v148);
    if (v38 && v36) {
      CFDictionarySetValue(v55, @"NSFileBackupItemLeftBehindLocationKey", v36);
    }
    if (error) {
      CFDictionarySetValue(v55, (const void *)*MEMORY[0x1E4F1D190], error);
    }
    if (v37) {
      CFDictionarySetValue(v55, @"NSUserStringVariant", @"Backup");
    }
  }
  CFErrorRef v68 = CFErrorCreate(allocator, v66, code, v55);
  *a8 = v68;
  if (!v68) {
    *a8 = CFErrorCreate(allocator, v66, 512, 0);
  }
  uint64_t v57 = 0;
  uint64_t v35 = 0;
  int v56 = 1;
  CFURLRef v14 = value;
  CFTypeRef v16 = v147;
  if (v55) {
    goto LABEL_98;
  }
LABEL_99:
  if (error) {
    CFRelease(error);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v16) {
    CFRelease(v16);
  }
  CFRelease(v148);
  if (v36) {
    CFRelease(v36);
  }
  CFURLClearResourcePropertyCache(v14);
  CFURLClearResourcePropertyCache((CFURLRef)a3);
  if (v56 && !*a8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _URLReplaceObject_cold_1();
    }
    *a8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D148], 256, 0);
  }
  return v35;
}

uint64_t _RenameURL(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  CFURLRef v6 = url;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (CFURLGetFileSystemRepresentation(url, 1u, (UInt8 *)buffer, 1024))
  {
    if (!CFURLGetFileSystemRepresentation(a3, 1u, (UInt8 *)v13, 1024))
    {
      int v10 = 2;
      CFURLRef v6 = a3;
      if (a4) {
        goto LABEL_8;
      }
      return 0;
    }
    rename(buffer, v13, v8);
    if (!v9) {
      return 1;
    }
    int v10 = *__error();
    if (!v10) {
      return 1;
    }
  }
  else
  {
    int v10 = 2;
  }
  if (a4)
  {
LABEL_8:
    char v12 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E4F1D160], v10, 1, (const __CFString *)v6, 0);
    uint64_t result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

void TransferDocumentIdentifier(const __CFURL *a1, const __CFURL *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFTypeRef propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1D5B0], &propertyValueTypeRefPtr, 0)) {
    BOOL v4 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    if (CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024)
      && CFURLGetFileSystemRepresentation(a2, 1u, v7, 1024))
    {
      int v5 = open((const char *)v7, 0);
      if ((v5 & 0x80000000) == 0)
      {
        fsctl((const char *)buffer, 0x80046820uLL, &v5, 0);
        close(v5);
      }
    }
    CFRelease(propertyValueTypeRefPtr);
  }
}

uint64_t _URLIsDirectory(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  CFTypeRef propertyValueTypeRefPtr = 0;
  uint64_t v4 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1D678], &propertyValueTypeRefPtr, error);
  if (v4)
  {
    int v5 = propertyValueTypeRefPtr;
    *a2 = propertyValueTypeRefPtr == (const void *)*MEMORY[0x1E4F1CFD0];
    CFRelease(v5);
  }
  else
  {
    *a2 = 0;
  }
  return v4;
}

uint64_t _URLIsFile(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  CFTypeRef propertyValueTypeRefPtr = 0;
  uint64_t v4 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1D6B8], &propertyValueTypeRefPtr, error);
  if (v4)
  {
    int v5 = propertyValueTypeRefPtr;
    *a2 = propertyValueTypeRefPtr == (const void *)*MEMORY[0x1E4F1CFD0];
    CFRelease(v5);
  }
  else
  {
    *a2 = 0;
  }
  return v4;
}

uint64_t _URLIsLocked(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  CFTypeRef cf = 0;
  CFTypeRef propertyValueTypeRefPtr = 0;
  *a2 = 0;
  uint64_t v6 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1D6D0], &cf, error);
  if (v6)
  {
    BOOL v7 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (cf == (CFTypeRef)*MEMORY[0x1E4F1CFD0])
    {
      *a2 = 1;
    }
    else if (_CFGetEUID())
    {
      uint64_t v6 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1D6E0], &propertyValueTypeRefPtr, error);
      if (v6)
      {
        char v8 = propertyValueTypeRefPtr;
        *a2 = propertyValueTypeRefPtr == v7;
        CFRelease(v8);
      }
    }
    CFRelease(cf);
  }
  return v6;
}

uint64_t _RemoveObjectAtURL(const __CFAllocator *a1, CFURLRef url, __CFError **a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024))
  {
    int v7 = 2;
    if (a3) {
      goto LABEL_5;
    }
    return 0;
  }
  uint64_t v6 = 1;
  if (removefile((const char *)buffer, 0, 1u))
  {
    int v7 = *__error();
    if (v7)
    {
      if (a3)
      {
LABEL_5:
        uint64_t v6 = 0;
        *a3 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E4F1D160], v7, 1, (const __CFString *)url, 0);
        return v6;
      }
      return 0;
    }
  }
  return v6;
}

uint64_t _HardLinkURL(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  CFURLRef v6 = url;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024))
  {
    if (!CFURLGetFileSystemRepresentation(a3, 1u, v11, 1024))
    {
      int v8 = 2;
      CFURLRef v6 = a3;
      if (a4) {
        goto LABEL_8;
      }
      return 0;
    }
    if (!link((const char *)buffer, (const char *)v11)) {
      return 1;
    }
    int v8 = *__error();
    if (!v8) {
      return 1;
    }
  }
  else
  {
    int v8 = 2;
  }
  if (a4)
  {
LABEL_8:
    uint64_t v10 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E4F1D160], v8, 1, (const __CFString *)v6, 0);
    uint64_t result = 0;
    *a4 = v10;
    return result;
  }
  return 0;
}

uint64_t TransferExtendedAttributes(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  CFURLRef v6 = url;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!CFURLGetFileSystemRepresentation(url, 1u, v26, 1024))
  {
    int v22 = 2;
    goto LABEL_26;
  }
  uint64_t v8 = CFURLGetFileSystemRepresentation(a3, 1u, v25, 1024);
  if (!v8)
  {
    int v22 = 2;
LABEL_25:
    CFURLRef v6 = a3;
    goto LABEL_26;
  }
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = v24;
  memset(v24, 0, sizeof(v24));
  uint64_t v10 = 1;
  ssize_t v11 = listxattr((const char *)v26, v24, 0x200uLL, 1);
  if (!v11) {
    return v10;
  }
  ssize_t v12 = v11;
  if ((v11 & 0x8000000000000000) == 0)
  {
    int v13 = 0;
    CFURLRef v14 = &v24[v11];
    goto LABEL_6;
  }
  if (*__error() != 34)
  {
    int v13 = 0;
LABEL_23:
    a3 = 0;
    int v22 = *__error();
    if (v13) {
LABEL_24:
    }
      free(v9);
    goto LABEL_25;
  }
  ssize_t v17 = listxattr((const char *)v26, 0, 0, 1);
  if (!v17) {
    return v10;
  }
  if (v17 <= 0 || (size_t v18 = v17 + 4096, (v19 = (char *)malloc_type_malloc(v17 + 4096, 0x98429E16uLL)) == 0))
  {
    int v22 = *__error();
LABEL_26:
    if (!a4) {
      return 0;
    }
    uint64_t v23 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x1E4F1D160], v22, 1, (const __CFString *)v6, 0);
    uint64_t v10 = 0;
    *a4 = v23;
    return v10;
  }
  uint64_t v9 = v19;
  int v13 = 1;
  ssize_t v20 = listxattr((const char *)v26, v19, v18, 1);
  if (v20 < 0) {
    goto LABEL_23;
  }
  if (v20)
  {
    CFURLRef v14 = &v9[v20];
LABEL_6:
    uint64_t v15 = v9;
    while (1)
    {
      if (xattr_preserve_for_intent(v15, 2u))
      {
        int v16 = copyExtendedAttribute((const char *)v26, (const char *)v25, v15);
        if (v16) {
          break;
        }
      }
      v15 += strlen(v15) + 1;
      if (v15 >= v14)
      {
        if ((v12 & 0x8000000000000000) == 0) {
          return 1;
        }
        goto LABEL_19;
      }
    }
    int v22 = v16;
    if (v13) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
LABEL_19:
  free(v9);
  return 1;
}

uint64_t copyExtendedAttribute(const char *a1, const char *path, const char *name)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ssize_t v6 = getxattr(path, name, 0, 0, 0, 1);
  uint64_t v7 = 0;
  if ((v6 & 0x8000000000000000) == 0) {
    return v7;
  }
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = v16;
  memset(v16, 0, 512);
  ssize_t v9 = getxattr(a1, name, v16, 0x200uLL, 0, 1);
  if (v9 < 0)
  {
    if (*__error() != 34)
    {
      int v11 = 0;
LABEL_13:
      uint64_t v7 = *__error();
      if (!v11) {
        return v7;
      }
      goto LABEL_10;
    }
    ssize_t v12 = getxattr(a1, name, 0, 0, 0, 1);
    if (v12 < 0) {
      return *__error();
    }
    size_t v13 = v12 + 4096;
    CFURLRef v14 = malloc_type_malloc(v12 + 4096, 0xF204A2EDuLL);
    if (!v14) {
      return 4294967188;
    }
    uint64_t v8 = v14;
    int v11 = 1;
    ssize_t v10 = getxattr(a1, name, v14, v13, 0, 1);
    if (v10 < 0) {
      goto LABEL_13;
    }
  }
  else
  {
    ssize_t v10 = v9;
    int v11 = 0;
  }
  uint64_t v7 = 0;
  if (setxattr(path, name, v8, v10, 0, 1)) {
    goto LABEL_13;
  }
  if (v11) {
LABEL_10:
  }
    free(v8);
  return v7;
}

uint64_t PosixToOSStatusTranslate(int a1)
{
  while (2)
  {
    if (a1 >= -1)
    {
      if (a1 <= 62)
      {
        int v1 = a1 + 1;
        LOWORD(a1) = 0;
        switch(v1)
        {
          case 0:
            if (*__error() == -1) {
              goto LABEL_16;
            }
            a1 = *__error();
            continue;
          case 1:
            return (__int16)a1;
          case 2:
          case 14:
            LOWORD(a1) = -5000;
            return (__int16)a1;
          case 3:
            LOWORD(a1) = -43;
            return (__int16)a1;
          case 10:
            LOWORD(a1) = -51;
            return (__int16)a1;
          case 13:
          case 24:
            LOWORD(a1) = -41;
            return (__int16)a1;
          case 17:
            goto LABEL_13;
          case 18:
            LOWORD(a1) = -48;
            return (__int16)a1;
          case 19:
            LOWORD(a1) = -1303;
            return (__int16)a1;
          case 21:
            LOWORD(a1) = -1407;
            return (__int16)a1;
          case 23:
            LOWORD(a1) = -50;
            return (__int16)a1;
          case 25:
            LOWORD(a1) = -42;
            return (__int16)a1;
          case 28:
            LOWORD(a1) = -1309;
            return (__int16)a1;
          case 29:
            LOWORD(a1) = -34;
            return (__int16)a1;
          case 31:
            LOWORD(a1) = -61;
            return (__int16)a1;
          default:
            goto LABEL_16;
        }
      }
      if (a1 <= 68)
      {
        if (a1 == 63)
        {
          LOWORD(a1) = -37;
          return (__int16)a1;
        }
        if (a1 == 66)
        {
LABEL_13:
          LOWORD(a1) = -47;
          return (__int16)a1;
        }
      }
      else
      {
        switch(a1)
        {
          case 'E':
            LOWORD(a1) = -1425;
            return (__int16)a1;
          case 'P':
            LOWORD(a1) = -5023;
            return (__int16)a1;
          case 'Y':
            LOWORD(a1) = -128;
            return (__int16)a1;
        }
      }
LABEL_16:
      LOWORD(a1) = -36;
    }
    return (__int16)a1;
  }
}

uint64_t ConvertCFAbsoluteTimeToUTCDateTime(uint64_t a1, double a2)
{
  if (!a1) {
    return 4294967246;
  }
  double v2 = a2 + 3061152000.0;
  if (v2 <= 9.22337204e18)
  {
    if (v2 >= -9.22337204e18)
    {
      if (v2 < 0.0) {
        goto LABEL_9;
      }
      if (v2 > -0.5 && v2 < 0.5) {
        unint64_t v3 = 0;
      }
      else {
        unint64_t v3 = (unint64_t)v2;
      }
      if (v3 > 0xFFFFFFFFFFFELL) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v2 < 0.0) {
        goto LABEL_9;
      }
      unint64_t v3 = 0;
    }
    unint64_t v5 = HIDWORD(v3);
    double v9 = v2 * 65536.0 + 0.5;
    if (v9 <= 9.22337204e18)
    {
      if (v9 >= -9.22337204e18 && (v9 < 0.5 ? (BOOL v10 = v9 <= -0.5) : (BOOL v10 = 1), v10)) {
        unint64_t v4 = (unint64_t)v9;
      }
      else {
        LOWORD(v4) = 0;
      }
    }
    else
    {
      LOWORD(v4) = -1;
    }
    goto LABEL_10;
  }
  if (v2 < 0.0)
  {
LABEL_9:
    LOWORD(v4) = 0;
    LODWORD(v3) = 0;
    LOWORD(v5) = 0;
    goto LABEL_10;
  }
LABEL_4:
  LODWORD(v3) = -1;
  LOWORD(v4) = -1;
  LOWORD(v5) = -1;
LABEL_10:
  uint64_t v6 = 0;
  *(_WORD *)a1 = v5;
  *(_DWORD *)(a1 + 2) = v3;
  *(_WORD *)(a1 + 6) = v4;
  return v6;
}

void ___ZL15CreateMountInfoiP12MountInfoBuf_block_invoke_2()
{
}

uint64_t CopyFromFileProvider(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4, double a5)
{
  double Helper_x8__FPCFCopyAttributeValuesForItem = gotLoadHelper_x8__FPCFCopyAttributeValuesForItem(a5);
  if (*(void *)(v6 + 2408)) {
    *a3 = (const void *)FPCFCopyAttributeValuesForItem_delayInitStub(Helper_x8__FPCFCopyAttributeValuesForItem);
  }
  else {
    *a3 = 0;
  }
  return 1;
}

uint64_t SetWithFileProvider(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4, double a5)
{
  double Helper_x8__FPCFSetAttributeValueForItem = gotLoadHelper_x8__FPCFSetAttributeValueForItem(a5);
  if (*(void *)(v6 + 2416)) {
    return FPCFSetAttributeValueForItem_delayInitStub(Helper_x8__FPCFSetAttributeValueForItem);
  }
  else {
    return 1;
  }
}

uint64_t GetFromCFURLPromises(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4)
{
  return _CFURLPromiseCopyResourcePropertyForKey();
}

uint64_t SetWithCFURLPromises(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4)
{
  return _CFURLPromiseSetResourcePropertyForKey();
}

uint64_t GetFromQuickLook(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4, double a5)
{
  double Helper_x8___QLCopyResourcePropertyForKey = gotLoadHelper_x8___QLCopyResourcePropertyForKey(a5);
  if (*(void *)(v6 + 1872))
  {
    return _QLCopyResourcePropertyForKey_delayInitStub(Helper_x8___QLCopyResourcePropertyForKey);
  }
  else
  {
    *a3 = 0;
    return 1;
  }
}

uint64_t SetWithQuickLook(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4, double a5)
{
  double Helper_x8___QLSetResourcePropertyForKey = gotLoadHelper_x8___QLSetResourcePropertyForKey(a5);
  if (*(void *)(v6 + 1880)) {
    return _QLSetResourcePropertyForKey_delayInitStub(Helper_x8___QLSetResourcePropertyForKey);
  }
  else {
    return 1;
  }
}

uint64_t ExternalProviderCopyValues(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, const void ***a5, uint64_t a6)
{
  if (a6 < 1) {
    return 1;
  }
  cf[5] = v6;
  cf[6] = v7;
  uint64_t v8 = a6;
  while (1)
  {
    cf[0] = 0;
    uint64_t result = _FileCacheGetPropertyValueForKey(a2, **a5, (void **)cf);
    if (!result) {
      break;
    }
    if (cf[0])
    {
      CFRetain(cf[0]);
      CFTypeRef v13 = cf[0];
    }
    else
    {
      CFTypeRef v13 = 0;
    }
    *a4++ = v13;
    ++a5;
    if (!--v8) {
      return 1;
    }
  }
  *a4 = 0;
  return result;
}

uint64_t ExternalProviderPrepareValues(const __CFURL *a1, uint64_t a2, const void **a3, uint64_t *a4, uint64_t a5, uint64_t a6, __CFError **a7)
{
  if (a5 < 1) {
    return 1;
  }
  uint64_t v8 = a5;
  CFDataRef Mutable = 0;
  CFURLRef v14 = (const void *)*MEMORY[0x1E4F1D7D0];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F1D7D8];
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (1)
  {
    CFTypeRef cf = 0;
    uint64_t v15 = *a3;
    uint64_t v16 = *a4;
    if (!_FileCacheGetPropertyValueForKey(a2, *a3, (void **)&cf)) {
      break;
    }
LABEL_4:
    ++a4;
    ++a3;
    if (!--v8)
    {
      uint64_t v19 = 1;
      if (!Mutable) {
        return v19;
      }
      goto LABEL_17;
    }
  }
  size_t v18 = *(uint64_t (**)(const __CFURL *, const void *, const void **, __CFError **, double))(v16 + 16);
  if (v18 == CopyFromFileProvider)
  {
    if (CFEqual(v15, v14) || CFEqual(v15, cf2))
    {
      _FileCacheSetPropertyValueForKey(a2, v15, 0);
    }
    else
    {
      if (!Mutable) {
        CFDataRef Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E4F1D510]);
      }
      CFArrayAppendValue(Mutable, v15);
    }
    goto LABEL_4;
  }
  if (((unsigned int (*)(const __CFURL *, const void *, CFTypeRef *, __CFError **))v18)(a1, v15, &cf, a7))
  {
    _FileCacheSetPropertyValueForKey(a2, v15, cf);
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_4;
  }
  uint64_t v19 = 0;
  if (!Mutable) {
    return v19;
  }
LABEL_17:
  CFTypeRef cf = 0;
  if (CopyFromFileProvider(a1, Mutable, &cf, a7, v17))
  {
    if (cf)
    {
      CFIndex Count = CFArrayGetCount(Mutable);
      if (Count >= 1)
      {
        CFIndex v21 = Count;
        for (CFIndex i = 0; i != v21; ++i)
        {
          CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(Mutable, i);
          Boolean Value = CFDictionaryGetValue((CFDictionaryRef)cf, ValueAtIndex);
          _FileCacheSetPropertyValueForKey(a2, ValueAtIndex, Value);
        }
      }
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  CFRelease(Mutable);
  return v19;
}

uint64_t ExternalProviderSetValues(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a6 < 1) {
    return 1;
  }
  uint64_t v9 = a6;
  while (1)
  {
    CFURLRef v14 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)a5 + 24);
    if (v14)
    {
      uint64_t result = v14(a1, *a3, *a4, a8);
      if (!result) {
        break;
      }
    }
    a5 += 8;
    ++a4;
    ++a3;
    if (!--v9) {
      return 1;
    }
  }
  return result;
}

uint64_t _CFURLCopySecurityEAs()
{
  return 0;
}

uint64_t _FSGetTypeInfoFromStatfs(uint64_t a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!check_mntfromname((const char *)(a1 + 72)))
  {
    __strlcpy_chk();
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v8 = a1 + 1112;
  uint64_t v9 = strstr((char *)(a1 + 1112), "://");
  if (!v9) {
    return 22;
  }
  if ((unint64_t)&v9[-v8] >= 0xF) {
    uint64_t v10 = 15;
  }
  else {
    uint64_t v10 = (uint64_t)&v9[-v8];
  }
  __memcpy_chk();
  __source[v10] = 0;
  if (a2) {
LABEL_9:
  }
    strlcpy(a2, __source, a3);
LABEL_10:
  uint64_t result = 0;
  if (a4) {
    *a4 = *(_DWORD *)(a1 + 68);
  }
  return result;
}

BOOL check_mntfromname(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetTypeInfoForPath(const char *a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(&v8, 0, 512);
  if (statfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetTypeInfoForFileDescriptor(int a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(&v8, 0, 512);
  if (fstatfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    uint64_t v7 = v6;
    if (check_mntfromname((const char *)(a1 + 72)))
    {
      statfs v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (uint64_t v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0))
      {
        uint64_t v12 = 22;
LABEL_17:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023) {
        uint64_t v11 = 1023;
      }
      else {
        uint64_t v11 = v10 - v9;
      }
      __memcpy_chk();
      *((unsigned char *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        uint64_t v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL)) {
        strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL);
      }
      __strlcpy_chk();
      if (!a2) {
        goto LABEL_16;
      }
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }
  return 12;
}

uint64_t _FSGetLocationForPath(const char *a1, char *a2, size_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(&v6, 0, 512);
  if (statfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

uint64_t _FSGetLocationForFileDescriptor(int a1, char *a2, size_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(&v6, 0, 512);
  if (fstatfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

void BookmarkData::BookmarkData(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  unint64_t v3 = "BookmarkData";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_181761000, a2, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v2, 0x16u);
}

void BookmarkData::copyItem(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_181761000, a2, OS_LOG_TYPE_ERROR, "BookmarkData: Corrupt bookmark file; container dataItemPtr %{public}p already used",
    (uint8_t *)&v2,
    0xCu);
}

void BookmarkMutableData::Finalize()
{
  __assert_rtn("Finalize", "BookmarkData.cpp", 1672, "scopeKeyLength == kBookmarkSecurityScopeCookieSize");
}

void __CFURLCreateBookmarkData(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "__CFURLCreateBookmarkData";
  _os_log_error_impl(&dword_181761000, log, OS_LOG_TYPE_ERROR, "%s: NULL result with no real error", (uint8_t *)&v1, 0xCu);
}

void _CFURLCreateBookmarkData_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_181761000, a2, OS_LOG_TYPE_DEBUG, "result=<%p %@>", (uint8_t *)&v2, 0x16u);
}

void _FileCacheCopyDebugDesc()
{
  __assert_rtn("_FileCacheCopyDebugDesc", "FileCache.cp", 219, "formatter != NULL");
}

{
  __assert_rtn("_FileCacheCopyDebugDesc", "FileCache.cp", 223, "result != NULL");
}

void _CFURLCreateBookmarkDataFromFile_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_181761000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_URLCreateByResolvingAliasFile: NULL result with no real error", v0, 2u);
}

void _CFURLWriteBookmarkDataToFile_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_181761000, log, OS_LOG_TYPE_ERROR, "FAILED creating bookmark file at %@, error=%@", (uint8_t *)&v3, 0x16u);
}

void _CFURLWriteBookmarkDataToFile_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "_CFURLWriteBookmarkDataToFile";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_181761000, log, OS_LOG_TYPE_ERROR, "%s: destination URL %{public}@ exists but does not point to a valid file, so exiting with an error %{public}@", (uint8_t *)&v3, 0x20u);
}

void _CFURLCreateByResolvingBookmarkData_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "_CFURLCreateByResolvingBookmarkData";
  _os_log_error_impl(&dword_181761000, log, OS_LOG_TYPE_ERROR, "%s: NULL result with no real error", (uint8_t *)&v1, 0xCu);
}

void _URLCreateByResolvingAliasFile_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "_URLCreateByResolvingAliasFile";
  _os_log_error_impl(&dword_181761000, log, OS_LOG_TYPE_ERROR, "%s: NULL result with no real error", (uint8_t *)&v1, 0xCu);
}

void CFURLCreateByResolvingDataInBookmark(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = 1;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_debug_impl(&dword_181761000, a2, OS_LOG_TYPE_DEBUG, "Bookmark was to an item on a local drive; checking if it's the boot drive and if the uuid matches.  onBoot=%{BOOL}d volMountPath=%@",
    (uint8_t *)v2,
    0x12u);
}

void matchVolumeURLForBookmark()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_181761000, v0, v1, "Discarding capacity & creation date match because we found more than one possibility.", v2, v3, v4, v5, v6);
}

void _FSURLCopyResourcePropertyForKeyInternal()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLCopyResourcePropertyForKeyInternal: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLCopyResourcePropertiesForKeysInternal()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLCopyResourcePropertiesForKeysInternal: NULL result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLSetResourcePropertyForKey_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLSetResourcePropertyForKey: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLSetResourcePropertiesForKeys_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLSetResourcePropertiesForKeys: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLSetResourcePropertiesForKeys_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLSetResourcePropertiesForKeys: returning false without an error", v2, v3, v4, v5, v6);
}

void _FSURLResourceIsReachable_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLResourceIsReachable: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLCreateStandardError_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLCreateStandardError: NULL result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLCopyResourcePropertyValuesAndFlags_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLCopyResourcePropertyValuesAndFlags: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLGetResourcePropertyFlags_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLGetResourcePropertyFlags: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLGetVolumePropertyFlags_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLGetVolumePropertyFlags: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSCreatePathForFileID_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSCreatePathForFileID: NULL result with no real error", v2, v3, v4, v5, v6);
}

void _FSGetFileSystemRepresentationForFileID_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSGetFileSystemRepresentationForFileID: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLCacheResourcePropertyForKey_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLCacheResourcePropertyForKey: false result with no real error", v2, v3, v4, v5, v6);
}

void _FSURLCacheResourcePropertiesForKeys_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FSURLCacheResourcePropertiesForKeys: false result with no real error", v2, v3, v4, v5, v6);
}

void _FileURLCreateDisplayPathComponentsArray_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FileURLCreateDisplayPathComponentsArray(1): NULL result with no real error", v2, v3, v4, v5, v6);
}

void _FileURLCreateDisplayPathComponentsArray_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_181761000, v0, v1, "_FileURLCreateDisplayPathComponentsArray(2): NULL result with no real error", v2, v3, v4, v5, v6);
}

void _URLEnumeratorGetNextURL_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_181761000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_URLEnumeratorGetNextURL: NULL result with no real error", v0, 2u);
}

void _URLEnumeratorGetURLsBulk_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_181761000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_URLEnumeratorGetURLsBulk: NULL result with no real error", v0, 2u);
}

void append()
{
}

{
  __assert_rtn("append", "SandboxExtensionCache.cpp", 106, "newItem");
}

void remove()
{
}

{
  __assert_rtn("remove", "SandboxExtensionCache.cpp", 118, "oldItem");
}

void remove(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 16));
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_181761000, a2, OS_LOG_TYPE_ERROR, "CacheItem list corrupted for extension %s", v3, 0xCu);
}

void SandboxExtensionCache::insert()
{
}

{
  __assert_rtn("insert", "SandboxExtensionCache.cpp", 171, "extension");
}

void SandboxExtensionCache::_insert()
{
}

{
  __assert_rtn("_insert", "SandboxExtensionCache.cpp", 369, "extension");
}

void SandboxExtensionCache::move()
{
}

void SandboxExtensionCache::move(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_2_0(&dword_181761000, a1, a3, "%s: failed to get file system representation for the dst path.", a5, a6, a7, a8, 2u);
}

void SandboxExtensionCache::move(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315650;
  uint8_t v6 = "move";
  __int16 v7 = 2082;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_181761000, a2, OS_LOG_TYPE_ERROR, "%s: get_fsid_and_file_id error for path=%{public}s: %{errno}d", (uint8_t *)&v5, 0x1Cu);
}

void SandboxExtensionCache::move(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315650;
  int v5 = "move";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_181761000, log, OS_LOG_TYPE_ERROR, "%s: error getting path for url=%{public}@: %{public}@", (uint8_t *)&v4, 0x20u);
}

void SandboxExtensionCache::consume()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_181761000, v0, OS_LOG_TYPE_DEBUG, "<%p %@>: called <StartAccessing> on a URL that is not security-scoped", v1, 0x16u);
}

{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_181761000, v0, OS_LOG_TYPE_ERROR, "<%p %@>: internal sandbox error for <StartAccessing>", v1, 0x16u);
}

void SandboxExtensionCache::_consume()
{
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_3_0(&dword_181761000, v0, v1, "sandbox_extension_consume error=%{errno}d for path %@", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_181761000, v0, v1, "unexpected return value from sandbox_extension_consume: %lld", v2, v3, v4, v5, v6);
}

void SandboxExtensionCache::release()
{
  OUTLINED_FUNCTION_3();
  WORD2(v3) = 2080;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_9(&dword_181761000, v0, v1, "%p: releasing extension by path for %s", v2, v3);
}

{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_181761000, v0, OS_LOG_TYPE_DEBUG, "<%p %@>: called <StopAccessing> too many times or URL isn't security-scoped", v1, 0x16u);
}

{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_181761000, v0, OS_LOG_TYPE_ERROR, "<%p %@>: internal sandbox error for <StopAccessing>", v1, 0x16u);
}

void SandboxExtensionCache::_release(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 8);
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_9(&dword_181761000, a2, a3, "handle %lld: decrementing ref count to %lld", (void)v3, *((void *)&v3 + 1));
}

void SandboxExtensionCache::_release(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_9(&dword_181761000, a2, a3, "handle %lld: released extension for path %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void SandboxExtensionCache::_release()
{
  __error();
  OUTLINED_FUNCTION_3_0(&dword_181761000, v0, v1, "handle %lld: sandbox_extension_release error %{errno}d", v2, v3, v4, v5, 0);
}

void _URLReplaceObject_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_181761000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_URLReplaceObject: false result with no real error", v0, 2u);
}

void _URLAttachSecurityScopeToFileURL_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_181761000, a2, OS_LOG_TYPE_ERROR, "cannot attach security scope to a URL that is not a file URL: <%p %@>", (uint8_t *)&v2, 0x16u);
}

void _URLAttachSecurityScopeToFileURL_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_181761000, a2, OS_LOG_TYPE_DEBUG, "%p: removing sandbox extension", (uint8_t *)&v2, 0xCu);
}

void _URLAttachSecurityScopeToFileURL_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_181761000, log, OS_LOG_TYPE_ERROR, "sandboxExtension to attach was not a CFData object", v1, 2u);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1F40D70D8](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetLastIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71D0](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1F40D77B8]();
}

uint64_t CFCopyUserName()
{
  return MEMORY[0x1F40D77D8]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1F40D78D8](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7A90](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

Boolean CFFileSecurityCopyAccessControlList(CFFileSecurityRef fileSec, acl_t *accessControlList)
{
  return MEMORY[0x1F40D7B00](fileSec, accessControlList);
}

Boolean CFFileSecurityCopyGroupUUID(CFFileSecurityRef fileSec, CFUUIDRef *groupUUID)
{
  return MEMORY[0x1F40D7B08](fileSec, groupUUID);
}

Boolean CFFileSecurityCopyOwnerUUID(CFFileSecurityRef fileSec, CFUUIDRef *ownerUUID)
{
  return MEMORY[0x1F40D7B10](fileSec, ownerUUID);
}

CFFileSecurityRef CFFileSecurityCreate(CFAllocatorRef allocator)
{
  return (CFFileSecurityRef)MEMORY[0x1F40D7B18](allocator);
}

CFFileSecurityRef CFFileSecurityCreateCopy(CFAllocatorRef allocator, CFFileSecurityRef fileSec)
{
  return (CFFileSecurityRef)MEMORY[0x1F40D7B20](allocator, fileSec);
}

Boolean CFFileSecurityGetGroup(CFFileSecurityRef fileSec, gid_t *group)
{
  return MEMORY[0x1F40D7B28](fileSec, group);
}

Boolean CFFileSecurityGetMode(CFFileSecurityRef fileSec, mode_t *mode)
{
  return MEMORY[0x1F40D7B30](fileSec, mode);
}

Boolean CFFileSecurityGetOwner(CFFileSecurityRef fileSec, uid_t *owner)
{
  return MEMORY[0x1F40D7B38](fileSec, owner);
}

Boolean CFFileSecuritySetAccessControlList(CFFileSecurityRef fileSec, acl_t accessControlList)
{
  return MEMORY[0x1F40D7B40](fileSec, accessControlList);
}

Boolean CFFileSecuritySetGroup(CFFileSecurityRef fileSec, gid_t group)
{
  return MEMORY[0x1F40D7B48](fileSec, *(void *)&group);
}

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return MEMORY[0x1F40D7B50](fileSec, mode);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1F40D7F98](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8000](stream, buffer, bufferLength);
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x1F40D8020](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.CFURLRef length = v4;
  result.CFIndex location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFURLClearResourcePropertyCache(CFURLRef url)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8760](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D87A0](anURL, charactersToLeaveEscaped);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

CFDataRef CFURLCreateBookmarkDataFromFile(CFAllocatorRef allocator, CFURLRef fileURL, CFErrorRef *errorRef)
{
  return (CFDataRef)MEMORY[0x1F40D87E8](allocator, fileURL, errorRef);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

CFURLRef CFURLCreateFilePathURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x1F40D8830](allocator, url, error);
}

CFURLRef CFURLCreateFileReferenceURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x1F40D8838](allocator, url, error);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D8850](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFDictionaryRef CFURLCreateResourcePropertiesForKeysFromBookmarkData(CFAllocatorRef allocator, CFArrayRef resourcePropertiesToReturn, CFDataRef bookmark)
{
  return (CFDictionaryRef)MEMORY[0x1F40D8860](allocator, resourcePropertiesToReturn, bookmark);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88A8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForMountedVolumes(CFAllocatorRef alloc, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1F40D88D0](alloc, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL(CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1F40D88E0](enumerator, url, error);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1F40D88F0](anURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1F40D8938](anURL);
}

Boolean CFURLIsFileReferenceURL(CFURLRef url)
{
  return MEMORY[0x1F40D8940](url);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1F40D8948](url, error);
}

Boolean CFURLSetResourcePropertiesForKeys(CFURLRef url, CFDictionaryRef keyedPropertyValues, CFErrorRef *error)
{
  return MEMORY[0x1F40D8950](url, keyedPropertyValues, error);
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x1F40D8958](url, key, propertyValue, error);
}

void CFURLSetTemporaryResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue)
{
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1F40D89C0](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1F40D89D8]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
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

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1F40D8A88](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AB0](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8B08](stream, buffer, bufferLength);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFFileCoordinateReadingItemAtURL2()
{
  return MEMORY[0x1F40D8DD0]();
}

uint64_t _CFFileSecurityCreateFromFilesec()
{
  return MEMORY[0x1F40D8DD8]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1F40D8DE0]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponent()
{
  return MEMORY[0x1F40D8DE8]();
}

uint64_t _CFRunLoopCurrentIsMain()
{
  return MEMORY[0x1F40D9090]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x1F40D9278]();
}

uint64_t _CFURLCopyResourcePropertyValuesAndFlags()
{
  return MEMORY[0x1F40D92A8]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1F40D92B0]();
}

uint64_t _CFURLGetResourcePropertyFlags()
{
  return MEMORY[0x1F40D9338]();
}

uint64_t _CFURLGetVolumePropertyFlags()
{
  return MEMORY[0x1F40D9340]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x1F40D9348]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1F40D9368]();
}

uint64_t _CFURLPromiseCopyResourcePropertyForKey()
{
  return MEMORY[0x1F40D9370]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1F40D9380]();
}

uint64_t _CFURLPromiseSetResourcePropertyForKey()
{
  return MEMORY[0x1F40D9388]();
}

uint64_t _LSRegisterFilePropertyProvider()
{
  return MEMORY[0x1F40DEEB8]();
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8C8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::locale::~locale(std::locale *this)
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
  return MEMORY[0x1F417EE40]();
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

uint64_t __CFURLResourceInfoPtr()
{
  return MEMORY[0x1F40D9610]();
}

uint64_t __CFURLSetResourceInfoPtr()
{
  return MEMORY[0x1F40D9620]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _amkrtemp()
{
  return MEMORY[0x1F40C9D40]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

int accessx_np(const accessx_descriptor *a1, size_t a2, int *a3, uid_t a4)
{
  return MEMORY[0x1F40CA218](a1, a2, a3, *(void *)&a4);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1F40CA228](permset_d, *(void *)&perm);
}

ssize_t acl_copy_ext(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1F40CA238](buf_p, acl, size);
}

ssize_t acl_copy_ext_native(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1F40CA240](buf_p, acl, size);
}

acl_t acl_copy_int_native(const void *buf_p)
{
  return (acl_t)MEMORY[0x1F40CA248](buf_p);
}

int acl_delete_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1F40CA260](permset_d, *(void *)&perm);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1F40CA270](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1F40CA280](acl, *(void *)&entry_id, entry_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1F40CA2B8](entry_d, permset_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1F40CA2D0](*(void *)&count);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1F40CA300](entry_d, permset_d);
}

ssize_t acl_size(acl_t acl)
{
  return MEMORY[0x1F40CA320](acl);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1F40CB900](dirp);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1F40CC018](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void filesec_free(filesec_t a1)
{
}

filesec_t filesec_init(void)
{
  return (filesec_t)MEMORY[0x1F40CC140]();
}

int filesec_set_property(filesec_t a1, filesec_property_t a2, const void *a3)
{
  return MEMORY[0x1F40CC148](a1, *(void *)&a2, a3);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1F40CC188](a1);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1F40CC2B0](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1F40CC2D0](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1F40CC370](*(void *)&a1, a2, a3, a4, a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x1F40CC448](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CC830](a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1F40CC848](path, namebuff, size, *(void *)&options);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  return MEMORY[0x1F40CCC68](user, group, ismember);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1F40CCC70](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1F40CCC88](*(void *)&uid, uu);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1F40CD618]();
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1F40CD730](a1, *(void *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDC70](a1, a2, a3);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1F40CDD18](path, state, *(void *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1F40CDD70](a1, a2, *(void *)&a3);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

uint64_t sandbox_extension_release_file()
{
  return MEMORY[0x1F40CDE58]();
}

uint64_t sandbox_extension_update_file_by_fileid()
{
  return MEMORY[0x1F40CDE60]();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CDF50](a1, a2, a3, a4, *(void *)&a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  return MEMORY[0x1F40CE960](a1, *(void *)&a2);
}

uint64_t FPCreateBookmarkableStringFromDocumentURL_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    dlopenHelper_FileProvider(a1);
  }
  return MEMORY[0x1F40E0A58]();
}

uint64_t FPCreateDocumentURLFromBookmarkableString_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    dlopenHelper_FileProvider(a1);
  }
  return MEMORY[0x1F40E0A68]();
}

uint64_t GSLibraryResolveDocumentId2_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GenerationalStorage)) {
    dlopenHelper_GenerationalStorage(a1);
  }
  return MEMORY[0x1F411BB48]();
}

uint64_t CacheDeleteCopyAvailableSpaceForVolume_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CacheDelete)) {
    dlopenHelper_CacheDelete(a1);
  }
  return MEMORY[0x1F410DCA0]();
}

uint64_t FPCFCopyAttributeValuesForItem_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    dlopenHelper_FileProvider(a1);
  }
  return MEMORY[0x1F40E0A28]();
}

uint64_t FPCFSetAttributeValueForItem_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    dlopenHelper_FileProvider(a1);
  }
  return MEMORY[0x1F40E0A30]();
}

uint64_t _QLCopyResourcePropertyForKey_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_QuickLookThumbnailing)) {
    dlopenHelper_QuickLookThumbnailing(a1);
  }
  return MEMORY[0x1F40F4E28]();
}

uint64_t _QLSetResourcePropertyForKey_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_QuickLookThumbnailing)) {
    dlopenHelper_QuickLookThumbnailing(a1);
  }
  return MEMORY[0x1F40F4E30]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CacheDelete(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GenerationalStorage(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_QuickLookThumbnailing(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_FileProvider(double a1)
{
  return a1;
}

double gotLoadHelper_x8__FPCreateBookmarkableStringFromDocumentURL(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    return dlopenHelper_FileProvider(result);
  }
  return result;
}

double gotLoadHelper_x8__FPCreateDocumentURLFromBookmarkableString(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    return dlopenHelper_FileProvider(result);
  }
  return result;
}

double gotLoadHelper_x8__GSLibraryResolveDocumentId2(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GenerationalStorage)) {
    return dlopenHelper_GenerationalStorage(result);
  }
  return result;
}

double gotLoadHelper_x8__CacheDeleteCopyAvailableSpaceForVolume(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CacheDelete)) {
    return dlopenHelper_CacheDelete(result);
  }
  return result;
}

double gotLoadHelper_x8__FPCFCopyAttributeValuesForItem(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    return dlopenHelper_FileProvider(result);
  }
  return result;
}

double gotLoadHelper_x8__FPCFSetAttributeValueForItem(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FileProvider)) {
    return dlopenHelper_FileProvider(result);
  }
  return result;
}

double gotLoadHelper_x8___QLCopyResourcePropertyForKey(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_QuickLookThumbnailing)) {
    return dlopenHelper_QuickLookThumbnailing(result);
  }
  return result;
}

double gotLoadHelper_x8___QLSetResourcePropertyForKey(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_QuickLookThumbnailing)) {
    return dlopenHelper_QuickLookThumbnailing(result);
  }
  return result;
}