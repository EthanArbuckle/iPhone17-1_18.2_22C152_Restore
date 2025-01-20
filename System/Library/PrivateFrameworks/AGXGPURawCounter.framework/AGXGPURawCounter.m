uint64_t AGXGPURawCounter::createInstance(AGXGPURawCounter *this)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sAGXGPURawCounterLock);
  if (!sAGXGPURawCounterImpl) {
    operator new();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sAGXGPURawCounterLock);
  return 0;
}

uint64_t AGXGPURawCounter::destroyInstance(AGXGPURawCounter *this)
{
  uint64_t result = sAGXGPURawCounterImpl;
  if (sAGXGPURawCounterImpl)
  {
    AGXGPURawCounterImpl::free((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl);
    uint64_t result = sAGXGPURawCounterImpl;
    if (sAGXGPURawCounterImpl) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)sAGXGPURawCounterImpl + 8))(sAGXGPURawCounterImpl);
    }
    sAGXGPURawCounterImpl = 0;
  }
  return result;
}

uint64_t AGXGPURawCounter::instance(AGXGPURawCounter *this)
{
  return sAGXGPURawCounterImpl;
}

uint64_t AGXGPURawCounter::sourceBufferMinSize(AGXGPURawCounter *this)
{
  return 0x8000;
}

uint64_t AGXGPURawCounter::sourceBufferSizeAlignment(AGXGPURawCounter *this)
{
  return 0x4000;
}

size_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::drain(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((a2 & 7) != 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Amount of data to be drained must be aligned to 64-bits!\n", "AGXGPURawCounterImpl.mm", 341, "drain");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "AGXGPURawCounterImpl.mm";
      __int16 v15 = 1024;
      int v16 = 341;
      __int16 v17 = 2080;
      v18 = "drain";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Amount of data to be drained must be aligned to 64-bits!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "AGXGPURawCounterImpl.mm";
      __int16 v15 = 1024;
      int v16 = 341;
      __int16 v17 = 2080;
      v18 = "drain";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Amount of data to be drained must be aligned to 64-bits!\n", buf, 0x1Cu);
    }
    return 0;
  }
  else
  {
    LODWORD(v2) = a2;
    unsigned int v12 = 0;
    *(_DWORD *)buf = 0;
    (*(void (**)(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *, uint8_t *, unsigned int *))(*(void *)this + 32))(this, buf, &v12);
    if (v12 >= v2) {
      size_t v2 = v2;
    }
    else {
      size_t v2 = v12;
    }
    uint64_t v4 = *((void *)this + 3);
    unsigned int v5 = *(_DWORD *)(v4 + 24);
    if (*(_DWORD *)buf + (int)v2 <= v5)
    {
      v8 = (void *)(*(void *)v4 + *(unsigned int *)buf);
      size_t v9 = v2;
    }
    else
    {
      size_t v6 = v5 - *(_DWORD *)buf;
      size_t v7 = (v2 - v6);
      sys_dcache_flush((void *)(*(void *)v4 + *(unsigned int *)buf), v6);
      v8 = (void *)**((void **)this + 3);
      size_t v9 = v7;
    }
    sys_dcache_flush(v8, v9);
    uint64_t v10 = *((void *)this + 3);
    *(_DWORD *)buf = (*(_DWORD *)buf + v2) % *(_DWORD *)(v10 + 24);
    *(void *)(v10 + 32) = *(void *)(v10 + 8) + *(unsigned int *)buf;
    sys_dcache_flush((void *)(v10 + 32), 8uLL);
  }
  return v2;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::state(void **this, unsigned int *a2, unsigned int *a3)
{
  sys_dcache_flush(this[3], 0x40uLL);
  size_t v6 = this[3];
  *a2 = v6[4] - *((_DWORD *)v6 + 2);
  *a3 = (v6[6] + (unint64_t)*((unsigned int *)v6 + 6) - v6[4]) % *((unsigned int *)v6 + 6);
  return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::size(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this)
{
  return *(unsigned int *)(*((void *)this + 3) + 24);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::base(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this)
{
  return **((void **)this + 3);
}

void AGXGPURawCounterImpl::SourceImpl::RingBufferImpl::~RingBufferImpl(AGXGPURawCounterImpl::SourceImpl::RingBufferImpl *this)
{
  *(void *)this = &unk_26F2CA1E0;
  if (*((void *)this + 3)) {
    *((void *)this + 3) = 0;
  }
  JUMPOUT(0x2455C3130);
}

{
  *(void *)this = &unk_26F2CA1E0;
  if (*((void *)this + 3)) {
    *((void *)this + 3) = 0;
  }
}

void AGXGPURawCounterImpl::SourceImpl::ringBufferFree(AGXGPURawCounterImpl::SourceImpl *this)
{
  size_t v2 = (void *)*((void *)this + 785);
  if (v2)
  {
    unint64_t v3 = *((unsigned int *)this + 1572);
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        uint64_t v5 = *((void *)this + 785);
        uint64_t v6 = *(void *)(v5 + 8 * i);
        if (v6)
        {
          (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
          uint64_t v5 = *((void *)this + 785);
          unint64_t v3 = *((unsigned int *)this + 1572);
        }
        *(void *)(v5 + 8 * i) = 0;
      }
      size_t v2 = (void *)*((void *)this + 785);
    }
    free(v2);
    *((void *)this + 785) = 0;
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::ringBufferInit(AGXGPURawCounterImpl::SourceImpl *this, unint64_t a2, void *a3, uint64_t a4)
{
  int v4 = a4;
  uint64_t v5 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, uint64_t))(*(void *)this + 224))(this, a4);
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    operator new();
  }
  return v5;
}

BOOL AGXGPURawCounterImpl::SourceImpl::ringBufferAlloc(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v4 = *((_DWORD *)this + 1572);
  if (v4 == a2)
  {
    (*(void (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 240))(this);
    if (a2)
    {
      uint64_t v5 = malloc_type_malloc(8 * *((unsigned int *)this + 1572), 0x2004093837F09uLL);
      *((void *)this + 785) = v5;
      if (v5)
      {
        bzero(v5, 8 * *((unsigned int *)this + 1572));
        return 1;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Fail to allocate ring buffer for source[%u]!\n", "AGXGPURawCounterImpl.mm", 2115, "ringBufferAlloc", *((_DWORD *)this + 7));
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v15 = *((_DWORD *)this + 7);
        *(_DWORD *)buf = 136315906;
        __int16 v17 = "AGXGPURawCounterImpl.mm";
        __int16 v18 = 1024;
        int v19 = 2115;
        __int16 v20 = 2080;
        v21 = "ringBufferAlloc";
        __int16 v22 = 1024;
        int v23 = v15;
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to allocate ring buffer for source[%u]!\n", buf, 0x22u);
      }
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      if (result)
      {
        int v12 = *((_DWORD *)this + 7);
        *(_DWORD *)buf = 136315906;
        __int16 v17 = "AGXGPURawCounterImpl.mm";
        __int16 v18 = 1024;
        int v19 = 2115;
        __int16 v20 = 2080;
        v21 = "ringBufferAlloc";
        __int16 v22 = 1024;
        int v23 = v12;
        size_t v9 = &_os_log_internal;
        uint64_t v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to allocate ring buffer for source[%u]!\n";
        goto LABEL_17;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Invalid ring buffer count (%u)!\n", "AGXGPURawCounterImpl.mm", 2108, "ringBufferAlloc", 0);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v17 = "AGXGPURawCounterImpl.mm";
        __int16 v18 = 1024;
        int v19 = 2108;
        __int16 v20 = 2080;
        v21 = "ringBufferAlloc";
        __int16 v22 = 1024;
        int v23 = 0;
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer count (%u)!\n", buf, 0x22u);
      }
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_DWORD *)buf = 136315906;
        __int16 v17 = "AGXGPURawCounterImpl.mm";
        __int16 v18 = 1024;
        int v19 = 2108;
        __int16 v20 = 2080;
        v21 = "ringBufferAlloc";
        __int16 v22 = 1024;
        int v23 = 0;
        size_t v9 = &_os_log_internal;
        uint64_t v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer count (%u)!\n";
LABEL_17:
        uint32_t v11 = 34;
        goto LABEL_18;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Inconsistent ring buffer count for source[%u]. (%u != %u)\n", "AGXGPURawCounterImpl.mm", 2099, "ringBufferAlloc", *((_DWORD *)this + 7), v4, a2);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v13 = *((_DWORD *)this + 7);
      int v14 = *((_DWORD *)this + 1572);
      *(_DWORD *)buf = 136316418;
      __int16 v17 = "AGXGPURawCounterImpl.mm";
      __int16 v18 = 1024;
      int v19 = 2099;
      __int16 v20 = 2080;
      v21 = "ringBufferAlloc";
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v14;
      __int16 v26 = 1024;
      int v27 = a2;
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent ring buffer count for source[%u]. (%u != %u)\n", buf, 0x2Eu);
    }
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (result)
    {
      int v7 = *((_DWORD *)this + 7);
      int v8 = *((_DWORD *)this + 1572);
      *(_DWORD *)buf = 136316418;
      __int16 v17 = "AGXGPURawCounterImpl.mm";
      __int16 v18 = 1024;
      int v19 = 2099;
      __int16 v20 = 2080;
      v21 = "ringBufferAlloc";
      __int16 v22 = 1024;
      int v23 = v7;
      __int16 v24 = 1024;
      int v25 = v8;
      __int16 v26 = 1024;
      int v27 = a2;
      size_t v9 = &_os_log_internal;
      uint64_t v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent ring buffer count for source[%u]. (%u != %u)\n";
      uint32_t v11 = 46;
LABEL_18:
      _os_log_impl(&dword_23F075000, v9, OS_LOG_TYPE_INFO, v10, buf, v11);
      return 0;
    }
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::fillKernelConfigData(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(result + 6232);
  return result;
}

void AGXGPURawCounterImpl::SourceImpl::postProcessReset(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 787);
  if (v2 && (unint64_t v3 = *(void (**)(void))(v2 + 8)) != 0 && *(void *)(v2 + 24))
  {
    v3(*(void *)(*((void *)this + 1) + 704));
    *((_DWORD *)this + 1576) = a2;
    bzero(*((void **)this + 790), *((unsigned int *)this + 1582));
    *((_DWORD *)this + 1577) = (*(uint64_t (**)(void))(*((void *)this + 787) + 24))();
    if (*((unsigned char *)this + 36))
    {
      LODWORD(v7) = *((_DWORD *)this + 1554);
      LODWORD(v6) = *((_DWORD *)this + 1555);
      *((_DWORD *)this + 1578) = 8 * (v7 - v6);
    }
    else
    {
      *((_DWORD *)this + 1578) = 0;
      uint64_t v6 = *((unsigned int *)this + 1555);
      uint64_t v7 = *((unsigned int *)this + 1554);
      if (v6 < v7)
      {
        uint64_t v8 = v7 - v6;
        if ((unint64_t)(v7 - v6) >= 9)
        {
          uint64_t v11 = v8 & 7;
          if ((v8 & 7) == 0) {
            uint64_t v11 = 8;
          }
          uint64_t v12 = v8 - v11;
          uint64_t v13 = v11 + v6 - v7;
          int v14 = (__int32 *)((char *)this + 24 * v6 + 136);
          int32x4_t v15 = 0uLL;
          int32x4_t v16 = 0uLL;
          do
          {
            v17.i32[0] = *(v14 - 12);
            v17.i32[1] = *(v14 - 6);
            v17.i32[2] = *v14;
            v17.i32[3] = v14[6];
            v18.i32[0] = v14[12];
            v18.i32[1] = v14[18];
            v18.i32[2] = v14[24];
            v18.i32[3] = v14[30];
            int32x4_t v15 = (int32x4_t)vsraq_n_u32((uint32x4_t)v15, v17, 3uLL);
            int32x4_t v16 = (int32x4_t)vsraq_n_u32((uint32x4_t)v16, v18, 3uLL);
            v14 += 48;
            v13 += 8;
          }
          while (v13);
          uint64_t v10 = v12 + v6;
          int v9 = vaddvq_s32(vaddq_s32(v16, v15));
        }
        else
        {
          int v9 = 0;
          uint64_t v10 = *((unsigned int *)this + 1555);
        }
        uint64_t v19 = v7 - v10;
        __int16 v20 = (unsigned int *)((char *)this + 24 * v10 + 88);
        do
        {
          unsigned int v21 = *v20;
          v20 += 6;
          v9 += v21 >> 3;
          --v19;
        }
        while (v19);
        *((_DWORD *)this + 1578) = v9;
        LODWORD(v7) = 1;
      }
    }
    int v22 = 8 * v6;
    int v23 = v22 + 8;
    *((_DWORD *)this + 1579) = v22 + 8;
    if (*((unsigned char *)this + 6304)) {
      *((_DWORD *)this + 1579) = v22 + 40;
    }
    if (v7
      && (((*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 128))(this) & 1) != 0
       || *((_DWORD *)this + 1556)))
    {
      *((_DWORD *)this + 1579) += v23;
    }
    if (((*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 128))(this) & 2) != 0) {
      *((_DWORD *)this + 1579) += 3 * v23 * *(_DWORD *)(*((void *)this + 787) + 40);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** chip dispatch table is not propertly set!\n", "AGXGPURawCounterImpl.mm", 1831, "postProcessReset");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v25 = "AGXGPURawCounterImpl.mm";
      __int16 v26 = 1024;
      int v27 = 1831;
      __int16 v28 = 2080;
      v29 = "postProcessReset";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** chip dispatch table is not propertly set!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v25 = "AGXGPURawCounterImpl.mm";
      __int16 v26 = 1024;
      int v27 = 1831;
      __int16 v28 = 2080;
      v29 = "postProcessReset";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** chip dispatch table is not propertly set!\n", buf, 0x1Cu);
    }
  }
}

BOOL AGXGPURawCounterImpl::SourceImpl::postProcessData(AGXGPURawCounterImpl::SourceImpl *this, unsigned int a2, const unsigned __int8 *a3, unint64_t a4, unint64_t *a5, unint64_t a6, unsigned __int8 *a7, unint64_t a8, unint64_t a9, unint64_t *a10, BOOL a11)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  uint64_t v11 = *((void *)this + 787);
  if (!v11 || !*(void *)(v11 + 16))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** parseSampleHeader() is not set!\n", "AGXGPURawCounterImpl.mm", 1330, "postProcessData");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v137 = "AGXGPURawCounterImpl.mm";
      __int16 v138 = 1024;
      int v139 = 1330;
      __int16 v140 = 2080;
      v141 = "postProcessData";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** parseSampleHeader() is not set!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v137 = "AGXGPURawCounterImpl.mm";
      __int16 v138 = 1024;
      int v139 = 1330;
      __int16 v140 = 2080;
      v141 = "postProcessData";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** parseSampleHeader() is not set!\n", buf, 0x1Cu);
    }
    return 0;
  }
  if (*((_DWORD *)this + 1572) <= a2) {
    return 0;
  }
  BOOL v15 = 0;
  if (!a3) {
    return v15;
  }
  if (!a4) {
    return v15;
  }
  if (!a5) {
    return v15;
  }
  BOOL v15 = 0;
  if (a6 >= a4) {
    return v15;
  }
  if (!a7) {
    return v15;
  }
  if (!a8) {
    return v15;
  }
  BOOL v15 = 0;
  if (a9 >= a8 || !a10) {
    return v15;
  }
  if (*a5 >= a4
    || *a10 >= a8
    || (((a6 | a4) | *a5) & 7) != 0
    || (((a9 | a8) | *a10) & 7) != 0
    || (*(unsigned int (**)(void))(**((void **)this + 1) + 104))(*((void *)this + 1)) > a8)
  {
    return 0;
  }
  BOOL v21 = ((*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 128))(this) & 1) != 0
     || *((_DWORD *)this + 1556) != 0;
  BOOL v109 = v21;
  char v23 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 128))(this);
  char v101 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 128))(this);
  int v99 = *((_DWORD *)this + 1576);
  uint64_t v24 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 16))(this);
  if (((*(uint64_t (**)(uint64_t))(*(void *)v24 + 56))(v24) & 2) != 0) {
    unsigned int v111 = ((*(unsigned int (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 96))(this) >> 2) & 1;
  }
  else {
    unsigned int v111 = 0;
  }
  char v100 = v23;
  if ((v23 & 2) != 0) {
    unsigned int v110 = *(_DWORD *)(*((void *)this + 787) + 56);
  }
  else {
    unsigned int v110 = 0;
  }
  int v112 = *((_DWORD *)this + 1554);
  int __src = *((_DWORD *)this + 1555);
  int v102 = *((_DWORD *)this + 1556);
  unsigned int v118 = 0;
  {
    if (*((_DWORD *)this + 9)) {
      int v81 = 4096;
    }
    else {
      int v81 = 2048;
    }
    AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize = v81;
  }
  {
    if (*((_DWORD *)this + 9)) {
      int v82 = 1;
    }
    else {
      int v82 = 4;
    }
    AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcPayloadScale = v82;
  }
  size_t v25 = AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize;
  if (AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize)
  {
    __dst = (char *)operator new(AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize);
    bzero(__dst, v25);
  }
  else
  {
    __dst = 0;
  }
  LOBYTE(v117[0]) = 0;
  memset((char *)v117 + 4, 0, 28);
  unsigned int v26 = (*(uint64_t (**)(void))(**((void **)this + 1) + 104))(*((void *)this + 1));
  StackAllocator::init((StackAllocator *)v117, v26);
  int v27 = a10;
  unint64_t v28 = *a10;
  if (*a5 == a6)
  {
    BOOL v15 = 1;
    unint64_t v29 = a6;
    goto LABEL_128;
  }
  unint64_t v115 = *a5;
  unint64_t v113 = *a10;
  int v30 = v102 + __src;
  uint64_t v95 = 8 * v110;
  int v93 = v102 + __src;
  int v31 = !v109;
  if (v112 != v102 + __src) {
    int v31 = 1;
  }
  int v88 = v31;
  size_t __n = (8 * (v112 - (v102 + __src)));
  v87 = (char *)this + 72;
  char v32 = v111;
  if (v112 == v30) {
    char v32 = 0;
  }
  char v91 = v32;
  uint64_t v97 = (v112 - v30);
  uint64_t v92 = a2 << 8;
  uint64_t v89 = 8 * v92;
  uint64_t v90 = 8 * (v112 - (v102 + __src));
  while (1)
  {
    unint64_t v29 = v115;
    while (!(*(unsigned int (**)(void))(*((void *)this + 787) + 32))(*(void *)&a3[v29]))
    {
      unint64_t v29 = (v29 + 8) % a4;
      if (v29 == a6)
      {
        BOOL v15 = 1;
        goto LABEL_126;
      }
    }
    __srca = &a3[v29];
    unint64_t v33 = v29;
    while (1)
    {
      unint64_t v33 = (v33 + 8) % a4;
      if (v33 == a6) {
        break;
      }
      if ((*(uint64_t (**)(void))(*((void *)this + 787) + 32))(*(void *)&a3[v33])) {
        goto LABEL_53;
      }
    }
    unint64_t v33 = a6;
    if (!a11)
    {
      BOOL v15 = 1;
      goto LABEL_127;
    }
LABEL_53:
    unint64_t v34 = v33;
    size_t v35 = a4 - v29;
    unint64_t v115 = v34;
    unint64_t v36 = (a4 - v29 + v34) % a4;
    if (v36 < *((unsigned int *)this + 1577))
    {
      BOOL v15 = 0;
      goto LABEL_127;
    }
    if (v36 > AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize)
    {
      unint64_t v77 = (a4 - v29 + v34) % a4;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Source sample size is unexpectedly larger than the maximum! (%llu > %u)\n", "AGXGPURawCounterImpl.mm", 1481, "postProcessData", v36, AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v125 = 136316162;
        v126 = "AGXGPURawCounterImpl.mm";
        __int16 v127 = 1024;
        int v128 = 1481;
        __int16 v129 = 2080;
        v130 = "postProcessData";
        __int16 v131 = 2048;
        v132 = (const void *)v77;
        __int16 v133 = 1024;
        LODWORD(v134) = AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize;
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Source sample size is unexpectedly larger than the maximum! (%llu > %u)\n", v125, 0x2Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v125 = 136316162;
        v126 = "AGXGPURawCounterImpl.mm";
        __int16 v127 = 1024;
        int v128 = 1481;
        __int16 v129 = 2080;
        v130 = "postProcessData";
        __int16 v131 = 2048;
        v132 = (const void *)v77;
        __int16 v133 = 1024;
        LODWORD(v134) = AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcSampleMaxSize;
        _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Source sample size is unexpectedly larger than the maximum! (%llu > %u)\n", v125, 0x2Cu);
      }
      BOOL v15 = 0;
      int v27 = a10;
      unint64_t v28 = v113;
      goto LABEL_128;
    }
    unint64_t v98 = (a4 - v29 + v34) % a4;
    unint64_t v85 = v29;
    if (v29 >= v34)
    {
      memcpy(__dst, __srca, v35);
      memcpy(&__dst[v35], a3, v98 - v35);
      __srca = (const unsigned __int8 *)__dst;
    }
    uint64_t v116 = 0;
    uint64_t v116 = *(void *)(*((void *)this + 793) + 8 * a2);
    unsigned int v37 = (*(uint64_t (**)(const unsigned __int8 *, unint64_t *, uint64_t *))(*((void *)this + 787)
                                                                                            + 16))(__srca, &v120, &v116);
    uint64_t v38 = v120 & 0xF;
    if (v38 != 5) {
      break;
    }
    uint64_t v39 = 8 * a2;
    *(void *)(*((void *)this + 792) + v39) = v121;
    *(void *)(*((void *)this + 793) + v39) = v116;
    if ((v101 & 4) != 0)
    {
      if (v112 == v93) {
        goto LABEL_79;
      }
LABEL_78:
      bzero((void *)(*((void *)this + 794) + 8 * v92), v90);
      goto LABEL_79;
    }
    if (v91) {
      goto LABEL_78;
    }
LABEL_79:
    if ((v100 & 2) != 0)
    {
      uint64_t v50 = *(unsigned int *)(*((void *)this + 787) + 40);
      bzero((void *)(*((void *)this + 795) + 24 * v50 * a2), 24 * v50);
    }
LABEL_125:
    BOOL v15 = 1;
    if (v115 == a6)
    {
LABEL_126:
      unint64_t v29 = a6;
LABEL_127:
      int v27 = a10;
      unint64_t v28 = v113;
      goto LABEL_128;
    }
  }
  uint64_t v40 = v98 - v37;
  v41 = (const void *)(*((unsigned int *)this + 1579)
                     + (v40 - v95)
                     * AGXGPURawCounterImpl::SourceImpl::postProcessData(unsigned int,unsigned char const*,unsigned long long,unsigned long long *,unsigned long long,unsigned char *,unsigned long long,unsigned long long,unsigned long long *,BOOL)::kSrcPayloadScale);
  v84 = (const void *)((a8 - a9 + 8 + v113) / a8 * a8 - (8 - a9 + v113));
  BOOL v15 = v84 < v41;
  if (v84 < v41) {
    goto LABEL_149;
  }
  if (v117[2] >= v41)
  {
    uint64_t v42 = *((void *)this + 792);
    if (v121 < *(void *)(v42 + 8 * a2)) {
      goto LABEL_148;
    }
    v117[3] = 0;
    if (v40 < *((_DWORD *)this + 1578)) {
      goto LABEL_148;
    }
    uint64_t v43 = v37;
    if ((v100 & 2) != 0)
    {
      if (!AGXGPURawCounterImpl::SourceImpl::generateKickTimestampSamples(this, a2, *(void *)(v42 + 8 * a2), v121, (uint64_t)__srca, v37, (uint64_t)v135, &v118))goto LABEL_148; {
      if (v117[1])
      }
        v44 = (unint64_t *)((char *)v117[1] + (unint64_t)v117[3]);
      else {
        v44 = 0;
      }
      unsigned int v45 = AGXGPURawCounterImpl::SourceImpl::emitKickTimestampSamples((uint64_t)this, a2, (uint64_t)v135, v118, v121, v44);
      StackAllocator::reserve((StackAllocator *)v117, v45);
      v43 += v95;
      uint64_t v38 = v120 & 0xF;
    }
    if (v38 != 5)
    {
      v103 = &__srca[v43];
      v125[0] = 0;
      unsigned int SampleType = generateSampleType((uint64_t *)&v120, (BOOL *)v125);
      int v47 = v88;
      if (SampleType < 6) {
        int v47 = 1;
      }
      if (v47 != 1) {
        goto LABEL_98;
      }
      char v48 = SampleType;
      *(void *)StackAllocator::reserve((StackAllocator *)v117, 8u) = 0x52544E4357525047;
      v49 = (v99 & 1) != 0 ? (unsigned char *)StackAllocator::reserve((StackAllocator *)v117, 0x20u) : v119;
      char v51 = *((_DWORD *)this + 7);
      *(_DWORD *)v49 = v122;
      v49[4] = 4;
      *((_WORD *)v49 + 3) = -1519;
      unint64_t v52 = v120;
      *((void *)v49 + 1) = v121;
      *((_DWORD *)v49 + 4) = v123;
      *((_DWORD *)v49 + 5) = v52 >> 16;
      v49[24] = v51;
      v49[25] = a2;
      v49[26] = v124 & 0x3F;
      v49[5] = v48;
      v49[27] = *((unsigned char *)this + 6216) - *((_DWORD *)this + 1556);
      copyMetaCounterList((StackAllocator *)v117, (unsigned int *)v49, (uint64_t)v87, *((_DWORD *)this + 1555));
      if (v112 == v93)
      {
LABEL_98:
        v57 = &__srca[v43];
LABEL_99:
        if (v109)
        {
LABEL_100:
          v61 = v57;
          int v62 = __srca + v98;
          if (v57 + 32 <= &__srca[v98])
          {
            *(void *)StackAllocator::reserve((StackAllocator *)v117, 8u) = 0x52544E4357525047;
            v63 = (v99 & 1) != 0 ? (unsigned char *)StackAllocator::reserve((StackAllocator *)v117, 0x20u) : v119;
            unsigned int v64 = v62 - v61;
            unsigned int v65 = (v62 - v61) & 0xFFFFFFE0;
            char v66 = *((_DWORD *)this + 7);
            *(_DWORD *)v63 = v122;
            v63[4] = 4;
            *((_WORD *)v63 + 3) = -1519;
            unint64_t v67 = v120;
            *((void *)v63 + 1) = v121;
            *((_DWORD *)v63 + 4) = v123;
            *((_DWORD *)v63 + 5) = v67 >> 16;
            v63[24] = v66;
            v63[25] = a2;
            v63[26] = v124 & 0x3F;
            v63[5] = 7;
            unsigned int __srcb = v64;
            v63[27] = (v64 >> 3) & 0xFC;
            copyMetaCounterList((StackAllocator *)v117, (unsigned int *)v63, (uint64_t)v87, *((_DWORD *)this + 1555));
            v68 = (void *)StackAllocator::reserve((StackAllocator *)v117, v65);
            if (v65 && v68 != 0) {
              memcpy(v68, v61, __srcb & 0xFFFFFFE0);
            }
          }
        }
      }
      else
      {
        v53 = (void *)StackAllocator::reserve((StackAllocator *)v117, __n);
        if ((*((unsigned char *)this + 36) & 1) == 0)
        {
          v54 = v53;
          bzero(v53, __n);
          v55 = v54;
          uint64_t v56 = 0;
          int v83 = v125[0];
          v57 = v103;
          while (1)
          {
            v59 = (char *)this + 24 * (v56 + *((_DWORD *)this + 1555));
            v96 = v55;
            v104 = v57;
            size_t v94 = (unint64_t)*((unsigned int *)v59 + 22) >> 3;
            memcpy(v55, v57, v94);
            if (*((_DWORD *)v59 + 20) >= *(_DWORD *)(*((void *)this + 1) + 676))
            {
              uint64_t v60 = *((void *)this + 794);
              if (v111 && (*(unsigned char *)(*((void *)v59 + 9) + 48) & 1) != 0)
              {
                if ((v101 & 4) == 0)
                {
                  if (v83)
                  {
                    *(void *)&buf[8 * v56] = *v96;
                    void *v96 = 0;
                  }
                  else
                  {
                    *v96 += *(void *)(v60 + v89 + 8 * v56);
                    *(void *)&buf[8 * v56] = 0;
                  }
                  goto LABEL_86;
                }
                if (v83)
                {
                  *(void *)&buf[8 * v56] = *(void *)(v60 + v89 + 8 * v56);
                  void *v96 = 0;
                  goto LABEL_86;
                }
              }
              else if ((v101 & 4) == 0)
              {
                goto LABEL_86;
              }
              uint64_t v58 = *v96;
              *(void *)&buf[8 * v56] = *v96;
              void *v96 = v58 - *(void *)(v60 + v89 + 8 * v56);
            }
LABEL_86:
            v57 = &v104[v94 & 0x1FFFFFFE];
            v55 = v96 + 1;
            if (v97 == ++v56) {
              goto LABEL_99;
            }
          }
        }
        memcpy(v53, v103, __n);
        v57 = &v103[2 * (__n >> 1)];
        if (v109) {
          goto LABEL_100;
        }
      }
    }
    v70 = (char *)v117[3];
    if (v117[3] > v84)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Insufficient free space in the final destination buffer!\n", "AGXGPURawCounterImpl.mm", 1767, "postProcessData");
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v125 = 136315650;
        v126 = "AGXGPURawCounterImpl.mm";
        __int16 v127 = 1024;
        int v128 = 1767;
        __int16 v129 = 2080;
        v130 = "postProcessData";
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient free space in the final destination buffer!\n", v125, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v125 = 136315650;
        v126 = "AGXGPURawCounterImpl.mm";
        __int16 v127 = 1024;
        int v128 = 1767;
        __int16 v129 = 2080;
        v130 = "postProcessData";
        v78 = &_os_log_internal;
        v79 = "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient free space in the final destination buffer!\n";
        uint32_t v80 = 28;
LABEL_147:
        _os_log_impl(&dword_23F075000, v78, OS_LOG_TYPE_INFO, v79, v125, v80);
      }
      goto LABEL_148;
    }
    if ((char *)v117[3] + v113 <= (const void *)a8)
    {
      v73 = &a7[v113];
      v71 = (char *)v117[1];
      v72 = (char *)v117[3];
    }
    else
    {
      __srcc = (char *)v117[1];
      memcpy(&a7[v113], v117[1], a8 - v113);
      v71 = &__srcc[a8 - v113];
      v72 = &v70[-(a8 - v113)];
      v73 = a7;
    }
    memcpy(v73, v71, (size_t)v72);
    *(void *)(*((void *)this + 792) + 8 * a2) = v121;
    if ((v120 & 0xF) == 5) {
      goto LABEL_121;
    }
    *(void *)(*((void *)this + 793) + 8 * a2) = v116;
    if ((v101 & 4) != 0)
    {
      if (v112 == v93)
      {
LABEL_121:
        uint64_t v74 = v118;
        if (v118)
        {
          v75 = v135;
          do
          {
            uint64_t v76 = *((void *)this + 795) + 24 * (v75[17] + *(_DWORD *)(*((void *)this + 787) + 40) * a2);
            *(_OWORD *)uint64_t v76 = *(_OWORD *)v75;
            *(void *)(v76 + 16) = *((void *)v75 + 2);
            v75 += 24;
            --v74;
          }
          while (v74);
        }
        unint64_t v113 = ((unint64_t)v117[3] + v113) % a8;
        goto LABEL_125;
      }
    }
    else if ((v91 & 1) == 0)
    {
      goto LABEL_121;
    }
    memcpy((void *)(*((void *)this + 794) + 8 * v92), buf, v90);
    goto LABEL_121;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Potential intermediate buffer overflow! (bufferSize=%llu processedPayloadSizeMax=%llu)\n", "AGXGPURawCounterImpl.mm", 1561, "postProcessData", v117[2], v41);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v125 = 136316162;
    v126 = "AGXGPURawCounterImpl.mm";
    __int16 v127 = 1024;
    int v128 = 1561;
    __int16 v129 = 2080;
    v130 = "postProcessData";
    __int16 v131 = 2048;
    v132 = v117[2];
    __int16 v133 = 2048;
    v134 = v41;
    _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Potential intermediate buffer overflow! (bufferSize=%llu processedPayloadSizeMax=%llu)\n", v125, 0x30u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v125 = 136316162;
    v126 = "AGXGPURawCounterImpl.mm";
    __int16 v127 = 1024;
    int v128 = 1561;
    __int16 v129 = 2080;
    v130 = "postProcessData";
    __int16 v131 = 2048;
    v132 = v117[2];
    __int16 v133 = 2048;
    v134 = v41;
    v78 = &_os_log_internal;
    v79 = "AGXGRC:AGXGRC:%s:%d:%s: *** Potential intermediate buffer overflow! (bufferSize=%llu processedPayloadSizeMax=%llu)\n";
    uint32_t v80 = 48;
    goto LABEL_147;
  }
LABEL_148:
  BOOL v15 = 0;
LABEL_149:
  int v27 = a10;
  unint64_t v28 = v113;
  unint64_t v29 = v85;
LABEL_128:
  *a5 = v29;
  *int v27 = v28;
  if (LOBYTE(v117[0])) {
    free((void *)v117[1]);
  }
  if (__dst) {
    operator delete(__dst);
  }
  return v15;
}

void sub_23F07C764(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,uint64_t a44,uint64_t a45,char a46,void *a47)
{
  if (a46)
  {
    free(a47);
    if (!__p) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if (!__p)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void StackAllocator::init(StackAllocator *this, uint64_t a2)
{
  *(unsigned char *)this = 1;
  *((_DWORD *)this + 1) = 8;
  size_t v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  *((void *)this + 2) = v3;
  *((void *)this + 3) = 0;
  malloc_type_posix_memalign((void **)this + 1, 8uLL, v3, 0x852F15E8uLL);
  int v4 = (void *)*((void *)this + 1);
  size_t v5 = *((void *)this + 2);
  bzero(v4, v5);
}

BOOL AGXGPURawCounterImpl::SourceImpl::generateKickTimestampSamples(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int *a8)
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v15 = a1[795];
  uint64_t v16 = a1[787];
  uint64_t v17 = *(unsigned int *)(v16 + 40);
  bzero(v106, 0x280uLL);
  if (a3)
  {
    unint64_t v18 = a3 - *(void *)(a1[1] + 704);
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v19 = 0;
    uint64_t v20 = *(unsigned int *)(v16 + 56);
    if (!v20)
    {
LABEL_34:
      *a8 = 0;
      return 1;
    }
    goto LABEL_7;
  }
  unint64_t v18 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v19 = a4 - *(void *)(a1[1] + 704);
  uint64_t v20 = *(unsigned int *)(v16 + 56);
  if (!v20) {
    goto LABEL_34;
  }
LABEL_7:
  uint64_t v21 = 0;
  char v22 = 0;
  char v23 = (long long *)(v15 + 24 * (v17 * a2));
  uint64_t v24 = (unsigned char *)(*(void *)(v16 + 48) + 2);
  do
  {
    int v27 = &v106[80 * (v21 >> 1)];
    unsigned int v28 = *((_DWORD *)v27 + 18);
    if (v28 >= 2)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Unexpected number of kickslot data to be added to the queue!\n", "AGXGPURawCounterImpl.mm", 2252, "generateKickTimestampSamples");
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 136315650;
        *(void *)((char *)buf + 4) = "AGXGPURawCounterImpl.mm";
        WORD2(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 6) = 2252;
        WORD1(buf[2]) = 2080;
        *(void *)((char *)&buf[2] + 4) = "generateKickTimestampSamples";
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Unexpected number of kickslot data to be added to the queue!\n", (uint8_t *)buf, 0x1Cu);
      }
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      if (result)
      {
        LODWORD(buf[0]) = 136315650;
        *(void *)((char *)buf + 4) = "AGXGPURawCounterImpl.mm";
        WORD2(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 6) = 2252;
        WORD1(buf[2]) = 2080;
        *(void *)((char *)&buf[2] + 4) = "generateKickTimestampSamples";
        _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Unexpected number of kickslot data to be added to the queue!\n", (uint8_t *)buf, 0x1Cu);
        return 0;
      }
      return result;
    }
    uint64_t v29 = *(void *)(a5 + 8 * *(v24 - 2));
    if (v29)
    {
      unint64_t v30 = *(void *)(a5 + a6 + 8 * v21);
      BOOL v31 = v18 > v30 || v30 > v19;
      if (!v31 && *((void *)v23 + 3 * (v21 >> 1)) < v30)
      {
        *(void *)&v27[24 * v28] = v30;
        char v32 = &v27[24 * v28];
        *((void *)v32 + 1) = v29;
        v32[16] = *(v24 - 1);
        v32[17] = v21 >> 1;
        v32[18] = *v24;
        *((_DWORD *)v27 + 18) = v28 + 1;
        if (v28 != 1) {
          goto LABEL_9;
        }
        unint64_t v34 = v27 + 24;
        unint64_t v33 = *((void *)v27 + 3);
        if (v33 < *(void *)v27) {
          goto LABEL_9;
        }
        if (v33 > *(void *)v27) {
          goto LABEL_8;
        }
        if (v27[40] != v27[16]) {
          goto LABEL_9;
        }
        int v35 = v27[42];
        char v22 = 1;
        if ((v35 - 8) <= 5 && (v35 & 1) == 0)
        {
          int v36 = v27[18];
          if (v36 - 8) <= 5 && (v36)
          {
LABEL_8:
            uint64_t v25 = *((void *)v27 + 2);
            long long v26 = *(_OWORD *)v27;
            *(_OWORD *)int v27 = *v34;
            *((void *)v27 + 2) = *((void *)v27 + 5);
            *unint64_t v34 = v26;
            *((void *)v27 + 5) = v25;
LABEL_9:
            char v22 = 1;
          }
        }
      }
    }
    ++v21;
    v24 += 3;
  }
  while (v20 != v21);
  if ((v22 & 1) == 0) {
    goto LABEL_34;
  }
  if (!v17)
  {
    unsigned int v59 = 0;
    goto LABEL_94;
  }
  uint64_t v38 = 0;
  while (2)
  {
    uint64_t v42 = &v106[v38];
    unsigned int v43 = *(_DWORD *)&v106[v38 + 72];
    if (v43)
    {
      unsigned int v44 = v43 - 1;
      if (!*(void *)v23)
      {
        int v52 = v106[24 * v44 + 18 + v38];
        unsigned int v49 = v52 - 8;
        int v51 = v52 & 1;
        goto LABEL_45;
      }
      int v45 = *((unsigned __int8 *)v23 + 18);
      unsigned int v46 = v45 - 8;
      int v47 = v45 & 1;
      int v48 = v106[24 * v44 + 18 + v38];
      unsigned int v49 = v48 - 8;
      if (v46 <= 5 && v47 == 0)
      {
        int v54 = v48 & 1;
        if (v49 <= 5 && v54 == 0)
        {
          uint64_t v39 = &v106[24 * v43 + v38];
          *((_DWORD *)v42 + 18) = v43 + 1;
          long long v40 = *v23;
          uint64_t v41 = *((void *)v23 + 2);
          *((void *)v39 + 2) = v41;
          *(_OWORD *)uint64_t v39 = v40;
          v39[18] = BYTE2(v41) + 1;
          *(void *)uint64_t v39 = *(void *)&v106[24 * v44 + v38] - 1;
        }
        else
        {
          uint64_t v56 = *((void *)v23 + 1);
          v57 = &v106[24 * v44 + v38];
          if (v56 != *((void *)v57 + 1)) {
            *((void *)v57 + 1) = v56;
          }
        }
      }
      else
      {
        int v51 = v48 & 1;
LABEL_45:
        if (v49 <= 5 && v51 != 0) {
          *((_DWORD *)v42 + 18) = v44;
        }
      }
    }
    v38 += 80;
    char v23 = (long long *)((char *)v23 + 24);
    if (80 * v17 != v38) {
      continue;
    }
    break;
  }
  uint64_t v58 = 0;
  unsigned int v59 = 0;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  memset(buf, 0, sizeof(buf));
  int64x2_t v60 = vdupq_n_s64(0x30uLL);
  int64x2_t v61 = vdupq_n_s64(4uLL);
  int v62 = v106;
  while (2)
  {
    uint64_t v63 = *(unsigned int *)&v106[80 * v58 + 72];
    if (v63)
    {
      if (v63 <= 9 || __CFADD__(v59, v63 - 1))
      {
        uint64_t v66 = 0;
        goto LABEL_63;
      }
      uint64_t v66 = v63 & 0xFFFFFFFC;
      unsigned int v67 = v59;
      uint64_t v68 = v66;
      int64x2_t v69 = (int64x2_t)xmmword_23F0888D0;
      do
      {
        v70.i64[0] = 24 * v69.i64[0];
        v70.i64[1] = 24 * v69.i64[1];
        int64x2_t v71 = vaddq_s64(vdupq_n_s64((unint64_t)&v106[80 * v58]), v70);
        v72 = (int64x2_t *)&buf[v67];
        int64x2_t *v72 = v71;
        v72[1] = vaddq_s64(v71, v60);
        int64x2_t v69 = vaddq_s64(v69, v61);
        v67 += 4;
        v68 -= 4;
      }
      while (v68);
      v59 += v66;
      if (v66 != v63)
      {
LABEL_63:
        uint64_t v64 = v63 - v66;
        unsigned int v65 = &v62[24 * v66];
        do
        {
          buf[v59++] = v65;
          v65 += 24;
          --v64;
        }
        while (v64);
      }
    }
    ++v58;
    v62 += 80;
    if (v58 != v17) {
      continue;
    }
    break;
  }
  if (v59)
  {
    uint64_t v73 = 0;
    uint64_t v74 = v59;
    unsigned int v75 = v59 - 1;
    uint64_t v76 = (unint64_t **)&buf[1];
    do
    {
      uint64_t v77 = v73 + 1;
      if (v73 + 1 < (unint64_t)v59)
      {
        v78 = v76;
        unsigned int v79 = v75;
        do
        {
          uint64_t v80 = buf[v73];
          int v81 = *v78;
          unint64_t v82 = **v78;
          if (*(void *)v80 >= v82)
          {
            if (*(void *)v80 > v82) {
              goto LABEL_74;
            }
            if (*(unsigned __int8 *)(v80 + 16) == *((unsigned __int8 *)v81 + 16))
            {
              int v83 = *(unsigned __int8 *)(v80 + 18);
              unsigned int v84 = v83 - 8;
              int v85 = v83 & 1;
              if (v84 <= 5 && v85 == 0)
              {
                int v87 = *((unsigned __int8 *)v81 + 18);
                unsigned int v88 = v87 - 8;
                int v89 = v87 & 1;
                if (v88 <= 5 && v89 != 0)
                {
LABEL_74:
                  buf[v73] = v81;
                  NSObject *v78 = (unint64_t *)v80;
                }
              }
            }
          }
          ++v78;
          --v79;
        }
        while (v79);
      }
      --v75;
      ++v76;
      ++v73;
    }
    while (v77 != v59);
    char v91 = buf;
    do
    {
      uint64_t v92 = *v91++;
      uint64_t v93 = *(void *)(v92 + 16);
      *(_OWORD *)a7 = *(_OWORD *)v92;
      *(void *)(a7 + 16) = v93;
      a7 += 24;
      --v74;
    }
    while (v74);
  }
LABEL_94:
  *a8 = v59;
  return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::emitKickTimestampSamples(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unint64_t a5, unint64_t *a6)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (!a4) {
    return 0;
  }
  unint64_t v6 = a5;
  uint64_t v9 = 0;
  unint64_t v38 = a2;
  uint64_t v40 = a4;
  uint64_t v37 = a1 + 72;
  uint64_t v10 = &_os_log_internal;
  int v36 = (int)a6;
  uint64_t v11 = a6;
  do
  {
    uint64_t v12 = a3 + 24 * v9;
    uint64_t v15 = *(void *)(v12 + 8);
    int v14 = (unsigned int *)(v12 + 8);
    uint64_t v13 = v15;
    if (v15)
    {
      unint64_t v16 = *(void *)(*(void *)(a1 + 8) + 704) + *(void *)(a3 + 24 * v9);
      if (v16 <= v6)
      {
        *v11++ = 0x52544E4357525047;
        unint64_t v25 = *(unsigned int *)(a1 + 6220);
        if (v25)
        {
          unint64_t v26 = 0;
          uint64_t v27 = a3 + 24 * v9;
          uint64_t v39 = (unsigned __int8 *)(v27 + 16);
          unsigned int v28 = (unsigned __int8 *)(v27 + 18);
          uint64_t v29 = v37;
          do
          {
            switch(*(void *)(*(void *)v29 + 32))
            {
              case 0:
                *uint64_t v11 = 0;
                break;
              case 1:
                *uint64_t v11 = v16;
                break;
              case 2:
                *uint64_t v11 = *v28;
                break;
              case 3:
                *uint64_t v11 = v14[1];
                break;
              case 4:
                *uint64_t v11 = *v14;
                break;
              case 5:
                *uint64_t v11 = *v39;
                break;
              case 6:
                *uint64_t v11 = *(unsigned int *)(a1 + 28);
                break;
              case 7:
                *uint64_t v11 = v38;
                break;
              default:
                fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", "AGXGPURawCounterImpl.mm", 2537, "emitKickTimestampSamples");
                unint64_t v30 = &_os_log_internal;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  unsigned int v43 = "AGXGPURawCounterImpl.mm";
                  __int16 v44 = 1024;
                  int v45 = 2537;
                  __int16 v46 = 2080;
                  int v47 = "emitKickTimestampSamples";
                  _os_log_error_impl(&dword_23F075000, v30, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
                }
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  unsigned int v43 = "AGXGPURawCounterImpl.mm";
                  __int16 v44 = 1024;
                  int v45 = 2537;
                  __int16 v46 = 2080;
                  int v47 = "emitKickTimestampSamples";
                  _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
                }
                *uint64_t v11 = 0;
                unint64_t v25 = *(unsigned int *)(a1 + 6220);
                break;
            }
            ++v26;
            ++v11;
            v29 += 24;
          }
          while (v26 < v25);
        }
      }
      else
      {
        uint64_t v17 = a3 + 24 * v9;
        int v19 = *(unsigned __int8 *)(v17 + 18);
        unint64_t v18 = (unsigned __int8 *)(v17 + 18);
        uint64_t v20 = v18 - 2;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** kick_timestamp > rde_sample_timestamp, [%u] timestampMax=%16llx timestamp=%16llx type=%2u encoderId=%8x traceId=%8x slotIdx=%2u\n\n", "AGXGPURawCounterImpl.mm", 2494, "emitKickTimestampSamples", v9, v6, v16, v19, HIDWORD(v13), v13, *(v18 - 2));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v31 = *v18;
          uint64_t v32 = *(void *)v14;
          uint64_t v33 = HIDWORD(*(void *)v14);
          int v34 = *v20;
          *(_DWORD *)buf = 136317442;
          unsigned int v43 = "AGXGPURawCounterImpl.mm";
          __int16 v44 = 1024;
          int v45 = 2494;
          __int16 v46 = 2080;
          int v47 = "emitKickTimestampSamples";
          __int16 v48 = 1024;
          int v49 = v9;
          __int16 v50 = 2048;
          unint64_t v51 = v6;
          __int16 v52 = 2048;
          unint64_t v53 = v16;
          __int16 v54 = 1024;
          int v55 = v31;
          __int16 v56 = 1024;
          int v57 = v33;
          __int16 v58 = 1024;
          int v59 = v32;
          __int16 v60 = 1024;
          int v61 = v34;
          _os_log_error_impl(&dword_23F075000, v10, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** kick_timestamp > rde_sample_timestamp, [%u] timestampMax=%16llx timestamp=%16llx type=%2u encoderId=%8x traceId=%8x slotIdx=%2u\n\n", buf, 0x4Eu);
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v21 = *v18;
          uint64_t v22 = *(void *)v14;
          uint64_t v23 = HIDWORD(*(void *)v14);
          int v24 = *v20;
          *(_DWORD *)buf = 136317442;
          unsigned int v43 = "AGXGPURawCounterImpl.mm";
          __int16 v44 = 1024;
          int v45 = 2494;
          __int16 v46 = 2080;
          int v47 = "emitKickTimestampSamples";
          __int16 v48 = 1024;
          int v49 = v9;
          __int16 v50 = 2048;
          unint64_t v51 = v6;
          __int16 v52 = 2048;
          unint64_t v53 = v16;
          __int16 v54 = 1024;
          int v55 = v21;
          __int16 v56 = 1024;
          int v57 = v23;
          __int16 v58 = 1024;
          int v59 = v22;
          __int16 v60 = 1024;
          int v61 = v24;
          _os_log_impl(&dword_23F075000, v10, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** kick_timestamp > rde_sample_timestamp, [%u] timestampMax=%16llx timestamp=%16llx type=%2u encoderId=%8x traceId=%8x slotIdx=%2u\n\n", buf, 0x4Eu);
        }
      }
    }
    ++v9;
    unint64_t v6 = a5;
    uint64_t v10 = &_os_log_internal;
  }
  while (v9 != v40);
  return (v11 - v36);
}

uint64_t StackAllocator::reserve(StackAllocator *this, unsigned int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v4 = *((void *)this + 2);
  uint64_t v3 = *((void *)this + 3);
  if (v3 + (unint64_t)a2 <= v4)
  {
    uint64_t result = *((void *)this + 1) + v3;
    *((void *)this + 3) = ((a2 + (unint64_t)*((unsigned int *)this + 1) - 1) & -(uint64_t)*((unsigned int *)this
                                                                                                  + 1))
                          + v3;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Error, reserving more than available memory! (%u > %llu)\n", "AGXGPURawCounterImpl.mm", 223, "reserve", a2, v4);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *((void *)this + 2);
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = "AGXGPURawCounterImpl.mm";
      __int16 v11 = 1024;
      int v12 = 223;
      __int16 v13 = 2080;
      int v14 = "reserve";
      __int16 v15 = 1024;
      unsigned int v16 = a2;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, reserving more than available memory! (%u > %llu)\n", buf, 0x2Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *((void *)this + 2);
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = "AGXGPURawCounterImpl.mm";
      __int16 v11 = 1024;
      int v12 = 223;
      __int16 v13 = 2080;
      int v14 = "reserve";
      __int16 v15 = 1024;
      unsigned int v16 = a2;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, reserving more than available memory! (%u > %llu)\n", buf, 0x2Cu);
    }
    return 0;
  }
  return result;
}

uint64_t generateSampleType(uint64_t *a1, BOOL *a2)
{
  uint64_t v2 = *a1;
  if ((~*(_DWORD *)a1 & 0xC000) != 0)
  {
    if ((v2 & 0xF) - 1 > 1)
    {
      return 14;
    }
    else
    {
      *a2 = (*a1 & 0xF) == 1;
      return (((*(_DWORD *)a1 >> 13) & 6) + (*(unsigned char *)a1 & 0xF) - 1);
    }
  }
  else if ((v2 & 0xF) != 0)
  {
    return 14;
  }
  else
  {
    return 6;
  }
}

void copyMetaCounterList(StackAllocator *a1, unsigned int *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v7 = (void *)StackAllocator::reserve(a1, 8 * a4);
    uint64_t v8 = (FILE **)MEMORY[0x263EF8348];
    uint64_t v9 = a4;
    uint64_t v10 = &_os_log_internal;
    do
    {
      switch(*(void *)(*(void *)a3 + 32))
      {
        case 0:
          uint64_t v11 = *a2;
          break;
        case 1:
          uint64_t v11 = *((void *)a2 + 1);
          break;
        case 2:
          uint64_t v11 = *((unsigned __int8 *)a2 + 5);
          break;
        case 3:
          uint64_t v11 = a2[4];
          break;
        case 4:
          uint64_t v11 = a2[5];
          break;
        case 5:
          uint64_t v11 = *((unsigned __int8 *)a2 + 26);
          break;
        case 6:
          uint64_t v11 = *((unsigned __int8 *)a2 + 24);
          break;
        case 7:
          uint64_t v11 = *((unsigned __int8 *)a2 + 25);
          break;
        default:
          fprintf(*v8, "AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", "AGXGPURawCounterImpl.mm", 1247, "copyMetaCounterList");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v13 = "AGXGPURawCounterImpl.mm";
            __int16 v14 = 1024;
            int v15 = 1247;
            __int16 v16 = 2080;
            __int16 v17 = "copyMetaCounterList";
            _os_log_error_impl(&dword_23F075000, v10, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
          }
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v13 = "AGXGPURawCounterImpl.mm";
            __int16 v14 = 1024;
            int v15 = 1247;
            __int16 v16 = 2080;
            __int16 v17 = "copyMetaCounterList";
            _os_log_impl(&dword_23F075000, v10, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Unknown meta counter type!\n", buf, 0x1Cu);
          }
          uint64_t v11 = 0;
          break;
      }
      *v7++ = v11;
      a3 += 24;
      --v9;
    }
    while (v9);
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::postProcessData(AGXGPURawCounterImpl::SourceImpl *this, unsigned int a2, const unsigned __int8 *a3, uint64_t a4, unint64_t *a5, unsigned __int8 *a6, uint64_t a7, unint64_t *a8, BOOL a9)
{
  uint64_t v9 = 0;
  if (a3 && a5 && a6 && a7 && a8)
  {
    if (a4)
    {
      uint64_t v9 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 200))(this);
      *a5 = 0;
      *a8 = 0;
    }
    else
    {
      *a5 = 0;
      *a8 = 0;
      return 1;
    }
  }
  return v9;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::ringBufferNum(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned int *)this + 1572);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::ringBuffer(AGXGPURawCounterImpl::SourceImpl *this, unsigned int a2)
{
  *(void *)&v22[5] = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 176))(this) <= a2)
  {
    uint64_t v6 = (FILE *)*MEMORY[0x263EF8348];
    int v7 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 176))(this);
    fprintf(v6, "AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)\n", "AGXGPURawCounterImpl.mm", 1141, "ringBuffer", a2, v7);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v13 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 176))(this);
      *(_DWORD *)buf = 136316162;
      __int16 v16 = "AGXGPURawCounterImpl.mm";
      __int16 v17 = 1024;
      int v18 = 1141;
      __int16 v19 = 2080;
      uint64_t v20 = "ringBuffer";
      __int16 v21 = 1024;
      *(_DWORD *)uint64_t v22 = a2;
      v22[2] = 1024;
      *(_DWORD *)&v22[3] = v13;
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)\n", buf, 0x28u);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v8 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 176))(this);
    *(_DWORD *)buf = 136316162;
    __int16 v16 = "AGXGPURawCounterImpl.mm";
    __int16 v17 = 1024;
    int v18 = 1141;
    __int16 v19 = 2080;
    uint64_t v20 = "ringBuffer";
    __int16 v21 = 1024;
    *(_DWORD *)uint64_t v22 = a2;
    v22[2] = 1024;
    *(_DWORD *)&v22[3] = v8;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)\n";
    uint32_t v11 = 40;
    goto LABEL_12;
  }
  uint64_t v4 = *((void *)this + 785);
  if (v4) {
    return *(void *)(v4 + 8 * a2);
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Ring buffers have not been allocated. Was sampling ever started on source %s?\n", "AGXGPURawCounterImpl.mm", 1147, "ringBuffer", *((const char **)this + 2));
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *((void *)this + 2);
    *(_DWORD *)buf = 136315906;
    __int16 v16 = "AGXGPURawCounterImpl.mm";
    __int16 v17 = 1024;
    int v18 = 1147;
    __int16 v19 = 2080;
    uint64_t v20 = "ringBuffer";
    __int16 v21 = 2080;
    *(void *)uint64_t v22 = v14;
    _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Ring buffers have not been allocated. Was sampling ever started on source %s?\n", buf, 0x26u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *((void *)this + 2);
    *(_DWORD *)buf = 136315906;
    __int16 v16 = "AGXGPURawCounterImpl.mm";
    __int16 v17 = 1024;
    int v18 = 1147;
    __int16 v19 = 2080;
    uint64_t v20 = "ringBuffer";
    __int16 v21 = 2080;
    *(void *)uint64_t v22 = v12;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "AGXGRC:AGXGRC:%s:%d:%s: *** Ring buffers have not been allocated. Was sampling ever started on source %s?\n";
    uint32_t v11 = 38;
LABEL_12:
    _os_log_impl(&dword_23F075000, v9, OS_LOG_TYPE_INFO, v10, buf, v11);
  }
  return 0;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::calcBufferSizeWithRingBufferSize(AGXGPURawCounterImpl::SourceImpl *this, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)this + 152);
    return v2();
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterImpl.mm", 1120, "calcBufferSizeWithRingBufferSize");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      size_t v5 = "AGXGPURawCounterImpl.mm";
      __int16 v6 = 1024;
      int v7 = 1120;
      __int16 v8 = 2080;
      uint64_t v9 = "calcBufferSizeWithRingBufferSize";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      size_t v5 = "AGXGPURawCounterImpl.mm";
      __int16 v6 = 1024;
      int v7 = 1120;
      __int16 v8 = 2080;
      uint64_t v9 = "calcBufferSizeWithRingBufferSize";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

unint64_t AGXGPURawCounterImpl::SourceImpl::alignBufferSize(AGXGPURawCounterImpl::SourceImpl *this, unint64_t a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2)
  {
    unint64_t v3 = *((unsigned int *)this + 1572);
    unint64_t v4 = 0x800000000uLL / (v3 << 14) * (v3 << 14);
    if (v4 >= a2) {
      unint64_t v4 = a2;
    }
    uint64_t v5 = v4 / v3 + 0x3FFF;
    uint64_t v6 = v5 & 0x1FFFFFC000;
    if ((v5 & 0x1FFFFFC000uLL) >= 0x40000000) {
      uint64_t v6 = 0x40000000;
    }
    BOOL v7 = (v5 & 0x1FFFFFC000) == 0;
    uint64_t v8 = 0x4000;
    if (v7) {
      uint64_t v6 = 0x4000;
    }
    if (!a3) {
      uint64_t v8 = 0;
    }
    return v8 + v6 * v3;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterImpl.mm", 1089, "alignBufferSize");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint32_t v11 = "AGXGPURawCounterImpl.mm";
      __int16 v12 = 1024;
      int v13 = 1089;
      __int16 v14 = 2080;
      int v15 = "alignBufferSize";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint32_t v11 = "AGXGPURawCounterImpl.mm";
      __int16 v12 = 1024;
      int v13 = 1089;
      __int16 v14 = 2080;
      int v15 = "alignBufferSize";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::bufferSize(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((void *)this + 782);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setBufferSize(AGXGPURawCounterImpl::SourceImpl *this, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(**((void **)this + 1) + 96))(*((void *)this + 1))) {
    (*(void (**)(void))(**((void **)this + 1) + 88))(*((void *)this + 1));
  }
  (*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0);
  if (*((void *)this + 781))
  {
    (*(void (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 240))(this);
    free(*((void **)this + 781));
    *((void *)this + 781) = 0;
    *((void *)this + 782) = 0;
  }
  if (a2)
  {
    memptr = 0;
    size_t v4 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, uint64_t, uint64_t))(*(void *)this + 152))(this, a2, 1);
    if (malloc_type_posix_memalign(&memptr, 0x4000uLL, v4, 0x1C021F86uLL)) {
      return 0;
    }
    bzero(memptr, v4);
    *((void *)this + 781) = memptr;
    *((void *)this + 782) = v4;
  }
  return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::flags(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned int *)this + 1560);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setFlags(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  *((_DWORD *)this + 156(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 112))(this) & a2;
  return 1;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::availableFlags(AGXGPURawCounterImpl::SourceImpl *this)
{
  if (*(_DWORD *)(*((void *)this + 787) + 56)) {
    return 7;
  }
  else {
    return 1;
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setOptions(AGXGPURawCounterImpl::SourceImpl *this, NSDictionary *a2)
{
  unint64_t v3 = a2;
  char v4 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *))(*(void *)this + 112))(this);
  uint64_t v5 = [(NSDictionary *)v3 objectForKeyedSubscript:@"RingBufferSizeInKB"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [v5 unsignedLongValue];
    int v7 = v6 << 10;
    if ((unint64_t)(v6 << 10) >= 0x800000000) {
      int v7 = 0;
    }
    unint64_t v8 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 160))(this, v7 & 0xFFFFFC00);
  }
  else
  {
    unint64_t v8 = -1;
  }
  uint64_t v9 = [(NSDictionary *)v3 objectForKeyedSubscript:@"SourceBufferSizeInKB"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = v9;
LABEL_12:
      unint64_t v11 = [v10 unsignedLongValue] << 10;
      if (v11 >= v8) {
        unint64_t v11 = v8;
      }
      if (v11 >= 0x800000000) {
        unint64_t v8 = 0x800000000;
      }
      else {
        unint64_t v8 = v11;
      }
      goto LABEL_18;
    }
  }
  uint64_t v10 = [(NSDictionary *)v3 objectForKeyedSubscript:@"BufferSizeInKB"];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_12;
    }
  }
  if (v8 == -1) {
    goto LABEL_19;
  }
LABEL_18:
  if ((*(unsigned int (**)(AGXGPURawCounterImpl::SourceImpl *, unint64_t))(*(void *)this + 136))(this, v8))
  {
LABEL_19:
    if (v4)
    {
      __int16 v14 = [(NSDictionary *)v3 objectForKeyedSubscript:@"ShaderProfiler"];
      uint64_t v12 = [v14 BOOLValue];

      if ((v4 & 2) == 0)
      {
LABEL_21:
        if ((v4 & 4) == 0)
        {
LABEL_32:
          uint64_t v13 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, uint64_t))(*(void *)this + 120))(this, v12);
          goto LABEL_33;
        }
LABEL_29:
        __int16 v17 = [(NSDictionary *)v3 objectForKeyedSubscript:@"SWResetOnRead"];
        int v18 = [v17 BOOLValue];

        if (v18) {
          uint64_t v12 = v12 | 4;
        }
        else {
          uint64_t v12 = v12;
        }
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v12 = 0;
      if ((v4 & 2) == 0) {
        goto LABEL_21;
      }
    }
    int v15 = [(NSDictionary *)v3 objectForKeyedSubscript:@"KickTimestamp"];
    int v16 = [v15 BOOLValue];

    if (v16) {
      uint64_t v12 = v12 | 2;
    }
    else {
      uint64_t v12 = v12;
    }
    if ((v4 & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_29;
  }
  uint64_t v13 = 0;
LABEL_33:

  return v13;
}

void sub_23F07E4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::triggers(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned int *)this + 1559);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::addTrigger(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if ((a2 - 1) < 2)
  {
    *(_DWORD *)(a1 + 6236) |= a2;
    unint64_t v8 = [v5 objectForKeyedSubscript:@"Period"];
    *(_DWORD *)(a1 + 6232) = [v8 unsignedLongValue];

    uint64_t v9 = 1;
  }
  else
  {
    if (a2 == 4)
    {
      int v7 = *(_DWORD *)(a1 + 6236) | 4;
      goto LABEL_7;
    }
    if (a2 == 8)
    {
      int v7 = *(_DWORD *)(a1 + 6236) | 8;
LABEL_7:
      *(_DWORD *)(a1 + 6236) = v7;
      uint64_t v9 = 1;
      goto LABEL_13;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", "AGXGPURawCounterImpl.mm", 911, "addTrigger", a2);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = "AGXGPURawCounterImpl.mm";
      __int16 v13 = 1024;
      int v14 = 911;
      __int16 v15 = 2080;
      int v16 = "addTrigger";
      __int16 v17 = 1024;
      int v18 = a2;
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = "AGXGPURawCounterImpl.mm";
      __int16 v13 = 1024;
      int v14 = 911;
      __int16 v15 = 2080;
      int v16 = "addTrigger";
      __int16 v17 = 1024;
      int v18 = a2;
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
    }
    uint64_t v9 = 0;
  }
LABEL_13:

  return v9;
}

void sub_23F07E700(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::clearTriggers(AGXGPURawCounterImpl::SourceImpl *this)
{
  uint64_t result = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0);
  *((_DWORD *)this + 1559) = 0;
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::availableTriggers(AGXGPURawCounterImpl::SourceImpl *this)
{
  int v1 = *((_DWORD *)this + 9);
  unsigned int v2 = 7;
  if ((v1 & 0x1E) != 0)
  {
    if (*(_DWORD *)(*((void *)this + 1) + 92) <= 0xCu) {
      unsigned int v2 = 7;
    }
    else {
      unsigned int v2 = 15;
    }
  }
  if (v1)
  {
    uint64_t v3 = *((void *)this + 1);
    unsigned int v4 = *(_DWORD *)(v3 + 92);
    if (v4 == 16)
    {
      if (*(_DWORD *)(v3 + 96) <= 1u) {
        goto LABEL_11;
      }
    }
    else if (v4 < 0x11)
    {
      goto LABEL_11;
    }
    v2 &= ~4u;
  }
LABEL_11:
  if ((v1 & 0x18) != 0) {
    return v2 & 0xFFFFFFFD;
  }
  else {
    return v2;
  }
}

uint64_t AGXGPURawCounterImpl::SourceImpl::addCounter(AGXGPURawCounterImpl::SourceImpl *this, const char *a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  (*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0);
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** counterName cannot be NULL!\n", "AGXGPURawCounterImpl.mm", 641, "addCounter");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v53 = 136315650;
      *(void *)&v53[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = 641;
      *(_WORD *)&v53[18] = 2080;
      *(void *)&v53[20] = "addCounter";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** counterName cannot be NULL!\n", v53, 0x1Cu);
    }
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    *(_DWORD *)unint64_t v53 = 136315650;
    *(void *)&v53[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&v53[12] = 1024;
    *(_DWORD *)&v53[14] = 641;
    *(_WORD *)&v53[18] = 2080;
    *(void *)&v53[20] = "addCounter";
    unint64_t v11 = &_os_log_internal;
    uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** counterName cannot be NULL!\n";
    __int16 v13 = v53;
    goto LABEL_13;
  }
  uint64_t v55 = 0;
  long long v54 = 0u;
  memset(v53, 0, sizeof(v53));
  if (a4 != -1)
  {
    if (a5 == -1)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s)! Both partition (0x%x) and select (0x%llx) must be specified!\n", "AGXGPURawCounterImpl.mm", 653, "addCounter", a2, a4, -1);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v44 = "AGXGPURawCounterImpl.mm";
        __int16 v45 = 1024;
        int v46 = 653;
        __int16 v47 = 2080;
        __int16 v48 = "addCounter";
        __int16 v49 = 2080;
        *(void *)__int16 v50 = a2;
        *(_WORD *)&v50[8] = 1024;
        *(_DWORD *)unint64_t v51 = a4;
        *(_WORD *)&v51[4] = 2048;
        uint64_t v52 = -1;
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s)! Both partition (0x%x) and select (0x%llx) must be specified!\n", buf, 0x36u);
      }
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136316418;
      __int16 v44 = "AGXGPURawCounterImpl.mm";
      __int16 v45 = 1024;
      int v46 = 653;
      __int16 v47 = 2080;
      __int16 v48 = "addCounter";
      __int16 v49 = 2080;
      *(void *)__int16 v50 = a2;
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)unint64_t v51 = a4;
      *(_WORD *)&v51[4] = 2048;
      uint64_t v52 = -1;
      unint64_t v11 = &_os_log_internal;
      uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s)! Both partition (0x%x) and select (0x%llx) "
            "must be specified!\n";
      __int16 v13 = buf;
      uint32_t v14 = 54;
      goto LABEL_55;
    }
    if (a4 == -2)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s) using GPURawCounter internal partition!\n", "AGXGPURawCounterImpl.mm", 659, "addCounter", a2);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v44 = "AGXGPURawCounterImpl.mm";
        __int16 v45 = 1024;
        int v46 = 659;
        __int16 v47 = 2080;
        __int16 v48 = "addCounter";
        __int16 v49 = 2080;
        *(void *)__int16 v50 = a2;
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s) using GPURawCounter internal partition!\n", buf, 0x26u);
      }
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315906;
      __int16 v44 = "AGXGPURawCounterImpl.mm";
      __int16 v45 = 1024;
      int v46 = 659;
      __int16 v47 = 2080;
      __int16 v48 = "addCounter";
      __int16 v49 = 2080;
      *(void *)__int16 v50 = a2;
      unint64_t v11 = &_os_log_internal;
      uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Cannot add user defined counter (%s) using GPURawCounter internal partition!\n";
LABEL_54:
      __int16 v13 = buf;
      uint32_t v14 = 38;
      goto LABEL_55;
    }
    *(void *)unint64_t v53 = a2;
    *(_DWORD *)&v53[28] = a4;
    __int16 v15 = (const char **)v53;
    *(void *)&long long v54 = a5;
LABEL_16:
    if (a4 == -1)
    {
      unsigned int v16 = *((_DWORD *)this + 1554);
      if (v16 == *((_DWORD *)this + 1555))
      {
        if (v16 != 16)
        {
          unsigned int v27 = v16 + 1;
          *((_DWORD *)this + 1555) = v16 + 1;
          unsigned int v28 = (char *)this + 24 * v16;
          *((void *)v28 + 9) = v15;
          *((_DWORD *)v28 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
          *(int32x2_t *)(v28 + 84) = vdup_n_s32(a3);
          *((_DWORD *)this + 1554) = v27;
          return 1;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Insufficient space to add metadata counter (%s)!\n", "AGXGPURawCounterImpl.mm", 705, "addCounter", *v15);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          unint64_t v38 = *v15;
          *(_DWORD *)buf = 136315906;
          __int16 v44 = "AGXGPURawCounterImpl.mm";
          __int16 v45 = 1024;
          int v46 = 705;
          __int16 v47 = 2080;
          __int16 v48 = "addCounter";
          __int16 v49 = 2080;
          *(void *)__int16 v50 = v38;
          _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add metadata counter (%s)!\n", buf, 0x26u);
        }
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
        if (!result) {
          return result;
        }
        __int16 v17 = *v15;
        *(_DWORD *)buf = 136315906;
        __int16 v44 = "AGXGPURawCounterImpl.mm";
        __int16 v45 = 1024;
        int v46 = 705;
        __int16 v47 = 2080;
        __int16 v48 = "addCounter";
        __int16 v49 = 2080;
        *(void *)__int16 v50 = v17;
        unint64_t v11 = &_os_log_internal;
        uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add metadata counter (%s)!\n";
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Metadata (%s) counter must be added before any other counters!\n", "AGXGPURawCounterImpl.mm", 699, "addCounter", *v15);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = *v15;
          *(_DWORD *)buf = 136315906;
          __int16 v44 = "AGXGPURawCounterImpl.mm";
          __int16 v45 = 1024;
          int v46 = 699;
          __int16 v47 = 2080;
          __int16 v48 = "addCounter";
          __int16 v49 = 2080;
          *(void *)__int16 v50 = v37;
          _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Metadata (%s) counter must be added before any other counters!\n", buf, 0x26u);
        }
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
        if (!result) {
          return result;
        }
        unint64_t v25 = *v15;
        *(_DWORD *)buf = 136315906;
        __int16 v44 = "AGXGPURawCounterImpl.mm";
        __int16 v45 = 1024;
        int v46 = 699;
        __int16 v47 = 2080;
        __int16 v48 = "addCounter";
        __int16 v49 = 2080;
        *(void *)__int16 v50 = v25;
        unint64_t v11 = &_os_log_internal;
        uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Metadata (%s) counter must be added before any other counters!\n";
      }
      goto LABEL_54;
    }
    if (*((_DWORD *)this + 1556))
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** HW counter (%s) must be added before any shader profiler counters!\n", "AGXGPURawCounterImpl.mm", 790, "addCounter", *v15);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v36 = *v15;
        *(_DWORD *)buf = 136315906;
        __int16 v44 = "AGXGPURawCounterImpl.mm";
        __int16 v45 = 1024;
        int v46 = 790;
        __int16 v47 = 2080;
        __int16 v48 = "addCounter";
        __int16 v49 = 2080;
        *(void *)__int16 v50 = v36;
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** HW counter (%s) must be added before any shader profiler counters!\n", buf, 0x26u);
      }
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      int v24 = *v15;
      *(_DWORD *)buf = 136315906;
      __int16 v44 = "AGXGPURawCounterImpl.mm";
      __int16 v45 = 1024;
      int v46 = 790;
      __int16 v47 = 2080;
      __int16 v48 = "addCounter";
      __int16 v49 = 2080;
      *(void *)__int16 v50 = v24;
      unint64_t v11 = &_os_log_internal;
      uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** HW counter (%s) must be added before any shader profiler counters!\n";
      goto LABEL_54;
    }
    if (*((_DWORD *)this + 1554) >= 0x100u)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Insufficient space to add HW counter (%s)!\n", "AGXGPURawCounterImpl.mm", 796, "addCounter", *v15);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = *v15;
        *(_DWORD *)buf = 136315906;
        __int16 v44 = "AGXGPURawCounterImpl.mm";
        __int16 v45 = 1024;
        int v46 = 796;
        __int16 v47 = 2080;
        __int16 v48 = "addCounter";
        __int16 v49 = 2080;
        *(void *)__int16 v50 = v39;
        _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add HW counter (%s)!\n", buf, 0x26u);
      }
      uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      unint64_t v26 = *v15;
      *(_DWORD *)buf = 136315906;
      __int16 v44 = "AGXGPURawCounterImpl.mm";
      __int16 v45 = 1024;
      int v46 = 796;
      __int16 v47 = 2080;
      __int16 v48 = "addCounter";
      __int16 v49 = 2080;
      *(void *)__int16 v50 = v26;
      unint64_t v11 = &_os_log_internal;
      uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** Insufficient space to add HW counter (%s)!\n";
      goto LABEL_54;
    }
    if (a4)
    {
      if ((a3 & 0xF) != 0 || a3 - 65 <= 0xFFFFFFBF)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** counterWidth must be 16, 32, 48, or 64!\n", "AGXGPURawCounterImpl.mm", 808, "addCounter");
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v44 = "AGXGPURawCounterImpl.mm";
          __int16 v45 = 1024;
          int v46 = 808;
          __int16 v47 = 2080;
          __int16 v48 = "addCounter";
          _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** counterWidth must be 16, 32, 48, or 64!\n", buf, 0x1Cu);
        }
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
        if (!result) {
          return result;
        }
        *(_DWORD *)buf = 136315650;
        __int16 v44 = "AGXGPURawCounterImpl.mm";
        __int16 v45 = 1024;
        int v46 = 808;
        __int16 v47 = 2080;
        __int16 v48 = "addCounter";
        unint64_t v11 = &_os_log_internal;
        uint64_t v12 = "AGXGRC:AGXGRC:%s:%d:%s: *** counterWidth must be 16, 32, 48, or 64!\n";
        __int16 v13 = buf;
LABEL_13:
        uint32_t v14 = 28;
LABEL_55:
        _os_log_impl(&dword_23F075000, v11, OS_LOG_TYPE_INFO, v12, v13, v14);
        return 0;
      }
    }
    else
    {
      a3 = 64;
    }
    if (a4 < *(_DWORD *)(*((void *)this + 1) + 676) || a3 == 64) {
      unsigned int v32 = a3;
    }
    else {
      unsigned int v32 = a3 + 16;
    }
    if (!perfCtrSamplerAddSourceCounter(*((_DWORD *)this + 7), (uint64_t)v15, a3, v32))
    {
      if (v15 == (const char **)v53) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = v15;
      }
      unsigned int v34 = *((_DWORD *)this + 1554);
      int v35 = (char *)this + 24 * v34;
      *((void *)v35 + 9) = v33;
      *((_DWORD *)v35 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = a4;
      *((_DWORD *)v35 + 21) = a3;
      *((_DWORD *)v35 + 22) = v32;
      *((_DWORD *)this + 1554) = v34 + 1;
      return 1;
    }
    return 0;
  }
  uint64_t result = (uint64_t)bsearch_b(a2, *((const void **)this + 7), *((unsigned int *)this + 12), 0x18uLL, &__block_literal_global);
  if (!result) {
    return result;
  }
  __int16 v15 = (const char **)(*(void *)(*((void *)this + 1) + 128)
                      + 56
                      * *(unsigned int *)(*((void *)this + 5)
                                        - 0x5555555555555554 * ((result - *((void *)this + 7)) >> 3)));
  a4 = *((_DWORD *)v15 + 7);
  if (a4 != -2) {
    goto LABEL_16;
  }
  unsigned int v42 = *((_DWORD *)this + 1554);
  int v18 = *((_DWORD *)this + 1556);
  *((_DWORD *)this + 1556) = 0;
  int v40 = *((_DWORD *)this + 9);
  int v41 = v18;
  if (v40) {
    int v19 = 2;
  }
  else {
    int v19 = 1;
  }
  if (!*(unsigned char *)(*((void *)this + 1) + 120))
  {
    unint64_t v20 = (unint64_t)v15[4];
    AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[28] = v20 / 0xA + 48;
    AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[29] = (v20 % 0xA) | 0x30;
  }
  int v21 = 0;
  unsigned int v22 = 0;
  while (1)
  {
    if (!*(unsigned char *)(*((void *)this + 1) + 120))
    {
      AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[21] = 48;
      AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName[22] = v22 | 0x30;
      if ((AGXGPURawCounterImpl::SourceImpl::addCounter(this, AGXGPURawCounterImpl::SourceImpl::addCounter(char const*,unsigned int,unsigned int,unsigned long long)::uscProfileDataName, 0x20u, 0xFFFFFFFF, 0xFFFFFFFFFFFFFFFFLL) & 1) == 0)goto LABEL_63; {
      goto LABEL_35;
      }
    }
    unsigned int v23 = *((_DWORD *)v15 + 8);
    if (v23 >= 0xA) {
      break;
    }
    if (!AGXGPURawCounterImpl::SourceImpl::addCounter(this, (&obfuscatedUSCProfileName(unsigned int,unsigned int)::obfuscatedUSCProfileNameList[v21])[v23], 0x20u, 0xFFFFFFFF, 0xFFFFFFFFFFFFFFFFLL))goto LABEL_63; {
LABEL_35:
    }
    v22 += v19;
    v21 += 10 * v19;
    if (v22 >= 8) {
      goto LABEL_63;
    }
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Error, invalid uscIndex (%u >= %u) and/or invalid regIndex (%u >= %u)!\n", "AGXGPURawCounterImpl.mm", 4593, "obfuscatedUSCProfileName", v23, 10, v22, 8);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    __int16 v44 = "AGXGPURawCounterImpl.mm";
    __int16 v45 = 1024;
    int v46 = 4593;
    __int16 v47 = 2080;
    __int16 v48 = "obfuscatedUSCProfileName";
    __int16 v49 = 1024;
    *(_DWORD *)__int16 v50 = v23;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = 10;
    *(_WORD *)unint64_t v51 = 1024;
    *(_DWORD *)&v51[2] = v22;
    LOWORD(v52) = 1024;
    *(_DWORD *)((char *)&v52 + 2) = 8;
    _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, invalid uscIndex (%u >= %u) and/or invalid regIndex (%u >= %u)!\n", buf, 0x34u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    __int16 v44 = "AGXGPURawCounterImpl.mm";
    __int16 v45 = 1024;
    int v46 = 4593;
    __int16 v47 = 2080;
    __int16 v48 = "obfuscatedUSCProfileName";
    __int16 v49 = 1024;
    *(_DWORD *)__int16 v50 = v23;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = 10;
    *(_WORD *)unint64_t v51 = 1024;
    *(_DWORD *)&v51[2] = v22;
    LOWORD(v52) = 1024;
    *(_DWORD *)((char *)&v52 + 2) = 8;
    _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, invalid uscIndex (%u >= %u) and/or invalid regIndex (%u >= %u)!\n", buf, 0x34u);
  }
LABEL_63:
  *((_DWORD *)this + 1556) = v41;
  if (v40) {
    int v29 = 4;
  }
  else {
    int v29 = 8;
  }
  int v30 = *((_DWORD *)this + 1554);
  if (v29 + v42 == v30)
  {
    *((_DWORD *)this + 1556) = v29 + v41;
    return 1;
  }
  bzero((char *)this + 24 * v42 + 72, 24 * (v30 - v42));
  uint64_t result = 0;
  *((_DWORD *)this + 1554) = v42;
  return result;
}

uint64_t perfCtrSamplerAddSourceCounter(char a1, uint64_t a2, char a3, char a4)
{
  long long v6 = 0u;
  long long v7 = 0u;
  LODWORD(v6) = 7;
  BYTE4(v6) = a1;
  BYTE8(v6) = *(_DWORD *)(a2 + 28);
  BYTE9(v6) = a3;
  BYTE10(v6) = a4;
  HIDWORD(v6) = *(_DWORD *)(a2 + 48);
  *(void *)&long long v7 = *(void *)(a2 + 32);
  mach_port_t v4 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
  if (!v4) {
    return 5;
  }
  size_t outputStructCnt = 32;
  return IOConnectCallStructMethod(v4, 0x105u, &v6, 0x20uLL, &v6, &outputStructCnt);
}

uint64_t ___ZN20AGXGPURawCounterImpl10SourceImpl10addCounterEPKcjjy_block_invoke(int a1, char *__s1, const char **a3)
{
  return strcmp(__s1, *a3);
}

void AGXGPURawCounterImpl::SourceImpl::clearSelectedCounterList(AGXGPURawCounterImpl::SourceImpl *this)
{
  uint64_t v2 = sAGXGPURawCounterImpl;
  int v3 = *(unsigned __int8 *)(sAGXGPURawCounterImpl + 689);
  *(unsigned char *)(sAGXGPURawCounterImpl + 689) = 0;
  if (v3)
  {
    uint64_t v4 = *((void *)this + 1);
    if (*(_DWORD *)(v4 + 656))
    {
      if (*(_DWORD *)(v2 + 88))
      {
        unsigned int v5 = 0;
        do
        {
          memset(v7, 0, sizeof(v7));
          LODWORD(v7[0]) = 6;
          BYTE4(v7[0]) = v5;
          mach_port_t v6 = *(_DWORD *)(v2 + 88);
          if (v6)
          {
            size_t outputStructCnt = 32;
            IOConnectCallStructMethod(v6, 0x105u, v7, 0x20uLL, v7, &outputStructCnt);
            uint64_t v2 = sAGXGPURawCounterImpl;
            uint64_t v4 = *((void *)this + 1);
          }
          ++v5;
        }
        while (v5 < *(_DWORD *)(v4 + 656));
      }
    }
  }
  bzero((char *)this + 72, 0x180CuLL);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::isEnabled(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((unsigned __int8 *)this + 6228);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::setEnabled(AGXGPURawCounterImpl::SourceImpl *this, int a2)
{
  if (!a2)
  {
    *((_DWORD *)this + 1559) &= ~0x80000000;
LABEL_6:
    uint64_t v2 = 1;
    goto LABEL_7;
  }
  uint64_t v2 = *((void *)this + 781);
  if (v2)
  {
    uint64_t v2 = *((unsigned int *)this + 1559);
    if (v2) {
      goto LABEL_6;
    }
  }
  LOBYTE(a2) = 0;
LABEL_7:
  *((unsigned char *)this + 6228) = a2;
  return v2;
}

uint64_t AGXGPURawCounterImpl::SourceImpl::copyAvailableCounterList(uint64_t a1, void *a2)
{
  if (!a2) {
    return *(unsigned int *)(a1 + 48);
  }
  uint64_t v4 = malloc_type_malloc(*(unsigned int *)(a1 + 64), 0x6082DC53uLL);
  *a2 = v4;
  memcpy(v4, *(const void **)(a1 + 56), *(unsigned int *)(a1 + 64));
  uint64_t result = *(unsigned int *)(a1 + 48);
  if (result)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(a1 + 56);
    do
    {
      unint64_t v8 = (void *)(*a2 + v6);
      uint64_t v9 = v8[1];
      void *v8 = *a2 + *v8 - v7;
      v8[1] = *a2 + v9 - v7;
      v6 += 24;
    }
    while (24 * result != v6);
  }
  return result;
}

void *AGXGPURawCounterImpl::SourceImpl::copyName(AGXGPURawCounterImpl::SourceImpl *this)
{
  uint64_t v2 = malloc_type_malloc((*((_DWORD *)this + 6) + 1), 0xF72E82B2uLL);
  int v3 = (const void *)*((void *)this + 2);
  size_t v4 = (*((_DWORD *)this + 6) + 1);
  return memcpy(v2, v3, v4);
}

uint64_t AGXGPURawCounterImpl::SourceImpl::owner(AGXGPURawCounterImpl::SourceImpl *this)
{
  return *((void *)this + 1);
}

void AGXGPURawCounterImpl::SourceImpl::~SourceImpl(void **this)
{
  *this = &unk_26F2CA220;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
  JUMPOUT(0x2455C3130);
}

{
  *this = &unk_26F2CA220;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
}

uint64_t AGXGPURawCounterImpl::populateFeaturesDict(AGXGPURawCounterImpl *this, NSMutableDictionary *a2)
{
  int v3 = a2;
  [(NSMutableDictionary *)v3 setObject:*((void *)this + 14) forKeyedSubscript:@"ConstantAGX_CoreConfig"];
  size_t v4 = [NSNumber numberWithUnsignedInt:(*(uint64_t (**)(AGXGPURawCounterImpl *))(*(void *)this + 104))(this)];
  [(NSMutableDictionary *)v3 setObject:v4 forKeyedSubscript:@"ConstantAGX_PostProcessBufferSizeMin"];

  [(NSMutableDictionary *)v3 setObject:&unk_26F2CB0E8 forKeyedSubscript:@"ConstantAGX_PostProcessBufferSizeAlignment"];
  [(NSMutableDictionary *)v3 setObject:&unk_26F2CB0E8 forKeyedSubscript:@"ConstantAGX_PostProcessBufferAddrAlignment"];
  [(NSMutableDictionary *)v3 setObject:&unk_26F2CB100 forKeyedSubscript:@"ConstantAGX_SampleTypeList"];

  return 1;
}

void sub_23F07FA70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::postProcessBufferMinSize(AGXGPURawCounterImpl *this)
{
  return *((unsigned int *)this + 170);
}

uint64_t AGXGPURawCounterImpl::isSampling(AGXGPURawCounterImpl *this)
{
  return *((unsigned __int8 *)this + 688);
}

BOOL AGXGPURawCounterImpl::stopSampling(AGXGPURawCounterImpl *this)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3940, "virtual BOOL AGXGPURawCounterImpl::stopSampling()");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)outputStruct = 136315650;
      *(void *)&outputStruct[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&outputStruct[12] = 1024;
      *(_DWORD *)&outputStruct[14] = 3940;
      *(_WORD *)&outputStruct[18] = 2080;
      *(void *)&outputStruct[20] = "virtual BOOL AGXGPURawCounterImpl::stopSampling()";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", outputStruct, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)outputStruct = 136315650;
      *(void *)&outputStruct[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&outputStruct[12] = 1024;
      *(_DWORD *)&outputStruct[14] = 3940;
      *(_WORD *)&outputStruct[18] = 2080;
      *(void *)&outputStruct[20] = "virtual BOOL AGXGPURawCounterImpl::stopSampling()";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", outputStruct, 0x1Cu);
    }
    abort();
  }
  unint64_t v2 = *((unsigned int *)this + 164);
  if (v2)
  {
    *(_OWORD *)outputStruct = xmmword_23F088A28;
    *(_OWORD *)&outputStruct[16] = unk_23F088A38;
    mach_port_t v3 = *((_DWORD *)this + 22);
    if (v3)
    {
      size_t outputStructCnt = 32;
      IOConnectCallStructMethod(v3, 0x105u, outputStruct, 0x20uLL, outputStruct, &outputStructCnt);
      unint64_t v4 = *((unsigned int *)this + 164);
      if (!v4)
      {
LABEL_5:
        *((_WORD *)this + 344) = 256;
        return v2 != 0;
      }
    }
    else
    {
      unint64_t v4 = v2;
    }
    unint64_t v6 = 0;
    uint64_t v7 = (char *)this + 144;
    do
    {
      uint64_t v8 = *(void *)&v7[8 * v6];
      if (v8)
      {
        if ((*(uint64_t (**)(uint64_t))(*(void *)v8 + 144))(v8))
        {
          *(void *)outputStruct = 3;
          *(_OWORD *)&outputStruct[16] = 0u;
          outputStruct[4] = v6;
          *(void *)&outputStruct[8] = 0;
          *(void *)&outputStruct[16] = 0;
          mach_port_t v9 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
          if (v9)
          {
            size_t outputStructCnt = 32;
            IOConnectCallStructMethod(v9, 0x105u, outputStruct, 0x20uLL, outputStruct, &outputStructCnt);
          }
          (*(void (**)(void))(**(void **)&v7[8 * v6] + 48))(*(void *)&v7[8 * v6]);
        }
        (*(void (**)(void, void))(**(void **)&v7[8 * v6] + 40))(*(void *)&v7[8 * v6], 0);
        unint64_t v4 = *((unsigned int *)this + 164);
      }
      ++v6;
    }
    while (v6 < v4);
    goto LABEL_5;
  }
  return v2 != 0;
}

uint64_t AGXGPURawCounterImpl::startSampling(AGXGPURawCounterImpl *this)
{
  kern_return_t v11;
  int v12;
  FILE *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  __int16 v27;
  int v28;
  mach_port_t v29;
  unint64_t v30;
  unint64_t i;
  uint64_t v32;
  mach_port_t v33;
  mach_port_t v34;
  kern_return_t v35;
  mach_port_t v36;
  size_t outputStructCnt;
  unsigned char buf[34];
  __int16 v39;
  int v40;
  uint64_t v41;

  int v41 = *MEMORY[0x263EF8340];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3802, "virtual BOOL AGXGPURawCounterImpl::startSampling()");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3802;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "virtual BOOL AGXGPURawCounterImpl::startSampling()";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3802;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "virtual BOOL AGXGPURawCounterImpl::startSampling()";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  unint64_t v2 = *((unsigned int *)this + 164);
  if (!v2) {
    return 0;
  }
  if (*((unsigned char *)this + 688))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Sampling has been started! Stop sampling before starting again.\n", "AGXGPURawCounterImpl.mm", 3819, "startSampling");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3819;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "startSampling";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Sampling has been started! Stop sampling before starting again.\n", buf, 0x1Cu);
    }
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3819;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "startSampling";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Sampling has been started! Stop sampling before starting again.\n", buf, 0x1Cu);
      return 0;
    }
    return result;
  }
  unint64_t v4 = 0;
  char v5 = 0;
  *((unsigned char *)this + 689) = 1;
  unint64_t v6 = &_os_log_internal;
  do
  {
    while (1)
    {
      uint64_t v7 = *((void *)this + v4 + 18);
      if (!v7) {
        break;
      }
      if (((*(uint64_t (**)(uint64_t))(*(void *)v7 + 48))(v7) & 1) == 0)
      {
        unint64_t v2 = *((unsigned int *)this + 164);
        break;
      }
      *(_DWORD *)(v7 + 6236) |= (*(unsigned int (**)(uint64_t))(*(void *)v7 + 128))(v7) >> 1 << 31;
      if (((*(uint64_t (**)(uint64_t))(*(void *)v7 + 128))(v7) & 4) != 0) {
        int v8 = (*(_DWORD *)(*(void *)(v7 + 8) + 96) > 1u) << 31;
      }
      else {
        int v8 = 0;
      }
      *(_DWORD *)(v7 + 6236) |= v8;
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 144))(v7);
      if (!result) {
        goto LABEL_58;
      }
      uint64_t v9 = *(void *)(v7 + 6248);
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 144))(v7);
      *(_DWORD *)buf = 3;
      *(_DWORD *)&uint8_t buf[4] = v4;
      *(void *)&buf[8] = v9;
      *(_OWORD *)&buf[16] = (unint64_t)v10;
      uint64_t result = *(unsigned int *)(sAGXGPURawCounterImpl + 88);
      if (!result) {
        goto LABEL_58;
      }
      size_t outputStructCnt = 32;
      unint64_t v11 = IOConnectCallStructMethod(result, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
      if (!v9 || v11)
      {
        uint64_t v12 = 0;
        if (v11) {
          goto LABEL_57;
        }
      }
      else
      {
        *(void *)(v7 + 6264) = *(void *)&buf[24];
        *(void *)(v7 + 6272) = v9 + *(void *)&buf[8];
        uint64_t v12 = *(_DWORD *)&buf[16];
      }
      if (v12 != (*(unsigned int (**)(uint64_t))(*(void *)v7 + 176))(v7))
      {
        __int16 v13 = (FILE *)*MEMORY[0x263EF8348];
        uint32_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 176))(v7);
        fprintf(v13, "AGXGRC:%s:%d:%s: *** Inconsistent sub-buffer count! (%u != %u)\n", "AGXGPURawCounterImpl.mm", 3876, "startSampling", v12, v14);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          unint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 176))(v7);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3876;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "startSampling";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v12;
          uint64_t v39 = 1024;
          int v40 = v25;
          _os_log_error_impl(&dword_23F075000, v6, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent sub-buffer count! (%u != %u)\n", buf, 0x28u);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          __int16 v15 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 176))(v7);
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3876;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "startSampling";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v12;
          uint64_t v39 = 1024;
          int v40 = v15;
          _os_log_impl(&dword_23F075000, v6, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Inconsistent sub-buffer count! (%u != %u)\n", buf, 0x28u);
        }
      }
      unsigned int v16 = *(void *)(v7 + 6264);
      __int16 v17 = *(void *)(v7 + 6272);
      int v18 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 176))(v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v7 + 232))(v7, v16, v17, v18);
      if (!result) {
        goto LABEL_58;
      }
      int v19 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 96))(v7);
      unint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 128))(v7);
      int v21 = v19 & (v19 & 2 ^ 0xFFFFFFFE);
      if ((v19 & 4) != 0) {
        v21 &= ~4u;
      }
      unsigned int v22 = v21 & 8;
      if ((v21 & 8) != 0) {
        v21 &= ~8u;
      }
      unsigned int v23 = v21 & 0x10;
      if ((v21 & 0x10) != 0) {
        v21 &= ~0x10u;
      }
      int v24 = (2 * v21) & 0x40 | v19 & 1 | (8 * (((v19 & 2) >> 1) & 1)) | ((v19 & 4 | v22) >> 1) | (2 * v23);
      if ((v21 & 0x80000000) != 0)
      {
        v24 |= 0x10u;
      }
      else if (!v24)
      {
        goto LABEL_57;
      }
      *(_OWORD *)&buf[16] = 0u;
      *(_DWORD *)buf = 5;
      *(_DWORD *)&uint8_t buf[4] = v4;
      *(_DWORD *)&buf[8] = v24;
      *(_DWORD *)&buf[12] = v20 & 1 | (((v20 >> 1) & 3) << 7) | 0x40;
      (*(void (**)(uint64_t, unsigned char *))(*(void *)v7 + 216))(v7, buf);
      uint64_t result = *(unsigned int *)(sAGXGPURawCounterImpl + 88);
      if (!result) {
        goto LABEL_58;
      }
      size_t outputStructCnt = 32;
      if (IOConnectCallStructMethod(result, 0x105u, buf, 0x20uLL, buf, &outputStructCnt)) {
        goto LABEL_57;
      }
      ++v4;
      unint64_t v2 = *((unsigned int *)this + 164);
      char v5 = 1;
      if (v4 >= v2) {
        goto LABEL_45;
      }
    }
    ++v4;
  }
  while (v4 < v2);
  if ((v5 & 1) == 0)
  {
LABEL_57:
    uint64_t result = 0;
LABEL_58:
    *((unsigned char *)this + 688) = 1;
    return result;
  }
LABEL_45:
  unint64_t v26 = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(void *)this + 56))(this);
  unsigned int v27 = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(void *)this + 72))(this);
  if ((v26 & 2) != 0) {
    unsigned int v28 = 80;
  }
  else {
    unsigned int v28 = 64;
  }
  *(_DWORD *)buf = 4;
  *(_DWORD *)&uint8_t buf[4] = (v26 >> 1) & 8 | (((v26 >> 5) & 1) << 9) | v28 & 0xFFFFFFDF | (v26 >> 1) & 4 | (32 * (((v26 & 4) >> 2) & 1));
  *(_WORD *)&buf[8] = v27 & ((__int16)((_WORD)v26 << 13) >> 15);
  int v29 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
  if (v29)
  {
    size_t outputStructCnt = 32;
    if (!IOConnectCallStructMethod(v29, 0x105u, buf, 0x20uLL, buf, &outputStructCnt))
    {
      *(_DWORD *)buf = 8;
      unsigned int v34 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
      if (v34)
      {
        size_t outputStructCnt = 32;
        int v35 = IOConnectCallStructMethod(v34, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
        int v36 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
        *(_DWORD *)buf = 11;
        memset(&buf[4], 0, 28);
        if (v36)
        {
          size_t outputStructCnt = 32;
          IOConnectCallStructMethod(v36, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
        }
        if (!v35)
        {
          uint64_t result = 1;
          goto LABEL_58;
        }
      }
    }
  }
  int v30 = *((unsigned int *)this + 164);
  if (v30)
  {
    for (unint64_t i = 0; i < v30; ++i)
    {
      unsigned int v32 = *((void *)this + i + 18);
      if (v32)
      {
        (*(void (**)(uint64_t))(*(void *)v32 + 240))(v32);
        *(void *)buf = 3;
        *(_OWORD *)&buf[16] = 0u;
        uint8_t buf[4] = i;
        *(void *)&buf[8] = 0;
        *(void *)&buf[16] = 0;
        uint64_t v33 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
        if (v33)
        {
          size_t outputStructCnt = 32;
          IOConnectCallStructMethod(v33, 0x105u, buf, 0x20uLL, buf, &outputStructCnt);
        }
        int v30 = *((unsigned int *)this + 164);
      }
    }
  }
  return 0;
}

uint64_t AGXGPURawCounterImpl::gpuPerfState(AGXGPURawCounterImpl *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3795, "virtual uint32_t AGXGPURawCounterImpl::gpuPerfState() const");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      mach_port_t v3 = "AGXGPURawCounterImpl.mm";
      __int16 v4 = 1024;
      int v5 = 3795;
      __int16 v6 = 2080;
      uint64_t v7 = "virtual uint32_t AGXGPURawCounterImpl::gpuPerfState() const";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      mach_port_t v3 = "AGXGPURawCounterImpl.mm";
      __int16 v4 = 1024;
      int v5 = 3795;
      __int16 v6 = 2080;
      uint64_t v7 = "virtual uint32_t AGXGPURawCounterImpl::gpuPerfState() const";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  return *((unsigned int *)this + 174);
}

uint64_t AGXGPURawCounterImpl::setGPUPerfState(AGXGPURawCounterImpl *this, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3787, "virtual BOOL AGXGPURawCounterImpl::setGPUPerfState(uint32_t)");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v4 = "AGXGPURawCounterImpl.mm";
      __int16 v5 = 1024;
      int v6 = 3787;
      __int16 v7 = 2080;
      uint64_t v8 = "virtual BOOL AGXGPURawCounterImpl::setGPUPerfState(uint32_t)";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v4 = "AGXGPURawCounterImpl.mm";
      __int16 v5 = 1024;
      int v6 = 3787;
      __int16 v7 = 2080;
      uint64_t v8 = "virtual BOOL AGXGPURawCounterImpl::setGPUPerfState(uint32_t)";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  *((_DWORD *)this + 174) = a2;
  return 1;
}

uint64_t AGXGPURawCounterImpl::flags(AGXGPURawCounterImpl *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3781, "virtual uint32_t AGXGPURawCounterImpl::flags() const");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      mach_port_t v3 = "AGXGPURawCounterImpl.mm";
      __int16 v4 = 1024;
      int v5 = 3781;
      __int16 v6 = 2080;
      __int16 v7 = "virtual uint32_t AGXGPURawCounterImpl::flags() const";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      mach_port_t v3 = "AGXGPURawCounterImpl.mm";
      __int16 v4 = 1024;
      int v5 = 3781;
      __int16 v6 = 2080;
      __int16 v7 = "virtual uint32_t AGXGPURawCounterImpl::flags() const";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  return *((unsigned int *)this + 173);
}

uint64_t AGXGPURawCounterImpl::setFlags(AGXGPURawCounterImpl *this, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3768, "virtual BOOL AGXGPURawCounterImpl::setFlags(uint32_t)");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v4 = "AGXGPURawCounterImpl.mm";
      __int16 v5 = 1024;
      int v6 = 3768;
      __int16 v7 = 2080;
      uint64_t v8 = "virtual BOOL AGXGPURawCounterImpl::setFlags(uint32_t)";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v4 = "AGXGPURawCounterImpl.mm";
      __int16 v5 = 1024;
      int v6 = 3768;
      __int16 v7 = 2080;
      uint64_t v8 = "virtual BOOL AGXGPURawCounterImpl::setFlags(uint32_t)";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  *((_DWORD *)this + 173) = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(void *)this + 40))(this) & a2;
  return 1;
}

uint64_t AGXGPURawCounterImpl::availableFlags(AGXGPURawCounterImpl *this)
{
  unsigned int v1 = *((_DWORD *)this + 23);
  if (v1 < 0xE) {
    int v2 = 0;
  }
  else {
    int v2 = 32 * (*((_DWORD *)this + 24) > 1u);
  }
  BOOL v3 = v1 > 0xA;
  if (v1 <= 0xC) {
    int v4 = 6;
  }
  else {
    int v4 = 14;
  }
  return v4 | (16 * v3) | v2;
}

uint64_t AGXGPURawCounterImpl::setOptions(AGXGPURawCounterImpl *this, NSDictionary *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = a2;
  if ((AGXGPURawCounterImpl *)sAGXGPURawCounterImpl != this)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3705, "virtual BOOL AGXGPURawCounterImpl::setOptions(NSDictionary *__strong)");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v22 = "AGXGPURawCounterImpl.mm";
      __int16 v23 = 1024;
      int v24 = 3705;
      __int16 v25 = 2080;
      unint64_t v26 = "virtual BOOL AGXGPURawCounterImpl::setOptions(NSDictionary *__strong)";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v22 = "AGXGPURawCounterImpl.mm";
      __int16 v23 = 1024;
      int v24 = 3705;
      __int16 v25 = 2080;
      unint64_t v26 = "virtual BOOL AGXGPURawCounterImpl::setOptions(NSDictionary *__strong)";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  char v4 = (*(uint64_t (**)(AGXGPURawCounterImpl *))(*(void *)this + 40))(this);
  char v5 = v4;
  if ((v4 & 2) != 0)
  {
    __int16 v7 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DisableOverlap"];
    int v8 = [v7 BOOLValue];

    if (v8) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((v4 & 4) == 0) {
      goto LABEL_11;
    }
  }
  uint64_t v9 = [(NSDictionary *)v3 objectForKeyedSubscript:@"LockGPUPerfState"];
  int v10 = [v9 unsignedShortValue];

  if (v10)
  {
    unint64_t v11 = [(NSDictionary *)v3 objectForKeyedSubscript:@"LockGPUPerfState"];
    int v12 = [v11 shortValue];

    (*(void (**)(AGXGPURawCounterImpl *, void))(*(void *)this + 64))(this, v12 & ~(v12 >> 31));
    uint64_t v6 = v6 | 4;
  }
LABEL_11:
  if ((v5 & 8) != 0)
  {
    __int16 v13 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DisableMCH"];
    int v14 = [v13 BOOLValue];

    if (v14) {
      uint64_t v6 = v6 | 8;
    }
    else {
      uint64_t v6 = v6;
    }
  }
  if ((v5 & 0x10) != 0)
  {
    __int16 v15 = [(NSDictionary *)v3 objectForKeyedSubscript:@"ReduceCDMCluster"];
    int v16 = [v15 BOOLValue];

    if (v16) {
      uint64_t v6 = v6 | 0x10;
    }
    else {
      uint64_t v6 = v6;
    }
  }
  if ((v5 & 0x20) != 0)
  {
    __int16 v17 = [(NSDictionary *)v3 objectForKeyedSubscript:@"SingleVDMChannel"];
    int v18 = [v17 BOOLValue];

    if (v18) {
      uint64_t v6 = v6 | 0x20;
    }
    else {
      uint64_t v6 = v6;
    }
  }
  uint64_t v19 = (*(uint64_t (**)(AGXGPURawCounterImpl *, uint64_t))(*(void *)this + 48))(this, v6);

  return v19;
}

void sub_23F0810CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::sourceList(int64x2_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ((int64x2_t *)sAGXGPURawCounterImpl != a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", "AGXGPURawCounterImpl.mm", 3683, "virtual uint32_t AGXGPURawCounterImpl::sourceList(Source **, uint32_t)");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v20 = "AGXGPURawCounterImpl.mm";
      __int16 v21 = 1024;
      int v22 = 3683;
      __int16 v23 = 2080;
      int v24 = "virtual uint32_t AGXGPURawCounterImpl::sourceList(Source **, uint32_t)";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v20 = "AGXGPURawCounterImpl.mm";
      __int16 v21 = 1024;
      int v22 = 3683;
      __int16 v23 = 2080;
      int v24 = "virtual uint32_t AGXGPURawCounterImpl::sourceList(Source **, uint32_t)";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: !!! AGXGPURawCounterImpl is not initialized!\n", buf, 0x1Cu);
    }
    abort();
  }
  uint64_t v4 = a1[41].u32[0];
  if (!v4) {
    return 0;
  }
  if (a2)
  {
    uint64_t result = 0;
    uint64_t v6 = a1 + 9;
    do
    {
      if (v6->i64[0])
      {
        if (result < a3) {
          *(void *)(a2 + 8 * result) = v6->i64[0];
        }
        uint64_t result = (result + 1);
      }
      uint64_t v6 = (int64x2_t *)((char *)v6 + 8);
      --v4;
    }
    while (v4);
  }
  else
  {
    if (v4 >= 8)
    {
      uint64_t v7 = v4 & 0xFFFFFFF8;
      int v8 = a1 + 11;
      int32x4_t v9 = 0uLL;
      uint64_t v10 = v7;
      int32x4_t v11 = 0uLL;
      do
      {
        int64x2_t v12 = v8[-2];
        int64x2_t v13 = v8[-1];
        int64x2_t v14 = *v8;
        int64x2_t v15 = v8[1];
        v8 += 4;
        int32x4_t v9 = vsubq_s32(v9, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v12), (int32x4_t)vceqzq_s64(v13))));
        int32x4_t v11 = vsubq_s32(v11, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v14), (int32x4_t)vceqzq_s64(v15))));
        v10 -= 8;
      }
      while (v10);
      uint64_t result = vaddvq_s32(vaddq_s32(v11, v9));
      if (v7 == v4) {
        return result;
      }
    }
    else
    {
      uint64_t v7 = 0;
      LODWORD(result) = 0;
    }
    uint64_t v16 = v4 - v7;
    __int16 v17 = &a1[9].i64[v7];
    do
    {
      if (*v17++) {
        uint64_t result = (result + 1);
      }
      else {
        uint64_t result = result;
      }
      --v16;
    }
    while (v16);
  }
  return result;
}

void *AGXGPURawCounterImpl::copyDeviceName(AGXGPURawCounterImpl *this)
{
  unsigned int v1 = (char *)this + 24;
  size_t v2 = strlen((const char *)this + 24) + 1;
  BOOL v3 = malloc_type_malloc(v2, 0x8D25DB0DuLL);
  uint64_t v4 = v3;
  if (v3) {
    memcpy(v3, v1, v2);
  }
  return v4;
}

void AGXGPURawCounterImpl::~AGXGPURawCounterImpl(id *this)
{
  JUMPOUT(0x2455C3130);
}

{
}

uint64_t AGXGPURawCounterImpl::SourceImpl::SourceImpl(uint64_t a1, uint64_t a2, int a3, char *__s, uint64_t a5, unsigned int a6, uint64_t a7)
{
  *(void *)a1 = &unk_26F2CA220;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 28) = a3;
  *(void *)(a1 + 32) = *(void *)(__s + 36);
  *(void *)(a1 + 4(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = a5;
  *(_DWORD *)(a1 + 48) = a6;
  *(void *)(a1 + 6232) = 0;
  *(_DWORD *)(a1 + 624(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = 0;
  *(void *)(a1 + 628(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = 0;
  *(void *)(a1 + 6221) = 0;
  *(void *)(a1 + 6216) = 0;
  *(void *)(a1 + 6256) = 0;
  *(void *)(a1 + 6264) = 0;
  *(void *)(a1 + 6248) = 0;
  *(_DWORD *)(a1 + 6288) = *((_DWORD *)__s + 8);
  *(void *)(a1 + 6296) = a7;
  *(_DWORD *)(a1 + 6328) = 0;
  *(void *)(a1 + 6312) = 0;
  *(void *)(a1 + 632(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = 0;
  *(void *)(a1 + 6304) = 0;
  *(_OWORD *)(a1 + 6352) = 0u;
  *(_OWORD *)(a1 + 6336) = 0u;
  v55[1] = 0;
  int v12 = strlen(__s);
  *(_DWORD *)(a1 + 24) = v12;
  uint64_t v13 = (((v12 + 1) + 7) & 0x1FFFFFFF8) + 24 * a6;
  uint64_t v14 = *(void *)(a2 + 128);
  if (a6)
  {
    if (a6 == 1)
    {
      uint64_t v15 = 0;
LABEL_7:
      uint64_t v20 = a6 - v15;
      __int16 v21 = (unsigned int *)(a5 + 4 * v15);
      uint64x2_t v22 = (uint64x2_t)vdupq_n_s64(7uLL);
      int8x16_t v23 = (int8x16_t)vdupq_n_s64(0x1FFFFFFF8uLL);
      do
      {
        unsigned int v24 = *v21++;
        int8x16_t v25 = vandq_s8((int8x16_t)vaddw_u32(v22, (uint32x2_t)vadd_s32(*(int32x2_t *)(v14 + 56 * v24 + 16), (int32x2_t)0x100000001)), v23);
        v13 += v25.i64[1] + v25.i64[0];
        --v20;
      }
      while (v20);
      goto LABEL_9;
    }
    uint64_t v16 = 0;
    uint64_t v15 = a6 & 0xFFFFFFFE;
    __int16 v17 = (unsigned int *)(a5 + 4);
    uint64_t v18 = v15;
    do
    {
      uint64_t v19 = v14 + 56 * *(v17 - 1);
      v13 += (((*(_DWORD *)(v19 + 20) + 1) + 7) & 0x1FFFFFFF8)
           + (((*(_DWORD *)(v19 + 16) + 1) + 7) & 0x1FFFFFFF8);
      v16 += (((*(_DWORD *)(v14 + 56 * *v17 + 20) + 1) + 7) & 0x1FFFFFFF8)
           + (((*(_DWORD *)(v14 + 56 * *v17 + 16) + 1) + 7) & 0x1FFFFFFF8);
      v17 += 2;
      v18 -= 2;
    }
    while (v18);
    v13 += v16;
    if (v15 != a6) {
      goto LABEL_7;
    }
  }
LABEL_9:
  LOBYTE(v55[0]) = 1;
  HIDWORD(v55[0]) = 8;
  v55[2] = (void *)((v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  v55[3] = 0;
  malloc_type_posix_memalign(&v55[1], 8uLL, (size_t)v55[2], 0x852F15E8uLL);
  bzero(v55[1], (size_t)v55[2]);
  int v26 = *(_DWORD *)(a1 + 24);
  size_t v27 = (v26 + 1);
  unsigned int v28 = (void *)StackAllocator::reserve((StackAllocator *)v55, v26 + 1);
  int v29 = v28;
  if (v27 && v28) {
    memcpy(v28, __s, v27);
  }
  *(void *)(a1 + 16) = v29;
  uint64_t v30 = StackAllocator::reserve((StackAllocator *)v55, 24 * *(_DWORD *)(a1 + 48));
  *(void *)(a1 + 56) = v30;
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v31 = 0;
    unint64_t v32 = 0;
    do
    {
      unsigned int v34 = *(_DWORD *)(*(void *)(a1 + 40) + 4 * v32);
      uint64_t v35 = v14 + 56 * v34;
      uint64_t v36 = *(void *)(a1 + 56);
      uint64_t v37 = *(const void **)v35;
      LODWORD(v35) = *(_DWORD *)(v35 + 16);
      size_t v38 = (v35 + 1);
      uint64_t v39 = (void *)StackAllocator::reserve((StackAllocator *)v55, (int)v35 + 1);
      int v40 = v39;
      if (v38) {
        BOOL v41 = v39 == 0;
      }
      else {
        BOOL v41 = 1;
      }
      if (!v41) {
        memcpy(v39, v37, v38);
      }
      *(void *)(v36 + v31) = v40;
      uint64_t v42 = v14 + 56 * v34;
      unsigned int v43 = *(const void **)(v42 + 8);
      LODWORD(v42) = *(_DWORD *)(v42 + 20);
      size_t v44 = (v42 + 1);
      __int16 v45 = (void *)StackAllocator::reserve((StackAllocator *)v55, (int)v42 + 1);
      int v46 = v45;
      if (v44) {
        BOOL v47 = v45 == 0;
      }
      else {
        BOOL v47 = 1;
      }
      if (!v47) {
        memcpy(v45, v43, v44);
      }
      uint64_t v33 = v36 + v31;
      *(void *)(v33 + 8) = v46;
      *(_DWORD *)(v33 + 16) = *(_DWORD *)(v14 + 56 * v34 + 24);
      ++v32;
      v31 += 24;
    }
    while (v32 < *(unsigned int *)(a1 + 48));
    uint64_t v30 = *(void *)(a1 + 56);
  }
  if (v55[1]) {
    int v48 = LODWORD(v55[1]) + LODWORD(v55[3]);
  }
  else {
    int v48 = 0;
  }
  *(_DWORD *)(a1 + 64) = v48 - v30;
  bzero((void *)(a1 + 72), 0x1800uLL);
  LOBYTE(v55[0]) = 0;
  memset((char *)v55 + 4, 0, 28);
  int v49 = *(_DWORD *)(a1 + 6288);
  size_t v50 = ((24 * *(_DWORD *)(*(void *)(a1 + 6296) + 40) + 2064) * v49);
  *(_DWORD *)(a1 + 6328) = v50;
  unint64_t v51 = (char *)malloc_type_malloc(v50, 0xFFCC36E0uLL);
  uint64_t v52 = (8 * v49);
  *(void *)(a1 + 632(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = v51;
  *(void *)(a1 + 6336) = v51;
  *(void *)(a1 + 6344) = &v51[v52];
  unint64_t v53 = &v51[v52 + v52];
  *(void *)(a1 + 6352) = v53;
  *(void *)(a1 + 636(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = &v53[v49 << 11];
  if (LOBYTE(v55[0])) {
    free(v55[1]);
  }
  return a1;
}

void sub_23F081830(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, void *a12)
{
  if (a11) {
    free(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AGXGPURawCounterImpl::init(AGXGPURawCounterImpl *this)
{
  uint64_t v1 = MEMORY[0x270FA5388](this);
  int v3 = v2;
  uint64_t v4 = (_DWORD *)v1;
  v254[336] = *MEMORY[0x263EF8340];
  bzero(__s1, 0xB00uLL);
  long long v250 = 0u;
  long long v251 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  long long v244 = 0u;
  long long v245 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  *(_OWORD *)v220 = 0u;
  long long v221 = 0u;
  memset(v219, 0, sizeof(v219));
  v4[2] = v3;
  uint64_t v5 = IOGPUDeviceCreate();
  *((void *)v4 + 2) = v5;
  if (!v5)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(_deviceRef = IOGPUDeviceCreate(_acceleratorPort)) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2699, "init");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2699;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_deviceRef = IOGPUDeviceCreate(_acceleratorPort)) != NULL\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2699;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    uint64_t v6 = &_os_log_internal;
    uint64_t v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_deviceRef = IOGPUDeviceCreate(_acceleratorPort)) != NULL\"\n";
LABEL_11:
    _os_log_impl(&dword_23F075000, v6, OS_LOG_TYPE_INFO, v7, buf, 0x1Cu);
    goto LABEL_12;
  }
  if (IOGPUDeviceGetName())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"IOGPUDeviceGetName(_deviceRef, _deviceName, sizeof(_deviceName)) == kIOReturnSuccess\"\n", "AGXGPURawCounterImpl.mm", 2702, "init");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2702;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"IOGPUDeviceGetName(_deviceRef, _deviceName, sizeof(_deviceName)) == kIOReturnSuccess\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2702;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    uint64_t v6 = &_os_log_internal;
    uint64_t v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"IOGPUDeviceGetName(_deviceRef, _deviceName, sizeof(_deviceName)) == kIOReturnSuccess\"\n";
    goto LABEL_11;
  }
  mach_port_t Connect = IOGPUDeviceGetConnect();
  v4[22] = Connect;
  if (!Connect)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(_sharedConnection = IOGPUDeviceGetConnect(_deviceRef)) != 0\"\n", "AGXGPURawCounterImpl.mm", 2705, "init");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2705;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sharedConnection = IOGPUDeviceGetConnect(_deviceRef)) != 0\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2705;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    uint64_t v6 = &_os_log_internal;
    uint64_t v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sharedConnection = IOGPUDeviceGetConnect(_deviceRef)) != 0\"\n";
    goto LABEL_11;
  }
  mach_port_t v11 = Connect;
  *(void *)size_t outputStructCnt = 32;
  memset(buf, 0, 32);
  uint8_t buf[4] = 1;
  if (IOConnectCallStructMethod(Connect, 0x105u, buf, 0x20uLL, buf, (size_t *)outputStructCnt))
  {
    memset(&buf[4], 0, 28);
    *(_DWORD *)buf = 11;
    IOConnectCallStructMethod(v11, 0x105u, buf, *(size_t *)outputStructCnt, buf, (size_t *)outputStructCnt);
    goto LABEL_12;
  }
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4[2], @"AbsTimeOffset", 0, 0);
  uint64_t v13 = CFProperty;
  if (!CFProperty || !CFNumberGetValue(CFProperty, kCFNumberSInt64Type, v4 + 176))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"((cfAbsTimeOffset = (CFNumberRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"AbsTimeOffset\", NULL, 0)) != NULL) && CFNumberGetValue(cfAbsTimeOffset, kCFNumberSInt64Type, (void*)(&_samplingState.absTimeOffset))\"\n", "AGXGPURawCounterImpl.mm", 2717, "init");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2717;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfAbsTimeOffset = (CFNumberRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"AbsTimeOffset\", NULL, 0)) != NULL) && CFNumberGetValue(cfAbsTimeOffset, kCFNumberSInt64Type, (void*)(&_samplingState.absTimeOffset))\"\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2717;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfAbsTimeOffset = (CFNumberRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"AbsTimeOffset\", NULL, 0)) != NULL) && CFNumberGetValue(cfAbsTimeOffset, kCFNumberSInt64Type, (void*)(&_samplingState.absTimeOffset))\"\n", buf, 0x1Cu);
    }
    if (!v13) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
  CFRelease(v13);
  mach_port_t v14 = v4[22];
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 4096);
  memset(buf, 0, 32);
  *(_DWORD *)buf = 12;
  *(void *)&buf[8] = CFDataGetMutableBytePtr(Mutable);
  *(_DWORD *)&buf[16] = 4096;
  if (!v14 && (mach_port_t v14 = *(_DWORD *)(sAGXGPURawCounterImpl + 88)) == 0
    || (*(void *)size_t outputStructCnt = 32,
        IOConnectCallStructMethod(v14, 0x105u, buf, 0x20uLL, buf, (size_t *)outputStructCnt)))
  {
    uint64_t v13 = 0;
LABEL_27:
    char v17 = 1;
    goto LABEL_28;
  }
  CFDataSetLength(Mutable, *(unsigned int *)&buf[16]);
  uint64_t v13 = (void *)CFPropertyListCreateWithData(v15, Mutable, 0, 0, 0);
  CFRelease(Mutable);
  if (!v13) {
    goto LABEL_27;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, @"num_cores");
  if (!Value
    || !CFNumberGetValue(Value, kCFNumberSInt32Type, v4 + 25)
    || (CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, @"num_mgpus")) == 0
    || !CFNumberGetValue(v19, kCFNumberSInt32Type, v4 + 24)
    || (CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v13, @"gpu_gen")) == 0
    || !CFNumberGetValue(v20, kCFNumberSInt32Type, v4 + 23))
  {
    char v17 = 0;
LABEL_28:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"((cfCoreConfig = createInternalCoreConfigDict(_sharedConnection)) != NULL) && ((cfCoreNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"num_cores\")) != NULL) && CFNumberGetValue(cfCoreNum, kCFNumberSInt32Type, (void*)(&_coreNum)) && ((cfMGPUNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"num_mgpus\")) != NULL) && CFNumberGetValue(cfMGPUNum, kCFNumberSInt32Type, (void*)(&_mgpuNum)) && ((cfGPUGen = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"gpu_gen\")) != NULL) && CFNumberGetValue(cfGPUGen, kCFNumberSInt32Type, (void*)(&_gpuGeneration))\"\n", "AGXGPURawCounterImpl.mm", 2731, "init");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2731;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreConfig = createInternalCoreConfigDict(_sharedConnection)) != NULL) && ((cfCoreNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"num_cores\")) != NULL) && CFNumberGetValue(cfCoreNum, kCFNumberSInt32Type, (void*)(&_coreNum)) && ((cfMGPUNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"num_mgpus\")) != NULL) && CFNumberGetValue(cfMGPUNum, kCFNumberSInt32Type, (void*)(&_mgpuNum)) && ((cfGPUGen = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"gpu_gen\")) != NULL) && CFNumberGetValue(cfGPUGen, kCFNumberSInt32Type, (void*)(&_gpuGeneration))\"\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2731;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreConfig = createInternalCoreConfigDict(_sharedConnection)) != NULL) && ((cfCoreNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"num_cores\")) != NULL) && CFNumberGetValue(cfCoreNum, kCFNumberSInt32Type, (void*)(&_coreNum)) && ((cfMGPUNum = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"num_mgpus\")) != NULL) && CFNumberGetValue(cfMGPUNum, kCFNumberSInt32Type, (void*)(&_mgpuNum)) && ((cfGPUGen = (CFNumberRef)CFDictionaryGetValue(cfCoreConfig, @\"gpu_gen\")) != NULL) && CFNumberGetValue(cfGPUGen, kCFNumberSInt32Type, (void*)(&_gpuGeneration))\"\n", buf, 0x1Cu);
    }
    if (v17) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
  v4[26] = v4[25] / v4[24];
  CFArrayRef v21 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v13, @"core_mask_list");
  CFArrayRef v22 = v21;
  if (v21)
  {
    unsigned int Count = CFArrayGetCount(v21);
    *(_DWORD *)size_t outputStructCnt = 0;
    v4[27] = 0;
    uint64_t v24 = Count;
    if (Count)
    {
      CFIndex v25 = 0;
      while (1)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v22, v25);
        if (!ValueAtIndex || !CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, outputStructCnt)) {
          break;
        }
        uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)outputStructCnt);
        v27.i16[0] = vaddlv_u8(v27);
        v4[27] += v27.i32[0];
        if (v24 == ++v25) {
          goto LABEL_56;
        }
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"((cfCoreMask = (CFNumberRef)CFArrayGetValueAtIndex(cfCoreMaskList, i)) != NULL) && CFNumberGetValue(cfCoreMask, kCFNumberSInt32Type, (void*)(&coreMask))\"\n", "AGXGPURawCounterImpl.mm", 2757, "init");
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2757;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "init";
        _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreMask = (CFNumberRef)CFArrayGetValueAtIndex(cfCoreMaskList, i)) != NULL) && CFNumberGetValue(cfCoreMask, kCFNumberSInt32Type, (void*)(&coreMask))\"\n", buf, 0x1Cu);
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2757;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "init";
        _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfCoreMask = (CFNumberRef)CFArrayGetValueAtIndex(cfCoreMaskList, i)) != NULL) && CFNumberGetValue(cfCoreMask, kCFNumberSInt32Type, (void*)(&coreMask))\"\n", buf, 0x1Cu);
      }
LABEL_39:
      CFRelease(v13);
      goto LABEL_12;
    }
  }
  else
  {
    v4[27] = v4[25];
  }
LABEL_56:
  objc_storeStrong((id *)v4 + 14, v13);
  CFRelease(v13);
  unsigned int v28 = v4 + 164;
  if (perfCtrSamplerGetSourceNum(v4 + 164, v4[22]))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceNum(&_sourceNum, _sharedConnection) == KERN_SUCCESS\"\n", "AGXGPURawCounterImpl.mm", 2775, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2775;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceNum(&_sourceNum, _sharedConnection) == KERN_SUCCESS\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2775;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    uint64_t v6 = MEMORY[0x263EF8438];
    uint64_t v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceNum(&_sourceNum, _sharedConnection) == KERN_SUCCESS\"\n";
    goto LABEL_11;
  }
  if (*v28 >= 0x41u)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"_sourceNum <= AGXGPURawCounterImpl::kSourceNumMax\"\n", "AGXGPURawCounterImpl.mm", 2777, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2777;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceNum <= AGXGPURawCounterImpl::kSourceNumMax\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2777;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    uint64_t v6 = MEMORY[0x263EF8438];
    uint64_t v7 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceNum <= AGXGPURawCounterImpl::kSourceNumMax\"\n";
    goto LABEL_11;
  }
  if (!*v28)
  {
LABEL_309:
    char v8 = 1;
    return v8 & 1;
  }
  CFArrayRef v29 = (const __CFArray *)IORegistryEntryCreateCFProperty(v4[2], @"PerfCtrPartitionInfoList", 0, 0);
  CFArrayRef v30 = v29;
  if (!v29
    || (unsigned int v31 = CFArrayGetCount(v29), (v4[168] = v31) == 0)
    || (unint64_t v32 = malloc_type_malloc(44 * v31, 0x1000040D4159EFEuLL), (*((void *)v4 + 83) = v32) == 0))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"((cfPartitionInfoList = (CFArrayRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"PerfCtrPartitionInfoList\", NULL, 0)) != NULL) && ((_partitionInfoNum = (uint32_t)CFArrayGetCount(cfPartitionInfoList)) != 0) && ((_partitionInfoList = (PartitionInfo*)malloc(sizeof(PartitionInfo) * _partitionInfoNum)) != NULL)\"\n", "AGXGPURawCounterImpl.mm", 2791, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2791;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfPartitionInfoList = (CFArrayRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"PerfCtrPartitionInfoList\", NULL, 0)) != NULL) && ((_partitionInfoNum = (uint32_t)CFArrayGetCount(cfPartitionInfoList)) != 0) && ((_partitionInfoList = (PartitionInfo*)malloc(sizeof(PartitionInfo) * _partitionInfoNum)) != NULL)\"\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2791;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      uint64_t v55 = MEMORY[0x263EF8438];
      uint64_t v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfPartitionInfoList = (CFArrayRef)IORegistryEntryCreateCFProperty(_accelerat"
            "orPort, @\"PerfCtrPartitionInfoList\", NULL, 0)) != NULL) && ((_partitionInfoNum = (uint32_t)CFArrayGe"
            "tCount(cfPartitionInfoList)) != 0) && ((_partitionInfoList = (PartitionInfo*)malloc(sizeof(PartitionInfo) * "
            "_partitionInfoNum)) != NULL)\"\n";
      goto LABEL_114;
    }
    goto LABEL_115;
  }
  bzero(v32, 44 * v4[168]);
  int v33 = 2;
  if (v4[23] >= 0xEu)
  {
    if (v4[24] < 2u) {
      int v33 = 2;
    }
    else {
      int v33 = 3;
    }
  }
  v4[169] = v33;
  if (v4[168])
  {
    CFIndex v34 = 0;
    while (1)
    {
      CFDictionaryRef v35 = (const __CFDictionary *)CFArrayGetValueAtIndex(v30, v34);
      CFDictionaryRef v36 = v35;
      if (!v35) {
        break;
      }
      CFNumberRef v37 = (const __CFNumber *)CFDictionaryGetValue(v35, @"index");
      CFStringRef v38 = (const __CFString *)CFDictionaryGetValue(v36, @"name");
      CFNumberRef v39 = (const __CFNumber *)CFDictionaryGetValue(v36, @"free_num");
      CFNumberRef v40 = (const __CFNumber *)CFDictionaryGetValue(v36, @"source_mask");
      CFNumberRef v41 = v40;
      *(_DWORD *)size_t outputStructCnt = 0;
      if (!v37 && !v39 && !v40)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(cfIndex != NULL) || (cfFreeNum != NULL) || (cfSourceMask != NULL)\"\n", "AGXGPURawCounterImpl.mm", 2809, "init");
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2809;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "init";
          _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfIndex != NULL) || (cfFreeNum != NULL) || (cfSourceMask != NULL)\"\n", buf, 0x1Cu);
        }
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
          goto LABEL_115;
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2809;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "init";
        uint64_t v55 = MEMORY[0x263EF8438];
        uint64_t v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfIndex != NULL) || (cfFreeNum != NULL) || (cfSourceMask != NULL)\"\n";
        goto LABEL_114;
      }
      if (!CFNumberGetValue(v37, kCFNumberSInt32Type, outputStructCnt)) {
        goto LABEL_117;
      }
      unsigned int v42 = *(_DWORD *)outputStructCnt;
      if (*(unsigned int *)outputStructCnt >= (unint64_t)v4[168]) {
        goto LABEL_117;
      }
      if (v38)
      {
        if (!CFStringGetCString(v38, (char *)(*((void *)v4 + 83) + 44 * *(unsigned int *)outputStructCnt + 4), 32, 0x8000100u))goto LABEL_117; {
        unsigned int v42 = *(_DWORD *)outputStructCnt;
        }
      }
      if (!CFNumberGetValue(v39, kCFNumberSInt32Type, (void *)(*((void *)v4 + 83) + 44 * v42 + 36))
        || !CFNumberGetValue(v41, kCFNumberSInt32Type, (void *)(*((void *)v4 + 83) + 44 * *(unsigned int *)outputStructCnt + 40)))
      {
LABEL_117:
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"CFNumberGetValue (cfIndex, kCFNumberSInt32Type, &index) && (index < _partitionInfoNum) && ((cfName == NULL) || CFStringGetCString(cfName, _partitionInfoList[index].name, sizeof(_partitionInfoList[index].name), kCFStringEncodingUTF8)) && CFNumberGetValue (cfFreeNum, kCFNumberSInt32Type, &_partitionInfoList[index].availableCounterNum) && CFNumberGetValue (cfSourceMask, kCFNumberSInt32Type, &_partitionInfoList[index].sourceMask)\"\n", "AGXGPURawCounterImpl.mm", 2815, "init");
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2815;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "init";
          _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue (cfIndex, kCFNumberSInt32Type, &index) && (index < _partitionInfoNum) && ((cfName == NULL) || CFStringGetCString(cfName, _partitionInfoList[index].name, sizeof(_partitionInfoList[index].name), kCFStringEncodingUTF8)) && CFNumberGetValue (cfFreeNum, kCFNumberSInt32Type, &_partitionInfoList[index].availableCounterNum) && CFNumberGetValue (cfSourceMask, kCFNumberSInt32Type, &_partitionInfoList[index].sourceMask)\"\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2815;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "init";
          uint64_t v55 = MEMORY[0x263EF8438];
          uint64_t v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue (cfIndex, kCFNumberSInt32Type, &index) && (index < _parti"
                "tionInfoNum) && ((cfName == NULL) || CFStringGetCString(cfName, _partitionInfoList[index].name, sizeof(_"
                "partitionInfoList[index].name), kCFStringEncodingUTF8)) && CFNumberGetValue (cfFreeNum, kCFNumberSInt32T"
                "ype, &_partitionInfoList[index].availableCounterNum) && CFNumberGetValue (cfSourceMask, kCFNumberSInt32T"
                "ype, &_partitionInfoList[index].sourceMask)\"\n";
          goto LABEL_114;
        }
LABEL_115:
        if (!v30) {
          goto LABEL_12;
        }
LABEL_116:
        CFRelease(v30);
        goto LABEL_12;
      }
      if (++v34 >= (unint64_t)v4[168]) {
        goto LABEL_84;
      }
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"info != NULL\"\n", "AGXGPURawCounterImpl.mm", 2801, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2801;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"info != NULL\"\n", buf, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
      goto LABEL_115;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2801;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    uint64_t v55 = MEMORY[0x263EF8438];
    uint64_t v56 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"info != NULL\"\n";
LABEL_114:
    _os_log_impl(&dword_23F075000, v55, OS_LOG_TYPE_INFO, v56, buf, 0x1Cu);
    goto LABEL_115;
  }
LABEL_84:
  CFRelease(v30);
  unsigned int v43 = (void *)MEMORY[0x2455C3290]();
  CFStringRef v44 = (const __CFString *)IORegistryEntryCreateCFProperty(v4[2], @"MetalPluginName", 0, 0);
  CFArrayRef v30 = (const __CFArray *)v44;
  if (!v44 || !CFStringGetCString(v44, (char *)buf, 256, 0x8000100u))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"((cfMmetalPluginName = (CFStringRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"MetalPluginName\", NULL, 0)) != NULL) && CFStringGetCString(cfMmetalPluginName, metalPluginName, sizeof(metalPluginName), kCFStringEncodingUTF8)\"\n", "AGXGPURawCounterImpl.mm", 2835, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2835;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfMmetalPluginName = (CFStringRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"MetalPluginName\", NULL, 0)) != NULL) && CFStringGetCString(cfMmetalPluginName, metalPluginName, sizeof(metalPluginName), kCFStringEncodingUTF8)\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2835;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((cfMmetalPluginName = (CFStringRef)IORegistryEntryCreateCFProperty(_acceleratorPort, @\"MetalPluginName\", NULL, 0)) != NULL) && CFStringGetCString(cfMmetalPluginName, metalPluginName, sizeof(metalPluginName), kCFStringEncodingUTF8)\"\n", outputStructCnt, 0x1Cu);
    }
    if (!v30) {
      goto LABEL_12;
    }
    goto LABEL_116;
  }
  CFRelease(v30);
  __int16 v45 = objc_msgSend(NSString, "stringWithFormat:", @"/AppleInternal/Library/AGX/Performance/%s/AGXMetalPerfCounters.plist", buf);
  if (!v45)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"plistPath != nil\"\n", "AGXGPURawCounterImpl.mm", 2841, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2841;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"plistPath != nil\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2841;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"plistPath != nil\"\n", outputStructCnt, 0x1Cu);
    }
    goto LABEL_260;
  }
  id v46 = v45;
  CFDictionaryRef theDict = (const __CFDictionary *)cfDictionaryCreateFromPlist((const char *)[v46 UTF8String]);
  if (theDict) {
    goto LABEL_88;
  }
  int v57 = (void *)MEMORY[0x263F086E0];
  __int16 v58 = objc_msgSend(NSString, "stringWithFormat:", @"/System/Library/Extensions/%s.bundle", buf, 0);
  int v59 = [v57 bundleWithPath:v58];

  if (!v59)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", "AGXGPURawCounterImpl.mm", 2852, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2852;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2852;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", outputStructCnt, 0x1Cu);
    }

    goto LABEL_260;
  }
  __int16 v60 = [v59 pathForResource:@"AGXMetalPerfCounters" ofType:@"plist"];

  id v46 = v60;
  CFDictionaryRef theDict = (const __CFDictionary *)cfDictionaryCreateFromPlist((const char *)[v46 UTF8String]);

  if (theDict) {
    goto LABEL_88;
  }
  int v61 = (void *)MEMORY[0x263F086E0];
  uint64_t v62 = objc_msgSend(NSString, "stringWithFormat:", @"/System/Library/Extensions/%s.bundle", buf, 0);
  uint64_t v63 = [v61 bundleWithPath:v62];

  if (!v63)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", "AGXGPURawCounterImpl.mm", 2866, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2866;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n", outputStructCnt, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
      goto LABEL_259;
    }
    *(_DWORD *)size_t outputStructCnt = 136315650;
    *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
    __int16 v214 = 1024;
    int v215 = 2866;
    __int16 v216 = 2080;
    v217 = "init";
    v153 = MEMORY[0x263EF8438];
    v154 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"driverBundle != nil\"\n";
    goto LABEL_258;
  }
  uint64_t v64 = [v63 pathForResource:@"AGXMetalPerfCountersExternal" ofType:@"plist"];

  id v46 = v64;
  CFDictionaryRef theDict = (const __CFDictionary *)cfDictionaryCreateFromPlist((const char *)[v46 UTF8String]);
  if (!theDict)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(cfDict = cfDictionaryCreateFromPlist([plistPath UTF8String])) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2872, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2872;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfDict = cfDictionaryCreateFromPlist([plistPath UTF8String])) != NULL\"\n", outputStructCnt, 0x1Cu);
    }
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO)) {
      goto LABEL_259;
    }
    *(_DWORD *)size_t outputStructCnt = 136315650;
    *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
    __int16 v214 = 1024;
    int v215 = 2872;
    __int16 v216 = 2080;
    v217 = "init";
    v153 = MEMORY[0x263EF8438];
    v154 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfDict = cfDictionaryCreateFromPlist([plistPath UTF8String])) != NULL\"\n";
LABEL_258:
    _os_log_impl(&dword_23F075000, v153, OS_LOG_TYPE_INFO, v154, outputStructCnt, 0x1Cu);
LABEL_259:

LABEL_260:
    goto LABEL_12;
  }
  *((unsigned char *)v4 + 12(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = 1;

LABEL_88:
  LODWORD(v47) = *v28;
  if (*v28)
  {
    unint64_t v48 = 0;
    int v49 = __s1;
    do
    {
      if (perfCtrSamplerGetSourceInfo(v48, (uint64_t)v49, v4[22]))
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceInfo(sourceIdx, &sourceInfo, _sharedConnection) == KERN_SUCCESS\"\n", "AGXGPURawCounterImpl.mm", 2890, "init");
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2890;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "init";
          _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceInfo(sourceIdx, &sourceInfo, _sharedConnection) == KERN_SUCCESS\"\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2890;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "init";
          _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"perfCtrSamplerGetSourceInfo(sourceIdx, &sourceInfo, _sharedConnection) == KERN_SUCCESS\"\n", buf, 0x1Cu);
        }
        CFStringRef theString2 = 0;
        goto LABEL_336;
      }
      ++v48;
      unint64_t v47 = *v28;
      v49 += 11;
    }
    while (v48 < v47);
  }
  buf[0] = 0;
  memset(&buf[4], 0, 28);
  if (v47 == 1) {
    uint64_t v50 = 1;
  }
  else {
    uint64_t v50 = ~(-1 << v47) & 6;
  }
  uint64_t v199 = v50;
  if (*((unsigned char *)v4 + 120)) {
    unint64_t v51 = "_423ccc54aeb6a01f9abb7b533d6542a7d502c505be6e14c69056cc6886c4d1b5";
  }
  else {
    unint64_t v51 = "GBL_USC_PROFILE_DATA_00_USC_00";
  }
  CFStringRef theString2 = CFStringCreateWithCString(v15, v51, 0x8000100u);
  if (!theString2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(cfShaderProfilerCounterName = CFStringCreateWithCString(kCFAllocatorDefault, shaderProfilerCounterName, kCFStringEncodingUTF8)) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2913, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2913;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfShaderProfilerCounterName = CFStringCreateWithCString(kCFAllocatorDefault, shaderProfilerCounterName, kCFStringEncodingUTF8)) != NULL\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2913;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfShaderProfilerCounterName = CFStringCreateWithCString(kCFAllocatorDefault, shaderProfilerCounterName, kCFStringEncodingUTF8)) != NULL\"\n", outputStructCnt, 0x1Cu);
    }
    CFStringRef theString2 = 0;
    goto LABEL_278;
  }
  uint64_t v52 = *v28;
  if (!v52)
  {
    int8x8_t v54 = 0;
    goto LABEL_168;
  }
  if (v52 > 3)
  {
    uint64_t v53 = v52 & 0xFFFFFFFC;
    uint64_t v66 = (__int32 *)v254;
    int8x16_t v67 = 0uLL;
    uint64_t v68 = v53;
    int8x16_t v69 = 0uLL;
    do
    {
      int64x2_t v70 = v66 + 11;
      v71.i32[0] = *(v66 - 22);
      v71.i32[1] = *(v66 - 11);
      __int32 v72 = *v66;
      v66 += 44;
      v73.i32[0] = v72;
      v73.i32[1] = *v70;
      int8x8_t v74 = vbic_s8(v71, (int8x8_t)vceqz_s32((int32x2_t)vand_s8(v71, (int8x8_t)0x1F0000001FLL)));
      int8x8_t v75 = vbic_s8(v73, (int8x8_t)vceqz_s32((int32x2_t)vand_s8(v73, (int8x8_t)0x1F0000001FLL)));
      v76.i64[0] = v74.u32[0];
      v76.i64[1] = v74.u32[1];
      int8x16_t v77 = v76;
      v76.i64[0] = v75.u32[0];
      v76.i64[1] = v75.u32[1];
      int8x16_t v67 = vorrq_s8(v67, v77);
      int8x16_t v69 = vorrq_s8(v69, v76);
      v68 -= 4;
    }
    while (v68);
    int8x16_t v78 = vorrq_s8(v69, v67);
    int8x8_t v54 = vorr_s8(*(int8x8_t *)v78.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v78, v78, 8uLL));
    if (v53 == v52) {
      goto LABEL_168;
    }
  }
  else
  {
    uint64_t v53 = 0;
    int8x8_t v54 = 0;
  }
  uint64_t v79 = v52 - v53;
  uint64_t v80 = &__s1[11 * v53 + 10];
  do
  {
    int v82 = *v80;
    v80 += 11;
    LODWORD(v81) = v82;
    if ((v82 & 0x1F) != 0) {
      uint64_t v81 = v81;
    }
    else {
      uint64_t v81 = 0;
    }
    *(void *)&v54 |= v81;
    --v79;
  }
  while (v79);
LABEL_168:
  *(_DWORD *)&uint8_t buf[4] = 8;
  *(void *)&buf[16] = 0;
  CFArrayRef theArray = (const __CFArray *)CFDictionaryGetValue(theDict, @"DeviceCounters");
  if (theArray && (uint64_t v203 = CFArrayGetCount(theArray)) != 0)
  {
    uint64_t v200 = 0;
    BOOL v201 = 0;
    char v83 = 1;
    while (2)
    {
      CFIndex v84 = 0;
      unsigned int v205 = 0;
      char v202 = v83;
      do
      {
        CFStringRef v86 = (const __CFString *)CFArrayGetValueAtIndex(theArray, v84);
        if (v86 && (v87 = (const __CFDictionary *)CFDictionaryGetValue(theDict, v86), (CFDictionaryRef v88 = v87) != 0))
        {
          CFNumberRef v89 = (const __CFNumber *)CFDictionaryGetValue(v87, @"Partition");
          CFNumberRef number = (const __CFNumber *)CFDictionaryGetValue(v88, @"Select");
          CFStringRef theString = &stru_26F2CABE8;
          if (!*((unsigned char *)v4 + 120)) {
            CFStringRef theString = (const __CFString *)CFDictionaryGetValue(v88, @"Description");
          }
          CFNumberRef v90 = (const __CFNumber *)CFDictionaryGetValue(v88, @"Flag");
          int v91 = 1;
        }
        else
        {
          CFNumberRef v89 = 0;
          int v91 = 0;
          CFNumberRef number = 0;
          CFNumberRef v90 = 0;
          uint64_t v92 = &stru_26F2CABE8;
          if (!*((unsigned char *)v4 + 120)) {
            uint64_t v92 = 0;
          }
          CFStringRef theString = v92;
        }
        uint64_t valuePtr = 0;
        if (!v91 || !v89 || !number || !theString)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(cfPerfCtrInfo != NULL) && (cfPerfCtrPartition != NULL) && (cfPerfCtrSelect != NULL) && (cfPerfCtrDesc != NULL)\"\n", "AGXGPURawCounterImpl.mm", 2957, "init");
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)size_t outputStructCnt = 136315650;
            *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            __int16 v214 = 1024;
            int v215 = 2957;
            __int16 v216 = 2080;
            v217 = "init";
            _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrInfo != NULL) && (cfPerfCtrPartition != NULL) && (cfPerfCtrSelect != NULL) && (cfPerfCtrDesc != NULL)\"\n", outputStructCnt, 0x1Cu);
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)size_t outputStructCnt = 136315650;
            *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            __int16 v214 = 1024;
            int v215 = 2957;
            __int16 v216 = 2080;
            v217 = "init";
            v151 = MEMORY[0x263EF8438];
            v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrInfo != NULL) && (cfPerfCtrPartition != NULL) && (cfPerfCtrSe"
                   "lect != NULL) && (cfPerfCtrDesc != NULL)\"\n";
            goto LABEL_277;
          }
          goto LABEL_278;
        }
        if (!CFNumberGetValue(v89, kCFNumberSInt32Type, (char *)&valuePtr + 4)
          || (unsigned int v93 = HIDWORD(valuePtr), HIDWORD(valuePtr) >= (unint64_t)v4[168]))
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"CFNumberGetValue(cfPerfCtrPartition, kCFNumberSInt32Type, &perfCtrPartition) && (perfCtrPartition < _partitionInfoNum)\"\n", "AGXGPURawCounterImpl.mm", 2958, "init");
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)size_t outputStructCnt = 136315650;
            *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            __int16 v214 = 1024;
            int v215 = 2958;
            __int16 v216 = 2080;
            v217 = "init";
            _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue(cfPerfCtrPartition, kCFNumberSInt32Type, &perfCtrPartition) && (perfCtrPartition < _partitionInfoNum)\"\n", outputStructCnt, 0x1Cu);
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)size_t outputStructCnt = 136315650;
            *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
            __int16 v214 = 1024;
            int v215 = 2958;
            __int16 v216 = 2080;
            v217 = "init";
            v151 = MEMORY[0x263EF8438];
            v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"CFNumberGetValue(cfPerfCtrPartition, kCFNumberSInt32Type, &perfCtrParti"
                   "tion) && (perfCtrPartition < _partitionInfoNum)\"\n";
            goto LABEL_277;
          }
          goto LABEL_278;
        }
        if (v90)
        {
          if (!CFNumberGetValue(v90, kCFNumberSInt32Type, &valuePtr))
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(cfPerfCtrFlag == NULL) || CFNumberGetValue(cfPerfCtrFlag, kCFNumberSInt32Type, &perfCtrFlag)\"\n", "AGXGPURawCounterImpl.mm", 2959, "init");
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)size_t outputStructCnt = 136315650;
              *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
              __int16 v214 = 1024;
              int v215 = 2959;
              __int16 v216 = 2080;
              v217 = "init";
              _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrFlag == NULL) || CFNumberGetValue(cfPerfCtrFlag, kCFNumberSInt32Type, &perfCtrFlag)\"\n", outputStructCnt, 0x1Cu);
            }
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)size_t outputStructCnt = 136315650;
              *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
              __int16 v214 = 1024;
              int v215 = 2959;
              __int16 v216 = 2080;
              v217 = "init";
              v151 = MEMORY[0x263EF8438];
              v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(cfPerfCtrFlag == NULL) || CFNumberGetValue(cfPerfCtrFlag, kCFNumberS"
                     "Int32Type, &perfCtrFlag)\"\n";
              goto LABEL_277;
            }
            goto LABEL_278;
          }
          unsigned int v93 = HIDWORD(valuePtr);
        }
        uint64_t v204 = *(unsigned int *)(*((void *)v4 + 83) + 44 * v93 + 40);
        if (v204)
        {
          if (v202)
          {
            int Length = CFStringGetLength(v86);
            *(void *)&buf[16] += ((Length + 1) + (unint64_t)*(unsigned int *)&buf[4] - 1) & -(uint64_t)*(unsigned int *)&buf[4];
            int v95 = CFStringGetLength(theString);
            *(void *)&buf[16] += ((v95 + 1) + (unint64_t)*(unsigned int *)&buf[4] - 1) & -(uint64_t)*(unsigned int *)&buf[4];
            v200 |= v204;
            BOOL v85 = v201 || CFEqual(v86, theString2);
            BOOL v201 = v85;
          }
          else
          {
            uint64_t v96 = *((void *)v4 + 16);
            int v97 = CFStringGetLength(v86);
            uint64_t v98 = v96 + 56 * v205;
            *(_DWORD *)(v98 + 16) = v97;
            long long v99 = (_DWORD *)(v98 + 16);
            long long v100 = (char *)StackAllocator::reserve((StackAllocator *)buf, v97 + 1);
            *(void *)(v96 + 56 * v205) = v100;
            if (!v100)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(counterDesc.name = (char*)(allocator.reserve(counterDesc.nameLen + 1))) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2994, "init");
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 2994;
                __int16 v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name = (char*)(allocator.reserve(counterDesc.nameLen + 1))) != NULL\"\n", outputStructCnt, 0x1Cu);
              }
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 2994;
                __int16 v216 = 2080;
                v217 = "init";
                v151 = MEMORY[0x263EF8438];
                v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name = (char*)(allocator.reserve(counterDesc.nameLen +"
                       " 1))) != NULL\"\n";
                goto LABEL_277;
              }
              goto LABEL_278;
            }
            CFStringGetCString(v86, v100, (*v99 + 1), 0x8000100u);
            int v101 = CFStringGetLength(theString);
            uint64_t v102 = v96 + 56 * v205;
            *(_DWORD *)(v102 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = v101;
            long long v103 = (_DWORD *)(v102 + 20);
            long long v104 = (char *)StackAllocator::reserve((StackAllocator *)buf, v101 + 1);
            *(void *)(v103 - 3) = v104;
            if (!v104)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(counterDesc.description = (char*)(allocator.reserve(counterDesc.descriptionLen + 1))) != NULL\"\n", "AGXGPURawCounterImpl.mm", 2999, "init");
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 2999;
                __int16 v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.description = (char*)(allocator.reserve(counterDesc.descriptionLen + 1))) != NULL\"\n", outputStructCnt, 0x1Cu);
              }
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 2999;
                __int16 v216 = 2080;
                v217 = "init";
                v151 = MEMORY[0x263EF8438];
                v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.description = (char*)(allocator.reserve(counterDesc.de"
                       "scriptionLen + 1))) != NULL\"\n";
                goto LABEL_277;
              }
              goto LABEL_278;
            }
            CFStringGetCString(theString, v104, (*v103 + 1), 0x8000100u);
            CFNumberGetValue(v89, kCFNumberSInt64Type, (void *)(v96 + 56 * v205 + 28));
            CFNumberGetValue(number, kCFNumberSInt64Type, (void *)(v96 + 56 * v205 + 32));
            uint64_t v105 = v96 + 56 * v205;
            *(void *)(v105 + 4(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = v204;
            *(_DWORD *)(v105 + 24) = *(_DWORD *)(v105 + 28) >= v4[169];
            *(_DWORD *)(v105 + 48) = valuePtr;
          }
          ++v205;
        }
        ++v84;
      }
      while (v203 != v84);
      if ((v202 & 1) == 0)
      {
        CFStringRef theStringa = 0;
        unint64_t v115 = &dword_2650549F0;
        while (1)
        {
          unsigned int v116 = v205 + theStringa;
          uint64_t v117 = *((void *)v4 + 16);
          uint64_t v118 = v117 + 56 * (v205 + theStringa);
          v119 = (const char *)*((void *)v115 - 2);
          int v120 = strlen(v119);
          *(_DWORD *)(v118 + 16) = v120;
          size_t v121 = (v120 + 1);
          int v122 = (void *)StackAllocator::reserve((StackAllocator *)buf, v121);
          int v123 = v122;
          if (v121) {
            BOOL v124 = v122 == 0;
          }
          else {
            BOOL v124 = 1;
          }
          if (!v124) {
            memcpy(v122, v119, v121);
          }
          *(void *)uint64_t v118 = v123;
          v125 = (const char *)*((void *)v115 - 1);
          int v126 = strlen(v125);
          *(_DWORD *)(v117 + 56 * v116 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = v126;
          size_t v127 = (v126 + 1);
          int v128 = (void *)StackAllocator::reserve((StackAllocator *)buf, v127);
          __int16 v129 = v128;
          if (v127) {
            BOOL v130 = v128 == 0;
          }
          else {
            BOOL v130 = 1;
          }
          if (!v130) {
            memcpy(v128, v125, v127);
          }
          *(void *)(v117 + 56 * v116 + 8) = v129;
          if (!*(void *)v118 || v129 == 0) {
            break;
          }
          int v132 = *v115;
          v115 += 6;
          __int16 v133 = (int8x8_t *)(v117 + 56 * v116);
          v133[3].i32[0] = v132;
          v133[3].i32[1] = -1;
          CFStringRef v134 = theStringa;
          v133[4] = (int8x8_t)theStringa;
          v133[5] = v54;
          CFStringRef theStringa = (CFStringRef)((char *)theStringa + 1);
          if (v134 == (CFStringRef)7)
          {
            unsigned int v135 = v205 + 8;
            if (v201 && v4[26])
            {
              uint64_t v136 = 0;
              unsigned int v137 = v205 + 8;
              while (1)
              {
                unsigned int v138 = v137 + v136;
                uint64_t v139 = *((void *)v4 + 16);
                __int16 v140 = (char **)(v139 + 56 * (v137 + v136));
                *((_DWORD *)v140 + 4) = 27;
                v141 = v140 + 2;
                uint64_t v142 = (char *)StackAllocator::reserve((StackAllocator *)buf, 0x1Cu);
                if (v142) {
                  strcpy(v142, "GRC_SHADER_PROFILER_DATA_00");
                }
                *__int16 v140 = v142;
                uint64_t v143 = v139 + 56 * v138;
                *(_DWORD *)(v143 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = 64;
                v144 = (_DWORD *)(v143 + 20);
                v145 = (char *)StackAllocator::reserve((StackAllocator *)buf, 0x41u);
                if (!v145) {
                  break;
                }
                strcpy(v145, "Virtual counter to read shader profiler trace buffer from USC 00");
                uint64_t v146 = v139 + 56 * v138;
                *(void *)(v146 + 8) = v145;
                v147 = (void *)(v146 + 8);
                v148 = *v140;
                if (!*v140) {
                  goto LABEL_341;
                }
                uint64_t v149 = v139 + 56 * v138;
                *(_DWORD *)(v149 + 24) = 1;
                v148[*v141 - 2] = v136 / 0xA + 48;
                (*v140)[*v141 - 1] = (v136 % 0xA) | 0x30;
                *(unsigned char *)(*v147 + (*v144 - 2)) = v136 / 0xA + 48;
                *(unsigned char *)(*v147 + (*v144 - 1)) = (v136 % 0xA) | 0x30;
                *(_DWORD *)(v149 + 28) = -2;
                *(void *)(v149 + 32) = v136;
                *(void *)(v149 + 4(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = v199;
                if (++v136 >= (unint64_t)v4[26])
                {
                  unsigned int v135 = v205 + 8 + v136;
                  goto LABEL_233;
                }
              }
              *(void *)(v139 + 56 * v138 + 8) = 0;
LABEL_341:
              fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", "AGXGPURawCounterImpl.mm", 3089, "init");
              v192 = MEMORY[0x263EF8438];
              id v193 = MEMORY[0x263EF8438];
              if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 3089;
                __int16 v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", outputStructCnt, 0x1Cu);
              }

              v194 = v192;
              if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 3089;
                __int16 v216 = 2080;
                v217 = "init";
                _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", outputStructCnt, 0x1Cu);
              }
            }
            else
            {
LABEL_233:
              if (*(void *)&buf[16] == *(void *)&buf[24] && v135 == v4[34])
              {
                buf[0] = 0;
                memset(&buf[4], 0, 28);
                goto LABEL_236;
              }
              fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(allocator.free() == 0) && (perfCtrIdx == _masterCounterNum)\"\n", "AGXGPURawCounterImpl.mm", 3106, "init");
              v196 = MEMORY[0x263EF8438];
              id v197 = MEMORY[0x263EF8438];
              if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 3106;
                __int16 v216 = 2080;
                v217 = "init";
                _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(allocator.free() == 0) && (perfCtrIdx == _masterCounterNum)\"\n", outputStructCnt, 0x1Cu);
              }

              v198 = v196;
              if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)size_t outputStructCnt = 136315650;
                *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
                __int16 v214 = 1024;
                int v215 = 3106;
                __int16 v216 = 2080;
                v217 = "init";
                _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(allocator.free() == 0) && (perfCtrIdx == _masterCounterNum)\"\n", outputStructCnt, 0x1Cu);
              }
            }

            goto LABEL_278;
          }
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", "AGXGPURawCounterImpl.mm", 3068, "init");
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)size_t outputStructCnt = 136315650;
          *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          __int16 v214 = 1024;
          int v215 = 3068;
          __int16 v216 = 2080;
          v217 = "init";
          _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n", outputStructCnt, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)size_t outputStructCnt = 136315650;
          *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          __int16 v214 = 1024;
          int v215 = 3068;
          __int16 v216 = 2080;
          v217 = "init";
          v151 = MEMORY[0x263EF8438];
          v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(counterDesc.name != NULL) && (counterDesc.description != NULL)\"\n";
          goto LABEL_277;
        }
        break;
      }
      if (v205 && v200)
      {
        unint64_t v106 = -(uint64_t)*(unsigned int *)&buf[4];
        int64x2_t v107 = vdupq_n_s64(*(unsigned int *)&buf[4]);
        int8x16_t v108 = (int8x16_t)vdupq_n_s64(v106);
        int64x2_t v109 = (int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_23F0888F0), v108);
        int64x2_t v110 = (int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_23F0888E0), v108);
        v110.i64[0] *= 3;
        v110.i64[1] *= 2;
        uint64_t v111 = vaddvq_s64(vaddq_s64(v110, vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_23F088910), v108), vaddq_s64(vaddq_s64(v109, v109), (int64x2_t)vandq_s8((int8x16_t)vaddq_s64(v107, (int64x2_t)xmmword_23F088900), v108)))))+ ((*(unsigned int *)&buf[4] + 95) & v106)+ ((*(unsigned int *)&buf[4] + 52) & v106)+ ((*(unsigned int *)&buf[4] + 56) & v106)+ *(void *)&buf[16];
        unsigned int v112 = v205 + 8;
        if (v201)
        {
          int v113 = v4[26];
          if (v113)
          {
            uint64_t v114 = ((*(unsigned int *)&buf[4] + 27) & v106) + ((*(unsigned int *)&buf[4] + 64) & v106);
            v111 += v114 + v114 * (v113 - 1);
            unsigned int v112 = v113 + v205 + 8;
          }
        }
        *(void *)&buf[16] = ((*(unsigned int *)&buf[4] + 56 * v112 - 1) & v106) + v111;
        StackAllocator::init((StackAllocator *)buf, *(uint64_t *)&buf[16]);
        *((void *)v4 + 16) = *(void *)&buf[8];
        v4[34] = v112;
        if (StackAllocator::reserve((StackAllocator *)buf, 56 * v112))
        {
LABEL_236:
          char v83 = 0;
          if (v202) {
            continue;
          }
          CFRelease(theDict);
          CFRelease(theString2);
          qsort_b(*((void **)v4 + 16), v4[34], 0x38uLL, &__block_literal_global_148);
          int v150 = 0;
          CFStringRef theString2 = 0;
          CFDictionaryRef theDict = 0;
          goto LABEL_279;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"allocator.reserve(sizeof(CounterDescImpl) * _masterCounterNum) != NULL\"\n", "AGXGPURawCounterImpl.mm", 3052, "init");
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)size_t outputStructCnt = 136315650;
          *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          __int16 v214 = 1024;
          int v215 = 3052;
          __int16 v216 = 2080;
          v217 = "init";
          _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"allocator.reserve(sizeof(CounterDescImpl) * _masterCounterNum) != NULL\"\n", outputStructCnt, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)size_t outputStructCnt = 136315650;
          *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          __int16 v214 = 1024;
          int v215 = 3052;
          __int16 v216 = 2080;
          v217 = "init";
          v151 = MEMORY[0x263EF8438];
          v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"allocator.reserve(sizeof(CounterDescImpl) * _masterCounterNum) != NULL\"\n";
          goto LABEL_277;
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(perfCtrIdx != 0) && (sourceMaskAll != 0)\"\n", "AGXGPURawCounterImpl.mm", 3022, "init");
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)size_t outputStructCnt = 136315650;
          *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          __int16 v214 = 1024;
          int v215 = 3022;
          __int16 v216 = 2080;
          v217 = "init";
          _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(perfCtrIdx != 0) && (sourceMaskAll != 0)\"\n", outputStructCnt, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)size_t outputStructCnt = 136315650;
          *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
          __int16 v214 = 1024;
          int v215 = 3022;
          __int16 v216 = 2080;
          v217 = "init";
          v151 = MEMORY[0x263EF8438];
          v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"(perfCtrIdx != 0) && (sourceMaskAll != 0)\"\n";
          goto LABEL_277;
        }
      }
      break;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"((perfCtrList = (CFArrayRef)CFDictionaryGetValue(cfDict, @\"DeviceCounters\")) != NULL) && ((perfCtrNum = (uint32_t)CFArrayGetCount(perfCtrList)) != 0)\"\n", "AGXGPURawCounterImpl.mm", 2935, "init");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2935;
      __int16 v216 = 2080;
      v217 = "init";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"((perfCtrList = (CFArrayRef)CFDictionaryGetValue(cfDict, @\"DeviceCounters\")) != NULL) && ((perfCtrNum = (uint32_t)CFArrayGetCount(perfCtrList)) != 0)\"\n", outputStructCnt, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)size_t outputStructCnt = 136315650;
      *(void *)&outputStructCnt[4] = "AGXGPURawCounterImpl.mm";
      __int16 v214 = 1024;
      int v215 = 2935;
      __int16 v216 = 2080;
      v217 = "init";
      v151 = MEMORY[0x263EF8438];
      v152 = "AGXGRC:AGXGRC:%s:%d:%s: *** \"((perfCtrList = (CFArrayRef)CFDictionaryGetValue(cfDict, CFSTR(\"DeviceCounte"
             "rs\"))) != NULL) && ((perfCtrNum = (uint32_t)CFArrayGetCount(perfCtrList)) != 0)\"\n";
LABEL_277:
      _os_log_impl(&dword_23F075000, v151, OS_LOG_TYPE_INFO, v152, outputStructCnt, 0x1Cu);
    }
  }
LABEL_278:
  int v150 = 6;
LABEL_279:
  if (buf[0]) {
    free(*(void **)&buf[8]);
  }
  if (v150 == 6) {
    goto LABEL_336;
  }
  uint64_t v155 = v4[34];
  if (v155)
  {
    unint64_t v156 = v4[164];
    if (!v156) {
      goto LABEL_306;
    }
    uint64_t v157 = 0;
    uint64_t v158 = *((void *)v4 + 16);
    do
    {
      uint64_t v159 = *(void *)(v158 + 56 * v157 + 40);
      v160 = v219;
      v161 = (int *)v253;
      unint64_t v162 = v156;
      do
      {
        int v163 = *v161;
        v161 += 11;
        if ((v159 & v163) != 0) {
          ++*v160;
        }
        ++v160;
        --v162;
      }
      while (v162);
      ++v157;
    }
    while (v157 != v155);
  }
  else
  {
    unint64_t v156 = *v28;
    if (!v156) {
      goto LABEL_306;
    }
  }
  for (unint64_t i = 0; i < v156; ++i)
  {
    uint64_t v165 = v219[i];
    if (v165)
    {
      v166 = malloc_type_malloc(4 * v165, 0x100004052888210uLL);
      v220[i] = v166;
      if (!v166)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"sourceCounterIdxList[i] != NULL\"\n", "AGXGPURawCounterImpl.mm", 3164, "init");
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3164;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "init";
          _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"sourceCounterIdxList[i] != NULL\"\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3164;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "init";
          _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"sourceCounterIdxList[i] != NULL\"\n", buf, 0x1Cu);
        }
        goto LABEL_336;
      }
      v219[i] = 0;
      unint64_t v156 = *v28;
    }
  }
  unint64_t v167 = v4[34];
  if (v167)
  {
    if (v156)
    {
      unint64_t v168 = 0;
      uint64_t v169 = *((void *)v4 + 16);
      uint64_t v170 = 1;
      do
      {
        if (v170)
        {
          unint64_t v171 = 0;
          uint64_t v172 = *(void *)(v169 + 56 * v168 + 40);
          v173 = (int *)v253;
          do
          {
            int v174 = *v173;
            v173 += 11;
            if ((v172 & v174) != 0)
            {
              uint64_t v175 = v219[v171];
              *((_DWORD *)v220[v171] + v175) = v168;
              v219[v171] = v175 + 1;
              unint64_t v156 = *v28;
            }
            ++v171;
          }
          while (v171 < v156);
          unint64_t v167 = v4[34];
          uint64_t v170 = v156;
        }
        ++v168;
      }
      while (v168 < v167);
      goto LABEL_307;
    }
LABEL_306:
    v4[170] = 0x4000;
    char v8 = 1;
    return v8 & 1;
  }
LABEL_307:
  v4[170] = 0x4000;
  if (!v156) {
    goto LABEL_309;
  }
  unint64_t v176 = 0;
  v177 = (char *)__s1;
  for (j = v220; ; ++j)
  {
    if (!*((_DWORD *)v177 + 8))
    {
      free(*j);
      v179 = j;
      goto LABEL_311;
    }
    v180 = (uint64_t (**)(_DWORD *, unint64_t, char *, void *, void, void))AGXGPURawCounterImpl::chipDispatchTableForSource((AGXGPURawCounterImpl *)v4[23], v4[24], v4[26], v177, v65);
    if (!v180) {
      break;
    }
    v181 = &v4[2 * v176];
    if (*((void *)v181 + 18))
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"_sourceList[sourceIdx] == nullptr\"\n", "AGXGPURawCounterImpl.mm", 3206, "init");
      v186 = MEMORY[0x263EF8438];
      id v187 = MEMORY[0x263EF8438];
      if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3206;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "init";
        _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceList[sourceIdx] == nullptr\"\n", buf, 0x1Cu);
      }

      v188 = v186;
      if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3206;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "init";
        _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"_sourceList[sourceIdx] == nullptr\"\n", buf, 0x1Cu);
      }
      goto LABEL_335;
    }
    uint64_t v182 = (*v180)(v4, v176, v177, *j, v219[v176], v180);
    *((void *)v181 + 18) = v182;
    if (!v182)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"(_sourceList[sourceIdx] = chipDispatchTable->createSource( this, sourceIdx, &sourceInfo, sourceCounterIdxList[sourceIdx], sourceCounterIdxNum [sourceIdx], chipDispatchTable)) != nullptr\"\n", "AGXGPURawCounterImpl.mm", 3213, "init");
      v189 = MEMORY[0x263EF8438];
      id v190 = MEMORY[0x263EF8438];
      if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3213;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "init";
        _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sourceList[sourceIdx] = chipDispatchTable->createSource( this, sourceIdx, &sourceInfo, sourceCounterIdxList[sourceIdx], sourceCounterIdxNum [sourceIdx], chipDispatchTable)) != nullptr\"\n", buf, 0x1Cu);
      }

      v191 = v189;
      if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 3213;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "init";
        _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"(_sourceList[sourceIdx] = chipDispatchTable->createSource( this, sourceIdx, &sourceInfo, sourceCounterIdxList[sourceIdx], sourceCounterIdxNum [sourceIdx], chipDispatchTable)) != nullptr\"\n", buf, 0x1Cu);
      }
      goto LABEL_335;
    }
    v179 = &v220[v176];
LABEL_311:
    v177 += 44;
    *v179 = 0;
    ++v176;
    char v8 = 1;
    if (v176 >= *v28) {
      return v8 & 1;
    }
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** \"chipDispatchTable != nullptr\"\n", "AGXGPURawCounterImpl.mm", 3205, "init");
  v183 = MEMORY[0x263EF8438];
  id v184 = MEMORY[0x263EF8438];
  if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3205;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** \"chipDispatchTable != nullptr\"\n", buf, 0x1Cu);
  }

  v185 = v183;
  if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AGXGPURawCounterImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3205;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "init";
    _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** \"chipDispatchTable != nullptr\"\n", buf, 0x1Cu);
  }
LABEL_335:

LABEL_336:
  if (theDict) {
    CFRelease(theDict);
  }
  if (theString2) {
    CFRelease(theString2);
  }
LABEL_12:
  free(v220[0]);
  free(v220[1]);
  free((void *)v221);
  free(*((void **)&v221 + 1));
  free((void *)v222);
  free(*((void **)&v222 + 1));
  free((void *)v223);
  free(*((void **)&v223 + 1));
  free((void *)v224);
  free(*((void **)&v224 + 1));
  free((void *)v225);
  free(*((void **)&v225 + 1));
  free((void *)v226);
  free(*((void **)&v226 + 1));
  free((void *)v227);
  free(*((void **)&v227 + 1));
  free((void *)v228);
  free(*((void **)&v228 + 1));
  free((void *)v229);
  free(*((void **)&v229 + 1));
  free((void *)v230);
  free(*((void **)&v230 + 1));
  free((void *)v231);
  free(*((void **)&v231 + 1));
  free((void *)v232);
  free(*((void **)&v232 + 1));
  free((void *)v233);
  free(*((void **)&v233 + 1));
  free((void *)v234);
  free(*((void **)&v234 + 1));
  free((void *)v235);
  free(*((void **)&v235 + 1));
  free((void *)v236);
  free(*((void **)&v236 + 1));
  free((void *)v237);
  free(*((void **)&v237 + 1));
  free((void *)v238);
  free(*((void **)&v238 + 1));
  free((void *)v239);
  free(*((void **)&v239 + 1));
  free((void *)v240);
  free(*((void **)&v240 + 1));
  free((void *)v241);
  free(*((void **)&v241 + 1));
  free((void *)v242);
  free(*((void **)&v242 + 1));
  free((void *)v243);
  free(*((void **)&v243 + 1));
  free((void *)v244);
  free(*((void **)&v244 + 1));
  free((void *)v245);
  free(*((void **)&v245 + 1));
  free((void *)v246);
  free(*((void **)&v246 + 1));
  free((void *)v247);
  free(*((void **)&v247 + 1));
  free((void *)v248);
  free(*((void **)&v248 + 1));
  free((void *)v249);
  free(*((void **)&v249 + 1));
  free((void *)v250);
  free(*((void **)&v250 + 1));
  free((void *)v251);
  free(*((void **)&v251 + 1));
  AGXGPURawCounterImpl::free((AGXGPURawCounterImpl *)v4);
  char v8 = 0;
  return v8 & 1;
}

void sub_23F085034(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,void *a38)
{
  if (a37)
  {
    free(a38);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t perfCtrSamplerGetSourceNum(unsigned int *a1, mach_port_t connection)
{
  v4[0] = xmmword_23F088A48;
  v4[1] = unk_23F088A58;
  if (!connection)
  {
    connection = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
    if (!connection) {
      return 5;
    }
  }
  size_t outputStructCnt = 32;
  uint64_t result = IOConnectCallStructMethod(connection, 0x105u, v4, 0x20uLL, v4, &outputStructCnt);
  if (!result) {
    *a1 = DWORD1(v4[0]);
  }
  return result;
}

CFPropertyListRef cfDictionaryCreateFromPlist(const char *a1)
{
  uint64_t v1 = fopen(a1, "rb");
  if (!v1) {
    return 0;
  }
  int v2 = v1;
  fseek(v1, 0, 2);
  unsigned int v3 = MEMORY[0x2455C3240](v2);
  fseek(v2, 0, 0);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  size_t v5 = v3;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v3);
  if (Mutable)
  {
    uint64_t v7 = Mutable;
    CFDataSetLength(Mutable, v5);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    if (fread(MutableBytePtr, v5, 1uLL, v2) == 1) {
      CFPropertyListRef v9 = CFPropertyListCreateWithData(v4, v7, 0, 0, 0);
    }
    else {
      CFPropertyListRef v9 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    CFPropertyListRef v9 = 0;
  }
  fclose(v2);
  return v9;
}

uint64_t perfCtrSamplerGetSourceInfo(char a1, uint64_t a2, mach_port_t connection)
{
  mach_port_t v3 = connection;
  outputStruct[0] = 2;
  outputStruct[1] = a2;
  BYTE4(outputStruct[0]) = a1;
  long long v7 = xmmword_23F088920;
  if (!connection)
  {
    mach_port_t v3 = *(_DWORD *)(sAGXGPURawCounterImpl + 88);
    if (!v3) {
      return 5;
    }
  }
  size_t outputStructCnt = 32;
  uint64_t result = IOConnectCallStructMethod(v3, 0x105u, outputStruct, 0x20uLL, outputStruct, &outputStructCnt);
  if (!result)
  {
    *(void *)(a2 + 32) = *(void *)((char *)&v7 + 4);
    *(_DWORD *)(a2 + 4(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v7);
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::chipDispatchTableForSource(AGXGPURawCounterImpl *this, unsigned int a2, unsigned int a3, char *__s1, const char *a5)
{
  int v8 = (int)this;
  uint64_t v22 = *MEMORY[0x263EF8340];
  {
    AGXGPURawCounterImpl::chipDispatchTableForSource(unsigned int,unsigned int,unsigned int,char const*)const::sourceToDispatchMapList[0] = xmmword_23F088930;
    dword_268C33600 = 999;
    qword_268C33608 = (uint64_t)"Firmware";
    dword_268C33610 = 8;
    qword_268C33618 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C33620 = xmmword_23F088940;
    dword_268C33630 = 999;
    qword_268C33638 = (uint64_t)"Firmware";
    dword_268C33640 = 8;
    qword_268C33648 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C33650 = xmmword_23F088950;
    dword_268C33660 = 999;
    qword_268C33668 = (uint64_t)"Firmware";
    dword_268C33670 = 8;
    qword_268C33678 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C33680 = xmmword_23F088950;
    dword_268C33690 = 999;
    qword_268C33698 = (uint64_t)"RDE";
    dword_268C336A0 = 3;
    qword_268C336A8 = (uint64_t)&AGXGRC_G11::sChipDispatchTable;
    xmmword_268C336B0 = xmmword_23F088960;
    dword_268C336C0 = 999;
    qword_268C336C8 = (uint64_t)"Firmware";
    dword_268C336D0 = 8;
    qword_268C336D8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C336E0 = xmmword_23F088960;
    dword_268C336F0 = 999;
    qword_268C336F8 = (uint64_t)"RDE";
    dword_268C33700 = 3;
    qword_268C33708 = (uint64_t)&AGXGRC_G12::sChipDispatchTable;
    xmmword_268C33710 = xmmword_23F088970;
    dword_268C33720 = 999;
    qword_268C33728 = (uint64_t)"Firmware";
    dword_268C33730 = 8;
    qword_268C33738 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C33740 = xmmword_23F088970;
    dword_268C33750 = 999;
    qword_268C33758 = (uint64_t)"RDE";
    dword_268C33760 = 3;
    qword_268C33768 = (uint64_t)&AGXGRC_G13::sChipDispatchTableTMB;
    xmmword_268C33770 = xmmword_23F088970;
    dword_268C33780 = 999;
    qword_268C33788 = (uint64_t)"BMPR_RDE";
    dword_268C33790 = 8;
    qword_268C33798 = (uint64_t)&AGXGRC_G13::sChipDispatchTableBMPR;
    xmmword_268C337A0 = xmmword_23F088980;
    dword_268C337B0 = 999;
    qword_268C337B8 = (uint64_t)"Firmware";
    dword_268C337C0 = 8;
    qword_268C337C8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C337D0 = xmmword_23F088980;
    dword_268C337E0 = 999;
    qword_268C337E8 = (uint64_t)"RDE";
    dword_268C337F0 = 3;
    qword_268C337F8 = (uint64_t)&AGXGRC_G14::sChipDispatchTable;
    xmmword_268C33800 = xmmword_23F088980;
    dword_268C33810 = 999;
    qword_268C33818 = (uint64_t)"BMPR_RDE";
    dword_268C33820 = 8;
    qword_268C33828 = (uint64_t)&AGXGRC_G14::sChipDispatchTable;
    xmmword_268C33830 = xmmword_23F088990;
    dword_268C33840 = 999;
    qword_268C33848 = (uint64_t)"Firmware";
    dword_268C33850 = 8;
    qword_268C33858 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C33860 = xmmword_23F088990;
    dword_268C33870 = 999;
    qword_268C33878 = (uint64_t)"RDE";
    dword_268C33880 = 3;
    qword_268C33888 = (uint64_t)&AGXGRC_G14X::sChipDispatchTableTMB;
    xmmword_268C33890 = xmmword_23F088990;
    dword_268C338A0 = 999;
    qword_268C338A8 = (uint64_t)"BMPR_RDE";
    dword_268C338B0 = 8;
    qword_268C338B8 = (uint64_t)&AGXGRC_G14X::sChipDispatchTableBMPR;
    xmmword_268C338C0 = xmmword_23F0889A0;
    dword_268C338D0 = 999;
    qword_268C338D8 = (uint64_t)"Firmware";
    dword_268C338E0 = 8;
    qword_268C338E8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C338F0 = xmmword_23F0889A0;
    dword_268C33900 = 5;
    qword_268C33908 = (uint64_t)"RDE";
    dword_268C33910 = 3;
    qword_268C33918 = (uint64_t)&AGXGRC_G14::sChipDispatchTable;
    xmmword_268C33920 = xmmword_23F0889B0;
    dword_268C33930 = 999;
    qword_268C33938 = (uint64_t)"RDE";
    dword_268C33940 = 3;
    qword_268C33948 = (uint64_t)&AGXGRC_G15::sChipDispatchTable;
    xmmword_268C33950 = xmmword_23F0889A0;
    dword_268C33960 = 999;
    qword_268C33968 = (uint64_t)"APS_USC";
    dword_268C33970 = 7;
    qword_268C33978 = (uint64_t)&AGXGRC_G15::sChipDispatchTableAPS;
    xmmword_268C33980 = xmmword_23F0889C0;
    dword_268C33990 = 6;
    qword_268C33998 = (uint64_t)"Firmware";
    dword_268C339A0 = 8;
    qword_268C339A8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C339B0 = xmmword_23F0889C0;
    dword_268C339C0 = 6;
    qword_268C339C8 = (uint64_t)"RDE";
    dword_268C339D0 = 3;
    qword_268C339D8 = (uint64_t)&AGXGRC_G16::sChipDispatchTable;
    xmmword_268C339E0 = xmmword_23F0889C0;
    dword_268C339F0 = 6;
    qword_268C339F8 = (uint64_t)"APS_USC";
    dword_268C33A00 = 7;
    qword_268C33A08 = (uint64_t)&AGXGRC_G16::sChipDispatchTableAPS;
    xmmword_268C33A10 = xmmword_23F0889D0;
    dword_268C33A20 = 999;
    qword_268C33A28 = (uint64_t)"Firmware";
    dword_268C33A30 = 8;
    qword_268C33A38 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C33A40 = xmmword_23F0889D0;
    dword_268C33A50 = 999;
    qword_268C33A58 = (uint64_t)"RDE";
    dword_268C33A60 = 3;
    qword_268C33A68 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTable;
    xmmword_268C33A70 = xmmword_23F0889D0;
    dword_268C33A80 = 999;
    qword_268C33A88 = (uint64_t)"APS_USC";
    dword_268C33A90 = 7;
    qword_268C33A98 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTableAPS;
    xmmword_268C33AA0 = xmmword_23F0889E0;
    dword_268C33AB0 = 6;
    qword_268C33AB8 = (uint64_t)"Firmware";
    dword_268C33AC0 = 8;
    qword_268C33AC8 = (uint64_t)&AGXGRC_G10::sChipDispatchTable;
    xmmword_268C33AD0 = xmmword_23F0889E0;
    dword_268C33AE0 = 6;
    qword_268C33AE8 = (uint64_t)"RDE";
    dword_268C33AF0 = 3;
    qword_268C33AF8 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTable;
    xmmword_268C33B00 = xmmword_23F0889E0;
    dword_268C33B10 = 6;
    qword_268C33B18 = (uint64_t)"APS_USC";
    dword_268C33B20 = 7;
    qword_268C33B28 = (uint64_t)&AGXGRC_HAL200::sChipDispatchTableAPS;
  }
  uint64_t v9 = 0;
  uint64_t v10 = &dword_268C33600;
  do
  {
    if (*(v10 - 4) == v8
      && *(v10 - 3) <= a2
      && *(v10 - 2) >= a2
      && *(v10 - 1) <= a3
      && *v10 >= a3
      && !strncmp(__s1, *((const char **)v10 + 1), v10[4]))
    {
      return *((void *)&AGXGPURawCounterImpl::chipDispatchTableForSource(unsigned int,unsigned int,unsigned int,char const*)const::sourceToDispatchMapList[3 * v9 + 2]
             + 1);
    }
    ++v9;
    v10 += 12;
  }
  while (v9 != 28);
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Fail to find dispatch table for gpuGen=%u sourceName=%s\n", "AGXGPURawCounterImpl.mm", 3422, "chipDispatchTableForSource", v8, __s1);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v13 = "AGXGPURawCounterImpl.mm";
    __int16 v14 = 1024;
    int v15 = 3422;
    __int16 v16 = 2080;
    char v17 = "chipDispatchTableForSource";
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2080;
    CFArrayRef v21 = __s1;
    _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to find dispatch table for gpuGen=%u sourceName=%s\n", buf, 0x2Cu);
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v13 = "AGXGPURawCounterImpl.mm";
    __int16 v14 = 1024;
    int v15 = 3422;
    __int16 v16 = 2080;
    char v17 = "chipDispatchTableForSource";
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2080;
    CFArrayRef v21 = __s1;
    _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Fail to find dispatch table for gpuGen=%u sourceName=%s\n", buf, 0x2Cu);
  }
  return 0;
}

void AGXGPURawCounterImpl::free(AGXGPURawCounterImpl *this)
{
  mach_port_t v2 = *((_DWORD *)this + 22);
  if (v2)
  {
    size_t outputStructCnt = 32;
    memset(v8, 0, sizeof(v8));
    if (IOConnectCallStructMethod(v2, 0x105u, v8, 0x20uLL, v8, &outputStructCnt))
    {
      memset((char *)v8 + 4, 0, 28);
      LODWORD(v8[0]) = 11;
      IOConnectCallStructMethod(v2, 0x105u, v8, outputStructCnt, v8, &outputStructCnt);
    }
  }
  free(*((void **)this + 83));
  *((void *)this + 83) = 0;
  free(*((void **)this + 16));
  *((void *)this + 16) = 0;
  unint64_t v3 = *((unsigned int *)this + 164);
  if (v3)
  {
    unint64_t v4 = 0;
    size_t v5 = (char *)this + 144;
    do
    {
      uint64_t v6 = *(void *)&v5[8 * v4];
      if (v6)
      {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
        *(void *)&v5[8 * v4] = 0;
        unint64_t v3 = *((unsigned int *)this + 164);
      }
      ++v4;
    }
    while (v4 < v3);
  }
  if (*((void *)this + 2))
  {
    IOGPUDeviceRelease();
    *((void *)this + 2) = 0;
  }
  long long v7 = (void *)*((void *)this + 14);
  *((void *)this + 14) = 0;

  *((_DWORD *)this + 22) = 0;
  *((_DWORD *)this + 2) = 0;
}

uint64_t ___ZN20AGXGPURawCounterImpl4initEj_block_invoke(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

size_t AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::drain(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this, int a2)
{
  size_t v2 = a2 & 0xFFFFF000;
  if ((a2 & 0xFFFFF000) != 0)
  {
    uint64_t v11 = 0;
    if ((*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *, char *, uint64_t *))(*(void *)this + 32))(this, (char *)&v11 + 4, &v11))
    {
      if (v2 >= v11) {
        size_t v2 = v11;
      }
      else {
        size_t v2 = v2;
      }
      unsigned int v4 = *((_DWORD *)this + 8);
      if (HIDWORD(v11) + (int)v2 <= v4)
      {
        long long v7 = (void *)(*((void *)this + 3) + HIDWORD(v11));
        size_t v8 = v2;
      }
      else
      {
        size_t v5 = v4 - HIDWORD(v11);
        size_t v6 = (v2 - v5);
        sys_dcache_flush((void *)(*((void *)this + 3) + HIDWORD(v11)), v5);
        long long v7 = (void *)*((void *)this + 3);
        size_t v8 = v6;
      }
      sys_dcache_flush(v7, v8);
      HIDWORD(v11) = (v2 + HIDWORD(v11) + *((_DWORD *)this + 8) - 4096) % *((_DWORD *)this + 8);
      uint64_t v9 = (_WORD *)*((void *)this + 5);
      v9[4] = HIDWORD(v11) >> 12;
      sys_dcache_flush(v9, 0x10uLL);
    }
    else
    {
      sys_dcache_flush(*((void **)this + 3), *((unsigned int *)this + 8));
      return 0;
    }
  }
  return v2;
}

BOOL AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::state(void **this, unsigned int *a2, unsigned int *a3)
{
  sys_dcache_flush(this[5], 0x10uLL);
  size_t v6 = this[5];
  unint64_t v7 = *((unsigned int *)this + 8);
  int v8 = *((unsigned __int8 *)v6 + 15);
  if (*((unsigned char *)v6 + 15))
  {
    v6[4] = ((v7 >> 12) + (unsigned __int16)v6[6] - 1) % (v7 >> 12);
    *((unsigned char *)v6 + 15) = 0;
    sys_dcache_flush(v6, 0x10uLL);
    unsigned int v9 = 0;
    *a2 = ((*((unsigned __int16 *)this[5] + 4) << 12) + 4096) % *((_DWORD *)this + 8);
  }
  else
  {
    unsigned int v10 = ((unsigned __int16)v6[6] << 12) % v7;
    unsigned int v11 = (((unsigned __int16)v6[4] << 12) + 4096) % v7;
    *a2 = v11;
    unsigned int v9 = (v10 - v11 + *((_DWORD *)this + 8)) % *((_DWORD *)this + 8);
  }
  BOOL result = v8 == 0;
  *a3 = v9;
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::size(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this)
{
  return *((unsigned int *)this + 8);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::base(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this)
{
  return *((void *)this + 3);
}

void AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl::~RingBufferAPSImpl(AGXGPURawCounterImpl::SourceAPSImpl::RingBufferAPSImpl *this)
{
  *(void *)this = &unk_26F2CA3F0;
  *((void *)this + 5) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  JUMPOUT(0x2455C3130);
}

{
  *(void *)this = &unk_26F2CA3F0;
  *((void *)this + 5) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::ringBufferInit(AGXGPURawCounterImpl::SourceAPSImpl *this, unint64_t a2, void *a3, uint64_t a4)
{
  int v4 = a4;
  uint64_t v5 = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *, uint64_t))(*(void *)this + 224))(this, a4);
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    operator new();
  }
  return v5;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::fillKernelConfigData(uint64_t result, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 16) & 0xFE | *(unsigned char *)(result + 6368);
  *(unsigned char *)(a2 + 16) = v2;
  char v3 = v2 & 0xFD | (2 * *(unsigned char *)(result + 6369));
  *(unsigned char *)(a2 + 16) = v3;
  char v4 = v3 & 0xFB | (4 * *(unsigned char *)(result + 6370));
  *(unsigned char *)(a2 + 16) = v4;
  *(unsigned char *)(a2 + 16) = v4 & 0xF7 | (8 * *(unsigned char *)(result + 6371));
  unsigned int v5 = *(_DWORD *)(result + 6372);
  unsigned int v6 = 32 - __clz(~(-1 << -(char)__clz(v5 - 1)));
  if (v5 >= 2) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(a2 + 18) = v7;
  unsigned int v8 = *(_DWORD *)(result + 6376);
  unsigned int v9 = 32 - __clz(~(-1 << -(char)__clz(v8 - 1)));
  if (v8 >= 2) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)(a2 + 17) = v10;
  unsigned int v11 = *(_DWORD *)(result + 6380);
  unsigned int v12 = 32 - __clz(~(-1 << -(char)__clz(v11 - 1)));
  if (v11 >= 2) {
    char v13 = v12;
  }
  else {
    char v13 = 0;
  }
  *(unsigned char *)(a2 + 19) = v13;
  *(_WORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = *(unsigned __int8 *)(result + 6384);
  *(_WORD *)(a2 + 22) = *(unsigned __int8 *)(result + 6388);
  *(unsigned char *)(a2 + 24) = *(_DWORD *)(result + 6392);
  *(unsigned char *)(a2 + 25) = *(unsigned char *)(result + 6396);
  *(unsigned char *)(a2 + 26) = *(unsigned char *)(result + 6397);
  return result;
}

BOOL AGXGPURawCounterImpl::SourceAPSImpl::postProcessData(AGXGPURawCounterImpl::SourceAPSImpl *this, unsigned int a2, const unsigned __int8 *a3, unint64_t a4, unint64_t *a5, unint64_t a6, unsigned __int8 *a7, unint64_t a8, unint64_t a9, unint64_t *a10, BOOL a11)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  unsigned int v11 = *((_DWORD *)this + 1572);
  if (v11 <= a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)!\n", "AGXGPURawCounterSourceAPSImpl.mm", 467, "postProcessData", a2, v11);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      int v32 = *((_DWORD *)this + 1572);
      *(_DWORD *)buf = 136316162;
      uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v53 = 1024;
      int v54 = 467;
      __int16 v55 = 2080;
      uint64_t v56 = "postProcessData";
      __int16 v57 = 1024;
      *(_DWORD *)__int16 v58 = a2;
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = v32;
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)!\n", buf, 0x28u);
    }
    BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    int v26 = *((_DWORD *)this + 1572);
    *(_DWORD *)buf = 136316162;
    uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
    __int16 v53 = 1024;
    int v54 = 467;
    __int16 v55 = 2080;
    uint64_t v56 = "postProcessData";
    __int16 v57 = 1024;
    *(_DWORD *)__int16 v58 = a2;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v26;
    uint64_t v22 = MEMORY[0x263EF8438];
    int8x16_t v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** Invalid ring buffer index (%u >= %u)!\n";
    uint32_t v27 = 40;
LABEL_25:
    _os_log_impl(&dword_23F075000, v22, OS_LOG_TYPE_INFO, v23, buf, v27);
    return 0;
  }
  if (!a3 || !a4 || !a5 || a6 >= a4 || !a7 || !a8 || a8 <= a9 || !a10)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** All parameters must be non-zero! (src=%p size=%llu read=0x%p write=%llu dst=0x%p size=%llu read=%llu write=%p\n", "AGXGPURawCounterSourceAPSImpl.mm", 474, "postProcessData", a3, a4, a5, a6, a7, a8, a9, a10);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136317698;
      uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v53 = 1024;
      int v54 = 474;
      __int16 v55 = 2080;
      uint64_t v56 = "postProcessData";
      __int16 v57 = 2048;
      *(void *)__int16 v58 = a3;
      *(_WORD *)&v58[8] = 2048;
      unint64_t v59 = a4;
      __int16 v60 = 2048;
      int v61 = a5;
      __int16 v62 = 2048;
      unint64_t v63 = a6;
      __int16 v64 = 2048;
      unsigned int v65 = a7;
      __int16 v66 = 2048;
      unint64_t v67 = a8;
      __int16 v68 = 2048;
      unint64_t v69 = a9;
      __int16 v70 = 2048;
      int8x8_t v71 = a10;
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** All parameters must be non-zero! (src=%p size=%llu read=0x%p write=%llu dst=0x%p size=%llu read=%llu write=%p\n", buf, 0x6Cu);
    }
    BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136317698;
    uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
    __int16 v53 = 1024;
    int v54 = 474;
    __int16 v55 = 2080;
    uint64_t v56 = "postProcessData";
    __int16 v57 = 2048;
    *(void *)__int16 v58 = a3;
    *(_WORD *)&v58[8] = 2048;
    unint64_t v59 = a4;
    __int16 v60 = 2048;
    int v61 = a5;
    __int16 v62 = 2048;
    unint64_t v63 = a6;
    __int16 v64 = 2048;
    unsigned int v65 = a7;
    __int16 v66 = 2048;
    unint64_t v67 = a8;
    __int16 v68 = 2048;
    unint64_t v69 = a9;
    __int16 v70 = 2048;
    int8x8_t v71 = a10;
    uint64_t v22 = MEMORY[0x263EF8438];
    int8x16_t v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** All parameters must be non-zero! (src=%p size=%llu read=0x%p write=%llu dst=0x%p s"
          "ize=%llu read=%llu write=%p\n";
    uint32_t v27 = 108;
    goto LABEL_25;
  }
  unint64_t v17 = *a5;
  unint64_t v18 = *a10;
  unint64_t v19 = a4 - *a5;
  if (a4 <= *a5 || (unint64_t v20 = a8 - v18, a8 <= v18))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** srcRead and/or dstWrite is out of bound! (*srcRead=%llu size=%llu *dstWrite=%llu size=%llu\n", "AGXGPURawCounterSourceAPSImpl.mm", 480, "postProcessData", v17, a4, *a10, a8);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      unint64_t v43 = *a5;
      CFStringRef v44 = (unint64_t *)*a10;
      *(_DWORD *)buf = 136316674;
      uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v53 = 1024;
      int v54 = 480;
      __int16 v55 = 2080;
      uint64_t v56 = "postProcessData";
      __int16 v57 = 2048;
      *(void *)__int16 v58 = v43;
      *(_WORD *)&v58[8] = 2048;
      unint64_t v59 = a4;
      __int16 v60 = 2048;
      int v61 = v44;
      __int16 v62 = 2048;
      unint64_t v63 = a8;
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** srcRead and/or dstWrite is out of bound! (*srcRead=%llu size=%llu *dstWrite=%llu size=%llu\n", buf, 0x44u);
    }
    BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    unint64_t v30 = *a5;
    unsigned int v31 = (unint64_t *)*a10;
    *(_DWORD *)buf = 136316674;
    uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
    __int16 v53 = 1024;
    int v54 = 480;
    __int16 v55 = 2080;
    uint64_t v56 = "postProcessData";
    __int16 v57 = 2048;
    *(void *)__int16 v58 = v30;
    *(_WORD *)&v58[8] = 2048;
    unint64_t v59 = a4;
    __int16 v60 = 2048;
    int v61 = v31;
    __int16 v62 = 2048;
    unint64_t v63 = a8;
    uint64_t v22 = MEMORY[0x263EF8438];
    int8x16_t v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** srcRead and/or dstWrite is out of bound! (*srcRead=%llu size=%llu *dstWrite=%llu size=%llu\n";
    uint32_t v27 = 68;
    goto LABEL_25;
  }
  if ((((a6 | a4) | v17) & 7) != 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** srcSize/Read/Write is not aligned to 64-bits!\n", "AGXGPURawCounterSourceAPSImpl.mm", 486, "postProcessData");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v53 = 1024;
      int v54 = 486;
      __int16 v55 = 2080;
      uint64_t v56 = "postProcessData";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** srcSize/Read/Write is not aligned to 64-bits!\n", buf, 0x1Cu);
    }
    BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v53 = 1024;
      int v54 = 486;
      __int16 v55 = 2080;
      uint64_t v56 = "postProcessData";
      uint64_t v22 = MEMORY[0x263EF8438];
      int8x16_t v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** srcSize/Read/Write is not aligned to 64-bits!\n";
LABEL_36:
      uint32_t v27 = 28;
      goto LABEL_25;
    }
  }
  else if ((((a9 | a8) | v18) & 7) != 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** dstSize/Read/Write is not aligned to 64-bits!\n", "AGXGPURawCounterSourceAPSImpl.mm", 492, "postProcessData");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v53 = 1024;
      int v54 = 492;
      __int16 v55 = 2080;
      uint64_t v56 = "postProcessData";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** dstSize/Read/Write is not aligned to 64-bits!\n", buf, 0x1Cu);
    }
    BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v52 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v53 = 1024;
      int v54 = 492;
      __int16 v55 = 2080;
      uint64_t v56 = "postProcessData";
      uint64_t v22 = MEMORY[0x263EF8438];
      int8x16_t v23 = "AGXGRC:AGXGRC:%s:%d:%s: *** dstSize/Read/Write is not aligned to 64-bits!\n";
      goto LABEL_36;
    }
  }
  else
  {
    if ((a6 + a4 - v17) % a4 >= (a8 - a9 + v18) / a8 * a8 - (v18 - a9) - 8) {
      unint64_t v33 = (a8 - a9 + v18) / a8 * a8 - (v18 - a9) - 8;
    }
    else {
      unint64_t v33 = (a6 + a4 - v17) % a4;
    }
    if (v33 + v17 <= a4)
    {
      CFNumberRef v39 = &a3[v17];
      unint64_t v35 = a8;
      if (v33 + v18 <= a8)
      {
        unsigned int v42 = &a7[v18];
        CFNumberRef v40 = &a3[v17];
        size_t v41 = v33;
      }
      else
      {
        memcpy(&a7[v18], v39, a8 - v18);
        CFNumberRef v40 = &v39[v20];
        size_t v41 = v33 - v20;
        unsigned int v42 = a7;
      }
      memcpy(v42, v40, v41);
      size_t v46 = v33;
    }
    else
    {
      CFIndex v34 = &a3[v17];
      unint64_t v35 = a8;
      CFDictionaryRef v36 = &a7[v18];
      if (v18 + v19 <= a8)
      {
        CFNumberRef v37 = &a3[v17];
        size_t v38 = a4 - *a5;
      }
      else
      {
        memcpy(v36, v34, a8 - v18);
        CFNumberRef v37 = &v34[v20];
        size_t v38 = v19 - v20;
        CFDictionaryRef v36 = a7;
      }
      memcpy(v36, v37, v38);
      unint64_t v45 = (*a10 + v19) % v35;
      *a10 = v45;
      size_t v46 = v33 - v19;
      if (v45 + v46 <= v35)
      {
        uint64_t v50 = &a7[v45];
        unint64_t v48 = a3;
        size_t v49 = v46;
      }
      else
      {
        unint64_t v47 = v35 - v45;
        memcpy(&a7[v45], a3, v35 - v45);
        unint64_t v48 = &a3[v47];
        size_t v49 = v46 - v47;
        uint64_t v50 = a7;
      }
      memcpy(v50, v48, v49);
    }
    *a10 = (*a10 + v46) % v35;
    *a5 = (*a5 + v33) % a4;
    return 1;
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::postProcessData(AGXGPURawCounterImpl::SourceAPSImpl *this, unsigned int a2, const unsigned __int8 *__src, size_t a4, unint64_t *a5, unsigned __int8 *__dst, size_t a7, unint64_t *a8, BOOL a9)
{
  uint64_t result = 0;
  if (__src && a5 && __dst && a7 && a8)
  {
    if (((a7 | a4) & 7) != 0)
    {
      return 0;
    }
    else
    {
      if (a4 >= a7) {
        size_t v12 = a7;
      }
      else {
        size_t v12 = a4;
      }
      memcpy(__dst, __src, v12);
      *a5 = v12;
      *a8 = v12;
      return 1;
    }
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::flushRingBuffers(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  v2[0] = xmmword_23F088A68;
  v2[1] = unk_23F088A78;
  uint64_t result = *(unsigned int *)(sAGXGPURawCounterImpl + 88);
  if (result)
  {
    size_t outputStructCnt = 32;
    return IOConnectCallStructMethod(result, 0x105u, v2, 0x20uLL, v2, &outputStructCnt);
  }
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::calcBufferSizeWithRingBufferSize(AGXGPURawCounterImpl::SourceAPSImpl *this, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    char v2 = *(uint64_t (**)(void))(*(void *)this + 152);
    return v2();
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterSourceAPSImpl.mm", 399, "calcBufferSizeWithRingBufferSize");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v5 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v6 = 1024;
      int v7 = 399;
      __int16 v8 = 2080;
      unsigned int v9 = "calcBufferSizeWithRingBufferSize";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v5 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v6 = 1024;
      int v7 = 399;
      __int16 v8 = 2080;
      unsigned int v9 = "calcBufferSizeWithRingBufferSize";
      _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** calcBufferSizeWithRingBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

unint64_t AGXGPURawCounterImpl::SourceAPSImpl::alignBufferSize(AGXGPURawCounterImpl::SourceAPSImpl *this, unint64_t a2, int a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *((void *)this + 1);
    unint64_t v4 = *(unsigned int *)(v3 + 108);
    unint64_t v5 = 0x800000000uLL / (v4 << 14) * (v4 << 14);
    if (v5 >= a2) {
      unint64_t v5 = a2;
    }
    uint64_t v6 = v5 / v4 + 0x3FFF;
    uint64_t v7 = v6 & 0x1FFFFFC000;
    if ((v6 & 0x1FFFFFC000uLL) >= 0xFFFC000) {
      uint64_t v7 = 268419072;
    }
    int v8 = *(_DWORD *)(v3 + 100);
    if ((v6 & 0x1FFFFFC000) == 0) {
      uint64_t v7 = 0x4000;
    }
    BOOL v9 = v4 == v8;
    uint64_t v10 = 0x8000;
    if (v9) {
      uint64_t v10 = 0x4000;
    }
    if (!a3) {
      uint64_t v10 = 0;
    }
    return v10 + v7 * v4;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", "AGXGPURawCounterSourceAPSImpl.mm", 365, "alignBufferSize");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      char v13 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v14 = 1024;
      int v15 = 365;
      __int16 v16 = 2080;
      unint64_t v17 = "alignBufferSize";
      _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      char v13 = "AGXGPURawCounterSourceAPSImpl.mm";
      __int16 v14 = 1024;
      int v15 = 365;
      __int16 v16 = 2080;
      unint64_t v17 = "alignBufferSize";
      _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** alignBufferSize should never be called with zero buffer size!\n", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::setBufferSize(AGXGPURawCounterImpl::SourceAPSImpl *this, unint64_t a2)
{
  unint64_t v2 = 0x268C33000uLL;
  {
    unint64_t v6 = a2;
    uint64_t v7 = this;
    unint64_t v2 = 0x268C33000uLL;
    int v5 = v4;
    a2 = v6;
    this = v7;
    if (v5)
    {
      AGXGPURawCounterImpl::SourceAPSImpl::setBufferSize(unsigned long long)::kRingBufferSizeMax = 0;
      unint64_t v2 = 0x268C33000;
      a2 = v6;
      this = v7;
    }
  }
  if (*(void *)(v2 + 2872) * (unint64_t)*(unsigned int *)(*((void *)this + 1) + 108) < a2) {
    a2 = *(void *)(v2 + 2872) * *(unsigned int *)(*((void *)this + 1) + 108);
  }
  return AGXGPURawCounterImpl::SourceImpl::setBufferSize(this, a2);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::availableFlags(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  uint64_t v1 = *((void *)this + 1);
  unsigned int v2 = *(_DWORD *)(v1 + 92);
  if (v2 == 17 && *(_DWORD *)(v1 + 104) > 7u) {
    return 24;
  }
  if (v2 <= 0x11) {
    return 8;
  }
  return 24;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::setOptions(AGXGPURawCounterImpl::SourceAPSImpl *this, NSDictionary *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = AGXGPURawCounterImpl::SourceImpl::setOptions(this, v3);
  if (v4
    && ((*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *))(*(void *)this + 112))(this) & 8) != 0)
  {
    int v5 = [(NSDictionary *)v3 objectForKeyedSubscript:@"SyncDrainMode"];
    unint64_t v6 = (char *)this + 6368;
    *((unsigned char *)this + 6368) = [v5 BOOLValue];

    uint64_t v7 = [(NSDictionary *)v3 objectForKeyedSubscript:@"SystemTimePeriod"];
    *((_DWORD *)this + 1595) = [v7 unsignedLongValue];

    if (((*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *))(*(void *)this + 112))(this) & 0x10) != 0)
    {
      int v8 = [(NSDictionary *)v3 objectForKeyedSubscript:@"CliqueAdvanceReason"];
      *((unsigned char *)this + 6371) = [v8 BOOLValue];
    }
    BOOL v9 = [(NSDictionary *)v3 objectForKeyedSubscript:@"CliqueSubSampling"];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"MinTraced"];
    *((_DWORD *)this + 1596) = [v10 unsignedLongValue];

    unsigned int v11 = [v9 objectForKeyedSubscript:@"TargetThreshold"];
    *((_DWORD *)this + 1597) = [v11 unsignedLongValue];

    size_t v12 = [(NSDictionary *)v3 objectForKeyedSubscript:@"ProfileControl"];
    char v13 = [v12 objectForKeyedSubscript:@"CliqueTraceLevel"];
    *((_DWORD *)this + 1598) = [v13 unsignedLongValue];

    __int16 v14 = [v12 objectForKeyedSubscript:@"EmitPos"];
    v6[28] = [v14 BOOLValue];

    int v15 = [v12 objectForKeyedSubscript:@"EmitThreadControlFlow"];
    v6[29] = [v15 BOOLValue];
  }
  return v4;
}

void sub_23F086E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::addTrigger(_DWORD *a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v5 = (char *)a1 + 6369;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a2 == 16) {
    goto LABEL_4;
  }
  if (a2 == 32)
  {
    int v8 = [v6 objectForKeyedSubscript:@"ESLInstTracing"];
    v5[1] = [v8 BOOLValue];

LABEL_4:
    BOOL v9 = [v7 objectForKeyedSubscript:@"TileTracing"];
    *int v5 = [v9 BOOLValue];

    uint64_t v10 = [v7 objectForKeyedSubscript:@"CountPeriod"];
    a1[1593] = [v10 unsignedLongValue];

    unsigned int v11 = [v7 objectForKeyedSubscript:@"PulsePeriod"];
    a1[1594] = [v11 unsignedLongValue];

    a1[1559] |= a2;
    uint64_t v12 = 1;
    goto LABEL_10;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", "AGXGPURawCounterSourceAPSImpl.mm", 279, "addTrigger", a2);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    int v15 = "AGXGPURawCounterSourceAPSImpl.mm";
    __int16 v16 = 1024;
    int v17 = 279;
    __int16 v18 = 2080;
    unint64_t v19 = "addTrigger";
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_error_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v15 = "AGXGPURawCounterSourceAPSImpl.mm";
    __int16 v16 = 1024;
    int v17 = 279;
    __int16 v18 = 2080;
    unint64_t v19 = "addTrigger";
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_impl(&dword_23F075000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, adding unknown trigger (0x%x)\n", buf, 0x22u);
  }
  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

void sub_23F087108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::clearTriggers(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  uint64_t result = (*(uint64_t (**)(AGXGPURawCounterImpl::SourceAPSImpl *, void))(*(void *)this + 40))(this, 0);
  *((_DWORD *)this + 1559) = 0;
  *(_WORD *)((char *)this + 6369) = 0;
  *(void *)((char *)this + 6372) = 0;
  return result;
}

uint64_t AGXGPURawCounterImpl::SourceAPSImpl::availableTriggers(AGXGPURawCounterImpl::SourceAPSImpl *this)
{
  return 48;
}

void AGXGPURawCounterImpl::SourceAPSImpl::~SourceAPSImpl(void **this)
{
  *this = &unk_26F2CA220;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
  JUMPOUT(0x2455C3130);
}

{
  *this = &unk_26F2CA220;
  free(this[2]);
  this[2] = 0;
  free(this[5]);
  this[5] = 0;
  (*((void (**)(void **))*this + 30))(this);
  free(this[781]);
  *(_OWORD *)(this + 781) = 0u;
  free(this[790]);
  this[790] = 0;
  *((_DWORD *)this + 1582) = 0;
  *((_OWORD *)this + 396) = 0u;
  *((_OWORD *)this + 397) = 0u;
}

BOOL AGXGRC_G10::HasMagicToken(unint64_t this)
{
  return HIWORD(this) == 65261;
}

uint64_t AGXGRC_G10::SampleHeaderSize(AGXGRC_G10 *this)
{
  return 32;
}

uint64_t AGXGRC_G10::ParseSampleHeader(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return 32;
}

void AGXGPURawCounterImpl::SourceImpl::create()
{
}

void sub_23F0873CC(_Unwind_Exception *a1)
{
  MEMORY[0x2455C3130](v1, 0x10F1C40199935B9);
  _Unwind_Resume(a1);
}

BOOL AGXGRC_G11::HasMagicToken(AGXGRC_G11 *this)
{
  return this == (AGXGRC_G11 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G11::SampleHeaderSize(AGXGRC_G11 *this)
{
  return 80;
}

uint64_t AGXGRC_G11::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFC004;
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v4 = a1[3];
  unint64_t v5 = *a3;
  if (v4 < *a3) {
    LODWORD(v5) = 0;
  }
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  unint64_t v6 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v7 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v6 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v7 & 0x7E00000000) != 0)
  {
    uint64_t v8 = v7 & 0x600000000;
    if ((v7 & 0x5400000000) != 0)
    {
      if (v8)
      {
        uint64_t v9 = v6 | 0xFFFFFFFF0001;
        *(void *)a2 = v9;
        unsigned int v10 = (v7 >> 4) & 1;
        unsigned int v11 = v10 | 4;
LABEL_24:
        uint64_t v15 = a1[v11];
        *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v15);
        *(void *)a2 = v9 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(void *)(a2 + 24) = v10;
        return 80;
      }
      if ((v7 & 0x1800000000) != 0)
      {
        uint64_t v9 = v6 | 0xFFFFFFFF4001;
        *(void *)a2 = v9;
        unsigned int v10 = (v7 >> 9) & 2;
        BOOL v13 = (v7 & 0x100) == 0;
LABEL_18:
        if (!v13) {
          unsigned int v10 = 1;
        }
        unsigned int v11 = v10 + 6;
        goto LABEL_24;
      }
      unsigned int v10 = 0;
      uint64_t v14 = 0xFFFFFFFF8001;
    }
    else
    {
      if (v8)
      {
        uint64_t v9 = v6 | 0xFFFFFFFF0002;
        *(void *)a2 = v9;
        unsigned int v10 = (v7 >> 5) & 1;
        unsigned int v11 = v10 | 4;
        goto LABEL_24;
      }
      if ((v7 & 0x1800000000) != 0)
      {
        uint64_t v9 = v6 | 0xFFFFFFFF4002;
        *(void *)a2 = v9;
        unsigned int v10 = (v7 >> 10) & 2;
        BOOL v13 = (v7 & 0x200) == 0;
        goto LABEL_18;
      }
      unsigned int v10 = 0;
      uint64_t v14 = 0xFFFFFFFF8002;
    }
    uint64_t v9 = v6 | v14;
    *(void *)a2 = v9;
    unsigned int v11 = 9;
    goto LABEL_24;
  }
  if ((v7 & 0x100000000) != 0)
  {
    if (v7) {
      uint64_t v3 = 0xFFFFFFFFC005;
    }
    *(void *)a2 = v6 | v3;
  }
  return 80;
}

uint64_t AGXGRC_G11::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

BOOL AGXGRC_G12::HasMagicToken(AGXGRC_G12 *this)
{
  return this == (AGXGRC_G12 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G12::SampleHeaderSize(AGXGRC_G12 *this)
{
  return 96;
}

uint64_t AGXGRC_G12::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v3 = a1[3];
  unint64_t v4 = *a3;
  if (v3 < *a3) {
    LODWORD(v4) = 0;
  }
  *(_DWORD *)(a2 + 16) = v3 - v4;
  *a3 = v3;
  unint64_t v5 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v6 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v5 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v6 & 0x7E00000000) != 0)
  {
    uint64_t v7 = v6 & 0x600000000;
    if ((v6 & 0x5400000000) != 0)
    {
      if (v7)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF0001;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 4) & 1;
        unsigned int v10 = v9 | 4;
LABEL_27:
        uint64_t v15 = a1[v10];
        *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v15);
        *(void *)a2 = v8 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(void *)(a2 + 24) = v9;
        return 96;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF4001;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 9) & 2;
        BOOL v12 = (v6 & 0x100) == 0;
LABEL_19:
        if (!v12) {
          unsigned int v9 = 1;
        }
        unsigned int v10 = v9 + 6;
        goto LABEL_27;
      }
      uint64_t v8 = v5 | 0xFFFFFFFF8001;
      *(void *)a2 = v8;
      unsigned int v9 = (v6 >> 18) & 2;
      BOOL v14 = (v6 & 0x20000) == 0;
    }
    else
    {
      if (v7)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF0002;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 5) & 1;
        unsigned int v10 = v9 | 4;
        goto LABEL_27;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF4002;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 10) & 2;
        BOOL v12 = (v6 & 0x200) == 0;
        goto LABEL_19;
      }
      uint64_t v8 = v5 | 0xFFFFFFFF8002;
      *(void *)a2 = v8;
      unsigned int v9 = (v6 >> 19) & 2;
      BOOL v14 = (v6 & 0x40000) == 0;
    }
    if (!v14) {
      unsigned int v9 = 1;
    }
    unsigned int v10 = v9 + 9;
    goto LABEL_27;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if (v6) {
      uint64_t v11 = v5 | 0xFFFFFFFFC005;
    }
    else {
      uint64_t v11 = v5 | 0xFFFFFFFFC004;
    }
    *(void *)a2 = v11;
  }
  return 96;
}

uint64_t AGXGRC_G12::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

BOOL AGXGRC_G13::HasMagicToken(AGXGRC_G13 *this)
{
  return this == (AGXGRC_G13 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G13::SampleHeaderSize(AGXGRC_G13 *this)
{
  return 96;
}

uint64_t AGXGRC_G13::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v3 = a1[3];
  unint64_t v4 = *a3;
  if (v3 < *a3) {
    LODWORD(v4) = 0;
  }
  *(_DWORD *)(a2 + 16) = v3 - v4;
  *a3 = v3;
  unint64_t v5 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v6 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v5 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v6 & 0x7E00000000) != 0)
  {
    uint64_t v7 = v6 & 0x600000000;
    if ((v6 & 0x5400000000) != 0)
    {
      if (v7)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF0001;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 4) & 1;
        unsigned int v10 = v9 | 4;
LABEL_27:
        uint64_t v15 = a1[v10];
        *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v15);
        *(void *)a2 = v8 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(void *)(a2 + 24) = v9;
        return 96;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF4001;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 9) & 2;
        BOOL v12 = (v6 & 0x100) == 0;
LABEL_19:
        if (!v12) {
          unsigned int v9 = 1;
        }
        unsigned int v10 = v9 + 6;
        goto LABEL_27;
      }
      uint64_t v8 = v5 | 0xFFFFFFFF8001;
      *(void *)a2 = v8;
      unsigned int v9 = (v6 >> 18) & 2;
      BOOL v14 = (v6 & 0x20000) == 0;
    }
    else
    {
      if (v7)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF0002;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 5) & 1;
        unsigned int v10 = v9 | 4;
        goto LABEL_27;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF4002;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 10) & 2;
        BOOL v12 = (v6 & 0x200) == 0;
        goto LABEL_19;
      }
      uint64_t v8 = v5 | 0xFFFFFFFF8002;
      *(void *)a2 = v8;
      unsigned int v9 = (v6 >> 19) & 2;
      BOOL v14 = (v6 & 0x40000) == 0;
    }
    if (!v14) {
      unsigned int v9 = 1;
    }
    unsigned int v10 = v9 + 9;
    goto LABEL_27;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if (v6) {
      uint64_t v11 = v5 | 0xFFFFFFFFC005;
    }
    else {
      uint64_t v11 = v5 | 0xFFFFFFFFC004;
    }
    *(void *)a2 = v11;
  }
  return 96;
}

uint64_t AGXGRC_G13::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

BOOL AGXGRC_G14::HasMagicToken(AGXGRC_G14 *this)
{
  return this == (AGXGRC_G14 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G14::SampleHeaderSize(AGXGRC_G14 *this)
{
  return 96;
}

uint64_t AGXGRC_G14::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v3 = a1[3];
  unint64_t v4 = *a3;
  if (v3 < *a3) {
    LODWORD(v4) = 0;
  }
  *(_DWORD *)(a2 + 16) = v3 - v4;
  *a3 = v3;
  unint64_t v5 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v6 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v5 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v6 & 0x7E00000000) != 0)
  {
    uint64_t v7 = v6 & 0x600000000;
    if ((v6 & 0x5400000000) != 0)
    {
      if (v7)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF0001;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 4) & 1;
        unsigned int v10 = v9 | 4;
LABEL_27:
        uint64_t v15 = a1[v10];
        *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v15);
        *(void *)a2 = v8 & 0xFFFF00000000FFFFLL | ((unint64_t)v15 << 16);
        *(void *)(a2 + 24) = v9;
        return 96;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF4001;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 9) & 2;
        BOOL v12 = (v6 & 0x100) == 0;
LABEL_19:
        if (!v12) {
          unsigned int v9 = 1;
        }
        unsigned int v10 = v9 + 6;
        goto LABEL_27;
      }
      uint64_t v8 = v5 | 0xFFFFFFFF8001;
      *(void *)a2 = v8;
      unsigned int v9 = (v6 >> 18) & 2;
      BOOL v14 = (v6 & 0x20000) == 0;
    }
    else
    {
      if (v7)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF0002;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 5) & 1;
        unsigned int v10 = v9 | 4;
        goto LABEL_27;
      }
      if ((v6 & 0x1800000000) != 0)
      {
        uint64_t v8 = v5 | 0xFFFFFFFF4002;
        *(void *)a2 = v8;
        unsigned int v9 = (v6 >> 10) & 2;
        BOOL v12 = (v6 & 0x200) == 0;
        goto LABEL_19;
      }
      uint64_t v8 = v5 | 0xFFFFFFFF8002;
      *(void *)a2 = v8;
      unsigned int v9 = (v6 >> 19) & 2;
      BOOL v14 = (v6 & 0x40000) == 0;
    }
    if (!v14) {
      unsigned int v9 = 1;
    }
    unsigned int v10 = v9 + 9;
    goto LABEL_27;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if (v6) {
      uint64_t v11 = v5 | 0xFFFFFFFFC005;
    }
    else {
      uint64_t v11 = v5 | 0xFFFFFFFFC004;
    }
    *(void *)a2 = v11;
  }
  return 96;
}

uint64_t AGXGRC_G14::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

BOOL AGXGRC_G14X::HasMagicTokenTMB(AGXGRC_G14X *this)
{
  return this == (AGXGRC_G14X *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G14X::SampleHeaderSize(AGXGRC_G14X *this)
{
  return 96;
}

uint64_t AGXGRC_G14X::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFC004;
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v4 = a1[3];
  unint64_t v5 = *a3;
  if (v4 < *a3) {
    LODWORD(v5) = 0;
  }
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  unint64_t v6 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v7 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v6 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    uint64_t v8 = WORD1(v7) & 0x3F;
    uint64_t v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      BOOL v12 = (v7 & 0x3000000000) == 0;
      uint64_t v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        int v11 = 9;
      }
      else
      {
        uint64_t v10 = 0xFFFFFFFF4001;
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0001;
      }
    }
    else
    {
      BOOL v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0) {
        uint64_t v10 = 0xFFFFFFFF4002;
      }
      else {
        uint64_t v10 = 0xFFFFFFFF8002;
      }
      if (v14) {
        int v11 = 9;
      }
      else {
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0002;
      }
    }
    if (v12) {
      int v15 = v11;
    }
    else {
      int v15 = 4;
    }
    unint64_t v16 = v6 | v10;
    *(void *)a2 = v16;
    uint64_t v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v17);
    *(void *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(void *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if (v7) {
        uint64_t v3 = 0xFFFFFFFFC005;
      }
      *(void *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_G14X::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

BOOL AGXGRC_G14X::HasMagicTokenBMPR(unint64_t this)
{
  return (this & 0x36F0FFFFF3FFFLL) == 0x14B0987650321;
}

uint64_t AGXGRC_G14X::SampleHeaderSizeInherited(AGXGRC_G14X *this)
{
  return 56;
}

uint64_t AGXGRC_G14X::ParseSampleHeaderInherited(void *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFC004;
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v4 = a1[3];
  unint64_t v5 = *a3;
  if (v4 < *a3) {
    LODWORD(v5) = 0;
  }
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  unint64_t v6 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  unint64_t v7 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v6 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    uint64_t v8 = (v7 >> 16) & 0x3F;
    uint64_t v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      BOOL v10 = (v7 & 0x3000000000) == 0;
      uint64_t v11 = 0xFFFFFFFF8001;
      if (!v10) {
        uint64_t v11 = 0xFFFFFFFF4001;
      }
      if (v9) {
        uint64_t v11 = 0xFFFFFFFF0001;
      }
    }
    else
    {
      if ((v7 & 0x3000000000) != 0) {
        uint64_t v11 = 0xFFFFFFFF4002;
      }
      else {
        uint64_t v11 = 0xFFFFFFFF8002;
      }
      if (v9) {
        uint64_t v11 = 0xFFFFFFFF0002;
      }
    }
    unint64_t v13 = v11 | v6;
    *(void *)a2 = v13;
    int v14 = (unsigned __int16)v11 >> 14;
    uint64_t v15 = 4;
    if (v14) {
      uint64_t v15 = 5;
    }
    BOOL v10 = v14 == 2;
    uint64_t v16 = 6;
    if (!v10) {
      uint64_t v16 = v15;
    }
    uint64_t v17 = a1[v16];
    *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v17);
    *(void *)a2 = v13 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(void *)(a2 + 24) = v8;
    return 56;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if (v7) {
        uint64_t v3 = 0xFFFFFFFFC005;
      }
      *(void *)a2 = v6 | v3;
    }
    return 56;
  }
}

BOOL AGXGRC_G15::HasMagicToken(AGXGRC_G15 *this)
{
  return this == (AGXGRC_G15 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G15::SampleHeaderSize(AGXGRC_G15 *this)
{
  return 96;
}

uint64_t AGXGRC_G15::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFC004;
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v4 = a1[3];
  unint64_t v5 = *a3;
  if (v4 < *a3) {
    LODWORD(v5) = 0;
  }
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  unint64_t v6 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v7 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v6 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    uint64_t v8 = WORD1(v7) & 0x3F;
    uint64_t v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      BOOL v12 = (v7 & 0x3000000000) == 0;
      uint64_t v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        int v11 = 9;
      }
      else
      {
        uint64_t v10 = 0xFFFFFFFF4001;
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0001;
      }
    }
    else
    {
      BOOL v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0) {
        uint64_t v10 = 0xFFFFFFFF4002;
      }
      else {
        uint64_t v10 = 0xFFFFFFFF8002;
      }
      if (v14) {
        int v11 = 9;
      }
      else {
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0002;
      }
    }
    if (v12) {
      int v15 = v11;
    }
    else {
      int v15 = 4;
    }
    unint64_t v16 = v6 | v10;
    *(void *)a2 = v16;
    uint64_t v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v17);
    *(void *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(void *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if (v7) {
        uint64_t v3 = 0xFFFFFFFFC005;
      }
      *(void *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_G15::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

void AGXGPURawCounterImpl::SourceAPSImpl::create()
{
}

void sub_23F088104(_Unwind_Exception *a1)
{
  MEMORY[0x2455C3130](v1, 0x10F1C408E495BD6);
  _Unwind_Resume(a1);
}

BOOL AGXGRC_G16::HasMagicToken(AGXGRC_G16 *this)
{
  return this == (AGXGRC_G16 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_G16::SampleHeaderSize(AGXGRC_G16 *this)
{
  return 96;
}

uint64_t AGXGRC_G16::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFC004;
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v4 = a1[3];
  unint64_t v5 = *a3;
  if (v4 < *a3) {
    LODWORD(v5) = 0;
  }
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  unint64_t v6 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v7 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v6 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    uint64_t v8 = WORD1(v7) & 0x3F;
    uint64_t v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      BOOL v12 = (v7 & 0x3000000000) == 0;
      uint64_t v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        int v11 = 9;
      }
      else
      {
        uint64_t v10 = 0xFFFFFFFF4001;
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0001;
      }
    }
    else
    {
      BOOL v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0) {
        uint64_t v10 = 0xFFFFFFFF4002;
      }
      else {
        uint64_t v10 = 0xFFFFFFFF8002;
      }
      if (v14) {
        int v11 = 9;
      }
      else {
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0002;
      }
    }
    if (v12) {
      int v15 = v11;
    }
    else {
      int v15 = 4;
    }
    unint64_t v16 = v6 | v10;
    *(void *)a2 = v16;
    uint64_t v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v17);
    *(void *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(void *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if (v7) {
        uint64_t v3 = 0xFFFFFFFFC005;
      }
      *(void *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_G16::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

BOOL AGXGRC_HAL200::HasMagicToken(AGXGRC_HAL200 *this)
{
  return this == (AGXGRC_HAL200 *)0xFEEDCBA987654321;
}

uint64_t AGXGRC_HAL200::SampleHeaderSize(AGXGRC_HAL200 *this)
{
  return 96;
}

uint64_t AGXGRC_HAL200::ParseSampleHeader(void *a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFC004;
  *(void *)a2 = *(void *)a2 & 0xFFFFFFFFC03FLL | 0xFEED000000000000;
  *(void *)(a2 + 8) = AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset + a1[2];
  unint64_t v4 = a1[3];
  unint64_t v5 = *a3;
  if (v4 < *a3) {
    LODWORD(v5) = 0;
  }
  *(_DWORD *)(a2 + 16) = v4 - v5;
  *a3 = v4;
  unint64_t v6 = *(void *)a2 & 0xFFFFFFFFFFFF3FF0;
  uint64_t v7 = a1[1];
  *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = -1;
  *(void *)a2 = v6 | 0xFFFFFFFFC000;
  *(void *)(a2 + 24) = 0;
  if ((v7 & 0x3F00000000) != 0)
  {
    uint64_t v8 = WORD1(v7) & 0x3F;
    uint64_t v9 = v7 & 0xC00000000;
    if ((v7 & 0x1500000000) != 0)
    {
      BOOL v12 = (v7 & 0x3000000000) == 0;
      uint64_t v10 = 0xFFFFFFFF8001;
      if (v12)
      {
        int v11 = 9;
      }
      else
      {
        uint64_t v10 = 0xFFFFFFFF4001;
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0001;
      }
    }
    else
    {
      BOOL v14 = (v7 & 0x3000000000) == 0;
      if ((v7 & 0x3000000000) != 0) {
        uint64_t v10 = 0xFFFFFFFF4002;
      }
      else {
        uint64_t v10 = 0xFFFFFFFF8002;
      }
      if (v14) {
        int v11 = 9;
      }
      else {
        int v11 = 6;
      }
      BOOL v12 = v9 == 0;
      if (v9) {
        uint64_t v10 = 0xFFFFFFFF0002;
      }
    }
    if (v12) {
      int v15 = v11;
    }
    else {
      int v15 = 4;
    }
    unint64_t v16 = v6 | v10;
    *(void *)a2 = v16;
    uint64_t v17 = a1[(v15 + v8)];
    *(_DWORD *)(a2 + 2(*(void (**)(AGXGPURawCounterImpl::SourceImpl *, void))(*(void *)this + 40))(this, 0) = HIDWORD(v17);
    *(void *)a2 = v16 & 0xFFFF00000000FFF3 | ((unint64_t)v17 << 16);
    *(void *)(a2 + 24) = v8;
    return 96;
  }
  else
  {
    if ((v7 & 0x401) != 0)
    {
      if (v7) {
        uint64_t v3 = 0xFFFFFFFFC005;
      }
      *(void *)a2 = v6 | v3;
    }
    return 96;
  }
}

uint64_t AGXGRC_HAL200::ResetSampleHeaderParser(uint64_t this)
{
  AGXPerfCtrRDESampleHeaderParser::fAbsTimeOffset = this;
  return this;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOGPUDeviceCreate()
{
  return MEMORY[0x270F3D328]();
}

uint64_t IOGPUDeviceGetConnect()
{
  return MEMORY[0x270F3D338]();
}

uint64_t IOGPUDeviceGetName()
{
  return MEMORY[0x270F3D340]();
}

uint64_t IOGPUDeviceRelease()
{
  return MEMORY[0x270F3D350]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
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

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x270ED87A0](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
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

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

void sys_dcache_flush(void *start, size_t len)
{
}