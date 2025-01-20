uint64_t BTAdvertiseMgr::BluetoothAvailabilityChanged(BTAdvertiseMgr *this, char a2)
{
  uint64_t result;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  BOOL v8;
  char *v9;
  char *v10;

  result = BTTaskMgr::BluetoothAvailabilityChanged((uint64_t)this, a2);
  v4 = (char *)*((void *)this + 3);
  v5 = (char *)this + 32;
  if (*((unsigned char *)this + 16))
  {
    if (v4 != (char *)this + 32)
    {
      do
      {
        result = BTAdvertiseMgr::_Advertise((uint64_t)this);
        v6 = (char *)*((void *)v4 + 1);
        if (v6)
        {
          do
          {
            v7 = v6;
            v6 = *(char **)v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            v7 = (char *)*((void *)v4 + 2);
            v8 = *(void *)v7 == (void)v4;
            v4 = v7;
          }
          while (!v8);
        }
        v4 = v7;
      }
      while (v7 != v5);
    }
  }
  else if (v4 != (char *)this + 32)
  {
    do
    {
      result = BTLocalDeviceRemoveData();
      v9 = (char *)*((void *)v4 + 1);
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = *(char **)v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (char *)*((void *)v4 + 2);
          v8 = *(void *)v10 == (void)v4;
          v4 = v10;
        }
        while (!v8);
      }
      v4 = v10;
    }
    while (v10 != v5);
  }
  return result;
}

uint64_t BTAdvertiseMgr::_Advertise(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 16)) {
    return 0;
  }
  if (!BTLocalDeviceAdvertiseData())
  {
    if (BTLocalDeviceGetDiscoverable()
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_9B64();
    }
    if (BTLocalDeviceSetDiscoverable()
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_9AF4();
    }
    if (BTLocalDeviceSetConnectable()
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_9A84();
    }
    return 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_9BD4();
  }
  return 1;
}

uint64_t BTAdvertiseMgr::Advertise(uint64_t a1, char **a2, char **a3)
{
  *(_OWORD *)__p = 0u;
  long long v9 = 0u;
  *(_OWORD *)v7 = 0u;
  sub_1A7C((uint64_t)v7, a2, a3);
  if (*(_DWORD *)sub_17F4((uint64_t **)(a1 + 24), (unsigned __int8 **)v7))
  {
    v4 = sub_17F4((uint64_t **)(a1 + 24), (unsigned __int8 **)v7);
    uint64_t v5 = 0;
    ++*(_DWORD *)v4;
  }
  else
  {
    *(_DWORD *)sub_17F4((uint64_t **)(a1 + 24), (unsigned __int8 **)v7) = 1;
    uint64_t v5 = BTAdvertiseMgr::_Advertise(a1);
  }
  if (__p[1])
  {
    *(void **)&long long v9 = __p[1];
    operator delete(__p[1]);
  }
  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }
  return v5;
}

void sub_17DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_17F4(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v9 = 0;
  v4 = (uint64_t **)sub_1C50((uint64_t)a1, &v9, a2);
  uint64_t v5 = *v4;
  if (!*v4)
  {
    v6 = v4;
    memset(v8, 0, sizeof(v8));
    sub_1CF0((uint64_t)a1, (char **)a2, v8);
    sub_1D84(a1, v9, v6, v8[0]);
    uint64_t v5 = v8[0];
  }
  return v5 + 10;
}

uint64_t sub_1878(uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_18BC(void *a1)
{
}

uint64_t BTAdvertiseMgr::StopAdvertising(uint64_t a1, char **a2, char **a3)
{
  *(_OWORD *)__p = 0u;
  long long v9 = 0u;
  *(_OWORD *)v7 = 0u;
  sub_1A7C((uint64_t)v7, a2, a3);
  if (!*(_DWORD *)sub_17F4((uint64_t **)(a1 + 24), (unsigned __int8 **)v7)) {
    goto LABEL_3;
  }
  v4 = sub_17F4((uint64_t **)(a1 + 24), (unsigned __int8 **)v7);
  --*(_DWORD *)v4;
  if (*(_DWORD *)sub_17F4((uint64_t **)(a1 + 24), (unsigned __int8 **)v7)) {
    goto LABEL_3;
  }
  sub_2164((uint64_t **)(a1 + 24), (unsigned __int8 **)v7);
  if (!*(unsigned char *)(a1 + 16)) {
    goto LABEL_3;
  }
  if (BTLocalDeviceRemoveData())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_9C44();
    }
    uint64_t v5 = 1;
    goto LABEL_4;
  }
  if (*(void *)(a1 + 40))
  {
LABEL_3:
    uint64_t v5 = 0;
    goto LABEL_4;
  }
  if (BTLocalDeviceSetConnectable() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_9A84();
  }
  uint64_t v5 = BTLocalDeviceSetDiscoverable();
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_9AF4();
    }
    goto LABEL_3;
  }
LABEL_4:
  if (__p[1])
  {
    *(void **)&long long v9 = __p[1];
    operator delete(__p[1]);
  }
  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }
  return v5;
}

void sub_1A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1A7C(uint64_t a1, char **a2, char **a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  sub_1AF0((char *)a1, *a2, a2[1], a2[1] - *a2);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  sub_1AF0((char *)(a1 + 24), *a3, a3[1], a3[1] - *a3);
  return a1;
}

void sub_1AD4(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1AF0(char *result, char *a2, char *a3, size_t __sz)
{
  if (__sz)
  {
    v6 = result;
    result = sub_1B64(result, __sz);
    v7 = (unsigned char *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      char v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_1B48(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1B64(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_1BA8();
  }
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_1BA8()
{
}

void sub_1BC0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1C1C(exception, a1);
}

void sub_1C08(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1C1C(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_1C50(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        char v8 = (void *)v4;
        long long v9 = (unsigned __int8 **)(v4 + 32);
        if (!sub_1DDC(v7, a3, (unsigned __int8 **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_1DDC(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    char v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t sub_1CF0@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0;
  a3[2] = 0;
  a3[1] = 0;
  v6 = a3 + 1;
  uint64_t v7 = operator new(0x58uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_WORD *)a3 + 8) = 0;
  uint64_t result = sub_1EA8((uint64_t)(v7 + 8), a2);
  *((_WORD *)a3 + 8) = 257;
  v7[20] = 0;
  return result;
}

void sub_1D68(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_20B4(v2, v3);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D84(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_1F1C(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t sub_1DDC(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  v3 = *a3;
  uint64_t v4 = a3[1];
  v6 = *a2;
  uint64_t v5 = a2[1];
  if (*a3 != v4)
  {
    uint64_t v7 = v3 + 1;
    char v8 = *a2;
    while (v8 != v5)
    {
      unsigned int v9 = *v8;
      unsigned int v10 = *(v7 - 1);
      if (v9 < v10) {
        break;
      }
      ++v8;
      if (v10 < v9 || v7++ == v4) {
        goto LABEL_10;
      }
    }
    return 1;
  }
LABEL_10:
  if (v6 != v5)
  {
    v12 = v6 + 1;
    while (v3 != v4)
    {
      unsigned int v13 = *v3;
      unsigned int v14 = *(v12 - 1);
      if (v13 < v14) {
        break;
      }
      ++v3;
      if (v14 < v13 || v12++ == v5) {
        goto LABEL_19;
      }
    }
    return 0;
  }
LABEL_19:
  v17 = a3[3];
  v16 = a3[4];
  if (v17 == v16) {
    return 0;
  }
  v18 = a2[3];
  v19 = v17 + 1;
  while (v18 != a2[4])
  {
    unsigned int v20 = *v18;
    unsigned int v21 = *(v19 - 1);
    if (v20 < v21) {
      break;
    }
    ++v18;
    if (v21 < v20 || v19++ == v16) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_1EA8(uint64_t a1, char **a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  sub_1AF0((char *)a1, *a2, a2[1], a2[1] - *a2);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  sub_1AF0((char *)(a1 + 24), a2[3], a2[4], a2[4] - a2[3]);
  return a1;
}

void sub_1F00(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1F1C(uint64_t *result, uint64_t *a2)
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
      v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unsigned int v9 = (uint64_t **)a2[2];
          }
          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unsigned int v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
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
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_20B4(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    sub_210C((uint64_t)__p + 32);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void sub_210C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

uint64_t sub_2164(uint64_t **a1, unsigned __int8 **a2)
{
  v3 = (uint64_t *)sub_21C0((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3) {
    return 0;
  }
  uint64_t v4 = v3;
  sub_2250(a1, v3);
  sub_210C((uint64_t)(v4 + 4));
  operator delete(v4);
  return 1;
}

uint64_t sub_21C0(uint64_t a1, unsigned __int8 **a2)
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
    int v7 = sub_1DDC(v5, (unsigned __int8 **)(v3 + 32), a2);
    int v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      int v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || sub_1DDC(v5, a2, (unsigned __int8 **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

uint64_t *sub_2250(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_22C4(v6, a2);
  return v3;
}

uint64_t *sub_22C4(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
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
  uint64_t v6 = (uint64_t **)v3[2];
  int v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      int v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      int v7 = v6[1];
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
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      int v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
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
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    int v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
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
    int v7 = *(uint64_t **)v12;
  }
  v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  unsigned int v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
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
    unsigned int v20 = v7;
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
    *unsigned int v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
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

void sub_2648(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t BTBrowseMgr::BluetoothAvailabilityChanged(BTBrowseMgr *this, char a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  BTTaskMgr::BluetoothAvailabilityChanged((uint64_t)this, a2);
  if (*((unsigned char *)this + 16))
  {
    if (*((void *)this + 13) || *((void *)this + 16))
    {
      long long v23 = *(_OWORD *)off_C358;
      if (BTDiscoveryAgentCreate())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_9DE0();
        }
        *((void *)this + 20) = 0;
      }
      int v5 = (BTBrowseMgr *)*((void *)this + 11);
      if (v5 != (BTBrowseMgr *)((char *)this + 96))
      {
        do
        {
          int v6 = BTDiscoveryAgentAddKey();
          if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_9D94(buf, v6, &v30);
          }
          int v7 = (BTBrowseMgr *)*((void *)v5 + 1);
          if (v7)
          {
            do
            {
              int v8 = v7;
              int v7 = *(BTBrowseMgr **)v7;
            }
            while (v7);
          }
          else
          {
            do
            {
              int v8 = (BTBrowseMgr *)*((void *)v5 + 2);
              BOOL v9 = *(void *)v8 == (void)v5;
              int v5 = v8;
            }
            while (!v9);
          }
          int v5 = v8;
        }
        while (v8 != (BTBrowseMgr *)((char *)this + 96));
      }
      uint64_t v10 = (BTBrowseMgr *)*((void *)this + 14);
      if (v10 != (BTBrowseMgr *)((char *)this + 120))
      {
        do
        {
          int v11 = BTDiscoveryAgentAddKey();
          if (v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_9D94(v27, v11, v28);
          }
          uint64_t v12 = (BTBrowseMgr *)*((void *)v10 + 1);
          if (v12)
          {
            do
            {
              uint64_t v13 = v12;
              uint64_t v12 = *(BTBrowseMgr **)v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              uint64_t v13 = (BTBrowseMgr *)*((void *)v10 + 2);
              BOOL v9 = *(void *)v13 == (void)v10;
              uint64_t v10 = v13;
            }
            while (!v9);
          }
          uint64_t v10 = v13;
        }
        while (v13 != (BTBrowseMgr *)((char *)this + 120));
      }
      BTBrowseMgr::_StartBrowsing((uint64_t)this, 0);
    }
  }
  else
  {
    uint64_t v14 = *((void *)this + 20);
    *((_DWORD *)this + 42) = 0;
    if (v14)
    {
      if (BTDiscoveryAgentStopScan()
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_9D24();
      }
      if (BTDiscoveryAgentDestroy() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_9CB4();
      }
      *((void *)this + 20) = 0;
    }
    v15 = (BTBrowseMgr *)*((void *)this + 17);
    if (v15 != (BTBrowseMgr *)((char *)this + 144))
    {
      do
      {
        v16 = (char **)*((void *)v15 + 5);
        if (v16 != (char **)((char *)v15 + 48))
        {
          do
          {
            *(_OWORD *)__p = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            *(_OWORD *)v24 = 0u;
            sub_4E88((uint64_t)&v23, 1, 0, *((void *)v15 + 4), v16 + 4, v16 + 7);
            BTD2DPlugin::_QueueServiceEvent(*((void *)this + 1), (uint64_t)&v23);
            if (__p[1])
            {
              *(void **)&long long v26 = __p[1];
              operator delete(__p[1]);
            }
            if (v24[0])
            {
              v24[1] = v24[0];
              operator delete(v24[0]);
            }
            v17 = v16[1];
            if (v17)
            {
              do
              {
                uint64_t v18 = (char **)v17;
                v17 = *(char **)v17;
              }
              while (v17);
            }
            else
            {
              do
              {
                uint64_t v18 = (char **)v16[2];
                BOOL v9 = *v18 == (char *)v16;
                v16 = v18;
              }
              while (!v9);
            }
            v16 = v18;
          }
          while (v18 != (char **)((char *)v15 + 48));
        }
        v19 = (BTBrowseMgr *)*((void *)v15 + 1);
        unsigned int v20 = v15;
        if (v19)
        {
          do
          {
            BOOL v21 = v19;
            v19 = *(BTBrowseMgr **)v19;
          }
          while (v19);
        }
        else
        {
          do
          {
            BOOL v21 = (BTBrowseMgr *)*((void *)v20 + 2);
            BOOL v9 = *(void *)v21 == (void)v20;
            unsigned int v20 = v21;
          }
          while (!v9);
        }
        sub_55F4((uint64_t **)this + 17, (uint64_t)v15);
        v15 = v21;
      }
      while (v21 != (BTBrowseMgr *)((char *)this + 144));
    }
  }
  return pthread_mutex_unlock(v4);
}

void sub_29FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _btDiscoveryStatusEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return BTBrowseMgr::_RespondToStatusEvent(a5, a2);
}

uint64_t _btDiscoveryDiscoveryEventCallback(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  return BTBrowseMgr::_ReportDiscoveryEvent(a5, a2, a3);
}

uint64_t BTBrowseMgr::_StartBrowsing(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v4 = (void *)(a1 + 160);
    if (!*(void *)(a1 + 160))
    {
      *(_OWORD *)__p = *(_OWORD *)off_C358;
      if (BTDiscoveryAgentCreate())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_9DE0();
        }
        void *v4 = 0;
      }
    }
    if (a2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        sub_3414(a2);
        int v5 = v9 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 136315138;
        int v11 = v5;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Adding new key to browse: %s\n", buf, 0xCu);
        if (v9 < 0) {
          operator delete(__p[0]);
        }
      }
      if (BTDiscoveryAgentAddKey())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_9EC0();
        }
        return 1;
      }
    }
    int v6 = *(_DWORD *)(a1 + 168);
    if (v6 == 3)
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 168) = 2;
      return result;
    }
    if (!v6)
    {
      *(_DWORD *)(a1 + 168) = 1;
      if (BTDiscoveryAgentStartScanForAdvertizedData())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_9E50();
        }
        *(_DWORD *)(a1 + 168) = 0;
        return 1;
      }
    }
  }
  return 0;
}

void *sub_2C1C(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t BTBrowseMgr::Browse(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v14 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  uint64_t v4 = sub_2EBC((uint64_t **)(a1 + 88), a2);
  ++*(_DWORD *)v4;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t started = BTBrowseMgr::_StartBrowsing(a1, a2);
    if (started)
    {
      sub_57F0((uint64_t **)(a1 + 88), a2);
      pthread_mutex_unlock(v14);
      return 1;
    }
    int v7 = *(uint64_t ***)(a1 + 136);
    if (v7 != (uint64_t **)(a1 + 144))
    {
      do
      {
        v20[0] = 0;
        v20[1] = 0;
        v19 = v20;
        BTBrowseMgr::_GetServiceInstancesOfType(started, (uint64_t)v7[4], a2);
        int v8 = v19;
        if (v19 != v20)
        {
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Browse found value matching key on known device!\n", buf, 2u);
            }
            sub_59C8(v7 + 5, (unsigned __int8 **)v8 + 4, (char **)v8 + 4);
            *(_OWORD *)__p = 0u;
            long long v18 = 0u;
            *(_OWORD *)buf = 0u;
            *(_OWORD *)v16 = 0u;
            sub_4E88((uint64_t)buf, 0, 0, (uint64_t)v7[4], (char **)v8 + 4, (char **)v8 + 7);
            BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
            if (__p[1])
            {
              *(void **)&long long v18 = __p[1];
              operator delete(__p[1]);
            }
            if (v16[0])
            {
              v16[1] = v16[0];
              operator delete(v16[0]);
            }
            char v9 = v8[1];
            if (v9)
            {
              do
              {
                uint64_t v10 = (void **)v9;
                char v9 = (void *)*v9;
              }
              while (v9);
            }
            else
            {
              do
              {
                uint64_t v10 = (void **)v8[2];
                BOOL v11 = *v10 == v8;
                int v8 = v10;
              }
              while (!v11);
            }
            int v8 = v10;
          }
          while (v10 != v20);
        }
        sub_5960((uint64_t)&v19, v20[0]);
        uint64_t v12 = v7[1];
        if (v12)
        {
          do
          {
            uint64_t v13 = (uint64_t **)v12;
            uint64_t v12 = (uint64_t *)*v12;
          }
          while (v12);
        }
        else
        {
          do
          {
            uint64_t v13 = (uint64_t **)v7[2];
            BOOL v11 = *v13 == (uint64_t *)v7;
            int v7 = v13;
          }
          while (!v11);
        }
        int v7 = v13;
      }
      while (v13 != (uint64_t **)(a1 + 144));
    }
  }
  pthread_mutex_unlock(v14);
  return 0;
}

void sub_2E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,void *a21)
{
}

uint64_t *sub_2EBC(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v9 = 0;
  uint64_t v4 = (uint64_t **)sub_5634((uint64_t)a1, &v9, a2);
  int v5 = *v4;
  if (!*v4)
  {
    int v6 = v4;
    memset(v8, 0, sizeof(v8));
    sub_56F4((uint64_t)a1, (char **)a2, v8);
    sub_1D84(a1, v9, v6, v8[0]);
    int v5 = v8[0];
  }
  return v5 + 7;
}

void BTBrowseMgr::_GetServiceInstancesOfType(uint64_t a1, uint64_t a2, void *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    sub_3414(a3);
    uint64_t v4 = v7 >= 0 ? __p : (void **)__p[0];
    int buf = 136315138;
    *(void *)buf_4 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "_GetServiceInstancesOfType - %s\n", (uint8_t *)&buf, 0xCu);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
  int v5 = BTDeviceMatchesAdvertisedKey();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p[0]) = 67109120;
    HIDWORD(__p[0]) = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "BTDeviceMatchesAdvertisedKey says no match! Result was %d\n", (uint8_t *)__p, 8u);
  }
}

void sub_33C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_3414(void *a1)
{
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  sub_4F24((uint64_t)v8);
  uint64_t v2 = *(void *)&v8[0];
  uint64_t v3 = (char *)v8 + *(void *)(*(void *)&v8[0] - 24);
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v8 + *(void *)(*(void *)&v8[0] - 24)));
    uint64_t v4 = std::locale::use_facet(&v10, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 32);
    std::locale::~locale(&v10);
    uint64_t v2 = *(void *)&v8[0];
  }
  *((_DWORD *)v3 + 36) = 48;
  *(void *)((char *)&v8[1] + *(void *)(v2 - 24) + 8) = 2;
  *(_DWORD *)((char *)v8 + *(void *)(v2 - 24) + 8) = 16392;
  if (a1[1] != *a1)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = std::ostream::operator<<();
      sub_51F4(v6);
      ++v5;
    }
    while (v5 < a1[1] - *a1);
  }
  std::stringbuf::str();
  return sub_50C0((uint64_t)v8);
}

void sub_35B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  sub_50C0((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t BTBrowseMgr::_RespondToStatusEvent(uint64_t a1, int a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if (a2 == 1)
  {
    int v5 = *(_DWORD *)(a1 + 168);
    *(_DWORD *)(a1 + 168) = 0;
    if (v5 == 2)
    {
      BTBrowseMgr::_StartBrowsing(a1, 0);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Nothing left to browse for - scan stopped\n", v9, 2u);
      }
      BTDiscoveryAgentDestroy();
      *(void *)(a1 + 160) = 0;
      char v7 = *(void **)(a1 + 144);
      uint64_t v6 = (void *)(a1 + 144);
      sub_5B3C((uint64_t)(v6 - 1), v7);
      *(v6 - 1) = v6;
      void *v6 = 0;
      v6[1] = 0;
    }
  }
  else if (!a2 && *(_DWORD *)(a1 + 168) == 1)
  {
    *(_DWORD *)(a1 + 168) = 2;
  }
  return pthread_mutex_unlock(v4);
}

uint64_t BTBrowseMgr::_StopBrowsing(BTBrowseMgr *this)
{
  if (*((void *)this + 13) || *((void *)this + 16)) {
    return 0;
  }
  int v2 = *((_DWORD *)this + 42);
  if (v2 == 1)
  {
    int v3 = 0;
  }
  else
  {
    if (v2 != 2) {
      goto LABEL_10;
    }
    int v3 = 3;
  }
  *((_DWORD *)this + 42) = v3;
LABEL_10:
  uint64_t result = BTDiscoveryAgentStopScan();
  if (result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_9D24();
    }
    return 1;
  }
  return result;
}

uint64_t BTBrowseMgr::StopBrowsing(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  int v5 = (void *)(a1 + 88);
  uint64_t v6 = sub_5838(a1 + 88, a2);
  if ((void *)(a1 + 96) == v6)
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "StopBrowsing: couldn't find key! Dumping browse list...\n", (uint8_t *)__p, 2u);
    }
    std::locale v10 = (void *)*v5;
    if ((void *)*v5 != v9)
    {
      do
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          sub_3414(v10 + 4);
          BOOL v11 = v18 >= 0 ? __p : (void **)__p[0];
          uint64_t v12 = *((unsigned int *)v10 + 14);
          *(_DWORD *)int buf = 136315394;
          unsigned int v20 = v11;
          __int16 v21 = 2048;
          uint64_t v22 = v12;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Key - %s - count: %lu\n", buf, 0x16u);
          if (v18 < 0) {
            operator delete(__p[0]);
          }
        }
        uint64_t v13 = (void *)v10[1];
        if (v13)
        {
          do
          {
            uint64_t v14 = v13;
            uint64_t v13 = (void *)*v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            uint64_t v14 = (void *)v10[2];
            BOOL v15 = *v14 == (void)v10;
            std::locale v10 = v14;
          }
          while (!v15);
        }
        std::locale v10 = v14;
      }
      while (v14 != v9);
    }
  }
  else
  {
    char v7 = sub_2EBC((uint64_t **)(a1 + 88), a2);
    --*(_DWORD *)v7;
    if (!*(_DWORD *)sub_2EBC((uint64_t **)(a1 + 88), a2))
    {
      sub_57F0((uint64_t **)(a1 + 88), a2);
      if ((void *)(a1 + 120) == sub_5838(a1 + 112, a2))
      {
        if (*(unsigned char *)(a1 + 16))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            sub_3414(a2);
            int v8 = v18 >= 0 ? __p : (void **)__p[0];
            *(_DWORD *)int buf = 136315138;
            unsigned int v20 = v8;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removing key from browse: %s\n", buf, 0xCu);
            if (v18 < 0) {
              operator delete(__p[0]);
            }
          }
          if (BTDiscoveryAgentRemoveKey()
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_A04C();
          }
          BTBrowseMgr::_StopBrowsing((BTBrowseMgr *)a1);
        }
      }
    }
  }
  pthread_mutex_unlock(v4);
  return 0;
}

uint64_t BTBrowseMgr::StartResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if ((void *)(a1 + 120) == sub_5838(a1 + 112, a2))
  {
    v18[0] = 0;
    long long v17 = (unint64_t)&v17 + 8;
    char v7 = sub_3D14((uint64_t **)(a1 + 112), a2);
    if (v7 != (uint64_t *)&v17) {
      sub_5D18((uint64_t **)v7, (char **)v17, (char **)&v17 + 1);
    }
    sub_5B9C((uint64_t)&v17, *((void **)&v17 + 1));
  }
  int v8 = sub_3D14((uint64_t **)(a1 + 112), a2);
  sub_6234((uint64_t **)v8, a3, (char **)a3);
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t started = BTBrowseMgr::_StartBrowsing(a1, a2);
    if (started)
    {
      std::locale v10 = sub_3D14((uint64_t **)(a1 + 112), a2);
      sub_57F0((uint64_t **)v10, a3);
    }
    else
    {
      uint64_t v12 = *(uint64_t ***)(a1 + 136);
      if (v12 != (uint64_t **)(a1 + 144))
      {
        do
        {
          v25[0] = 0;
          v25[1] = 0;
          v24 = v25;
          BTBrowseMgr::_GetServiceInstancesOfType(started, (uint64_t)v12[4], a2);
          *(_OWORD *)uint64_t v22 = 0u;
          long long v23 = 0u;
          *(_OWORD *)__int16 v21 = 0u;
          sub_1A7C((uint64_t)v21, (char **)a2, (char **)a3);
          uint64_t v13 = sub_21C0((uint64_t)&v24, (unsigned __int8 **)v21);
          if (v25 != (void **)v13)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              LOWORD(v17) = 0;
              _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Resolve found matching key/value on known device!\n", (uint8_t *)&v17, 2u);
            }
            sub_59C8(v12 + 5, (unsigned __int8 **)v21, (char **)v21);
            *(_OWORD *)__p = 0u;
            long long v20 = 0u;
            long long v17 = 0u;
            *(_OWORD *)char v18 = 0u;
            sub_4E88((uint64_t)&v17, 2, 0, (uint64_t)v12[4], (char **)(v13 + 32), (char **)(v13 + 56));
            BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)&v17);
            if (__p[1])
            {
              *(void **)&long long v20 = __p[1];
              operator delete(__p[1]);
            }
            if (v18[0])
            {
              v18[1] = v18[0];
              operator delete(v18[0]);
            }
          }
          if (v22[1])
          {
            *(void **)&long long v23 = v22[1];
            operator delete(v22[1]);
          }
          if (v21[0])
          {
            v21[1] = v21[0];
            operator delete(v21[0]);
          }
          sub_5960((uint64_t)&v24, v25[0]);
          if (v25 != (void **)v13) {
            break;
          }
          uint64_t v14 = v12[1];
          if (v14)
          {
            do
            {
              BOOL v15 = (uint64_t **)v14;
              uint64_t v14 = (uint64_t *)*v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              BOOL v15 = (uint64_t **)v12[2];
              BOOL v16 = *v15 == (uint64_t *)v12;
              uint64_t v12 = v15;
            }
            while (!v16);
          }
          uint64_t v12 = v15;
        }
        while (v15 != (uint64_t **)(a1 + 144));
      }
    }
  }
  return pthread_mutex_unlock(v6);
}

void sub_3CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

uint64_t *sub_3D14(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v9 = 0;
  uint64_t v4 = (uint64_t **)sub_5634((uint64_t)a1, &v9, a2);
  int v5 = *v4;
  if (!*v4)
  {
    uint64_t v6 = v4;
    memset(v8, 0, sizeof(v8));
    sub_5C00((uint64_t)a1, (char **)a2, v8);
    sub_1D84(a1, v9, v6, v8[0]);
    int v5 = v8[0];
  }
  return v5 + 7;
}

uint64_t BTBrowseMgr::StopResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  char v7 = (uint64_t ***)(a1 + 112);
  int v8 = (uint64_t **)sub_5838(a1 + 112, a2);
  uint64_t v9 = v8;
  if ((uint64_t **)(a1 + 120) == v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "StopResolving: couldn't find key! Dumping resolving list...\n", (uint8_t *)__p, 2u);
    }
    uint64_t v12 = *v7;
    if (*v7 != v9)
    {
      do
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          sub_3414(v12 + 4);
          uint64_t v13 = v19 >= 0 ? __p : (void **)__p[0];
          *(_DWORD *)int buf = 136315138;
          __int16 v21 = v13;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Key: %s\n", buf, 0xCu);
          if (v19 < 0) {
            operator delete(__p[0]);
          }
        }
        uint64_t v14 = v12[1];
        if (v14)
        {
          do
          {
            BOOL v15 = (uint64_t **)v14;
            uint64_t v14 = (uint64_t *)*v14;
          }
          while (v14);
        }
        else
        {
          do
          {
            BOOL v15 = (uint64_t **)v12[2];
            BOOL v16 = *v15 == (uint64_t *)v12;
            uint64_t v12 = v15;
          }
          while (!v16);
        }
        uint64_t v12 = v15;
      }
      while (v15 != v9);
    }
  }
  else
  {
    std::locale v10 = sub_5838((uint64_t)(v8 + 7), a3);
    if (v9 + 8 != (uint64_t **)v10)
    {
      sub_58B8(v9 + 7, v10);
      if (!v9[9])
      {
        sub_2250((uint64_t **)(a1 + 112), (uint64_t *)v9);
        sub_62C0((uint64_t)(v9 + 4));
        operator delete(v9);
        if ((void *)(a1 + 96) == sub_5838(a1 + 88, a2))
        {
          if (*(unsigned char *)(a1 + 16))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              sub_3414(a2);
              BOOL v11 = v19 >= 0 ? __p : (void **)__p[0];
              *(_DWORD *)int buf = 136315138;
              __int16 v21 = v11;
              _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removing key from browse: %s\n", buf, 0xCu);
              if (v19 < 0) {
                operator delete(__p[0]);
              }
            }
            if (BTDiscoveryAgentRemoveKey()
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              sub_A04C();
            }
            BTBrowseMgr::_StopBrowsing((BTBrowseMgr *)a1);
          }
        }
      }
    }
  }
  return pthread_mutex_unlock(v6);
}

uint64_t BTBrowseMgr::_ResolvingServiceForDevice(BTBrowseMgr *this, unint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  int v5 = (void *)*((void *)this + 18);
  if (!v5) {
    goto LABEL_21;
  }
  uint64_t v6 = (void *)((char *)this + 144);
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = v5;
    }
    int v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 == (void *)((char *)this + 144)
    || v6[4] > a2
    || (std::locale v10 = (unsigned __int8 **)v6[5], v11 = (unsigned __int8 **)(v6 + 6), v10 == v6 + 6))
  {
LABEL_21:
    uint64_t v16 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v12 = sub_5838((uint64_t)this + 112, v10 + 4);
      if ((void *)((char *)this + 120) != v12 && v12 + 8 != sub_5838((uint64_t)(v12 + 7), v10 + 7)) {
        break;
      }
      uint64_t v13 = v10[1];
      if (v13)
      {
        do
        {
          uint64_t v14 = (unsigned __int8 **)v13;
          uint64_t v13 = *(unsigned __int8 **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          uint64_t v14 = (unsigned __int8 **)v10[2];
          BOOL v15 = *v14 == (unsigned __int8 *)v10;
          std::locale v10 = v14;
        }
        while (!v15);
      }
      std::locale v10 = v14;
      if (v14 == v11) {
        goto LABEL_21;
      }
    }
    uint64_t v16 = 1;
  }
  pthread_mutex_unlock(v4);
  return v16;
}

void sub_4198(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      sub_1BA8();
    }
    int v5 = (char *)a1[1];
    uint64_t v6 = operator new(__sz);
    unint64_t v7 = &v5[(void)v6 - v2];
    BOOL v8 = v7;
    if (v5 != (char *)v2)
    {
      uint64_t v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }
      while (v5 != (char *)v2);
      BOOL v8 = v6;
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

uint64_t BTBrowseMgr::_ReportDiscoveryEvent(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if ((a2 & 0xFFFFFFFD) != 0)
  {
    if (a2 == 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "_ReportDiscoveryEvent: lost event\n", buf, 2u);
      }
      unint64_t v7 = *(void **)(a1 + 144);
      if (v7)
      {
        uint64_t v8 = a1 + 144;
        do
        {
          unint64_t v9 = v7[4];
          BOOL v10 = v9 >= a3;
          if (v9 >= a3) {
            BOOL v11 = v7;
          }
          else {
            BOOL v11 = v7 + 1;
          }
          if (v10) {
            uint64_t v8 = (uint64_t)v7;
          }
          unint64_t v7 = (void *)*v11;
        }
        while (*v11);
        if (v8 != a1 + 144 && *(void *)(v8 + 32) <= a3)
        {
          uint64_t v12 = *(char ***)(v8 + 40);
          if (v12 != (char **)(v8 + 48))
          {
            do
            {
              *(_OWORD *)__p = 0u;
              long long v78 = 0u;
              *(_OWORD *)int buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_4E88((uint64_t)buf, 1, 0, *(void *)(v8 + 32), v12 + 4, v12 + 7);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&long long v78 = __p[1];
                operator delete(__p[1]);
              }
              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }
              uint64_t v13 = v12[1];
              if (v13)
              {
                do
                {
                  uint64_t v14 = (char **)v13;
                  uint64_t v13 = *(char **)v13;
                }
                while (v13);
              }
              else
              {
                do
                {
                  uint64_t v14 = (char **)v12[2];
                  BOOL v15 = *v14 == (char *)v12;
                  uint64_t v12 = v14;
                }
                while (!v15);
              }
              uint64_t v12 = v14;
            }
            while (v14 != (char **)(v8 + 48));
          }
          sub_55F4((uint64_t **)(a1 + 136), v8);
        }
      }
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v16)
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "_ReportDiscoveryEvent: found/changed event\n", buf, 2u);
    }
    v72 = v6;
    v83 = 0;
    uint64_t v84 = 0;
    v82 = &v83;
    long long v17 = *(void **)(a1 + 88);
    uint64_t v73 = a1;
    if (v17 != (void *)(a1 + 96))
    {
      do
      {
        BTBrowseMgr::_GetServiceInstancesOfType(v16, a3, v17 + 4);
        char v18 = (void *)v17[1];
        if (v18)
        {
          do
          {
            char v19 = v18;
            char v18 = (void *)*v18;
          }
          while (v18);
        }
        else
        {
          do
          {
            char v19 = (void *)v17[2];
            BOOL v15 = *v19 == (void)v17;
            long long v17 = v19;
          }
          while (!v15);
        }
        long long v17 = v19;
      }
      while (v19 != (void *)(a1 + 96));
      if (v84)
      {
        uint64_t v21 = a1 + 144;
        long long v20 = *(void **)(a1 + 144);
        if (!v20) {
          goto LABEL_49;
        }
        uint64_t v22 = a1 + 144;
        do
        {
          unint64_t v23 = v20[4];
          BOOL v24 = v23 >= a3;
          if (v23 >= a3) {
            uint64_t v25 = v20;
          }
          else {
            uint64_t v25 = v20 + 1;
          }
          if (v24) {
            uint64_t v22 = (uint64_t)v20;
          }
          long long v20 = (void *)*v25;
        }
        while (*v25);
        if (v22 == v21 || *(void *)(v22 + 32) > a3) {
LABEL_49:
        }
          uint64_t v22 = a1 + 144;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "new service list for _browsed_ types:\n", buf, 2u);
        }
        long long v26 = v82;
        if (v82 != &v83)
        {
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              sub_3414(v26 + 4);
              int v27 = SHIBYTE(v76[0]);
              v28 = *(uint8_t **)buf;
              sub_3414(v26 + 7);
              v29 = buf;
              if (v27 < 0) {
                v29 = v28;
              }
              int v30 = &v79;
              if (v81 < 0) {
                int v30 = v79;
              }
              *(_DWORD *)v91 = 136315394;
              *(void *)&v91[4] = v29;
              *(_WORD *)&v91[12] = 2080;
              *(void *)&v91[14] = v30;
              _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "   Key: %s Value: %s\n", v91, 0x16u);
              if (SHIBYTE(v81) < 0) {
                operator delete(v79);
              }
              if (SHIBYTE(v76[0]) < 0) {
                operator delete(*(void **)buf);
              }
            }
            v31 = v26[1];
            if (v31)
            {
              do
              {
                v32 = (char **)v31;
                v31 = *(char **)v31;
              }
              while (v31);
            }
            else
            {
              do
              {
                v32 = (char **)v26[2];
                BOOL v15 = *v32 == (char *)v26;
                long long v26 = v32;
              }
              while (!v15);
            }
            long long v26 = v32;
          }
          while (v32 != &v83);
        }
        v33 = (uint64_t **)(a1 + 136);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "\nold service list for _browsed_ types:\n", buf, 2u);
        }
        if (v22 == v21)
        {
          v48 = v82;
          if (v82 != &v83)
          {
            do
            {
              *(_OWORD *)__p = 0u;
              long long v78 = 0u;
              *(_OWORD *)int buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_4E88((uint64_t)buf, 0, 0, a3, v48 + 4, v48 + 7);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&long long v78 = __p[1];
                operator delete(__p[1]);
              }
              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }
              v49 = v48[1];
              if (v49)
              {
                do
                {
                  v50 = (char **)v49;
                  v49 = *(char **)v49;
                }
                while (v49);
              }
              else
              {
                do
                {
                  v50 = (char **)v48[2];
                  BOOL v15 = *v50 == (char *)v48;
                  v48 = v50;
                }
                while (!v15);
              }
              v48 = v50;
            }
            while (v50 != &v83);
          }
        }
        else
        {
          v34 = *(void **)(v22 + 40);
          if (v34 != (void *)(v22 + 48))
          {
            do
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                sub_3414(v34 + 4);
                int v35 = SHIBYTE(v76[0]);
                v36 = *(uint8_t **)buf;
                sub_3414(v34 + 7);
                if (v35 >= 0) {
                  v37 = buf;
                }
                else {
                  v37 = v36;
                }
                if (v81 >= 0) {
                  v38 = &v79;
                }
                else {
                  v38 = v79;
                }
                *(_DWORD *)v91 = 136315394;
                *(void *)&v91[4] = v37;
                *(_WORD *)&v91[12] = 2080;
                *(void *)&v91[14] = v38;
                _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "   Key: %s Value: %s\n", v91, 0x16u);
                if (SHIBYTE(v81) < 0) {
                  operator delete(v79);
                }
                if (SHIBYTE(v76[0]) < 0) {
                  operator delete(*(void **)buf);
                }
              }
              v39 = (void *)v34[1];
              if (v39)
              {
                do
                {
                  v40 = v39;
                  v39 = (void *)*v39;
                }
                while (v39);
              }
              else
              {
                do
                {
                  v40 = (void *)v34[2];
                  BOOL v15 = *v40 == (void)v34;
                  v34 = v40;
                }
                while (!v15);
              }
              v34 = v40;
            }
            while (v40 != (void *)(v22 + 48));
          }
          v80 = 0;
          uint64_t v81 = 0;
          v79 = &v80;
          v86[0] = *(unsigned __int8 ***)(v22 + 40);
          v89 = v82;
          v90 = (unsigned __int8 **)(v22 + 48);
          v88 = &v83;
          *(void *)v91 = &v79;
          *(void *)&v91[8] = &v80;
          sub_6314(v86, &v90, (unsigned __int8 ***)&v89, (unsigned __int8 ***)&v88, (uint64_t *)v91, (uint64_t)&v87, (uint64_t)buf);
          v41 = (char **)v79;
          if (v79 != &v80)
          {
            do
            {
              *(_OWORD *)__p = 0u;
              long long v78 = 0u;
              *(_OWORD *)int buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_4E88((uint64_t)buf, 1, 0, a3, v41 + 4, v41 + 7);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&long long v78 = __p[1];
                operator delete(__p[1]);
              }
              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }
              v42 = v41[1];
              if (v42)
              {
                do
                {
                  v43 = (char **)v42;
                  v42 = *(char **)v42;
                }
                while (v42);
              }
              else
              {
                do
                {
                  v43 = (char **)v41[2];
                  BOOL v15 = *v43 == (char *)v41;
                  v41 = v43;
                }
                while (!v15);
              }
              v41 = v43;
            }
            while (v43 != (char **)&v80);
          }
          *(void *)&v91[8] = 0;
          *(void *)&v91[16] = 0;
          v44 = *(unsigned __int8 ***)(v22 + 40);
          v90 = (unsigned __int8 **)v82;
          *(void *)v91 = &v91[8];
          v88 = (char **)v44;
          v89 = &v83;
          v86[1] = (unsigned __int8 **)&v91[8];
          v87 = (unsigned __int8 **)(v22 + 48);
          v86[0] = (unsigned __int8 **)v91;
          sub_6314(&v90, (unsigned __int8 ***)&v89, (unsigned __int8 ***)&v88, &v87, (uint64_t *)v86, (uint64_t)&v85, (uint64_t)buf);
          v33 = (uint64_t **)(a1 + 136);
          v45 = *(char ***)v91;
          if (*(unsigned char **)v91 != &v91[8])
          {
            do
            {
              *(_OWORD *)__p = 0u;
              long long v78 = 0u;
              *(_OWORD *)int buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_4E88((uint64_t)buf, 0, 0, a3, v45 + 4, v45 + 7);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&long long v78 = __p[1];
                operator delete(__p[1]);
              }
              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }
              v46 = v45[1];
              if (v46)
              {
                do
                {
                  v47 = (char **)v46;
                  v46 = *(char **)v46;
                }
                while (v46);
              }
              else
              {
                do
                {
                  v47 = (char **)v45[2];
                  BOOL v15 = *v47 == (char *)v45;
                  v45 = v47;
                }
                while (!v15);
              }
              v45 = v47;
            }
            while (v47 != (char **)&v91[8]);
          }
          sub_55F4((uint64_t **)(a1 + 136), v22);
          sub_5960((uint64_t)v91, *(void **)&v91[8]);
          sub_5960((uint64_t)&v79, v80);
        }
        *(void *)int buf = a3;
        v51 = sub_4DD4(v33, (unint64_t *)buf);
        if (v51 != (uint64_t **)&v82) {
          sub_6830(v51, v82, &v83);
        }
      }
    }
    sub_5960((uint64_t)&v82, v83);
    v83 = 0;
    uint64_t v84 = 0;
    v82 = &v83;
    v53 = *(void **)(a1 + 112);
    uint64_t v74 = a1 + 112;
    v54 = (void *)(a1 + 120);
    if (v53 != (void *)(a1 + 120))
    {
      do
      {
        BTBrowseMgr::_GetServiceInstancesOfType(v52, a3, v53 + 4);
        v55 = (void *)v53[1];
        if (v55)
        {
          do
          {
            v56 = v55;
            v55 = (void *)*v55;
          }
          while (v55);
        }
        else
        {
          do
          {
            v56 = (void *)v53[2];
            BOOL v15 = *v56 == (void)v53;
            v53 = v56;
          }
          while (!v15);
        }
        v53 = v56;
      }
      while (v56 != v54);
      v57 = v82;
      if (v82 != &v83)
      {
        v58 = (uint64_t **)(v73 + 136);
        do
        {
          v59 = sub_5838(v74, (unsigned __int8 **)v57 + 4);
          v60 = v59;
          if (v54 != v59)
          {
            v61 = (char **)sub_5838((uint64_t)(v59 + 7), (unsigned __int8 **)v57 + 7);
            if (v60 + 8 != v61)
            {
              v62 = (char **)(v60 + 4);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                v63 = v58;
                sub_3414(v62);
                int v64 = SHIBYTE(v76[0]);
                v65 = *(uint8_t **)buf;
                sub_3414(v61 + 4);
                v66 = buf;
                if (v64 < 0) {
                  v66 = v65;
                }
                v67 = &v79;
                if (v81 < 0) {
                  v67 = v79;
                }
                *(_DWORD *)v91 = 136315394;
                *(void *)&v91[4] = v66;
                *(_WORD *)&v91[12] = 2080;
                *(void *)&v91[14] = v67;
                _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Resolved new service - Key: %s Value %s\n", v91, 0x16u);
                if (SHIBYTE(v81) < 0) {
                  operator delete(v79);
                }
                v58 = v63;
                if (SHIBYTE(v76[0]) < 0) {
                  operator delete(*(void **)buf);
                }
              }
              *(void *)int buf = a3;
              v68 = sub_4DD4(v58, (unint64_t *)buf);
              sub_59C8(v68, (unsigned __int8 **)v57 + 4, v57 + 4);
              *(_OWORD *)__p = 0u;
              long long v78 = 0u;
              *(_OWORD *)int buf = 0u;
              *(_OWORD *)v76 = 0u;
              sub_4E88((uint64_t)buf, 2, 0, a3, v62, v61 + 4);
              BTD2DPlugin::_QueueServiceEvent(*(void *)(v73 + 8), (uint64_t)buf);
              if (__p[1])
              {
                *(void **)&long long v78 = __p[1];
                operator delete(__p[1]);
              }
              if (v76[0])
              {
                v76[1] = v76[0];
                operator delete(v76[0]);
              }
            }
          }
          v69 = v57[1];
          if (v69)
          {
            do
            {
              v70 = (char **)v69;
              v69 = *(char **)v69;
            }
            while (v69);
          }
          else
          {
            do
            {
              v70 = (char **)v57[2];
              BOOL v15 = *v70 == (char *)v57;
              v57 = v70;
            }
            while (!v15);
          }
          v57 = v70;
        }
        while (v70 != &v83);
      }
    }
    sub_5960((uint64_t)&v82, v83);
    uint64_t v6 = v72;
  }
  return pthread_mutex_unlock(v6);
}

void sub_4CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,char a32,void *a33)
{
}

uint64_t **sub_4DD4(uint64_t **a1, unint64_t *a2)
{
  uint64_t v4 = a1 + 1;
  int v3 = a1[1];
  unint64_t v5 = *a2;
  if (v3)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (uint64_t **)v3;
        unint64_t v7 = v3[4];
        if (v5 >= v7) {
          break;
        }
        int v3 = *v6;
        uint64_t v4 = v6;
        if (!*v6) {
          goto LABEL_9;
        }
      }
      if (v7 >= v5) {
        break;
      }
      int v3 = v6[1];
      if (!v3)
      {
        uint64_t v4 = v6 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v6 = a1 + 1;
LABEL_9:
    uint64_t v8 = (uint64_t *)operator new(0x40uLL);
    v8[7] = 0;
    v8[6] = 0;
    v8[4] = v5;
    v8[5] = (uint64_t)(v8 + 6);
    sub_1D84(a1, (uint64_t)v6, v4, v8);
    uint64_t v6 = (uint64_t **)v8;
  }
  return v6 + 5;
}

uint64_t sub_4E88(uint64_t a1, int a2, int a3, uint64_t a4, char **a5, char **a6)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  sub_1AF0((char *)(a1 + 16), *a5, a5[1], a5[1] - *a5);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  sub_1AF0((char *)(a1 + 40), *a6, a6[1], a6[1] - *a6);
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(void *)(a1 + 8) = a4;
  return a1;
}

void sub_4F08(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_4F24(uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  uint64_t v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 8));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_5094(_Unwind_Exception *a1)
{
}

uint64_t sub_50C0(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void sub_51C4(_Unwind_Exception *a1)
{
}

uint64_t sub_51F4(uint64_t a1)
{
  return a1;
}

void sub_5334(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x5314);
}

void sub_538C(_Unwind_Exception *a1)
{
}

uint64_t sub_53A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v18 = 0;
      sub_5530(__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(v18) < 0) {
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

void sub_5514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_5530(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_55DC();
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

void sub_55DC()
{
}

uint64_t *sub_55F4(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = sub_2250(a1, (uint64_t *)a2);
  sub_5960(a2 + 40, *(void **)(a2 + 48));
  operator delete((void *)a2);
  return v3;
}

void *sub_5634(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v5 = *(void **)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v6 = a3[1];
    do
    {
      while (1)
      {
        size_t v7 = v4;
        size_t v8 = (unsigned __int8 *)v4[4];
        unint64_t v9 = (unsigned __int8 *)v7[5];
        if (v8 != v9) {
          break;
        }
LABEL_12:
        if (*a3 != v6)
        {
          uint64_t v15 = (uint64_t)(*a3 + 1);
          while (v8 != v9)
          {
            unsigned int v16 = *v8;
            unsigned int v17 = *(unsigned __int8 *)(v15 - 1);
            if (v16 < v17) {
              break;
            }
            ++v8;
            if (v17 < v16 || v15++ == (void)v6) {
              goto LABEL_27;
            }
          }
          uint64_t result = v7 + 1;
          uint64_t v4 = (void *)v7[1];
          if (v4) {
            continue;
          }
        }
        goto LABEL_27;
      }
      BOOL v10 = v8 + 1;
      uint64_t v11 = *a3;
      while (v11 != v6)
      {
        unsigned int v12 = *v11;
        unsigned int v13 = *(v10 - 1);
        if (v12 < v13) {
          break;
        }
        ++v11;
        if (v13 < v12 || v10++ == v9) {
          goto LABEL_12;
        }
      }
      uint64_t v4 = (void *)*v7;
      uint64_t result = v7;
    }
    while (*v7);
  }
  else
  {
    size_t v7 = result;
  }
LABEL_27:
  *a2 = v7;
  return result;
}

char *sub_56F4@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0;
  a3[2] = 0;
  a3[1] = 0;
  uint64_t v6 = a3 + 1;
  size_t v7 = operator new(0x40uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_WORD *)a3 + 8) = 0;
  *((void *)v7 + 5) = 0;
  *((void *)v7 + 6) = 0;
  *((void *)v7 + 4) = 0;
  uint64_t result = sub_1AF0((char *)v7 + 32, *a2, a2[1], a2[1] - *a2);
  *((_WORD *)a3 + 8) = 257;
  *((_DWORD *)v7 + 14) = 0;
  return result;
}

void sub_5774(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_5790(v2, v3);
  _Unwind_Resume(a1);
}

void sub_5790(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = (void *)__p[4];
    if (v3)
    {
      __p[5] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t sub_57F0(uint64_t **a1, unsigned __int8 **a2)
{
  uint64_t v3 = sub_5838((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3) {
    return 0;
  }
  sub_58B8(a1, v3);
  return 1;
}

void *sub_5838(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v3 = (void *)(a1 + 8);
  uint64_t result = sub_58FC(a1, a2, *(void **)(a1 + 8), (void *)(a1 + 8));
  if (v3 != result)
  {
    uint64_t v6 = result[4];
    uint64_t v5 = result[5];
    if (v6 == v5) {
      return result;
    }
    size_t v7 = *a2;
    uint64_t v8 = v6 + 1;
    while (v7 != a2[1])
    {
      unsigned int v9 = *v7;
      unsigned int v10 = *(unsigned __int8 *)(v8 - 1);
      if (v9 < v10) {
        break;
      }
      ++v7;
      if (v10 < v9 || v8++ == v5) {
        return result;
      }
    }
  }
  return v3;
}

uint64_t *sub_58B8(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = sub_2250(a1, a2);
  uint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = (uint64_t)v4;
    operator delete(v4);
  }
  operator delete(a2);
  return v3;
}

void *sub_58FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t result = a4;
  if (a3)
  {
    uint64_t v5 = a2[1];
    do
    {
      if (*a2 == v5)
      {
LABEL_12:
        uint64_t result = a3;
      }
      else
      {
        uint64_t v6 = (unsigned __int8 *)a3[4];
        uint64_t v7 = *a2 + 1;
        while (v6 != (unsigned __int8 *)a3[5])
        {
          unsigned int v8 = *v6;
          unsigned int v9 = *(unsigned __int8 *)(v7 - 1);
          if (v8 < v9) {
            break;
          }
          ++v6;
          if (v9 < v8 || v7++ == v5) {
            goto LABEL_12;
          }
        }
        ++a3;
      }
      a3 = (void *)*a3;
    }
    while (a3);
  }
  return result;
}

void sub_5960(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_5960(a1, *a2);
    sub_5960(a1, a2[1]);
    sub_210C((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t *sub_59C8(uint64_t **a1, unsigned __int8 **a2, char **a3)
{
  uint64_t v8 = 0;
  uint64_t v5 = (uint64_t **)sub_1C50((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    memset(v7, 0, sizeof(v7));
    sub_5A54((uint64_t)a1, a3, v7);
    sub_1D84(a1, v8, v5, v7[0]);
    return v7[0];
  }
  return result;
}

uint64_t sub_5A54@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0;
  a3[2] = 0;
  a3[1] = 0;
  uint64_t v6 = a3 + 1;
  uint64_t v7 = operator new(0x50uLL);
  *a3 = v7;
  void *v6 = v5;
  *((unsigned char *)a3 + 16) = 0;
  uint64_t result = sub_1EA8((uint64_t)v7 + 32, a2);
  *((unsigned char *)a3 + 16) = 1;
  return result;
}

void sub_5AC8(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_5AE4(v2, v3);
  _Unwind_Resume(a1);
}

void sub_5AE4(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    sub_210C((uint64_t)__p + 32);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void sub_5B3C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_5B3C(a1, *a2);
    sub_5B3C(a1, a2[1]);
    sub_5960((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }
}

void sub_5B9C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_5B9C(a1, *a2);
    sub_5B9C(a1, a2[1]);
    uint64_t v4 = (void *)a2[4];
    if (v4)
    {
      a2[5] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

char *sub_5C00@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0;
  a3[2] = 0;
  a3[1] = 0;
  uint64_t v6 = a3 + 1;
  uint64_t v7 = (char *)operator new(0x50uLL);
  *a3 = v7;
  void *v6 = v5;
  *((_WORD *)a3 + 8) = 0;
  *((void *)v7 + 5) = 0;
  *((void *)v7 + 6) = 0;
  *((void *)v7 + 4) = 0;
  uint64_t result = sub_1AF0(v7 + 32, *a2, a2[1], a2[1] - *a2);
  *((_WORD *)a3 + 8) = 257;
  *((void *)v7 + 8) = 0;
  *((void *)v7 + 9) = 0;
  *((void *)v7 + 7) = v7 + 64;
  return result;
}

void sub_5C84(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_5CA0(v3, v2);
  _Unwind_Resume(a1);
}

void sub_5CA0(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 9)) {
    sub_5B9C((uint64_t)(__p + 7), __p[8]);
  }
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v4 = __p[4];
    if (v4)
    {
      __p[5] = v4;
      operator delete(v4);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t **sub_5D18(uint64_t **result, char **a2, char **a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v7 = result[1];
    char *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t v15 = result;
    unsigned int v16 = v8;
    unsigned int v17 = v8;
    if (v8)
    {
      unsigned int v16 = sub_6068((uint64_t)v8);
      if (a2 != a3)
      {
        unsigned int v9 = a2;
        do
        {
          if (v8 != (uint64_t *)v9)
          {
            sub_5EAC(v8 + 4, v9[4], v9[5], v9[5] - v9[4]);
            uint64_t v8 = v17;
          }
          uint64_t v18 = 0;
          unsigned int v10 = (uint64_t **)sub_5FE0((uint64_t)v5, &v18, (unsigned __int8 **)v8 + 4);
          sub_1D84(v5, v18, v10, v8);
          unsigned int v17 = v16;
          if (v16) {
            unsigned int v16 = sub_6068((uint64_t)v16);
          }
          uint64_t v11 = v9[1];
          if (v11)
          {
            do
            {
              a2 = (char **)v11;
              uint64_t v11 = *(char **)v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              a2 = (char **)v9[2];
              BOOL v12 = *a2 == (char *)v9;
              unsigned int v9 = a2;
            }
            while (!v12);
          }
          uint64_t v8 = v17;
          if (v17) {
            BOOL v12 = a2 == a3;
          }
          else {
            BOOL v12 = 1;
          }
          unsigned int v9 = a2;
        }
        while (!v12);
      }
    }
    uint64_t result = (uint64_t **)sub_60BC((uint64_t)&v15);
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t result = (uint64_t **)sub_6114(v5, a2 + 4);
      unsigned int v13 = a2[1];
      if (v13)
      {
        do
        {
          uint64_t v14 = (char **)v13;
          unsigned int v13 = *(char **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          uint64_t v14 = (char **)a2[2];
          BOOL v12 = *v14 == (char *)a2;
          a2 = v14;
        }
        while (!v12);
      }
      a2 = v14;
    }
    while (v14 != a3);
  }
  return result;
}

void sub_5E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_5EAC(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v6 = __src;
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  unsigned int v9 = (unsigned char *)*result;
  if (v8 - *result >= a4)
  {
    uint64_t v14 = (unsigned char *)result[1];
    size_t v15 = v14 - v9;
    if (v14 - v9 >= a4)
    {
      size_t v19 = a3 - __src;
      if (v19) {
        uint64_t result = memmove((void *)*result, __src, v19);
      }
      BOOL v12 = &v9[v19];
    }
    else
    {
      unsigned int v16 = &__src[v15];
      if (v14 != v9)
      {
        uint64_t result = memmove((void *)*result, __src, v15);
        unsigned int v9 = (unsigned char *)v7[1];
      }
      BOOL v12 = v9;
      if (v16 != a3)
      {
        BOOL v12 = v9;
        unsigned int v17 = v9;
        do
        {
          char v18 = *v16++;
          *v17++ = v18;
          ++v12;
        }
        while (v16 != a3);
      }
    }
  }
  else
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      sub_1BA8();
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    uint64_t result = sub_1B64(v7, v11);
    BOOL v12 = (unsigned char *)v7[1];
    while (v6 != a3)
    {
      char v13 = *v6++;
      *v12++ = v13;
    }
  }
  v7[1] = v12;
  return result;
}

void *sub_5FE0(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  uint64_t v5 = *(void **)(a1 + 8);
  uint64_t v3 = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    do
    {
      while (1)
      {
        uint64_t v3 = v4;
        uint64_t v6 = v4[4];
        uint64_t v7 = v3[5];
        if (v6 == v7) {
          break;
        }
        uint64_t v8 = v6 + 1;
        unsigned int v9 = *a3;
        while (v9 != a3[1])
        {
          unsigned int v10 = *v9;
          unsigned int v11 = *(unsigned __int8 *)(v8 - 1);
          if (v10 < v11) {
            break;
          }
          ++v9;
          if (v11 < v10 || v8++ == v7) {
            goto LABEL_11;
          }
        }
        uint64_t v4 = (void *)*v3;
        char v13 = v3;
        if (!*v3) {
          goto LABEL_16;
        }
      }
LABEL_11:
      uint64_t v4 = (void *)v3[1];
    }
    while (v4);
    char v13 = v3 + 1;
  }
  else
  {
    char v13 = v3;
  }
LABEL_16:
  *a2 = v3;
  return v13;
}

void *sub_6068(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      void *result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t sub_60BC(uint64_t a1)
{
  sub_5B9C(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    sub_5B9C(*(void *)a1, v2);
  }
  return a1;
}

uint64_t *sub_6114(uint64_t **a1, char **a2)
{
  memset(v6, 0, sizeof(v6));
  sub_619C((uint64_t)a1, a2, v6);
  uint64_t v5 = 0;
  uint64_t v3 = (uint64_t **)sub_5FE0((uint64_t)a1, &v5, (unsigned __int8 **)v6[0] + 4);
  sub_1D84(a1, v5, v3, v6[0]);
  return v6[0];
}

void sub_6178(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_5790((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_619C@<X0>(uint64_t a1@<X0>, char **a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0;
  a3[2] = 0;
  a3[1] = 0;
  uint64_t v6 = a3 + 1;
  uint64_t v7 = operator new(0x38uLL);
  *a3 = v7;
  void *v6 = v5;
  *((unsigned char *)a3 + 16) = 0;
  *((void *)v7 + 5) = 0;
  *((void *)v7 + 6) = 0;
  *((void *)v7 + 4) = 0;
  uint64_t result = sub_1AF0((char *)v7 + 32, *a2, a2[1], a2[1] - *a2);
  *((unsigned char *)a3 + 16) = 1;
  return result;
}

void sub_6218(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_5790(v2, v3);
  _Unwind_Resume(a1);
}

uint64_t *sub_6234(uint64_t **a1, unsigned __int8 **a2, char **a3)
{
  uint64_t v8 = 0;
  uint64_t v5 = (uint64_t **)sub_5634((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    memset(v7, 0, sizeof(v7));
    sub_619C((uint64_t)a1, a3, v7);
    sub_1D84(a1, v8, v5, v7[0]);
    return v7[0];
  }
  return result;
}

void sub_62C0(uint64_t a1)
{
  sub_5B9C(a1 + 24, *(void **)(a1 + 32));
  uint64_t v2 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

double sub_6314@<D0>(unsigned __int8 ***a1@<X0>, unsigned __int8 ***a2@<X1>, unsigned __int8 ***a3@<X2>, unsigned __int8 ***a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unsigned int v11 = *a1;
  BOOL v12 = *a2;
  if (*a1 == *a2)
  {
LABEL_31:
    BOOL v12 = v11;
    goto LABEL_32;
  }
  for (i = *a3; *a3 != *a4; i = *a3)
  {
    if (sub_1DDC(a6, v11 + 4, i + 4))
    {
      sub_64F0((uint64_t)a5, *a1 + 4);
      unsigned int v17 = *a1;
      char v18 = (*a1)[1];
      if (v18)
      {
        do
        {
          size_t v19 = (unsigned __int8 **)v18;
          char v18 = *(unsigned __int8 **)v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          size_t v19 = (unsigned __int8 **)v17[2];
          BOOL v20 = *v19 == (unsigned __int8 *)v17;
          unsigned int v17 = v19;
        }
        while (!v20);
      }
      *a1 = v19;
    }
    else
    {
      if (sub_1DDC(a6, *a3 + 4, *a1 + 4))
      {
        uint64_t v21 = *a3;
        uint64_t v22 = (*a3)[1];
        if (v22)
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v22;
            uint64_t v22 = *(unsigned __int8 **)v22;
          }
          while (v22);
        }
        else
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v21[2];
            BOOL v20 = *v23 == (unsigned __int8 *)v21;
            uint64_t v21 = v23;
          }
          while (!v20);
        }
      }
      else
      {
        BOOL v24 = *a1;
        uint64_t v25 = (*a1)[1];
        if (v25)
        {
          do
          {
            long long v26 = (unsigned __int8 **)v25;
            uint64_t v25 = *(unsigned __int8 **)v25;
          }
          while (v25);
        }
        else
        {
          do
          {
            long long v26 = (unsigned __int8 **)v24[2];
            BOOL v20 = *v26 == (unsigned __int8 *)v24;
            BOOL v24 = v26;
          }
          while (!v20);
        }
        *a1 = v26;
        int v27 = *a3;
        v28 = (*a3)[1];
        if (v28)
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v28;
            v28 = *(unsigned __int8 **)v28;
          }
          while (v28);
        }
        else
        {
          do
          {
            unint64_t v23 = (unsigned __int8 **)v27[2];
            BOOL v20 = *v23 == (unsigned __int8 *)v27;
            int v27 = v23;
          }
          while (!v20);
        }
      }
      *a3 = v23;
    }
    unsigned int v11 = *a1;
    BOOL v12 = *a2;
    if (*a1 == *a2) {
      goto LABEL_31;
    }
  }
LABEL_32:
  uint64_t v29 = *a5;
  uint64_t v30 = a5[1];
  uint64_t v32 = 0;
  long long v33 = 0uLL;
  sub_6798(v11, v12, v29, v30, (uint64_t)&v32);
  *(void *)a7 = v32;
  double result = *(double *)&v33;
  *(_OWORD *)(a7 + 8) = v33;
  return result;
}

uint64_t sub_64F0(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v3 = sub_655C(*(uint64_t ***)a1, *(uint64_t **)(a1 + 8), a2, (char **)a2);
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = (uint64_t *)v3[1];
  if (v4)
  {
    do
    {
      uint64_t v5 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  else
  {
    do
    {
      uint64_t v5 = (uint64_t *)v3[2];
      BOOL v6 = *v5 == (void)v3;
      uint64_t v3 = v5;
    }
    while (!v6);
  }
  *(void *)(a1 + 8) = v5;
  return a1;
}

uint64_t *sub_655C(uint64_t **a1, uint64_t *a2, unsigned __int8 **a3, char **a4)
{
  uint64_t v9 = 0;
  unsigned int v10 = 0;
  BOOL v6 = (uint64_t **)sub_65EC(a1, a2, &v10, &v9, a3);
  double result = *v6;
  if (!*v6)
  {
    memset(v8, 0, sizeof(v8));
    sub_5A54((uint64_t)a1, a4, v8);
    sub_1D84(a1, (uint64_t)v10, v6, v8[0]);
    return v8[0];
  }
  return result;
}

unsigned __int8 **sub_65EC(void *a1, uint64_t *a2, unsigned __int8 ***a3, uint64_t *a4, unsigned __int8 **a5)
{
  uint64_t v9 = (unsigned __int8 **)(a1 + 1);
  if (a1 + 1 != a2 && !sub_1DDC((uint64_t)(a1 + 2), a5, (unsigned __int8 **)a2 + 4))
  {
    if (!sub_1DDC((uint64_t)(a1 + 2), (unsigned __int8 **)a2 + 4, a5))
    {
      *a3 = (unsigned __int8 **)a2;
      *a4 = (uint64_t)a2;
      return (unsigned __int8 **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      uint64_t v14 = (unsigned __int8 *)a2[1];
      do
      {
        size_t v15 = (unsigned __int8 **)v14;
        uint64_t v14 = *(unsigned __int8 **)v14;
      }
      while (v14);
    }
    else
    {
      char v18 = (unsigned __int8 **)a2;
      do
      {
        size_t v15 = (unsigned __int8 **)v18[2];
        BOOL v17 = *v15 == (unsigned __int8 *)v18;
        char v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_1DDC((uint64_t)(a1 + 2), a5, v15 + 4)) {
        goto LABEL_28;
      }
      uint64_t v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (unsigned __int8 **)a2;
    }
    return (unsigned __int8 **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    BOOL v12 = (unsigned __int8 **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (unsigned __int8 **)a2;
      return (unsigned __int8 **)a2;
    }
  }
  unsigned int v11 = (unsigned __int8 **)*a2;
  if (*a2)
  {
    do
    {
      BOOL v12 = v11;
      unsigned int v11 = (unsigned __int8 **)v11[1];
    }
    while (v11);
  }
  else
  {
    unsigned int v16 = (unsigned __int8 *)a2;
    do
    {
      BOOL v12 = (unsigned __int8 **)*((void *)v16 + 2);
      BOOL v17 = *v12 == v16;
      unsigned int v16 = (unsigned __int8 *)v12;
    }
    while (v17);
  }
  if (sub_1DDC((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:
  return (unsigned __int8 **)sub_1C50((uint64_t)a1, a3, a5);
}

double sub_6798@<D0>(unsigned __int8 **a1@<X1>, unsigned __int8 **a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v5 = a1;
  *(void *)&long long v12 = a3;
  *((void *)&v12 + 1) = a4;
  if (a1 != a2)
  {
    do
    {
      sub_64F0((uint64_t)&v12, v5 + 4);
      uint64_t v8 = v5[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = (unsigned __int8 **)v8;
          uint64_t v8 = *(unsigned __int8 **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (unsigned __int8 **)v5[2];
          BOOL v10 = *v9 == (unsigned __int8 *)v5;
          uint64_t v5 = v9;
        }
        while (!v10);
      }
      uint64_t v5 = v9;
    }
    while (v9 != a2);
    uint64_t v5 = a2;
  }
  *(void *)a5 = v5;
  double result = *(double *)&v12;
  *(_OWORD *)(a5 + 8) = v12;
  return result;
}

uint64_t **sub_6830(uint64_t **result, char **a2, char **a3)
{
  uint64_t v5 = result;
  if (result[2])
  {
    BOOL v6 = *result;
    uint64_t v7 = result[1];
    uint64_t *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    size_t v15 = result;
    unsigned int v16 = v8;
    BOOL v17 = (unsigned __int8 **)v8;
    if (v8)
    {
      unsigned int v16 = sub_6068((uint64_t)v8);
      if (a2 != a3)
      {
        uint64_t v9 = a2;
        do
        {
          sub_69B8((char **)v8 + 4, v9 + 4);
          uint64_t v18 = 0;
          BOOL v10 = (uint64_t **)sub_6A0C((uint64_t)v5, &v18, v17 + 4);
          sub_1D84(v5, v18, v10, (uint64_t *)v17);
          BOOL v17 = (unsigned __int8 **)v16;
          if (v16) {
            unsigned int v16 = sub_6068((uint64_t)v16);
          }
          unsigned int v11 = v9[1];
          if (v11)
          {
            do
            {
              a2 = (char **)v11;
              unsigned int v11 = *(char **)v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              a2 = (char **)v9[2];
              BOOL v12 = *a2 == (char *)v9;
              uint64_t v9 = a2;
            }
            while (!v12);
          }
          uint64_t v8 = (uint64_t *)v17;
          if (v17) {
            BOOL v12 = a2 == a3;
          }
          else {
            BOOL v12 = 1;
          }
          uint64_t v9 = a2;
        }
        while (!v12);
      }
    }
    double result = (uint64_t **)sub_6A88((uint64_t)&v15);
  }
  if (a2 != a3)
  {
    do
    {
      double result = (uint64_t **)sub_6AE0(v5, a2 + 4);
      uint64_t v13 = a2[1];
      if (v13)
      {
        do
        {
          uint64_t v14 = (char **)v13;
          uint64_t v13 = *(char **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          uint64_t v14 = (char **)a2[2];
          BOOL v12 = *v14 == (char *)a2;
          a2 = v14;
        }
        while (!v12);
      }
      a2 = v14;
    }
    while (v14 != a3);
  }
  return result;
}

void sub_69A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

char **sub_69B8(char **a1, char **a2)
{
  if (a1 != a2)
  {
    sub_5EAC(a1, *a2, a2[1], a2[1] - *a2);
    sub_5EAC(a1 + 3, a2[3], a2[4], a2[4] - a2[3]);
  }
  return a1;
}

void *sub_6A0C(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v5 = (void *)v4;
        if (!sub_1DDC(v7, a3, (unsigned __int8 **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v5;
        double result = v5;
        if (!*v5) {
          goto LABEL_9;
        }
      }
      uint64_t v4 = v5[1];
    }
    while (v4);
    double result = v5 + 1;
  }
  else
  {
    double result = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v5;
  return result;
}

uint64_t sub_6A88(uint64_t a1)
{
  sub_5960(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    sub_5960(*(void *)a1, v2);
  }
  return a1;
}

uint64_t *sub_6AE0(uint64_t **a1, char **a2)
{
  memset(v6, 0, sizeof(v6));
  sub_5A54((uint64_t)a1, a2, v6);
  uint64_t v5 = 0;
  uint64_t v3 = (uint64_t **)sub_6A0C((uint64_t)a1, &v5, (unsigned __int8 **)v6[0] + 4);
  sub_1D84(a1, v5, v3, v6[0]);
  return v6[0];
}

void sub_6B44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_5AE4((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void BTInterestMgr::BluetoothAvailabilityChanged(BTInterestMgr *this, char a2)
{
  BTTaskMgr::BluetoothAvailabilityChanged((uint64_t)this, a2);
  if (*((unsigned char *)this + 16))
  {
    int v3 = BTServiceAddCallbacksWithFilter();
    if (v3)
    {
      int v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A0BC(v4);
      }
    }
    return;
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  *((void *)this + 12) = *((void *)this + 11);
  uint64_t v5 = (void **)*((void *)this + 15);
  unint64_t v6 = *((void *)this + 16) - (void)v5;
  if (v6)
  {
    uint64_t v7 = (void *)((char *)this + 152);
    unint64_t v8 = *((void *)this + 18);
    uint64_t v9 = &v5[v8 >> 9];
    uint64_t v10 = (uint64_t)*v9;
    uint64_t v11 = (uint64_t)*v9 + 8 * (v8 & 0x1FF);
    while ((void *)v11 != *(char **)((char *)v5 + (((*((void *)this + 19) + v8) >> 6) & 0x3FFFFFFFFFFFFF8))
                         + 8 * ((*((void *)this + 19) + v8) & 0x1FF))
    {
      v11 += 8;
      if (v11 - v10 == 4096)
      {
        uint64_t v12 = (uint64_t)v9[1];
        ++v9;
        uint64_t v10 = v12;
        uint64_t v11 = v12;
      }
    }
  }
  else
  {
    uint64_t v7 = (void *)((char *)this + 152);
  }
  void *v7 = 0;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*v5);
      uint64_t v13 = *((void *)this + 16);
      uint64_t v5 = (void **)(*((void *)this + 15) + 8);
      *((void *)this + 15) = v5;
      unint64_t v6 = v13 - (void)v5;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    uint64_t v14 = 256;
    goto LABEL_18;
  }
  if (v6 >> 3 == 2)
  {
    uint64_t v14 = 512;
LABEL_18:
    *((void *)this + 18) = v14;
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
}

void _btServiceEventCallback(void *a1, int a2, int a3, int a4, int a5, BTInterestMgr *this)
{
  if (a3 == 1)
  {
    if (!BTInterestMgr::_IsDeviceRetained(this, a1)) {
      return;
    }
    if (a4 == 12 && !a5)
    {
      BTInterestMgr::RemoveInterest(this, a1);
      uint64_t v10 = this;
      int v11 = 1;
      goto LABEL_11;
    }
    if (a4 == 2) {
      return;
    }
    uint64_t v10 = this;
    int v11 = 1;
LABEL_24:
    uint64_t v12 = (uint64_t)a1;
    int v13 = a5;
    goto LABEL_25;
  }
  if (a3 || !BTInterestMgr::_IsDeviceRetained(this, a1)) {
    return;
  }
  if (a4 == 11 && !a5)
  {
    uint64_t v10 = this;
    int v11 = 0;
LABEL_11:
    uint64_t v12 = (uint64_t)a1;
    int v13 = 0;
LABEL_25:
    BTInterestMgr::ReportInterestEvent((uint64_t)v10, v11, v12, v13);
    return;
  }
  BOOL v15 = a4 == 1 && a5 == 0;
  if (a4 && !v15)
  {
    BTInterestMgr::_RetryConnection(this, a1);
    uint64_t v10 = this;
    int v11 = 0;
    goto LABEL_24;
  }
}

uint64_t BTInterestMgr::Retain(BTInterestMgr *this, void *a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  uint64_t v5 = (void **)*((void *)this + 11);
  unint64_t v6 = (void **)*((void *)this + 12);
  uint64_t v7 = v5;
  if (v5 != v6)
  {
    while (*v7 != a2)
    {
      if (++v7 == v6)
      {
        uint64_t v7 = (void **)*((void *)this + 12);
        break;
      }
    }
  }
  if (v7 == v6)
  {
    unint64_t v8 = *((void *)this + 13);
    if ((unint64_t)v6 >= v8)
    {
      uint64_t v10 = v6 - v5;
      if ((unint64_t)(v10 + 1) >> 61) {
        sub_1BA8();
      }
      uint64_t v11 = v8 - (void)v5;
      uint64_t v12 = v11 >> 2;
      if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
        uint64_t v12 = v10 + 1;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13) {
        uint64_t v14 = (char *)sub_77D8((uint64_t)this + 104, v13);
      }
      else {
        uint64_t v14 = 0;
      }
      BOOL v15 = &v14[8 * v10];
      unsigned int v16 = &v14[8 * v13];
      *(void *)BOOL v15 = a2;
      uint64_t v9 = v15 + 8;
      uint64_t v18 = (char *)*((void *)this + 11);
      BOOL v17 = (char *)*((void *)this + 12);
      if (v17 != v18)
      {
        do
        {
          uint64_t v19 = *((void *)v17 - 1);
          v17 -= 8;
          *((void *)v15 - 1) = v19;
          v15 -= 8;
        }
        while (v17 != v18);
        BOOL v17 = (char *)*((void *)this + 11);
      }
      *((void *)this + 11) = v15;
      *((void *)this + 12) = v9;
      *((void *)this + 13) = v16;
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      uint64_t *v6 = a2;
      uint64_t v9 = v6 + 1;
    }
    *((void *)this + 12) = v9;
  }
  uint64_t v20 = pthread_mutex_unlock(v4);
  if (!*((unsigned char *)this + 16)) {
    return 0;
  }
  uint64_t v26 = 0;
  __chkstk_darwin(v20);
  uint64_t v21 = (void **)v25;
  bzero(v25, 0x800uLL);
  if (BTLocalDeviceGetConnectedDevices() || (uint64_t v24 = v26) == 0)
  {
LABEL_25:
    int v22 = BTDeviceConnectServices();
    if (v22)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A13C((uint64_t)a2, v22);
      }
      return 1;
    }
    return 0;
  }
  while (*v21 != a2)
  {
    ++v21;
    if (!--v24) {
      goto LABEL_25;
    }
  }
  return 0;
}

uint64_t BTInterestMgr::Release(BTInterestMgr *this, void *a2)
{
  return 0;
}

uint64_t BTInterestMgr::RemoveInterest(BTInterestMgr *this, void *a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  unint64_t v6 = (void **)*((void *)this + 11);
  uint64_t v5 = (void **)*((void *)this + 12);
  if (v6 != v5)
  {
    while (*v6 != a2)
    {
      if (++v6 == v5)
      {
        unint64_t v6 = (void **)*((void *)this + 12);
        break;
      }
    }
  }
  int64_t v7 = (char *)v5 - (char *)(v6 + 1);
  if (v5 != v6 + 1) {
    memmove(v6, v6 + 1, (char *)v5 - (char *)(v6 + 1));
  }
  *((void *)this + 12) = (char *)v6 + v7;
  return pthread_mutex_unlock(v4);
}

void BTInterestMgr::ReportInterestEvent(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  *(_OWORD *)__p = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  *(_OWORD *)int64_t v7 = 0u;
  if (a2) {
    int v5 = 4;
  }
  else {
    int v5 = 3;
  }
  sub_4E88((uint64_t)&v6, v5, a4 != 0, a3, &v10, &v10);
  BTD2DPlugin::_QueueServiceEvent(*(void *)(a1 + 8), (uint64_t)&v6);
  if (__p[1])
  {
    *(void **)&long long v9 = __p[1];
    operator delete(__p[1]);
  }
  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }
  if (v10)
  {
    uint64_t v11 = v10;
    operator delete(v10);
  }
}

void sub_7140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2C1C(&a9);
  uint64_t v11 = *(void **)(v9 - 40);
  if (v11)
  {
    *(void *)(v9 - 32) = v11;
    operator delete(v11);
  }
  _Unwind_Resume(a1);
}

BOOL BTInterestMgr::_IsDeviceRetained(BTInterestMgr *this, void *a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  int v5 = (void **)*((void *)this + 11);
  long long v6 = (void **)*((void *)this + 12);
  if (v5 != v6)
  {
    while (*v5 != a2)
    {
      if (++v5 == v6)
      {
        int v5 = (void **)*((void *)this + 12);
        break;
      }
    }
  }
  BOOL v7 = v5 != v6;
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t BTInterestMgr::_RetryConnection(BTInterestMgr *this, void *a2)
{
  uint64_t v19 = a2;
  int v3 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  unint64_t v4 = *((void *)this + 18);
  uint64_t v5 = *((void *)this + 15);
  long long v6 = (void *)(v5 + 8 * (v4 >> 9));
  if (*((void *)this + 16) == v5)
  {
    BOOL v7 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = (void **)(v5 + 8 * ((*((void *)this + 19) + v4) >> 9));
  }
  else
  {
    BOOL v7 = (void *)(*v6 + 8 * (*((void *)this + 18) & 0x1FFLL));
    unint64_t v8 = *((void *)this + 19) + v4;
    uint64_t v9 = (void **)(v5 + 8 * (v8 >> 9));
    uint64_t v10 = &(*v9)[v8 & 0x1FF];
  }
  LOBYTE(buf.version) = 0;
  sub_7810(v6, v7, v9, v10, &v19);
  uint64_t v12 = *((void *)this + 15);
  if (*((void *)this + 16) == v12)
  {
    uint64_t v14 = 0;
  }
  else
  {
    unint64_t v13 = *((void *)this + 19) + *((void *)this + 18);
    uint64_t v14 = *(void *)(v12 + ((v13 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v13 & 0x1FF);
  }
  if (v14 == v11)
  {
    if (BTInterestMgr::_ShouldRetry((BTBrowseMgr ***)this, v19))
    {
      sub_75C0((void *)this + 14, &v19);
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = this;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      unsigned int v16 = CFRunLoopTimerCreate(0, Current + 5.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)_RetryConnectionEventTimerCallback, &buf);
      BOOL v17 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v17, v16, kCFRunLoopCommonModes);
      CFRelease(v16);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v20 = 134217984;
        uint64_t v21 = v19;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Retrying connection to device %p in 5 seconds...\n", v20, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.version) = 134217984;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v19;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Already have pending retry attempt for device %p\n", (uint8_t *)&buf, 0xCu);
  }
  return pthread_mutex_unlock(v3);
}

BOOL BTInterestMgr::_ShouldRetry(BTBrowseMgr ***this, void *a2)
{
  if (BTD2DPlugin::_ResolvingServiceForDevice(this[1], (unint64_t)a2))
  {
    uint64_t v7 = 0;
    __chkstk_darwin();
    int v3 = (void **)v6;
    bzero(v6, 0x800uLL);
    if (BTLocalDeviceGetConnectedDevices()) {
      return 1;
    }
    uint64_t v5 = v7;
    if (!v7)
    {
      return 1;
    }
    else
    {
      while (*v3 != a2)
      {
        ++v3;
        if (!--v5) {
          return 1;
        }
      }
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_DWORD *)CFRunLoopTimerContext buf = 134217984;
        uint64_t v9 = a2;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Already connected to device %p\n", buf, 0xCu);
        return 0;
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)CFRunLoopTimerContext buf = 134217984;
      uint64_t v9 = a2;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "No longer resolving anything for device %p\n", buf, 0xCu);
      return 0;
    }
  }
  return result;
}

void sub_75C0(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_7950(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

uint64_t _RetryConnectionEventTimerCallback(__CFRunLoopTimer *a1, BTInterestMgr *this)
{
  return BTInterestMgr::_RetryConnectionEvent(this);
}

uint64_t BTInterestMgr::_RetryConnectionEvent(BTInterestMgr *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 24);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  uint64_t v3 = *((void *)this + 19);
  if (!v3) {
    return pthread_mutex_unlock(v2);
  }
  uint64_t v4 = *(void **)(*(void *)(*((void *)this + 15) + ((*((void *)this + 18) >> 6) & 0x3FFFFFFFFFFFFF8))
                + 8 * (*((void *)this + 18) & 0x1FFLL));
  ++*((void *)this + 18);
  *((void *)this + 19) = v3 - 1;
  sub_80D4((uint64_t)this + 112, 1);
  if (BTInterestMgr::_ShouldRetry((BTBrowseMgr ***)this, v4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Attempting to reconnect to device %p\n", (uint8_t *)&v6, 0xCu);
    }
    BTDeviceConnectServices();
    return pthread_mutex_unlock(v2);
  }
  return pthread_mutex_unlock(v2);
}

void sub_77A4()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_77D8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_77A4();
  }
  return operator new(8 * a2);
}

void *sub_7810(void *result, void *a2, void **a3, void *a4, void *a5)
{
  if (result == a3)
  {
    if (a2 != a4)
    {
      while (*a2 != *a5)
      {
        if (++a2 == a4)
        {
          a2 = a4;
          break;
        }
      }
    }
    if (result && (void *)(*result + 4096) == a2) {
      ++result;
    }
  }
  else
  {
    uint64_t v5 = *result + 4096;
    if ((void *)v5 == a2) {
      goto LABEL_14;
    }
    while (*a2 != *a5)
    {
      if (++a2 == (void *)v5) {
        goto LABEL_14;
      }
    }
    if (a2 == (void *)v5)
    {
LABEL_14:
      int v6 = result + 1;
      if (result + 1 == a3)
      {
        unint64_t v8 = result;
      }
      else
      {
        do
        {
          uint64_t v7 = 0;
          unint64_t v8 = v6;
          uint64_t v9 = *v6;
          do
          {
            if (*(void *)(v9 + v7) == *a5) {
              return v8;
            }
            v7 += 8;
          }
          while (v7 != 4096);
          int v6 = v8 + 1;
        }
        while (v8 + 1 != a3);
      }
      if (*a3 == a4)
      {
        return a3;
      }
      else
      {
        uint64_t v10 = *a3;
        while (*v10 != *a5)
        {
          if (++v10 == a4)
          {
            uint64_t v10 = a4;
            break;
          }
        }
        BOOL result = a3;
        if (*a3 + 512 == v10) {
          return v8 + 2;
        }
      }
    }
  }
  return result;
}

void sub_7950(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    int v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_77D8(v5, v33);
      int v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_7C68(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_7D80((uint64_t)a1, &v54);
    v44 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)sub_77D8((uint64_t)(a1 + 3), v46);
      int v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        unint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = sub_77D8((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  sub_7EA0(&v54, &v53);
  int v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_7FB8((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_7C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_7C68(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  int v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_77D8(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      int v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        int v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      int v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        int v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        int v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      int v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)int v6 = *a2;
  a1[2] += 8;
}

void sub_7D80(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_77D8(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_7EA0(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_77D8(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_7FB8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_77D8(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

uint64_t sub_80D4(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

uint64_t BTD2D_initialize(__CFRunLoop *a1, void (*a2)(unsigned int, unsigned int, void *, unsigned int, const unsigned __int8 *, unint64_t, const unsigned __int8 *, unint64_t, void *), void *a3)
{
  uint64_t v6 = sub_87CC();
  v6[160] = 0;
  *((void *)v6 + 6) = a1;
  *((void *)v6 + 7) = a2;
  *((void *)v6 + 8) = a3;
  return BTD2DPlugin::Attach((BTD2DPlugin *)v6);
}

uint64_t BTD2D_terminate(void)
{
  v0 = (BTD2DPlugin *)sub_87CC();
  return BTD2DPlugin::Terminate(v0);
}

uint64_t BTD2D_startAdvertisingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  unint64_t v16 = 0;
  sub_99B0((char *)&v16, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  __p = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_99B0((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_87CC();
  uint64_t v11 = BTAdvertiseMgr::Advertise(v10[4], (char **)&v16, (char **)&__p);
  if (__p)
  {
    uint64_t v14 = __p;
    operator delete(__p);
  }
  if (v16)
  {
    uint64_t v17 = v16;
    operator delete(v16);
  }
  return v11;
}

void sub_8290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_stopAdvertisingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  unint64_t v16 = 0;
  sub_99B0((char *)&v16, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  __p = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_99B0((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_87CC();
  uint64_t v11 = BTAdvertiseMgr::StopAdvertising(v10[4], (char **)&v16, (char **)&__p);
  if (__p)
  {
    uint64_t v14 = __p;
    operator delete(__p);
  }
  if (v16)
  {
    uint64_t v17 = v16;
    operator delete(v16);
  }
  return v11;
}

void sub_83A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_startBrowsingForKey(const __CFData *a1)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  BOOL v3 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v9 = 0;
  uint64_t v10 = 0;
  __p = 0;
  sub_99B0((char *)&__p, BytePtr, (char *)&v3[Length], &v3[Length] - (const UInt8 *)BytePtr);
  uint64_t v5 = sub_87CC();
  uint64_t v6 = BTBrowseMgr::Browse(v5[3], (unsigned __int8 **)&__p);
  if (__p)
  {
    CFIndex v9 = __p;
    operator delete(__p);
  }
  return v6;
}

void sub_846C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_stopBrowsingForKey(const __CFData *a1)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  BOOL v3 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v9 = 0;
  uint64_t v10 = 0;
  __p = 0;
  sub_99B0((char *)&__p, BytePtr, (char *)&v3[Length], &v3[Length] - (const UInt8 *)BytePtr);
  uint64_t v5 = sub_87CC();
  uint64_t v6 = BTBrowseMgr::StopBrowsing(v5[3], (unsigned __int8 **)&__p);
  if (__p)
  {
    CFIndex v9 = __p;
    operator delete(__p);
  }
  return v6;
}

void sub_8518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void BTD2D_startResolvingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  sub_99B0((char *)&v14, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  __p = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  sub_99B0((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_87CC();
  BTBrowseMgr::StartResolving(v10[3], (unsigned __int8 **)&v14, (unsigned __int8 **)&__p);
  if (__p)
  {
    uint64_t v12 = __p;
    operator delete(__p);
  }
  if (v14)
  {
    uint64_t v15 = v14;
    operator delete(v14);
  }
}

void sub_8610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void BTD2D_stopResolvingPair(const __CFData *a1, const __CFData *a2)
{
  BytePtr = (char *)CFDataGetBytePtr(a1);
  uint64_t v5 = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  sub_99B0((char *)&v14, BytePtr, (char *)&v5[Length], &v5[Length] - (const UInt8 *)BytePtr);
  uint64_t v7 = (char *)CFDataGetBytePtr(a2);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  __p = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  sub_99B0((char *)&__p, v7, (char *)&v8[v9], &v8[v9] - (const UInt8 *)v7);
  uint64_t v10 = sub_87CC();
  BTBrowseMgr::StopResolving(v10[3], (unsigned __int8 **)&v14, (unsigned __int8 **)&__p);
  if (__p)
  {
    uint64_t v12 = __p;
    operator delete(__p);
  }
  if (v14)
  {
    uint64_t v15 = v14;
    operator delete(v14);
  }
}

void sub_8720(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BTD2D_retain(void **a1)
{
  unint64_t v2 = (BTInterestMgr *)*((void *)sub_87CC() + 5);
  return BTInterestMgr::Retain(v2, a1);
}

uint64_t BTD2D_release(void **a1)
{
  unint64_t v2 = (BTInterestMgr *)*((void *)sub_87CC() + 5);
  return BTInterestMgr::Release(v2, a1);
}

void *sub_87CC()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100A8))
  {
    BTD2DPlugin::BTD2DPlugin((BTD2DPlugin *)&unk_10000);
  }
  return &unk_10000;
}

void sub_8850(_Unwind_Exception *a1)
{
}

uint64_t BTD2DPlugin::Initialize(BTD2DPlugin *this, __CFRunLoop *a2, void (*a3)(unsigned int, unsigned int, void *, unsigned int, const unsigned __int8 *, unint64_t, const unsigned __int8 *, unint64_t, void *), void *a4)
{
  *((unsigned char *)this + 160) = 0;
  *((void *)this + 6) = a2;
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return BTD2DPlugin::Attach(this);
}

uint64_t BTD2DPlugin::Terminate(BTD2DPlugin *this)
{
  *((unsigned char *)this + 160) = 1;
  if (!*(void *)this) {
    return 0;
  }
  uint64_t result = BTSessionDetachWithQueue();
  if (result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A1C8();
    }
    return 1;
  }
  return result;
}

uint64_t BTD2DPlugin::StartAdvertising(uint64_t a1, char **a2, char **a3)
{
  return BTAdvertiseMgr::Advertise(*(void *)(a1 + 32), a2, a3);
}

uint64_t BTD2DPlugin::StopAdvertising(uint64_t a1, char **a2, char **a3)
{
  return BTAdvertiseMgr::StopAdvertising(*(void *)(a1 + 32), a2, a3);
}

uint64_t BTD2DPlugin::StartBrowsing(uint64_t a1, unsigned __int8 **a2)
{
  return BTBrowseMgr::Browse(*(void *)(a1 + 24), a2);
}

uint64_t BTD2DPlugin::StopBrowsing(uint64_t a1, unsigned __int8 **a2)
{
  return BTBrowseMgr::StopBrowsing(*(void *)(a1 + 24), a2);
}

uint64_t BTD2DPlugin::StartResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  return BTBrowseMgr::StartResolving(*(void *)(a1 + 24), a2, a3);
}

uint64_t BTD2DPlugin::StopResolving(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  return BTBrowseMgr::StopResolving(*(void *)(a1 + 24), a2, a3);
}

uint64_t BTD2DPlugin::Retain(BTInterestMgr **this, void *a2)
{
  return BTInterestMgr::Retain(this[5], a2);
}

uint64_t BTD2DPlugin::Release(BTInterestMgr **this, void *a2)
{
  return BTInterestMgr::Release(this[5], a2);
}

void BTD2DPlugin::BTD2DPlugin(BTD2DPlugin *this)
{
  *((void *)this + 17) = (char *)this + 136;
  *((void *)this + 18) = (char *)this + 136;
  *((void *)this + 19) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  operator new();
}

void sub_8A08()
{
}

void BTD2DPlugin::~BTD2DPlugin(BTD2DPlugin *this)
{
  if (*((void *)this + 3))
  {
    sub_9790(*((void *)this + 3));
    operator delete();
  }
  uint64_t v2 = *((void *)this + 4);
  if (v2)
  {
    *(void *)uint64_t v2 = &off_C318;
    sub_9828(v2 + 24, *(void **)(v2 + 32));
    operator delete();
  }
  if (*((void *)this + 5))
  {
    sub_9890(*((void *)this + 5));
    operator delete();
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 72));
  sub_96C0((uint64_t *)this + 17);
}

void sub_8B20()
{
}

uint64_t BTD2DPlugin::Attach(BTD2DPlugin *this)
{
  if (*((unsigned char *)this + 160)) {
    return 1;
  }
  *(_OWORD *)__str = 0u;
  long long v6 = 0u;
  pid_t v2 = getpid();
  snprintf(__str, 0x20uLL, "DeviceToDevice-%u", v2);
  BOOL v3 = (__CFRunLoop *)*((void *)this + 6);
  if (v3 != CFRunLoopGetMain()) {
    sub_A2A8();
  }
  uint64_t result = BTSessionAttachWithQueue();
  if (result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A238();
    }
    return 1;
  }
  return result;
}

void _btSessionEventCallback(uint64_t a1, int a2, int a3, BTD2DPlugin *this)
{
  if (a3 | a2)
  {
    *(void *)this = 0;
    *((void *)this + 1) = 0;
    BTD2DPlugin::BluetoothStatusChanged((uint64_t)this, 0);
    if (a2 != 1 || a3)
    {
      _btReattach(this);
    }
  }
  else
  {
    *(void *)this = a1;
    if (BTLocalDeviceGetDefault())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A3FC();
      }
    }
    else
    {
      *((void *)this + 1) = 0;
      if (BTLocalDeviceAddCallbacks())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_A38C();
        }
      }
      else
      {
        if (!BTLocalDeviceSupportsService())
        {
          BTLocalDeviceGetModulePower();
          BTD2DPlugin::BluetoothStatusChanged((uint64_t)this, 1);
          return;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_A31C();
        }
      }
    }
    BTD2DPlugin::Cleanup(this);
    BTD2DPlugin::BluetoothStatusChanged((uint64_t)this, 0);
    _btReattach(this);
  }
}

uint64_t BTD2DPlugin::BluetoothStatusChanged(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 16) != a2)
  {
    uint64_t v2 = this;
    *(unsigned char *)(this + 16) = a2;
    (***(void (****)(void))(this + 24))(*(void *)(this + 24));
    (***(void (****)(void))(v2 + 32))();
    BOOL v3 = ***(uint64_t (****)(void))(v2 + 40);
    return v3();
  }
  return this;
}

uint64_t BTD2DPlugin::Cleanup(BTD2DPlugin *this)
{
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    uint64_t result = BTLocalDeviceRemoveCallbacks();
    *((void *)this + 1) = 0;
  }
  if (*(void *)this)
  {
    uint64_t result = BTSessionDetachWithQueue();
    *(void *)this = 0;
  }
  return result;
}

void _btLocalDeviceCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    if (BTLocalDeviceGetModulePower())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A46C();
      }
    }
    else
    {
      BTD2DPlugin::BluetoothStatusChanged(a4, 1);
    }
  }
}

void _ReportServiceEventTimerCallback(__CFRunLoopTimer *a1, BTD2DPlugin *this)
{
}

void BTD2DPlugin::_ReportServiceEvent(BTD2DPlugin *this)
{
  if (*((void *)this + 7))
  {
    uint64_t v2 = (pthread_mutex_t *)((char *)this + 72);
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 72));
    *(_OWORD *)__p = 0u;
    long long v6 = 0u;
    long long v3 = 0u;
    *(_OWORD *)int v4 = 0u;
    sub_991C((uint64_t)&v3, *((void *)this + 18) + 16);
    sub_928C((uint64_t)this + 136);
    pthread_mutex_unlock(v2);
    if (v4[1] != v4[0]) {
      operator new[]();
    }
    if ((void *)v6 != __p[1]) {
      operator new[]();
    }
    (*((void (**)(void, void, void, void, void, int64_t, void, unint64_t, void))this
     + 7))(v3, DWORD1(v3), *((void *)&v3 + 1), 0, 0, (char *)v4[1] - (char *)v4[0], 0, v6 - (unint64_t)__p[1], *((void *)this + 8));
    if (__p[1])
    {
      *(void **)&long long v6 = __p[1];
      operator delete(__p[1]);
    }
    if (v4[0])
    {
      v4[1] = v4[0];
      operator delete(v4[0]);
    }
  }
}

void sub_9190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_2C1C((uint64_t *)va);
  _Unwind_Resume(a1);
}

void BTD2DPlugin::_QueueServiceEvent(uint64_t a1, uint64_t a2)
{
  int v4 = (pthread_mutex_t *)(a1 + 72);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 72));
  uint64_t v5 = sub_9A24(a1 + 136, 0, 0, a2);
  v5[1] = a1 + 136;
  uint64_t v6 = *(void *)(a1 + 136);
  *uint64_t v5 = v6;
  *(void *)(v6 + 8) = v5;
  *(void *)(a1 + 136) = v5;
  ++*(void *)(a1 + 152);
  pthread_mutex_unlock(v4);
  v8.version = 0;
  memset(&v8.retain, 0, 24);
  v8.info = (void *)a1;
  uint64_t v7 = CFRunLoopTimerCreate(0, 0.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)_ReportServiceEventTimerCallback, &v8);
  CFRunLoopAddTimer(*(CFRunLoopRef *)(a1 + 48), v7, kCFRunLoopCommonModes);
  CFRelease(v7);
}

void sub_928C(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v3 = *v2;
  *(void *)(v3 + 8) = v2[1];
  *(void *)v2[1] = v3;
  *(void *)(a1 + 16) = v1 - 1;
  sub_9738(v2 + 2);
  operator delete(v2);
}

uint64_t BTD2DPlugin::_ResolvingServiceForDevice(BTBrowseMgr **this, unint64_t a2)
{
  return BTBrowseMgr::_ResolvingServiceForDevice(this[3], a2);
}

uint64_t BTTaskMgr::BluetoothAvailabilityChanged(uint64_t this, char a2)
{
  *(unsigned char *)(this + 16) = a2;
  return this;
}

void _btReattach(BTD2DPlugin *a1)
{
  dispatch_time_t v2 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_9384;
  block[3] = &unk_C438;
  block[4] = a1;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_9384(uint64_t a1)
{
  return BTD2DPlugin::Attach(*(BTD2DPlugin **)(a1 + 32));
}

uint64_t sub_938C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)a1 = &off_C378;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 88) = a1 + 96;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 112) = a1 + 120;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 136) = a1 + 144;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  *(_DWORD *)(a1 + 168) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0);
  return a1;
}

void sub_9434(_Unwind_Exception *a1)
{
  sub_5B3C(v3, *v6);
  sub_9464(v2, *v5);
  sub_5B9C(v1, *v4);
  _Unwind_Resume(a1);
}

void sub_9464(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_9464(a1, *a2);
    sub_9464(a1, a2[1]);
    sub_62C0((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t sub_94CC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)a1 = &off_C3B8;
  *(void *)(a1 + 8) = a2;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(void *)(a1 + 152) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0);
  return a1;
}

void sub_953C(_Unwind_Exception *a1)
{
  sub_95B4((void *)(v1 + 112));
  int v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 96) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_9564(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  int v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_95B4(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  unint64_t v4 = (char *)v3 - (char *)v2;
  if (v3 == v2)
  {
    uint64_t v5 = a1 + 5;
  }
  else
  {
    uint64_t v5 = a1 + 5;
    unint64_t v6 = a1[4];
    uint64_t v7 = &v2[v6 >> 9];
    uint64_t v8 = (uint64_t)*v7;
    uint64_t v9 = (uint64_t)*v7 + 8 * (v6 & 0x1FF);
    while ((void *)v9 != *(char **)((char *)v2 + (((a1[5] + v6) >> 6) & 0x3FFFFFFFFFFFFF8))
                        + 8 * ((a1[5] + v6) & 0x1FF))
    {
      v9 += 8;
      if (v9 - v8 == 4096)
      {
        uint64_t v10 = (uint64_t)v7[1];
        ++v7;
        uint64_t v8 = v10;
        uint64_t v9 = v10;
      }
    }
  }
  *uint64_t v5 = 0;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v4 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 256;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_15;
    }
    uint64_t v12 = 512;
  }
  a1[4] = v12;
LABEL_15:
  while (v2 != v3)
  {
    uint64_t v13 = *v2++;
    operator delete(v13);
  }
  return sub_9564((uint64_t)a1);
}

void sub_96C0(uint64_t *a1)
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
        uint64_t v5 = (uint64_t *)v3[1];
        sub_9738(v3 + 2);
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void sub_9738(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }
}

uint64_t sub_9790(uint64_t a1)
{
  *(void *)a1 = &off_C378;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  sub_5B3C(a1 + 136, *(void **)(a1 + 144));
  sub_9464(a1 + 112, *(void **)(a1 + 120));
  sub_5B9C(a1 + 88, *(void **)(a1 + 96));
  return a1;
}

void sub_97F8(_Unwind_Exception *a1)
{
  sub_5B3C((uint64_t)(v1 + 17), v1[18]);
  sub_9464((uint64_t)(v1 + 14), v1[15]);
  sub_5B9C((uint64_t)(v1 + 11), v1[12]);
  _Unwind_Resume(a1);
}

void sub_9828(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_9828(a1, *a2);
    sub_9828(a1, a2[1]);
    sub_210C((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t sub_9890(uint64_t a1)
{
  *(void *)a1 = &off_C3B8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  sub_95B4((void *)(a1 + 112));
  uint64_t v2 = *(void **)(a1 + 88);
  if (v2)
  {
    *(void *)(a1 + 96) = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_98EC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 + 88);
  if (v3)
  {
    *(void *)(v1 + 96) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_991C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  sub_1AF0((char *)(a1 + 16), *(char **)(a2 + 16), *(char **)(a2 + 24), *(void *)(a2 + 24) - *(void *)(a2 + 16));
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  sub_1AF0((char *)(a1 + 40), *(char **)(a2 + 40), *(char **)(a2 + 48), *(void *)(a2 + 48) - *(void *)(a2 + 40));
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

void sub_9994(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

char *sub_99B0(char *result, char *a2, char *a3, size_t __sz)
{
  if (__sz)
  {
    unint64_t v6 = result;
    uint64_t result = sub_1B64(result, __sz);
    uint64_t v7 = (unsigned char *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      char v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_9A08(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_9A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = operator new(0x50uLL);
  void *v7 = a2;
  v7[1] = a3;
  sub_991C((uint64_t)(v7 + 2), a4);
  return v7;
}

void sub_9A70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_9A84()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceSetConnectable with status FALSE failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9AF4()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceSetDiscoverable with status FALSE failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9B64()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceGetDiscoverable with failed with error %d - setting discoverable anyway\n", v1, v2, v3, v4, v5);
}

void sub_9BD4()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceAdvertiseData failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9C44()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceRemoveData failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9CB4()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTDiscoveryAgentDestroy failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9D24()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTDiscoveryAgentStopScan failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9D94(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)CFRunLoopTimerContext buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Call to BTDiscoveryAgentAddKey failed with error %d\n", buf, 8u);
}

void sub_9DE0()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTDiscoveryAgentCreate failed with error %d - browsing will not return any results\n", v1, v2, v3, v4, v5);
}

void sub_9E50()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTDiscoveryAgentStartScanForUserServices failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9EC0()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTDiscoveryAgentAddKey failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_9F30(unsigned __int8 a1, uint64_t a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 2048;
  uint64_t v4 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Buffer error - size of next value (%u) would exceed overall buffer length (%lu)\n", (uint8_t *)v2, 0x12u);
}

void sub_9FC0(uint64_t a1, int a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Call to BTDeviceGetAdvertisedValueForKey with a %lu byte buffer failed with error %d\n", (uint8_t *)&v2, 0x12u);
}

void sub_A04C()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTDiscoveryAgentRemoveKey failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_A0BC(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Call to BTServiceAddCallbacks failed with error %d - \n", (uint8_t *)v1, 8u);
}

void sub_A13C(uint64_t a1, int a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Call to BTDeviceConnect on device %p failed with error %d\n", (uint8_t *)&v2, 0x12u);
}

void sub_A1C8()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTSessionDetachWithQueue failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_A238()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTSessionAttachWithQueue failed with error %d - critical error\n", v1, v2, v3, v4, v5);
}

void sub_A2A8()
{
  __assert_rtn("Attach", "BTD2DPlugin.cpp", 142, "m_callbackRunLoop == CFRunLoopGetMain()");
}

void sub_A2D4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Bluetooth transport is not supported\n", v0, 2u);
}

void sub_A31C()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceSupportsService failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_A38C()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceAddCallbacks failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_A3FC()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceGetDefault failed with error %d\n", v1, v2, v3, v4, v5);
}

void sub_A46C()
{
  sub_2664();
  sub_2648(&dword_0, &_os_log_default, v0, "Call to BTLocalDeviceGetModulePower failed with error %d\n", v1, v2, v3, v4, v5);
}

uint64_t BTDeviceConnectServices()
{
  return _BTDeviceConnectServices();
}

uint64_t BTDeviceGetAdvertisedValueForKey()
{
  return _BTDeviceGetAdvertisedValueForKey();
}

uint64_t BTDeviceMatchesAdvertisedKey()
{
  return _BTDeviceMatchesAdvertisedKey();
}

uint64_t BTDiscoveryAgentAddKey()
{
  return _BTDiscoveryAgentAddKey();
}

uint64_t BTDiscoveryAgentCreate()
{
  return _BTDiscoveryAgentCreate();
}

uint64_t BTDiscoveryAgentDestroy()
{
  return _BTDiscoveryAgentDestroy();
}

uint64_t BTDiscoveryAgentRemoveKey()
{
  return _BTDiscoveryAgentRemoveKey();
}

uint64_t BTDiscoveryAgentStartScanForAdvertizedData()
{
  return _BTDiscoveryAgentStartScanForAdvertizedData();
}

uint64_t BTDiscoveryAgentStopScan()
{
  return _BTDiscoveryAgentStopScan();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return _BTLocalDeviceAddCallbacks();
}

uint64_t BTLocalDeviceAdvertiseData()
{
  return _BTLocalDeviceAdvertiseData();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return _BTLocalDeviceGetConnectedDevices();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTLocalDeviceGetDiscoverable()
{
  return _BTLocalDeviceGetDiscoverable();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return _BTLocalDeviceGetModulePower();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return _BTLocalDeviceRemoveCallbacks();
}

uint64_t BTLocalDeviceRemoveData()
{
  return _BTLocalDeviceRemoveData();
}

uint64_t BTLocalDeviceSetConnectable()
{
  return _BTLocalDeviceSetConnectable();
}

uint64_t BTLocalDeviceSetDiscoverable()
{
  return _BTLocalDeviceSetDiscoverable();
}

uint64_t BTLocalDeviceSupportsService()
{
  return _BTLocalDeviceSupportsService();
}

uint64_t BTServiceAddCallbacksWithFilter()
{
  return _BTServiceAddCallbacksWithFilter();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
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
  return std::ios::~ios();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_call_unexpected(void *a1)
{
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
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

pid_t getpid(void)
{
  return _getpid();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}