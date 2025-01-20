uint64_t CoreCaptureControlGetTypeID()
{
  uint64_t result;

  result = __kCoreCaptureControlTypeID;
  if (!__kCoreCaptureControlTypeID)
  {
    pthread_once(&__gCoreCaptureControlTypeInit, (void (*)(void))__CoreCaptureControlRegister);
    return __kCoreCaptureControlTypeID;
  }
  return result;
}

uint64_t __CoreCaptureControlRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kCoreCaptureControlTypeID = result;
  return result;
}

void *__CoreCaptureControlRelease(void *result)
{
  result[2] = 0;
  result[3] = 0;
  result[4] = 0;
  return result;
}

void *CoreCaptureControlCreate()
{
  if (!__kCoreCaptureControlTypeID) {
    pthread_once(&__gCoreCaptureControlTypeInit, (void (*)(void))__CoreCaptureControlRegister);
  }
  uint64_t result = (void *)_CFRuntimeCreateInstance();
  if (result)
  {
    result[2] = 0;
    result[3] = 0;
    result[4] = 0;
  }
  return result;
}

uint64_t CoreCaptureControlStart(uint64_t a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t result = connect(a1, a2, a3);
  if (result)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v9 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v9, @"CCIdleTime", @"100");
    CFDictionaryAddValue(Mutable, @"CCStart", v9);
    v10 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v10, @"CCConfig", Mutable);
    CFDataRef Data = CFPropertyListCreateData(0, v10, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (Data) {
      CFRelease(Data);
    }
    sleep(2u);
    return replyResult;
  }
  return result;
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t v3 = *(void *)&a1;
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corecaptured", 0);
  *(void *)(v3 + 24) = v4;
  CFAllocatorRef v5 = (FILE **)MEMORY[0x1E4F143D8];
  v6 = (FILE *)*MEMORY[0x1E4F143D8];
  if (!v4)
  {
    v9 = "Failed to create dispatch queue\n";
    size_t v10 = 32;
LABEL_7:
    fwrite(v9, v10, 1uLL, v6);
    return 0;
  }
  fprintf(v6, "XPC Service is %s\n", "com.apple.corecaptured");
  mach_service = xpc_connection_create_mach_service("com.apple.corecaptured", *(dispatch_queue_t *)(v3 + 24), 2uLL);
  *(void *)(v3 + 16) = mach_service;
  if (!mach_service)
  {
    v6 = *v5;
    v9 = "Failed to create MACH service\n";
    size_t v10 = 30;
    goto LABEL_7;
  }
  *(unsigned char *)(v3 + 32) = 1;
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  if (*(unsigned char *)(v3 + 32))
  {
    xpc_connection_resume(*(xpc_connection_t *)(v3 + 16));
    return 1;
  }
  fprintf(*v5, "Failed to connect %s service\n", "com.apple.corecaptured");
  return 0;
}

void sendXPCRequest(uint64_t a1, CFDataRef theData)
{
  if (a1)
  {
    if (theData)
    {
      if (CFDataGetBytePtr(theData))
      {
        if (CFDataGetLength(theData))
        {
          BytePtr = CFDataGetBytePtr(theData);
          CFIndex Length = CFDataGetLength(theData);
          CFStringRef v6 = CFStringCreateWithBytes(0, BytePtr, Length, 0, 0);
          if (v6)
          {
            CFStringRef v7 = v6;
            xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
            if (v8)
            {
              v9 = v8;
              CStringPtr = CFStringGetCStringPtr(v7, 0);
              xpc_dictionary_set_string(v9, "CCConfig", CStringPtr);
              replyResult = 0;
              xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 16), v9, *(dispatch_queue_t *)(a1 + 24), &__block_literal_global_43);
              xpc_release(v9);
            }
            else
            {
              fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s:%06u: ERROR: Unable to create XPC dictionary\n", "sendXPCRequest", 218);
            }
            CFRelease(v7);
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s:%06u: ERROR: Unable to allocate string\n");
          }
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s:%06u: ERROR: Invalid XPC request length\n");
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s:%06u: ERROR: Invalid XPC request ptr\n");
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s:%06u: ERROR: Invalid XPC request\n");
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "%s:%06u: ERROR: Invalid client argument\n");
  }
}

uint64_t __sendXPCRequest_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = MEMORY[0x1C1877C60](a2);
  if (result == MEMORY[0x1E4F145A8])
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14530]);
    uint64_t result = fprintf((FILE *)*MEMORY[0x1E4F143D8], "Got an XPC error (processReply): %s\n", string);
    BOOL v5 = 0;
  }
  else
  {
    if (result != MEMORY[0x1E4F14590]) {
      return result;
    }
    dispatch_queue_t v4 = xpc_dictionary_get_string(a2, "rc");
    fprintf((FILE *)*MEMORY[0x1E4F143D8], "Result is %s\n", v4);
    uint64_t result = strncmp(v4, "rc.ok", 5uLL);
    BOOL v5 = result == 0;
  }
  replyResult = v5;
  return result;
}

uint64_t __connect_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1C1877C60](a2);
  if (result != MEMORY[0x1E4F145A8])
  {
    if (result == MEMORY[0x1E4F14578])
    {
      uint64_t v3 = "XPC_TYPE_CONNECTION";
    }
    else if (result == MEMORY[0x1E4F145D8])
    {
      uint64_t v3 = "XPC_TYPE_NULL";
    }
    else if (result == MEMORY[0x1E4F14570])
    {
      uint64_t v3 = "XPC_TYPE_BOOL";
    }
    else if (result == MEMORY[0x1E4F145C0])
    {
      uint64_t v3 = "XPC_TYPE_INT64";
    }
    else if (result == MEMORY[0x1E4F145F8])
    {
      uint64_t v3 = "XPC_TYPE_UINT64";
    }
    else if (result == MEMORY[0x1E4F14598])
    {
      uint64_t v3 = "XPC_TYPE_DOUBLE";
    }
    else if (result == MEMORY[0x1E4F14588])
    {
      uint64_t v3 = "XPC_TYPE_DATE";
    }
    else if (result == MEMORY[0x1E4F14580])
    {
      uint64_t v3 = "XPC_TYPE_DATA";
    }
    else if (result == MEMORY[0x1E4F145F0])
    {
      uint64_t v3 = "XPC_TYPE_STRING";
    }
    else if (result == MEMORY[0x1E4F14600])
    {
      uint64_t v3 = "XPC_TYPE_UUID";
    }
    else if (result == MEMORY[0x1E4F145B0])
    {
      uint64_t v3 = "XPC_TYPE_FD";
    }
    else if (result == MEMORY[0x1E4F145E8])
    {
      uint64_t v3 = "XPC_TYPE_SHMEM";
    }
    else if (result == MEMORY[0x1E4F14568])
    {
      uint64_t v3 = "XPC_TYPE_ARRAY";
    }
    else if (result == MEMORY[0x1E4F14590])
    {
      uint64_t v3 = "XPC_TYPE_DICTIONARY";
    }
    else
    {
      uint64_t v3 = "Unknown type";
    }
    return fprintf((FILE *)*MEMORY[0x1E4F143D8], "Unexpected event type %s\n", v3);
  }
  return result;
}

uint64_t CoreCaptureControlStop(uint64_t a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t result = connect(a1, a2, a3);
  if (result)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    CFStringRef v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v9 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v9, @"CCIdleTime", @"100");
    CFDictionaryAddValue(Mutable, @"CCStop", v9);
    size_t v10 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v10, @"CCConfig", Mutable);
    CFDataRef Data = CFPropertyListCreateData(0, v10, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (Data) {
      CFRelease(Data);
    }
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlCapture(uint64_t a1, const sockaddr *a2, const char *a3, const char *a4)
{
  uint64_t result = connect(a1, a2, (socklen_t)a3);
  if (result)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    size_t v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v13 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    CFStringRef v14 = CFStringCreateWithCString(0, (const char *)a2, 0);
    CFStringRef v15 = CFStringCreateWithCString(0, a3, 0);
    CFStringRef cf = CFStringCreateWithCString(0, a4, 0);
    CFDictionaryAddValue(v13, @"CaptureReason", cf);
    v16 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    CFDictionaryAddValue(v16, v15, v13);
    v17 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    CFDictionaryAddValue(v17, v14, v16);
    CFDictionaryAddValue(Mutable, @"CCConfigurePipe", v17);
    v18 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    CFDictionaryAddValue(v18, @"CCConfig", Mutable);
    CFDataRef Data = CFPropertyListCreateData(0, v18, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (v13) {
      CFRelease(v13);
    }
    if (v16) {
      CFRelease(v16);
    }
    if (v17) {
      CFRelease(v17);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v18) {
      CFRelease(v18);
    }
    if (v14) {
      CFRelease(v14);
    }
    if (v15) {
      CFRelease(v15);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (Data) {
      CFRelease(Data);
    }
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlCaptureWithComponentDirectory(uint64_t a1, const sockaddr *a2, const char *a3)
{
  uint64_t result = connect(a1, a2, (socklen_t)a3);
  if (result)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    xpc_object_t v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    CFAllocatorRef v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v11 = CFDictionaryCreateMutable(v7, 1, v8, v9);
    CFStringRef v12 = CFStringCreateWithCString(0, a3, 0);
    CFDictionaryAddValue(v11, @"CaptureReason", v12);
    v13 = CFDictionaryCreateMutable(v7, 1, v8, v9);
    CFStringRef v14 = CFStringCreateWithCString(0, (const char *)a2, 0);
    CFDictionaryAddValue(v13, v14, v11);
    CFDictionaryAddValue(Mutable, @"CCCaptureDirectory", v13);
    CFStringRef v15 = CFDictionaryCreateMutable(v7, 1, v8, v9);
    CFDictionaryAddValue(v15, @"CCConfig", Mutable);
    CFDataRef Data = CFPropertyListCreateData(0, v15, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (v11) {
      CFRelease(v11);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v15) {
      CFRelease(v15);
    }
    if (v13) {
      CFRelease(v13);
    }
    if (v14) {
      CFRelease(v14);
    }
    if (v12) {
      CFRelease(v12);
    }
    if (Data) {
      CFRelease(Data);
    }
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlConfigureProfile(uint64_t a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t result = connect(a1, a2, a3);
  if (result)
  {
    size_t v6 = strlen((const char *)a2);
    CFDataRef v7 = CFDataCreateWithBytesNoCopy(0, &a2->sa_len, v6, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    sendXPCRequest(a1, v7);
    if (v7) {
      CFRelease(v7);
    }
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlConfigureStream(uint64_t a1, const sockaddr *a2, const char *a3, const char *a4, uint64_t *a5)
{
  valuePtr[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = connect(a1, a2, (socklen_t)a3);
  if (!result) {
    return result;
  }
  uint64_t v38 = a1;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFStringRef v15 = CFDictionaryCreateMutable(v11, 0, v12, v13);
  CFStringRef cf = CFStringCreateWithCString(0, (const char *)a2, 0);
  CFStringRef key = CFStringCreateWithCString(0, a3, 0);
  CFStringRef v16 = CFStringCreateWithCString(0, a4, 0);
  if ((*(unsigned char *)a5 & 7) == 0)
  {
    CFNumberRef v35 = 0;
    CFArrayRef ArrayBySeparatingStrings = 0;
    CFNumberRef v37 = 0;
    CFNumberRef v34 = 0;
    goto LABEL_16;
  }
  v17 = CFDictionaryCreateMutable(v11, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v18 = *a5;
  if (*a5)
  {
    CFNumberRef v37 = CFNumberCreate(0, kCFNumberSInt64Type, a5 + 1);
    CFDictionaryAddValue(v17, @"LogLevel", v37);
    uint64_t v18 = *a5;
    if ((*a5 & 2) != 0)
    {
LABEL_5:
      valuePtr[0] = 0xAAAAAAAAAAAAAAAALL;
      if (isValidNumber((const char *)a5[2], valuePtr))
      {
        CFNumberRef v35 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
        CFDictionaryAddValue(v17, @"LogFlags", v35);
        CFArrayRef ArrayBySeparatingStrings = 0;
      }
      else
      {
        CFStringRef v19 = CFStringCreateWithCString(0, (const char *)a5[2], 0);
        CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v19, @",");
        CFDictionaryAddValue(v17, @"LogFlags", ArrayBySeparatingStrings);
        CFRelease(v19);
        CFNumberRef v35 = 0;
      }
      if ((*a5 & 4) == 0) {
        goto LABEL_13;
      }
LABEL_10:
      CFNumberRef v34 = CFNumberCreate(0, kCFNumberSInt64Type, a5 + 3);
      CFDictionaryAddValue(v17, @"LogOptions", v34);
      goto LABEL_14;
    }
  }
  else
  {
    CFNumberRef v37 = 0;
    if ((v18 & 2) != 0) {
      goto LABEL_5;
    }
  }
  CFNumberRef v35 = 0;
  CFArrayRef ArrayBySeparatingStrings = 0;
  if ((v18 & 4) != 0) {
    goto LABEL_10;
  }
LABEL_13:
  CFNumberRef v34 = 0;
LABEL_14:
  CFDictionaryAddValue(v15, @"CoreCapture", v17);
  if (v17) {
    CFRelease(v17);
  }
LABEL_16:
  if ((*(unsigned char *)a5 & 0x18) != 0)
  {
    v20 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if ((*a5 & 8) != 0)
    {
      CFNumberRef v33 = CFNumberCreate(0, kCFNumberSInt64Type, a5 + 4);
      CFDictionaryAddValue(v20, @"LogLevel", v33);
      if ((*a5 & 0x10) != 0) {
        goto LABEL_19;
      }
    }
    else
    {
      CFNumberRef v33 = 0;
      if ((*a5 & 0x10) != 0)
      {
LABEL_19:
        valuePtr[0] = 0xAAAAAAAAAAAAAAAALL;
        if (!isValidNumber((const char *)a5[5], valuePtr))
        {
          CFStringRef v23 = CFStringCreateWithCString(0, (const char *)a5[2], 0);
          CFArrayRef v32 = CFStringCreateArrayBySeparatingStrings(0, v23, @",");
          CFDictionaryAddValue(v20, @"LogFlags", v32);
          CFRelease(v23);
          CFNumberRef v21 = 0;
LABEL_26:
          v22 = v15;
          CFDictionaryAddValue(v15, @"Console", v20);
          if (v20) {
            CFRelease(v20);
          }
          goto LABEL_28;
        }
        CFNumberRef v21 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
        CFDictionaryAddValue(v20, @"LogFlags", v21);
LABEL_24:
        CFArrayRef v32 = 0;
        goto LABEL_26;
      }
    }
    CFNumberRef v21 = 0;
    goto LABEL_24;
  }
  v22 = v15;
  CFNumberRef v21 = 0;
  CFArrayRef v32 = 0;
  CFNumberRef v33 = 0;
LABEL_28:
  v24 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  v25 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  v26 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFStringRef v27 = v16;
  CFDictionaryAddValue(v26, v16, v22);
  v28 = CFDictionaryCreateMutable(v11, 0, v24, v25);
  CFDictionaryAddValue(v28, key, v26);
  v29 = CFDictionaryCreateMutable(v11, 0, v24, v25);
  CFDictionaryAddValue(v29, cf, v28);
  CFDictionaryAddValue(Mutable, @"CCConfigureStream", v29);
  v30 = CFDictionaryCreateMutable(v11, 0, v24, v25);
  CFDictionaryAddValue(v30, @"CCConfig", Mutable);
  CFDataRef Data = CFPropertyListCreateData(0, v30, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (v22) {
    CFRelease(v22);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v30) {
    CFRelease(v30);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (key) {
    CFRelease(key);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v37) {
    CFRelease(v37);
  }
  if (ArrayBySeparatingStrings) {
    CFRelease(ArrayBySeparatingStrings);
  }
  if (v34) {
    CFRelease(v34);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v32) {
    CFRelease(v32);
  }
  if (v33) {
    CFRelease(v33);
  }
  sendXPCRequest(v38, Data);
  if (Data) {
    CFRelease(Data);
  }
  sleep(2u);
  return replyResult;
}

const char *isValidNumber(const char *result, unint64_t *a2)
{
  v4[1] = *(char **)MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = result;
    if (!*result) {
      return 0;
    }
    v4[0] = (char *)0xAAAAAAAAAAAAAAAALL;
    *__error() = 0;
    *a2 = strtouq(v2, v4, 0);
    if (*__error() == 34 && *a2 == -1)
    {
      return 0;
    }
    else
    {
      __error();
      return (const char *)(*v4[0] == 0);
    }
  }
  return result;
}

uint64_t CoreCaptureControlConfigurePipe(uint64_t a1, const sockaddr *a2, const char *a3, uint64_t *a4)
{
  uint64_t result = connect(a1, a2, (socklen_t)a3);
  if (!result) {
    return result;
  }
  uint64_t v29 = a1;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  CFAllocatorRef v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v13 = CFDictionaryCreateMutable(v9, 4, v10, v11);
  CFStringRef key = CFStringCreateWithCString(0, (const char *)a2, 0);
  CFStringRef v14 = CFStringCreateWithCString(0, a3, 0);
  uint64_t v15 = *a4;
  if (*a4)
  {
    CFStringRef v16 = CFStringCreateWithCString(0, (const char *)a4[1], 0);
    CFDictionaryAddValue(v13, @"LogOptions", v16);
    uint64_t v15 = *a4;
    if ((*a4 & 2) != 0)
    {
LABEL_4:
      CFNumberRef v17 = CFNumberCreate(0, kCFNumberSInt64Type, a4 + 2);
      CFDictionaryAddValue(v13, @"WatermarkLevel", v17);
      uint64_t v15 = *a4;
      if ((*a4 & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      CFNumberRef v18 = 0;
      if ((v15 & 8) != 0) {
        goto LABEL_6;
      }
LABEL_10:
      CFNumberRef v19 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    CFStringRef v16 = 0;
    if ((v15 & 2) != 0) {
      goto LABEL_4;
    }
  }
  CFNumberRef v17 = 0;
  if ((v15 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  CFNumberRef v18 = CFNumberCreate(0, kCFNumberSInt64Type, a4 + 3);
  CFDictionaryAddValue(v13, @"NotifyTimeout", v18);
  if ((*a4 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_6:
  CFNumberRef v19 = CFNumberCreate(0, kCFNumberSInt64Type, a4 + 4);
  CFDictionaryAddValue(v13, @"Policy", v19);
LABEL_11:
  CFNumberRef v27 = v17;
  CFStringRef cf = v16;
  v20 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  CFNumberRef v21 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  v22 = CFDictionaryCreateMutable(v9, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFStringRef v23 = v14;
  CFDictionaryAddValue(v22, v14, v13);
  v24 = CFDictionaryCreateMutable(v9, 1, v20, v21);
  CFDictionaryAddValue(v24, key, v22);
  CFDictionaryAddValue(Mutable, @"CCConfigurePipe", v24);
  v25 = CFDictionaryCreateMutable(v9, 1, v20, v21);
  CFDictionaryAddValue(v25, @"CCConfig", Mutable);
  CFDataRef Data = CFPropertyListCreateData(0, v25, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (v13) {
    CFRelease(v13);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (key) {
    CFRelease(key);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v19) {
    CFRelease(v19);
  }
  sendXPCRequest(v29, Data);
  if (Data) {
    CFRelease(Data);
  }
  sleep(2u);
  return replyResult;
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE308](__str, __endptr, *(void *)&__base);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
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
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}