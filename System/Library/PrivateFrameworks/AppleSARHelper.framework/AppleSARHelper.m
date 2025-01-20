BOOL AppleSARHelper::callUserClientMethod(AppleSARHelper *this, uint32_t a2, const unint64_t *a3, uint32_t a4, const void *a5, size_t a6, unint64_t *a7, unsigned int *a8, void *outputStruct, unint64_t a10)
{
  mach_port_t v10;
  kern_return_t v12;
  kern_return_t v13;
  NSObject *v14;
  BOOL result;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  uint8_t buf[4];
  uint32_t v21;
  __int16 v22;
  uint32_t v23;
  __int16 v24;
  kern_return_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x263EF8340];
  v10 = *((_DWORD *)this + 1);
  if (!v10)
  {
    v19 = GetOsLogContext()[1];
    result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    v16 = "Connection has not established yet!";
    v17 = v19;
    v18 = 2;
    goto LABEL_7;
  }
  v12 = IOConnectCallMethod(v10, a2, a3, a4, a5, a6, a7, a8, outputStruct, &a10);
  if (v12)
  {
    v13 = v12;
    v14 = GetOsLogContext()[1];
    result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 67109632;
    v21 = a2;
    v22 = 1024;
    v23 = a2;
    v24 = 1024;
    v25 = v13;
    v16 = "Failed to run the command for %d (0x%x): result: 0x%x";
    v17 = v14;
    v18 = 20;
LABEL_7:
    _os_log_error_impl(&dword_248674000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    return 0;
  }
  return 1;
}

char *sar::toStringAccessory(sar *this)
{
  unsigned int v1 = this;
  bzero(sar::toStringAccessory::retStr, 0x400uLL);
  uint64_t v2 = 0;
  unsigned int v3 = 0;
  do
  {
    if (((v1 >> v2) & 1) != 0 && v3 <= 0x3FE)
    {
      v4 = sar::toStringAccessory::accessoryStringArray[v2];
      size_t v5 = strlen(v4);
      memcpy(&sar::toStringAccessory::retStr[v3], v4, v5);
      v3 += strlen(v4);
    }
    ++v2;
  }
  while (v2 != 32);
  if (!v3) {
    return "Unknown Accessory";
  }
  result = sar::toStringAccessory::retStr;
  if (v3 <= 0x3FE) {
    sar::toStringAccessory::retStr[v3] = 0;
  }
  return result;
}

const char *sar::toString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown Mode";
  }
  else {
    return off_26523C2D0[(char)a1];
  }
}

{
  if (a1 > 2) {
    return "Unknown Region";
  }
  else {
    return off_26523C2F8[(char)a1];
  }
}

{
  if (a1 > 4) {
    return "Unknown TAS Mode";
  }
  else {
    return off_26523C310[(char)a1];
  }
}

uint64_t sar::toTASMode(sar *this, const char *a2)
{
  uint64_t result = strncmp("Periodic Budget", (const char *)this, 0xFuLL);
  if (result)
  {
    if (!strncmp("Default Budget", (const char *)this, 0xEuLL))
    {
      return 1;
    }
    else if (!strncmp("Limit Budget", (const char *)this, 0xCuLL))
    {
      return 2;
    }
    else if (!strncmp("Periodic Budget for Control Message", (const char *)this, 0x23uLL))
    {
      return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

const char *sar::toString(int a1)
{
  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Body";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Head";
  }
}

{
  const char *v1;

  unsigned int v1 = "Unknown";
  if (a1 == 1) {
    unsigned int v1 = "Non-Freespace";
  }
  if (a1) {
    return v1;
  }
  else {
    return "Freespace";
  }
}

void *AppleSARHelper::create_default_global@<X0>(void *a1@<X8>)
{
  unsigned int v3 = operator new(0x30uLL);
  *unsigned int v3 = 0u;
  v3[1] = 0u;
  *(_OWORD *)((char *)v3 + 28) = 0u;
  AppleSARHelper::init((io_connect_t *)v3);
  *a1 = v3;
  uint64_t result = operator new(0x20uLL);
  void *result = &unk_26FC715D8;
  result[1] = 0;
  result[2] = 0;
  result[3] = v3;
  a1[1] = result;
  return result;
}

void sub_248675194(_Unwind_Exception *a1)
{
  AppleSARHelper::~AppleSARHelper(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_2486751AC(_Unwind_Exception *a1)
{
  uint64_t v3 = v1[1];
  if (v3)
  {
    uint64_t v4 = v1[2];
    size_t v5 = (void *)v1[1];
    if (v4 != v3)
    {
      do
      {
        v6 = *(NSObject **)(v4 - 8);
        if (v6) {
          dispatch_release(v6);
        }
        v7 = *(const void **)(v4 - 16);
        if (v7) {
          _Block_release(v7);
        }
        v4 -= 16;
      }
      while (v4 != v3);
      size_t v5 = (void *)v1[1];
    }
    v1[2] = v3;
    operator delete(v5);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void AppleSARHelper::AppleSARHelper(AppleSARHelper *this)
{
  *(_OWORD *)((char *)this + 28) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  AppleSARHelper::init((io_connect_t *)this);
}

{
  *(_OWORD *)((char *)this + 28) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  AppleSARHelper::init((io_connect_t *)this);
}

void sub_248675250(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 + 8);
  if (v3)
  {
    uint64_t v4 = *(void *)(v1 + 16);
    size_t v5 = *(void **)(v1 + 8);
    if (v4 != v3)
    {
      do
      {
        v6 = *(NSObject **)(v4 - 8);
        if (v6) {
          dispatch_release(v6);
        }
        v7 = *(const void **)(v4 - 16);
        if (v7) {
          _Block_release(v7);
        }
        v4 -= 16;
      }
      while (v4 != v3);
      size_t v5 = *(void **)(v1 + 8);
    }
    *(void *)(v1 + 16) = v3;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void sub_2486752E4(_Unwind_Exception *a1)
{
  std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::~vector[abi:ne180100]((void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void AppleSARHelper::init(io_connect_t *this)
{
  kern_return_t v5;
  kern_return_t v6;
  NSObject *v7;
  io_object_t v8;
  NSObject *v9;
  const char *v10;
  dispatch_queue_t v11;
  NSObject *v12;
  IONotificationPort *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("AppleSARService");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  *this = MatchingService;
  if (MatchingService)
  {
    size_t v5 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, this + 1);
    if (v5)
    {
      v6 = v5;
      v7 = GetOsLogContext()[1];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v16 = 67109120;
        LODWORD(v17) = v6;
        _os_log_error_impl(&dword_248674000, v7, OS_LOG_TYPE_ERROR, "Failed to get the connection. ret: %u", (uint8_t *)&v16, 8u);
        v8 = *this;
        if (!*this) {
          return;
        }
      }
      else
      {
        v8 = *this;
        if (!*this) {
          return;
        }
      }
      if (IOObjectRelease(v8))
      {
        v9 = GetOsLogContext()[1];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          v10 = "Failed to relase the service!";
LABEL_10:
          _os_log_error_impl(&dword_248674000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 2u);
        }
      }
    }
    else
    {
      *((void *)this + 4) = 0;
      v11 = dispatch_queue_create("AppleSARHelperQueue", 0);
      if (v11)
      {
        v12 = v11;
        v13 = IONotificationPortCreate(v2);
        *((void *)this + 4) = v13;
        if (v13)
        {
          IONotificationPortSetDispatchQueue(v13, v12);
        }
        else
        {
          v15 = GetOsLogContext()[1];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = 136315138;
            v17 = "AppleSARSPMI";
            _os_log_error_impl(&dword_248674000, v15, OS_LOG_TYPE_ERROR, "Failed to find the notification for %s", (uint8_t *)&v16, 0xCu);
          }
        }
        dispatch_release(v12);
      }
      else
      {
        v14 = GetOsLogContext()[1];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16 = 136315138;
          v17 = "AppleSARSPMI";
          _os_log_error_impl(&dword_248674000, v14, OS_LOG_TYPE_ERROR, "Failed to create a queue for the notification for %s", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
  else
  {
    v9 = GetOsLogContext()[1];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      v10 = "Failed to create service!";
      goto LABEL_10;
    }
  }
}

void sub_24867556C(_Unwind_Exception *a1)
{
  dispatch_release(v1);
  _Unwind_Resume(a1);
}

void sub_248675580(_Unwind_Exception *a1)
{
  dispatch_release(v1);
  _Unwind_Resume(a1);
}

void **std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::~vector[abi:ne180100](void **a1)
{
  mach_port_t v2 = (char *)*a1;
  if (*a1)
  {
    CFDictionaryRef v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        size_t v5 = *((void *)v3 - 1);
        if (v5) {
          dispatch_release(v5);
        }
        v6 = (const void *)*((void *)v3 - 2);
        if (v6) {
          _Block_release(v6);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void AppleSARHelper::~AppleSARHelper(AppleSARHelper *this)
{
  mach_port_t v2 = (IONotificationPort *)*((void *)this + 4);
  if (v2)
  {
    IONotificationPortDestroy(v2);
    *((void *)this + 4) = 0;
    io_object_t v3 = *((_DWORD *)this + 10);
    if (v3)
    {
      IOObjectRelease(v3);
      *((_DWORD *)this + 10) = 0;
    }
  }
  io_connect_t v4 = *((_DWORD *)this + 1);
  if (v4 && IOServiceClose(v4) && (size_t v5 = GetOsLogContext()[1], os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_248674000, v5, OS_LOG_TYPE_ERROR, "Failed to close the connection!", buf, 2u);
    io_object_t v6 = *(_DWORD *)this;
    if (!*(_DWORD *)this) {
      goto LABEL_11;
    }
  }
  else
  {
    io_object_t v6 = *(_DWORD *)this;
    if (!*(_DWORD *)this) {
      goto LABEL_11;
    }
  }
  if (IOObjectRelease(v6))
  {
    v7 = GetOsLogContext()[1];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_248674000, v7, OS_LOG_TYPE_ERROR, "Failed to relase the service!", v13, 2u);
    }
  }
LABEL_11:
  uint64_t v8 = *((void *)this + 1);
  if (v8)
  {
    uint64_t v9 = *((void *)this + 2);
    v10 = (void *)*((void *)this + 1);
    if (v9 != v8)
    {
      do
      {
        v11 = *(NSObject **)(v9 - 8);
        if (v11) {
          dispatch_release(v11);
        }
        v12 = *(const void **)(v9 - 16);
        if (v12) {
          _Block_release(v12);
        }
        v9 -= 16;
      }
      while (v9 != v8);
      v10 = (void *)*((void *)this + 1);
    }
    *((void *)this + 2) = v8;
    operator delete(v10);
  }
}

void __clang_call_terminate(void *a1)
{
}

BOOL AppleSARHelper::getSPMIEventTrackingArray(uint64_t a1, void *outputStruct, size_t a3)
{
  kern_return_t v4;
  kern_return_t v5;
  NSObject *v6;
  BOOL result;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  size_t v12;
  uint8_t buf[4];
  kern_return_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x263EF8340];
  v12 = a3;
  mach_port_t v3 = *(_DWORD *)(a1 + 4);
  if (!v3)
  {
    v11 = GetOsLogContext()[1];
    uint64_t result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "Connection has not established yet!";
    uint64_t v9 = v11;
    v10 = 2;
    goto LABEL_7;
  }
  io_connect_t v4 = IOConnectCallMethod(v3, 0xAu, 0, 0, 0, 0, 0, 0, outputStruct, &v12);
  if (v4)
  {
    size_t v5 = v4;
    io_object_t v6 = GetOsLogContext()[1];
    uint64_t result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    v14 = v5;
    uint64_t v8 = "Failed to get SPMI Tracking List (ret: 0x%x)";
    uint64_t v9 = v6;
    v10 = 8;
LABEL_7:
    _os_log_error_impl(&dword_248674000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    return 0;
  }
  return 1;
}

BOOL AppleSARHelper::registerSARServiceCallback(uint64_t a1, uint64_t a2)
{
  kern_return_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void *v24;
  NSObject *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  unint64_t v30;
  char *v31;
  long long v32;
  char *v33;
  NSObject *v34;
  const void *v35;
  char *v36;
  BOOL v37;
  BOOL v38;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  double *v43;
  const double *v44;
  uint64_t v45;
  uint8_t buf[4];
  kern_return_t v47;
  uint64_t reference[2];
  uint64_t v49;
  unint64_t v50;
  long long v51;
  long long v52;
  uint64_t v53;
  float64x2x2_t v54;

  v53 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *(_DWORD *)(a1 + 4);
  if (v2)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v50 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    v51 = v5;
    v52 = v5;
    reference[1] = (uint64_t)AppleSARHelper::callback;
    v49 = a1;
    mach_port_t MachPort = IONotificationPortGetMachPort(*(IONotificationPortRef *)(a1 + 32));
    v7 = IOConnectCallAsyncScalarMethod(v2, 0x1Eu, MachPort, reference, 3u, 0, 0, 0, 0);
    uint64_t v8 = v7 == 0;
    if (v7)
    {
      uint64_t v9 = GetOsLogContext()[1];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v47 = v7;
        _os_log_error_impl(&dword_248674000, v9, OS_LOG_TYPE_ERROR, "Failed to setup callback: (ret: 0x%x)", buf, 8u);
      }
      return v8;
    }
    v13 = *(void **)(a1 + 16);
    v12 = *(void *)(a1 + 24);
    if ((unint64_t)v13 < v12)
    {
      v14 = *(void **)a2;
      if (*(void *)a2) {
        v14 = _Block_copy(v14);
      }
      *v13 = v14;
      v15 = *(NSObject **)(a2 + 8);
      v13[1] = v15;
      if (v15) {
        dispatch_retain(v15);
      }
      v16 = v13 + 2;
LABEL_43:
      *(void *)(a1 + 16) = v16;
      return v8;
    }
    v17 = *(void *)(a1 + 8);
    v18 = (char *)v13 - v17;
    v19 = ((uint64_t)v13 - v17) >> 4;
    if ((unint64_t)(v19 + 1) >> 60) {
      std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::__throw_length_error[abi:ne180100]();
    }
    v20 = v12 - v17;
    v21 = v20 >> 3;
    if (v20 >> 3 <= (unint64_t)(v19 + 1)) {
      v21 = v19 + 1;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
      v22 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      v22 = v21;
    }
    if (v22)
    {
      if (v22 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v23 = (char *)operator new(16 * v22);
      v24 = *(void **)a2;
      if (!*(void *)a2) {
        goto LABEL_27;
      }
    }
    else
    {
      v23 = 0;
      v24 = *(void **)a2;
      if (!*(void *)a2)
      {
LABEL_27:
        v25 = *(NSObject **)(a2 + 8);
        v26 = &v23[16 * v19];
        *(void *)v26 = v24;
        *((void *)v26 + 1) = v25;
        if (v25) {
          dispatch_retain(v25);
        }
        v27 = &v23[16 * v22];
        v16 = v26 + 16;
        v28 = *(char **)(a1 + 8);
        v29 = *(char **)(a1 + 16);
        if (v29 == v28)
        {
          *(void *)(a1 + 8) = v26;
          *(void *)(a1 + 16) = v16;
          *(void *)(a1 + 24) = v27;
        }
        else
        {
          v30 = v29 - v28 - 16;
          if (v30 < 0xD0) {
            goto LABEL_31;
          }
          v36 = &v29[-(v30 & 0xFFFFFFFFFFFFFFF0)];
          v37 = &v18[(void)v23 - 8 - (v30 & 0xFFFFFFFFFFFFFFF0)] >= v29 || v36 - 8 >= v26;
          v38 = !v37;
          if (v36 - 16 < &v18[(void)v23 - 8] && &v18[(void)v23 - (v30 & 0xFFFFFFFFFFFFFFF0) - 16] < v29 - 8) {
            goto LABEL_31;
          }
          if (v38) {
            goto LABEL_31;
          }
          v40 = (v30 >> 4) + 1;
          v41 = 16 * (v40 & 0x1FFFFFFFFFFFFFFELL);
          v31 = &v26[-v41];
          v42 = &v29[-v41];
          v43 = (double *)(v26 - 32);
          v44 = (const double *)(v29 - 32);
          v45 = v40 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            v54 = vld2q_f64(v44);
            vst2q_f64(v43, v54);
            *(_OWORD *)v44 = 0uLL;
            *((_OWORD *)v44 + 1) = 0uLL;
            v44 -= 4;
            v43 -= 4;
            v45 -= 2;
          }
          while (v45);
          v26 = v31;
          v29 = v42;
          if (v40 != (v40 & 0x1FFFFFFFFFFFFFFELL))
          {
LABEL_31:
            v31 = v26;
            do
            {
              v32 = *((_OWORD *)v29 - 1);
              v29 -= 16;
              *((_OWORD *)v31 - 1) = v32;
              v31 -= 16;
              *(void *)v29 = 0;
              *((void *)v29 + 1) = 0;
            }
            while (v29 != v28);
          }
          v29 = *(char **)(a1 + 8);
          v33 = *(char **)(a1 + 16);
          *(void *)(a1 + 8) = v31;
          *(void *)(a1 + 16) = v16;
          *(void *)(a1 + 24) = v27;
          while (v33 != v29)
          {
            v34 = *((void *)v33 - 1);
            if (v34) {
              dispatch_release(v34);
            }
            v35 = (const void *)*((void *)v33 - 2);
            if (v35) {
              _Block_release(v35);
            }
            v33 -= 16;
          }
        }
        if (v29) {
          operator delete(v29);
        }
        goto LABEL_43;
      }
    }
    v24 = _Block_copy(v24);
    goto LABEL_27;
  }
  v10 = GetOsLogContext()[1];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(reference[0]) = 0;
    _os_log_error_impl(&dword_248674000, v10, OS_LOG_TYPE_ERROR, "Connection has not established yet!", (uint8_t *)reference, 2u);
  }
  return 0;
}

void sub_248675C40(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void AppleSARHelper::callback(AppleSARHelper *this, void *a2, int *a3, unint64_t *a4)
{
  if (a2)
  {
    io_connect_t v4 = GetOsLogContext()[1];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(v15[0]) = 0;
    v14 = "Failed to process the callback!";
LABEL_31:
    _os_log_error_impl(&dword_248674000, v4, OS_LOG_TYPE_ERROR, v14, (uint8_t *)v15, 2u);
    return;
  }
  if (this)
  {
    if (a3)
    {
      uint64_t v6 = *((void *)this + 1);
      uint64_t v7 = *((void *)this + 2);
      if (v6 != v7)
      {
        int v8 = *a3;
        while (*(void *)v6)
        {
          uint64_t v9 = _Block_copy(*(const void **)v6);
          v10 = *(NSObject **)(v6 + 8);
          if (v10) {
            goto LABEL_11;
          }
LABEL_12:
          uint64_t v11 = *((void *)a3 + 2);
          if (v9) {
            v12 = _Block_copy(v9);
          }
          else {
            v12 = 0;
          }
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 1174405120;
          v15[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEclIJS2_S3_EEEvDpT__block_invoke;
          v15[3] = &__block_descriptor_tmp_0;
          if (v12) {
            v13 = _Block_copy(v12);
          }
          else {
            v13 = 0;
          }
          int v18 = v8;
          aBlock = v13;
          uint64_t v17 = v11;
          dispatch_async(v10, v15);
          if (aBlock) {
            _Block_release(aBlock);
          }
          if (v12) {
            _Block_release(v12);
          }
          if (v10) {
            dispatch_release(v10);
          }
          if (v9) {
            _Block_release(v9);
          }
          v6 += 16;
          if (v6 == v7) {
            return;
          }
        }
        uint64_t v9 = 0;
        v10 = *(NSObject **)(v6 + 8);
        if (!v10) {
          goto LABEL_12;
        }
LABEL_11:
        dispatch_retain(v10);
        goto LABEL_12;
      }
    }
    else
    {
      io_connect_t v4 = GetOsLogContext()[1];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15[0]) = 0;
        v14 = "Failed to fetch arguments!";
        goto LABEL_31;
      }
    }
  }
}

void std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_26523C1A0, MEMORY[0x263F8C060]);
}

void sub_248675EA0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_pointer<AppleSARHelper *,std::shared_ptr<AppleSARHelper>::__shared_ptr_default_delete<AppleSARHelper,AppleSARHelper>,std::allocator<AppleSARHelper>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<AppleSARHelper *,std::shared_ptr<AppleSARHelper>::__shared_ptr_default_delete<AppleSARHelper,AppleSARHelper>,std::allocator<AppleSARHelper>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(AppleSARHelper **)(a1 + 24);
  if (v1)
  {
    AppleSARHelper::~AppleSARHelper(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<AppleSARHelper *,std::shared_ptr<AppleSARHelper>::__shared_ptr_default_delete<AppleSARHelper,AppleSARHelper>,std::allocator<AppleSARHelper>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000248676C8FLL) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000248676C8FLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000248676C8FLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000248676C8FLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEclIJS2_S3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

void *__copy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t *GetOsLogContext(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B13FB80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B13FB80))
  {
    qword_26B13FBA0 = 0;
    qword_26B13FB98 = 0;
    __cxa_atexit(MEMORY[0x263F8BDA8], &qword_26B13FB98, &dword_248674000);
    __cxa_guard_release(&qword_26B13FB80);
  }
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
  return &qword_26B13FB98;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B13FB90, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B13FB90))
  {
    MEMORY[0x24C57A840](&unk_26B13FBA8);
    __cxa_atexit(MEMORY[0x263F8BDB0], &unk_26B13FBA8, &dword_248674000);
    __cxa_guard_release(&qword_26B13FB90);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1174405120;
  v5[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v5[3] = &__block_descriptor_tmp_3;
  mach_port_t v2 = (std::__shared_weak_count *)a1[1];
  v5[4] = *a1;
  uint64_t v6 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (qword_26B13FB88 == -1)
  {
    uint64_t v3 = v6;
    if (!v6) {
      return &unk_26B13FBA8;
    }
  }
  else
  {
    dispatch_once(&qword_26B13FB88, v5);
    uint64_t v3 = v6;
    if (!v6) {
      return &unk_26B13FBA8;
    }
  }
  if (atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return &unk_26B13FBA8;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return &unk_26B13FBA8;
}

void sub_2486762F0(_Unwind_Exception *a1)
{
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B13FB80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B13FB80))
  {
    qword_26B13FBA0 = 0;
    qword_26B13FB98 = 0;
    __cxa_atexit(MEMORY[0x263F8BDA8], &qword_26B13FB98, &dword_248674000);
    __cxa_guard_release(&qword_26B13FB80);
  }
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v5, (const ctu::OsLogContext *)&qword_26B13FB98);
  MEMORY[0x24C57A830](v6, v5, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  uint64_t v3 = v7;
  uint64_t v2 = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  io_connect_t v4 = (std::__shared_weak_count *)qword_26B13FBE0;
  qword_26B13FBD8 = v3;
  qword_26B13FBE0 = v2;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  MEMORY[0x24C57A850](v6);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v5);
}

void sub_248676458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F20](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x270F972E0](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x270F972F0]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x270F97300]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x270F97308](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x270F97448]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}