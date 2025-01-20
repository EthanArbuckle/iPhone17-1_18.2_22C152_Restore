void sub_2487E90F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AAXPCGetNextClientID()
{
  if (AAXPCGetNextClientID_sOnce != -1) {
    dispatch_once(&AAXPCGetNextClientID_sOnce, &__block_literal_global);
  }
  return atomic_fetch_add((atomic_uint *volatile)&AAXPCGetNextClientID_sNext, 1u) + 1;
}

uint64_t __AAXPCGetNextClientID_block_invoke()
{
  uint64_t result = RandomBytes();
  AAXPCGetNextClientID_sNext = (unsigned __int16)word_26B142CEA << 16;
  return result;
}

void sub_2487EA068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2487EE3E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2487EE650(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2487EFDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  (*(void (**)(uint64_t))(v12 + 16))(v12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_2487F0064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F0338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F0608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F08D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F36F4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_2487F3EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2487F3FE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2487F66C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2487F6B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F6F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F7398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F7714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F7B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F7FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F83E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F8818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F8B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F8FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F9408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F9840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487F9C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487FA188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487FA5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487FAA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487FAEE8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2487FB2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487FB688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487FBA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2487FBE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2487FCA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _btSessionEventHandler(uint64_t a1, int a2, int a3, void *a4)
{
  v8 = (void *)MEMORY[0x24C5812C0]();
  uint64_t v9 = a4;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v9 + 23));
  switch(a2)
  {
    case 0:
      int v10 = **((_DWORD **)v9 + 17);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      *((void *)v9 + 10) = a1;
      v9[89] = 0;
      if (v9[90]) {
        [v9 _btEnsureStarted];
      }
      else {
        [v9 _btEnsureStopped];
      }
      goto LABEL_38;
    case 1:
      int v12 = **((_DWORD **)v9 + 17);
      if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v17 = (a3 + 310000);
        LogPrintF();
      }
      *((void *)v9 + 10) = 0;
      v9[89] = 0;
      objc_msgSend(v9, "_btEnsureStopped", v17);
      if (!v9[96] || v9[91]) {
        goto LABEL_37;
      }
      int v15 = **((_DWORD **)v9 + 17);
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v9[96] = 0;
      [v9 _btEnsureStopped];
      goto LABEL_36;
    case 2:
      int v13 = **((_DWORD **)v9 + 17);
      if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      *((void *)v9 + 10) = 0;
      v9[89] = 0;
      int v16 = v9[90];
      [v9 _btEnsureStopped];
      if (v16) {
LABEL_36:
      }
        [v9 _btEnsureStarted];
LABEL_37:
      CFRelease(v9);
      goto LABEL_38;
    case 3:
      int v14 = **((_DWORD **)v9 + 17);
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize())) {
        goto LABEL_16;
      }
      goto LABEL_38;
    default:
      int v11 = **((_DWORD **)v9 + 17);
      if (v11 <= 40 && (v11 != -1 || _LogCategory_Initialize())) {
LABEL_16:
      }
        LogPrintF();
LABEL_38:

      return;
  }
}

void _btServiceEventHandler(uint64_t a1, unsigned char *a2, int a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int v12 = (void *)MEMORY[0x24C5812C0]();
  int v13 = a6;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v13 + 23));
  if (!*((unsigned char *)v13 + 88)) {
    goto LABEL_65;
  }
  if (a3 == 2)
  {
    int v15 = **((_DWORD **)v13 + 17);
    if (v15 > 30 || v15 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_65;
    }
    goto LABEL_16;
  }
  if (a3 == 1)
  {
    int v16 = **((_DWORD **)v13 + 17);
    if (v16 > 30 || v16 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_65;
    }
    goto LABEL_16;
  }
  if (a3)
  {
    int v17 = **((_DWORD **)v13 + 17);
    if (v17 > 30 || v17 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_65;
    }
LABEL_16:
    BTServiceSpecificEventToString(a4);
    goto LABEL_17;
  }
  int v14 = **((_DWORD **)v13 + 17);
  if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
  {
    v38 = BTServiceSpecificEventToString(a4);
    uint64_t v39 = (a5 + 310000);
    v36 = &unk_248812F40;
    uint64_t v37 = a4;
    unint64_t v35 = (unint64_t)a2;
    LogPrintF();
  }
  if (a4 != 11) {
    goto LABEL_65;
  }
  __s1[0] = 0;
  if (softLinkBTDeviceGetAddressString(a1, (uint64_t)__s1, 32))
  {
    int v33 = **((_DWORD **)v13 + 17);
    if (v33 > 90 || v33 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_65;
    }
LABEL_17:
    LogPrintF();
    goto LABEL_65;
  }
  if (strcmp(__s1, (const char *)v13 + 8))
  {
    int v34 = **((_DWORD **)v13 + 17);
    if (v34 > 30 || v34 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_65;
    }
    goto LABEL_17;
  }
  if (!a5)
  {
    v44[0] = 0;
    if (a1)
    {
      softLinkBTDeviceGetName(a1, (uint64_t)v44, 248);
      if (v44[0])
      {
        uint64_t v20 = [NSString stringWithUTF8String:v44];
        v21 = (void *)*((void *)v13 + 26);
        *((void *)v13 + 26) = v20;
      }
      uint64_t v43 = 0;
      int v42 = 0;
      softLinkBTDeviceGetDeviceId(a1, (uint64_t)&v43 + 4, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)(v13 + 40));
      uint64_t v41 = 0;
      int Default = softLinkBTAccessoryManagerGetDefault(*((void *)v13 + 10), (uint64_t)&v41);
      if (Default)
      {
        int v23 = Default;
        int v24 = **((_DWORD **)v13 + 17);
        if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
        {
          unint64_t v35 = (v23 + 310000);
          LogPrintF();
        }
      }
      if (v41)
      {
        int v40 = 0;
        int FeatureCapability = softLinkBTAccessoryManagerGetFeatureCapability(v41, a1, 26, (uint64_t)&v40);
        if (FeatureCapability)
        {
          int v29 = FeatureCapability;
          int v30 = **((_DWORD **)v13 + 17);
          if (v30 <= 60 && (v30 != -1 || _LogCategory_Initialize()))
          {
            unint64_t v35 = (v29 + 310000);
            LogPrintF();
          }
          BOOL v31 = 0;
        }
        else
        {
          BOOL v31 = v40 != 0;
        }
        *((unsigned char *)v13 + 157) = v31;
      }
    }
    int v32 = **((_DWORD **)v13 + 17);
    if (v32 <= 30 && (v32 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v35 = (unint64_t)v44;
      v36 = (void *)v13[40];
      LogPrintF();
    }
    *((unsigned char *)v13 + 41) = 0;
    v26 = v13;
    unint64_t v27 = 0;
    goto LABEL_64;
  }
  if (*((unsigned char *)v13 + 153))
  {
    unint64_t v18 = (a5 + 310000);
    int v19 = **((_DWORD **)v13 + 17);
    if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v35 = v18;
      LogPrintF();
    }
    *((unsigned char *)v13 + 41) = 0;
    v26 = v13;
    unint64_t v27 = v18;
LABEL_64:
    objc_msgSend(v26, "_completed:", v27, v35, v36, v37, v38, v39);
    goto LABEL_65;
  }
  int v25 = **((_DWORD **)v13 + 17);
  if (v25 <= 60 && (v25 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ((a5 - 151) <= 0xF && ((1 << (a5 + 105)) & 0x8081) != 0) {
    [v13 _btDeletePairingAndRetry];
  }
LABEL_65:
}

void _btPairingAgentStatusHandler(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  v7 = (void *)MEMORY[0x24C5812C0]();
  id v8 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v8 + 23));
  switch(a2)
  {
    case 0:
      int v9 = **((_DWORD **)v8 + 17);
      if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if (*((unsigned char *)v8 + 90))
      {
        *((unsigned char *)v8 + 72) = 1;
        [v8 _btEnsureStarted];
      }
      break;
    case 1:
      int v11 = **((_DWORD **)v8 + 17);
      if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize())) {
        goto LABEL_16;
      }
      break;
    case 2:
      int v12 = **((_DWORD **)v8 + 17);
      if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
        goto LABEL_16;
      }
      break;
    case 3:
      int v13 = **((_DWORD **)v8 + 17);
      if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize())) {
        goto LABEL_16;
      }
      break;
    default:
      int v10 = **((_DWORD **)v8 + 17);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
LABEL_16:
      }
        LogPrintF();
      break;
  }
}

void _btPairingAgentUserConfirmationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = (void *)MEMORY[0x24C5812C0]();
  id v9 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v9 + 23));
  __s1[0] = 0;
  if (softLinkBTDeviceGetAddressString(a2, (uint64_t)__s1, 32))
  {
    int v12 = **((_DWORD **)v9 + 17);
    if (v12 > 90 || v12 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_8;
    }
LABEL_14:
    LogPrintF();
    goto LABEL_8;
  }
  int v10 = strcmp(__s1, (const char *)v9 + 8);
  int v11 = **((_DWORD **)v9 + 17);
  if (v10)
  {
    if (v11 > 30 || v11 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  softLinkBTPairingAgentAcceptSSP(a1, a2, 0);
LABEL_8:
}

Class initWPClient()
{
  if (WirelessProximityLibrary_sOnce != -1) {
    dispatch_once(&WirelessProximityLibrary_sOnce, &__block_literal_global_0);
  }
  Class result = objc_getClass("WPClient");
  classWPClient = (uint64_t)result;
  getWPClientClass = (uint64_t (*)())WPClientFunction;
  return result;
}

id WPClientFunction()
{
  return (id)classWPClient;
}

void *__WirelessProximityLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/WirelessProximity.framework/WirelessProximity", 2);
  WirelessProximityLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initBTSessionAttachWithQueue(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = MobileBluetoothLibrary_sOnce;
  id v8 = a4;
  if (v7 != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  softLinkBTSessionAttachWithQueue = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTSessionAttachWithQueue");
  uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, id))softLinkBTSessionAttachWithQueue)(a1, a2, a3, v8);

  return v9;
}

uint64_t initBTServiceAddCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v6 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTServiceAddCallbacks");
  softLinkBTServiceAddCallbacks = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initBTDeviceAddressFromString(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v4 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceAddressFromString");
  softLinkBTDeviceAddressFromString = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initBTDeviceFromAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v6 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceFromAddress");
  softLinkBTDeviceFromAddress = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initBTDeviceGetAddressString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v6 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetAddressString");
  softLinkBTDeviceGetAddressString = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initBTDeviceGetPairingStatus(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v4 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetPairingStatus");
  softLinkBTDeviceGetPairingStatus = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initBTPairingAgentCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  id v8 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentCreate");
  softLinkBTPairingAgentCreate = v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

uint64_t initBTPairingAgentStart(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentStart");
  softLinkBTPairingAgentStart = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void *__MobileBluetoothLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/MobileBluetooth.framework/MobileBluetooth", 2);
  MobileBluetoothLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initBTDeviceConfigureLinkKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  id v8 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConfigureLinkKey");
  softLinkBTDeviceConfigureLinkKey = v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

uint64_t initBTDeviceConnectServicesWithParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  id v8 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServicesWithParameters");
  softLinkBTDeviceConnectServicesWithParameters = v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

uint64_t initBTDeviceConnectServices(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v4 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServices");
  softLinkBTDeviceConnectServices = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initBTDeviceDisconnect(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceDisconnect");
  softLinkBTDeviceDisconnect = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initBTPairingAgentCancelPairing(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentCancelPairing");
  softLinkBTPairingAgentCancelPairing = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initBTPairingAgentStop(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentStop");
  softLinkBTPairingAgentStop = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initBTPairingAgentDestroy(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentDestroy");
  softLinkBTPairingAgentDestroy = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initBTServiceRemoveCallbacks(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v4 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTServiceRemoveCallbacks");
  softLinkBTServiceRemoveCallbacks = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initBTSessionDetachWithQueue(uint64_t a1)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTSessionDetachWithQueue");
  softLinkBTSessionDetachWithQueue = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initBTPairingAgentDeletePairedDevice(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v4 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentDeletePairedDevice");
  softLinkBTPairingAgentDeletePairedDevice = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initBTPairingAgentAcceptSSP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v6 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTPairingAgentAcceptSSP");
  softLinkBTPairingAgentAcceptSSP = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

const char *BTServiceSpecificEventToString(int a1)
{
  if (a1 <= 500)
  {
    if (a1 <= 100)
    {
      if (a1 <= 1)
      {
        if (!a1) {
          return "BT_SERVICE_SDP";
        }
        if (a1 == 1) {
          return "BT_SERVICE_CONNECTION_ATTEMPT";
        }
      }
      else
      {
        switch(a1)
        {
          case 2:
            return "BT_SERVICE_DISCONNECTION_ATTEMPT";
          case 11:
            return "BT_SERVICE_CONNECTION_RESULT";
          case 12:
            return "BT_SERVICE_DISCONNECTION_RESULT";
        }
      }
    }
    else
    {
      if (a1 <= 201)
      {
        switch(a1)
        {
          case 'e':
            Class result = "BT_SERVICE_HANDSFREE_AUDIO_CONNECTED";
            break;
          case 'f':
            Class result = "BT_SERVICE_HANDSFREE_AUDIO_DISCONNECTED";
            break;
          case 'g':
            Class result = "BT_SERVICE_HANDSFREE_START_VOICE_COMMAND";
            break;
          case 'h':
            Class result = "BT_SERVICE_HANDSFREE_END_VOICE_COMMAND";
            break;
          default:
            if (a1 != 201) {
              return "?";
            }
            Class result = "BT_SERVICE_A2DP_AUDIO_CONNECTED";
            break;
        }
        return result;
      }
      if (a1 > 301)
      {
        if (a1 == 302) {
          return "BT_SERVICE_PHONE_BOOK_SEND_COMPLETE";
        }
        if (a1 == 303) {
          return "BT_SERVICE_PHONE_BOOK_SYNC_SUPPORTED";
        }
      }
      else
      {
        if (a1 == 202) {
          return "BT_SERVICE_A2DP_AUDIO_DISCONNECTED";
        }
        if (a1 == 301) {
          return "BT_SERVICE_PHONE_BOOK_SEND_INITIATED";
        }
      }
    }
    return "?";
  }
  switch(a1)
  {
    case 501:
      Class result = "BT_SERVICE_REMOTE_PLAY";
      break;
    case 502:
      Class result = "BT_SERVICE_REMOTE_PAUSE";
      break;
    case 503:
      Class result = "BT_SERVICE_REMOTE_STOP";
      break;
    case 504:
      Class result = "BT_SERVICE_REMOTE_PREVIOUS";
      break;
    case 505:
      Class result = "BT_SERVICE_REMOTE_NEXT";
      break;
    case 506:
      Class result = "BT_SERVICE_REMOTE_VOL_UP";
      break;
    case 507:
      Class result = "BT_SERVICE_REMOTE_VOL_DOWN";
      break;
    case 508:
      Class result = "BT_SERVICE_REMOTE_MUTE";
      break;
    case 509:
      Class result = "BT_SERVICE_REMOTE_FASTFORWARD_START";
      break;
    case 510:
      Class result = "BT_SERVICE_REMOTE_FASTFORWARD_STOP";
      break;
    case 511:
      Class result = "BT_SERVICE_REMOTE_REWIND_START";
      break;
    case 512:
      Class result = "BT_SERVICE_REMOTE_REWIND_STOP";
      break;
    default:
      if (a1 == 601)
      {
        Class result = "BT_SERVICE_SENSOR_RSSI";
      }
      else
      {
        if (a1 != 701) {
          return "?";
        }
        Class result = "BT_SERVICE_LMP_NAME_CHANGED";
      }
      break;
  }
  return result;
}

uint64_t initBTDeviceGetName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v6 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetName");
  softLinkBTDeviceGetName = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initBTDeviceGetDeviceId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  int v10 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceGetDeviceId");
  softLinkBTDeviceGetDeviceId = v10;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v10)(a1, a2, a3, a4, a5);
}

uint64_t initBTAccessoryManagerGetDefault(uint64_t a1, uint64_t a2)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  v4 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTAccessoryManagerGetDefault");
  softLinkBTAccessoryManagerGetint Default = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initBTAccessoryManagerGetFeatureCapability(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (MobileBluetoothLibrary_sOnce != -1) {
    dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_345);
  }
  id v8 = (uint64_t (*)())dlsym((void *)MobileBluetoothLibrary_sLib, "BTAccessoryManagerGetFeatureCapability");
  softLinkBTAccessoryManagerGetint FeatureCapability = v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
}

id BTErrorF()
{
  v0 = NSErrorV();

  return v0;
}

id BTNestedErrorF()
{
  v0 = NSErrorNestedV();

  return v0;
}

uint64_t BTXPCGetNextClientID()
{
  if (BTXPCGetNextClientID_sOnce != -1) {
    dispatch_once(&BTXPCGetNextClientID_sOnce, &__block_literal_global_1);
  }
  return atomic_fetch_add((atomic_uint *volatile)&BTXPCGetNextClientID_sNext, 1u) + 1;
}

uint64_t __BTXPCGetNextClientID_block_invoke()
{
  uint64_t result = RandomBytes();
  BTXPCGetNextClientID_sNext = (unsigned __int16)word_26932CA02 << 16;
  return result;
}

void sub_248808E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24880BC70(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_24880C7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24880CBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24880D020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24880D45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24880D89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24880DCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CBErrorF()
{
  return MEMORY[0x270EE4168]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x270F23F20]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x270F23FA8]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x270F23FC0]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x270F23FC8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x270F23FD0]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x270F23FE8]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x270F23FF8]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x270F24030]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x270F24048]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x270F24060]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x270F24070]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x270F24090]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x270F24148]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x270F24178]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x270F243D0]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x270F243D8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x270F24400]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x270F24450]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x270F24458]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x270F24468]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x270F24470]();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return MEMORY[0x270F24478]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x270F24490]();
}

uint64_t NSErrorNestedV()
{
  return MEMORY[0x270F244A8]();
}

uint64_t NSErrorV()
{
  return MEMORY[0x270F244B8]();
}

uint64_t NSPrintF_safe()
{
  return MEMORY[0x270F244D0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t RandomBytes()
{
  return MEMORY[0x270F24630]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x270EDBE38]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x270EDC030]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
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

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}