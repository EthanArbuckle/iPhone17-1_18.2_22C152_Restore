void sub_21F6E9374(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DAXPCEncodeNSArrayOfCBUUID(void *a1, const char *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  if (v6)
  {
    xpc_object_t v7 = xpc_array_create(0, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "data", (void)v15);
          id v13 = objc_claimAutoreleasedReturnValue();
          xpc_object_t v14 = xpc_data_create((const void *)[v13 bytes], objc_msgSend(v13, "length"));
          xpc_array_append_value(v7, v14);

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    xpc_dictionary_set_value(v5, a2, v7);
  }
}

uint64_t DAXPCDecodeNSArrayOfCBUUID(void *a1, const char *a2, id *a3, void *a4)
{
  id v7 = a1;
  uint64_t v8 = xpc_dictionary_get_value(v7, a2);
  uint64_t v9 = (void *)v8;
  if (!v8) {
    goto LABEL_9;
  }
  if (MEMORY[0x223C529E0](v8) == MEMORY[0x263EF86D8])
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __DAXPCDecodeNSArrayOfCBUUID_block_invoke;
    applier[3] = &unk_2645202F0;
    applier[5] = &v15;
    applier[6] = a2;
    applier[4] = v11;
    xpc_array_apply(v9, applier);
    uint64_t v12 = (void *)v16[5];
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      objc_storeStrong(a3, v11);
    }

    _Block_object_dispose(&v15, 8);
    if (v12) {
      goto LABEL_8;
    }
LABEL_9:
    uint64_t v10 = 1;
    goto LABEL_10;
  }
  if (!a4)
  {
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  NSErrorF_safe();
  uint64_t v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

void sub_21F6EA524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

uint64_t __DAXPCDecodeNSArrayOfCBUUID_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x223C529E0]() == MEMORY[0x263EF86F8]
    && (size_t length = xpc_data_get_length(v4), length <= 0x10)
    && ((1 << length) & 0x10014) != 0)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:xpc_data_get_bytes_ptr(v4) length:length];
    id v7 = [MEMORY[0x263EFEF88] UUIDWithData:v6];
    [*(id *)(a1 + 32) addObject:v7];

    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = NSErrorF_safe();
    uint64_t v8 = 0;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  return v8;
}

__CFString *DADeviceFlagsToString(__int16 a1)
{
  if ((a1 & 2) != 0)
  {
    CUAppendF();
    v2 = (__CFString *)0;
    if ((a1 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v2 = 0;
  if ((a1 & 4) != 0)
  {
LABEL_5:
    CUAppendF();
    v3 = v2;

    v2 = v3;
  }
LABEL_6:
  if ((a1 & 8) != 0)
  {
    CUAppendF();
    uint64_t v8 = v2;

    v2 = v8;
    if ((a1 & 0x10) == 0)
    {
LABEL_8:
      if ((a1 & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_21;
    }
  }
  else if ((a1 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  CUAppendF();
  uint64_t v9 = v2;

  v2 = v9;
  if ((a1 & 0x20) == 0)
  {
LABEL_9:
    if ((a1 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  CUAppendF();
  uint64_t v10 = v2;

  v2 = v10;
  if ((a1 & 0x40) == 0)
  {
LABEL_10:
    if ((a1 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  CUAppendF();
  id v11 = v2;

  v2 = v11;
  if ((a1 & 0x80) == 0)
  {
LABEL_11:
    if ((a1 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  CUAppendF();
  uint64_t v12 = v2;

  v2 = v12;
  if ((a1 & 0x100) == 0)
  {
LABEL_12:
    if ((a1 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_24:
  CUAppendF();
  id v13 = v2;

  v2 = v13;
  if ((a1 & 0x200) != 0)
  {
LABEL_13:
    CUAppendF();
    id v4 = v2;

    v2 = v4;
  }
LABEL_14:
  id v5 = &stru_26D120818;
  if (v2) {
    id v5 = v2;
  }
  id v6 = v5;

  return v6;
}

__CFString *DADeviceAccessorySetupOptionsToString(char a1)
{
  if (a1)
  {
    CUAppendF();
    v2 = (__CFString *)0;
    if ((a1 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v2 = 0;
  if ((a1 & 2) != 0)
  {
LABEL_5:
    CUAppendF();
    v3 = v2;

    v2 = v3;
  }
LABEL_6:
  id v4 = @"None";
  if (v2) {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

__CFString *DADeviceProtocolTypeToString(uint64_t a1)
{
  v1 = @"?";
  if (a1 == 1) {
    v1 = @"DIAL";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Invalid";
  }
}

__CFString *DADeviceTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return @"?";
  }
  else {
    return off_264520388[a1];
  }
}

__CFString *DADeviceStateToString(uint64_t a1)
{
  if (a1 > 19)
  {
    if (a1 > 27)
    {
      if (a1 == 28) {
        return @"Unauthorized";
      }
      if (a1 == 30) {
        return @"Invalidating";
      }
    }
    else
    {
      if (a1 == 20) {
        return @"Activated";
      }
      if (a1 == 25) {
        return @"Authorized";
      }
    }
    return @"?";
  }
  if (!a1) {
    return @"Invalid";
  }
  if (a1 != 5)
  {
    if (a1 == 10) {
      return @"Activating";
    }
    return @"?";
  }
  return @"Found";
}

__CFString *DADeviceMediaPlaybackStateToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"?";
  }
  else {
    return off_264520370[a1];
  }
}

void sub_21F6EDBE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
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

void sub_21F6EE358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_21F6EFA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F6EFC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6F1610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void _resolveSRVCallack(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, void *a11)
{
  v40[134] = *MEMORY[0x263EF8340];
  id v16 = a11;
  uint64_t v17 = [v16 endpoint];
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    long long v18 = CUPrintErrorCode();
    [v17 identifier];
    v38 = v37 = v18;
    uint64_t v35 = a3;
    uint64_t v36 = a2;
    uint64_t v34 = a5;
    LogPrintF();
  }
  if ((a2 & 2) != 0)
  {
    v19 = [v16 resolver];
    id v20 = [v19 resolveOperations];
    [v20 removeObject:v16];

    [v16 invalidate];
    if (!a4 && a8 >= 7)
    {
      uint64_t v21 = a9 + 6;
      unsigned int v22 = *(unsigned __int8 *)(a9 + 6);
      if (!*(unsigned char *)(a9 + 6))
      {
        v24 = (char *)v40;
        char v39 = 46;
        goto LABEL_24;
      }
      uint64_t v23 = 0;
      v24 = &v39;
      uint64_t v25 = a9 + 6;
      while (1)
      {
        if (v23 + 1 + (unint64_t)v22 > 0xFE || v22 > 0x3F)
        {
LABEL_25:
          v32 = objc_msgSend(NSString, "stringWithUTF8String:", &v39, v34, v35, v36, v37, v38);
          [v17 setBonjourHostname:v32];

          [v19 _startResolvingHostname:&v39 interfaceIndex:a3 endpoint:v17];
          v33 = [v19 coalescer];
          [v33 trigger];

          break;
        }
        unint64_t v26 = v22 + v25 + 1;
        v27 = (unsigned __int8 *)(v25 + 1);
        do
        {
          unsigned int v29 = *v27++;
          unsigned int v28 = v29;
          if (v29 == 92 || v28 == 46)
          {
            *v24++ = 92;
LABEL_16:
            v30 = v24;
            goto LABEL_17;
          }
          if (v28 > 0x20) {
            goto LABEL_16;
          }
          *(_WORD *)v24 = 12380;
          unsigned int v31 = (205 * v28) >> 11;
          v30 = v24 + 3;
          v24[2] = v31 | 0x30;
          LOBYTE(v2_Block_object_dispose(&STACK[0x230], 8) = (v28 - 10 * v31) | 0x30;
LABEL_17:
          char *v30 = v28;
          v24 = v30 + 1;
        }
        while ((unint64_t)v27 < v26);
        v30[1] = 0;
        v23 += 1 + *(unsigned __int8 *)(v21 + v23);
        v24 = v30 + 2;
        v30[1] = 46;
        uint64_t v25 = v21 + v23;
        unsigned int v22 = *(unsigned __int8 *)(v21 + v23);
        if (!*(unsigned char *)(v21 + v23))
        {
LABEL_24:
          char *v24 = 0;
          goto LABEL_25;
        }
      }
    }
  }
}

void _resolveHostnameCallback(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v11 = a8;
  uint64_t v12 = [v11 endpoint];
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = NSPrintF();
    xpc_object_t v14 = CUPrintErrorCode();
    v19 = objc_msgSend(v12, "identifier", a6);
    LogPrintF();
  }
  if ((a2 & 2) != 0)
  {
    uint64_t v15 = [v11 resolver];
    id v16 = [v15 resolveOperations];
    [v16 removeObject:v11];

    [v11 invalidate];
    if (!a4 && a6)
    {
      v20[0] = 0;
      SockAddrToString();
      uint64_t v17 = [NSString stringWithUTF8String:v20];
      [v12 setIpv4String:v17];

      long long v18 = [v15 coalescer];
      [v18 trigger];
    }
  }
}

void sub_21F6F3090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
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

void _responseCallback(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock(&gDAUserAlertMutex);
  id v4 = (void *)gDAUserAlertMap;
  id v5 = [NSNumber numberWithLong:a1];
  id v6 = [v4 objectForKeyedSubscript:v5];

  pthread_mutex_unlock(&gDAUserAlertMutex);
  [v6 _responseCallback:a1 responseFlags:a2];
}

void sub_21F6F7354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  (*(void (**)(uint64_t))(v35 + 16))(v35);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_21F6F84DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6FB394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *DAErrorCodeToString(uint64_t a1)
{
  switch(a1)
  {
    case 350000:
      result = @"DAErrorCodeUnknown";
      break;
    case 350001:
      result = @"DAErrorCodeBadParameter";
      break;
    case 350002:
      result = @"DAErrorCodeUnsupported";
      break;
    case 350003:
      result = @"DAErrorCodeTimeout";
      break;
    case 350004:
      result = @"DAErrorCodeInternal";
      break;
    case 350005:
      result = @"DAErrorCodeMissingEntitlement";
      break;
    case 350006:
      result = @"DAErrorCodePermission";
      break;
    case 350007:
      result = @"DAErrorCodeFileError";
      break;
    case 350008:
      result = @"DAErrorCodeBluetoothError";
      break;
    case 350009:
      result = @"DAErrorCodeInvalidBluetoothDevice";
      break;
    case 350010:
      result = @"DAErrorCodeBluetoothPairingFailed";
      break;
    case 350011:
      result = @"DAErrorCodePersistBTDeviceInvalidAction";
      break;
    case 350012:
      result = @"DAErrorCodeBTDisconnected";
      break;
    case 350013:
      result = @"DAErrorCodeBTConnectError";
      break;
    case 350014:
      result = @"DAErrorCodeBTTaskCancelled";
      break;
    case 350015:
      result = @"DAErrorCodeBTScanLost";
      break;
    case 350016:
      result = @"DAErrorCodeBTReset";
      break;
    default:
      if (a1) {
        result = @"?";
      }
      else {
        result = @"DAErrorCodeSuccess";
      }
      break;
  }
  return result;
}

id DAErrorF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = [NSString stringWithUTF8String:a2];
  uint64_t v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
  id v12 = objc_alloc(MEMORY[0x263F087E8]);
  id v16 = @"cuErrorMsg";
  v17[0] = v11;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  xpc_object_t v14 = (void *)[v12 initWithDomain:@"DAErrorDomain" code:a1 userInfo:v13];

  return v14;
}

id DANestedErrorF(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = [NSString stringWithUTF8String:a3];
  uint64_t v13 = (void *)[[NSString alloc] initWithFormat:v12 arguments:&a9];
  id v14 = v11;
  id v15 = objc_alloc(MEMORY[0x263F087E8]);
  if (v14)
  {
    uint64_t v16 = *MEMORY[0x263F08608];
    v26[0] = @"cuErrorMsg";
    v26[1] = v16;
    v27[0] = v13;
    v27[1] = v14;
    uint64_t v17 = NSDictionary;
    long long v18 = (void **)v27;
    v19 = (__CFString **)v26;
    uint64_t v20 = 2;
  }
  else
  {
    v24 = @"cuErrorMsg";
    uint64_t v25 = v13;
    uint64_t v17 = NSDictionary;
    long long v18 = &v25;
    v19 = &v24;
    uint64_t v20 = 1;
  }
  uint64_t v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
  unsigned int v22 = (void *)[v15 initWithDomain:@"DAErrorDomain" code:a2 userInfo:v21];

  return v22;
}

__CFString *DAEventTypeToString(uint64_t a1)
{
  if (a1 <= 29)
  {
    if (a1 > 14)
    {
      if (a1 == 15) {
        return @"AccessorySetupMigrated";
      }
      if (a1 == 20) {
        return @"Invalidated";
      }
    }
    else
    {
      if (!a1) {
        return @"Unknown";
      }
      if (a1 == 10) {
        return @"Activated";
      }
    }
    return @"?";
  }
  if (a1 > 49)
  {
    switch(a1)
    {
      case '2':
        return @"DevicesPresentChanged";
      case '7':
        return @"DAEventTypeBluetoothPairingRequest";
      case '<':
        return @"XPCInterrupted";
    }
    return @"?";
  }
  switch(a1)
  {
    case 30:
      result = @"SessionStarted";
      break;
    case 31:
      result = @"SessionEnded";
      break;
    case 32:
      result = @"SessionError";
      break;
    case 40:
      result = @"DeviceFound";
      break;
    case 41:
      result = @"DeviceLost";
      break;
    case 42:
      result = @"DeviceChanged";
      break;
    default:
      return @"?";
  }
  return result;
}

void sub_21F7013C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose((const void *)(v10 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_21F701C68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F70264C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F702B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F703000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F703F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initCBDiscovery()
{
  if (CoreBluetoothLibrary_sOnce != -1) {
    dispatch_once(&CoreBluetoothLibrary_sOnce, &__block_literal_global_2);
  }
  Class result = objc_getClass("CBDiscovery");
  classCBDiscovery = (uint64_t)result;
  getCBDiscoveryClass = (uint64_t (*)())CBDiscoveryFunction;
  return result;
}

id CBDiscoveryFunction()
{
  return (id)classCBDiscovery;
}

void *__CoreBluetoothLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/CoreBluetooth.framework/CoreBluetooth", 2);
  CoreBluetoothLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t DADevice.networkEndpoint.getter@<X0>(uint64_t a1@<X8>)
{
  if (objc_msgSend(v1, sel_networkEndpoint))
  {
    return sub_21F70ACA8();
  }
  else
  {
    uint64_t v4 = sub_21F70AC98();
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    return v5(a1, 1, 1, v4);
  }
}

uint64_t sub_21F708648@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  if (objc_msgSend(*a1, sel_networkEndpoint))
  {
    return sub_21F70ACA8();
  }
  else
  {
    uint64_t v4 = sub_21F70AC98();
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    return v5(a2, 1, 1, v4);
  }
}

uint64_t sub_21F7086EC(uint64_t a1, void **a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE63D8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - v7;
  sub_21F709150(a1, (uint64_t)&v14 - v7, &qword_267EE63D8);
  uint64_t v9 = *a2;
  sub_21F709150((uint64_t)v8, (uint64_t)v6, &qword_267EE63D8);
  uint64_t v10 = sub_21F70AC98();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_21F7091B4((uint64_t)v6, &qword_267EE63D8);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = sub_21F70AC88();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  objc_msgSend(v9, sel_setNetworkEndpoint_, v12);
  swift_unknownObjectRelease();
  return sub_21F7091B4((uint64_t)v8, &qword_267EE63D8);
}

uint64_t DADevice.networkEndpoint.setter(uint64_t a1)
{
  v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE63D8);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F709150(a1, (uint64_t)v6, &qword_267EE63D8);
  uint64_t v7 = sub_21F70AC98();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_21F7091B4((uint64_t)v6, &qword_267EE63D8);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = sub_21F70AC88();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  objc_msgSend(v2, sel_setNetworkEndpoint_, v9);
  swift_unknownObjectRelease();
  return sub_21F7091B4(a1, &qword_267EE63D8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void (*DADevice.networkEndpoint.modify(void *a1))(uint64_t *a1, char a2)
{
  v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  size_t v5 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EE63D8) - 8) + 64);
  v4[1] = malloc(v5);
  v4[2] = malloc(v5);
  v4[3] = malloc(v5);
  id v6 = malloc(v5);
  v4[4] = v6;
  if (objc_msgSend(v2, sel_networkEndpoint))
  {
    sub_21F70ACA8();
  }
  else
  {
    uint64_t v7 = sub_21F70AC98();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  }
  return sub_21F708B28;
}

void sub_21F708B28(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void *)(v2 + 8);
    uint64_t v4 = *(void *)(v2 + 16);
    sub_21F709150(v3, v4, &qword_267EE63D8);
    sub_21F709150(v4, v5, &qword_267EE63D8);
    uint64_t v6 = sub_21F70AC98();
    uint64_t v7 = *(void *)(v6 - 8);
    int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    uint64_t v9 = *(void *)(v2 + 8);
    if (v8 == 1)
    {
      sub_21F7091B4(*(void *)(v2 + 8), &qword_267EE63D8);
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = sub_21F70AC88();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
    }
    uint64_t v18 = *(void **)(v2 + 24);
    uint64_t v17 = *(void **)(v2 + 32);
    uint64_t v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v10);
    swift_unknownObjectRelease();
    sub_21F7091B4((uint64_t)v19, &qword_267EE63D8);
  }
  else
  {
    uint64_t v11 = *(void *)(v2 + 24);
    sub_21F709150(v3, v11, &qword_267EE63D8);
    uint64_t v12 = sub_21F70AC98();
    uint64_t v13 = *(void *)(v12 - 8);
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    uint64_t v15 = *(void *)(v2 + 24);
    if (v14 == 1)
    {
      sub_21F7091B4(*(void *)(v2 + 24), &qword_267EE63D8);
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = sub_21F70AC88();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
    }
    uint64_t v18 = *(void **)(v2 + 24);
    uint64_t v17 = *(void **)(v2 + 32);
    uint64_t v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v16);
    swift_unknownObjectRelease();
  }
  sub_21F7091B4((uint64_t)v17, &qword_267EE63D8);
  free(v17);
  free(v18);
  free(v19);
  free(v20);

  free((void *)v2);
}

uint64_t DADevice.txtRecord.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_txtRecordData);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_21F70AC48();

    sub_21F70ACD8();
    uint64_t v5 = sub_21F70ACC8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_21F70ACC8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t sub_21F708E58@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_txtRecordData);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_21F70AC48();

    sub_21F70ACD8();
    uint64_t v5 = sub_21F70ACC8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_21F70ACC8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a2;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t sub_21F708F3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE63E0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F709150(a1, (uint64_t)v4, &qword_267EE63E0);
  return DADevice.txtRecord.setter((uint64_t)v4);
}

uint64_t DADevice.txtRecord.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE63E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F709150(a1, (uint64_t)v6, &qword_267EE63E0);
  uint64_t v7 = sub_21F70ACC8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_21F7091B4((uint64_t)v6, &qword_267EE63E0);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_21F70ACB8();
    unint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    uint64_t v9 = (void *)sub_21F70AC38();
    sub_21F709210(v10, v12);
  }
  objc_msgSend(v2, sel_setTxtRecordData_, v9);

  return sub_21F7091B4(a1, &qword_267EE63E0);
}

uint64_t sub_21F709150(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21F7091B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21F709210(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

void (*DADevice.txtRecord.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  size_t v5 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EE63E0) - 8) + 64);
  v4[1] = malloc(v5);
  v4[2] = malloc(v5);
  v4[3] = malloc(v5);
  uint64_t v6 = malloc(v5);
  v4[4] = v6;
  id v7 = objc_msgSend(v2, sel_txtRecordData);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_21F70AC48();

    sub_21F70ACD8();
    uint64_t v9 = sub_21F70ACC8();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_21F70ACC8();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  }
  return sub_21F7093D0;
}

void sub_21F7093D0(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void *)(v2 + 8);
    uint64_t v4 = *(void *)(v2 + 16);
    sub_21F709150(v3, v4, &qword_267EE63E0);
    sub_21F709150(v4, v5, &qword_267EE63E0);
    uint64_t v6 = sub_21F70ACC8();
    uint64_t v7 = *(void *)(v6 - 8);
    int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    uint64_t v9 = *(void *)(v2 + 8);
    if (v8 == 1)
    {
      sub_21F7091B4(*(void *)(v2 + 8), &qword_267EE63E0);
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v17 = sub_21F70ACB8();
      unint64_t v19 = v18;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v10 = (void *)sub_21F70AC38();
      sub_21F709210(v17, v19);
    }
    uint64_t v21 = *(void **)(v2 + 24);
    uint64_t v20 = *(void **)(v2 + 32);
    uint64_t v23 = *(void **)(v2 + 8);
    unsigned int v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v10);

    sub_21F7091B4((uint64_t)v22, &qword_267EE63E0);
  }
  else
  {
    uint64_t v11 = *(void *)(v2 + 24);
    sub_21F709150(v3, v11, &qword_267EE63E0);
    uint64_t v12 = sub_21F70ACC8();
    uint64_t v13 = *(void *)(v12 - 8);
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    uint64_t v15 = *(void *)(v2 + 24);
    if (v14 == 1)
    {
      sub_21F7091B4(*(void *)(v2 + 24), &qword_267EE63E0);
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v24 = sub_21F70ACB8();
      unint64_t v26 = v25;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v16 = (void *)sub_21F70AC38();
      sub_21F709210(v24, v26);
    }
    uint64_t v21 = *(void **)(v2 + 24);
    uint64_t v20 = *(void **)(v2 + 32);
    uint64_t v23 = *(void **)(v2 + 8);
    unsigned int v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v16);
  }
  sub_21F7091B4((uint64_t)v20, &qword_267EE63E0);
  free(v20);
  free(v21);
  free(v22);
  free(v23);

  free((void *)v2);
}

uint64_t sub_21F709654()
{
  uint64_t v0 = sub_21F70AC78();
  __swift_allocate_value_buffer(v0, qword_267EE63E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE63E8);
  return sub_21F70AC68();
}

id sub_21F7096D4(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_21F709708(a1);
}

id sub_21F709708(uint64_t a1)
{
  *(void *)&v1[qword_267EE64E0] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v3, sel_init);
}

void sub_21F709788()
{
}

void sub_21F7097B4(void *a1)
{
  id v1 = a1;
  sub_21F709788();
}

void sub_21F7097FC()
{
}

void sub_21F709828(void *a1)
{
  id v1 = a1;
  sub_21F7097FC();
}

id sub_21F70987C(uint64_t a1)
{
  return sub_21F70A7EC(a1);
}

void sub_21F7098A8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_21F70987C((uint64_t)v4);
}

void sub_21F709910()
{
}

id sub_21F709954()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21F7099C8()
{
  return swift_release();
}

uint64_t sub_21F7099D8()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_21F7099E0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_21F7099E8(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_21F7099F4(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t DADiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  DADiscoveryExtensionConfiguration.init(discoveryExtension:)(a1);
  return v2;
}

uint64_t DADiscoveryExtensionConfiguration.init(discoveryExtension:)(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  if (qword_267EE63D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21F70AC78();
  __swift_project_value_buffer(v4, (uint64_t)qword_267EE63E8);
  id v5 = sub_21F70AC58();
  os_log_type_t v6 = sub_21F70ACE8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_21F6E6000, v5, v6, "DA config init", v7, 2u);
    MEMORY[0x223C527D0](v7, -1, -1);
  }

  *(void *)(v2 + 16) = -1;
  *(void *)(v2 + 24) = a1;
  return v2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_21F709B70(void *a1)
{
  uint64_t v2 = v1;
  if (qword_267EE63D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21F70AC78();
  __swift_project_value_buffer(v4, (uint64_t)qword_267EE63E8);
  id v5 = a1;
  os_log_type_t v6 = sub_21F70AC58();
  os_log_type_t v7 = sub_21F70AD08();
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v8 = 67109120;
    LODWORD(v28[0]) = objc_msgSend(v5, sel_processIdentifier);
    sub_21F70AD18();

    _os_log_impl(&dword_21F6E6000, v6, v7, "XPC connection started: PID %d", v8, 8u);
    MEMORY[0x223C527D0](v8, -1, -1);

    uint64_t v9 = *(void **)(v1 + 40);
    if (!v9) {
      goto LABEL_11;
    }
  }
  else
  {

    uint64_t v9 = *(void **)(v1 + 40);
    if (!v9) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = v5;
  id v11 = v9;
  uint64_t v12 = sub_21F70AC58();
  os_log_type_t v13 = sub_21F70AD08();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 67109376;
    LODWORD(v28[0]) = objc_msgSend(v11, sel_processIdentifier);
    sub_21F70AD18();
    *(_WORD *)(v14 + _Block_object_dispose(&STACK[0x230], 8) = 1024;
    LODWORD(v28[0]) = [v10 processIdentifier];
    sub_21F70AD18();

    _os_log_impl(&dword_21F6E6000, v12, v13, "XPC connection replacing: PID %d -> PID %d", (uint8_t *)v14, 0xEu);
    MEMORY[0x223C527D0](v14, -1, -1);
  }
  else
  {

    uint64_t v12 = v10;
  }

  objc_msgSend(v11, sel_invalidate);
  uint64_t v15 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

LABEL_11:
  uint64_t v16 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v5;
  id v17 = v5;

  unint64_t v18 = self;
  id v19 = objc_msgSend(v18, sel_interfaceWithProtocol_, &unk_26D12A748);
  objc_msgSend(v17, sel_setExportedInterface_, v19);

  uint64_t v20 = (objc_class *)type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject();
  swift_retain();
  id v21 = objc_allocWithZone(v20);
  id v22 = sub_21F709708(v2);
  objc_msgSend(v17, sel_setExportedObject_, v22);

  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v2;
  *(void *)(v23 + 24) = v17;
  v28[4] = sub_21F70AA08;
  v28[5] = v23;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 1107296256;
  v28[2] = sub_21F709FC8;
  v28[3] = &block_descriptor;
  uint64_t v24 = _Block_copy(v28);
  id v25 = v17;
  swift_retain();
  swift_release();
  objc_msgSend(v25, sel_setInvalidationHandler_, v24);
  _Block_release(v24);
  id v26 = objc_msgSend(v18, sel_interfaceWithProtocol_, &unk_26D128920);
  objc_msgSend(v25, sel_setRemoteObjectInterface_, v26);

  objc_msgSend(v25, sel_resume);
  return 1;
}

uint64_t sub_21F709FC8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_21F70A00C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_267EE63D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21F70AC78();
  __swift_project_value_buffer(v4, (uint64_t)qword_267EE63E8);
  id v5 = a1;
  os_log_type_t v6 = sub_21F70AC58();
  os_log_type_t v7 = sub_21F70AD08();
  if (!os_log_type_enabled(v6, v7))
  {

    uint64_t v9 = (void *)v2[4];
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v8 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)int v8 = 67109120;
  objc_msgSend(v5, sel_processIdentifier);
  sub_21F70AD18();

  _os_log_impl(&dword_21F6E6000, v6, v7, "XPC connection ended: PID %d", v8, 8u);
  MEMORY[0x223C527D0](v8, -1, -1);

  uint64_t v9 = (void *)v2[4];
  if (v9)
  {
LABEL_7:
    uint64_t v10 = (void *)v2[3];
    id v11 = v9;
    objc_msgSend(v10, sel_stopDiscoveryWithSession_, v11);
    objc_msgSend(v11, sel_invalidate);

    uint64_t v9 = (void *)v2[4];
  }
LABEL_8:
  v2[4] = 0;

  uint64_t v12 = (void *)v2[5];
  v2[5] = 0;

  uint64_t result = v2[2];
  if (result != -1) {
    return sandbox_extension_release();
  }
  return result;
}

void sub_21F70A1CC()
{
  if (qword_267EE63D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21F70AC78();
  __swift_project_value_buffer(v1, (uint64_t)qword_267EE63E8);
  uint64_t v2 = sub_21F70AC58();
  os_log_type_t v3 = sub_21F70AD08();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21F6E6000, v2, v3, "XPC consume sandbox extension token", v4, 2u);
    MEMORY[0x223C527D0](v4, -1, -1);
  }

  uint64_t v5 = sandbox_extension_consume();
  *(void *)(v0 + 16) = v5;
  oslog = sub_21F70AC58();
  if (v5 == -1)
  {
    os_log_type_t v6 = sub_21F70ACF8();
    if (!os_log_type_enabled(oslog, v6)) {
      goto LABEL_11;
    }
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    int v8 = "XPC consume sandbox token failed";
  }
  else
  {
    os_log_type_t v6 = sub_21F70AD08();
    if (!os_log_type_enabled(oslog, v6)) {
      goto LABEL_11;
    }
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    int v8 = "XPC consume sandbox token success";
  }
  _os_log_impl(&dword_21F6E6000, oslog, v6, v8, v7, 2u);
  MEMORY[0x223C527D0](v7, -1, -1);
LABEL_11:
}

void sub_21F70A390()
{
  uint64_t v1 = v0;
  if (qword_267EE63D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21F70AC78();
  __swift_project_value_buffer(v2, (uint64_t)qword_267EE63E8);
  os_log_type_t v3 = sub_21F70AC58();
  os_log_type_t v4 = sub_21F70AD08();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21F6E6000, v3, v4, "XPC start discovery", v5, 2u);
    MEMORY[0x223C527D0](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v1 + 32), sel_invalidate);
  id v6 = objc_msgSend(objc_allocWithZone((Class)DADiscoveryExtensionSession), sel_init);
  os_log_type_t v7 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = v6;
  id v8 = v6;

  v10[4] = sub_21F70AB94;
  v10[5] = v1;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_21F70A784;
  v10[3] = &block_descriptor_4;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_setEventHandler_, v9);
  _Block_release(v9);
  objc_msgSend(*(id *)(v1 + 24), sel_startDiscoveryWithSession_, v8);
}

uint64_t sub_21F70A55C(void *a1, uint64_t a2)
{
  if (qword_267EE63D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21F70AC78();
  __swift_project_value_buffer(v4, (uint64_t)qword_267EE63E8);
  id v5 = a1;
  id v6 = sub_21F70AC58();
  os_log_type_t v7 = sub_21F70AD08();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    id v10 = v5;
    sub_21F70AD18();
    *uint64_t v9 = v5;

    _os_log_impl(&dword_21F6E6000, v6, v7, "XPC report event: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EE6570);
    swift_arrayDestroy();
    MEMORY[0x223C527D0](v9, -1, -1);
    MEMORY[0x223C527D0](v8, -1, -1);

    uint64_t result = *(void *)(a2 + 40);
    if (!result) {
      return result;
    }
  }
  else
  {

    uint64_t result = *(void *)(a2 + 40);
    if (!result) {
      return result;
    }
  }
  id v12 = objc_msgSend((id)result, sel_remoteObjectProxy);
  sub_21F70AD28();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE6568);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    objc_msgSend(v13, sel_reportEvent_, v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_21F70A784(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_21F70A7EC(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_267EE63D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21F70AC78();
  __swift_project_value_buffer(v4, (uint64_t)qword_267EE63E8);
  id v5 = sub_21F70AC58();
  os_log_type_t v6 = sub_21F70AD08();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_21F6E6000, v5, v6, "XPC didReceiveDeviceChangedEvent", v7, 2u);
    MEMORY[0x223C527D0](v7, -1, -1);
  }

  id v8 = *(void **)(v2 + 24);

  return objc_msgSend(v8, sel_didReceiveDeviceChangedEvent_, a1);
}

uint64_t DADiscoveryExtensionConfiguration.deinit()
{
  swift_unknownObjectRelease();

  return v0;
}

uint64_t DADiscoveryExtensionConfiguration.__deallocating_deinit()
{
  DADiscoveryExtensionConfiguration.deinit();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_21F70A958(void *a1)
{
  return 1;
}

void sub_21F70A980()
{
}

uint64_t type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F70A9C8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21F70AA08()
{
  return sub_21F70A00C(*(void **)(v0 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21F70AA48(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x230], 8) = result;
  return result;
}

uint64_t sub_21F70AA88()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DADiscoveryExtensionConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DADiscoveryExtensionConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DADiscoveryExtensionConfiguration);
}

uint64_t dispatch thunk of DADiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of DADiscoveryExtensionConfiguration.accept(connection:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t sub_21F70AB4C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21F70AB94(void *a1)
{
  return sub_21F70A55C(a1, v1);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21F70AC38()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21F70AC48()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21F70AC58()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21F70AC68()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21F70AC78()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21F70AC88()
{
  return MEMORY[0x270EF7118]();
}

uint64_t sub_21F70AC98()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_21F70ACA8()
{
  return MEMORY[0x270EF7190]();
}

uint64_t sub_21F70ACB8()
{
  return MEMORY[0x270EF72A8]();
}

uint64_t sub_21F70ACC8()
{
  return MEMORY[0x270EF72C0]();
}

uint64_t sub_21F70ACD8()
{
  return MEMORY[0x270EF72C8]();
}

uint64_t sub_21F70ACE8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21F70ACF8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21F70AD08()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21F70AD18()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21F70AD28()
{
  return MEMORY[0x270F9E670]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x270F23D58]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x270F23E70]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x270F23E88]();
}

uint64_t CFPrefs_RemoveValue()
{
  return MEMORY[0x270F23E90]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x270F23EB0]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

uint64_t CUAppendF()
{
  return MEMORY[0x270F23F08]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x270F23F18]();
}

uint64_t CUGestaltDeviceClassToString()
{
  return MEMORY[0x270F23F38]();
}

uint64_t CULocalizedStringEx()
{
  return MEMORY[0x270F23F50]();
}

uint64_t CUPrintDateCF()
{
  return MEMORY[0x270F23F88]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x270F23F98]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x270F23FB0]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x270F23FC0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x270F23FD0]();
}

uint64_t CUPrintNSObject()
{
  return MEMORY[0x270F23FD8]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x270F23FE8]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x270F23FF8]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x270F24008]();
}

uint64_t CUXPCDecodeDouble()
{
  return MEMORY[0x270F24010]();
}

uint64_t CUXPCDecodeNSArrayOfClass()
{
  return MEMORY[0x270F24018]();
}

uint64_t CUXPCDecodeNSArrayOfInteger()
{
  return MEMORY[0x270F24020]();
}

uint64_t CUXPCDecodeNSArrayOfNSString()
{
  return MEMORY[0x270F24028]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x270F24030]();
}

uint64_t CUXPCDecodeNSError()
{
  return MEMORY[0x270F24040]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x270F24048]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x270F24050]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x270F24058]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x270F24060]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x270F24068]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x270F24070]();
}

uint64_t CUXPCEncodeNSArrayOfNSNumber()
{
  return MEMORY[0x270F24078]();
}

uint64_t CUXPCEncodeNSArrayOfNSString()
{
  return MEMORY[0x270F24080]();
}

uint64_t CUXPCEncodeNSArrayOfObjects()
{
  return MEMORY[0x270F24088]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x270F24090]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x270F24098]();
}

uint64_t CUXPCGetNextClientID()
{
  return MEMORY[0x270F240A0]();
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x270ED7BB8](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x270ED7BC0](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x270ED7BD0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, *(void *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x270ED7BE0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x270ED7C18](service, queue);
}

uint64_t FatalErrorF()
{
  return MEMORY[0x270F24178]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x270F241A0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x270ED7C40]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x270F24450]();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x270F24460]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x270F24468]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x270F24488]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x270F24498]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x270F244C8]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x270F244E8]();
}

uint64_t SecondsToUpTicksF()
{
  return MEMORY[0x270F24690]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x270F246E8]();
}

uint64_t UpTicksToMicroseconds()
{
  return MEMORY[0x270F24800]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

uint64_t nw_endpoint_copy_dictionary()
{
  return MEMORY[0x270EF7E58]();
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x270EF7E98](name, type, domain);
}

uint64_t nw_endpoint_create_from_dictionary()
{
  return MEMORY[0x270EF7EA0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_mach()
{
  return MEMORY[0x270EDB2D0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
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

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x270EDC460](xuuid);
}