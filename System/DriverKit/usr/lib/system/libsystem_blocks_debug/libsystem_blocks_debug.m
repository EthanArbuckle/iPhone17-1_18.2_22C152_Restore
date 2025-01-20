void _Block_use_RR2(const Block_callbacks_RR *callbacks)
{
  void (__cdecl *release)(const void *);

  release = callbacks->release;
  _Block_retain_object[0] = (uint64_t (*)(const void *))callbacks->retain;
  _Block_release_object[0] = (uint64_t (*)(const void *))release;
  _Block_destructInstance = (uint64_t (*)(const void *))callbacks->destructInstance;
}

uint64_t _call_custom_copy_helper(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 8) & 0x2000000) != 0)
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a2 + 24) + 16);
    if (v2) {
      return v2();
    }
  }
  return result;
}

uint64_t _call_custom_dispose_helper(uint64_t result)
{
  if ((*(_DWORD *)(result + 8) & 0x2000000) != 0)
  {
    v1 = *(uint64_t (**)(void))(*(void *)(result + 24) + 24);
    if (v1) {
      return v1();
    }
  }
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  if (!aBlock) {
    return 0;
  }
  if ((*((_DWORD *)aBlock + 2) & 0x1000000) != 0)
  {
    do
    {
      int v3 = *((_DWORD *)aBlock + 2);
      if ((~v3 & 0xFFFE) == 0) {
        break;
      }
      int v4 = *((_DWORD *)aBlock + 2);
      atomic_compare_exchange_strong((atomic_uint *volatile)((char *)aBlock + 8), (unsigned int *)&v4, v3 + 2);
    }
    while (v4 != v3);
    return (void *)aBlock;
  }
  if ((*((_DWORD *)aBlock + 2) & 0x10000000) != 0) {
    return (void *)aBlock;
  }
  v2 = (void *)malloc_type_malloc();
  if (v2)
  {
    if (!*((void *)aBlock + 2)) {
      _Block_copy_cold_1();
    }
    _platform_memmove();
    v2[2] = *((void *)aBlock + 2);
    *((_DWORD *)v2 + 2) &= 0xFFFF0000;
    *((_DWORD *)v2 + 2) |= 0x1000002u;
    _call_custom_copy_helper((uint64_t)v2, (uint64_t)aBlock);
    void *v2 = _NSConcreteMallocBlock;
  }
  return v2;
}

size_t Block_size(void *aBlock)
{
  return *(void *)(*((void *)aBlock + 3) + 8);
}

void _Block_release(const void *aBlock)
{
  if (aBlock && (*((_DWORD *)aBlock + 2) & 0x10000000) == 0 && (*((_DWORD *)aBlock + 2) & 0x1000000) != 0)
  {
    while (1)
    {
      int v2 = *((_DWORD *)aBlock + 2);
      if ((v2 & 0xFFFE) == 0 || (*((_DWORD *)aBlock + 2) & 0xFFFE) == 65534) {
        break;
      }
      if ((unsigned __int16)*((_DWORD *)aBlock + 2) == 2) {
        int v4 = -1;
      }
      else {
        int v4 = -2;
      }
      int v5 = *((_DWORD *)aBlock + 2);
      atomic_compare_exchange_strong((atomic_uint *volatile)((char *)aBlock + 8), (unsigned int *)&v5, v4 + v2);
      if (v5 == v2)
      {
        if ((unsigned __int16)v2 == 2)
        {
          _call_custom_dispose_helper((uint64_t)aBlock);
          _Block_destructInstance(aBlock);
          free((void *)aBlock);
        }
        return;
      }
    }
  }
}

BOOL _Block_tryRetain(const void *aBlock)
{
  while (1)
  {
    int v1 = *((_DWORD *)aBlock + 2);
    BOOL v2 = (v1 & 1) == 0;
    if (~v1 & 0xFFFE) == 0 || (v1) {
      break;
    }
    int v4 = *((_DWORD *)aBlock + 2);
    atomic_compare_exchange_strong((atomic_uint *volatile)((char *)aBlock + 8), (unsigned int *)&v4, v1 + 2);
    if (v4 == v1) {
      return 1;
    }
  }
  return v2;
}

BOOL _Block_isDeallocating(const void *aBlock)
{
  return *((_DWORD *)aBlock + 2) & 1;
}

BOOL _Block_use_stret(void *aBlock)
{
  return (~*((_DWORD *)aBlock + 2) & 0x60000000) == 0;
}

BOOL _Block_has_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  return *(void *)(*((void *)aBlock + 3) + v2) != 0;
}

const char *__cdecl _Block_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2);
}

const char *__cdecl _Block_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) != 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
}

const char *__cdecl _Block_extended_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) == 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  if (*(void *)(*((void *)aBlock + 3) + v2 + 8)) {
    return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
  }
  else {
    return "";
  }
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  int v3 = a2;
  unsigned int v5 = a3 & 0x9F;
  if (v5 > 0x17)
  {
    if (v5 - 131 > 0x14 || ((1 << (v5 + 125)) & 0x110011) == 0)
    {
      if (v5 != 24) {
        return;
      }
      goto LABEL_12;
    }
LABEL_25:
    *(void *)a1 = v3;
    return;
  }
  switch(v5)
  {
    case 3u:
      _Block_retain_object[0](a2);
      goto LABEL_25;
    case 7u:
      int v3 = _Block_copy(a2);
      goto LABEL_25;
    case 8u:
LABEL_12:
      uint64_t v7 = *((void *)a2 + 1);
      if ((*(_DWORD *)(v7 + 16) & 0xFFFE) != 0)
      {
        if ((*(_DWORD *)(v7 + 16) & 0x1000000) != 0)
        {
          do
          {
            int v8 = *(_DWORD *)(v7 + 16);
            if ((~v8 & 0xFFFE) == 0) {
              break;
            }
            int v9 = *(_DWORD *)(v7 + 16);
            atomic_compare_exchange_strong((atomic_uint *volatile)(v7 + 16), (unsigned int *)&v9, v8 + 2);
          }
          while (v9 != v8);
        }
      }
      else
      {
        uint64_t v10 = malloc_type_malloc();
        *(void *)uint64_t v10 = 0;
        *(_DWORD *)(v10 + 16) = v3[4] | 0x1000004;
        *(void *)(v10 + 8) = v10;
        *((void *)v3 + 1) = v10;
        *(_DWORD *)(v10 + 20) = v3[5];
        if ((v3[4] & 0x2000000) != 0)
        {
          *(void *)(v10 + 24) = *((void *)v3 + 3);
          *(void *)(v10 + 32) = *((void *)v3 + 4);
          if (v3[4] >> 28 == 1) {
            *(void *)(v10 + 40) = *((void *)v3 + 5);
          }
          (*((void (**)(void))v3 + 3))();
        }
        else
        {
          _platform_memmove();
        }
      }
      int v3 = (_DWORD *)*((void *)v3 + 1);
      goto LABEL_25;
  }
}

void _Block_object_dispose(const void *a1, const int a2)
{
  unsigned int v2 = a2 & 0x9F;
  if (v2 > 7)
  {
    if (v2 == 24 || v2 == 8)
    {
      uint64_t v4 = *((void *)a1 + 1);
      if ((*(_DWORD *)(v4 + 16) & 0x1000000) != 0)
      {
        if ((*(_DWORD *)(v4 + 16) & 0xFFFE) == 0) {
          _Block_object_dispose_cold_1();
        }
        while (1)
        {
          int v6 = *(_DWORD *)(v4 + 16);
          if ((v6 & 0xFFFE) == 0 || (*(_DWORD *)(v4 + 16) & 0xFFFE) == 65534) {
            break;
          }
          if ((unsigned __int16)*(_DWORD *)(v4 + 16) == 2) {
            int v8 = -1;
          }
          else {
            int v8 = -2;
          }
          int v9 = *(_DWORD *)(v4 + 16);
          atomic_compare_exchange_strong((atomic_uint *volatile)(v4 + 16), (unsigned int *)&v9, v8 + v6);
          if (v9 == v6)
          {
            if ((unsigned __int16)v6 == 2)
            {
              if ((*(_DWORD *)(v4 + 16) & 0x2000000) != 0) {
                (*(void (**)(uint64_t))(v4 + 32))(v4);
              }
              free((void *)v4);
            }
            return;
          }
        }
      }
    }
  }
  else if (v2 == 3)
  {
    unsigned int v5 = _Block_release_object[0];
    v5(a1);
  }
  else if (v2 == 7)
  {
    _Block_release(a1);
  }
}

void _Block_object_dispose_cold_1()
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _platform_memmove()
{
  return __platform_memmove();
}

void free(void *a1)
{
}

uint64_t malloc_type_malloc()
{
  return _malloc_type_malloc();
}