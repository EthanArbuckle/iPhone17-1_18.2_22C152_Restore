uint64_t DDResultGetCategory(uint64_t a1)
{
  CFStringRef v2;
  uint64_t v3;
  void v5[6];
  void block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  if (!a1) {
    return 0;
  }
  if (DDResultGetCategory_sOnce != -1) {
    dispatch_once(&DDResultGetCategory_sOnce, &__block_literal_global_441);
  }
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v2 = *(const __CFString **)(a1 + 64);
  if (DDResultGetCategory_sOnce_68 != -1) {
    dispatch_once(&DDResultGetCategory_sOnce_68, &__block_literal_global_71);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __DDResultGetCategory_block_invoke_3;
  block[3] = &unk_1E5985000;
  block[4] = &v7;
  block[5] = v2;
  dispatch_sync((dispatch_queue_t)DDResultGetCategory_sQueue, block);
  v3 = *((unsigned int *)v8 + 6);
  if (!v3)
  {
    if (_DDResultTypeIsAnyPhoneKind(v2))
    {
      v3 = 2;
    }
    else if (CFEqual(v2, @"FullAddress"))
    {
      v3 = 3;
    }
    else
    {
      if (DDResultGetCategory_sOnce_74 != -1) {
        dispatch_once(&DDResultGetCategory_sOnce_74, &__block_literal_global_78);
      }
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 0x40000000;
      v5[2] = __DDResultGetCategory_block_invoke_5;
      v5[3] = &unk_1E5985048;
      v5[4] = &v7;
      v5[5] = v2;
      dispatch_sync((dispatch_queue_t)DDResultGetCategory_sQueue_75, v5);
      v3 = *((unsigned int *)v8 + 6);
      if (!v3)
      {
        if (CFEqual(v2, @"TrackingNumber")
          || CFEqual(v2, @"ItemNumber")
          || CFEqual(v2, @"FlightInformation")
          || CFEqual(v2, @"Parsec")
          || CFEqual(v2, @"AuthCode")
          || CFEqual(v2, @"PhysicalAmount")
          || CFEqual(v2, @"GameCenter")
          || CFEqual(v2, @"DomesticIdentifier")
          || CFEqual(v2, @"UPIIdentifier")
          || CFEqual(v2, @"evts"))
        {
          v3 = 5;
        }
        else if (CFEqual(v2, @"Money"))
        {
          v3 = 6;
        }
        else if (CFEqual(v2, @"Contact"))
        {
          v3 = 7;
        }
        else
        {
          v3 = 0;
        }
      }
    }
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t _FillNextTokenInCache(void *a1, CFTypeRef cf, uint64_t a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[48];
  if (v7 <= 0)
  {
    v8 = (void *)*a1;
    if (!*(void *)(*a1 + 32)) {
      v8[4] = CFRetain(cf);
    }
    uint64_t v9 = v8[10];
    if (v9 >= v8[9] - 1)
    {
      uint64_t NextToken = _fetchNextToken((uint64_t)v8);
      if (NextToken < 0) {
        return -1;
      }
    }
    else
    {
      uint64_t NextToken = v9 + 1;
      if (v9 + 1 < 0) {
        return -1;
      }
    }
    uint64_t v11 = _tokenEntryAtRealIndex((uint64_t)v8, (v8[12] + NextToken) % v8[9]);
    v8[10] = NextToken;
    if (!v11) {
      return -1;
    }
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(void *)(v11 + 8);
    uint64_t v14 = (uint64_t)(*(void *)v11 << 32) >> 48;
    uint64_t v15 = (uint64_t)(int)v13 >> 16;
    if (*(int *)v11 >> 16 == v15)
    {
      uint64_t v16 = (uint64_t)(v13 - (v12 & 0xFFFFFFFF00000000)) >> 32;
LABEL_23:
      uint64_t v27 = *((void *)cf + 2);
      uint64_t v28 = *(void *)(v27 + 48 * (*(int *)v11 >> 16) + 32)
          + (v12 >> 32)
          - *(void *)(v27 + 48 * (*(int *)v11 >> 16) + 16);
      if (v28 < a3)
      {
        if (_FillNextTokenInCache_sOnce != -1) {
          dispatch_once(&_FillNextTokenInCache_sOnce, &__block_literal_global_838);
        }
        return -1;
      }
      *(void *)&long long __src = *(void *)v11;
      *((void *)&__src + 1) = v13;
      if (*(unsigned char *)(v11 + 24))
      {
        uint64_t v29 = 0;
        if (*(unsigned __int8 *)(v11 + 24) >= 0x13u) {
          uint64_t v30 = 19;
        }
        else {
          uint64_t v30 = *(unsigned __int8 *)(v11 + 24);
        }
        v31 = &v62;
        do
        {
          *(_OWORD *)v31 = *(_OWORD *)(*(void *)(v11 + 16) + v29);
          v31 += 2;
          v29 += 32;
        }
        while (32 * v30 != v29);
        uint64_t v7 = v30 + 1;
      }
      else
      {
        uint64_t v7 = 1;
      }
      goto LABEL_34;
    }
    uint64_t v17 = v14 - v15;
    if (v14 > v15)
    {
      uint64_t v16 = 0;
      goto LABEL_23;
    }
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    uint64_t v19 = *((void *)cf + 2);
    v20 = (void *)(v19 + 48 * (int)v15 + 16);
    uint64_t v21 = v19 + 48 * (*(int *)v11 >> 16);
    v22 = (void *)(v21 + 16);
    v23 = (void *)(v21 + 24);
    v24 = (_DWORD *)(v21 + 40);
    while (v18)
    {
      if (v17 != v18)
      {
        uint64_t v25 = *((void *)v24 - 2);
LABEL_19:
        uint64_t v26 = v25 + v16;
        if (((*v24 >> 26) & 7u) - 1 >= 4) {
          uint64_t v16 = v26;
        }
        else {
          uint64_t v16 = v26 + 1;
        }
        goto LABEL_22;
      }
      uint64_t v16 = v16 + (v13 >> 32) - *v20;
LABEL_22:
      --v18;
      v24 += 12;
      if (v17 - 1 == v18) {
        goto LABEL_23;
      }
    }
    uint64_t v25 = *v22 - (v12 >> 32) + *v23;
    goto LABEL_19;
  }
  uint64_t v57 = a1[8];
  uint64_t v13 = a1[9];
  uint64_t v27 = *((void *)cf + 2);
  uint64_t v28 = *(void *)(v27 + 48 * ((int)v57 >> 16) + 32) + (v57 >> 32) - *(void *)(v27 + 48 * ((int)v57 >> 16) + 16);
  uint64_t v16 = (uint64_t)(v13 - (v57 & 0xFFFFFFFF00000000)) >> 32;
  __memcpy_chk();
  a1[48] = 0;
LABEL_34:
  if (v16 > 200) {
    return -1;
  }
  uint64_t v32 = v28 - v6;
  if (v28 - v6 + v16 > 200)
  {
    a1[48] = v7;
    memcpy(a1 + 8, &__src, 16 * v7);
    return -1;
  }
  if (v32 > a3)
  {
    while (1)
    {
      IfNeeded = (_DWORD *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, a3);
      if (!IfNeeded) {
        return -1;
      }
      _DWORD *IfNeeded = v6 + a3++;
      if (a3 >= v32)
      {
        uint64_t v27 = *((void *)cf + 2);
        break;
      }
    }
  }
  uint64_t log = (uint64_t)(int)v13 >> 16;
  uint64_t v34 = v27 + 48 * (int)log;
  uint64_t v35 = *(void *)(v34 + 32);
  uint64_t v36 = *(void *)(v34 + 16);
  uint64_t v37 = DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, a3);
  if (!v37) {
    return -1;
  }
  uint64_t v38 = v37;
  uint64_t v39 = v13 >> 32;
  uint64_t v40 = v35 + (v13 >> 32) - (v6 + v36);
  uint64_t v41 = *(void *)v37;
  uint64_t v42 = *(uint64_t *)v37 >> 48;
  if (v7 <= 1)
  {
    uint64_t v43 = (uint64_t)(int)v13 >> 16;
    if ((int)v42 < 2)
    {
LABEL_45:
      uint64_t v45 = v41 & 0xFFFFFFFFFFFFLL | 0x1000000000000;
      *(void *)uint64_t v38 = v45;
LABEL_46:
      *(_OWORD *)(v38 + 8) = __src;
      unint64_t v46 = v45 & 0xFFFF000000000000 | 0x100000000;
LABEL_59:
      uint64_t v50 = v28;
      goto LABEL_60;
    }
    uint64_t v44 = v13 >> 32;
    free(*(void **)(v37 + 8));
LABEL_44:
    uint64_t v41 = *(void *)v38;
    uint64_t v39 = v44;
    goto LABEL_45;
  }
  uint64_t v44 = v13 >> 32;
  if (v42 >= v7) {
    goto LABEL_56;
  }
  if ((int)v42 <= 1)
  {
    uint64_t v47 = 16 * v7;
    v48 = malloc_type_malloc(16 * v7, 0x1000040451B5BE8uLL);
    if (!v48)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      LODWORD(v43) = log;
      loga = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v64 = v47;
        _os_log_error_impl(&dword_19DC95000, loga, OS_LOG_TYPE_ERROR, "TokenCache could not alloc space to cache %ld ranges", buf, 0xCu);
      }
      goto LABEL_44;
    }
    goto LABEL_55;
  }
  uint64_t v49 = 16 * v7;
  v48 = malloc_type_realloc(*(void **)(v37 + 8), 16 * v7, 0x1000040451B5BE8uLL);
  if (v48)
  {
LABEL_55:
    *(void *)(v38 + 8) = v48;
    *(_WORD *)(v38 + 6) = v7;
LABEL_56:
    memcpy(*(void **)(v38 + 8), &__src, 16 * v7);
    uint64_t v45 = *(void *)v38;
    goto LABEL_57;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  v56 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v64 = v49;
    _os_log_error_impl(&dword_19DC95000, v56, OS_LOG_TYPE_ERROR, "TokenCache could not realloc space to cache %ld ranges", buf, 0xCu);
  }
  uint64_t v45 = *(void *)v38;
  uint64_t v7 = *(uint64_t *)v38 >> 48;
  if (v7 == 1)
  {
    LODWORD(v43) = log;
    uint64_t v39 = v44;
    goto LABEL_46;
  }
  if (v45 >= 0x2000000000000) {
    goto LABEL_56;
  }
LABEL_57:
  unint64_t v46 = v45 & 0xFFFF000000000000 | ((unint64_t)(unsigned __int16)v7 << 32);
  if ((v7 & 0x8000000000000000) == 0)
  {
    LODWORD(v43) = log;
    uint64_t v39 = v44;
    goto LABEL_59;
  }
  uint64_t v50 = 0xFFFFFFFFLL;
  LODWORD(v43) = log;
  uint64_t v39 = v44;
LABEL_60:
  *(void *)uint64_t v38 = v50 | v46;
  uint64_t v51 = *((void *)cf + 2) + 48 * (int)v43;
  uint64_t v52 = v39 + *(void *)(v51 + 32) - (v6 + *(void *)(v51 + 16));
  uint64_t v53 = a3 + 1;
  if (a3 + 1 < v52)
  {
    int v54 = a3 + v6;
    while (1)
    {
      v55 = (_DWORD *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v53);
      if (!v55) {
        break;
      }
      _DWORD *v55 = v54;
      if (++v53 >= v52) {
        return v40;
      }
    }
    return -1;
  }
  return v40;
}

uint64_t DDLexerDeterministicScan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  size_t v7 = 16 * a4;
  uint64_t v8 = MEMORY[0x1F4188790]();
  uint64_t v10 = v9;
  uint64_t v11 = &(&v72)[-2 * v9];
  uint64_t v13 = (uint64_t)v12 >> 16;
  if (v13 == *(void *)(v8 + 40))
  {
    uint64_t v14 = *(UText **)(a1 + 32);
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 24) + 16) + 48 * (int)v13;
    *(void *)(a1 + 40) = v13;
    *(unsigned char *)(a1 + 48) = (*(_DWORD *)(v15 + 40) & 0x40000000) != 0;
    uint64_t v14 = (UText *)CFStringOpenUText();
    *(void *)(a1 + 32) = v14;
  }
  utext_setNativeIndex(v14, a2 >> 32);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(v16 + 8);
  uint64_t v79 = *(void *)(v16 + 16);
  uint64_t v81 = *(unsigned int *)(v17 + 4);
  uint64_t v82 = a1;
  uint64_t v85 = a1;
  unint64_t v86 = a2;
  long long v87 = *(_OWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 48 * (int)v13 + 16);
  uint64_t v18 = *(uint64_t (**)(void, uint64_t))(a1 + 8);
  if (!v18) {
    return 0;
  }
  uint64_t v19 = v82;
  uint64_t v20 = v18(*(void *)(v82 + 16), a2);
  uint64_t v22 = v21;
  unsigned int Next = getNext(&v85);
  if (!*(void *)(v19 + 56) || Next == -1 || v10 < 1) {
    return 0;
  }
  uint64_t v73 = a3;
  uint64_t v84 = v17 + 16;
  unsigned int v24 = Next;
  bzero(v11, v7);
  unsigned int v25 = v24;
  uint64_t v26 = 0;
  int v27 = 0;
  int v80 = 0;
  uint64_t v28 = (uint64_t *)v11;
  unsigned int v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 4294901760;
  int v32 = -1;
  uint64_t v33 = v81;
  v72 = v28;
  v78 = v28;
  uint64_t v34 = v10;
  do
  {
    unsigned int v83 = v25;
    if (v25 == -1)
    {
      if (v27 == 1) {
        break;
      }
      int v27 = 1;
      uint64_t v26 = 1;
    }
    else if (v27)
    {
      int v27 = 1;
    }
    else
    {
      if (HIWORD(v25))
      {
        if (HIWORD(v25) > 0x10u)
        {
          int v36 = *(unsigned __int16 *)(*(void *)(v82 + 56) + 104);
        }
        else
        {
          uint64_t v37 = v31;
          unsigned int v38 = v25;
          uint64_t v39 = v82;
          int v40 = (*(uint64_t (**)(void))(*(void *)(v82 + 56) + 88))(*(unsigned __int16 *)(*(void *)(*(void *)(v82 + 56) + 72) + 2 * (((v25 >> 10) & 0x1F) + 4 * *(unsigned __int16 *)(*(void *)(*(void *)(v82 + 56) + 72) + 2 * (((v25 >> 10) + 55232) >> 5)))));
          uint64_t v41 = *(void *)(v39 + 56);
          if (v40 < 1) {
            int v36 = *(unsigned __int16 *)(v41 + 104);
          }
          else {
            int v36 = *(unsigned __int16 *)(*(void *)(v41 + 72)
          }
                                      + 2
                                      * ((v38 & 0x1F)
                                       + 4
                                       * *(unsigned __int16 *)(*(void *)(v41 + 72) + 2 * (v40 + ((v38 >> 5) & 0x1F)))));
          uint64_t v31 = v37;
        }
      }
      else
      {
        if (v25 >> 10 == 54) {
          int v35 = 320;
        }
        else {
          int v35 = 0;
        }
        int v36 = *(unsigned __int16 *)(*(void *)(*(void *)(v82 + 56) + 72)
                                  + 2
                                  * ((v25 & 0x1F)
                                   + 4
                                   * *(unsigned __int16 *)(*(void *)(*(void *)(v82 + 56) + 72)
                                                         + 2 * (v35 + (v25 >> 5)))));
      }
      int v27 = 0;
      uint64_t v26 = v36 & 0xFFFFBFFF;
    }
    __int16 v42 = *(_WORD *)(v84 + v33 + 2 * (v26 >> 5) + 6);
    if (v42 < 0) {
      int v43 = v42 & 0x7FFF;
    }
    else {
      int v43 = *(unsigned __int16 *)(v79 + 2 * (v26 & 0x1F | (32 * (v42 & 0x7FFFu))));
    }
    uint64_t v33 = (v43 * v81);
    uint64_t v44 = (__int16 *)(v84 + v33);
    if (v32 < 0)
    {
      int v32 = -1;
    }
    else if (v43 != v32)
    {
      int v45 = *v44 == -1 ? v44[2] : -1;
      int v32 = -1;
      if ((int)v31 >> 16 != -1)
      {
        int v46 = v80;
        if (v80 != v45)
        {
          uint64_t v47 = v78;
          uint64_t *v78 = v31;
          *((_DWORD *)v47 + 2) = v46;
          v78 = v47 + 2;
          --v34;
          uint64_t v30 = (v30 + 1);
        }
      }
    }
    if (*v44 != -1) {
      goto LABEL_41;
    }
    int v80 = v44[2];
    uint64_t v48 = (uint64_t)(int)v20 >> 16;
    uint64_t v31 = v86;
    if (v48 == -1)
    {
      int v32 = v43;
LABEL_41:
      unsigned int v25 = v83;
      goto LABEL_42;
    }
    unsigned int v75 = v26;
    uint64_t v76 = v30;
    uint64_t v77 = v34;
    char v53 = 0;
    unint64_t v54 = HIDWORD(v86);
    uint64_t v74 = v86 << 32;
    uint64_t v55 = v86;
    uint64_t v56 = (uint64_t)(int)v86 >> 16;
    while (HIDWORD(v20) != v54 || v48 != v56)
    {
      if (v48 < v56 || SHIDWORD(v20) < (int)v54 && v48 <= v56)
      {
        uint64_t v58 = (uint64_t)(int)v22 >> 16;
        if ((int)v56 >= (int)v58 && ((int)v56 > (int)v58 || (int)v54 >= SHIDWORD(v22)))
        {
          if (v56 == v58 && v54 == HIDWORD(v22)) {
            char v53 = 1;
          }
          uint64_t v20 = (*(uint64_t (**)(void, uint64_t))(v82 + 8))(*(void *)(v82 + 16), v55);
          uint64_t v22 = v60;
          uint64_t v48 = (uint64_t)(int)v20 >> 16;
          if (v48 != -1) {
            continue;
          }
        }
      }
      if (!v53)
      {
        int v32 = v43;
        uint64_t v30 = v76;
        uint64_t v34 = v77;
        unsigned int v25 = v83;
        uint64_t v31 = v55;
        goto LABEL_79;
      }
      break;
    }
    uint64_t v30 = v76;
    uint64_t v34 = v77;
    if (v77 < 1)
    {
      uint64_t v34 = 0;
      int v32 = -1;
    }
    else
    {
      int v32 = -1;
      if (v80 != -1 && (v74 >> 48) != 0xFFFFFFFFLL)
      {
        v61 = v78;
        uint64_t *v78 = v55;
        *((_DWORD *)v61 + 2) = v80;
        v78 = v61 + 2;
        uint64_t v30 = (v30 + 1);
        --v34;
      }
    }
    uint64_t v31 = 4294901760;
    unsigned int v25 = v83;
LABEL_79:
    uint64_t v26 = v75;
LABEL_42:
    if (v43) {
      char v49 = v27;
    }
    else {
      char v49 = 1;
    }
    if (v49)
    {
      if (!v43) {
        break;
      }
    }
    else
    {
      uint64_t v50 = v26;
      uint64_t v51 = v31;
      unsigned int v25 = getNext(&v85);
      uint64_t v31 = v51;
      uint64_t v26 = v50;
    }
    if (v34 < 1) {
      break;
    }
  }
  while (v29++ < 0x12C);
  uint64_t v63 = v73;
  if (v32 < 0)
  {
    uint64_t v64 = v72;
  }
  else
  {
    uint64_t v64 = v72;
    if (v34 >= 1)
    {
      int v65 = v80;
      if (v80 != -1 && (int)v31 >> 16 != 0xFFFFFFFFLL)
      {
        v66 = v78;
        uint64_t *v78 = v31;
        *((_DWORD *)v66 + 2) = v65;
        LODWORD(v30) = v30 + 1;
      }
    }
  }
  uint64_t result = (int)v30;
  if ((int)v30 >= 1)
  {
    v67 = (void *)(v63 + 8);
    v68 = (unsigned __int16 *)(v64 + 1);
    uint64_t v69 = (int)v30;
    do
    {
      uint64_t v70 = *((void *)v68 - 1);
      unsigned int v71 = *v68;
      v68 += 8;
      *(v67 - 1) = v70 & 0xFFFFFFFFFFFF0000 | v71;
      void *v67 = 0;
      v67[1] = 0;
      v67[2] = 0;
      v67 += 4;
      --v69;
    }
    while (v69);
  }
  return result;
}

uint64_t getNext(void *a1)
{
  while (1)
  {
    uint64_t v2 = a1[1];
    uint64_t v3 = a1[3] + a1[2];
    if (v3 <= v2 >> 32) {
      goto LABEL_6;
    }
    v4 = *(UText **)(*a1 + 32);
    uint64_t chunkOffset = v4->chunkOffset;
    if ((int)chunkOffset < v4->chunkLength)
    {
      uint64_t v6 = v4->chunkContents[chunkOffset];
      if (v6 >> 11 <= 0x1A) {
        break;
      }
    }
    uint64_t v7 = utext_next32(*(UText **)(*a1 + 32));
    if (v7 != -1)
    {
      uint64_t v6 = v7;
      goto LABEL_11;
    }
    uint64_t v2 = a1[1];
LABEL_6:
    uint64_t v8 = *a1;
    uint64_t v9 = *(void *)(*a1 + 24);
    uint64_t v10 = (uint64_t)(int)v2 >> 16;
    if (v10 >= *(void *)(v9 + 32) - 1) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = *(void *)(v9 + 16);
    uint64_t v12 = 48 * v10;
    int v13 = (*(_DWORD *)(v11 + 48 * v10 + 40) >> 26) & 7;
    uint64_t v14 = v10 + 1;
    v12 += 48;
    long long v15 = *(_OWORD *)(v11 + v12 + 16);
    *((_OWORD *)a1 + 1) = v15;
    a1[1] = (v14 << 16) | (unint64_t)(unsigned __int16)v2 | ((void)v15 << 32);
    uint64_t v16 = *(void *)(*(void *)(v8 + 24) + 16) + v12;
    *(void *)(v8 + 40) = v14;
    *(unsigned char *)(v8 + 48) = (*(_DWORD *)(v16 + 40) & 0x40000000) != 0;
    *(void *)(v8 + 32) = CFStringOpenUText();
    if (v13)
    {
      uint64_t v6 = 32;
      switch(v13)
      {
        case 1:
          return v6;
        case 2:
          uint64_t v6 = 9;
          break;
        case 3:
          uint64_t v6 = 10;
          break;
        case 4:
          uint64_t v6 = 31;
          break;
        default:
          return 0xFFFFFFFFLL;
      }
      return v6;
    }
  }
  v4->uint64_t chunkOffset = chunkOffset + 1;
LABEL_11:
  if (v6 >> 2 == 0x3FFF
    || (v6 != 10 ? (BOOL v17 = v6 == 8232) : (BOOL v17 = 1),
        !v17 ? (BOOL v18 = v6 == 13) : (BOOL v18 = 1),
        v18 && *(unsigned char *)(*a1 + 48)))
  {
    uint64_t v6 = 32;
  }
  uint64_t v19 = v4->chunkOffset;
  if ((int)v19 <= v4->nativeIndexingLimit) {
    uint64_t v20 = v4->chunkNativeStart + v19;
  }
  else {
    uint64_t v20 = ((uint64_t (*)(UText *))v4->pFuncs->mapOffsetToNative)(v4);
  }
  for (;
        v20 < v3;
        uint64_t v20 = (int)v23 <= v4->nativeIndexingLimit
            ? v4->chunkNativeStart + v23
            : ((uint64_t (*)(UText *))v4->pFuncs->mapOffsetToNative)(v4))
  {
    uint64_t v21 = v4->chunkOffset;
    if ((int)v21 < v4->chunkLength)
    {
      unsigned int v22 = v4->chunkContents[v21];
      if (v22 >> 11 <= 0x1A) {
        goto LABEL_43;
      }
    }
    unsigned int v22 = utext_current32(v4);
LABEL_43:
    if (v22 >> 1 != 4103 || !utext_moveIndex32(v4, 1)) {
      break;
    }
    uint64_t v23 = v4->chunkOffset;
  }
  *((_DWORD *)a1 + 3) = v20;
  return v6;
}

uint64_t nextToken(uint64_t a1, uint64_t a2)
{
  return DDTokenCacheGetTokenOrSubtokenAtPosition(*(void **)(a1 + 40), *(void **)(a1 + 56), a2);
}

uint64_t DDTokenCacheGetTokenOrSubtokenAtPosition(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = 0;
  TokensAtPosition = DDTokenCacheGetTokensAtPosition(a1, a2, a3, &v12);
  if (!TokensAtPosition) {
    return 4294901760;
  }
  if (TokensAtPosition == (uint64_t *)1) {
    return *(void *)v12;
  }
  if ((uint64_t)TokensAtPosition < 1) {
    return 4294901760;
  }
  uint64_t v6 = (uint64_t)(int)a3 >> 16;
  uint64_t v7 = (char *)TokensAtPosition + 1;
  for (i = (int *)(v12 + 16 * (void)TokensAtPosition - 8); ; i -= 4)
  {
    uint64_t result = *((void *)i - 1);
    uint64_t v9 = (uint64_t)(int)result >> 16;
    if ((int)v9 < (int)v6 || ((int)v9 <= (int)v6 ? (BOOL v10 = SHIDWORD(result) <= SHIDWORD(a3)) : (BOOL v10 = 0), v10))
    {
      if (*i >> 16 >= (int)v6 && (*i >> 16 > (int)v6 || (int)HIDWORD(*(void *)i) > SHIDWORD(a3))) {
        break;
      }
    }
    if ((unint64_t)--v7 <= 1) {
      return 4294901760;
    }
  }
  return result;
}

double _DDScannerHandleState(uint64_t a1, uint64_t *a2, int a3, double result)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (*(uint64_t *)(a1 + 184) > 30000) {
    return result;
  }
  unsigned int v108 = a3 + 1;
  while (2)
  {
    uint64_t v6 = a2[2];
    uint64_t v5 = a2[3];
    v109 = (void *)a2[1];
    uint64_t v110 = *a2;
    uint64_t v115 = 0;
    uint64_t v7 = computeLexemsAtPosition();
    if (v7 >= 50 && (*(unsigned char *)(a1 + 232) & 2) == 0)
    {
      CFStringRef CopySubStringFromPos = DDScanQueryCopySubStringFromPos(*(void *)(a1 + 56), v6);
      CFRelease(CopySubStringFromPos);
      *(unsigned char *)(a1 + 232) |= 2u;
    }
    uint64_t v8 = v5 << 16 >> 48;
    uint64_t v9 = (int)v5;
    if ((unint64_t)((int)v5 - 7901) < 0xFFFFFFFFFFFFE0BFLL || (uint64_t v10 = *(void *)(a1 + 208)) == 0)
    {
      uint64_t v11 = v5;
      uint64_t v15 = 0;
      goto LABEL_123;
    }
    uint64_t v11 = v5;
    uint64_t v12 = v10 + (int)v5;
    uint64_t v13 = *(void *)(a1 + 16);
    if (v7 <= 0)
    {
      uint64_t v17 = 0;
      uint64_t v16 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      uint64_t v20 = *(void *)(v13 + 8);
      uint64_t v19 = v8 + 1;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = v115;
      uint64_t v19 = v8 + 1;
      uint64_t v20 = *(void *)(v13 + 8);
      uint64_t v21 = *(void *)(v20 + 8);
      do
      {
        unsigned int v22 = (uint64_t *)(v18 + 32 * (v7 - 1));
        uint64_t v23 = *v22;
        LODWORD(result) = *((_DWORD *)v22 + 2);
        unsigned int v24 = *((_DWORD *)v22 + 3);
        long long v25 = *((_OWORD *)v22 + 1);
        BOOL v100 = v14 <= (__int16)*v22;
        uint64_t v14 = (__int16)*v22;
        if (v100) {
          uint64_t v17 = 0;
        }
        unsigned int v26 = *(_DWORD *)(v21 + 4 * v19);
        if ((v14 - 1) > 6)
        {
          if (v14 == 40 && (v26 & 0x1000000) != 0) {
            goto LABEL_61;
          }
        }
        else if ((HIBYTE(v26) >> v14))
        {
          goto LABEL_61;
        }
        int v28 = *(_DWORD *)(v21 + 4 * v8);
        int v29 = v28 << 8 >> 8;
        uint64_t v30 = (uint64_t)(v28 << 8) >> 8;
        uint64_t v31 = ((int)(v26 << 8) >> 8) - 1;
        if (v17 <= 0) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = v17;
        }
        if (v32 == v29)
        {
          uint64_t v33 = *(void *)(v20 + 16);
          uint64_t v34 = (unsigned __int16 *)(v33 + 4 * v30);
          int v35 = *v34 >> 1;
          if (v35 == v14
            || v35 < (int)v14 && *(unsigned __int8 *)(*(void *)(v20 + 24) + v30) + v35 >= (int)v14)
          {
            unint64_t v36 = *(unsigned int *)v34;
            if (v36) {
              goto LABEL_48;
            }
            goto LABEL_25;
          }
          goto LABEL_61;
        }
        if (v32 <= v30) {
          goto LABEL_61;
        }
        uint64_t v33 = *(void *)(v20 + 16);
        uint64_t v41 = (unsigned __int16 *)(v33 + 4 * v30);
        int v42 = *v41 >> 1;
        if (v42 > (int)v14) {
          goto LABEL_61;
        }
        if (v42 == v14 || (uint64_t v43 = *(void *)(v20 + 24), *(unsigned __int8 *)(v43 + v30) + v42 >= (int)v14))
        {
          unint64_t v36 = *(unsigned int *)v41;
          if (v36) {
            goto LABEL_48;
          }
          goto LABEL_25;
        }
        uint64_t v44 = (unsigned __int16 *)(v33 + 4 * v32);
        int v45 = *v44 >> 1;
        if (v45 > (int)v14)
        {
          uint64_t v46 = v32 - 1;
          if (v46 <= v30)
          {
LABEL_41:
            if ((int)v14 > 40) {
              uint64_t v17 = v46;
            }
            goto LABEL_61;
          }
          uint64_t v47 = v30 + 1;
          while (1)
          {
            uint64_t v30 = (v47 + v46) / 2;
            int v48 = *(unsigned __int16 *)(v33 + 4 * v30) >> 1;
            if (v48 <= (int)v14)
            {
              if (v48 == v14)
              {
                int v48 = v14;
LABEL_72:
                if ((int)v14 > 40) {
                  uint64_t v17 = v30 - (v48 == v14);
                }
                unint64_t v36 = *(unsigned int *)(v33 + 4 * v30);
                if (v36)
                {
LABEL_48:
                  uint64_t v49 = v33 + 4 * v30;
                  goto LABEL_49;
                }
LABEL_25:
                unint64_t v37 = v36 >> 16;
LABEL_26:
                uint64_t v38 = *(void *)(v20 + 40);
                uint64_t v39 = *(unsigned __int16 *)(v38 + 2 * v37);
                if (*(_WORD *)(v38 + 2 * v37))
                {
                  uint64_t v40 = v38 + 2 * v37 + 2;
                  goto LABEL_50;
                }
                goto LABEL_61;
              }
              if (*(unsigned __int8 *)(v43 + v30) + v48 >= (int)v14) {
                goto LABEL_72;
              }
              uint64_t v47 = v30 + 1;
            }
            else
            {
              uint64_t v46 = v30 - 1;
            }
            if (v47 > v46) {
              goto LABEL_41;
            }
          }
        }
        if (v45 == v14 || *(unsigned __int8 *)(v43 + v32) + v45 >= (int)v14)
        {
          if ((int)v14 > 40) {
            uint64_t v17 = v32 - (v45 == v14);
          }
          unint64_t v58 = *(unsigned int *)v44;
          if ((v58 & 1) == 0)
          {
            unint64_t v37 = v58 >> 16;
            goto LABEL_26;
          }
          uint64_t v49 = v33 + 4 * v32;
LABEL_49:
          uint64_t v40 = v49 + 2;
          uint64_t v39 = 1;
LABEL_50:
          uint64_t v50 = 0;
          unint64_t v51 = v23 & 0xFFFFFFFFFFFF0000;
          int v52 = (v14 << 17) | HIWORD(v24) & 1;
          do
          {
            unsigned int v53 = *(unsigned __int16 *)(v40 + 2 * v50);
            if (v53)
            {
              if (v15 <= 99)
              {
                uint64_t v57 = &v116[2 * v15];
                *(void *)uint64_t v57 = v51;
                *((_DWORD *)v57 + 2) = LODWORD(result);
                *((_DWORD *)v57 + 3) = v52 | v53 & 0xFFFE | 0x10000;
                v57[1] = v25;
                ++v15;
              }
            }
            else if (v15 <= 99)
            {
              unsigned int v54 = v53 >> 1;
              uint64_t v55 = v16;
              while (v55 >= 1)
              {
                int v56 = *(unsigned __int16 *)(v10 + v9 - 2 + 2 * v55--);
                if (v54 == v56) {
                  goto LABEL_60;
                }
              }
              HIDWORD(v116[2 * v15]) = HIDWORD(v116[2 * v15]) & 0xFFFE0001 | v53 & 0xFFFE;
              ++v15;
              *(_WORD *)(v12 + 2 * v16++) = v54;
            }
LABEL_60:
            ++v50;
          }
          while (v50 != v39);
        }
LABEL_61:
        BOOL v100 = v7-- <= 1;
      }
      while (!v100);
    }
    uint64_t v59 = *(int *)(v20 + 4);
    if (v14 <= v59) {
      uint64_t v17 = 0;
    }
    uint64_t v60 = *(void *)(v20 + 8);
    unsigned int v61 = *(_DWORD *)(v60 + 4 * v19);
    if ((v59 - 1) >= 7)
    {
      if (v59 == 40 && (v61 & 0x1000000) != 0) {
        goto LABEL_123;
      }
    }
    else if ((HIBYTE(v61) >> v59))
    {
      goto LABEL_123;
    }
    int v62 = *(_DWORD *)(v60 + 4 * v8);
    int v63 = v62 << 8 >> 8;
    uint64_t v64 = (uint64_t)(v62 << 8) >> 8;
    uint64_t v65 = ((int)(v61 << 8) >> 8) - 1;
    if (v17 <= 0) {
      uint64_t v66 = v65;
    }
    else {
      uint64_t v66 = v17;
    }
    if (v66 == v63)
    {
      uint64_t v67 = *(void *)(v20 + 16);
      v68 = (unsigned __int16 *)(v67 + 4 * v64);
      unsigned int v69 = *v68;
      if (v59 != v69 >> 1)
      {
        int v86 = v69 >> 1;
        if ((int)v59 <= v86 || *(unsigned __int8 *)(*(void *)(v20 + 24) + v64) + v86 < (int)v59) {
          goto LABEL_123;
        }
      }
      unint64_t v70 = *(unsigned int *)v68;
      if ((v70 & 1) == 0)
      {
LABEL_90:
        unint64_t v71 = v70 >> 16;
        goto LABEL_91;
      }
      goto LABEL_113;
    }
    if (v66 <= v64) {
      goto LABEL_123;
    }
    uint64_t v67 = *(void *)(v20 + 16);
    unsigned int v75 = (unsigned __int16 *)(v67 + 4 * v64);
    unsigned int v76 = *v75;
    if ((int)v59 < (int)(v76 >> 1)) {
      goto LABEL_123;
    }
    unsigned int v77 = v76 >> 1;
    if (v59 == v76 >> 1
      || (uint64_t v78 = *(void *)(v20 + 24), (int)(*(unsigned __int8 *)(v78 + v64) + v77) >= (int)v59))
    {
      unint64_t v70 = *(unsigned int *)v75;
      if ((v70 & 1) == 0) {
        goto LABEL_90;
      }
LABEL_113:
      uint64_t v87 = v67 + 4 * v64;
      goto LABEL_114;
    }
    uint64_t v79 = (unsigned __int16 *)(v67 + 4 * v66);
    unsigned int v80 = *v79;
    if ((int)v59 >= (int)(v80 >> 1))
    {
      if (v59 != v80 >> 1 && (int)(*(unsigned __int8 *)(v78 + v66) + (v80 >> 1)) < (int)v59) {
        goto LABEL_123;
      }
      unint64_t v104 = *(unsigned int *)v79;
      if ((v104 & 1) == 0) {
        goto LABEL_143;
      }
      uint64_t v87 = v67 + 4 * v66;
LABEL_114:
      uint64_t v74 = v87 + 2;
      uint64_t v73 = 1;
      goto LABEL_115;
    }
    uint64_t v81 = v66 - 1;
    if (v81 <= v64) {
      goto LABEL_123;
    }
    uint64_t v82 = v64 + 1;
    while (1)
    {
      uint64_t v83 = v82 + v81;
      if (v82 + v81 < 0 != __OFADD__(v82, v81)) {
        ++v83;
      }
      uint64_t v84 = v83 >> 1;
      unsigned int v85 = *(unsigned __int16 *)(v67 + 4 * v84);
      if ((int)v59 >= (int)(v85 >> 1)) {
        break;
      }
      uint64_t v81 = v84 - 1;
LABEL_107:
      if (v82 > v81) {
        goto LABEL_123;
      }
    }
    if (v59 != v85 >> 1 && (int)(*(unsigned __int8 *)(v78 + v84) + (v85 >> 1)) < (int)v59)
    {
      uint64_t v82 = v84 + 1;
      goto LABEL_107;
    }
    unint64_t v104 = *(unsigned int *)(v67 + 4 * v84);
    if (v104)
    {
      uint64_t v87 = v67 + 4 * v84;
      goto LABEL_114;
    }
LABEL_143:
    unint64_t v71 = v104 >> 16;
LABEL_91:
    uint64_t v72 = *(void *)(v20 + 40);
    uint64_t v73 = *(unsigned __int16 *)(v72 + 2 * v71);
    if (*(_WORD *)(v72 + 2 * v71))
    {
      uint64_t v74 = v72 + 2 * v71 + 2;
LABEL_115:
      uint64_t v88 = 0;
      uint64_t v89 = v10 + v9 - 2;
      do
      {
        if (v15 <= 99)
        {
          unsigned int v90 = *(unsigned __int16 *)(v74 + 2 * v88);
          unsigned int v91 = v90 >> 1;
          uint64_t v92 = v16;
          while (v92 >= 1)
          {
            int v93 = *(unsigned __int16 *)(v89 + 2 * v92--);
            if (v91 == v93) {
              goto LABEL_122;
            }
          }
          HIDWORD(v116[2 * v15]) = HIDWORD(v116[2 * v15]) & 0xFFFE0001 | v90 & 0xFFFE;
          ++v15;
          *(_WORD *)(v12 + 2 * v16++) = v91;
        }
LABEL_122:
        ++v88;
      }
      while (v88 != v73);
    }
LABEL_123:
    if (a3 > 69) {
      goto LABEL_149;
    }
    uint64_t v94 = *(void *)(a1 + 176);
    if (v94 < 0) {
      goto LABEL_125;
    }
    if (v94 < v9)
    {
LABEL_149:
      if (v15 >= 1) {
        uint64_t v15 = 1;
      }
      if ((*(unsigned char *)(a1 + 232) & 2) == 0) {
        *(unsigned char *)(a1 + 232) |= 2u;
      }
      uint64_t v95 = v15 - 1;
      goto LABEL_134;
    }
    *(void *)(a1 + 176) = -1;
LABEL_125:
    uint64_t v95 = v15 - 1;
    if (v15 <= 1)
    {
LABEL_134:
      if (v15 < 1) {
        return result;
      }
      long long v113 = 0u;
      long long v114 = 0u;
      v101 = &v116[2 * v95];
      long long v102 = v101[1];
      long long v111 = *v101;
      long long v112 = v102;
      if (!processToken(a1, v8, v6, v11 >> 48, v110, v109, v9, (uint64_t)&v111, (uint64_t *)&v113)) {
        return result;
      }
      uint64_t result = *(double *)&v113;
      long long v103 = v114;
      *(_OWORD *)a2 = v113;
      *((_OWORD *)a2 + 1) = v103;
      if (*(uint64_t *)(a1 + 184) >= 30001) {
        return result;
      }
      continue;
    }
    break;
  }
  v96 = v116;
  uint64_t v97 = 1;
  while (1)
  {
    long long v98 = v96[1];
    long long v111 = *v96;
    long long v112 = v98;
    long long v113 = 0u;
    long long v114 = 0u;
    if (processToken(a1, v8, v6, v11 >> 48, v110, v109, v9, (uint64_t)&v111, (uint64_t *)&v113))
    {
      long long v111 = v113;
      long long v112 = v114;
      _DDScannerHandleState(a1, &v111, v108);
    }
    uint64_t v99 = *(void *)(a1 + 176);
    BOOL v100 = v99 >= 1 && v99 < v9;
    if (v100) {
      return result;
    }
    v96 += 2;
    if (v15 == ++v97) {
      goto LABEL_134;
    }
  }
}

uint64_t processToken(uint64_t a1, uint64_t a2, int64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t *a9)
{
  uint64_t v9 = a7;
  uint64_t v10 = a6;
  uint64_t v12 = a2;
  uint64_t v14 = a9;
  unsigned int v15 = *(_DWORD *)(a8 + 12);
  if ((v15 & 0x10000) == 0)
  {
    uint64_t v16 = *(void *)(a1 + 16);
    uint64_t v17 = *(void *)(v16 + 16);
    unsigned int v18 = (unsigned __int16)v15 >> 1;
    uint64_t v19 = (__int16 *)(v17 + 12 * ((unsigned __int16)v15 >> 1));
    unint64_t v20 = *((unsigned __int8 *)v19 + 10);
    if (*((unsigned char *)v19 + 10))
    {
      int v21 = *((unsigned __int8 *)v19 + 10);
      do
      {
        unsigned int v22 = v10;
        uint64_t v10 = (void *)*v10;
        --v21;
      }
      while (v21);
      uint64_t v12 = v22[1];
    }
    if ((*(unsigned char *)(v17 + 12 * ((unsigned __int16)v15 >> 1) + 11) & 2) != 0) {
      unint64_t v23 = -1;
    }
    else {
      unint64_t v23 = (unint64_t)*(unsigned int *)(*(void *)(*(void *)(v16 + 8) + 64)
    }
                                              + 4
                                              * (*(int *)(*(void *)(*(void *)(v16 + 8) + 56) + 4 * v12)
                                               + (unint64_t)(unsigned __int16)v19[3])) >> 17;
    uint64_t v45 = *(void *)(a1 + 192);
    BOOL v46 = (v45 & 0x40000000) == 0;
    if (*((unsigned char *)v19 + 10))
    {
      uint64_t v47 = *(unsigned int *)(a5 + 8);
      unint64_t v48 = (unint64_t)(v47 << 40 >> 24) >> 16;
      unint64_t v49 = (v48 << 16) | (*(void *)a5 << 32);
      unint64_t v50 = ((v48 + ((unint64_t)(int)v47 >> 24)) << 16) | *(void *)a5 & 0xFFFFFFFF00000000;
      BOOL v46 = (v45 & 0x40000000) == 0 && *(__int16 *)(a5 + 14) < 0;
      uint64_t v51 = *(void *)(a5 + 16);
      int v52 = v20 - 1;
      if (v20 != 1)
      {
        do
        {
          uint64_t v53 = *(unsigned int *)(v51 + 8);
          uint64_t v54 = v53 << 40;
          uint64_t v55 = v53 << 40 >> 40;
          uint64_t v56 = v55 + ((uint64_t)(int)v53 >> 24);
          uint64_t v57 = (uint64_t)(int)v49 >> 16;
          uint64_t v58 = v54 << 8 >> 48;
          if (SHIDWORD(v49) >= (int)*(void *)v51) {
            unint64_t v59 = (v55 << 16) | (*(void *)v51 << 32);
          }
          else {
            unint64_t v59 = v49;
          }
          if ((int)v57 <= (int)v58) {
            unint64_t v60 = v59;
          }
          else {
            unint64_t v60 = (v55 << 16) | (*(void *)v51 << 32);
          }
          if ((int)v57 >= (__int16)v55) {
            unint64_t v49 = v60;
          }
          uint64_t v61 = (uint64_t)(int)v50 >> 16;
          if (SHIDWORD(v50) >= (int)HIDWORD(*(void *)v51)) {
            unint64_t v62 = v50;
          }
          else {
            unint64_t v62 = (v56 << 16) | *(void *)v51 & 0xFFFFFFFF00000000;
          }
          if ((int)v61 > (__int16)v56) {
            unint64_t v62 = v50;
          }
          if ((int)v61 >= (__int16)v56) {
            unint64_t v50 = v62;
          }
          else {
            unint64_t v50 = (v56 << 16) | *(void *)v51 & 0xFFFFFFFF00000000;
          }
          BOOL v46 = v46 && *(__int16 *)(v51 + 14) < 0;
          uint64_t v51 = *(void *)(v51 + 16);
          --v52;
        }
        while (v52);
      }
    }
    else
    {
      unint64_t v49 = a3 & 0xFFFFFFFFFFFF0000;
      unint64_t v50 = a3 & 0xFFFFFFFFFFFF0000;
      uint64_t v51 = a5;
    }
    if (*(unsigned char *)(v17 + 12 * ((unsigned __int16)v15 >> 1) + 11))
    {
      uint64_t v81 = (__int16 *)(v17 + 12 * ((unsigned __int16)v15 >> 1));
      uint64_t v82 = v17;
      unint64_t v83 = v23;
      int64_t v84 = a3;
      uint64_t v85 = v12;
      uint64_t v86 = a4;
      uint64_t v87 = 0;
      if (!DDTokenCacheGetTokensAtPosition(*(void **)(a1 + 40), *(void **)(a1 + 56), v49, &v87)) {
        return 0;
      }
      if (HIDWORD(*v87) != HIDWORD(v49)) {
        return 0;
      }
      if ((int)*v87 >> 16 != (int)v49 >> 16) {
        return 0;
      }
      uint64_t v75 = v87[1];
      if (HIDWORD(v75) != HIDWORD(v50) || (int)v75 >> 16 != (int)v50 >> 16) {
        return 0;
      }
      a4 = v86;
      uint64_t v14 = a9;
      a3 = v84;
      uint64_t v12 = v85;
      uint64_t v17 = v82;
      unint64_t v23 = v83;
      uint64_t v19 = v81;
      unsigned int v18 = (unsigned __int16)v15 >> 1;
      if (!v46) {
        goto LABEL_57;
      }
    }
    else if (!v46)
    {
      goto LABEL_57;
    }
    if (*v19 == -1 && *(__int16 *)(v17 + 12 * v18 + 2) == -1)
    {
      if (v9 >= 6001 && v20)
      {
        if (v20 >= 2)
        {
          int v77 = v20 - 1;
          do
          {
            a5 = *(void *)(a5 + 16);
            --v77;
          }
          while (v77);
        }
        if (a5)
        {
          unint64_t v78 = *(unsigned int *)(a5 + 8) | ((unint64_t)*(unsigned __int8 *)(a5 + 12) << 32);
          *(_WORD *)(a5 + 14) = -1;
          *(void *)a5 = v50 & 0xFFFFFFFF00000000 | HIDWORD(v49);
          *(_DWORD *)(a5 + 8) = ((int)v49 >> 16) & 0xFFFFFF | ((BYTE2(v50) - BYTE2(v49)) << 24);
          *(_WORD *)(a5 + 12) = ((v78 & 0xFFFFFFF1FFFFFFFFLL) >> 32);
          *(void *)(a5 + 16) = v51;
          if ((v78 & 0x100000000) != 0)
          {
            *(_DWORD *)(a5 + 24) = 0;
            *(void *)(a5 + 32) = 0;
            *(void *)(a5 + 40) = 0;
          }
        }
        uint64_t v79 = a5 - *(void *)(a1 + 208);
        uint64_t v80 = *(void *)(a1 + 176);
        if (v80 < 0 || v79 < v80) {
          *(void *)(a1 + 176) = v79;
        }
        if (!a5) {
          return 0;
        }
        uint64_t v9 = v79 + 48;
        uint64_t v63 = a5;
      }
      else
      {
        if ((unint64_t)(v9 + 24) > 0x1F40)
        {
          uint64_t v63 = 0;
        }
        else
        {
          uint64_t v63 = *(void *)(a1 + 208) + v9;
          v9 += 24;
        }
        char v76 = *(unsigned char *)(v63 + 12);
        *(_WORD *)(v63 + 14) = -1;
        *(void *)uint64_t v63 = v50 & 0xFFFFFFFF00000000 | HIDWORD(v49);
        *(_DWORD *)(v63 + 8) = ((int)v49 >> 16) & 0xFFFFFF | ((BYTE2(v50) - BYTE2(v49)) << 24);
        *(_WORD *)(v63 + 12) = v76 & 0xF0;
        *(void *)(v63 + 16) = v51;
      }
      goto LABEL_65;
    }
LABEL_57:
    if (v9 + 8 * v20 + 24 > 0x1F40)
    {
      uint64_t v63 = 0;
    }
    else
    {
      uint64_t v63 = *(void *)(a1 + 208) + v9;
      v9 += 8 * v20 + 24;
    }
    char v64 = *(unsigned char *)(v63 + 12);
    *(_WORD *)(v63 + 14) = (unsigned __int16)v15 >> 1;
    *(void *)uint64_t v63 = v50 & 0xFFFFFFFF00000000 | HIDWORD(v49);
    *(_DWORD *)(v63 + 8) = ((int)v49 >> 16) & 0xFFFFFF | ((BYTE2(v50) - BYTE2(v49)) << 24);
    *(_WORD *)(v63 + 12) = v64 & 0xF0;
    *(void *)(v63 + 16) = v51;
    if (a5 && v20)
    {
      uint64_t v65 = 0;
      do
      {
        *(void *)(v63 + 8 * v65++ + 24) = a5;
        if (v20 < 2) {
          break;
        }
        a5 = *(void *)(a5 + 16);
        --v20;
      }
      while (a5);
      *(unsigned char *)(v63 + 13) = v65;
    }
LABEL_65:
    if ((v23 & 0x8000000000000000) != 0)
    {
      if ((a4 & 0x8000000000000000) == 0) {
        DDInsertResultRec(a1, v63, v63, a4, 4294901760, 0xFFFF0000uLL);
      }
    }
    else
    {
      uint64_t v66 = *(void *)(a1 + 184);
      if (v66 <= 30000)
      {
        uint64_t v67 = *(unsigned __int16 *)(v17 + 12 * v18 + 4);
        *(void *)(a1 + 184) = v66 + 1;
        if ((unint64_t)(v9 + 16) <= 0x1F40)
        {
          uint64_t v68 = *(void *)(a1 + 208);
          if (v68)
          {
            uint64_t v69 = v67 + a4;
            unint64_t v70 = (void *)(v68 + v9);
            *unint64_t v70 = v10;
            v70[1] = v12;
            uint64_t v71 = *(void *)(a1 + 56);
            uint64_t v72 = (uint64_t)(int)a3 >> 16;
            uint64_t v73 = *(void *)(v71 + 16);
            if (*(void *)(v73 + 48 * (int)v72 + 24) + *(void *)(v73 + 48 * (int)v72 + 16) == a3 >> 32
              && (*(unsigned char *)(v73 + 48 * (int)v72 + 43) & 0x1C) == 0
              && v72 < *(void *)(v71 + 32) - 1)
            {
              a3 = ((v72 << 16) + 0x10000) & 0xFFFF0000 | (unint64_t)(unsigned __int16)a3 | (*(void *)(v73 + 48 * (((v72 << 16) + 0x10000) >> 16) + 16) << 32);
            }
            *uint64_t v14 = v63;
            v14[1] = (uint64_t)v70;
            unint64_t v44 = ((unint64_t)(unsigned __int16)v23 << 32) | (v69 << 48) | (v9 + 16);
            v14[2] = a3;
LABEL_71:
            v14[3] = v44;
            return 1;
          }
        }
      }
    }
    return 0;
  }
  uint64_t v25 = *(void *)(a8 + 16);
  uint64_t v24 = *(void *)(a8 + 24);
  int64_t v26 = *(void *)a8;
  uint64_t v27 = 24;
  if (v15 & 1 | (v25 != 0) | (v24 != 0)) {
    uint64_t v27 = 48;
  }
  uint64_t v28 = v27 + a7;
  if ((unint64_t)(v27 + a7) > 0x1F40)
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = *(void *)(a1 + 208) + a7;
    uint64_t v9 = v28;
  }
  uint64_t v30 = 0x100000000;
  if (!(v15 & 1 | (v25 != 0) | (v24 != 0))) {
    uint64_t v30 = 0;
  }
  unint64_t v31 = v30 & 0xFFFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(v29 + 12) >> 4 << 36);
  unint64_t v32 = *(void *)a8 & 0xFFFFFFFF00000000 | HIDWORD(a3);
  *(_WORD *)(v29 + 14) = -(v15 >> 17);
  *(void *)uint64_t v29 = v32;
  *(unsigned char *)(v29 + 12) = BYTE4(v31);
  unint64_t v33 = v31 & 0xFFFFFFFFFF000000 | ((uint64_t)(int)a3 >> 16) & 0xFFFFFF | ((unint64_t)(BYTE2(v26) - BYTE2(a3)) << 24);
  *(_DWORD *)(v29 + 8) = v33;
  *(unsigned char *)(v29 + 13) = 0;
  *(void *)(v29 + 16) = a5;
  if (v15 & 1 | (v25 != 0) | (v24 != 0))
  {
    *(_DWORD *)(v29 + 24) = 0;
    *(void *)(v29 + 32) = 0;
    *(void *)(v29 + 40) = 0;
    if (v15)
    {
      int v34 = *(_DWORD *)(a8 + 8);
      *(_DWORD *)(v29 + 8) = v33;
      v33 |= 0x200000000uLL;
      *(void *)uint64_t v29 = v32;
      *(unsigned char *)(v29 + 12) = BYTE4(v33);
      *(_DWORD *)(v29 + 24) = v34;
    }
    if (v25)
    {
      *(_DWORD *)(v29 + 8) = v33;
      v33 |= 0x800000000uLL;
      *(void *)uint64_t v29 = v32;
      *(unsigned char *)(v29 + 12) = BYTE4(v33);
      *(void *)(v29 + 32) = v25;
    }
    if (v24)
    {
      *(void *)uint64_t v29 = v32;
      *(_DWORD *)(v29 + 8) = v33;
      *(unsigned char *)(v29 + 12) = (v33 | 0x400000000) >> 32;
      *(void *)(v29 + 40) = v24;
    }
  }
  uint64_t v35 = *(void *)(a1 + 184);
  if (v35 <= 30000)
  {
    int v36 = *(_DWORD *)(a8 + 12);
    int64_t v37 = *(void *)a8;
    *(void *)(a1 + 184) = v35 + 1;
    if ((unint64_t)(v9 + 16) <= 0x1F40)
    {
      uint64_t v38 = *(void *)(a1 + 208);
      if (v38)
      {
        uint64_t v39 = (unsigned __int16)v36 >> 1;
        uint64_t v40 = (void *)(v38 + v9);
        *uint64_t v40 = a6;
        v40[1] = a2;
        uint64_t v41 = *(void *)(a1 + 56);
        uint64_t v42 = (uint64_t)(int)v37 >> 16;
        uint64_t v43 = *(void *)(v41 + 16);
        if (*(void *)(v43 + 48 * (int)v42 + 24) + *(void *)(v43 + 48 * (int)v42 + 16) == v37 >> 32
          && (*(unsigned char *)(v43 + 48 * (int)v42 + 43) & 0x1C) == 0
          && v42 < *(void *)(v41 + 32) - 1)
        {
          int64_t v37 = ((v42 << 16) + 0x10000) & 0xFFFF0000 | (unint64_t)(unsigned __int16)v37 | (*(void *)(v43 + 48 * (((v42 << 16) + 0x10000) >> 16) + 16) << 32);
        }
        *a9 = v29;
        a9[1] = (uint64_t)v40;
        unint64_t v44 = (a4 << 48) | (v39 << 32) | (v9 + 16);
        a9[2] = v37;
        goto LABEL_71;
      }
    }
  }
  return 0;
}

uint64_t computeLexemsAtPosition()
{
  uint64_t v0 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v292 = *MEMORY[0x1E4F143B8];
  uint64_t v284 = 0;
  if (DDLexemCacheGetLexems(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 56) + 16), v3, v1, &v284))return v284; {
  uint64_t v6 = *(void **)(v5 + 56);
  }
  v283 = 0;
  uint64_t TokensAtPosition = (uint64_t)DDTokenCacheGetTokensAtPosition(*(void **)(v5 + 40), v6, v4, &v283);
  uint64_t v8 = (uint64_t)(int)v4 >> 16;
  uint64_t v9 = v4 >> 32;
  uint64_t v10 = TokensAtPosition - 1;
  v249 = v2;
  if (TokensAtPosition < 1)
  {
    uint64_t v12 = 4294901760;
    uint64_t v258 = 4294901760;
  }
  else
  {
    uint64_t v11 = v283;
    uint64_t v12 = *v283;
    unint64_t v13 = HIDWORD(*v283);
    uint64_t v14 = (uint64_t)(int)*v283 >> 16;
    if (v13 == HIDWORD(v4) && v14 == v8)
    {
      uint64_t v15 = v283[1];
      uint64_t v16 = v284;
      uint64_t v258 = v15;
      int v17 = 0;
      if (v284 <= 46)
      {
        unsigned int v18 = **(unsigned __int16 ***)(v5 + 16);
        uint64_t v19 = (unint64_t *)&v291[2 * v284];
        *uint64_t v19 = v15 & 0xFFFFFFFFFFFF0000 | v18[20];
        v19[1] = 0;
        v19[2] = 0;
        v19[3] = 0;
        v19[4] = v12 & 0xFFFFFFFFFFFF0000 | v18[21];
        v19[5] = 0;
        v19[6] = 0;
        v19[7] = 0;
        v19[8] = v12 & 0xFFFFFFFFFFFF0000 | v18[23];
        v19[9] = 0;
        v19[10] = 0;
        v19[11] = 0;
        uint64_t v284 = v16 + 3;
      }
    }
    else
    {
      int v17 = 1;
      uint64_t v258 = 4294901760;
      uint64_t v12 = 4294901760;
    }
    if ((unint64_t)TokensAtPosition >= 2)
    {
      BOOL v22 = v13 == HIDWORD(v4);
      uint64_t v20 = v284;
      unint64_t v21 = v4 & 0xFFFFFFFFFFFF0000;
      BOOL v22 = v22 && v14 == v8;
      int v23 = !v22;
      uint64_t v24 = v11 + 3;
      do
      {
        uint64_t v25 = *(v24 - 1);
        uint64_t v26 = *v24;
        if (HIDWORD(v25) == HIDWORD(v4) && (int)v25 >> 16 == v8)
        {
          uint64_t v32 = v258;
          if ((int)v12 >> 16 == 0xFFFFFFFFLL) {
            uint64_t v32 = *v24;
          }
          uint64_t v258 = v32;
          if ((int)v12 >> 16 == 0xFFFFFFFFLL) {
            uint64_t v12 = v25;
          }
          if (v20 < 47) {
            int v33 = v23;
          }
          else {
            int v33 = 0;
          }
          if (v33 == 1)
          {
            int v34 = **(unsigned __int16 ***)(v5 + 16);
            uint64_t v35 = (unint64_t *)&v291[2 * v20];
            *uint64_t v35 = v26 & 0xFFFFFFFFFFFF0000 | v34[20];
            v35[1] = 0;
            v35[2] = 0;
            v35[3] = 0;
            unint64_t v36 = v25 & 0xFFFFFFFFFFFF0000;
            v35[4] = v36 | v34[21];
            v35[5] = 0;
            v35[6] = 0;
            v35[7] = 0;
            v20 += 3;
            v35[8] = v36 | v34[23];
            v35[9] = 0;
            v35[10] = 0;
            v35[11] = 0;
          }
        }
        BOOL v22 = HIDWORD(v26) == HIDWORD(v4);
        uint64_t v28 = (uint64_t)(int)v26 >> 16;
        BOOL v29 = v22 && v28 == v8;
        if (v29 && v20 <= 47)
        {
          uint64_t v30 = (unint64_t *)&v291[2 * v20];
          uint64_t v31 = **(void **)(v5 + 16);
          *uint64_t v30 = v21 | *(unsigned __int16 *)(v31 + 44);
          v30[1] = 0;
          v30[2] = 0;
          v30[3] = 0;
          v20 += 2;
          v30[4] = v21 | *(unsigned __int16 *)(v31 + 46);
          v30[5] = 0;
          v30[6] = 0;
          v30[7] = 0;
        }
        v24 += 2;
        --v10;
      }
      while (v10);
      uint64_t v284 = v20;
    }
    if (v17)
    {
      uint64_t v256 = v12;
      goto LABEL_47;
    }
  }
  uint64_t v37 = *(void *)(v6[2] + 48 * (int)v8 + 16);
  uint64_t v256 = v12;
  if (v9 > v37
    && (uint64_t)DDTokenCacheGetTokensAtPosition(*(void **)(v5 + 40), v6, (v4 & 0xFFFFFFFF00000000 | (v8 << 16)) - 0x100000000, &v283) >= 1)
  {
    uint64_t v38 = v283[1];
    BOOL v22 = HIDWORD(v38) == HIDWORD(v4);
    uint64_t v39 = (uint64_t)(int)v38 >> 16;
    if (v22 && v39 == (int)v4 >> 16)
    {
      uint64_t v242 = v284;
      if (v284 <= 47)
      {
        v243 = (unint64_t *)&v291[2 * v284];
        uint64_t v244 = **(void **)(v5 + 16);
        unint64_t *v243 = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v244 + 44);
        v243[1] = 0;
        v243[2] = 0;
        v243[3] = 0;
        v243[4] = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v244 + 46);
        v243[5] = 0;
        v243[6] = 0;
        v243[7] = 0;
        uint64_t v284 = v242 + 2;
      }
    }
  }
LABEL_47:
  uint64_t v41 = v6[2];
  uint64_t v42 = v41 + 48 * (int)v8;
  if (v9 < *(void *)(v42 + 24) + *(void *)(v42 + 16))
  {
    int CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)v42, v4 >> 32);
    if (CharacterAtIndex != 10 && CharacterAtIndex != 13 && CharacterAtIndex != 8232) {
      goto LABEL_69;
    }
LABEL_67:
    uint64_t v50 = v284;
    if (v284 <= 49)
    {
      uint64_t v51 = (unint64_t *)&v291[2 * v284];
      *uint64_t v51 = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(**(void **)(v5 + 16) + 50);
      v51[1] = 0;
      v51[2] = 0;
      v51[3] = 0;
      uint64_t v284 = v50 + 1;
    }
    goto LABEL_69;
  }
  if (v8 == v6[4] - 1) {
    goto LABEL_67;
  }
  unsigned int v46 = (*(_DWORD *)(v41 + 48 * (int)v8 + 40) >> 26) & 7;
  if (v46 > 2) {
    goto LABEL_67;
  }
  if (!v46)
  {
    int v47 = CFStringGetCharacterAtIndex(*(CFStringRef *)(v41 + 48 * (int)v8 + 48), *(void *)(v41 + 48 * (int)v8 + 64));
    BOOL v48 = v47 == 10 || v47 == 8232;
    if (v48 || v47 == 13) {
      goto LABEL_67;
    }
  }
LABEL_69:
  if (v9 <= *(void *)(v42 + 16))
  {
    uint64_t v54 = v256;
    uint64_t v55 = v258;
    if ((int)v8 >= 1
      && (v56 = v6[2], uint64_t v57 = v56 + 48 * (v8 - 1), v58 = (*(_DWORD *)(v57 + 40) >> 26) & 7, v58 <= 2))
    {
      if (v58)
      {
        int v53 = 0;
        int v52 = 0;
      }
      else
      {
        int v52 = CFStringGetCharacterAtIndex(*(CFStringRef *)v57, *(void *)(v56 + 48 * (v8 - 1) + 16)+ *(void *)(v56 + 48 * (v8 - 1) + 24)- 1);
        int v53 = 0;
      }
    }
    else
    {
      int v52 = 0;
      int v53 = 1;
    }
  }
  else
  {
    int v52 = CFStringGetCharacterAtIndex(*(CFStringRef *)v42, (v4 - 0x100000000) >> 32);
    int v53 = 0;
    uint64_t v54 = v256;
    uint64_t v55 = v258;
  }
  if (v52 == 10) {
    int v53 = 1;
  }
  if (v52 == 13) {
    int v53 = 1;
  }
  if (v52 == 8232) {
    int v53 = 1;
  }
  uint64_t v59 = v284;
  if (v53 == 1 && v284 <= 49)
  {
    unint64_t v60 = (unint64_t *)&v291[2 * v284];
    uint64_t v59 = v284 + 1;
    *unint64_t v60 = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(**(void **)(v5 + 16) + 48);
    v60[1] = 0;
    v60[2] = 0;
    v60[3] = 0;
    uint64_t v284 = v59;
  }
  if (v59 <= 49)
  {
    v59 += DDLexerDeterministicScan(*(void *)(v5 + 24), v4, (uint64_t)&v291[2 * v59], 50 - v59);
    uint64_t v284 = v59;
  }
  uint64_t v259 = v5;
  if ((int)v54 >> 16 == -1 || v59 >= 50) {
    goto LABEL_317;
  }
  unint64_t v61 = 0;
  v247[0] = &v286;
  v247[1] = v266;
  v264 = &v290;
  v254 = v6;
  uint64_t v255 = v4;
  uint64_t v248 = v4 >> 32;
  uint64_t v253 = (uint64_t)(int)v4 >> 16;
  do
  {
    uint64_t v62 = *(void *)(v5 + 8 * v61 + 72);
    if (!v62) {
      goto LABEL_315;
    }
    unint64_t v262 = v61;
    uint64_t v263 = v59;
    uint64_t v63 = &v291[2 * v59];
    uint64_t v261 = v62;
    uint64_t v64 = DDLookupTableRefLookupCurrentWord(v5, v62, v54, v55, v4, (uint64_t)v63, 50 - v59, 0);
    if (v64 < 1)
    {
      unint64_t v61 = v262;
      uint64_t v65 = v263;
      goto LABEL_314;
    }
    unint64_t v61 = v262;
    if ((v262 & 0x7FFFFFFE) != 2 && (v262 - 5) > 1)
    {
      uint64_t v65 = v263;
      goto LABEL_314;
    }
    uint64_t v66 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
    uint64_t v68 = (char *)v247 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x1F4188790](v66);
    unint64_t v70 = (char *)v247 - v69;
    uint64_t v71 = 0;
    unint64_t v72 = *(void *)(v5 + 192);
    uint64_t v65 = v263;
    uint64_t v73 = &v291[2 * v263];
    int v76 = *((_DWORD *)v73 + 3);
    uint64_t v75 = (float *)v73 + 3;
    int v74 = v76;
    int v77 = v75 - 1;
    uint64_t v78 = v261;
    do
    {
      if ((v74 & 0x10000) == 0)
      {
        uint64_t v85 = 0;
        uint64_t v6 = v254;
        uint64_t v4 = v255;
        LODWORD(v8) = v253;
        goto LABEL_313;
      }
      uint64_t v79 = *(__int16 *)v63;
      uint64_t v80 = *(void **)(v78 + 24);
      if (v80) {
        BOOL v81 = (unint64_t)(v79 - 8) > 0x1F;
      }
      else {
        BOOL v81 = 1;
      }
      if (v81) {
        goto LABEL_109;
      }
      uint64_t v82 = v80[6];
      if (!v82 || (int)v80[12] < 1) {
        goto LABEL_109;
      }
      uint64_t v83 = v80[12];
      while (!*(unsigned char *)(v82 + 6) || v79 != *(__int16 *)(v82 + 4))
      {
        v82 += 8;
        if (!--v83) {
          goto LABEL_109;
        }
      }
      if (*(unsigned char *)(v82 + 7)) {
        float v84 = *(float *)v82;
      }
      else {
LABEL_109:
      }
        float v84 = 0.0;
      if (v64 == 1 && !v71 && (v72 & 0x2000000) == 0 && *v77 > v84)
      {
        *int v77 = *v77 - v84;
        uint64_t v85 = 1;
        uint64_t v6 = v254;
        uint64_t v4 = v255;
        LODWORD(v8) = v253;
LABEL_272:
        unint64_t v210 = v85;
        do
        {
          unint64_t v211 = v210 - 1;
          if (v80)
          {
            uint64_t v212 = SLOWORD(v291[2 * v65 + 2 * v211]);
            if ((unint64_t)(v212 - 8) <= 0x1F)
            {
              v213 = (int *)v80[7];
              if (v213)
              {
                if ((int)v80[13] >= 1)
                {
                  uint64_t v214 = v80[13];
                  while (!*((unsigned char *)v213 + 6) || v212 != *((__int16 *)v213 + 2))
                  {
                    v213 += 2;
                    if (!--v214) {
                      goto LABEL_281;
                    }
                  }
                  uint64_t v215 = *v213;
                  if (v215 && *((unsigned char *)v213 + 7) && v80[14] > v215) {
                    *(void *)&v291[2 * v65 + 1 + 2 * v211] = v80[8] + v215;
                  }
                }
              }
            }
          }
LABEL_281:
          BOOL v81 = v210-- > 1;
        }
        while (v81);
        v216 = *(uint64_t **)(v5 + 152);
        if (!v216)
        {
          v216 = (uint64_t *)malloc_type_calloc(1uLL, 0x3D0uLL, 0x10300403B58F53CuLL);
          if (v216)
          {
            uint64_t *v216 = -1;
            v216[1] = -1;
          }
          *(void *)(v5 + 152) = v216;
          unint64_t v61 = v262;
          uint64_t v65 = v263;
        }
        uint64_t v217 = v6[2] + 48 * (int)v8;
        uint64_t v218 = *(void *)(v217 + 32) + v9 - *(void *)(v217 + 16);
        if (v218 < 0) {
          goto LABEL_313;
        }
        uint64_t v220 = *v216;
        uint64_t v219 = v216[1];
        if (*v216 < 0)
        {
          if (v220 != -1) {
            goto LABEL_301;
          }
          uint64_t v223 = (uint64_t)(v216 + 2);
          uint64_t *v216 = 0;
          v216[1] = 0;
        }
        else
        {
          if (v216[8 * v220 + 2] >= v218)
          {
            if (DDLogHandle_onceToken != -1) {
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
            }
            v221 = DDLogHandle_error_log_handle;
            if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v285[0]) = 0;
              _os_log_error_impl(&dword_19DC95000, v221, OS_LOG_TYPE_ERROR, "DDSourceMatchCacheAddEntry location should be constant or monotonically increasing", (uint8_t *)v285, 2u);
            }
            unint64_t v61 = v262;
            uint64_t v65 = v263;
            goto LABEL_313;
          }
LABEL_301:
          uint64_t v222 = (v220 + 1) % 15;
          if (v219 == v222) {
            uint64_t v219 = (v219 + 1) % 15;
          }
          uint64_t *v216 = v222;
          v216[1] = v219;
          uint64_t v223 = (uint64_t)&v216[8 * v222 + 2];
        }
        *(void *)uint64_t v223 = v218;
        if (v85 == 1)
        {
          long long v224 = v63[1];
          *(_OWORD *)(v223 + 32) = *v63;
          *(_OWORD *)(v223 + 48) = v224;
        }
        else
        {
          v225 = *(void **)(v223 + 24);
          if (*(void *)(v223 + 16) < v85)
          {
            if (v225) {
              free(v225);
            }
            v225 = malloc_type_malloc(32 * v85, 0xB6097451uLL);
            *(void *)(v223 + 16) = v85;
            *(void *)(v223 + 24) = v225;
          }
          memcpy(v225, v63, 32 * v85);
          unint64_t v61 = v262;
          uint64_t v65 = v263;
        }
        *(void *)(v223 + 8) = v85;
        uint64_t v5 = v259;
        goto LABEL_313;
      }
      *(float *)&v70[4 * v71] = v84;
      *(_DWORD *)&v68[4 * v71++] = 0;
    }
    while (v71 != v64);
    unint64_t v250 = v72;
    v251 = v70;
    v252 = v247;
    uint64_t v279 = 0;
    v280 = &v279;
    uint64_t v281 = 0x2000000000;
    int v282 = 0;
    uint64_t v275 = 0;
    v276 = &v275;
    uint64_t v277 = 0x2000000000;
    int v278 = 0;
    v274[0] = 0;
    v274[1] = v274;
    v274[2] = 0x2000000000;
    v274[3] = &v289;
    v273[0] = 0;
    v273[1] = v273;
    v273[2] = 0x2000000000;
    v273[3] = v288;
    v272[0] = 0;
    v272[1] = v272;
    v272[2] = 0x2000000000;
    v272[3] = v287;
    v271[0] = 0;
    v271[1] = v271;
    v271[2] = 0x2000000000;
    v271[3] = v285;
    uint64_t v267 = 0;
    v268 = &v267;
    uint64_t v269 = 0x2000000000;
    uint64_t v270 = 0;
    uint64_t v86 = *(uint64_t **)(v5 + 40);
    v265[0] = MEMORY[0x1E4F143A8];
    v265[1] = 0x40000000;
    v266[0] = __computeLexemsAtPosition_block_invoke;
    v266[1] = &unk_1E5984EF0;
    v266[2] = &v275;
    v266[3] = v274;
    v266[4] = v273;
    v266[5] = &v279;
    CFTypeRef v87 = v254;
    v266[10] = v254;
    v266[11] = v5;
    v266[12] = v78;
    v266[6] = &v267;
    v266[7] = v272;
    unint64_t v88 = v255;
    v266[8] = v271;
    v266[9] = v255;
    DDCachingStringTokenizerEnumerateTokens(*v86, v254, 1u, v255, (uint64_t)v265);
    DDCachingStringTokenizerEnumerateTokens(*v86, v87, 0, v88, (uint64_t)v265);
    uint64_t v89 = v268;
    if (v268[3] < 1) {
      goto LABEL_235;
    }
    int64_t v90 = 0;
    uint64_t v91 = 0;
    while (2)
    {
      uint64_t v92 = &v285[5 * v90];
      if (BYTE14(v287[2 * v92[3]]))
      {
        v260 = &v285[5 * v90];
        uint64_t v97 = v260[1];
        if (SHIDWORD(v97) >= 1)
        {
          uint64_t v98 = **(void **)(v259 + 40);
          unint64_t v257 = (v97 & 0xFFFFFFFF00000000) - 0x100000000;
          uint64_t v99 = v63;
          BOOL v100 = v68;
          uint64_t v101 = v91;
          uint64_t Offset = matchingTokenRealIndexForQueryOffset(v98, v257 & 0xFFFFFFFF00000000 | v97, 0);
          uint64_t v103 = _tokenEntryAtRealIndex(v98, Offset);
          uint64_t v91 = v101;
          uint64_t v68 = v100;
          uint64_t v63 = v99;
          if (v103)
          {
            uint64_t v104 = (uint64_t)(int)v97 >> 16;
            if ((int)v104 >= *(int *)v103 >> 16)
            {
              unint64_t v105 = *(void *)(v103 + 8);
              BOOL v106 = v104 == *(int *)v103 >> 16 && SHIDWORD(v257) < (int)HIDWORD(*(void *)v103);
              uint64_t v107 = (uint64_t)(int)v105 >> 16;
              if (!v106 && (int)v104 <= (int)v107)
              {
                if (v104 != v107
                  || ((unint64_t v109 = HIDWORD(v105), SHIDWORD(v257) < (int)v109)
                    ? (BOOL v110 = v109 == HIDWORD(v97))
                    : (BOOL v110 = 1),
                      !v110))
                {
                  uint64_t v111 = *(unsigned __int8 *)(v103 + 24);
                  if (!*(unsigned char *)(v103 + 24))
                  {
LABEL_150:
                    uint64_t v89 = v268;
                    uint64_t v92 = v260;
                    goto LABEL_122;
                  }
                  long long v112 = (uint64_t *)(*(void *)(v103 + 16) + 8);
                  while (1)
                  {
                    uint64_t v113 = *v112;
                    v112 += 4;
                    uint64_t v114 = (uint64_t)(int)v113 >> 16;
                    if (HIDWORD(v113) == HIDWORD(v97) && v114 == v104) {
                      break;
                    }
                    if (!--v111) {
                      goto LABEL_150;
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v91 = (v91 + 1);
        uint64_t v89 = v268;
        int64_t v93 = v268[3];
      }
      else
      {
LABEL_122:
        int64_t v93 = v89[3] - 1;
        if (v93 > v90)
        {
          uint64_t v94 = &v285[5 * v93];
          long long v95 = *(_OWORD *)v94;
          long long v96 = *((_OWORD *)v94 + 1);
          v92[4] = v94[4];
          *(_OWORD *)uint64_t v92 = v95;
          *((_OWORD *)v92 + 1) = v96;
          int64_t v93 = v89[3] - 1;
        }
        v89[3] = v93;
      }
      int64_t v90 = (int)v91;
      if (v93 > (int)v91) {
        continue;
      }
      break;
    }
    if (v93 > 1)
    {
      qsort(v285, v93, 0x28uLL, (int (__cdecl *)(const void *, const void *))keywordSort);
      v116 = v268;
      uint64_t v117 = v268[3];
      LODWORD(v118) = 0;
      if (v117 >= 2)
      {
        v119 = (long long *)v247[0];
        uint64_t v120 = 1;
        while (1)
        {
          int v121 = v118;
          v122 = &v285[5 * (int)v118];
          if (v122[2] == *((void *)v119 + 2)) {
            break;
          }
          uint64_t v118 = (int)v118 + 1;
          if (v120 != v121 + 1)
          {
            v122 = &v285[5 * v118];
LABEL_174:
            long long v133 = *v119;
            long long v134 = v119[1];
            v122[4] = *((void *)v119 + 4);
            *(_OWORD *)v122 = v133;
            *((_OWORD *)v122 + 1) = v134;
            uint64_t v117 = v116[3];
          }
LABEL_175:
          ++v120;
          v119 = (long long *)((char *)v119 + 40);
          if (v117 <= v120) {
            goto LABEL_179;
          }
        }
        unint64_t v123 = v285[5 * (int)v118 + 1];
        uint64_t v124 = (uint64_t)(int)v123 >> 16;
        if ((int)v124 < *(int *)v119 >> 16
          || ((unint64_t v125 = HIDWORD(v123), (int)v124 <= *(int *)v119 >> 16)
            ? (BOOL v126 = (int)v125 < (int)HIDWORD(*(void *)v119))
            : (BOOL v126 = 0),
              v126))
        {
          uint64_t v118 = (int)v118 + 1;
          if (v120 == v121 + 1) {
            goto LABEL_175;
          }
          v122 = &v285[5 * v118];
        }
        else
        {
          uint64_t v127 = *((void *)v119 + 1);
          uint64_t v128 = (uint64_t)(int)v127 >> 16;
          if ((int)v124 >= (int)v128)
          {
            if ((int)v124 > (int)v128) {
              goto LABEL_175;
            }
            if ((int)v125 >= SHIDWORD(v127))
            {
              if ((int)v125 > SHIDWORD(v127)) {
                goto LABEL_175;
              }
              uint64_t v129 = *((void *)v119 + 3);
              float v130 = *((float *)&v287[2 * v129] + 2);
              uint64_t v131 = v285[5 * (int)v118 + 3];
              float v132 = *((float *)&v287[2 * v131] + 2);
              if (v130 > v132
                || v130 >= v132 && ((HIBYTE(v287[2 * v129]) & 0x10) != 0 || (HIBYTE(v287[2 * v131]) & 0x10) == 0))
              {
                goto LABEL_175;
              }
            }
          }
        }
        goto LABEL_174;
      }
LABEL_179:
      int64_t v93 = (int)v118 + 1;
      v116[3] = v93;
    }
    if (v93 >= 1)
    {
      uint64_t v135 = 0;
      v136 = v276;
      v137 = v280;
      do
      {
        v138 = &v285[5 * v135];
        v139 = (float *)&v287[2 * v138[3]];
        uint64_t v140 = *(void *)v139;
        float v141 = v139[2];
        unsigned int v142 = *((_DWORD *)v139 + 3);
        unint64_t v145 = *v138;
        unint64_t v144 = v138[1];
        v143 = v138 + 4;
        unint64_t v146 = HIDWORD(v144);
        uint64_t v147 = (uint64_t)(int)v144 >> 16;
        unint64_t v148 = HIDWORD(v145);
        uint64_t v149 = (uint64_t)(int)v145 >> 16;
        uint64_t v150 = v64;
        do
        {
          uint64_t v151 = v150--;
          unint64_t v152 = *(void *)&v63[2 * v150];
          if ((unsigned __int16)v152 != (unsigned __int16)v140) {
            continue;
          }
          if (*v143) {
            char v153 = 24;
          }
          else {
            char v153 = 26;
          }
          unsigned int v154 = v142 >> v153;
          float v155 = 0.0;
          float v156 = 0.0;
          if ((v154 & 2) == 0) {
            goto LABEL_226;
          }
          if (*v143)
          {
            uint64_t v157 = *((int *)v137 + 6);
            if ((int)v157 >= 1)
            {
              uint64_t v158 = 15 - v157;
              uint64_t v159 = 14;
              while (1)
              {
                unint64_t v160 = v288[v159];
                uint64_t v161 = (uint64_t)(int)v160 >> 16;
                if ((int)v147 >= (int)v161)
                {
                  unint64_t v162 = HIDWORD(v160);
                  if ((int)v147 > (int)v161 || (int)v146 > (int)v162) {
                    break;
                  }
                }
                BOOL v81 = v159-- <= v158;
                if (v81) {
                  goto LABEL_210;
                }
              }
              uint64_t v158 = v159 + 1;
LABEL_210:
              uint64_t v169 = 15;
              goto LABEL_221;
            }
          }
          else
          {
            uint64_t v164 = *((unsigned int *)v136 + 6);
            if ((int)v164 >= 1)
            {
              uint64_t v165 = 0;
              unint64_t v166 = HIDWORD(v152);
              uint64_t v167 = (uint64_t)(int)v152 >> 16;
              uint64_t v168 = v164 + 15;
              uint64_t v169 = 15;
              while (1)
              {
                unint64_t v170 = v264[v165];
                uint64_t v171 = (uint64_t)(int)v170 >> 16;
                if ((int)v167 < (int)v171) {
                  break;
                }
                unint64_t v172 = HIDWORD(v170);
                if ((int)v167 <= (int)v171 && (int)v166 <= (int)v172)
                {
                  uint64_t v169 = v165 + 15;
                  break;
                }
                ++v165;
                ++v169;
                if (v164 == v165)
                {
                  uint64_t v169 = v164 + 15;
                  break;
                }
              }
              uint64_t v174 = 0;
              uint64_t v158 = 15;
              while (1)
              {
                unint64_t v175 = v264[v174];
                uint64_t v176 = (uint64_t)(int)v175 >> 16;
                if ((int)v149 < (int)v176) {
                  break;
                }
                unint64_t v177 = HIDWORD(v175);
                if ((int)v149 <= (int)v176 && (int)v148 < (int)v177) {
                  goto LABEL_221;
                }
                ++v174;
                ++v158;
                if (*((_DWORD *)v136 + 6) == v174)
                {
                  uint64_t v158 = v168;
                  goto LABEL_221;
                }
              }
              uint64_t v158 = v174 + 15;
              goto LABEL_221;
            }
          }
          uint64_t v169 = 15;
          uint64_t v158 = 15;
LABEL_221:
          uint64_t v179 = v169 - v158;
          uint64_t v180 = v158 - v169;
          if (*v143) {
            uint64_t v181 = v179;
          }
          else {
            uint64_t v181 = v180;
          }
          if ((unint64_t)(v181 - 1) > 9) {
            continue;
          }
          float v156 = (float)v181;
LABEL_226:
          int v182 = v154 & 3;
          if (v182 != 1)
          {
            if (v182 == 2)
            {
              float v155 = (11.0 - v156) * v141 / 10.0;
            }
            else if (v182 == 3)
            {
              float v155 = v141 / v156;
            }
            else
            {
              float v155 = v141;
            }
          }
          *(float *)&v68[4 * v150] = v155 + *(float *)&v68[4 * v150];
        }
        while (v151 > 1);
        ++v135;
      }
      while (v135 != v93);
    }
LABEL_235:
    MEMORY[0x1F4188790](v247);
    v183 = (char *)v247 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v184 = 0;
    unint64_t v186 = v250;
    v185 = v251;
    do
    {
      uint64_t v187 = (v186 >> 25) & 1;
      float v188 = *(v75 - 1);
      float v189 = (float)(*(float *)&v68[4 * v184] + v188) - *(float *)&v185[4 * v184];
      uint64_t v190 = llroundf(v188 * 100.0);
      uint64_t v191 = v190 & ~(v190 >> 63);
      if (v191 >= 100) {
        LODWORD(v191) = 100;
      }
      *(_DWORD *)uint64_t v75 = *(_DWORD *)v75 & 0xFF01FFFF | (v191 << 17);
      *(v75 - 1) = v189;
      if (v189 >= 0.0) {
        LOBYTE(v187) = 1;
      }
      v183[v184++] = v187;
      v75 += 8;
    }
    while (v64 != v184);
    uint64_t v85 = v64;
    uint64_t v6 = v254;
    uint64_t v4 = v255;
    uint64_t v5 = v259;
    uint64_t v9 = v248;
    LODWORD(v8) = v253;
    uint64_t v192 = v263;
    do
    {
      uint64_t v193 = v85;
      uint64_t v194 = v64--;
      if (v183[v64]) {
        BOOL v195 = v194 < 2;
      }
      else {
        BOOL v195 = 1;
      }
      if (v195) {
        goto LABEL_253;
      }
      uint64_t v196 = 0;
      v197 = &v291[2 * v192 + 2 * v64];
      v198 = (int *)v63;
      while (1)
      {
        if (v183[v196])
        {
          if (HIDWORD(*(void *)v197) == HIDWORD(*(void *)v198) && *(int *)v197 >> 16 == *v198 >> 16) {
            break;
          }
        }
        ++v196;
        v198 += 8;
        if (v64 == v196) {
          goto LABEL_253;
        }
      }
      v200 = (float *)&v291[2 * v192 + 2 * v196];
      if (*((float *)&v291[2 * v192 + 2 * v64] + 2) > v200[2])
      {
        long long v201 = v197[1];
        *(_OWORD *)v200 = *v197;
        *((_OWORD *)v200 + 1) = v201;
      }
      uint64_t v85 = v64;
      if (v194 != v193)
      {
        v183[v64] = 0;
LABEL_253:
        uint64_t v85 = v193;
      }
    }
    while (v194 > 1);
    if (v85 >= 1)
    {
      uint64_t v202 = 0;
      while (v183[v202])
      {
LABEL_267:
        if (++v202 >= v85) {
          goto LABEL_270;
        }
      }
      uint64_t v203 = v85;
      while (1)
      {
        uint64_t v204 = v203 - 1;
        if (v203 - 1 <= v202) {
          break;
        }
        if (v183[--v203])
        {
          v206 = &v291[2 * v192 + 2 * v204];
          long long v207 = *v206;
          long long v208 = v206[1];
          v209 = &v291[2 * v192 + 2 * v202];
          _OWORD *v209 = v207;
          v209[1] = v208;
          --v85;
          goto LABEL_267;
        }
      }
      uint64_t v85 = v202;
    }
LABEL_270:
    _Block_object_dispose(&v267, 8);
    _Block_object_dispose(v271, 8);
    _Block_object_dispose(v272, 8);
    _Block_object_dispose(v273, 8);
    _Block_object_dispose(v274, 8);
    _Block_object_dispose(&v275, 8);
    _Block_object_dispose(&v279, 8);
    if (v85 >= 1)
    {
      unint64_t v61 = v262;
      uint64_t v80 = *(void **)(v261 + 24);
      uint64_t v65 = v263;
      goto LABEL_272;
    }
    unint64_t v61 = v262;
    uint64_t v65 = v263;
LABEL_313:
    uint64_t v64 = v85;
    uint64_t v54 = v256;
    uint64_t v55 = v258;
LABEL_314:
    uint64_t v59 = v65 + v64;
    uint64_t v284 = v59;
LABEL_315:
    if (v61 > 5) {
      break;
    }
    ++v61;
  }
  while (v59 < 50);
LABEL_317:
  uint64_t v226 = *(void *)(v5 + 48);
  uint64_t v227 = v6[2] + 48 * (int)v8;
  uint64_t v228 = *(void *)(v227 + 32) + v9 - (*(void *)(v227 + 16) + *(void *)v226);
  if (v228 >= 201)
  {
    v245 = *(void **)(v226 + 64);
    if (v245)
    {
      uint64_t v246 = v59;
      DDLexemCacheItemResetForCapacity(v245, v59);
      DDLexemCacheItemSet(*(void ***)(v226 + 64), v246, v291);
    }
    else
    {
      *(void *)(v226 + 64) = DDLexemCacheItemCreate(v59, v291);
    }
    uint64_t v240 = v259;
    *(void *)(v226 + 72) = v4;
  }
  else
  {
    uint64_t v229 = *(void *)(v226 + 24);
    if (v229 <= v228)
    {
      uint64_t v230 = v59;
      uint64_t v229 = v228 + 8;
      if (*(void *)(v226 + 32))
      {
        v231 = (char *)malloc_type_malloc(8 * v229, 0x2004093837F09uLL);
        uint64_t v232 = *(void *)(v226 + 32);
        uint64_t v233 = *(void *)(v226 + 24) - v232;
        memcpy(v231, (const void *)(*(void *)(v226 + 8) + 8 * v232), 8 * v233);
        memcpy(&v231[8 * v233], *(const void **)(v226 + 8), 8 * *(void *)(v226 + 32));
        free(*(void **)(v226 + 8));
        *(void *)(v226 + 8) = v231;
        *(void *)(v226 + 32) = 0;
      }
      else
      {
        v231 = (char *)malloc_type_realloc(*(void **)(v226 + 8), 8 * v229, 0x2004093837F09uLL);
        *(void *)(v226 + 8) = v231;
      }
      bzero(&v231[8 * *(void *)(v226 + 24)], 8 * (v229 - *(void *)(v226 + 24)));
      *(void *)(v226 + 24) = v229;
      uint64_t v59 = v230;
    }
    if (*(void *)(v226 + 16) <= v228) {
      *(void *)(v226 + 16) = v228 + 1;
    }
    uint64_t v234 = *(void *)(v226 + 32);
    uint64_t v235 = *(void *)(v226 + 48);
    if (v235 < 0)
    {
      uint64_t v238 = v59;
      v237 = (void **)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
      DDLexemCacheItemReset((uint64_t)v237);
      uint64_t v59 = v238;
    }
    else
    {
      uint64_t v236 = *(void *)(v226 + 40);
      v237 = *(void ***)(v236 + 8 * v235);
      *(void *)(v236 + 8 * v235) = 0;
      *(void *)(v226 + 48) = v235 - 1;
    }
    if (v234 + v228 >= v229) {
      uint64_t v239 = v229;
    }
    else {
      uint64_t v239 = 0;
    }
    *(void *)(*(void *)(v226 + 8) + 8 * (v234 + v228 - v239)) = v237;
    DDLexemCacheItemSet(v237, v59, v291);
    uint64_t v240 = v259;
  }
  DDLexemCacheGetLexems(*(void **)(v240 + 48), v6[2], v4, v249, &v284);
  return v284;
}

uint64_t DDLexemCacheGetLexems(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = *(void *)(a2 + 48 * ((int)a3 >> 16) + 32)
     + (a3 >> 32)
     - (*(void *)(a2 + 48 * ((int)a3 >> 16) + 16)
      + *a1);
  if (v5 < 201
    || (uint64_t v8 = (void *)a1[8]) == 0
    || ((uint64_t v11 = a1[9], v13 = HIDWORD(v11) == HIDWORD(a3), v12 = (uint64_t)(int)v11 >> 16, v13)
      ? (BOOL v13 = v12 == (int)a3 >> 16)
      : (BOOL v13 = 0),
        !v13))
  {
    if (v5 >= a1[2]) {
      return 0;
    }
    uint64_t v6 = a1[4] + v5;
    uint64_t v7 = v6 >= a1[3] ? a1[3] : 0;
    uint64_t v8 = *(void **)(a1[1] + 8 * (v6 - v7));
    if (!v8) {
      return 0;
    }
  }
  uint64_t v9 = v8[1];
  if ((v9 & 0x80000000) != 0) {
    return 0;
  }
  *a5 = (int)v9;
  *a4 = *v8;
  return 1;
}

uint64_t *DDTokenCacheGetTokensAtPosition(void *a1, void *cf, uint64_t a3, void *a4)
{
  uint64_t v4 = cf[2] + 48 * ((int)a3 >> 16);
  uint64_t v5 = *(void *)(v4 + 32) + (a3 >> 32) - *(void *)(v4 + 16);
  uint64_t v6 = a1[2];
  uint64_t v7 = v5 - v6;
  if (v5 - v6 > 199) {
    return 0;
  }
  uint64_t v11 = a1[5];
  if (v11 <= v7) {
    uint64_t v12 = v11 - 1;
  }
  else {
    uint64_t v12 = v5 - v6;
  }
  if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = a1[7];
    while (1)
    {
      uint64_t v14 = v13 + v12 >= a1[6] ? a1[6] : 0;
      if ((*(unsigned char *)(*(void *)(a1[4] + 8 * v13 - 8 * v14 + 8 * v12) + 3) & 0x80) == 0) {
        break;
      }
      if (v12-- <= 0)
      {
        uint64_t v12 = -1;
        break;
      }
    }
  }
  if (v12 < v7)
  {
    uint64_t v16 = v12 + 1;
    do
    {
      uint64_t TokenInCache = _FillNextTokenInCache(a1, cf, v16);
      if (TokenInCache >= 0) {
        uint64_t v16 = TokenInCache;
      }
    }
    while ((TokenInCache & 0x8000000000000000) == 0 && v16 <= v7);
  }
  uint64_t result = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v5 - v6);
  if (!result) {
    return result;
  }
  uint64_t v19 = *result;
  if ((*result & 0x80000000) != 0) {
    return 0;
  }
  if ((int)v19 != v5)
  {
    uint64_t result = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, ((int)v19 - v6) & ~(((int)v19 - v6) >> 63));
    if (!result) {
      return result;
    }
    uint64_t v19 = *result;
  }
  uint64_t v20 = v19 << 16 >> 48;
  unint64_t v21 = result + 1;
  if ((int)v20 >= 2) {
    unint64_t v21 = (void *)*v21;
  }
  *a4 = v21;
  return (uint64_t *)(*result << 16 >> 48);
}

uint64_t DDTokenCacheGetItemAtIndexCreateIfNeeded(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 > a2) {
    goto LABEL_11;
  }
  uint64_t v6 = a2 + 10;
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    if (v4 <= v7)
    {
      if (DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_12) {
        return 0;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v20 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DC95000, v20, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenCache->_tokenCacheTableSize > tokenCache->_tokenCacheTableStartOffset", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v21, 482, @"Start offset out of bounds");
      uint64_t result = 0;
      DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_12 = 1;
      return result;
    }
    uint64_t v8 = (char *)malloc_type_malloc(8 * v6, 0x2004093837F09uLL);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 48) - v9;
    memcpy(v8, (const void *)(*(void *)(a1 + 32) + 8 * v9), 8 * v10);
    memcpy(&v8[8 * v10], *(const void **)(a1 + 32), 8 * *(void *)(a1 + 56));
    free(*(void **)(a1 + 32));
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 56) = 0;
  }
  else
  {
    uint64_t v8 = (char *)malloc_type_realloc(*(void **)(a1 + 32), 8 * v6, 0x2004093837F09uLL);
    *(void *)(a1 + 32) = v8;
    if (!v8)
    {
      if (DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged) {
        return 0;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      BOOL v22 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v26 = 0;
        _os_log_error_impl(&dword_19DC95000, v22, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", v26, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenCache->_tokenCacheTable != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v23, 480, @"Realloc failed");
      uint64_t result = 0;
      DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged = 1;
      return result;
    }
  }
  bzero(&v8[8 * *(void *)(a1 + 48)], 8 * (v6 - *(void *)(a1 + 48)));
  uint64_t v11 = *(void *)(a1 + 32);
  if (!*(void *)(v11 + 8 * a2 + 72) && !*(void *)(v11 + 8 * *(void *)(a1 + 48)))
  {
    *(void *)(a1 + 48) = v6;
    uint64_t v4 = a2 + 10;
LABEL_11:
    if (v5 <= a2)
    {
      do
      {
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 56);
        if (v5 + v13 < v14) {
          uint64_t v14 = 0;
        }
        uint64_t v15 = v5 + v13 - v14;
        if (!*(void *)(*(void *)(a1 + 32) + 8 * v15))
        {
          uint64_t v16 = malloc_type_calloc(1uLL, 0x18uLL, 0x10220403CBE8D38uLL);
          *uint64_t v16 = 0x10000FFFFFFFFLL;
          *(void *)(*(void *)(a1 + 32) + 8 * v15) = v16;
        }
        ++*(void *)(a1 + 40);
        ++v5;
      }
      while (a2 + 1 != v5);
      uint64_t v4 = *(void *)(a1 + 48);
    }
    uint64_t v17 = *(void *)(a1 + 56) + a2;
    if (v17 < v4) {
      uint64_t v4 = 0;
    }
    return *(void *)(*(void *)(a1 + 32) + 8 * (v17 - v4));
  }
  if (DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_17) {
    return 0;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  unsigned int v18 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_error_impl(&dword_19DC95000, v18, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", v24, 2u);
  }
  DDLogAssertionFailure((uint64_t)"tokenCache->_tokenCacheTable[newSize - 1] == NULL && tokenCache->_tokenCacheTable[tokenCache->_tokenCacheTableSize] == NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v19, 496, @"Wrong initialization");
  uint64_t result = 0;
  DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_17 = 1;
  return result;
}

void **DDLexemCacheItemSet(void **result, uint64_t a2, void *__src)
{
  uint64_t v4 = result;
  if (a2 >= 1)
  {
    uint64_t v6 = *result;
    if (a2 > (uint64_t)v4[1] >> 32)
    {
      uint64_t v7 = 24;
      if (a2 > 24) {
        uint64_t v7 = a2;
      }
      v4[1] = (void *)(v4[1] | ((unint64_t)v7 << 32));
      uint64_t v6 = malloc_type_realloc(v6, 32 * v7, 0x1010040F32E1FD2uLL);
      UText *v4 = v6;
    }
    uint64_t result = (void **)memcpy(v6, __src, 32 * a2);
  }
  *((_DWORD *)v4 + 2) = a2;
  return result;
}

uint64_t _fetchNextToken(uint64_t a1)
{
  v51[31] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 120)) {
    return -1;
  }
  do
  {
    uint64_t Token = NLStringTokenizerAdvanceToNextToken();
    if (Token) {
      break;
    }
    uint64_t v3 = *(void *)(a1 + 112) + 1;
    if (v3 >= *(void *)(*(void *)(a1 + 32) + 32))
    {
      *(unsigned char *)(a1 + 120) = 1;
      return -1;
    }
    *(void *)(a1 + 112) = v3;
    NLStringTokenizerSetStringWithOptions();
    uint64_t Token = NLStringTokenizerAdvanceToNextToken();
  }
  while (!Token);
  char v4 = Token;
  if (*(unsigned char *)(a1 + 120)) {
    return -1;
  }
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 64);
  if (v5 + 1 < v6) {
    uint64_t v7 = v5 + 1;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = v8 + 32 * v7;
  if (*(unsigned char *)(v9 + 25))
  {
    uint64_t v10 = *(void **)(v9 + 16);
    if (v10)
    {
      free(v10);
      uint64_t v6 = *(void *)(a1 + 64);
    }
    *(unsigned char *)(v8 + 32 * v7 + 24) = 0;
    *(void *)(v9 + 16) = 0;
    *(void *)(a1 + 96) = (v7 + 1) % v6;
    uint64_t v11 = *(void *)(a1 + 80);
    BOOL v12 = v11 == 1;
    BOOL v13 = v11 < 1;
    uint64_t v14 = v11 - 1;
    if (!v13)
    {
      *(void *)(a1 + 80) = v14;
      if (v12)
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v15 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DC95000, v15, OS_LOG_TYPE_ERROR, "We missed a token, because the cache was over used...", buf, 2u);
        }
      }
    }
  }
  else
  {
    ++*(void *)(a1 + 72);
    *(void *)(a1 + 96) = 0;
    *(unsigned char *)(v9 + 25) = 1;
  }
  uint64_t v48 = v8;
  uint64_t v17 = *(void *)(a1 + 112);
  ++*(void *)(a1 + 104);
  CFIndex CurrentTokenRange = NLStringTokenizerGetCurrentTokenRange();
  CFIndex v20 = v19;
  CFIndex v21 = CurrentTokenRange + v19;
  uint64_t v22 = (v17 << 16);
  CFIndex v23 = v22 | (CurrentTokenRange << 32);
  *(void *)uint64_t v9 = v23;
  *(void *)(v9 + 8) = v22 | ((CurrentTokenRange + v19) << 32);
  CFIndex v24 = v22 | ((CurrentTokenRange + v19) << 32);
  if ((v4 & 6) != 0 && (uint64_t CurrentSubTokens = NLStringTokenizerGetCurrentSubTokens(), CurrentSubTokens >= 1))
  {
    size_t v26 = CurrentSubTokens;
    if ((unint64_t)CurrentSubTokens > 0xF)
    {
      uint64_t v29 = v48;
    }
    else
    {
      uint64_t v27 = &buf[16 * CurrentSubTokens];
      uint64_t v28 = *((void *)v27 - 2) + *((void *)v27 - 1);
      uint64_t v29 = v48;
      if (v21 > v28)
      {
        *(void *)uint64_t v27 = v28;
        *((void *)v27 + 1) = v21 - v28;
        size_t v26 = CurrentSubTokens + 1;
      }
    }
    uint64_t v37 = malloc_type_calloc(v26, 0x20uLL, 0x10200406A33E52CuLL);
    uint64_t v38 = v29 + 32 * v7;
    *(void *)(v38 + 16) = v37;
    uint64_t v39 = (void *)(v38 + 16);
    if (!v37) {
      goto LABEL_46;
    }
    uint64_t v40 = 0;
    uint64_t v41 = v51;
    size_t v42 = v26;
    do
    {
      uint64_t v43 = *((void *)v41 - 1);
      int v44 = *v41;
      v41 += 4;
      uint64_t v45 = *v39 + v40;
      *(void *)uint64_t v45 = v22 | (v43 << 32);
      *(void *)(v45 + 8) = v22 | ((unint64_t)(v44 + v43) << 32);
      *(void *)(v45 + 16) = 0;
      *(_WORD *)(v45 + 24) = 256;
      *(_DWORD *)(v45 + 26) = 0;
      *(_WORD *)(v45 + 30) = 0;
      v40 += 32;
      --v42;
    }
    while (v42);
    uint64_t v46 = v29 + 32 * v7;
  }
  else
  {
    uint64_t v30 = (CFStringRef *)(*(void *)(*(void *)(a1 + 32) + 16) + 48 * v17);
    CFRange result = (CFRange)xmmword_19DCCF950;
    v52.CFIndex location = CurrentTokenRange;
    v52.length = v20;
    if (!CFStringFindWithOptions(*v30, @"'", v52, 0, &result))
    {
      v53.CFIndex location = CurrentTokenRange;
      v53.length = v20;
      if (!CFStringFindWithOptions(*v30, @"’", v53, 0, &result)) {
        goto LABEL_46;
      }
    }
    CFIndex location = result.location;
    CFIndex v32 = result.length + result.location;
    size_t v26 = result.location <= CurrentTokenRange
        ? v21 > result.length + result.location
        : (v21 > result.length + result.location) + 1;
    if (!v26) {
      goto LABEL_46;
    }
    int v33 = (char *)malloc_type_calloc(v26, 0x20uLL, 0x10200406A33E52CuLL);
    uint64_t v34 = v48 + 32 * v7;
    *(void *)(v34 + 16) = v33;
    uint64_t v35 = (void *)(v34 + 16);
    if (!v33) {
      goto LABEL_46;
    }
    if (location <= CurrentTokenRange)
    {
      uint64_t v36 = 0;
    }
    else
    {
      *(void *)int v33 = v23;
      *((void *)v33 + 1) = v22 | (location << 32);
      *((void *)v33 + 2) = 0;
      *((_WORD *)v33 + 12) = 256;
      *(_DWORD *)(v33 + 26) = 0;
      *((_WORD *)v33 + 15) = 0;
      uint64_t v36 = 1;
    }
    if (v21 > v32)
    {
      uint64_t v47 = *v35 + 32 * v36;
      *(void *)uint64_t v47 = v22 | (v32 << 32);
      *(void *)(v47 + 8) = v24;
      *(void *)(v47 + 16) = 0;
      *(_WORD *)(v47 + 24) = 256;
      *(_DWORD *)(v47 + 26) = 0;
      *(_WORD *)(v47 + 30) = 0;
    }
    uint64_t v46 = v48 + 32 * v7;
  }
  *(unsigned char *)(v46 + 24) = v26;
LABEL_46:
  *(void *)(a1 + 88) = v7;
  return (v7 - *(void *)(a1 + 96) + *(void *)(a1 + 72)) % *(void *)(a1 + 72);
}

uint64_t DDLookupTableRefLookupCurrentWord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (HIDWORD(a3) != HIDWORD(a5)) {
    return 0;
  }
  int v8 = a5;
  uint64_t v9 = a3;
  if ((int)a3 >> 16 != (int)a5 >> 16) {
    return 0;
  }
  uint64_t v10 = a2;
  uint64_t v11 = 24;
  if (!a8) {
    uint64_t v11 = 16;
  }
  BOOL v12 = *(void **)(a2 + v11);
  if (!v12) {
    return 0;
  }
  BOOL v13 = (_WORD *)v12[1];
  if (!v13 || (*v13 & 0x7FF) == 0) {
    return 0;
  }
  unsigned int v108 = *(unsigned __int16 *)(*(void *)(a2 + 32) + 2);
  if (!*(void *)(a2 + 112))
  {
    unsigned int v18 = (UniChar *)malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
    *(void *)(v10 + 120) = v18;
    *(void *)(v10 + 112) = CFStringCreateMutableWithExternalCharactersNoCopy(0, v18, 64, 64, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  }
  if (DDLookupTableRefLookupCurrentWord_sOnce != -1) {
    dispatch_once(&DDLookupTableRefLookupCurrentWord_sOnce, &__block_literal_global_502);
  }
  uint64_t v110 = 0;
  if (a7 >= 1)
  {
    CFIndex v19 = (_DWORD *)v12[1];
    if (v19)
    {
      uint64_t v20 = a4 - (v9 & 0xFFFFFFFF00000000);
      if (v20 <= 0x31FFFFFFFFLL)
      {
        uint64_t v104 = v12;
        int v105 = v8;
        uint64_t v101 = a6;
        if (v20 >= 0x100000000)
        {
          uint64_t v21 = 0;
          uint64_t v110 = 0;
          uint64_t v22 = 4294901760;
          uint64_t v100 = a7;
          uint64_t v102 = a1;
          uint64_t v103 = v10;
          while (1)
          {
            uint64_t v107 = a4;
            CFIndex v23 = HIDWORD(v20);
            v118.CFIndex location = v9 >> 32;
            uint64_t v24 = (uint64_t)(int)v9 >> 16;
            uint64_t v106 = v9 >> 32;
            v118.length = HIDWORD(v20);
            CFStringGetCharacters(*(CFStringRef *)(*(void *)(*(void *)(a1 + 56) + 16) + 48 * (int)v24), v118, *(UniChar **)(v10 + 120));
            CFStringSetExternalCharactersNoCopy(*(CFMutableStringRef *)(v10 + 112), *(UniChar **)(v10 + 120), v23, 64);
            CFStringFold(*(CFMutableStringRef *)(v10 + 112), 0x81uLL, 0);
            int v114 = 0;
            CFIndex range = v23;
            BOOL v25 = unorm2_quickCheck() == 1 && v114 < 1;
            if (!v25) {
              CFStringNormalize(*(CFMutableStringRef *)(v10 + 112), kCFStringNormalizationFormKC);
            }
            if ((int)v22 >> 16 == -1)
            {
LABEL_26:
              CFIndex Length = CFStringGetLength(*(CFStringRef *)(v10 + 112));
              uint64_t v29 = *(UniChar **)(v10 + 120);
              uint64_t v30 = v104;
              goto LABEL_52;
            }
            uint64_t v26 = (uint64_t)(int)v22 >> 16;
            uint64_t v27 = (uint64_t)(int)v9 >> 16;
            if ((int)v26 >= (int)v27)
            {
              if ((int)v26 > (int)v27) {
                goto LABEL_26;
              }
              CFIndex Length = CFStringGetLength(*(CFStringRef *)(v10 + 112));
              uint64_t v29 = *(UniChar **)(v10 + 120);
              BOOL v25 = SHIDWORD(v22) < SHIDWORD(v9);
              a7 = v100;
              uint64_t v30 = v104;
              if (!v25) {
                goto LABEL_52;
              }
            }
            else
            {
              CFIndex Length = CFStringGetLength(*(CFStringRef *)(v10 + 112));
              uint64_t v29 = *(UniChar **)(v10 + 120);
              uint64_t v30 = v104;
            }
            if ((*v19 & 0x800) == 0) {
              break;
            }
            if (!*((_WORD *)v19 + v21 + 4))
            {
              uint64_t v37 = 0;
              uint64_t v39 = v19 + 1;
              goto LABEL_47;
            }
            if (*((_WORD *)v19 + v21 + 4) != 32) {
              goto LABEL_42;
            }
            if (!*((_WORD *)v19 + v21 + 5))
            {
              uint64_t v39 = v19 + 1;
              goto LABEL_46;
            }
            uint64_t v37 = 1;
            uint64_t v38 = v19;
LABEL_48:
            uint64_t v40 = v37 + v21;
            if (v38 == v19) {
              uint64_t v21 = v40;
            }
            else {
              uint64_t v21 = 0;
            }
            CFIndex v19 = v38;
LABEL_52:
            uint64_t v41 = 0;
            if (v19 && (int)Length >= 1)
            {
              uint64_t v42 = 0;
              uint64_t v43 = 0;
              uint64_t v41 = 0;
              int v44 = v19;
              while (1)
              {
                uint64_t v45 = &v29[v42];
                if ((*v44 & 0x800) != 0)
                {
                  if ((int)Length - v42 >= 1)
                  {
                    uint64_t v55 = 0;
                    uint64_t v56 = (uint64_t)v44 + 2 * v21 + 8;
                    while (*(_WORD *)(v56 + 2 * v55))
                    {
                      int v57 = v45[v55];
                      if (v57 == 45) {
                        int v58 = 32;
                      }
                      else {
                        int v58 = v45[v55];
                      }
                      if (v57 == 8217) {
                        int v59 = 39;
                      }
                      else {
                        int v59 = v58;
                      }
                      if (v59 != *(unsigned __int16 *)(v56 + 2 * v55)) {
                        goto LABEL_69;
                      }
                      if ((int)Length - v42 == ++v55)
                      {
                        uint64_t v55 = (int)Length - v42;
                        goto LABEL_83;
                      }
                    }
LABEL_85:
                    unint64_t v60 = v44 + 1;
LABEL_87:
                    CFIndex v19 = (_DWORD *)(v30[2] + *v60);
                    goto LABEL_88;
                  }
                  uint64_t v55 = 0;
LABEL_83:
                  if (!*((_WORD *)v44 + v55 + v21 + 4)) {
                    goto LABEL_85;
                  }
                  CFIndex v19 = v44;
                }
                else
                {
                  int v46 = *v45;
                  if (v46 == 45) {
                    int v47 = 32;
                  }
                  else {
                    int v47 = v46;
                  }
                  if (v46 == 8217) {
                    unsigned int v48 = 39;
                  }
                  else {
                    unsigned int v48 = v47;
                  }
                  int v49 = *v44 & 0x7FF;
                  if (v49)
                  {
                    uint64_t v50 = 0;
                    uint64_t v51 = *v44 & 0x7FFLL;
                    while (1)
                    {
                      uint64_t v52 = v50 + ((unint64_t)v51 >> 1);
                      unsigned int v53 = *((unsigned __int16 *)v44 + v52 + 2);
                      if (v53 == v48) {
                        break;
                      }
                      unint64_t v54 = (unint64_t)v51 >> 1;
                      v51 += v50 + ~v52;
                      if (v53 < v48) {
                        uint64_t v50 = v52 + 1;
                      }
                      else {
                        uint64_t v51 = v54;
                      }
                      if (v51 <= 0) {
                        goto LABEL_69;
                      }
                    }
                    unint64_t v60 = &v44[v52 + 1 + ((v49 + 1) >> 1)];
                    uint64_t v55 = 1;
                    goto LABEL_87;
                  }
LABEL_69:
                  uint64_t v55 = 0;
                  CFIndex v19 = 0;
                }
LABEL_88:
                v42 += v55;
                if (v19)
                {
                  uint64_t v41 = v19;
                  uint64_t v43 = v42;
                }
                uint64_t v61 = v55 + v21;
                if (v19 == v44) {
                  uint64_t v21 = v61;
                }
                else {
                  uint64_t v21 = 0;
                }
                if (v19)
                {
                  int v44 = v19;
                  if (v42 < (int)Length) {
                    continue;
                  }
                }
                goto LABEL_97;
              }
            }
            uint64_t v43 = 0;
LABEL_97:
            if (v43 == ((Length << 32) - 0x100000000) >> 32 && (v29[v43] & 0xFFFE) == 0x200E) {
              uint64_t v43 = (int)Length;
            }
            if (!v41) {
              return v110;
            }
            if (v43 < 1) {
              goto LABEL_132;
            }
            if (v23 == (int)Length) {
              goto LABEL_129;
            }
            v119.CFIndex location = v9 >> 32;
            v119.length = v23;
            CFStringGetCharacters(*(CFStringRef *)(*(void *)(*(void *)(v102 + 56) + 16) + 48 * (int)v24), v119, v29);
            CFStringSetExternalCharactersNoCopy(*(CFMutableStringRef *)(v103 + 112), *(UniChar **)(v103 + 120), v23, 64);
            memset(&iter, 0, sizeof(iter));
            uiter_setString(&iter, *(const UChar **)(v103 + 120), v23);
            int32_t v62 = 0;
            int v63 = 0;
            UErrorCode pErrorCode = U_ZERO_ERROR;
            uint64_t v64 = v116;
            int v65 = 24;
            while (1)
            {
              int v66 = unorm_next();
              if (v66 < 1) {
                break;
              }
              unsigned int v67 = v66;
              UErrorCode v68 = pErrorCode;
              if (pErrorCode == U_BUFFER_OVERFLOW_ERROR && v66 > v65)
              {
                if (v116 != v64) {
                  free(v64);
                }
                uint64_t v64 = malloc_type_malloc(2 * v67, 0x1000040BDFB0063uLL);
                unsigned int v73 = v67;
                if (v64)
                {
                  iter.index = v62;
                  UErrorCode pErrorCode = U_ZERO_ERROR;
                  unsigned int v73 = unorm_next();
                }
                UErrorCode v68 = pErrorCode;
                int v65 = v67;
                unsigned int v67 = v73;
              }
              if (v68 > U_ZERO_ERROR) {
                break;
              }
              int32_t v70 = u_strFoldCase(dest, 24, (const UChar *)v64, v67, 0, &pErrorCode);
              if (pErrorCode >= U_ILLEGAL_ARGUMENT_ERROR) {
                break;
              }
              v63 += v70;
              memset(&v111, 0, sizeof(v111));
              uiter_setString(&v111, dest, v70);
              while (1)
              {
                UChar32 v71 = uiter_next32(&v111);
                if (v71 == -1) {
                  break;
                }
                UChar32 v72 = v71;
                if (u_charType(v71) == 6) {
                  v63 -= u_getIntPropertyValue(v72, UCHAR_DIACRITIC) != 0;
                }
              }
              int32_t v62 = ((uint64_t (*)(UCharIterator *, uint64_t))iter.getIndex)(&iter, 1);
              if (v43 <= v63)
              {
                if (v43 >= v63) {
                  uint64_t v43 = v62;
                }
                else {
                  uint64_t v43 = 0;
                }
                break;
              }
            }
            a7 = v100;
            uint64_t v30 = v104;
            if (v116 != v64 && v64) {
              free(v64);
            }
            if (v43 > range)
            {
              if (DDLookupTableRefLookupCurrentWord_sOnce_11 != -1) {
                dispatch_once(&DDLookupTableRefLookupCurrentWord_sOnce_11, &__block_literal_global_14);
              }
              return 0;
            }
            if (v43 >= 1)
            {
LABEL_129:
              unint64_t v74 = v105 & 0xFFFF0000 | ((unint64_t)(v43 + v106) << 32);
              uint64_t v75 = v101 + 32 * v110;
              uint64_t v76 = a7 - v110;
              unint64_t v77 = *v41;
              if ((v77 & 0x1000) != 0)
              {
                uint64_t v80 = 0;
                if (v76 < 1)
                {
                  a1 = v102;
                  uint64_t v10 = v103;
                }
                else
                {
                  a1 = v102;
                  uint64_t v10 = v103;
                  if (v77 >= 0x2000)
                  {
                    *(void *)uint64_t v75 = v74 | (unsigned __int16)(v77 >> 13);
                    *(void *)(v75 + 8) = 0;
                    *(void *)(v75 + 16) = 0;
                    *(void *)(v75 + 24) = 0;
                    uint64_t v80 = 1;
                  }
                }
              }
              else
              {
                uint64_t v78 = v77 >> 13;
                if (v30[9]) {
                  uint64_t v79 = (unsigned __int16 *)(v30[3] + 2 * v78);
                }
                else {
                  uint64_t v79 = 0;
                }
                a1 = v102;
                uint64_t v10 = v103;
                uint64_t v81 = v30[10];
                if (v81) {
                  uint64_t v81 = v30[4] + 4 * v78;
                }
                if (v30[11]) {
                  uint64_t v82 = v30[5] + 4 * v78;
                }
                else {
                  uint64_t v82 = 0;
                }
                uint64_t v80 = 0;
                if ((__int16)*v79 >= 1)
                {
                  BOOL v25 = v76 < 1;
                  unint64_t v83 = v76 - 1;
                  if (!v25)
                  {
                    if (v83 >= (unint64_t)*v79 - 1) {
                      unint64_t v83 = *v79 - 1;
                    }
                    float v84 = (int *)(v81 + 4);
                    uint64_t v85 = v79 + 1;
                    uint64_t v86 = (int *)(v82 + 4);
                    unint64_t v87 = v83 + 1;
                    do
                    {
                      if (v82 && (uint64_t v88 = *v86, v88) && v30[14] > v88) {
                        uint64_t v89 = v30[8] + v88;
                      }
                      else {
                        uint64_t v89 = 0;
                      }
                      uint64_t v90 = *v85;
                      if (v81 | v89)
                      {
                        int v91 = *v84;
                        *(_DWORD *)(v75 + 8) = *v84;
                        *(void *)uint64_t v75 = v74 | v90;
                        if (v108 >= 7) {
                          int v92 = (v91 << 22) & 0x3000000 | ((v91 & 3) << 26) | 0x10000;
                        }
                        else {
                          int v92 = 0x10000;
                        }
                        *(_DWORD *)(v75 + 12) = v92;
                        *(void *)(v75 + 16) = 0;
                        *(void *)(v75 + 24) = v89;
                      }
                      else
                      {
                        *(void *)uint64_t v75 = v74 | v90;
                        *(void *)(v75 + 8) = 0;
                        *(void *)(v75 + 16) = 0;
                        *(void *)(v75 + 24) = 0;
                      }
                      ++v84;
                      ++v85;
                      ++v86;
                      v75 += 32;
                      --v87;
                    }
                    while (v87);
                    uint64_t v80 = v83 + 1;
                  }
                }
              }
              v110 += v80;
            }
            else
            {
LABEL_132:
              a1 = v102;
              uint64_t v10 = v103;
            }
            uint64_t v22 = v107;
            if (!v19
              || (int)DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(a1 + 40), *(void **)(a1 + 56), v107) >> 16 == -1)
            {
              return v110;
            }
            a4 = v93;
            uint64_t v94 = (uint64_t)(int)v107 >> 16;
            uint64_t v95 = (uint64_t)(int)v93 >> 16;
            if (v94 != v95)
            {
              uint64_t v96 = *(void *)(*(void *)(a1 + 56) + 16);
              uint64_t v97 = *(void *)(v96 + 48 * (int)v94 + 24);
              if (v97 == v107 >> 32)
              {
                uint64_t v98 = v94 + 1;
                uint64_t v9 = (v98 << 16);
                if (v98 != v95) {
                  a4 = v9 | (*(void *)(v96 + 48 * (int)v98 + 24) << 32);
                }
                goto LABEL_170;
              }
              a4 = (v94 << 16) | (unint64_t)(v97 << 32);
            }
            uint64_t v9 = v107;
LABEL_170:
            if (v110 < a7)
            {
              uint64_t v20 = a4 - (v9 & 0xFFFFFFFF00000000);
              if (v20 <= 0x31FFFFFFFFLL)
              {
                int v105 = v9;
                if (v20 > 0xFFFFFFFFLL) {
                  continue;
                }
              }
            }
            return v110;
          }
          int v31 = *v19 & 0x7FF;
          if (v31)
          {
            uint64_t v32 = 0;
            uint64_t v33 = *v19 & 0x7FFLL;
            while (1)
            {
              uint64_t v34 = v32 + ((unint64_t)v33 >> 1);
              unsigned int v35 = *((unsigned __int16 *)v19 + v34 + 2);
              if (v35 == 32) {
                break;
              }
              unint64_t v36 = (unint64_t)v33 >> 1;
              v33 += v32 + ~v34;
              if (v35 < 0x20) {
                uint64_t v32 = v34 + 1;
              }
              else {
                uint64_t v33 = v36;
              }
              if (v33 <= 0) {
                goto LABEL_42;
              }
            }
            uint64_t v39 = &v19[v34 + 1 + ((v31 + 1) >> 1)];
LABEL_46:
            uint64_t v37 = 1;
LABEL_47:
            uint64_t v38 = (_DWORD *)(v30[2] + *v39);
            goto LABEL_48;
          }
LABEL_42:
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          goto LABEL_48;
        }
      }
    }
  }
  return v110;
}

uint64_t _tokenEntryAtRealIndex(uint64_t result, uint64_t a2)
{
  if (a2 < 0 || *(void *)(result + 72) <= a2) {
    return 0;
  }
  uint64_t v2 = *(void *)(result + 48);
  if (!*(unsigned char *)(result + 121)) {
    return v2 + 32 * a2;
  }
  uint64_t v3 = v2 + 16 * a2;
  uint64_t v4 = *(void *)v3 << 32;
  unint64_t v5 = (unint64_t)(*(_DWORD *)(v3 + 8) + *(void *)v3) << 32;
  *(void *)CFRange result = v4;
  *(void *)(result + 8) = v5;
  *(void *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  return result;
}

uint64_t DDResultGetType(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

BOOL DDResultHasType(uint64_t a1, const __CFString *a2)
{
  return a1 && a2 && _typesAreEqual(*(CFStringRef *)(a1 + 64), a2);
}

BOOL DDResultHasProperties(BOOL result, uint64_t a2)
{
  if (result) {
    return (a2 & ~*(void *)(result + 96)) == 0;
  }
  return result;
}

void sub_19DC9B4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _getSharedDispatcher()
{
  if (_getSharedDispatcher_once != -1) {
    dispatch_once(&_getSharedDispatcher_once, &__block_literal_global_679);
  }
  uint64_t v0 = (void *)_getSharedDispatcher__scannerDispatcher;

  return v0;
}

void sub_19DC9BA8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19DC9C128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t DDScanQueryCreateFromString(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  CFTypeID v8 = DDTypeRegister(&DDScanQueryGetTypeID_typeID);
  uint64_t Instance = DDTypeCreateInstance_(a1, v8, 0x28uLL);
  DDScanQueryAddTextFragment(Instance, a2, a3, a4, 0, 0, 0);
  return Instance;
}

void *DDLexemCacheCreate()
{
  uint64_t v0 = malloc_type_calloc(1uLL, 0x50uLL, 0x10A0040B8F6FDBAuLL);
  v0[1] = malloc_type_calloc(0x90uLL, 8uLL, 0x2004093837F09uLL);
  v0[3] = 144;
  v0[5] = malloc_type_calloc(0x60uLL, 8uLL, 0x2004093837F09uLL);
  *((_OWORD *)v0 + 3) = xmmword_19DCCF970;
  DDLexemCacheClear((uint64_t)v0);
  return v0;
}

void *DDTokenCacheCreate(const void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = malloc_type_calloc(1uLL, 0x80uLL, 0x1020040DB4D2780uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    DDCachingStringTokenizerResetStringWithOptions((uint64_t)v2, 64, 0);
    uint64_t v4 = NLStringTokenizerCreate();
    v3[5] = v4;
    if (!a1 || v4)
    {
      uint64_t v7 = malloc_type_calloc(1uLL, 0x190uLL, 0x10E00409D72FF36uLL);
      if (!a1)
      {
        CFTypeRef v8 = 0;
        goto LABEL_13;
      }
LABEL_11:
      CFTypeRef v8 = CFRetain(a1);
LABEL_13:
      *uint64_t v7 = v3;
      v7[1] = v8;
      v7[4] = malloc_type_calloc(0x5AuLL, 8uLL, 0x2004093837F09uLL);
      v7[6] = 90;
      DDTokenCacheClear((uint64_t)v7);
      return v7;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    unint64_t v5 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      BOOL v13 = a1;
      _os_log_error_impl(&dword_19DC95000, v5, OS_LOG_TYPE_ERROR, "Tokenizer creation failed with locale %@, trying to fallback to default", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v6 = NLStringTokenizerCreate();
    v3[5] = v6;
    if (v6)
    {
      uint64_t v7 = malloc_type_calloc(1uLL, 0x190uLL, 0x10E00409D72FF36uLL);
      goto LABEL_11;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v9 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_19DC95000, v9, OS_LOG_TYPE_ERROR, "Tokenizer creation failed again, giving up", (uint8_t *)&v12, 2u);
    }
    DDCachingStringTokenizerDestroy(v3);
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v10 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v12) = 0;
    _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, "DD tokenizer creation failed", (uint8_t *)&v12, 2u);
  }
  return 0;
}

BOOL DDScannerScanStringWithRangeAndContextOffset(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)DDLogHandle_error_log_handle);
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v11 = DDLogHandle_error_log_handle;
    if (os_signpost_enabled((os_log_t)DDLogHandle_error_log_handle))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19DC95000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v10, "datadetectors.scanString", (const char *)&unk_19DCD32E3, buf, 2u);
    }
  }
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v14 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFIndex v23 = 0;
      _os_log_error_impl(&dword_19DC95000, v14, OS_LOG_TYPE_ERROR, "DDScannerScanStringWithRange called with NULL scanner", v23, 2u);
    }
    return 0;
  }
  if (*(unsigned char *)(a1 + 233) == 1)
  {
    uint64_t v12 = a1;
    int v13 = 1;
LABEL_23:
    DDScannerThreadDebug(v12, v13);
    return 0;
  }
  *(unsigned char *)(a1 + 233) = 1;
  if (a2 && a4 != a5)
  {
    uint64_t v16 = *(void **)(a1 + 64);
    if (v16)
    {
      DDScanQueryReset(v16);
      DDScanQueryAddTextFragment(*(void *)(a1 + 64), a2, a3, a4, 0, 0, 0);
      if (!a5) {
        goto LABEL_30;
      }
    }
    else
    {
      *(void *)(a1 + 64) = DDScanQueryCreateFromString(0, a2, a3, a4);
      if (!a5)
      {
LABEL_30:
        uint64_t v20 = *(void *)(a1 + 40);
        if (v20) {
          *(void *)(v20 + 392) = 0;
        }
        if (*(unsigned char *)(a1 + 233)) {
          *(unsigned char *)(a1 + 233) = 0;
        }
        else {
          DDScannerThreadDebug(a1, 0);
        }
        BOOL v15 = DDScannerScanQuery(a1, *(void **)(a1 + 64));
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          uint64_t v21 = DDLogHandle_error_log_handle;
          if (os_signpost_enabled((os_log_t)DDLogHandle_error_log_handle))
          {
            *(_WORD *)uint64_t v22 = 0;
            _os_signpost_emit_with_name_impl(&dword_19DC95000, v21, OS_SIGNPOST_INTERVAL_END, v10, "datadetectors.scanString", (const char *)&unk_19DCD32E3, v22, 2u);
          }
        }
        return v15;
      }
    }
    uint64_t v18 = *(void *)(a1 + 64);
    if (*(void *)(v18 + 32) == 1)
    {
      uint64_t v19 = *(void *)(v18 + 16);
      if (v19) {
        *(_DWORD *)(v19 + 40) = *(_DWORD *)(v19 + 40) & 0xFC000000 | a5 & 0x3FFFFFF;
      }
    }
    goto LABEL_30;
  }
  DDScannerReset(a1);
  if (!*(unsigned char *)(a1 + 233))
  {
    uint64_t v12 = a1;
    int v13 = 0;
    goto LABEL_23;
  }
  BOOL v15 = 0;
  *(unsigned char *)(a1 + 233) = 0;
  return v15;
}

BOOL DDScannerScanQuery(uint64_t a1, void *a2)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v4 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19DC95000, v4, OS_LOG_TYPE_ERROR, "DDScannerScanQuery called with NULL scanner", (uint8_t *)&buf, 2u);
    }
    return 0;
  }
  uint64_t v2 = a1;
  if (*(unsigned char *)(a1 + 233) != 1)
  {
    *(unsigned char *)(a1 + 233) = 1;
    DDScannerReset(a1);
    if (*(void *)(v2 + 40) || (uint64_t v7 = DDTokenCacheCreate(0), *(void *)(v2 + 40) = v7, *(unsigned char *)(v2 + 236) = 0, v7))
    {
      if (a2 && a2[4])
      {
        kdebug_trace();
        CFTypeRef v8 = CFRetain(a2);
        *(void *)(v2 + 56) = v8;
        uint64_t v9 = *(void *)(v2 + 24);
        CFTypeRef v10 = *(CFTypeRef *)(v9 + 24);
        if (v10 != v8)
        {
          if (v10) {
            CFRelease(v10);
          }
          *(void *)(v9 + 24) = v8;
          if (v8) {
            CFRetain(v8);
          }
        }
        *(void *)(v9 + 40) = -1;
        uint64_t v11 = *(void **)(v2 + 56);
        uint64_t v12 = v11[2];
        int v13 = *(_DWORD *)(v12 + 40) << 6;
        uint64_t v14 = (uint64_t)v13 >> 6;
        int v95 = v13;
        if (v13 >= 1)
        {
          uint64_t v15 = 0;
          while (1)
          {
            DDTokenCacheGetTokenOrSubtokenAtPosition(*(void **)(v2 + 40), v11, v15 << 32);
            if (v16 >> 32 <= v15) {
              ++v15;
            }
            else {
              uint64_t v15 = v16 >> 32;
            }
            uint64_t v17 = *(void **)(v2 + 40);
            uint64_t v18 = *(void *)(*(void *)(v2 + 56) + 16);
            if (v15 >= v14) {
              break;
            }
            DDTokenCacheMoveStreamOffset(v17, v18, v15 << 32);
            uint64_t v11 = *(void **)(v2 + 56);
          }
          DDTokenCacheMoveStreamOffset(v17, v18, v14 << 32);
        }
        uint64_t v93 = (uint64_t)a2;
        uint64_t v94 = v14;
        uint64_t v19 = (*(_DWORD *)(v12 + 16) + v14);
        uint64_t v20 = *(void *)(v2 + 200);
        if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 0 && !*(void *)(v2 + 128)) {
          goto LABEL_38;
        }
        double Current = CFAbsoluteTimeGetCurrent();
        if (*(double *)(v2 + 136) >= Current + -9.0) {
          goto LABEL_38;
        }
        *(double *)(v2 + 136) = Current;
        if ((v20 & 4) != 0)
        {
          CFStringRef v22 = *(const __CFString **)(v2 + 128);
          if (v22) {
            DDLookupTableUpdateFromExternalFile(5, (unsigned __int16 **)(v2 + 104), v22);
          }
        }
        if (v20)
        {
          DDLookupTableUpdateFromExternalFile(6, (unsigned __int16 **)(v2 + 80), 0);
          if ((v20 & 2) == 0)
          {
LABEL_35:
            if ((v20 & 8) == 0) {
              goto LABEL_36;
            }
            goto LABEL_136;
          }
        }
        else if ((v20 & 2) == 0)
        {
          goto LABEL_35;
        }
        if (!altPath)
        {
          CFBooleanRef v89 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"LookupSuggestionsDisabled", @"com.apple.lookup.shared");
          if (v89)
          {
            CFBooleanRef v90 = v89;
            CFTypeID v91 = CFGetTypeID(v89);
            if (v91 == CFBooleanGetTypeID())
            {
              int Value = CFBooleanGetValue(v90);
              CFRelease(v90);
              if (Value)
              {
                _DDScannerDestroyOptionalLookupTable(v2, 2);
                _DDScannerDestroyOptionalLookupTable(v2, 3);
                if ((v20 & 8) != 0)
                {
LABEL_136:
                  DDLookupTableUpdateFromExternalFile(4, (unsigned __int16 **)(v2 + 112), 0);
                  if ((v20 & 0x80) != 0) {
LABEL_37:
                  }
                    DDLookupTableUpdateFromExternalFile(1, (unsigned __int16 **)(v2 + 120), 0);
LABEL_38:
                  *(unsigned char *)(v2 + 232) &= ~2u;
                  *(unsigned char *)(v2 + 232) &= ~1u;
                  *(void *)(v2 + 176) = -1;
                  double v23 = *(double *)(v2 + 224);
                  double v24 = 0.0;
                  if (v23 > 0.0) {
                    double v24 = v23 + CFAbsoluteTimeGetCurrent();
                  }
                  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v2 + 168));
                  if (*(void *)(v2 + 192) >> 31) {
                    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v2 + 160));
                  }
                  malloc_make_nonpurgeable(*(void **)(v2 + 208));
                  uint64_t TokenOrSubtokenAfterPosition = DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(v2 + 40), *(void **)(v2 + 56), v19 << 32);
                  uint64_t v98 = *(void *)(*(void *)(v2 + 56) + 32);
                  int64_t v99 = v26;
                  if (v98 >= 1)
                  {
                    uint64_t v27 = TokenOrSubtokenAfterPosition;
                    uint64_t v28 = 0;
                    uint64_t v97 = (int)v19;
                    p_info = DDScannerList.info;
                    while (1)
                    {
                      if (*(unsigned char *)(v2 + 232)) {
                        goto LABEL_114;
                      }
                      uint64_t v30 = *(void *)(*(void *)(v2 + 56) + 16) + 48 * v28;
                      uint64_t v31 = *(void *)(v30 + 16);
                      uint64_t v32 = *(void *)(v30 + 24);
                      if (v28) {
                        uint64_t v33 = v31;
                      }
                      else {
                        uint64_t v33 = v97;
                      }
                      uint64_t v34 = v32 + v31;
                      if (v32 < 0 || v31 < 0 || v34 >= 2147483646)
                      {
                        if (DDLogHandle_onceToken != -1) {
                          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                        }
                        unsigned int v35 = p_info[79];
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                        {
                          LOWORD(buf) = 0;
                          _os_log_error_impl(&dword_19DC95000, v35, OS_LOG_TYPE_ERROR, "Fragment is too long for DD, ignoring. Do you really need to analyze something this long?", (uint8_t *)&buf, 2u);
                        }
                        *(unsigned char *)(v2 + 232) |= 1u;
                      }
                      if (v33 <= v34) {
                        break;
                      }
LABEL_57:
                      if (++v28 == v98) {
                        goto LABEL_114;
                      }
                    }
                    uint64_t v100 = v34;
                    unsigned int v101 = v28 << 16;
                    int v102 = (__int16)v28;
                    while (1)
                    {
                      if (*(unsigned char *)(v2 + 232)) {
                        goto LABEL_57;
                      }
                      unint64_t v36 = v101 | ((unint64_t)v33 << 32);
                      uint64_t v37 = *(void *)(v2 + 216);
                      if (v37
                        && !(*(unsigned int (**)(uint64_t, unint64_t))(v37 + 16))(v37, v101 | ((unint64_t)v33 << 32)))
                      {
                        goto LABEL_94;
                      }
                      if (*(unsigned char *)(v2 + 192))
                      {
                        CFArrayRef v58 = *(const __CFArray **)(v2 + 168);
                        CFIndex Count = CFArrayGetCount(v58);
                        if (Count > 10) {
                          goto LABEL_94;
                        }
                        CFIndex v60 = Count;
                        if (Count >= 1)
                        {
                          uint64_t v96 = v27;
                          CFIndex v61 = 0;
                          BOOL v62 = 1;
                          do
                          {
                            ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v58, v61);
                            if (!ValueAtIndex) {
                              break;
                            }
                            uint64_t v64 = ValueAtIndex;
                            if (!_typesAreEqual(ValueAtIndex[8], @"Compatibility")
                              && !_typesAreEqual(v64[8], @"Data")
                              && !_typesAreEqual(v64[8], @"Tag")
                              && !_typesAreEqual(v64[8], @"Generic"))
                            {
                              break;
                            }
                            BOOL v62 = ++v61 < v60;
                          }
                          while (v60 != v61);
                          uint64_t v27 = v96;
                          uint64_t v34 = v100;
                          if (v62)
                          {
LABEL_94:
                            *(unsigned char *)(v2 + 232) |= 1u;
                            goto LABEL_95;
                          }
                        }
                      }
                      *(void *)(v2 + 184) = 0;
                      DDTokenCacheMoveStreamOffset(*(void **)(v2 + 40), *(void *)(*(void *)(v2 + 56) + 16), v36);
                      uint64_t v39 = *(void *)(*(void *)(v2 + 56) + 16);
                      uint64_t v40 = *(void *)(v39 + 48 * v102 + 32) + (int)v33 - *(void *)(v39 + 48 * v102 + 16);
                      if (v102 > 0 || (int)v33 > *(void *)(v39 + 16)) {
                        --v40;
                      }
                      uint64_t v41 = *(void *)(v2 + 48);
                      uint64_t v42 = v40 - *(void *)v41;
                      if (v42 >= 1)
                      {
                        uint64_t v43 = v28;
                        uint64_t v44 = v27;
                        if (v42 >= *(void *)(v41 + 16)) {
                          uint64_t v45 = *(void *)(v41 + 16);
                        }
                        else {
                          uint64_t v45 = v42;
                        }
                        if (v45 >= 1)
                        {
                          for (uint64_t i = 0; i != v45; ++i)
                          {
                            uint64_t v48 = *(void *)(v41 + 24);
                            uint64_t v47 = *(void *)(v41 + 32);
                            if (i + v47 < v48) {
                              uint64_t v48 = 0;
                            }
                            uint64_t v49 = i + v47 - v48;
                            uint64_t v50 = *(void *)(v41 + 8);
                            uint64_t v51 = *(void *)(v50 + 8 * v49);
                            if (v51)
                            {
                              DDLexemCacheItemReset(*(void *)(v50 + 8 * v49));
                              DDLexemCacheInsertItemInFreeArray((char *)v41, v51);
                              *(void *)(*(void *)(v41 + 8) + 8 * v49) = 0;
                            }
                          }
                        }
                        uint64_t v52 = *(void *)(v41 + 24);
                        uint64_t v53 = *(void *)(v41 + 32) + v45;
                        *(void *)(v41 + 32) = v53;
                        BOOL v54 = v53 < v52;
                        uint64_t v55 = v53 - v52;
                        if (!v54) {
                          *(void *)(v41 + 32) = v55;
                        }
                        *(void *)(v41 + 16) -= v45;
                        *(void *)v41 += v45;
                        uint64_t v27 = v44;
                        uint64_t v28 = v43;
                        p_info = (__objc2_class_ro **)(DDScannerList + 32);
                        uint64_t v34 = v100;
                      }
                      long long buf = 0uLL;
                      unint64_t v104 = v101 | ((unint64_t)v33 << 32);
                      uint64_t v105 = 0;
                      _DDScannerHandleState(v2, (uint64_t *)&buf, 0, v38);
                      if ((int)v27 >> 16 == -1)
                      {
                        uint64_t v56 = DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(v2 + 40), *(void **)(v2 + 56), v36);
                        uint64_t v27 = v56;
                        if ((int)v56 >> 16 == -1)
                        {
                          int64_t v99 = v57;
LABEL_107:
                          ++v33;
                          goto LABEL_95;
                        }
                        uint64_t v67 = (uint64_t)(int)v56 >> 16;
                        if (v102 >= (int)v67 && (v102 > (int)v67 || (int)v33 > SHIDWORD(v56)))
                        {
                          int64_t v99 = v101 | ((unint64_t)v33 << 32);
                          uint64_t v27 = v99;
                          goto LABEL_95;
                        }
                      }
                      else
                      {
                        uint64_t v66 = (uint64_t)(int)v27 >> 16;
                        if (v102 < (int)v66 || v102 <= (int)v66 && (int)v33 < SHIDWORD(v27)) {
                          goto LABEL_107;
                        }
                        uint64_t v33 = v99 >> 32;
                        uint64_t v27 = DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(v2 + 40), *(void **)(v2 + 56), v99);
                      }
                      int64_t v99 = v57;
LABEL_95:
                      if (v23 > 0.0 && (v33 & 0x7FF) == 0 && v24 < CFAbsoluteTimeGetCurrent())
                      {
                        *(unsigned char *)(v2 + 232) |= 1u;
                        if (DDLogHandle_onceToken != -1) {
                          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                        }
                        int v65 = p_info[79];
                        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                        {
                          LODWORD(buf) = 134217984;
                          *(void *)((char *)&buf + 4) = v2;
                          _os_log_impl(&dword_19DC95000, v65, OS_LOG_TYPE_DEFAULT, "DDScanner %p has timed out", (uint8_t *)&buf, 0xCu);
                        }
                      }
                      if (v33 > v34) {
                        goto LABEL_57;
                      }
                    }
                  }
LABEL_114:
                  malloc_make_purgeable(*(void **)(v2 + 208));
                  CFIndex v68 = CFArrayGetCount(*(CFArrayRef *)(v2 + 168));
                  uint64_t v69 = v68;
                  BOOL v5 = v68 > 0;
                  if (v95 >= 1 && v68 > 0)
                  {
                    CFArrayRef v70 = *(const __CFArray **)(v2 + 168);
                    if (v70) {
                      _offsetResultsInArray(v70, v94);
                    }
                  }
                  if (*(unsigned char *)(v2 + 236))
                  {
                    DDTokenCacheDestroy(*(void ***)(v2 + 40));
                    *(void *)(v2 + 40) = 0;
                    *(unsigned char *)(v2 + 236) = 0;
                  }
                  kdebug_trace();
                  LOBYTE(buf) = 0;
                  if ((*(unsigned char *)(v2 + 232) & 1) == 0)
                  {
                    int v72 = *(_DWORD *)(v2 + 248);
                    if (v72)
                    {
                      if (!*(void *)(v2 + 264))
                      {
                        if (!*(unsigned char *)(v2 + 256)) {
                          goto LABEL_149;
                        }
                        if (DDMLEnhancementEnabled_onceToken != -1) {
                          dispatch_once(&DDMLEnhancementEnabled_onceToken, &__block_literal_global_55);
                        }
                        if (!DDMLEnhancementEnabled__isDDMLEnabled) {
                          goto LABEL_149;
                        }
                        gotLoadHelper_x8__kMRLNeuralNetworkOptionModelURLKey(v71);
                        if (!**(void **)(v74 + 3832)) {
                          goto LABEL_149;
                        }
                        int v72 = *(_DWORD *)(v2 + 248);
                      }
                      if (v72 == 2)
                      {
                        if (v69 < 1)
                        {
                          BOOL v5 = 0;
                          goto LABEL_149;
                        }
                      }
                      else if (v69 < 1 || v72 != 4)
                      {
                        goto LABEL_149;
                      }
                      CopyFullStringExcludingContext = (__CFString *)DDScanQueryCopyFullStringExcludingContext(v93);
                      if (CopyFullStringExcludingContext)
                      {
                        uint64_t v76 = CopyFullStringExcludingContext;
                        unint64_t v77 = DDMLScannerScanStringAroundResults(v2, CopyFullStringExcludingContext, *(void **)(v2 + 168), &buf);
                        CFRelease(v76);
                        if ((_BYTE)buf)
                        {
                          BOOL v5 = DDMLUpdateScannerResultsWithMLResults(v2, *(void *)(v2 + 56), (uint64_t)v77, *(void *)(v2 + 272));
LABEL_163:
                          if (!v5) {
                            DDScannerReset(v2);
                          }
                          if (!*(unsigned char *)(v2 + 233))
                          {
                            DDScannerThreadDebug(v2, 0);
                            return v5;
                          }
                          goto LABEL_166;
                        }
                      }
                    }
                  }
LABEL_149:
                  if (*(_DWORD *)(v2 + 248))
                  {
                    if ((*(unsigned char *)(v2 + 195) & 0x20) == 0)
                    {
                      CFArrayRef v78 = *(const __CFArray **)(v2 + 168);
                      if (v78)
                      {
                        CFIndex v79 = CFArrayGetCount(v78);
                        if (v79 >= 1)
                        {
                          CFIndex v80 = v79;
                          CFIndex v81 = 0;
                          uint64_t v82 = 0;
                          uint64_t v83 = -1;
                          uint64_t v84 = -1000000;
                          while (1)
                          {
                            uint64_t v85 = (CFStringRef *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 168), v81);
                            uint64_t v86 = v85;
                            uint64_t v87 = (uint64_t)v85[6];
                            if ((uint64_t)v85[4] <= v83)
                            {
                              if (DDResultsCanShareRange(v82, v85)) {
                                goto LABEL_162;
                              }
                              if (v84 > v87)
                              {
                                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v2 + 168), v81);
                                --v80;
                                --v81;
                                goto LABEL_162;
                              }
                              if (v81 >= 1)
                              {
                                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v2 + 168), v81 - 1);
                                --v80;
                                uint64_t v84 = v87;
                                uint64_t v82 = v86;
                                --v81;
                                goto LABEL_162;
                              }
                            }
                            else
                            {
                              uint64_t v83 = (uint64_t)v85[4];
                            }
                            uint64_t v84 = v87;
                            uint64_t v82 = v86;
LABEL_162:
                            if (++v81 >= v80) {
                              goto LABEL_163;
                            }
                          }
                        }
                      }
                    }
                  }
                  goto LABEL_163;
                }
LABEL_36:
                if ((v20 & 0x80) == 0) {
                  goto LABEL_38;
                }
                goto LABEL_37;
              }
            }
            else
            {
              CFRelease(v90);
            }
          }
        }
        DDLookupTableUpdateFromExternalFile(2, (unsigned __int16 **)(v2 + 88), 0);
        DDLookupTableUpdateFromExternalFile(3, (unsigned __int16 **)(v2 + 96), 0);
        if ((v20 & 8) != 0) {
          goto LABEL_136;
        }
        goto LABEL_36;
      }
    }
    else
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      unsigned int v73 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_19DC95000, v73, OS_LOG_TYPE_ERROR, "DDScannerScanQuery called with NULL token cache", (uint8_t *)&buf, 2u);
      }
    }
    if (!*(unsigned char *)(v2 + 233))
    {
      a1 = v2;
      int v3 = 0;
      goto LABEL_4;
    }
    BOOL v5 = 0;
LABEL_166:
    *(unsigned char *)(v2 + 233) = 0;
    return v5;
  }
  int v3 = 1;
LABEL_4:
  DDScannerThreadDebug(a1, v3);
  return 0;
}

void DDLexemCacheItemReset(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v1 | 0xFFFFFFFFLL;
  if (SHIDWORD(v1) >= 25)
  {
    free(*(void **)a1);
    uint64_t v3 = *(unsigned int *)(a1 + 8);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = v3;
  }
}

char *DDLexemCacheInsertItemInFreeArray(char *result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *((void *)result + 7);
  uint64_t v5 = *((void *)result + 6) + 1;
  if (v5 >= v4)
  {
    CFRange result = (char *)malloc_type_realloc(*((void **)result + 5), 8 * v4 + 64, 0x2004093837F09uLL);
    v3[5] = result;
    uint64_t v6 = &result[8 * v3[7]];
    *((_OWORD *)v6 + 2) = 0u;
    *((_OWORD *)v6 + 3) = 0u;
    *(_OWORD *)uint64_t v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    uint64_t v7 = v3[6];
    v3[7] += 8;
    uint64_t v5 = v7 + 1;
  }
  v3[6] = v5;
  *(void *)(v3[5] + 8 * v5) = a2;
  return result;
}

void DDTokenCacheMoveStreamOffset(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (uint64_t)(int)a3 >> 16;
  uint64_t v4 = *(void *)(a2 + 48 * (int)v3 + 32) + (a3 >> 32) - *(void *)(a2 + 48 * (int)v3 + 16);
  if ((int)v3 > 0 || a3 >> 32 > *(void *)(a2 + 16)) {
    --v4;
  }
  uint64_t v5 = a1[2];
  uint64_t v6 = v4 - v5;
  if (v4 - v5 < 0)
  {
    if ((DDTokenCacheMoveStreamOffset_alreadyLogged & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v33 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DC95000, v33, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
      }
      DDLogAssertionFailure((uint64_t)"delta >= 0", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v34, 407, @"Bad shift in DDTokenCacheMoveStreamOffset, aborting");
      DDTokenCacheMoveStreamOffset_alreadyLogged = 1;
    }
  }
  else
  {
    if (!v6) {
      return;
    }
    uint64_t v7 = a1[5];
    if (v6 >= v7)
    {
      uint64_t v20 = a1[5];
      if (v7 < 1)
      {
LABEL_29:
        uint64_t v29 = a1[6];
        uint64_t v30 = a1[7] + v6;
        a1[7] = v30;
        BOOL v31 = v30 < v29;
        uint64_t v32 = v30 - v29;
        if (!v31) {
          a1[7] = v32;
        }
        a1[5] = v20 - v7;
        a1[2] += v6;
        return;
      }
    }
    else
    {
      uint64_t v9 = a1[6];
      uint64_t v8 = a1[7];
      if (v8 + v6 >= v9) {
        uint64_t v10 = a1[6];
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = v8 + v6 - v10;
      uint64_t v12 = a1[4];
      int v13 = *(uint64_t **)(v12 + 8 * v11);
      uint64_t v14 = *v13;
      if ((*v13 & 0x80000000) == 0 && (int)v14 < v4)
      {
        uint64_t v15 = (int)v14 - v5;
        if ((int)v14 < v5) {
          uint64_t v15 = 0;
        }
        uint64_t v16 = v15 + v8;
        if (v16 >= v9) {
          uint64_t v17 = a1[6];
        }
        else {
          uint64_t v17 = 0;
        }
        uint64_t v18 = *(void *)(v12 + 8 * (v16 - v17));
        if (*(_WORD *)(v18 + 6) == 1)
        {
          long long v19 = *(_OWORD *)(v13 + 1);
          *(_OWORD *)(v13 + 1) = *(_OWORD *)(v18 + 8);
          *(_OWORD *)(v18 + 8) = v19;
        }
        else
        {
          uint64_t v21 = v13[1];
          v13[1] = *(void *)(v18 + 8);
          *(void *)(v18 + 8) = v21;
        }
        __int16 v22 = *((_WORD *)v13 + 3);
        *((_WORD *)v13 + 3) = *(_WORD *)(v18 + 6);
        int v23 = *(_DWORD *)(v18 + 4);
        *(_WORD *)(v18 + 6) = v22;
        int v24 = *((_DWORD *)v13 + 1);
        *((_WORD *)v13 + 2) = v23;
        *(_WORD *)(v18 + 4) = v24;
      }
      uint64_t v7 = v6;
    }
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v27 = a1[6];
      uint64_t v26 = a1[7];
      if (i + v26 < v27) {
        uint64_t v27 = 0;
      }
      uint64_t v28 = *(void *)(a1[4] + 8 * (i + v26 - v27));
      *(void *)uint64_t v28 = ((unint64_t)*(unsigned __int16 *)(v28 + 6) << 48) | 0xFFFFFFFF;
    }
    uint64_t v20 = a1[5];
    if (v7 <= v20) {
      goto LABEL_29;
    }
    if ((DDTokenCacheMoveStreamOffset_alreadyLogged_3 & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      unsigned int v35 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DC95000, v35, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
      }
      DDLogAssertionFailure((uint64_t)"maxIndexToClean <= tokenCache->_tokenCacheTableNumberOfItems", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v36, 451, @"Bad shift, delta too big");
      DDTokenCacheMoveStreamOffset_alreadyLogged_3 = 1;
    }
  }
}

uint64_t DDTokenCacheGetTokenOrSubtokenAfterPosition(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t)(int)a3 >> 16;
  uint64_t v6 = a2[2] + 48 * (int)v5;
  if (*(void *)(v6 + 32) + (a3 >> 32) - *(void *)(v6 + 16) < a1[2])
  {
    uint64_t v7 = *a1;
    uint64_t Offset = matchingTokenRealIndexForQueryOffset(*a1, a3, 1);
    uint64_t v9 = _tokenEntryAtRealIndex(v7, Offset);
    if (v9) {
      return *(void *)v9;
    }
    return 4294901760;
  }
  uint64_t v33 = 0;
  uint64_t TokensAtPosition = DDTokenCacheGetTokensAtPosition(a1, a2, a3, &v33);
  if ((uint64_t)TokensAtPosition < 1)
  {
    uint64_t v22 = a3 >> 32;
  }
  else
  {
    uint64_t v13 = (uint64_t)(int)a3 >> 16;
    uint64_t v14 = v33;
    uint64_t v10 = *v33;
    if (HIDWORD(*v33) == HIDWORD(a3) && *(int *)v33 >> 16 == v13)
    {
      if (TokensAtPosition != (uint64_t *)1) {
        return v14[2];
      }
      return v10;
    }
    if (TokensAtPosition != (uint64_t *)1)
    {
      uint64_t v16 = v33 + 2;
      uint64_t v17 = 1;
      do
      {
        uint64_t v18 = *v16;
        v16 += 2;
        uint64_t v10 = v18;
        uint64_t v19 = (uint64_t)(int)v18 >> 16;
        if ((int)v19 >= (int)v13)
        {
          BOOL v20 = SHIDWORD(v10) < SHIDWORD(a3) && (int)v19 <= (int)v13;
          if (!v20) {
            return v10;
          }
        }
      }
      while (TokensAtPosition != (uint64_t *)++v17);
    }
    uint64_t v21 = v33[1];
    uint64_t v5 = (uint64_t)(int)v21 >> 16;
    uint64_t v22 = v21 >> 32;
  }
  uint64_t v23 = a1[2];
  uint64_t v24 = a2[2];
  uint64_t v25 = v22 + *(void *)(v24 + 48 * (int)v5 + 32) - (v23 + *(void *)(v24 + 48 * (int)v5 + 16));
  if (v25 > 199) {
    return 4294901760;
  }
  uint64_t v26 = *(void *)(v24 + 48 * a2[4] - 16) - v23 + *(void *)(v24 + 48 * a2[4] - 24);
  uint64_t v27 = v26 >= 200 ? 200 : v26;
  if (v25 > v27) {
    return 4294901760;
  }
  int v28 = 0;
  uint64_t v10 = 4294901760;
  do
  {
    IfNeeded = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v25);
    if (!IfNeeded) {
      break;
    }
    uint64_t v30 = *IfNeeded;
    if ((*IfNeeded & 0x80000000) == 0) {
      goto LABEL_45;
    }
    if (v28) {
      return v10;
    }
    _FillNextTokenInCache(a1, a2, v25);
    IfNeeded = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v25);
    if (!IfNeeded) {
      return v10;
    }
    uint64_t v30 = *IfNeeded;
    int v28 = 1;
    if ((*IfNeeded & 0x80000000) == 0)
    {
LABEL_45:
      uint64_t v31 = v30 << 16 >> 48;
      if ((int)v31 >= 1)
      {
        if (v31 != 1)
        {
          uint64_t v14 = (uint64_t *)IfNeeded[1];
          return v14[2];
        }
        return IfNeeded[1];
      }
    }
    BOOL v20 = v25++ < v27;
  }
  while (v20);
  return v10;
}

void DDScannerReset(uint64_t a1)
{
  if (a1)
  {
    DDTokenCacheClear(*(void *)(a1 + 40));
    DDLexemCacheClear(*(void *)(a1 + 48));
    DDSourceMatchCacheFree(*(uint64_t **)(a1 + 152));
    *(void *)(a1 + 152) = 0;
    uint64_t v2 = *(const void **)(a1 + 56);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 56) = 0;
    }
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3)
    {
      uint64_t v4 = *(const void **)(v3 + 24);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(v3 + 24) = 0;
      }
      *(void *)(v3 + 40) = -1;
    }
    uint64_t v5 = *(__CFArray **)(a1 + 168);
    if (v5)
    {
      CFArrayRemoveAllValues(v5);
    }
  }
}

void DDCachingStringTokenizerResetStringWithOptions(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(const void **)(a1 + 32);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 32) = 0;
  }
  if (*(unsigned char *)(a1 + 121))
  {
    *(void *)(a1 + 80) = -1;
    *(void *)(a1 + 112) = -1;
    uint64_t v7 = *(const void **)(a1 + 40);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 40) = 0;
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 48);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 72);
      if (v9 >= 1)
      {
        uint64_t v10 = 16;
        uint64_t v11 = *(void *)(a1 + 72);
        do
        {
          uint64_t v12 = *(void **)(*(void *)(a1 + 48) + v10);
          if (v12) {
            free(v12);
          }
          v10 += 32;
          --v11;
        }
        while (v11);
        bzero(v8, 32 * v9);
      }
    }
    else
    {
      *(void *)(a1 + 64) = 64;
      *(void *)(a1 + 48) = malloc_type_calloc(0x40uLL, 0x20uLL, 0x10200406A33E52CuLL);
    }
    *(_OWORD *)(a1 + 104) = xmmword_19DCCF940;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 80) = -1;
    *(void *)(a1 + 88) = -1;
    *(void *)(a1 + 96) = -1;
    *(unsigned char *)(a1 + 120) = 0;
    *(void *)(a1 + 56) = a2;
    if (a3 && *(void *)(a1 + 40))
    {
      NLStringTokenizerSetStringWithOptions();
    }
  }
}

void DDTokenCacheClear(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 40);
    if (v1 >= 1)
    {
      for (uint64_t i = 0; i < v1; ++i)
      {
        uint64_t v4 = *(void *)(a1 + 48);
        uint64_t v3 = *(void *)(a1 + 56);
        if (i + v3 < v4) {
          uint64_t v4 = 0;
        }
        uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8 * (i + v3 - v4));
        if (v5)
        {
          *(void *)uint64_t v5 = ((unint64_t)*(unsigned __int16 *)(v5 + 6) << 48) | 0xFFFFFFFF;
          uint64_t v1 = *(void *)(a1 + 40);
        }
      }
    }
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
    *(_OWORD *)(a1 + 16) = xmmword_19DCCF940;
    *(void *)(a1 + 384) = 0;
    if (*(void *)a1) {
      DDCachingStringTokenizerResetStringWithOptions(*(void *)a1, *(void *)(a1 + 392), 1);
    }
  }
}

void DDLexemCacheClear(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i < v2; ++i)
    {
      uint64_t v5 = *(void *)(a1 + 24);
      uint64_t v4 = *(void *)(a1 + 32);
      if (i + v4 < v5) {
        uint64_t v5 = 0;
      }
      uint64_t v6 = i + v4 - v5;
      uint64_t v7 = *(void *)(a1 + 8);
      uint64_t v8 = *(void *)(v7 + 8 * v6);
      if (v8)
      {
        DDLexemCacheItemReset(*(void *)(v7 + 8 * v6));
        DDLexemCacheInsertItemInFreeArray((char *)a1, v8);
        uint64_t v2 = *(void *)(a1 + 16);
        *(void *)(*(void *)(a1 + 8) + 8 * v6) = 0;
      }
    }
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  uint64_t v9 = *(void *)(a1 + 64);
  if (v9)
  {
    DDLexemCacheItemReset(v9);
  }
}

void DDSourceMatchCacheFree(uint64_t *a1)
{
  if (!a1) {
    return;
  }
  if (a1[1] > 0)
  {
    uint64_t v2 = 14;
    goto LABEL_6;
  }
  uint64_t v2 = *a1;
  if ((*a1 & 0x8000000000000000) == 0)
  {
LABEL_6:
    uint64_t v3 = v2 + 1;
    uint64_t v4 = (void **)(a1 + 5);
    do
    {
      if (*v4) {
        free(*v4);
      }
      v4 += 8;
      --v3;
    }
    while (v3);
  }

  free(a1);
}

uint64_t DDScanQueryAddTextFragment(uint64_t result, CFStringRef theString, uint64_t a3, uint64_t a4, uint64_t a5, char a6, unsigned int a7)
{
  if (!theString) {
    return result;
  }
  uint64_t v13 = result;
  CFRange result = CFStringGetLength(theString);
  if (!result || *(uint64_t *)(v13 + 32) > 29999) {
    return result;
  }
  DDScanQueryAddSeparator(v13, a7);
  uint64_t v14 = *(char **)(v13 + 16);
  if (!v14)
  {
    *(_OWORD *)(v13 + 24) = xmmword_19DCCF960;
    uint64_t v19 = (char *)malloc_type_malloc(0xC0uLL, 0x10E004000188D12uLL);
LABEL_13:
    uint64_t v14 = v19;
    *(void *)(v13 + 16) = v19;
    uint64_t v16 = *(void *)(v13 + 32);
    goto LABEL_14;
  }
  uint64_t v15 = *(void *)(v13 + 24);
  uint64_t v16 = *(void *)(v13 + 32);
  if (v15 == v16)
  {
    uint64_t v17 = 2 * v15;
    if (v15 < 2) {
      uint64_t v17 = 4;
    }
    if (v15 >= 1024) {
      uint64_t v18 = v15 + 1024;
    }
    else {
      uint64_t v18 = v17;
    }
    *(void *)(v13 + 24) = v18;
    uint64_t v19 = (char *)malloc_type_realloc(v14, 48 * v18, 0x10E004000188D12uLL);
    goto LABEL_13;
  }
LABEL_14:
  BOOL v20 = &v14[48 * v16];
  CFRange result = (uint64_t)CFRetain(theString);
  uint64_t v21 = (unsigned int *)(v20 + 40);
  int v22 = *((_DWORD *)v20 + 10) & 0x3FFFFFF;
  *((void *)v20 + 2) = a3;
  *((void *)v20 + 3) = a4;
  *(void *)BOOL v20 = result;
  *((void *)v20 + 1) = a5;
  unsigned int v23 = v22 & 0x83FFFFFF | ((a6 & 3) << 29) | ((a7 & 7) << 26);
  *((_DWORD *)v20 + 10) = v23;
  if (v16 < 1)
  {
    *(void *)&v14[48 * v16 + 32] = 0;
  }
  else
  {
    uint64_t v24 = *(void *)(v13 + 16) + 48 * v16;
    *(void *)&v14[48 * v16 + 32] = *(void *)(v24 - 16) + *(void *)(v24 - 24) + 1;
    unsigned int v25 = *(_DWORD *)(v24 - 8);
    unsigned int v26 = (v25 >> 26) & 7;
    if (v26 <= a7) {
      LOBYTE(v26) = a7;
    }
    *(_DWORD *)(v24 - 8) = v25 & 0xE3FFFFFF | ((v26 & 7) << 26);
    unsigned int v23 = *v21;
  }
  *uint64_t v21 = v23 & 0xFC000000;
  ++*(void *)(v13 + 32);
  return result;
}

uint64_t DDScanQueryAddSeparator(uint64_t result, unsigned int a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(result + 16) + 48 * v2;
    unsigned int v6 = *(_DWORD *)(v3 - 8);
    uint64_t v4 = (unsigned int *)(v3 - 8);
    unsigned int v5 = v6;
    BOOL v7 = (v6 & 0x1C000000) == 0xC000000 && a2 >= 3;
    if (v7 && (v5 & 0x80000000) != 0)
    {
      unsigned int v5 = v5 & 0xE3FFFFFF | 0x10000000;
      unsigned int *v4 = v5;
    }
    if (((v5 >> 26) & 7) < a2) {
      unsigned int *v4 = v5 & 0xE3FFFFFF | ((a2 & 7) << 26);
    }
  }
  return result;
}

void DDScanQueryReset(void *a1)
{
  if ((uint64_t)a1[4] >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(const void **)(a1[2] + v2);
      if (v4) {
        CFRelease(v4);
      }
      unsigned int v5 = (void (*)(void, void))a1[5];
      if (v5) {
        v5(a1[6], *(void *)(a1[2] + v2 + 8));
      }
      ++v3;
      v2 += 48;
    }
    while (v3 < a1[4]);
  }
  a1[4] = 0;
}

void DDLookupTableUpdateFromExternalFile(uint64_t a1, unsigned __int16 **a2, CFStringRef string)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a2;
  if ((a1 & 0xFFFFFFFD) == 4)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 0x40000000;
    v16[2] = __DDLookupTableUpdateFromExternalFile_block_invoke;
    v16[3] = &__block_descriptor_tmp_26_513;
    v16[4] = a2;
    v16[5] = v4;
    mmapSource(a1, 0, (uint64_t)v16);
    return;
  }
  uint64_t v14 = 0;
  off_t v15 = 0;
  if (v4) {
    int8x16_t v6 = *(int8x16_t *)(v4 + 20);
  }
  else {
    int8x16_t v6 = 0uLL;
  }
  int8x16_t v13 = v6;
  if (!string)
  {
    int v10 = 1;
    if (_DDTriePathForSource(a1, v17, 0, 1, 0)) {
      int v10 = DDautommap(v17, &v14, &v15, &v13);
    }
LABEL_13:
    if (!v10) {
      return;
    }
    goto LABEL_14;
  }
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(string);
  if (MaximumSizeOfFileSystemRepresentation >= 1)
  {
    uint64_t v8 = &v13.i8[-((MEMORY[0x1F4188790](MaximumSizeOfFileSystemRepresentation) + 15) & 0xFFFFFFFFFFFFFFF0)];
    if (CFStringGetFileSystemRepresentation(string, v8, v9)) {
      int v10 = DDautommap(v8, &v14, &v15, &v13);
    }
    else {
      int v10 = 1;
    }
    goto LABEL_13;
  }
LABEL_14:
  if (v4)
  {
    uint64_t v11 = (int *)*((void *)v4 + 4);
    if (v11)
    {
      munmap(v11, v11[1]);
      *((void *)v4 + 5) = 0;
      *((void *)v4 + 6) = 0;
      *((void *)v4 + 4) = 0;
    }
    CFRelease(v4);
  }
  uint64_t v12 = v14;
  if (v14) {
    uint64_t v12 = (unsigned __int16 *)DDLookupTableCreateFromCacheData(v14, v15, v13.i64[0], v13.i64[1]);
  }
  *a2 = v12;
}

BOOL _DDTriePathForSource(int a1, const char *a2, int a3, int a4, int a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v6 = a1 - 1;
  if ((a1 - 1) > 5 || ((0x2Fu >> v6) & 1) == 0) {
    goto LABEL_34;
  }
  uint64_t v11 = off_1E5985128[v6];
  uint64_t v12 = (char *)__stpcpy_chk();
  if ((a1 & 0xFFFFFFFD) == 4) {
    snprintf(v12, 0xEuLL, "/%d/", a5);
  }
  else {
    strcpy(v12, "/sys/");
  }
  int v13 = strlen(a2);
  if (v13 < 1) {
    goto LABEL_34;
  }
  if (a4)
  {
    uint64_t v14 = ".lexicon";
    off_t v15 = ".ddsource";
    goto LABEL_16;
  }
  *__error() = 0;
  if (!mkdir(a2, 0x1C1u))
  {
LABEL_15:
    uint64_t v14 = ".lexicon.XXXXX";
    off_t v15 = ".ddsource.XXXXX";
LABEL_16:
    if (a3) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = v15;
    }
    int v18 = strlen(v11);
    int v19 = strlen(v17);
    int v20 = v18 + v13 + v19;
    if (v20 <= 254)
    {
      if (v18 >= 1) {
        memcpy((void *)&a2[v13], v11, v18);
      }
      if (v19 >= 1) {
        memcpy((void *)&a2[v18 + v13], v17, v19);
      }
      a2 += v20;
      BOOL result = 1;
    }
    else
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v21 = DDLogHandle_error_log_handle;
      BOOL result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)long long buf = 0;
        unsigned int v23 = "basePath is too long";
        uint64_t v24 = v21;
        uint32_t v25 = 2;
LABEL_33:
        _os_log_error_impl(&dword_19DC95000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
LABEL_34:
        BOOL result = 0;
        goto LABEL_35;
      }
    }
    goto LABEL_35;
  }
  if (*__error() == 17)
  {
    chmod(a2, 0x1C1u);
    if (altPath) {
      uint64_t v16 = (const char *)altPath;
    }
    else {
      uint64_t v16 = "/var/db/datadetectors";
    }
    chmod(v16, 0x1C1u);
    goto LABEL_15;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v26 = DDLogHandle_error_log_handle;
  BOOL result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    uint64_t v27 = __error();
    int v28 = strerror(*v27);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v30 = a2;
    __int16 v31 = 2080;
    uint64_t v32 = v28;
    unsigned int v23 = "DD Failed creating folder %s (error: %s)";
    uint64_t v24 = v26;
    uint32_t v25 = 22;
    goto LABEL_33;
  }
LABEL_35:
  *a2 = 0;
  return result;
}

uint64_t DDautommap(const char *a1, void *a2, off_t *a3, int8x16_t *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(&v16, 0, sizeof(v16));
  if (stat(a1, &v16))
  {
    if (*__error() != 2)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v8 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        CFIndex v9 = __error();
        int v10 = strerror(*v9);
        *(_DWORD *)long long buf = 136315394;
        int v18 = a1;
        __int16 v19 = 2080;
        int v20 = v10;
        _os_log_error_impl(&dword_19DC95000, v8, OS_LOG_TYPE_ERROR, "Could not stat %s: %s, aborting", buf, 0x16u);
      }
    }
LABEL_13:
    uint64_t result = 1;
    goto LABEL_14;
  }
  if (*(_OWORD *)&v16.st_mtimespec != *a4)
  {
    off_t st_size = v16.st_size;
    if (v16.st_size)
    {
      int v13 = open(a1, 0);
      if (v13 != -1)
      {
        int v14 = v13;
        off_t v15 = _DDmmap((uint64_t)a1, v13, st_size);
        close(v14);
        if (v15)
        {
          *a2 = v15;
          *a4 = vextq_s8((int8x16_t)v16.st_mtimespec, (int8x16_t)v16.st_mtimespec, 8uLL);
          *a3 = st_size;
          return 1;
        }
      }
    }
    goto LABEL_13;
  }
  uint64_t result = 0;
LABEL_14:
  *a2 = 0;
  a4->i64[0] = 0;
  a4->i64[1] = 0;
  *a3 = 0;
  return result;
}

CFMutableArrayRef DDScannerSetMockMLResults(uint64_t a1, CFArrayRef theArray)
{
  CFMutableArrayRef result = *(CFMutableArrayRef *)(a1 + 264);
  if (result != theArray)
  {
    if (result) {
      CFRelease(result);
    }
    CFMutableArrayRef result = 0;
    if (theArray) {
      CFMutableArrayRef result = CFArrayCreateMutableCopy(0, 0, theArray);
    }
    *(void *)(a1 + 264) = result;
  }
  return result;
}

void *DDScannerSetMLSupportedTypes(void *result, void *cf)
{
  if (result)
  {
    uint64_t v3 = result;
    CFMutableArrayRef result = (void *)result[34];
    if (result != cf)
    {
      if (result) {
        CFRelease(result);
      }
      if (cf) {
        CFMutableArrayRef result = CFRetain(cf);
      }
      else {
        CFMutableArrayRef result = 0;
      }
      v3[34] = result;
    }
  }
  return result;
}

CFArrayRef DDScannerCopyResultsWithOptions(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 233) == 1)
  {
    DDScannerThreadDebug(a1, 1);
    return 0;
  }
  *(unsigned char *)(a1 + 233) = 1;
  kdebug_trace();
  CFArrayRef v5 = *(const __CFArray **)(a1 + 168);
  if (v5)
  {
    uint64_t Count = CFArrayGetCount(v5);
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (Count < 1
      || (MutableCFArrayRef Copy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Count, *(CFArrayRef *)(a1 + 168))) == 0
      || (CFArrayRef v9 = MutableCopy,
          DDApplyOptions(MutableCopy, (void *)a1, a2),
          CFArrayRef Copy = CFArrayCreateCopy(0, v9),
          CFRelease(v9),
          !Copy))
    {
      CFArrayRef Copy = CFArrayCreate(v7, 0, 0, MEMORY[0x1E4F1D510]);
    }
  }
  else
  {
    CFArrayRef Copy = 0;
  }
  kdebug_trace();
  DDScannerReset(a1);
  if (*(unsigned char *)(a1 + 233)) {
    *(unsigned char *)(a1 + 233) = 0;
  }
  else {
    DDScannerThreadDebug(a1, 0);
  }
  return Copy;
}

void sub_19DC9F4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

BOOL DDScannerScanStringWithRange(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  return DDScannerScanStringWithRangeAndContextOffset(a1, a2, a3, a4, 0);
}

void _DDResultCFFinalize(void *a1)
{
  uint64_t v2 = (const void *)a1[7];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[8];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[9];
  if (v4) {
    CFRelease(v4);
  }
  CFArrayRef v5 = (const void *)a1[10];
  if (v5) {
    CFRelease(v5);
  }
  int v6 = (const void *)a1[11];
  if (v6)
  {
    CFRelease(v6);
  }
}

uint64_t __DDResultGetCategory_block_invoke_3(uint64_t a1)
{
  uint64_t result = CFSetContainsValue((CFSetRef)DDResultGetCategory_urlSet, *(const void **)(a1 + 40));
  if (result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __DDResultGetCategory_block_invoke_5(uint64_t a1)
{
  uint64_t result = CFSetContainsValue((CFSetRef)DDResultGetCategory_eventSet, *(const void **)(a1 + 40));
  if (result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 4;
  }
  return result;
}

uint64_t DDDFAScannerCreateFromCache(const void *a1)
{
  CFTypeID v2 = DDTypeRegister(&DDDFAScannerGetTypeID_typeID);
  uint64_t Instance = DDTypeCreateInstance_(0, v2, 0x20uLL);
  *(void *)(Instance + 24) = a1;
  CFRetain(a1);
  *(void *)(Instance + 32) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  return Instance;
}

uint64_t DDInsertResultRec(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v10 = a1;
  if (*(__int16 *)(a3 + 14) < 0) {
    goto LABEL_102;
  }
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a3 + 14) + 11) & 4) != 0)
  {
    uint64_t v11 = *(unsigned int *)(a3 + 8);
    unint64_t v12 = (unint64_t)(v11 << 40 >> 24) >> 16;
    a5 = (v12 << 16) | (*(void *)a3 << 32);
    a6 = ((v12 + ((unint64_t)(int)v11 >> 24)) << 16) | *(void *)a3 & 0xFFFFFFFF00000000;
  }
  if (*(__int16 *)(*(void *)(*(void *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a3 + 14)) == -1)
  {
LABEL_102:
    unint64_t v51 = *(unsigned __int8 *)(a3 + 13);
    if (*(unsigned char *)(a3 + 13))
    {
      uint64_t v52 = 0;
      if (((*(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int8 *)(a3 + 12) << 32)) & 0x100000000) != 0) {
        uint64_t v53 = a3 + 48;
      }
      else {
        uint64_t v53 = a3 + 24;
      }
      BOOL v54 = 1;
      do
      {
        if (DDInsertResultRec(v10, a2, *(void *)(v53 + 8 * v52), a4, a5, a6)) {
          break;
        }
        BOOL v54 = ++v52 < v51;
      }
      while (v51 != v52);
    }
    else
    {
      return 0;
    }
    return v54;
  }
  if ((int)a5 >> 16 == -1)
  {
    uint64_t v13 = *(unsigned int *)(a2 + 8);
    unint64_t v14 = (unint64_t)(v13 << 40 >> 24) >> 16;
    a5 = (v14 << 16) | (*(void *)a2 << 32);
    a6 = ((v14 + ((unint64_t)(int)v13 >> 24)) << 16) | *(void *)a2 & 0xFFFFFFFF00000000;
  }
  if ((*(unsigned char *)(a1 + 195) & 0x20) != 0 || (CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 168)), Count < 1))
  {
    uint64_t v56 = 0;
    goto LABEL_114;
  }
  uint64_t v58 = a4;
  cf = 0;
  uint64_t v62 = v10;
  uint64_t v16 = (uint64_t)(int)a5 >> 16;
  CFIndex v17 = Count + 1;
  unint64_t v18 = HIDWORD(a6);
  int v60 = 1;
  uint64_t v19 = (uint64_t)(int)a6 >> 16;
  while (1)
  {
    uint64_t v20 = v19;
    unint64_t v21 = v18;
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v10 + 168), v17 - 2);
    uint64_t v23 = *((void *)ValueAtIndex + 6);
    unint64_t v25 = *((void *)ValueAtIndex + 14);
    unint64_t v24 = *((void *)ValueAtIndex + 15);
    uint64_t v26 = (uint64_t)(int)v24 >> 16;
    unint64_t v27 = HIDWORD(v24);
    if ((int)v16 >= (int)v26 && ((int)v16 > (int)v26 || SHIDWORD(a5) >= SHIDWORD(v24))) {
      break;
    }
    unint64_t v29 = HIDWORD(v25);
    uint64_t v30 = (uint64_t)(int)v25 >> 16;
    BOOL v31 = HIDWORD(a5) == HIDWORD(v25) && v16 == v30;
    unint64_t v18 = v21;
    BOOL v32 = v31 && v21 == HIDWORD(v24);
    uint64_t v19 = v20;
    if (!v32 || v20 != v26)
    {
      if (SHIDWORD(a5) >= SHIDWORD(v25)) {
        uint64_t v34 = *((void *)ValueAtIndex + 14);
      }
      else {
        uint64_t v34 = a5;
      }
      if ((int)v30 < (int)v16) {
        uint64_t v34 = *((void *)ValueAtIndex + 14);
      }
      if ((int)v30 <= (int)v16) {
        uint64_t v35 = v34;
      }
      else {
        uint64_t v35 = a5;
      }
      if ((int)v21 >= SHIDWORD(v24)) {
        unint64_t v36 = a6;
      }
      else {
        unint64_t v36 = *((void *)ValueAtIndex + 15);
      }
      if ((int)v20 > (int)v26) {
        unint64_t v36 = a6;
      }
      if ((int)v20 < (int)v26) {
        unint64_t v36 = *((void *)ValueAtIndex + 15);
      }
      if (HIDWORD(a5) != HIDWORD(v35)
        || v16 != (int)v35 >> 16
        || ((v31 = v21 == HIDWORD(v36), uint64_t v37 = (uint64_t)(int)v36 >> 16, v31)
          ? (BOOL v38 = v20 == v37)
          : (BOOL v38 = 0),
            !v38))
      {
        if (SHIDWORD(a5) >= SHIDWORD(v25)) {
          uint64_t v39 = *((void *)ValueAtIndex + 14);
        }
        else {
          uint64_t v39 = a5;
        }
        if ((int)v30 >= (int)v16) {
          unint64_t v25 = v39;
        }
        if ((int)v30 > (int)v16) {
          unint64_t v25 = a5;
        }
        if ((int)v21 >= SHIDWORD(v24)) {
          unint64_t v40 = a6;
        }
        else {
          unint64_t v40 = *((void *)ValueAtIndex + 15);
        }
        if ((int)v20 > (int)v26) {
          unint64_t v40 = a6;
        }
        if ((int)v20 >= (int)v26) {
          unint64_t v24 = v40;
        }
        BOOL v31 = v29 == HIDWORD(v25);
        uint64_t v41 = (uint64_t)(int)v25 >> 16;
        BOOL v43 = v31 && v30 == v41 && v27 == HIDWORD(v24);
        uint64_t v10 = v62;
        if (v43)
        {
          BOOL v31 = v26 != (int)v24 >> 16;
          int v44 = v60;
          if (!v31) {
            int v44 = 0;
          }
          int v60 = v44;
        }
        goto LABEL_94;
      }
LABEL_89:
      uint64_t v10 = v62;
LABEL_90:
      if (*(void *)(v10 + 192) >> 31) {
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v10 + 160), v17 - 2);
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v10 + 168), v17 - 2);
      goto LABEL_93;
    }
    ScannerResult = cf;
    if (!cf)
    {
      if (_typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), @"Compatibility")
        && (*(__int16 *)(a3 + 14) & 0x80000000) == 0
        && (uint64_t v46 = *(void *)(v62 + 16),
            *(unsigned __int16 *)(*(void *)(v46 + 16) + 12 * *(unsigned __int16 *)(a3 + 14)) == *(unsigned __int16 *)(v62 + 234)))
      {
        ScannerResult = (CFStringRef *)DDLRResultCreateScannerResult(a3, v46, 0);
      }
      else
      {
        ScannerResult = 0;
      }
    }
    cf = ScannerResult;
    if (DDResultsCanShareRange(ScannerResult, (CFStringRef *)ValueAtIndex) || (*(unsigned char *)(v62 + 195) & 8) != 0) {
      goto LABEL_80;
    }
    if (v23 > v58 || v23 == v58 && !_typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), @"Location"))
    {
      if (*(_DWORD *)(v62 + 248))
      {
        CFStringRef v49 = (const __CFString *)DDTypeForLRResult(*(_WORD *)(a3 + 14), *(void *)(v62 + 16));
        BOOL v50 = 0;
        if (ValueAtIndex && v49) {
          BOOL v50 = _typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), v49);
        }
        int v60 = !v50;
      }
      else
      {
        int v60 = 0;
      }
LABEL_80:
      uint64_t v10 = v62;
      goto LABEL_93;
    }
    if (!*(_DWORD *)(v62 + 248)) {
      goto LABEL_89;
    }
    CFStringRef v47 = (const __CFString *)DDTypeForLRResult(*(_WORD *)(a3 + 14), *(void *)(v62 + 16));
    if (!ValueAtIndex || !v47) {
      goto LABEL_80;
    }
    BOOL v48 = _typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), v47);
    uint64_t v10 = v62;
    if (v48) {
      goto LABEL_90;
    }
LABEL_93:
    unint64_t v18 = v21;
    uint64_t v19 = v20;
LABEL_94:
    if ((unint64_t)--v17 <= 1) {
      goto LABEL_113;
    }
  }
  uint64_t v10 = v62;
LABEL_113:
  a4 = v58;
  uint64_t v56 = cf;
  if ((_BYTE)v60)
  {
LABEL_114:
    int64_t v57 = v56;
    DDInsertResultsFromTopLevelRec(v10, a2, a4, a5, a6, (uint64_t)v56);
    uint64_t v56 = v57;
  }
  if (v56) {
    CFRelease(v56);
  }
  return 1;
}

void DDInsertResultsFromTopLevelRec(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  if (a6 && _typesAreEqual(*(CFStringRef *)(a6 + 64), @"Compatibility"))
  {
    uint64_t v12 = a1;
    uint64_t v13 = a2;
    uint64_t v14 = a3;
    uint64_t v15 = a4;
    unint64_t v16 = a5;
    CFIndex v17 = (uint64_t *)a6;
LABEL_7:
    DDInsertResultsFromTopLevel(v12, v13, v14, v15, v16, v17);
    return;
  }
  if ((*(__int16 *)(a2 + 14) & 0x80000000) == 0
    && *(__int16 *)(*(void *)(*(void *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a2 + 14)) != -1)
  {
    uint64_t v12 = a1;
    uint64_t v13 = a2;
    uint64_t v14 = a3;
    uint64_t v15 = a4;
    unint64_t v16 = a5;
    CFIndex v17 = 0;
    goto LABEL_7;
  }
  uint64_t v18 = *(unsigned __int8 *)(a2 + 13);
  if (*(unsigned char *)(a2 + 13))
  {
    if (((*(unsigned int *)(a2 + 8) | ((unint64_t)*(unsigned __int8 *)(a2 + 12) << 32)) & 0x100000000) != 0) {
      uint64_t v19 = (uint64_t *)(a2 + 48);
    }
    else {
      uint64_t v19 = (uint64_t *)(a2 + 24);
    }
    do
    {
      uint64_t v20 = *v19++;
      DDInsertResultsFromTopLevelRec(a1, v20, a3, a4, a5, 0);
      --v18;
    }
    while (v18);
  }
}

CFTypeRef DDLRResultCreateScannerResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6 = DDTypeRegister(&DDResultGetTypeID_typeID);
  uint64_t Instance = (CFArrayRef *)DDTypeCreateInstance_(0, v6, 0x60uLL);
  collectSubResultsInResult(a1, (uint64_t)Instance, a2, 1, a3);
  ValueAtIndex = CFArrayGetValueAtIndex(Instance[7], 0);
  CFTypeRef v9 = CFRetain(ValueAtIndex);
  CFRelease(Instance);
  return v9;
}

void collectSubResultsInResult(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  if (*(__int16 *)(a1 + 14) < 0)
  {
    if (!a5)
    {
      uint64_t v19 = a2;
      goto LABEL_22;
    }
LABEL_7:
    uint64_t v11 = 0;
    uint64_t v13 = @"terminal";
LABEL_8:
    uint64_t v14 = *(unsigned int *)(a1 + 8);
    unint64_t v15 = (unint64_t)(v14 << 40 >> 24) >> 16;
    uint64_t v16 = (v15 << 16) | (*(void *)a1 << 32);
    unint64_t v17 = ((v15 + ((unint64_t)(int)v14 >> 24)) << 16) | *(void *)a1 & 0xFFFFFFFF00000000;
    if (a4) {
      uint64_t v18 = DDRootResultCreate(v13, v16, v17);
    }
    else {
      uint64_t v18 = DDResultCreate(v13, v16, v17);
    }
    uint64_t v19 = (uint64_t)v18;
    DDResultAddSubresult(a2, v18);
    CFRelease((CFTypeRef)v19);
    if (!v11) {
      goto LABEL_22;
    }
LABEL_14:
    unsigned int v12 = *v11;
    if (v12 == 0xFFFF) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = (unsigned __int16 *)(v10 + 12 * *(unsigned __int16 *)(a1 + 14));
  if (!a5)
  {
    uint64_t v19 = a2;
    if (!v11) {
      goto LABEL_22;
    }
    goto LABEL_14;
  }
  if (!v10) {
    goto LABEL_7;
  }
  unsigned int v12 = *v11;
  if (v12 == 0xFFFF)
  {
    uint64_t v13 = @"internal";
    goto LABEL_8;
  }
LABEL_15:
  UniqueSymbolStringAtuint64_t Offset = DDLRTableGetUniqueSymbolStringAtOffset(a3, (const void *)v12);
  uint64_t v21 = *(unsigned int *)(a1 + 8);
  unint64_t v22 = (unint64_t)(v21 << 40 >> 24) >> 16;
  uint64_t v23 = (v22 << 16) | (*(void *)a1 << 32);
  unint64_t v24 = ((v22 + ((unint64_t)(int)v21 >> 24)) << 16) | *(void *)a1 & 0xFFFFFFFF00000000;
  if (a4) {
    unint64_t v25 = DDRootResultCreate(UniqueSymbolStringAtOffset, v23, v24);
  }
  else {
    unint64_t v25 = DDResultCreate(UniqueSymbolStringAtOffset, v23, v24);
  }
  uint64_t v19 = (uint64_t)v25;
  DDResultAddSubresult(a2, v25);
  CFRelease((CFTypeRef)v19);
LABEL_19:
  uint64_t v26 = (const void *)v11[1];
  if (v26 != (const void *)0xFFFF)
  {
    unint64_t v27 = DDLRTableGetUniqueSymbolStringAtOffset(a3, v26);
    DDResultSetValue(v19, v27);
  }
LABEL_22:
  unint64_t v28 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32);
  if ((v28 & 0x200000000) != 0 && v19)
  {
    *(_DWORD *)(v19 + 108) = *(_DWORD *)(a1 + 24);
    *(unsigned char *)(v19 + 104) = 1;
    unint64_t v28 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32);
  }
  if ((v28 & 0x800000000) != 0)
  {
    unint64_t v29 = (__CFString *)CFStringCreateWithCString(0, *(const char **)(a1 + 32), 0x8000100u);
    if (v29)
    {
      uint64_t v30 = v29;
      DDResultAppendContextualData(v19, v29, @"D");
      CFRelease(v30);
    }
  }
  if (((*(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32)) & 0x400000000) != 0)
  {
    BOOL v31 = (__CFString *)CFStringCreateWithCString(0, *(const char **)(a1 + 40), 0x8000100u);
    if (v31)
    {
      BOOL v32 = v31;
      DDResultAppendContextualData(v19, v31, @"U");
      CFRelease(v32);
    }
  }
  if (((*(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32)) & 0x100000000) != 0) {
    uint64_t v33 = a1 + 48;
  }
  else {
    uint64_t v33 = a1 + 24;
  }
  unint64_t v34 = *(unsigned __int8 *)(a1 + 13);
  if (v34)
  {
    uint64_t v35 = v33 - 8;
    do
      collectSubResultsInResult(*(void *)(v35 + 8 * v34), v19, a3, 0, a5);
    while (v34-- > 1);
  }
}

const void *DDLRTableGetUniqueSymbolStringAtOffset(uint64_t a1, const void *a2)
{
  int Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (!Value)
  {
    int Value = CFStringCreateWithPascalString(0, (ConstStr255Param)a2 + *(void *)(a1 + 40), 0x8000100u);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), a2, Value);
    CFRelease(Value);
  }
  return Value;
}

void DDResultAddSubresult(uint64_t a1, void *value)
{
  Mutable = *(__CFArray **)(a1 + 56);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    *(void *)(a1 + 56) = Mutable;
  }

  CFArrayAppendValue(Mutable, value);
}

void *DDResultCreate(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6 = DDTypeRegister(&DDResultGetTypeID_typeID);
  uint64_t Instance = (void *)DDTypeCreateInstance_(0, v6, 0x60uLL);
  Instance[2] = a2;
  Instance[3] = a3;
  if (a1) {
    Instance[8] = CFRetain(a1);
  }
  Instance[12] = 1;
  return Instance;
}

uint64_t DDTypeRegister(uint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    pthread_mutex_lock(&DDTypeRegister_lock);
    if (!*a1) {
      *a1 = _CFRuntimeRegisterClass();
    }
    pthread_mutex_unlock(&DDTypeRegister_lock);
    return *a1;
  }
  return result;
}

uint64_t DDTypeCreateInstance_(uint64_t a1, CFTypeID a2, size_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    uint64_t v6 = Instance;
    bzero((void *)(Instance + 16), a3);
  }
  else
  {
    CFStringRef v7 = CFCopyTypeIDDescription(a2);
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v8 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      CFStringRef v11 = v7;
      _os_log_error_impl(&dword_19DC95000, v8, OS_LOG_TYPE_ERROR, "Failed to create instance of type %@", (uint8_t *)&v10, 0xCu);
    }
    CFRelease(v7);
    return 0;
  }
  return v6;
}

void *DDRootResultCreate(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6 = DDTypeRegister(&DDResultGetTypeID_typeID);
  uint64_t Instance = (void *)DDTypeCreateInstance_(0, v6, 0x70uLL);
  Instance[2] = a2;
  Instance[3] = a3;
  if (a1) {
    Instance[8] = CFRetain(a1);
  }
  Instance[12] = 262145;
  return Instance;
}

void DDInsertResultsFromTopLevel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t *a6)
{
  uint64_t v12 = a6;
  if (!a6)
  {
    ScannerResult = (void *)DDLRResultCreateScannerResult(a2, *(void *)(a1 + 16), 0);
    uint64_t v12 = (uint64_t *)ScannerResult;
    if (*(__int16 *)(a1 + 234) == -1
      && ScannerResult
      && _typesAreEqual(*((CFStringRef *)ScannerResult + 8), @"Compatibility")
      && (*(__int16 *)(a2 + 14) & 0x80000000) == 0)
    {
      *(_WORD *)(a1 + 234) = *(_WORD *)(*(void *)(*(void *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a2 + 14));
    }
  }
  v12[14] = a4;
  v12[15] = a5;
  DDResultSetContent(v12, *(void **)(a1 + 56));
  if (a3 >= 1) {
    v12[6] = a3;
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 168));
  if (Count < 1)
  {
LABEL_13:
    CFIndex v15 = 0;
  }
  else
  {
    CFIndex v15 = Count;
    uint64_t v16 = (uint64_t)(int)a5 >> 16;
    unint64_t v17 = HIDWORD(a5);
    while (1)
    {
      CFIndex v18 = v15 - 1;
      unint64_t v19 = *((void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 168), v15 - 1) + 3);
      uint64_t v20 = (uint64_t)(int)v19 >> 16;
      if ((int)v20 < (int)v16) {
        break;
      }
      unint64_t v21 = HIDWORD(v19);
      if ((int)v20 <= (int)v16 && (int)v21 < (int)v17) {
        break;
      }
      --v15;
      if ((unint64_t)(v18 + 1) <= 1) {
        goto LABEL_13;
      }
    }
  }
  if (*(void *)(a1 + 192) >> 31)
  {
    uint64_t v23 = (uint64_t *)DDLRResultCreateScannerResult(a2, *(void *)(a1 + 16), 1);
    DDResultSetContent(v23, *(void **)(a1 + 56));
    if (a3 >= 1) {
      v23[6] = a3;
    }
    CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 160), v15, v23);
    CFRelease(v23);
  }
  CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 168), v15, v12);
  if (!a6 && v12)
  {
    CFRelease(v12);
  }
}

void DDResultSetContent(uint64_t *a1, void *a2)
{
  a1[9] = (uint64_t)DDScanQueryCopyRange((uint64_t)a2, a1[2], a1[3]);
  a1[4] = DDScanQueryComputeCFRangeForQueryRange((uint64_t)a2, a1[2]);
  a1[5] = v4;
  CFArrayRef v5 = (const __CFArray *)a1[7];
  if (v5)
  {
    v6.length = CFArrayGetCount(v5);
    v6.CFIndex location = 0;
    CFArrayApplyFunction(v5, v6, (CFArrayApplierFunction)DDResultSetContent, a2);
  }
}

CFStringRef DDScanQueryCopyRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t)(int)a2 >> 16;
  uint64_t v7 = (uint64_t)(int)a3 >> 16;
  uint64_t v30 = v7;
  if (v6 == v7)
  {
    uint64_t v8 = *(void *)(a1 + 16) + 48 * (int)v6;
    *(void *)uint64_t result = 0;
    *(void *)&result[8] = 0;
    if ((*(unsigned char *)(v8 + 43) & 0x60) == 0
      || (CFStringRef v9 = *(const __CFString **)v8,
          CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline),
          v38.CFIndex location = a2 >> 32,
          v38.length = (uint64_t)(a3 - (a2 & 0xFFFFFFFF00000000)) >> 32,
          !CFStringFindCharacterFromSet(v9, Predefined, v38, 0, (CFRange *)result)))
    {
      v40.CFIndex location = a2 >> 32;
      v40.length = (uint64_t)(a3 - (a2 & 0xFFFFFFFF00000000)) >> 32;
      return CFStringCreateWithSubstring(0, *(CFStringRef *)v8, v40);
    }
    uint64_t v7 = v30;
  }
  CFMutableStringRef theString = CFStringCreateMutable(0, 0);
  if (v6 <= v7)
  {
    uint64_t v11 = 0;
    uint64_t v28 = a3 >> 32;
    uint64_t v29 = a2 >> 32;
    uint64_t v12 = 48 * (int)v6 + 40;
    uint64_t v27 = v7 + 1;
    uint64_t v26 = v5;
    uint64_t v13 = v7;
    do
    {
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = v14 + v12;
      CFIndex v16 = v29;
      if (v11) {
        CFIndex v16 = *(void *)(v15 - 24);
      }
      uint64_t v17 = v28;
      if (v13 != v6) {
        uint64_t v17 = *(void *)(v14 + v12 - 16) + *(void *)(v14 + v12 - 24);
      }
      CFStringRef v18 = *(const __CFString **)(v15 - 40);
      if (v18) {
        CFIndex Length = CFStringGetLength(v18);
      }
      else {
        CFIndex Length = 0;
      }
      CFIndex v20 = v17 - v16;
      if (v17 <= Length) {
        goto LABEL_32;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      unint64_t v21 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t result = 134218752;
        *(void *)&result[4] = v16;
        *(_WORD *)&result[12] = 2048;
        *(void *)&result[14] = v17 - v16;
        __int16 v33 = 2048;
        uint64_t v34 = v17;
        __int16 v35 = 2048;
        CFIndex v36 = Length;
        _os_log_impl(&dword_19DC95000, v21, OS_LOG_TYPE_DEFAULT, "Inconsistent range {%ld, %ld} (i.e. max=%ld) for string of length %ld, trying to recover by truncating the string.", result, 0x2Au);
      }
      CFIndex v20 = Length - v16;
      uint64_t v5 = v26;
      if (Length >= v16)
      {
LABEL_32:
        if (v20 >= 1)
        {
          v39.CFIndex location = v16;
          v39.length = v20;
          CFStringRef v22 = CFStringCreateWithSubstring(0, *(CFStringRef *)(v15 - 40), v39);
          CFIndex v23 = CFStringGetLength(theString);
          CFStringAppend(theString, v22);
          CFRelease(v22);
          if ((*(unsigned char *)(v14 + v12 + 3) & 0x40) != 0)
          {
            v41.length = CFStringGetLength(theString) - v23;
            v41.CFIndex location = v23;
            CFStringFindAndReplace(theString, @"\r\n", @" ", v41, 0);
            v42.length = CFStringGetLength(theString) - v23;
            v42.CFIndex location = v23;
            CFStringFindAndReplace(theString, @"\n\r", @" ", v42, 0);
            v43.length = CFStringGetLength(theString) - v23;
            v43.CFIndex location = v23;
            CFStringFindAndReplace(theString, @"\n", @" ", v43, 0);
          }
        }
      }
      uint64_t v13 = v30;
      if (v6 < v30)
      {
        unsigned int v24 = ((*(_DWORD *)(v14 + v12) >> 26) & 7) - 1;
        if (v24 <= 3) {
          CFStringAppend(theString, *((CFStringRef *)&off_1E59851F8 + v24));
        }
      }
      ++v6;
      v12 += 48;
      --v11;
    }
    while (v27 != v6);
  }
  return theString;
}

uint64_t DDScanQueryComputeCFRangeForQueryRange(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == 1) {
    return a2 >> 32;
  }
  else {
    return *(void *)(*(void *)(a1 + 16) + 48 * ((int)a2 >> 16) + 32)
  }
         + (a2 >> 32)
         - *(void *)(*(void *)(a1 + 16) + 48 * ((int)a2 >> 16) + 16);
}

void DDResultSetValue(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3 = *(CFTypeRef *)(a1 + 80);
  if (v3 != cf)
  {
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 80) = 0;
    }
    if (cf) {
      *(void *)(a1 + 80) = CFRetain(cf);
    }
  }
}

const void *DDTypeForLRResult(unsigned __int16 a1, uint64_t a2)
{
  if ((a1 & 0x8000) != 0) {
    return 0;
  }
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  CFTypeRef v3 = (const void *)*(unsigned __int16 *)(v2 + 12 * a1);
  if (v3 == (const void *)0xFFFF) {
    return 0;
  }
  else {
    return DDLRTableGetUniqueSymbolStringAtOffset(a2, v3);
  }
}

BOOL DDResultsCanShareRange(CFStringRef *a1, CFStringRef *a2)
{
  BOOL v2 = 0;
  if (!a1 || !a2) {
    return v2;
  }
  if (!_typesAreEqual(a1[8], @"Compatibility") || !_typesAreEqual(a2[8], @"Compatibility")) {
    return 0;
  }
  CFStringRef v5 = a1[10];
  if (!v5) {
    CFStringRef v5 = a1[9];
  }
  CFStringRef v6 = a2[10];
  if (!v6) {
    CFStringRef v6 = a2[9];
  }
  BOOL v2 = 0;
  if (v5 && v6)
  {
    if (CFStringFind(v5, @"-", 0).location != -1 && CFStringFind(v6, @"-", 0).location != -1)
    {
      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v5, @"-");
      CFArrayRef v8 = CFStringCreateArrayBySeparatingStrings(0, v6, @"-");
      CFArrayRef v9 = v8;
      if (ArrayBySeparatingStrings && v8)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
        CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(v9, 0);
        if (CFStringCompare(ValueAtIndex, @"1", 0) && CFStringCompare(v11, @"1", 0))
        {
          BOOL v12 = 0;
        }
        else
        {
          CFStringRef v14 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
          CFStringRef v15 = (const __CFString *)CFArrayGetValueAtIndex(v9, 1);
          BOOL v12 = CFEqual(v14, v15);
        }
      }
      else
      {
        BOOL v12 = 0;
        BOOL v2 = 0;
        if (!ArrayBySeparatingStrings)
        {
LABEL_24:
          if (v9) {
            CFRelease(v9);
          }
          return v2;
        }
      }
      CFRelease(ArrayBySeparatingStrings);
      BOOL v2 = v12;
      goto LABEL_24;
    }
    return 0;
  }
  return v2;
}

uint64_t DDResultGetRangeForURLification(uint64_t a1)
{
  if (!a1) {
    return -1;
  }
  uint64_t v7 = 0;
  BOOL v2 = _DDGetRelevantResultsForUrlificationRange(a1, &v7);
  if (!v2) {
    return -1;
  }
  CFStringRef v3 = v2[4];
  if (DDResultGetCategory(a1) == 4)
  {
    CFStringRef v4 = *(const __CFString **)(a1 + 64);
    if (v4
      && (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"Date")
       || _typesAreEqual(v4, @"Time")
       || _typesAreEqual(v4, @"DateTime")))
    {
      uint64_t v5 = _DDGetRelevantSubResultRangeForResult(a1);
    }
    else
    {
      uint64_t v5 = -1;
    }
    if (v5 != -1) {
      return v5;
    }
  }
  return (uint64_t)v3;
}

const __CFString **_DDGetRelevantResultsForUrlificationRange(uint64_t a1, const __CFString ***a2)
{
  CFStringRef v4 = *(const __CFString **)(a1 + 64);
  if (_DDResultTypeIsAnyPhoneKind(v4))
  {
    uint64_t v5 = &DDBinderExtensionKey;
    CFStringRef v6 = @"Value";
LABEL_5:
    *a2 = DDResultGetSubresultWithType(a1, *v5);
    goto LABEL_6;
  }
  if (_typesAreEqual(v4, @"FlightInformation"))
  {
    uint64_t v5 = DDBinderFlightNumberKey;
    CFStringRef v6 = @"AirlineCode";
    goto LABEL_5;
  }
  if (!_typesAreEqual(v4, @"Email")) {
    return (const __CFString **)a1;
  }
  CFStringRef v6 = @"Value";
LABEL_6:

  return DDResultGetSubresultWithType(a1, v6);
}

BOOL _DDResultTypeIsAnyPhoneKind(const __CFString *a1)
{
  return _typesAreEqual(a1, @"PhoneNumber")
      || _typesAreEqual(a1, @"QuotedShortPhoneNumber")
      || _typesAreEqual(a1, @"UnquotedShortPhoneNumber");
}

void DDApplyOptions(const __CFArray *a1, void *a2, unsigned int a3)
{
  if (!a1) {
    return;
  }
  CFStringRef v3 = a2;
  CFArrayRef v4 = a1;
  if (a2[24]) {
    unsigned int v5 = a3 & 0xFFFFFFFD;
  }
  else {
    unsigned int v5 = a3;
  }
  unsigned int v99 = v5;
  DDUnwrapCompatibility(a1, 0);
  uint64_t v6 = v3[24];
  CFIndex Count = CFArrayGetCount(v4);
  if (Count >= 1)
  {
    CFIndex v8 = Count;
    BOOL v9 = 0;
    char v101 = 0;
    int v108 = 0;
    CFIndex v10 = 0;
    uint64_t v106 = v6 & 0x28000000;
    uint64_t v100 = -1;
    uint64_t v107 = -1;
    uint64_t v112 = -1;
    uint64_t v113 = -1;
    uint64_t v103 = v3;
    CFArrayRef v116 = v4;
    while (1)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v4, v10);
      uint64_t v12 = (uint64_t)ValueAtIndex;
      uint64_t v114 = *((void *)ValueAtIndex + 6);
      uint64_t v110 = *((void *)ValueAtIndex + 4);
      uint64_t v111 = *((void *)ValueAtIndex + 5);
      BOOL v13 = v10 > 0 && v113 == *((void *)ValueAtIndex + 4);
      BOOL v14 = v13 && v112 == *((void *)ValueAtIndex + 5);
      BOOL v15 = v14;
      CFComparisonResult v16 = CFStringCompare(*((CFStringRef *)ValueAtIndex + 8), @"Tag", 0);
      BOOL v115 = v16 != kCFCompareEqualTo;
      if (_typesAreEqual(*(CFStringRef *)(v12 + 64), @"Data")) {
        break;
      }
      if (v106) {
        BOOL v46 = 0;
      }
      else {
        BOOL v46 = v15;
      }
      if (v46 && v16 == kCFCompareEqualTo && !v9)
      {
        if (v108 || v107 >= v114)
        {
          CFArrayRemoveValueAtIndex(v4, v10);
          goto LABEL_113;
        }
        CFArrayRemoveValueAtIndex(v4, v10 - 1);
        CFIndex v8 = CFArrayGetCount(v4);
        int v108 = 0;
        uint64_t v112 = v111;
        uint64_t v113 = v110;
        uint64_t v107 = v114;
      }
      else
      {
        int v108 = 0;
        char v101 = 0;
        ++v10;
        uint64_t v100 = -1;
        uint64_t v112 = v111;
        uint64_t v113 = v110;
        uint64_t v107 = v114;
      }
LABEL_114:
      BOOL v9 = v115;
      if (v10 >= v8) {
        goto LABEL_129;
      }
    }
    UnwrappedResultOfType = (__CFString *)DDResultGetUnwrappedResultOfType(v12, @"Data");
    TagTypeForDataType = DDResultGetTagTypeForDataType(UnwrappedResultOfType);
    SubresultWithType = DDResultGetSubresultWithType((uint64_t)UnwrappedResultOfType, TagTypeForDataType);
    BOOL v117 = SubresultWithType == 0;
    unint64_t v125 = UnwrappedResultOfType;
    if (SubresultWithType) {
      CFIndex v20 = SubresultWithType;
    }
    else {
      CFIndex v20 = UnwrappedResultOfType;
    }
    uint64_t v119 = (uint64_t)v20;
    CFIndex v21 = CFArrayGetCount(v4);
    CFIndex v22 = v10 - 1;
    CFIndex idx = v10;
    CFIndex v23 = v10 + 1;
    CFIndex v104 = v10 + 1;
    CFIndex v102 = v10 - 1;
    BOOL v105 = v15;
    CFIndex v121 = v21;
    uint64_t v123 = v12;
    while (1)
    {
      if (v22 < 0) {
        unsigned int v24 = 0;
      }
      else {
        unsigned int v24 = CFArrayGetValueAtIndex(v4, v22);
      }
      if (v23 < v21) {
        unint64_t v25 = CFArrayGetValueAtIndex(v4, v23);
      }
      else {
        unint64_t v25 = 0;
      }
      uint64_t VirtualDistance = DDResultGetVirtualDistance(v12, (uint64_t)v24);
      uint64_t v27 = DDResultGetVirtualDistance(v12, (uint64_t)v25);
      uint64_t v28 = v27;
      uint64_t v127 = VirtualDistance;
      BOOL v29 = v22 >= 0 && VirtualDistance <= 1000;
      int v30 = !v29;
      BOOL v32 = v23 >= v21 || v27 > 1000;
      if (v30) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = (uint64_t)v24;
      }
      if (v32) {
        unint64_t v25 = 0;
      }
      BOOL v34 = DDShouldPauseSearchForTag(v30, (uint64_t)v125, v33);
      BOOL v35 = DDShouldPauseSearchForTag(v32, (uint64_t)v125, (uint64_t)v25);
      if (!v34 || !v35)
      {
        v22 += (char)(v34 - 1);
        if (!v35) {
          ++v23;
        }
        goto LABEL_74;
      }
      v129[0] = 0;
      CFStringRef v37 = DDGetDataValueForMatchingTagToData(v33, (const __CFString **)v119, v117, (unsigned char *)v129 + 1);
      CFStringRef v38 = DDGetDataValueForMatchingTagToData((uint64_t)v25, (const __CFString **)v119, v117, v129);
      if (v37 && v38)
      {
        if (v127 <= v28) {
          CFStringRef v49 = v37;
        }
        else {
          CFStringRef v49 = v38;
        }
        if (v127 <= v28) {
          BOOL v50 = (char *)v129 + 1;
        }
        else {
          BOOL v50 = (char *)v129;
        }
        if (v127 >= v28) {
          uint64_t v51 = v28;
        }
        else {
          uint64_t v51 = v127;
        }
        uint64_t v52 = v4;
LABEL_102:
        DDUpdateDataWithMatchedTag(v52, idx, v125, v119, v49);
        char v53 = !v105;
        if (v106) {
          char v53 = 1;
        }
        if ((v53 & 1) == 0)
        {
          if (!*v50 && v101) {
            goto LABEL_75;
          }
          if (*v50 == v101)
          {
            if (v51 <= v100 && (v51 != v100 || v107 < v114))
            {
              int v108 = 1;
              goto LABEL_128;
            }
LABEL_75:
            CFIndex v10 = idx;
            CFIndex v45 = idx;
          }
          else
          {
            int v108 = 1;
            char v101 = *v50;
LABEL_128:
            uint64_t v107 = v114;
            uint64_t v100 = v51;
            CFIndex v10 = idx;
            CFIndex v45 = v102;
          }
          CFArrayRemoveValueAtIndex(v4, v45);
          goto LABEL_77;
        }
        int v108 = 1;
        CFIndex v10 = v104;
        uint64_t v112 = v111;
        uint64_t v113 = v110;
        char v101 = *v50;
        uint64_t v107 = v114;
        uint64_t v100 = v51;
LABEL_77:
        CFStringRef v3 = v103;
LABEL_113:
        CFIndex v8 = CFArrayGetCount(v4);
        goto LABEL_114;
      }
      if (!((unint64_t)v37 | (unint64_t)v38)) {
        break;
      }
      if (v119)
      {
        CFStringRef v39 = v38;
        CFStringRef v40 = *(const __CFString **)(v119 + 80);
        if (!v40) {
          CFStringRef v40 = *(const __CFString **)(v119 + 72);
        }
      }
      else
      {
        CFStringRef v39 = v38;
        CFStringRef v40 = 0;
      }
      BOOL v41 = CFStringFind(v40, @"-", 0).location == -1 && CFStringFind(v40, @"Generic", 0).location == -1;
      CFArrayRef v4 = v116;
      int v42 = !v41;
      if (!v33 || !v42 || !v39 || v127 >= v28)
      {
        char v43 = v42 ^ 1;
        if (!v37) {
          char v43 = 1;
        }
        if ((v43 & 1) != 0 || !v25 || v28 >= v127)
        {
          if (v37) {
            CFStringRef v49 = v37;
          }
          else {
            CFStringRef v49 = v39;
          }
          if (v37) {
            BOOL v50 = (char *)v129 + 1;
          }
          else {
            BOOL v50 = (char *)v129;
          }
          if (v37) {
            uint64_t v51 = v127;
          }
          else {
            uint64_t v51 = v28;
          }
          uint64_t v52 = v116;
          goto LABEL_102;
        }
        goto LABEL_73;
      }
      v22 -= v30 ^ 1u;
LABEL_74:
      char v44 = v30 & v32;
      CFIndex v21 = v121;
      uint64_t v12 = v123;
      if (v44) {
        goto LABEL_75;
      }
    }
    v22 -= v30 ^ 1u;
LABEL_73:
    v23 += !v32;
    goto LABEL_74;
  }
LABEL_129:
  DDUnwrapCompatibility(v4, 1);
  CFIndex v54 = CFArrayGetCount(v4);
  if (v54 >= 1)
  {
    CFIndex v55 = v54;
    CFIndex v56 = 0;
    do
    {
      int64_t v57 = (CFStringRef *)CFArrayGetValueAtIndex(v4, v56);
      if (v57 && _typesAreEqual(v57[8], @"Tag"))
      {
        CFArrayRemoveValueAtIndex(v4, v56);
        CFIndex v55 = CFArrayGetCount(v4);
      }
      else
      {
        ++v56;
      }
    }
    while (v56 < v55);
  }
  CFIndex v58 = CFArrayGetCount(v4);
  if (v58 >= 1)
  {
    CFIndex v59 = v58;
    CFIndex v60 = 0;
    do
    {
      CFIndex v61 = (CFStringRef *)CFArrayGetValueAtIndex(v4, v60);
      if (v61 && (uint64_t v62 = (uint64_t)v61, _typesAreEqual(v61[8], @"TrackingInformation")))
      {
        int v63 = DDResultGetSubresultWithType(v62, @"Carrier");
        uint64_t v64 = DDResultGetSubresultWithType(v62, @"TrackingNumber");
        if (v63 && v64)
        {
          CFStringRef v65 = v63[10];
          if (!v65) {
            CFStringRef v65 = v63[9];
          }
          DDResultSetType((uint64_t)v64, v65);
          DDResultRemoveSubresultWithType(v62, @"Carrier");
          DDResultSetType(v62, @"TrackingNumber");
        }
      }
      else
      {
        ++v60;
      }
    }
    while (v60 < v59);
  }
  uint64_t v128 = CFArrayGetCount(v4);
  __int16 v66 = v99;
  if (v128 < 1) {
    return;
  }
  CFAllocatorRef v67 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 7, 0);
  uint64_t v69 = Mutable;
  if ((v99 & 0x20000) != 0)
  {
    unsigned int v70 = v99 & 0xFFFDFFFF;
  }
  else
  {
    CFArrayAppendValue(Mutable, &__block_literal_global_215_2211);
    unsigned int v70 = v99;
  }
  if ((*(void *)&v70 & 0x10005) != 0) {
    CFArrayAppendValue(v69, &__block_literal_global_206);
  }
  if ((v70 & 0x10000) == 0)
  {
    if ((v70 & 1) == 0) {
      goto LABEL_155;
    }
LABEL_158:
    CFArrayAppendValue(v69, &__block_literal_global_197);
    v70 &= ~1u;
    if (!v69) {
      goto LABEL_163;
    }
    goto LABEL_159;
  }
  CFArrayAppendValue(v69, &__block_literal_global_203);
  v70 &= ~0x10000u;
  if (v70) {
    goto LABEL_158;
  }
LABEL_155:
  if (!v69) {
    goto LABEL_163;
  }
LABEL_159:
  CFIndex v71 = CFArrayGetCount(v69);
  if (v71 >= 1)
  {
    CFIndex v72 = v71;
    for (CFIndex i = 0; i != v72; ++i)
    {
      uint64_t v74 = (void (**)(const void *, const __CFArray *, void *))CFArrayGetValueAtIndex(v69, i);
      v74[2](v74, v4, v3);
    }
  }
  CFIndex v75 = CFArrayGetCount(v4);
  CFRelease(v69);
  uint64_t v128 = v75;
  BOOL v29 = v75 < 1;
  __int16 v66 = v99;
  if (!v29)
  {
LABEL_163:
    uint64_t v76 = CFArrayCreateMutable(v67, 9, 0);
    unint64_t v77 = v76;
    if ((v70 & 0x400) != 0)
    {
      CFArrayAppendValue(v76, &__block_literal_global_187);
      v70 &= ~0x400u;
      if ((v70 & 0x800) == 0)
      {
LABEL_165:
        if ((v70 & 0x40) == 0) {
          goto LABEL_166;
        }
        goto LABEL_191;
      }
    }
    else if ((v70 & 0x800) == 0)
    {
      goto LABEL_165;
    }
    CFArrayAppendValue(v77, &__block_literal_global_190);
    v70 &= ~0x800u;
    if ((v70 & 0x40) == 0)
    {
LABEL_166:
      if ((v70 & 0x1000) == 0) {
        goto LABEL_167;
      }
      goto LABEL_192;
    }
LABEL_191:
    CFArrayAppendValue(v77, &__block_literal_global_67);
    v70 &= ~0x40u;
    if ((v70 & 0x1000) == 0)
    {
LABEL_167:
      if ((v70 & 0x10) == 0) {
        goto LABEL_168;
      }
      goto LABEL_193;
    }
LABEL_192:
    CFArrayAppendValue(v77, &__block_literal_global_193);
    v70 &= ~0x1000u;
    if ((v70 & 0x10) == 0)
    {
LABEL_168:
      if ((v70 & 8) == 0) {
        goto LABEL_169;
      }
      goto LABEL_194;
    }
LABEL_193:
    CFArrayAppendValue(v77, &__block_literal_global_73);
    v70 &= ~0x10u;
    if ((v70 & 8) == 0)
    {
LABEL_169:
      if ((v70 & 0x80) == 0) {
        goto LABEL_170;
      }
      goto LABEL_195;
    }
LABEL_194:
    CFArrayAppendValue(v77, &__block_literal_global_76);
    v70 &= ~8u;
    if ((v70 & 0x80) == 0)
    {
LABEL_170:
      if ((v70 & 0x200) == 0) {
        goto LABEL_172;
      }
      goto LABEL_171;
    }
LABEL_195:
    CFArrayAppendValue(v77, &__block_literal_global_70);
    v70 &= ~0x80u;
    if ((v70 & 0x200) == 0)
    {
LABEL_172:
      CFArrayAppendValue(v77, &__block_literal_global_2056);
      if (!v77) {
        goto LABEL_198;
      }
      CFIndex v78 = CFArrayGetCount(v77);
      if (v78 <= 0)
      {
        CFRelease(v77);
        goto LABEL_198;
      }
      CFIndex v79 = v78;
      CFIndex v80 = (const void *)v3[30];
      if (!v80)
      {
        uint64_t v98 = v3[5];
        if (!v98 || (CFIndex v80 = *(const void **)(v98 + 8)) == 0)
        {
          if ((v66 & 0x200) == 0)
          {
            CFArrayRef v81 = v4;
            CFIndex v80 = 0;
LABEL_222:
            uint64_t v82 = 0;
            char v83 = 1;
LABEL_176:
            BOOL v126 = CFArrayCreateMutable(v67, v128, MEMORY[0x1E4F1D510]);
            if (v126)
            {
              char v118 = v83;
              uint64_t v120 = v80;
              CFAllocatorRef v122 = v67;
              CFIndex v84 = 0;
              char v124 = v70;
              uint64_t v85 = (v70 >> 8) & 1;
              do
              {
                uint64_t v86 = CFArrayGetValueAtIndex(v81, v84);
                CFIndex v87 = 0;
                uint64_t v88 = v86[8];
                while (1)
                {
                  CFBooleanRef v89 = CFArrayGetValueAtIndex(v77, v87);
                  if (((*((uint64_t (**)(const void *, void *, uint64_t, void *, uint64_t, uint64_t))v89 + 2))(v89, v86, v88, v3, v82, v85) & 1) == 0)break; {
                  if (v79 == ++v87)
                  }
                  {
                    CFArrayAppendValue(v126, v86);
                    break;
                  }
                }
                ++v84;
              }
              while (v84 != v128);
              CFIndex v90 = CFArrayGetCount(v126);
              CFArrayRef v4 = v81;
              if (v90 != v128)
              {
                CFIndex v91 = v90;
                CFArrayRemoveAllValues(v81);
                v131.CFIndex location = 0;
                v131.length = v91;
                CFArrayAppendArray(v81, v126, v131);
              }
              CFRelease(v126);
              uint64_t v128 = CFArrayGetCount(v81);
              CFAllocatorRef v67 = v122;
              LOBYTE(v70) = v124;
              CFIndex v80 = v120;
              if ((v118 & 1) == 0) {
                goto LABEL_186;
              }
            }
            else
            {
              CFArrayRef v4 = v81;
              if ((v83 & 1) == 0) {
LABEL_186:
              }
                CFRelease(v80);
            }
            CFRelease(v77);
            if (v128 < 1) {
              return;
            }
LABEL_198:
            int v92 = CFArrayCreateMutable(v67, 7, 0);
            uint64_t v93 = v92;
            if ((v70 & 2) != 0)
            {
              CFArrayAppendValue(v92, &__block_literal_global_200);
              LOBYTE(v70) = v70 & 0xFD;
              if ((v70 & 4) == 0)
              {
LABEL_200:
                if ((v70 & 0x20) == 0) {
                  goto LABEL_201;
                }
                goto LABEL_210;
              }
            }
            else if ((v70 & 4) == 0)
            {
              goto LABEL_200;
            }
            CFArrayAppendValue(v93, &__block_literal_global_209);
            if ((v70 & 0x20) == 0)
            {
LABEL_201:
              if (!v93) {
                return;
              }
LABEL_202:
              CFIndex v94 = CFArrayGetCount(v93);
              if (v94 >= 1)
              {
                CFIndex v95 = v94;
                for (CFIndex j = 0; j != v95; ++j)
                {
                  uint64_t v97 = (void (**)(const void *, const __CFArray *, void *))CFArrayGetValueAtIndex(v93, j);
                  v97[2](v97, v4, v3);
                }
              }
              CFRelease(v93);
              return;
            }
LABEL_210:
            CFArrayAppendValue(v93, &__block_literal_global_212_2258);
            if (!v93) {
              return;
            }
            goto LABEL_202;
          }
          if (getLocaleForExtraction_sOnce != -1) {
            dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
          }
          CFIndex v80 = (const void *)_sLocaleForExtraction;
          if (!_sLocaleForExtraction)
          {
            CFArrayRef v81 = v4;
            goto LABEL_222;
          }
        }
      }
      CFArrayRef v81 = v4;
      CFRetain(v80);
      uint64_t v82 = MEMORY[0x19F3B1BA0](v80);
      char v83 = 0;
      goto LABEL_176;
    }
LABEL_171:
    CFArrayAppendValue(v77, &__block_literal_global_79);
    v70 &= ~0x200u;
    goto LABEL_172;
  }
}

BOOL DDDeletionFilterBlocks_block_invoke_7(int a1, int a2, CFStringRef theString)
{
  return !_typesAreEqual(theString, @"NoResult");
}

uint64_t DDDeletionFilterBlocks_block_invoke_6(int a1, const __CFString *a2, const __CFString *a3, int a4, CFStringRef theString)
{
  if (!theString) {
    return 1;
  }
  if (CFStringHasPrefix(theString, @"de")
    || CFStringHasPrefix(theString, @"nl")
    || CFStringHasPrefix(theString, @"is"))
  {
    if (_typesAreEqual(a3, @"Time"))
    {
      if (a2) {
        CFStringRef info = (const __CFString *)a2[2].info;
      }
      else {
        CFStringRef info = 0;
      }
      unint64_t v11 = CFStringGetLength(info) & 0xFFFFFFFFFFFFFFFELL;
      if (v11 == 6)
      {
        if (CFStringHasPrefix(info, @"Alle ") || CFStringHasPrefix(info, @"alle ")) {
          return 0;
        }
      }
      else if (v11 == 4 && CFStringHasSuffix(info, @" am"))
      {
        return 0;
      }
LABEL_23:
      if (CFStringHasPrefix(theString, @"pl") || !_typesAreEqual(a3, @"WebURL")) {
        return 1;
      }
      if (a2) {
        a2 = (const __CFString *)a2[2].info;
      }
      return CFStringHasPrefix(a2, @"www")
          || CFStringHasPrefix(a2, @"WWW")
          || CFStringHasPrefix(a2, @"Www")
          || !CFStringHasSuffix(a2, @".pl");
    }
    if (!_typesAreEqual(a3, @"Date")) {
      goto LABEL_23;
    }
    CFStringRef v10 = a2 ? (const __CFString *)a2[2].info : 0;
    if (CFStringGetLength(v10) != 4) {
      goto LABEL_23;
    }
    uint64_t result = CFStringCompare(v10, @"Hier", 1uLL);
    if (result) {
      goto LABEL_23;
    }
    return result;
  }
  if (CFStringHasPrefix(theString, @"fr"))
  {
    if (!_typesAreEqual(a3, @"WebURL")) {
      goto LABEL_23;
    }
    CFStringRef v12 = a2 ? (const __CFString *)a2[2].info : 0;
    if (CFStringHasPrefix(v12, @"www")
      || CFStringHasPrefix(v12, @"WWW")
      || CFStringHasPrefix(v12, @"Www"))
    {
      goto LABEL_23;
    }
    if (CFStringHasSuffix(v12, @".la"))
    {
      uint64_t result = CFStringHasSuffix(theString, @"LA");
      if (!result) {
        return result;
      }
    }
    if (CFStringHasSuffix(v12, @".il"))
    {
      uint64_t result = CFStringHasSuffix(theString, @"IL");
      if (!result) {
        return result;
      }
    }
    if (CFStringHasSuffix(v12, @".sa"))
    {
      uint64_t result = CFStringHasSuffix(theString, @"SA");
      if (!result) {
        return result;
      }
    }
    if (!CFStringHasSuffix(v12, @".va")) {
      goto LABEL_23;
    }
    CFStringRef v15 = @"VA";
    goto LABEL_72;
  }
  if (!CFStringHasPrefix(theString, @"en"))
  {
    if (CFStringHasPrefix(theString, @"zh") || CFStringHasPrefix(theString, @"yue"))
    {
      uint64_t v14 = 0x10000;
    }
    else
    {
      if (!CFStringHasPrefix(theString, @"ja")) {
        goto LABEL_23;
      }
      uint64_t v14 = 0x20000;
    }
    a2[3].isa = (void *)((uint64_t)a2[3].isa | v14);
    goto LABEL_23;
  }
  if (!_typesAreEqual(a3, @"WebURL")) {
    goto LABEL_23;
  }
  CFStringRef v13 = a2 ? (const __CFString *)a2[2].info : 0;
  if (CFStringHasPrefix(v13, @"www")
    || CFStringHasPrefix(v13, @"WWW")
    || CFStringHasPrefix(v13, @"Www"))
  {
    goto LABEL_23;
  }
  if (!CFStringHasSuffix(v13, @".in") || (uint64_t result = CFStringHasSuffix(theString, @"IN"), result))
  {
    if (!CFStringHasSuffix(v13, @".be") || (uint64_t result = CFStringHasSuffix(theString, @"BE"), result))
    {
      if (!CFStringHasSuffix(v13, @".it") || (uint64_t result = CFStringHasSuffix(theString, @"IT"), result))
      {
        if (!CFStringHasSuffix(v13, @".to")
          || (uint64_t result = CFStringHasSuffix(theString, @"TO"), result))
        {
          if (!CFStringHasSuffix(v13, @".my")) {
            goto LABEL_23;
          }
          CFStringRef v15 = @"MY";
LABEL_72:
          uint64_t result = CFStringHasSuffix(theString, v15);
          if (result) {
            goto LABEL_23;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DDDeletionFilterBlocks_block_invoke_3()
{
  return 1;
}

uint64_t DDDeletionFilterBlocks_block_invoke_2(int a1, uint64_t a2, CFStringRef theString, uint64_t a4, uint64_t a5, int a6)
{
  if (_typesAreEqual(theString, @"DateTime"))
  {
    CFArrayRef v9 = *(const __CFArray **)(a2 + 56);
    if (CFArrayGetCount(v9) != 1
      || (CFStringRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v9, 0)) == 0
      || !_typesAreEqual(ValueAtIndex[8], @"SpecialDateTime"))
    {
      SubresultWithType = DDResultGetSubresultWithType(a2, @"Time");
      if (!SubresultWithType || !timeIsTimeStamp((uint64_t)SubresultWithType)) {
        return 1;
      }
    }
LABEL_12:
    if (!a6) {
      return 0;
    }
    *(void *)(a2 + 96) &= ~1uLL;
    return 1;
  }
  if (_typesAreEqual(theString, @"Time"))
  {
    if (timeIsTimeStamp(a2)) {
      goto LABEL_12;
    }
    CFStringRef v12 = *(CFStringRef **)(a2 + 56);
LABEL_11:
    if (timeIsApprox(v12)) {
      goto LABEL_12;
    }
    return 1;
  }
  if (_typesAreEqual(theString, @"Date"))
  {
    uint64_t v14 = (CFStringRef *)a2;
    while (1)
    {
      CFArrayRef v15 = (const __CFArray *)v14[7];
      if (!v15 || CFArrayGetCount(v15) != 1) {
        return 1;
      }
      CFComparisonResult v16 = (CFStringRef *)CFArrayGetValueAtIndex(v15, 0);
      uint64_t v14 = v16;
      if (v16)
      {
        if (_typesAreEqual(v16[8], @"DayOfWeek")) {
          goto LABEL_12;
        }
        if (_typesAreEqual(v14[8], @"RelativeDay"))
        {
          int v23 = 0;
          CFStringRef v17 = v14[10];
          if (!v17) {
            CFStringRef v17 = v14[9];
          }
          if (!DDFastIntegerExtraction(v17, &v23)) {
            goto LABEL_12;
          }
          unsigned int v18 = v23;
          if (v23 < 0) {
            unsigned int v18 = -v23;
          }
          if (v18 <= 1) {
            goto LABEL_12;
          }
          return 1;
        }
      }
    }
  }
  if (!_typesAreEqual(theString, @"TimeDuration") || CFArrayGetCount(*(CFArrayRef *)(a2 + 56)) != 2) {
    return 1;
  }
  unint64_t v19 = DDResultGetSubresultWithType(a2, @"BeginTime");
  CFIndex v20 = DDResultGetSubresultWithType(a2, @"EndTime");
  uint64_t result = 1;
  if (v19)
  {
    if (v20)
    {
      CFIndex v21 = DDResultGetSubresultWithType((uint64_t)v19, @"Time");
      CFIndex v22 = DDResultGetSubresultWithType((uint64_t)v20, @"Time");
      uint64_t result = 1;
      if (v21)
      {
        if (v22)
        {
          if (!timeIsApprox((CFStringRef *)v21[7])) {
            return 1;
          }
          CFStringRef v12 = (CFStringRef *)v22[7];
          goto LABEL_11;
        }
      }
    }
  }
  return result;
}

const __CFString **DDResultGetSubresultWithType(uint64_t a1, const __CFString *a2)
{
  if (!a1) {
    return 0;
  }
  CFArrayRef v3 = *(const __CFArray **)(a1 + 56);
  if (!v3) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1) {
    return 0;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString **)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v7);
    if (_typesAreEqual(a2, ValueAtIndex[8])) {
      break;
    }
    if (v6 == ++v7) {
      return 0;
    }
  }
  return ValueAtIndex;
}

BOOL _typesAreEqual(CFStringRef theString, const __CFString *a2)
{
  BOOL result = 0;
  if (theString && a2)
  {
    if (theString == a2)
    {
      return 1;
    }
    else
    {
      CFIndex Length = CFStringGetLength(theString);
      if (Length == CFStringGetLength(a2))
      {
        v6.CFIndex location = 0;
        v6.length = Length;
        return CFStringCompareWithOptionsAndLocale(theString, a2, v6, 0, 0) == kCFCompareEqualTo;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t DDDeletionFilterBlocks_block_invoke(int a1, const __CFString *info, CFStringRef theString1, uint64_t a4, const __CFString *a5)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (CFStringCompare(theString1, @"PhoneNumber", 0))
  {
    if (CFEqual(theString1, @"FlightInformation"))
    {
      SubresultWithType = DDResultGetSubresultWithType((uint64_t)info, @"AirlineCode");
      if (SubresultWithType)
      {
        CFStringRef v9 = SubresultWithType[10];
        if (!v9) {
          CFStringRef v9 = SubresultWithType[9];
        }
      }
      else
      {
        CFStringRef v9 = 0;
      }
      CFStringRef v13 = DDResultGetSubresultWithType((uint64_t)info, @"FlightNumber");
      if (!v13) {
        return 0;
      }
      CFStringRef v14 = v13[10];
      if (!v14) {
        CFStringRef v14 = v13[9];
      }
      if (!v9
        || !v14
        || CFEqual(v9, @"MH")
        && (CFEqual(v14, @"17")
         || CFEqual(v14, @"370")
         || CFEqual(v14, @"371"))
        || CFEqual(v9, @"BA")
        && CFEqual(v14, @"1")
        || CFEqual(v9, @"UA")
        && CFEqual(v14, @"93")
        || CFEqual(v9, @"AA")
        && CFEqual(v14, @"77"))
      {
        return 0;
      }
      if (info) {
        CFStringRef info = (const __CFString *)info[2].info;
      }
      if (CFEqual(info, @"A300")
        || CFEqual(info, @"A318")
        || CFEqual(info, @"A319")
        || CFEqual(info, @"A320")
        || CFEqual(info, @"A321")
        || CFEqual(info, @"A330")
        || CFEqual(info, @"A340")
        || CFEqual(info, @"A350")
        || CFEqual(info, @"A380"))
      {
        return 0;
      }
    }
    return 1;
  }
  CFArrayRef length = (const __CFArray *)info[1].length;
  if (!length) {
    return 1;
  }
  if (CFArrayGetCount(length) != 1) {
    return 1;
  }
  CFStringRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(length, 0);
  if (CFStringCompare(ValueAtIndex[8], @"Value", 0)) {
    return 1;
  }
  CFStringRef v15 = ValueAtIndex[9];
  CFIndex v16 = CFStringGetLength(v15);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u);
  MEMORY[0x1F4188790](MaximumSizeForEncoding);
  unint64_t v19 = (char *)v21 - v18;
  v22.CFIndex location = 0;
  v22.CFArrayRef length = v16;
  CFStringGetCharacters(v15, v22, (UniChar *)((char *)v21 - v18));
  if (a5) {
    BOOL v20 = CFStringHasSuffix(a5, @"BR") != 0;
  }
  else {
    BOOL v20 = 0;
  }
  return DDResultBufferIsValidForPhoneNumber((uint64_t)v19, 0, v16, 0, v20);
}

void DDUnwrapCompatibility(const __CFArray *a1, int a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    uint64_t v5 = Count;
    CFIndex v6 = 0;
    do
    {
      CFStringRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(a1, v6);
      if (ValueAtIndex)
      {
        CFIndex v8 = ValueAtIndex;
        if (_typesAreEqual(ValueAtIndex[8], @"Compatibility"))
        {
          CFArrayRef v9 = (const __CFArray *)v8[7];
          CFIndex v10 = CFArrayGetCount(v9);
          uint64_t v11 = v10;
          if (a2 || v10 != 1)
          {
            CFArrayRemoveValueAtIndex(a1, v6);
            if (v11 < 1)
            {
              --v5;
            }
            else
            {
              for (CFIndex i = 0; i != v11; ++i)
              {
                CFStringRef v14 = CFArrayGetValueAtIndex(v9, i);
                CFArrayInsertValueAtIndex(a1, v6 + i, v14);
              }
              v6 += i;
              uint64_t v5 = v11 + v5 - 1;
            }
            continue;
          }
          CFStringRef v12 = CFArrayGetValueAtIndex(v9, 0);
          CFArraySetValueAtIndex(a1, v6, v12);
        }
      }
      ++v6;
    }
    while (v6 < v5);
  }
}

uint64_t DDResultBufferIsValidForPhoneNumber(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t result = 1;
  if (!a1 || a3 < 1) {
    return result;
  }
  uint64_t v8 = a2;
  if (!a4 && (unint64_t)a3 <= 8)
  {
    int v9 = *(unsigned __int16 *)(a1 + 2 * a2);
    BOOL v10 = v9 == 48 && a3 == 3;
    char v11 = v10;
    if (v10 || v9 != 48)
    {
      if (a2 < 4) {
        char v11 = 1;
      }
      if ((v11 & 1) == 0) {
        goto LABEL_82;
      }
      return result;
    }
    if ((unint64_t)a3 >= 2)
    {
      uint64_t v12 = a2 + 1;
      while (1)
      {
        int v13 = *(unsigned __int16 *)(a1 + 2 * v12);
        if ((v13 - 58) <= 0xFFFFFFF5 && v13 != 42 && v13 != 35) {
          break;
        }
        if (++v12 >= a2 + a3) {
          return 0;
        }
      }
      return 1;
    }
    return 0;
  }
  if ((unint64_t)(a3 - 10) > 0xE) {
    goto LABEL_81;
  }
  uint64_t v14 = 0;
  int v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = a2 + a3;
  char v23 = 1;
  do
  {
    int v24 = *(unsigned __int16 *)(a1 + 2 * a2 + 2 * v14);
    if (v21 >= 14 && a2 + v14 == v21 && v18 <= 1)
    {
      uint64_t result = 0;
      if ((unint64_t)(a2 + v14) > 0x10 || v18 != 1) {
        return result;
      }
      if (*(_WORD *)(a1 + 2) != 49 || *(_WORD *)(a1 + 4) != 49) {
        return 0;
      }
    }
    if (v24 == 45)
    {
      v19 |= v17;
      if (v19) {
        return 1;
      }
      uint64_t v17 = 0;
      char v23 = 0;
      ++v20;
      unsigned int v25 = 10;
      uint64_t v16 = v21;
    }
    else
    {
      if ((v24 - 48) <= 9)
      {
        unsigned int v25 = v24 - 48;
        if (v21 <= 12) {
          v45[v21] = v25;
        }
        ++v21;
        if (v14 == v18 && v24 == 48) {
          ++v18;
        }
        goto LABEL_52;
      }
      if (v24 == 32)
      {
        char v23 = 0;
        v15 |= (unint64_t)(v21 - 1) < 4;
LABEL_49:
        unsigned int v25 = 10;
        goto LABEL_52;
      }
      if (v24 != 47)
      {
        if (v24 != 46) {
          return 1;
        }
        uint64_t result = 1;
        if (v20 || v17 || v21 != 10) {
          return result;
        }
        uint64_t v20 = 0;
        uint64_t v17 = 0;
        ++v19;
        goto LABEL_49;
      }
      if (v17 > 0) {
        return 0;
      }
      unsigned int v25 = 10;
      uint64_t v17 = 1;
    }
LABEL_52:
    ++v14;
  }
  while (a2 + v14 < v22);
  if (v19 == 1)
  {
    if ((v23 & 1) == 0) {
      goto LABEL_80;
    }
    return 0;
  }
  if (!v19 && (v21 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    BOOL v27 = v21 == 12 && v18 == 1;
    BOOL v28 = v27;
    if (v25 <= 9 && !v28)
    {
      BOOL v29 = v20 == 1 && v21 == 13;
      BOOL v30 = v29;
      if ((*(_WORD *)(a1 + 2 * v22 - 4) == 45 || v21 == a3 || v30) && DDIsValidEAN13OrUPCA((uint64_t)v45, v21)) {
        return 0;
      }
    }
  }
LABEL_80:
  if (!a5 && v22 <= 12 && ((v15 ^ 1) & 1) != 0 && v20 == 1 && v21 == 9 && v16 == 5) {
    return 0;
  }
LABEL_81:
  if (v8 >= 4)
  {
LABEL_82:
    if ((unint64_t)v8 >= 0xA) {
      uint64_t v31 = v8 - 10;
    }
    else {
      uint64_t v31 = 0;
    }
    if (v8 > (unint64_t)v31)
    {
      do
      {
        uint64_t v32 = v8 - 1;
        unsigned int v33 = *(unsigned __int16 *)(a1 - 2 + 2 * v8);
        BOOL v34 = v33 > 0x3A;
        uint64_t v35 = (1 << v33) & 0x400000100000200;
        if (v34 || v35 == 0)
        {
          uint64_t v37 = 0;
          while (1)
          {
            int64_t v38 = strlen(DDResultBufferIsValidForPhoneNumber_labelsSuffixes[v37]);
            if (v32 - v31 >= v38)
            {
              uint64_t v39 = v38;
              uint64_t result = 0;
              if (v8 <= v31 || v39 < 2) {
                return result;
              }
              uint64_t v40 = v8 - 1;
              while (1)
              {
                int v41 = *(unsigned __int16 *)(a1 + 2 * v40);
                int v42 = (unsigned __int16)DDResultBufferIsValidForPhoneNumber_labelsSuffixes[v37][v39 - 1];
                if (v42 != v41 && v42 + 32 != v41) {
                  break;
                }
                uint64_t result = 0;
                if (v40 > v31)
                {
                  --v40;
                  if ((unint64_t)v39-- >= 3) {
                    continue;
                  }
                }
                return result;
              }
            }
            ++v37;
            uint64_t result = 1;
            if (v37 == 14) {
              return result;
            }
          }
        }
        --v8;
      }
      while (v32 > v31);
    }
  }
  return 1;
}

uint64_t DDFastIntegerExtraction(const __CFString *a1, _DWORD *a2)
{
  uint64_t v6 = 0;
  if (DDExtractSimpleInteger(a1, &v6))
  {
    int v4 = v6;
    if (v6 == (int)v6) {
      goto LABEL_5;
    }
  }
  uint64_t result = DDExtractKanjiNumber(a1, &v6);
  if (!result) {
    return result;
  }
  int v4 = v6;
  if (v6 != (int)v6) {
    return 0;
  }
LABEL_5:
  if (a2) {
    *a2 = v4;
  }
  return 1;
}

void DDGlobalFilterBlocks_block_invoke_16(int a1, CFArrayRef theArray)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    unint64_t v4 = Count + 1;
    do
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v4 - 2);
      if (_typesAreEqual(@"BoxedResults", *((const __CFString **)ValueAtIndex + 8)))
      {
        CFArrayRef v6 = (const __CFArray *)*((void *)ValueAtIndex + 7);
        CFIndex v7 = CFArrayGetCount(v6);
        if (v6) {
          BOOL v12 = v7 < 1;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
          CFArrayRemoveValueAtIndex(theArray, v4 - 2);
        }
        else
        {
          CFIndex v13 = v7;
          if ((unint64_t)v7 >= 0xB)
          {
            DDLogErrD(v7, v8, v9, v10, v11, @"More than 10 boxed results. Ignoring aditional results...");
            CFIndex v13 = 10;
          }
          memset(v14, 0, sizeof(v14));
          v16.CFIndex location = 0;
          v16.CFArrayRef length = v13;
          CFArrayGetValues(v6, v16, (const void **)v14);
          CFRetain(ValueAtIndex);
          v17.CFIndex location = v4 - 2;
          v17.CFArrayRef length = 1;
          CFArrayReplaceValues(theArray, v17, (const void **)v14, v13);
          CFRelease(ValueAtIndex);
        }
      }
      --v4;
    }
    while (v4 > 1);
  }
}

void DDGlobalFilterBlocks_block_invoke_14(int a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (uint64_t i = 0; i < v4; ++i)
    {
      CFStringRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(theArray, i);
      if (_typesAreEqual(ValueAtIndex[8], @"FullAddress")
        && !DDResultGetSubresultWithType((uint64_t)ValueAtIndex, @"Street"))
      {
        if (i < 1
          || (CFIndex v7 = CFArrayGetValueAtIndex(theArray, i - 1),
              !DDAddressResultCanBeMergedWith((uint64_t)ValueAtIndex, (uint64_t)v7)))
        {
          if (i >= v4 - 1
            || (uint64_t v8 = CFArrayGetValueAtIndex(theArray, i + 1),
                !DDAddressResultCanBeMergedWith((uint64_t)ValueAtIndex, (uint64_t)v8)))
          {
            CFArrayRemoveValueAtIndex(theArray, i--);
            --v4;
          }
        }
      }
    }
  }
}

BOOL DDAddressResultCanBeMergedWith(uint64_t a1, uint64_t a2)
{
  v7[8] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL result = _typesAreEqual(*(CFStringRef *)(a2 + 64), @"FullAddress");
    if (!result) {
      return result;
    }
    uint64_t v5 = 0;
    v7[0] = @"Street";
    v7[1] = @"StreetNumber";
    v7[2] = @"StreetName";
    v7[3] = @"POBox";
    v7[4] = @"ZipCode";
    v7[5] = @"City";
    v7[6] = @"State";
    v7[7] = @"Country";
    while (1)
    {
      CFStringRef v6 = (const __CFString *)v7[v5];
      if (DDResultGetSubresultWithType(a1, v6))
      {
        if (DDResultGetSubresultWithType(a2, v6)) {
          break;
        }
      }
      if (++v5 == 8) {
        return 1;
      }
    }
  }
  return 0;
}

void DDGlobalFilterBlocks_block_invoke_13(int a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 2)
  {
    CFIndex v4 = Count;
    CFIndex v5 = 1;
    uint64_t v6 = 2;
    do
    {
      unint64_t v7 = *((void *)CFArrayGetValueAtIndex(theArray, v5) + 2);
      uint64_t v8 = (uint64_t)(int)v7 >> 16;
      unint64_t v9 = HIDWORD(v7);
      uint64_t v10 = v6;
      do
      {
        CFIndex v11 = v10 - 1;
        CFIndex v12 = v10 - 2;
        unint64_t v13 = *((void *)CFArrayGetValueAtIndex(theArray, v10 - 2) + 2);
        uint64_t v14 = (uint64_t)(int)v13 >> 16;
        if ((int)v14 < (int)v8) {
          break;
        }
        unint64_t v15 = HIDWORD(v13);
        if ((int)v14 <= (int)v8 && (int)v15 <= (int)v9) {
          break;
        }
        CFArrayExchangeValuesAtIndices(theArray, v12, v11);
        uint64_t v10 = v11;
      }
      while (v11 > 1);
      ++v5;
      ++v6;
    }
    while (v5 != v4);
  }
}

void DDGlobalFilterBlocks_block_invoke_10(int a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 2)
  {
    CFIndex v4 = Count;
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
    unint64_t v6 = *((void *)ValueAtIndex + 2);
    uint64_t v7 = *((void *)ValueAtIndex + 3);
    BOOL v8 = !HIDWORD(v6)
      && !((int)v6 >> 16)
      && CFEqual(*((CFStringRef *)ValueAtIndex + 8), @"AuthCode");
    unint64_t v9 = CFArrayGetValueAtIndex(theArray, 0);
    CFIndex v10 = 1;
    while (1)
    {
      CFIndex v11 = CFArrayGetValueAtIndex(theArray, v10);
      CFIndex v12 = v11;
      uint64_t v13 = v11[2];
      uint64_t v14 = v11[3];
      uint64_t v15 = (uint64_t)(int)v7 >> 16;
      uint64_t v16 = (uint64_t)(int)v13 >> 16;
      if ((int)v15 < (int)v16 || ((int)v15 <= (int)v16 ? (BOOL v17 = SHIDWORD(v7) <= SHIDWORD(v13)) : (BOOL v17 = 0), v17))
      {
        if (v15 != v16) {
          goto LABEL_19;
        }
        int v18 = HIDWORD(v13) - HIDWORD(v7) < 50 || v8;
        if (v18 != 1) {
          goto LABEL_19;
        }
        CFStringRef v19 = (const __CFString *)v11[8];
        if (v19 != (const __CFString *)v9[8] || CFStringCompare(v19, @"AuthCode", 0)) {
          goto LABEL_19;
        }
        CFStringRef v29 = (const __CFString *)v9[9];
        CFIndex Length = CFStringGetLength(v29);
        CFStringRef v28 = (const __CFString *)v12[9];
        CFIndex v20 = CFStringGetLength(v28);
        int v21 = Length == v20 && !v8;
        if (v21 == 1)
        {
          CFStringRef v22 = v29;
          CFIndex v30 = v20;
          CFComparisonResult v23 = CFStringCompare(v22, v28, 0);
          CFIndex v20 = v30;
          if (v23 == kCFCompareEqualTo) {
            goto LABEL_19;
          }
        }
        uint64_t v24 = v9[6];
        uint64_t v25 = v12[6];
        if (v8) {
          break;
        }
        BOOL v26 = Length == v20;
        if (v24 <= v25) {
          BOOL v26 = 0;
        }
        if (Length <= v20 && !v26) {
          break;
        }
      }
      CFArrayRemoveValueAtIndex(theArray, v10);
      --v4;
      uint64_t v14 = v7;
      CFIndex v12 = v9;
LABEL_20:
      unint64_t v9 = v12;
      uint64_t v7 = v14;
      if (v10 >= v4) {
        return;
      }
    }
    BOOL v27 = v24 < v25 && Length == v20;
    if (Length < v20 || v27)
    {
      CFArrayRemoveValueAtIndex(theArray, v10 - 1);
      --v4;
      goto LABEL_20;
    }
LABEL_19:
    ++v10;
    goto LABEL_20;
  }
}

uint64_t _DDDFAScannerCFInit(uint64_t result)
{
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t DDScanQueryGetNumberOfFragments(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t _DDDFACacheCFInit(uint64_t result)
{
  *(_DWORD *)(result + 28) = 0;
  *(void *)(result + 88) = 0;
  *(void *)(result + 40) = 0;
  return result;
}

void DDResultDisableURLSchemeChecking()
{
  if ((_schemeCheckingDisabled & 1) == 0) {
    _schemeCheckingDisabled = 1;
  }
}

uint64_t DDShouldUseLightLinksForResult(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (DDResultGetCategory(result) - 3 < 0xFFFFFFFE) {
      return 1;
    }
    else {
      return a2;
    }
  }
  return result;
}

uint64_t __DDLookupTableRefLookupCurrentWord_block_invoke()
{
  int v1 = 0;
  uint64_t result = MEMORY[0x19F3B2B00](0, "nfkc", 0, &v1);
  DDLookupTableRefLookupCurrentWord_sQuickCheckNormalizerNFKC = result;
  return result;
}

id DDScannerServiceScanQuerySyncWithOptionsAndQOS(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int64_t *a6, uint64_t a7)
{
  CFIndex v12 = [[DDScannerServiceConfiguration alloc] initWithScannerType:a2 passiveIntent:a3 == 1];
  uint64_t v13 = v12;
  if (a4 == 1) {
    [(DDScannerServiceConfiguration *)v12 setSpotlightSuggestionsEnabled:1];
  }
  [(DDScannerServiceConfiguration *)v13 setNoObjC:1];
  [(DDScannerServiceConfiguration *)v13 setQos:a7];
  v13->_jobIdentifierPtr = a6;
  if (a5 == 1) {
    [(DDScannerServiceConfiguration *)v13 setResultsOptions:[(DDScannerServiceConfiguration *)v13 resultsOptions] | 2];
  }
  id v14 = +[DDScannerService scanQuery:a1 configuration:v13];

  return v14;
}

dispatch_queue_t __DDResultGetCategory_block_invoke_4()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.datadetectors.Classify.Events", 0);
  DDResultGetCategory_sQueue_75 = (uint64_t)result;
  return result;
}

dispatch_queue_t __DDResultGetCategory_block_invoke_2()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.datadetectors.Classify.Links", 0);
  DDResultGetCategory_sQueue = (uint64_t)result;
  return result;
}

os_log_t __DDLogHandle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.DataDetectorsCore", "Data Detectors Engine");
  DDLogHandle_error_log_handle = (uint64_t)result;
  return result;
}

CFCharacterSetRef __DDCreatePunycodedString_block_invoke()
{
  CFCharacterSetRef result = CFCharacterSetCreateWithCharactersInString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"/?#");
  DDCreatePunycodedString_componentSeparatorSet = (uint64_t)result;
  return result;
}

void _DDScanQueryCFFinalize(void *a1)
{
  DDScanQueryReset(a1);
  BOOL v2 = (void *)a1[2];
  if (v2)
  {
    free(v2);
    a1[2] = 0;
  }
}

CFCalendarRef ___copyDefaultCalendar_block_invoke()
{
  CFCalendarRef result = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFCalendarIdentifier)*MEMORY[0x1E4F1D198]);
  _copyDefaultCalendar__calendar = (uint64_t)result;
  return result;
}

uint64_t DDURLStringForResult(uint64_t a1, uint64_t a2, char a3, const void *a4, const __CFTimeZone *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int Category = DDResultGetCategory(a1);
  if ((Category - 3) >= 2)
  {
    int v11 = Category;
    CFStringRef v12 = *(const __CFString **)(a1 + 64);
    if (!_typesAreEqual(@"TrackingNumber", v12)
      && !_typesAreEqual(@"FlightInformation", v12)
      && !_typesAreEqual(@"Parsec", v12)
      && !_typesAreEqual(@"GameCenter", v12)
      && !_typesAreEqual(@"Money", v12)
      && !_typesAreEqual(@"AuthCode", v12)
      && !_typesAreEqual(@"PhysicalAmount", v12)
      && !_typesAreEqual(@"DomesticIdentifier", v12)
      && !_typesAreEqual(@"UPIIdentifier", v12)
      && !_typesAreEqual(@"evts", v12))
    {
      CFStringRef v15 = (id)DDResultCopyExtractedURLWithOptions(a1, 1);
      CFStringRef v13 = v15;
      if (v11 != 2) {
        return (uint64_t)v13;
      }
      if (v15) {
        goto LABEL_21;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v16 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 72);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v19 = v17;
        _os_log_error_impl(&dword_19DC95000, v16, OS_LOG_TYPE_ERROR, "Result %@ returned NULL URL", buf, 0xCu);
        if ((a3 & 2) != 0)
        {
LABEL_22:
          if (_typesAreEqual(v12, @"PhoneNumber")) {
            return (uint64_t)v13;
          }
        }
      }
      else
      {
LABEL_21:
        if ((a3 & 2) != 0) {
          goto LABEL_22;
        }
      }
      if ((a3 & 4) != 0 && _typesAreEqual(v12, @"QuotedShortPhoneNumber")
        || (a3 & 8) != 0 && _typesAreEqual(v12, @"UnquotedShortPhoneNumber"))
      {
        return (uint64_t)v13;
      }
      return 0;
    }
  }
  if (DDResultIsPastDate(a1, a4, a5)) {
    return 0;
  }
  return [NSString stringWithFormat:@"%@://%@", @"x-apple-data-detectors", a2];
}

uint64_t DDResultIsPastDateWithLocale(uint64_t a1, const void *a2, const __CFLocale *a3, const __CFTimeZone *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFStringRef v8 = *(const __CFString **)(a1 + 64);
  uint64_t v9 = _sDateForExtraction;
  if (_typesAreEqual(v8, @"Timestamp")) {
    return 1;
  }
  if (_typesAreEqual(v8, @"DateTime")
    || _typesAreEqual(v8, @"Date")
    || _typesAreEqual(v8, @"TimeOffset")
    || _typesAreEqual(v8, @"BeginDate")
    || _typesAreEqual(v8, @"EndDate"))
  {
    CFTypeRef cf = 0;
    BOOL v17 = 0;
    int v11 = _copyDefaultCalendar();
    if (v11)
    {
      CFStringRef v12 = v11;
      if (DDResultCopyExtractedDateFromReferenceDateRec(a1, a3, v11, a2, a4, &v17, (CFDateRef *)&cf, 0, 0))
      {
        if (cf)
        {
          BOOL IsPast = dateIsPast((uint64_t)cf, v9, v17, a3, a4);
          CFRelease(cf);
LABEL_25:
          CFTypeRef v15 = v12;
LABEL_26:
          CFRelease(v15);
          return IsPast;
        }
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        id v14 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
LABEL_24:
          BOOL IsPast = 0;
          goto LABEL_25;
        }
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
      }
      else
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        id v14 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
      }
      _os_log_error_impl(&dword_19DC95000, v14, OS_LOG_TYPE_ERROR, "Could not extract date from %@", buf, 0xCu);
      goto LABEL_24;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFStringRef v13 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "DDResultIsPastDateWithLocale";
      _os_log_error_impl(&dword_19DC95000, v13, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", buf, 0xCu);
    }
    return 0;
  }
  if (!_typesAreEqual(v8, @"DateDuration") && !_typesAreEqual(v8, @"DayInterval")) {
    return 0;
  }
  CFTypeRef cf = 0;
  *(void *)long long buf = 0;
  BOOL v17 = 0;
  if (DDResultCopyExtractedStartDateEndDateWithLocale(a1, a3, 0, 0, (CFTypeRef *)buf, &cf, &v17, a2, a4))BOOL IsPast = dateIsPast(*(uint64_t *)buf, v9, v17, a3, (const __CFTimeZone *)cf); {
  else
  }
    BOOL IsPast = 0;
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  CFTypeRef v15 = cf;
  if (cf) {
    goto LABEL_26;
  }
  return IsPast;
}

uint64_t DDResultIsPastDate(uint64_t a1, const void *a2, const __CFTimeZone *a3)
{
  if (getLocaleForExtraction_sOnce != -1) {
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
  }
  CFLocaleRef v6 = (const __CFLocale *)_sLocaleForExtraction;

  return DDResultIsPastDateWithLocale(a1, a2, v6, a3);
}

BOOL dateIsPast(uint64_t a1, uint64_t a2, int a3, const __CFLocale *a4, const __CFTimeZone *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v9 = MEMORY[0x19F3B1AA0]();
  if (a2) {
    MEMORY[0x19F3B1AA0](a2);
  }
  else {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  CFAbsoluteTime v11 = Current;
  double v12 = Current - v9;
  if (!a3) {
    return v12 >= 60.0;
  }
  if (v12 <= -90000.0) {
    return 0;
  }
  if (v12 >= 90000.0) {
    return 1;
  }
  CFStringRef v13 = _copyDefaultCalendar();
  if (v13)
  {
    id v14 = v13;
    CFCalendarSetLocale(v13, a4);
    CFCalendarSetTimeZone(v14, a5);
    *(_DWORD *)long long buf = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    int v17 = 0;
    CFCalendarDecomposeAbsoluteTime(v14, v9, "yMd", buf, (char *)&v19 + 4, &v19);
    CFCalendarDecomposeAbsoluteTime(v14, v11, "yMd", (char *)&v18 + 4, &v18, &v17);
    if (*(int *)buf <= SHIDWORD(v18)
      && (*(_DWORD *)buf != HIDWORD(v18) || SHIDWORD(v19) <= (int)v18
                                         && (HIDWORD(v19) != v18 || (int)v19 <= v17)))
    {
      CFRelease(v14);
      return 1;
    }
    CFRelease(v14);
    return 0;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v16 = DDLogHandle_error_log_handle;
  BOOL result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)long long buf = 136315138;
    int v21 = "dateIsPast";
    _os_log_error_impl(&dword_19DC95000, v16, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", buf, 0xCu);
    return 0;
  }
  return result;
}

CFCalendarRef _copyDefaultCalendar()
{
  if (pthread_main_np() != 1) {
    goto LABEL_6;
  }
  if (_copyDefaultCalendar_onceToken != -1) {
    dispatch_once(&_copyDefaultCalendar_onceToken, &__block_literal_global_64);
  }
  if (!_copyDefaultCalendar__calendar
    || (CFRetain((CFTypeRef)_copyDefaultCalendar__calendar),
        (CFCalendarRef result = (CFCalendarRef)_copyDefaultCalendar__calendar) == 0))
  {
LABEL_6:
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D198];
    return CFCalendarCreateWithIdentifier(v1, v2);
  }
  return result;
}

uint64_t DDResultCopyExtractedDateFromReferenceDateRec(uint64_t a1, const __CFLocale *a2, __CFCalendar *a3, const void *a4, const void *a5, BOOL *a6, CFDateRef *a7, CFTypeRef *a8, int a9)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v15 = a1;
    CFStringRef v16 = *(const __CFString **)(a1 + 64);
    if (_typesAreEqual(v16, @"BeginDate") || _typesAreEqual(v16, @"EndDate"))
    {
      CFStringRef v16 = @"Date";
      SubresultWithType = DDResultGetSubresultWithType(v15, @"Date");
      if (SubresultWithType)
      {
        uint64_t v15 = (uint64_t)SubresultWithType;
      }
      else
      {
        CFStringRef v16 = @"DateTime";
        uint64_t v20 = DDResultGetSubresultWithType(v15, @"DateTime");
        if (v20) {
          uint64_t v15 = (uint64_t)v20;
        }
      }
    }
    CFLocaleRef locale = a2;
    if (a5) {
      CFTimeZoneRef v21 = (const __CFTimeZone *)CFRetain(a5);
    }
    else {
      CFTimeZoneRef v21 = CFTimeZoneCopyDefault();
    }
    CFTimeZoneRef v22 = v21;
    CFDateRef v23 = copyBestDateForDate(a4);
    if (_typesAreEqual(v16, @"Timestamp"))
    {
      CFArrayRef v24 = *(const __CFArray **)(v15 + 56);
      if (!v24 || CFArrayGetCount(*(CFArrayRef *)(v15 + 56)) != 1)
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        CFTimeZoneRef v26 = v22;
        CFDateRef v27 = v23;
        unsigned int v33 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_19DC95000, v33, OS_LOG_TYPE_ERROR, "Wrong number of results", buf, 2u);
        }
        goto LABEL_126;
      }
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v24, 0);
      uint64_t v19 = DDResultCopyExtractedDateFromReferenceDateRec(ValueAtIndex, a2, a3, a4, a5, a6, a7, a8, a9 + 1);
      CFTimeZoneRef v26 = v22;
LABEL_20:
      CFDateRef v27 = v23;
      if (!v19) {
        goto LABEL_126;
      }
LABEL_131:
      CFRelease(v26);
      CFRelease(v27);
      return v19;
    }
    if (_typesAreEqual(v16, @"DateTime"))
    {
      CFStringRef v28 = DDResultGetSubresultWithType(v15, @"SpecialDateTime");
      CFDateRef v27 = v23;
      if (v28)
      {
        CFStringRef v29 = v28[10];
        if (!v29) {
          CFStringRef v29 = v28[9];
        }
        CFTimeZoneRef v26 = v22;
        if (a6) {
          *a6 = 0;
        }
        uint64_t v69 = 0;
        *(void *)long long buf = 0;
        HIDWORD(v68) = 0;
        CFIndex v30 = DDResultGetSubresultWithType(v15, @"Time");
        uint64_t v31 = DDResultGetSubresultWithType(v15, @"ApproxTime");
        if (v30)
        {
          if (!v31) {
            uint64_t v31 = DDResultGetSubresultWithType(v15, @"SpecialDateTime");
          }
          int v32 = extractHourMinuteSecondWithRefCopyTimeZone((uint64_t)v30, 0, locale, (int *)&v69 + 1, &v69, (_DWORD *)&v68 + 1, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, -1, (uint64_t)v31);
        }
        else
        {
          if (!v31)
          {
            LODWORD(v68) = -1;
            HourFromApproxTimeint Value = extractHourFromApproxTimeValue(v29, (int *)&v68, locale);
            goto LABEL_86;
          }
          char v43 = DDResultGetSubresultWithType(v15, @"ApproxTime");
          int v32 = extractHourMinuteSecondWithRefCopyTimeZone((uint64_t)v43, 0, locale, (int *)&v69 + 1, &v69, (_DWORD *)&v68 + 1, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, -1, 0);
        }
        int v44 = v32;
        LODWORD(v68) = -1;
        HourFromApproxTimeint Value = extractHourFromApproxTimeValue(v29, (int *)&v68, locale);
        if (v44)
        {
          if (HourFromApproxTimeValue)
          {
            if ((int)v68 > 11)
            {
              if (v68 == 12 || SHIDWORD(v69) >= 12 && (v68 == 15 || HIDWORD(v69) != 12)) {
                goto LABEL_90;
              }
              int v46 = HIDWORD(v69) + 12;
            }
            else
            {
              int v46 = HIDWORD(v69) - 12;
              if (SHIDWORD(v69) <= 12 && (HIDWORD(v69) != 12 || (int)v69 < 1)) {
                goto LABEL_90;
              }
            }
            HIDWORD(v69) = v46;
          }
LABEL_90:
          BOOL v50 = *(const void **)buf;
          if (!a7)
          {
            uint64_t v19 = 1;
LABEL_106:
            if (a8 && v50) {
              *a8 = CFRetain(v50);
            }
            goto LABEL_131;
          }
          uint64_t v67 = 0;
          if (*(void *)buf) {
            CFTimeZoneRef v51 = *(const __CFTimeZone **)buf;
          }
          else {
            CFTimeZoneRef v51 = v22;
          }
          unsigned int v66 = 0;
          CFAbsoluteTime at = MEMORY[0x19F3B1AA0](v23);
          CFCalendarSetTimeZone(a3, v51);
          CFCalendarDecomposeAbsoluteTime(a3, at, "yMd", (char *)&v67 + 4, &v67, &v66);
          uint64_t v52 = DDResultGetSubresultWithType(v15, @"RelativeDay");
          if (v52)
          {
            char v53 = v52;
            unsigned int v64 = -1;
            CFStringRef v54 = v52[10];
            if (!v54) {
              CFStringRef v54 = v53[9];
            }
            if (!extractInteger(v54, &v64)
              || !CFCalendarComposeAbsoluteTime(a3, &at, "yMdHms", HIDWORD(v67), v67, v66, HIDWORD(v69), v69, HIDWORD(v68)))
            {
              goto LABEL_126;
            }
            uint64_t v55 = CFCalendarAddComponents(a3, &at, 0, "d", v64);
          }
          else
          {
            CFIndex v56 = DDResultGetSubresultWithType(v15, @"Date");
            if (v56
              && !DDResultExtractDayMonthYear((uint64_t)v56, locale, a3, &v66, &v67, (_DWORD *)&v67 + 1, (uint64_t)v23, v51))
            {
              goto LABEL_126;
            }
            uint64_t v55 = CFCalendarComposeAbsoluteTime(a3, &at, "yMdHms", HIDWORD(v67), v67, v66, HIDWORD(v69), v69, HIDWORD(v68));
          }
          uint64_t v19 = v55;
          if (v55)
          {
            *a7 = CFDateCreate(0, at);
            BOOL v50 = *(const void **)buf;
            goto LABEL_106;
          }
LABEL_126:
          DetailedDescription = createDetailedDescription((void *)v15);
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          CFIndex v60 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = DetailedDescription;
            _os_log_error_impl(&dword_19DC95000, v60, OS_LOG_TYPE_ERROR, "Date extraction failed: could not parse %@", buf, 0xCu);
          }
          CFRelease(DetailedDescription);
          uint64_t v19 = 0;
          goto LABEL_131;
        }
LABEL_86:
        if (HourFromApproxTimeValue) {
          int v49 = v68;
        }
        else {
          int v49 = 12;
        }
        LODWORD(v69) = 0;
        HIDWORD(v69) = v49;
        HIDWORD(v68) = 0;
        *(void *)long long buf = 0;
        goto LABEL_90;
      }
      uint64_t v40 = DDResultGetSubresultWithType(v15, @"Date");
      if (!v40)
      {
        CFTimeZoneRef v26 = v22;
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        CFStringRef v47 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_19DC95000, v47, OS_LOG_TYPE_ERROR, "should have a date in a DateTime", buf, 2u);
        }
        uint64_t v19 = 1;
        goto LABEL_131;
      }
      uint64_t v69 = 0;
      HIDWORD(v68) = 0;
      if (DDResultExtractDayMonthYear((uint64_t)v40, locale, a3, (_DWORD *)&v69 + 1, &v69, (_DWORD *)&v68 + 1, (uint64_t)a4, a5))
      {
        int v41 = DDResultGetSubresultWithType(v15, @"Time");
        CFTimeZoneRef v26 = v22;
        if (v41)
        {
          uint64_t v19 = (uint64_t)v41;
          LODWORD(v68) = 0;
          uint64_t v67 = 0;
          *(void *)long long buf = 0;
          CFLocaleRef v42 = locale;
        }
        else
        {
          uint64_t v19 = (uint64_t)DDResultGetSubresultWithType(v15, @"ApproxTime");
          LODWORD(v68) = 0;
          uint64_t v67 = 0;
          *(void *)long long buf = 0;
          CFLocaleRef v42 = locale;
          if (!v19) {
            goto LABEL_125;
          }
        }
        int64_t v57 = DDResultGetSubresultWithType(v15, @"ApproxTime");
        if (!extractHourMinuteSecondWithRefCopyTimeZone(v19, 0, v42, (int *)&v68, (_DWORD *)&v67 + 1, &v67, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, -1, (uint64_t)v57))goto LABEL_126; {
        if (a6)
        }
          *a6 = 0;
        if (!a7) {
          goto LABEL_120;
        }
        if (*(void *)buf) {
          CFTimeZoneRef v58 = *(const __CFTimeZone **)buf;
        }
        else {
          CFTimeZoneRef v58 = v22;
        }
        CFCalendarSetTimeZone(a3, v58);
        CFAbsoluteTime at = 0.0;
        uint64_t v37 = HIDWORD(v68);
        uint64_t v38 = v69;
        uint64_t v39 = HIDWORD(v69);
        goto LABEL_119;
      }
    }
    else
    {
      if (!_typesAreEqual(v16, @"Date"))
      {
        if (!_typesAreEqual(v16, @"Time") && !_typesAreEqual(v16, @"ApproxTime"))
        {
          CFTimeZoneRef v26 = v22;
          if (!_typesAreEqual(v16, @"TimeOffset"))
          {
            uint64_t v19 = 0;
            CFDateRef v27 = v23;
            goto LABEL_131;
          }
          CFDateRef v27 = v23;
          *(void *)long long buf = MEMORY[0x19F3B1AA0](v23);
          uint64_t v48 = DDApplyTimeOffset(v15, a3, (CFAbsoluteTime *)buf, a6);
          uint64_t v19 = v48;
          if (a7 && v48)
          {
            *a7 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
            goto LABEL_131;
          }
          goto LABEL_125;
        }
        *(void *)long long buf = 0;
        CFAbsoluteTime at = MEMORY[0x19F3B1AA0](v23);
        CFTimeZoneRef v26 = v22;
        CFCalendarSetTimeZone(a3, v22);
        uint64_t v68 = 0;
        uint64_t v69 = 0;
        uint64_t v67 = 0;
        CFCalendarDecomposeAbsoluteTime(a3, at, "yMdH", (char *)&v69 + 4, &v69, (char *)&v68 + 4, &v68);
        int v34 = -1;
        if (!a9)
        {
          BOOL v35 = _typesAreEqual(v16, @"Time");
          int v34 = v68;
          if (!v35) {
            int v34 = -1;
          }
        }
        if (!extractHourMinuteSecondWithRefCopyTimeZone(v15, 0, a2, (int *)&v68, (_DWORD *)&v67 + 1, &v67, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, v34, 0))
        {
          uint64_t v19 = 0;
          goto LABEL_20;
        }
        CFDateRef v27 = v23;
        if (a6) {
          *a6 = 0;
        }
        if (!a7) {
          goto LABEL_120;
        }
        if (*(void *)buf) {
          CFTimeZoneRef v36 = *(const __CFTimeZone **)buf;
        }
        else {
          CFTimeZoneRef v36 = v22;
        }
        CFCalendarSetTimeZone(a3, v36);
        uint64_t v38 = v69;
        uint64_t v37 = HIDWORD(v69);
        uint64_t v39 = HIDWORD(v68);
LABEL_119:
        CFCalendarComposeAbsoluteTime(a3, &at, "yMdHms", v37, v38, v39, v68, HIDWORD(v67), v67);
        *a7 = CFDateCreate(0, at);
LABEL_120:
        if (*(void *)buf)
        {
          if (a8) {
            *a8 = *(CFTypeRef *)buf;
          }
          else {
            CFRelease(*(CFTypeRef *)buf);
          }
        }
LABEL_124:
        uint64_t v19 = 1;
LABEL_125:
        if (v19) {
          goto LABEL_131;
        }
        goto LABEL_126;
      }
      if (a6) {
        *a6 = 1;
      }
      LODWORD(at) = 0;
      uint64_t v69 = 0;
      CFDateRef v27 = v23;
      if (DDResultExtractDayMonthYear(v15, locale, a3, &at, (_DWORD *)&v69 + 1, &v69, (uint64_t)a4, a5))
      {
        CFTimeZoneRef v26 = v22;
        if (a7)
        {
          CFCalendarSetTimeZone(a3, v22);
          *(void *)long long buf = 0;
          CFCalendarComposeAbsoluteTime(a3, (CFAbsoluteTime *)buf, "yMdHms", v69, HIDWORD(v69), LODWORD(at), 12, 0, 0);
          *a7 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
        }
        goto LABEL_124;
      }
    }
    CFTimeZoneRef v26 = v22;
    goto LABEL_126;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v18 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19DC95000, v18, OS_LOG_TYPE_ERROR, "result should not be NULL", buf, 2u);
  }
  return 0;
}

CFDateRef copyBestDateForDate(const void *a1)
{
  if (a1)
  {
    return (CFDateRef)CFRetain(a1);
  }
  else
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    double Current = CFAbsoluteTimeGetCurrent();
    return CFDateCreate(v3, Current);
  }
}

uint64_t DDResultPhysicalUnitsExtraction(uint64_t result, double *a2, CFTypeRef *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    CFCalendarRef result = _typesAreEqual(*(CFStringRef *)(result + 64), @"PhysicalAmount");
    if (result) {
      return _DDResultValueUnitExtraction(v5, a2, 0, a3) != 0;
    }
  }
  return result;
}

uint64_t DDResultExtractDayMonthYear(uint64_t a1, const __CFLocale *a2, __CFCalendar *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, uint64_t a7, CFTypeRef cf)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  if (cf) {
    CFTimeZoneRef v16 = (const __CFTimeZone *)CFRetain(cf);
  }
  else {
    CFTimeZoneRef v16 = CFTimeZoneCopyDefault();
  }
  CFTimeZoneRef v17 = v16;
  CFCalendarSetLocale(a3, a2);
  CFCalendarSetTimeZone(a3, v17);
  if (a7) {
    MEMORY[0x19F3B1AA0](a7);
  }
  else {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  CFAbsoluteTime v19 = Current;
  uint64_t v114 = 0;
  uint64_t v115 = 0;
  uint64_t SubresultWithType = (uint64_t)DDResultGetSubresultWithType(a1, @"AbsoluteDate");
  uint64_t v21 = (uint64_t)DDResultGetSubresultWithType(a1, @"PartialDate");
  unint64_t v109 = a5;
  if (!(SubresultWithType | v21))
  {
    if (DDResultGetSubresultWithType(a1, @"RelativeDay"))
    {
      CFStringRef data = (const __CFString *)DDResultGetSubresultWithType(a1, @"RelativeDay");
      CFStringRef v29 = data;
      LODWORD(v113) = -1;
      if (data)
      {
        uint64_t v25 = a6;
        CFStringRef data = (const __CFString *)data[2].data;
        if (!data) {
          CFStringRef data = (const __CFString *)v29[2].info;
        }
      }
      else
      {
        uint64_t v25 = a6;
      }
      if (extractInteger(data, &v113))
      {
        at[0] = v19;
        CFCalendarAddComponents(a3, at, 0, "d", LODWORD(v113));
        CFCalendarDecomposeAbsoluteTime(a3, at[0], "yMd", (char *)&v114 + 4, &v115, (char *)&v115 + 4);
        goto LABEL_114;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v42 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        if (v29)
        {
          uint64_t info = (uint64_t)v29[2].data;
          if (!info) {
            uint64_t info = v29[2].info;
          }
        }
        else
        {
          uint64_t info = 0;
        }
        LODWORD(at[0]) = 138412290;
        *(void *)((char *)at + 4) = info;
        int64_t v57 = "Could not extract the value of the RelativeDay binder: %@";
LABEL_167:
        CFIndex v78 = v42;
        uint32_t v79 = 12;
        goto LABEL_168;
      }
LABEL_191:
      uint64_t v48 = 0;
      goto LABEL_192;
    }
    if (!DDResultGetSubresultWithType(a1, @"RelativeDayOfWeek")) {
      goto LABEL_191;
    }
    CFTimeZoneRef v36 = DDResultGetSubresultWithType(a1, @"RelativeDayOfWeek");
    uint64_t v37 = DDResultGetSubresultWithType((uint64_t)v36, @"DayOfWeek");
    if (v37)
    {
      CFStringRef v38 = v37[10];
      if (v38 || (CFStringRef v38 = v37[9]) != 0)
      {
        uint64_t v25 = a6;
        int v39 = 0;
        int v105 = 0;
        char v40 = 0;
        int v41 = 1;
        char v107 = 1;
LABEL_59:
        char v52 = 1;
        goto LABEL_60;
      }
    }
    CFTimeZoneRef v51 = DDResultGetSubresultWithType((uint64_t)v36, @"DayToCome");
    if (v51)
    {
      CFStringRef v38 = v51[10];
      if (v38 || (CFStringRef v38 = v51[9]) != 0)
      {
        uint64_t v25 = a6;
        int v41 = 0;
        char v107 = 0;
        int v39 = 0;
        int v105 = 0;
        char v40 = 0;
        goto LABEL_59;
      }
    }
    uint64_t v69 = DDResultGetSubresultWithType((uint64_t)v36, @"AmbiguousNextDay");
    if (v69)
    {
      CFStringRef v38 = v69[10];
      if (v38 || (CFStringRef v38 = v69[9]) != 0)
      {
        uint64_t v25 = a6;
        int v41 = 0;
        char v107 = 0;
        int v39 = 0;
        char v52 = 1;
        int v105 = 1;
        char v40 = 1;
        goto LABEL_60;
      }
    }
    unsigned int v70 = DDResultGetSubresultWithType((uint64_t)v36, @"DayToComeWeekAfter");
    if (v70)
    {
      CFStringRef v38 = v70[10];
      if (v38 || (CFStringRef v38 = v70[9]) != 0)
      {
        uint64_t v25 = a6;
        int v41 = 0;
        char v107 = 0;
        char v40 = 0;
        char v52 = 1;
        int v39 = 1;
LABEL_126:
        int v105 = 1;
        goto LABEL_60;
      }
    }
    CFIndex v84 = DDResultGetSubresultWithType((uint64_t)v36, @"DayToCome2WeeksAfter");
    if (v84)
    {
      CFStringRef v38 = v84[10];
      if (v38 || (CFStringRef v38 = v84[9]) != 0)
      {
        uint64_t v25 = a6;
        int v41 = 0;
        char v107 = 0;
        int v105 = 0;
        char v40 = 0;
        int v39 = 2;
        goto LABEL_59;
      }
    }
    uint64_t v98 = DDResultGetSubresultWithType((uint64_t)v36, @"PreviousDay");
    if (v98)
    {
      CFStringRef v38 = v98[10];
      if (v38 || (CFStringRef v38 = v98[9]) != 0)
      {
        uint64_t v25 = a6;
        int v41 = 0;
        char v107 = 0;
        char v40 = 0;
        int v39 = -1;
        char v52 = 1;
        goto LABEL_126;
      }
    }
    unsigned int v99 = DDResultGetSubresultWithType((uint64_t)v36, @"DayOfPreviousWeek");
    if (v99 && ((CFStringRef v38 = v99[10]) != 0 || (CFStringRef v38 = v99[9]) != 0))
    {
      uint64_t v25 = a6;
      int v41 = 0;
      char v52 = 0;
      int v105 = 0;
      char v40 = 0;
      int v39 = -1;
    }
    else
    {
      uint64_t v100 = DDResultGetSubresultWithType((uint64_t)v36, @"DayOfThisWeek");
      if (v100 && ((CFStringRef v38 = v100[10]) != 0 || (CFStringRef v38 = v100[9]) != 0))
      {
        uint64_t v25 = a6;
        int v41 = 0;
        char v52 = 0;
        int v39 = 0;
        int v105 = 0;
        char v40 = 0;
      }
      else
      {
        CFIndex v102 = DDResultGetSubresultWithType((uint64_t)v36, @"DayOfNextWeek");
        if (v102)
        {
          uint64_t v25 = a6;
          CFStringRef v38 = v102[10];
          if (v38 || (CFStringRef v38 = v102[9]) != 0)
          {
            int v41 = 0;
            char v52 = 0;
            int v105 = 0;
            char v40 = 0;
            char v107 = 1;
            int v39 = 1;
LABEL_60:
            int v112 = 0;
            if ((extractInteger(v38, &v112) & 1) == 0)
            {
              if (DDLogHandle_onceToken != -1) {
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
              }
              uint64_t v42 = DDLogHandle_error_log_handle;
              if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
                goto LABEL_191;
              }
              LODWORD(at[0]) = 138412290;
              *(void *)((char *)at + 4) = v38;
              int64_t v57 = "Could not extract the value of the Day : %@";
              goto LABEL_167;
            }
            int v104 = v41;
            int v53 = v112;
            SInt32 DayOfWeek = CFAbsoluteTimeGetDayOfWeek(v19, v17);
            if (DayOfWeek == 7) {
              SInt32 v55 = 0;
            }
            else {
              SInt32 v55 = DayOfWeek;
            }
            at[0] = 0.0;
            *(void *)&at[1] = at;
            uint64_t v117 = 0x2000000000;
            int v118 = DDResultExtractDayMonthYear_actualFirstWeekDay;
            if (DDResultExtractDayMonthYear_sOnce != -1) {
              dispatch_once(&DDResultExtractDayMonthYear_sOnce, &__block_literal_global_182);
            }
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 0x40000000;
            block[2] = __DDResultExtractDayMonthYear_block_invoke_2;
            block[3] = &unk_1E59855F8;
            block[4] = at;
            block[5] = a2;
            SInt32 v111 = v55;
            dispatch_sync((dispatch_queue_t)DDResultExtractDayMonthYear_sQueue, block);
            unsigned int v56 = *(_DWORD *)(*(void *)&at[1] + 24);
            if (v56 - 8 > 0xFFFFFFF8)
            {
              if (v56 >= 2)
              {
                signed int v61 = v56 - 1;
                if (v53 >= v61) {
                  v53 -= v61;
                }
                else {
                  int v53 = v53 - v61 + 7;
                }
                BOOL v62 = __OFSUB__(v55, v61);
                int v63 = v55 - v61;
                if (v63 < 0 != v62) {
                  SInt32 v55 = v63 + 7;
                }
                else {
                  SInt32 v55 = v63;
                }
              }
            }
            else
            {
              *(_DWORD *)(*(void *)&at[1] + 24) = 1;
            }
            int v64 = v53 - v55;
            if (v107)
            {
              if (v64 < 0) {
                char v65 = v52;
              }
              else {
                char v65 = 0;
              }
            }
            else
            {
              if (v53 == v55) {
                int v66 = v105;
              }
              else {
                int v66 = 1;
              }
              if (v64 < 0) {
                char v65 = v52;
              }
              else {
                char v65 = 0;
              }
              if (v64 < 0 || !v66)
              {
LABEL_104:
                ++v39;
LABEL_105:
                LODWORD(v68) = v64 - v39 + 8 * v39;
                if ((v40 & ((int)v68 < 4)) != 0) {
                  uint64_t v68 = (v68 + 7);
                }
                else {
                  uint64_t v68 = v68;
                }
                CFAbsoluteTime v113 = v19;
                CFCalendarAddComponents(a3, &v113, 0, "d", v68);
                CFCalendarDecomposeAbsoluteTime(a3, v113, "yMd", (char *)&v114 + 4, &v115, (char *)&v115 + 4);
                _Block_object_dispose(at, 8);
                goto LABEL_114;
              }
            }
            if ((v65 & 1) == 0)
            {
              int v67 = v104;
              if (v53 != v55) {
                int v67 = 0;
              }
              if (v67 != 1) {
                goto LABEL_105;
              }
            }
            goto LABEL_104;
          }
        }
        uint64_t v25 = a6;
        uint64_t v103 = DDResultGetSubresultWithType((uint64_t)v36, @"DayOfNextNextWeek");
        if (!v103 || (CFStringRef v38 = v103[10]) == 0 && (CFStringRef v38 = v103[9]) == 0)
        {
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          uint64_t v77 = DDLogHandle_error_log_handle;
          if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
            goto LABEL_191;
          }
          LOWORD(at[0]) = 0;
          int64_t v57 = "there should be a weekday";
          goto LABEL_143;
        }
        int v41 = 0;
        char v52 = 0;
        int v105 = 0;
        char v40 = 0;
        int v39 = 2;
      }
    }
    char v107 = 1;
    goto LABEL_60;
  }
  if (SubresultWithType) {
    uint64_t v22 = SubresultWithType;
  }
  else {
    uint64_t v22 = v21;
  }
  CFDateRef v23 = DDResultGetSubresultWithType(v22, @"AmbiguousDate");
  CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(v19, (CFTimeZoneRef)cf);
  if (v23)
  {
    if (extractDMYFromAmbiguousForm((CFIndex)v23, a2, (_DWORD *)&v115 + 1, (int *)&v115, (int *)&v114 + 1))
    {
      uint64_t v25 = a6;
      if (v114 < 0)
      {
        int v26 = v115 - GregorianDate.month;
        if (v26 > -3)
        {
          if (v26 < 11)
          {
            HIDWORD(v114) = GregorianDate.year;
            goto LABEL_114;
          }
          int v27 = GregorianDate.year - 1;
        }
        else
        {
          int v27 = GregorianDate.year + 1;
        }
        HIDWORD(v114) = v27;
      }
LABEL_114:
      if (a4) {
        *a4 = HIDWORD(v115);
      }
      if (v109) {
        _DWORD *v109 = v115;
      }
      if (v25) {
        *uint64_t v25 = HIDWORD(v114);
      }
      uint64_t v48 = 1;
      goto LABEL_192;
    }
  }
  else
  {
    CFDateRef v23 = (const __CFString **)v22;
  }
  CFIndex v30 = DDResultGetSubresultWithType((uint64_t)v23, @"SpecialDay");
  if (!v30)
  {
    int v44 = DDResultGetSubresultWithType((uint64_t)v23, @"MonthNumber");
    if (v44)
    {
      CFIndex v45 = v44;
      SInt8 month = GregorianDate.month;
      uint64_t v25 = a6;
      CFStringRef v46 = v44[10];
      if (!v46) {
        CFStringRef v46 = v45[9];
      }
      int v47 = 0;
      uint64_t v48 = 0;
      if ((extractInteger(v46, &v115) & 1) == 0) {
        goto LABEL_192;
      }
LABEL_129:
      HIDWORD(v114) = extractGregorianYear((uint64_t)v23);
      if (v114 < 0)
      {
        HIDWORD(v114) = GregorianDate.year;
        if (v47)
        {
          int v71 = v47 + GregorianDate.year;
        }
        else
        {
          if (!v45) {
            goto LABEL_133;
          }
          int v82 = v115 - month;
          if (v82 > -3)
          {
            if (v82 < 11) {
              goto LABEL_133;
            }
            int v71 = GregorianDate.year - 1;
          }
          else
          {
            int v71 = GregorianDate.year + 1;
          }
        }
        HIDWORD(v114) = v71;
      }
LABEL_133:
      CFIndex v72 = DDResultGetSubresultWithType((uint64_t)v23, @"DayNumber");
      if (v72)
      {
        uint64_t v106 = a4;
        CFStringRef v73 = v72[10];
        if (!v73) {
          CFStringRef v73 = v72[9];
        }
        int v75 = HIDWORD(v114);
        unsigned int v74 = v115;
        if (CFStringCompare(v73, @"LastDayOfMonth", 0))
        {
          LODWORD(at[0]) = -1;
          if (extractInteger(v73, at))
          {
            int v76 = LODWORD(at[0]);
            goto LABEL_158;
          }
        }
        else
        {
          unsigned int v80 = v74;
          if (v74 < 0xD)
          {
            if (!v74)
            {
              HIDWORD(v115) = 31;
              a4 = v106;
LABEL_172:
              uint64_t v85 = DDResultGetSubresultWithType((uint64_t)v23, @"RelativeDayOfWeek");
              uint64_t v86 = DDResultGetSubresultWithType((uint64_t)v85, @"DayOfWeek");
              if (!v86)
              {
                if (v45) {
                  goto LABEL_114;
                }
LABEL_184:
                if (v115) {
                  goto LABEL_114;
                }
LABEL_185:
                int v94 = HIDWORD(v115) - ((int)(*(void *)&GregorianDate.year >> 16) >> 24);
                if (v94 > -7)
                {
                  int v95 = month;
                  if (v94 < 25)
                  {
LABEL_217:
                    LODWORD(v115) = v95;
                    goto LABEL_114;
                  }
                  if ((int)(*(void *)&GregorianDate.year >> 8) >> 24 > 1)
                  {
                    int v95 = month - 1;
                    goto LABEL_217;
                  }
                  int v95 = month + 11;
                  int v96 = HIDWORD(v114) - 1;
                }
                else
                {
                  if ((int)(*(void *)&GregorianDate.year >> 8) >> 24 < 12)
                  {
                    int v95 = month + 1;
                    goto LABEL_217;
                  }
                  int v95 = month - 11;
                  int v96 = HIDWORD(v114) + 1;
                }
                HIDWORD(v114) = v96;
                goto LABEL_217;
              }
              CFIndex v87 = v86;
              CFStringRef v88 = v86[10];
              if (!v88) {
                CFStringRef v88 = v87[9];
              }
              if (extractInteger(v88, &v114))
              {
                if (v45) {
                  goto LABEL_114;
                }
                *(void *)&v120.SInt32 year = *(void *)&GregorianDate.year & 0xFFFF00FF00000000 | ((unint64_t)BYTE4(v115) << 40) | HIDWORD(v114);
                v120.second = GregorianDate.second;
                double AbsoluteTime = CFGregorianDateGetAbsoluteTime(v120, v17);
                *(_OWORD *)CFAbsoluteTime at = *(_OWORD *)"";
                LODWORD(v117) = -2;
                CFAbsoluteTime v113 = AbsoluteTime;
                CFCalendarAddComponents(a3, &v113, 0, "M", 1);
                CFAbsoluteTime v90 = CFGregorianDateGetAbsoluteTime(GregorianDate, v17);
                if (v113 - v90 < v90 - AbsoluteTime) {
                  *(void *)&at[0] = 1;
                }
                uint64_t v91 = 0;
                while (1)
                {
                  CFAbsoluteTime v113 = AbsoluteTime;
                  CFCalendarAddComponents(a3, &v113, 0, "M", *(unsigned int *)((char *)at + v91));
                  unint64_t v92 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v113, v17);
                  SInt32 v93 = CFAbsoluteTimeGetDayOfWeek(v113, v17);
                  if (v93 % 7 == v114) {
                    break;
                  }
                  v91 += 4;
                  if (v91 == 20) {
                    goto LABEL_184;
                  }
                }
                HIDWORD(v114) = v92;
                LODWORD(v115) = (int)(v92 >> 8) >> 24;
                if (v115) {
                  goto LABEL_114;
                }
                goto LABEL_185;
              }
              if (DDLogHandle_onceToken != -1) {
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
              }
              uint64_t v42 = DDLogHandle_error_log_handle;
              if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
                goto LABEL_191;
              }
              CFStringRef v101 = v87[10];
              if (!v101) {
                CFStringRef v101 = v87[9];
              }
              LODWORD(at[0]) = 138412290;
              *(void *)((char *)at + 4) = v101;
              int64_t v57 = "Could not extract the day of week from the value %@";
              goto LABEL_167;
            }
            if ((v75 + 3) >= 7) {
              char v83 = &lastDayOfMonth;
            }
            else {
              char v83 = lastDayOfMonthLeapYear;
            }
            int v76 = v83[v74 - 1];
LABEL_158:
            HIDWORD(v115) = v76;
            a4 = v106;
            if (v76 < 0) {
              goto LABEL_191;
            }
            goto LABEL_172;
          }
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          CFArrayRef v81 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            LODWORD(at[0]) = 67109120;
            HIDWORD(at[0]) = v80;
            _os_log_error_impl(&dword_19DC95000, v81, OS_LOG_TYPE_ERROR, "DDExtractDayNumberForMonthAndYear called with bad monthNumber %d", (uint8_t *)at, 8u);
          }
        }
        uint64_t v48 = 0;
        HIDWORD(v115) = -1;
        goto LABEL_192;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v77 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_191;
      }
      LOWORD(at[0]) = 0;
      int64_t v57 = "Missing day in date result";
LABEL_143:
      CFIndex v78 = v77;
      uint32_t v79 = 2;
LABEL_168:
      _os_log_error_impl(&dword_19DC95000, v78, OS_LOG_TYPE_ERROR, v57, (uint8_t *)at, v79);
      goto LABEL_191;
    }
    CFTimeZoneRef v58 = DDResultGetSubresultWithType((uint64_t)v23, @"RelativeMonthNumber");
    CFIndex v45 = v58;
    if (v58)
    {
      LODWORD(at[0]) = 0;
      CFStringRef v59 = v58[10];
      if (!v59) {
        CFStringRef v59 = v45[9];
      }
      if (!extractInteger(v59, at)) {
        goto LABEL_191;
      }
      SInt8 month = GregorianDate.month;
      int v60 = LODWORD(at[0]) + GregorianDate.month;
      LODWORD(v115) = v60;
      uint64_t v25 = a6;
      if (v60 >= 13)
      {
        LODWORD(v115) = v60 - 12;
        int v47 = 1;
        goto LABEL_129;
      }
      if (v60 <= 0)
      {
        LODWORD(v115) = v60 + 12;
        int v47 = -1;
        goto LABEL_129;
      }
    }
    else
    {
      SInt8 month = GregorianDate.month;
      uint64_t v25 = a6;
    }
    int v47 = 0;
    goto LABEL_129;
  }
  uint64_t v31 = (uint64_t)v30;
  int GregorianYear = extractGregorianYear((uint64_t)v23);
  if (GregorianYear >= 0) {
    SInt32 year = GregorianYear;
  }
  else {
    SInt32 year = GregorianDate.year;
  }
  HIDWORD(v114) = year;
  LOBYTE(v113) = 0;
  LODWORD(at[0]) = 0;
  int v34 = DDResultGetSubresultWithType(v31, @"Identifier");
  if (v34)
  {
    BOOL v35 = (__CFString *)v34[10];
    if (!v35) {
      BOOL v35 = (__CFString *)v34[9];
    }
  }
  else
  {
    BOOL v35 = 0;
  }
  int v49 = DDResultGetSubresultWithType(v31, @"CalendarSystem");
  if (v49)
  {
    uint64_t v50 = (uint64_t)v49[10];
    if (!v50) {
      uint64_t v50 = (uint64_t)v49[9];
    }
  }
  else
  {
    uint64_t v50 = 0;
  }
  uint64_t v48 = 0;
  if (DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear(v35, v50, a2, (Boolean *)&v113, (int *)at, (int *)&v115 + 1, &v115, year))
  {
    if ((v115 & 0x8000000000000000) == 0)
    {
      uint64_t v25 = a6;
      if ((v115 & 0x80000000) == 0) {
        goto LABEL_114;
      }
    }
  }
LABEL_192:
  if (v17) {
    CFRelease(v17);
  }
  return v48;
}

uint64_t DDResultCurrencyExtraction(uint64_t result, double *a2, unint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    CFCalendarRef result = _typesAreEqual(*(CFStringRef *)(result + 64), @"Money");
    if (result) {
      return _DDResultValueUnitExtraction(v5, a2, a3, 0) != 0;
    }
  }
  return result;
}

uint64_t extractInteger(const __CFString *a1, _DWORD *a2)
{
  if (a1)
  {
    uint64_t v17 = 0;
    if (DDExtractSimpleInteger(a1, &v17) || DDExtractKanjiNumber(a1, &v17))
    {
      *a2 = v17;
      return 1;
    }
    else
    {
      if (extractInteger_sOnce != -1) {
        dispatch_once(&extractInteger_sOnce, &__block_literal_global_345);
      }
      *(void *)long long buf = 0;
      id v14 = buf;
      uint64_t v15 = 0x2000000000;
      char v16 = 0;
      if (extractInteger_sOnce_346 != -1) {
        dispatch_once(&extractInteger_sOnce_346, &__block_literal_global_350);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = __extractInteger_block_invoke_2;
      block[3] = &unk_1E59856C8;
      block[4] = buf;
      block[5] = a1;
      void block[6] = a2;
      dispatch_sync((dispatch_queue_t)extractInteger_sQueue, block);
      if (v14[24])
      {
        BOOL v4 = 1;
      }
      else
      {
        DDLogErrD(v6, v7, v8, v9, v10, @"Extraction failed for \"%@\"", a1);
        BOOL v4 = v14[24] != 0;
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v5 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19DC95000, v5, OS_LOG_TYPE_ERROR, "null value in DataDetectorsCore:extractInteger", buf, 2u);
    }
    return 0;
  }
  return v4;
}

uint64_t _DDResultValueUnitExtraction(uint64_t result, double *a2, unint64_t a3, CFTypeRef *a4)
{
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  BOOL v8 = _typesAreEqual(*(CFStringRef *)(result + 64), @"Money");
  if (!v8)
  {
    CFCalendarRef result = _typesAreEqual(*(CFStringRef *)(v7 + 64), @"PhysicalAmount");
    if (!result) {
      return result;
    }
  }
  uint64_t SubresultWithType = DDResultGetSubresultWithType(v7, @"IntegralValue");
  if (SubresultWithType)
  {
    CFStringRef v10 = SubresultWithType[10];
    if (!v10) {
      CFStringRef v10 = SubresultWithType[9];
    }
  }
  else
  {
    CFStringRef v10 = 0;
  }
  CFAbsoluteTime v11 = DDResultGetSubresultWithType(v7, @"Denominator");
  if (!v11)
  {
    int v15 = 0;
    CFStringRef v12 = 0;
LABEL_15:
    CFStringRef v14 = 0;
    goto LABEL_18;
  }
  CFStringRef v12 = v11[10];
  if (!v12)
  {
    CFStringRef v12 = v11[9];
    if (!v12)
    {
      int v15 = 0;
      goto LABEL_15;
    }
  }
  CFStringRef v13 = DDResultGetSubresultWithType(v7, @"Numerator");
  if (v13)
  {
    CFStringRef v14 = v13[10];
    if (!v14) {
      CFStringRef v14 = v13[9];
    }
  }
  else
  {
    CFStringRef v14 = 0;
  }
  int v15 = 1;
LABEL_18:
  if (v8) {
    CFStringRef v16 = @"Currency";
  }
  else {
    CFStringRef v16 = @"Unit";
  }
  CFCalendarRef result = (uint64_t)DDResultGetSubresultWithType(v7, v16);
  if (result)
  {
    CFStringRef v17 = *(const __CFString **)(result + 80);
    if (!v17)
    {
      CFStringRef v17 = *(const __CFString **)(result + 72);
      if (!v17) {
        return 0;
      }
    }
    char v18 = v15 ^ 1;
    if (v10) {
      char v18 = 0;
    }
    if (v18) {
      return 0;
    }
    if (!a2) {
      goto LABEL_55;
    }
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v38 = 1;
    if (v15)
    {
      uint64_t v37 = 1;
      if ((DDExtractSimpleInteger(v12, &v37) & 1) != 0 || DDExtractKanjiNumber(v12, &v37))
      {
        uint64_t v19 = v37;
        if (((DDExtractSimpleInteger(v14, &v39) & 1) != 0 || DDExtractKanjiNumber(v14, &v39))
          && (!v10 || (DDExtractSimpleInteger(v10, &v40) & 1) != 0 || DDExtractKanjiNumber(v10, &v40)))
        {
          double v20 = (double)v19;
          double v21 = 1.0;
LABEL_52:
          double v27 = (double)v39 / v20 + (double)v40;
          CFStringRef v28 = DDResultGetSubresultWithType(v7, @"Negative");
          double v29 = -(v27 * v21);
          if (!v28) {
            double v29 = v27 * v21;
          }
          *a2 = v29;
LABEL_55:
          if (!(a3 | (unint64_t)a4)) {
            return 1;
          }
          if (!v8 || CFStringFind(v17, @"-", 0).location == -1)
          {
            if (a4)
            {
              CFCalendarRef result = (uint64_t)CFStringCreateArrayBySeparatingStrings(0, v17, @"-");
              if (!result) {
                return result;
              }
              *a4 = CFAutorelease((CFTypeRef)result);
            }
            if (a3)
            {
              CFTypeRef v33 = CFRetain(v17);
              *(void *)a3 = CFAutorelease(v33);
            }
            return 1;
          }
          CFCalendarRef result = (uint64_t)CFStringCreateArrayBySeparatingStrings(0, v17, @"-");
          if (!result) {
            return result;
          }
          CFArrayRef v30 = (const __CFArray *)result;
          uint64_t v31 = *(void *)(v7 + 96);
          if ((v31 & 0x20000) != 0)
          {
            int Value = @"JPY";
          }
          else if ((v31 & 0x10000) != 0)
          {
            int Value = @"CNY";
          }
          else
          {
            if (getLocaleForExtraction_sOnce != -1) {
              dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
            }
            if (!_sLocaleForExtraction)
            {
              if (!a3) {
                goto LABEL_81;
              }
              CFArrayGetCount(v30);
LABEL_79:
              CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v30, 0);
              CFTypeRef v36 = CFRetain(ValueAtIndex);
              int Value = (__CFString *)CFAutorelease(v36);
LABEL_80:
              *(void *)a3 = Value;
LABEL_81:
              if (a4) {
                *a4 = CFAutorelease(v30);
              }
              else {
                CFRelease(v30);
              }
              return 1;
            }
            int Value = (__CFString *)CFLocaleGetValue((CFLocaleRef)_sLocaleForExtraction, (CFLocaleKey)*MEMORY[0x1E4F1D1F8]);
          }
          if (!a3) {
            goto LABEL_81;
          }
          CFIndex Count = CFArrayGetCount(v30);
          if (Value)
          {
            v41.CFArrayRef length = Count;
            v41.CFIndex location = 0;
            if (CFArrayContainsValue(v30, v41, Value)) {
              goto LABEL_80;
            }
          }
          goto LABEL_79;
        }
      }
    }
    else
    {
      if ((DDExtractSimpleInteger(v10, &v40) & 1) == 0 && !DDExtractKanjiNumber(v10, &v40)) {
        return 0;
      }
      uint64_t v22 = DDResultGetSubresultWithType(v7, @"FractionalValue");
      double v21 = 1.0;
      double v20 = 1.0;
      if (v22)
      {
        CFStringRef v23 = v22[10];
        if (v23 || (CFStringRef v23 = v22[9]) != 0)
        {
          if ((DDExtractSimpleInteger(v23, &v39) & 1) == 0 && !DDExtractKanjiNumber(v23, &v39)) {
            return 0;
          }
          CFIndex Length = CFStringGetLength(v23);
          double v20 = __exp10((double)Length);
        }
      }
      uint64_t v25 = DDResultGetSubresultWithType(v7, @"Multiplier");
      if (!v25) {
        goto LABEL_52;
      }
      CFStringRef v26 = v25[10];
      if (!v26)
      {
        CFStringRef v26 = v25[9];
        if (!v26) {
          goto LABEL_52;
        }
      }
      if ((DDExtractSimpleInteger(v26, &v38) & 1) != 0 || DDExtractKanjiNumber(v26, &v38))
      {
        double v21 = (double)v38;
        goto LABEL_52;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DDExtractSimpleInteger(const __CFString *a1, uint64_t *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  if (Length < 1)
  {
    uint64_t v7 = 0;
LABEL_25:
    if (!a2) {
      return 1;
    }
    goto LABEL_26;
  }
  CFIndex v5 = Length;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 1;
  while (1)
  {
    int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v5 + v6 - 1);
    if ((CharacterAtIndex - 2406) >= 0xA) {
      unsigned __int16 v10 = CharacterAtIndex;
    }
    else {
      unsigned __int16 v10 = CharacterAtIndex - 2358;
    }
    if ((CharacterAtIndex - 3664) <= 9) {
      unsigned __int16 v11 = CharacterAtIndex - 3616;
    }
    else {
      unsigned __int16 v11 = v10;
    }
    if ((CharacterAtIndex - 1776) <= 9) {
      unsigned __int16 v12 = CharacterAtIndex - 1728;
    }
    else {
      unsigned __int16 v12 = v11;
    }
    if ((CharacterAtIndex - 1632) <= 9) {
      unsigned __int16 v13 = CharacterAtIndex - 1584;
    }
    else {
      unsigned __int16 v13 = v12;
    }
    if ((unsigned __int16)(CharacterAtIndex + 240) <= 9u) {
      unsigned __int16 v13 = CharacterAtIndex + 288;
    }
    if ((unsigned __int16)(v13 - 48) <= 9u)
    {
      if (v8 > 0xCCCCCCCCCCCCCCBLL) {
        return 0;
      }
      v7 += (v13 - 48) * v8;
      v8 *= 10;
      goto LABEL_22;
    }
    if (v13 != 46) {
      break;
    }
    if (v6) {
      return 0;
    }
LABEL_22:
    --v6;
    if (v5 + v6 <= 0) {
      goto LABEL_25;
    }
  }
  if (v13 != 45 || v5 + v6 != 1) {
    return 0;
  }
  uint64_t v7 = -v7;
  if (a2) {
LABEL_26:
  }
    *a2 = v7;
  return 1;
}

uint64_t extractGregorianYear(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t SubresultWithType = DDResultGetSubresultWithType(a1, @"YearNumber");
  if (SubresultWithType)
  {
    CFAllocatorRef v3 = SubresultWithType;
    *(_DWORD *)long long buf = 0;
    CFStringRef v4 = SubresultWithType[10];
    if (!v4) {
      CFStringRef v4 = v3[9];
    }
    if (extractInteger(v4, buf))
    {
      unsigned int v5 = *(_DWORD *)buf + 1900;
      if (*(_DWORD *)buf >= 0x64u) {
        unsigned int v5 = *(_DWORD *)buf;
      }
      if (*(_DWORD *)buf <= 0x31u) {
        unsigned int v5 = *(_DWORD *)buf + 2000;
      }
      if (*(int *)buf >= 0) {
        return v5;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = DDResultGetSubresultWithType(a1, @"JapaneseYear");
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7;
    unsigned int v26 = 0;
    CFStringRef data = (const __CFString *)DDResultGetSubresultWithType((uint64_t)v7, @"JapaneseYearNumber");
    if (data)
    {
      CFStringRef v10 = data;
      CFStringRef data = (const __CFString *)data[2].data;
      if (!data) {
        CFStringRef data = (const __CFString *)v10[2].info;
      }
    }
    if (!extractInteger(data, &v26)) {
      return 0xFFFFFFFFLL;
    }
    unsigned __int16 v11 = DDResultGetSubresultWithType(v8, @"JapaneseEra");
    if (!v11) {
      return v26;
    }
    CFStringRef v12 = v11[10];
    if (!v12)
    {
      CFStringRef v12 = v11[9];
      if (!v12) {
        return v26;
      }
    }
    if (CFStringGetLength(v12) <= 0) {
      goto LABEL_70;
    }
    int CharacterAtIndex = CFStringGetCharacterAtIndex(v12, 0);
    if (CharacterAtIndex > 13178)
    {
      if (CharacterAtIndex <= 22822)
      {
        switch(CharacterAtIndex)
        {
          case 13179:
            goto LABEL_57;
          case 13180:
            goto LABEL_60;
          case 13181:
            goto LABEL_61;
          case 13182:
            goto LABEL_62;
          default:
            int v23 = 20196;
            goto LABEL_66;
        }
      }
      if (CharacterAtIndex <= 26125)
      {
        if (CharacterAtIndex != 22823)
        {
          if (CharacterAtIndex != 24179) {
            goto LABEL_70;
          }
          goto LABEL_57;
        }
LABEL_61:
        int v24 = v26 + 1912;
LABEL_68:
        unsigned int v26 = v24 - 1;
        if (v24 <= 0) {
          goto LABEL_71;
        }
        return v26;
      }
      if (CharacterAtIndex == 26126)
      {
LABEL_62:
        int v24 = v26 + 1868;
        goto LABEL_68;
      }
      if (CharacterAtIndex == 26157)
      {
LABEL_60:
        int v24 = v26 + 1926;
        goto LABEL_68;
      }
LABEL_70:
      unsigned int v26 = -1;
LABEL_71:
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v25 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v28 = v12;
        _os_log_error_impl(&dword_19DC95000, v25, OS_LOG_TYPE_ERROR, "Unknown era: %@", buf, 0xCu);
      }
      return v26;
    }
    if (CharacterAtIndex <= 103)
    {
      if (CharacterAtIndex != 72)
      {
        if (CharacterAtIndex != 82) {
          goto LABEL_70;
        }
        goto LABEL_67;
      }
    }
    else if (CharacterAtIndex != 104)
    {
      if (CharacterAtIndex != 114)
      {
        int v23 = 13055;
LABEL_66:
        if (CharacterAtIndex != v23) {
          goto LABEL_70;
        }
      }
LABEL_67:
      int v24 = v26 + 2019;
      goto LABEL_68;
    }
LABEL_57:
    int v24 = v26 + 1989;
    goto LABEL_68;
  }
  CFStringRef v14 = DDResultGetSubresultWithType(a1, @"MinguoYear");
  if (!v14)
  {
    uint64_t v19 = DDResultGetSubresultWithType(a1, @"ThaiYear");
    if (v19)
    {
      double v20 = v19;
      *(_DWORD *)long long buf = 0;
      CFStringRef v21 = v19[10];
      if (!v21) {
        CFStringRef v21 = v20[9];
      }
      if (extractInteger(v21, buf))
      {
        if (*(int *)buf < 100)
        {
          if (*(int *)buf >= 43)
          {
            if ((*(_DWORD *)buf - 43) > 0x31) {
              return (*(_DWORD *)buf + 1857);
            }
            else {
              return (*(_DWORD *)buf + 1957);
            }
          }
        }
        else
        {
          unsigned int v22 = *(_DWORD *)buf - 543;
          if (*(_DWORD *)buf >= 0x21Fu)
          {
            if (v22 <= 0x31) {
              return (*(_DWORD *)buf + 1457);
            }
            if (v22 >= 0x64) {
              return v22;
            }
            return (*(_DWORD *)buf + 1357);
          }
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  int v15 = v14;
  *(_DWORD *)long long buf = 0;
  CFStringRef v16 = v14[10];
  if (!v16) {
    CFStringRef v16 = v15[9];
  }
  if (!extractInteger(v16, buf)) {
    return 0xFFFFFFFFLL;
  }
  int v17 = *(_DWORD *)buf + 3811;
  if ((*(_DWORD *)buf + 1911) >= 0x64) {
    int v17 = *(_DWORD *)buf + 1911;
  }
  if ((*(_DWORD *)buf + 1911) <= 0x31) {
    unsigned int v18 = *(_DWORD *)buf + 3911;
  }
  else {
    unsigned int v18 = v17;
  }
  if (*(int *)buf >= -1911) {
    return v18;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

CFStringRef DDResultCopyExtractedURLWithOptions(uint64_t a1, char a2)
{
  CFStringRef v4 = *(const __CFString **)(a1 + 64);
  if (_typesAreEqual(v4, @"Email"))
  {
    uint64_t SubresultWithType = DDResultGetSubresultWithType(a1, @"Value");
    if (SubresultWithType)
    {
      MutableCFArrayRef Copy = (__CFString *)SubresultWithType[9];
      if (!MutableCopy) {
        return MutableCopy;
      }
      CFIndex v7 = DDCreatePunycodedString(SubresultWithType[9], 0, 0, 1);
      CFStringRef v8 = (const __CFString *)v7;
      if (v7) {
        CFStringRef v9 = (const __CFString *)v7;
      }
      else {
        CFStringRef v9 = MutableCopy;
      }
      CFStringRef v10 = @"mailto:";
LABEL_21:
      MutableCFArrayRef Copy = CFStringCreateMutableCopy(0, 0, v10);
      CFStringAppend(MutableCopy, v9);
      if (v8)
      {
        CFStringRef v18 = v8;
LABEL_23:
        CFRelease(v18);
      }
      return MutableCopy;
    }
    return 0;
  }
  if (_typesAreEqual(v4, @"FullAddress"))
  {
    if ((a2 & 2) == 0) {
      return 0;
    }
    if (*(void *)(a1 + 72))
    {
      double Helper_x8__OBJC_CLASS___GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS___GEOMapURLBuilder(v11);
      CFStringRef v14 = (void *)[*(id *)(v13 + 1824) URLForAddress:Helper_x8__OBJC_CLASS___GEOMapURLBuilder];
      if (v14) {
        CFStringRef v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "URLOverrideForURL:", v14);
      }
      int v15 = (__CFString *)[v14 absoluteString];
      MutableCFArrayRef Copy = v15;
      if (v15) {
        CFRetain(v15);
      }
      return MutableCopy;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    int v23 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    __int16 v37 = 0;
    int v24 = "can't have a result of type address without a string";
    uint64_t v25 = (uint8_t *)&v37;
    goto LABEL_51;
  }
  if (_typesAreEqual(v4, @"WebURL"))
  {
    CFStringRef v16 = *(const __CFString **)(a1 + 72);
    if (v16)
    {
      CFIndex v17 = DDCreatePunycodedString(v16, 0, 1, 0);
      CFStringRef v8 = (const __CFString *)v17;
      if (v17) {
        CFStringRef v9 = (const __CFString *)v17;
      }
      else {
        CFStringRef v9 = v16;
      }
      CFStringRef v10 = @"http://";
      goto LABEL_21;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    int v23 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    __int16 v36 = 0;
    int v24 = "can't have a result of type web without a string";
    uint64_t v25 = (uint8_t *)&v36;
LABEL_51:
    _os_log_error_impl(&dword_19DC95000, v23, OS_LOG_TYPE_ERROR, v24, v25, 2u);
    return 0;
  }
  if (_typesAreEqual(v4, @"HttpURL"))
  {
    CFStringRef v19 = *(const __CFString **)(a1 + 72);
    if (!v19)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      int v23 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      __int16 v35 = 0;
      int v24 = "can't have a result of type http without a string";
      uint64_t v25 = (uint8_t *)&v35;
      goto LABEL_51;
    }
    MutableCFArrayRef Copy = (__CFString *)DDCreatePunycodedString(*(const __CFString **)(a1 + 72), 1, 1, 0);
    if (MutableCopy) {
      return MutableCopy;
    }
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v21 = v19;
  }
  else if (_typesAreEqual(v4, @"MapsURL") || _typesAreEqual(v4, @"MailURL"))
  {
    CFStringRef v21 = *(const __CFString **)(a1 + 72);
    if (!v21)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      int v23 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_WORD *)long long buf = 0;
      int v24 = "can't have a result of type maps/mail without a string";
      uint64_t v25 = buf;
      goto LABEL_51;
    }
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  }
  else
  {
    if (_typesAreEqual(v4, @"PhoneNumber")
      || _typesAreEqual(v4, @"QuotedShortPhoneNumber")
      || _typesAreEqual(v4, @"UnquotedShortPhoneNumber"))
    {
      CFStringRef v26 = DDResultCopyCleanPhoneNumber(a1);
      MutableCFArrayRef Copy = (__CFString *)v26;
      if (!v26) {
        return MutableCopy;
      }
      CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFIndex Length = CFStringGetLength(v26);
      uint64_t v29 = CFStringCreateMutableCopy(v27, Length, MutableCopy);
      CFStringRef v30 = DDResultCopyStrippedPhoneNumber(v29);
      if (v29) {
        CFRelease(v29);
      }
      if (v30) {
        CFRelease(MutableCopy);
      }
      else {
        CFStringRef v30 = MutableCopy;
      }
      CFStringRef v31 = CFURLCreateStringByAddingPercentEscapes(0, v30, 0, 0, 0x8000100u);
      CFRelease(v30);
      if (v31)
      {
        MutableCFArrayRef Copy = CFStringCreateMutableCopy(0, 0, @"tel:");
        CFStringAppend(MutableCopy, v31);
        CFStringRef v18 = v31;
        goto LABEL_23;
      }
      return 0;
    }
    if (!_typesAreEqual(v4, @"GenericURL")) {
      return 0;
    }
    uint64_t v32 = *(void *)(a1 + 72);
    if (!v32)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      int v23 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      __int16 v33 = 0;
      int v24 = "can't have a result of type generic without a string";
      uint64_t v25 = (uint8_t *)&v33;
      goto LABEL_51;
    }
    if ((a2 & 1) != 0 && !DDURLSchemeIsKnown(v32)) {
      return 0;
    }
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v21 = (const __CFString *)v32;
  }

  return CFStringCreateCopy(v20, v21);
}

CFIndex DDCreatePunycodedString(const __CFString *a1, int a2, int a3, int a4)
{
  CFStringRef v7 = a1;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t Length = CFStringGetLength(a1);
  if (a2)
  {
    result.CFArrayRef length = 0;
    result.CFIndex location = 0;
    v44.CFIndex location = 0;
    v44.CFArrayRef length = Length;
    if (CFStringFindWithOptions(v7, @"://", v44, 0, &result)) {
      CFIndex v9 = result.length + result.location;
    }
    else {
      CFIndex v9 = 0;
    }
    Length -= v9;
    if (!a3) {
      goto LABEL_13;
    }
  }
  else
  {
    CFIndex v9 = 0;
    if (!a3) {
      goto LABEL_13;
    }
  }
  if (DDCreatePunycodedString_sOnce != -1) {
    dispatch_once(&DDCreatePunycodedString_sOnce, &__block_literal_global_279);
  }
  result.CFArrayRef length = 0;
  result.CFIndex location = 0;
  if (DDCreatePunycodedString_componentSeparatorSet)
  {
    v45.CFIndex location = v9;
    v45.CFArrayRef length = Length;
    if (CFStringFindCharacterFromSet(v7, (CFCharacterSetRef)DDCreatePunycodedString_componentSeparatorSet, v45, 0, &result))
    {
      uint64_t Length = result.location - v9;
    }
  }
LABEL_13:
  CFIndex v10 = CFStringGetLength(v7);
  if (v10)
  {
    CFIndex v11 = v10;
    CFIndex v10 = 0;
    if ((v9 & 0x8000000000000000) == 0 && Length + v9 <= v11 && Length <= 512)
    {
      v37.CFIndex location = 0;
      v37.CFArrayRef length = 0;
      v46.CFIndex location = v9;
      v46.CFArrayRef length = Length;
      int v12 = CFStringFindWithOptions(v7, @"@", v46, 0, &v37);
      uint64_t v13 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
      if (!v12) {
        goto LABEL_28;
      }
      CFIndex v14 = v37.location - v9 + v37.length;
      if (a4 && v14 >= 2)
      {
        CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        v47.CFIndex location = v9;
        v47.CFArrayRef length = v14 - 1;
        CFStringRef v16 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, v47);
        if (_shouldPunyCodeHost(v16))
        {
          CFStringRef v17 = CFURLCreateStringByReplacingPercentEscapes(v15, v16, &stru_1EF034530);
          CFIndex v18 = CFStringGetLength(v16);
          CFRelease(v16);
          if (!v17) {
            return 0;
          }
          CFStringRef v19 = CFURLCreateStringByAddingPercentEscapes(v15, v17, &stru_1EF034530, &stru_1EF034530, 0x8000100u);
          CFRelease(v17);
          if (!v19) {
            return 0;
          }
          MutableCFArrayRef Copy = CFStringCreateMutableCopy(v15, 0, v7);
          CFStringRef v7 = MutableCopy;
          if (!MutableCopy)
          {
            CFStringRef v33 = v19;
            goto LABEL_43;
          }
          v41.CFIndex location = v9;
          v41.CFArrayRef length = v14 - 1;
          CFStringReplace(MutableCopy, v41, v19);
          CFAutorelease(v7);
          CFIndex v21 = v14 - v18 + CFStringGetLength(v19);
          CFRelease(v19);
          goto LABEL_27;
        }
        CFRelease(v16);
      }
      CFIndex v21 = v14;
LABEL_27:
      Length -= v14;
      v9 += v21;
LABEL_28:
      CFAllocatorRef v22 = *v13;
      v48.CFIndex location = v9;
      v48.CFArrayRef length = Length;
      CFStringRef v23 = CFStringCreateWithSubstring(*v13, v7, v48);
      if (v23)
      {
        CFStringRef v24 = v23;
        if (_shouldPunyCodeHost(v23))
        {
          v49.CFIndex location = v9;
          v49.CFArrayRef length = Length;
          if (!CFStringFindWithOptions(v7, @"%", v49, 0, 0)
            || (CFStringRef v25 = CFURLCreateStringByReplacingPercentEscapes(v22, v24, &stru_1EF034530),
                CFRelease(v24),
                (CFStringRef v24 = v25) != 0))
          {
            CFIndex usedBufLen = 0;
            CFIndex v26 = CFStringGetLength(v24);
            v42.CFIndex location = 0;
            v42.CFArrayRef length = v26;
            CFAllocatorRef v27 = 0;
            if (CFStringGetBytes(v24, v42, 0x8000100u, 0, 0, (UInt8 *)&result, 512, &usedBufLen) == v26)
            {
              UErrorCode pErrorCode = U_ZERO_ERROR;
              CFStringRef v28 = (const UIDNA *)MEMORY[0x19F3B2AC0](0, &pErrorCode);
              if (v28 && pErrorCode == U_ZERO_ERROR)
              {
                uint64_t v29 = v28;
                UIDNAInfo pInfo = (UIDNAInfo)xmmword_19DCCF990;
                int32_t v30 = uidna_nameToASCII_UTF8(v28, (const char *)&result, usedBufLen, dest, 512, &pInfo, &pErrorCode);
                if (v30 < 1 || pErrorCode)
                {
                  uidna_close(v29);
                }
                else
                {
                  CFStringRef v31 = CFStringCreateWithBytes(v22, (const UInt8 *)dest, v30, 0x8000100u, 0);
                  uidna_close(v29);
                  if (v31)
                  {
                    if (CFStringCompare(v24, v31, 0))
                    {
                      uint64_t v32 = CFStringCreateMutableCopy(v22, 0, v7);
                      CFAllocatorRef v27 = v32;
                      if (v32)
                      {
                        v43.CFIndex location = v9;
                        v43.CFArrayRef length = Length;
                        CFStringReplace(v32, v43, v31);
                      }
                    }
                    else
                    {
                      CFAllocatorRef v27 = 0;
                    }
                    CFRelease(v31);
                    goto LABEL_46;
                  }
                }
              }
              CFAllocatorRef v27 = 0;
            }
LABEL_46:
            CFRelease(v24);
            return (CFIndex)v27;
          }
          return 0;
        }
        CFRetain(v7);
        CFStringRef v33 = v24;
LABEL_43:
        CFRelease(v33);
        return (CFIndex)v7;
      }
      return 0;
    }
  }
  return v10;
}

BOOL _shouldPunyCodeHost(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFStringRef theString = a1;
  uint64_t v23 = 0;
  CFIndex v24 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  CFIndex v21 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  int64_t v25 = 0;
  int64_t v26 = 0;
  CFAllocatorRef v22 = CStringPtr;
  if (Length < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v5 = 0;
    int64_t v6 = 0;
    int64_t v7 = 0;
    BOOL v8 = 1;
    uint64_t v9 = 64;
    memset(v19, 0, sizeof(v19));
    do
    {
      if ((unint64_t)v7 >= 4) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = v7;
      }
      CFIndex v11 = v24;
      if (v24 <= v7)
      {
        UniChar v12 = 0;
      }
      else if (v21)
      {
        UniChar v12 = v21[v7 + v23];
      }
      else if (v22)
      {
        UniChar v12 = v22[v23 + v7];
      }
      else
      {
        if (v26 <= v7 || v6 > v7)
        {
          uint64_t v14 = v10 + v5;
          uint64_t v15 = v9 - v10;
          int64_t v16 = v7 - v10;
          CFIndex v17 = v16 + 64;
          if (v16 + 64 >= v24) {
            CFIndex v17 = v24;
          }
          int64_t v25 = v16;
          int64_t v26 = v17;
          if (v24 >= v15) {
            CFIndex v11 = v15;
          }
          v27.CFArrayRef length = v11 + v14;
          v27.CFIndex location = v16 + v23;
          CFStringGetCharacters(theString, v27, (UniChar *)v19);
          int64_t v6 = v25;
        }
        UniChar v12 = *((_WORD *)v19 + v7 - v6);
      }
      if ((unsigned __int16)(v12 - 58) <= 0xFFF5u
        && (unsigned __int16)(v12 - 123) <= 0xFFE5u
        && (unsigned __int16)(v12 - 91) <= 0xFFE5u
        && (unsigned __int16)(v12 - 47) < 0xFFFEu)
      {
        break;
      }
      BOOL v8 = ++v7 < Length;
      --v5;
      ++v9;
    }
    while (Length != v7);
  }
  return v8;
}

void __getLocaleForExtraction_block_invoke()
{
  if (!_sLocaleForExtraction)
  {
    _sLocaleForExtraction = (uint64_t)CFLocaleCopyCurrent();
    if (!_sLocaleForExtraction)
    {
      CFLocaleRef System = CFLocaleGetSystem();
      _sLocaleForExtraction = (uint64_t)System;
      CFRetain(System);
    }
  }
}

uint64_t DDDFACacheCreateFromFramework()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.datadetectorscore");
  if (!BundleWithIdentifier)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v8 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v14 = 138412290;
    uint64_t v15 = @"com.apple.datadetectorscore";
    uint64_t v9 = "Could not locate the DDCore bundle %@, aborting. It's either not here or you ran out of file descriptors.";
    uint64_t v10 = v8;
    uint32_t v11 = 12;
LABEL_13:
    _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  CFURLRef v1 = CFBundleCopyBuiltInPlugInsURL(BundleWithIdentifier);
  if (!v1)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v12 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(v14) = 0;
    uint64_t v9 = "Could not locate the plugins in the DDCore bundle";
    uint64_t v10 = v12;
    uint32_t v11 = 2;
    goto LABEL_13;
  }
  CFURLRef v2 = v1;
  CFURLRef v3 = CFURLCreateCopyAppendingPathComponent(0, v1, @"PhoneNumbers.plugin", 1u);
  CFRelease(v2);
  CFBundleRef v4 = CFBundleCreate(0, v3);
  if (v4)
  {
    CFBundleRef v5 = v4;
    CFRelease(v3);
    uint64_t v6 = DDDFACacheCreateFromBundle(v5);
    CFRelease(v5);
    return v6;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v13 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    uint64_t v15 = (__CFString *)v3;
    _os_log_error_impl(&dword_19DC95000, v13, OS_LOG_TYPE_ERROR, "Could not load the plugin %@", (uint8_t *)&v14, 0xCu);
  }
  CFRelease(v3);
  return 0;
}

uint64_t DDDFACacheCreateFromBundle(void *a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  CFTypeID v2 = DDTypeRegister(&DDDFACacheGetTypeID_typeID);
  uint64_t Instance = DDTypeCreateInstance_(0, v2, 0x50uLL);
  *(void *)(Instance + 88) = a1;
  CFRetain(a1);
  FunctionPointerForName = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, @"GetPrefixInitialState");
  CFBundleRef v5 = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, @"GetSuffixInitialState");
  uint64_t v6 = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, @"GetVersion");
  int64_t v7 = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, @"GetResultPostprocessor");
  uint64_t v8 = v7;
  if (!FunctionPointerForName || !v5 || !v6 || !v7)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_DWORD *)long long buf = 134218752;
    *(void *)CFRange v41 = FunctionPointerForName;
    *(_WORD *)&v41[8] = 2048;
    CFRange v42 = (char *)v5;
    *(_WORD *)CFRange v43 = 2048;
    *(void *)&v43[2] = v6;
    __int16 v44 = 2048;
    CFRange v45 = v8;
    uint64_t v16 = "Missing function when loading DFA cache (%p, %p, %p, %p)";
    CFIndex v17 = v19;
    uint32_t v18 = 42;
    goto LABEL_27;
  }
  int v9 = v6();
  if (v9 != 7)
  {
    int v20 = v9;
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v21 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)CFRange v41 = 7;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v20;
    uint64_t v16 = "Could not load the DFA plugin. Version expected = %d, found = %d";
LABEL_21:
    CFIndex v17 = v21;
    uint32_t v18 = 14;
LABEL_27:
    _os_log_error_impl(&dword_19DC95000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_67;
  }
  *(void *)(Instance + 64) = FunctionPointerForName();
  *(void *)(Instance + 72) = v5();
  *(void *)(Instance + 80) = v8();
  CFURLRef v10 = CFBundleCopyResourceURL((CFBundleRef)a1, @"main", @"cache", 0);
  if (!v10)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "Could not find the cache in the DFA plugin";
LABEL_26:
    CFIndex v17 = v22;
    uint32_t v18 = 2;
    goto LABEL_27;
  }
  CFURLRef v11 = v10;
  int v12 = CFURLGetFileSystemRepresentation(v10, 1u, buffer, 1024);
  CFRelease(v11);
  if (!v12)
  {
LABEL_67:
    CFRelease((CFTypeRef)Instance);
    return 0;
  }
  memset(&v38, 0, sizeof(v38));
  if (stat((const char *)buffer, &v38))
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v13 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    int v14 = __error();
    uint64_t v15 = strerror(*v14);
    *(_DWORD *)long long buf = 136315394;
    *(void *)CFRange v41 = buffer;
    *(_WORD *)&v41[8] = 2080;
    CFRange v42 = v15;
    uint64_t v16 = "Could not stat %s: %s, aborting";
    CFIndex v17 = v13;
    uint32_t v18 = 22;
    goto LABEL_27;
  }
  if (v38.st_size >= 0x1000000)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "Cache file too big";
    goto LABEL_26;
  }
  uint64_t v23 = DDmmap((const char *)buffer, (void *)v38.st_size);
  if (!v23)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "DataDetectorsCore: mmapping the DFA cache failed";
    goto LABEL_26;
  }
  *(void *)(Instance + 16) = v23;
  *(_OWORD *)(Instance + 24) = *v23;
  if (*(unsigned __int16 *)(Instance + 24) != 48862)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "Could not load DFA cache. Wrong magic number.";
    goto LABEL_26;
  }
  if (*(_WORD *)(Instance + 26) != 7)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v21 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    int v34 = *(unsigned __int16 *)(Instance + 26);
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)CFRange v41 = 7;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v34;
    uint64_t v16 = "Could not load DFA cache. Version expected = %d, found = %d";
    goto LABEL_21;
  }
  if (*(unsigned __int16 *)(Instance + 38) >= *(unsigned __int16 *)(Instance + 32))
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v21 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    int v35 = *(unsigned __int16 *)(Instance + 38);
    int v36 = *(unsigned __int16 *)(Instance + 32);
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)CFRange v41 = v35;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v36;
    uint64_t v16 = "Simplified cache header sanity check failed (%d >= %d)";
    goto LABEL_21;
  }
  CFIndex v24 = (const char *)(v23 + 1);
  *(void *)(Instance + 40) = malloc_type_malloc(8 * *(unsigned __int16 *)(Instance + 34), 0x6004044C4A2DFuLL);
  LODWORD(v25) = *(unsigned __int16 *)(Instance + 34);
  if (*(_WORD *)(Instance + 34))
  {
    unint64_t v26 = 0;
    do
    {
      *(void *)(*(void *)(Instance + 40) + 8 * v26) = CFStringCreateWithCString(0, v24, 0x600u);
      v24 += 128;
      ++v26;
      unint64_t v25 = *(unsigned __int16 *)(Instance + 34);
    }
    while (v26 < v25);
  }
  *(void *)(Instance + 48) = v24;
  if (*(unsigned __int16 *)v24 >= *(unsigned __int16 *)(Instance + 36)
    || *((unsigned __int16 *)v24 + 1) >= v25)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v16 = "DFA cache states sanity check failed";
    goto LABEL_26;
  }
  uint64_t v27 = *(unsigned __int16 *)(Instance + 32);
  CFStringRef v28 = (unsigned __int16 *)&v24[8 * v27];
  *(void *)(Instance + 56) = v28;
  if (v28[1] <= *v28 || v28[3] >= v27)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v29 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    int32_t v30 = *(unsigned __int16 **)(Instance + 56);
    int v31 = v30[1];
    int v32 = *v30;
    LODWORD(v30) = v30[3];
    int v33 = *(unsigned __int16 *)(Instance + 32);
    *(_DWORD *)long long buf = 67109888;
    *(_DWORD *)CFRange v41 = v31;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v32;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = v30;
    HIWORD(v42) = 1024;
    *(_DWORD *)CFRange v43 = v33;
    uint64_t v16 = "Simplified cache transitions sanity check failed (%d, %d, %d, %d)";
    CFIndex v17 = v29;
    uint32_t v18 = 26;
    goto LABEL_27;
  }
  return Instance;
}

uint64_t DDScannerCreateWithLocale(int a1, unint64_t a2, const __CFLocale *a3, CFErrorRef *a4)
{
  uint64_t v6 = DDScannerCreateWithTypeAndLocale(a1, a3, a4);
  uint64_t v7 = v6;
  if (v6)
  {
    DDScannerSetOptions(v6, a2);
    if (a3) {
      DDScannerSetLocale(v7, a3);
    }
  }
  return v7;
}

uint64_t DDScannerCreate(int a1, unint64_t a2, CFErrorRef *a3)
{
  uint64_t v4 = DDScannerCreateWithTypeAndLocale(a1, 0, a3);
  uint64_t v5 = v4;
  if (v4) {
    DDScannerSetOptions(v4, a2);
  }
  return v5;
}

void DDScannerSetOptions(uint64_t a1, unint64_t a2)
{
  *(void *)(a1 + 192) = a2;
  CFURLRef v3 = *(__CFArray **)(a1 + 160);
  if (a2 >> 31)
  {
    if (v3)
    {
      CFArrayRemoveAllValues(v3);
    }
    else
    {
      *(void *)(a1 + 160) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    }
  }
  else if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 160) = 0;
  }
}

uint64_t DDScannerCreateWithTypeAndLocale(int a1, const __CFLocale *a2, CFErrorRef *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  memset(&v22, 0, sizeof(v22));
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.datadetectorscore");
  if (BundleWithIdentifier)
  {
    uint64_t v7 = BundleWithIdentifier;
    switch(a1)
    {
      case 0:
      case 2:
        CFStringRef v8 = (const __CFString *)_copyCacheFileBaseName(a1, a2);
        if (!v8) {
          goto LABEL_5;
        }
        CFStringRef v9 = v8;
        CFURLRef v10 = CFBundleCopyResourceURLForLocalization(v7, v8, @"system", 0, 0);
        CFAutorelease(v9);
        if (!v10) {
          goto LABEL_5;
        }
        goto LABEL_16;
      case 1:
        CFStringRef v13 = @"com.apple.datadetectorscore.cache.urlifier";
        goto LABEL_15;
      case 3:
        CFStringRef v13 = @"com.apple.datadetectorscore.cache.test";
LABEL_15:
        CFURLRef v10 = CFBundleCopyResourceURLForLocalization(BundleWithIdentifier, v13, @"system", 0, 0);
        CFStringRef v9 = 0;
        if (v10)
        {
LABEL_16:
          if (CFURLGetFileSystemRepresentation(v10, 1u, buffer, 1025))
          {
            CFRelease(v10);
            if (stat((const char *)buffer, &v22)
              || (int v20 = DDCacheCreateFromFileAtPathWithExtraChecks((const char *)buffer, v9, (void *)v22.st_size, 0)) == 0)
            {
              if (DDLogHandle_onceToken != -1) {
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
              }
              uint64_t v14 = DDLogHandle_error_log_handle;
              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315138;
                CFIndex v24 = buffer;
                int v12 = "Could not load system cache %s";
                uint64_t v15 = v14;
                uint32_t v16 = 12;
                goto LABEL_27;
              }
            }
            else
            {
              uint64_t v21 = v20;
              if (!a1) {
                CFStringCompare((CFStringRef)v20[10], @"com.apple.datadetectorscore.cache.full.india", 0);
              }
              uint64_t v18 = DDScannerCreateFromCacheSupportingMLScan(v21);
              CFRelease(v21);
              if (v18)
              {
                *(void *)(v18 + 224) = 0;
                goto LABEL_37;
              }
            }
          }
          else
          {
            if (DDLogHandle_onceToken != -1) {
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
            }
            CFIndex v17 = DDLogHandle_error_log_handle;
            if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_error_impl(&dword_19DC95000, v17, OS_LOG_TYPE_ERROR, "CFURLGetFileSystemRepresentation failed", buf, 2u);
            }
            CFRelease(v10);
          }
        }
        else
        {
LABEL_5:
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          uint64_t v11 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            int v12 = "CFBundleCopyResourceURL failed";
            goto LABEL_26;
          }
        }
        break;
      default:
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v11 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
          break;
        }
        *(_WORD *)long long buf = 0;
        int v12 = "Unknown cache type in _pathToSystemCacheFile";
        goto LABEL_26;
    }
  }
  else
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v11 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      int v12 = "Couldn't find bundle with identifier com.apple.datadetectorscore. It's either not here or you ran out of file descriptors.";
LABEL_26:
      uint64_t v15 = v11;
      uint32_t v16 = 2;
LABEL_27:
      _os_log_error_impl(&dword_19DC95000, v15, OS_LOG_TYPE_ERROR, v12, buf, v16);
    }
  }
  if (a3 && !*a3)
  {
    uint64_t v18 = 0;
    *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D160], 22, 0);
  }
  else
  {
    uint64_t v18 = 0;
  }
LABEL_37:
  kdebug_trace();
  return v18;
}

uint64_t DDScannerCreateFromCacheSupportingMLScan(void *a1)
{
  if (!a1) {
    return 0;
  }
  if (a1[2]) {
    operator new();
  }
  CFTypeID v2 = (_DWORD *)a1[4];
  if (!v2 || (uint64_t v3 = a1[5], v3 != *v2) || (v4 = v2[2], v4 < 0) || (v5 = v3 - 52, v4 > (int)v3 - 52))
  {
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  int v10 = v2[4];
  if ((v10 & 0x80000000) == 0 && v10 <= v5)
  {
    uint64_t v6 = 0;
    int v11 = v2[6];
    if ((v11 & 0x80000000) == 0 && v11 <= v5)
    {
      uint64_t v6 = 0;
      if (*(int *)(a1[8] + 4) >= 56 && v2[3] + v4 == v10)
      {
        if (v10 + 12 * v2[5] == v11)
        {
          int v12 = malloc_type_calloc(1uLL, 0x58uLL, 0x10F004081EB040EuLL);
          uint64_t v6 = v12;
          if (v12)
          {
            *int v12 = v2;
            CFStringRef v13 = v2 + 13;
            uint64_t v14 = (int)v2[3];
            uint64_t v15 = (unsigned __int16 *)((char *)v2 + v2[2] + 52);
            uint32_t v16 = malloc_type_malloc(0x60uLL, 0x1070040511C5677uLL);
            uint64_t v17 = *v15;
            *(_WORD *)uint32_t v16 = v17;
            int v18 = *((unsigned __int8 *)v15 + 2);
            v16[2] = v18;
            int v19 = *((unsigned __int8 *)v15 + 3);
            v16[3] = v19;
            unint64_t v20 = *((int *)v15 + 2);
            *((_DWORD *)v16 + 1) = *((_DWORD *)v15 + 1);
            if (v18)
            {
              if (v18 == 2) {
                unint64_t v21 = v20 / 5;
              }
              else {
                unint64_t v21 = 0;
              }
            }
            else
            {
              unint64_t v21 = v20 >> 2;
            }
            *((void *)v16 + 4) = v21;
            unint64_t v22 = *((int *)v15 + 3);
            unint64_t v23 = *((int *)v15 + 4);
            *((void *)v16 + 6) = v22 >> 1;
            if (v19)
            {
              if (v19 == 2) {
                unint64_t v24 = v23 / 5;
              }
              else {
                unint64_t v24 = 0;
              }
            }
            else
            {
              unint64_t v24 = v23 >> 2;
            }
            unint64_t v25 = v15 + 10;
            uint64_t v26 = 4 * v17;
            BOOL v27 = v18 == 2;
            uint64_t v28 = (uint64_t)&v15[2 * v17 + 12];
            unint64_t v29 = v28 + 4 * v21;
            if (v27)
            {
              uint64_t v26 = 4 * v17 + 4;
            }
            else
            {
              uint64_t v28 = (uint64_t)&v15[2 * v17 + 10];
              unint64_t v29 = 0;
            }
            *((void *)v16 + 1) = v25;
            *((void *)v16 + 2) = v28;
            *((void *)v16 + 3) = v29;
            if ((int)v20 <= 0) {
              int v30 = -(-(int)v20 & 3);
            }
            else {
              int v30 = v20 & 3;
            }
            if (v30 > 0) {
              v20 += -v30 + 4;
            }
            int v31 = (char *)v25 + v26 + v20;
            *((void *)v16 + 5) = v31;
            if ((int)v22 <= 0) {
              int v32 = -(-(int)v22 & 3);
            }
            else {
              int v32 = v22 & 3;
            }
            if (v32 <= 0) {
              uint64_t v33 = v22;
            }
            else {
              uint64_t v33 = v22 + -v32 + 4;
            }
            int v34 = &v31[v33];
            *((void *)v16 + 7) = v34;
            *((void *)v16 + 8) = &v34[4 * v17];
            *((void *)v16 + 9) = v24;
            *((void *)v16 + 10) = v15;
            *((void *)v16 + 11) = v14;
            uint64_t v35 = (int)v2[5];
            int v36 = (char *)v13 + (int)v2[4];
            v6[1] = v16;
            v6[2] = v36;
            v6[3] = (int)v2[1];
            v6[4] = v35;
            LODWORD(v35) = v2[7];
            v6[5] = (char *)v13 + (int)v2[6];
            *((_DWORD *)v6 + 12) = v35;
            int v37 = v2[9];
            if (v37 < 1) {
              stat v38 = 0;
            }
            else {
              stat v38 = (char *)v13 + (int)v2[8];
            }
            v6[7] = v38;
            *((_DWORD *)v6 + 16) = v37;
            v6[9] = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
          }
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  uint64_t v7 = (unsigned __int16 *)a1[6];
  if (v7) {
    CFStringRef v8 = DDLookupTableCreateFromCacheData(v7, a1[7], 0, 0);
  }
  else {
    CFStringRef v8 = 0;
  }
  if (v6) {
    DDLRTableDestroy(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  return 0;
}

void DDLookupTablePrepareToScan(void *a1)
{
  if (!a1[2])
  {
    uint64_t v2 = a1[7];
    a1[2] = DDStaticLookupCreateWithDynamicTrie(v2, 0, 0, 0);
    DDLookupTrieDestroy(v2);
    a1[7] = 0;
    uint64_t v3 = a1[8];
    if (v3)
    {
      CFDataRef v5 = (const __CFData *)a1[9];
      CFDataRef v4 = (const __CFData *)a1[10];
      uint64_t v6 = (const void *)a1[11];
      a1[3] = DDStaticLookupCreateWithDynamicTrie(a1[8], v5, v4, v6);
      if (v5)
      {
        CFRelease(v5);
        a1[9] = 0;
      }
      if (v4)
      {
        CFRelease(v4);
        a1[10] = 0;
      }
      if (v6)
      {
        CFRelease(v6);
        a1[11] = 0;
      }
      DDLookupTrieDestroy(v3);
      a1[8] = 0;
    }
  }
}

void *DDLookupTableCreateFromCacheData(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*((_DWORD *)a1 + 1) != a2)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v12 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v30 = *((_DWORD *)a1 + 1);
    int v35 = 67109376;
    LODWORD(v36) = v30;
    WORD2(v36) = 2048;
    *(void *)((char *)&v36 + 6) = a2;
    CFStringRef v9 = "length mismatch on LookupTable Cache (%d, %ld)";
    int v10 = v12;
    uint32_t v11 = 18;
    goto LABEL_43;
  }
  unsigned int v6 = a1[1];
  if (v6 - 8 <= 0xFFFFFFFA)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v8 = a1[1];
    int v35 = 67109632;
    LODWORD(v36) = v8;
    WORD2(v36) = 1024;
    *(_DWORD *)((char *)&v36 + 6) = 3;
    WORD5(v36) = 1024;
    HIDWORD(v36) = 7;
    CFStringRef v9 = "version mismatch on LookupTable Cache (%d, min supported %d, max supported %d)";
    int v10 = v7;
    uint32_t v11 = 20;
LABEL_43:
    _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v35, v11);
    return 0;
  }
  if (*a1 != 57054)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v20 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(v35) = 0;
    CFStringRef v9 = "magic mismatch on LookupTable Cache";
LABEL_24:
    int v10 = v20;
    uint32_t v11 = 2;
    goto LABEL_43;
  }
  int v17 = *((_DWORD *)a1 + 4);
  if (v17 >= 1)
  {
    int v18 = *((_DWORD *)a1 + 5);
    if (v18 < 0 || v17 + v18 + 24 > (int)a2)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v19 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      int v35 = 136315138;
      *(void *)&long long v36 = "ContextStaticTrie";
      CFStringRef v9 = "corruption of %s";
      goto LABEL_37;
    }
  }
  if (v6 <= 5)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    unint64_t v21 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v34 = a1[1];
      int v35 = 67109120;
      LODWORD(v36) = v34;
      _os_log_error_impl(&dword_19DC95000, v21, OS_LOG_TYPE_ERROR, "Lookup tables before version 6 (loading:%d) have issues. Might fail when loading context or threshold data. This support is only temporary, please update your files to v6 NOW (DDCore-492.0)", (uint8_t *)&v35, 8u);
    }
  }
  unint64_t v22 = *((int *)a1 + 2);
  uint64_t v23 = *((int *)a1 + 3);
  if ((int)v22 >= 1 && ((v23 & 0x80000000) != 0 || (int)v22 + (int)v23 + 24 > (int)a2))
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v35 = 136315138;
    *(void *)&long long v36 = "StaticTrie";
    CFStringRef v9 = "corruption of %s";
LABEL_37:
    int v10 = v19;
    uint32_t v11 = 12;
    goto LABEL_43;
  }
  unint64_t v24 = DDStaticLookupCreateWithCache((unsigned __int16 *)((char *)a1 + v23 + 24), v22, a1[1]);
  if (!v24)
  {
    uint64_t v31 = *((unsigned int *)a1 + 2);
    if ((int)v31 < 1 || (uint64_t)a1 + v31 + *((int *)a1 + 3) + 24 > a2) {
      return 0;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v20 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(v35) = 0;
    CFStringRef v9 = "Static lookup creation failed";
    goto LABEL_24;
  }
  unint64_t v25 = v24;
  CFTypeID v26 = DDTypeRegister(&DDLookupTableGetTypeID_typeID);
  uint64_t Instance = (void *)DDTypeCreateInstance_(0, v26, 0x88uLL);
  CFStringRef v13 = Instance;
  Instance[4] = a1;
  Instance[5] = a3;
  Instance[6] = a4;
  Instance[2] = v25;
  unint64_t v28 = *((unsigned int *)a1 + 4);
  if ((int)v28 >= 1 && (uint64_t v29 = *((int *)a1 + 5), (uint64_t)(v28 + v29 + 24) <= a2))
  {
    int v32 = DDStaticLookupCreateWithCache((unsigned __int16 *)((char *)a1 + v29 + 24), v28, a1[1]);
    v13[3] = v32;
    if (!v32)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v33 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v35) = 0;
        _os_log_error_impl(&dword_19DC95000, v33, OS_LOG_TYPE_ERROR, "Failed to load context tables. Results will be less accurate (you'll miss some)", (uint8_t *)&v35, 2u);
      }
    }
  }
  else
  {
    Instance[3] = 0;
  }
  return v13;
}

int **DDStaticLookupCreateWithCache(_DWORD *a1, unint64_t a2, int a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((uint64_t)a2 < 60)
  {
    if ((uint64_t)a2 < 1) {
      return 0;
    }
    goto LABEL_15;
  }
  if (*a1 != a2)
  {
LABEL_15:
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v9 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    int v8 = "Incorrect source file size";
    goto LABEL_35;
  }
  int v3 = a1[1];
  if (v3 < 0 || ((v4 = a1[2], v5 = (v4 + v3), v4 >= 4) ? (BOOL v6 = v5 > a2) : (BOOL v6 = 1), v6))
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    int v30 = "Cells";
    int v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  int v11 = a1[3];
  if (v11 < 0 || (int v12 = a1[4], v12 < 0) || (v12 + v11) > a2)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    int v30 = "ExtraData";
    int v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  if ((v12 & 1) != 0 || (v11 & 1) != 0 && v12)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    int v30 = "ExtraData";
    int v8 = "Inconsistency in source section array %s";
    goto LABEL_33;
  }
  int v15 = a1[5];
  if (v15 < 0 || (int v16 = a1[6], v16 < 0) || (v16 + v15) > a2)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    int v30 = "MetaData";
    int v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  if ((v16 & 3) != 0 || (v15 & 3) != 0 && v16)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    int v30 = "MetaData";
    int v8 = "Inconsistency in source section array %s";
    goto LABEL_33;
  }
  int v17 = a1[7];
  if (v17 < 0 || (int v18 = a1[8], v18 < 0) || (v18 + v17) > a2)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    int v30 = "ThresholdData";
    int v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  if ((v18 & 7) != 0 || (v17 & 3) != 0 && v18)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    int v30 = "ThresholdData";
    int v8 = "Inconsistency in source section array %s";
    goto LABEL_33;
  }
  if (a3 >= 5)
  {
    int v19 = a1[11];
    if (v19 < 0 || (int v20 = a1[12], v20 < 0) || (v20 + v19) > a2)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v7 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)long long buf = 136315138;
      int v30 = "StringIdxData";
      int v8 = "Inconsistency in source section %s";
    }
    else
    {
      if ((v20 & 3) != 0 || (v19 & 3) != 0 && v20)
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v7 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_DWORD *)long long buf = 136315138;
        int v30 = "StringIdxData";
        int v8 = "Inconsistency in source section array %s";
        goto LABEL_33;
      }
      int v23 = a1[9];
      if (v23 < 0 || (int v24 = a1[10], v24 < 0) || (v24 + v23) > a2)
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v7 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_DWORD *)long long buf = 136315138;
        int v30 = "ContextStringIdxData";
        int v8 = "Inconsistency in source section %s";
      }
      else
      {
        if ((v24 & 7) != 0 || (v23 & 3) != 0 && v24)
        {
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          uint64_t v7 = DDLogHandle_error_log_handle;
          if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
            return 0;
          }
          *(_DWORD *)long long buf = 136315138;
          int v30 = "ContextStringIdxData";
          int v8 = "Inconsistency in source section array %s";
          goto LABEL_33;
        }
        uint64_t v25 = a1[13];
        if ((v25 & 0x80000000) == 0)
        {
          uint64_t v26 = a1[14];
          if ((v26 & 0x80000000) == 0 && (v26 + v25) <= a2)
          {
            if (v26 && *((unsigned char *)a1 + v25 + v26 + 59))
            {
              if (DDLogHandle_onceToken != -1) {
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
              }
              uint64_t v9 = DDLogHandle_error_log_handle;
              if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
                return 0;
              }
              *(_WORD *)long long buf = 0;
              int v8 = "Invalid string section in source";
              goto LABEL_35;
            }
            BOOL v27 = (int **)malloc_type_calloc(1uLL, 0xA0uLL, 0x10B004003C429ACuLL);
            if (v27)
            {
              unint64_t v22 = v27;
              assignFromHeaderV5(v27, a1);
              return v22;
            }
LABEL_112:
            if (DDLogHandle_onceToken != -1) {
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
            }
            uint64_t v9 = DDLogHandle_error_log_handle;
            if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
              return 0;
            }
            *(_WORD *)long long buf = 0;
            int v8 = "Failed to allocate the static table";
LABEL_35:
            CFStringRef v13 = v9;
            uint32_t v14 = 2;
            goto LABEL_36;
          }
        }
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v7 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_DWORD *)long long buf = 136315138;
        int v30 = "StringData";
        int v8 = "Inconsistency in source section %s";
      }
    }
LABEL_33:
    CFStringRef v13 = v7;
    uint32_t v14 = 12;
LABEL_36:
    _os_log_error_impl(&dword_19DC95000, v13, OS_LOG_TYPE_ERROR, v8, buf, v14);
    return 0;
  }
  unint64_t v21 = (int **)malloc_type_calloc(1uLL, 0xA0uLL, 0x10B004003C429ACuLL);
  if (!v21) {
    goto LABEL_112;
  }
  unint64_t v22 = v21;
  assignFromHeaderV4(v21, a1);
  return v22;
}

int **assignFromHeaderV5(int **result, int *a2)
{
  uint64_t v2 = a2 + 15;
  uint64_t v3 = (uint64_t)a2 + a2[1] + 60;
  *CFRange result = a2;
  result[1] = (int *)v3;
  result[2] = (int *)v3;
  unint64_t v4 = a2[4];
  result[9] = (int *)(v4 >> 1);
  if (v4 >= 2) {
    unint64_t v5 = (int *)((char *)v2 + a2[3]);
  }
  else {
    unint64_t v5 = 0;
  }
  result[3] = v5;
  unint64_t v6 = a2[6];
  result[10] = (int *)(v6 >> 2);
  if (v6 >= 4) {
    uint64_t v7 = (int *)((char *)v2 + a2[5]);
  }
  else {
    uint64_t v7 = 0;
  }
  result[4] = v7;
  unint64_t v8 = a2[8];
  result[12] = (int *)(v8 >> 3);
  if (v8 >= 8) {
    uint64_t v9 = (int *)((char *)v2 + a2[7]);
  }
  else {
    uint64_t v9 = 0;
  }
  result[6] = v9;
  unint64_t v10 = a2[12];
  result[11] = (int *)(v10 >> 2);
  if (v10 >= 4) {
    int v11 = (int *)((char *)v2 + a2[11]);
  }
  else {
    int v11 = 0;
  }
  result[5] = v11;
  unint64_t v12 = a2[10];
  result[13] = (int *)(v12 >> 3);
  if (v12 >= 8) {
    CFStringRef v13 = (int *)((char *)v2 + a2[9]);
  }
  else {
    CFStringRef v13 = 0;
  }
  result[7] = v13;
  uint32_t v14 = (int *)a2[14];
  result[14] = v14;
  if ((int)v14 < 1) {
    int v15 = 0;
  }
  else {
    int v15 = (int *)((char *)v2 + a2[13]);
  }
  result[8] = v15;
  return result;
}

void *DDCacheCreateFromFileAtPathWithExtraChecks(const char *a1, const __CFString *a2, void *a3, int a4)
{
  *(void *)&v34[7] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = DDmmap(a1, a3);
  if (!v7)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFStringRef v13 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_error_impl(&dword_19DC95000, v13, OS_LOG_TYPE_ERROR, "DataDetectorsCore: mmapping the cache file failed", (uint8_t *)&v31, 2u);
    }
    return 0;
  }
  unint64_t v8 = v7;
  if ((unint64_t)a3 < 0x34)
  {
LABEL_47:
    munmap(v8, (size_t)a3);
    return 0;
  }
  if (a4 && *v7 != 43962)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v9 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    LOWORD(v31) = 0;
    unint64_t v10 = "DDCache creation: bad magic cookie";
    int v11 = v9;
    uint32_t v12 = 2;
    goto LABEL_46;
  }
  if (a4)
  {
    if (v7[1] == 56)
    {
      if (v7[2] == a3)
      {
        int v14 = v7[11];
        if (v14 < 0) {
          goto LABEL_47;
        }
        int v15 = v7[12];
        if (v15 < 0) {
          goto LABEL_47;
        }
        if ((v14 & 3) != 0) {
          goto LABEL_47;
        }
        if ((unint64_t)(v15 + v14) + 52 > (unint64_t)a3) {
          goto LABEL_47;
        }
        int v16 = v7[3];
        if (v16 < 0) {
          goto LABEL_47;
        }
        int v17 = v7[4];
        if (v17 < 0) {
          goto LABEL_47;
        }
        if ((v16 & 3) != 0) {
          goto LABEL_47;
        }
        if ((unint64_t)(v17 + v16) + 52 > (unint64_t)a3) {
          goto LABEL_47;
        }
        int v18 = v7[5];
        if (v18 < 0) {
          goto LABEL_47;
        }
        int v19 = v7[6];
        if (v19 < 0) {
          goto LABEL_47;
        }
        if ((v18 & 3) != 0) {
          goto LABEL_47;
        }
        if ((unint64_t)(v19 + v18) + 52 > (unint64_t)a3) {
          goto LABEL_47;
        }
        int v20 = v7[7];
        if (v20 < 0) {
          goto LABEL_47;
        }
        int v21 = v7[8];
        if (v21 < 0) {
          goto LABEL_47;
        }
        if ((v20 & 3) != 0) {
          goto LABEL_47;
        }
        if ((unint64_t)(v21 + v20) + 52 > (unint64_t)a3) {
          goto LABEL_47;
        }
        int v22 = v7[9];
        if (v22 < 0) {
          goto LABEL_47;
        }
        int v23 = v7[10];
        if (v23 < 0 || (v22 & 3) != 0 || (unint64_t)(v23 + v22) + 52 > (unint64_t)a3) {
          goto LABEL_47;
        }
        goto LABEL_36;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v28 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      int v29 = v8[2];
      int v31 = 67109376;
      int v32 = v29;
      __int16 v33 = 2048;
      *(void *)int v34 = a3;
      unint64_t v10 = "DDCache creation: bad size : %d != %ld";
      int v11 = v28;
      uint32_t v12 = 18;
    }
    else
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v26 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      int v27 = v8[1];
      int v31 = 67109632;
      int v32 = v27;
      __int16 v33 = 1024;
      *(_DWORD *)int v34 = 56;
      v34[2] = 1024;
      *(_DWORD *)&v34[3] = 56;
      unint64_t v10 = "DDCache creation: bad version (file: %d, min supported: %d, max supported: %d)";
      int v11 = v26;
      uint32_t v12 = 20;
    }
LABEL_46:
    _os_log_error_impl(&dword_19DC95000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v31, v12);
    goto LABEL_47;
  }
LABEL_36:
  CFTypeID v24 = DDTypeRegister(&DDCacheGetTypeID_typeID);
  uint64_t Instance = (void *)DDTypeCreateInstance_(0, v24, 0x48uLL);
  Instance[2] = (char *)v8 + v8[3] + 52;
  Instance[3] = (int)v8[4];
  Instance[4] = (char *)v8 + v8[5] + 52;
  Instance[5] = (int)v8[6];
  Instance[6] = (char *)v8 + v8[7] + 52;
  Instance[7] = (int)v8[8];
  Instance[8] = v8;
  if (a2) {
    Instance[10] = CFStringCreateCopy(0, a2);
  }
  return Instance;
}

void *DDmmap(const char *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = open(a1, 0);
  if (v4 == -1)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    unint64_t v6 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = __error();
      uint64_t v9 = strerror(*v8);
      int v10 = 136315138;
      int v11 = v9;
      _os_log_error_impl(&dword_19DC95000, v6, OS_LOG_TYPE_ERROR, "DDCache: could not open file descriptor to mmap cache file. Error %s", (uint8_t *)&v10, 0xCu);
    }
    return 0;
  }
  else
  {
    int v5 = v4;
    if (a2) {
      a2 = _DDmmap((uint64_t)a1, v4, (size_t)a2);
    }
    close(v5);
  }
  return a2;
}

void *_DDmmap(uint64_t a1, int a2, size_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(&v18, 0, 512);
  if (fstatfs(a2, &v18)) {
    return 0;
  }
  if ((v18.f_flags & 0x1000) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = ___DDmmap_block_invoke;
    block[3] = &__block_descriptor_tmp_1850;
    block[4] = a1;
    if (_DDmmap_sOnce == -1) {
      return 0;
    }
    dispatch_once(&_DDmmap_sOnce, block);
    return 0;
  }
  uint64_t v7 = mmap(0, a3, 1, 2, a2, 0);
  if (v7 == (void *)-1)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    int v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)long long buf = 136315138;
      int v17 = v12;
      _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, "DDCache: mmap failed with error %s", buf, 0xCu);
    }
    return 0;
  }
  unint64_t v6 = v7;
  if (madvise(v7, a3, 1))
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    unint64_t v8 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v13 = __error();
      int v14 = strerror(*v13);
      *(_DWORD *)long long buf = 136315138;
      int v17 = v14;
      _os_log_error_impl(&dword_19DC95000, v8, OS_LOG_TYPE_ERROR, "DDCache: madvise failed with error %s", buf, 0xCu);
    }
  }
  return v6;
}

const void *_copyCacheFileBaseName(int a1, const __CFLocale *a2)
{
  v73[1] = *(CFStringRef *)MEMORY[0x1E4F143B8];
  CFStringRef v72 = 0;
  v73[0] = 0;
  CFArrayRef v4 = CFLocaleCopyPreferredLanguages();
  CFArrayRef v5 = v4;
  if (v4)
  {
    CFIndex Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      LODWORD(v4) = 0;
      if (!a2) {
        goto LABEL_17;
      }
    }
    else
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, 0);
      LODWORD(v4) = _appendLocale(v73, (CFTypeRef *)&v72, ValueAtIndex);
      if (!a2) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    CFIndex Count = 0;
    if (!a2) {
      goto LABEL_17;
    }
  }
  if (!v4)
  {
    CFStringRef Value = (const __CFString *)CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
    CFStringRef v9 = Value;
    if (Value)
    {
      CFStringRef LanguageCodeFromCountryCode = (const __CFString *)_createLanguageCodeFromCountryCode(Value);
      if (LanguageCodeFromCountryCode)
      {
        CFStringRef v11 = LanguageCodeFromCountryCode;
        BOOL appended = _appendLocale(v73, (CFTypeRef *)&v72, LanguageCodeFromCountryCode);
        CFRelease(v11);
        if (appended) {
          goto LABEL_39;
        }
      }
    }
    CFStringRef v13 = (const __CFString *)CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
    if (v9) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14) {
      _appendLocale(v73, (CFTypeRef *)&v72, v13);
    }
    goto LABEL_18;
  }
LABEL_17:
  if (v4) {
    goto LABEL_39;
  }
LABEL_18:
  CFStringRef v15 = (const __CFString *)CPPhoneNumberCopyHomeCountryCode();
  if (!v15)
  {
LABEL_23:
    CFLocaleRef v20 = CFLocaleCopyCurrent();
    if (!v20) {
      goto LABEL_32;
    }
    CFLocaleRef v21 = v20;
    CFStringRef v22 = (const __CFString *)CFLocaleGetValue(v20, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
    CFStringRef v23 = v22;
    if (v22
      && (CFStringRef v24 = (const __CFString *)_createLanguageCodeFromCountryCode(v22)) != 0
      && (CFStringRef v25 = v24, v26 = _appendLocale(v73, (CFTypeRef *)&v72, v24), CFRelease(v25), v26))
    {
      int v27 = 1;
    }
    else
    {
      CFStringRef v28 = (const __CFString *)CFLocaleGetValue(v21, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
      int v27 = 0;
      if (v23 && v28)
      {
        _appendLocale(v73, (CFTypeRef *)&v72, v28);
        int v27 = 0;
      }
    }
    CFRelease(v21);
    if (!v27)
    {
LABEL_32:
      if (Count >= 2)
      {
        uint64_t v29 = 2;
        do
          CFStringRef v30 = (const __CFString *)CFArrayGetValueAtIndex(v5, v29 - 1);
        while (!_appendLocale(v73, (CFTypeRef *)&v72, v30) && Count > v29++);
      }
    }
    goto LABEL_39;
  }
  CFStringRef v16 = v15;
  CFStringRef v17 = (const __CFString *)_createLanguageCodeFromCountryCode(v15);
  if (!v17)
  {
    CFRelease(v16);
    goto LABEL_23;
  }
  CFStringRef v18 = v17;
  BOOL v19 = _appendLocale(v73, (CFTypeRef *)&v72, v17);
  CFRelease(v18);
  CFRelease(v16);
  if (!v19) {
    goto LABEL_23;
  }
LABEL_39:
  if (v5) {
    CFRelease(v5);
  }
  if (v73[0] && CFStringGetLength(v73[0]) >= 3)
  {
    CFStringRef v32 = v73[0];
    v74.CFIndex location = 0;
    v74.CFArrayRef length = 2;
    v73[0] = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v73[0], v74);
    CFRelease(v32);
  }
  if (v72 && CFStringGetLength(v72) >= 3)
  {
    CFStringRef v33 = v72;
    v75.CFIndex location = 0;
    v75.CFArrayRef length = 2;
    CFStringRef v72 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v72, v75);
    CFRelease(v33);
  }
  if (a1 == 2) {
    uint64_t v34 = 2;
  }
  else {
    uint64_t v34 = 6;
  }
  if (a1 == 2) {
    int v35 = calendarBasenames;
  }
  else {
    int v35 = fullBasenames;
  }
  MEMORY[0x1F4188790]();
  uint64_t v37 = &v71[-v36];
  strcpy(&v71[4], "xx");
  strcpy(v71, "xx");
  if (v73[0] && CFStringGetLength(v73[0]) == 2) {
    CFStringGetCString(v73[0], &v71[4], 3, 0x8000100u);
  }
  CFStringRef v38 = v72;
  if (v72)
  {
    CFIndex Length = CFStringGetLength(v72);
    CFStringRef v38 = v72;
    if (Length == 2)
    {
      CFStringGetCString(v72, v71, 3, 0x8000100u);
      CFStringRef v38 = v72;
    }
  }
  uint64_t v40 = 0;
  CFStringRef v41 = v73[0];
  int v42 = v71[4];
  CFRange v43 = "esptenfrca                    svpldanlnonbnnfiesptitdeenfr  rupldeenukhuhrsrslroskcskkbgltenhi                  "
        "        msthkojazhenidvihi            hetrarelitdeesenfr            ";
  int v44 = v71[5];
  int v45 = v71[0];
  uint64_t v46 = &byte_19DCCFA49;
  int v47 = v71[1];
  do
  {
    if (a1 == 2)
    {
      if (!v41)
      {
        int v51 = 0;
        if (!v38) {
          goto LABEL_100;
        }
LABEL_83:
        unint64_t v55 = 0;
        BOOL v56 = 1;
        int64_t v57 = v46;
        do
        {
          if (*(v57 - 1) == v45 && *v57 == v47) {
            break;
          }
          BOOL v56 = v55 < 0x20;
          v57 += 2;
          ++v55;
        }
        while (v55 != 33);
        v51 |= v56;
        goto LABEL_100;
      }
      unint64_t v48 = 0;
      BOOL v49 = 1;
      uint64_t v50 = v46;
      do
      {
        if (*(v50 - 1) == v42 && *v50 == v44) {
          break;
        }
        BOOL v49 = v48 < 0x20;
        v50 += 2;
        ++v48;
      }
      while (v48 != 33);
      if (v49) {
        int v51 = 2;
      }
      else {
        int v51 = 0;
      }
      if (v38) {
        goto LABEL_83;
      }
    }
    else
    {
      if (!v41)
      {
LABEL_80:
        int v51 = 0;
        if (!v38) {
          goto LABEL_100;
        }
LABEL_89:
        uint64_t v58 = 0;
        while (1)
        {
          int v59 = v43[v58];
          if (v59 == v45 && v43[v58 + 1] == v47) {
            break;
          }
          BOOL v60 = v59 == 32 || v58 == 28;
          v58 += 2;
          if (v60)
          {
            int v61 = 0;
            goto LABEL_99;
          }
        }
        int v61 = 1;
LABEL_99:
        v51 |= v61;
        goto LABEL_100;
      }
      uint64_t v52 = 0;
      while (1)
      {
        int v53 = v43[v52];
        if (v53 == v42 && v43[v52 + 1] == v44) {
          break;
        }
        BOOL v54 = v53 == 32 || v52 == 28;
        v52 += 2;
        if (v54) {
          goto LABEL_80;
        }
      }
      int v51 = 2;
      if (v38) {
        goto LABEL_89;
      }
    }
LABEL_100:
    *(_DWORD *)&v37[4 * v40++] = v51;
    v43 += 30;
    v46 += 66;
  }
  while (v40 != v34);
  if (v41)
  {
    CFRelease(v41);
    CFStringRef v38 = v72;
  }
  if (v38) {
    CFRelease(v38);
  }
  int v64 = *v35;
  int v63 = (const void **)(v35 + 1);
  BOOL v62 = v64;
  LODWORD(v64) = *(_DWORD *)v37;
  int v66 = (int *)(v37 + 4);
  int v65 = (int)v64;
  uint64_t v67 = v34 - 1;
  do
  {
    int v69 = *v66++;
    int v68 = v69;
    if (v69 > v65)
    {
      BOOL v62 = *v63;
      int v65 = v68;
    }
    ++v63;
    --v67;
  }
  while (v67);
  if (v62) {
    CFRetain(v62);
  }
  return v62;
}

BOOL _appendLocale(CFStringRef *a1, CFTypeRef *a2, CFStringRef theString)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    CFStringRef v6 = theString;
    if (theString && !CFStringHasPrefix(theString, @"en"))
    {
      if (CFStringHasPrefix(v6, @"yue"))
      {
        BOOL v7 = 0;
        CFStringRef v6 = @"zh";
      }
      else
      {
        uint64_t location = CFStringFind(v6, @"-", 0).location;
        if (location < 2)
        {
          BOOL v7 = 0;
        }
        else
        {
          v13.CFArrayRef length = location;
          v13.uint64_t location = 0;
          CFStringRef v9 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v13);
          BOOL v7 = v9 != 0;
          if (v9) {
            CFStringRef v6 = v9;
          }
        }
      }
      CFStringRef v10 = *a1;
      if (*a1)
      {
        if (CFStringGetLength(*a1) >= 2
          && CFStringGetLength(v6) >= 2
          && (int CharacterAtIndex = CFStringGetCharacterAtIndex(v10, 0),
              CharacterAtIndex == CFStringGetCharacterAtIndex(v6, 0))
          && (int v12 = CFStringGetCharacterAtIndex(v10, 1), v12 == CFStringGetCharacterAtIndex(v6, 1)))
        {
          if (v7) {
            CFRelease(v6);
          }
          return 0;
        }
        else
        {
          if (*a2) {
            CFRelease(*a2);
          }
          if (!v7) {
            CFRetain(v6);
          }
          *a2 = v6;
          return 1;
        }
      }
      else
      {
        if (!v7) {
          CFRetain(v6);
        }
        BOOL result = 0;
        *a1 = v6;
      }
    }
    else
    {
      return *a2 != 0;
    }
  }
  return result;
}

CFTypeRef _createLanguageCodeFromCountryCode(CFStringRef theString)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  MutableCFArrayRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, theString);
  CFStringUppercase(MutableCopy, 0);
  if (!MutableCopy) {
    return 0;
  }
  CFDictionaryRef v3 = CFDictionaryCreate(v1, (const void **)&_createLanguageCodeFromCountryCode_rawCC, (const void **)&_createLanguageCodeFromCountryCode_rawLC, 223, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFStringRef Value = CFDictionaryGetValue(v3, MutableCopy);
    if (Value) {
      CFTypeRef v6 = CFRetain(Value);
    }
    else {
      CFTypeRef v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    CFTypeRef v6 = 0;
  }
  CFRelease(MutableCopy);
  return v6;
}

uint64_t ___getSharedDispatcher_block_invoke()
{
  uint64_t v0 = objc_alloc_init(DDScanServerDispatcher);
  uint64_t v1 = _getSharedDispatcher__scannerDispatcher;
  _getSharedDispatcher__scannerDispatcher = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

CFSetRef __DDResultGetCategory_block_invoke()
{
  values[11] = *(void **)MEMORY[0x1E4F143B8];
  values[0] = @"BonjourAddress";
  values[1] = @"Email";
  values[2] = @"IPAddress";
  values[3] = @"HttpURL";
  values[4] = @"WebURL";
  values[5] = @"MapsURL";
  values[6] = @"MailURL";
  values[7] = @"FileURL";
  values[8] = @"DirtyFileURL";
  values[9] = @"GenericURL";
  values[10] = @"IMScreenName";
  uint64_t v0 = (const CFSetCallBacks *)MEMORY[0x1E4F1D548];
  DDResultGetCategory_urlSet = (uint64_t)CFSetCreate(0, (const void **)values, 11, MEMORY[0x1E4F1D548]);
  v2[0] = @"Date";
  v2[1] = @"DateTime";
  v2[2] = @"Time";
  v2[3] = @"DateDuration";
  v2[4] = @"TimeDuration";
  CFSetRef result = CFSetCreate(0, (const void **)v2, 5, v0);
  DDResultGetCategory_eventSet = (uint64_t)result;
  return result;
}

uint64_t getFoldingOffset(int a1)
{
  return a1 & ((__int16)a1 >> 15) & 0x7FFF;
}

void dd_icu_3_6__5_0_2::RuleBasedClassifier::~RuleBasedClassifier(dd_icu_3_6__5_0_2::RuleBasedClassifier *this)
{
  dd_icu_3_6__5_0_2::RuleBasedClassifier::~RuleBasedClassifier(this);

  JUMPOUT(0x19F3B21A0);
}

{
  UText *v2;
  uint64_t v3;
  const void *v4;

  *(void *)this = &unk_1EF032A80;
  uint64_t v2 = (UText *)*((void *)this + 4);
  if (v2) {
    utext_close(v2);
  }
  CFDictionaryRef v3 = *((void *)this + 7);
  if (v3) {
    MEMORY[0x19F3B21A0](v3, 0x10F0C40ABC2424ELL);
  }
  CFDictionaryRef v4 = (const void *)*((void *)this + 3);
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t DDComputeDominantScriptOrLanguage(const __CFString *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 12;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (Length >= 150) {
    uint64_t v3 = 150;
  }
  else {
    uint64_t v3 = Length;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  if (Length <= 0) {
    goto LABEL_107;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  char v37 = 0;
  char v38 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  int v4 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  char v5 = 0;
  char v6 = 0;
  char v7 = 0;
  int v8 = 0;
  CFIndex v9 = 0;
  while (2)
  {
    unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v9);
    if ((unsigned __int16)((CharacterAtIndex & 0xFFDF) - 65) <= 0x19u)
    {
LABEL_8:
      ++v4;
      goto LABEL_13;
    }
    if (CharacterAtIndex <= 0x2E && ((1 << CharacterAtIndex) & 0x708000000000) != 0
      || CharacterAtIndex == 173
      || CharacterAtIndex - 48 < 0xA
      || (unsigned __int16)(CharacterAtIndex - 188) <= 2u
      || CharacterAtIndex < 0x20
      || (unsigned __int16)(CharacterAtIndex - 127) <= 0x20u
      || CharacterAtIndex < 0xC0
      || (CharacterAtIndex & 0xFFDF) == 0xD7)
    {
      goto LABEL_12;
    }
    if (CharacterAtIndex <= 0x2AF) {
      goto LABEL_8;
    }
    if (CharacterAtIndex <= 0x36F)
    {
LABEL_12:
      ++v8;
      goto LABEL_13;
    }
    if (CharacterAtIndex <= 0x3FF)
    {
      ++HIDWORD(v40);
      goto LABEL_13;
    }
    if (CharacterAtIndex < 0x530 || CharacterAtIndex == 7467)
    {
      LOBYTE(v40) = v40 + 1;
      goto LABEL_13;
    }
    if (CharacterAtIndex < 0x590 || (unsigned __int16)(CharacterAtIndex + 1261) <= 4u)
    {
      ++BYTE4(v39);
      goto LABEL_13;
    }
    if (CharacterAtIndex < 0x600 || (unsigned __int16)(CharacterAtIndex + 1251) <= 0x32u)
    {
      LOBYTE(v39) = v39 + 1;
      goto LABEL_13;
    }
    if ((unsigned __int16)(CharacterAtIndex + 400) < 0x8Fu
      || CharacterAtIndex < 0x700
      || (unsigned __int16)(CharacterAtIndex + 1200) <= 0x2AFu)
    {
      ++v38;
      goto LABEL_13;
    }
    int v11 = CharacterAtIndex & 0xFF80;
    switch((unsigned __int16)((CharacterAtIndex & 0xFF80) - 2304) >> 7)
    {
      case 0:
        if ((CharacterAtIndex & 0xFFFE) == 0x964) {
          goto LABEL_12;
        }
        ++BYTE4(v31);
        goto LABEL_13;
      case 1:
        ++BYTE4(v33);
        goto LABEL_13;
      case 2:
        LOBYTE(v34) = v34 + 1;
        goto LABEL_13;
      case 3:
        ++BYTE4(v34);
        goto LABEL_13;
      case 4:
        LOBYTE(v35) = v35 + 1;
        goto LABEL_13;
      case 5:
        ++BYTE4(v35);
        goto LABEL_13;
      case 6:
        LOBYTE(v36) = v36 + 1;
        goto LABEL_13;
      case 7:
        ++BYTE4(v36);
        goto LABEL_13;
      case 8:
        ++v37;
        goto LABEL_13;
      case 9:
        ++v5;
        goto LABEL_13;
      case 10:
        ++v6;
        goto LABEL_13;
      case 11:
        ++v7;
        goto LABEL_13;
      default:
        CFIndex v26 = v3;
        if ((unsigned __int16)((unsigned __int16)(CharacterAtIndex + 21504) >> 10) < 0xBu
          || (int v12 = CharacterAtIndex & 0xFF00, v12 == 4352))
        {
          LOBYTE(v33) = v33 + 1;
          goto LABEL_61;
        }
        unsigned int v13 = CharacterAtIndex;
        if (CharacterAtIndex - 12352 <= 0xBF)
        {
          LOBYTE(v31) = v31 + 1;
          goto LABEL_61;
        }
        int16x4_t v14 = vdup_n_s16(CharacterAtIndex);
        if (vmaxv_u16(vcgt_u16((uint16x4_t)0xFC006071800200, (uint16x4_t)vadd_s16(v14, (int16x4_t)0x10001F0D1800700))))
        {
          HIDWORD(v30) = v27 + 1;
          LODWORD(v27) = v27 + 1;
          goto LABEL_61;
        }
        if (CharacterAtIndex - 8204 < 6
          || CharacterAtIndex == 8217
          || CharacterAtIndex - 8234 < 5
          || (CharacterAtIndex & 0xFFF0) == 0x2060
          || CharacterAtIndex == 65279
          || (CharacterAtIndex & 0xFFF0) == 0xFE00)
        {
          goto LABEL_60;
        }
        if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x700E000260030, (uint16x4_t)vadd_s16(v14, (int16x4_t)0x50058E0E300E295))) & 1) != 0|| v12 == 7680|| (CharacterAtIndex & 0xFFE0) == 0x2C60)
        {
          ++v4;
        }
        else if (CharacterAtIndex - 7462 < 5 || v12 == 7936)
        {
          ++HIDWORD(v40);
        }
        else if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x300030003F0065, (uint16x4_t)vadd_s16(v14, (int16x4_t)0xDF30DF90E2D4E265))) & 1) != 0|| (CharacterAtIndex & 0xFFE0) == 0xA700|| CharacterAtIndex - 0x2000 < 0xC00|| CharacterAtIndex > 0xFFFB|| v11 == 11776)
        {
LABEL_60:
          ++v8;
        }
        else if (v12 == 3840)
        {
          ++BYTE4(v32);
        }
        else if (CharacterAtIndex - 4096 > 0x9F)
        {
          if (CharacterAtIndex - 4256 > 0x5F)
          {
            if (CharacterAtIndex - 4608 > 0x19F)
            {
              if (CharacterAtIndex - 5024 > 0x5F)
              {
                if (CharacterAtIndex - 5120 > 0x27F)
                {
                  if (v11 == 6016)
                  {
                    LOBYTE(v30) = v30 + 1;
                  }
                  else if (CharacterAtIndex - 6144 > 0xAF)
                  {
                    if (CharacterAtIndex >> 10 == 54
                      && v9 + 1 < v26
                      && CFStringGetCharacterAtIndex(a1, v9 + 1) >> 10 >= 0x37u
                      && CFStringGetCharacterAtIndex(a1, v9 + 1) >> 13 <= 6u)
                    {
                      int v15 = CFStringGetCharacterAtIndex(a1, v9);
                      if (((v15 + (v13 << 10) - 56613888) & 0xFFFF0000) == 0x10000)
                      {
                        ++v8;
                      }
                      else
                      {
                        int v16 = v27;
                        int v17 = HIDWORD(v30);
                        if (v15 + (v13 << 10) - 56744960 < 0x10000) {
                          int v17 = v27 + 1;
                        }
                        HIDWORD(v30) = v17;
                        if (v15 + (v13 << 10) - 56744960 < 0x10000) {
                          int v16 = v27 + 1;
                        }
                        LODWORD(v27) = v16;
                      }
                      ++v9;
                    }
                  }
                  else
                  {
                    ++BYTE4(v29);
                  }
                }
                else
                {
                  LOBYTE(v29) = v29 + 1;
                }
              }
              else
              {
                ++BYTE4(v27);
              }
            }
            else
            {
              ++BYTE4(v28);
            }
          }
          else
          {
            LOBYTE(v32) = v32 + 1;
          }
        }
        else
        {
          LOBYTE(v28) = v28 + 1;
        }
LABEL_61:
        uint64_t v3 = v26;
LABEL_13:
        if (++v9 < v3) {
          continue;
        }
        HIBYTE(v42) = v8;
        BYTE9(v42) = v7;
        BYTE4(v41) = v6;
        BYTE8(v42) = v5;
        BYTE7(v42) = v37;
        BYTE6(v42) = BYTE4(v36);
        BYTE5(v42) = v36;
        BYTE4(v42) = BYTE4(v35);
        BYTE3(v42) = v35;
        BYTE2(v42) = BYTE4(v34);
        BYTE1(v42) = v34;
        LOBYTE(v42) = BYTE4(v33);
        HIBYTE(v41) = BYTE4(v31);
        BYTE13(v41) = BYTE4(v30);
        BYTE11(v41) = BYTE4(v29);
        BYTE10(v42) = v30;
        BYTE10(v41) = v29;
        BYTE9(v41) = BYTE4(v27);
        BYTE11(v42) = BYTE4(v28);
        BYTE8(v41) = v32;
        BYTE12(v42) = v28;
        BYTE13(v42) = BYTE4(v32);
        BYTE3(v41) = BYTE4(v40);
        BYTE14(v42) = v4;
        BYTE6(v41) = v31;
        BYTE5(v41) = v33;
        BYTE1(v41) = v38;
        BYTE2(v41) = v39;
        BYTE7(v41) = BYTE4(v39);
        BYTE14(v41) = v40;
LABEL_107:
        uint64_t v18 = 0;
        LOBYTE(v19) = 0;
        LODWORD(v20) = 12;
        do
        {
          unsigned int v21 = *((unsigned __int8 *)&v41 + v18);
          if (v21 <= v19) {
            uint64_t v20 = v20;
          }
          else {
            uint64_t v20 = v18;
          }
          if (v21 <= v19) {
            unsigned int v19 = v19;
          }
          else {
            unsigned int v19 = *((unsigned __int8 *)&v41 + v18);
          }
          ++v18;
        }
        while (v18 != 12);
        LOBYTE(v22) = 0;
        LODWORD(result) = 31;
        for (uint64_t i = 13; i != 31; ++i)
        {
          unsigned int v25 = *((unsigned __int8 *)&v41 + i);
          if (v25 <= v22) {
            uint64_t result = result;
          }
          else {
            uint64_t result = i;
          }
          if (v25 <= v22) {
            int v22 = v22;
          }
          else {
            int v22 = *((unsigned __int8 *)&v41 + i);
          }
        }
        if (v19 >= 2 * v22) {
          return v20;
        }
        return result;
    }
  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

NSUInteger validateRangeOfString(NSUInteger a1, NSRange range)
{
  if (range.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger location = range.location;
  if (range.location + range.length > a1)
  {
    int v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C4A8];
    char v6 = NSStringFromRange(range);
    [v4 raise:v5, @"Range for detection %@ is out of bounds (0,%lu)", v6, a1 format];
  }
  return location;
}

void sub_19DCAC67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19DCACAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DDScannerServiceScanStringSync(uint64_t a1)
{
  uint64_t v2 = [[DDScannerServiceConfiguration alloc] initWithScannerType:0 passiveIntent:0];
  [(DDScannerServiceConfiguration *)v2 setNoObjC:1];
  id v3 = +[DDScannerService scanString:range:configuration:](DDScannerService, "scanString:range:configuration:", a1, 0x7FFFFFFFFFFFFFFFLL, 0, v2);

  return v3;
}

id DDScannerServiceScanStringSyncWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  CFStringRef v10 = [[DDScannerServiceConfiguration alloc] initWithScannerType:a4 passiveIntent:a5 != 0];
  int v11 = v10;
  if (a6) {
    [(DDScannerServiceConfiguration *)v10 setSpotlightSuggestionsEnabled:1];
  }
  [(DDScannerServiceConfiguration *)v11 setNoObjC:1];
  id v12 = +[DDScannerService scanString:range:configuration:](DDScannerService, "scanString:range:configuration:", a1, a2, a3, v11);

  return v12;
}

id DDScannerServiceScanQuerySyncWithOptions(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int64_t *a6)
{
  return DDScannerServiceScanQuerySyncWithOptionsAndQOS(a1, a2, a3, a4, a5, a6, 0);
}

int64_t DDScannerServiceScanStringAsync(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [[DDScannerServiceConfiguration alloc] initWithScannerType:0 passiveIntent:1];
  [(DDScannerServiceConfiguration *)v4 setNoObjC:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __DDScannerServiceScanStringAsync_block_invoke;
  v8[3] = &unk_1E5984DD0;
  id v9 = v3;
  id v5 = v3;
  int64_t v6 = +[DDScannerService scanString:range:configuration:completionBlock:](DDScannerService, "scanString:range:configuration:completionBlock:", a1, 0x7FFFFFFFFFFFFFFFLL, 0, v4, v8);

  return v6;
}

uint64_t __DDScannerServiceScanStringAsync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

int64_t DDScannerServiceScanStringAsyncWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, void *a7)
{
  id v13 = a7;
  int16x4_t v14 = [[DDScannerServiceConfiguration alloc] initWithScannerType:a4 passiveIntent:a5 != 0];
  int v15 = v14;
  if (a6) {
    [(DDScannerServiceConfiguration *)v14 setSpotlightSuggestionsEnabled:1];
  }
  [(DDScannerServiceConfiguration *)v15 setNoObjC:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __DDScannerServiceScanStringAsyncWithOptions_block_invoke;
  v19[3] = &unk_1E5984DD0;
  id v20 = v13;
  id v16 = v13;
  int64_t v17 = +[DDScannerService scanString:range:configuration:completionBlock:](DDScannerService, "scanString:range:configuration:completionBlock:", a1, a2, a3, v15, v19);

  return v17;
}

uint64_t __DDScannerServiceScanStringAsyncWithOptions_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t DDScannerServiceCancelJob(uint64_t a1)
{
  return +[DDScannerService cancelJob:a1];
}

void printExceptionHandler(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v2 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = a1;
    _os_log_error_impl(&dword_19DC95000, v2, OS_LOG_TYPE_ERROR, "EXCEPTION: %@", (uint8_t *)&v3, 0xCu);
  }
}

void DDCrash(CFStringRef format, ...)
{
  va_start(va, format);
  if (format)
  {
    CFStringRef v1 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
    DDLogErrD((uint64_t)v1, v2, v3, v4, v5, @"%@", v1);
    printExceptionHandler((uint64_t)v1);
    if (v1) {
      CFRelease(v1);
    }
  }
  else
  {
    printExceptionHandler(0);
  }
}

BOOL _get_BOOL_entitlement(const __CFString *a1, int a2)
{
  if (!a2 && !_xpc_runtime_is_app_sandboxed()) {
    return 0;
  }
  uint64_t v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (__SecTask *)SecTaskCopyValueForEntitlement(v3, a1, 0);
  if (v5)
  {
    int64_t v6 = v5;
    CFTypeID TypeID = CFBooleanGetTypeID();
    BOOL v8 = TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v8 = 0;
    int64_t v6 = v4;
  }
  CFRelease(v6);
  return v8;
}

BOOL __DDTelephonyWillPrompt_block_invoke()
{
  BOOL result = _get_BOOL_entitlement(@"com.apple.springboard.allowallcallurls", 0);
  DDTelephonyWillPrompt_sandbox_BOOL result = !result;
  return result;
}

void __DDUserSourcesReadAllowed_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL BOOL_entitlement = _get_BOOL_entitlement(@"com.apple.datadetectors.source-read.user", 1);
  DDUserSourcesReadAllowed_sandbox_BOOL result = BOOL_entitlement;
  if (!BOOL_entitlement)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFStringRef v1 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138412290;
      uint64_t v3 = @"com.apple.datadetectors.source-read.user";
      _os_log_error_impl(&dword_19DC95000, v1, OS_LOG_TYPE_ERROR, "DD: This process tried to read a user data source without the proper entitlement (%@)", (uint8_t *)&v2, 0xCu);
    }
  }
}

void __DDUserSourcesWriteAllowed_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL BOOL_entitlement = _get_BOOL_entitlement(@"com.apple.datadetectors.source-write.user", 1);
  DDUserSourcesWriteAllowed_sandbox_BOOL result = BOOL_entitlement;
  if (!BOOL_entitlement)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFStringRef v1 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138412290;
      uint64_t v3 = @"com.apple.datadetectors.source-write.user";
      _os_log_error_impl(&dword_19DC95000, v1, OS_LOG_TYPE_ERROR, "DD: This process tried to write a user data source without the proper entitlement (%@)", (uint8_t *)&v2, 0xCu);
    }
  }
}

void __DDSystemSourcesWriteAllowed_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL BOOL_entitlement = _get_BOOL_entitlement(@"com.apple.datadetectors.source-write.system", 1);
  DDSystemSourcesWriteAllowed_sandbox_BOOL result = BOOL_entitlement;
  if (!BOOL_entitlement)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFStringRef v1 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v2 = 138412290;
      uint64_t v3 = @"com.apple.datadetectors.source-write.system";
      _os_log_error_impl(&dword_19DC95000, v1, OS_LOG_TYPE_ERROR, "DD: This process tried to write a system data source without the proper entitlement (%@)", (uint8_t *)&v2, 0xCu);
    }
  }
}

CFDataRef DDCreateDataFromFileAtUrl(const __CFURL *a1)
{
  if (!a1) {
    return 0;
  }
  CFURLRef v1 = CFURLCopyAbsoluteURL(a1);
  if (!v1) {
    return 0;
  }
  CFURLRef v2 = v1;
  CFStringRef v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  CFRelease(v2);
  if (!v3) {
    return 0;
  }
  CFDataRef v4 = DDCreateDataFromFileAtPath(v3);
  CFRelease(v3);
  return v4;
}

CFDataRef DDCreateDataFromFileAtPath(const __CFString *a1)
{
  if (!a1)
  {
    id v12 = (FILE *)*MEMORY[0x1E4F143C8];
    id v13 = "Error : Invalid file path !\n";
LABEL_12:
    size_t v14 = 28;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0;
  }
  size_t MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1);
  if (!MaximumSizeOfFileSystemRepresentation)
  {
    id v12 = (FILE *)*MEMORY[0x1E4F143C8];
    id v13 = "Error : Invalid file size !\n";
    goto LABEL_12;
  }
  CFIndex v3 = MaximumSizeOfFileSystemRepresentation;
  CFDataRef v4 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xFAFEC22EuLL);
  if (!v4)
  {
    id v12 = (FILE *)*MEMORY[0x1E4F143C8];
    id v13 = "Error : Invalid file path malloc !\n";
    size_t v14 = 35;
    goto LABEL_13;
  }
  uint64_t v5 = v4;
  if (!CFStringGetFileSystemRepresentation(a1, v4, v3))
  {
    free(v5);
    id v12 = (FILE *)*MEMORY[0x1E4F143C8];
    id v13 = "Error : Invalid file path system rep !\n";
    size_t v14 = 39;
    goto LABEL_13;
  }
  int64_t v6 = fopen(v5, "r");
  free(v5);
  if (v6)
  {
    int v7 = fileno(v6);
    memset(&v15, 0, sizeof(v15));
    fstat(v7, &v15);
    off_t st_size = v15.st_size;
    if (v15.st_size)
    {
      id v9 = (UInt8 *)malloc_type_malloc(v15.st_size, 0x4C6203A4uLL);
      if (v9)
      {
        CFStringRef v10 = v9;
        if (fread(v9, st_size, 1uLL, v6))
        {
          fclose(v6);
          return CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, st_size, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
        }
        free(v10);
      }
    }
    fclose(v6);
  }
  return 0;
}

uint64_t __DDMLEnhancementEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  DDMLEnhancementEnabled__isDDMLEnabled = result;
  return result;
}

uint64_t DDScannerShouldKeepParsecScoresBelowThreshold()
{
  return 0;
}

void DDScannerPurgeCaches(uint64_t a1, const void *a2)
{
  *(void *)(a1 + 40) = DDTokenCacheCreate(a2);
  DDLexemCacheDestroy(*(void *)(a1 + 48));
  *(void *)(a1 + 48) = DDLexemCacheCreate();
  DDSourceMatchCacheFree(*(uint64_t **)(a1 + 152));
  *(void *)(a1 + 152) = 0;
}

void DDScannerSetLocale(uint64_t a1, CFTypeRef cf)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4)
    {
      *(void *)(a1 + 40) = DDTokenCacheCreate(cf);
      *(unsigned char *)(a1 + 236) = 0;
      return;
    }
    CFTypeRef v5 = *(CFTypeRef *)(v4 + 8);
    if (cf)
    {
      if (v5)
      {
        if (v5 == cf || CFEqual(cf, v5)) {
          return;
        }
        int64_t v6 = *(const void **)(v4 + 8);
        if (v6) {
          CFRelease(v6);
        }
      }
      *(void *)(v4 + 8) = cf;
      CFRetain(cf);
      uint64_t v7 = *(void *)(v4 + 8);
    }
    else
    {
      if (!v5) {
        return;
      }
      CFRelease(*(CFTypeRef *)(v4 + 8));
      uint64_t v7 = 0;
      *(void *)(v4 + 8) = 0;
    }
    uint64_t v8 = *(void *)v4;
    if (*(void *)v4 && !*(unsigned char *)(v8 + 121))
    {
      uint64_t v9 = NLStringTokenizerCreate();
      uint64_t v10 = v9;
      if (!v7 || v9)
      {
        if (!v9)
        {
LABEL_30:
          int v14 = 1;
LABEL_31:
          DDCachingStringTokenizerResetStringWithOptions(v8, 64, v14);
          return;
        }
      }
      else
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        int v11 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          int v15 = 138412290;
          uint64_t v16 = v7;
          _os_log_error_impl(&dword_19DC95000, v11, OS_LOG_TYPE_ERROR, "Tokenizer update failed with locale %@, trying to fallback to default", (uint8_t *)&v15, 0xCu);
        }
        uint64_t v10 = NLStringTokenizerCreate();
        if (!v10)
        {
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          id v12 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v15) = 0;
            _os_log_error_impl(&dword_19DC95000, v12, OS_LOG_TYPE_ERROR, "Tokenizer creation failed again with the default one, giving up and reusing the original one", (uint8_t *)&v15, 2u);
          }
          goto LABEL_30;
        }
      }
      id v13 = *(const void **)(v8 + 40);
      if (v13) {
        CFRelease(v13);
      }
      int v14 = 0;
      *(void *)(v8 + 40) = v10;
      goto LABEL_31;
    }
  }
}

uint64_t DDScannerGetLocale(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 40);
    if (v1) {
      return *(void *)(v1 + 8);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t DDScannerGetMemoryUsed(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 48);
    if (v2 < 1)
    {
      uint64_t v7 = 8680;
    }
    else
    {
      CFIndex v3 = *(uint64_t **)(v1 + 32);
      uint64_t v4 = 400;
      do
      {
        uint64_t v5 = *v3;
        if (*v3)
        {
          uint64_t v6 = *(__int16 *)(v5 + 6);
          if (v6 == 1) {
            uint64_t v5 = 24;
          }
          else {
            uint64_t v5 = 16 * v6 + 24;
          }
        }
        v4 += v5;
        ++v3;
        --v2;
      }
      while (v2);
      uint64_t v7 = v4 + 8280;
    }
  }
  else
  {
    uint64_t v7 = 8280;
  }
  uint64_t v8 = *(void **)(a1 + 48);
  uint64_t v9 = v8[3];
  if (v9 < 1)
  {
    uint64_t v11 = 80;
  }
  else
  {
    uint64_t v10 = (unint64_t *)v8[1];
    uint64_t v11 = 80;
    do
    {
      unint64_t v12 = *v10;
      if (*v10) {
        unint64_t v12 = (*(uint64_t *)(v12 + 8) >> 27) & 0xFFFFFFFFFFFFFFE0 | 0x10;
      }
      v11 += v12;
      ++v10;
      --v9;
    }
    while (v9);
  }
  uint64_t v13 = v8[8];
  if (v13) {
    v11 += 32 * (*(uint64_t *)(v13 + 8) >> 32) + 16;
  }
  uint64_t v14 = v8[7];
  if (v14 >= 1)
  {
    int v15 = (unint64_t *)v8[5];
    do
    {
      unint64_t v16 = *v15;
      if (*v15) {
        unint64_t v16 = (*(uint64_t *)(v16 + 8) >> 27) & 0xFFFFFFFFFFFFFFE0 | 0x10;
      }
      v11 += v16;
      ++v15;
      --v14;
    }
    while (v14);
  }
  return v7 + v11;
}

void DDScannerThreadDebug(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v4 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = "in use";
    int v6 = 134218498;
    uint64_t v7 = a1;
    __int16 v8 = 2080;
    if (!a2) {
      uint64_t v5 = "unused";
    }
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    uint64_t v11 = v5;
    _os_log_error_impl(&dword_19DC95000, v4, OS_LOG_TYPE_ERROR, "Scanner %p was declared %s while already %s, this is likely a Data Detectors scanner being used in an unsafe manner (this object is NOT thread safe, a crash is likely to happen). Break on DDScannerThreadDebug() to debug.", (uint8_t *)&v6, 0x20u);
  }
}

void _DDScannerDestroyOptionalLookupTable(uint64_t a1, int a2)
{
  uint64_t v2 = a1 + 8 * a2;
  uint64_t v5 = *(void **)(v2 + 72);
  uint64_t v4 = (void *)(v2 + 72);
  CFIndex v3 = v5;
  if (v5)
  {
    if (a2 == 4)
    {
      if (!*(void *)(a1 + 128))
      {
        CFRelease(v3);
        __int16 v8 = *(const void **)(a1 + 144);
        if (v8)
        {
          CFRelease(v8);
          *(void *)(a1 + 144) = 0;
        }
        goto LABEL_9;
      }
    }
    else if (!a2)
    {
LABEL_8:
      CFRelease(v3);
LABEL_9:
      void *v4 = 0;
      return;
    }
    uint64_t v7 = (int *)v3[4];
    if (v7)
    {
      munmap(v7, v7[1]);
      v3[5] = 0;
      v3[6] = 0;
      v3[4] = 0;
    }
    goto LABEL_8;
  }
}

CFIndex _offsetResultsInArray(const __CFArray *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFIndex result = CFArrayGetCount(a1);
  if (result >= 1)
  {
    CFIndex v5 = result;
    for (CFIndex i = 0; i != v5; ++i)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      __int16 v8 = ValueAtIndex;
      uint64_t v9 = ValueAtIndex[4];
      if (v9 >= a2)
      {
        ValueAtIndex[4] = v9 - a2;
      }
      else
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        __int16 v10 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218240;
          uint64_t v12 = a2;
          __int16 v13 = 2048;
          uint64_t v14 = v9;
          _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, "incorrect context offset %ld for range location %ld", buf, 0x16u);
        }
      }
      CFIndex result = v8[7];
      if (result) {
        CFIndex result = _offsetResultsInArray(result, a2);
      }
    }
  }
  return result;
}

uint64_t __computeLexemsAtPosition_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned char *a5)
{
  __int16 v8 = (void *)result;
  v36[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    *(void *)(*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24)
              + 8 * (15 - (int)++*(_DWORD *)(*(void *)(*(void *)(result + 56) + 8) + 24))) = a2;
    *(void *)(*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24)
              + 8 * (15 - *(int *)(*(void *)(*(void *)(result + 56) + 8) + 24))) = a3;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24)
              + 8 * (int)++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24)
              + 120) = a2;
    *(void *)(*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24)
              + 8 * *(int *)(*(void *)(*(void *)(result + 32) + 8) + 24)
              + 120) = a3;
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(result + 64) + 8) + 24);
  if (v9 > 29)
  {
LABEL_33:
    *a5 = 1;
    *(void *)(*(void *)(v8[8] + 8) + 24) = 30;
    return result;
  }
  uint64_t v10 = 30 - v9;
  MEMORY[0x1F4188790]();
  uint64_t v11 = &v36[-4 * v10];
  CFIndex result = DDLookupTableRefLookupCurrentWord(v8[13], v8[14], a2, v12, a2, (uint64_t)v11, v10, 1);
  if (a4)
  {
    __int16 v13 = *(uint64_t **)(v8[13] + 152);
    if (v13)
    {
      if (result < v10 && (*v13 & 0x8000000000000000) == 0)
      {
        uint64_t v14 = *(void *)(v8[12] + 16) + 48 * ((int)a2 >> 16);
        uint64_t v15 = *(void *)(v14 + 32) + (a2 >> 32) - *(void *)(v14 + 16);
        uint64_t v16 = *v13;
        while (1)
        {
          uint64_t v17 = &v13[8 * v16];
          uint64_t v18 = v17[2];
          if (v18 == v15) {
            break;
          }
          if (v18 >= v15 && v16 != v13[1])
          {
            if (v16-- < 1) {
              uint64_t v16 = 14;
            }
            if (v16 != *v13) {
              continue;
            }
          }
          goto LABEL_27;
        }
        uint64_t v21 = v17[3];
        if (v21 <= 1)
        {
          if (v21 < 1) {
            goto LABEL_27;
          }
          int v22 = &v13[8 * v16 + 6];
        }
        else
        {
          int v22 = (uint64_t *)v13[8 * v16 + 5];
        }
        uint64_t v23 = (uint64_t)&v11[2 * result] + 12;
        uint64_t v24 = 1;
        do
        {
          long long v25 = *((_OWORD *)v22 + 1);
          *(_OWORD *)(v23 - 12) = *(_OWORD *)v22;
          *(_OWORD *)(v23 + 4) = v25;
          unsigned int v26 = (*(_DWORD *)v23 >> 17) & 0x7F;
          *(_DWORD *)uint64_t v23 = *(_DWORD *)v23 & 0xE0FFFFFF | 0x17000000;
          float v27 = (double)v26 / 100.0;
          *(float *)(v23 - 4) = v27;
          uint64_t v28 = v24 + 1;
          if (v24 >= v21) {
            break;
          }
          uint64_t v29 = result + v24;
          v22 += 4;
          v23 += 32;
          ++v24;
        }
        while (v29 < v10);
        CFIndex result = result + v28 - 1;
      }
    }
  }
LABEL_27:
  if (result >= v10) {
    uint64_t v30 = v10;
  }
  else {
    uint64_t v30 = result;
  }
  if (v30 >= 1)
  {
    do
    {
      uint64_t v31 = (_OWORD *)(*(void *)(*(void *)(v8[9] + 8) + 24) + 32
                                                                    * *(void *)(*(void *)(v8[8] + 8) + 24));
      long long v32 = v11[1];
      _OWORD *v31 = *v11;
      v31[1] = v32;
      uint64_t v33 = *(void *)v11;
      v11 += 2;
      uint64_t v34 = *(void *)(*(void *)(v8[8] + 8) + 24);
      uint64_t v35 = *(void *)(*(void *)(v8[10] + 8) + 24) + 40 * v34;
      *(void *)uint64_t v35 = a2;
      *(void *)(v35 + 8) = v33;
      *(void *)(v35 + 16) = (__int16)v33;
      *(void *)(v35 + 24) = v34;
      *(unsigned char *)(v35 + 32) = a4;
      *(_DWORD *)(v35 + 36) = 0;
      *(_DWORD *)(v35 + 33) = 0;
      ++*(void *)(*(void *)(v8[8] + 8) + 24);
      --v30;
    }
    while (v30);
  }
  if (*(uint64_t *)(*(void *)(v8[8] + 8) + 24) >= 30) {
    goto LABEL_33;
  }
  return result;
}

uint64_t keywordSort(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a2 + 16);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 > v3) {
    return 1;
  }
  if (*(int *)a1 >> 16 < *(int *)a2 >> 16) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = HIDWORD(*(void *)a1);
  uint64_t v6 = HIDWORD(*(void *)a2);
  BOOL v7 = (int)v5 < (int)v6;
  unsigned int v8 = (int)v5 > (int)v6;
  if (v7) {
    unsigned int v8 = -1;
  }
  if (*(int *)a1 >> 16 <= *(int *)a2 >> 16) {
    return v8;
  }
  else {
    return 1;
  }
}

BOOL DDScannerScanStringWithContextOffset(uint64_t a1, CFStringRef theString, uint64_t a3)
{
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    return DDScannerScanStringWithRangeAndContextOffset(a1, theString, 0, Length, a3);
  }
  else
  {
    return DDScannerScanString(a1, 0);
  }
}

BOOL DDScannerScanString(uint64_t a1, CFStringRef theString)
{
  uint64_t v2 = a1;
  if (!theString)
  {
    if (a1)
    {
      if (*(unsigned char *)(a1 + 233) == 1)
      {
        int v6 = 1;
LABEL_11:
        DDScannerThreadDebug(a1, v6);
        return 0;
      }
      *(unsigned char *)(a1 + 233) = 1;
      DDScannerReset(a1);
      if (!*(unsigned char *)(v2 + 233))
      {
        a1 = v2;
        int v6 = 0;
        goto LABEL_11;
      }
      *(unsigned char *)(v2 + 233) = 0;
    }
    return 0;
  }
  CFIndex Length = CFStringGetLength(theString);

  return DDScannerScanStringWithRangeAndContextOffset(v2, theString, 0, Length, 0);
}

BOOL DDScannerOverrideTokensForNextScan(uint64_t a1, const void *a2, const void *a3, uint64_t a4)
{
  unsigned int v8 = *(void ***)(a1 + 40);
  if (v8) {
    DDTokenCacheDestroy(v8);
  }
  uint64_t v9 = malloc_type_calloc(1uLL, 0x80uLL, 0x1020040DB4D2780uLL);
  if (v9)
  {
    uint64_t v10 = v9;
    v9[8] = a4;
    uint64_t v11 = malloc_type_malloc(16 * a4, 0x1000040451B5BE8uLL);
    v10[6] = v11;
    memcpy(v11, a3, 16 * a4);
    v10[9] = a4;
    v10[10] = -1;
    if (a4) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
    v10[11] = a4 - 1;
    v10[12] = v12;
    v10[13] = a4;
    v10[14] = -1;
    *((_WORD *)v10 + 60) = 257;
    __int16 v13 = malloc_type_calloc(1uLL, 0x190uLL, 0x10E00409D72FF36uLL);
    if (a2) {
      CFTypeRef v14 = CFRetain(a2);
    }
    else {
      CFTypeRef v14 = 0;
    }
    *__int16 v13 = v10;
    v13[1] = v14;
    v13[4] = malloc_type_calloc(0x5AuLL, 8uLL, 0x2004093837F09uLL);
    v13[6] = 90;
    DDTokenCacheClear((uint64_t)v13);
  }
  else
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v15 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_error_impl(&dword_19DC95000, v15, OS_LOG_TYPE_ERROR, "DD custom tokenizer creation failed", v17, 2u);
    }
    __int16 v13 = 0;
  }
  *(void *)(a1 + 40) = v13;
  BOOL result = v13 != 0;
  *(unsigned char *)(a1 + 236) = result;
  return result;
}

CFArrayRef DDScannerCopyResultsCheckOverlap(uint64_t a1, int a2)
{
  if (a2) {
    unsigned int v2 = 1989;
  }
  else {
    unsigned int v2 = 0;
  }
  return DDScannerCopyResultsWithOptions(a1, v2);
}

CFArrayRef DDScannerCopyResults(uint64_t a1)
{
  return DDScannerCopyResultsWithOptions(a1, 0x7C5u);
}

uint64_t DDScannerCancelScanning(uint64_t result)
{
  *(unsigned char *)(result + 232) |= 1u;
  return result;
}

uint64_t DDScannerIsCancelled(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 232) & 1;
  }
  return result;
}

uint64_t DDScannerEnableDPReporting()
{
  return 0;
}

CFStringRef _DDScannerCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDScanner:%p rows: %d reductions: %ld>", a1, *(unsigned int *)(**(void **)(a1 + 16) + 4), *(void *)(*(void *)(a1 + 16) + 32));
}

CFStringRef _DDScannerCFCopyFormatDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDScanner:%p rows: %d reductions: %ld>", a1, *(unsigned int *)(**(void **)(a1 + 16) + 4), *(void *)(*(void *)(a1 + 16) + 32));
}

BOOL _DDScannerCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _DDScannerCFFinalize(uint64_t a1)
{
  DDTokenCacheDestroy(*(void ***)(a1 + 40));
  DDLexemCacheDestroy(*(void *)(a1 + 48));
  DDLRTableDestroy(*(void **)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*(void *)(a1 + 208))
  {
    uint64_t v3 = malloc_default_purgeable_zone();
    malloc_zone_free(v3, *(void **)(a1 + 208));
  }
  uint64_t v4 = *(const void **)(a1 + 56);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a1 + 64);
  if (v5) {
    CFRelease(v5);
  }
  for (int i = 0; i != 7; ++i)
    _DDScannerDestroyOptionalLookupTable(a1, i);
  DDSourceMatchCacheFree(*(uint64_t **)(a1 + 152));
  BOOL v7 = *(const void **)(a1 + 32);
  if (v7) {
    CFRelease(v7);
  }
  unsigned int v8 = *(const void **)(a1 + 168);
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = *(const void **)(a1 + 160);
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = *(const void **)(a1 + 216);
  if (v10) {
    _Block_release(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 240);
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = *(const void **)(a1 + 264);
  if (v12) {
    CFRelease(v12);
  }
  __int16 v13 = *(const void **)(a1 + 272);
  if (v13)
  {
    CFRelease(v13);
  }
}

uint64_t DDScannerCreateFromCache(void *a1)
{
  return DDScannerCreateFromCacheSupportingMLScan(a1);
}

uint64_t DDScannerGetOptions(uint64_t a1)
{
  return *(void *)(a1 + 192);
}

void DDScannerSetProgressReportingBlock(uint64_t a1, void *aBlock)
{
  uint64_t v4 = *(const void **)(a1 + 216);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(a1 + 216) = 0;
  }
  if (aBlock) {
    *(void *)(a1 + 216) = _Block_copy(aBlock);
  }
}

uint64_t DDScannerSetScannerTimeout(uint64_t result, double a2)
{
  *(double *)(result + 224) = a2;
  return result;
}

void DDScannerSetQOS(uint64_t a1, int a2)
{
  if (DDScannerSetQOS_onceToken != -1) {
    dispatch_once(&DDScannerSetQOS_onceToken, &__block_literal_global_315);
  }
  if (!DDScannerSetQOS_inWebProcess) {
    *(_DWORD *)(a1 + 248) = a2;
  }
}

BOOL DDScannerHasCapabilities(int a1, CFArrayRef theArray)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!theArray) {
    return 1;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    CFIndex v4 = 0;
    uint64_t v5 = 0;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v4);
      if (CFStringCompare(ValueAtIndex, @"dynamicLookup", 0))
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        BOOL v7 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v10 = ValueAtIndex;
          _os_log_error_impl(&dword_19DC95000, v7, OS_LOG_TYPE_ERROR, "Capability not known: %@", buf, 0xCu);
        }
      }
      else
      {
        ++v5;
      }
      ++v4;
    }
    while (Count != v4);
  }
  return Count == v5;
}

void DDScannerEnableOptionalSource(uint64_t a1, uint64_t a2, int a3)
{
  if (a1 && a2 != 8)
  {
    uint64_t v4 = *(void *)(a1 + 200);
    uint64_t v5 = a3 ? v4 | a2 : v4 & ~a2;
    if (v5 != v4)
    {
      if (!a3)
      {
        if (a2 > 3)
        {
          if (a2 == 4) {
            goto LABEL_15;
          }
          if (a2 == 128)
          {
            LODWORD(a2) = 6;
            goto LABEL_15;
          }
        }
        else
        {
          if (a2 == 1)
          {
LABEL_15:
            _DDScannerDestroyOptionalLookupTable(a1, a2);
            goto LABEL_16;
          }
          if (a2 == 2)
          {
            _DDScannerDestroyOptionalLookupTable(a1, 2);
            LODWORD(a2) = 3;
            goto LABEL_15;
          }
        }
      }
LABEL_16:
      *(void *)(a1 + 200) = v5;
      *(void *)(a1 + 136) = 0;
    }
  }
}

void DDScannerSetClientTables(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v16 = a5;
  if (a1)
  {
    if (*(void *)(a1 + 128)) {
      DDScannerSetPrebuiltClientTable((const __CFString *)a1, 0);
    }
    else {
      _DDScannerDestroyOptionalLookupTable(a1, 4);
    }
    DDValidateOptionalSourceTableCount(5, &v16);
    if (a2)
    {
      if (v16)
      {
        if ((*(unsigned char *)(a1 + 200) & 4) != 0)
        {
          uint64_t v17 = v16;
          DDValidateOptionalSourceTableCount(5, (unint64_t *)&v17);
          uint64_t v9 = v17;
          if (v17)
          {
            CFStringRef v10 = (void (*)(void, void, void, void))DDLookupTableCreate();
            if (v10)
            {
              uint64_t v11 = v10;
              _DDSourceUpdateSourceWithContent(v10, a2, a3, a4, v9);
              FinalizedSourceContent = DDSourceCreateFinalizedSourceContent((uint64_t)v11);
              CFRelease(v11);
              if (FinalizedSourceContent)
              {
                BytePtr = (unsigned __int16 *)CFDataGetBytePtr((CFDataRef)FinalizedSourceContent);
                CFIndex Length = CFDataGetLength((CFDataRef)FinalizedSourceContent);
                uint64_t v15 = DDLookupTableCreateFromCacheData(BytePtr, Length, 0, 0);
                *(void *)(a1 + 144) = FinalizedSourceContent;
                *(void *)(a1 + 104) = v15;
              }
            }
          }
        }
      }
    }
  }
}

CFStringRef DDScannerSetPrebuiltClientTable(const __CFString *result, CFStringRef theString2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    BOOL result = (const __CFString *)result[4].isa;
    if (theString2)
    {
      if (result)
      {
        BOOL result = (const __CFString *)CFStringCompare(result, theString2, 0);
        if (!result)
        {
LABEL_13:
          *(void *)(v3 + 136) = 0;
          return result;
        }
      }
    }
    else if (!result)
    {
      return result;
    }
    _DDScannerDestroyOptionalLookupTable(v3, 4);
    uint64_t v4 = *(const void **)(v3 + 128);
    if (v4) {
      CFRelease(v4);
    }
    if (theString2) {
      BOOL result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theString2);
    }
    else {
      BOOL result = 0;
    }
    *(void *)(v3 + 128) = result;
    goto LABEL_13;
  }
  return result;
}

uint64_t DDResultGetCFTypeID()
{
  return DDTypeRegister(&DDResultGetTypeID_typeID);
}

CFStringRef _DDResultCFCopyFormatDescription(void *a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDResult:%p %@ [%ld:%ld, %ld:%ld]>", a1, a1[8], (uint64_t)(int)a1[2] >> 16, (uint64_t)a1[2] >> 32, (uint64_t)(int)a1[3] >> 16, (uint64_t)a1[3] >> 32);
}

CFHashCode _DDResultCFHash(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 64);
  if (v1) {
    return CFHash(v1);
  }
  else {
    return 1;
  }
}

uint64_t _DDResultCFEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DDTypeRegister(&DDResultGetTypeID_typeID);
  if (CFGetTypeID((CFTypeRef)a1) == v4 && CFGetTypeID((CFTypeRef)a2) == v4)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    uint64_t v6 = *(void *)(a2 + 16);
    if (HIDWORD(v5) != HIDWORD(v6)) {
      return 0;
    }
    if ((int)v5 >> 16 != (int)v6 >> 16) {
      return 0;
    }
    uint64_t v7 = *(void *)(a1 + 24);
    uint64_t v8 = *(void *)(a2 + 24);
    if (HIDWORD(v7) != HIDWORD(v8) || (int)v7 >> 16 != (int)v8 >> 16) {
      return 0;
    }
    uint64_t v9 = *(const void **)(a1 + 64);
    CFStringRef v10 = *(const void **)(a2 + 64);
    if (v9)
    {
      if (!v10) {
        return 0;
      }
      uint64_t result = CFEqual(v9, v10);
    }
    else
    {
      uint64_t result = v10 == 0;
    }
    if (!result) {
      return result;
    }
    __int16 v13 = *(const void **)(a1 + 80);
    CFTypeRef v14 = *(const void **)(a2 + 80);
    if (v13)
    {
      if (!v14) {
        return 0;
      }
      uint64_t result = CFEqual(v13, v14);
    }
    else
    {
      uint64_t result = v14 == 0;
    }
    if (!result) {
      return result;
    }
    CFArrayRef v15 = *(const __CFArray **)(a1 + 56);
    if (v15) {
      CFIndex Count = CFArrayGetCount(v15);
    }
    else {
      CFIndex Count = 0;
    }
    CFArrayRef v17 = *(const __CFArray **)(a2 + 56);
    if (v17) {
      CFArrayRef v17 = (const __CFArray *)CFArrayGetCount(v17);
    }
    if (v17 == (const __CFArray *)Count)
    {
      if (Count < 1)
      {
        return 1;
      }
      else
      {
        BOOL v18 = 0;
        for (i = 0; i != Count; BOOL v18 = i >= Count)
        {
          CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
          uint64_t v21 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 56), i);
          if (!CFEqual(ValueAtIndex, v21)) {
            break;
          }
          ++i;
        }
      }
      return v18;
    }
    return 0;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v12 = DDLogHandle_error_log_handle;
  uint64_t result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v22 = 138412546;
    uint64_t v23 = a1;
    __int16 v24 = 2112;
    uint64_t v25 = a2;
    _os_log_error_impl(&dword_19DC95000, v12, OS_LOG_TYPE_ERROR, "type mismatch when calling _DDResultCFEqual on %@ and %@", (uint8_t *)&v22, 0x16u);
    return 0;
  }
  return result;
}

uint64_t DDResultCreateEmpty()
{
  CFTypeID v0 = DDTypeRegister(&DDResultGetTypeID_typeID);

  return DDTypeCreateInstance_(0, v0, 0x60uLL);
}

void DDResultSetType(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3 = *(CFTypeRef *)(a1 + 64);
  if (v3 != cf)
  {
    if (v3) {
      CFRelease(v3);
    }
    *(void *)(a1 + 64) = cf;
    if (cf)
    {
      CFRetain(cf);
    }
  }
}

CFMutableArrayRef DDResultSetSubResults(uint64_t a1, CFArrayRef theArray)
{
  CFMutableArrayRef result = *(CFMutableArrayRef *)(a1 + 56);
  if (result != theArray)
  {
    if (result) {
      CFRelease(result);
    }
    CFMutableArrayRef result = 0;
    if (theArray) {
      CFMutableArrayRef result = CFArrayCreateMutableCopy(0, 0, theArray);
    }
    *(void *)(a1 + 56) = result;
  }
  return result;
}

void DDResultRemoveSubresultWithType(uint64_t a1, const __CFString *a2)
{
  CFArrayRef v3 = *(const __CFArray **)(a1 + 56);
  CFIndex Count = CFArrayGetCount(v3);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v3, v6);
      if (a2)
      {
        if (ValueAtIndex && _typesAreEqual(ValueAtIndex[8], a2)) {
          break;
        }
      }
      if (v5 == ++v6) {
        return;
      }
    }
    CFArrayRemoveValueAtIndex(v3, v6);
  }
}

void DDResultAddSubresultSorted(uint64_t a1, void *a2)
{
  CFArrayRef Mutable = *(const __CFArray **)(a1 + 56);
  if (!Mutable)
  {
    CFArrayRef Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E4F1D510]);
    *(void *)(a1 + 56) = Mutable;
  }
  uint64_t v5 = a2[4];
  CFIndex Count = CFArrayGetCount(Mutable);
  if (Count < 1)
  {
    CFIndex v7 = 0;
  }
  else
  {
    CFIndex v7 = 0;
    while (*((void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v7) + 4) <= v5)
    {
      if (Count == ++v7) {
        goto LABEL_10;
      }
    }
  }
  if (v7 == Count)
  {
LABEL_10:
    uint64_t v8 = *(__CFArray **)(a1 + 56);
    CFArrayAppendValue(v8, a2);
  }
  else
  {
    uint64_t v9 = *(__CFArray **)(a1 + 56);
    CFArrayInsertValueAtIndex(v9, v7, a2);
  }
}

uint64_t DDResultGetRange(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t DDResultGetSubResults(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t DDResultGetValue(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFMutableArrayRef result = *(void *)(result + 80);
    if (!result) {
      return *(void *)(v1 + 72);
    }
  }
  return result;
}

uint64_t DDResultGetMatchedString(uint64_t result)
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

void DDResultSetContextualData(uint64_t a1, CFTypeRef cf)
{
  if (a1)
  {
    CFTypeRef v4 = *(CFTypeRef *)(a1 + 88);
    if (v4 != cf)
    {
      if (v4)
      {
        CFRelease(v4);
        *(void *)(a1 + 88) = 0;
      }
      if (cf)
      {
        CFTypeID v5 = CFGetTypeID(cf);
        if (v5 == CFDictionaryGetTypeID()) {
          *(void *)(a1 + 88) = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)cf);
        }
      }
    }
  }
}

void DDResultSetTestUrlificationRange(uint64_t a1, uint64_t a2, int a3)
{
  if (a1)
  {
    int v3 = a2;
    if (a2 != -1)
    {
      if (!*(void *)(a1 + 88)) {
        *(void *)(a1 + 88) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      int v9 = a3;
      int valuePtr = v3;
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
      CFNumberRef v8 = CFNumberCreate(v6, kCFNumberIntType, &v9);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 88), @"urlificationBegin", v7);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 88), @"urlificationLength", v8);
      CFRelease(v7);
      CFRelease(v8);
    }
  }
}

uint64_t DDResultGetTestUrlificationRange(uint64_t a1)
{
  if (!a1) {
    return -1;
  }
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 88);
  if (v2
    && ((CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v2, @"urlificationBegin"),
         CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 88), @"urlificationLength"),
         Value)
      ? (BOOL v5 = v4 == 0)
      : (BOOL v5 = 1),
        !v5
     && (CFNumberRef v6 = v4, valuePtr = 0, CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4))
     && CFNumberGetValue(v6, kCFNumberIntType, &valuePtr)))
  {
    return SHIDWORD(valuePtr);
  }
  else
  {
    return -1;
  }
}

void DDResultAppendContextualData(uint64_t a1, void *value, void *key)
{
  if (a1 && key)
  {
    CFArrayRef Mutable = *(__CFDictionary **)(a1 + 88);
    if (!Mutable)
    {
      CFArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      *(void *)(a1 + 88) = Mutable;
    }
    CFDictionarySetValue(Mutable, key, value);
  }
}

const void *DDResultGetContextualDataForKey(uint64_t a1, const void *a2)
{
  if (a1 && a2 && (CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 88)) != 0) {
    return CFDictionaryGetValue(v2, a2);
  }
  else {
    return 0;
  }
}

uint64_t DDResultGetContextualData(uint64_t result)
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

float DDResultGetContextualFloat(uint64_t a1)
{
  CFStringRef ValueAtIndex = (const void *)a1;
  if (*(unsigned char *)(a1 + 104)) {
    return *((float *)ValueAtIndex + 27);
  }
  CFArrayRef v3 = *(const __CFArray **)(a1 + 56);
  if (v3
    && CFArrayGetCount(v3) == 1
    && (CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)ValueAtIndex + 7), 0), *((unsigned char *)ValueAtIndex + 104)))
  {
    return *((float *)ValueAtIndex + 27);
  }
  else
  {
    return NAN;
  }
}

uint64_t DDResultHasContextualFloat(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 104))
    {
      return 1;
    }
    else
    {
      CFMutableArrayRef result = *(void *)(result + 56);
      if (result)
      {
        if (CFArrayGetCount((CFArrayRef)result) == 1)
        {
          CFMutableArrayRef result = (uint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 56), 0);
          if (result) {
            return *(unsigned char *)(result + 104) != 0;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t DDResultGetQueryRange(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

const __CFString **DDResultGetCountryCode(const __CFString **result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    if (_typesAreEqual(result[8], @"FullAddress"))
    {
      CFMutableArrayRef result = _DDResultGetCountryCodeForSubresult(v1, @"Country");
      if (!result)
      {
        CFMutableArrayRef result = _DDResultGetCountryCodeForSubresult(v1, @"State");
        if (!result)
        {
          CFMutableArrayRef result = _DDResultGetCountryCodeForSubresult(v1, @"ZipCode");
          if (!result) {
            return _DDResultGetCountryCodeForSubresult(v1, @"City");
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFString **_DDResultGetCountryCodeForSubresult(uint64_t a1, const __CFString *a2)
{
  CFMutableArrayRef result = DDResultGetSubresultWithType(a1, a2);
  if (result)
  {
    CFMutableArrayRef result = DDResultGetSubresultWithType((uint64_t)result, @"CountryCode");
    if (result)
    {
      CFArrayRef v3 = result;
      CFMutableArrayRef result = (const __CFString **)result[10];
      if (!result) {
        return (const __CFString **)v3[9];
      }
    }
  }
  return result;
}

uint64_t _DDGetRelevantSubResultRangeForResult(uint64_t a1)
{
  CFArrayRef v1 = *(const __CFArray **)(a1 + 56);
  if (!v1) {
    return -1;
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (Count < 1) {
    return -1;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  uint64_t v5 = -1;
  do
  {
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
    CFStringRef v7 = (const __CFString *)*((void *)ValueAtIndex + 8);
    if (v7)
    {
      CFNumberRef v8 = ValueAtIndex;
      if (_typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), @"RelativeDay")) {
        return -1;
      }
      uint64_t v9 = v8[4];
      if (_typesAreEqual(v7, @"Date")
        || _typesAreEqual(v7, @"AbsoluteDate")
        || _typesAreEqual(v7, @"RelativeDayOfWeek"))
      {
        uint64_t v10 = _DDGetRelevantSubResultRangeForResult(v8);
        if (v10 == -1) {
          return -1;
        }
        uint64_t v9 = v10;
      }
      if (v5 == -1) {
        uint64_t v5 = v9;
      }
    }
    ++v4;
  }
  while (v3 != v4);
  return v5;
}

CFStringRef DDResultGetQueryRangeForURLification(uint64_t a1)
{
  CFDictionaryRef v2 = 0;
  return _DDGetRelevantResultsForUrlificationRange(a1, &v2)[2];
}

uint64_t DDResultSetAbsoluteRange(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = a3;
  return result;
}

CFIndex DDResultOffsetAbsoluteRange(CFIndex result, uint64_t a2)
{
  if (result && a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2 + a2 < 0 != __OFADD__(v2, a2)) {
      a2 = -v2;
    }
    *(void *)(result + 32) = a2 + v2;
    return DDResultOffsetAbsoluteRangesNoCheck(*(void *)(result + 56), a2);
  }
  return result;
}

CFIndex DDResultOffsetAbsoluteRangesNoCheck(CFIndex result, uint64_t a2)
{
  if (result)
  {
    CFArrayRef v3 = (const __CFArray *)result;
    CFMutableArrayRef result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      CFIndex v4 = result;
      for (CFIndex i = 0; i != v4; ++i)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        ValueAtIndex[4] += a2;
        CFMutableArrayRef result = DDResultOffsetAbsoluteRangesNoCheck(ValueAtIndex[7], a2);
      }
    }
  }
  return result;
}

void DDResultSetMatchedString(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3 = *(CFTypeRef *)(a1 + 72);
  if (v3 != cf)
  {
    if (v3) {
      CFRelease(v3);
    }
    *(void *)(a1 + 72) = cf;
    if (cf)
    {
      CFRetain(cf);
    }
  }
}

CFArrayRef DDResultGetSubresultWithTypePath(uint64_t a1, const __CFString *a2)
{
  CFArrayRef result = 0;
  if (a1)
  {
    if (a2)
    {
      CFArrayRef result = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, @".");
      if (result)
      {
        CFArrayRef v4 = result;
        CFIndex Count = CFArrayGetCount(result);
        if (Count >= 1)
        {
          CFIndex v6 = Count;
          uint64_t v7 = 1;
          do
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, v7 - 1);
            uint64_t SubresultWithType = DDResultGetSubresultWithType(a1, ValueAtIndex);
            a1 = (uint64_t)SubresultWithType;
            if (v7 >= v6) {
              break;
            }
            ++v7;
          }
          while (SubresultWithType);
        }
        CFRelease(v4);
        return (const __CFArray *)a1;
      }
    }
  }
  return result;
}

const void *DDResultGetUnwrappedResultOfType(uint64_t a1, const __CFString *a2)
{
  if (!a1 || !a2 || !_typesAreEqual(*(CFStringRef *)(a1 + 64), a2)) {
    return (const void *)a1;
  }
  CFArrayRef v3 = *(const __CFArray **)(a1 + 56);

  return CFArrayGetValueAtIndex(v3, 0);
}

CFArrayRef DDResultValueContains(CFArrayRef result, const __CFString *a2)
{
  if (!result) {
    return result;
  }
  CFStringRef v3 = (const __CFString *)*((void *)result + 10);
  if (!v3)
  {
    CFStringRef v3 = (const __CFString *)*((void *)result + 9);
    if (!v3) {
      return 0;
    }
  }
  if (CFStringFind(v3, @"-", 0).location == -1) {
    return (CFArrayRef)(CFEqual(v3, a2));
  }
  CFArrayRef result = CFStringCreateArrayBySeparatingStrings(0, v3, @"-");
  if (!result) {
    return result;
  }
  CFArrayRef v4 = result;
  CFIndex Count = CFArrayGetCount(result);
  if (Count < 1)
  {
LABEL_10:
    CFRelease(v4);
    return 0;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v4, v7);
    if (CFEqual(ValueAtIndex, a2)) {
      break;
    }
    if (v6 == ++v7) {
      goto LABEL_10;
    }
  }
  CFRelease(v4);
  return (CFArrayRef)1;
}

uint64_t DDResultGetVirtualDistance(uint64_t a1, uint64_t a2)
{
  uint64_t result = -1;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a2 + 32);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v5 + *(void *)(a1 + 40);
    uint64_t v7 = v4 + *(void *)(a2 + 40);
    if (v6 >= v7) {
      uint64_t v8 = v4 + *(void *)(a2 + 40);
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v9 = 20;
    if (v4 < v5) {
      uint64_t v9 = 0;
    }
    BOOL v10 = v4 <= v5 && v5 < v7;
    uint64_t v11 = v5;
    if (v10 || v5 <= v4 && (uint64_t v11 = *(void *)(a2 + 32), v4 < v6))
    {
      if (v8 != v11) {
        return 0;
      }
    }
    uint64_t v12 = v5 - v7;
    uint64_t v13 = v4 - v6;
    if (v4 < v5) {
      uint64_t v13 = v12;
    }
    if (v13) {
      return v13 + v9;
    }
    else {
      return 0;
    }
  }
  return result;
}

__CFString *DDResultGetTagTypeForDataType(__CFString *result)
{
  if (result)
  {
    CFArrayRef v1 = result;
    if (_typesAreEqual((CFStringRef)result[2].isa, @"TrackingInformation"))
    {
      return @"Carrier";
    }
    else if (_typesAreEqual((CFStringRef)v1[2].isa, @"FlightInformation"))
    {
      return @"AirlineCode";
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL DDResultMatchesMLClassification(uint64_t a1, int a2)
{
  return a2 != 10 && DDMLClassificationForType(a1) == a2;
}

uint64_t DDMLClassificationForType(uint64_t a1)
{
  if (CFStringHasPrefix(*(CFStringRef *)(a1 + 64), @"FullAddress")) {
    return 0;
  }
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"FlightInformation")) {
    return 3;
  }
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"Money")) {
    return 4;
  }
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"PhysicalAmount")) {
    return 6;
  }
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"Email")) {
    return 9;
  }
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"PhoneNumber")) {
    return 8;
  }
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"Location")) {
    return 1;
  }
  if (DDResultGetCategory(a1) == 4) {
    return 5;
  }
  return 10;
}

uint64_t DDResultTypeIsMLSupported(uint64_t a1, const __CFArray *a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    int valuePtr = DDMLClassificationForType(a1);
    if (valuePtr == 10) {
      return 0;
    }
    CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (!v4)
    {
      return 0;
    }
    else
    {
      CFNumberRef v5 = v4;
      v8.CFArrayRef length = CFArrayGetCount(a2);
      v8.NSUInteger location = 0;
      uint64_t v2 = CFArrayContainsValue(a2, v8, v5);
      CFRelease(v5);
    }
  }
  return v2;
}

uint64_t DDResultGetOptionalSourceTableIndex(uint64_t a1)
{
  if (!a1) {
    return -1;
  }
  uint64_t v2 = *(const void **)(a1 + 64);
  if (CFEqual(v2, @"GameCenter")) {
    return 0;
  }
  if (CFEqual(v2, @"Parsec") || CFEqual(v2, @"Client"))
  {
    CFArrayRef v4 = *(const __CFArray **)(a1 + 56);
    if (v4)
    {
      if (CFArrayGetCount(v4) == 1)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
        if (ValueAtIndex)
        {
          CFStringRef v6 = (const __CFString *)*((void *)ValueAtIndex + 8);
          CFIndex Length = CFStringGetLength(v6);
          if (Length >= 1)
          {
            int CharacterAtIndex = CFStringGetCharacterAtIndex(v6, Length - 1);
            if ((CharacterAtIndex - 58) > 0xFFFFFFF5) {
              return (CharacterAtIndex - 48);
            }
          }
        }
      }
    }
  }
  return -1;
}

uint64_t DDResultSetProperties(uint64_t result, uint64_t a2, int a3)
{
  if (a3) {
    uint64_t v3 = *(void *)(result + 96) | a2;
  }
  else {
    uint64_t v3 = *(void *)(result + 96) & ~a2;
  }
  *(void *)(result + 96) = v3;
  return result;
}

uint64_t DDResultProximitySort(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a3 + 32);
  uint64_t v6 = v5;
  uint64_t v7 = v5 + *(void *)(a3 + 40);
  uint64_t v8 = v3 + *(void *)(a1 + 40);
  if (v7 >= v8) {
    uint64_t v9 = v3 + *(void *)(a1 + 40);
  }
  else {
    uint64_t v9 = v5 + *(void *)(a3 + 40);
  }
  BOOL v10 = v3 <= v5 && v5 < v8;
  uint64_t v11 = *(void *)(a3 + 32);
  if ((v10 || (v5 <= v3 ? (v12 = v3 < v7) : (v12 = 0), uint64_t v11 = *(void *)(a1 + 32), v12)) && v9 != v11)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v13 = v5 - v8;
    if (v5 > v3) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v3 - v7;
    }
  }
  uint64_t v15 = v4 + *(void *)(a2 + 40);
  if (v7 >= v15) {
    uint64_t v16 = v4 + *(void *)(a2 + 40);
  }
  else {
    uint64_t v16 = v5 + *(void *)(a3 + 40);
  }
  BOOL v17 = v4 <= v5 && v5 < v15;
  if ((v17 || v5 <= v4 && (uint64_t v6 = *(void *)(a2 + 32), v4 < v7)) && v16 != v6)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v18 = v4 - v7;
    if (v5 > v4) {
      uint64_t v19 = v5 - v15;
    }
    else {
      uint64_t v19 = v18;
    }
  }
  BOOL v20 = v14 <= v19;
  uint64_t v21 = v14 < v19 || a1 == a3;
  BOOL v22 = !v20 || a2 == a3;
  uint64_t v23 = v21 << 63 >> 63;
  if (v22) {
    return 1;
  }
  else {
    return v23;
  }
}

uint64_t DDResultRangeCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  BOOL v6 = v3 == v5;
  if (v3 < v5) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v6) {
    uint64_t v7 = 0;
  }
  BOOL v8 = v2 < v4;
  if (v2 == v4) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 1;
  }
  if (v8) {
    return -1;
  }
  else {
    return v9;
  }
}

void *DDResultCreateFromXMLNode(const xmlNode *a1)
{
  if (!xmlHasProp(a1, (const xmlChar *)"begin") || !xmlHasProp(a1, (const xmlChar *)"end")) {
    return 0;
  }
  xmlAttrPtr v2 = xmlHasProp(a1, (const xmlChar *)"begin");
  uint64_t v3 = (void (**)(xmlChar *))MEMORY[0x1E4FBA9D0];
  if (v2 && (Prop = xmlGetProp(a1, (const xmlChar *)"begin")) != 0)
  {
    uint64_t v5 = Prop;
    unsigned int v28 = 0;
    sscanf((const char *)Prop, "%d", &v28);
    (*v3)(v5);
    uint64_t v6 = v28;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (xmlHasProp(a1, (const xmlChar *)"end") && (uint64_t v7 = xmlGetProp(a1, (const xmlChar *)"end")) != 0)
  {
    BOOL v8 = v7;
    unsigned int v28 = 0;
    sscanf((const char *)v7, "%d", &v28);
    (*v3)(v8);
    uint64_t v9 = v28;
  }
  else
  {
    uint64_t v9 = 0;
  }
  CFStringRef v10 = CFStringCreateWithCString(0, (const char *)a1->name, 0x8000100u);
  uint64_t v11 = DDResultCreate(v10, v6 << 32, v9 << 32);
  CFRelease(v10);
  v11[4] = (int)v6;
  v11[5] = (int)v9 - (int)v6;
  if (xmlHasProp(a1, (const xmlChar *)"urlificationBegin") && xmlHasProp(a1, (const xmlChar *)"urlificationEnd"))
  {
    if (xmlHasProp(a1, (const xmlChar *)"urlificationBegin"))
    {
      BOOL v12 = xmlGetProp(a1, (const xmlChar *)"urlificationBegin");
      uint64_t v13 = (uint64_t)v12;
      if (v12)
      {
        unsigned int v28 = 0;
        sscanf((const char *)v12, "%d", &v28);
        (*v3)((xmlChar *)v13);
        uint64_t v13 = (int)v28;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    if (xmlHasProp(a1, (const xmlChar *)"urlificationEnd")
      && (uint64_t v14 = xmlGetProp(a1, (const xmlChar *)"urlificationEnd")) != 0)
    {
      uint64_t v15 = v14;
      unsigned int v28 = 0;
      sscanf((const char *)v14, "%d", &v28);
      (*v3)(v15);
      unsigned int v16 = v28;
    }
    else
    {
      unsigned int v16 = 0;
    }
    DDResultSetTestUrlificationRange((uint64_t)v11, v13, v16 - v13);
  }
  if (xmlHasProp(a1, (const xmlChar *)"score"))
  {
    if (xmlHasProp(a1, (const xmlChar *)"score") && (BOOL v17 = xmlGetProp(a1, (const xmlChar *)"score")) != 0)
    {
      uint64_t v18 = v17;
      unsigned int v28 = 0;
      sscanf((const char *)v17, "%d", &v28);
      (*v3)(v18);
      uint64_t v19 = (int)v28;
    }
    else
    {
      uint64_t v19 = 0;
    }
    v11[6] = v19;
  }
  if (xmlHasProp(a1, (const xmlChar *)"value"))
  {
    BOOL v20 = xmlGetProp(a1, (const xmlChar *)"value");
    CFStringRef v21 = CFStringCreateWithCString(0, (const char *)v20, 0x8000100u);
    (*v3)(v20);
    if (v21)
    {
      DDResultSetValue((uint64_t)v11, v21);
      CFRelease(v21);
    }
  }
  if (xmlHasProp(a1, (const xmlChar *)"id"))
  {
    BOOL v22 = xmlGetProp(a1, (const xmlChar *)"id");
    uint64_t v23 = (__CFString *)CFStringCreateWithCString(0, (const char *)v22, 0x8000100u);
    (*v3)(v22);
    if (v23)
    {
      DDResultAppendContextualData((uint64_t)v11, v23, @"C");
      CFRelease(v23);
    }
  }
  for (CFIndex i = a1->children; i; CFIndex i = i->next)
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      uint64_t v25 = (void *)DDResultCreateFromXMLNode(i);
      if (!v25)
      {
        CFRelease(v11);
        return 0;
      }
      uint64_t v26 = v25;
      DDResultAddSubresult((uint64_t)v11, v25);
      CFRelease(v26);
    }
  }
  return v11;
}

xmlNode *DDResultCreateVerboseXMLRepresentation(uint64_t a1, const __CFString *a2, int a3)
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 64));
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFStringRef v8 = *(const __CFString **)(a1 + 80);
  if (v8)
  {
    CFIndex v9 = CFStringGetLength(v8);
    CFIndex v10 = CFStringGetMaximumSizeForEncoding(v9, 0x8000100u);
  }
  else
  {
    CFIndex v10 = 0;
  }
  CFDictionaryRef v11 = *(const __CFDictionary **)(a1 + 88);
  if (v11)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v11, @"C");
    CFStringRef v13 = Value;
    if (Value)
    {
      CFIndex v14 = CFStringGetLength(Value);
      CFIndex v15 = CFStringGetMaximumSizeForEncoding(v14, 0x8000100u);
      char v16 = 0;
    }
    else
    {
      CFIndex v15 = 0;
      char v16 = 1;
    }
    CFDictionaryRef v11 = *(const __CFDictionary **)(a1 + 88);
    if (v11)
    {
      CFStringRef v19 = (const __CFString *)CFDictionaryGetValue(v11, @"U");
      CFStringRef v18 = v19;
      if (v19)
      {
        CFIndex v20 = CFStringGetLength(v19);
        CFIndex v17 = CFStringGetMaximumSizeForEncoding(v20, 0x8000100u);
        char v57 = 0;
      }
      else
      {
        CFIndex v17 = 0;
        char v57 = 1;
      }
      CFDictionaryRef v11 = *(const __CFDictionary **)(a1 + 88);
      if (v11 && (CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(v11, @"D")) != 0)
      {
        CFStringRef v55 = (const __CFString *)v11;
        CFIndex v21 = CFStringGetLength((CFStringRef)v11);
        CFDictionaryRef v11 = (const __CFDictionary *)CFStringGetMaximumSizeForEncoding(v21, 0x8000100u);
        char v56 = 0;
      }
      else
      {
        CFStringRef v55 = 0;
        char v56 = 1;
      }
    }
    else
    {
      CFIndex v17 = 0;
      CFStringRef v18 = 0;
      CFStringRef v55 = 0;
      char v56 = 1;
      char v57 = 1;
    }
  }
  else
  {
    CFIndex v17 = 0;
    CFStringRef v18 = 0;
    CFStringRef v13 = 0;
    CFIndex v15 = 0;
    CFStringRef v55 = 0;
    char v56 = 1;
    char v57 = 1;
    char v16 = 1;
  }
  uint64_t v22 = 128;
  if (MaximumSizeForEncoding >= 128) {
    uint64_t v22 = MaximumSizeForEncoding + 1;
  }
  if (v22 <= v10 + 1) {
    uint64_t v22 = v10 + 1;
  }
  if (v22 <= v15 + 1) {
    uint64_t v22 = v15 + 1;
  }
  if (v22 <= v17 + 1) {
    uint64_t v22 = v17 + 1;
  }
  if (v22 <= (uint64_t)v11 + 1) {
    size_t v23 = (size_t)v11 + 1;
  }
  else {
    size_t v23 = v22;
  }
  __int16 v24 = malloc_type_malloc(v23, 0x100004077774924uLL);
  if (!CFStringGetCString(*(CFStringRef *)(a1 + 64), (char *)v24, v23, 0x8000100u))
  {
    free(v24);
    return 0;
  }
  char v54 = v16;
  CFStringRef theString = v13;
  uint64_t v25 = xmlNewNode(0, (const xmlChar *)v24);
  snprintf((char *)v24, v23, "%d", *(_DWORD *)(a1 + 20));
  xmlNewProp(v25, (const xmlChar *)"begin", (const xmlChar *)v24);
  snprintf((char *)v24, v23, "%d", *(_DWORD *)(a1 + 28));
  xmlNewProp(v25, (const xmlChar *)"end", (const xmlChar *)v24);
  if (a3)
  {
    CFStringRef v52 = v18;
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t RangeForURLification = DDResultGetRangeForURLification(a1);
    uint64_t v30 = RangeForURLification;
    uint64_t v31 = v29;
    BOOL v32 = v27 == RangeForURLification;
    CFStringRef v18 = v52;
    if (!v32 || v26 != v29)
    {
      CFIndex usedBufLen = 0;
      CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v34 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%ld", RangeForURLification);
      v60.CFArrayRef length = CFStringGetLength(v34);
      v60.NSUInteger location = 0;
      CFStringGetBytes(v34, v60, 0x8000100u, 0x2Du, 0, (UInt8 *)v24, v23, &usedBufLen);
      *((unsigned char *)v24 + usedBufLen) = 0;
      CFRelease(v34);
      xmlNewProp(v25, (const xmlChar *)"urlificationBegin", (const xmlChar *)v24);
      CFAllocatorRef v35 = v33;
      CFStringRef v18 = v52;
      CFStringRef v36 = CFStringCreateWithFormat(v35, 0, @"%ld", v30 + v31);
      v61.CFArrayRef length = CFStringGetLength(v36);
      v61.NSUInteger location = 0;
      CFStringGetBytes(v36, v61, 0x8000100u, 0x2Du, 0, (UInt8 *)v24, v23, &usedBufLen);
      *((unsigned char *)v24 + usedBufLen) = 0;
      CFRelease(v36);
      xmlNewProp(v25, (const xmlChar *)"urlificationEnd", (const xmlChar *)v24);
    }
  }
  if (*(void *)(a1 + 48))
  {
    snprintf((char *)v24, v23, "%ld", *(void *)(a1 + 48));
    xmlNewProp(v25, (const xmlChar *)"score", (const xmlChar *)v24);
  }
  CFStringRef v37 = *(const __CFString **)(a1 + 80);
  if (v37)
  {
    if (!CFStringGetCString(v37, (char *)v24, v23, 0x8000100u)) {
      goto LABEL_68;
    }
    xmlNewProp(v25, (const xmlChar *)"value", (const xmlChar *)v24);
  }
  if (*(unsigned char *)(a1 + 104))
  {
    CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"%f", *(float *)(a1 + 108));
    if (v38)
    {
      CFStringRef v39 = v38;
      if (!CFStringGetCString(v38, (char *)v24, v23, 0x8000100u))
      {
        CFRelease(v39);
        goto LABEL_68;
      }
      xmlNewProp(v25, (const xmlChar *)"floatMeta", (const xmlChar *)v24);
      CFRelease(v39);
    }
  }
  if ((v54 & 1) == 0)
  {
    if (!CFStringGetCString(theString, (char *)v24, v23, 0x8000100u)) {
      goto LABEL_68;
    }
    xmlNewProp(v25, (const xmlChar *)"ABUID", (const xmlChar *)v24);
  }
  if (v57) {
    goto LABEL_50;
  }
  if (!CFStringGetCString(v18, (char *)v24, v23, 0x8000100u))
  {
LABEL_68:
    free(v24);
    xmlFreeNode(v25);
    return 0;
  }
  xmlNewProp(v25, (const xmlChar *)"UUID", (const xmlChar *)v24);
LABEL_50:
  if (v56) {
    goto LABEL_53;
  }
  if (!CFStringGetCString(v55, (char *)v24, v23, 0x8000100u)) {
    goto LABEL_68;
  }
  xmlNewProp(v25, (const xmlChar *)"Domain", (const xmlChar *)v24);
LABEL_53:
  free(v24);
  CFIndex v41 = *(void *)(a1 + 32);
  CFIndex v40 = *(void *)(a1 + 40);
  CFArrayRef v42 = *(const __CFArray **)(a1 + 56);
  if (v42)
  {
    CFIndex v58 = v40;
    CFIndex v43 = 0;
    CFIndex v44 = v41;
    while (v43 < CFArrayGetCount(v42))
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v42, v43);
      uint64_t v46 = ValueAtIndex[4];
      VerboseXMLRepresentation = (xmlNode *)DDResultCreateVerboseXMLRepresentation();
      if (a2)
      {
        if (v46 > v44) {
          _DDResultAppendXMLTextNode(v25, a2, v44, v46 - v44);
        }
      }
      xmlAddChild(v25, VerboseXMLRepresentation);
      CFIndex v44 = ValueAtIndex[5] + ValueAtIndex[4];
      ++v43;
    }
    if (a2)
    {
      CFIndex v40 = v58 + v41 - v44;
      if (v58 + v41 > v44)
      {
        unint64_t v48 = v25;
        CFStringRef v49 = a2;
        CFIndex v50 = v44;
LABEL_66:
        _DDResultAppendXMLTextNode(v48, v49, v50, v40);
      }
    }
  }
  else if (a2)
  {
    unint64_t v48 = v25;
    CFStringRef v49 = a2;
    CFIndex v50 = v41;
    goto LABEL_66;
  }
  return v25;
}

void _DDResultAppendXMLTextNode(xmlNode *a1, CFStringRef theString, CFIndex a3, CFIndex a4)
{
  if (CFStringGetLength(theString) >= a3 + a4)
  {
    v14.NSUInteger location = a3;
    v14.CFArrayRef length = a4;
    CFStringRef v8 = CFStringCreateWithSubstring(0, theString, v14);
    MutableCFArrayRef Copy = CFStringCreateMutableCopy(0, 0, v8);
    CFRelease(v8);
    CFStringTrimWhitespace(MutableCopy);
    if (CFStringGetLength(MutableCopy))
    {
      CFIndex v10 = CFStringGetMaximumSizeForEncoding(a4, 0x8000100u) + 1;
      CFDictionaryRef v11 = (char *)malloc_type_malloc(v10, 0x100004077774924uLL);
      CFStringGetCString(MutableCopy, v11, v10, 0x8000100u);
      BOOL v12 = xmlNewText((const xmlChar *)v11);
      xmlAddChild(a1, v12);
      free(v11);
    }
    CFRelease(MutableCopy);
  }
}

xmlNode *DDResultCreateXMLRepresentation(uint64_t a1, int a2)
{
  return DDResultCreateVerboseXMLRepresentation(a1, 0, a2);
}

CFStringRef DDResultCreateVerboseXMLDescription(uint64_t a1, const __CFString *a2, int a3)
{
  VerboseXMLRepresentation = DDResultCreateVerboseXMLRepresentation(a1, a2, a3);
  CFStringRef DescriptionOfXMLNode = _DDResultCreateDescriptionOfXMLNode(VerboseXMLRepresentation);
  xmlFreeNode(VerboseXMLRepresentation);
  return DescriptionOfXMLNode;
}

CFStringRef _DDResultCreateDescriptionOfXMLNode(xmlNode *a1)
{
  xmlBufferPtr v2 = xmlBufferCreate();
  xmlNodeDump(v2, a1->doc, a1, 0, 1);
  uint64_t v3 = (const char *)xmlBufferContent(v2);
  CFStringRef v4 = CFStringCreateWithCString(0, v3, 0x8000100u);
  xmlBufferFree(v2);
  return v4;
}

CFStringRef DDResultCreateVerboseXMLDescriptionFromResults(const __CFArray *a1, const __CFString *a2, int a3)
{
  uint64_t v6 = xmlNewNode(0, (const xmlChar *)"results");
  for (CFIndex i = 0; i < CFArrayGetCount(a1); ++i)
  {
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
    VerboseXMLRepresentation = DDResultCreateVerboseXMLRepresentation((uint64_t)ValueAtIndex, a2, a3);
    xmlAddChild(v6, VerboseXMLRepresentation);
  }
  CFStringRef DescriptionOfXMLNode = _DDResultCreateDescriptionOfXMLNode(v6);
  xmlFreeNode(v6);
  return DescriptionOfXMLNode;
}

BOOL DDResultIsEqualToUnitTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a2 + 16);
  if (HIDWORD(v3) != HIDWORD(v4)) {
    return 0;
  }
  if ((int)v3 >> 16 != (int)v4 >> 16) {
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a2 + 24);
  if (HIDWORD(v7) != HIDWORD(v8) || (int)v7 >> 16 != (int)v8 >> 16) {
    return 0;
  }
  CFIndex v10 = *(const void **)(a1 + 64);
  CFDictionaryRef v11 = *(const void **)(a2 + 64);
  if (v10)
  {
    if (v11)
    {
      int v12 = CFEqual(v10, v11);
      goto LABEL_9;
    }
    return 0;
  }
  int v12 = v11 == 0;
LABEL_9:
  if (!v12) {
    return 0;
  }
  CFStringRef v13 = *(const void **)(a1 + 80);
  if (v13)
  {
    CFRange v14 = *(const void **)(a2 + 80);
    if (!v14)
    {
      CFRange v14 = *(const void **)(a2 + 72);
      if (!v14) {
        return 0;
      }
    }
    if (!CFEqual(v13, v14)) {
      return 0;
    }
  }
  CFArrayRef v15 = *(const __CFArray **)(a1 + 56);
  if (v15) {
    CFIndex Count = CFArrayGetCount(v15);
  }
  else {
    CFIndex Count = 0;
  }
  CFArrayRef v17 = *(const __CFArray **)(a2 + 56);
  if (v17) {
    CFArrayRef v17 = (const __CFArray *)CFArrayGetCount(v17);
  }
  if (v17 != (const __CFArray *)Count) {
    return 0;
  }
  if (!a3
    || ((uint64_t TestUrlificationRange = DDResultGetTestUrlificationRange(a1), TestUrlificationRange == -1)
      ? (v20 = *(void *)(a1 + 32), uint64_t v21 = *(void *)(a1 + 40))
      : (v20 = TestUrlificationRange, uint64_t v21 = v19),
        (BOOL v22 = 0, v20 == DDResultGetRangeForURLification(a2)) && v21 == v24))
  {
    if (Count < 1)
    {
      return 1;
    }
    else
    {
      BOOL v22 = 0;
      for (i = 0; i != Count; BOOL v22 = i >= Count)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
        uint64_t v27 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 56), i);
        if ((DDResultIsEqualToUnitTestResult(ValueAtIndex, v27, a3) & 1) == 0) {
          break;
        }
        ++i;
      }
    }
  }
  return v22;
}

CFStringRef *DDResultGetSignatureContainingResult(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count == 1)
  {
    CFIndex v5 = 0;
  }
  else
  {
    uint64_t v6 = Count;
    CFIndex v5 = 0;
    do
    {
      uint64_t v7 = *(void *)(a2 + 32);
      if (v6 >= 0) {
        uint64_t v8 = v6;
      }
      else {
        uint64_t v8 = v6 + 1;
      }
      uint64_t v9 = *((void *)CFArrayGetValueAtIndex(a1, v5 + (v8 >> 1)) + 4);
      if (v9 <= v7) {
        v6 -= v8 >> 1;
      }
      else {
        uint64_t v6 = v8 >> 1;
      }
      if (v9 <= v7) {
        v5 += v8 >> 1;
      }
    }
    while (v6 != 1);
  }
  uint64_t result = (CFStringRef *)CFArrayGetValueAtIndex(a1, v5);
  if (result)
  {
    CFDictionaryRef v11 = result;
    if (_typesAreEqual(result[8], @"SignatureBlock")) {
      return v11;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t DDResultCreateCopy(uint64_t a1)
{
  CFTypeID v2 = DDTypeRegister(&DDResultGetTypeID_typeID);
  uint64_t Instance = DDTypeCreateInstance_(0, v2, 0x60uLL);
  *(void *)(Instance + 96) = *(void *)(a1 + 96);
  *(_OWORD *)(Instance + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(Instance + 32) = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  *(void *)(Instance + 48) = *(void *)(a1 + 48);
  if (v4)
  {
    CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    for (CFIndex i = 0; i < CFArrayGetCount(*(CFArrayRef *)(a1 + 56)); ++i)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
      CFArrayRef Copy = (const void *)DDResultCreateCopy(ValueAtIndex);
      CFArrayAppendValue(Mutable, Copy);
      CFRelease(Copy);
    }
    *(void *)(Instance + 56) = Mutable;
  }
  uint64_t v9 = *(const void **)(a1 + 72);
  if (v9) {
    *(void *)(Instance + 72) = CFRetain(v9);
  }
  *(void *)(Instance + 64) = CFRetain(*(CFTypeRef *)(a1 + 64));
  DDResultSetValue(Instance, *(CFTypeRef *)(a1 + 80));
  DDResultSetContextualData(Instance, *(CFTypeRef *)(a1 + 88));
  return Instance;
}

void *DDResultGetParsecUUID(uint64_t a1)
{
  CFArrayRef v1 = (void *)a1;
  if (a1)
  {
    if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), @"Parsec")) {
      return 0;
    }
    CFArrayRef v1 = (void *)v1[11];
    if (v1)
    {
      CFTypeID v2 = CFGetTypeID(v1);
      if (v2 != CFDictionaryGetTypeID()) {
        return 0;
      }
      CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v1, @"U");
      if (!Value) {
        return 0;
      }
      CFArrayRef v1 = Value;
      CFTypeID v4 = CFGetTypeID(Value);
      if (v4 != CFStringGetTypeID()) {
        return 0;
      }
    }
  }
  return v1;
}

void *DDResultGetParsecRawDomain(uint64_t a1)
{
  CFArrayRef v1 = (void *)a1;
  if (a1)
  {
    if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), @"Parsec")) {
      return 0;
    }
    CFArrayRef v1 = (void *)v1[11];
    if (v1)
    {
      CFTypeID v2 = CFGetTypeID(v1);
      if (v2 != CFDictionaryGetTypeID()) {
        return 0;
      }
      CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v1, @"D");
      if (!Value) {
        return 0;
      }
      CFArrayRef v1 = Value;
      CFTypeID v4 = CFGetTypeID(Value);
      if (v4 != CFStringGetTypeID()) {
        return 0;
      }
    }
  }
  return v1;
}

uint64_t DDResultGetParsecDomain(uint64_t a1)
{
  if (!a1) {
    return 4294967294;
  }
  if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), @"Parsec")) {
    return 4294967294;
  }
  ParsecRawDomain = DDResultGetParsecRawDomain(a1);
  if (!ParsecRawDomain) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = ParsecRawDomain;
  if (CFEqual(ParsecRawDomain, @"ondemandmovies")) {
    return 0;
  }
  if (CFEqual(v3, @"tv")) {
    return 9;
  }
  if (CFEqual(v3, @"food")) {
    return 8;
  }
  if (CFEqual(v3, @"activities")) {
    return 7;
  }
  if (CFEqual(v3, @"apps")) {
    return 2;
  }
  if (CFEqual(v3, @"artists")) {
    return 3;
  }
  if (CFEqual(v3, @"sports")) {
    return 4;
  }
  if (CFEqual(v3, @"stocks")) {
    return 5;
  }
  if (CFEqual(v3, @"wiki")) {
    return 6;
  }
  if (CFEqual(v3, @"maps")) {
    return 1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t DDLookupTableCreate()
{
  CFTypeID v0 = DDTypeRegister(&DDLookupTableGetTypeID_typeID);
  uint64_t Instance = DDTypeCreateInstance_(0, v0, 0x88uLL);
  CFArrayRef Mutable = CFDataCreateMutable(0, 0);
  *(void *)(Instance + 96) = Mutable;
  CFDataIncreaseLength(Mutable, 24);
  uint64_t v3 = malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
  *(_DWORD *)v3 |= 0x1000u;
  v3[2] = 0;
  v3[4] = 0;
  *(void *)(Instance + 56) = v3;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  return Instance;
}

CFStringRef _DDLookupTableCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDLookupTable:%p>", a1);
}

CFStringRef _DDLookupTableCFCopyFormatDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(0, a2, @"<DDLookupTable:%p>", a1);
}

BOOL _DDLookupTableCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _DDLookupTableCFFinalize(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    DDLookupTrieDestroy(v2);
  }
  uint64_t v3 = a1[8];
  if (v3) {
    DDLookupTrieDestroy(v3);
  }
  CFTypeID v4 = (const void *)a1[9];
  if (v4) {
    CFRelease(v4);
  }
  CFIndex v5 = (const void *)a1[10];
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = (const void *)a1[11];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a1[12];
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = (const void *)a1[14];
  if (v8)
  {
    CFRelease(v8);
    a1[14] = 0;
  }
  uint64_t v9 = (void *)a1[15];
  if (v9)
  {
    free(v9);
    a1[15] = 0;
  }
  CFIndex v10 = (void *)a1[2];
  if (v10) {
    DDStaticLookupDestroy(v10);
  }
  CFDictionaryRef v11 = (void *)a1[3];
  if (v11)
  {
    DDStaticLookupDestroy(v11);
  }
}

void DDLookupTableSetContextThresholds(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(const void **)(a1 + 72);
  if (v8) {
    CFRelease(v8);
  }
  if (a3 && a4 >= 1)
  {
    CFArrayRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 8 * a4);
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = DDDynamicSourceTokenID(a2, v10);
      if (v11 != 1)
      {
        unsigned int v12 = *(_DWORD *)(a3 + 4 * v10) & 0xFFFFFFF0;
        *(_WORD *)&bytes[6] = 257;
        *(_DWORD *)bytes = v12;
        *(_WORD *)&bytes[4] = v11;
        CFDataAppendBytes(Mutable, bytes, 8);
      }
      ++v10;
    }
    while (a4 != v10);
    *(void *)(a1 + 72) = Mutable;
    if (!*(void *)(a1 + 64))
    {
      CFStringRef v13 = malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
      *(_DWORD *)v13 |= 0x1000u;
      v13[2] = 0;
      v13[4] = 0;
      *(void *)(a1 + 64) = v13;
    }
  }
  else
  {
    *(void *)(a1 + 72) = 0;
  }
}

void __DDLookupTableRefLookupCurrentWord_block_invoke_2()
{
}

void __DDLookupTableUpdateFromExternalFile_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2) {
    CFTypeID v4 = DDLookupTableCreateFromCacheData(a2, a3, 0, 0);
  }
  else {
    CFTypeID v4 = 0;
  }
  **(void **)(a1 + 32) = v4;
  CFIndex v5 = *(void ***)(a1 + 40);
  if (v5)
  {
    uint64_t v7 = v5 + 4;
    uint64_t v6 = (int *)v5[4];
    if (v6)
    {
      munmap(v5[4], v6[1]);
      v7[1] = 0;
      v7[2] = 0;
      *uint64_t v7 = 0;
      CFIndex v5 = *(void ***)(a1 + 40);
    }
    CFRelease(v5);
  }
}

CFStringRef DDStaticLookupTableAppendString(const __CFData **a1, CFStringRef theString, int a3)
{
  CFStringRef Length = theString;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFDataRef v4 = *a1;
  if (*a1)
  {
    if (!theString) {
      return Length;
    }
    goto LABEL_7;
  }
  CFArrayRef Mutable = CFDataCreateMutable(0, 0);
  CFDataRef v4 = Mutable;
  *a1 = Mutable;
  if (Length && a3 || (bytes[0] = 0, CFDataAppendBytes(Mutable, bytes, 1), Length))
  {
LABEL_7:
    if (CFStringGetCString(Length, (char *)bytes, 128, 0x8000100u) && (int64_t v8 = strlen((const char *)bytes), v8 >= 1))
    {
      int64_t v9 = v8;
      CFStringRef Length = (const __CFString *)CFDataGetLength(v4);
      CFDataAppendBytes(v4, bytes, v9 + 1);
    }
    else
    {
      return 0;
    }
  }
  return Length;
}

void DDValidateOptionalSourceTableCount(int a1, unint64_t *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((*a2 & 0x8000000000000000) != 0)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFIndex v5 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v8 = 67109120;
      int v9 = a1;
      _os_log_error_impl(&dword_19DC95000, v5, OS_LOG_TYPE_ERROR, "DDCore: Bogus table count for source %d", (uint8_t *)&v8, 8u);
    }
    unint64_t v4 = 0;
    goto LABEL_15;
  }
  if ((a1 - 1) > 5) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = qword_19DCCFA18[a1 - 1];
  }
  if (*a2 > v4)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v6 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = *a2;
      int v8 = 67109632;
      int v9 = a1;
      __int16 v10 = 2048;
      unint64_t v11 = v7;
      __int16 v12 = 2048;
      unint64_t v13 = v4;
      _os_log_error_impl(&dword_19DC95000, v6, OS_LOG_TYPE_ERROR, "DDCore: Too many tables for source %d, will truncate %ld to %ld tables", (uint8_t *)&v8, 0x1Cu);
    }
LABEL_15:
    *a2 = v4;
  }
}

uint64_t DDDynamicSourceTokenID(int a1, unint64_t a2)
{
  int v2 = a1 - 1;
  uint64_t result = 28;
  switch(v2)
  {
    case 0:
      uint64_t v4 = a2 + 38;
      goto LABEL_7;
    case 1:
    case 2:
      uint64_t v4 = a2 + 10;
      goto LABEL_7;
    case 3:
      return result;
    case 4:
      uint64_t v4 = a2 + 30;
      goto LABEL_7;
    case 5:
      uint64_t v4 = a2 + 20;
LABEL_7:
      if (a2 >= 0xA) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = v4;
      }
      break;
    default:
      uint64_t result = 1;
      break;
  }
  return result;
}

void DDSourceSetStoragePath(char *__s)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (altPath)
  {
    free((void *)altPath);
    altPath = 0;
  }
  if (__s && strlen(__s) <= 0xE0)
  {
    altPath = (uint64_t)strndup(__s, 0xE1uLL);
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    int v2 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315138;
      CFIndex v5 = (const char *)altPath;
      uint64_t v3 = "Setting new source base path: %s";
LABEL_14:
      _os_log_debug_impl(&dword_19DC95000, v2, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    int v2 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315138;
      CFIndex v5 = "/var/db/datadetectors";
      uint64_t v3 = "Using default source base path: %s";
      goto LABEL_14;
    }
  }
}

const UInt8 *DDSourceCreateFinalizedSourceContent(uint64_t a1)
{
  DDLookupTablePrepareToScan((void *)a1);
  if (!*(unsigned char *)(a1 + 104))
  {
    uint64_t v2 = *(void *)(a1 + 16);
    CFIndex Length = CFDataGetLength(*(CFDataRef *)(v2 + 120));
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(v2 + 120));
    *(void *)(a1 + 136) = Length;
    CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 96), BytePtr, Length);
    int v5 = *(_DWORD *)(a1 + 136) + *(_DWORD *)(a1 + 140);
    if (*(void *)(a1 + 24))
    {
      int v6 = CFDataGetLength(*(CFDataRef *)(a1 + 96)) & 3;
      if (v6)
      {
        int v7 = 4 - v6;
        CFDataIncreaseLength(*(CFMutableDataRef *)(a1 + 96), (4 - v6));
      }
      else
      {
        int v7 = 0;
      }
      uint64_t v9 = *(void *)(a1 + 24);
      CFIndex v8 = CFDataGetLength(*(CFDataRef *)(v9 + 120));
      __int16 v10 = CFDataGetBytePtr(*(CFDataRef *)(v9 + 120));
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 96), v10, v8);
    }
    else
    {
      LODWORD(v8) = 0;
      int v7 = 0;
    }
    *(_DWORD *)(a1 + 144) = v8;
    *(_DWORD *)(a1 + 148) = v5 + v7;
    int v11 = CFDataGetLength(*(CFDataRef *)(a1 + 96));
    *(_DWORD *)(a1 + 128) = 515806;
    *(_DWORD *)(a1 + 132) = v11;
    v15.NSUInteger location = 0;
    v15.CFArrayRef length = 24;
    CFDataReplaceBytes(*(CFMutableDataRef *)(a1 + 96), v15, (const UInt8 *)(a1 + 128), 24);
    *(unsigned char *)(a1 + 104) = 1;
  }
  uint64_t result = CFDataGetBytePtr(*(CFDataRef *)(a1 + 96));
  if (result)
  {
    CFIndex v13 = *((int *)result + 1);
    return (const UInt8 *)CFDataCreate(0, result, v13);
  }
  return result;
}

void _DDSourceUpdateSourceWithContent(void (*a1)(void, void, void, void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a5;
  if (a1 && a2)
  {
    DDValidateOptionalSourceTableCount(5, (unint64_t *)&v13);
    uint64_t v9 = v13;
    if (v13 >= 1)
    {
      unint64_t v10 = 0;
      do
      {
        if (a3) {
          int v11 = *(void **)(a3 + 8 * v10);
        }
        else {
          int v11 = 0;
        }
        __int16 v12 = *(void **)(a2 + 8 * v10);
        if (v12) {
          DDSourceAddDomainContent(a1, 5, v10, v12, v11);
        }
        ++v10;
      }
      while (v9 != v10);
    }
    DDLookupTableSetContextThresholds((uint64_t)a1, 5, a4, v9);
  }
}

void DDSourceAddDomainContent(void (*a1)(void, void, void, void), int a2, unint64_t a3, void *a4, void *a5)
{
  unint64_t v11 = a3;
  if ((a2 - 1) <= 5)
  {
    DDValidateOptionalSourceTableCount(a2, &v11);
    uint64_t v9 = (void (*)(void, void, void, void))DDDynamicSourceTokenID(a2, v11);
    if (v9 != (void (*)(void, void, void, void))1)
    {
      unint64_t v10 = v9;
      v13[0] = (void (*)(void, void, void, void))MEMORY[0x1E4F143A8];
      v13[1] = (void (*)(void, void, void, void))0x40000000;
      v13[2] = (void (*)(void, void, void, void))___DDSourceAppendSourceContent_block_invoke;
      v13[3] = (void (*)(void, void, void, void))&unk_1E59850E8;
      v13[5] = a1;
      v13[6] = v9;
      v13[4] = 0;
      _DDSourceApplyBlockOnEntryList(a4, v13);
      v12[0] = (void (*)(void, void, void, void))MEMORY[0x1E4F143A8];
      v12[1] = (void (*)(void, void, void, void))0x40000000;
      v12[2] = (void (*)(void, void, void, void))___DDSourceAppendSourceContent_block_invoke_2;
      v12[3] = (void (*)(void, void, void, void))&__block_descriptor_tmp_20;
      v12[4] = a1;
      v12[5] = v10;
      _DDSourceApplyBlockOnEntryList(a5, v12);
    }
  }
}

void _DDSourceApplyBlockOnEntryList(void *cf, void (**a2)(void, void, void, void))
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (cf)
  {
    uint64_t v3 = (const void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] != cf)
    {
      CFTypeID v4 = CFGetTypeID(cf);
      if (v4 == CFArrayGetTypeID())
      {
        CFTypeID v21 = v4;
        CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
        if (Count >= 1)
        {
          CFIndex v6 = Count + 1;
          while (1)
          {
            CFStringRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)cf, v6 - 2);
            CFTypeID v8 = CFGetTypeID(ValueAtIndex);
            if (v8 != CFDictionaryGetTypeID()) {
              break;
            }
            CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"t");
            if (!Value) {
              CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"title");
            }
            unint64_t v10 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"u");
            if (!v10) {
              unint64_t v10 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"uuid");
            }
            unint64_t v11 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"s");
            if (!v11) {
              unint64_t v11 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"score");
            }
            __int16 v12 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"f");
            if (!Value) {
              goto LABEL_31;
            }
            unint64_t v13 = (unint64_t)v12;
            CFTypeID v14 = CFGetTypeID(Value);
            if (v14 != CFStringGetTypeID()) {
              goto LABEL_31;
            }
            if (v11)
            {
              CFTypeID v15 = CFGetTypeID(v11);
              if (v15 == CFNumberGetTypeID())
              {
                if (v10 | v13) {
                  char v16 = ValueAtIndex;
                }
                else {
                  char v16 = v11;
                }
                ((void (**)(void, const void *, const void *, void))a2)[2](a2, Value, v16, 0);
              }
              goto LABEL_31;
            }
            if (v10)
            {
              CFArrayRef v17 = (void (*)(void))a2[2];
LABEL_21:
              v17();
            }
LABEL_31:
            CFArraySetValueAtIndex((CFMutableArrayRef)cf, v6 - 2, v3);
            if ((unint64_t)--v6 <= 1) {
              return;
            }
          }
          if (v8 != CFStringGetTypeID())
          {
            if (ValueAtIndex != v3)
            {
              if (DDLogHandle_onceToken != -1) {
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
              }
              CFStringRef v18 = DDLogHandle_error_log_handle;
              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 134217984;
                CFTypeID v24 = v21;
                _os_log_error_impl(&dword_19DC95000, v18, OS_LOG_TYPE_ERROR, "Unexpected table entry list type %ld (should be either strings or dictionaries)", buf, 0xCu);
              }
            }
            goto LABEL_31;
          }
          CFArrayRef v17 = (void (*)(void))a2[2];
          goto LABEL_21;
        }
      }
      else if (v4 == CFDictionaryGetTypeID())
      {
        CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)_dictEntryApplier, a2);
      }
      else
      {
        CFTypeID v19 = v4;
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v20 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134217984;
          CFTypeID v24 = v19;
          _os_log_error_impl(&dword_19DC95000, v20, OS_LOG_TYPE_ERROR, "Unexpected table entry list type %ld (should be either dictionaries{string:number(float)} or arrays[string])", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t _dictEntryApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void DDSourceAddDomainsNames(uint64_t a1, int a2, CFArrayRef theArray, const __CFString *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v9 = Count;
      CFStringRef v29 = a4;
      uint64_t v30 = a1;
      uint64_t v31 = &v28;
      unint64_t v10 = 8 * Count;
      MEMORY[0x1F4188790](Count);
      unint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v10 >= 0x200) {
        size_t v12 = 512;
      }
      else {
        size_t v12 = v10;
      }
      bzero((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
      CFIndex v13 = 0;
      CFTypeID v14 = (const void *)*MEMORY[0x1E4F1D260];
      char v15 = 1;
      do
      {
        while (1)
        {
          CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v13);
          if (ValueAtIndex == v14) {
            break;
          }
          CFArrayRef v17 = ValueAtIndex;
          CFTypeID v18 = CFGetTypeID(ValueAtIndex);
          if (v18 != CFStringGetTypeID()) {
            break;
          }
          char v15 = 0;
          *(void *)&v11[8 * v13++] = v17;
          if (v13 == v9) {
            goto LABEL_14;
          }
        }
        *(void *)&v11[8 * v13++] = 0;
      }
      while (v9 != v13);
      if (v15) {
        return;
      }
LABEL_14:
      uint64_t v19 = v30;
      uint64_t v20 = *(const void **)(v30 + 80);
      if (v20)
      {
        CFRelease(v20);
        *(void *)(v19 + 80) = 0;
      }
      CFTypeID v21 = *(const void **)(v19 + 88);
      CFStringRef v22 = v29;
      if (v21)
      {
        CFRelease(v21);
        *(void *)(v19 + 88) = 0;
      }
      if (v22) {
        DDStaticLookupTableAppendString((const __CFData **)(v19 + 88), v22, 1);
      }
      CFArrayRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10);
      for (unint64_t i = 0; i != v9; ++i)
      {
        unsigned int appended = DDStaticLookupTableAppendString((const __CFData **)(v19 + 88), *(CFStringRef *)&v11[8 * i], 0);
        uint64_t v26 = DDDynamicSourceTokenID(a2, i);
        if (v26 != 1)
        {
          *(_WORD *)&bytes[6] = 257;
          *(_DWORD *)bytes = appended;
          *(_WORD *)&bytes[4] = v26;
          CFDataAppendBytes(Mutable, bytes, 8);
        }
      }
      *(void *)(v19 + 80) = Mutable;
      if (!*(void *)(v19 + 64))
      {
        uint64_t v27 = malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
        *(_DWORD *)v27 |= 0x1000u;
        v27[2] = 0;
        v27[4] = 0;
        *(void *)(v30 + 64) = v27;
      }
    }
  }
}

BOOL DDSourceRemoveFile(int a1, int a2, int a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!_DDTriePathForSource(a1, v15, a3, 1, a2))
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v4 = DDLogHandle_error_log_handle;
    BOOL result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v11 = 136315138;
    size_t v12 = v15;
    int v5 = "DDCore: Could not remove file %s";
    CFIndex v6 = v4;
    uint32_t v7 = 12;
LABEL_14:
    _os_log_error_impl(&dword_19DC95000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v11, v7);
    return 0;
  }
  if (!unlink(v15) || *__error() == 2) {
    return 1;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v8 = DDLogHandle_error_log_handle;
  BOOL result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    CFIndex v9 = __error();
    unint64_t v10 = strerror(*v9);
    int v11 = 136315394;
    size_t v12 = v10;
    __int16 v13 = 2080;
    CFTypeID v14 = v15;
    int v5 = "DDCore: Could not remove file (%s) %s";
    CFIndex v6 = v8;
    uint32_t v7 = 22;
    goto LABEL_14;
  }
  return result;
}

void *DDStaticLookupCreateWithDynamicTrie(uint64_t a1, const __CFData *a2, const __CFData *a3, const void *a4)
{
  uint64_t v8 = malloc_type_calloc(1uLL, 0xA0uLL, 0x10B004003C429ACuLL);
  uint64_t v9 = *(unsigned int *)(a1 + 24);
  if ((int)v9 < 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    int v10 = 0;
    int v11 = *(int **)(a1 + 16);
    do
    {
      int v12 = *v11;
      v11 += 4;
      v10 += v12 + 1;
      --v9;
    }
    while (v9);
    uint64_t v13 = v10;
  }
  *((void *)v8 + 16) = CFDataCreateMutable(0, 2 * v13);
  CFIndex v14 = 4 * v13;
  *((void *)v8 + 17) = CFDataCreateMutable(0, v14);
  *((void *)v8 + 18) = CFDataCreateMutable(0, v14);
  if (a4) {
    CFTypeRef v15 = CFRetain(a4);
  }
  else {
    CFTypeRef v15 = 0;
  }
  *((void *)v8 + 19) = v15;
  CFArrayRef Mutable = CFDataCreateMutable(0, 0);
  CFDataIncreaseLength(Mutable, 60);
  *((void *)v8 + 15) = Mutable;
  __int16 v38 = 0;
  visitDynTrie((CFMutableDataRef *)v8, a1, (_DWORD *)a1, (unsigned char *)&v38 + 1, &v38);
  memset(&v37[4], 0, 56);
  *(_DWORD *)&v37[8] = CFDataGetLength(Mutable) - 60;
  appendArraySectionInData(Mutable, a2, 4, &v37[28], (int *)&v37[32]);
  appendArraySectionInData(Mutable, a3, 4, &v37[36], (int *)&v37[40]);
  if (HIBYTE(v38)) {
    CFDataRef v17 = (const __CFData *)*((void *)v8 + 17);
  }
  else {
    CFDataRef v17 = 0;
  }
  appendArraySectionInData(Mutable, v17, 4, &v37[20], (int *)&v37[24]);
  CFRelease(*((CFTypeRef *)v8 + 17));
  *((void *)v8 + 17) = 0;
  appendArraySectionInData(Mutable, *((const __CFData **)v8 + 16), 2, &v37[12], (int *)&v37[16]);
  CFRelease(*((CFTypeRef *)v8 + 16));
  *((void *)v8 + 16) = 0;
  if ((_BYTE)v38) {
    CFDataRef v18 = (const __CFData *)*((void *)v8 + 18);
  }
  else {
    CFDataRef v18 = 0;
  }
  appendArraySectionInData(Mutable, v18, 4, &v37[44], (int *)&v37[48]);
  CFRelease(*((CFTypeRef *)v8 + 18));
  *((void *)v8 + 18) = 0;
  appendArraySectionInData(Mutable, *((const __CFData **)v8 + 19), 1, &v37[52], (int *)&v37[56]);
  uint64_t v19 = (const void *)*((void *)v8 + 19);
  if (v19)
  {
    CFRelease(v19);
    *((void *)v8 + 19) = 0;
  }
  *(_DWORD *)CFStringRef v37 = CFDataGetLength(Mutable);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((_OWORD *)MutableBytePtr + 2) = *(_OWORD *)&v37[32];
  *(_OWORD *)(MutableBytePtr + 44) = *(_OWORD *)&v37[44];
  long long v21 = *(_OWORD *)&v37[16];
  *(_OWORD *)MutableBytePtr = *(_OWORD *)v37;
  *((_OWORD *)MutableBytePtr + 1) = v21;
  *(void *)uint64_t v8 = MutableBytePtr;
  CFStringRef v22 = MutableBytePtr + 60;
  uint64_t v23 = (uint64_t)&MutableBytePtr[*((int *)MutableBytePtr + 1) + 60];
  *((void *)v8 + 1) = v23;
  *((void *)v8 + 2) = v23;
  unint64_t v24 = *((int *)MutableBytePtr + 4);
  *((void *)v8 + 9) = v24 >> 1;
  if (v24 >= 2) {
    uint64_t v25 = &v22[*((int *)MutableBytePtr + 3)];
  }
  else {
    uint64_t v25 = 0;
  }
  *((void *)v8 + 3) = v25;
  unint64_t v26 = *((int *)MutableBytePtr + 6);
  *((void *)v8 + 10) = v26 >> 2;
  if (v26 >= 4) {
    uint64_t v27 = &v22[*((int *)MutableBytePtr + 5)];
  }
  else {
    uint64_t v27 = 0;
  }
  *((void *)v8 + 4) = v27;
  unint64_t v28 = *((int *)MutableBytePtr + 8);
  *((void *)v8 + 12) = v28 >> 3;
  if (v28 >= 8) {
    CFStringRef v29 = &v22[*((int *)MutableBytePtr + 7)];
  }
  else {
    CFStringRef v29 = 0;
  }
  *((void *)v8 + 6) = v29;
  unint64_t v30 = *((int *)MutableBytePtr + 12);
  *((void *)v8 + 11) = v30 >> 2;
  if (v30 >= 4) {
    uint64_t v31 = &v22[*((int *)MutableBytePtr + 11)];
  }
  else {
    uint64_t v31 = 0;
  }
  *((void *)v8 + 5) = v31;
  unint64_t v32 = *((int *)MutableBytePtr + 10);
  *((void *)v8 + 13) = v32 >> 3;
  if (v32 >= 8) {
    uint64_t v33 = &v22[*((int *)MutableBytePtr + 9)];
  }
  else {
    uint64_t v33 = 0;
  }
  *((void *)v8 + 7) = v33;
  uint64_t v34 = *((int *)MutableBytePtr + 14);
  *((void *)v8 + 14) = v34;
  if ((int)v34 < 1) {
    CFAllocatorRef v35 = 0;
  }
  else {
    CFAllocatorRef v35 = &v22[*((int *)MutableBytePtr + 13)];
  }
  *((void *)v8 + 8) = v35;
  return v8;
}

CFIndex visitDynTrie(CFMutableDataRef *a1, uint64_t a2, _DWORD *a3, unsigned char *a4, unsigned char *a5)
{
  uint32_t v7 = a3;
  uint64_t v8 = a1;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = *a3;
  int v82 = *a3;
  if (*a3 == 4098)
  {
    uint64_t v10 = 0;
    int v11 = a3;
    do
    {
      int v12 = v11;
      int v11 = (unsigned int *)*((void *)v11 + 1);
      ++v10;
    }
    while (*v11 == 4098);
    unsigned int v13 = *v12;
  }
  else
  {
    if (v9) {
      uint64_t v10 = (int)(((v9 >> 1) & 0x7FF) - 1);
    }
    else {
      uint64_t v10 = 1;
    }
    unsigned int v13 = *a3;
    int v12 = a3;
  }
  uint64_t v14 = v13 >> 13;
  if ((v13 & 0x1000) != 0) {
    goto LABEL_71;
  }
  uint64_t v92 = *(void *)(a2 + 16);
  CFTypeID v15 = *(int *)(v92 + 16 * (v13 >> 13));
  unint64_t v16 = (unint64_t)CFDataGetLength(a1[16]) >> 1;
  CFDataIncreaseLength(v8[16], 2 * v15 + 2);
  int v80 = v16;
  CFIndex v84 = &CFDataGetMutableBytePtr(v8[16])[2 * v16];
  *(_WORD *)CFIndex v84 = v15;
  CFIndex Length = CFDataGetLength(v8[17]);
  CFDataIncreaseLength(v8[17], 4 * v15 + 4);
  int v95 = (float *)&CFDataGetMutableBytePtr(v8[17])[Length & 0xFFFFFFFFFFFFFFFCLL];
  *int v95 = (float)(int)v15;
  CFIndex v18 = CFDataGetLength(v8[18]);
  CFDataIncreaseLength(v8[18], 4 * v15 + 4);
  int v94 = &CFDataGetMutableBytePtr(v8[18])[v18 & 0xFFFFFFFFFFFFFFFCLL];
  *(_DWORD *)int v94 = v15;
  int v83 = v15;
  if ((int)v15 < 1) {
    goto LABEL_70;
  }
  uint64_t v86 = a4;
  CFIndex v87 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = v92 + 16 * v14;
  long long v21 = (const void **)(v20 + 8);
  CFBooleanRef v89 = (_DWORD *)(v20 + 4);
  CFAbsoluteTime v90 = (const void **)(v20 + 8);
  CFIndex v78 = v8;
  uint64_t v85 = v8 + 19;
  CFStringRef v22 = v84;
  do
  {
    int v23 = v19 + 1;
    if (v15 == 1)
    {
      *(_WORD *)&v22[2 * v19 + 2] = *v89;
      unint64_t v24 = &v95[v19 + 1];
      float *v24 = 0.0;
      uint64_t v25 = &v94[4 * v19 + 4];
      *(_DWORD *)uint64_t v25 = 0;
      unint64_t v26 = v21;
    }
    else
    {
      *(_WORD *)&v22[2 * v19 + 2] = *((_WORD *)*v21 + 8 * v19 + 4);
      unint64_t v24 = &v95[v19 + 1];
      float *v24 = 0.0;
      uint64_t v25 = &v94[4 * v19 + 4];
      *(_DWORD *)uint64_t v25 = 0;
      unint64_t v26 = (const void **)((char *)*v21 + 16 * v19);
    }
    CFStringRef v27 = (const __CFString *)*v26;
    if (!*v26) {
      goto LABEL_68;
    }
    uint64_t v91 = v24;
    CFTypeID v28 = CFGetTypeID(v27);
    SInt32 v93 = v25;
    if (v28 != CFDictionaryGetTypeID())
    {
      if (v28 == CFNumberGetTypeID())
      {
        valuePtr[0] = 0;
        CFNumberGetValue((CFNumberRef)v27, kCFNumberFloat32Type, valuePtr);
        CFStringRef v36 = 0;
        unsigned int v37 = valuePtr[0] & 0xFFFFFFF0;
        goto LABEL_51;
      }
      CFStringRef v36 = v27;
      BOOL v38 = v28 == CFStringGetTypeID();
      long long v21 = v90;
      if (!v38) {
        goto LABEL_65;
      }
LABEL_64:
      *(_DWORD *)SInt32 v93 = DDStaticLookupTableAppendString(v85, v36, 0);
      *CFIndex v87 = 1;
      goto LABEL_65;
    }
    CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v27, @"s");
    if (!Value) {
      CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v27, @"score");
    }
    CFStringRef v30 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v27, @"f");
    if (v30)
    {
      CFStringRef v31 = v30;
      CFTypeID v32 = CFGetTypeID(v30);
      if (v32 == CFStringGetTypeID() && (CFIndex v33 = CFStringGetLength(v31), (unint64_t)(v33 - 1) <= 1))
      {
        CFIndex v34 = v33;
        LODWORD(v30) = CFStringGetCharacterAtIndex(v31, 0);
        if (v34 == 2)
        {
          int v35 = (int)v30;
          int CharacterAtIndex = CFStringGetCharacterAtIndex(v31, 1);
          LODWORD(v30) = v35;
          goto LABEL_30;
        }
      }
      else
      {
        LODWORD(v30) = 0;
      }
    }
    int CharacterAtIndex = 0;
LABEL_30:
    int v39 = (int)v30;
    if (Value)
    {
      CFTypeID v40 = CFGetTypeID(Value);
      if (v40 == CFNumberGetTypeID()) {
        CFNumberRef v41 = (const __CFNumber *)Value;
      }
      else {
        CFNumberRef v41 = 0;
      }
    }
    else
    {
      CFNumberRef v41 = 0;
    }
    CFStringRef v36 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v27, @"u");
    if (v36 || (CFStringRef v36 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v27, @"uuid")) != 0)
    {
      CFTypeID v15 = CFGetTypeID(v36);
      BOOL v38 = v15 == CFStringGetTypeID();
      LODWORD(v15) = v83;
      if (!v38) {
        CFStringRef v36 = 0;
      }
    }
    if (!v41)
    {
      CFStringRef v22 = v84;
      long long v21 = v90;
      if (!v36) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
    valuePtr[0] = 0;
    CFNumberGetValue(v41, kCFNumberFloat32Type, valuePtr);
    unsigned int v37 = valuePtr[0] & 0xFFFFFFF0;
    if (v39 <= 79)
    {
      if (v39)
      {
        long long v21 = v90;
        CFArrayRef v42 = (unsigned int *)v91;
        if (v39 != 76) {
          goto LABEL_49;
        }
        int v43 = 8;
        goto LABEL_53;
      }
      CFStringRef v22 = v84;
LABEL_51:
      long long v21 = v90;
      CFArrayRef v42 = (unsigned int *)v91;
      goto LABEL_63;
    }
    if (v39 == 90)
    {
      int v43 = 4;
      long long v21 = v90;
      CFArrayRef v42 = (unsigned int *)v91;
      goto LABEL_53;
    }
    long long v21 = v90;
    CFArrayRef v42 = (unsigned int *)v91;
    if (v39 != 80)
    {
LABEL_49:
      int v43 = 0;
      goto LABEL_53;
    }
    int v43 = 12;
LABEL_53:
    int v44 = CharacterAtIndex;
    if (!CharacterAtIndex) {
      int v44 = v39;
    }
    if (v44 == 76)
    {
      int v45 = 2;
      CFStringRef v22 = v84;
    }
    else
    {
      CFStringRef v22 = v84;
      if (v44 == 90)
      {
        int v45 = 1;
      }
      else if (v44 == 80)
      {
        int v45 = 3;
      }
      else
      {
        int v45 = 0;
      }
    }
    v37 |= v43 | v45;
LABEL_63:
    *CFArrayRef v42 = v37;
    *uint64_t v86 = 1;
    if (v36) {
      goto LABEL_64;
    }
LABEL_65:
    CFRelease(v27);
    uint64_t v46 = v21;
    if (v15 != 1) {
      uint64_t v46 = (const void **)((char *)*v21 + 16 * v19);
    }
    *uint64_t v46 = 0;
LABEL_68:
    ++v19;
  }
  while (v23 < (int)v15);
  uint64_t v8 = v78;
  a4 = v86;
  a5 = v87;
LABEL_70:
  LODWORD(v14) = v80;
LABEL_71:
  if (v82)
  {
    CFIndex CellWithNumberOfSons = allocateCellWithNumberOfSons((uint64_t)v8, 1, v10, 1, 0);
    if (v10 >= 2)
    {
      uint32_t v79 = v8;
      int v81 = v14;
      MutableBytePtr = CFDataGetMutableBytePtr(v8[15]);
      uint64_t v62 = 0;
      uint64_t v14 = (uint64_t)&MutableBytePtr[CellWithNumberOfSons + 60];
      uint64_t v63 = 0x100000000;
      do
      {
        uint64_t v64 = v62;
        int v65 = (__int16 *)(v7 + 1);
        if (*v7)
        {
          if ((int)v64 < 1 || (*v7 & 0xFFEu) <= 0xD) {
            int v65 = (__int16 *)((char *)v7 + (v63 >> 31) + 4);
          }
          else {
            int v65 = (__int16 *)(*((void *)v7 + 1) + 2 * (v64 - 1));
          }
        }
        __int16 v66 = *v65;
        if (!*v65)
        {
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          uint64_t v67 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            int v69 = *v7 & 1;
            int v70 = (*v7 >> 1) & 0x7FF;
            valuePtr[0] = 67109632;
            valuePtr[1] = v69;
            __int16 v98 = 2048;
            uint64_t v99 = v64 + 1;
            __int16 v100 = 1024;
            int v101 = v70;
            _os_log_error_impl(&dword_19DC95000, v67, OS_LOG_TYPE_ERROR, "trying to insert NULL in a substring leaf (%d) i+1=%ld, count=%d", (uint8_t *)valuePtr, 0x18u);
          }
        }
        if ((*(_DWORD *)v14 & 0x800) != 0) {
          uint64_t v68 = v64 + 2;
        }
        else {
          uint64_t v68 = v64;
        }
        *(_WORD *)(v14 + 2 * v68 + 4) = v66;
        uint64_t v62 = v64 + 1;
        v63 += 0x100000000;
      }
      while (v10 != v64 + 1);
      if ((*(_DWORD *)v14 & 0x800) != 0) {
        uint64_t v71 = v64 + 3;
      }
      else {
        uint64_t v71 = v10;
      }
      *(_WORD *)(v14 + 2 * v71 + 4) = 0;
      uint64_t v8 = v79;
      LODWORD(v14) = v81;
    }
    int v72 = allocateCellWithNumberOfSons((uint64_t)v8, 0, 1, (*v7 >> 12) & 1, v14);
    if (*v7)
    {
      if ((int)v10 < 2 || (*v7 & 0xFFEu) <= 0xD) {
        CFStringRef v73 = (__int16 *)v7 + (int)v10 + 2;
      }
      else {
        CFStringRef v73 = (__int16 *)(*((void *)v7 + 1) + 2 * (v10 - 2));
      }
    }
    else
    {
      CFStringRef v73 = (__int16 *)(v7 + 1);
    }
    __int16 v74 = *v73;
    CFRange v75 = CFDataGetMutableBytePtr(v8[15]);
    int v76 = *(_DWORD *)&v75[CellWithNumberOfSons + 60];
    if ((v76 & 0x800) != 0)
    {
      *(_DWORD *)&v75[CellWithNumberOfSons + 64] = v72;
    }
    else
    {
      *(_WORD *)&v75[CellWithNumberOfSons + 64] = v74;
      *(_DWORD *)&v75[CellWithNumberOfSons + 64 + ((2 * (v76 & 0x7FF) + 2) & 0x1FFC)] = v72;
    }
  }
  else
  {
    CFIndex CellWithNumberOfSons = allocateCellWithNumberOfSons((uint64_t)v8, ((unint64_t)*v12 >> 1) & 0x7FF, v10, (*v12 >> 12) & 1, v14);
    if (v10 >= 2)
    {
      unint64_t v48 = CFDataGetMutableBytePtr(v8[15]);
      uint64_t v49 = 0;
      CFIndex v50 = &v48[CellWithNumberOfSons + 60];
      do
      {
        uint64_t v51 = v49;
        uint32_t v7 = (_DWORD *)*((void *)v7 + 1);
        if ((*(_DWORD *)v50 & 0x800) != 0) {
          uint64_t v52 = v49 + 2;
        }
        else {
          uint64_t v52 = v49;
        }
        *(_WORD *)&v50[2 * v52 + 4] = *((_WORD *)v7 + 2);
        ++v49;
      }
      while (v10 != v51 + 1);
      uint64_t v53 = v51 + 3;
      if ((*(_DWORD *)v50 & 0x800) == 0) {
        uint64_t v53 = v10;
      }
      *(_WORD *)&v50[2 * v53 + 4] = 0;
    }
    if ((*(_WORD *)v12 & 0xFFE) != 0)
    {
      unint64_t v54 = 0;
      CFIndex v55 = CellWithNumberOfSons + 64;
      uint64_t v56 = 4;
      do
      {
        int v57 = visitDynTrie(v8, a2, *((void *)v12 + 1) + v56 - 4, a4, a5);
        __int16 v58 = *(_WORD *)(*((void *)v12 + 1) + v56);
        int v59 = CFDataGetMutableBytePtr(v8[15]);
        CFRange v60 = &v59[CellWithNumberOfSons + 60];
        if ((*(_DWORD *)v60 & 0x800) != 0)
        {
          *(_DWORD *)&v59[4 * v54 + v55] = v57;
        }
        else
        {
          *(_DWORD *)&v60[4 * v54 + 4 + 4 * (((*(_DWORD *)v60 & 0x7FFuLL) + 1) >> 1)] = v57;
          if ((*(_DWORD *)v60 & 0x800) == 0) {
            *(_WORD *)&v59[2 * v54 + v55] = v58;
          }
        }
        ++v54;
        v56 += 16;
      }
      while (v54 < (((unint64_t)*v12 >> 1) & 0x7FF));
    }
  }
  return CellWithNumberOfSons;
}

void appendArraySectionInData(const __CFData *a1, const __CFData *a2, int a3, _DWORD *a4, int *a5)
{
  int v10 = CFDataGetLength(a1) - 60;
  if (a2 && (int Length = CFDataGetLength(a2), Length >= 1))
  {
    if (v10 % a3 >= 1)
    {
      int v12 = a3 - v10 % a3;
      CFDataIncreaseLength(a1, v12);
      v10 += v12;
    }
    BytePtr = CFDataGetBytePtr(a2);
    CFDataAppendBytes(a1, BytePtr, Length);
  }
  else
  {
    int Length = 0;
  }
  *a4 = v10;
  *a5 = Length;
}

CFIndex allocateCellWithNumberOfSons(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(_DWORD *)bytes = a2 & 0x7FF | ((a3 > 1) << 11) | ((a4 != 0) << 12) | (a5 << 13);
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 120));
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 120), bytes, 4);
  uint64_t v9 = (a3 + 1) & 1;
  if (a3 < -1) {
    uint64_t v9 = -v9;
  }
  if ((bytes[1] & 8) != 0) {
    CFIndex v10 = 2 * (v9 + a3 + 1) + 4;
  }
  else {
    CFIndex v10 = 2 * ((a2 & 1) + a2) + 4 * a2;
  }
  if (v10) {
    CFDataIncreaseLength(*(CFMutableDataRef *)(a1 + 120), v10);
  }
  return Length - 60;
}

int **assignFromHeaderV4(int **result, int *a2)
{
  uint64_t v2 = a2 + 9;
  uint64_t v3 = (uint64_t)a2 + a2[1] + 36;
  *BOOL result = a2;
  result[1] = (int *)v3;
  result[2] = (int *)v3;
  unint64_t v4 = a2[4];
  result[9] = (int *)(v4 >> 1);
  if (v4 >= 2) {
    int v5 = (int *)((char *)v2 + a2[3]);
  }
  else {
    int v5 = 0;
  }
  result[3] = v5;
  unint64_t v6 = a2[6];
  result[10] = (int *)(v6 >> 2);
  if (v6 >= 4) {
    uint32_t v7 = (int *)((char *)v2 + a2[5]);
  }
  else {
    uint32_t v7 = 0;
  }
  result[4] = v7;
  unint64_t v8 = a2[8];
  result[12] = (int *)(v8 >> 3);
  if (v8 >= 8) {
    uint64_t v9 = (int *)((char *)v2 + a2[7]);
  }
  else {
    uint64_t v9 = 0;
  }
  result[11] = 0;
  result[5] = 0;
  result[6] = v9;
  result[7] = 0;
  result[8] = 0;
  result[13] = 0;
  result[14] = 0;
  return result;
}

void DDStaticLookupDestroy(void *a1)
{
  uint64_t v2 = (const void *)a1[15];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[16];
  if (v3) {
    CFRelease(v3);
  }
  unint64_t v4 = (const void *)a1[17];
  if (v4) {
    CFRelease(v4);
  }
  int v5 = (const void *)a1[18];
  if (v5) {
    CFRelease(v5);
  }
  unint64_t v6 = (const void *)a1[19];
  if (v6) {
    CFRelease(v6);
  }

  free(a1);
}

uint64_t DDScannerCreateWithType(int a1, uint64_t a2, CFErrorRef *a3)
{
  return DDScannerCreateWithTypeAndLocale(a1, 0, a3);
}

uint64_t DDScannerCreateWithCacheFile(const __CFURL *a1, CFErrorRef *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    if (a2)
    {
      uint64_t v10 = 0;
      *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D160], 2, 0);
      return v10;
    }
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  uint64_t v3 = stat((const char *)buffer, &v12);
  if ((v3 & 0x80000000) != 0)
  {
    DDLogErrD(v3, v4, v5, v6, v7, @"could not stat file: %s", buffer);
    return 0;
  }
  unint64_t v8 = DDCacheCreateFromFileAtPathWithExtraChecks((const char *)buffer, 0, (void *)v12.st_size, 1);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = DDScannerCreateFromCacheSupportingMLScan(v8);
  CFRelease(v9);
  return v10;
}

uint64_t DDScannerCreateWithLocaleHint(int a1, unint64_t a2, const __CFLocale *a3, CFErrorRef *a4)
{
  uint64_t v6 = DDScannerCreateWithTypeAndLocale(a1, a3, a4);
  uint64_t v7 = v6;
  if (v6)
  {
    DDScannerSetOptions(v6, a2);
    if (a3) {
      *(void *)(v7 + 240) = CFRetain(a3);
    }
  }
  return v7;
}

uint64_t DDScannerLoaderGetIdentifierStringForScannerType(int a1)
{
  if (__DDScannerLoaderInitScannerIdentifierMappings_sOnce != -1) {
    dispatch_once(&__DDScannerLoaderInitScannerIdentifierMappings_sOnce, &__block_literal_global_632);
  }
  return *(void *)(scannerTypesToScannerIdentifiers + 8 * a1);
}

uint64_t DDScannerLoaderScannerGetTypeWithIdentifierString(void *key)
{
  if (__DDScannerLoaderInitScannerIdentifierMappings_sOnce != -1) {
    dispatch_once(&__DDScannerLoaderInitScannerIdentifierMappings_sOnce, &__block_literal_global_632);
  }
  value = (void *)-1;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)scannerIdentifiersToScannerTypes, key, (const void **)&value)) {
    return (uint64_t)value;
  }
  else {
    return -1;
  }
}

CFStringRef _DDCacheCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDCache:%p>", a1);
}

CFStringRef _DDCacheCFCopyFormatDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(0, a2, @"<DDCache:%p>", a1);
}

BOOL _DDCacheCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _DDCacheCFFinalize(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 72);
  if (v2)
  {
    CFRelease(v2);
  }
  else if (munmap(*(void **)(a1 + 64), *(int *)(*(void *)(a1 + 64) + 8)) < 0)
  {
    uint64_t v3 = __error();
    uint64_t v4 = strerror(*v3);
    DDLogErrD((uint64_t)v4, v5, v6, v7, v8, @"could not munmap file: %s", v4);
  }
  uint64_t v9 = *(const void **)(a1 + 80);
  if (v9)
  {
    CFRelease(v9);
  }
}

void DDCachingStringTokenizerDestroy(void *a1)
{
  uint64_t v2 = (const void *)a1[4];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (void *)a1[6];
  if (!*((unsigned char *)a1 + 121))
  {
    if (!v3) {
      goto LABEL_14;
    }
    uint64_t v4 = a1[9];
    if (v4 >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 16;
      do
      {
        uint64_t v7 = *(void **)(a1[6] + v6);
        if (v7)
        {
          free(v7);
          uint64_t v4 = a1[9];
        }
        ++v5;
        v6 += 32;
      }
      while (v4 > v5);
      uint64_t v3 = (void *)a1[6];
    }
    goto LABEL_13;
  }
  if (v3) {
LABEL_13:
  }
    free(v3);
LABEL_14:
  uint64_t v8 = (const void *)a1[5];
  if (v8) {
    CFRelease(v8);
  }

  free(a1);
}

uint64_t matchingTokenRealIndexForQueryOffset(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 96);
    uint64_t v7 = (*(void *)(a1 + 88) + v3 - v6) % v3;
    if (v7)
    {
      if (v7 <= 32) {
        int64_t v9 = (unint64_t)v7 >> (v7 >= 0);
      }
      else {
        int64_t v9 = v7 - 16;
      }
      if ((v7 & 0x8000000000000000) == 0)
      {
        int64_t v10 = 0;
        uint64_t v11 = (uint64_t)(int)a2 >> 16;
        unint64_t v12 = HIDWORD(a2);
        while (1)
        {
          uint64_t v13 = v9 < 0 ? -1 : (*(void *)(a1 + 96) + v9) % *(void *)(a1 + 72);
          uint64_t v14 = (int *)_tokenEntryAtRealIndex(a1, v13);
          if ((int)v11 >= *v14 >> 16)
          {
            unint64_t v15 = *((void *)v14 + 1);
            uint64_t v16 = HIDWORD(*(void *)v14);
            BOOL v17 = v11 == *v14 >> 16 && (int)v12 < (int)v16;
            uint64_t v18 = (uint64_t)(int)v15 >> 16;
            if (!v17 && (int)v11 <= (int)v18)
            {
              unint64_t v20 = HIDWORD(v15);
              if (v11 != v18 || (int)v12 < (int)v20) {
                goto LABEL_53;
              }
            }
            if ((int)v11 > *v14 >> 16) {
              goto LABEL_28;
            }
            if ((int)v12 >= (int)v16) {
              break;
            }
          }
          uint64_t v7 = v9 - 1;
LABEL_29:
          uint64_t v22 = v7 - v10;
          if (v7 < v10) {
            ++v22;
          }
          int64_t v9 = v10 + (v22 >> 1);
          if (v7 < v10) {
            goto LABEL_32;
          }
        }
        if ((int)v12 <= (int)v16) {
          goto LABEL_53;
        }
LABEL_28:
        int64_t v10 = v9 + 1;
        goto LABEL_29;
      }
LABEL_32:
      if (a3)
      {
        uint64_t v23 = *(void *)(a1 + 72);
        uint64_t v24 = v23 ? (*(void *)(a1 + 88) + v23 - *(void *)(a1 + 96)) % v23 : -1;
        if (v9 < v24)
        {
          uint64_t v31 = v9 < 0 ? -1 : (*(void *)(a1 + 96) + v9) % v23;
          CFTypeID v32 = (int *)_tokenEntryAtRealIndex(a1, v31);
          if (v32)
          {
            uint64_t v33 = (uint64_t)(int)a2 >> 16;
            if ((int)v33 < *v32 >> 16 || (int)v33 <= *v32 >> 16 && SHIDWORD(a2) < (int)HIDWORD(*(void *)v32))
            {
LABEL_53:
              if ((v9 & 0x8000000000000000) == 0)
              {
                uint64_t v6 = *(void *)(a1 + 96);
                uint64_t v3 = *(void *)(a1 + 72);
                return (v6 + v9) % v3;
              }
            }
          }
        }
      }
    }
    else
    {
      uint64_t v25 = *(uint64_t **)(a1 + 48);
      uint64_t v26 = *v25;
      if (*(unsigned char *)(a1 + 121))
      {
        uint64_t v35 = (*((_DWORD *)v25 + 2) + v26);
        v26 <<= 32;
        uint64_t v27 = v35 << 32;
      }
      else
      {
        uint64_t v27 = v25[1];
      }
      uint64_t v28 = (uint64_t)(int)a2 >> 16;
      uint64_t v29 = (uint64_t)(int)v26 >> 16;
      if ((int)v28 >= (int)v29 && (v28 != v29 || SHIDWORD(a2) >= SHIDWORD(v26)))
      {
        uint64_t v30 = (uint64_t)(int)v27 >> 16;
        if ((int)v28 <= (int)v30 && (v28 != v30 || SHIDWORD(a2) < SHIDWORD(v27)))
        {
          int64_t v9 = 0;
          return (v6 + v9) % v3;
        }
      }
    }
  }
  return -1;
}

uint64_t DDCachingStringTokenizerEnumerateTokens(uint64_t result, CFTypeRef cf, unsigned int a3, unint64_t a4, uint64_t a5)
{
  if (result)
  {
    uint64_t v8 = (void *)result;
    if (!*(void *)(result + 32)) {
      *(void *)(result + 32) = CFRetain(cf);
    }
    uint64_t Offset = matchingTokenRealIndexForQueryOffset((uint64_t)v8, a4, 0);
    BOOL result = _realToAbsoluteIndex(v8, Offset);
    if ((result & 0x8000000000000000) == 0)
    {
      uint64_t v10 = result;
      unsigned __int8 v48 = 0;
      unsigned int v47 = a3;
      if (!a3) {
        goto LABEL_23;
      }
      if (v8[13] > result && (uint64_t v11 = v8[9]) != 0) {
        uint64_t v12 = result % v11;
      }
      else {
        uint64_t v12 = -1;
      }
      BOOL result = _tokenEntryAtRealIndex((uint64_t)v8, v12);
      if (result && (uint64_t v13 = result, v14 = *(unsigned __int8 *)(result + 24), *(unsigned char *)(result + 24)))
      {
        uint64_t v15 = 0;
        uint64_t v16 = (uint64_t)(int)a4 >> 16;
        unint64_t v17 = HIDWORD(a4);
        uint64_t v18 = 32 * v14;
        do
        {
          uint64_t v19 = *(void *)(v13 + 16) + v18;
          uint64_t v20 = *(void *)(v19 - 32);
          uint64_t v21 = *(void *)(v19 - 24);
          uint64_t v22 = (uint64_t)(int)v21 >> 16;
          if ((int)v22 >= (int)v16 && ((int)v22 > (int)v16 || SHIDWORD(v21) > (int)v17)) {
            goto LABEL_20;
          }
          ++v15;
          BOOL result = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(a5, v20);
LABEL_20:
          if (v14 < 2) {
            break;
          }
          v18 -= 32;
          --v14;
        }
        while (v15 < 15);
      }
      else
      {
LABEL_23:
        uint64_t v15 = 0;
      }
      uint64_t v24 = v47;
      if (v15 <= 14)
      {
        do
        {
          if (v24)
          {
            uint64_t v25 = v10 - 1;
            if (v10 >= 1 && v8[13] >= v10 && (uint64_t v26 = v8[9]) != 0) {
              uint64_t v27 = v25 % v26;
            }
            else {
              uint64_t v27 = -1;
            }
            BOOL result = _tokenEntryAtRealIndex((uint64_t)v8, v27);
            uint64_t v28 = result;
            if (!result) {
              return result;
            }
          }
          else
          {
            uint64_t v25 = v10 + 1;
            if (v10 >= -1 && v8[13] > v25 && (uint64_t v35 = v8[9]) != 0) {
              uint64_t v36 = v25 % v35;
            }
            else {
              uint64_t v36 = -1;
            }
            uint64_t v37 = _tokenEntryAtRealIndex((uint64_t)v8, v36);
            if (v37)
            {
              uint64_t v28 = v37;
              uint64_t v29 = (unsigned __int8 *)(v37 + 24);
              if (*(unsigned char *)(v37 + 24)) {
                goto LABEL_51;
              }
              goto LABEL_49;
            }
            BOOL result = _fetchNextToken((uint64_t)v8);
            if (result < 0) {
              return result;
            }
            uint64_t v44 = v8[12] + result;
            uint64_t v45 = v8[9];
            uint64_t v46 = v44 % v45;
            if (v44 % v45 < 0) {
              return result;
            }
            uint64_t v28 = _tokenEntryAtRealIndex((uint64_t)v8, v44 % v45);
            BOOL result = _realToAbsoluteIndex(v8, v46);
            uint64_t v25 = result;
            if (!v28) {
              return result;
            }
          }
          uint64_t v29 = (unsigned __int8 *)(v28 + 24);
          unint64_t v30 = *(unsigned __int8 *)(v28 + 24);
          if (*(unsigned char *)(v28 + 24))
          {
            if (v24)
            {
              if (v48) {
                return result;
              }
              uint64_t v31 = 32 * v30;
              do
              {
                uint64_t v32 = v15 + 1;
                BOOL result = (*(uint64_t (**)(uint64_t, void, void, uint64_t, unsigned __int8 *))(a5 + 16))(a5, *(void *)(*(void *)(v28 + 16) + v31 - 32), *(void *)(*(void *)(v28 + 16) + v31 - 24), 1, &v48);
                int v33 = v48;
                if (v30 < 2) {
                  break;
                }
                --v30;
                v31 -= 32;
              }
              while (!v48 && v15++ < 14);
              goto LABEL_60;
            }
            if (v48) {
              return result;
            }
LABEL_51:
            uint64_t v38 = 0;
            unint64_t v39 = 1;
            do
            {
              BOOL result = (*(uint64_t (**)(uint64_t, void, void, void, unsigned __int8 *))(a5 + 16))(a5, *(void *)(*(void *)(v28 + 16) + v38), *(void *)(*(void *)(v28 + 16) + v38 + 8), 0, &v48);
              int v33 = v48;
              unint64_t v40 = v39 + 1;
              v38 += 32;
              BOOL v42 = v39 < *v29 && v48 == 0 && (uint64_t)(v15 + v39 - 1) < 14;
              ++v39;
            }
            while (v42);
            uint64_t v32 = v15 + v40 - 1;
            uint64_t v24 = v47;
            goto LABEL_60;
          }
LABEL_49:
          uint64_t v32 = v15 + 1;
          BOOL result = (*(uint64_t (**)(uint64_t, void, void, uint64_t, unsigned __int8 *))(a5 + 16))(a5, *(void *)v28, *(void *)(v28 + 8), v24, &v48);
          int v33 = v48;
LABEL_60:
          if (v33) {
            BOOL v43 = 0;
          }
          else {
            BOOL v43 = v32 < 15;
          }
          uint64_t v10 = v25;
          uint64_t v15 = v32;
        }
        while (v43);
      }
    }
  }
  return result;
}

uint64_t _realToAbsoluteIndex(void *a1, uint64_t a2)
{
  if (a2 < 0 || a1[9] <= a2) {
    return -1;
  }
  uint64_t v2 = a1[13];
  uint64_t v3 = a1[8];
  if (v2 > v3)
  {
    uint64_t v4 = a1[11];
    uint64_t v5 = v2 + a2;
    uint64_t v6 = v5 + ~v3 - v4;
    uint64_t v7 = v5 + ~v4;
    if (v4 >= a2) {
      return v7;
    }
    else {
      return v6;
    }
  }
  return a2;
}

uint64_t DDLogHandle()
{
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  return DDLogHandle_error_log_handle;
}

void DDError(CFStringRef format, ...)
{
  va_start(va, format);
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CFStringRef v1 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v2 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v4 = v1;
    _os_log_error_impl(&dword_19DC95000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  CFRelease(v1);
}

void DDLogErrD(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, CFStringRef format, ...)
{
  va_start(va, format);
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFStringRef v6 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v7 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v9 = v6;
    _os_log_error_impl(&dword_19DC95000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  CFRelease(v6);
}

void DDLogAssertionFailure(uint64_t a1, uint64_t a2, uint64_t a3, int a4, CFStringRef format, ...)
{
  va_start(va, format);
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFStringRef v8 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  CFStringRef v9 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315906;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = a4;
    __int16 v14 = 2080;
    uint64_t v15 = a1;
    __int16 v16 = 2112;
    CFStringRef v17 = v8;
    _os_log_error_impl(&dword_19DC95000, v9, OS_LOG_TYPE_ERROR, "assertion on %s:%d \"%s\" failed :%@", buf, 0x26u);
  }
  CFRelease(v8);
}

void DDTokenCacheDestroy(void **a1)
{
  if (a1)
  {
    uint64_t v2 = (uint64_t)a1[6];
    if (v2 >= 1)
    {
      for (uint64_t i = 0; i < v2; ++i)
      {
        uint64_t v4 = a1[4][i];
        if (v4)
        {
          if (*(_WORD *)(v4 + 6) != 1) {
            free(*(void **)(v4 + 8));
          }
          free((void *)v4);
          uint64_t v2 = (uint64_t)a1[6];
        }
      }
    }
    free(a1[4]);
    a1[4] = 0;
    if (*a1) {
      DDCachingStringTokenizerDestroy(*a1);
    }
    uint64_t v5 = a1[1];
    if (v5) {
      CFRelease(v5);
    }
    free(a1);
  }
}

uint64_t DDScanQueryCreate(uint64_t a1)
{
  CFTypeID v2 = DDTypeRegister(&DDScanQueryGetTypeID_typeID);

  return DDTypeCreateInstance_(a1, v2, 0x28uLL);
}

__CFString *_DDScanQueryCFCopyDebugDescription(uint64_t a1)
{
  return _DDScanQueryCFCopyFormatDescription(a1, 0);
}

__CFString *_DDScanQueryCFCopyFormatDescription(uint64_t a1, const __CFDictionary *a2)
{
  CFArrayRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, a2, @"<DDScanQuery:%p\n", a1);
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = v5 < 1;
  uint64_t v7 = v5 - 1;
  if (!v6)
  {
    CFStringRef CopyRange = DDScanQueryCopyRange(a1, *(void *)(*(void *)(a1 + 16) + 16) << 32, (v7 << 16) | ((unint64_t)(*(_DWORD *)(*(void *)(a1 + 16)+ 48 * v7+ 24)+ *(_DWORD *)(*(void *)(a1 + 16)+ 48 * v7+ 16)) << 32));
    CFStringAppend(Mutable, CopyRange);
    CFRelease(CopyRange);
  }
  CFStringAppendFormat(Mutable, a2, @"\n>");
  return Mutable;
}

BOOL _DDScanQueryCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t DDScanQuerySetMetadataReleaseCallback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t DDScanQueryAddLineBreak(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(result + 16) + 48 * v1;
    unsigned int v3 = *(_DWORD *)(v2 - 8);
    unsigned int v4 = v3 & 0xE3FFFFFF;
    if (((v3 >> 26) & 7) >= 3) {
      int v5 = 0x10000000;
    }
    else {
      int v5 = 201326592;
    }
    *(_DWORD *)(v2 - 8) = v4 | v5 | 0x80000000;
  }
  return result;
}

unint64_t DDScanQueryGetOffsetOfAbsolutePosition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    unsigned int v4 = (uint64_t *)(a1 + 32);
    while (1)
    {
      uint64_t v5 = *v4;
      v4 += 6;
      if (v5 > a3) {
        break;
      }
      if (a2 == ++v3)
      {
        uint64_t v3 = a2;
        return ((v3 - 1) << 16) | ((unint64_t)(a3
                                                                                        - *(_DWORD *)(a1 + 48 * (v3 - 1) + 32)
                                                                                        + *(_DWORD *)(a1 + 48 * (v3 - 1) + 16)) << 32);
      }
    }
  }
  return ((v3 - 1) << 16) | ((unint64_t)(a3
                                                                                  - *(_DWORD *)(a1 + 48 * (v3 - 1) + 32)
                                                                                  + *(_DWORD *)(a1 + 48 * (v3 - 1) + 16)) << 32);
}

CFStringRef DDScanQueryCopyFullStringExcludingContext(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v3 = __OFSUB__(v1, 1);
  BOOL v2 = v1 - 1 < 0;
  uint64_t v4 = v1 - 1;
  if (v2 != v3) {
    return &stru_1EF034530;
  }
  else {
    return DDScanQueryCopyRange(a1, (unint64_t)((int)(*(_DWORD *)(*(void *)(a1 + 16) + 40) << 6) >> 6) << 32, (v4 << 16) | (*(void *)(*(void *)(a1 + 16) + 48 * v4 + 24) << 32));
  }
}

CFStringRef DDScanQueryCopySubStringFromPos(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)(int)a2 >> 16;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(v5 + 48 * (int)v4 + 32) + (a2 >> 32) - *(void *)(v5 + 48 * (int)v4 + 16) + 20;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6 >= *(void *)(v5 + 48 * v7 - 24) + *(void *)(v5 + 48 * v7 - 16)) {
    uint64_t v8 = *(void *)(v5 + 48 * v7 - 24) + *(void *)(v5 + 48 * v7 - 16);
  }
  else {
    uint64_t v8 = v6;
  }
  unint64_t v9 = DDScanQueryGetOffsetOfAbsolutePosition(v5, v7, v8) & 0xFFFFFFFFFFFF0000;

  return DDScanQueryCopyRange(a1, (v4 << 16) | a2 & 0xFFFFFFFF00000000, v9);
}

uint64_t DDScanQueryGetFragmentMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && (a2 & 0x8000000000000000) == 0)
  {
    if (*(void *)(a1 + 32) > a2 && (uint64_t v4 = *(void *)(a1 + 16)) != 0) {
      return *(void *)(v4 + 48 * a2 + 8);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t DDScanQueryGetFragmentRange(uint64_t a1, uint64_t a2)
{
  uint64_t result = -1;
  if (a1 && (a2 & 0x8000000000000000) == 0 && *(void *)(a1 + 32) > a2)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4) {
      return *(void *)(v4 + 48 * a2 + 16);
    }
  }
  return result;
}

uint64_t _DDScanQueryCountNewlinesInFragment(uint64_t a1, CFIndex a2, CFIndex a3, uint64_t a4)
{
  if (!a1 || !*(void *)a1 || (*(unsigned char *)(a1 + 43) & 0x40) != 0) {
    return 0;
  }
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  CFIndex Length = CFStringGetLength(*(CFStringRef *)a1);
  uint64_t v10 = 0;
  if (a4 >= 1 && a3 >= 1 && a2 >= 1)
  {
    CFIndex v11 = Length;
    if (a3 + a2 <= Length)
    {
      uint64_t v10 = 0;
      do
      {
        v16.NSUInteger location = 0;
        v16.CFArrayRef length = 0;
        v17.NSUInteger location = a2;
        v17.CFArrayRef length = a3;
        if (!CFStringFindCharacterFromSet(*(CFStringRef *)a1, Predefined, v17, 0, &v16)) {
          break;
        }
        if (++v10 >= a4) {
          break;
        }
        CFIndex v12 = a3 + a2;
        a2 = v16.length + v16.location;
        a3 = v12 - (v16.length + v16.location);
        BOOL v13 = a3 < 1 || a2 < 1;
      }
      while (!v13 && v12 <= v11);
    }
  }
  return v10;
}

void DDLexemCacheDestroy(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 24);
    if (v2 >= 1)
    {
      for (uint64_t i = 0; i < v2; ++i)
      {
        uint64_t v4 = *(void ***)(*(void *)(a1 + 8) + 8 * i);
        if (v4)
        {
          DDLexemCacheItemDestroy(v4);
          uint64_t v2 = *(void *)(a1 + 24);
        }
      }
    }
    free(*(void **)(a1 + 8));
    *(void *)(a1 + 8) = 0;
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5 >= 1)
    {
      for (uint64_t j = 0; j < v5; ++j)
      {
        uint64_t v7 = *(void ***)(*(void *)(a1 + 40) + 8 * j);
        if (v7)
        {
          DDLexemCacheItemDestroy(v7);
          uint64_t v5 = *(void *)(a1 + 56);
        }
      }
    }
    free(*(void **)(a1 + 40));
    *(void *)(a1 + 40) = 0;
    uint64_t v8 = *(void ***)(a1 + 64);
    if (v8) {
      DDLexemCacheItemDestroy(v8);
    }
    free((void *)a1);
  }
}

void DDLexemCacheItemDestroy(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    free(v2);
  }

  free(a1);
}

void **DDLexemCacheItemCreate(uint64_t a1, void *a2)
{
  uint64_t v4 = (void **)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  DDLexemCacheItemReset((uint64_t)v4);
  DDLexemCacheItemSet(v4, a1, a2);
  return v4;
}

void *DDLexemCacheItemResetForCapacity(void *result, uint64_t a2)
{
  uint64_t v2 = result[1];
  result[1] = v2 | 0xFFFFFFFFLL;
  if (v2 >= 0x100000000)
  {
    uint64_t v4 = result;
    uint64_t v5 = v2 >> 32;
    if (v5 < a2)
    {
      uint64_t result = malloc_type_realloc((void *)*result, 32 * a2, 0x1010040F32E1FD2uLL);
      void *v4 = result;
      uint64_t v6 = a2 << 32;
LABEL_7:
      v4[1] = *((unsigned int *)v4 + 2) | (unint64_t)v6;
      return result;
    }
    if (a2 <= 23 && v5 > a2)
    {
      uint64_t result = malloc_type_realloc((void *)*result, 0x300uLL, 0x1010040F32E1FD2uLL);
      void *v4 = result;
      uint64_t v6 = 0x1800000000;
      goto LABEL_7;
    }
  }
  return result;
}

void DDDataDetectorSetUsesDebugSource(int a1)
{
  if (_workDir_sOnce != -1) {
    dispatch_once(&_workDir_sOnce, &__block_literal_global_923);
  }
  uint64_t v2 = _workDir_dir_name;
  if (a1) {
    BOOL v3 = (char *)_workDir_dir_name;
  }
  else {
    BOOL v3 = 0;
  }
  DDSourceSetStoragePath(v3);
  if (v2)
  {
    DDSourcePushSharedDataOrFile(1, 0, 0, 1, 0);
    DDSourcePushSharedDataOrFile(2, 0, 0, 1, 0);
    DDSourcePushSharedDataOrFile(3, 0, 0, 1, 0);
  }
}

void ___workDir_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CFTypeID v0 = [(NSString *)NSTemporaryDirectory() cStringUsingEncoding:4];
  _workDir_dir_name = (uint64_t)strdup(v0);
  if (_workDir_dir_name)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v1 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315138;
      uint64_t v3 = _workDir_dir_name;
      _os_log_impl(&dword_19DC95000, v1, OS_LOG_TYPE_DEFAULT, "Using temp work directory %s", (uint8_t *)&v2, 0xCu);
    }
  }
}

BOOL DDIsValidEAN13OrUPCA(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 14) < 0xFFFFFFFFFFFFFFFELL) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = a2 - 1;
  do
  {
    uint64_t v6 = *(char *)(a1 + v4);
    if (((v4 ^ a2) & 1) == 0) {
      v6 *= 3;
    }
    v3 += v6;
    ++v4;
  }
  while (v5 != v4);
  return 10 * ((v3 + 9) / 10) - v3 == *(char *)(a1 + v5);
}

void DDResultExpandRange(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 | a3)
  {
    uint64_t v4 = a4;
    uint64_t v5 = a3;
    do
    {
      uint64_t v9 = a1[4];
      uint64_t v8 = a1[5];
      uint64_t v10 = v9 - v5;
      uint64_t v11 = v4 + v5 + v8;
      _setResultRangesAndMatchedString(a1, a2, v9 - v5, v11);
      CFArrayRef v12 = (const __CFArray *)a1[7];
      if (!v12) {
        return;
      }
      uint64_t v33 = v8;
      CFIndex Count = CFArrayGetCount(v12);
      uint64_t v14 = Count;
      if (v5 < 1)
      {
        if ((v5 & 0x8000000000000000) == 0)
        {
          uint64_t v5 = 0;
LABEL_25:
          a1 = 0;
          goto LABEL_26;
        }
        if (Count < 1) {
          goto LABEL_25;
        }
        a1 = 0;
        unint64_t v18 = Count + 1;
        do
        {
          CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v12, v18 - 2);
          uint64_t v20 = ValueAtIndex[4];
          if (v20 < v10)
          {
            if (a1 || v10 >= v20 + ValueAtIndex[5])
            {
              CFArrayRemoveValueAtIndex(v12, v18 - 2);
              --v14;
            }
            else
            {
              uint64_t v5 = v20 - v10;
              a1 = ValueAtIndex;
            }
          }
          --v18;
        }
        while (v18 > 1);
      }
      else
      {
        if (Count < 1) {
          goto LABEL_25;
        }
        CFIndex v15 = 0;
        while (1)
        {
          CFRange v16 = CFArrayGetValueAtIndex(v12, v15);
          uint64_t v17 = v16[4];
          if (v16[5]) {
            break;
          }
          _setResultRangesAndMatchedString(v16, a2, v17 - v5, 0);
          if (v14 == ++v15) {
            goto LABEL_25;
          }
        }
        if (v17 != v9) {
          goto LABEL_25;
        }
        if (v16[10]) {
          a1 = 0;
        }
        else {
          a1 = v16;
        }
      }
LABEL_26:
      if (v4 < 1)
      {
        if ((v4 & 0x8000000000000000) == 0)
        {
          uint64_t v4 = 0;
LABEL_48:
          uint64_t v25 = 0;
          goto LABEL_49;
        }
        if (v14 < 1) {
          goto LABEL_48;
        }
        CFIndex v26 = 0;
        uint64_t v25 = 0;
        uint64_t v27 = v10 + v11;
        do
        {
          uint64_t v28 = CFArrayGetValueAtIndex(v12, v26);
          uint64_t v29 = v28[4];
          uint64_t v30 = v29 + v28[5];
          BOOL v31 = __OFSUB__(v27, v30);
          uint64_t v32 = v27 - v30;
          if (v32 < 0 != v31)
          {
            if (v25 || v27 <= v29)
            {
              CFArrayRemoveValueAtIndex(v12, v26--);
              --v14;
            }
            else
            {
              uint64_t v4 = v32;
              uint64_t v25 = v28;
            }
          }
          ++v26;
        }
        while (v26 < v14);
      }
      else
      {
        if (v14 < 1) {
          goto LABEL_48;
        }
        uint64_t v21 = v14 + 1;
        while (1)
        {
          uint64_t v22 = CFArrayGetValueAtIndex(v12, v21 - 2);
          uint64_t v23 = v22[4];
          uint64_t v24 = v22[5];
          if (v24) {
            break;
          }
          _setResultRangesAndMatchedString(v22, a2, v23 + v4, 0);
          if ((unint64_t)--v21 <= 1) {
            goto LABEL_48;
          }
        }
        if (v23 + v24 != v9 + v33) {
          goto LABEL_48;
        }
        if (v22[10]) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = v22;
        }
      }
LABEL_49:
      if (a1 == v25)
      {
        if (!a1) {
          return;
        }
      }
      else
      {
        if (a1) {
          DDResultExpandRange(a1, a2, v5, 0);
        }
        if (!v25) {
          return;
        }
        uint64_t v5 = 0;
        a1 = v25;
      }
    }
    while (v4 | v5);
  }
}

void _setResultRangesAndMatchedString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[4] = a3;
  a1[5] = a4;
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 32);
  unint64_t OffsetOfAbsolutePosition = DDScanQueryGetOffsetOfAbsolutePosition(v8, v9, a3);
  unint64_t v11 = DDScanQueryGetOffsetOfAbsolutePosition(v8, v9, a3 + a4);
  a1[2] = OffsetOfAbsolutePosition & 0xFFFFFFFFFFFF0000;
  a1[3] = v11 & 0xFFFFFFFFFFFF0000;
  if (*(uint64_t *)(a2 + 32) < 1)
  {
    CFStringRef CopyRange = &stru_1EF034530;
LABEL_7:
    DDResultSetMatchedString((uint64_t)a1, CopyRange);
    CFRelease(CopyRange);
    return;
  }
  int v12 = *(_DWORD *)(*(void *)(a2 + 16) + 40);
  int v13 = v12 << 6;
  unint64_t v14 = (unint64_t)(v12 & 0x3FFFFFF) << 32;
  if (v13 <= 0) {
    unint64_t v14 = 0;
  }
  CFStringRef CopyRange = DDScanQueryCopyRange(a2, v14 + (OffsetOfAbsolutePosition & 0xFFFFFFFFFFFF0000), v14 + (v11 & 0xFFFFFFFFFFFF0000));
  if (CopyRange) {
    goto LABEL_7;
  }
}

BOOL __DDMLRelevantSubstringsAroundRanges_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 rangeValue];
  unint64_t v6 = [v4 rangeValue];

  return v6 < v5;
}

const void *DDMLScannerScanStringAroundResults(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v362 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 264)) {
    CFArrayRef v6 = *(const __CFArray **)(a1 + 272);
  }
  else {
    CFArrayRef v6 = (const __CFArray *)&unk_1EF03BE18;
  }
  v280 = a2;
  id v7 = a3;
  *(void *)uint64_t v281 = a1;
  if (-[__CFArray count](v6, "count") && [v7 count])
  {
    uint64_t v269 = objc_opt_new();
    long long v303 = 0u;
    long long v304 = 0u;
    long long v305 = 0u;
    long long v306 = 0u;
    id v255 = v7;
    uint64_t v8 = (Class *)v7;
    uint64_t v9 = [(Class *)v8 countByEnumeratingWithState:&v303 objects:&v320 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v304;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v304 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v303 + 1) + 8 * i);
          if (_ddResultTypeHasMLEquivalent(v12, v6))
          {
            int v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *(void *)(v12 + 32), *(void *)(v12 + 40));
            [v269 addObject:v13];
          }
        }
        uint64_t v9 = [(Class *)v8 countByEnumeratingWithState:&v303 objects:&v320 count:16];
      }
      while (v9);
    }

    if ([v269 count])
    {
      v260 = v280;
      id spid = v269;
      gotLoadHelper_x20__OBJC_CLASS___NLTokenizer(v14);
      uint64_t v258 = (void *)[objc_alloc(v8[288]) initWithUnit:1];
      [v258 setString:v260];
      CFIndex v15 = objc_msgSend(v258, "tokensForRange:", 0, -[__CFString length](v260, "length"));
      uint64_t v256 = (void *)[objc_alloc(v8[288]) initWithUnit:0];
      [v256 setString:v260];
      CFRange v16 = objc_msgSend(v256, "tokensForRange:", 0, -[__CFString length](v260, "length"));
      id v295 = (id)[v16 mutableCopy];

      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      id v293 = (id)objc_claimAutoreleasedReturnValue();
      long long v343 = 0u;
      long long v342 = 0u;
      long long v341 = 0u;
      *(_OWORD *)v340 = 0u;
      obuint64_t j = v15;
      uint64_t v274 = [obj countByEnumeratingWithState:v340 objects:&block count:16];
      if (v274)
      {
        LODWORD(v282) = 0;
        LODWORD(v17) = 0;
        uint64_t v271 = *(void *)v341;
        do
        {
          unint64_t v18 = 0;
          id v282 = (id)(int)v282;
          do
          {
            if (*(void *)v341 != v271)
            {
              uint64_t v19 = v18;
              objc_enumerationMutation(obj);
              unint64_t v18 = v19;
            }
            uint64_t v277 = v18;
            NSUInteger v20 = [*(id *)(*(void *)&v340[8] + 8 * (void)v18) rangeValue];
            NSUInteger v22 = v21;
            if ((int)v17 < (int)[v295 count])
            {
              uint64_t v288 = 0;
              uint64_t v17 = (int)v17;
              uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
              while (1)
              {
                uint64_t v24 = [v295 objectAtIndexedSubscript:v17];
                NSUInteger v25 = [v24 rangeValue];
                NSUInteger v27 = v26;

                v363.uint64_t location = v20;
                v363.NSUInteger length = v22;
                v374.uint64_t location = v25;
                v374.NSUInteger length = v27;
                if (NSIntersectionRange(v363, v374).length)
                {
                  if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
                    uint64_t v23 = v17;
                  }
                  ++v288;
                  if ((uint64_t)(v20 + v22 - (v27 + v25)) <= 3)
                  {
                    if ([v295 count] <= v17 + 1) {
                      goto LABEL_29;
                    }
                    uint64_t v28 = objc_msgSend(v295, "objectAtIndexedSubscript:");
                    NSUInteger v29 = [v28 rangeValue];
                    NSUInteger v31 = v30;

                    v364.uint64_t location = v29;
                    v364.NSUInteger length = v31;
                    v375.uint64_t location = v20;
                    v375.NSUInteger length = v22;
                    if (!NSIntersectionRange(v364, v375).length)
                    {
LABEL_29:
                      uint64_t v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v25, v20 + v22 - v25);
                      [v295 setObject:v32 atIndexedSubscript:v17];
                    }
                  }
                }
                else if (v23 != 0x7FFFFFFFFFFFFFFFLL || (uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL, v25 + v27 >= v20))
                {
LABEL_33:
                  uint64_t v33 = v288;
                  goto LABEL_35;
                }
                if (++v17 >= (int)[v295 count]) {
                  goto LABEL_33;
                }
              }
            }
            uint64_t v33 = 0;
            uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_35:
            if ((int)v17 <= 1) {
              int v34 = 1;
            }
            else {
              int v34 = v17;
            }
            uint64_t v35 = (v34 - 1);
            if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v36 = 0;
            }
            else {
              uint64_t v36 = v33;
            }
            if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v37 = v35;
            }
            else {
              uint64_t v37 = v23;
            }
            uint64_t v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v37, v36);
            [v293 setObject:v38 atIndexedSubscript:v282];

            id v282 = (char *)v282 + 1;
            unint64_t v18 = v277 + 1;
          }
          while (v277 + 1 != (char *)v274);
          uint64_t v274 = [obj countByEnumeratingWithState:v340 objects:&block count:16];
        }
        while (v274);
      }

      uint64_t v275 = objc_opt_new();
      long long v313 = 0u;
      long long v314 = 0u;
      long long v311 = 0u;
      long long v312 = 0u;
      id v283 = spid;
      uint64_t v289 = [v283 countByEnumeratingWithState:&v311 objects:v344 count:16];
      if (v289)
      {
        uint64_t v285 = *(void *)v312;
        do
        {
          for (uint64_t j = 0; j != v289; ++j)
          {
            if (*(void *)v312 != v285) {
              objc_enumerationMutation(v283);
            }
            NSUInteger v40 = [*(id *)(*((void *)&v311 + 1) + 8 * j) rangeValue];
            NSUInteger v42 = v41;
            if ([obj count] >= 1)
            {
              uint64_t v43 = 0;
              uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
              uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
              do
              {
                uint64_t v46 = [obj objectAtIndexedSubscript:v43];
                NSUInteger v47 = [v46 rangeValue];
                NSUInteger v49 = v48;

                v365.uint64_t location = v40;
                v365.NSUInteger length = v42;
                v376.uint64_t location = v47;
                v376.NSUInteger length = v49;
                if (NSIntersectionRange(v365, v376).length)
                {
                  if (v45 == 0x7FFFFFFFFFFFFFFFLL) {
                    uint64_t v50 = v43;
                  }
                  else {
                    uint64_t v50 = v45;
                  }
                  uint64_t v44 = v43;
                }
                else
                {
                  uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
                  if (v45 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_61;
                  }
                }
                ++v43;
                uint64_t v45 = v50;
              }
              while (v43 < [obj count]);
              uint64_t v45 = v50;
              if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
                continue;
              }
LABEL_61:
              uint64_t v51 = [v293 objectAtIndexedSubscript:v45];
              NSUInteger v52 = [v51 rangeValue];
              NSUInteger v54 = v53;

              CFIndex v55 = [v293 objectAtIndexedSubscript:v44];
              NSUInteger v56 = [v55 rangeValue];
              NSUInteger v58 = v57;

              v366.uint64_t location = v52;
              v366.NSUInteger length = v54;
              v377.uint64_t location = v56;
              v377.NSUInteger length = v58;
              NSRange v59 = NSUnionRange(v366, v377);
              uint64_t location = v59.location;
              NSUInteger length = v59.length;
LABEL_62:
              ++v44;
              while (length <= 0x27)
              {
                BOOL v62 = v45-- < 1;
                if (v62
                  || ([v293 objectAtIndexedSubscript:v45],
                      uint64_t v63 = objc_claimAutoreleasedReturnValue(),
                      NSUInteger v64 = [v63 rangeValue],
                      NSUInteger v66 = v65,
                      v63,
                      v64 == 0x7FFFFFFFFFFFFFFFLL))
                {
                  char v67 = 0;
                }
                else
                {
                  v367.uint64_t location = v64;
                  v367.NSUInteger length = v66;
                  v378.uint64_t location = location;
                  v378.NSUInteger length = length;
                  NSRange v68 = NSUnionRange(v367, v378);
                  if (v68.length <= 0x96) {
                    uint64_t location = v68.location;
                  }
                  else {
                    uint64_t location = location + length - 150;
                  }
                  if (v68.length >= 0x96) {
                    NSUInteger length = 150;
                  }
                  else {
                    NSUInteger length = v68.length;
                  }
                  char v67 = 1;
                }
                if (v44 < [v293 count])
                {
                  int v69 = [v293 objectAtIndexedSubscript:v44];
                  NSUInteger v70 = [v69 rangeValue];
                  NSUInteger v72 = v71;

                  if (v70 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v368.uint64_t location = v70;
                    v368.NSUInteger length = v72;
                    v379.uint64_t location = location;
                    v379.NSUInteger length = length;
                    NSRange v73 = NSUnionRange(v368, v379);
                    uint64_t location = v73.location;
                    if (v73.length >= 0x96) {
                      NSUInteger length = 150;
                    }
                    else {
                      NSUInteger length = v73.length;
                    }
                    goto LABEL_62;
                  }
                }
                ++v44;
                if ((v67 & 1) == 0) {
                  break;
                }
              }
              __int16 v74 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
              [v275 addObject:v74];
            }
          }
          uint64_t v289 = [v283 countByEnumeratingWithState:&v311 objects:v344 count:16];
        }
        while (v289);
      }

      v254 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:0 ascending:1 comparator:&__block_literal_global_1006];
      v353 = v254;
      CFRange v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v353 count:1];
      int v76 = [v275 sortedArrayUsingDescriptors:v75];

      uint64_t v77 = objc_opt_new();
      long long v309 = 0u;
      long long v310 = 0u;
      long long v307 = 0u;
      long long v308 = 0u;
      id v278 = v76;
      uint64_t v78 = [v278 countByEnumeratingWithState:&v307 objects:&aBlock count:16];
      if (v78)
      {
        uint64_t v290 = 0;
        uint64_t v79 = *(void *)v308;
        do
        {
          for (uint64_t k = 0; k != v78; ++k)
          {
            if (*(void *)v308 != v79) {
              objc_enumerationMutation(v278);
            }
            int v81 = *(void **)(*((void *)&v307 + 1) + 8 * k);
            if (!v290) {
              goto LABEL_97;
            }
            NSUInteger v82 = [*(id *)(*((void *)&v307 + 1) + 8 * k) rangeValue];
            NSUInteger v84 = v83;
            v369.uint64_t location = [v290 rangeValue];
            NSUInteger v85 = v369.location;
            NSUInteger v86 = v369.length;
            v380.uint64_t location = v82;
            v380.NSUInteger length = v84;
            BOOL v87 = NSIntersectionRange(v369, v380).length || v85 + v86 == v82;
            if (v87
              && (v370.uint64_t location = v82,
                  v370.NSUInteger length = v84,
                  v381.uint64_t location = v85,
                  v381.NSUInteger length = v86,
                  NSRange v88 = NSUnionRange(v370, v381),
                  v88.length <= 0x96))
            {
              objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v88.location, v88.length);
              id v89 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v77, "replaceObjectAtIndex:withObject:", objc_msgSend(v77, "count") - 1, v89);
            }
            else
            {
LABEL_97:
              id v89 = v81;

              [v77 addObject:v89];
            }
            uint64_t v290 = v89;
          }
          uint64_t v78 = [v278 countByEnumeratingWithState:&v307 objects:&aBlock count:16];
        }
        while (v78);
      }
      else
      {
        uint64_t v290 = 0;
      }

      spida = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v77, "count"));
      long long v331 = 0u;
      long long v330 = 0u;
      long long v328 = 0u;
      long long v329 = 0u;
      id v262 = v77;
      uint64_t v272 = [v262 countByEnumeratingWithState:&v328 objects:&v324 count:16];
      if (v272)
      {
        uint64_t v264 = *(void *)v329;
        do
        {
          uint64_t v91 = 0;
          do
          {
            if (*(void *)v329 != v264)
            {
              uint64_t v92 = v91;
              objc_enumerationMutation(v262);
              uint64_t v91 = v92;
            }
            uint64_t v286 = v91;
            uint64_t v93 = [*(id *)(*((void *)&v328 + 1) + 8 * v91) rangeValue];
            uint64_t v95 = v94;
            int v96 = [v295 objectAtIndexedSubscript:v93];
            NSUInteger v97 = [v96 rangeValue];
            NSUInteger v99 = v98;

            __int16 v100 = [v295 objectAtIndexedSubscript:v95 + v93 - 1];
            NSUInteger v101 = [v100 rangeValue];
            NSUInteger v103 = v102;

            v371.uint64_t location = v97;
            v371.NSUInteger length = v99;
            v382.uint64_t location = v101;
            v382.NSUInteger length = v103;
            NSRange v104 = NSUnionRange(v371, v382);
            id v105 = v283;
            long long v315 = 0u;
            long long v316 = 0u;
            long long v317 = 0u;
            long long v318 = 0u;
            uint64_t v106 = [v105 countByEnumeratingWithState:&v315 objects:&buf count:16];
            if (v106)
            {
              uint64_t v107 = *(void *)v316;
              NSUInteger v108 = v104.length;
              NSUInteger v109 = v104.location;
              do
              {
                for (uint64_t m = 0; m != v106; ++m)
                {
                  if (*(void *)v316 != v107) {
                    objc_enumerationMutation(v105);
                  }
                  v372.uint64_t location = [*(id *)(*((void *)&v315 + 1) + 8 * m) rangeValue];
                  NSUInteger v111 = v372.location;
                  NSUInteger v112 = v372.length;
                  NSRange v113 = NSIntersectionRange(v372, v104);
                  if (v113.length) {
                    BOOL v114 = v113.length >= v112;
                  }
                  else {
                    BOOL v114 = 1;
                  }
                  if (!v114)
                  {
                    v373.uint64_t location = v111;
                    v373.NSUInteger length = v112;
                    NSRange v115 = NSUnionRange(v373, v104);
                    NSUInteger v109 = v115.location;
                    NSUInteger v108 = v115.length;
                  }
                }
                uint64_t v106 = [v105 countByEnumeratingWithState:&v315 objects:&buf count:16];
              }
              while (v106);
            }
            else
            {
              NSUInteger v108 = v104.length;
              NSUInteger v109 = v104.location;
            }

            CFArrayRef v116 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v109, v108);
            [spida addObject:v116];

            uint64_t v91 = v286 + 1;
          }
          while (v286 + 1 != v272);
          uint64_t v272 = [v262 countByEnumeratingWithState:&v328 objects:&v324 count:16];
        }
        while (v272);
      }

      CFAbsoluteTime v90 = [MEMORY[0x1E4F1CAD0] setWithArray:spida];
    }
    else
    {
      CFAbsoluteTime v90 = 0;
    }

    id v7 = v255;
  }
  else
  {
    CFAbsoluteTime v90 = 0;
  }

  long long v299 = 0u;
  long long v300 = 0u;
  long long v301 = 0u;
  long long v302 = 0u;
  id v249 = v90;
  uint64_t v253 = [v249 countByEnumeratingWithState:&v299 objects:v319 count:16];
  if (v253)
  {
    uint64_t v270 = 0;
    uint64_t v251 = *(void *)v300;
    uint64_t v246 = v345;
    *(void *)&long long v117 = 138412290;
    long long v245 = v117;
    while (1)
    {
      for (uint64_t n = 0; n != v253; ++n)
      {
        if (*(void *)v300 != v251) {
          objc_enumerationMutation(v249);
        }
        uint64_t v118 = objc_msgSend(*(id *)(*((void *)&v299 + 1) + 8 * n), "rangeValue", v245, v246);
        uint64_t v120 = v119;
        os_unfair_lock_lock((os_unfair_lock_t)&__DDMLCooldownLock);
        os_unfair_lock_unlock((os_unfair_lock_t)&__DDMLCooldownLock);
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        CFIndex v121 = (id)DDLogHandle_error_log_handle;
        os_signpost_id_t spidb = os_signpost_id_generate(v121);

        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        CFAllocatorRef v122 = (id)DDLogHandle_error_log_handle;
        uint64_t v123 = v122;
        if (spidb - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19DC95000, v123, OS_SIGNPOST_INTERVAL_BEGIN, spidb, "datadetectors.scanString.mlScan", (const char *)&unk_19DCD32E3, (uint8_t *)&buf, 2u);
        }

        if (*(void *)(*(void *)v281 + 264))
        {
          int v124 = 1;
          *a4 = 1;
          CFArrayRef v125 = *(const __CFArray **)(*(void *)v281 + 264);
          goto LABEL_291;
        }
        int v126 = *(_DWORD *)(*(void *)v281 + 252);
        if (!v126) {
          int v126 = DDComputeDominantScriptOrLanguage(v280);
        }
        id v259 = 0;
        if (v126 == 30)
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v355 = 0x3032000000;
          v356 = __Block_byref_object_copy__1014;
          v357 = __Block_byref_object_dispose__1015;
          id v358 = 0;
          uint64_t v127 = _ddmlModelQueue();
          blocuint64_t k = MEMORY[0x1E4F143A8];
          uint64_t v348 = 3221225472;
          v349 = __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke;
          v350 = &unk_1E59852D8;
          p_long long buf = &buf;
          dispatch_sync(v127, &block);

          if (([*(id *)(*((void *)&buf + 1) + 40) hasAvailableAssets] & 1) == 0)
          {
            uint64_t v128 = *(void **)(*((void *)&buf + 1) + 40);
            v344[0] = MEMORY[0x1E4F143A8];
            v344[1] = 3221225472;
            v345[0] = __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke_2;
            v345[1] = &unk_1E5985300;
            id v346 = 0;
            [v128 requestEmbeddingAssetsWithCompletionHandler:v344];
          }
          id v259 = *(id *)(*((void *)&buf + 1) + 40);
          _Block_object_dispose(&buf, 8);
        }
        if (![v259 hasAvailableAssets])
        {
          float v132 = *(const void **)(*(void *)v281 + 272);
          if (v132)
          {
            CFRelease(v132);
            id v279 = 0;
            *(void *)(*(void *)v281 + 272) = 0;
          }
          else
          {
            id v279 = 0;
          }
          goto LABEL_285;
        }
        id v129 = v259;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v355 = 0x3032000000;
        v356 = __Block_byref_object_copy__1014;
        v357 = __Block_byref_object_dispose__1015;
        id v358 = 0;
        float v130 = _ddmlModelQueue();
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v348 = 3221225472;
        v349 = __DDMLGetTaggerModel_block_invoke;
        v350 = &unk_1E59853D8;
        uint64_t v261 = (long long *)v129;
        p_long long buf = v261;
        v352 = &buf;
        dispatch_sync(v130, &block);

        if ([*(id *)(*((void *)&buf + 1) + 40) taggerModel])
        {
          id v131 = 0;
        }
        else
        {
          id v131 = [*(id *)(*((void *)&buf + 1) + 40) error];
        }
        id v133 = [*(id *)(*((void *)&buf + 1) + 40) supportedTypes];
        id v263 = (id)[*(id *)(*((void *)&buf + 1) + 40) taggerModel];

        _Block_object_dispose(&buf, 8);
        id v248 = v131;
        v247 = v133;
        DDScannerSetMLSupportedTypes(*(void **)v281, v247);
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        long long v134 = (id)DDLogHandle_error_log_handle;
        uint64_t v135 = v134;
        if (!v263)
        {
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v245;
            *(void *)((char *)&buf + 4) = v248;
            _os_log_error_impl(&dword_19DC95000, v135, OS_LOG_TYPE_ERROR, "Failed to acquire DDML model with error %@", (uint8_t *)&buf, 0xCu);
          }
          id v279 = 0;
          goto LABEL_284;
        }
        os_signpost_id_t v136 = os_signpost_id_generate(v134);

        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        v137 = (id)DDLogHandle_error_log_handle;
        v138 = v137;
        if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19DC95000, v138, OS_SIGNPOST_INTERVAL_BEGIN, v136, "datadetectors.scanString.sentenceTokenization", (const char *)&unk_19DCD32E3, (uint8_t *)&buf, 2u);
        }

        v139 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v118, v120);
        v353 = v139;
        uint64_t v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v353 count:1];

        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        float v141 = (id)DDLogHandle_error_log_handle;
        unsigned int v142 = v141;
        if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19DC95000, v142, OS_SIGNPOST_INTERVAL_END, v136, "datadetectors.scanString.sentenceTokenization", (const char *)&unk_19DCD32E3, (uint8_t *)&buf, 2u);
        }

        long long v322 = 0u;
        long long v323 = 0u;
        long long v320 = 0u;
        long long v321 = 0u;
        v294 = v140;
        uint64_t v287 = [v294 countByEnumeratingWithState:&v320 objects:&block count:16];
        if (v287)
        {
          id v279 = 0;
          id v284 = *(id *)v321;
          v143 = v294;
          do
          {
            for (id obja = 0; obja != (id)v287; id obja = (char *)obja + 1)
            {
              if (*(id *)v321 != v284)
              {
                objc_enumerationMutation(v143);
                v143 = v294;
              }
              if (*(void *)v281 && (*(unsigned char *)(*(void *)v281 + 232) & 1) != 0) {
                goto LABEL_280;
              }
              uint64_t v144 = [*(id *)(*((void *)&v320 + 1) + 8 * (void)obja) rangeValue];
              unint64_t v146 = -[__CFString substringWithRange:](v280, "substringWithRange:", v144, v145);
              id v296 = v146;
              if (v146)
              {
                if ([v146 length])
                {
                  uint64_t v147 = v261;
                  unint64_t v148 = (void *)MEMORY[0x1E4F1CA48];
                  id v149 = v296;
                  v273 = [v148 array];
                  uint64_t v150 = [v149 lowercaseString];

                  uint64_t v151 = [v147 dimension];
                  if (DDLogHandle_onceToken != -1) {
                    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                  }
                  unint64_t v152 = (id)DDLogHandle_error_log_handle;
                  os_signpost_id_t v153 = os_signpost_id_generate(v152);

                  if (DDLogHandle_onceToken != -1) {
                    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                  }
                  unsigned int v154 = (id)DDLogHandle_error_log_handle;
                  float v155 = v154;
                  unint64_t v156 = v153 - 1;
                  if (v153 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
                  {
                    LOWORD(aBlock) = 0;
                    _os_signpost_emit_with_name_impl(&dword_19DC95000, v155, OS_SIGNPOST_INTERVAL_BEGIN, v153, "datadetectors.scanString.embedding", (const char *)&unk_19DCD32E3, (uint8_t *)&aBlock, 2u);
                  }

                  *(void *)&long long v311 = 0;
                  [v147 requestBackgroundModelLoadingWithTimeout:&v311 error:1.0];
                  id v291 = (id)v311;
                  if (v291)
                  {
                    if (DDLogHandle_onceToken != -1) {
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                    }
                    uint64_t v157 = (id)DDLogHandle_error_log_handle;
                    uint64_t v158 = v157;
                    if (v156 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
                    {
                      LOWORD(aBlock) = 0;
                      _os_signpost_emit_with_name_impl(&dword_19DC95000, v158, OS_SIGNPOST_INTERVAL_END, v153, "datadetectors.scanString.embedding", (const char *)&unk_19DCD32E3, (uint8_t *)&aBlock, 2u);
                    }

                    uint64_t v159 = [v291 domain];
                    double Helper_x8__NLNaturalLanguageErrorDomain = gotLoadHelper_x8__NLNaturalLanguageErrorDomain(v160);
                    if (objc_msgSend(v163, "isEqualToString:", **(void **)(v162 + 1976), Helper_x8__NLNaturalLanguageErrorDomain))
                    {
                      BOOL v164 = [v291 code] == 12;

                      if (v164)
                      {
                        if (DDLogHandle_onceToken != -1) {
                          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                        }
                        uint64_t v165 = (id)DDLogHandle_error_log_handle;
                        if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(aBlock) = v245;
                          *(void *)((char *)&aBlock + 4) = v291;
                          _os_log_error_impl(&dword_19DC95000, v165, OS_LOG_TYPE_ERROR, "Loading embedding model timed out: %@", (uint8_t *)&aBlock, 0xCu);
                        }

                        os_unfair_lock_lock((os_unfair_lock_t)&__DDMLCooldownLock);
                        dispatch_time_t v166 = dispatch_time(0, 15000000000);
                        uint64_t v167 = _ddmlModelQueue();
                        dispatch_after(v166, v167, &__block_literal_global_241);

                        os_unfair_lock_unlock((os_unfair_lock_t)&__DDMLCooldownLock);
                      }
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                    *(void *)&long long v307 = 0;
                    uint64_t v168 = [v147 requestBackgroundEmbeddingResultForString:v150 language:0 error:&v307];
                    id v291 = (id)v307;
                    if (DDLogHandle_onceToken != -1) {
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                    }
                    uint64_t v169 = (id)DDLogHandle_error_log_handle;
                    unint64_t v170 = v169;
                    if (v156 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v169))
                    {
                      LOWORD(aBlock) = 0;
                      _os_signpost_emit_with_name_impl(&dword_19DC95000, v170, OS_SIGNPOST_INTERVAL_END, v153, "datadetectors.scanString.embedding", (const char *)&unk_19DCD32E3, (uint8_t *)&aBlock, 2u);
                    }

                    *(void *)&aBlocuint64_t k = 0;
                    *((void *)&aBlock + 1) = &aBlock;
                    uint64_t v333 = 0x3032000000;
                    v334 = __Block_byref_object_copy__1014;
                    v335 = __Block_byref_object_dispose__1015;
                    id v336 = 0;
                    uint64_t v171 = _ddmlModelQueue();
                    *(void *)&long long v324 = MEMORY[0x1E4F143A8];
                    *((void *)&v324 + 1) = 3221225472;
                    *(void *)&long long v325 = ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke;
                    *((void *)&v325 + 1) = &unk_1E59852D8;
                    *(void *)&long long v326 = &aBlock;
                    dispatch_sync(v171, &v324);

                    unint64_t v172 = [MEMORY[0x1E4F1CA58] data];
                    gotLoadHelper_x8__OBJC_CLASS___NLTagger(v173);
                    id v175 = objc_alloc(*(Class *)(v174 + 2296));
                    double Helper_x8__NLTagSchemeTokenType = gotLoadHelper_x8__NLTagSchemeTokenType(v176);
                    *(void *)&long long v328 = **(void **)(v178 + 2184);
                    uint64_t v179 = v328;
                    uint64_t v180 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v328, 1, Helper_x8__NLTagSchemeTokenType);
                    v265 = (void *)[v175 initWithTagSchemes:v180];

                    [v265 setString:v150];
                    uint64_t v181 = [v150 length];
                    *(void *)&long long buf = MEMORY[0x1E4F143A8];
                    *((void *)&buf + 1) = 3221225472;
                    uint64_t v355 = (uint64_t)___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_2;
                    v356 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5985380;
                    v357 = v150;
                    id v182 = v273;
                    id v358 = v182;
                    id v250 = v168;
                    id v359 = v250;
                    uint64_t v361 = v151;
                    id v183 = v172;
                    id v360 = v183;
                    objc_msgSend(v265, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v181, 0, v179, 36, &buf);
                    if (DDLogHandle_onceToken != -1) {
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                    }
                    uint64_t v184 = (id)DDLogHandle_error_log_handle;
                    os_signpost_id_t v185 = os_signpost_id_generate(v184);

                    if (DDLogHandle_onceToken != -1) {
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                    }
                    unint64_t v186 = (id)DDLogHandle_error_log_handle;
                    uint64_t v187 = v186;
                    if (v185 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v186))
                    {
                      *(_WORD *)v340 = 0;
                      _os_signpost_emit_with_name_impl(&dword_19DC95000, v187, OS_SIGNPOST_INTERVAL_BEGIN, v185, "datadetectors.scanString.runHeadModel", (const char *)&unk_19DCD32E3, v340, 2u);
                    }

                    *(void *)&long long v303 = 0;
                    [v182 count];
                    id v257 = v183;
                    [v257 bytes];
                    MRLNeuralNetworkSetInput_delayInitStub(v188);
                    if ((void)v303)
                    {
                      if (DDLogHandle_onceToken != -1) {
                        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                      }
                      uint64_t v190 = (id)DDLogHandle_error_log_handle;
                      if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v340 = v245;
                        *(void *)&v340[4] = v303;
                        _os_log_error_impl(&dword_19DC95000, v190, OS_LOG_TYPE_ERROR, "failed to set input to tagger model %@", v340, 0xCu);
                      }
                    }
                    MRLNeuralNetworkPredict_delayInitStub(v189);
                    if ((void)v303)
                    {
                      if (DDLogHandle_onceToken != -1) {
                        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                      }
                      uint64_t v192 = (id)DDLogHandle_error_log_handle;
                      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v340 = v245;
                        *(void *)&v340[4] = v303;
                        _os_log_error_impl(&dword_19DC95000, v192, OS_LOG_TYPE_ERROR, "failed to get prediction from tagger model %@", v340, 0xCu);
                      }
                    }
                    uint64_t Output_delayInitStub = MRLNeuralNetworkGetOutput_delayInitStub(v191);
                    if (DDLogHandle_onceToken != -1) {
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                    }
                    uint64_t v194 = (id)DDLogHandle_error_log_handle;
                    BOOL v195 = v194;
                    if (v185 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v194))
                    {
                      *(_WORD *)v340 = 0;
                      _os_signpost_emit_with_name_impl(&dword_19DC95000, v195, OS_SIGNPOST_INTERVAL_END, v185, "datadetectors.scanString.runHeadModel", (const char *)&unk_19DCD32E3, v340, 2u);
                    }

                    if (Output_delayInitStub)
                    {
                      uint64_t v196 = [*(id *)(*((void *)&aBlock + 1) + 40) tokenLabelMap];
                      uint64_t v197 = [v196 count];

                      for (iuint64_t i = 0; ii < [v182 count]; ++ii)
                      {
                        if (v197)
                        {
                          uint64_t v199 = 0;
                          uint64_t v200 = 0;
                          float v201 = 0.0;
                          do
                          {
                            if (*(float *)(Output_delayInitStub + 4 * v199) > v201)
                            {
                              float v201 = *(float *)(Output_delayInitStub + 4 * v199);
                              uint64_t v200 = v199;
                            }
                            ++v199;
                          }
                          while (v197 != v199);
                        }
                        else
                        {
                          uint64_t v200 = 0;
                          float v201 = 0.0;
                        }
                        uint64_t v202 = [*(id *)(*((void *)&aBlock + 1) + 40) tokenTypeForValue:v200];
                        uint64_t v203 = [v182 objectAtIndexedSubscript:ii];
                        [v203 setTokenType:v202];

                        uint64_t v204 = [v182 objectAtIndexedSubscript:ii];
                        *(float *)&double v205 = v201;
                        [v204 setConfidence:v205];

                        Output_delayInitStub += 4 * v197;
                      }
                    }
                    else
                    {
                      if (DDLogHandle_onceToken != -1) {
                        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                      }
                      v206 = (id)DDLogHandle_error_log_handle;
                      if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v340 = v245;
                        *(void *)&v340[4] = v303;
                        _os_log_error_impl(&dword_19DC95000, v206, OS_LOG_TYPE_ERROR, "failed to get output from tagger model %@", v340, 0xCu);
                      }

                      [v182 removeAllObjects];
                    }

                    _Block_object_dispose(&aBlock, 8);
                  }

                  long long v315 = 0u;
                  long long v316 = 0u;
                  long long v317 = 0u;
                  long long v318 = 0u;
                  id v207 = v273;
                  uint64_t v208 = [v207 countByEnumeratingWithState:&v315 objects:v344 count:16];
                  if (v208)
                  {
                    uint64_t v209 = *(void *)v316;
                    do
                    {
                      for (juint64_t j = 0; jj != v208; ++jj)
                      {
                        if (*(void *)v316 != v209) {
                          objc_enumerationMutation(v207);
                        }
                        unint64_t v211 = *(void **)(*((void *)&v315 + 1) + 8 * jj);
                        uint64_t v212 = [v211 range];
                        objc_msgSend(v211, "setRange:", v212 + v144, v213);
                      }
                      uint64_t v208 = [v207 countByEnumeratingWithState:&v315 objects:v344 count:16];
                    }
                    while (v208);
                  }

                  uint64_t v214 = v280;
                  id v215 = v207;
                  v216 = [MEMORY[0x1E4F1CA48] array];
                  *(void *)&long long v311 = 0;
                  *((void *)&v311 + 1) = &v311;
                  *(void *)&long long v312 = 0x2020000000;
                  DWORD2(v312) = 10;
                  *(void *)v340 = 0;
                  *(void *)&v340[8] = v340;
                  *(void *)&long long v341 = 0x3010000000;
                  *((void *)&v341 + 1) = &unk_19DCD59E6;
                  long long v342 = 0uLL;
                  *(void *)&long long v307 = 0;
                  *((void *)&v307 + 1) = &v307;
                  long long v308 = 0x2020000000uLL;
                  *(void *)&aBlocuint64_t k = MEMORY[0x1E4F143A8];
                  *((void *)&aBlock + 1) = 3221225472;
                  uint64_t v333 = (uint64_t)__DDMLScannerBuildResultsFromTokens_block_invoke;
                  v334 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E59853A8;
                  v337 = v340;
                  uint64_t v292 = v214;
                  v335 = v292;
                  v338 = &v307;
                  v339 = &v311;
                  id v217 = v216;
                  id v336 = v217;
                  uint64_t v218 = (void (**)(void))_Block_copy(&aBlock);
                  long long v326 = 0u;
                  long long v327 = 0u;
                  long long v324 = 0u;
                  long long v325 = 0u;
                  id v219 = v215;
                  uint64_t v220 = [v219 countByEnumeratingWithState:&v324 objects:&buf count:16];
                  if (v220)
                  {
                    uint64_t v221 = *(void *)v325;
                    do
                    {
                      for (kuint64_t k = 0; kk != v220; ++kk)
                      {
                        if (*(void *)v325 != v221) {
                          objc_enumerationMutation(v219);
                        }
                        uint64_t v223 = *(void **)(*((void *)&v324 + 1) + 8 * kk);
                        long long v224 = [v223 tokenType];
                        if ([v224 classification] != 10)
                        {
                          if ([v224 beginning])
                          {
                            v218[2](v218);
                            int v225 = [v224 classification];
                            *(_DWORD *)(*((void *)&v311 + 1) + 24) = v225;
                            uint64_t v226 = [v223 range];
                            [v223 range];
                            uint64_t v227 = *(void *)&v340[8];
                            *(void *)(*(void *)&v340[8] + 32) = v226;
                            *(void *)(v227 + 40) = v228;
                            [v223 confidence];
                            double v230 = v229;
LABEL_263:
                            *(double *)(*((void *)&v307 + 1) + 24) = v230;
                            goto LABEL_265;
                          }
                          int v231 = *(_DWORD *)(*((void *)&v311 + 1) + 24);
                          if (v231 == [v224 classification])
                          {
                            uint64_t v232 = [v223 range];
                            [v223 range];
                            *(void *)(*(void *)&v340[8] + 40) = v233
                                                                    + v232
                                                                    - *(void *)(*(void *)&v340[8] + 32);
                            double v234 = *(double *)(*((void *)&v307 + 1) + 24);
                            [v223 confidence];
                            double v230 = v235;
                            if (v234 < v230) {
                              double v230 = v234;
                            }
                            goto LABEL_263;
                          }
LABEL_264:
                          v218[2](v218);
                          goto LABEL_265;
                        }
                        if (*(_DWORD *)(*((void *)&v311 + 1) + 24) != 10) {
                          goto LABEL_264;
                        }
LABEL_265:
                      }
                      uint64_t v220 = [v219 countByEnumeratingWithState:&v324 objects:&buf count:16];
                    }
                    while (v220);
                  }

                  v218[2](v218);
                  id v236 = v217;

                  _Block_object_dispose(&v307, 8);
                  _Block_object_dispose(v340, 8);
                  _Block_object_dispose(&v311, 8);

                  v237 = v279;
                  if (!v279)
                  {
                    v237 = (void *)[v236 count];
                    if (v237) {
                      v237 = (void *)[MEMORY[0x1E4F1CA48] array];
                    }
                  }
                  id v279 = v237;
                  [v237 addObjectsFromArray:v236];
                }
                unint64_t v146 = v296;
              }

              v143 = v294;
            }
            uint64_t v287 = [v294 countByEnumeratingWithState:&v320 objects:&block count:16];
            v143 = v294;
          }
          while (v287);

          if (!*(void *)v281)
          {
LABEL_282:
            *a4 = 1;
            goto LABEL_283;
          }
        }
        else
        {
          id v279 = 0;
          v143 = v294;
LABEL_280:
        }
        if ((*(unsigned char *)(*(void *)v281 + 232) & 1) == 0) {
          goto LABEL_282;
        }
LABEL_283:
        uint64_t v135 = v294;
LABEL_284:

LABEL_285:
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v238 = (id)DDLogHandle_error_log_handle;
        uint64_t v239 = v238;
        if (spidb - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v238))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19DC95000, v239, OS_SIGNPOST_INTERVAL_END, spidb, "datadetectors.scanString.mlScan", (const char *)&unk_19DCD32E3, (uint8_t *)&buf, 2u);
        }

        int v124 = *a4;
        CFArrayRef v125 = (const __CFArray *)v279;
LABEL_291:
        uint64_t v240 = (uint64_t)v270;
        if (v124 && v125)
        {
          CFArrayRef v241 = v125;
          if (CFArrayGetCount(v125) < 1) {
            goto LABEL_296;
          }
          if (v270)
          {
            [v270 addObjectsFromArray:v241];
LABEL_296:
            uint64_t v240 = (uint64_t)v270;
            goto LABEL_298;
          }
          uint64_t v240 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v241];
        }
LABEL_298:
        uint64_t v270 = (void *)v240;
      }
      uint64_t v253 = [v249 countByEnumeratingWithState:&v299 objects:v319 count:16];
      if (!v253) {
        goto LABEL_302;
      }
    }
  }
  uint64_t v270 = 0;
LABEL_302:

  uint64_t v242 = [v270 array];
  v243 = (const void *)[v242 mutableCopy];

  if (v243) {
    CFAutorelease(v243);
  }

  return v243;
}

void sub_19DCB86E0(_Unwind_Exception *a1)
{
}

BOOL _ddResultTypeHasMLEquivalent(uint64_t a1, const __CFArray *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a1 + 64);
  if (([v4 isEqualToString:@"Data"] & 1) != 0
    || ([v4 isEqualToString:@"Tag"] & 1) != 0
    || [v4 isEqualToString:@"Compatibility"])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (_ddResultTypeHasMLEquivalent(*(void *)(*((void *)&v12 + 1) + 8 * v9), a2))
          {

            BOOL v10 = 1;
            goto LABEL_14;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = DDResultTypeIsMLSupported(a1, a2) != 0;
  }
LABEL_14:

  return v10;
}

uint64_t __Block_byref_object_copy__1014(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1015(uint64_t a1)
{
}

id _ddmlModelQueue()
{
  if (_ddmlModelQueue_onceToken != -1) {
    dispatch_once(&_ddmlModelQueue_onceToken, &__block_literal_global_212);
  }
  CFTypeID v0 = (void *)_ddmlModelsQueue;

  return v0;
}

void __DDMLGetTaggerModel_block_invoke(uint64_t a1)
{
  int v2 = +[DDMLTaggerModel currentTaggerModel];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = [*(id *)(a1 + 32) assetLocaleIdentifier];
  id v5 = [v3 localeWithLocaleIdentifier:v4];

  uint64_t v6 = [v2 embeddingLocale];
  char v7 = [v6 isEqual:v5];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  }
  else
  {
    uint64_t v17 = 0;
    unint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    NSUInteger v20 = __Block_byref_object_copy__1014;
    NSUInteger v21 = __Block_byref_object_dispose__1015;
    id v22 = 0;
    LDEnumerateAssetDataItems_delayInitStub(COERCE_DOUBLE(3221225472));
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = [(id)v18[5] URLByAppendingPathComponent:@"model.plist"];
    BOOL v10 = [v8 dictionaryWithContentsOfURL:v9];

    unint64_t v11 = [v10 objectForKeyedSubscript:@"models"];
    long long v12 = [v11 firstObject];

    long long v13 = [DDMLTaggerModel alloc];
    uint64_t v14 = [(DDMLTaggerModel *)v13 initWithEmbeddingLocale:v5 modelDictionary:v12 baseURL:v18[5]];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    CFRange v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    +[DDMLTaggerModel setCurrentTaggerModel:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    _Block_object_dispose(&v17, 8);
  }
}

void sub_19DCB8B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __DDMLScannerBuildResultsFromTokens_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    int v2 = -[DDMLResult initWithText:resultRange:confidence:resultType:]([DDMLResult alloc], "initWithText:resultRange:confidence:resultType:", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    [*(id *)(a1 + 40) addObject:v2];
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 10;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
}

uint64_t __DDMLGetTaggerModel_block_invoke_2(uint64_t a1, void *a2, double a3)
{
  double Helper_x8__kLDAssetTypeDataDetectorHead = gotLoadHelper_x8__kLDAssetTypeDataDetectorHead(a3);
  uint64_t result = objc_msgSend(v7, "isEqualToString:", **(void **)(v6 + 1208), Helper_x8__kLDAssetTypeDataDetectorHead);
  if (result)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v9 + 40))
    {
      long long v12 = [a2 path];
      id v10 = (id)[v12 hasPrefix:@"/System/Library/LinguisticData"];
      if (v10) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      }
      unint64_t v11 = v12;
    }
    else
    {
      id v10 = a2;
      unint64_t v11 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v10;
    }
    return MEMORY[0x1F41817F8](v10, v11);
  }
  return result;
}

void ___ddmlModelQueue_block_invoke()
{
  int v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.datadetectors.ddmlscanner.models", v2);
  uint64_t v1 = (void *)_ddmlModelsQueue;
  _ddmlModelsQueue = (uint64_t)v0;
}

void __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = (void *)_currentEmbedding;
  if (!_currentEmbedding)
  {
    double Helper_x8__OBJC_CLASS___NLContextualEmbedding = gotLoadHelper_x8__OBJC_CLASS___NLContextualEmbedding(a2);
    uint64_t v6 = objc_msgSend(*(id *)(v5 + 2240), "contextualEmbeddingWithModelIdentifier:", @"8075FCEB-2588-4FBD-9804-8507C9DB31E4", Helper_x8__OBJC_CLASS___NLContextualEmbedding);
    id v7 = (void *)_currentEmbedding;
    _currentEmbedding = v6;

    uint64_t v3 = (void *)_currentEmbedding;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3);
  uint64_t v8 = _ddmlModelQueue();
  dispatch_assert_queue_V2(v8);

  if (_startEmbeddingCleanupTimeout__embeddingCleanupBlock) {
    dispatch_block_cancel((dispatch_block_t)_startEmbeddingCleanupTimeout__embeddingCleanupBlock);
  }
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_215);
  id v10 = (void *)_startEmbeddingCleanupTimeout__embeddingCleanupBlock;
  _startEmbeddingCleanupTimeout__embeddingCleanupBlocuint64_t k = (uint64_t)v9;

  dispatch_time_t v11 = dispatch_time(0, 600000000000);
  long long v12 = _ddmlModelQueue();
  dispatch_after(v11, v12, (dispatch_block_t)_startEmbeddingCleanupTimeout__embeddingCleanupBlock);
}

void __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v6 = (id)DDLogHandle_error_log_handle;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)dispatch_block_t v9 = 0;
    _os_log_error_impl(&dword_19DC95000, v6, OS_LOG_TYPE_ERROR, "Failed to get latin embedding, results will be of DDQOSRegular quality", v9, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (a2) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void ___startEmbeddingCleanupTimeout_block_invoke()
{
  [(id)_currentEmbedding requestModelUnloading];
  dispatch_queue_t v0 = (void *)_currentEmbedding;
  _currentEmbedding = 0;
}

BOOL DDMLUpdateScannerResultsWithMLResults(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[DDResultCluster clustersWithDDResults:*(void *)(a1 + 168) mlResults:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  CFArrayRef Mutable = 0;
  uint64_t v11 = *(void *)v20;
  long long v12 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) resolvedDDResultFromOriginalQuery:a2 mlSupportedTypes:a4];
      if (v14)
      {
        uint64_t v15 = (const void *)v14;
        if (!Mutable) {
          CFArrayRef Mutable = CFArrayCreateMutable(0, 0, v12);
        }
        CFArrayAppendValue(Mutable, v15);
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);
  if (Mutable)
  {
    CFRange v16 = *(const void **)(a1 + 168);
    if (v16) {
      CFRelease(v16);
    }
    *(void *)(a1 + 16_Block_object_dispose(&STACK[0x600], 8) = Mutable;
    BOOL v17 = CFArrayGetCount(Mutable) > 0;
  }
  else
  {
LABEL_16:
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 168));
    BOOL v17 = 0;
  }

  return v17;
}

BOOL shouldURLifyNode(void *a1)
{
  if (shouldURLifyNode_sOnce != -1) {
    dispatch_once(&shouldURLifyNode_sOnce, &__block_literal_global_123);
  }
  return [a1 nodeType] != 1
      || objc_msgSend((id)shouldURLifyNode_doNotVisit, "member:", objc_msgSend(a1, "nodeName")) == 0;
}

uint64_t __shouldURLifyNode_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"A", @"a", @"STYLE", @"style", @"IMG", @"img", @"META", @"meta", @"SCRIPT", @"script", @"TITLE", @"title", @"OBJECT", @"object", 0);
  shouldURLifyNode_doNotVisit = result;
  return result;
}

void sub_19DCBA068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DDURLWithPotentiallyInvalidURLString(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v1 = (void *)result;
  uint64_t result = [MEMORY[0x1E4F1CB10] URLWithString:result];
  if (result) {
    return result;
  }
  uint64_t v2 = [v1 rangeOfString:@":"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = objc_msgSend(v1, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLPathAllowedCharacterSet"));
LABEL_9:
    uint64_t v11 = v4;
    long long v12 = v3;
    goto LABEL_10;
  }
  uint64_t v5 = v2;
  uint64_t v6 = [v1 substringToIndex:v2];
  unint64_t v7 = v5 + 1;
  if (v7 >= [v1 length])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = [v1 substringFromIndex:v7];
    goto LABEL_9;
  }
  uint64_t v8 = (void *)[v1 substringFromIndex:v7];
  uint64_t v9 = objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLPathAllowedCharacterSet"));
  id v10 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v11 = [NSString stringWithFormat:@"%@:%@", v6, v9];
  long long v12 = v10;
LABEL_10:

  return [v12 URLWithString:v11];
}

uint64_t DDShouldUseDebugHighlightForResult(uint64_t a1)
{
  if (a1 && _typesAreEqual(*(CFStringRef *)(a1 + 64), @"Parsec")) {
    DDResultHasContextualFloat(a1);
  }
  return 0;
}

uint64_t DDURLTapAndHoldSchemes()
{
  return objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"tel", @"mailto", @"x-apple-data-detectors", 0);
}

uint64_t DDShouldImmediatelyShowActionSheetForResult(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    int Category = DDResultGetCategory(result);
    if ((Category - 4) >= 3)
    {
      if (Category == 2)
      {
        uint64_t v3 = 0;
        objc_msgSend(+[DDScannerResult resultFromCoreResult:](DDScannerResult, "resultFromCoreResult:", v1), "getPhoneValue:label:", &v3, 0);
        if (MGGetBoolAnswer())
        {
          if (DDTelephonyWillPrompt_sOnce != -1) {
            dispatch_once(&DDTelephonyWillPrompt_sOnce, &__block_literal_global_17);
          }
          return DDTelephonyWillPrompt_sandbox_result == 0;
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
    else
    {
      return !_typesAreEqual(*(CFStringRef *)(v1 + 64), @"Parsec");
    }
  }
  return result;
}

uint64_t DDShouldImmediatelyShowActionSheetForURL(uint64_t result)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = (void *)result;
  uint64_t result = objc_msgSend(&unk_1EF03BE30, "containsObject:", objc_msgSend((id)objc_msgSend((id)result, "scheme"), "lowercaseString"));
  if (!result) {
    return result;
  }
  uint64_t v2 = (void *)[v1 resourceSpecifier];
  if ([v2 hasPrefix:@"//"])
  {
    if ((unint64_t)[v2 length] < 3) {
      goto LABEL_32;
    }
    uint64_t v2 = (void *)[v2 substringFromIndex:2];
  }
  if (![v2 length]) {
    goto LABEL_32;
  }
  int v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "scheme"), "lowercaseString"), "isEqualToString:", @"sms");
  char v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)[v2 componentsSeparatedByString:@"?"];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "firstObject"), "componentsSeparatedByString:", @"&");
    if ((unint64_t)[v5 count] < 2) {
      goto LABEL_12;
    }
    uint64_t v7 = objc_msgSend(v6, "arrayByAddingObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "componentsSeparatedByString:", @"&"));
  }
  else
  {
    uint64_t v7 = [v2 componentsSeparatedByString:@";"];
  }
  uint64_t v6 = (void *)v7;
LABEL_12:
  if (objc_msgSend((id)objc_msgSend(v6, "firstObject"), "length"))
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "stringByRemovingPercentEncoding");
    uint64_t v9 = v8;
    if ((v4 & 1) == 0) {
      uint64_t v9 = (void *)[v8 stringByReplacingOccurrencesOfString:@":" withString:@";"];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      long long v21 = v9;
      char v12 = 0;
      char v13 = 1;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          char v16 = v12;
          char v12 = v13;
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v6);
          }
          if ((v12 & 1) == 0)
          {
            BOOL v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            unint64_t v18 = (void *)[v17 componentsSeparatedByString:@"="];
            long long v19 = v18;
            if ((v16 & 1) != 0 && [v18 count] == 1)
            {
              if ([v17 length]
                && objc_msgSend(v17, "rangeOfCharacterFromSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"1234567890#*"), "invertedSet")) == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v20 = [NSString stringWithFormat:@"%@;%@", v21, v17];
LABEL_41:
                uint64_t v9 = (void *)v20;
                goto LABEL_33;
              }
            }
            else if ([v19 count] == 2 {
                   && objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 0), "isEqualToString:", @"ext")&& objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 1), "length"))
            }
            {
              uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%@;%@",
                      v21,
                      objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 1), "stringByRemovingPercentEncoding"));
              goto LABEL_41;
            }
          }
          char v13 = 0;
        }
        uint64_t v11 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        char v13 = 0;
        if (v11) {
          continue;
        }
        break;
      }
      uint64_t v9 = v21;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v9 = 0;
LABEL_33:
  uint64_t result = [v9 length];
  if (result)
  {
    if (MGGetBoolAnswer())
    {
      if (DDTelephonyWillPrompt_sOnce != -1) {
        dispatch_once(&DDTelephonyWillPrompt_sOnce, &__block_literal_global_17);
      }
      return DDTelephonyWillPrompt_sandbox_result == 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t DDInternalURLStringForResultIdentifier(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@://%@", @"x-apple-data-detectors", a1];
}

uint64_t DDSourcePushFile(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 1)
  {
    a2 = 0;
    int v6 = 1;
    goto LABEL_5;
  }
  if (!a3)
  {
    int v6 = 0;
LABEL_5:
    return DDSourcePushSharedDataOrFile(a1, 0, a2, v6, 0);
  }
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v8 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_error_impl(&dword_19DC95000, v8, OS_LOG_TYPE_ERROR, "Can only compile JSON files", v9, 2u);
  }
  return 0;
}

uint64_t DDSourcePushSharedDataOrFile(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  if (!altPath)
  {
    if ((a1 & 0xFFFFFFFD) == 4)
    {
      if (DDUserSourcesWriteAllowed_sOnce != -1) {
        dispatch_once(&DDUserSourcesWriteAllowed_sOnce, &__block_literal_global_29);
      }
      char v13 = &DDUserSourcesWriteAllowed_sandbox_result;
    }
    else
    {
      if (DDSystemSourcesWriteAllowed_sOnce != -1) {
        dispatch_once(&DDSystemSourcesWriteAllowed_sOnce, &__block_literal_global_35);
      }
      char v13 = &DDSystemSourcesWriteAllowed_sandbox_result;
    }
    if (*v13)
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.DataDetectorsSourceAccess" options:4096];
      if (v10) {
        goto LABEL_3;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v15 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DC95000, v15, OS_LOG_TYPE_ERROR, "Failed to connect to DataDetectorsSourceAccess (writing)", buf, 2u);
      }
    }
    return 0;
  }
  uint64_t v10 = 0;
LABEL_3:
  *(void *)long long buf = 0;
  long long v19 = buf;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v11 = sourceAccessCreateAndEnterGroup(v10, (uint64_t)&__block_literal_global_58);
  if (v11)
  {
    uint64_t v12 = [NSNumber numberWithInt:a1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __DDSourcePushSharedDataOrFile_block_invoke_59;
    v17[3] = &unk_1E5985498;
    v17[4] = v10;
    v17[5] = buf;
    if (a4 == 1) {
      [(DataDetectorsSourceAccess *)v11 writeSourceFromRawData:a2 source:v12 signature:a5 withReply:v17];
    }
    else {
      [(DataDetectorsSourceAccess *)v11 writeSourceFromJSONFile:a3 source:v12 withReply:v17];
    }
  }
  uint64_t v14 = v19[24];
  _Block_object_dispose(buf, 8);
  return v14;
}

void sub_19DCBAB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

DataDetectorsSourceAccess *sourceAccessCreateAndEnterGroup(void *a1, uint64_t a2)
{
  if (a1)
  {
    objc_msgSend(a1, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EF03D478));
    [a1 resume];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __sourceAccessCreateAndEnterGroup_block_invoke;
    v12[3] = &unk_1E59854C0;
    v12[4] = a1;
    v12[5] = a2;
    uint64_t v4 = (DataDetectorsSourceAccess *)[a1 synchronousRemoteObjectProxyWithErrorHandler:v12];
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = v4;
      return v5;
    }
LABEL_7:
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    return 0;
  }
  uint64_t v7 = objc_alloc_init(DataDetectorsSourceAccess);
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v5 = v7;
  uid_t v8 = getuid();
  uint64_t v9 = getpwuid(v8);
  if (v9) {
    uint64_t pw_uid = v9->pw_uid;
  }
  else {
    uint64_t pw_uid = 0;
  }
  [(DataDetectorsSourceAccess *)v5 setUserIdentifier:pw_uid];
  return v5;
}

void __DDSourcePushSharedDataOrFile_block_invoke_59(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v4 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v6 = 0;
      _os_log_error_impl(&dword_19DC95000, v4, OS_LOG_TYPE_ERROR, "Failed to write data to DataDetectorsSourceAccess", v6, 2u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    [v5 invalidate];
  }
}

uint64_t __sourceAccessCreateAndEnterGroup_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v4 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_19DC95000, v4, OS_LOG_TYPE_ERROR, "Connection to DataDetectorsSourceAccess failed (%@)", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __DDSourcePushSharedDataOrFile_block_invoke()
{
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  dispatch_queue_t v0 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_error_impl(&dword_19DC95000, v0, OS_LOG_TYPE_ERROR, "Failed to write data using DataDetectorsSourceAccess", v1, 2u);
  }
}

uint64_t DDSourcePushSharedData(uint64_t a1, uint64_t a2)
{
  return DDSourcePushSharedDataOrFile(a1, a2, 0, 1, 0);
}

uint64_t DDSourcePushSharedDataWithSignature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DDSourcePushSharedDataOrFile(a1, a2, 0, 1, a3);
}

uint64_t DDSourceClear(uint64_t a1)
{
  return DDSourcePushSharedDataOrFile(a1, 0, 0, 1, 0);
}

uint64_t DDPushUserDebugData()
{
  dispatch_queue_t v0 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
  for (uint64_t i = 0; i != 6; ++i)
    objc_msgSend(v0, "addObject:", objc_msgSend((id)qword_1E59854E0[i], "mutableCopy"));

  return DDSourcePushSharedDataOrFile(6, (uint64_t)v0, 0, 1, 0);
}

id DDSourceGetLexiconData(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__1315;
  uint64_t v12 = __Block_byref_object_dispose__1316;
  uint64_t v13 = 0;
  if ((a1 & 0xFFFFFFFD) == 4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __DDSourceGetLexiconData_block_invoke;
    v7[3] = &unk_1E5985420;
    v7[4] = &v8;
    mmapSource(a1, 1, (uint64_t)v7);
  }
  else if (_DDTriePathForSource(a1, v14, 1, 1, 0))
  {
    uint64_t v5 = 0;
    off_t v6 = 0;
    int8x16_t v4 = 0uLL;
    if (DDautommap(v14, &v5, &v6, &v4))
    {
      if (v5)
      {
        if (v6)
        {
          uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v5 length:v6 deallocator:&__block_literal_global_46];
          v9[5] = v1;
        }
        else
        {
          munmap(v5, 0);
        }
      }
    }
  }
  id v2 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v2;
}

void sub_19DCBB0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1315(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1316(uint64_t a1)
{
}

uint64_t __DDSourceGetLexiconData_block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      uint64_t v3 = result;
      uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a2 length:a3 deallocator:&__block_literal_global_1324];
      *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 40) = result;
    }
    else
    {
      return munmap(a2, 0);
    }
  }
  return result;
}

void mmapSource(uint64_t a1, int a2, uint64_t a3)
{
  if (altPath)
  {
    off_t v6 = 0;
    goto LABEL_8;
  }
  if ((a1 & 0xFFFFFFFD) != 4) {
    goto LABEL_7;
  }
  if (DDUserSourcesReadAllowed_sOnce != -1) {
    dispatch_once(&DDUserSourcesReadAllowed_sOnce, &__block_literal_global_23);
  }
  if (DDUserSourcesReadAllowed_sandbox_result)
  {
LABEL_7:
    off_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.DataDetectorsSourceAccess" options:4096];
    if (v6)
    {
LABEL_8:
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __mmapSource_block_invoke;
      v17[3] = &unk_1E5985448;
      v17[4] = a3;
      uint64_t v7 = sourceAccessCreateAndEnterGroup(v6, (uint64_t)v17);
      if (v7)
      {
        uint64_t v8 = v7;
        *(void *)long long buf = 0;
        uint64_t v14 = buf;
        uint64_t v15 = 0x2020000000;
        uint64_t v16 = 0;
        v12[0] = 0;
        v12[1] = v12;
        v12[2] = 0x2020000000;
        v12[3] = 0;
        uint64_t v9 = [NSNumber numberWithInt:a1];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __mmapSource_block_invoke_53;
        v11[3] = &unk_1E5985470;
        v11[6] = v12;
        v11[7] = buf;
        v11[4] = v6;
        v11[5] = a3;
        [(DataDetectorsSourceAccess *)v8 fileForSourceRead:v9 resourceType:a2 != 0 withReply:v11];

        _Block_object_dispose(v12, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        (*(void (**)(uint64_t, void, void))(a3 + 16))(a3, 0, 0);
      }
      return;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, "Failed to connect to DataDetectorsSourceAccess (reading)", buf, 2u);
    }
  }
}

void sub_19DCBB418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __DDSourceGetLexiconData_block_invoke_3(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

uint64_t __mmapSource_block_invoke(uint64_t a1)
{
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  id v2 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int8x16_t v4 = 0;
    _os_log_error_impl(&dword_19DC95000, v2, OS_LOG_TYPE_ERROR, "Failed to use DataDetectorsSourceAccess (reading)", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __mmapSource_block_invoke_53(void *a1, void *a2)
{
  if (a2)
  {
    int v4 = [a2 fileDescriptor];
    *(void *)(*(void *)(a1[6] + 8) + 24) = [a2 seekToEndOfFile];
    if (v4 >= 3)
    {
      size_t v5 = *(void *)(*(void *)(a1[6] + 8) + 24);
      if (v5) {
        *(void *)(*(void *)(a1[7] + 8) + 24) = _DDmmap((uint64_t)"<Service accessed>", v4, v5);
      }
    }
  }
  (*(void (**)(void))(a1[5] + 16))();
  off_t v6 = (void *)a1[4];
  if (v6)
  {
    [v6 invalidate];
    uint64_t v7 = (void *)a1[4];
  }
}

uint64_t __DDSourceGetLexiconData_block_invoke_2(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

unsigned char *DDSourceGetClientSignature(uint64_t a1)
{
  CFTypeRef cf = 0;
  DDLookupTableUpdateFromExternalFile(a1, (unsigned __int16 **)&cf, 0);
  uint64_t v1 = (void **)cf;
  if (!cf)
  {
    uint64_t v3 = 0;
    return v3;
  }
  uint64_t v2 = *((void *)cf + 3);
  if (!v2 || *(uint64_t *)(v2 + 112) < 1) {
    goto LABEL_8;
  }
  uint64_t v3 = *(unsigned char **)(v2 + 64);
  if (!v3) {
    goto LABEL_9;
  }
  if (!*v3)
  {
LABEL_8:
    uint64_t v3 = 0;
LABEL_9:
    size_t v5 = v1 + 4;
    int v4 = (int *)v1[4];
    if (v4)
    {
      munmap(v1[4], v4[1]);
      v5[1] = 0;
      v5[2] = 0;
      *size_t v5 = 0;
      uint64_t v1 = (void **)cf;
    }
    goto LABEL_11;
  }
  uint64_t v3 = (unsigned char *)[[NSString alloc] initWithUTF8String:v3];
  uint64_t v1 = (void **)cf;
  if (cf) {
    goto LABEL_9;
  }
LABEL_11:
  CFRelease(v1);
  return v3;
}

void DDExternalTableAppendEntries(void (*a1)(void, void, void, void), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (a2 <= 7)
  {
    memset(v3, 0, sizeof(v3));
    *((void *)v3 + a2) = a3;
    _DDSourceUpdateSourceWithContent(a1, (uint64_t)v3, 0, 0, 8);
  }
}

uint64_t DDExternalTableWriteAtPath(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    if (a1)
    {
      FinalizedSourceContent = (UInt8 *)DDSourceCreateFinalizedSourceContent(a1);
      if (FinalizedSourceContent)
      {
        uint64_t v4 = FinalizedSourceContent;
        uint64_t v2 = [(UInt8 *)FinalizedSourceContent writeToFile:v2 atomically:1];
        CFRelease(v4);
        return v2;
      }
    }
    else
    {
      size_t v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      if (![v5 fileExistsAtPath:v2 isDirectory:0]) {
        return 1;
      }
      uint64_t v7 = 0;
      [v5 removeItemAtPath:v2 error:&v7];
    }
    return 0;
  }
  return v2;
}

void DDLRTableDestroy(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (const void *)a1[10];
    if (v2) {
      CFRelease(v2);
    }
    uint64_t v3 = (void *)a1[1];
    if (v3) {
      free(v3);
    }
    uint64_t v4 = (const void *)a1[9];
    if (v4) {
      CFRelease(v4);
    }
    free(a1);
  }
}

uint64_t DDForce24HrsFormatProcessWideForExtraction(uint64_t result)
{
  sForce24HrsFormCFAbsoluteTime at = result;
  return result;
}

void *DDCreateTimeZoneValuesFromResultValue(CFStringRef theString)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (theString)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E4F1CF80], theString, @"|");
    if (CFArrayGetCount(ArrayBySeparatingStrings) <= 1)
    {
      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 1)
      {
        CFArrayRef Copy = (void *)CFRetain(ArrayBySeparatingStrings);
LABEL_9:
        uint64_t v8 = Copy;
        CFRelease(ArrayBySeparatingStrings);
        if (v8) {
          return v8;
        }
        goto LABEL_16;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v9 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_error_impl(&dword_19DC95000, v9, OS_LOG_TYPE_ERROR, "We've shouldn't have 0 items for a time zone value", (uint8_t *)&v12, 2u);
      }
    }
    else
    {
      if (DDCreateTimeZoneValuesFromResultValue_sOnce != -1) {
        dispatch_once(&DDCreateTimeZoneValuesFromResultValue_sOnce, &__block_literal_global_1344);
      }
      CFDictionaryRef v4 = (const __CFDictionary *)DDCreateTimeZoneValuesFromResultValue__sTimeZonesPlist;
      if (DDCreateTimeZoneValuesFromResultValue__sTimeZonesPlist)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v4, ValueAtIndex);
        CFArrayRef Copy = CFArrayCreateCopy(v2, Value);
        goto LABEL_9;
      }
    }
    CFRelease(ArrayBySeparatingStrings);
  }
LABEL_16:
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v10 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    CFStringRef v13 = theString;
    _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, "Couldn't extract time zone values for %@", (uint8_t *)&v12, 0xCu);
  }
  return 0;
}

CFStringRef createPropertyListForResource(const __CFString *a1)
{
  CFStringRef v1 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFStringRef v2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@.%@", a1, @"plist");
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.datadetectorscore.tests");
    if ((BundleWithIdentifier
       || (BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.datadetectorscore")) != 0)
      && (CFURLRef v4 = CFBundleCopyResourceURL(BundleWithIdentifier, v1, @"plist", 0)) != 0
      || (MainBundle = CFBundleGetMainBundle(),
          (CFURLRef v4 = CFBundleCopyResourceURL(MainBundle, v1, @"plist", 0)) != 0))
    {
      CFDataRef v6 = DDCreateDataFromFileAtUrl(v4);
      if (v6)
      {
        CFDataRef v7 = v6;
        CFStringRef v1 = (const __CFString *)CFPropertyListCreateWithData(0, v6, 0, 0, 0);
        CFRelease(v7);
        CFRelease(v4);
        if (v1)
        {
LABEL_22:
          CFRelease(v2);
          return v1;
        }
      }
      else
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v8 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v13 = v4;
          __int16 v14 = 2112;
          CFStringRef v15 = v2;
          _os_log_error_impl(&dword_19DC95000, v8, OS_LOG_TYPE_ERROR, "DDCreateDataFromFileAtUrl failed on %@, could not find %@", buf, 0x16u);
        }
        CFRelease(v4);
      }
    }
    else
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v9 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v13 = (void *)v2;
      _os_log_error_impl(&dword_19DC95000, v9, OS_LOG_TYPE_ERROR, "Could not find %@", buf, 0xCu);
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
LABEL_19:
    uint64_t v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v13 = (void *)v2;
      _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, "Could not load %@", buf, 0xCu);
    }
    CFStringRef v1 = 0;
    goto LABEL_22;
  }
  return v1;
}

uint64_t extractHourMinuteSecondWithRefCopyTimeZone(uint64_t result, uint64_t a2, const __CFLocale *a3, int *a4, _DWORD *a5, _DWORD *a6, CFTimeZoneRef *a7, unsigned int a8, signed int a9, int a10, uint64_t a11)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v16 = result;
  while (1)
  {
    if (!_typesAreEqual(*(CFStringRef *)(v16 + 64), @"Timestamp"))
    {
      if (DDResultGetSubresultWithType(v16, @"ApproxTime") && !DDResultGetSubresultWithType(v16, @"Hours"))
      {
        *(_DWORD *)long long buf = 0;
        CFStringRef SubresultWithType = (const __CFString *)DDResultGetSubresultWithType(v16, @"ApproxTime");
        if (SubresultWithType)
        {
          CFStringRef v29 = SubresultWithType;
          CFStringRef SubresultWithType = (const __CFString *)SubresultWithType[2].data;
          if (!SubresultWithType) {
            CFStringRef SubresultWithType = (const __CFString *)v29[2].info;
          }
        }
        uint64_t result = extractHourFromApproxTimeValue(SubresultWithType, (int *)buf, a3);
        if (!result) {
          return result;
        }
        if (a4) {
          *a4 = *(_DWORD *)buf;
        }
        if (a5) {
          *a5 = 0;
        }
        if (a6) {
          *a6 = 0;
        }
      }
      else
      {
        if (!_typesAreEqual(*(CFStringRef *)(v16 + 64), @"Time"))
        {
          DetailedDescriptiouint64_t n = createDetailedDescription((void *)v16);
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          NSUInteger v26 = DDLogHandle_error_log_handle;
          if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
            goto LABEL_65;
          }
          *(_DWORD *)long long buf = 138412290;
          uint64_t v44 = DetailedDescription;
          uint64_t v27 = "Could not parse %@";
          goto LABEL_64;
        }
        unint64_t v39 = DDResultGetSubresultWithType(v16, @"Meridian");
        uint64_t v20 = DDResultGetSubresultWithType(v16, @"Hours");
        uint64_t v42 = 0;
        char v21 = DDResultGetSubresultWithType(v16, @"Minutes");
        if (v21)
        {
          long long v22 = v21;
          CFStringRef v23 = v21[10];
          if (!v23) {
            CFStringRef v23 = v22[9];
          }
          if ((extractInteger(v23, (_DWORD *)&v42 + 1) & 1) == 0) {
            return 0;
          }
          int v24 = hourValueForHourAndMeridianResult((uint64_t)v20, a2, a3, (uint64_t)v39, a8, a9, a10, a11, HIDWORD(v42) == 0);
          if (v24 < 0) {
            goto LABEL_60;
          }
        }
        else
        {
          int v30 = hourValueForHourAndMeridianResult((uint64_t)v20, a2, a3, (uint64_t)v39, a8, a9, a10, a11, 1);
          if (v30 < 0)
          {
LABEL_60:
            DetailedDescriptiouint64_t n = createDetailedDescription((void *)v16);
            if (DDLogHandle_onceToken != -1) {
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
            }
            NSUInteger v26 = DDLogHandle_error_log_handle;
            if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
              goto LABEL_65;
            }
            *(_DWORD *)long long buf = 138412290;
            uint64_t v44 = DetailedDescription;
            uint64_t v27 = "Time with no hour: %@";
LABEL_64:
            _os_log_error_impl(&dword_19DC95000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
LABEL_65:
            CFRelease(DetailedDescription);
            return 0;
          }
          int v24 = v30;
          NSUInteger v31 = DDResultGetSubresultWithType(v16, @"MinutesBefore");
          if (v31)
          {
            uint64_t v32 = v31;
            CFStringRef v33 = v31[10];
            if (!v33) {
              CFStringRef v33 = v32[9];
            }
            uint64_t result = extractInteger(v33, (_DWORD *)&v42 + 1);
            if (!result) {
              return result;
            }
            if (HIDWORD(v42) > 0x3B) {
              return 0;
            }
            if (HIDWORD(v42))
            {
              HIDWORD(v42) = 60 - HIDWORD(v42);
              if (v24) {
                --v24;
              }
              else {
                int v24 = 23;
              }
            }
          }
        }
        int v34 = DDResultGetSubresultWithType(v16, @"Seconds");
        if (v34)
        {
          uint64_t v35 = v34;
          CFStringRef v36 = v34[10];
          if (!v36) {
            CFStringRef v36 = v35[9];
          }
          uint64_t result = extractInteger(v36, &v42);
          if (!result) {
            return result;
          }
        }
        if (a4) {
          *a4 = v24;
        }
        if (a5) {
          *a5 = HIDWORD(v42);
        }
        if (a6) {
          *a6 = v42;
        }
        if (a7)
        {
          uint64_t v37 = DDResultGetSubresultWithType(v16, @"TimeZone");
          if (v37)
          {
            CFTimeZoneRef v38 = DDCreateTimeZoneWithResult((uint64_t)v37);
            if (v38) {
              *a7 = v38;
            }
          }
        }
      }
      return 1;
    }
    CFArrayRef v18 = *(const __CFArray **)(v16 + 56);
    if (!v18 || CFArrayGetCount(*(CFArrayRef *)(v16 + 56)) != 1) {
      break;
    }
    uint64_t result = (uint64_t)CFArrayGetValueAtIndex(v18, 0);
    uint64_t v16 = result;
    a10 = -1;
    if (!result) {
      return result;
    }
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  long long v19 = DDLogHandle_error_log_handle;
  uint64_t result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19DC95000, v19, OS_LOG_TYPE_ERROR, "Wrong number of results", buf, 2u);
    return 0;
  }
  return result;
}

uint64_t extractHourFromApproxTimeValue(CFStringRef theString1, int *a2, CFLocaleRef locale)
{
  if (!locale) {
    goto LABEL_28;
  }
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
  if (!Value) {
    goto LABEL_28;
  }
  CFStringRef v6 = Value;
  if (CFStringCompare(@"MX", Value, 0)
    && CFStringCompare(@"ES", v6, 0)
    && CFStringCompare(@"PT", v6, 0)
    && CFStringCompare(@"IT", v6, 0)
    && CFStringCompare(@"GR", v6, 0)
    && CFStringCompare(@"TR", v6, 0)
    && CFStringCompare(@"LB", v6, 0)
    && CFStringCompare(@"IL", v6, 0)
    && CFStringCompare(@"EG", v6, 0)
    && CFStringCompare(@"DZ", v6, 0)
    && CFStringCompare(@"TN", v6, 0)
    && CFStringCompare(@"MA", v6, 0))
  {
    if (CFStringCompare(@"CA", v6, 0)
      && CFStringCompare(@"RU", v6, 0)
      && CFStringCompare(@"UA", v6, 0)
      && CFStringCompare(@"BY", v6, 0)
      && CFStringCompare(@"SE", v6, 0)
      && CFStringCompare(@"NO", v6, 0)
      && CFStringCompare(@"FI", v6, 0)
      && CFStringCompare(@"DE", v6, 0)
      && CFStringCompare(@"PL", v6, 0)
      && CFStringCompare(@"IE", v6, 0)
      && CFStringCompare(@"GB", v6, 0))
    {
      if (CFStringCompare(@"FR", v6, 0) && CFStringCompare(@"KR", v6, 0))
      {
LABEL_28:
        int v7 = 19;
        int v8 = 18;
        goto LABEL_30;
      }
      int v8 = 19;
      int v7 = 19;
    }
    else
    {
      int v7 = 18;
      int v8 = 17;
    }
  }
  else
  {
    int v7 = 20;
    int v8 = 19;
  }
LABEL_30:
  if (CFStringCompare(theString1, @"morning", 0))
  {
    if (CFStringCompare(theString1, @"brunch", 0))
    {
      if (CFStringCompare(theString1, @"noon", 0))
      {
        if (CFStringCompare(theString1, @"afternoon", 0))
        {
          if (CFStringCompare(theString1, @"evening", 0))
          {
            if (CFStringCompare(theString1, @"dinner", 0) && CFStringCompare(theString1, @"night", 0))
            {
              int v8 = v7;
              if (CFStringCompare(theString1, @"tonight", 0)) {
                return 0;
              }
            }
            else
            {
              int v8 = v7;
            }
          }
        }
        else
        {
          int v8 = 15;
        }
      }
      else
      {
        int v8 = 12;
      }
    }
    else
    {
      int v8 = 11;
    }
  }
  else
  {
    int v8 = 9;
  }
  *a2 = v8;
  return 1;
}

uint64_t hourValueForHourAndMeridianResult(uint64_t a1, uint64_t a2, const __CFLocale *a3, uint64_t a4, unsigned int a5, signed int a6, int a7, uint64_t a8, char a9)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v28 = -1;
    CFStringRef v18 = *(const __CFString **)(a1 + 80);
    if (!v18) {
      CFStringRef v18 = *(const __CFString **)(a1 + 72);
    }
    if (!extractInteger(v18, &v28)) {
      return 0xFFFFFFFFLL;
    }
    if (!a4)
    {
      if (a8)
      {
        BOOL v19 = __OFSUB__(v28, 12);
        if ((int)v28 <= 12)
        {
          if ((a5 & 0x80000000) != 0
            && (BOOL v19 = __OFSUB__(a6, 12), a6 <= 0xC)
            && (BOOL v19 = __OFSUB__(v28, a6), (int)v28 >= a6)
            || (a5 & 0x80000000) == 0 && a6 < 0 && (BOOL v19 = __OFSUB__(v28, a5 % 0xC), (int)v28 < (int)(a5 % 0xC)))
          {
            a4 = a8;
          }
          else if (((a6 & a5 & 0x80000000) != 0) != v19)
          {
            a4 = a8;
          }
          else
          {
            a4 = 0;
          }
        }
      }
    }
    __int16 v27 = 0;
    __int16 v26 = 0;
    int v20 = extractMeridianValue(a4, &v27, (unsigned char *)&v27 + 1, &v26, (unsigned char *)&v26 + 1);
    if (v20) {
      goto LABEL_20;
    }
    if (sForce24HrsFormat
      || localeHasStrict24Hrs((uint64_t)a3)
      || hourResultIsObvious24Hrs(a2))
    {
      return v28;
    }
    if (v18 && v28 && CFStringGetLength(v18) >= 1 && CFStringGetCharacterAtIndex(v18, 0) == 48)
    {
      int v20 = 1;
      int v22 = v28;
      int v21 = 1;
    }
    else
    {
LABEL_20:
      int v21 = v27;
      int v22 = v28;
      if (v28 - 12 >= 0xFFFFFFF5 && !(_BYTE)v27)
      {
        if (HIBYTE(v27) || v28 <= 6 && (_BYTE)v26 || v28 >= 6 && HIBYTE(v26))
        {
          int v22 = v28 + 12;
LABEL_47:
          unsigned int v28 = v22;
        }
LABEL_48:
        if (v20 || !a6 || v22 < 1) {
          return v28;
        }
        if (a7 == -1 && v22 <= 7)
        {
          return (v22 + 12);
        }
        else
        {
          unsigned int v24 = v22 + 12;
          if (v22 >= a7 || v22 > 0xB || (int)v24 < a7)
          {
            if ((int)a5 < 12)
            {
              if (v22 >= a6) {
                return v28;
              }
            }
            else if (v22 >= a6 && v24 > a5)
            {
              return v28;
            }
          }
        }
        return v24;
      }
    }
    if (v22 == 12 && v20 && !(_BYTE)v26)
    {
      if (HIBYTE(v26))
      {
        if (a9) {
          return 24;
        }
        else {
          return 0;
        }
      }
      else
      {
        if (v21)
        {
          if (!locale12PMIsMidnight(a3)) {
            return 0;
          }
          if (a9) {
            return v28;
          }
        }
        else
        {
          if (!HIBYTE(v27)) {
            return v28;
          }
          unsigned int v25 = locale12PMIsMidnight(a3);
          if (!a9 || !v25) {
            return v28;
          }
        }
        return 24;
      }
    }
    if (!v22 && HIBYTE(v27))
    {
      int v22 = 12;
      goto LABEL_47;
    }
    goto LABEL_48;
  }
  return result;
}

__CFString *createDetailedDescription(void *a1)
{
  CFArrayRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, @"type = %@, CFIndex range = %ld/%ld, matched string = \"%@\"", a1[8], a1[4], a1[5], a1[9]);
  if (a1[6]) {
    CFStringAppendFormat(Mutable, 0, @", score = %ld", a1[6]);
  }
  uint64_t v3 = a1[10];
  if (v3 || (uint64_t v3 = a1[9]) != 0) {
    CFStringAppendFormat(Mutable, 0, @", value = %@", v3);
  }
  CFArrayRef v4 = (const __CFArray *)a1[7];
  if (v4 && CFArrayGetCount(v4))
  {
    CFStringAppend(Mutable, @"\nSubresults = {\n");
    for (CFIndex i = 0; i < CFArrayGetCount(v4); ++i)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
      uint64_t v7 = ValueAtIndex[10];
      if (!v7) {
        uint64_t v7 = ValueAtIndex[9];
      }
      CFStringAppendFormat(Mutable, 0, @"(%@:%@)\n", ValueAtIndex[8], v7);
    }
    CFStringAppend(Mutable, @"}");
  }
  return Mutable;
}

CFTimeZoneRef DDCreateTimeZoneWithResult(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFStringRef SubresultWithType = DDResultGetSubresultWithType(a1, @"OlsonTimeZone");
  if (!SubresultWithType || (CFStringRef v3 = SubresultWithType[10]) == 0 && (CFStringRef v3 = SubresultWithType[9]) == 0)
  {
    uint64_t v10 = DDResultGetSubresultWithType(a1, @"Hours");
    if (v10)
    {
      CFStringRef v11 = v10[10];
      if (v11 || (CFStringRef v11 = v10[9]) != 0)
      {
        int v26 = 0;
        if ((extractInteger(v11, &v26) & 1) == 0)
        {
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
          CFStringRef v18 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v28 = v11;
            _os_log_error_impl(&dword_19DC95000, v18, OS_LOG_TYPE_ERROR, "Could not extract hour offset for time zone (%@)", buf, 0xCu);
          }
          goto LABEL_57;
        }
        int v12 = 3600 * v26;
        CFStringRef v13 = DDResultGetSubresultWithType(a1, @"Minutes");
        if (v13)
        {
          CFStringRef v14 = v13[10];
          if (v14 || (CFStringRef v14 = v13[9]) != 0)
          {
            if (extractInteger(v14, &v26))
            {
              v12 += 60 * v26;
            }
            else
            {
              if (DDLogHandle_onceToken != -1) {
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
              }
              BOOL v19 = DDLogHandle_error_log_handle;
              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                CFStringRef v28 = v14;
                _os_log_error_impl(&dword_19DC95000, v19, OS_LOG_TYPE_ERROR, "Could not extract minute offset for time zone (%@), ignoring", buf, 0xCu);
              }
            }
          }
        }
        if (v12 > 64800) {
          return 0;
        }
        int v20 = DDResultGetSubresultWithType(a1, @"Sign");
        if (v20)
        {
          CFStringRef v21 = v20[10];
          if (v21 || (CFStringRef v21 = v20[9]) != 0)
          {
            if (CFStringCompare(v21, @"-", 0))
            {
              if (CFStringCompare(v21, @"+", 0))
              {
                if (DDLogHandle_onceToken != -1) {
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                }
                int v22 = DDLogHandle_error_log_handle;
                if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412290;
                  CFStringRef v28 = v21;
                  _os_log_error_impl(&dword_19DC95000, v22, OS_LOG_TYPE_ERROR, "Could not extract sign for time zone offset (%@), considering a positive offset", buf, 0xCu);
                }
              }
            }
            else
            {
              int v12 = -v12;
            }
          }
        }
        CFTimeZoneRef v8 = CFTimeZoneCreateWithTimeIntervalFromGMT((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (double)v12);
        if (!v8) {
          goto LABEL_57;
        }
        return v8;
      }
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v16 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    if (a1)
    {
      CFStringRef v17 = *(const __CFString **)(a1 + 80);
      if (!v17) {
        CFStringRef v17 = *(const __CFString **)(a1 + 72);
      }
    }
    else
    {
      CFStringRef v17 = 0;
    }
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v28 = v17;
    _os_log_error_impl(&dword_19DC95000, v16, OS_LOG_TYPE_ERROR, "Relative time zone without value (%@)", buf, 0xCu);
    goto LABEL_57;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, @"|");
  CFArrayRef v6 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFStringRef v15 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      if (!v6) {
        goto LABEL_57;
      }
      goto LABEL_24;
    }
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v28 = v3;
    _os_log_error_impl(&dword_19DC95000, v15, OS_LOG_TYPE_ERROR, "Unexpected error while extracting time zone (%@)", buf, 0xCu);
    if (v6) {
LABEL_24:
    }
      CFRelease(v6);
LABEL_57:
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
LABEL_59:
    CFStringRef v23 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      if (a1)
      {
        CFStringRef v25 = *(const __CFString **)(a1 + 80);
        if (!v25) {
          CFStringRef v25 = *(const __CFString **)(a1 + 72);
        }
      }
      else
      {
        CFStringRef v25 = 0;
      }
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v28 = v25;
      _os_log_error_impl(&dword_19DC95000, v23, OS_LOG_TYPE_ERROR, "CFTimeZoneCreateWithName failed for %@", buf, 0xCu);
    }
    return 0;
  }
  if (CFArrayGetCount(v6) != 2
    || (CFStringRef v7 = (const __CFString *)CFArrayGetValueAtIndex(v6, 1), (v8 = CFTimeZoneCreateWithName(v4, v7, 1u)) == 0))
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    CFTimeZoneRef v8 = CFTimeZoneCreateWithName(v4, ValueAtIndex, 1u);
  }
  CFRelease(v6);
  if (!v8) {
    goto LABEL_57;
  }
  return v8;
}

uint64_t extractMeridianValue(uint64_t result, unsigned char *a2, unsigned char *a3, unsigned char *a4, unsigned char *a5)
{
  if (result)
  {
    uint64_t v9 = (CFStringRef *)result;
    if (_typesAreEqual(*(CFStringRef *)(result + 64), @"Meridian")
      || _typesAreEqual(v9[8], @"ApproxTime")
      || (uint64_t result = _typesAreEqual(v9[8], @"SpecialDateTime"), result))
    {
      CFStringRef v10 = v9[10];
      if (!v10)
      {
        CFStringRef v10 = v9[9];
        if (!v10) {
          return 0;
        }
      }
      if (CFStringGetLength(v10) < 2) {
        return 0;
      }
      if (CFStringCompare(v10, @"am", 0) && CFStringCompare(v10, @"morning", 0))
      {
        if (CFStringCompare(v10, @"pm", 0)
          && CFStringCompare(v10, @"afternoon", 0)
          && CFStringCompare(v10, @"evening", 0))
        {
          a2 = a3;
          if (CFStringCompare(v10, @"dinner", 0))
          {
            a2 = a5;
            if (CFStringCompare(v10, @"night", 0))
            {
              if (CFStringCompare(v10, @"day", 0) && CFStringCompare(v10, @"brunch", 0))
              {
                a2 = a4;
                if (CFStringCompare(v10, @"noon", 0)) {
                  return 0;
                }
              }
              else
              {
                a2 = a4;
              }
            }
          }
        }
        else
        {
          a2 = a3;
        }
      }
      uint64_t result = 1;
      *a2 = 1;
    }
  }
  return result;
}

uint64_t localeHasStrict24Hrs(uint64_t result)
{
  if (result)
  {
    uint64_t result = (uint64_t)CFLocaleGetValue((CFLocaleRef)result, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
    if (result)
    {
      CFStringRef v1 = (const __CFString *)result;
      if (CFStringGetLength((CFStringRef)result) < 2)
      {
        return 0;
      }
      else
      {
        v10.uint64_t location = 0;
        v10.NSUInteger length = 2;
        CFStringGetCharacters(v1, v10, &buffer);
        if (buffer == 65 && v9 == 88) {
          return 1;
        }
        if (buffer == 66 && v9 == 81) {
          return 1;
        }
        BOOL v2 = v9 == 80 || v9 == 90;
        BOOL v3 = v2;
        if (buffer == 67 && v3) {
          return 1;
        }
        if (buffer == 68 && v9 == 75) {
          return 1;
        }
        if (buffer == 70 && v9 == 73) {
          return 1;
        }
        BOOL v4 = v9 == 68 || v9 == 83;
        BOOL v5 = v4;
        return buffer == 73 && v5
            || buffer == 77 && v9 == 76
            || buffer == 78 && v9 == 69
            || buffer == 82 && v9 == 85
            || (v9 == 69 || (v9 & 0xFFFE) == 74) && buffer == 83;
      }
    }
  }
  return result;
}

uint64_t hourResultIsObvious24Hrs(uint64_t result)
{
  int v3 = -1;
  if (result)
  {
    uint64_t v1 = result;
    CFStringRef v2 = *(const __CFString **)(result + 80);
    if (!v2) {
      CFStringRef v2 = *(const __CFString **)(v1 + 72);
    }
    uint64_t result = extractInteger(v2, &v3);
    if (result) {
      return v3 > 12;
    }
  }
  return result;
}

CFLocaleRef locale12PMIsMidnight(const __CFLocale *result)
{
  if (result)
  {
    CFLocaleRef v1 = result;
    CFStringRef Value = (const __CFString *)CFLocaleGetValue(result, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
    if (!Value || (uint64_t result = (const __CFLocale *)CFStringHasPrefix(Value, @"ja"), !result))
    {
      uint64_t result = (const __CFLocale *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
      if (result) {
        return (const __CFLocale *)(CFEqual(@"JP", (CFStringRef)result));
      }
    }
  }
  return result;
}

uint64_t __extractInteger_block_invoke_2(uint64_t a1)
{
  uint64_t result = extractInteger_numberParser;
  if (extractInteger_numberParser)
  {
    uint64_t result = CFNumberFormatterGetValueFromString((CFNumberFormatterRef)extractInteger_numberParser, *(CFStringRef *)(a1 + 40), 0, kCFNumberIntType, *(void **)(a1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  }
  return result;
}

dispatch_queue_t __extractInteger_block_invoke_347()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.datadetectors.extraction.uint", 0);
  extractInteger_sQueue = (uint64_t)result;
  return result;
}

void __extractInteger_block_invoke()
{
  if (!extractInteger_numberParser)
  {
    if (getLocaleForExtraction_sOnce != -1) {
      dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
    }
    extractInteger_numberParser = (uint64_t)CFNumberFormatterCreate(0, (CFLocaleRef)_sLocaleForExtraction, kCFNumberFormatterDecimalStyle);
    if (!extractInteger_numberParser)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      dispatch_queue_t v0 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFLocaleRef v1 = 0;
        _os_log_error_impl(&dword_19DC95000, v0, OS_LOG_TYPE_ERROR, "Number parser initialization failed", v1, 2u);
      }
    }
  }
}

uint64_t DDResultCopyExtractedDateFromReferenceDateWithLocale(uint64_t a1, const __CFLocale *a2, const void *a3, const void *a4, BOOL *a5, CFDateRef *a6, CFTypeRef *a7)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFStringRef v14 = _copyDefaultCalendar();
  if (v14)
  {
    CFStringRef v15 = v14;
    uint64_t v16 = DDResultCopyExtractedDateFromReferenceDateRec(a1, a2, v14, a3, a4, a5, a6, a7, 0);
    CFRelease(v15);
    return v16;
  }
  else
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFStringRef v18 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      int v20 = "DDResultCopyExtractedDateFromReferenceDateWithLocale";
      _os_log_error_impl(&dword_19DC95000, v18, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", buf, 0xCu);
    }
    return 0;
  }
}

uint64_t DDApplyTimeOffset(uint64_t a1, __CFCalendar *a2, CFAbsoluteTime *a3, BOOL *a4)
{
  uint64_t v8 = DDGetUnitValueFromSubBinder(a1, @"Months");
  uint64_t v9 = DDGetUnitValueFromSubBinder(a1, @"Days");
  uint64_t v10 = DDGetUnitValueFromSubBinder(a1, @"Hours");
  uint64_t v11 = DDGetUnitValueFromSubBinder(a1, @"Minutes");
  int v12 = v11;
  uint64_t result = CFCalendarAddComponents(a2, a3, 0, "MdHm", v8, v9, v10, v11);
  if (a4)
  {
    if (result) {
      *a4 = (v12 | v10) == 0;
    }
  }
  return result;
}

uint64_t DDGetUnitValueFromSubBinder(uint64_t a1, const __CFString *a2)
{
  CFStringRef SubresultWithType = DDResultGetSubresultWithType(a1, a2);
  if (!SubresultWithType) {
    return 0;
  }
  int v3 = SubresultWithType;
  unsigned int v6 = 0;
  CFStringRef v4 = SubresultWithType[10];
  if (!v4) {
    CFStringRef v4 = v3[9];
  }
  if (extractInteger(v4, &v6)) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t extractDMYFromAmbiguousForm(CFIndex Count, const __CFLocale *a2, _DWORD *a3, int *a4, int *a5)
{
  CFIndex v5 = Count;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  CFArrayRef v6 = *(const __CFArray **)(Count + 56);
  if (!v6
    || (CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(Count + 56)), (unint64_t)(Count - 4) <= 0xFFFFFFFFFFFFFFFDLL))
  {
    DDLogErrD(Count, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, @"bad subresult %@", v5);
    return 0;
  }
  uint64_t v12 = Count;
  CFIndex v13 = 0;
  CFStringRef v14 = v75;
  do
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v13);
    if (ValueAtIndex)
    {
      CFStringRef v16 = ValueAtIndex;
      CFStringRef ValueAtIndex = (const __CFString *)ValueAtIndex[2].data;
      if (!ValueAtIndex) {
        CFStringRef ValueAtIndex = (const __CFString *)v16[2].info;
      }
    }
    uint64_t Integer = extractInteger(ValueAtIndex, v14);
    if ((Integer & 1) == 0)
    {
      DDLogErrD(Integer, v18, v19, v20, v21, @"could not extract integer at %ld from %@", v13, v5);
      return 0;
    }
    ++v13;
    ++v14;
  }
  while (v12 != v13);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __extractDMYFromAmbiguousForm_block_invoke;
  block[3] = &__block_descriptor_tmp_216;
  block[4] = a2;
  if (extractDMYFromAmbiguousForm_sOnce != -1) {
    dispatch_once(&extractDMYFromAmbiguousForm_sOnce, block);
  }
  int v22 = (const void *)extractDMYFromAmbiguousForm_sFormatLocale;
  if (extractDMYFromAmbiguousForm_sFormatLocale && (CFStringRef v23 = (const void *)MEMORY[0x19F3B1BA0](a2), CFEqual(v22, v23)))
  {
    unsigned int v24 = &extractDMYFromAmbiguousForm_sFormat2;
    if (v12 != 2) {
      unsigned int v24 = &extractDMYFromAmbiguousForm_sFormat3;
    }
    CFStringRef DateFormatFromTemplate = (const __CFString *)CFRetain((CFTypeRef)*v24);
  }
  else
  {
    if (v12 == 3) {
      CFStringRef v30 = @"yMd";
    }
    else {
      CFStringRef v30 = @"Md";
    }
    CFStringRef DateFormatFromTemplate = CFDateFormatterCreateDateFormatFromTemplate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v30, 0, a2);
  }
  CFStringRef v31 = DateFormatFromTemplate;
  if (!DateFormatFromTemplate)
  {
    DDLogErrD(0, v26, v27, v28, v29, @"could not get the date format string from the current locale");
    return 0;
  }
  CFIndex Length = CFStringGetLength(DateFormatFromTemplate);
  CFIndex v73 = Length;
  if (Length >= 100)
  {
    DDLogErrD(Length, v33, v34, v35, v36, @"format length too long");
    CFRelease(v31);
    return 0;
  }
  CFIndex v37 = Length;
  size_t v38 = Length + 1;
  unint64_t v39 = (char *)&v72 - ((MEMORY[0x1F4188790](Length) + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v39, v38);
  v77.uint64_t location = 0;
  v77.NSUInteger length = v37;
  CFStringGetBytes(v31, v77, 0x600u, 0x3Fu, 0, (UInt8 *)v39, v38, &v73);
  v39[v73] = 0;
  CFRelease(v31);
  uint64_t v45 = 0;
  uint64_t v46 = 0xFFFFFFFFLL;
  do
  {
    int v47 = v75[v45];
    if (!v47 || v47 >= 32)
    {
      if (v46 != -1)
      {
        DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, @"Aborting, impossible date pattern, too many years in %@", v5);
        return 0;
      }
      uint64_t v46 = v45;
    }
    ++v45;
  }
  while (v12 != v45);
  if (v46 == -1)
  {
    uint64_t v49 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0xFFFFFFFFLL;
    do
    {
      if ((int)v75[v48] >= 13 && v46 != v48)
      {
        if (v49 != -1)
        {
          DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, @"Aborting, impossible date pattern, too many month in %@", v5);
          return 0;
        }
        uint64_t v49 = v48;
      }
      ++v48;
    }
    while (v12 != v48);
  }
  char v51 = *v39;
  if (!*v39)
  {
    uint64_t v53 = 0xFFFFFFFFLL;
    goto LABEL_90;
  }
  unsigned int v52 = 0;
  uint64_t v53 = 0xFFFFFFFFLL;
  while (v52 != v46 && v52 != v53 && v52 != v49)
  {
LABEL_72:
    if (v51 > 99)
    {
      if (v51 == 100)
      {
        if (v49 == -1) {
          uint64_t v49 = v52;
        }
        else {
          uint64_t v49 = v49;
        }
        goto LABEL_87;
      }
      if (v51 == 121)
      {
LABEL_81:
        if (v46 == -1) {
          uint64_t v46 = v52;
        }
        else {
          uint64_t v46 = v46;
        }
      }
    }
    else if ((v51 - 76) >= 2)
    {
      if (v51 == 89) {
        goto LABEL_81;
      }
    }
    else if (v53 == -1)
    {
      uint64_t v53 = v52;
    }
    else
    {
      uint64_t v53 = v53;
    }
LABEL_87:
    int v61 = *++v39;
    char v51 = v61;
    if (!v61) {
      goto LABEL_90;
    }
  }
  uint64_t v54 = 0;
  if ((int)v52 <= 2) {
    uint64_t v55 = 2;
  }
  else {
    uint64_t v55 = v52;
  }
  uint64_t v40 = v55 - (int)v52;
  uint64_t v41 = (int)v52;
  uint64_t v42 = &v75[v52 + 1];
  uint64_t v43 = v52;
  uint64_t v44 = (1 - v53) + (unint64_t)v52;
  while (v40 != v54)
  {
    int v56 = v52 + v54 + 1;
    int v57 = v44 + v54;
    int v58 = 1 - v46 + v52 + v54;
    if (v12 > (int)v52 + v54 + 1 && v58 && v57 && v56 != v49)
    {
      if (v49 != -1 || v46 == -1) {
        unsigned int v60 = v49;
      }
      else {
        unsigned int v60 = v52 + v54 + 1;
      }
      if ((int)v42[v54] >= 13) {
        uint64_t v49 = v60;
      }
      else {
        uint64_t v49 = v49;
      }
    }
    ++v54;
    if (v58 && v57 && v56 != v49)
    {
      v52 += v54;
      goto LABEL_72;
    }
  }
LABEL_90:
  if (v12 != 2)
  {
    if (v49 <= 2
      && ((v53 | v46) & 0x80000000) == 0
      && (int)v53 <= 2
      && (int)v46 < 3)
    {
      int v62 = v75[v46];
      goto LABEL_100;
    }
    goto LABEL_116;
  }
  if (v49 > 1 || (v53 & 0x80000000) != 0 || (int)v53 >= 2)
  {
LABEL_116:
    DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, @"Aborting, one of the position is incorrect (%d, %d, %d)", v49, v53, v46);
    return 0;
  }
  int v62 = -1;
LABEL_100:
  int v63 = v75[v53];
  uint64_t v64 = v75[v49];
  if (v63 >= 13 && (int)v64 >= 1 && (int)v64 <= 12)
  {
    int v65 = lastDayOfMonthLeapYear[(v64 - 1)];
    BOOL v66 = v63 <= v65;
    if (v63 <= v65) {
      uint64_t v67 = v63;
    }
    else {
      uint64_t v67 = v64;
    }
    if (v66) {
      int v63 = v64;
    }
    uint64_t v64 = v67;
  }
  if ((v63 - 13) < 0xFFFFFFF4) {
    return 0;
  }
  if ((int)v64 < 1) {
    goto LABEL_114;
  }
  int v68 = lastDayOfMonthLeapYear[v63 - 1];
  if ((int)v64 <= v68)
  {
    if ((int)v12 >= 3)
    {
      uint64_t v69 = 0;
      while ((int)v75[v69] <= v68)
      {
        if (++v69 == 3) {
          goto LABEL_124;
        }
      }
      if (v46 != v69)
      {
        DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, @"Locale information is useless (year)");
        return 0;
      }
    }
LABEL_124:
    *a3 = v64;
    *a4 = v63;
    int v70 = v62 + 1900;
    if (v62 >= 0x64) {
      int v70 = v62;
    }
    if (v62 <= 0x31) {
      int v70 = v62 + 2000;
    }
    if (v62 >= 0) {
      int v71 = v70;
    }
    else {
      int v71 = -1;
    }
    *a5 = v71;
    return 1;
  }
  else
  {
    if ((v64 - 32) <= 0xFFFFFFE0) {
LABEL_114:
    }
      DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, @"Day (%d) is out of bounds", v64);
    return 0;
  }
}

uint64_t DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear(void *key, uint64_t a2, const __CFLocale *a3, Boolean *a4, int *a5, int *a6, _DWORD *a7, unsigned int a8)
{
  *a6 = 1;
  *a7 = 1;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear_sOnce != -1) {
    dispatch_once(&DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear_sOnce, &__block_literal_global_28);
  }
  if (!DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear__sVacationsInfoPlist) {
    return 0;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear__sVacationsInfoPlist, key);
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v17 = Value;
  unsigned int v31 = a8;
  if (a3) {
    uint64_t v18 = (__CFString *)CFLocaleGetValue(a3, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
  }
  else {
    uint64_t v18 = 0;
  }
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = @"default";
  }
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (!a2
    || (CFStringRef v21 = CFStringCreateWithFormat(alloc, 0, @"%@.%@", v20, a2),
        CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v21),
        CFRelease(v21),
        !v22)
    && (CFStringRef v23 = CFStringCreateWithFormat(alloc, 0, @"default.%@", a2),
        CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v23),
        CFRelease(v23),
        !v22))
  {
    unsigned int v24 = (__CFString *)CFDictionaryGetValue(v17, v20);
    CFStringRef v25 = v24 ? v24 : @"GREGORIAN";
    CFStringRef v26 = CFStringCreateWithFormat(alloc, 0, @"%@.%@", v20, v25);
    CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v26);
    CFRelease(v26);
    if (!v22)
    {
      CFStringRef v27 = CFStringCreateWithFormat(alloc, 0, @"default.%@", v25);
      CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v27);
      CFRelease(v27);
      if (!v22)
      {
        uint64_t v28 = (__CFString *)CFDictionaryGetValue(v17, @"default");
        uint64_t v29 = @"GREGORIAN";
        if (v28) {
          uint64_t v29 = v28;
        }
        CFStringRef v30 = CFStringCreateWithFormat(alloc, 0, @"default.%@", v29);
        CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v30);
        CFRelease(v30);
      }
    }
  }

  return DDExtractDayAndMonthFromSpecialDayInYearRec(a6, a7, v31, a4, a5, (uint64_t)key, v22, 0);
}

void __DDResultExtractDayMonthYear_block_invoke_2(uint64_t a1)
{
  if (DDResultExtractDayMonthYear_firstWeekDayLocale != *(void *)(a1 + 40))
  {
    DDResultExtractDayMonthYear_firstWeekDayLocale = *(void *)(a1 + 40);
    CFStringRef v2 = CFCalendarCopyCurrent();
    CFLocaleRef v3 = *(const __CFLocale **)(a1 + 40);
    if (v2)
    {
      CFStringRef v4 = v2;
      CFCalendarSetLocale(v2, v3);
      DDResultExtractDayMonthYear_actualFirstWeekDay = MEMORY[0x19F3B1970](v4);
      CFRelease(v4);
    }
    else
    {
      if (v3
        && (CFStringRef v5 = (const __CFString *)MEMORY[0x19F3B1BA0](*(void *)(a1 + 40)), CFStringHasSuffix(v5, @"US")))
      {
        int v6 = 1;
      }
      else
      {
        int v6 = 2;
      }
      DDResultExtractDayMonthYear_actualFirstWeekDay = v6;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = DDResultExtractDayMonthYear_actualFirstWeekDay;
  if (*(_DWORD *)(a1 + 48))
  {
    CFTypeRef Value = CFLocaleGetValue(*(CFLocaleRef *)(a1 + 40), (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
    if (Value)
    {
      uint64_t v8 = Value;
      if (CFEqual(Value, @"JP")
        || CFEqual(v8, @"CN")
        || CFEqual(v8, @"TW")
        || CFEqual(v8, @"HK")
        || CFEqual(v8, @"MO"))
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
      }
    }
  }
}

dispatch_queue_t __DDResultExtractDayMonthYear_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.datadetectors.extraction.locale", 0);
  DDResultExtractDayMonthYear_sQueue = (uint64_t)result;
  return result;
}

uint64_t DDExtractDayAndMonthFromSpecialDayInYearRec(int *a1, _DWORD *a2, uint64_t a3, Boolean *a4, int *a5, uint64_t a6, const __CFDictionary *a7, int a8)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (a8 >= 2)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v10 = DDLogHandle_error_log_handle;
    uint64_t result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
    if (result)
    {
      buf.years = 138412546;
      *(void *)&buf.months = a6;
      LOWORD(buf.hours) = 1024;
      *(SInt32 *)((char *)&buf.hours + 2) = a3;
      uint64_t v12 = "Recursive parsing of a special date failed for %@ for year %d";
      CFIndex v13 = v10;
      uint32_t v14 = 18;
LABEL_6:
      _os_log_error_impl(&dword_19DC95000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&buf, v14);
      return 0;
    }
    return result;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a7, @"Type");
  if (CFEqual(Value, @"AbsoluteDate"))
  {
    CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(a7, @"Month");
    CFNumberGetValue(v26, kCFNumberIntType, a2);
    CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(a7, @"Day");
    CFNumberGetValue(v27, kCFNumberIntType, a1);
    goto LABEL_36;
  }
  if (CFEqual(Value, @"MonthRelativeWeekDay"))
  {
    CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(a7, @"Month");
    CFNumberGetValue(v28, kCFNumberIntType, a2);
    CFNumberRef v29 = (const __CFNumber *)CFDictionaryGetValue(a7, @"WeekDay");
    buf.years = 1;
    CFNumberGetValue(v29, kCFNumberIntType, &buf);
    CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(a7, @"WeekDayNumberInMonth");
    int valuePtr = 1;
    CFNumberGetValue(v30, kCFNumberIntType, &valuePtr);
    if ((int)extractDayFromWeekDayRelativeToMonth(a3, *a2, buf.years, valuePtr) < 1) {
      return 0;
    }
    *a1 = extractDayFromWeekDayRelativeToMonth(a3, *a2, buf.years, valuePtr);
    goto LABEL_36;
  }
  if (CFStringCompare(Value, @"SpecialDateRelativeDate", 0))
  {
    if (CFEqual(Value, @"DateList"))
    {
      CFStringRef v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%d", a3);
      CFArrayRef v23 = (const __CFArray *)CFDictionaryGetValue(a7, v22);
      if (!v23) {
        goto LABEL_32;
      }
      CFArrayRef ValueAtIndex = v23;
      CFStringRef cf = v22;
      CFTypeID v25 = CFGetTypeID(v23);
      if (v25 == CFArrayGetTypeID())
      {
        CFStringRef v22 = cf;
        if (CFArrayGetCount(ValueAtIndex) < 1) {
          goto LABEL_32;
        }
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        if (!ValueAtIndex) {
          goto LABEL_32;
        }
      }
      else
      {
        CFStringRef v22 = cf;
      }
      CFBooleanRef v45 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, @"NoDefinition");
      if (v45)
      {
        if (CFBooleanGetValue(v45) == 1)
        {
LABEL_32:
          CFRelease(v22);
          return 0;
        }
      }
      CFNumberRef v46 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Month");
      CFNumberRef v47 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Day");
      CFNumberGetValue(v46, kCFNumberIntType, a2);
      CFNumberGetValue(v47, kCFNumberIntType, a1);
      CFRelease(cf);
    }
LABEL_36:
    CFNumberRef v48 = (const __CFNumber *)CFDictionaryGetValue(a7, @"RelativeDays");
    if (v48)
    {
      int valuePtr = 0;
      CFNumberGetValue(v48, kCFNumberIntType, &valuePtr);
      SInt32 v49 = valuePtr;
      if (valuePtr)
      {
        memset(&buf.hours, 0, 20);
        unsigned int v63 = a3;
        cfa = a4;
        uint64_t v50 = a6;
        uint64_t v51 = *(unsigned __int8 *)a1;
        unsigned int v52 = a5;
        uint64_t v53 = *(unsigned __int8 *)a2;
        CFTimeZoneRef v54 = CFTimeZoneCopyDefault();
        uint64_t v55 = (v51 << 40) | (v53 << 32);
        a5 = v52;
        a4 = cfa;
        *(void *)&v69.SInt32 year = v55 | v63;
        v69.second = 0.0;
        CFAbsoluteTime AbsoluteTime = CFGregorianDateGetAbsoluteTime(v69, v54);
        *(void *)&buf.years = 0;
        buf.days = v49;
        CFAbsoluteTime v57 = CFAbsoluteTimeAddGregorianUnits(AbsoluteTime, v54, &buf);
        unint64_t v58 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v57, v54);
        CFRelease(v54);
        *a1 = (int)(v58 >> 16) >> 24;
        *a2 = (int)(v58 >> 8) >> 24;
        if (v58 != v63) {
          return DDExtractDayAndMonthFromSpecialDayInYearRec(a1, a2, 2 * v63 - v58, cfa, a5, v50, a7, (a8 + 1));
        }
      }
    }
    if (a4)
    {
      CFBooleanRef v59 = (const __CFBoolean *)CFDictionaryGetValue(a7, @"ActualMayVary");
      if (v59) {
        *a4 = CFBooleanGetValue(v59);
      }
    }
    if (!a5) {
      return 1;
    }
    CFStringRef v60 = (const __CFString *)CFDictionaryGetValue(a7, @"Observed");
    if (!v60) {
      return 1;
    }
    CFStringRef v61 = v60;
    if (CFEqual(v60, @"closestBusinessDay"))
    {
      uint64_t result = 1;
      *a5 = 1;
      return result;
    }
    if (CFStringCompare(v61, @"nextBusinessDay", 0))
    {
      if (CFStringCompare(v61, @"previousBusinessDay", 0))
      {
        if (CFEqual(v61, @"sameDay")) {
          *a5 = 0;
        }
        return 1;
      }
      int v62 = 2;
    }
    else
    {
      int v62 = 3;
    }
    *a5 = v62;
    return 1;
  }
  CFStringRef v31 = (const __CFString *)CFDictionaryGetValue(a7, @"SpecialDate");
  CFStringRef v32 = (const __CFString *)CFDictionaryGetValue(a7, @"CalendarType");
  if (CFEqual(v31, @"easter"))
  {
    if (v32 && CFEqual(v32, @"JULIAN"))
    {
      extractJulianEasterInYear(a1, a2, a3);
    }
    else
    {
      int v34 = (int)a3 % 19;
      int v35 = (int)a3 / 100;
      char v36 = (int)a3 % 100;
      int v37 = ((int)a3 / 100) & 3;
      if ((int)a3 / -100 >= 0) {
        int v37 = -(((int)a3 / -100) & 3);
      }
      int v38 = ((unint64_t)(1431655765 * (v35 + (v35 + 8) / -25 + 1)) >> 32) - (v35 + (v35 + 8) / -25 + 1);
      int v39 = (int)(v35 + (int)a3 / -400 + 19 * v34 + (v38 >> 1) + (v38 >> 31) + 15) % 30;
      char v40 = v36 + ((v36 >> 13) & 3);
      int v41 = 2 * (v37 + (v40 >> 2)) + ((v40 & 0xFC) - v36 + 32);
      __int16 v42 = (37201 * (__int16)(v34 + 11 * v39 + 22 * ((v41 - v39) % 7))) >> 16;
      __int16 v43 = v41
          - 7 * ((v41 - v39) / 7)
          + 249 * ((v42 >> 8) + ((unsigned __int16)(v42 & 0x8000) >> 15))
          + 114;
      unsigned int v44 = (((v43 - ((unsigned __int16)(9 * v43) >> 8)) >> 1)
           + ((9 * v43) >> 8)) >> 4;
      *a1 = (-31 * v44 + v43 + 1);
      *a2 = v44;
    }
    goto LABEL_36;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v33 = DDLogHandle_error_log_handle;
  uint64_t result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    buf.years = 138412546;
    *(void *)&buf.months = a6;
    LOWORD(buf.hours) = 2112;
    *(void *)((char *)&buf.hours + 2) = v31;
    uint64_t v12 = "Malformed Vacations.plist for %@ (SpecialDate %@ is unknown)";
    CFIndex v13 = v33;
    uint32_t v14 = 22;
    goto LABEL_6;
  }
  return result;
}

uint64_t extractDayFromWeekDayRelativeToMonth(unsigned int a1, unsigned __int8 a2, int a3, int a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFTimeZoneRef v8 = CFTimeZoneCopyDefault();
  *(void *)&v21.SInt32 year = a1 | ((unint64_t)a2 << 32) | 0x10000000000;
  v21.second = 0.0;
  CFAbsoluteTime AbsoluteTime = CFGregorianDateGetAbsoluteTime(v21, v8);
  uint64_t v10 = _copyDefaultCalendar();
  if (!v10)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint32_t v14 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v19.years = 136315138;
      *(void *)&v19.months = "extractDayFromWeekDayRelativeToMonth";
      _os_log_error_impl(&dword_19DC95000, v14, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", (uint8_t *)&v19, 0xCu);
      if (!v8) {
        return 0xFFFFFFFFLL;
      }
    }
    else if (!v8)
    {
      return 0xFFFFFFFFLL;
    }
    CFRelease(v8);
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  CFIndex length = CFCalendarGetRangeOfUnit(v10, 0x10uLL, 8uLL, AbsoluteTime).length;
  CFRelease(v11);
  if (a4 < 0)
  {
    memset(&v19.days, 0, 24);
    *(void *)&v19.years = 0x100000000;
    CFAbsoluteTime v16 = CFAbsoluteTimeAddGregorianUnits(AbsoluteTime, v8, &v19);
    SInt32 DayOfWeek = CFAbsoluteTimeGetDayOfWeek(v16, v8);
    int v13 = length - a4 + 8 * a4 + a3 - DayOfWeek + 7 - 7 * ((a3 - DayOfWeek + 7) / 7) + 1;
  }
  else
  {
    int v13 = (a3 - CFAbsoluteTimeGetDayOfWeek(AbsoluteTime, v8) + 7) % 7 - a4 + 8 * a4 - 6;
  }
  CFRelease(v8);
  if (length < v13 || v13 < 1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v13;
  }
}

_DWORD *extractJulianEasterInYear(_DWORD *result, _DWORD *a2, int a3)
{
  if (a3 <= 0) {
    int v3 = -(-a3 & 3);
  }
  else {
    int v3 = a3 & 3;
  }
  int v4 = 4 * (a3 % 7) + 2 * v3 + 34;
  int v5 = v4
     - 7
     * ((v4
       - (__int16)(19 * (a3 % 19)
                 + 15
                 - 30
                 * (((__int16)((34953 * (__int16)(19 * (a3 % 19) + 15)) >> 16) >> 4)
                  + ((unsigned __int16)(((34953 * (__int16)(19 * (a3 % 19) + 15)) >> 16) & 0x8000) >> 15))))
      / 7)
     + 114;
  unsigned int v6 = ((v5 - ((unsigned __int16)(9 * v5) >> 8)) >> 1)
     + ((9 * v5) >> 8);
  int v7 = (-31 * (v6 >> 4) + v5 + 13);
  int v8 = lastDayOfMonthLeapYear[(v6 >> 4) - 1];
  *uint64_t result = v7 % v8 + 1;
  *a2 = v7 / v8 + (v6 >> 4);
  return result;
}

void *__extractDMYFromAmbiguousForm_block_invoke(void *result)
{
  CFLocaleRef v1 = (const __CFLocale *)*((void *)result + 4);
  if (v1)
  {
    CFStringRef v2 = (CFLocaleRef *)result;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    extractDMYFromAmbiguousForm_sFormat3 = (uint64_t)CFDateFormatterCreateDateFormatFromTemplate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"yMd", 0, v1);
    extractDMYFromAmbiguousForm_sFormat2 = (uint64_t)CFDateFormatterCreateDateFormatFromTemplate(v3, @"Md", 0, v2[4]);
    int v4 = (const void *)MEMORY[0x19F3B1BA0](v2[4]);
    uint64_t result = (void *)CFRetain(v4);
    extractDMYFromAmbiguousForm_sFormatLocale = (uint64_t)result;
  }
  return result;
}

uint64_t DDResultCopyExtractedDateFromReferenceDate(uint64_t a1, const void *a2, const void *a3, BOOL *a4, CFDateRef *a5, CFTypeRef *a6)
{
  if (getLocaleForExtraction_sOnce != -1) {
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
  }
  CFLocaleRef v12 = (const __CFLocale *)_sLocaleForExtraction;

  return DDResultCopyExtractedDateFromReferenceDateWithLocale(a1, v12, a2, a3, a4, a5, a6);
}

uint64_t DDResultCopyExtractedStartDateEndDate(uint64_t a1, CFDateRef *a2, CFTypeRef *a3, CFTypeRef *a4, CFTypeRef *a5, BOOL *a6, const void *a7, CFTypeRef cf)
{
  if (getLocaleForExtraction_sOnce != -1) {
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
  }
  return DDResultCopyExtractedStartDateEndDateWithLocale(a1, (const __CFLocale *)_sLocaleForExtraction, a2, a3, a4, a5, a6, a7, cf);
}

uint64_t DDResultCopyExtractedStartDateEndDateWithLocale(uint64_t a1, const __CFLocale *a2, CFDateRef *a3, CFTypeRef *a4, CFTypeRef *a5, CFTypeRef *a6, BOOL *a7, const void *a8, CFTypeRef cf)
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v20 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)CFGregorianUnits buf = 0;
    CFGregorianDate v21 = "result should not be NULL";
    CFStringRef v22 = v20;
    uint32_t v23 = 2;
LABEL_81:
    _os_log_error_impl(&dword_19DC95000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    return 0;
  }
  CFCalendarRef v17 = _copyDefaultCalendar();
  if (!v17)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v24 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)CFGregorianUnits buf = 136315138;
    *(void *)&uint8_t buf[4] = "DDResultCopyExtractedStartDateEndDateWithLocale";
    CFGregorianDate v21 = "Couldn't fetch the gregorian calendar in %s...";
    CFStringRef v22 = v24;
    uint32_t v23 = 12;
    goto LABEL_81;
  }
  uint64_t v18 = v17;
  uint64_t v140 = a3;
  v139 = a5;
  v137 = a7;
  if (cf) {
    CFTimeZoneRef v19 = (const __CFTimeZone *)CFRetain(cf);
  }
  else {
    CFTimeZoneRef v19 = CFTimeZoneCopyDefault();
  }
  CFTimeZoneRef v26 = v19;
  v138 = a6;
  CFDateRef v142 = copyBestDateForDate(a8);
  CFStringRef SubresultWithType = (const __CFString **)a1;
  if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), @"TimeDuration")) {
    CFStringRef SubresultWithType = DDResultGetSubresultWithType(a1, @"TimeDuration");
  }
  uint64_t v28 = a1;
  CFLocaleRef v29 = a2;
  CFCalendarSetLocale(v18, a2);
  calendar = v18;
  CFCalendarSetTimeZone(v18, v26);
  CFNumberRef v30 = DDResultGetSubresultWithType(v28, @"BeginDate");
  CFStringRef v31 = (void *)v28;
  CFStringRef v32 = DDResultGetSubresultWithType(v28, @"EndDate");
  if (!v32)
  {
    CFTimeZoneRef v34 = v26;
    if (!v30) {
      goto LABEL_26;
    }
    int v38 = calendar;
    CFDateRef v39 = v142;
    uint64_t v40 = _DDResultCopyImplicitDateFromReferenceDateWithLocale((uint64_t)v30, 1, v29, calendar, a8, cf, v142, v26, v137, v139, v138, v140, a4);
LABEL_33:
    uint64_t v25 = v40;
    goto LABEL_248;
  }
  uint64_t v33 = (uint64_t)v32;
  if (!v30)
  {
    int v38 = v18;
    CFDateRef v39 = v142;
    uint64_t v40 = _DDResultCopyImplicitDateFromReferenceDateWithLocale((uint64_t)v32, 0, v29, v18, a8, cf, v142, v26, v137, (CFTypeRef *)v140, a4, (CFDateRef *)v139, v138);
    goto LABEL_33;
  }
  CFTimeZoneRef v34 = v26;
  CFArrayRef v35 = (const __CFArray *)v32[7];
  if (v35)
  {
    CFArrayRef v36 = (const __CFArray *)v30[7];
    if (CFArrayGetCount((CFArrayRef)v32[7]) >= 1 && (!v36 || CFArrayGetCount(v36) >= 1))
    {
      CFDateRef v151 = 0;
      *(void *)CFGregorianUnits buf = 0;
      CFTypeRef v150 = 0;
      __int16 v149 = 0;
      if (CFArrayGetCount(v35) == 1)
      {
        CFArrayRef ValueAtIndex = (const __CFString **)CFArrayGetValueAtIndex(v35, 0);
        int v37 = 0;
      }
      else
      {
        CFArrayRef ValueAtIndex = DDResultGetSubresultWithType(v33, @"Date");
        int v37 = DDResultGetSubresultWithType(v33, @"ApproxTime");
      }
      id v133 = v37;
      CFTimeZoneRef v26 = v34;
      int v38 = calendar;
      if (v36)
      {
        CFLocaleRef v75 = v29;
        if (CFArrayGetCount(v36) == 1)
        {
          uint64_t v76 = (const __CFString **)CFArrayGetValueAtIndex(v36, 0);
          CFRange v77 = 0;
        }
        else
        {
          uint64_t v76 = DDResultGetSubresultWithType((uint64_t)v30, @"Date");
          CFRange v77 = DDResultGetSubresultWithType((uint64_t)v30, @"ApproxTime");
        }
        CFDateRef v39 = v142;
        int v90 = DDResultCopyExtractedDateFromReferenceDateRec((uint64_t)v76, v75, calendar, v142, v26, (BOOL *)&v149 + 1, &v151, &v150, 1);
        if (a4 && v150) {
          *a4 = CFRetain(v150);
        }
        BOOL IsPartial = resultIsPartial(v76);
        if (!v90)
        {
          CFDateRef v93 = v142;
          uint64_t v79 = v77;
          int v80 = ValueAtIndex;
          goto LABEL_83;
        }
        uint64_t v79 = v77;
        int v80 = ValueAtIndex;
        if (IsPartial) {
          goto LABEL_79;
        }
      }
      else
      {
        HIBYTE(v149) = 0;
        CFAbsoluteTime v78 = MEMORY[0x19F3B1AA0](a8);
        uint64_t v79 = 0;
        uint64_t v76 = 0;
        CFDateRef v151 = CFDateCreate(0, v78);
        CFDateRef v39 = v142;
        CFLocaleRef v75 = v29;
        int v80 = ValueAtIndex;
      }
      BOOL v92 = resultIsPartial(v80);
      CFDateRef v93 = v39;
      if (!v92)
      {
LABEL_83:
        DDResultCopyExtractedDateFromReferenceDateRec((uint64_t)v80, v75, calendar, v93, v26, (BOOL *)&v149, (CFDateRef *)buf, v138, 1);
        uint64_t v25 = 0;
        CFDateRef v94 = v151;
        if (v151 && *(void *)buf)
        {
          if (v140)
          {
            if (CFDateCompare(v151, *(CFDateRef *)buf, 0) == kCFCompareGreaterThan)
            {
              if (DDResultGetSubresultWithType((uint64_t)v76, @"YearNumber")) {
                BOOL v95 = 1;
              }
              else {
                BOOL v95 = DDResultGetSubresultWithType((uint64_t)v76, @"JapaneseYearNumber") != 0;
              }
              if (v80)
              {
                if (DDResultGetSubresultWithType((uint64_t)v80, @"YearNumber")) {
                  BOOL v116 = 1;
                }
                else {
                  BOOL v116 = DDResultGetSubresultWithType((uint64_t)v80, @"JapaneseYearNumber") != 0;
                }
              }
              else
              {
                BOOL v116 = 0;
              }
              long long v148 = 0uLL;
              uint64_t v146 = 0;
              memset(v147, 0, sizeof(v147));
              uint64_t v145 = 0;
              unsigned int v144 = 0;
              MEMORY[0x19F3B1AA0](v151);
              CFCalendarDecomposeAbsoluteTime(calendar, v119, "yMdHms", (char *)&v148 + 12, (char *)&v148 + 8, (char *)&v148 + 4, &v148, &v147[2], &v147[1]);
              MEMORY[0x19F3B1AA0](*(void *)buf);
              CFCalendarDecomposeAbsoluteTime(calendar, v120, "yMdHms", v147, (char *)&v146 + 4, &v146, (char *)&v145 + 4, &v145, &v144);
              if (!v95 && SHIDWORD(v148) > v147[0])
              {
                HIDWORD(v14_Block_object_dispose(&STACK[0x600], 8) = v147[0];
                CFRelease(v151);
                CFAbsoluteTime at = 0.0;
                CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", HIDWORD(v148), DWORD2(v148), DWORD1(v148), v148, v147[2], v147[1]);
                CFDateRef v151 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], at);
              }
              if (v116)
              {
                CFLocaleRef v100 = v75;
                uint64_t v25 = 1;
                CFDateRef v39 = v142;
              }
              else
              {
                if (SHIDWORD(v148) <= v147[0])
                {
                  uint64_t v25 = 1;
                }
                else
                {
                  v147[0] = HIDWORD(v148);
                  CFRelease(*(CFTypeRef *)buf);
                  CFAbsoluteTime at = 0.0;
                  uint64_t v25 = CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", v147[0], HIDWORD(v146), v146, HIDWORD(v145), v145, v144);
                  *(void *)CFGregorianUnits buf = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], at);
                }
                CFDateRef v39 = v142;
                CFLocaleRef v100 = v75;
                if (!v95 && CFDateCompare(v151, *(CFDateRef *)buf, 0) == kCFCompareGreaterThan)
                {
                  ++v147[0];
                  CFRelease(*(CFTypeRef *)buf);
                  CFAbsoluteTime at = 0.0;
                  uint64_t v25 = CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", v147[0], HIDWORD(v146), v146, HIDWORD(v145), v145, v144);
                  *(void *)CFGregorianUnits buf = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], at);
                }
              }
            }
            else
            {
              CFLocaleRef v100 = v75;
              uint64_t v25 = 1;
            }
            NSUInteger v101 = v139;
            NSUInteger v102 = v137;
            if (CFDateCompare(v151, *(CFDateRef *)buf, 0) == kCFCompareGreaterThan)
            {
              if (CFDateCompare((CFDateRef)a8, *(CFDateRef *)buf, 0) == kCFCompareLessThan) {
                CFDateRef v121 = (CFDateRef)a8;
              }
              else {
                CFDateRef v121 = *(CFDateRef *)buf;
              }
            }
            else
            {
              CFDateRef v121 = v151;
            }
            CFAllocatorRef v122 = CFRetain(v121);
            if (v79)
            {
              HIDWORD(v14_Block_object_dispose(&STACK[0x600], 8) = 0;
              CFStringRef v123 = v79[10];
              if (!v123) {
                CFStringRef v123 = v79[9];
              }
              if (extractHourFromApproxTimeValue(v123, (int *)&v148 + 3, v100))
              {
                *(void *)((char *)&v148 + 4) = 0;
                LODWORD(v14_Block_object_dispose(&STACK[0x600], 8) = 0;
                CFAbsoluteTime at = MEMORY[0x19F3B1AA0](v122);
                CFCalendarDecomposeAbsoluteTime(calendar, at, "yMd", (char *)&v148 + 8, (char *)&v148 + 4, &v148);
                CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", DWORD2(v148), DWORD1(v148), v148, HIDWORD(v148), 0, 0);
                CFRelease(v122);
                CFAllocatorRef v122 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], at);
                HIBYTE(v149) = 0;
              }
            }
            NSUInteger v103 = v133;
            *uint64_t v140 = (CFDateRef)v122;
          }
          else
          {
            CFLocaleRef v100 = v75;
            uint64_t v25 = 1;
            NSUInteger v101 = v139;
            NSUInteger v102 = v137;
            NSUInteger v103 = v133;
          }
          if (v101)
          {
            if (!v103) {
              goto LABEL_231;
            }
            HIDWORD(v14_Block_object_dispose(&STACK[0x600], 8) = 0;
            CFStringRef v124 = v103[10];
            if (!v124) {
              CFStringRef v124 = v103[9];
            }
            if (!extractHourFromApproxTimeValue(v124, (int *)&v148 + 3, v100) {
              || (*(void *)((char *)&v148 + 4) = 0,
            }
                  LODWORD(v14_Block_object_dispose(&STACK[0x600], 8) = 0,
                  CFAbsoluteTime at = MEMORY[0x19F3B1AA0](*(void *)buf),
                  CFCalendarDecomposeAbsoluteTime(calendar, at, "yMd", (char *)&v148 + 8, (char *)&v148 + 4, &v148),
                  CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", DWORD2(v148), DWORD1(v148), v148, HIDWORD(v148), 0, 0), CFArrayRef v125 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], at), LOBYTE(v149) = 0, !v125))
            {
LABEL_231:
              CFArrayRef v125 = (void *)CFRetain(*(CFTypeRef *)buf);
            }
            CFTypeRef *v101 = v125;
          }
          if (v102)
          {
            if (HIBYTE(v149)) {
              BOOL v126 = v149 == 0;
            }
            else {
              BOOL v126 = 1;
            }
            char v127 = !v126;
            *NSUInteger v102 = v127;
          }
          CFDateRef v94 = v151;
        }
        if (v94) {
          CFRelease(v94);
        }
        if (v150) {
          CFRelease(v150);
        }
        CFTimeZoneRef v115 = *(CFTimeZoneRef *)buf;
        if (*(void *)buf) {
LABEL_247:
        }
          CFRelease(v115);
LABEL_248:
        if (v25)
        {
LABEL_254:
          CFRelease(v26);
          CFRelease(v39);
          CFRelease(v38);
          return v25;
        }
LABEL_249:
        DetailedDescriptiouint64_t n = createDetailedDescription(v31);
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        id v129 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CFGregorianUnits buf = 138412290;
          *(void *)&uint8_t buf[4] = DetailedDescription;
          _os_log_error_impl(&dword_19DC95000, v129, OS_LOG_TYPE_ERROR, "Unknown result type, could not extract duration: %@", buf, 0xCu);
        }
        CFRelease(DetailedDescription);
        uint64_t v25 = 0;
        goto LABEL_254;
      }
LABEL_79:
      CFDateRef v93 = v151;
      goto LABEL_83;
    }
  }
LABEL_26:
  if (!SubresultWithType)
  {
    CFTimeZoneRef v26 = v34;
    int v38 = calendar;
    CFDateRef v39 = v142;
    if (!DDResultGetSubresultWithType((uint64_t)v31, @"DayInterval")) {
      goto LABEL_249;
    }
    uint64_t v53 = DDResultGetSubresultWithType((uint64_t)v31, @"DayInterval");
    CFTimeZoneRef v54 = DDResultGetSubresultWithType((uint64_t)v53, @"MonthNumber");
    uint64_t v55 = DDResultGetSubresultWithType((uint64_t)v53, @"BeginDay");
    int v56 = DDResultGetSubresultWithType((uint64_t)v53, @"EndDay");
    uint64_t GregorianYear = extractGregorianYear((uint64_t)v53);
    uint64_t v25 = 0;
    LODWORD(v151) = -1;
    LODWORD(v150) = -1;
    LODWORD(at) = -1;
    HIDWORD(v14_Block_object_dispose(&STACK[0x600], 8) = -1;
    if (!v54 || !v55 || !v56) {
      goto LABEL_201;
    }
    uint64_t v58 = GregorianYear;
    CFStringRef v59 = v54[10];
    if (!v59) {
      CFStringRef v59 = v54[9];
    }
    if ((uint64_t)v54[4] <= (uint64_t)v56[4]) {
      CFStringRef v60 = &v151;
    }
    else {
      CFStringRef v60 = (CFDateRef *)&v150;
    }
    int Integer = extractInteger(v59, v60);
    CFStringRef data = (const __CFString *)DDResultGetSubresultWithType((uint64_t)v55, @"DayNumber");
    if (data)
    {
      CFStringRef v63 = data;
      CFStringRef data = (const __CFString *)data[2].data;
      uint64_t v64 = calendar;
      CFDateRef v65 = v142;
      if (!data) {
        CFStringRef data = (const __CFString *)v63[2].info;
      }
    }
    else
    {
      uint64_t v64 = calendar;
      CFDateRef v65 = v142;
    }
    int v104 = Integer & extractInteger(data, &at);
    CFStringRef info = (const __CFString *)DDResultGetSubresultWithType((uint64_t)v56, @"DayNumber");
    if (info)
    {
      CFStringRef v106 = info;
      CFStringRef info = (const __CFString *)info[2].data;
      uint64_t v107 = v139;
      if (!info) {
        CFStringRef info = (const __CFString *)v106[2].info;
      }
    }
    else
    {
      uint64_t v107 = v139;
    }
    if ((v104 & extractInteger(info, (_DWORD *)&v148 + 3)) != 1)
    {
      uint64_t v25 = 0;
      goto LABEL_201;
    }
    *(_DWORD *)CFGregorianUnits buf = 0;
    DWORD2(v14_Block_object_dispose(&STACK[0x600], 8) = 0;
    MEMORY[0x19F3B1AA0](v65);
    CFCalendarDecomposeAbsoluteTime(v64, v108, "yM", buf, (char *)&v148 + 8);
    uint64_t v109 = v150;
    if (v58 == -1)
    {
      int v110 = (int)v151;
      if (v150 != -1) {
        int v110 = (int)v150;
      }
      int v111 = v110 - DWORD2(v148);
      if (v111 > -3) {
        uint64_t v58 = *(_DWORD *)buf - (v111 > 10);
      }
      else {
        uint64_t v58 = (*(_DWORD *)buf + 1);
      }
    }
    uint64_t v117 = LODWORD(at);
    if (SLODWORD(at) <= SHIDWORD(v148))
    {
      if (v150 == -1)
      {
        uint64_t v109 = v151;
        LODWORD(v150) = v151;
      }
      else
      {
        LODWORD(v151) = v150;
      }
    }
    else if (v150 == -1)
    {
      uint64_t v109 = v151;
      LODWORD(v150) = v151 + 1;
      if (v151 == 12)
      {
        LODWORD(v150) = 1;
        uint64_t v118 = v58;
        uint64_t v109 = 12;
        uint64_t v58 = (v58 + 1);
        goto LABEL_192;
      }
    }
    else
    {
      uint64_t v109 = (v150 - 1);
      LODWORD(v151) = v150 - 1;
      if (v150 == 1)
      {
        uint64_t v109 = 12;
        LODWORD(v151) = 12;
        uint64_t v118 = (v58 - 1);
LABEL_192:
        if (v137) {
          BOOL *v137 = 1;
        }
        *(void *)CFGregorianUnits buf = 0;
        if (!v140)
        {
          uint64_t v25 = 1;
          goto LABEL_198;
        }
        uint64_t v25 = CFCalendarComposeAbsoluteTime(v64, (CFAbsoluteTime *)buf, "yMdHms", v118, v109, v117, 12, 0, 0);
        if (v25)
        {
          *uint64_t v140 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
LABEL_198:
          if (v107)
          {
            uint64_t v25 = CFCalendarComposeAbsoluteTime(v64, (CFAbsoluteTime *)buf, "yMdHms", v58, v150, HIDWORD(v148), 12, 0, 0);
            if (v25) {
              *uint64_t v107 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
            }
          }
        }
LABEL_201:
        int v38 = calendar;
        CFDateRef v39 = v142;
        goto LABEL_248;
      }
    }
    uint64_t v118 = v58;
    goto LABEL_192;
  }
  *((void *)&v148 + 1) = 0;
  DWORD1(v14_Block_object_dispose(&STACK[0x600], 8) = 0;
  CFDateRef v39 = v142;
  MEMORY[0x19F3B1AA0](v142);
  int v38 = calendar;
  CFCalendarDecomposeAbsoluteTime(calendar, v41, "yMd", (char *)&v148 + 4, (char *)&v148 + 8, (char *)&v148 + 12);
  __int16 v42 = DDResultGetSubresultWithType((uint64_t)v31, @"Date");
  CFTimeZoneRef v26 = v34;
  if (!v42
    || (__int16 v43 = v42,
        DDResultExtractDayMonthYear((uint64_t)v42, v29, calendar, (_DWORD *)&v148 + 3, (_DWORD *)&v148 + 2, (_DWORD *)&v148 + 1, (uint64_t)v142, v34)))
  {
    LODWORD(v14_Block_object_dispose(&STACK[0x600], 8) = 0;
    uint64_t v146 = 0;
    memset(v147, 0, sizeof(v147));
    CFTypeRef v150 = 0;
    CFDateRef v151 = 0;
    unsigned int v44 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"BeginTime");
    uint64_t v45 = (uint64_t)DDResultGetSubresultWithType((uint64_t)v44, @"Time");
    CFNumberRef v46 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"EndTime");
    uint64_t v47 = (uint64_t)DDResultGetSubresultWithType((uint64_t)v46, @"Time");
    if (v47 | v45)
    {
      uint64_t v48 = v47;
      CFLocaleRef v49 = v29;
      uint64_t v50 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"TimeZone");
      os_signpost_id_t v136 = a4;
      uint64_t v51 = v31;
      if (v50) {
        CFTimeZoneRef v52 = DDCreateTimeZoneWithResult((uint64_t)v50);
      }
      else {
        CFTimeZoneRef v52 = 0;
      }
      int v81 = DDResultGetSubresultWithType(v48, @"Meridian");
      NSUInteger v82 = DDResultGetSubresultWithType(v45, @"Meridian");
      NSUInteger v83 = DDResultGetSubresultWithType(v45, @"Hours");
      signed int v84 = -1;
      uint64_t v134 = (uint64_t)v81;
      if (v81 || !v45)
      {
        CFStringRef v31 = v51;
        CFLocaleRef v85 = v49;
        int v38 = calendar;
      }
      else
      {
        CFStringRef v31 = v51;
        CFLocaleRef v85 = v49;
        int v38 = calendar;
        if (v83)
        {
          NSUInteger v86 = DDResultGetSubresultWithType((uint64_t)v31, @"Minutes");
          *(_DWORD *)CFGregorianUnits buf = 0;
          if (v86)
          {
            BOOL v87 = v86;
            CFStringRef v88 = v86[10];
            if (!v88) {
              CFStringRef v88 = v87[9];
            }
            if ((extractInteger(v88, buf) & 1) == 0)
            {
              if (v52) {
                CFRelease(v52);
              }
              uint64_t v25 = 0;
              goto LABEL_248;
            }
          }
          id v89 = DDResultGetSubresultWithType(v48, @"Hours");
          signed int v84 = hourValueForHourAndMeridianResult((uint64_t)v83, (uint64_t)v89, v85, (uint64_t)v82, 0xFFFFFFFF, -1, -1, 0, *(_DWORD *)buf == 0);
        }
      }
      if (v48)
      {
        int v96 = extractHourMinuteSecondWithRefCopyTimeZone(v48, (uint64_t)v83, v85, v147, (_DWORD *)&v146 + 1, &v146, (CFTimeZoneRef *)&v150, 0xFFFFFFFF, v84, -1, (uint64_t)v82);
        if (v45)
        {
          NSUInteger v97 = DDResultGetSubresultWithType(v48, @"Hours");
          if (v96)
          {
            if (((int)v146 + HIDWORD(v146) < 0) ^ __OFADD__(v146, HIDWORD(v146)) | (v146
                                                                                           + HIDWORD(v146) == 0))
              unsigned int v98 = v147[0];
            else {
              unsigned int v98 = v147[0] + 1;
            }
            int v99 = extractHourMinuteSecondWithRefCopyTimeZone(v45, (uint64_t)v97, v85, (int *)&v148, &v147[2], &v147[1], &v151, v98, -1, -1, v134);
            int v96 = 1;
            goto LABEL_125;
          }
LABEL_102:
          uint64_t v72 = v140;
          int v99 = extractHourMinuteSecondWithRefCopyTimeZone(v45, (uint64_t)v97, v85, (int *)&v148, &v147[2], &v147[1], &v151, 0xFFFFFFFF, -1, -1, (uint64_t)v82);
          int v96 = 0;
          goto LABEL_126;
        }
      }
      else
      {
        if (v45)
        {
          NSUInteger v97 = 0;
          goto LABEL_102;
        }
        int v96 = 0;
      }
      MEMORY[0x19F3B1AA0](v142);
      CFCalendarDecomposeAbsoluteTime(v38, v112, "Hm", &v148, &v147[2]);
      int v99 = 0;
      v147[1] = 0;
LABEL_125:
      uint64_t v72 = v140;
LABEL_126:
      if (v52)
      {
        if (v151) {
          CFRelease(v151);
        }
        if (v150) {
          CFRelease(v150);
        }
        CFRetain(v52);
        CFTypeRef v150 = v52;
        CFDateRef v151 = v52;
      }
      else
      {
        if (v151 || !v150)
        {
          a4 = v136;
          if (v151 && !v150) {
            CFTypeRef v150 = CFRetain(v151);
          }
          goto LABEL_136;
        }
        CFDateRef v151 = (CFDateRef)CFRetain(v150);
      }
      a4 = v136;
LABEL_136:
      if (v96 | v99)
      {
        if (v99)
        {
          if (!v96)
          {
            v147[0] = ((int)v148 + 1) % 24;
            uint64_t v146 = *(void *)&v147[1];
          }
        }
        else
        {
          LODWORD(v14_Block_object_dispose(&STACK[0x600], 8) = (v147[0] - 1) % 24;
          *(void *)&v147[1] = v146;
        }
LABEL_152:
        if (v151) {
          CFCalendarSetTimeZone(v38, v151);
        }
        *(void *)CFGregorianUnits buf = 0;
        uint64_t v25 = CFCalendarComposeAbsoluteTime(v38, (CFAbsoluteTime *)buf, "yMdHms", DWORD1(v148), DWORD2(v148), HIDWORD(v148), v148, v147[2], v147[1]);
        if (v25)
        {
          if (v72) {
            CFDateRef *v72 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
          }
          if (a4 && v151) {
            *a4 = CFRetain(v151);
          }
          if (!v139) {
            goto LABEL_167;
          }
          if (v150) {
            CFCalendarSetTimeZone(v38, (CFTimeZoneRef)v150);
          }
          CFAbsoluteTime at = 0.0;
          uint64_t v25 = CFCalendarComposeAbsoluteTime(v38, &at, "yMdHms", DWORD1(v148), DWORD2(v148), HIDWORD(v148), v147[0], HIDWORD(v146), v146);
          if (v25)
          {
            CFAbsoluteTime v114 = at;
            if (*(double *)buf > at)
            {
              CFCalendarAddComponents(v38, &at, 0, "d", at, *(double *)buf, 1);
              CFAbsoluteTime v114 = at;
            }
            CFTypeRef *v139 = CFDateCreate(0, v114);
LABEL_167:
            if (v138 && v150) {
              CFTypeRef *v138 = CFRetain(v150);
            }
            if (v137) {
              BOOL *v137 = 0;
            }
          }
        }
LABEL_172:
        if (v151) {
          CFRelease(v151);
        }
        CFTimeZoneRef v115 = (CFTimeZoneRef)v150;
        CFDateRef v39 = v142;
        if (v150) {
          goto LABEL_247;
        }
        goto LABEL_248;
      }
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      NSRange v113 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        if (v48) {
          uint64_t v132 = *(void *)(v48 + 72);
        }
        else {
          uint64_t v132 = 0;
        }
        *(_DWORD *)CFGregorianUnits buf = 138412290;
        *(void *)&uint8_t buf[4] = v132;
        _os_log_error_impl(&dword_19DC95000, v113, OS_LOG_TYPE_ERROR, "Could not extract end time from %@", buf, 0xCu);
      }
      if (v151)
      {
        CFRelease(v151);
        CFDateRef v151 = 0;
      }
      if (v150)
      {
        CFRelease(v150);
        uint64_t v25 = 0;
        CFTypeRef v150 = 0;
        goto LABEL_172;
      }
LABEL_147:
      uint64_t v25 = 0;
      goto LABEL_172;
    }
    BOOL v66 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"BeginHour");
    uint64_t v67 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"EndHour");
    uint64_t v25 = 0;
    if (!v66) {
      goto LABEL_172;
    }
    uint64_t v68 = (uint64_t)v67;
    if (!v67) {
      goto LABEL_172;
    }
    CFGregorianDate v69 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"Meridian");
    if (!v69) {
      CFGregorianDate v69 = DDResultGetSubresultWithType((uint64_t)v31, @"ApproxTime");
    }
    LODWORD(v14_Block_object_dispose(&STACK[0x600], 8) = hourValueForHourAndMeridianResult((uint64_t)v66, v68, v29, 0, 0xFFFFFFFF, -1, -1, 0, 1);
    int v70 = hourValueForHourAndMeridianResult(v68, (uint64_t)v66, v29, (uint64_t)v69, 0xFFFFFFFF, v148, -1, 0, 1);
    v147[0] = v70;
    int v71 = v148 | v70;
    if (v70 >= (int)v148)
    {
      uint64_t v72 = v140;
      if (v70 - (int)v148 < 13) {
        goto LABEL_121;
      }
      int v73 = v148 + 12;
    }
    else
    {
      uint64_t v72 = v140;
      if ((int)v148 < 13)
      {
        v147[0] = v70 + 12;
LABEL_121:
        if ((v71 & 0x80000000) == 0) {
          goto LABEL_152;
        }
        goto LABEL_147;
      }
      int v73 = v148 - 12;
    }
    LODWORD(v14_Block_object_dispose(&STACK[0x600], 8) = v73;
    goto LABEL_121;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  __int16 v74 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v131 = v43[9];
    *(_DWORD *)CFGregorianUnits buf = 138412290;
    *(void *)&uint8_t buf[4] = v131;
    _os_log_error_impl(&dword_19DC95000, v74, OS_LOG_TYPE_ERROR, "Could not extract date from %@", buf, 0xCu);
  }
  CFRelease(v142);
  CFRelease(v34);
  CFRelease(calendar);
  return 0;
}

uint64_t _DDResultCopyImplicitDateFromReferenceDateWithLocale(uint64_t a1, int a2, const __CFLocale *a3, __CFCalendar *a4, const void *a5, const void *a6, const void *a7, const __CFTimeZone *a8, BOOL *a9, CFTypeRef *a10, void *a11, CFDateRef *a12, CFTypeRef *a13)
{
  if (a11) {
    *a11 = 0;
  }
  char v36 = 0;
  if (a9) {
    CFCalendarRef v17 = a9;
  }
  else {
    CFCalendarRef v17 = (BOOL *)&v36;
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  if (a12) {
    uint64_t v18 = a12;
  }
  else {
    uint64_t v18 = (CFDateRef *)&v35;
  }
  if (a13) {
    CFTimeZoneRef v19 = a13;
  }
  else {
    CFTimeZoneRef v19 = (CFTypeRef *)&v34;
  }
  uint64_t v20 = DDResultCopyExtractedDateFromReferenceDateWithLocale(a1, a3, a5, a6, v17, v18, a13);
  if (v20)
  {
    if (!a10 || !*v18) {
      goto LABEL_26;
    }
    *a10 = 0;
    if (a2)
    {
      if (*v19) {
        CFTimeZoneRef v21 = (const __CFTimeZone *)*v19;
      }
      else {
        CFTimeZoneRef v21 = a8;
      }
      CFCalendarSetTimeZone(a4, v21);
      CFAbsoluteTime at = MEMORY[0x19F3B1AA0](*v18);
      CFCalendarAddComponents(a4, &at, 0, "H", 1);
      CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFAbsoluteTime v23 = at;
    }
    else
    {
      if (!*v17)
      {
        CFDateRef v24 = (const __CFDate *)CFRetain(a7);
LABEL_21:
        *a10 = v24;
        if (!v24) {
          goto LABEL_26;
        }
LABEL_22:
        CFComparisonResult v25 = CFDateCompare(v24, *v18, 0);
        uint64_t v26 = 1;
        if (a2) {
          uint64_t v26 = -1;
        }
        if (v25 == v26)
        {
          CFRelease(*a10);
          *a10 = 0;
        }
LABEL_26:
        if (v19 == a13) {
          goto LABEL_29;
        }
        goto LABEL_27;
      }
      uint64_t v32 = 0;
      unsigned int v31 = 0;
      if (*v19) {
        CFTimeZoneRef v29 = (const __CFTimeZone *)*v19;
      }
      else {
        CFTimeZoneRef v29 = a8;
      }
      CFCalendarSetTimeZone(a4, v29);
      MEMORY[0x19F3B1AA0](a7);
      if (!CFCalendarDecomposeAbsoluteTime(a4, v30, "yMd", &v31, &v32, (char *)&v32 + 4))
      {
        CFDateRef v24 = (const __CFDate *)*a10;
        if (!*a10) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      CFAbsoluteTime at = 0.0;
      CFCalendarComposeAbsoluteTime(a4, &at, "yMdHms", v31, v32, HIDWORD(v32), 12, 0, 0);
      CFAbsoluteTime v23 = at;
      CFAllocatorRef v22 = 0;
    }
    CFDateRef v24 = CFDateCreate(v22, v23);
    goto LABEL_21;
  }
LABEL_27:
  if (*v19)
  {
    CFRelease(*v19);
    *CFTimeZoneRef v19 = 0;
  }
LABEL_29:
  BOOL v27 = v18 != a12 || v20 == 0;
  if (v27 && *v18)
  {
    CFRelease(*v18);
    *uint64_t v18 = 0;
  }
  return v20;
}

BOOL resultIsPartial(const __CFString **a1)
{
  CFStringRef SubresultWithType = a1;
  if (a1 && _typesAreEqual(a1[8], @"DateTime")) {
    CFStringRef SubresultWithType = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"Date");
  }
  if (DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"PartialDate")
    || DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"RelativeDayOfWeek"))
  {
    return 1;
  }
  CFAllocatorRef v3 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"Date");
  return DDResultGetSubresultWithType((uint64_t)v3, @"RelativeDayOfWeek") != 0;
}

CFStringRef DDResultCopyExtractedURL(uint64_t a1)
{
  return DDResultCopyExtractedURLWithOptions(a1, 1);
}

CFStringRef DDResultCopyCleanPhoneNumber(uint64_t a1)
{
  CFStringRef SubresultWithType = DDResultGetSubresultWithType(a1, @"Value");
  if (!SubresultWithType) {
    return 0;
  }
  CFStringRef v3 = SubresultWithType[9];
  if (v3)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex Length = CFStringGetLength(SubresultWithType[9]);
    MutableCFArrayRef Copy = CFStringCreateMutableCopy(v4, Length, v3);
    CFStringRef v3 = DDResultCopyStrippedPhoneNumber(MutableCopy);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if (CFStringGetLength(v3) >= 4 && (CFStringHasPrefix(v3, @"112") || CFStringHasPrefix(v3, @"911")))
    {
      CFStringRef v7 = 0;
      CFMutableStringRef v8 = (CFMutableStringRef)v3;
LABEL_9:
      CFRelease(v8);
      return v7;
    }
    uint64_t v10 = DDResultGetSubresultWithType(a1, @"Extension");
    uint64_t v11 = DDResultGetSubresultWithType((uint64_t)v10, @"Value");
    if (v11)
    {
      CFStringRef v12 = v11[9];
      if (v12)
      {
        CFIndex v13 = CFStringGetLength(v11[9]);
        CFMutableStringRef v8 = CFStringCreateMutableCopy(v4, v13, v12);
        CFStringTrimWhitespace(v8);
        v17.CFIndex length = CFStringGetLength(v8);
        v17.uint64_t location = 0;
        CFStringFindAndReplace(v8, @"p", @",", v17, 0x100uLL);
        if (CFStringGetLength(v8) < 1)
        {
          CFStringRef v7 = v3;
          goto LABEL_9;
        }
        int CharacterAtIndex = CFStringGetCharacterAtIndex(v8, 0);
        if (CharacterAtIndex == 44 || CharacterAtIndex == 59) {
          CFStringRef v16 = CFStringCreateWithFormat(v4, 0, @"%@%@", v3, v8);
        }
        else {
          CFStringRef v16 = CFStringCreateWithFormat(v4, 0, @"%@;%@", v3, v8);
        }
        CFStringRef v7 = v16;
        CFRelease(v8);
        CFMutableStringRef v8 = (CFMutableStringRef)v3;
        if (v7) {
          goto LABEL_9;
        }
      }
    }
  }
  return v3;
}

CFStringRef DDResultCopyStrippedPhoneNumber(__CFString *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!CFStringHasPrefix(a1, @"(0)"))
  {
    v17.CFIndex length = CFStringGetLength(a1);
    v17.uint64_t location = 0;
    CFStringFindAndReplace(a1, @"(0)", &stru_1EF034530, v17, 0);
  }
  uint64_t Length = CFStringGetLength(a1);
  CFIndex v3 = Length;
  if (Length < 21)
  {
    CFAllocatorRef v4 = v13;
    v16.uint64_t location = 0;
    v16.CFIndex length = Length;
    CFStringGetCharacters(a1, v16, v13);
    if (v3 <= 0) {
      return CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13, 0);
    }
  }
  else
  {
    CFAllocatorRef v4 = (UniChar *)malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
    v15.uint64_t location = 0;
    v15.CFIndex length = v3;
    CFStringGetCharacters(a1, v15, v4);
  }
  uint64_t v5 = 0;
  int v6 = 0;
  CFIndex v7 = 0;
  uint64_t v8 = 1;
  do
  {
    int v9 = v4[v5];
    if (v6)
    {
      int v6 = 1;
      uint64_t v10 = v8;
LABEL_32:
      v4[v7++] = v9;
      goto LABEL_33;
    }
    uint64_t v10 = 0;
    if (v4[v5] > 0xFF07u)
    {
      int v6 = 0;
      switch(v4[v5])
      {
        case 0xFF08u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 40;
          goto LABEL_31;
        case 0xFF09u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 41;
          goto LABEL_31;
        case 0xFF0Au:
        case 0xFF0Cu:
        case 0xFF0Du:
        case 0xFF0Eu:
        case 0xFF0Fu:
          goto LABEL_32;
        case 0xFF0Bu:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 43;
          goto LABEL_31;
        case 0xFF10u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 48;
          goto LABEL_31;
        case 0xFF11u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 49;
          goto LABEL_31;
        case 0xFF12u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 50;
          goto LABEL_31;
        case 0xFF13u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 51;
          goto LABEL_31;
        case 0xFF14u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 52;
          goto LABEL_31;
        case 0xFF15u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 53;
          goto LABEL_31;
        case 0xFF16u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 54;
          goto LABEL_31;
        case 0xFF17u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 55;
          goto LABEL_31;
        case 0xFF18u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 56;
          goto LABEL_31;
        case 0xFF19u:
          uint64_t v10 = 0;
          int v6 = 0;
          LOWORD(v9) = 57;
          goto LABEL_31;
        default:
          goto LABEL_37;
      }
      goto LABEL_32;
    }
    if (v4[v5] > 0x2011u)
    {
      int v6 = 0;
      if ((v9 - 8210) < 3)
      {
        uint64_t v10 = 0;
        int v6 = 0;
        LOWORD(v9) = 45;
LABEL_31:
        v4[v5] = v9;
      }
      goto LABEL_32;
    }
    if (v9 != 32)
    {
      if (v9 == 38 || v9 == 63)
      {
        uint64_t v10 = 0;
        int v6 = 1;
      }
      else
      {
LABEL_37:
        int v6 = 0;
      }
      goto LABEL_32;
    }
    int v6 = 0;
    uint64_t v10 = 1;
    if (!v8)
    {
      LOWORD(v9) = 32;
      goto LABEL_32;
    }
LABEL_33:
    ++v5;
    uint64_t v8 = v10;
  }
  while (v3 != v5);
  CFStringRef v11 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, v7);
  if (v4 != v13) {
    free(v4);
  }
  return v11;
}

CFStringRef DDCopyPunycodedWebURLString(const __CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    uint64_t result = (const __CFString *)DDCreatePunycodedString(result, 1, 1, 0);
    if (!result)
    {
      CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      return CFStringCreateCopy(v2, v1);
    }
  }
  return result;
}

uint64_t DDResultCopyPhoneValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3)
{
  return DDResultCopyValueLabelValue(a1, a2, a3, 0);
}

uint64_t DDResultCopyValueLabelValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3, int a4)
{
  if (a2)
  {
    uint64_t result = (uint64_t)DDResultCopyCleanPhoneNumber(a1);
    if (!result) {
      return result;
    }
    int v9 = (const void *)result;
    if (!CFStringGetLength((CFStringRef)result))
    {
      CFRelease(v9);
      return 0;
    }
    *a2 = v9;
  }
  if (a3)
  {
    CFStringRef SubresultWithType = DDResultGetSubresultWithType(a1, @"Label");
    if (SubresultWithType)
    {
      CFStringRef v11 = SubresultWithType[10];
      if (v11 || (CFStringRef v11 = SubresultWithType[9]) != 0)
      {
        if (CFStringGetLength(v11))
        {
          *a3 = CFStringCreateCopy(0, v11);
          return 1;
        }
      }
    }
    if (!a4)
    {
      *a3 = 0;
      return 1;
    }
    if (a2)
    {
      CFRelease(*a2);
      uint64_t result = 0;
      *a2 = 0;
      return result;
    }
    return 0;
  }
  return 1;
}

uint64_t DDResultCopyMailValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3)
{
  return DDResultCopyValueLabelValue(a1, a2, a3, 0);
}

uint64_t DDResultCopyIMScreenNameValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3)
{
  return DDResultCopyValueLabelValue(a1, a2, a3, 1);
}

BOOL DDResultIsValidPhoneNumberString(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if (DDResultIsValidPhoneNumberString_onceToken != -1) {
    dispatch_once(&DDResultIsValidPhoneNumberString_onceToken, &__block_literal_global_21);
  }
  if (!DDResultIsValidPhoneNumberString_frameworkAvailable) {
    return 0;
  }
  if (getLocaleForExtraction_sOnce != -1) {
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
  }
  if (_sLocaleForExtraction) {
    CFLocaleGetValue((CFLocaleRef)_sLocaleForExtraction, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
  }
  uint64_t v1 = CFPhoneNumberCreate();
  if (!v1) {
    return 0;
  }
  CFAllocatorRef v2 = (const void *)v1;
  CFStringRef v3 = (const __CFString *)CFPhoneNumberCopyNumberForInternationalAssist();
  if (v3)
  {
    CFStringRef v4 = v3;
    BOOL v5 = CFStringGetLength(v3) < 6 || PNIsValidPhoneNumberForCountry();
    CFRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

void __DDResultIsValidPhoneNumberString_block_invoke()
{
  if (MEMORY[0x1E4F5CC10]) {
    BOOL v0 = MEMORY[0x1E4F5CC38] == 0;
  }
  else {
    BOOL v0 = 1;
  }
  char v2 = !v0 && MEMORY[0x1E4F5CC28] != 0;
  DDResultIsValidPhoneNumberString_frameworkAvailable = v2;
}

BOOL DDResultIsValidPhoneNumber(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeRef cf = 0;
  DDResultCopyValueLabelValue(a1, &cf, 0, 0);
  if (!cf) {
    return 0;
  }
  BOOL IsValidPhoneNumberString = DDResultIsValidPhoneNumberString((uint64_t)cf);
  CFRelease(cf);
  return IsValidPhoneNumberString;
}

uint64_t DDResultCopyFullAddressComponents(uint64_t a1, const __CFString **a2, const __CFString **a3, const __CFString **a4, const __CFString **a5, const __CFString **a6)
{
  if (a2)
  {
    CFStringRef SubresultWithType = DDResultGetSubresultWithType(a1, @"Street");
    if (!SubresultWithType)
    {
      *a2 = 0;
      goto LABEL_8;
    }
    CFIndex v13 = SubresultWithType;
    CFStringRef v14 = SubresultWithType[10];
    if (v14)
    {
      *a2 = v14;
    }
    else
    {
      CFStringRef v14 = v13[9];
      *a2 = v14;
      if (!v14) {
        goto LABEL_8;
      }
    }
    CFRetain(v14);
  }
LABEL_8:
  if (!a3) {
    goto LABEL_15;
  }
  CFRange v15 = DDResultGetSubresultWithType(a1, @"City");
  if (!v15)
  {
    *a3 = 0;
    goto LABEL_15;
  }
  CFRange v16 = v15;
  CFStringRef v17 = v15[10];
  if (v17)
  {
    *a3 = v17;
  }
  else
  {
    CFStringRef v17 = v16[9];
    *a3 = v17;
    if (!v17) {
      goto LABEL_15;
    }
  }
  CFRetain(v17);
LABEL_15:
  if (!a5) {
    goto LABEL_22;
  }
  uint64_t v18 = DDResultGetSubresultWithType(a1, @"ZipCode");
  if (!v18)
  {
    *a5 = 0;
    goto LABEL_22;
  }
  CFTimeZoneRef v19 = v18;
  CFStringRef v20 = v18[10];
  if (v20)
  {
    *a5 = v20;
  }
  else
  {
    CFStringRef v20 = v19[9];
    *a5 = v20;
    if (!v20) {
      goto LABEL_22;
    }
  }
  CFRetain(v20);
LABEL_22:
  if (!a4) {
    goto LABEL_29;
  }
  CFTimeZoneRef v21 = DDResultGetSubresultWithType(a1, @"State");
  if (!v21)
  {
    *a4 = 0;
    goto LABEL_29;
  }
  CFAllocatorRef v22 = v21;
  CFStringRef v23 = v21[10];
  if (v23)
  {
    *a4 = v23;
  }
  else
  {
    CFStringRef v23 = v22[9];
    *a4 = v23;
    if (!v23) {
      goto LABEL_29;
    }
  }
  CFRetain(v23);
LABEL_29:
  if (a6)
  {
    CFDateRef v24 = DDResultGetSubresultWithType(a1, @"Country");
    if (v24)
    {
      CFComparisonResult v25 = v24;
      CFStringRef v26 = v24[10];
      if (v26)
      {
        *a6 = v26;
LABEL_35:
        CFRetain(v26);
        return 1;
      }
      CFStringRef v26 = v25[9];
      *a6 = v26;
      if (v26) {
        goto LABEL_35;
      }
    }
    else
    {
      *a6 = 0;
    }
  }
  return 1;
}

BOOL DDResultIsPartialDateRangeOrTimeRange(uint64_t a1, unsigned char *a2, const __CFString ***a3, const __CFString ***a4, const void *a5, const __CFTimeZone *a6)
{
  CFStringRef v12 = *(const __CFString **)(a1 + 64);
  if (!_typesAreEqual(v12, @"DateDuration"))
  {
    if (!_typesAreEqual(v12, @"TimeDuration"))
    {
      uint64_t v33 = 0;
      int v34 = 1;
      if (!a2)
      {
        char v36 = 1;
        uint64_t SubresultWithType = 0;
        goto LABEL_66;
      }
      char IsPastDate = 0;
      uint64_t SubresultWithType = 0;
      char v36 = 1;
LABEL_38:
      *a2 = IsPastDate;
      goto LABEL_66;
    }
    uint64_t SubresultWithType = (uint64_t)DDResultGetSubresultWithType(a1, @"BeginTime");
    CFStringRef v14 = DDResultGetSubresultWithType(a1, @"EndTime");
    goto LABEL_27;
  }
  uint64_t SubresultWithType = (uint64_t)DDResultGetSubresultWithType(a1, @"BeginDate");
  CFStringRef v14 = DDResultGetSubresultWithType(a1, @"EndDate");
  if (SubresultWithType | (unint64_t)v14)
  {
LABEL_27:
    uint64_t v33 = v14;
    goto LABEL_28;
  }
  CFRange v15 = DDResultGetSubresultWithType(a1, @"Date");
  if (v15)
  {
    CFRange v16 = v15;
    CFStringRef v17 = DDResultGetSubresultWithType(a1, @"TimeDuration");
    uint64_t v55 = 0;
    int v56 = 0;
    uint64_t v18 = DDResultGetSubresultWithType(a1, @"ApproxTime");
    DDResultIsPartialDateRangeOrTimeRange(v17, 0, &v56, &v55, 0, 0);
    if (v56)
    {
      CFStringRef v19 = v16[2];
      CFStringRef v20 = v16[3];
      uint64_t v22 = v56[2];
      uint64_t v21 = v56[3];
      uint64_t v23 = (uint64_t)(int)v19 >> 16;
      uint64_t v24 = (uint64_t)(int)v22 >> 16;
      if (SHIDWORD(v19) >= SHIDWORD(v22)) {
        CFStringRef v25 = (const __CFString *)v56[2];
      }
      else {
        CFStringRef v25 = v16[2];
      }
      if ((int)v23 <= (int)v24) {
        uint64_t v22 = (uint64_t)v25;
      }
      if ((int)v23 >= (int)v24) {
        uint64_t v26 = v22;
      }
      else {
        uint64_t v26 = (uint64_t)v16[2];
      }
      uint64_t v27 = (uint64_t)(int)v20 >> 16;
      uint64_t v28 = (uint64_t)(int)v21 >> 16;
      if (SHIDWORD(v20) >= SHIDWORD(v21)) {
        CFStringRef v29 = v16[3];
      }
      else {
        CFStringRef v29 = (const __CFString *)v56[3];
      }
      BOOL v30 = (int)v27 < (int)v28;
      if ((int)v27 <= (int)v28) {
        uint64_t v31 = (uint64_t)v29;
      }
      else {
        uint64_t v31 = (uint64_t)v16[3];
      }
      if (v30) {
        uint64_t v32 = v56[3];
      }
      else {
        uint64_t v32 = v31;
      }
      uint64_t SubresultWithType = (uint64_t)DDResultCreate(@"DateTime", v26, v32);
      DDResultAddSubresult(SubresultWithType, v16);
      DDResultAddSubresultSorted(SubresultWithType, v56);
      if (v18) {
        DDResultAddSubresultSorted(SubresultWithType, v18);
      }
      CFAutorelease((CFTypeRef)SubresultWithType);
    }
    else
    {
      uint64_t SubresultWithType = 0;
    }
    if (v55)
    {
      CFStringRef v37 = v16[2];
      CFStringRef v38 = v16[3];
      uint64_t v40 = v55[2];
      uint64_t v39 = v55[3];
      uint64_t v41 = (uint64_t)(int)v37 >> 16;
      uint64_t v42 = (uint64_t)(int)v40 >> 16;
      if (SHIDWORD(v37) >= SHIDWORD(v40)) {
        CFStringRef v43 = (const __CFString *)v55[2];
      }
      else {
        CFStringRef v43 = v16[2];
      }
      if ((int)v41 <= (int)v42) {
        uint64_t v40 = (uint64_t)v43;
      }
      if ((int)v41 >= (int)v42) {
        uint64_t v44 = v40;
      }
      else {
        uint64_t v44 = (uint64_t)v16[2];
      }
      uint64_t v45 = (uint64_t)(int)v38 >> 16;
      uint64_t v46 = (uint64_t)(int)v39 >> 16;
      if (SHIDWORD(v38) >= SHIDWORD(v39)) {
        CFStringRef v47 = v16[3];
      }
      else {
        CFStringRef v47 = (const __CFString *)v55[3];
      }
      BOOL v48 = (int)v45 < (int)v46;
      if ((int)v45 <= (int)v46) {
        uint64_t v49 = (uint64_t)v47;
      }
      else {
        uint64_t v49 = (uint64_t)v16[3];
      }
      if (v48) {
        uint64_t v50 = v55[3];
      }
      else {
        uint64_t v50 = v49;
      }
      uint64_t v33 = DDResultCreate(@"DateTime", v44, v50);
      DDResultAddSubresult((uint64_t)v33, v16);
      DDResultAddSubresultSorted((uint64_t)v33, v55);
      if (v18) {
        DDResultAddSubresultSorted((uint64_t)v33, v18);
      }
      CFAutorelease(v33);
    }
    else
    {
      uint64_t v33 = 0;
    }
    int v34 = 0;
    if (!a2) {
      goto LABEL_65;
    }
    goto LABEL_29;
  }
  uint64_t v33 = 0;
  uint64_t SubresultWithType = 0;
LABEL_28:
  int v34 = 1;
  if (a2)
  {
LABEL_29:
    if (!SubresultWithType || v33)
    {
      char v36 = 0;
      if (SubresultWithType || !v33)
      {
        char IsPastDate = 0;
      }
      else
      {
        uint64_t SubresultWithType = 0;
        char v36 = 0;
        char IsPastDate = DDResultIsPastDate((uint64_t)v33, a5, a6) ^ 1;
      }
    }
    else
    {
      char IsPastDate = DDResultIsPastDate(SubresultWithType, a5, a6);
      char v36 = 0;
    }
    goto LABEL_38;
  }
LABEL_65:
  char v36 = 0;
LABEL_66:
  if (a3)
  {
    uint64_t v51 = (const __CFString **)SubresultWithType;
    if (SubresultWithType)
    {
      uint64_t v51 = (const __CFString **)SubresultWithType;
      if (v34)
      {
        uint64_t v51 = DDResultGetSubresultWithType(SubresultWithType, @"DateTime");
        if (!v51)
        {
          uint64_t v51 = DDResultGetSubresultWithType(SubresultWithType, @"Date");
          if (!v51) {
            uint64_t v51 = DDResultGetSubresultWithType(SubresultWithType, @"Time");
          }
        }
      }
    }
    *a3 = v51;
  }
  if (a4)
  {
    CFTimeZoneRef v52 = (const __CFString **)v33;
    if (v33)
    {
      CFTimeZoneRef v52 = (const __CFString **)v33;
      if (v34)
      {
        CFTimeZoneRef v52 = DDResultGetSubresultWithType((uint64_t)v33, @"DateTime");
        if (!v52)
        {
          CFTimeZoneRef v52 = DDResultGetSubresultWithType((uint64_t)v33, @"Date");
          if (!v52) {
            CFTimeZoneRef v52 = DDResultGetSubresultWithType((uint64_t)v33, @"Time");
          }
        }
      }
    }
    *a4 = v52;
  }
  if (v36) {
    return 0;
  }
  if (SubresultWithType && !v33) {
    return 1;
  }
  if (SubresultWithType) {
    BOOL v54 = 1;
  }
  else {
    BOOL v54 = v33 == 0;
  }
  return !v54;
}

BOOL DDResultIsDateRangeOrTimeRange(uint64_t a1, unsigned char *a2)
{
  return DDResultIsPartialDateRangeOrTimeRange(a1, a2, 0, 0, 0, 0);
}

uint64_t DDResultTimeIsApprox(const __CFString **a1)
{
  while (1)
  {
    while (1)
    {
      uint64_t SubresultWithType = a1;
      CFStringRef v2 = a1[8];
      if (_typesAreEqual(v2, @"DateTime"))
      {
        uint64_t SubresultWithType = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"Time");
        if (SubresultWithType) {
          goto LABEL_18;
        }
        return 1;
      }
      if (_typesAreEqual(v2, @"Time")) {
        goto LABEL_18;
      }
      if (!_typesAreEqual(v2, @"DateDuration")) {
        break;
      }
      CFStringRef v3 = @"BeginDate";
      CFStringRef v4 = @"EndDate";
LABEL_7:
      BOOL v5 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, v3);
      int v6 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, v4);
      if (v5)
      {
        a1 = v5;
        if (!v6) {
          continue;
        }
      }
      if (!v5)
      {
        a1 = v6;
        if (v6) {
          continue;
        }
      }
      uint64_t result = 0;
      if (v5)
      {
        if (v6)
        {
          uint64_t result = DDResultTimeIsApprox(v5);
          if (result)
          {
            BOOL v7 = DDResultTimeIsApprox(v6) == 0;
            return !v7;
          }
        }
      }
      return result;
    }
    if (_typesAreEqual(v2, @"TimeDuration"))
    {
      CFStringRef v3 = @"BeginTime";
      CFStringRef v4 = @"EndTime";
      goto LABEL_7;
    }
    if (!_typesAreEqual(v2, @"BeginDate") && !_typesAreEqual(v2, @"EndDate")) {
      break;
    }
    a1 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"DateTime");
    if (!a1) {
      return DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"ApproxTime") != 0;
    }
  }
  if (!_typesAreEqual(v2, @"BeginTime") && !_typesAreEqual(v2, @"EndTime")) {
    return 0;
  }
  uint64_t SubresultWithType = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"Time");
  if (!SubresultWithType) {
    return 0;
  }
LABEL_18:
  BOOL v7 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, @"ApproxTime") == 0;
  return !v7;
}

void DDResultSetCurrentDateForExtraction(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __DDResultSetCurrentDateForExtraction_block_invoke;
  block[3] = &__block_descriptor_tmp_25;
  block[4] = a1;
  if (DDResultSetCurrentDateForExtraction_sOnce != -1) {
    dispatch_once(&DDResultSetCurrentDateForExtraction_sOnce, block);
  }
}

CFTypeRef __DDResultSetCurrentDateForExtraction_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result)
  {
    CFTypeRef result = CFRetain(result);
    _sDateForExtractiouint64_t n = (uint64_t)result;
  }
  return result;
}

CFLocaleRef DDResultSetLocaleForExtraction(const __CFLocale *cf)
{
  CFLocaleRef result = (CFLocaleRef)_sLocaleForExtraction;
  if ((const __CFLocale *)_sLocaleForExtraction != cf)
  {
    if (_sLocaleForExtraction) {
      CFRelease((CFTypeRef)_sLocaleForExtraction);
    }
    _sLocaleForExtractiouint64_t n = (uint64_t)cf;
    if (cf)
    {
      CFLocaleRef System = cf;
    }
    else
    {
      CFLocaleRef result = CFLocaleCopyCurrent();
      _sLocaleForExtractiouint64_t n = (uint64_t)result;
      if (result) {
        return result;
      }
      CFLocaleRef System = CFLocaleGetSystem();
      _sLocaleForExtractiouint64_t n = (uint64_t)System;
    }
    return (CFLocaleRef)CFRetain(System);
  }
  return result;
}

uint64_t DDResultPhysicalUnitExtraction(uint64_t result, double *a2, unint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    CFLocaleRef result = _typesAreEqual(*(CFStringRef *)(result + 64), @"PhysicalAmount");
    if (result) {
      return _DDResultValueUnitExtraction(v5, a2, a3, 0) != 0;
    }
  }
  return result;
}

CFStringRef DDResultCopyAuthCode(CFStringRef result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    CFStringRef v1 = result;
    if (_typesAreEqual((CFStringRef)result[2].isa, @"AuthCode"))
    {
      CFStringRef info = (const __CFString *)v1[2].info;
      CFIndex Length = CFStringGetLength(info);
      CFIndex v4 = Length;
      if (Length >= 3)
      {
        BOOL v5 = 1;
        if (CFStringGetCharacterAtIndex(info, 1) != 45) {
          BOOL v5 = CFStringGetCharacterAtIndex(info, 2) == 45;
        }
        goto LABEL_8;
      }
      if (Length >= 1)
      {
        BOOL v5 = 1;
LABEL_8:
        CFIndex v6 = 0;
        CFIndex v7 = 0;
        do
        {
          int CharacterAtIndex = CFStringGetCharacterAtIndex(info, v6);
          if ((CharacterAtIndex - 48) < 0xA || !v5 && (CharacterAtIndex & 0xFFFFFFDF) - 65 <= 0x19)
          {
            if (v7 > 9) {
              return 0;
            }
            chars[v7++] = CharacterAtIndex;
          }
          ++v6;
        }
        while (v4 != v6);
        if (v7 >= 1) {
          return CFStringCreateWithCharacters(0, chars, v7);
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t DDResultSelectBest(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!a1) {
    return v2;
  }
  uint64_t v3 = a2;
  if (!a2) {
    return v2;
  }
  CFStringRef v5 = *(const __CFString **)(a2 + 64);
  if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), @"DateTime")
    || !_typesAreEqual(v5, @"DateTime")
    || DDResultGetSubresultWithTypePath(a1, @"Date.AbsoluteDate.DayNumber")
    || DDResultGetSubresultWithTypePath(a1, @"Date.AbsoluteDate.AmbiguousDate.DayNumber")
    || !DDResultGetSubresultWithTypePath(v3, @"Date.AbsoluteDate.DayNumber")
    && !DDResultGetSubresultWithTypePath(v3, @"Date.AbsoluteDate.AmbiguousDate.DayNumber"))
  {
    return v2;
  }
  return v3;
}

BOOL DDResultDateExtractionDependsOnContextTense(const __CFString **SubresultWithType)
{
  while (1)
  {
    uint64_t v1 = (uint64_t)SubresultWithType;
    CFStringRef v2 = SubresultWithType[8];
    if (_typesAreEqual(v2, @"RelativeDayOfWeek")) {
      break;
    }
    if (_typesAreEqual(v2, @"Date"))
    {
      uint64_t v3 = v1;
      CFStringRef v4 = @"RelativeDayOfWeek";
      goto LABEL_9;
    }
    if (_typesAreEqual(v2, @"DateTime")) {
      goto LABEL_8;
    }
    if (_typesAreEqual(v2, @"BeginDate") || _typesAreEqual(v2, @"EndDate"))
    {
      uint64_t SubresultWithType = DDResultGetSubresultWithType(v1, @"DateTime");
      if (!SubresultWithType)
      {
LABEL_8:
        uint64_t v3 = v1;
        CFStringRef v4 = @"Date";
        goto LABEL_9;
      }
    }
    else
    {
      if (!_typesAreEqual(v2, @"DateDuration")) {
        return 0;
      }
      uint64_t SubresultWithType = DDResultGetSubresultWithType(v1, @"Date");
      if (!SubresultWithType)
      {
        if (DDResultGetSubresultWithType(v1, @"BeginDate")
          && DDResultDateExtractionDependsOnContextTense())
        {
          return 1;
        }
        uint64_t v3 = v1;
        CFStringRef v4 = @"EndDate";
LABEL_9:
        uint64_t SubresultWithType = DDResultGetSubresultWithType(v3, v4);
        if (!SubresultWithType) {
          return 0;
        }
      }
    }
  }
  return DDResultGetSubresultWithType(v1, @"DayOfWeek") != 0;
}

BOOL DDResultNeedsMeridianGuess(uint64_t a1, uint64_t a2)
{
  if (DDResultGetCategory(a1) != 4) {
    return 0;
  }
  if (a2)
  {
    uint64_t v4 = a2;
  }
  else
  {
    if (getLocaleForExtraction_sOnce != -1) {
      dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
    }
    uint64_t v4 = _sLocaleForExtraction;
  }
  if (localeHasStrict24Hrs(v4)) {
    return 0;
  }
  __int16 v7 = 0;
  _DDResultNeedsMeridianGuess(a1, &v7, (unsigned char *)&v7 + 1);
  if (HIBYTE(v7)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v7 == 0;
  }
  return !v6;
}

BOOL _DDResultNeedsMeridianGuess(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  CFArrayRef v5 = *(const __CFArray **)(a1 + 56);
  if (!v5) {
    return *a3 && *a2 != 0;
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (Count < 1) {
    return *a3 && *a2 != 0;
  }
  CFIndex v7 = Count;
  CFIndex v8 = 0;
  while (1)
  {
    CFArrayRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v5, v8);
    uint64_t v10 = (uint64_t)ValueAtIndex;
    if (*a2) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = ValueAtIndex == 0;
    }
    if (v11 || !_typesAreEqual(ValueAtIndex[8], @"Hours"))
    {
      if (!*a3)
      {
        if (extractMeridianValue(v10, &v15, &v15, &v15, &v15))
        {
          *a3 = 1;
          if (*a2) {
            return 1;
          }
        }
      }
      goto LABEL_22;
    }
    CFStringRef v12 = *(const __CFString **)(v10 + 80);
    if (v12)
    {
      int v16 = 0;
      CFStringRef v13 = v12;
    }
    else
    {
      CFStringRef v12 = *(const __CFString **)(v10 + 72);
      if (!v12) {
        goto LABEL_22;
      }
      int v16 = 0;
      CFStringRef v13 = *(const __CFString **)(v10 + 72);
    }
    if (DDFastIntegerExtraction(v13, &v16) && v16 <= 11)
    {
      *a2 = 1;
      if (*a3) {
        return 1;
      }
      if (CFStringGetLength(v12) >= 1 && CFStringGetCharacterAtIndex(v12, 0) == 48) {
        break;
      }
    }
LABEL_22:
    if (_DDResultNeedsMeridianGuess(v10, a2, a3)) {
      return 1;
    }
    if (v7 == ++v8) {
      return *a3 && *a2 != 0;
    }
  }
  *a3 = 1;
  return 1;
}

uint64_t DDResultCopyDomesticIdentifierValue(uint64_t result, CFMutableStringRef *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  if (result)
  {
    uint64_t v7 = result;
    CFLocaleRef result = _typesAreEqual(*(CFStringRef *)(result + 64), @"DomesticIdentifier");
    if (result)
    {
      CFArrayRef v8 = *(const __CFArray **)(v7 + 56);
      if (v8 && CFArrayGetCount(v8) == 2)
      {
        CFLocaleRef result = (uint64_t)CFArrayGetValueAtIndex(v8, 1);
        if (result)
        {
          uint64_t v9 = result;
          CFLocaleRef result = _typesAreEqual(*(CFStringRef *)(result + 64), @"CountryCode");
          if (result)
          {
            if (a4) {
              *a4 = CFRetain(*(CFTypeRef *)(v9 + 80));
            }
            CFArrayRef ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(v8, 0);
            BOOL v11 = ValueAtIndex;
            if (a3) {
              *a3 = CFRetain(ValueAtIndex[8]);
            }
            if (a2)
            {
              if (v11) {
                CFStringRef v12 = (const __CFString *)v11[9];
              }
              else {
                CFStringRef v12 = 0;
              }
              MutableCFArrayRef Copy = CFStringCreateMutableCopy(0, 30, v12);
              v14.CFIndex length = CFStringGetLength(MutableCopy);
              v14.uint64_t location = 0;
              CFStringFindAndReplace(MutableCopy, @" ", &stru_1EF034530, v14, 0);
              v15.CFIndex length = CFStringGetLength(MutableCopy);
              v15.uint64_t location = 0;
              CFStringFindAndReplace(MutableCopy, @"-", &stru_1EF034530, v15, 0);
              *a2 = MutableCopy;
            }
            return 1;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

CFTypeRef DDResultCopyUPIIdentifierValue(uint64_t a1)
{
  if (!a1 || !_typesAreEqual(*(CFStringRef *)(a1 + 64), @"UPIIdentifier")) {
    return 0;
  }
  CFStringRef v2 = *(const void **)(a1 + 72);

  return CFRetain(v2);
}

id DDResultGetShipmentTrackingUrlWithCarrier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (DDResultGetShipmentTrackingUrlWithCarrier_onceToken != -1) {
    dispatch_once(&DDResultGetShipmentTrackingUrlWithCarrier_onceToken, &__block_literal_global_1708);
  }
  CFArrayRef v5 = 0;
  if (v3 && v4)
  {
    BOOL v6 = (void *)DDResultGetShipmentTrackingUrlWithCarrier_carrierLookupTable;
    uint64_t v7 = [v3 lowercaseString];
    CFArrayRef v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
      uint64_t v10 = [v9 invertedSet];
      BOOL v11 = [v4 componentsSeparatedByCharactersInSet:v10];
      CFStringRef v12 = [v11 componentsJoinedByString:&stru_1EF034530];

      uint64_t v13 = getShipmentTrackingUrlString(v12, v8);
      if (v13)
      {
        CFRange v14 = (void *)v13;
        CFArrayRef v5 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
      }
      else
      {
        CFArrayRef v5 = 0;
      }
      id v4 = v12;
    }
    else
    {
      CFArrayRef v5 = 0;
    }
  }
  else
  {
    CFArrayRef v8 = v3;
  }

  return v5;
}

id getShipmentTrackingUrlString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFArrayRef v5 = v4;
  BOOL v6 = 0;
  if (v3 && v4)
  {
    if ([v3 length] && objc_msgSend(v5, "length"))
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA20] currentLocale];
      CFArrayRef v8 = [v7 objectForKey:*MEMORY[0x1E4F1C400]];
      uint64_t v9 = [v8 lowercaseString];

      if (!v9
        || ![v5 isEqualToString:@"ebay"]
        || (objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"au", @"at", @"ca", @"fr", @"de", @"hk", @"in", @"ie", @"it", @"my", @"nl", @"ph", @"pl", @"sg", @"es", @"ch", @"gb",
              0),
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v10 containsObject:v9],
            v10,
            (v11 & 1) == 0))
      {

        uint64_t v9 = &stru_1EF034530;
      }
      BOOL v6 = [NSString stringWithFormat:@"https://trackingshipment.apple.com/?Company=%@&Locale=%@&TrackingNumber=%@", v5, v9, v3];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

void __DDResultGetShipmentTrackingUrlWithCarrier_block_invoke()
{
  BOOL v0 = (void *)DDResultGetShipmentTrackingUrlWithCarrier_carrierLookupTable;
  DDResultGetShipmentTrackingUrlWithCarrier_carrierLookupTable = (uint64_t)&unk_1EF03BF08;
}

CFTypeRef DDResultGetShipmentTrackingUrlString(uint64_t a1)
{
  if (a1)
  {
    if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"TrackingNumber"))
    {
      id v2 = *(id *)(a1 + 56);
      if ([v2 count] == 1)
      {
        uint64_t v3 = [v2 objectAtIndex:0];
        id v4 = *(id *)(v3 + 64);
        CFArrayRef v5 = *(void **)(v3 + 72);
        BOOL v6 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
        uint64_t v7 = [v6 invertedSet];
        CFArrayRef v8 = [v5 componentsSeparatedByCharactersInSet:v7];
        uint64_t v9 = [v8 componentsJoinedByString:&stru_1EF034530];

LABEL_17:
        uint64_t v21 = getShipmentTrackingUrlString(v9, v4);
        if (v21)
        {
          id v22 = v21;
          CFTypeRef v23 = CFAutorelease(v22);
        }
        else
        {
          id v22 = 0;
          CFTypeRef v23 = 0;
        }

        goto LABEL_23;
      }
LABEL_20:
      CFTypeRef v23 = 0;
LABEL_23:

      return v23;
    }
    if (_typesAreEqual(*(CFStringRef *)(a1 + 64), @"TrackingInformation"))
    {
      id v2 = *(id *)(a1 + 56);
      if ([v2 count] != 2) {
        goto LABEL_20;
      }
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      id v4 = 0;
      char v11 = 1;
      while (1)
      {
        char v12 = v11;
        uint64_t v13 = [v2 objectAtIndex:v10];
        if (v13)
        {
          uint64_t v14 = v13;
          if (_typesAreEqual(*(CFStringRef *)(v13 + 64), @"Carrier"))
          {
            CFRange v15 = *(void **)(v14 + 80);
            if (!v15) {
              CFRange v15 = *(void **)(v14 + 72);
            }
            int v16 = v4;
            id v4 = v15;
            goto LABEL_15;
          }
          if (_typesAreEqual(*(CFStringRef *)(v14 + 64), @"TrackingNumber"))
          {
            CFStringRef v17 = *(void **)(v14 + 72);
            int v16 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
            uint64_t v18 = [v16 invertedSet];
            CFStringRef v19 = [v17 componentsSeparatedByCharactersInSet:v18];
            uint64_t v20 = [v19 componentsJoinedByString:&stru_1EF034530];

            uint64_t v9 = (void *)v20;
LABEL_15:
          }
        }
        char v11 = 0;
        uint64_t v10 = 1;
        if ((v12 & 1) == 0) {
          goto LABEL_17;
        }
      }
    }
  }
  return 0;
}

uint64_t ___dd_dispatch_get_queue_for_read_entitlements_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("dd_source_read_entitlements", 0);
  uint64_t v1 = _dd_dispatch_get_queue_for_read_entitlements_sQueue;
  _dd_dispatch_get_queue_for_read_entitlements_sQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id _dd_dispatch_get_queue_for_writing()
{
  if (_dd_dispatch_get_queue_for_writing_onceToken != -1) {
    dispatch_once(&_dd_dispatch_get_queue_for_writing_onceToken, &__block_literal_global_1929);
  }
  dispatch_queue_t v0 = (void *)_dd_dispatch_get_queue_for_writing_sQueue;

  return v0;
}

void sub_19DCC3BD0(_Unwind_Exception *a1)
{
}

uint64_t ___dd_dispatch_get_queue_for_writing_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("dd_source_write", 0);
  uint64_t v1 = _dd_dispatch_get_queue_for_writing_sQueue;
  _dd_dispatch_get_queue_for_writing_sQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_19DCC43B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1955(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1956(uint64_t a1)
{
}

BOOL DDScannerScanStringFromConversation(BOOL result, __CFString *theString, void *a3)
{
  if (result)
  {
    uint64_t v4 = result;
    if (!theString)
    {
      DDScannerReset(result);
      return 0;
    }
    if (a3)
    {
      uint64_t v14 = 0;
      CFIndex Length = CFStringGetLength(theString);
      BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v7 = theString;
      id v8 = v6;
      id v9 = a3;
      if (v8)
      {
        if (_DDMessageCacheStringForMessage__onceToken != -1) {
          dispatch_once(&_DDMessageCacheStringForMessage__onceToken, &__block_literal_global_1969);
        }
        if ((unint64_t)[(__CFString *)v7 length] <= 0x9C3)
        {
          uint64_t v10 = objc_alloc_init(DDMessageCacheElement);
          [(DDMessageCacheElement *)v10 setDate:v8];
          [(DDMessageCacheElement *)v10 setText:v7];
          char v11 = [(id)_DDMessageCacheStringForMessage__cache stringWithElement:v10 conversationID:v9 range:&v14];

LABEL_15:
          CFStringRef v13 = v11;

          return DDScannerScanStringWithContextOffset(v4, v13, v14);
        }
        [(id)_DDMessageCacheStringForMessage__cache removeConversation:v9];
      }
      uint64_t v14 = 0;
      CFIndex Length = [(__CFString *)v7 length];
      char v11 = v7;
      goto LABEL_15;
    }
    CFIndex v12 = CFStringGetLength(theString);
    return DDScannerScanStringWithRangeAndContextOffset(v4, theString, 0, v12, 0);
  }
  return result;
}

void sub_19DCC5014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1989(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1990(uint64_t a1)
{
}

uint64_t DDDFAScannerGetCFTypeID()
{
  return DDTypeRegister(&DDDFAScannerGetTypeID_typeID);
}

CFStringRef _DDDFAScannerCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDDFAScanner:%p>", a1);
}

CFStringRef _DDDFAScannerCFCopyFormatDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDDFAScanner:%p>", a1);
}

BOOL _DDDFAScannerCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _DDDFAScannerCFFinalize(void *a1)
{
  id v2 = (const void *)a1[4];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[3];
  if (v4)
  {
    CFRelease(v4);
  }
}

void DDDFAScannerEmitResult(const __CFArray *a1, void *a2)
{
  id v2 = a2;
  unint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    goto LABEL_68;
  }
  uint64_t v7 = (uint64_t)(int)v4 >> 16;
  CFStringRef v29 = v2;
  uint64_t v30 = v2[6];
  unint64_t v8 = Count + 1;
  char v9 = 1;
  uint64_t v10 = (uint64_t)(int)v5 >> 16;
  do
  {
    CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex(a1, v8 - 2);
    unint64_t v13 = ValueAtIndex[2];
    unint64_t v12 = ValueAtIndex[3];
    uint64_t v14 = (uint64_t)(int)v12 >> 16;
    unint64_t v15 = HIDWORD(v12);
    if ((int)v7 >= (int)v14 && ((int)v7 > (int)v14 || SHIDWORD(v4) >= SHIDWORD(v12))) {
      break;
    }
    unint64_t v17 = HIDWORD(v13);
    uint64_t v18 = (uint64_t)(int)v13 >> 16;
    if (HIDWORD(v4) == HIDWORD(v13)
      && v7 == v18
      && HIDWORD(v5) == HIDWORD(v12)
      && v10 == v14)
    {
      if (ValueAtIndex[6] >= v30)
      {
        char v9 = 0;
        goto LABEL_66;
      }
    }
    else
    {
      if (SHIDWORD(v4) >= SHIDWORD(v13)) {
        unint64_t v22 = ValueAtIndex[2];
      }
      else {
        unint64_t v22 = v4;
      }
      if ((int)v18 < (int)v7) {
        unint64_t v22 = ValueAtIndex[2];
      }
      if ((int)v18 <= (int)v7) {
        unint64_t v23 = v22;
      }
      else {
        unint64_t v23 = v4;
      }
      if (SHIDWORD(v5) >= SHIDWORD(v12)) {
        unint64_t v24 = v5;
      }
      else {
        unint64_t v24 = ValueAtIndex[3];
      }
      if ((int)v10 > (int)v14) {
        unint64_t v24 = v5;
      }
      if ((int)v10 < (int)v14) {
        unint64_t v24 = ValueAtIndex[3];
      }
      if (HIDWORD(v4) != HIDWORD(v23)
        || v7 != (int)v23 >> 16
        || HIDWORD(v5) != HIDWORD(v24)
        || v10 != (int)v24 >> 16)
      {
        if (SHIDWORD(v4) >= SHIDWORD(v13)) {
          unint64_t v25 = ValueAtIndex[2];
        }
        else {
          unint64_t v25 = v4;
        }
        if ((int)v18 >= (int)v7) {
          unint64_t v13 = v25;
        }
        if ((int)v18 > (int)v7) {
          unint64_t v13 = v4;
        }
        if (SHIDWORD(v5) >= SHIDWORD(v12)) {
          unint64_t v26 = v5;
        }
        else {
          unint64_t v26 = ValueAtIndex[3];
        }
        if ((int)v10 > (int)v14) {
          unint64_t v26 = v5;
        }
        if ((int)v10 >= (int)v14) {
          unint64_t v12 = v26;
        }
        if (v17 == HIDWORD(v13)
          && v18 == (int)v13 >> 16
          && v15 == HIDWORD(v12)
          && v14 == (int)v12 >> 16)
        {
          char v9 = 0;
        }
        goto LABEL_66;
      }
    }
    CFArrayRemoveValueAtIndex(a1, v8 - 2);
LABEL_66:
    --v8;
  }
  while (v8 > 1);
  id v2 = v29;
  if (v9)
  {
LABEL_68:
    CFArrayAppendValue(a1, v2);
  }
}

uint64_t DDDFAScannerSimulateState(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 16);
LABEL_2:
  if (v2 >= v3 - 5 && *(unsigned char *)(a1 + 120))
  {
    *(void *)(a1 + 112) = DDDFAScannerSimulateState;
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(v5 + 56);
  uint64_t v7 = (unsigned __int16 *)(*(void *)(v5 + 48) + 8 * v4);
  uint64_t v8 = *v7;
  BOOL v9 = v4 < *(unsigned __int16 *)(v5 + 32) - 1;
  uint64_t v10 = (unsigned __int16 *)(v5 + 36);
  if (v9) {
    uint64_t v10 = v7 + 4;
  }
  uint64_t v11 = *v10;
  if (!v7[1])
  {
    uint64_t v21 = v2;
    goto LABEL_31;
  }
  uint64_t v12 = *((int *)v7 + 1);
  CFStringRef v13 = *(const __CFString **)(*(void *)(v5 + 40) + 8 * (v7[1] - 1));
  uint64_t v14 = *(void *)(a1 + 40) + v12;
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v14;
  if (v14 >= 0)
  {
    unint64_t v15 = *(unsigned int (**)(void *))(v5 + 72);
    if (v15) {
      BOOL v16 = v2 == v3;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
LABEL_15:
      if (v13)
      {
        CFComparisonResult v18 = CFStringCompare(v13, @"PhoneNumber", 0);
        uint64_t v19 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 56);
        if (v18 == kCFCompareEqualTo
          && !DDResultBufferIsValidForPhoneNumber(*(void *)a1, *(void *)(a1 + 48), v20 - v19, 1, *(unsigned __int8 *)(a1 + 73)))
        {
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v19 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 56);
      }
      uint64_t v22 = *(void *)(a1 + 8) + v20;
      if (*(unsigned char *)(a1 + 72))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        if (*(void *)(a1 + 32)) {
          unint64_t v24 = *(__CFString **)(a1 + 32);
        }
        else {
          unint64_t v24 = &stru_1EF034530;
        }
        unint64_t v25 = DDRootResultCreate(v24, (*(_DWORD *)(a1 + 64) << 16) | (unint64_t)(v19 << 32), (*(_DWORD *)(a1 + 64) << 16) | (unint64_t)(v22 << 32));
        v25[6] = v23;
        DDDFAScannerEmitResult(*(const __CFArray **)(a1 + 96), v25);
        CFRelease(v25);
      }
      else
      {
        uint64_t v26 = v22 - v19;
        if (v22 - v19 > *(void *)(a1 + 88))
        {
          if (CFStringCompare(*(CFStringRef *)(a1 + 32), @"NoResult", 0))
          {
            *(void *)(a1 + 80) = v19;
            *(void *)(a1 + 8_Block_object_dispose(&STACK[0x600], 8) = v26;
          }
          else
          {
            *(_OWORD *)(a1 + 80) = xmmword_19DCCF950;
          }
        }
      }
      goto LABEL_30;
    }
    uint64_t v17 = *(void *)(a1 + 8);
    v33[0] = *(void *)a1;
    v33[1] = v17;
    memset(&v33[3], 0, 24);
    v33[2] = v3;
    v33[6] = v2;
    v33[7] = v2;
    long long v34 = xmmword_19DCCF950;
    BYTE9(v34) = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    if (v15(v33))
    {
      CFStringRef v13 = *(const __CFString **)(a1 + 32);
      goto LABEL_15;
    }
  }
LABEL_30:
  *(void *)(a1 + 40) -= v12;
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 16);
LABEL_31:
  if (v21 != v3)
  {
    uint64_t v27 = *(void *)a1;
    uint64_t v2 = v21 + 1;
    *(void *)(a1 + 56) = v21 + 1;
    if (v11 - v8 >= 1)
    {
      uint64_t v28 = 0;
      unsigned int v29 = *(unsigned __int16 *)(v27 + 2 * v21);
      for (CFIndex i = (unsigned __int16 *)(v6 + 8 * v8 + 2); *(i - 1) <= v29; i += 4)
      {
        if (*i > v29)
        {
          uint64_t v31 = v6 + 8 * v8 + 8 * v28;
          *(void *)(a1 + 40) += *(__int16 *)(v31 + 4);
          *(void *)(a1 + 104) = *(unsigned __int16 *)(v31 + 6);
          goto LABEL_2;
        }
        if (v11 - v8 == ++v28) {
          return 0;
        }
      }
    }
  }
  return 0;
}

uint64_t DDDFAScannerScanQuery(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2[4];
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 32));
  if (v4 < 1)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 0;
    do
    {
      uint64_t v7 = v2[2];
      uint64_t v8 = (CFStringRef *)(v7 + 48 * v5);
      BOOL v9 = (uint64_t *)(v8 + 2);
      CharactersPtr = CFStringGetCharactersPtr(*v8);
      if (CharactersPtr)
      {
        v6 |= DDDFAScannerScanUnicharArrayFragment(a1, (uint64_t)&CharactersPtr[*v9], *(void *)(v7 + 48 * v5 + 24), v5);
      }
      else
      {
        uint64_t v11 = v2;
        uint64_t v12 = *(void *)(v7 + 48 * v5 + 24);
        uint64_t v23 = 1;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v16[0] = buffer;
        v16[1] = 0;
        v16[2] = 0;
        DDDFAScannerFillInitialContext(a1, v5, *v9, *(void *)(a1 + 32), 1, 1, (uint64_t)v16);
        DDDFAScannerComputeResultsForContextWithRebuffering((uint64_t)v8, (uint64_t)v16, buffer);
        if (v12 >= 1)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(unsigned char *)(a1 + 16)) {
              break;
            }
            DDDFAScannerFillInitialContext(a1, v5, i + *v9, *(void *)(a1 + 32), 0, 1, (uint64_t)v16);
            DDDFAScannerComputeResultsForContextWithRebuffering((uint64_t)v8, (uint64_t)v16, buffer);
          }
        }
        uint64_t v2 = v11;
      }
      ++v5;
    }
    while (v5 != v4);
  }
  DDDFAScannerPostprocessResults(a1, v2);
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 32)) > 0) {
    return 1;
  }
  else {
    return v6;
  }
}

CFIndex DDDFAScannerPostprocessResults(uint64_t a1, void *a2)
{
  for (CFIndex i = 0; ; ++i)
  {
    CFIndex result = CFArrayGetCount(*(CFArrayRef *)(a1 + 32));
    if (i >= result) {
      break;
    }
    CFArrayRef ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), i);
    uint64_t v7 = ValueAtIndex;
    uint64_t v8 = *(void (**)(uint64_t *))(*(void *)(a1 + 24) + 80);
    if (v8) {
      v8(ValueAtIndex);
    }
    if (a2) {
      DDResultSetContent(v7, a2);
    }
  }
  return result;
}

BOOL DDDFAScannerScanUnicharArrayFragment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = 0;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  v9[0] = a2;
  v9[1] = 0;
  v9[2] = a3;
  DDDFAScannerFillInitialContext(a1, a4, 0, *(void *)(a1 + 32), 1, 1, (uint64_t)v9);
  (*((void (**)(void *))&v15 + 1))(v9);
  if (a3 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      if (*(unsigned char *)(a1 + 16)) {
        break;
      }
      DDDFAScannerFillInitialContext(a1, a4, v7, *(void *)(a1 + 32), 0, 1, (uint64_t)v9);
      (*((void (**)(void *))&v15 + 1))(v9);
      ++v7;
    }
    while (a3 != v7);
  }
  return CFArrayGetCount(*(CFArrayRef *)(a1 + 32)) > 0;
}

uint64_t DDDFAScannerFillInitialContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7)
{
  uint64_t v10 = *(void *)(a1 + 24);
  *(_OWORD *)(a7 + 80) = xmmword_19DCCF950;
  *(unsigned char *)(a7 + 72) = a6;
  if (a6) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = 0;
  }
  *(void *)(a7 + 96) = v11;
  *(void *)(a7 + 24) = v10;
  *(void *)(a7 + 32) = 0;
  *(void *)(a7 + 40) = 0;
  *(void *)(a7 + 4_Block_object_dispose(&STACK[0x600], 8) = a3;
  *(void *)(a7 + 56) = a3 - *(void *)(a7 + 8);
  *(void *)(a7 + 64) = a2;
  *(unsigned char *)(a7 + 73) = 0;
  if (getLocaleForExtraction_sOnce != -1) {
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_312);
  }
  uint64_t result = _sLocaleForExtraction;
  if (_sLocaleForExtraction)
  {
    uint64_t result = MEMORY[0x19F3B1BA0]();
    if (result)
    {
      uint64_t result = CFStringHasSuffix((CFStringRef)result, @"BR");
      if (result) {
        *(unsigned char *)(a7 + 73) = 1;
      }
    }
  }
  uint64_t v13 = *(void *)(a1 + 24);
  if (a5 || (long long v14 = *(uint64_t (**)(uint64_t))(v13 + 64)) == 0)
  {
    uint64_t v15 = *(unsigned __int16 *)(v13 + 38);
    long long v14 = DDDFAScannerSimulateState;
  }
  else
  {
    uint64_t v15 = -1;
  }
  *(void *)(a7 + 104) = v15;
  *(void *)(a7 + 112) = v14;
  return result;
}

uint64_t DDDFAScannerComputeResultsForContextWithRebuffering(uint64_t a1, uint64_t a2, UniChar *buffer)
{
  do
  {
    uint64_t v6 = *(void *)(a2 + 56);
    if (v6 < 0 || v6 >= *(void *)(a2 + 16) - 5 && *(unsigned char *)(a2 + 120))
    {
      v7.uint64_t location = *(void *)(a2 + 8) + v6;
      *(void *)(a2 + 56) = 0;
      *(void *)(a2 + _Block_object_dispose(&STACK[0x600], 8) = v7.location;
      *(void *)(a2 + 16) = 1024;
      CFIndex v8 = *(void *)(a1 + 24) + *(void *)(a1 + 16);
      if (v7.location + 1024 >= v8)
      {
        char v9 = 0;
        v7.CFIndex length = v8 - v7.location;
        *(void *)(a2 + 16) = v8 - v7.location;
      }
      else
      {
        char v9 = 1;
        v7.CFIndex length = 1024;
      }
      *(unsigned char *)(a2 + 120) = v9;
      CFStringGetCharacters(*(CFStringRef *)a1, v7, buffer);
    }
    uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 112))(a2);
  }
  while (result && *(void *)(a2 + 16) + *(void *)(a2 + 8) < *(void *)(a1 + 24) + *(void *)(a1 + 16));
  return result;
}

BOOL DDDFAScannerScanUnicharArray(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 32));
  BOOL v6 = DDDFAScannerScanUnicharArrayFragment(a1, a2, a3, 0);
  DDDFAScannerPostprocessResults(a1, 0);
  return v6;
}

uint64_t DDDFAScannerFirstResultInUnicharArray(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v24 = 0;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  v17[0] = a2;
  v17[1] = 0;
  uint64_t v9 = a3;
  v17[2] = a3;
  DDDFAScannerFillInitialContext(a1, 0, 0, *(void *)(a1 + 32), 1, 0, (uint64_t)v17);
  (*((void (**)(void *))&v23 + 1))(v17);
  if (*((void *)&v21 + 1) == -1)
  {
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v13 = *(uint64_t (**)(uint64_t))(v12 + 64);
    if (v13)
    {
      uint64_t v14 = -1;
    }
    else
    {
      uint64_t v14 = *(unsigned __int16 *)(v12 + 38);
      uint64_t v13 = DDDFAScannerSimulateState;
    }
    *(void *)&long long v23 = v14;
    *((void *)&v23 + 1) = v13;
    if (a3)
    {
      uint64_t v15 = 0;
      while (!*(unsigned char *)(a1 + 16))
      {
        *(void *)&long long v19 = 0;
        *((void *)&v19 + 1) = v15;
        *(void *)&long long v20 = v15;
        (*((void (**)(void *))&v23 + 1))(v17);
        int v16 = DWORD2(v21);
        if (*((void *)&v21 + 1) != -1)
        {
          *a4 = DWORD2(v21);
          int v10 = v22 + v16;
          goto LABEL_3;
        }
        if (v9 == ++v15) {
          return 0;
        }
      }
    }
    return 0;
  }
  else
  {
    *a4 = 0;
    int v10 = v22;
LABEL_3:
    *a5 = v10;
    return 1;
  }
}

void DDDFAScannerReset(uint64_t a1)
{
  CFArrayRef v1 = *(const __CFArray **)(a1 + 32);
  v2.CFIndex length = CFArrayGetCount(v1);
  v2.uint64_t location = 0;

  CFArrayReplaceValues(v1, v2, 0, 0);
}

CFArrayRef DDDFAScannerCopyResults(uint64_t a1)
{
  return CFArrayCreateCopy(0, *(CFArrayRef *)(a1 + 32));
}

uint64_t DDDFAScannerScanStringWithRange(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return 0;
  }
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    int v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_19DC95000, v10, OS_LOG_TYPE_ERROR, "DDDFAScannerScanStringWithRange called with NULL scanner", v12, 2u);
    }
    return 0;
  }
  if (!a4) {
    return 0;
  }
  CFIndex v8 = *(void **)(a1 + 40);
  if (v8)
  {
    DDScanQueryReset(v8);
    DDScanQueryAddTextFragment(*(void *)(a1 + 40), a2, a3, a4, 0, 0, 0);
    uint64_t v9 = *(void **)(a1 + 40);
  }
  else
  {
    uint64_t v9 = (void *)DDScanQueryCreateFromString(0, a2, a3, a4);
    *(void *)(a1 + 40) = v9;
  }

  return DDDFAScannerScanQuery(a1, v9);
}

uint64_t DDDFAScannerScanString(uint64_t a1, CFStringRef theString)
{
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    return DDDFAScannerScanStringWithRange(a1, theString, 0, Length);
  }
  else
  {
    CFArrayRef v6 = *(const __CFArray **)(a1 + 32);
    v8.CFIndex length = CFArrayGetCount(v6);
    v8.uint64_t location = 0;
    CFArrayReplaceValues(v6, v8, 0, 0);
    return 0;
  }
}

CFStringRef _DDDFACacheCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDDFACache:%p states:%d transitions:%d>", a1, *(unsigned __int16 *)(a1 + 32), *(unsigned __int16 *)(a1 + 36));
}

CFStringRef _DDDFACacheCFCopyFormatDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<DDDFACache:%p states:%d transitions:%d>", a1, *(unsigned __int16 *)(a1 + 32), *(unsigned __int16 *)(a1 + 36));
}

BOOL _DDDFACacheCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void _DDDFACacheCFFinalize(uint64_t a1)
{
  CFRange v2 = *(const void **)(a1 + 88);
  if (v2) {
    CFRelease(v2);
  }
  if (*(_DWORD *)(a1 + 28))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3 && *(_WORD *)(a1 + 34))
    {
      unint64_t v4 = 0;
      do
        CFRelease(*(CFTypeRef *)(*(void *)(a1 + 40) + 8 * v4++));
      while (v4 < *(unsigned __int16 *)(a1 + 34));
      uint64_t v3 = *(void **)(a1 + 40);
    }
    free(v3);
    unsigned int v5 = *(_DWORD *)(a1 + 28);
    if (v5 > 0x3FF)
    {
      float v7 = (float)v5;
      if (v5 >> 20) {
        CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%.2f MB", (float)(v7 * 0.00000095367));
      }
      else {
        CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%.2f KB", (float)(v7 * 0.00097656));
      }
    }
    else
    {
      CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%ld B", *(unsigned int *)(a1 + 28));
    }
    CFRelease(v6);
    if (munmap(*(void **)(a1 + 16), *(unsigned int *)(a1 + 28)) < 0)
    {
      CFRange v8 = __error();
      uint64_t v9 = strerror(*v8);
      DDLogErrD((uint64_t)v9, v10, v11, v12, v13, @"could not munmap file: %s", v9);
    }
  }
}

uint64_t DDExtractKanjiNumber(const __CFString *a1, void *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  if (Length >= 1)
  {
    CFIndex v5 = Length;
    uint64_t v44 = a2;
    CFIndex v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    char v9 = 0;
    char v10 = 0;
    uint64_t v11 = 1;
    while (1)
    {
      if ((v10 & 1) == 0)
      {
        if (v8 > 0xCCCCCCCCCCCCCCBLL) {
          return 0;
        }
        v8 *= 10;
      }
      int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
      uint64_t result = 0;
      BOOL v15 = CharacterAtIndex == 12583 || (CharacterAtIndex - 13312) >> 4 < 0x6BF;
      if (CharacterAtIndex > 20844)
      {
        if (CharacterAtIndex <= 47563)
        {
          if (CharacterAtIndex <= 38645)
          {
            if (CharacterAtIndex > 22234)
            {
              if (CharacterAtIndex > 24335)
              {
                if (CharacterAtIndex != 24336)
                {
                  if (CharacterAtIndex == 30334) {
                    goto LABEL_152;
                  }
                  if (CharacterAtIndex != 33836) {
                    return result;
                  }
LABEL_124:
                  unint64_t v27 = v8 / 10;
                  if (v10) {
                    unint64_t v27 = v8;
                  }
                  if (v27 <= 1) {
                    unint64_t v27 = 1;
                  }
                  uint64_t v28 = 10000 * v27;
                  if (v7 >= (v28 ^ 0x7FFFFFFFFFFFFFFFLL)) {
                    return 0;
                  }
                  uint64_t v8 = 0;
                  v7 += v28;
                  char v10 = 1;
                  uint64_t v11 = 1000;
                  goto LABEL_212;
                }
LABEL_190:
                v8 += 2;
                goto LABEL_212;
              }
              if (CharacterAtIndex != 22235)
              {
                if (CharacterAtIndex != 22769)
                {
                  if (CharacterAtIndex != 24319) {
                    return result;
                  }
LABEL_204:
                  unint64_t v40 = v8 / 10;
                  if (v10) {
                    unint64_t v40 = v8;
                  }
                  if (v40 <= 1) {
                    unint64_t v40 = 1;
                  }
                  uint64_t v26 = 20 * v40;
                  goto LABEL_163;
                }
                goto LABEL_211;
              }
LABEL_111:
              v8 += 4;
              goto LABEL_212;
            }
            if (CharacterAtIndex <= 21316)
            {
              if (CharacterAtIndex != 20845)
              {
                if (CharacterAtIndex != 21313)
                {
                  int v18 = 21315;
                  goto LABEL_80;
                }
LABEL_147:
                unint64_t v31 = v8 / 10;
                if (v10) {
                  unint64_t v31 = v8;
                }
                if (v31 <= 1) {
                  unint64_t v31 = 1;
                }
                uint64_t v32 = 5 * v31;
                goto LABEL_162;
              }
              goto LABEL_181;
            }
            if (CharacterAtIndex == 21317) {
              goto LABEL_99;
            }
            if (CharacterAtIndex == 21324) {
              goto LABEL_142;
            }
            if (CharacterAtIndex != 21442) {
              return result;
            }
            goto LABEL_104;
          }
          if (CharacterAtIndex <= 46159)
          {
            if (CharacterAtIndex > 45347)
            {
              if (CharacterAtIndex != 45348 && CharacterAtIndex != 45367)
              {
                if (CharacterAtIndex != 45796) {
                  return result;
                }
                if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 49455) {
                  return 0;
                }
LABEL_120:
                v8 += 5;
                goto LABEL_212;
              }
              goto LABEL_111;
            }
            if (CharacterAtIndex != 38646 && CharacterAtIndex != 44277)
            {
              if (CharacterAtIndex != 44396) {
                return result;
              }
LABEL_136:
              v8 += 9;
              goto LABEL_212;
            }
            goto LABEL_160;
          }
          if (CharacterAtIndex > 47448)
          {
            if (CharacterAtIndex != 47449)
            {
              if (CharacterAtIndex != 47480)
              {
                if (CharacterAtIndex != 47560) {
                  return result;
                }
                if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 55124) {
                  return 0;
                }
LABEL_142:
                unint64_t v30 = v8 / 10;
                if (v10) {
                  unint64_t v30 = v8;
                }
                if (v30 <= 1) {
                  unint64_t v30 = 1;
                }
                uint64_t v26 = 40 * v30;
                goto LABEL_163;
              }
              goto LABEL_147;
            }
            goto LABEL_181;
          }
          if (CharacterAtIndex == 46160 || CharacterAtIndex == 46168) {
            goto LABEL_190;
          }
          int v20 = 47161;
        }
        else
        {
          if (CharacterAtIndex <= 50667)
          {
            if (CharacterAtIndex > 49463)
            {
              if (CharacterAtIndex > 49827)
              {
                if (CharacterAtIndex == 49828)
                {
                  if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 47932) {
                    return 0;
                  }
                  goto LABEL_204;
                }
                if (CharacterAtIndex == 49901) {
                  goto LABEL_147;
                }
                if (CharacterAtIndex != 50500) {
                  return result;
                }
                if (++v6 >= v5) {
                  return 0;
                }
                int v29 = CFStringGetCharacterAtIndex(a1, v6);
                if (v29 == 55124)
                {
                  unint64_t v21 = v8 / 10;
                  if (v10) {
                    unint64_t v21 = v8;
                  }
                  if (v21 <= 1) {
                    unint64_t v21 = 1;
                  }
                  uint64_t v22 = 90;
                  goto LABEL_219;
                }
                if (v29 != 54857) {
                  return 0;
                }
                goto LABEL_136;
              }
              if (CharacterAtIndex != 49464 && CharacterAtIndex != 49483)
              {
                if (CharacterAtIndex != 49776) {
                  return result;
                }
                unint64_t v21 = v8 / 10;
                if (v10) {
                  unint64_t v21 = v8;
                }
                if (v21 <= 1) {
                  unint64_t v21 = 1;
                }
                uint64_t v22 = 50;
LABEL_219:
                uint64_t v26 = v21 * v22;
LABEL_163:
                if (v7 >= (v26 ^ 0x7FFFFFFFFFFFFFFFLL)) {
                  return 0;
                }
                uint64_t v8 = 0;
                v7 += v26;
                uint64_t v11 = 1;
                char v10 = 1;
                goto LABEL_212;
              }
            }
            else
            {
              if (CharacterAtIndex <= 49323)
              {
                if (CharacterAtIndex == 47564) {
                  goto LABEL_124;
                }
                if (CharacterAtIndex != 47924)
                {
                  int v19 = 48177;
LABEL_51:
                  if (CharacterAtIndex != v19) {
                    return result;
                  }
LABEL_152:
                  unint64_t v33 = v8 / 10;
                  if (v10) {
                    unint64_t v33 = v8;
                  }
                  if (v33 <= 1) {
                    unint64_t v33 = 1;
                  }
                  uint64_t v34 = 100 * v33;
                  if (v7 >= (v34 ^ 0x7FFFFFFFFFFFFFFFLL)) {
                    return 0;
                  }
                  uint64_t v8 = 0;
                  v7 += v34;
                  char v10 = 1;
                  uint64_t v11 = 10;
                  goto LABEL_212;
                }
                goto LABEL_147;
              }
              if (CharacterAtIndex == 49324) {
                goto LABEL_111;
              }
              if (CharacterAtIndex != 49340)
              {
                if (CharacterAtIndex != 49436) {
                  return result;
                }
                if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 47480) {
                  return 0;
                }
LABEL_99:
                unint64_t v25 = v8 / 10;
                if (v10) {
                  unint64_t v25 = v8;
                }
                if (v25 <= 1) {
                  unint64_t v25 = 1;
                }
                uint64_t v26 = 30 * v25;
                goto LABEL_163;
              }
            }
LABEL_104:
            v8 += 3;
            goto LABEL_212;
          }
          if (CharacterAtIndex > 51059)
          {
            if (CharacterAtIndex <= 52831)
            {
              if (CharacterAtIndex != 51060)
              {
                if (CharacterAtIndex != 51068)
                {
                  int v18 = 52380;
LABEL_80:
                  if (CharacterAtIndex != v18) {
                    return result;
                  }
LABEL_81:
                  unint64_t v23 = v8 / 10;
                  if (v10) {
                    unint64_t v23 = v8;
                  }
                  if (v23 <= 1) {
                    unint64_t v23 = 1;
                  }
                  uint64_t v24 = 1000 * v23;
                  if (v7 >= (v24 ^ 0x7FFFFFFFFFFFFFFFLL)) {
                    return 0;
                  }
                  uint64_t v8 = 0;
                  v7 += v24;
                  char v10 = 1;
                  uint64_t v11 = 100;
                  goto LABEL_212;
                }
                CFIndex v16 = v6 + 1;
                if (v6 + 1 >= v5 || CFStringGetCharacterAtIndex(a1, v6 + 1) != 44273) {
                  goto LABEL_211;
                }
LABEL_193:
                v8 += 7;
LABEL_194:
                CFIndex v6 = v16;
                goto LABEL_212;
              }
              CFIndex v16 = v6 + 1;
              if (v6 + 1 < v5 && CFStringGetCharacterAtIndex(a1, v6 + 1) == 47480)
              {
                unint64_t v37 = v8 / 10;
                if (v10) {
                  unint64_t v37 = v8;
                }
                if (v37 <= 1) {
                  unint64_t v37 = 1;
                }
                uint64_t v38 = 70 * v37;
                if (v7 >= (v38 ^ 0x7FFFFFFFFFFFFFFFLL)) {
                  return 0;
                }
                uint64_t v8 = 0;
                v7 += v38;
                char v10 = 1;
                uint64_t v11 = 1;
                goto LABEL_194;
              }
              goto LABEL_190;
            }
            if (CharacterAtIndex > 54615)
            {
              if (CharacterAtIndex != 54616)
              {
                int v35 = 54620;
                goto LABEL_168;
              }
              if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 45208) {
                return 0;
              }
LABEL_211:
              ++v8;
              goto LABEL_212;
            }
            if (CharacterAtIndex == 52832)
            {
              CFIndex v16 = v6;
              goto LABEL_193;
            }
            int v17 = 54036;
LABEL_172:
            if (CharacterAtIndex != v17) {
              return result;
            }
LABEL_173:
            v8 += 8;
            goto LABEL_212;
          }
          if (CharacterAtIndex > 50695)
          {
            if (CharacterAtIndex == 50696)
            {
              if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 49692) {
                return 0;
              }
              unint64_t v39 = v8 / 10;
              if (v10) {
                unint64_t v39 = v8;
              }
              if (v39 <= 1) {
                unint64_t v39 = 1;
              }
              uint64_t v26 = 60 * v39;
              goto LABEL_163;
            }
            if (CharacterAtIndex != 50724)
            {
              if (CharacterAtIndex != 50977) {
                return result;
              }
LABEL_181:
              v8 += 6;
              goto LABEL_212;
            }
            goto LABEL_120;
          }
          if (CharacterAtIndex == 50668)
          {
            if (++v6 >= v5) {
              return 0;
            }
            int v36 = CFStringGetCharacterAtIndex(a1, v6);
            if (v36 != 45919)
            {
              if (v36 == 46304)
              {
                unint64_t v41 = v8 / 10;
                if (v10) {
                  unint64_t v41 = v8;
                }
                if (v41 <= 1) {
                  unint64_t v41 = 1;
                }
                uint64_t v26 = 80 * v41;
                goto LABEL_163;
              }
              if (v36 != 49455) {
                return 0;
              }
              goto LABEL_181;
            }
            goto LABEL_173;
          }
          if (CharacterAtIndex == 50676) {
            goto LABEL_147;
          }
          int v20 = 50689;
        }
        if (CharacterAtIndex != v20) {
          return result;
        }
      }
      else
      {
        if (CharacterAtIndex <= 3663)
        {
          CFIndex v16 = v6;
          switch(CharacterAtIndex)
          {
            case ' ':
            case ',':
            case '.':
              v8 /= 10;
              goto LABEL_212;
            case '!':
            case '""':
            case '#':
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '+':
            case '-':
            case '/':
              return result;
            case '0':
              goto LABEL_160;
            case '1':
              goto LABEL_211;
            case '2':
              goto LABEL_190;
            case '3':
              goto LABEL_104;
            case '4':
              goto LABEL_111;
            case '5':
              goto LABEL_120;
            case '6':
              goto LABEL_181;
            case '7':
              goto LABEL_193;
            case '8':
              goto LABEL_173;
            case '9':
              goto LABEL_136;
            default:
              CFIndex v16 = v6;
              switch(CharacterAtIndex)
              {
                case 2406:
                  goto LABEL_160;
                case 2407:
                  goto LABEL_211;
                case 2408:
                  goto LABEL_190;
                case 2409:
                  goto LABEL_104;
                case 2410:
                  goto LABEL_111;
                case 2411:
                  goto LABEL_120;
                case 2412:
                  goto LABEL_181;
                case 2413:
                  goto LABEL_193;
                case 2414:
                  goto LABEL_173;
                case 2415:
                  goto LABEL_136;
                default:
                  return result;
              }
          }
          return result;
        }
        if (CharacterAtIndex <= 12294)
        {
          if (CharacterAtIndex <= 12031)
          {
            CFIndex v16 = v6;
            switch(CharacterAtIndex)
            {
              case 3664:
                goto LABEL_160;
              case 3665:
                goto LABEL_211;
              case 3666:
                goto LABEL_190;
              case 3667:
                goto LABEL_104;
              case 3668:
                goto LABEL_111;
              case 3669:
                goto LABEL_120;
              case 3670:
                goto LABEL_181;
              case 3671:
                goto LABEL_193;
              case 3672:
                goto LABEL_173;
              case 3673:
                goto LABEL_136;
              default:
                return result;
            }
            return result;
          }
          if (CharacterAtIndex == 12032) {
            goto LABEL_211;
          }
          if (CharacterAtIndex == 12038) {
            goto LABEL_190;
          }
          int v17 = 12043;
          goto LABEL_172;
        }
        if (CharacterAtIndex > 20060)
        {
          if (CharacterAtIndex > 20190)
          {
            if (CharacterAtIndex <= 20840)
            {
              if (CharacterAtIndex == 20191) {
                goto LABEL_81;
              }
              int v19 = 20336;
              goto LABEL_51;
            }
            if (CharacterAtIndex == 20841) {
              goto LABEL_190;
            }
            int v17 = 20843;
            goto LABEL_172;
          }
          if (CharacterAtIndex == 20061) {
            goto LABEL_136;
          }
          if (CharacterAtIndex == 20108) {
            goto LABEL_190;
          }
          if (CharacterAtIndex != 20116) {
            return result;
          }
          goto LABEL_120;
        }
        if (CharacterAtIndex > 19967)
        {
          CFIndex v16 = v6;
          switch(CharacterAtIndex)
          {
            case 19968:
              goto LABEL_211;
            case 19969:
            case 19970:
            case 19972:
            case 19973:
            case 19974:
            case 19976:
              return result;
            case 19971:
              goto LABEL_193;
            case 19975:
              goto LABEL_124;
            case 19977:
              goto LABEL_104;
            default:
              if (CharacterAtIndex == 20004) {
                goto LABEL_190;
              }
              break;
          }
          return result;
        }
        if (CharacterAtIndex != 12295)
        {
          int v35 = 12583;
LABEL_168:
          if (CharacterAtIndex != v35) {
            return result;
          }
          goto LABEL_211;
        }
      }
LABEL_160:
      if (v10)
      {
        uint64_t v32 = 5 * v8;
LABEL_162:
        uint64_t v26 = 2 * v32;
        goto LABEL_163;
      }
      char v10 = 0;
LABEL_212:
      v9 |= v15;
      if (++v6 >= v5)
      {
        if (v9) {
          uint64_t v43 = v11;
        }
        else {
          uint64_t v43 = 1;
        }
        uint64_t v42 = v43 * v8;
        a2 = v44;
        goto LABEL_230;
      }
    }
  }
  uint64_t v7 = 0;
  uint64_t v42 = 0;
LABEL_230:
  if (v7 >= (v42 ^ 0x7FFFFFFFFFFFFFFFLL)) {
    return 0;
  }
  *a2 = v42 + v7;
  return 1;
}

BOOL DDDeletionFilterBlocks_block_invoke_5(int a1, int a2, CFStringRef theString)
{
  return _typesAreEqual(theString, @"QuotedShortPhoneNumber")
      || _typesAreEqual(theString, @"UnquotedShortPhoneNumber");
}

BOOL DDDeletionFilterBlocks_block_invoke_4(int a1, int a2, CFStringRef theString)
{
  return _typesAreEqual(theString, @"QuotedShortPhoneNumber");
}

BOOL DDDeletionFilterBlocks_block_invoke_9(int a1, uint64_t a2, CFStringRef theString)
{
  if (_typesAreEqual(theString, @"DateTime"))
  {
    uint64_t SubresultWithType = DDResultGetSubresultWithType(a2, @"Time");
    if (!SubresultWithType) {
      return 1;
    }
  }
  else
  {
    if (!_typesAreEqual(theString, @"Time")) {
      return 1;
    }
    uint64_t SubresultWithType = (const __CFString **)a2;
  }
  return !timeIsTimeStamp((uint64_t)SubresultWithType);
}

const __CFString **timeIsTimeStamp(uint64_t a1)
{
  uint64_t result = DDResultGetSubresultWithType(a1, @"Seconds");
  if (result)
  {
    CFRange v2 = result;
    CFStringRef v3 = result[10];
    if (v3)
    {
      int v5 = 0;
    }
    else
    {
      if (!v2[9]) {
        return 0;
      }
      int v5 = 0;
      CFStringRef v3 = v2[9];
    }
    if (DDFastIntegerExtraction(v3, &v5)) {
      BOOL v4 = v5 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    return (const __CFString **)!v4;
  }
  return result;
}

CFStringRef *timeIsApprox(CFStringRef *result)
{
  if (result)
  {
    CFArrayRef v1 = (const __CFArray *)result;
    if (CFArrayGetCount((CFArrayRef)result) == 1)
    {
      uint64_t result = (CFStringRef *)CFArrayGetValueAtIndex(v1, 0);
      if (result) {
        return (CFStringRef *)_typesAreEqual(result[8], @"ApproxTime");
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t DDDeletionFilterBlocks_block_invoke_8(uint64_t a1, uint64_t a2)
{
  return 1;
}

void removeNoResultSubResults(uint64_t a1)
{
  CFArrayRef v1 = *(const __CFArray **)(a1 + 56);
  if (v1)
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
    if (Count >= 1)
    {
      unint64_t v4 = Count + 1;
      do
      {
        CFArrayRef ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v1, v4 - 2);
        CFIndex v6 = ValueAtIndex;
        if (ValueAtIndex && _typesAreEqual(ValueAtIndex[8], @"NoResult")) {
          CFArrayRemoveValueAtIndex(v1, v4 - 2);
        }
        else {
          removeNoResultSubResults(v6);
        }
        --v4;
      }
      while (v4 > 1);
    }
    if (!CFArrayGetCount(v1))
    {
      uint64_t v7 = *(const void **)(a1 + 56);
      if (v7)
      {
        CFRelease(v7);
        *(void *)(a1 + 56) = 0;
      }
    }
  }
}

void DDGlobalFilterBlocks_block_invoke_12(int a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 2)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 1; i < v4; ++i)
    {
      CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      if (i >= 1)
      {
        uint64_t v7 = ValueAtIndex;
        for (unint64_t j = i + 1; j > 1; --j)
        {
          char v9 = CFArrayGetValueAtIndex(theArray, j - 2);
          uint64_t v10 = v9[2];
          uint64_t v11 = v9[3];
          uint64_t v12 = v7[2];
          uint64_t v13 = v7[3];
          BOOL v16 = HIDWORD(v10) == HIDWORD(v12);
          uint64_t v14 = (uint64_t)(int)v10 >> 16;
          uint64_t v15 = (uint64_t)(int)v12 >> 16;
          BOOL v16 = v16 && v14 == v15;
          BOOL v17 = v16 && HIDWORD(v11) == HIDWORD(v13);
          if (!v17 || (int)v11 >> 16 != (int)v13 >> 16) {
            break;
          }
          uint64_t v19 = (uint64_t)v9;
          CFStringRef v20 = (const __CFString *)v7[8];
          CFStringRef v21 = (const __CFString *)v9[8];
          if (_typesAreEqual(v20, v21) && !_typesAreEqual(v20, @"DateTime")
            || !assistantAcceptTypeWithTypeOrdered(v20, v21, (uint64_t)v7, v19)
            && !assistantAcceptTypeWithTypeOrdered(v21, v20, v19, (uint64_t)v7))
          {
            if (v7[6] >= *(void *)(v19 + 48)) {
              CFIndex v22 = j - 2;
            }
            else {
              CFIndex v22 = i;
            }
            CFArrayRemoveValueAtIndex(theArray, v22);
            --v4;
            --i;
            break;
          }
        }
      }
    }
  }
}

uint64_t assistantAcceptTypeWithTypeOrdered(const __CFString *a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (_typesAreEqual(a1, @"Time"))
  {
    if (_typesAreEqual(a2, @"DateSpan") && DDResultGetSubresultWithType(a4, @"YearNumber")
      || _typesAreEqual(a2, @"TimeSpan"))
    {
      return 1;
    }
    if (_typesAreEqual(a2, @"TimeDuration"))
    {
      if (DDResultGetSubresultWithType(a3, @"MinutesBefore"))
      {
        CFArrayRef SubresultWithTypePath = DDResultGetSubresultWithTypePath(a4, @"BeginTime.Time");
        CFArrayRef v9 = DDResultGetSubresultWithTypePath(a4, @"EndTime.Time");
        if (SubresultWithTypePath)
        {
          uint64_t v10 = (uint64_t)v9;
          if (v9)
          {
            if (CFArrayGetCount(*((CFArrayRef *)SubresultWithTypePath + 7)) == 1
              && CFArrayGetCount(*(CFArrayRef *)(v10 + 56)) <= 2
              && DDResultGetSubresultWithType((uint64_t)SubresultWithTypePath, @"Hours")
              && DDResultGetSubresultWithType(v10, @"Hours")
              && !DDResultGetSubresultWithType(v10, @"Minutes")
              && !DDResultGetSubresultWithType(v10, @"MinutesBefore"))
            {
              return 1;
            }
          }
        }
      }
      return 0;
    }
    CFStringRef v14 = @"TimeSpanWithReference";
    return _typesAreEqual(a2, v14);
  }
  if (_typesAreEqual(a1, @"TimeDuration"))
  {
    if (!_typesAreEqual(a2, @"TimeSpanWithReference"))
    {
      if (!_typesAreEqual(a2, @"DateDuration")) {
        return 0;
      }
      CFArrayRef v11 = *(const __CFArray **)(a4 + 56);
      if (CFArrayGetCount(v11) == 1)
      {
        uint64_t ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(v11, 0);
        CFStringRef v13 = @"DateSpan.YearNumber";
      }
      else
      {
        if (!DDResultGetSubresultWithTypePath(a4, @"BeginDate.DateSpan.YearNumber")) {
          return 0;
        }
        CFStringRef v13 = @"EndDate.DateSpan.YearNumber";
        uint64_t ValueAtIndex = a4;
      }
      if (!DDResultGetSubresultWithTypePath(ValueAtIndex, v13)) {
        return 0;
      }
    }
    return 1;
  }
  if (_typesAreEqual(a1, @"DateDuration"))
  {
    CFStringRef v14 = @"DateSpanWithReference";
    return _typesAreEqual(a2, v14);
  }
  if (!_typesAreEqual(a1, @"DateTime") || !_typesAreEqual(a2, @"DateTime")) {
    return 0;
  }
  int v29 = 0;
  unint64_t v30 = 0;
  unint64_t v27 = 0;
  uint64_t v28 = 0;
  getDateFromDateTime(a3, &v28, &v30);
  getDateFromDateTime(a4, &v27, &v29);
  BOOL v16 = v29;
  uint64_t v15 = v30;
  int v18 = v27;
  BOOL v17 = v28;
  if (v30 && v29 && v28 && v27)
  {
    CFStringRef v19 = v27[8];
    if (v19) {
      BOOL v20 = _typesAreEqual(v28[8], v19);
    }
    else {
      BOOL v20 = 0;
    }
    CFStringRef v23 = v16[8];
    if (v23) {
      BOOL v24 = _typesAreEqual(v15[8], v23);
    }
    else {
      BOOL v24 = 0;
    }
    if (v20) {
      int v25 = 1;
    }
    else {
      int v25 = assistantAcceptTypeWithTypeOrdered(v17[8], v18[8], v17, v18);
    }
    BOOL v26 = v24 || assistantAcceptTypeWithTypeOrdered(v15[8], v16[8], v15, v16) != 0;
    if (!v25) {
      BOOL v26 = 0;
    }
    return v26 && (!v20 || !v24);
  }
  else
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    CFIndex v22 = DDLogHandle_error_log_handle;
    uint64_t result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)CFGregorianUnits buf = 67109888;
      BOOL v32 = v17 == 0;
      __int16 v33 = 1024;
      BOOL v34 = v18 == 0;
      __int16 v35 = 1024;
      BOOL v36 = v15 == 0;
      __int16 v37 = 1024;
      BOOL v38 = v16 == 0;
      _os_log_error_impl(&dword_19DC95000, v22, OS_LOG_TYPE_ERROR, "One required component of a DateTime was NULL (dates %d-%d and times %d-%d)", buf, 0x1Au);
      return 0;
    }
  }
  return result;
}

const __CFString **getDateFromDateTime(uint64_t a1, const __CFString ***a2, const __CFString ***a3)
{
  uint64_t SubresultWithType = DDResultGetSubresultWithType(a1, @"Time");
  if (!SubresultWithType)
  {
    uint64_t SubresultWithType = DDResultGetSubresultWithType(a1, @"TimeSpan");
    if (!SubresultWithType) {
      uint64_t SubresultWithType = DDResultGetSubresultWithType(a1, @"TimeDuration");
    }
  }
  *a3 = SubresultWithType;
  uint64_t result = DDResultGetSubresultWithType(a1, @"Date");
  if (!result) {
    uint64_t result = DDResultGetSubresultWithType(a1, @"DateSpan");
  }
  *a2 = result;
  return result;
}

CFIndex DDGlobalFilterBlocks_block_invoke_15(int a1, CFArrayRef theArray)
{
  v12.CFIndex length = CFArrayGetCount(theArray);
  v12.uint64_t location = 0;
  CFArraySortValues(theArray, v12, (CFComparatorFunction)DDResultRangeCompare, 0);
  CFIndex v3 = 0;
  while (1)
  {
    CFIndex result = CFArrayGetCount(theArray);
    if (v3 >= result - 1) {
      break;
    }
    uint64_t ValueAtIndex = CFArrayGetValueAtIndex(theArray, v3);
    uint64_t v6 = ValueAtIndex[4];
    uint64_t v7 = ValueAtIndex[5];
    uint64_t v8 = CFArrayGetValueAtIndex(theArray, v3 + 1);
    uint64_t v9 = v8[4];
    if (v9 >= v6 + v7)
    {
      ++v3;
    }
    else
    {
      if (v8[5] >= v7 && v6 == v9) {
        CFIndex v11 = v3;
      }
      else {
        CFIndex v11 = v3 + 1;
      }
      CFArrayRemoveValueAtIndex(theArray, v11);
    }
  }
  return result;
}

CFIndex DDGlobalFilterBlocks_block_invoke_11(int a1, CFArrayRef theArray, uint64_t a3)
{
  CFArrayRef v3 = theArray;
  CFIndex result = CFArrayGetCount(theArray);
  if (result >= 2)
  {
    CFIndex v5 = 0;
    CFGregorianDate v69 = v3;
    while (1)
    {
LABEL_3:
      CFIndex result = CFArrayGetCount(v3);
      if (v5 >= result - 1) {
        return result;
      }
      uint64_t ValueAtIndex = (const __CFArray **)CFArrayGetValueAtIndex(v3, v5);
      CFIndex v7 = v5 + 1;
      uint64_t v8 = (const __CFString **)CFArrayGetValueAtIndex(v3, v5 + 1);
      CFIndex Count = CFArrayGetCount(v3);
      uint64_t v79 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      CFRange v12 = 0;
      CFStringRef v13 = 0;
      uint64_t v14 = 0;
      uint64_t v76 = 0;
      uint64_t v15 = 0;
      CFIndex v16 = v5;
      uint64_t v17 = 0;
      CFIndex v72 = v16;
      CFIndex v70 = v7;
      CFIndex idx = v16 + 2;
      if (Count > v16 + 2)
      {
LABEL_5:
        uint64_t v17 = (uint64_t)CFArrayGetValueAtIndex(v3, idx);
        CFStringRef v13 = v79;
        uint64_t v14 = v10;
        uint64_t v76 = v11;
        uint64_t v15 = v12;
      }
      uint64_t v79 = v13;
      CFRange v12 = v15;
      int v18 = ValueAtIndex;
      while (1)
      {
        uint64_t v75 = v14;
        uint64_t ValueAtIndex = (const __CFArray **)v8;
        uint64_t v19 = *(void *)(a3 + 56);
        CFStringRef v20 = (const __CFString *)v18[8];
        CFStringRef v21 = v8[8];
        CFIndex v22 = (uint64_t *)v18;
        if (v12)
        {
          unsigned int v23 = 0;
        }
        else
        {
          BOOL v24 = _typesAreEqual(@"Contact", (const __CFString *)v18[8]);
          if (v24) {
            BOOL v24 = _typesAreEqual(@"FullAddress", v21);
          }
          unsigned int v23 = !v24;
        }
        if (!resultsAreCloseEnoughToCoalesce(v19, v22, (uint64_t)ValueAtIndex, v23)
          || !resultTypeIsCoalescibleInSignatures(v20)
          || !resultTypeIsCoalescibleInSignatures(v21))
        {
          goto LABEL_130;
        }
        BOOL v25 = _typesAreEqual(@"Contact", v21);
        uint64_t v82 = (uint64_t)ValueAtIndex;
        CFStringRef v83 = v20;
        int v73 = v22;
        if (!v12) {
          break;
        }
        if (v25)
        {
          uint64_t v67 = v75;
          goto LABEL_132;
        }
        CFIndex v26 = CFArrayGetCount((CFArrayRef)v12[7]);
        if (v26 < 1)
        {
          CFIndex v27 = v72;
          uint64_t v28 = (uint64_t)v79;
          goto LABEL_113;
        }
LABEL_78:
        CFStringRef v78 = v21;
        CFIndex v52 = 0;
        uint64_t v81 = 0;
        uint64_t v53 = 0;
        uint64_t v54 = 0;
        uint64_t v55 = 0;
        uint64_t v56 = 0;
        uint64_t v57 = 0;
        do
        {
          if (v12)
          {
            uint64_t v58 = CFArrayGetValueAtIndex((CFArrayRef)v12[7], v52);
            CFStringRef v59 = (const __CFString *)*((void *)v58 + 8);
          }
          else
          {
            uint64_t v58 = 0;
            CFStringRef v59 = v83;
          }
          if (_typesAreEqual(@"PhoneNumber", v59))
          {
            if (v12 && !v58) {
              uint64_t v58 = CFArrayGetValueAtIndex((CFArrayRef)v12[7], v52);
            }
            ++v55;
            if (v58 && DDResultGetSubresultWithType((uint64_t)v58, @"Label")) {
              ++v54;
            }
          }
          else if (_typesAreEqual(@"FullAddress", v59))
          {
            ++v56;
          }
          else if (_typesAreEqual(@"Email", v59))
          {
            ++v53;
          }
          else if (_typesAreEqual(@"Contact", v59))
          {
            ++v57;
          }
          else if (_typesAreEqual(@"HttpURL", v59) || _typesAreEqual(@"WebURL", v59))
          {
            ++v81;
          }
          ++v52;
        }
        while (v26 != v52);
        uint64_t v60 = 2;
        if (!((v54 + v57 < 0) ^ __OFADD__(v54, v57) | (v54 + v57 == 0))) {
          uint64_t v60 = 4;
        }
        if (v55 >= v60 && _typesAreEqual(@"PhoneNumber", v78))
        {
          CFArrayRef v3 = v69;
          CFIndex v7 = v70;
LABEL_130:
          uint64_t v67 = v75;
LABEL_131:
          CFIndex v5 = v7;
          if (!v12) {
            goto LABEL_3;
          }
LABEL_132:
          v12[2] = v76;
          v12[3] = v67;
          v12[9] = DDScanQueryCopyRange(*(void *)(a3 + 56), v76, v67);
          void v12[4] = DDScanQueryComputeCFRangeForQueryRange(*(void *)(a3 + 56), v76);
          v12[5] = v68;
          void v12[6] = v79;
LABEL_133:
          CFIndex v5 = v7;
          goto LABEL_3;
        }
        CFIndex v7 = v70;
        if (v56 >= 1 && _typesAreEqual(@"FullAddress", v78) || v53 >= 1 && _typesAreEqual(@"Email", v78))
        {
          CFArrayRef v3 = v69;
          goto LABEL_130;
        }
        uint64_t v28 = (uint64_t)v79;
        CFArrayRef v3 = v69;
        CFIndex v27 = v72;
        uint64_t ValueAtIndex = (const __CFArray **)v82;
        if (v81 >= 1 && (_typesAreEqual(@"HttpURL", v78) || _typesAreEqual(@"WebURL", v78))) {
          goto LABEL_130;
        }
        if (!v12)
        {
          CFRange v12 = DDRootResultCreate(@"SignatureBlock", v73[2], v73[3]);
          DDResultAddSubresult((uint64_t)v12, v73);
          CFArraySetValueAtIndex(v69, v72, v12);
          CFRelease(v12);
          uint64_t v75 = v73[3];
          uint64_t v76 = v73[2];
          uint64_t v28 = v73[6];
          v73[6] = 0;
        }
LABEL_113:
        DDResultAddSubresult((uint64_t)v12, ValueAtIndex);
        uint64_t v11 = (uint64_t)ValueAtIndex[2];
        uint64_t v10 = (uint64_t)ValueAtIndex[3];
        uint64_t v61 = (uint64_t)(int)v76 >> 16;
        uint64_t v62 = (uint64_t)(int)v11 >> 16;
        if ((int)v61 >= (int)v62)
        {
          uint64_t v63 = v75;
          if ((int)v61 <= (int)v62 && SHIDWORD(v76) < SHIDWORD(v11)) {
            uint64_t v11 = v76;
          }
        }
        else
        {
          uint64_t v11 = v76;
          uint64_t v63 = v75;
        }
        uint64_t v64 = (uint64_t)(int)v63 >> 16;
        uint64_t v65 = (uint64_t)(int)v10 >> 16;
        if ((int)v64 >= (int)v65)
        {
          if ((int)v64 <= (int)v65)
          {
            if (SHIDWORD(v63) >= SHIDWORD(v10)) {
              uint64_t v10 = v63;
            }
          }
          else
          {
            uint64_t v10 = v63;
          }
        }
        uint64_t v79 = (char *)ValueAtIndex[6] + v28;
        ValueAtIndex[6] = 0;
        CFArrayRemoveValueAtIndex(v3, v7);
        if (v27 >= CFArrayGetCount(v3) - 1)
        {
          uint64_t v67 = v10;
          uint64_t v76 = v11;
          goto LABEL_131;
        }
        uint64_t v8 = (const __CFString **)CFArrayGetValueAtIndex(v3, v7);
        CFIndex v66 = CFArrayGetCount(v3);
        uint64_t v17 = 0;
        uint64_t v14 = v10;
        uint64_t v76 = v11;
        int v18 = ValueAtIndex;
        if (v66 > idx) {
          goto LABEL_5;
        }
      }
      if (!v25) {
        goto LABEL_42;
      }
      int v29 = v22;
      CFArrayRef v30 = (const __CFArray *)v22[7];
      CFStringRef v77 = v21;
      uint64_t v80 = v19;
      if (v30 && (CFIndex v31 = CFArrayGetCount(v30), v31 >= 1))
      {
        CFIndex v32 = v31;
        CFIndex v33 = 0;
        char v34 = 0;
        char v35 = 0;
        do
        {
          CFStringRef v36 = (const __CFString *)*((void *)CFArrayGetValueAtIndex((CFArrayRef)v29[7], v33) + 8);
          if (_typesAreEqual(@"ContactName", v36))
          {
            char v35 = 1;
          }
          else if (_typesAreEqual(@"CompanyName", v36))
          {
            char v34 = 1;
          }
          uint64_t ValueAtIndex = (const __CFArray **)v82;
          ++v33;
        }
        while (v32 != v33);
      }
      else
      {
        char v35 = 0;
        char v34 = 0;
      }
      CFArrayRef v37 = ValueAtIndex[7];
      if (!v37) {
        goto LABEL_133;
      }
      CFIndex v38 = CFArrayGetCount(v37);
      if (v38 < 1) {
        goto LABEL_133;
      }
      CFIndex v39 = v38;
      CFIndex v40 = 0;
      char v41 = 0;
      char v42 = 0;
      do
      {
        CFStringRef v43 = (const __CFString *)*((void *)CFArrayGetValueAtIndex(ValueAtIndex[7], v40) + 8);
        if (_typesAreEqual(@"ContactName", v43))
        {
          char v42 = 1;
        }
        else if (_typesAreEqual(@"CompanyName", v43))
        {
          char v41 = 1;
        }
        ++v40;
        uint64_t ValueAtIndex = (const __CFArray **)v82;
      }
      while (v39 != v40);
      if (v35 != v34 && v42 != v41 && v35 != v42) {
        break;
      }
      CFArrayRef v3 = v69;
      CFIndex v5 = v70;
    }
    uint64_t v19 = v80;
    CFArrayRef v3 = v69;
    CFIndex v7 = v70;
    CFStringRef v21 = v77;
    CFStringRef v20 = v83;
    if (!resultsAreCloseEnoughToCoalesce(v80, v29, v82, 0)) {
      goto LABEL_133;
    }
LABEL_42:
    uint64_t v44 = v19;
    BOOL v45 = _typesAreEqual(@"Contact", v20);
    if (v17)
    {
      CFStringRef v46 = *(const __CFString **)(v17 + 64);
      if (v46)
      {
        BOOL v47 = _typesAreEqual(@"Contact", *(const __CFString **)(v17 + 64));
        if (resultsAreCloseEnoughToCoalesce(v44, ValueAtIndex, v17, 0)
          && resultTypeIsCoalescibleInSignatures(v46))
        {
          LODWORD(v17) = !_typesAreEqual(@"Contact", v46);
          BOOL v48 = v47;
          if (v47 & v17) {
            goto LABEL_133;
          }
        }
        else
        {
          LODWORD(v17) = 0;
          BOOL v48 = v47;
        }
      }
      else
      {
        LODWORD(v17) = 0;
        BOOL v48 = 0;
      }
    }
    else
    {
      BOOL v48 = 0;
      CFStringRef v46 = 0;
    }
    unsigned int v49 = !v45 | v17;
    if ((v49 & 1) == 0 && _typesAreEqual(v83, v21)) {
      goto LABEL_133;
    }
    if (!v45)
    {
      if (!v17)
      {
        if (_typesAreEqual(v83, v21)
          || _typesAreEqual(@"PhoneNumber", v83) && _typesAreEqual(v21, @"Email"))
        {
          goto LABEL_133;
        }
        if (!_typesAreEqual(@"PhoneNumber", v21)) {
          goto LABEL_63;
        }
        CFStringRef v50 = v83;
        CFStringRef v51 = @"Email";
        goto LABEL_62;
      }
      if (_typesAreEqual(v46, v21))
      {
        CFStringRef v50 = v83;
        CFStringRef v51 = v21;
LABEL_62:
        if (_typesAreEqual(v50, v51)) {
          goto LABEL_133;
        }
      }
    }
LABEL_63:
    if (_typesAreEqual(v21, @"Email") && (!v49 || v17 && (v48 || _typesAreEqual(v46, @"Email")))
      || _typesAreEqual(@"HttpURL", v83)
      || _typesAreEqual(@"WebURL", v83))
    {
      goto LABEL_133;
    }
    if (_typesAreEqual(@"HttpURL", v21) || _typesAreEqual(@"WebURL", v21))
    {
      if (!v17) {
        goto LABEL_133;
      }
      if (_typesAreEqual(@"HttpURL", v46)) {
        goto LABEL_133;
      }
      if (_typesAreEqual(@"WebURL", v46)) {
        goto LABEL_133;
      }
      CFIndex v26 = 1;
      if (_typesAreEqual(v83, @"Email")) {
        goto LABEL_133;
      }
    }
    else
    {
      CFIndex v26 = 1;
    }
    goto LABEL_78;
  }
  return result;
}

BOOL resultsAreCloseEnoughToCoalesce(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v8 = a2[3];
    uint64_t v9 = *(void *)(a3 + 16);
    int64_t v10 = (v8 << 32) & 0xFFFF000000000000;
    uint64_t v11 = v10 >> 48;
    uint64_t v12 = (uint64_t)(int)v9 >> 16;
    if (v10 >> 48 >= (int)v12 && (v10 >> 48 > (int)v12 || SHIDWORD(v8) >= SHIDWORD(v9)))
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = -1;
      if (((v8 << 32) & 0x8000000000000000) == 0 && v12 < v6)
      {
        uint64_t v28 = *(void *)(a3 + 16);
        unsigned int v29 = a4;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        CFIndex v30 = v8 >> 32;
        uint64_t v16 = 48 * v11;
        while (1)
        {
          uint64_t v17 = *(void *)(a1 + 16);
          uint64_t v18 = v17 + v16;
          if (v11 + v14 >= v12) {
            break;
          }
          if (v14)
          {
            CFIndex v19 = *(void *)(v17 + v16 + 16);
            CFIndex v20 = v19;
          }
          else
          {
            CFIndex v19 = *(void *)(v17 + 48 * (int)v11 + 16);
            CFIndex v20 = v30;
          }
          uint64_t v21 = v17 + v16;
          v15 += _DDScanQueryCountNewlinesInFragment(v18, v20, v19 - v20 + *(void *)(v17 + v16 + 24), 3 - v15);
          unsigned int v22 = *(_DWORD *)(v21 + 40);
          if ((v22 & 0x80000000) != 0)
          {
            int v23 = (v22 >> 26) & 7;
            if (v23 == 3)
            {
              ++v15;
            }
            else if (v23 == 4)
            {
              goto LABEL_18;
            }
          }
          ++v14;
          v16 += 48;
          if (v15 >= 3)
          {
LABEL_18:
            uint64_t v13 = -1;
            goto LABEL_25;
          }
        }
        if (v12 != v11) {
          CFIndex v30 = *(void *)(v17 + 48 * (v11 + v14) + 16);
        }
        uint64_t v13 = _DDScanQueryCountNewlinesInFragment(v18, v30, (v28 >> 32) - v30, 3 - v15) + v15;
        if (v13 > 2) {
          uint64_t v13 = -1;
        }
LABEL_25:
        a4 = v29;
      }
    }
  }
  else
  {
    uint64_t v13 = -1;
  }
  uint64_t v24 = *(void *)(a3 + 32) - (a2[4] + a2[5]);
  return v13 >= a4 && v24 >= 0 && v24 < 32;
}

CFStringRef resultTypeIsCoalescibleInSignatures(const __CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    if (_typesAreEqual(result, @"FullAddress")
      || _typesAreEqual(v1, @"PhoneNumber")
      || _typesAreEqual(v1, @"Email")
      || _typesAreEqual(v1, @"Contact")
      || _typesAreEqual(v1, @"IMScreenName")
      || _typesAreEqual(v1, @"HttpURL"))
    {
      return (const __CFString *)1;
    }
    else
    {
      return (const __CFString *)_typesAreEqual(v1, @"WebURL");
    }
  }
  return result;
}

BOOL DDShouldPauseSearchForTag(int a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return 1;
  }
  if (a3 && _typesAreEqual(*(CFStringRef *)(a3 + 64), @"Tag")) {
    return 1;
  }
  return _typesAreEqual(*(CFStringRef *)(a2 + 64), *(const __CFString **)(a3 + 64));
}

CFStringRef DDGetDataValueForMatchingTagToData(uint64_t a1, const __CFString **a2, int a3, unsigned char *a4)
{
  if (a2)
  {
    CFStringRef v7 = a2[10];
    if (!v7) {
      CFStringRef v7 = a2[9];
    }
  }
  else
  {
    CFStringRef v7 = 0;
  }
  uint64_t SubresultWithType = DDResultGetSubresultWithType(a1, a2[8]);
  if (a3 && SubresultWithType) {
    goto LABEL_27;
  }
  if (SubresultWithType) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
LABEL_26:
    CFStringRef v7 = 0;
LABEL_27:
    *a4 = 0;
    return v7;
  }
  CFStringRef v10 = SubresultWithType[10];
  if (!v10) {
    CFStringRef v10 = SubresultWithType[9];
  }
  BOOL v11 = CFStringFind(v7, @"-", 0).location == -1 && CFStringFind(v7, @"Generic", 0).location == -1;
  CFComparisonResult v12 = CFStringCompare(v10, @"Generic", 0);
  int v13 = v12 != kCFCompareEqualTo;
  *a4 = v13;
  if (v11 && v12)
  {
    if (CFEqual(v7, v10)) {
      return v7;
    }
    int v13 = *a4;
  }
  if (v11)
  {
    if (!v13) {
      return v7;
    }
    goto LABEL_26;
  }
  if (!v13) {
    goto LABEL_26;
  }
  if (CFEqual(v7, @"Generic")) {
    return v10;
  }
  CFStringRef v7 = v10;
  if (!DDResultValueContains((CFArrayRef)a2, v10)) {
    goto LABEL_26;
  }
  return v7;
}

void DDUpdateDataWithMatchedTag(__CFArray *a1, CFIndex a2, const void *a3, uint64_t a4, CFTypeRef cf)
{
  if (a3 && a4 && cf)
  {
    DDResultSetValue(a4, cf);
    CFArraySetValueAtIndex(a1, a2, a3);
  }
}

__CFArray *DDCreateRelatedResultsArray(const __CFArray *a1, CFIndex a2, CFIndex a3)
{
  CFIndex Count = CFArrayGetCount(a1);
  uint64_t ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, 0);
  CFArrayAppendValue(theArray, ValueAtIndex);
  CFStringRef v8 = (const __CFString *)ValueAtIndex[8];
  if (_typesAreEqual(v8, @"FullAddress")
    || _typesAreEqual(v8, @"Date")
    || _typesAreEqual(v8, @"Time")
    || _typesAreEqual(v8, @"TimeDuration")
    || _typesAreEqual(v8, @"DateTime"))
  {
    CFIndex v9 = a2 + 1;
    CFIndex v10 = a2;
    do
    {
      CFIndex v11 = a2 - (v10 - 1);
      BOOL v12 = v10-- < 1;
      BOOL v12 = !v12 && v11 <= a3 + 1;
      char v13 = !v12;
      do
      {
        if (v13)
        {
          if (v9 >= Count) {
            return theArray;
          }
          CFIndex v14 = v9 - a2;
          if (v9 - a2 > a3) {
            return theArray;
          }
        }
        else
        {
          CFIndex v14 = v9 - a2;
        }
        if (v9 < Count && v14 <= a3)
        {
          uint64_t v15 = CFArrayGetValueAtIndex(a1, v9);
          if (areResultRelatedRec((uint64_t)ValueAtIndex, (uint64_t)v15)) {
            goto LABEL_24;
          }
          ++v9;
        }
      }
      while ((v13 & 1) != 0);
      uint64_t v15 = CFArrayGetValueAtIndex(a1, v10);
    }
    while (!areResultRelatedRec((uint64_t)ValueAtIndex, (uint64_t)v15));
LABEL_24:
    CFArrayAppendValue(theArray, v15);
  }
  return theArray;
}

BOOL areResultRelatedRec(uint64_t a1, uint64_t a2)
{
  int v4 = 1;
  while (1)
  {
    int v5 = v4;
    uint64_t v6 = a1;
    CFStringRef v7 = *(const __CFString **)(a1 + 64);
    CFStringRef v8 = *(const __CFString **)(a2 + 64);
    if (_typesAreEqual(v7, @"FullAddress")) {
      break;
    }
    if (_typesAreEqual(v7, @"Date")) {
      goto LABEL_6;
    }
    if (_typesAreEqual(v7, @"DateTime"))
    {
      if (_typesAreEqual(v8, @"Date")) {
        return 1;
      }
LABEL_6:
      if (_typesAreEqual(v8, @"Time")) {
        return 1;
      }
      BOOL result = _typesAreEqual(v8, @"TimeDuration");
      if (result) {
        return result;
      }
      int v4 = 0;
      a1 = a2;
      a2 = v6;
      if ((v5 ^ 1)) {
        return result;
      }
    }
    else
    {
      int v4 = 0;
      a1 = a2;
      a2 = v6;
      if ((v5 & 1) == 0) {
        return 0;
      }
    }
  }

  return DDAddressResultCanBeMergedWith(v6, a2);
}

void *DDResultCreateFromDateTimeResults(const __CFArray *a1)
{
  if (CFArrayGetCount(a1) < 1)
  {
    if (CFArrayGetCount(a1) > 1) {
      CFArrayGetValueAtIndex(a1, 1);
    }
    return 0;
  }
  uint64_t ValueAtIndex = CFArrayGetValueAtIndex(a1, 0);
  if (CFArrayGetCount(a1) <= 1)
  {
    if (ValueAtIndex) {
      return CFRetain(ValueAtIndex);
    }
    return 0;
  }
  CFArrayRef v3 = CFArrayGetValueAtIndex(a1, 1);
  if (!ValueAtIndex) {
    return 0;
  }
  int v4 = v3;
  if (!v3) {
    return CFRetain(ValueAtIndex);
  }
  CFTypeRef v51 = 0;
  uint64_t v52 = 0;
  uint64_t v50 = 0;
  __int16 v49 = 0;
  if (!extractDateAndTime((uint64_t)ValueAtIndex, &v52, &v51, (unsigned char *)&v49 + 1, &v49, &v50)) {
    return CFRetain(ValueAtIndex);
  }
  CFTypeRef cf = 0;
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  __int16 v45 = 0;
  extractDateAndTime((uint64_t)v4, &v48, &cf, (unsigned char *)&v45 + 1, &v45, &v46);
  uint64_t v5 = v52;
  if (v52)
  {
    int v6 = HIBYTE(v49);
    if (v50) {
      uint64_t v7 = v50;
    }
    else {
      uint64_t v7 = v46;
    }
    uint64_t v8 = v52;
  }
  else
  {
    uint64_t v8 = v48;
    int v6 = HIBYTE(v45);
    if (v48)
    {
      uint64_t v11 = v46;
      uint64_t v12 = v50;
    }
    else
    {
      uint64_t v11 = v50;
      uint64_t v12 = v46;
    }
    if (v11) {
      uint64_t v7 = v11;
    }
    else {
      uint64_t v7 = v12;
    }
  }
  char v13 = (void *)cf;
  if (v51)
  {
    if (cf)
    {
      if (v52)
      {
        uint64_t v14 = v48;
        if (v48)
        {
          uint64_t SubresultWithType = DDResultGetSubresultWithType(v52, @"Hours");
          if (SubresultWithType)
          {
            uint64_t v16 = SubresultWithType;
            uint64_t v17 = DDResultGetSubresultWithType(v14, @"Hours");
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v53 = 0;
              CFStringRef v19 = v16[10];
              if (!v19) {
                CFStringRef v19 = v16[9];
              }
              if (DDFastIntegerExtraction(v19, (_DWORD *)&v53 + 1))
              {
                CFStringRef v20 = v18[10];
                if (!v20) {
                  CFStringRef v20 = v18[9];
                }
                if (DDFastIntegerExtraction(v20, &v53) && HIDWORD(v53) != v53) {
                  return CFRetain(ValueAtIndex);
                }
              }
            }
          }
        }
      }
      uint64_t v21 = _DDResultCreateFromDatesResults(*((const __CFArray **)v51 + 7), (uint64_t)cf);
      if (v21 || (uint64_t v21 = _DDResultCreateFromDatesResults(*((const __CFArray **)cf + 7), (uint64_t)v51)) != 0)
      {
        char v13 = (void *)v21;
LABEL_44:
        unsigned int v22 = &v49;
        goto LABEL_45;
      }
      uint64_t v5 = v52;
    }
    if (v5) {
      return CFRetain(ValueAtIndex);
    }
    char v13 = (void *)v51;
    CFRetain(v51);
    goto LABEL_44;
  }
  if (!cf) {
    return CFRetain(ValueAtIndex);
  }
  CFRetain(cf);
  unsigned int v22 = &v45;
LABEL_45:
  if (!(v8 | v7) || !v13)
  {
    if (v13) {
LABEL_72:
    }
      CFRelease(v13);
    return CFRetain(ValueAtIndex);
  }
  if (*(unsigned char *)v22 && v6) {
    goto LABEL_72;
  }
  if (v6) {
    int v23 = @"DateDuration";
  }
  else {
    int v23 = @"DateTime";
  }
  uint64_t v24 = ValueAtIndex[2];
  uint64_t v25 = ValueAtIndex[3];
  uint64_t v26 = v4[2];
  uint64_t v27 = v4[3];
  uint64_t v28 = (uint64_t)(int)v24 >> 16;
  uint64_t v29 = (uint64_t)(int)v26 >> 16;
  if (SHIDWORD(v24) >= SHIDWORD(v26)) {
    uint64_t v30 = v4[2];
  }
  else {
    uint64_t v30 = ValueAtIndex[2];
  }
  if ((int)v28 <= (int)v29) {
    uint64_t v26 = v30;
  }
  if ((int)v28 >= (int)v29) {
    uint64_t v31 = v26;
  }
  else {
    uint64_t v31 = ValueAtIndex[2];
  }
  uint64_t v32 = (uint64_t)(int)v25 >> 16;
  uint64_t v33 = (uint64_t)(int)v27 >> 16;
  if (SHIDWORD(v25) >= SHIDWORD(v27)) {
    uint64_t v34 = ValueAtIndex[3];
  }
  else {
    uint64_t v34 = v4[3];
  }
  BOOL v35 = (int)v32 < (int)v33;
  if ((int)v32 <= (int)v33) {
    uint64_t v36 = v34;
  }
  else {
    uint64_t v36 = ValueAtIndex[3];
  }
  if (v35) {
    uint64_t v37 = v4[3];
  }
  else {
    uint64_t v37 = v36;
  }
  CFIndex v9 = DDResultCreate(v23, v31, v37);
  CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"%@ --- %@", ValueAtIndex[9], v4[9]);
  if (v38)
  {
    CFStringRef v39 = v38;
    DDResultSetMatchedString((uint64_t)v9, v38);
    CFRelease(v39);
  }
  else
  {
    DDResultSetMatchedString((uint64_t)v9, @"Merged");
  }
  DDResultAddSubresult((uint64_t)v9, v13);
  if (v8)
  {
    DDResultAddSubresultSorted((uint64_t)v9, (void *)v8);
    if (v7) {
      DDResultAddSubresultSorted((uint64_t)v9, (void *)v7);
    }
  }
  else if (v7)
  {
    uint64_t Copy = DDResultCreateCopy(v7);
    if (Copy)
    {
      char v41 = (void *)Copy;
      char v42 = *(const void **)(Copy + 64);
      if (v42) {
        CFRelease(v42);
      }
      v41[8] = CFRetain(@"Time");
      CFStringRef v43 = (const void *)v41[7];
      if (v43) {
        CFRelease(v43);
      }
      CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      CFArrayAppendValue(Mutable, (const void *)v7);
      v41[7] = Mutable;
      DDResultAddSubresultSorted((uint64_t)v9, v41);
      CFRelease(v41);
    }
  }
  CFRelease(v13);
  return v9;
}

uint64_t extractDateAndTime(uint64_t a1, void *a2, void *a3, unsigned char *a4, unsigned char *a5, void *a6)
{
  CFStringRef v12 = *(const __CFString **)(a1 + 64);
  if (!_typesAreEqual(v12, @"DateTime"))
  {
    if (_typesAreEqual(v12, @"Date"))
    {
      if (a3) {
        *a3 = a1;
      }
      if (a5) {
        *a5 = 0;
      }
    }
    else
    {
      if (_typesAreEqual(v12, @"SpecialDateTime"))
      {
        if (a3) {
          *a3 = a1;
        }
        uint64_t result = 1;
        if (a5) {
          *a5 = 1;
        }
        return result;
      }
      if (_typesAreEqual(v12, @"Time"))
      {
        uint64_t v24 = 0;
        CFArrayRef v19 = *(const __CFArray **)(a1 + 56);
        if (v19
          && CFArrayGetCount(*(CFArrayRef *)(a1 + 56)) == 1
          && (uint64_t ValueAtIndex = CFArrayGetValueAtIndex(v19, 0),
              extractDateAndTime(ValueAtIndex, 0, 0, 0, 0, &v24),
              v24))
        {
          *a6 = v24;
        }
        else if (a2)
        {
          *a2 = a1;
        }
        if (a4) {
          *a4 = 0;
        }
      }
      else
      {
        if (_typesAreEqual(v12, @"TimeDuration"))
        {
          if (a2) {
            *a2 = a1;
          }
          uint64_t result = 1;
          if (a4) {
            *a4 = 1;
          }
          return result;
        }
        uint64_t result = _typesAreEqual(v12, @"ApproxTime");
        if (!result) {
          return result;
        }
        if (a6) {
          *a6 = a1;
        }
      }
    }
    return 1;
  }
  CFArrayRef v13 = *(const __CFArray **)(a1 + 56);
  CFIndex Count = CFArrayGetCount(v13);
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v22 = 0;
  __int16 v21 = 0;
  if (Count < 1)
  {
LABEL_6:
    if (a3) {
      *a3 = v23;
    }
    if (a2) {
      *a2 = v24;
    }
    if (a4) {
      *a4 = HIBYTE(v21);
    }
    if (a5) {
      *a5 = v21;
    }
    if (a6) {
      *a6 = v22;
    }
    return 1;
  }
  CFIndex v15 = Count;
  CFIndex v16 = 0;
  while (1)
  {
    uint64_t v17 = CFArrayGetValueAtIndex(v13, v16);
    uint64_t result = extractDateAndTime(v17, &v24, &v23, (char *)&v21 + 1, &v21, &v22);
    if (!result) {
      return result;
    }
    if (v15 == ++v16) {
      goto LABEL_6;
    }
  }
}

uint64_t _DDResultCreateFromDatesResults(const __CFArray *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  if (CFArrayGetCount(a1) != 1) {
    return 0;
  }
  uint64_t ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(a1, 0);
  if (!ValueAtIndex) {
    return 0;
  }
  uint64_t v5 = ValueAtIndex;
  if (!_typesAreEqual(ValueAtIndex[8], @"RelativeDayOfWeek")) {
    return 0;
  }
  CFArrayRef v6 = *(const __CFArray **)(a2 + 56);
  if (!v6) {
    return 0;
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a2 + 56)) != 1) {
    return 0;
  }
  uint64_t v7 = (CFStringRef *)CFArrayGetValueAtIndex(v6, 0);
  if (!v7 || !_typesAreEqual(v7[8], @"AbsoluteDate")) {
    return 0;
  }
  uint64_t Copy = DDResultCreateCopy(a2);
  CFIndex v9 = (CFMutableArrayRef *)CFArrayGetValueAtIndex(*(CFArrayRef *)(Copy + 56), 0);
  CFArrayAppendValue(v9[7], v5);
  return Copy;
}

void *createContactNameComponentInText(void *a1, void *a2, const void *a3, NSRange *a4)
{
  id v7 = a1;
  id v8 = a2;
  if (v8 && (uint64_t v9 = [v7 rangeOfString:v8], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    NSUInteger v13 = v9;
    NSUInteger v14 = v10;
    uint64_t v11 = DDResultCreate(a3, (v9 << 32) | 0x10000, ((unint64_t)(v9 + v10) << 32) | 0x10000);
    DDResultSetMatchedString((uint64_t)v11, v8);
    v11[4] = v13;
    v11[5] = v14;
    if (a4->location == 0x7FFFFFFFFFFFFFFFLL)
    {
      a4->uint64_t location = v13;
      a4->CFIndex length = v14;
    }
    else
    {
      v15.uint64_t location = v13;
      v15.CFIndex length = v14;
      *a4 = NSUnionRange(*a4, v15);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t _DDResultIsURL(uint64_t a1)
{
  if (!_DDResultIsURL__sURLTypes)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"HttpURL", @"WebURL", @"MailURL", @"MapsURL", @"GenericURL", @"Email", 0);
    uint64_t v5 = (void *)_DDResultIsURL__sURLTypes;
    _DDResultIsURL__sURLTypes = v4;

    if (a1) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!a1) {
    return 0;
  }
LABEL_3:
  CFRange v2 = (void *)_DDResultIsURL__sURLTypes;

  return [v2 containsObject:a1];
}

void sub_19DCCB930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DataDetectorsProximitySort(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = [v5 cfRange];
  uint64_t v10 = v9;
  uint64_t v11 = [v7 cfRange];
  uint64_t v13 = v8 + v10;
  uint64_t v14 = v11 + v12;
  if (v8 + v10 >= v11 + v12) {
    uint64_t v15 = v11 + v12;
  }
  else {
    uint64_t v15 = v8 + v10;
  }
  if ((v11 > v8 || (uint64_t v16 = v8, v8 >= v14)) && (v8 > v11 || (uint64_t v16 = v11, v11 >= v13)) || v15 == v16)
  {
    uint64_t v17 = v11 - v13;
    uint64_t v18 = v8 - v14;
    if (v8 > v11) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = v17;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [v5 cfRange];
  uint64_t v22 = v21;
  uint64_t v23 = [v6 cfRange];
  uint64_t v25 = v20 + v22;
  uint64_t v26 = v23 + v24;
  if (v20 + v22 >= v23 + v24) {
    uint64_t v27 = v23 + v24;
  }
  else {
    uint64_t v27 = v20 + v22;
  }
  if ((v23 > v20 || (uint64_t v28 = v20, v20 >= v26)) && (v20 > v23 || (uint64_t v28 = v23, v23 >= v25)) || v27 == v28)
  {
    uint64_t v29 = v23 - v25;
    uint64_t v30 = v20 - v26;
    if (v20 > v23) {
      uint64_t v29 = v30;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
  BOOL v31 = v19 <= v29;
  uint64_t v32 = v19 < v29 || v7 == v5;
  BOOL v33 = !v31 || v6 == v5;
  uint64_t v34 = v32 << 63 >> 63;
  if (v33) {
    uint64_t v35 = 1;
  }
  else {
    uint64_t v35 = v34;
  }

  return v35;
}

uint64_t DDURLSchemeIsKnown(uint64_t a1)
{
  if (_schemeCheckingDisabled) {
    return 1;
  }
  CFRange v2 = (void *)DDURLWithPotentiallyInvalidURLString(a1);
  BOOL v1 = (BOOL)v2;
  if (v2)
  {
    CFArrayRef v3 = (void *)[v2 scheme];
    if ([v3 length])
    {
      if (DDURLSchemeIsKnown_sSchemeOnce != -1) {
        dispatch_once(&DDURLSchemeIsKnown_sSchemeOnce, &__block_literal_global_2448);
      }
      uint64_t v6 = 0;
      id v7 = &v6;
      uint64_t v8 = 0x2020000000;
      char v9 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __DDURLSchemeIsKnown_block_invoke_3;
      block[3] = &unk_1E5985C60;
      void block[5] = v1;
      void block[6] = &v6;
      block[4] = v3;
      dispatch_sync((dispatch_queue_t)qword_1E9451350, block);
      BOOL v1 = *((unsigned char *)v7 + 24) != 0;
      _Block_object_dispose(&v6, 8);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t __DDURLSchemeIsKnown_block_invoke_3(void *a1)
{
  id v2 = (id)DDURLSchemeIsKnown_sPublicSchemes;
  uint64_t result = [(id)DDURLSchemeIsKnown_sPublicSchemes containsObject:a1[4]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    id v4 = (id)qword_1E9451348;
    uint64_t result = [(id)qword_1E9451348 containsObject:a1[4]];
    if (result)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
    else
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "isApplicationAvailableToOpenURL:error:", a1[5], 0);
      if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
      {
        if (!v2)
        {
          id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          DDURLSchemeIsKnown_sPublicSchemes = (uint64_t)v2;
        }
        uint64_t v5 = a1[4];
        uint64_t v6 = v2;
      }
      else
      {
        if (!v4)
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          qword_1E9451348 = (uint64_t)v4;
        }
        uint64_t v5 = a1[4];
        uint64_t v6 = v4;
      }
      return [v6 addObject:v5];
    }
  }
  return result;
}

void __DDURLSchemeIsKnown_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_1E9451350 = (uint64_t)dispatch_queue_create("com.apple.datadetectorscore.schemes", v0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, &DDURLSchemeIsKnown_sPublicSchemes, (CFNotificationCallback)publicSchemesUpdatedCB, (CFStringRef)*MEMORY[0x1E4F22388], 0, (CFNotificationSuspensionBehavior)0);
  id v2 = qword_1E9451350;

  dispatch_sync(v2, &__block_literal_global_3);
}

void __DDURLSchemeIsKnown_block_invoke_2()
{
}

void updatePublicSchemes(uint64_t a1)
{
  if (*(void *)a1)
  {

    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    *(void *)a1 = v2;
    [v2 addObject:@"smb"];
  }
  CFArrayRef v3 = *(void **)(a1 + 8);
  if (v3)
  {

    *(void *)(a1 + _Block_object_dispose(&STACK[0x600], 8) = 0;
  }
}

void publicSchemesUpdatedCB(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(a2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __publicSchemesUpdatedCB_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v2, block);
}

void __publicSchemesUpdatedCB_block_invoke(uint64_t a1)
{
}

void DDLookupTrieDestroy(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  _DDTrieDestroy(*(malloc_zone_t **)(a1 + 48), a1);
  CFArrayRef v3 = *(malloc_zone_t **)(a1 + 48);
  if (v3) {
    malloc_destroy_zone(v3);
  }
  uint64_t v4 = *(int *)(a1 + 24);
  if ((int)v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(a1 + 16);
    do
    {
      uint64_t v7 = *(unsigned int *)(v6 + 16 * v5);
      if ((int)v7 >= 1)
      {
        uint64_t v8 = (CFTypeRef *)(v6 + 16 * v5 + 8);
        if (v7 == 1)
        {
          if (*v8) {
            CFRelease(*v8);
          }
        }
        else
        {
          uint64_t v9 = 0;
          uint64_t v10 = 16 * v7;
          do
          {
            uint64_t v11 = *(const void **)((char *)*v8 + v9);
            if (v11) {
              CFRelease(v11);
            }
            v9 += 16;
          }
          while (v10 != v9);
          malloc_zone_free(*(malloc_zone_t **)(a1 + 40), (void *)*v8);
        }
      }
      ++v5;
    }
    while (v5 != v4);
  }
  uint64_t v12 = *(malloc_zone_t **)(a1 + 40);
  if (v12) {
    malloc_destroy_zone(v12);
  }
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13) {
    MEMORY[0x19F3B2B90](*MEMORY[0x1E4F14960], v13, 8388592);
  }

  free((void *)a1);
}

void _DDTrieDestroy(malloc_zone_t *a1, uint64_t a2)
{
  if (*(_DWORD *)a2)
  {
    if ((*(_DWORD *)a2 & 0xFFEu) < 0xD) {
      return;
    }
    uint64_t v4 = *(void ***)(a2 + 8);
  }
  else
  {
    unsigned int v3 = (*(_DWORD *)a2 >> 1) & 0x7FF;
    uint64_t v4 = *(void ***)(a2 + 8);
    while (v3 == 1)
    {
      unsigned int v3 = (*(_DWORD *)v4 >> 1) & 0x7FF;
      if (*(_DWORD *)v4)
      {
        BOOL v5 = v3 >= 7;
        unsigned int v3 = 0;
        if (v5)
        {
          malloc_zone_free(a1, v4[1]);
          unsigned int v3 = 0;
        }
      }
      else
      {
        uint64_t v6 = (void **)v4[1];
        malloc_zone_free(a1, v4);
        uint64_t v4 = v6;
      }
    }
    if (!v3) {
      return;
    }
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    do
    {
      _DDTrieDestroy(a1, v8);
      v8 += 2;
      --v7;
    }
    while (v7);
  }

  malloc_zone_free(a1, v4);
}

void DDLookupTrieInsertKeyWithExtra(unsigned int *a1, CFStringRef theString, uint64_t a3, char *a4)
{
  kern_return_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  int v36;
  CFTypeRef v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  unsigned __int16 *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CFIndex v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  UniChar *v58;
  uint64_t v59;
  unint64_t v60;
  __int16 *v61;
  __int16 *v62;
  uint64_t v63;
  uint64_t v64;
  UniChar *v65;
  char *v66;
  char *v67;
  unsigned int v68;
  uint64_t v69;
  UniChar *v70;
  UniChar *v71;
  UniChar *v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  char v76;
  char v77;
  UniChar *v78;
  uint64_t v79;
  malloc_zone_t *MallocZoneForSons;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  UniChar *v84;
  UniChar *v85;
  malloc_zone_t *v86;
  int v87;
  int v88;
  unsigned int v89;
  BOOL v90;
  UniChar *v91;
  NSObject *v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  CFIndex idx;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  UniChar buffer[8];
  uint64_t v104;
  CFRange v105;
  CFRange v106;

  int v104 = *MEMORY[0x1E4F143B8];
  Mutableuint64_t Copy = CFStringCreateMutableCopy(0, 0, theString);
  CFStringTrimWhitespace(MutableCopy);
  CFStringFold(MutableCopy, 0x81uLL, 0);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);
  CFIndex Length = CFStringGetLength(MutableCopy);
  if (Length < 1 || !a1) {
    goto LABEL_38;
  }
  int v99 = a4;
  CFLocaleRef v100 = Length;
  unsigned int v98 = a3;
  CFIndex v9 = 0;
  int v10 = 1;
  NSUInteger v102 = (uint64_t)a1;
  while (1)
  {
    int CharacterAtIndex = CFStringGetCharacterAtIndex(MutableCopy, v9);
    if (CharacterAtIndex == 45) {
      int v12 = 32;
    }
    else {
      int v12 = CharacterAtIndex;
    }
    if (CharacterAtIndex == 8217) {
      int v13 = 39;
    }
    else {
      int v13 = v12;
    }
    if (v13 == 8217) {
      unsigned int v14 = 39;
    }
    else {
      unsigned int v14 = v13;
    }
    unint64_t v15 = *a1;
    if ((v15 & 1) != 0 || (unint64_t v16 = (v15 >> 1) & 0x7FF, !v16))
    {
      uint64_t v17 = 0;
LABEL_26:
      unsigned int appended = _DDTrieAppendChar(a1, v13, v102, v17);
      if (v100 + ~v9 < 1) {
        goto LABEL_32;
      }
      uint64_t v25 = buffer;
      if (v100 >= 33) {
        uint64_t v25 = (UniChar *)malloc_type_malloc(2 * (v100 - v9), 0x1000040BDFB0063uLL);
      }
      v105.uint64_t location = v9;
      v105.CFIndex length = v100 - v9;
      CFStringGetCharacters(MutableCopy, v105, v25);
      _DDTrieCellMakeLeafWithChars((void *)v102, (uint64_t)appended, (__int16 *)v25, v100 - v9);
      if (v25 == buffer) {
        goto LABEL_32;
      }
      uint64_t v26 = v25;
LABEL_31:
      free(v26);
      goto LABEL_32;
    }
    uint64_t v17 = 0;
    uint64_t v18 = *((void *)a1 + 1);
    while (1)
    {
      unint64_t v19 = v17 + (v16 >> 1);
      unsigned int appended = (char *)(v18 + 16 * v19);
      unsigned int v21 = *((unsigned __int16 *)appended + 2);
      if (v21 == v14) {
        break;
      }
      unint64_t v22 = v16 >> 1;
      v16 += v17 + ~v19;
      if (v21 < v14) {
        uint64_t v17 = v19 + 1;
      }
      else {
        unint64_t v16 = v22;
      }
      if ((uint64_t)v16 <= 0) {
        goto LABEL_26;
      }
    }
    LODWORD(v23) = *(_DWORD *)appended;
    uint64_t v24 = v9 + 1;
    if (*(_DWORD *)appended) {
      break;
    }
    --v10;
    a1 = (unsigned int *)(v18 + 16 * v19);
    ++v9;
    if (v24 == v100) {
      goto LABEL_32;
    }
  }
  CFStringRef v38 = v100;
  CFStringRef v39 = v9 + 1;
  CFIndex v40 = v9;
  if (v24 < v100 && (v23 & 0xFFC) != 0)
  {
    char v41 = 0;
    char v42 = v18 + 16 * (v17 + (v16 >> 1)) + 6;
    while (1)
    {
      CFStringRef v43 = CFStringGetCharacterAtIndex(MutableCopy, v9 + v41 + 1);
      if (v43 == 45) {
        uint64_t v44 = 32;
      }
      else {
        uint64_t v44 = v43;
      }
      if (v43 == 8217) {
        __int16 v45 = 39;
      }
      else {
        __int16 v45 = v44;
      }
      unint64_t v23 = *(unsigned int *)appended;
      uint64_t v46 = (unsigned __int16 *)(appended + 4);
      if (v23)
      {
        uint64_t v46 = (unsigned __int16 *)v42;
        if ((unint64_t)(v41 + 1) >= 2)
        {
          uint64_t v46 = (unsigned __int16 *)v42;
          if ((*(_DWORD *)appended & 0xFFEu) >= 0xE) {
            uint64_t v46 = (unsigned __int16 *)(*(void *)(v18 + 16 * v19 + 8) + 2 * (v41 - 1));
          }
        }
      }
      if (v45 != *v46)
      {
        CFIndex v40 = v9 + v41;
        uint64_t v24 = v9 + v41 + 1;
        CFStringRef v38 = v100;
        CFStringRef v39 = v24;
        goto LABEL_94;
      }
      if (!(v9 - v100 + 2 + v41)) {
        break;
      }
      v42 += 2;
      BOOL v47 = v41 + 1;
      uint64_t v48 = v41 + 2;
      ++v41;
      if (v48 >= ((v23 >> 1) & 0x7FF))
      {
        CFIndex v40 = v9 + v47;
        uint64_t v24 = v9 + v47 + 1;
        CFStringRef v39 = v24;
        CFStringRef v38 = v100;
        goto LABEL_94;
      }
    }
    CFTypeRef v51 = 0;
    CFIndex v40 = v9 + v41 + 1;
    CFStringRef v38 = v100;
    CFStringRef v39 = v100;
    uint64_t v24 = v100;
LABEL_95:
    uint64_t v52 = v39 - v9;
    uint64_t v53 = (v23 >> 1) & 0x7FF;
    if (v52 != v53) {
      goto LABEL_98;
    }
    goto LABEL_32;
  }
LABEL_94:
  CFTypeRef v51 = v38 - v24;
  if (v38 == v24) {
    goto LABEL_95;
  }
  uint64_t v53 = (v23 >> 1) & 0x7FF;
LABEL_98:
  CFIndex idx = v24;
  uint64_t v54 = v40 - v9;
  *(_OWORD *)UniChar buffer = *(_OWORD *)appended;
  *(_DWORD *)unsigned int appended = 4096;
  *(void *)(v18 + 16 * v19 + _Block_object_dispose(&STACK[0x600], 8) = 0;
  if (v54 <= 0)
  {
    LODWORD(v63) = v54 + 1;
    uint64_t v56 = *(_DWORD *)buffer;
  }
  else
  {
    uint64_t v55 = 0;
    uint64_t v56 = *(_DWORD *)buffer;
    uint64_t v57 = *(void *)&buffer[4];
    int v96 = v53;
    uint64_t v58 = &buffer[3];
    CFStringRef v59 = (v40 + v10) - 1;
    do
    {
      uint64_t v60 = v55 + 1;
      uint64_t v61 = (__int16 *)&buffer[2];
      if (buffer[0])
      {
        uint64_t v62 = (__int16 *)(v57 + 2 * (v55 - 1));
        if (v60 < 2) {
          uint64_t v62 = (__int16 *)v58;
        }
        if ((buffer[0] & 0xFFEu) >= 0xE) {
          uint64_t v61 = v62;
        }
        else {
          uint64_t v61 = (__int16 *)v58;
        }
      }
      unsigned int appended = _DDTrieAppendChar((unsigned int *)appended, *v61, v102, 0);
      ++v58;
      uint64_t v55 = v60;
    }
    while (v59 != v60);
    CFStringRef v38 = v100;
    LODWORD(v63) = v54 + 1;
    LODWORD(v53) = v96;
  }
  uint64_t v64 = (v53 - v63);
  if ((int)v53 <= (int)v63)
  {
    *(_DWORD *)unsigned int appended = v56 & 0xFFFFF000 | *(_DWORD *)appended & 0xFFF;
  }
  else
  {
    if (v56)
    {
      if (v54 < 1 || (v56 & 0xFFEu) <= 0xD) {
        uint64_t v65 = &buffer[(int)v63 + 2];
      }
      else {
        uint64_t v65 = (UniChar *)(*(void *)&buffer[4] + 2 * (v54 - 1));
      }
    }
    else
    {
      uint64_t v65 = &buffer[2];
    }
    CFIndex v66 = _DDTrieAppendChar((unsigned int *)appended, *v65, v102, 0);
    uint64_t v67 = v66;
    uint64_t v68 = v56 & 0xFFFFF000;
    if (v64 == 1)
    {
      *(_DWORD *)CFIndex v66 = v68;
    }
    else
    {
      *(_DWORD *)CFIndex v66 = v68 | (2 * (v64 & 0x7FF)) | 1;
      uint64_t v63 = (int)v63;
      if (v64 >= 7)
      {
        int v73 = 0;
        __int16 v74 = v56 & 0xFFE;
        uint64_t v75 = *(void *)&buffer[4];
        uint64_t v76 = 1;
        do
        {
          CFStringRef v77 = v76;
          CFStringRef v78 = &buffer[2];
          if (v56)
          {
            uint64_t v79 = v73 + (int)v63;
            if (v74 < 0xE || v79 <= 1) {
              CFStringRef v78 = &buffer[v79 + 2];
            }
            else {
              CFStringRef v78 = (UniChar *)(v75 + 2 * (v79 - 2));
            }
          }
          uint64_t v76 = 0;
          *(_WORD *)&v66[2 * v73 + 4] = *v78;
          int v73 = 1;
        }
        while ((v77 & 1) != 0);
        NSUInteger v101 = v75;
        MallocZoneForSons = _getMallocZoneForSons(v102);
        uint64_t v81 = (v64 - 2);
        uint64_t v82 = malloc_type_zone_malloc(MallocZoneForSons, 2 * v81, 0x1000040BDFB0063uLL);
        CFStringRef v83 = 0;
        *((void *)v67 + 1) = v82;
        signed int v84 = &buffer[(int)v63 + 4];
        do
        {
          CFLocaleRef v85 = &buffer[2];
          if (v56)
          {
            CFLocaleRef v85 = (int)v63 + v83 >= 0 ? (UniChar *)(v101 + 2 * (v63 + v83)) : v84;
            if (v74 < 0xE) {
              CFLocaleRef v85 = v84;
            }
          }
          *(_WORD *)(*((void *)v67 + 1) + 2 * v83++) = *v85;
          ++v84;
        }
        while (v81 != v83);
      }
      else
      {
        CFGregorianDate v69 = *(void *)&buffer[4];
        CFIndex v70 = (UniChar *)(v66 + 4);
        int v71 = &buffer[(int)v63 + 2];
        do
        {
          CFIndex v72 = &buffer[2];
          if (v56)
          {
            CFIndex v72 = (UniChar *)(v69 + 2 * (v63 - 2));
            if (v63 < 2) {
              CFIndex v72 = v71;
            }
            if ((v56 & 0xFFEu) < 0xE) {
              CFIndex v72 = v71;
            }
          }
          *v70++ = *v72;
          ++v71;
          ++v63;
          --v64;
        }
        while (v64);
      }
    }
  }
  if ((v56 & 0xFFEu) >= 0x201)
  {
    NSUInteger v86 = _getMallocZoneForSons(v102);
    malloc_zone_free(v86, *(void **)&buffer[4]);
  }
  if (v51 >= 1)
  {
    BOOL v87 = CFStringGetCharacterAtIndex(MutableCopy, idx);
    CFStringRef v88 = v87 == 45 ? 32 : v87;
    id v89 = v87 == 8217 ? 39 : v88;
    int v90 = (*(_DWORD *)appended & 0xFFE) == 2
       && (unint64_t)(v89 > *(unsigned __int16 *)(*((void *)appended + 1) + 4));
    unsigned int appended = _DDTrieAppendChar((unsigned int *)appended, v89, v102, v90);
    if ((unint64_t)v51 >= 2)
    {
      uint64_t v91 = buffer;
      if (v38 >= 33) {
        uint64_t v91 = (UniChar *)malloc_type_malloc(2 * v51, 0x1000040BDFB0063uLL);
      }
      v106.uint64_t location = idx;
      v106.CFIndex length = v51;
      CFStringGetCharacters(MutableCopy, v106, v91);
      _DDTrieCellMakeLeafWithChars((void *)v102, (uint64_t)appended, (__int16 *)v91, v51);
      if (v91 != buffer)
      {
        uint64_t v26 = v91;
        goto LABEL_31;
      }
    }
  }
LABEL_32:
  if (appended == (char *)v102)
  {
LABEL_38:
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    return;
  }
  CFRelease(MutableCopy);
  if (!appended) {
    return;
  }
  if (v98 <= 0)
  {
    if ((_DDLookupTrieInsertDataInTrie_alreadyLogged_28 & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      BOOL v92 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        buffer[0] = 0;
        _os_log_error_impl(&dword_19DC95000, v92, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", (uint8_t *)buffer, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenId > 0", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v93, 713, @"non positive token", v96);
      _DDLookupTrieInsertDataInTrie_alreadyLogged_28 = 1;
    }
    return;
  }
  if ((unint64_t)v98 >= 0x7FFFF)
  {
    if ((_DDLookupTrieInsertDataInTrie_alreadyLogged_33 & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      CFDateRef v94 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        buffer[0] = 0;
        _os_log_error_impl(&dword_19DC95000, v94, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", (uint8_t *)buffer, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenId < MaxData", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v95, 714, @"data too big for the trie", v96);
      _DDLookupTrieInsertDataInTrie_alreadyLogged_33 = 1;
    }
    return;
  }
  unsigned int v27 = *(_DWORD *)appended;
  if ((*(_DWORD *)appended & 0x1000) == 0)
  {
LABEL_37:
    _DDLookupTrieNonImmediateCellAppendItem(v102, v27, v98, v99);
    return;
  }
  if (v99 || v27 >> 13)
  {
    if (v99) {
      goto LABEL_46;
    }
  }
  else
  {
    v27 |= v98 << 13;
    *(_DWORD *)unsigned int appended = v27;
  }
  if (v27 >> 13 == v98) {
    return;
  }
LABEL_46:
  int v28 = *(_DWORD *)(v102 + 24);
  if (v28 >= 0x7FFFF)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v29 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      buffer[0] = 0;
      uint64_t v30 = "currentExtraOffset too big";
LABEL_51:
      _os_log_error_impl(&dword_19DC95000, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)buffer, 2u);
      return;
    }
    return;
  }
  uint64_t v31 = *(void *)(v102 + 16);
  if (v31)
  {
LABEL_58:
    uint64_t v34 = v27 >> 13;
    if (v34) {
      uint64_t v35 = v34 == v98;
    }
    else {
      uint64_t v35 = 1;
    }
    uint64_t v36 = !v35;
    if (v35)
    {
      if (v99)
      {
        uint64_t v37 = CFRetain(v99);
        uint64_t v31 = *(void *)(v102 + 16);
      }
      else
      {
        uint64_t v37 = 0;
      }
      LODWORD(v34) = v98;
    }
    else
    {
      uint64_t v37 = 0;
    }
    __int16 v49 = *(int *)(v102 + 24);
    uint64_t v50 = v31 + 16 * v49;
    *(_DWORD *)uint64_t v50 = 1;
    *(_DWORD *)(v50 + 4) = v34;
    *(void *)(v50 + _Block_object_dispose(&STACK[0x600], 8) = v37;
    *(_DWORD *)(v102 + 24) = v49 + 1;
    unsigned int v27 = *(_DWORD *)appended & 0xFFF | (v28 << 13);
    *(_DWORD *)unsigned int appended = v27;
    if (v36) {
      goto LABEL_37;
    }
    return;
  }
  *(void *)UniChar buffer = 0;
  uint64_t v32 = vm_allocate(*MEMORY[0x1E4F14960], (vm_address_t *)buffer, 0x7FFFF0uLL, 1);
  uint64_t v31 = *(void *)buffer;
  if (v32) {
    BOOL v33 = 0;
  }
  else {
    BOOL v33 = *(void *)buffer;
  }
  *(void *)(v102 + 16) = v33;
  if (v33)
  {
    unsigned int v27 = *(_DWORD *)appended;
    goto LABEL_58;
  }
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  uint64_t v29 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    buffer[0] = 0;
    uint64_t v30 = "cannot allocate extra data vm region";
    goto LABEL_51;
  }
}

char *_DDTrieAppendChar(unsigned int *a1, __int16 a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = *a1;
  if ((~*a1 & 0xFFE) != 0)
  {
    int v8 = ((_WORD)v4 + 2) & 0xFFE;
    *a1 = v8 | v4 & 0xFFFFF001;
    if (*((void *)a1 + 1))
    {
      MallocZoneForSons = _getMallocZoneForSons(a3);
      int v10 = (char *)malloc_type_zone_realloc(MallocZoneForSons, *((void **)a1 + 1), (8 * *a1) & 0x7FF0, 0x102204052CB07EBuLL);
      goto LABEL_6;
    }
    if (v8 == 2)
    {
      uint64_t v11 = _getMallocZoneForSons(a3);
      int v10 = (char *)malloc_type_zone_calloc(v11, 1uLL, 0x10uLL, 0x102204052CB07EBuLL);
LABEL_6:
      *((void *)a1 + 1) = v10;
      if (v10)
      {
        unint64_t v12 = *a1;
        uint64_t v13 = (int)(((v12 >> 1) & 0x7FF) - 1);
        if (v13 > a4)
        {
          uint64_t v14 = 16 * ((v12 >> 1) & 0x7FF);
          do
          {
            --v13;
            *(_OWORD *)(*((void *)a1 + 1) + v14 - 16) = *(_OWORD *)(*((void *)a1 + 1) + v14 - 32);
            v14 -= 16;
          }
          while (v13 > a4);
          int v10 = (char *)*((void *)a1 + 1);
        }
        uint64_t result = &v10[16 * a4];
        *(void *)(result + 4) = 0;
        *((_DWORD *)result + 3) = 0;
        *((_WORD *)result + 2) = a2;
        *(_DWORD *)uint64_t result = 4096;
        return result;
      }
      if ((_DDTrieAppendChar_alreadyLogged_18 & 1) == 0)
      {
        if (DDLogHandle_onceToken != -1) {
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
        }
        uint64_t v18 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          v22[0] = 0;
          _os_log_error_impl(&dword_19DC95000, v18, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", (uint8_t *)v22, 2u);
        }
        DDLogAssertionFailure((uint64_t)"trie->storage.sons != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v19, 138, @"Allocation failed");
        uint64_t result = 0;
        _DDTrieAppendChar_alreadyLogged_18 = 1;
        return result;
      }
      return 0;
    }
    if (_DDTrieAppendChar_alreadyLogged_13) {
      return 0;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v20 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v23 = 0;
      _os_log_error_impl(&dword_19DC95000, v20, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", v23, 2u);
    }
    DDLogAssertionFailure((uint64_t)"trie->sonsOrCharCount == 1", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v21, 133, @"should have a buffer");
    uint64_t result = 0;
    _DDTrieAppendChar_alreadyLogged_13 = 1;
  }
  else
  {
    if (_DDTrieAppendChar_alreadyLogged) {
      return 0;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    unint64_t v16 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFGregorianUnits buf = 0;
      _os_log_error_impl(&dword_19DC95000, v16, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
    }
    DDLogAssertionFailure((uint64_t)"(int)(trie->sonsOrCharCount) < MaxNumberOfSons", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v17, 129, @"overflow in the trie");
    uint64_t result = 0;
    _DDTrieAppendChar_alreadyLogged = 1;
  }
  return result;
}

void *_DDTrieCellMakeLeafWithChars(void *result, uint64_t a2, __int16 *a3, uint64_t a4)
{
  int v5 = *(_DWORD *)a2 | 1;
  *(_DWORD *)a2 = v5;
  if (a4 >= 256) {
    uint64_t v6 = 256;
  }
  else {
    uint64_t v6 = a4;
  }
  if (a4 < 1)
  {
    *(_DWORD *)a2 = v5 & 0xFFFFF001 | (2 * (v6 & 0x7FF));
  }
  else
  {
    uint64_t v7 = a3;
    uint64_t v8 = 0;
    if (v6 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v6;
    }
    do
    {
      int v10 = (unsigned __int16)a3[v8];
      if (v10 == 8217) {
        __int16 v11 = 39;
      }
      else {
        __int16 v11 = a3[v8];
      }
      if (v10 == 45) {
        __int16 v12 = 32;
      }
      else {
        __int16 v12 = v11;
      }
      a3[v8++] = v12;
    }
    while (v9 != v8);
    *(_DWORD *)a2 = *(_DWORD *)a2 & 0xFFFFF001 | (2 * (v6 & 0x7FF));
    uint64_t v13 = (_WORD *)(a2 + 4);
    if (v6 > 6)
    {
      *(_WORD *)(a2 + 4) = *a3;
      *(_WORD *)(a2 + 6) = a3[1];
      MallocZoneForSons = _getMallocZoneForSons((uint64_t)result);
      uint64_t v16 = v6 - 2;
      uint64_t result = malloc_type_zone_malloc(MallocZoneForSons, 2 * v16, 0x1000040BDFB0063uLL);
      uint64_t v17 = 0;
      *(void *)(a2 + _Block_object_dispose(&STACK[0x600], 8) = result;
      do
      {
        *(_WORD *)(*(void *)(a2 + 8) + 2 * v17) = v7[v17 + 2];
        ++v17;
      }
      while (v16 != v17);
    }
    else
    {
      do
      {
        __int16 v14 = *v7++;
        *v13++ = v14;
        --v9;
      }
      while (v9);
    }
  }
  return result;
}

malloc_zone_t *_getMallocZoneForSons(uint64_t a1)
{
  zone = *(malloc_zone_t **)(a1 + 48);
  if (!zone)
  {
    zone = malloc_create_zone(0x400000uLL, 0);
    malloc_set_zone_name(zone, "DataDetectorsTrieSons");
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x600], 8) = zone;
  }
  return zone;
}

void _DDLookupTrieNonImmediateCellAppendItem(uint64_t a1, unsigned int a2, uint64_t a3, char *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = a2 >> 13;
  uint64_t v6 = (int *)(v4 + 16 * v5);
  uint64_t v7 = *v6;
  if ((int)v7 <= 0)
  {
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)CFGregorianUnits buf = 0;
    uint64_t v20 = "unexpected size";
    uint64_t v21 = buf;
    goto LABEL_14;
  }
  __int16 v9 = a3;
  uint64_t v11 = v4 + 16 * v5;
  __int16 v14 = *(char **)(v11 + 8);
  uint64_t v13 = (void *)(v11 + 8);
  __int16 v12 = v14;
  if (v7 == 1)
  {
    if (v12 == a4 && *(_DWORD *)(v4 + 16 * v5 + 4) == a3) {
      return;
    }
    unint64_t v15 = *(malloc_zone_t **)(a1 + 40);
    if (v15) {
      goto LABEL_8;
    }
    zone = malloc_create_zone(0x400000uLL, 0);
    if (zone)
    {
      unint64_t v15 = zone;
      malloc_set_zone_name(zone, "DataDetectorsTrieItems");
      *(void *)(a1 + 40) = v15;
LABEL_8:
      uint64_t v17 = malloc_type_zone_calloc(v15, 2uLL, 0x10uLL, 0x10C00408E2ACF4FuLL);
      v17[4] = *(_DWORD *)(v4 + 16 * v5 + 4);
      v17[12] = v9;
      *(void *)uint64_t v17 = *v13;
      if (a4) {
        CFTypeRef v18 = CFRetain(a4);
      }
      else {
        CFTypeRef v18 = 0;
      }
      *((void *)v17 + 2) = v18;
      int v23 = 2;
LABEL_25:
      *uint64_t v6 = v23;
      *uint64_t v13 = v17;
      return;
    }
    if (DDLogHandle_onceToken != -1) {
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
    }
    uint64_t v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v26 = 0;
    uint64_t v20 = "can't allocate trie_items_malloc_zone in trie";
    uint64_t v21 = (uint8_t *)&v26;
LABEL_14:
    _os_log_error_impl(&dword_19DC95000, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
    return;
  }
  uint64_t v22 = 0;
  while (*(char **)&v12[v22] != a4 || *(__int16 *)&v12[v22 + 8] != a3)
  {
    v22 += 16;
    if (16 * v7 == v22)
    {
      int v23 = v7 + 1;
      uint64_t v17 = malloc_type_zone_realloc(*(malloc_zone_t **)(a1 + 40), v12, 16 * ((int)v7 + 1), 0x10C00408E2ACF4FuLL);
      uint64_t v24 = (char *)&v17[8 * v7];
      *((_WORD *)v24 + 4) = v9;
      if (a4) {
        CFTypeRef v25 = CFRetain(a4);
      }
      else {
        CFTypeRef v25 = 0;
      }
      *(void *)uint64_t v24 = v25;
      goto LABEL_25;
    }
  }
}

CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits *units)
{
  MEMORY[0x1F40D70A0](tz, units, at);
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

SInt32 CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1F40D70B8](tz, at);
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1F40D70D8](tz, at);
  result.second = v3;
  result.SInt32 year = v2;
  result.SInt8 month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
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

void CFArrayExchangeValuesAtIndices(CFMutableArrayRef theArray, CFIndex idx1, CFIndex idx2)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
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

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7440](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1F40D74D8](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1F40D7558](bundle, functionName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x1F40D7670](calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1F40D7678](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x1F40D7680]();
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1F40D7690](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

CFIndex CFCalendarGetFirstWeekday(CFCalendarRef calendar)
{
  return MEMORY[0x1F40D76A0](calendar);
}

CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at)
{
  CFIndex v4 = MEMORY[0x1F40D76C0](calendar, smallerUnit, biggerUnit, at);
  result.CFIndex length = v5;
  result.uint64_t location = v4;
  return result;
}

void CFCalendarSetLocale(CFCalendarRef calendar, CFLocaleRef locale)
{
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1F40D7888](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x1F40D78B8](allocator, tmplate, options, locale);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  MEMORY[0x1F40D7B90](*(void *)&gdate.year, *(void *)&gdate.second, tz);
  return result;
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1F40D7BD8]();
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D7C48](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1F40D7D98](allocator, locale, style);
}

Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr)
{
  return MEMORY[0x1F40D7DD8](formatter, string, rangep, numberType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

uint64_t CFPhoneNumberCopyNumberForInternationalAssist()
{
  return MEMORY[0x1F4114208]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114218]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptionsAndLocale(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return MEMORY[0x1F40D8398](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions, locale);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8418](alloc, chars, numChars, capacity, externalCharactersAllocator);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithPascalString(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D84A0](alloc, pStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.uint64_t location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84E0](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
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

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

uint64_t CFStringOpenUText()
{
  return MEMORY[0x1F40D8658]();
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86E8]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8700](allocator, name, tryAbbrev);
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8708](allocator, ti);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8878](allocator, originalString, charactersToLeaveEscaped);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1F4109368]();
}

uint64_t CloseStreamCompressor()
{
  return MEMORY[0x1F410A148]();
}

uint64_t CreateStreamCompressor()
{
  return MEMORY[0x1F410A160]();
}

uint64_t CreateStreamCompressorQueueWithOptions()
{
  return MEMORY[0x1F410A168]();
}

uint64_t FinishStreamCompressorQueue()
{
  return MEMORY[0x1F410A170]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t NLStringTokenizerAdvanceToNextToken()
{
  return MEMORY[0x1F41140B8]();
}

uint64_t NLStringTokenizerCreate()
{
  return MEMORY[0x1F41140C8]();
}

uint64_t NLStringTokenizerGetCurrentSubTokens()
{
  return MEMORY[0x1F41140D0]();
}

uint64_t NLStringTokenizerGetCurrentTokenRange()
{
  return MEMORY[0x1F41140D8]();
}

uint64_t NLStringTokenizerSetStringWithOptions()
{
  return MEMORY[0x1F41140E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.CFIndex length = v3;
  result.uint64_t location = v2;
  return result;
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.CFIndex length = v3;
  result.uint64_t location = v2;
  return result;
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x1F4114260]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t VolumeSupportsCompression()
{
  return MEMORY[0x1F410A178]();
}

uint64_t WriteToStreamCompressor()
{
  return MEMORY[0x1F410A180]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __stpcpy_chk()
{
  return MEMORY[0x1F40C9CB8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1F40CA1D8]();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1F40CC2D0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1F40CCB20](start_size, *(void *)&flags);
}

malloc_zone_t *malloc_default_purgeable_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1F40CCB28]();
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
}

int malloc_make_nonpurgeable(void *ptr)
{
  return MEMORY[0x1F40CCB60](ptr);
}

void malloc_make_purgeable(void *ptr)
{
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
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

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB8](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBC0](zone, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBD8](zone, ptr, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1F40CDBD0]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1F417F718](*(void *)&c);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F760](*(void *)&c, *(void *)&which);
}

int32_t u_strFoldCase(UChar *dest, int32_t destCapacity, const UChar *src, int32_t srcLength, uint32_t options, UErrorCode *pErrorCode)
{
  return MEMORY[0x1F417F828](dest, *(void *)&destCapacity, src, *(void *)&srcLength, *(void *)&options, pErrorCode);
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1F4180050](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1F4180068](*(void *)&options, pErrorCode);
}

UChar32 uiter_next32(UCharIterator *iter)
{
  return MEMORY[0x1F4180070](iter);
}

void uiter_setString(UCharIterator *iter, const UChar *s, int32_t length)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

uint64_t unorm2_getInstance()
{
  return MEMORY[0x1F4180228]();
}

uint64_t unorm2_quickCheck()
{
  return MEMORY[0x1F4180268]();
}

uint64_t unorm_next()
{
  return MEMORY[0x1F4180278]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1F4180780](ut);
}

UChar32 utext_current32(UText *ut)
{
  return MEMORY[0x1F4180788](ut);
}

UBool utext_moveIndex32(UText *ut, int32_t delta)
{
  return MEMORY[0x1F41807A8](ut, *(void *)&delta);
}

UChar32 utext_next32(UText *ut)
{
  return MEMORY[0x1F41807B8](ut);
}

void utext_setNativeIndex(UText *ut, int64_t nativeIndex)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x1F41825C0](parent, cur);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x1F41825E0](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x1F41825E8]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
}

void xmlFreeNode(xmlNodePtr cur)
{
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x1F4182700](node, name);
}

xmlAttrPtr xmlHasProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlAttrPtr)MEMORY[0x1F4182708](node, name);
}

xmlNodePtr xmlNewNode(xmlNsPtr ns, const xmlChar *name)
{
  return (xmlNodePtr)MEMORY[0x1F4182758](ns, name);
}

xmlAttrPtr xmlNewProp(xmlNodePtr node, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x1F4182770](node, name, value);
}

xmlNodePtr xmlNewText(const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x1F4182778](content);
}

int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format)
{
  return MEMORY[0x1F41827A8](buf, doc, cur, *(void *)&level, *(void *)&format);
}

uint64_t MRLNeuralNetworkCreate_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_Montreal)) {
    dlopenHelper_Montreal(a1);
  }
  return MEMORY[0x1F41303E0]();
}

uint64_t MRLNeuralNetworkSetInput_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_Montreal)) {
    dlopenHelper_Montreal(a1);
  }
  return MEMORY[0x1F4130418]();
}

uint64_t MRLNeuralNetworkPredict_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_Montreal)) {
    dlopenHelper_Montreal(a1);
  }
  return MEMORY[0x1F4130408]();
}

uint64_t MRLNeuralNetworkGetOutput_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_Montreal)) {
    dlopenHelper_Montreal(a1);
  }
  return MEMORY[0x1F41303F0]();
}

uint64_t LDEnumerateAssetDataItems_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_LinguisticData)) {
    dlopenHelper_LinguisticData(a1);
  }
  return MEMORY[0x1F412A870]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CloudSubscriptionFeatures(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GeoServices(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_LinguisticData(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_NaturalLanguage(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Montreal(double a1)
{
  return a1;
}

double gotLoadHelper_x8__kMRLNeuralNetworkOptionModelURLKey(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_Montreal)) {
    return dlopenHelper_Montreal(result);
  }
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___NLTokenizer(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage)) {
    dlopenHelper_NaturalLanguage(a1);
  }
}

double gotLoadHelper_x8__NLNaturalLanguageErrorDomain(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage)) {
    return dlopenHelper_NaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NLTagger(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage)) {
    return dlopenHelper_NaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__NLTagSchemeTokenType(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage)) {
    return dlopenHelper_NaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__kLDAssetTypeDataDetectorHead(double result)
{
  if (!atomic_load(&dlopenHelperFlag_LinguisticData)) {
    return dlopenHelper_LinguisticData(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NLContextualEmbedding(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage)) {
    return dlopenHelper_NaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___GEOMapURLBuilder(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GeoServices)) {
    return dlopenHelper_GeoServices(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CSFFeatureManager(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CloudSubscriptionFeatures)) {
    return dlopenHelper_CloudSubscriptionFeatures(result);
  }
  return result;
}