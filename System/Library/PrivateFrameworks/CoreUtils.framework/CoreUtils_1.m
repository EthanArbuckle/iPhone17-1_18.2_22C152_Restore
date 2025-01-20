void _PairingSessionReset(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  const void *v11;

  *(unsigned char *)(a1 + 120) = 0;
  v2 = *(void **)(a1 + 128);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 128) = 0;
  }
  *(void *)(a1 + 136) = 0;
  v3 = *(void **)(a1 + 144);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 144) = 0;
  }
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  *(unsigned char *)(a1 + 168) = 0;
  v4 = *(void **)(a1 + 184);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 184) = 0;
  }
  *(void *)(a1 + 192) = 0;
  memset_s((void *)(a1 + 414), 0x20uLL, 0, 0x20uLL);
  v5 = *(void **)(a1 + 696);
  if (v5)
  {
    SRPDelete_libsrp(v5);
    *(void *)(a1 + 696) = 0;
  }
  v6 = *(void **)(a1 + 704);
  if (v6)
  {
    free(v6);
    *(void *)(a1 + 704) = 0;
  }
  *(void *)(a1 + 712) = 0;
  v7 = *(void **)(a1 + 720);
  if (v7)
  {
    free(v7);
    *(void *)(a1 + 720) = 0;
  }
  *(void *)(a1 + 728) = 0;
  v8 = *(void **)(a1 + 736);
  if (v8)
  {
    memset_s(v8, *(void *)(a1 + 744), 0, *(void *)(a1 + 744));
    v9 = *(void **)(a1 + 736);
    if (v9)
    {
      free(v9);
      *(void *)(a1 + 736) = 0;
    }
  }
  *(void *)(a1 + 744) = 0;
  memset_s((void *)(a1 + 478), 0x20uLL, 0, 0x20uLL);
  memset_s((void *)(a1 + 542), 0x20uLL, 0, 0x20uLL);
  memset_s((void *)(a1 + 638), 0x20uLL, 0, 0x20uLL);
  v10 = *(const void **)(a1 + 672);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 672) = 0;
  }
  v11 = *(const void **)(a1 + 848);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a1 + 848) = 0;
  }
}

uint64_t PairingSessionCreate(uint64_t *a1, uint64_t a2, int a3)
{
  if (gPairingSessionInitOnce != -1) {
    dispatch_once_f(&gPairingSessionInitOnce, 0, (dispatch_function_t)_PairingSessionGetTypeID);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 4294960568;
  }
  uint64_t v7 = Instance;
  bzero((void *)(Instance + 24), 0x3C0uLL);
  *(void *)(v7 + 16) = &gLogCategory_Pairing;
  *(_DWORD *)(v7 + 96) = a3;
  *(_OWORD *)(v7 + 104) = xmmword_18E416F60;
  if (SecondsToUpTicks_sOnce != -1) {
    dispatch_once_f(&SecondsToUpTicks_sOnce, &SecondsToUpTicks_sMultiplier, (dispatch_function_t)_SecondsToUpTicksInit);
  }
  *(void *)(v7 + 368) = 172800 * SecondsToUpTicks_sMultiplier;
  v8 = (_OWORD *)(v7 + 24);
  if (a2)
  {
    _OWORD *v8 = *(_OWORD *)a2;
    long long v9 = *(_OWORD *)(a2 + 16);
    long long v10 = *(_OWORD *)(a2 + 32);
    long long v11 = *(_OWORD *)(a2 + 48);
    *(void *)(v7 + 88) = *(void *)(a2 + 64);
    *(_OWORD *)(v7 + 56) = v10;
    *(_OWORD *)(v7 + 72) = v11;
    *(_OWORD *)(v7 + 40) = v9;
  }
  else
  {
    *(void *)(v7 + 88) = 0;
    *(_OWORD *)(v7 + 56) = 0u;
    *(_OWORD *)(v7 + 72) = 0u;
    _OWORD *v8 = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
  }
  PairingSessionSetKeychainInfo(v7, @"com.apple.pairing", 1886538084, @"Pairing Identity", @"Pairing Identity", 1886539877, @"Paired Peer", @"Paired Peer", 0);
  uint64_t result = 0;
  *a1 = v7;
  return result;
}

void PairingSessionSetKeychainInfo(uint64_t a1, CFTypeRef cf1, int a3, CFTypeRef cf, CFTypeRef a5, int a6, CFTypeRef a7, CFTypeRef a8, int a9)
{
  if (cf1)
  {
    int v17 = CFEqual(cf1, &stru_1EDD2ACE8);
    v18 = *(const void **)(a1 + 752);
    if (v17)
    {
      if (v18)
      {
        CFRelease(*(CFTypeRef *)(a1 + 752));
        *(void *)(a1 + 752) = 0;
      }
    }
    else
    {
      CFRetain(cf1);
      *(void *)(a1 + 752) = cf1;
      if (v18) {
        CFRelease(v18);
      }
    }
  }
  if (a3) {
    *(_DWORD *)(a1 + 768) = a3;
  }
  if (cf)
  {
    v19 = *(const void **)(a1 + 760);
    CFRetain(cf);
    *(void *)(a1 + 760) = cf;
    if (v19) {
      CFRelease(v19);
    }
  }
  if (a5)
  {
    v20 = *(const void **)(a1 + 776);
    CFRetain(a5);
    *(void *)(a1 + 776) = a5;
    if (v20) {
      CFRelease(v20);
    }
  }
  if (a6) {
    *(_DWORD *)(a1 + 792) = a6;
  }
  if (a7)
  {
    v21 = *(const void **)(a1 + 784);
    CFRetain(a7);
    *(void *)(a1 + 784) = a7;
    if (v21) {
      CFRelease(v21);
    }
  }
  if (a8)
  {
    v22 = *(const void **)(a1 + 800);
    CFRetain(a8);
    *(void *)(a1 + 800) = a8;
    if (v22) {
      CFRelease(v22);
    }
  }
  *(_DWORD *)(a1 + 808) = a9;
}

void PairingSessionInvalidate(void *a1)
{
  v1 = (void *)a1[107];
  if (v1)
  {
    queue = v1;
    CFRetain(a1);
    dispatch_async_f(queue, a1, (dispatch_function_t)_PairingSessionInvalidate);
  }
}

void _PairingSessionInvalidate(void *cf)
{
  v2 = (const void *)cf[118];
  if (v2)
  {
    CFRelease(v2);
    cf[118] = 0;
  }
  v3 = (const void *)cf[119];
  if (v3)
  {
    CFRelease(v3);
    cf[119] = 0;
  }
  v4 = (const void *)cf[120];
  if (v4)
  {
    CFRelease(v4);
    cf[120] = 0;
  }
  v5 = (const void *)cf[121];
  if (v5)
  {
    CFRelease(v5);
    cf[121] = 0;
  }
  v6 = (const void *)cf[122];
  if (v6)
  {
    CFRelease(v6);
    cf[122] = 0;
  }
  uint64_t v7 = (void (*)(uint64_t, void, void))cf[108];
  if (v7)
  {
    v7(1, 0, cf[109]);
    cf[108] = 0;
  }
  CFRelease(cf);
}

uint64_t PairingSessionCopyPeerACL(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 272);
  if (v1) {
    CFRetain(*(CFTypeRef *)(a1 + 272));
  }
  return v1;
}

uint64_t PairingSessionSetACL(uint64_t a1, CFTypeRef cf)
{
  v4 = *(const void **)(a1 + 176);
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(a1 + 176) = cf;
  if (v4) {
    CFRelease(v4);
  }
  return 0;
}

uint64_t PairingSessionGetPeerAppFlags(uint64_t a1)
{
  return *(void *)(a1 + 200);
}

uint64_t PairingSessionSetSelfAppFlags(uint64_t result, uint64_t a2)
{
  *(void *)(result + 208) = a2;
  return result;
}

void *PairingSessionCopyExtraData(uint64_t a1, size_t *a2, int *a3)
{
  if (*(void *)(a1 + 232))
  {
    if (*(void *)(a1 + 240) <= 1uLL) {
      size_t v6 = 1;
    }
    else {
      size_t v6 = *(void *)(a1 + 240);
    }
    uint64_t v7 = malloc_type_malloc(v6, 0x5E5DD6D9uLL);
    v8 = v7;
    if (v7)
    {
      size_t v9 = *(void *)(a1 + 240);
      memcpy(v7, *(const void **)(a1 + 232), v9);
      int v10 = 0;
    }
    else
    {
      size_t v9 = 0;
      int v10 = -6728;
    }
  }
  else
  {
    v8 = 0;
    size_t v9 = 0;
    int v10 = -6727;
  }
  if (a2) {
    *a2 = v9;
  }
  if (a3) {
    *a3 = v10;
  }
  return v8;
}

uint64_t PairingSessionSetExtraData(uint64_t a1, const void *a2, size_t a3)
{
  if (a2)
  {
    if (a3 <= 1) {
      size_t v6 = 1;
    }
    else {
      size_t v6 = a3;
    }
    uint64_t v7 = malloc_type_malloc(v6, 0x8B65EFCFuLL);
    if (!v7) {
      return 4294960568;
    }
    v8 = v7;
    if (a3) {
      memcpy(v7, a2, a3);
    }
  }
  else
  {
    v8 = 0;
  }
  size_t v9 = *(void **)(a1 + 216);
  if (v9) {
    free(v9);
  }
  uint64_t result = 0;
  *(void *)(a1 + 216) = v8;
  *(void *)(a1 + 224) = a3;
  return result;
}

uint64_t PairingSessionGetPeerFlags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 288);
}

uint64_t PairingSessionSetFlags(uint64_t result, int a2)
{
  *(_DWORD *)(result + 100) = a2;
  return result;
}

uint64_t PairingSessionSetIdentifier(uint64_t a1, char *__s, size_t a3)
{
  return ReplaceString((void **)(a1 + 248), (size_t *)(a1 + 256), __s, a3);
}

CFMutableDictionaryRef PairingSessionCopyPeerInfo(void *a1, int *a2)
{
  CFDictionaryRef v4 = (const __CFDictionary *)a1[39];
  if (!v4)
  {
    CFDictionaryRef v7 = (const __CFDictionary *)a1[40];
    if (!v7)
    {
      CFMutableDictionaryRef MutableCopy = 0;
      goto LABEL_9;
    }
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
    if (MutableCopy) {
      goto LABEL_9;
    }
LABEL_18:
    int v12 = -6728;
    goto LABEL_15;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v4);
  if (!MutableCopy) {
    goto LABEL_18;
  }
  CFDictionaryRef v6 = (const __CFDictionary *)a1[40];
  if (v6) {
    CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)_CFDictionaryMergeDictionaryApplier, MutableCopy);
  }
LABEL_9:
  CFDictionaryRef v8 = (const __CFDictionary *)a1[43];
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(v8, @"groupInfoPeer", TypeID, 0);
  if (TypedValue)
  {
    CFDictionaryRef v11 = TypedValue;
    if (MutableCopy || (CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, TypedValue)) != 0)
    {
      CFDictionarySetValue(MutableCopy, @"groupInfo", v11);
LABEL_14:
      CFDictionaryRemoveValue(MutableCopy, @"altIRK");
      int v12 = 0;
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (MutableCopy) {
    goto LABEL_14;
  }
  int v12 = -6727;
LABEL_15:
  if (a2) {
    *a2 = v12;
  }
  return MutableCopy;
}

uint64_t PairingSessionSetAdditionalPeerInfo(uint64_t a1, CFTypeRef cf)
{
  CFDictionaryRef v4 = *(const void **)(a1 + 320);
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(a1 + 320) = cf;
  if (v4) {
    CFRelease(v4);
  }
  return 0;
}

uint64_t PairingSessionSetAdditionalSelfInfo(uint64_t a1, CFTypeRef cf)
{
  CFDictionaryRef v4 = *(const void **)(a1 + 336);
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(a1 + 336) = cf;
  if (v4) {
    CFRelease(v4);
  }
  return 0;
}

uint64_t PairingSessionSetLogging(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

void PairingSessionSetMaxTries(uint64_t a1, int a2)
{
  gPairingMaxTries = a2;
}

uint64_t PairingSessionSetMTU(uint64_t a1, unint64_t a2)
{
  if (a2 < 2) {
    return 4294960553;
  }
  unint64_t v3 = a2 - 2 * (a2 / 0x101);
  uint64_t v4 = a2 % 0x101 ? -1 : 0;
  uint64_t v5 = -2;
  if (a2 % 0x101 <= 1) {
    uint64_t v5 = v4;
  }
  unint64_t v6 = v3 + v5;
  if (!(v3 + v5)) {
    return 4294960553;
  }
  uint64_t v2 = 0;
  *(void *)(a1 + 104) = v6;
  *(void *)(a1 + 112) = a2;
  return v2;
}

id PairingSessionCopyPairedPeer(uint64_t a1, int *a2)
{
  unint64_t v3 = *(void **)(a1 + 264);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v5 = -6727;
  if (a2) {
LABEL_3:
  }
    *a2 = v5;
LABEL_4:
  return v3;
}

id PairingSessionGetPairedPeer(uint64_t a1, int *a2)
{
  unint64_t v3 = *(void **)(a1 + 264);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v5 = -6727;
  if (a2) {
LABEL_3:
  }
    *a2 = v5;
LABEL_4:
  return v3;
}

char *PairingSessionCopyPeerIdentifier(uint64_t a1, size_t *a2, int *a3)
{
  uint64_t result = *(char **)(a1 + 296);
  if (result)
  {
    size_t v7 = *(void *)(a1 + 304);
    uint64_t result = strndup(result, v7);
    BOOL v8 = result == 0;
    if (result)
    {
      size_t v9 = v7;
    }
    else
    {
      uint64_t result = 0;
      size_t v9 = 0;
    }
    if (v8) {
      int v10 = -6728;
    }
    else {
      int v10 = 0;
    }
    if (a2) {
      goto LABEL_9;
    }
  }
  else
  {
    size_t v9 = 0;
    int v10 = -6727;
    if (a2) {
LABEL_9:
    }
      *a2 = v9;
  }
  if (a3) {
    *a3 = v10;
  }
  return result;
}

const void *PairingSessionCopyProperty(uint64_t a1, const void *a2, int *a3)
{
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 344);
  if (!v4)
  {
    unint64_t v6 = 0;
LABEL_7:
    int v7 = -6727;
    if (!a3) {
      return v6;
    }
    goto LABEL_4;
  }
  Value = CFDictionaryGetValue(v4, a2);
  unint64_t v6 = Value;
  if (!Value) {
    goto LABEL_7;
  }
  CFRetain(Value);
  int v7 = 0;
  if (a3) {
LABEL_4:
  }
    *a3 = v7;
  return v6;
}

uint64_t PairingSessionSetProperty(uint64_t a1, void *key, void *value)
{
  Mutable = *(__CFDictionary **)(a1 + 344);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    *(void *)(a1 + 344) = Mutable;
    if (!Mutable) {
      return 4294960568;
    }
  }
  if (value) {
    CFDictionarySetValue(Mutable, key, value);
  }
  else {
    CFDictionaryRemoveValue(Mutable, key);
  }
  return 0;
}

uint64_t PairingSessionGetResumeInfo(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 96);
  if ((v3 - 3) > 1)
  {
    if ((v3 - 5) > 1 || *(unsigned char *)(a1 + 120) != 3) {
      return 4294960587;
    }
LABEL_6:
    uint64_t result = 0;
    *a2 = *(void *)(a1 + 376);
    return result;
  }
  if (*(unsigned char *)(a1 + 120) == 5) {
    goto LABEL_6;
  }
  return 4294960587;
}

uint64_t PairingSessionSetResumeInfo(void *a1, uint64_t a2, const void *a3, size_t a4)
{
  if (a4 <= 1) {
    size_t v8 = 1;
  }
  else {
    size_t v8 = a4;
  }
  size_t v9 = malloc_type_malloc(v8, 0xE0B9AEB0uLL);
  if (!v9) {
    return 4294960568;
  }
  int v10 = v9;
  if (a4) {
    memcpy(v9, a3, a4);
  }
  CFDictionaryRef v11 = (void *)a1[44];
  if (v11) {
    free(v11);
  }
  uint64_t result = 0;
  a1[44] = v10;
  a1[45] = a4;
  a1[47] = a2;
  return result;
}

uint64_t PairingSessionSetMaxResumeSessions(uint64_t a1, int a2)
{
  gPairingMaxResumeSessions = a2;
  return 0;
}

uint64_t PairingSessionSetResumeTTL(uint64_t a1, unsigned int a2)
{
  if (SecondsToUpTicks_sOnce != -1) {
    dispatch_once_f(&SecondsToUpTicks_sOnce, &SecondsToUpTicks_sMultiplier, (dispatch_function_t)_SecondsToUpTicksInit);
  }
  *(void *)(a1 + 368) = SecondsToUpTicks_sMultiplier * a2;
  return 0;
}

uint64_t PairingSessionSetSetupCode(uint64_t a1, char *__s, size_t a3)
{
  return ReplaceString((void **)(a1 + 384), (size_t *)(a1 + 392), __s, a3);
}

uint64_t PairingSessionGenerateTranscriptResultMFi4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  CFDataRef v9 = *(const __CFData **)(a1 + 672);
  if (v9)
  {
    BytePtr = CFDataGetBytePtr(v9);
    CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 672));
    if (Length)
    {
      CFIndex v13 = Length;
      uint64_t v14 = PairingSessionDeriveKey(a1, "MFi4-KT1-Salt", 0xDuLL, (uint64_t)"MFi4-KT1-Info", 13, 0x20uLL, (uint64_t)v19);
      if (v14)
      {
        uint64_t v15 = v14;
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        CryptoHMACInit(&v20, (uint64_t)_kCryptoHashDescriptor_SHA256, v19, 0x20uLL);
        (*(void (**)(long long *, const UInt8 *, CFIndex))(v20 + 8))(&v20, BytePtr, v13);
        CryptoHMACFinal((uint64_t *)&v20, a2);
        uint64_t v15 = PairingSessionDeriveKey(a1, "MFi4-KT2-Salt", 0xDuLL, (uint64_t)"MFi4-KT2-Info", 13, 0x20uLL, (uint64_t)v18);
        if (!v15)
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          CryptoHMACInit(&v20, (uint64_t)_kCryptoHashDescriptor_SHA256, v18, 0x20uLL);
          (*(void (**)(long long *, const UInt8 *, CFIndex))(v20 + 8))(&v20, BytePtr, v13);
          CryptoHMACFinal((uint64_t *)&v20, a2 + 32);
          return v15;
        }
      }
    }
    else
    {
      uint64_t v15 = 4294960553;
    }
  }
  else
  {
    uint64_t v15 = 4294960551;
  }
  int v17 = *(int **)(a1 + 16);
  if (*v17 <= 90)
  {
    if (*v17 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au)) {
        return v15;
      }
      int v17 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v17, (uint64_t)"OSStatus PairingSessionGenerateTranscriptResultMFi4(PairingSessionRef, CUPairingTranscriptResultMFi4 *)", 0x5Au, (uint64_t)"### Generate MFi4 transcript result failed: %#m", a5, a6, a7, a8, v15);
  }
  return v15;
}

uint64_t PairingSessionDeriveKey(uint64_t a1, char *a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unsigned int v8 = *(_DWORD *)(a1 + 96);
  uint64_t result = 4294960561;
  if (v8 <= 6)
  {
    if (((1 << v8) & 6) != 0)
    {
      if (*(unsigned char *)(a1 + 120) != 7) {
        return 4294960587;
      }
      uint64_t v15 = *(void *)(a1 + 736);
      if (!v15) {
        return 4294960587;
      }
      uint64_t v16 = *(void *)(a1 + 744);
      if (!v16) {
        return 4294960587;
      }
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, v15, v16, a2, a3, a4, a5, a6, a7);
    }
    else
    {
      if (((1 << v8) & 0x18) != 0)
      {
        if (*(unsigned char *)(a1 + 120) != 5) {
          return 4294960587;
        }
      }
      else
      {
        if (((1 << v8) & 0x60) == 0) {
          return result;
        }
        if (*(unsigned char *)(a1 + 120) != 3) {
          return 4294960587;
        }
      }
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, a2, a3, a4, a5, a6, a7);
    }
    return 0;
  }
  return result;
}

uint64_t PairingSessionSetTranscriptType(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 680) = a2;
  return 0;
}

uint64_t PairingSessionSetEventHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 864) = a2;
  *(void *)(result + 872) = a3;
  return result;
}

uint64_t PairingSessionSetAddPairingHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 880) = a2;
  *(void *)(result + 888) = a3;
  return result;
}

uint64_t PairingSessionSetRemovePairingHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 896) = a2;
  *(void *)(result + 904) = a3;
  return result;
}

uint64_t PairingSessionSetListPairingsHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 912) = a2;
  *(void *)(result + 920) = a3;
  return result;
}

uint64_t PairingSessionSetSignBytesHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 928) = a2;
  *(void *)(result + 936) = a3;
  return result;
}

uint64_t PairingSessionSetSignBytesHandler_b(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    uint64_t v5 = [v3 copy];
    unint64_t v6 = *(const void **)(a1 + 944);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 944) = v5;
    id v4 = v8;
  }
  else
  {
    unint64_t v6 = *(const void **)(a1 + 944);
    if (v6)
    {
      CFRelease(v6);
      id v4 = 0;
      *(void *)(a1 + 944) = 0;
    }
  }
  return MEMORY[0x1F41817F8](v6, v4);
}

uint64_t PairingSessionSetVerifySignatureHandler_b(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    uint64_t v5 = [v3 copy];
    unint64_t v6 = *(const void **)(a1 + 952);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 952) = v5;
    id v4 = v8;
  }
  else
  {
    unint64_t v6 = *(const void **)(a1 + 952);
    if (v6)
    {
      CFRelease(v6);
      id v4 = 0;
      *(void *)(a1 + 952) = 0;
    }
  }
  return MEMORY[0x1F41817F8](v6, v4);
}

uint64_t PairingSessionExchange(uint64_t a1, unsigned __int8 *a2, CFIndex a3, char **a4, size_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  size_t v182 = 0;
  v183 = 0;
  if (!a1) {
    return 4294960556;
  }
  id v8 = (char *)a6;
  __s = (char *)(a1 + 120);
  if (!*(unsigned char *)(a1 + 120))
  {
    uint64_t v14 = *(int **)(a1 + 16);
    if (*v14 <= 30)
    {
      if (*v14 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v14, 0x1Eu)) {
          goto LABEL_12;
        }
        uint64_t v14 = *(int **)(a1 + 16);
      }
      uint64_t v15 = *(unsigned int *)(a1 + 96);
      if (v15 > 0xE) {
        uint64_t v16 = "?";
      }
      else {
        uint64_t v16 = off_1E55BF938[v15];
      }
      LogPrintF((uint64_t)v14, (uint64_t)"OSStatus PairingSessionExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"PairStart, %s, %#{flags}\n", (uint64_t)a5, a6, a7, a8, (uint64_t)v16);
    }
  }
LABEL_12:
  v179 = a4;
  v180 = a5;
  *(void *)v214 = 0;
  v189 = 0;
  __src = 0;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v197 = 0u;
  long long v196 = 0u;
  long long v195 = 0u;
  v192 = &v195;
  long long v193 = xmmword_18E416F70;
  v194 = 0;
  uint64_t v18 = TLV8GetOrCopyCoalesced(a2, &a2[a3], 12, &__src, (size_t *)&v189, v214, 0);
  int v23 = v18;
  uint64_t v17 = v18;
  if (v18 == -6727) {
    uint64_t v17 = TLV8GetOrCopyCoalesced(a2, &a2[a3], 13, &__src, (size_t *)&v189, v214, 0);
  }
  v181 = v8;
  if (v17)
  {
    CFIndex v177 = a3;
    v178 = a2;
    long long v29 = 0;
    size_t v30 = 0;
    char v31 = 0;
    if (v17 == -6727) {
      uint64_t v17 = 0;
    }
    long long v28 = 0;
    goto LABEL_43;
  }
  long long v24 = v189;
  if (!v189)
  {
    uint64_t v33 = *(void *)(a1 + 152);
    uint64_t v32 = *(void *)(a1 + 160);
    if ((unint64_t)(v33 - v32) >= *(void *)(a1 + 104)) {
      size_t v34 = *(void *)(a1 + 104);
    }
    else {
      size_t v34 = v33 - v32;
    }
    CFIndex v177 = a3;
    v178 = a2;
    if (!v34)
    {
      long long v29 = 0;
      size_t v30 = 0;
      char v31 = 0;
      long long v28 = 0;
      uint64_t v17 = 4294960534;
      goto LABEL_42;
    }
    size_t v35 = v34 + v32;
    if (v34 + v32 == v33) {
      char v36 = 13;
    }
    else {
      char v36 = 12;
    }
    uint64_t v37 = TLV8BufferAppend((uint64_t)&v192, v36, (char *)(*(void *)(a1 + 144) + v32), v34);
    if (v37) {
      goto LABEL_41;
    }
    size_t v30 = v193;
    long long v29 = (char *)v194;
    if (!v194)
    {
      if ((unint64_t)v193 <= 1) {
        size_t v38 = 1;
      }
      else {
        size_t v38 = v193;
      }
      long long v39 = (char *)malloc_type_malloc(v38, 0xF62D7A9CuLL);
      long long v29 = v39;
      if (!v39)
      {
        size_t v30 = 0;
        char v31 = 0;
        long long v28 = 0;
        goto LABEL_390;
      }
      if (v30) {
        memcpy(v39, v192, v30);
      }
    }
    v192 = &v195;
    *(void *)&long long v193 = 0;
    v194 = 0;
    if (v35 == v33)
    {
      char v31 = *(unsigned char *)(a1 + 168);
      free(*(void **)(a1 + 144));
      uint64_t v17 = 0;
      long long v28 = 0;
      *(void *)(a1 + 144) = 0;
      *(void *)(a1 + 152) = 0;
      *(unsigned char *)(a1 + 168) = 0;
      *(void *)(a1 + 160) = 0;
    }
    else
    {
      char v31 = 0;
      uint64_t v17 = 0;
      long long v28 = 0;
      *(void *)(a1 + 160) += v34;
    }
    goto LABEL_42;
  }
  unint64_t v25 = *(void *)(a1 + 136);
  long long v26 = (char *)v189 + v25;
  if ((unint64_t)v189 + v25 <= v25)
  {
    CFIndex v177 = a3;
    v178 = a2;
    long long v29 = 0;
    size_t v30 = 0;
    char v31 = 0;
    long long v28 = 0;
    uint64_t v17 = 4294960545;
    goto LABEL_42;
  }
  if ((unint64_t)v26 > 0x3E80)
  {
    CFIndex v177 = a3;
    v178 = a2;
    long long v29 = 0;
    size_t v30 = 0;
    char v31 = 0;
    long long v28 = 0;
    uint64_t v17 = 4294960553;
    goto LABEL_42;
  }
  long long v27 = (unsigned __int8 *)malloc_type_realloc(*(void **)(a1 + 128), (size_t)v26, 0x940CB596uLL);
  long long v28 = v27;
  if (!v27)
  {
    CFIndex v177 = a3;
    v178 = a2;
    long long v29 = 0;
    size_t v30 = 0;
    char v31 = 0;
LABEL_390:
    uint64_t v17 = 4294960568;
    goto LABEL_42;
  }
  memcpy(&v27[*(void *)(a1 + 136)], __src, (size_t)v24);
  if (*(void *)v214)
  {
    free(*(void **)v214);
    *(void *)v214 = 0;
  }
  if (v23 == -6727)
  {
    long long v29 = 0;
    size_t v30 = 0;
    char v31 = 0;
    uint64_t v17 = 0;
    *(void *)(a1 + 128) = 0;
    *(void *)(a1 + 136) = 0;
    CFIndex v177 = (CFIndex)v26;
    v178 = v28;
LABEL_42:
    id v8 = v181;
    goto LABEL_43;
  }
  CFIndex v177 = a3;
  v178 = a2;
  *(void *)(a1 + 128) = v28;
  *(void *)(a1 + 136) = v26;
  uint64_t v37 = TLV8BufferAppend((uint64_t)&v192, 12, 0, 0);
  if (v37)
  {
LABEL_41:
    uint64_t v17 = v37;
    long long v29 = 0;
    size_t v30 = 0;
    char v31 = 0;
    long long v28 = 0;
    goto LABEL_42;
  }
  size_t v30 = v193;
  long long v29 = (char *)v194;
  id v8 = v181;
  if (v194) {
    goto LABEL_79;
  }
  if ((unint64_t)v193 <= 1) {
    size_t v49 = 1;
  }
  else {
    size_t v49 = v193;
  }
  v50 = (char *)malloc_type_malloc(v49, 0xF62D7A9CuLL);
  long long v29 = v50;
  if (v50)
  {
    if (v30) {
      memcpy(v50, v192, v30);
    }
LABEL_79:
    char v31 = 0;
    uint64_t v17 = 0;
    long long v28 = 0;
    v192 = &v195;
    *(void *)&long long v193 = 0;
    v194 = 0;
    goto LABEL_43;
  }
  size_t v30 = 0;
  char v31 = 0;
  long long v28 = 0;
  uint64_t v17 = 4294960568;
LABEL_43:
  if (v194)
  {
    free(v194);
    v194 = 0;
  }
  if (*(void *)v214) {
    free(*(void **)v214);
  }
  size_t v182 = v30;
  v183 = v29;
  char *v8 = v31;
  if (v17) {
    goto LABEL_51;
  }
  if (!v29)
  {
    uint64_t v41 = *(unsigned int *)(a1 + 96);
    switch((int)v41)
    {
      case 1:
        uint64_t v59 = _SetupClientExchange(a1, v178, v177, (UInt8 **)&v183, (const char *)&v182, (uint64_t)v8, v21, v22);
        goto LABEL_123;
      case 2:
        uint64_t v59 = _SetupServerExchange(a1, v178, v177, (UInt8 **)&v183, &v182, (uint64_t)v8, (uint64_t)v21, v22);
        goto LABEL_123;
      case 3:
        uint64_t v59 = _VerifyClientExchange(a1, v178, v177, &v183, (uint64_t)&v182, (uint64_t)v8, (uint64_t)v21, v22);
        goto LABEL_123;
      case 4:
        uint64_t v59 = _VerifyServerExchange(a1, v178, v177, (UInt8 **)&v183, &v182, (uint64_t)v8, (uint64_t)v21, v22);
        goto LABEL_123;
      case 5:
        uint64_t v59 = _ResumePairingClientExchange(a1, v178, v177, &v183, &v182, v8, (uint64_t)v21, v22);
        goto LABEL_123;
      case 6:
        uint64_t v59 = _ResumePairingServerExchange(a1, v178, v177, &v183, &v182, v8, (uint64_t)v21, v22);
LABEL_123:
        uint64_t v17 = v59;
        goto LABEL_124;
      case 9:
      case 11:
      case 13:
        uint64_t v42 = *__s;
        if (!*__s)
        {
          uint64_t v42 = 1;
          char *__s = 1;
        }
        unint64_t v43 = (unint64_t)&v178[v177];
        if (v177)
        {
          long long v44 = v178;
          do
          {
            if (v44 == (unsigned __int8 *)v43) {
              goto LABEL_268;
            }
            if ((unint64_t)v44 >= v43)
            {
              uint64_t v17 = 4294960591;
              goto LABEL_286;
            }
            if (v43 - (unint64_t)v44 < 2)
            {
LABEL_268:
              uint64_t v17 = 4294960569;
              goto LABEL_286;
            }
            long long v45 = v44 + 2;
            uint64_t v46 = v44[1];
            v47 = &v44[v46 + 2];
            if ((unint64_t)v47 > v43)
            {
              uint64_t v17 = 4294960546;
              goto LABEL_286;
            }
            int v48 = *v44;
            v44 += v46 + 2;
          }
          while (v48 != 6);
          if (v46 != 1) {
            goto LABEL_404;
          }
          if (*v45 != v42) {
            goto LABEL_205;
          }
        }
        else
        {
          v47 = 0;
        }
        if (v42 != 2)
        {
          if (v42 != 1)
          {
            v72 = *(int **)(a1 + 16);
            if (*v72 <= 60)
            {
              if (*v72 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v72, 0x3Cu)) {
                  goto LABEL_205;
                }
                v72 = *(int **)(a1 + 16);
                uint64_t v42 = *(unsigned __int8 *)(a1 + 120);
              }
              LogPrintF((uint64_t)v72, (uint64_t)"OSStatus _AdminPairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### AdminPairing client bad state: %d\n", v19, v20, (uint64_t)v21, v22, v42);
            }
LABEL_205:
            uint64_t v17 = 4294960587;
            goto LABEL_286;
          }
          LODWORD(v186) = 0;
          long long v212 = 0u;
          long long v213 = 0u;
          long long v210 = 0u;
          long long v211 = 0u;
          long long v208 = 0u;
          long long v209 = 0u;
          long long v206 = 0u;
          long long v207 = 0u;
          long long v204 = 0u;
          long long v205 = 0u;
          long long v202 = 0u;
          long long v203 = 0u;
          long long v200 = 0u;
          long long v201 = 0u;
          long long v198 = 0u;
          long long v199 = 0u;
          long long v197 = 0u;
          long long v196 = 0u;
          long long v195 = 0u;
          v189 = 0;
          __src = 0;
          v192 = &v195;
          long long v193 = xmmword_18E416F70;
          v194 = 0;
          if (!v177)
          {
            LODWORD(v186) = TLV8BufferAppend((uint64_t)&v192, 6, __s, 1uLL);
            if (v186) {
              goto LABEL_101;
            }
            uint64_t v77 = *(unsigned int *)(a1 + 96);
            switch(v77)
            {
              case 0xD:
                v214[0] = 5;
                int appended = TLV8BufferAppend((uint64_t)&v192, 0, v214, 1uLL);
LABEL_220:
                LODWORD(v186) = appended;
                if (appended) {
                  goto LABEL_101;
                }
LABEL_221:
                size_t v96 = v193;
                v97 = (char *)v194;
                if (!v194)
                {
                  if ((unint64_t)v193 <= 1) {
                    size_t v98 = 1;
                  }
                  else {
                    size_t v98 = v193;
                  }
                  v99 = (char *)malloc_type_malloc(v98, 0xF62D7A9CuLL);
                  if (!v99)
                  {
                    LODWORD(v186) = -6728;
                    id v8 = v181;
                    goto LABEL_101;
                  }
                  v97 = v99;
                  if (v96) {
                    memcpy(v99, v192, v96);
                  }
                }
                v192 = &v195;
                *(void *)&long long v193 = 0;
                v194 = 0;
                size_t v182 = v96;
                v183 = v97;
                LODWORD(v186) = 0;
                *(unsigned char *)(a1 + 120) = 2;
                v100 = *(int **)(a1 + 16);
                int v101 = *v100;
                id v8 = v181;
                if (*v100 > 30) {
                  goto LABEL_101;
                }
                if (v101 == -1)
                {
                  if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
                    goto LABEL_101;
                  }
                  v100 = *(int **)(a1 + 16);
                  int v101 = *v100;
                }
                if (v101 > 10) {
                  uint64_t v102 = 1;
                }
                else {
                  uint64_t v102 = v101 == -1 && !_LogCategory_Initialize((uint64_t)v100, 0xAu);
                }
                LogPrintF((uint64_t)v100, (uint64_t)"OSStatus _AdminPairingClientM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"AdminPairing client M1 -- request\n%?{end}%1{tlv8}\n", v19, v20, (uint64_t)v21, v22, v102);
LABEL_101:
                if (v189) {
                  free(v189);
                }
                if (v194) {
                  free(v194);
                }
                uint64_t v17 = v186;
                char *v8 = 0;
                if (!v17) {
                  goto LABEL_125;
                }
LABEL_287:
                v135 = *(int **)(a1 + 16);
                int v136 = *v135;
                if (*v135 > 50) {
                  goto LABEL_124;
                }
                if (v136 == -1)
                {
                  if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x32u)) {
                    goto LABEL_124;
                  }
                  v135 = *(int **)(a1 + 16);
                  int v136 = *v135;
                }
                uint64_t v137 = *__s;
                if (v136 == -1) {
                  _LogCategory_Initialize((uint64_t)v135, 0x28u);
                }
                LogPrintF((uint64_t)v135, (uint64_t)"OSStatus _AdminPairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### AdminPairing client state %d failed: %#m\n%?{end}%1{tlv8}\n", v19, v20, (uint64_t)v21, v22, v137);
LABEL_124:
                if (v17) {
                  goto LABEL_51;
                }
LABEL_125:
                size_t v60 = v182;
                long long v212 = 0u;
                long long v213 = 0u;
                long long v210 = 0u;
                long long v211 = 0u;
                long long v208 = 0u;
                long long v209 = 0u;
                long long v206 = 0u;
                long long v207 = 0u;
                long long v204 = 0u;
                long long v205 = 0u;
                long long v202 = 0u;
                long long v203 = 0u;
                long long v200 = 0u;
                long long v201 = 0u;
                long long v198 = 0u;
                long long v199 = 0u;
                long long v197 = 0u;
                long long v196 = 0u;
                long long v195 = 0u;
                v192 = &v195;
                long long v193 = xmmword_18E416F70;
                v194 = 0;
                if (*(void *)(a1 + 112) >= v182)
                {
                  uint64_t v17 = 0;
                  *v179 = v183;
                  size_t *v180 = v60;
                  goto LABEL_50;
                }
                if (*(void *)(a1 + 144) || *(void *)(a1 + 152))
                {
                  uint64_t v17 = 4294960593;
                  goto LABEL_51;
                }
                v61 = v183;
                *(void *)(a1 + 144) = v183;
                *(void *)(a1 + 152) = v60;
                size_t v62 = *(void *)(a1 + 104);
                *(void *)(a1 + 160) = v62;
                *(unsigned char *)(a1 + 168) = *v8;
                uint64_t v63 = TLV8BufferAppend((uint64_t)&v192, 12, v61, v62);
                v183 = 0;
                v64 = v194;
                if (v63)
                {
                  uint64_t v17 = v63;
                  if (!v194) {
                    goto LABEL_51;
                  }
LABEL_130:
                  free(v64);
                  goto LABEL_51;
                }
                size_t v65 = v193;
                if (!v194)
                {
                  if ((unint64_t)v193 <= 1) {
                    size_t v66 = 1;
                  }
                  else {
                    size_t v66 = v193;
                  }
                  v67 = malloc_type_malloc(v66, 0xF62D7A9CuLL);
                  if (!v67)
                  {
                    uint64_t v17 = 4294960568;
                    v64 = v194;
                    if (!v194) {
                      goto LABEL_51;
                    }
                    goto LABEL_130;
                  }
                  v64 = v67;
                  if (v65) {
                    memcpy(v67, v192, v65);
                  }
                }
                uint64_t v17 = 0;
                v192 = &v195;
                *(void *)&long long v193 = 0;
                v194 = 0;
                *v179 = (char *)v64;
                size_t *v180 = v65;
                char *v181 = 0;
                goto LABEL_51;
              case 0xB:
                v214[0] = 4;
                LODWORD(v186) = TLV8BufferAppend((uint64_t)&v192, 0, v214, 1uLL);
                if (v186) {
                  goto LABEL_101;
                }
                v103 = (char *)CFDictionaryGetOrCopyBytes(*(const __CFDictionary **)(a1 + 344), @"controllerIdentifier", (CFIndex *)&__src, (UInt8 **)&v189, (int *)&v186);
                if (!v103) {
                  goto LABEL_101;
                }
                LODWORD(v186) = TLV8BufferAppend((uint64_t)&v192, 1, v103, (size_t)__src);
                if (v186) {
                  goto LABEL_101;
                }
                if (v189)
                {
                  free(v189);
                  v189 = 0;
                }
                goto LABEL_221;
              case 9:
                v214[0] = 3;
                LODWORD(v186) = TLV8BufferAppend((uint64_t)&v192, 0, v214, 1uLL);
                if (v186) {
                  goto LABEL_101;
                }
                v78 = (char *)CFDictionaryGetOrCopyBytes(*(const __CFDictionary **)(a1 + 344), @"controllerIdentifier", (CFIndex *)&__src, (UInt8 **)&v189, (int *)&v186);
                if (!v78) {
                  goto LABEL_101;
                }
                LODWORD(v186) = TLV8BufferAppend((uint64_t)&v192, 1, v78, (size_t)__src);
                if (v186) {
                  goto LABEL_101;
                }
                if (v189)
                {
                  free(v189);
                  v189 = 0;
                }
                CFDictionaryRef v79 = *(const __CFDictionary **)(a1 + 344);
                CFTypeID TypeID = CFDataGetTypeID();
                CFDataRef TypedValue = CFDictionaryGetTypedValue(v79, @"controllerPK", TypeID, (int *)&v186);
                if (!TypedValue) {
                  goto LABEL_101;
                }
                CFDataRef v82 = TypedValue;
                BytePtr = CFDataGetBytePtr(TypedValue);
                size_t Length = CFDataGetLength(v82);
                v85 = (char *)BytePtr;
                id v8 = v181;
                LODWORD(v186) = TLV8BufferAppend((uint64_t)&v192, 3, v85, Length);
                if (v186) {
                  goto LABEL_101;
                }
                unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(*(const __CFDictionary **)(a1 + 344), @"permissions", 0, 0xFFFFFFFFLL, (int *)&v186);
                if (v186) {
                  goto LABEL_101;
                }
                int appended = TLV8BufferAppendUInt64((uint64_t)&v192, 11, Int64Ranged);
                goto LABEL_220;
            }
            v104 = *(int **)(a1 + 16);
            if (*v104 <= 60)
            {
              if (*v104 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v104, 0x3Cu)) {
                  goto LABEL_371;
                }
                v104 = *(int **)(a1 + 16);
                uint64_t v77 = *(unsigned int *)(a1 + 96);
              }
              LogPrintF((uint64_t)v104, (uint64_t)"OSStatus _AdminPairingClientM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x3Cu, (uint64_t)"### AdminPairing client bad session type %d\n", v19, v20, (uint64_t)v21, v22, v77);
            }
          }
LABEL_371:
          LODWORD(v186) = -6705;
          goto LABEL_101;
        }
        v69 = *(int **)(a1 + 16);
        int v70 = *v69;
        if (*v69 > 30) {
          goto LABEL_271;
        }
        if (v70 != -1) {
          goto LABEL_145;
        }
        if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
        {
          v69 = *(int **)(a1 + 16);
          int v70 = *v69;
LABEL_145:
          if (v70 > 10) {
            uint64_t v71 = 1;
          }
          else {
            uint64_t v71 = v70 == -1 && !_LogCategory_Initialize((uint64_t)v69, 0xAu);
          }
          LogPrintF((uint64_t)v69, (uint64_t)"OSStatus _AdminPairingClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, const uint8_t *const)", 0x1Eu, (uint64_t)"AdminPairing client M2 -- response\n%?{end}%1{tlv8}\n", v19, v20, (uint64_t)v21, v22, v71);
        }
LABEL_271:
        v129 = v178;
        while (v43 > (unint64_t)v129)
        {
          if (v43 - (unint64_t)v129 < 2) {
            break;
          }
          v130 = v129 + 2;
          uint64_t v131 = v129[1];
          if ((unint64_t)&v129[v131 + 2] > v43) {
            break;
          }
          int v132 = *v129;
          v129 += v131 + 2;
          if (v132 == 7)
          {
            if (v131 == 1)
            {
              uint64_t v133 = *v130;
              if (v133 >= 9)
              {
                if (v133 == 9) {
                  uint64_t v17 = 4294960520;
                }
                else {
                  uint64_t v17 = 4294960596;
                }
              }
              else
              {
                uint64_t v17 = dword_18E418B30[v133];
              }
              v134 = *(int **)(a1 + 16);
              if (*v134 <= 50)
              {
                if (*v134 != -1) {
                  goto LABEL_284;
                }
                if (_LogCategory_Initialize((uint64_t)v134, 0x32u))
                {
                  v134 = *(int **)(a1 + 16);
                  uint64_t v133 = *v130;
LABEL_284:
                  LogPrintF((uint64_t)v134, (uint64_t)"OSStatus _AdminPairingClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, const uint8_t *const)", 0x32u, (uint64_t)"### AdminPairing client M2 bad status: 0x%X, %#m\n", v19, v20, (uint64_t)v21, v22, v133);
                }
              }
              goto LABEL_286;
            }
LABEL_404:
            uint64_t v17 = 4294960553;
            goto LABEL_286;
          }
        }
        if (*(_DWORD *)(a1 + 96) == 13)
        {
          Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
          if (!Mutable)
          {
            uint64_t v17 = 4294960568;
            goto LABEL_286;
          }
          while (2)
          {
            CFMutableDictionaryRef v138 = 0;
LABEL_298:
            if (v43 > (unint64_t)v47 && v43 - (unint64_t)v47 >= 2)
            {
              v139 = v47;
              v140 = (char *)(v47 + 2);
              CFIndex v141 = v47[1];
              v47 += v141 + 2;
              if ((unint64_t)v47 <= v43)
              {
                unsigned __int8 v142 = *v139;
                if (v138
                  || (CFMutableDictionaryRef v138 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])) != 0)
                {
                  switch(((v142 + 1) >> 1) | ((v142 + 1) << 7))
                  {
                    case 0:
                      if (CFDictionaryGetCount(v138) >= 1) {
                        CFArrayAppendValue(Mutable, v138);
                      }
                      CFRelease(v138);
                      continue;
                    case 1:
                      uint64_t v143 = CFDictionarySetCString(v138, @"identifier", v140, v141);
                      if (!v143) {
                        goto LABEL_298;
                      }
                      break;
                    case 2:
                      uint64_t v143 = CFDictionarySetData(v138, @"pk", (UInt8 *)v140, v141);
                      if (!v143) {
                        goto LABEL_298;
                      }
                      break;
                    case 6:
                      uint64_t v17 = 4294960553;
                      int v144 = v141 - 1;
                      id v8 = v181;
                      switch(v144)
                      {
                        case 0:
                          uint64_t v145 = *v140;
                          break;
                        case 1:
                          uint64_t v145 = *((unsigned __int16 *)v139 + 1);
                          break;
                        case 2:
                        case 4:
                        case 5:
                        case 6:
                          goto LABEL_402;
                        case 3:
                          uint64_t v145 = *(unsigned int *)v140;
                          break;
                        case 7:
                          uint64_t v145 = *(void *)v140;
                          break;
                        default:
                          goto LABEL_401;
                      }
                      uint64_t v143 = CFDictionarySetInt64(v138, @"permissions", v145);
                      if (!v143) {
                        goto LABEL_298;
                      }
                      break;
                    default:
                      goto LABEL_298;
                  }
                  uint64_t v17 = v143;
LABEL_401:
                  id v8 = v181;
LABEL_402:
                  CFRelease(v138);
                  CFRelease(Mutable);
                }
                else
                {
                  CFRelease(Mutable);
                  uint64_t v17 = 4294960568;
                  id v8 = v181;
                }
                goto LABEL_286;
              }
            }
            break;
          }
          id v8 = v181;
          if (v138)
          {
            if (CFDictionaryGetCount(v138) >= 1) {
              CFArrayAppendValue(Mutable, v138);
            }
            CFRelease(v138);
          }
          uint64_t v17 = PairingSessionSetProperty(a1, @"pairings", Mutable);
          CFRelease(Mutable);
          if (v17)
          {
LABEL_286:
            char *v8 = 0;
            goto LABEL_287;
          }
        }
        *(unsigned char *)(a1 + 120) = 3;
        v158 = *(int **)(a1 + 16);
        if (*v158 > 30) {
          goto LABEL_394;
        }
        if (*v158 != -1) {
          goto LABEL_386;
        }
        if (_LogCategory_Initialize((uint64_t)v158, 0x1Eu))
        {
          v158 = *(int **)(a1 + 16);
LABEL_386:
          LogPrintF((uint64_t)v158, (uint64_t)"OSStatus _AdminPairingClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, const uint8_t *const)", 0x1Eu, (uint64_t)"AdminPairing client done\n", v19, v20, (uint64_t)v21, v22, v172);
        }
LABEL_394:
        size_t v182 = 0;
        v183 = 0;
        char *v8 = 1;
        goto LABEL_125;
      case 10:
      case 12:
      case 14:
        v51 = &v178[v177];
        v52 = v178;
        do
        {
          if (v52 == v51)
          {
LABEL_218:
            uint64_t v17 = 4294960569;
            goto LABEL_208;
          }
          if (v52 >= v51)
          {
            uint64_t v17 = 4294960591;
            goto LABEL_208;
          }
          if ((unint64_t)(v51 - v52) < 2) {
            goto LABEL_218;
          }
          v53 = v52 + 2;
          uint64_t v54 = v52[1];
          if (&v52[v54 + 2] > v51)
          {
            uint64_t v17 = 4294960546;
            goto LABEL_208;
          }
          int v55 = *v52;
          v52 += v54 + 2;
        }
        while (v55 != 6);
        if (v54 != 1)
        {
          uint64_t v17 = 4294960553;
          goto LABEL_208;
        }
        if (*v53 == 1) {
          _PairingSessionReset(a1);
        }
        uint64_t v56 = *__s;
        if (*__s)
        {
          if (*v53 != v56) {
            goto LABEL_207;
          }
          if (v56 != 1)
          {
            v57 = *(int **)(a1 + 16);
            if (*v57 <= 60)
            {
              if (*v57 != -1) {
                goto LABEL_94;
              }
              if (_LogCategory_Initialize((uint64_t)v57, 0x3Cu))
              {
                v57 = *(int **)(a1 + 16);
                uint64_t v56 = *(unsigned __int8 *)(a1 + 120);
LABEL_94:
                LogPrintF((uint64_t)v57, (uint64_t)"OSStatus _AdminPairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### AdminPairing server bad state: %d\n", v19, v20, (uint64_t)v21, v22, v56);
              }
            }
LABEL_207:
            uint64_t v17 = 4294960587;
LABEL_208:
            char *v8 = 0;
            goto LABEL_209;
          }
        }
        else
        {
          char *__s = 1;
          if (*v53 != 1) {
            goto LABEL_207;
          }
        }
        long long v212 = 0u;
        long long v213 = 0u;
        long long v210 = 0u;
        long long v211 = 0u;
        long long v208 = 0u;
        long long v209 = 0u;
        long long v206 = 0u;
        long long v207 = 0u;
        long long v204 = 0u;
        long long v205 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        long long v197 = 0u;
        long long v196 = 0u;
        long long v195 = 0u;
        char __dst = 0;
        CFIndex v185 = 0;
        v186 = 0;
        v184 = 0;
        v192 = &v195;
        long long v193 = xmmword_18E416F70;
        v194 = 0;
        char *__s = 2;
        v58 = 0;
        unsigned int Bytes = TLV8BufferAppend((uint64_t)&v192, 6, __s, 1uLL);
        if (Bytes) {
          goto LABEL_109;
        }
        uint64_t v73 = *(unsigned int *)(a1 + 96);
        switch(v73)
        {
          case 0xE:
            unsigned int Bytes = TLV8GetBytes(v178, v51, 0, 1uLL, 1uLL, &__dst, 0, 0);
            if (Bytes) {
              goto LABEL_411;
            }
            if (__dst == 5)
            {
              v58 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              if (v58)
              {
                v88 = *(uint64_t (**)(unsigned int *, void))(a1 + 912);
                if (v88)
                {
                  v89 = (__CFArray *)v88(&Bytes, *(void *)(a1 + 920));
                  unsigned int v90 = Bytes;
                }
                else
                {
                  *(_DWORD *)v214 = 0;
                  v89 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
                  if (v89)
                  {
                    v105 = _PairingSessionCopyPeers(a1, 0, 0, v214);
                    if (v105)
                    {
                      v106 = v105;
                      CFIndex Count = CFArrayGetCount(v105);
                      if (Count < 1)
                      {
LABEL_250:
                        CFRelease(v106);
                        id v8 = v181;
                      }
                      else
                      {
                        CFIndex v107 = 0;
                        while (1)
                        {
                          CFTypeID v108 = CFDictionaryGetTypeID();
                          CFArrayRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v106, v107, v108, (int *)v214);
                          if (*(_DWORD *)v214) {
                            break;
                          }
                          CFDictionaryRef v110 = TypedValueAtIndex;
                          CFMutableDictionaryRef v111 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                          if (!v111)
                          {
                            *(_DWORD *)v214 = -6728;
                            break;
                          }
                          CFMutableDictionaryRef v112 = v111;
                          CFTypeID v113 = CFStringGetTypeID();
                          CFDictionaryRef v114 = CFDictionaryGetTypedValue(v110, @"identifier", v113, (int *)v214);
                          if (!v114
                            || (CFDictionarySetValue(v112, @"identifier", v114),
                                CFTypeID v115 = CFDataGetTypeID(),
                                (CFDictionaryRef v116 = CFDictionaryGetTypedValue(v110, @"pk", v115, (int *)v214)) == 0))
                          {
                            CFRelease(v112);
                            break;
                          }
                          CFDictionarySetValue(v112, @"pk", v116);
                          unsigned int v117 = CFDictionaryGetInt64Ranged(v110, @"permissions", 0, 0xFFFFFFFFLL, 0);
                          CFDictionarySetInt64(v112, @"permissions", v117);
                          CFArrayAppendValue(v89, v112);
                          CFRelease(v112);
                          if (Count == ++v107) {
                            goto LABEL_250;
                          }
                        }
                        CFRelease(v106);
                        CFRelease(v89);
                        v89 = 0;
                        id v8 = v181;
                      }
                    }
                  }
                  else
                  {
                    *(_DWORD *)v214 = -6728;
                  }
                  unsigned int v90 = *(_DWORD *)v214;
                  unsigned int Bytes = *(_DWORD *)v214;
                }
                if (!v89 || v90) {
                  goto LABEL_435;
                }
                CFIndex theArray = CFArrayGetCount(v89);
                if (theArray < 1)
                {
LABEL_432:
                  unsigned int Bytes = 0;
                }
                else
                {
                  CFIndex v159 = 0;
                  unsigned int v191 = 0;
                  while (1)
                  {
                    *(void *)v214 = 0;
                    v189 = 0;
                    __src = 0;
                    if (v159)
                    {
                      unsigned int v160 = TLV8BufferAppend((uint64_t)&v192, 255, 0, 0);
                      unsigned int v191 = v160;
                      if (v160) {
                        goto LABEL_434;
                      }
                    }
                    CFTypeID v161 = CFDictionaryGetTypeID();
                    CFArrayRef v162 = CFArrayGetTypedValueAtIndex(v89, v159, v161, (int *)&v191);
                    if (!v162) {
                      break;
                    }
                    CFDictionaryRef v163 = v162;
                    CFTypeID v164 = CFStringGetTypeID();
                    CFStringRef v165 = (const __CFString *)CFDictionaryGetTypedValue(v163, @"identifier", v164, (int *)&v191);
                    if (!v165) {
                      break;
                    }
                    unsigned int v160 = CFStringGetOrCopyCStringUTF8(v165, (const char **)v214, &__src, (size_t *)&v189);
                    unsigned int v191 = v160;
                    if (v160) {
                      goto LABEL_433;
                    }
                    unsigned int v160 = TLV8BufferAppend((uint64_t)&v192, 1, *(char **)v214, (size_t)v189);
                    unsigned int v191 = v160;
                    if (__src)
                    {
                      free(__src);
                      unsigned int v160 = v191;
                    }
                    id v8 = v181;
                    if (v160) {
                      goto LABEL_434;
                    }
                    CFTypeID v166 = CFDataGetTypeID();
                    CFDataRef v167 = CFDictionaryGetTypedValue(v163, @"pk", v166, (int *)&v191);
                    if (!v167) {
                      break;
                    }
                    CFDataRef v168 = v167;
                    v169 = (char *)CFDataGetBytePtr(v167);
                    size_t v170 = CFDataGetLength(v168);
                    unsigned int v160 = TLV8BufferAppend((uint64_t)&v192, 3, v169, v170);
                    unsigned int v191 = v160;
                    if (v160)
                    {
LABEL_433:
                      id v8 = v181;
LABEL_434:
                      unsigned int Bytes = v160;
                      goto LABEL_435;
                    }
                    unsigned int v171 = CFDictionaryGetInt64Ranged(v163, @"permissions", 0, 0xFFFFFFFFLL, 0);
                    unsigned int v160 = TLV8BufferAppendUInt64((uint64_t)&v192, 11, v171);
                    unsigned int v191 = v160;
                    id v8 = v181;
                    if (v160) {
                      goto LABEL_434;
                    }
                    if (theArray == ++v159) {
                      goto LABEL_432;
                    }
                  }
                  unsigned int Bytes = v191;
                  id v8 = v181;
                  if (v191) {
                    goto LABEL_435;
                  }
                }
LABEL_352:
                size_t v149 = v193;
                v150 = (char *)v194;
                if (!v194)
                {
                  if ((unint64_t)v193 <= 1) {
                    size_t v151 = 1;
                  }
                  else {
                    size_t v151 = v193;
                  }
                  v152 = (char *)malloc_type_malloc(v151, 0xF62D7A9CuLL);
                  if (!v152)
                  {
                    unsigned int Bytes = -6728;
                    goto LABEL_365;
                  }
                  v150 = v152;
                  if (v149) {
                    memcpy(v152, v192, v149);
                  }
                }
                v192 = &v195;
                *(void *)&long long v193 = 0;
                v194 = 0;
                size_t v182 = v149;
                v183 = v150;
                unsigned int Bytes = 0;
                v153 = *(int **)(a1 + 16);
                int v154 = *v153;
                if (*v153 < 31)
                {
                  id v8 = v181;
                  if (v154 == -1)
                  {
                    BOOL v156 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu);
                    v153 = *(int **)(a1 + 16);
                    if (!v156) {
                      goto LABEL_374;
                    }
                    int v154 = *v153;
                  }
                  if (v154 > 10) {
                    uint64_t v155 = 1;
                  }
                  else {
                    uint64_t v155 = v154 == -1 && !_LogCategory_Initialize((uint64_t)v153, 0xAu);
                  }
                  LogPrintF((uint64_t)v153, (uint64_t)"OSStatus _AdminPairingServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"AdminPairing server M4 -- response\n%?{end}%1{tlv8}\n", v19, v20, (uint64_t)v21, v22, v155);
                  v153 = *(int **)(a1 + 16);
LABEL_374:
                  int v157 = *v153;
                  char *__s = 3;
                  if (v157 > 30) {
                    goto LABEL_435;
                  }
                  if (v157 == -1)
                  {
                    if (!_LogCategory_Initialize((uint64_t)v153, 0x1Eu))
                    {
LABEL_435:
                      if (v89) {
                        CFRelease(v89);
                      }
                      goto LABEL_109;
                    }
                    v153 = *(int **)(a1 + 16);
                  }
                  LogPrintF((uint64_t)v153, (uint64_t)"OSStatus _AdminPairingServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"AdminPairing server done\n", v19, v20, (uint64_t)v21, v22, v172);
                  goto LABEL_435;
                }
                char *__s = 3;
LABEL_365:
                id v8 = v181;
                goto LABEL_435;
              }
              goto LABEL_412;
            }
            break;
          case 0xC:
            unsigned int Bytes = TLV8GetBytes(v178, v51, 0, 1uLL, 1uLL, &__dst, 0, 0);
            if (!Bytes)
            {
              if (__dst == 4)
              {
                v58 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                if (v58)
                {
                  unsigned int Bytes = TLV8GetOrCopyCoalesced(v178, v51, 1, &v186, (size_t *)&v185, &v184, 0);
                  if (Bytes) {
                    goto LABEL_109;
                  }
                  unsigned int Bytes = CFDictionarySetCString(v58, @"identifier", (const char *)v186, v185);
                  if (Bytes) {
                    goto LABEL_109;
                  }
                  if (v184)
                  {
                    free(v184);
                    v184 = 0;
                  }
                  v75 = *(uint64_t (**)(__CFDictionary *, uint64_t))(a1 + 896);
                  if (!v75)
                  {
                    LODWORD(v189) = 0;
                    *(void *)v214 = 0;
                    __src = 0;
                    v118 = (char *)CFDictionaryGetOrCopyBytes(v58, @"identifier", (CFIndex *)v214, &__src, (int *)&v189);
                    if (v118)
                    {
                      _PairingSessionDeletePeer(a1, v118, *(uint64_t *)v214, v119, v19, v20, (uint64_t)v21, v22);
                      LODWORD(v189) = 0;
                    }
                    if (__src) {
                      free(__src);
                    }
                    int v91 = (int)v189;
LABEL_256:
                    unsigned int Bytes = v91;
                    if (!v91)
                    {
LABEL_351:
                      v89 = 0;
                      goto LABEL_352;
                    }
LABEL_257:
                    v120 = *(int **)(a1 + 16);
                    if (*v120 > 50) {
                      goto LABEL_321;
                    }
                    if (*v120 == -1)
                    {
                      BOOL v146 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x32u);
                      int v91 = Bytes;
                      if (!v146)
                      {
LABEL_321:
                        if (v91 > -6761)
                        {
                          if (v91 > -6728)
                          {
                            if (v91 == -6727)
                            {
                              unint64_t v147 = 4;
                              goto LABEL_350;
                            }
                            if (v91 == -6700)
                            {
                              unint64_t v147 = 1;
                              goto LABEL_350;
                            }
                          }
                          else
                          {
                            if (v91 == -6760)
                            {
                              unint64_t v147 = 3;
                              goto LABEL_350;
                            }
                            if (v91 == -6754)
                            {
                              unint64_t v147 = 2;
                              goto LABEL_350;
                            }
                          }
                        }
                        else if (v91 > -6765)
                        {
                          if (v91 == -6764)
                          {
                            unint64_t v147 = 6;
                            goto LABEL_350;
                          }
                          if (v91 == -6763)
                          {
                            unint64_t v147 = 5;
                            goto LABEL_350;
                          }
                        }
                        else
                        {
                          if (v91 == -71144)
                          {
                            unint64_t v147 = 8;
                            goto LABEL_350;
                          }
                          if (v91 == -6773)
                          {
                            unint64_t v147 = 7;
                            goto LABEL_350;
                          }
                        }
                        if (v91 == -6776) {
                          unint64_t v147 = 9;
                        }
                        else {
                          unint64_t v147 = 1;
                        }
LABEL_350:
                        unsigned int Bytes = TLV8BufferAppendUInt64((uint64_t)&v192, 7, v147);
                        if (!Bytes) {
                          goto LABEL_351;
                        }
LABEL_109:
                        if (v184) {
                          free(v184);
                        }
                        if (v58) {
                          CFRelease(v58);
                        }
                        if (v194) {
                          free(v194);
                        }
                        uint64_t v17 = Bytes;
                        char *v8 = Bytes == 0;
                        if (!v17) {
                          goto LABEL_125;
                        }
LABEL_209:
                        v93 = *(int **)(a1 + 16);
                        int v94 = *v93;
                        if (*v93 > 50) {
                          goto LABEL_51;
                        }
                        if (v94 == -1)
                        {
                          if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x32u)) {
                            goto LABEL_51;
                          }
                          v93 = *(int **)(a1 + 16);
                          int v94 = *v93;
                        }
                        uint64_t v95 = *__s;
                        if (v94 == -1) {
                          _LogCategory_Initialize((uint64_t)v93, 0x28u);
                        }
                        LogPrintF((uint64_t)v93, (uint64_t)"OSStatus _AdminPairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### AdminPairing server state %d failed: %#m\n%?{end}%1{tlv8}\n", v19, v20, (uint64_t)v21, v22, v95);
                        goto LABEL_51;
                      }
                      v120 = *(int **)(a1 + 16);
                    }
                    LogPrintF((uint64_t)v120, (uint64_t)"OSStatus _AdminPairingServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x32u, (uint64_t)"### AdminPairing server failed for %##@: %#m\n", v19, v20, (uint64_t)v21, v22, (uint64_t)v58);
                    int v91 = Bytes;
                    goto LABEL_321;
                  }
                  uint64_t v76 = *(void *)(a1 + 904);
LABEL_198:
                  int v91 = v75(v58, v76);
                  goto LABEL_256;
                }
                goto LABEL_412;
              }
              break;
            }
            goto LABEL_411;
          case 0xA:
            unsigned int Bytes = TLV8GetBytes(v178, v51, 0, 1uLL, 1uLL, &__dst, 0, 0);
            if (!Bytes)
            {
              if (__dst == 3)
              {
                v58 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                if (v58)
                {
                  unsigned int Bytes = TLV8GetOrCopyCoalesced(v178, v51, 1, &v186, (size_t *)&v185, &v184, 0);
                  if (Bytes) {
                    goto LABEL_109;
                  }
                  unsigned int Bytes = CFDictionarySetCString(v58, @"identifier", (const char *)v186, v185);
                  if (Bytes) {
                    goto LABEL_109;
                  }
                  if (v184)
                  {
                    free(v184);
                    v184 = 0;
                  }
                  unsigned int Bytes = TLV8GetOrCopyCoalesced(v178, v51, 3, &v186, (size_t *)&v185, &v184, 0);
                  if (Bytes) {
                    goto LABEL_109;
                  }
                  unsigned int Bytes = CFDictionarySetData(v58, @"pk", v186, v185);
                  if (Bytes) {
                    goto LABEL_109;
                  }
                  if (v184)
                  {
                    free(v184);
                    v184 = 0;
                  }
                  unint64_t UInt64 = TLV8GetUInt64(v178, v51, 11, (int *)&Bytes, 0);
                  if (Bytes) {
                    goto LABEL_109;
                  }
                  if (!HIDWORD(UInt64))
                  {
                    unsigned int Bytes = CFDictionarySetInt64(v58, @"permissions", UInt64);
                    if (Bytes) {
                      goto LABEL_109;
                    }
                    v75 = *(uint64_t (**)(__CFDictionary *, uint64_t))(a1 + 880);
                    if (!v75)
                    {
                      LODWORD(v189) = 0;
                      *(void *)v214 = 0;
                      __src = 0;
                      v121 = CFDictionaryGetOrCopyBytes(v58, @"identifier", (CFIndex *)v214, &__src, (int *)&v189);
                      if (v121)
                      {
                        v122 = (char *)v121;
                        CFTypeID v123 = CFDataGetTypeID();
                        CFDataRef v124 = CFDictionaryGetTypedValue(v58, @"pk", v123, (int *)&v189);
                        if (v124)
                        {
                          CFDataRef v125 = v124;
                          if (CFDataGetLength(v124) == 32)
                          {
                            unsigned int v126 = CFDictionaryGetInt64Ranged(v58, @"permissions", 0, 0xFFFFFFFFLL, 0);
                            v127 = *(void **)v214;
                            v128 = (unsigned __int8 *)CFDataGetBytePtr(v125);
                            LODWORD(v189) = _PairingSessionSavePeerKeychain(a1, v122, (uint64_t)v127, v128, v126);
                          }
                          else
                          {
                            LODWORD(v189) = -6743;
                          }
                        }
                      }
                      if (__src) {
                        free(__src);
                      }
                      int v91 = (int)v189;
                      unsigned int Bytes = v189;
                      id v8 = v181;
                      if (!v189) {
                        goto LABEL_351;
                      }
                      goto LABEL_257;
                    }
                    uint64_t v76 = *(void *)(a1 + 888);
                    goto LABEL_198;
                  }
                  unsigned int v148 = -6710;
LABEL_340:
                  unsigned int Bytes = v148;
                  goto LABEL_109;
                }
LABEL_412:
                unsigned int v148 = -6728;
                goto LABEL_340;
              }
              break;
            }
LABEL_411:
            v58 = 0;
            goto LABEL_109;
          default:
            v92 = *(int **)(a1 + 16);
            if (*v92 <= 60)
            {
              if (*v92 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v92, 0x3Cu)) {
                  break;
                }
                v92 = *(int **)(a1 + 16);
                uint64_t v73 = *(unsigned int *)(a1 + 96);
              }
              LogPrintF((uint64_t)v92, (uint64_t)"OSStatus _AdminPairingServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x3Cu, (uint64_t)"### AdminPairing server bad session type %d\n", v19, v20, (uint64_t)v21, v22, v73);
            }
            break;
        }
        v58 = 0;
        unsigned int v148 = -6705;
        goto LABEL_340;
      default:
        v68 = *(int **)(a1 + 16);
        if (*v68 > 60) {
          goto LABEL_183;
        }
        if (*v68 != -1) {
          goto LABEL_142;
        }
        if (_LogCategory_Initialize((uint64_t)v68, 0x3Cu))
        {
          v68 = *(int **)(a1 + 16);
          uint64_t v41 = *(unsigned int *)(a1 + 96);
LABEL_142:
          LogPrintF((uint64_t)v68, (uint64_t)"OSStatus PairingSessionExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Bad pair type: %d\n", v19, v20, (uint64_t)v21, v22, v41);
        }
LABEL_183:
        uint64_t v17 = 4294960587;
        goto LABEL_51;
    }
  }
  uint64_t v17 = 0;
  *v179 = v29;
  *a5 = v30;
LABEL_50:
  v183 = 0;
LABEL_51:
  if (v28) {
    free(v28);
  }
  if (v183) {
    free(v183);
  }
  if (v17 != -6771 && v17) {
    _PairingSessionReset(a1);
  }
  return v17;
}

uint64_t _SetupClientExchange(uint64_t a1, unsigned __int8 *a2, CFIndex a3, UInt8 **a4, const char *a5, uint64_t a6, const void *a7, uint64_t a8)
{
  id v8 = (unsigned char *)a6;
  CFDataRef v9 = (size_t *)a5;
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  memset(v175, 0, sizeof(v175));
  memset(v171, 0, sizeof(v171));
  uint64_t v164 = 0;
  CFStringRef v165 = 0;
  size_t v162 = 0;
  CFDictionaryRef v163 = 0;
  size_t v160 = 0;
  CFTypeID v161 = 0;
  size_t v158 = 0;
  CFIndex v159 = 0;
  uint64_t v172 = v175;
  long long v173 = xmmword_18E416F70;
  v174 = 0;
  long long v169 = xmmword_18E416F70;
  CFDataRef v168 = (int8x16_t *)v171;
  size_t v170 = 0;
  uint64_t v15 = (char *)(a1 + 120);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 120);
  if (!*(unsigned char *)(a1 + 120))
  {
    uint64_t v14 = 1;
    *uint64_t v15 = 1;
  }
  unint64_t v16 = (unint64_t)&a2[a3];
  unsigned int appended = 0;
  if (!a3) {
    goto LABEL_12;
  }
  uint64_t v17 = a2;
  do
  {
    if (v17 == (unsigned __int8 *)v16)
    {
LABEL_80:
      unsigned int v42 = -6727;
LABEL_83:
      CFNumberRef Int64 = 0;
      LOBYTE(v32) = 0;
      goto LABEL_70;
    }
    if ((unint64_t)v17 >= v16)
    {
      unsigned int v42 = -6705;
      goto LABEL_83;
    }
    if (v16 - (unint64_t)v17 < 2) {
      goto LABEL_80;
    }
    uint64_t v18 = v17 + 2;
    uint64_t v19 = v17[1];
    if ((unint64_t)&v17[v19 + 2] > v16)
    {
      unsigned int v42 = -6750;
      goto LABEL_83;
    }
    int v20 = *v17;
    v17 += v19 + 2;
  }
  while (v20 != 6);
  uint64_t v164 = v19;
  CFStringRef v165 = v18;
  unsigned int appended = 0;
  if (v19 != 1) {
    goto LABEL_285;
  }
  if (*v18 != v14)
  {
LABEL_69:
    CFNumberRef Int64 = 0;
    LOBYTE(v32) = 0;
    unsigned int v42 = -6709;
    goto LABEL_70;
  }
LABEL_12:
  switch((int)v14)
  {
    case 1:
      if (a3) {
        goto LABEL_343;
      }
      unsigned int appended = TLV8BufferAppendUInt64((uint64_t)&v172, 0, *(_DWORD *)(a1 + 100) & 1);
      if (appended) {
        goto LABEL_47;
      }
      unsigned int appended = TLV8BufferAppend((uint64_t)&v172, 6, v15, 1uLL);
      if (appended) {
        goto LABEL_47;
      }
      int v21 = *(_DWORD *)(a1 + 100);
      if ((v21 & 0x5770FF34) != 0 && (v21 & 0x7770FF10) != 0)
      {
        unsigned int appended = TLV8BufferAppendUInt64((uint64_t)&v172, 19, v21 & 0x7770FF10);
        if (appended) {
          goto LABEL_47;
        }
      }
      unsigned int appended = TLV8BufferDetach((uint64_t)&v172, a4, v9);
      if (appended) {
        goto LABEL_47;
      }
      *(unsigned char *)(a1 + 120) = 2;
      uint64_t v22 = *(int **)(a1 + 16);
      int v23 = *v22;
      if (*v22 > 30) {
        goto LABEL_311;
      }
      if (v23 == -1)
      {
        if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
          goto LABEL_311;
        }
        uint64_t v22 = *(int **)(a1 + 16);
        int v23 = *v22;
      }
      if (v23 > 10) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = v23 == -1 && !_LogCategory_Initialize((uint64_t)v22, 0xAu);
      }
      LogPrintF((uint64_t)v22, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup client M1 -- start request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v24);
      goto LABEL_311;
    case 2:
      uint64_t v33 = *(int **)(a1 + 16);
      int v34 = *v33;
      if (*v33 > 30) {
        goto LABEL_86;
      }
      if (v34 != -1) {
        goto LABEL_50;
      }
      if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
      {
        uint64_t v33 = *(int **)(a1 + 16);
        int v34 = *v33;
LABEL_50:
        if (v34 > 10) {
          BOOL v35 = 0;
        }
        else {
          BOOL v35 = v34 != -1 || _LogCategory_Initialize((uint64_t)v33, 0xAu);
        }
        LogPrintF((uint64_t)v33, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup client M2 -- start response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, (uint64_t)a7, a8, !v35);
      }
LABEL_86:
      unint64_t v43 = a2;
      do
      {
        if (v43 == (unsigned __int8 *)v16)
        {
LABEL_189:
          unsigned int v75 = -6727;
          goto LABEL_209;
        }
        if ((unint64_t)v43 >= v16)
        {
          unsigned int v75 = -6705;
          goto LABEL_209;
        }
        if (v16 - (unint64_t)v43 < 2) {
          goto LABEL_189;
        }
        long long v44 = v43 + 2;
        uint64_t v45 = v43[1];
        if ((unint64_t)&v43[v45 + 2] > v16)
        {
          unsigned int v75 = -6750;
LABEL_209:
          unsigned int appended = v75;
          v84 = *(void **)(a1 + 696);
          if (v84)
          {
            SRPDelete_libsrp(v84);
            *(void *)(a1 + 696) = 0;
          }
          v85 = malloc_type_calloc(1uLL, 0x38uLL, 0x103004063A0F53DuLL);
          if (v85)
          {
            *(void *)(a1 + 696) = v85;
            unsigned int appended = 0;
            v86 = *(void **)(a1 + 720);
            if (v86)
            {
              free(v86);
              *(void *)(a1 + 720) = 0;
            }
            *(void *)(a1 + 728) = 0;
            *(void *)(a1 + 720) = TLV8CopyCoalesced(a2, &a2[a3], 2, (size_t *)(a1 + 728), (int *)&appended);
            if (appended) {
              goto LABEL_158;
            }
            if (*(void *)(a1 + 728) <= 0xFuLL) {
              goto LABEL_285;
            }
            v87 = *(void **)(a1 + 704);
            if (v87)
            {
              free(v87);
              *(void *)(a1 + 704) = 0;
            }
            *(void *)(a1 + 712) = 0;
            *(void *)(a1 + 704) = TLV8CopyCoalesced(a2, &a2[a3], 3, (size_t *)(a1 + 712), (int *)&appended);
            if (appended) {
              goto LABEL_158;
            }
            if (!*(void *)(a1 + 712)) {
              goto LABEL_285;
            }
            *(_DWORD *)(a1 + 288) = TLV8GetUInt64(a2, &a2[a3], 19, 0, 0);
            uint64_t UInt64 = TLV8GetUInt64(a2, &a2[a3], 27, 0, 0);
            if (UInt64)
            {
              CFNumberRef Int64 = CFNumberCreateInt64(UInt64);
              if (!Int64) {
                goto LABEL_351;
              }
              PairingSessionSetProperty(a1, @"setupCodeType", Int64);
              CFRelease(Int64);
            }
            *(unsigned char *)(a1 + 120) = 3;
            a5 = *(const char **)(a1 + 384);
            if (!a5 || (a6 = *(void *)(a1 + 392)) == 0)
            {
              v89 = *(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 48);
              if (!v89)
              {
LABEL_349:
                CFNumberRef Int64 = 0;
                LOBYTE(v32) = 0;
                unsigned int v42 = -6745;
                goto LABEL_70;
              }
              unsigned int v90 = *(_DWORD *)(a1 + 100);
              if (*(unsigned char *)(a1 + 400)) {
                uint64_t v91 = v90 | 0x10000;
              }
              else {
                uint64_t v91 = v90;
              }
              unsigned int appended = v89(v91, 0xFFFFFFFFLL, *(void *)(a1 + 24));
              if (appended) {
                goto LABEL_158;
              }
              a5 = *(const char **)(a1 + 384);
              if (!a5 || (a6 = *(void *)(a1 + 392)) == 0)
              {
                CFNumberRef Int64 = 0;
                LOBYTE(v32) = 0;
                unsigned int v42 = -6771;
                goto LABEL_70;
              }
            }
LABEL_31:
            long long v26 = *(uint64_t **)(a1 + 696);
            if (!v26
              || (uint64_t v27 = *(void *)(a1 + 704)) == 0
              || (uint64_t v28 = *(void *)(a1 + 712)) == 0
              || (a7 = *(const void **)(a1 + 720)) == 0
              || (a8 = *(void *)(a1 + 728)) == 0)
            {
              CFNumberRef Int64 = 0;
              LOBYTE(v32) = 0;
              unsigned int v130 = -6703;
LABEL_342:
              unsigned int appended = v130;
              goto LABEL_160;
            }
            if (*(void *)(a1 + 736))
            {
              free(*(void **)(a1 + 736));
              *(void *)(a1 + 736) = 0;
              long long v26 = *(uint64_t **)(a1 + 696);
              a5 = *(const char **)(a1 + 384);
              a6 = *(void *)(a1 + 392);
              a7 = *(const void **)(a1 + 720);
              a8 = *(void *)(a1 + 728);
              uint64_t v27 = *(void *)(a1 + 704);
              uint64_t v28 = *(void *)(a1 + 712);
            }
            *(void *)(a1 + 744) = 0;
            unsigned int appended = SRPClientStart_libsrp(v26, &_kSRPParameters_3072_SHA512, "Pair-Setup", 10, a5, a6, a7, a8, v27, v28, &v161, &v160, (void *)(a1 + 736), (void *)(a1 + 744), &v159, &v158);
            if (appended) {
              goto LABEL_47;
            }
            long long v29 = *(void **)(a1 + 704);
            if (v29)
            {
              free(v29);
              *(void *)(a1 + 704) = 0;
            }
            *(void *)(a1 + 712) = 0;
            size_t v30 = *(void **)(a1 + 720);
            if (v30)
            {
              free(v30);
              *(void *)(a1 + 720) = 0;
            }
            *(void *)(a1 + 728) = 0;
            unsigned int appended = TLV8BufferAppend((uint64_t)&v172, 6, v15, 1uLL);
            if (appended
              || (unsigned int appended = TLV8BufferAppend((uint64_t)&v172, 3, (char *)v161, v160)) != 0
              || (unsigned int appended = TLV8BufferAppend((uint64_t)&v172, 4, (char *)v159, v158)) != 0
              || (unsigned int appended = TLV8BufferDetach((uint64_t)&v172, a4, v9)) != 0)
            {
LABEL_47:
              CFNumberRef Int64 = 0;
              LOBYTE(v32) = 0;
              goto LABEL_160;
            }
            *(unsigned char *)(a1 + 120) = 4;
            v120 = *(int **)(a1 + 16);
            int v121 = *v120;
            if (*v120 <= 30)
            {
              if (v121 != -1)
              {
LABEL_281:
                if (v121 > 10) {
                  uint64_t v122 = 1;
                }
                else {
                  uint64_t v122 = v121 == -1 && !_LogCategory_Initialize((uint64_t)v120, 0xAu);
                }
                LogPrintF((uint64_t)v120, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup  client M3 -- verify request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v122);
                goto LABEL_311;
              }
              if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
              {
                v120 = *(int **)(a1 + 16);
                int v121 = *v120;
                goto LABEL_281;
              }
            }
LABEL_311:
            LOBYTE(v32) = 0;
            goto LABEL_312;
          }
          CFNumberRef Int64 = 0;
LABEL_351:
          LOBYTE(v32) = 0;
LABEL_352:
          unsigned int v42 = -6728;
          goto LABEL_70;
        }
        int v46 = *v43;
        v43 += v45 + 2;
      }
      while (v46 != 7);
      unsigned int appended = 0;
      if (v45 != 1) {
        goto LABEL_285;
      }
      uint64_t v47 = *v44;
      unsigned int v48 = -6737;
      switch(*v44)
      {
        case 0:
          goto LABEL_108;
        case 1:
          unsigned int v48 = -6700;
          goto LABEL_108;
        case 2:
          unsigned int v48 = -6754;
          goto LABEL_108;
        case 3:
          unint64_t v49 = TLV8GetUInt64(a2, &a2[a3], 8, (int *)&appended, 0);
          if (appended) {
            goto LABEL_158;
          }
          unint64_t v50 = v49;
          if (v49 >> 31)
          {
            CFNumberRef Int64 = 0;
            LOBYTE(v32) = 0;
            unsigned int v42 = -6710;
            goto LABEL_70;
          }
          _PairingSessionReset(a1);
          v51 = *(uint64_t (**)(void, unint64_t, void))(a1 + 48);
          if (!v51) {
            goto LABEL_349;
          }
          unsigned int v52 = v51(*(_DWORD *)(a1 + 100) | 0x20000u, v50, *(void *)(a1 + 24));
          break;
        case 4:
          unsigned int v48 = -6727;
          goto LABEL_108;
        case 5:
          unsigned int v48 = -6763;
          goto LABEL_108;
        case 6:
          unsigned int v48 = -6764;
          goto LABEL_108;
        case 7:
          unsigned int v48 = -6773;
          goto LABEL_108;
        case 8:
          unsigned int v48 = -71144;
          goto LABEL_108;
        default:
          if (v47 == 9) {
            unsigned int v48 = -6776;
          }
          else {
            unsigned int v48 = -6700;
          }
LABEL_108:
          unsigned int appended = v48;
          v53 = *(int **)(a1 + 16);
          if (*v53 > 50) {
            goto LABEL_158;
          }
          if (*v53 != -1) {
            goto LABEL_110;
          }
          if (_LogCategory_Initialize((uint64_t)v53, 0x32u))
          {
            v53 = *(int **)(a1 + 16);
            uint64_t v47 = *v44;
LABEL_110:
            LogPrintF((uint64_t)v53, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup client M2 bad status: 0x%X, %#m\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v47);
          }
          goto LABEL_158;
      }
LABEL_203:
      CFNumberRef Int64 = 0;
      LOBYTE(v32) = 0;
      if (v52) {
        unsigned int v42 = v52;
      }
      else {
        unsigned int v42 = -6771;
      }
LABEL_70:
      unsigned int appended = v42;
LABEL_160:
      if (v9 && a4 && !appended) {
        _PairingSessionUpdateTranscript(a1, a2, a3, *a4, *v9);
      }
      unsigned char *v8 = (_BYTE)v32;
      if (v174)
      {
        free(v174);
        v174 = 0;
      }
      if (v170)
      {
        free(v170);
        size_t v170 = 0;
      }
      if (v163) {
        free(v163);
      }
      if (Int64) {
        free(Int64);
      }
      if (v161) {
        free(v161);
      }
      if (v159) {
        free(v159);
      }
      uint64_t v69 = appended;
      if (appended != -6771)
      {
        if (appended)
        {
          int v70 = *(int **)(a1 + 16);
          int v71 = *v70;
          if (*v70 <= 50)
          {
            if (v71 != -1) {
              goto LABEL_180;
            }
            BOOL v73 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x32u);
            uint64_t v69 = appended;
            if (v73)
            {
              int v70 = *(int **)(a1 + 16);
              int v71 = *v70;
LABEL_180:
              uint64_t v72 = *v15;
              if (v71 == -1) {
                _LogCategory_Initialize((uint64_t)v70, 0x28u);
              }
              LogPrintF((uint64_t)v70, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup client state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v72);
              return appended;
            }
          }
        }
      }
      return v69;
    case 3:
      if (a3)
      {
LABEL_343:
        CFNumberRef Int64 = 0;
        LOBYTE(v32) = 0;
        unsigned int v42 = -6705;
        goto LABEL_70;
      }
      a5 = *(const char **)(a1 + 384);
      if (!a5 || (a6 = *(void *)(a1 + 392)) == 0)
      {
        CFNumberRef Int64 = 0;
        LOBYTE(v32) = 0;
        unsigned int v130 = -6745;
        goto LABEL_342;
      }
      goto LABEL_31;
    case 4:
      if (!*(void *)(a1 + 696) || !*(void *)(a1 + 736) || !*(void *)(a1 + 744)) {
        goto LABEL_308;
      }
      char v36 = *(int **)(a1 + 16);
      int v37 = *v36;
      if (*v36 > 30) {
        goto LABEL_134;
      }
      if (v37 != -1) {
        goto LABEL_58;
      }
      if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
      {
        char v36 = *(int **)(a1 + 16);
        int v37 = *v36;
LABEL_58:
        if (v37 > 10) {
          BOOL v38 = 0;
        }
        else {
          BOOL v38 = v37 != -1 || _LogCategory_Initialize((uint64_t)v36, 0xAu);
        }
        LogPrintF((uint64_t)v36, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup client M4 -- verify response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, (uint64_t)a7, a8, !v38);
      }
LABEL_134:
      v61 = a2;
      while (1)
      {
        if (v61 == (unsigned __int8 *)v16)
        {
LABEL_191:
          unsigned int v77 = -6727;
          goto LABEL_247;
        }
        if ((unint64_t)v61 >= v16)
        {
          unsigned int v77 = -6705;
          goto LABEL_247;
        }
        if (v16 - (unint64_t)v61 < 2) {
          goto LABEL_191;
        }
        size_t v62 = v61 + 2;
        uint64_t v63 = v61[1];
        if ((unint64_t)&v61[v63 + 2] > v16) {
          break;
        }
        int v64 = *v61;
        v61 += v63 + 2;
        if (v64 == 7)
        {
          unsigned int appended = 0;
          if (v63 == 1)
          {
            uint64_t v65 = *v62;
            unsigned int v66 = -6737;
            switch(*v62)
            {
              case 0:
                goto LABEL_155;
              case 1:
                unsigned int v66 = -6700;
                goto LABEL_155;
              case 2:
                v67 = *(int **)(a1 + 16);
                if (*v67 > 30) {
                  goto LABEL_193;
                }
                if (*v67 != -1) {
                  goto LABEL_146;
                }
                if (_LogCategory_Initialize((uint64_t)v67, 0x1Eu))
                {
                  v67 = *(int **)(a1 + 16);
LABEL_146:
                  LogPrintF((uint64_t)v67, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"### Pair-setup client wrong setup code\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v154);
                }
LABEL_193:
                _PairingSessionReset(a1);
                v78 = *(void **)(a1 + 384);
                if (v78)
                {
                  free(v78);
                  *(void *)(a1 + 384) = 0;
                }
                *(void *)(a1 + 392) = 0;
                *(unsigned char *)(a1 + 400) = 1;
                if (!*(void *)(a1 + 48)) {
                  goto LABEL_349;
                }
                unsigned int v79 = *(_DWORD *)(a1 + 100);
                uint64_t v80 = TLV8GetUInt64(a2, &a2[a3], 8, 0, 0);
                if (v80) {
                  int v81 = 196608;
                }
                else {
                  int v81 = 0x10000;
                }
                uint64_t v82 = v81 | v79;
                if (v80) {
                  uint64_t v83 = v80;
                }
                else {
                  uint64_t v83 = 0xFFFFFFFFLL;
                }
                unsigned int v52 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 48))(v82, v83, *(void *)(a1 + 24));
                goto LABEL_203;
              case 3:
                unsigned int v66 = -6760;
                goto LABEL_155;
              case 4:
                unsigned int v66 = -6727;
                goto LABEL_155;
              case 5:
                unsigned int v66 = -6763;
                goto LABEL_155;
              case 6:
                unsigned int v66 = -6764;
                goto LABEL_155;
              case 7:
                unsigned int v66 = -6773;
                goto LABEL_155;
              case 8:
                unsigned int v66 = -71144;
                goto LABEL_155;
              default:
                if (v65 == 9) {
                  unsigned int v66 = -6776;
                }
                else {
                  unsigned int v66 = -6700;
                }
LABEL_155:
                unsigned int appended = v66;
                v68 = *(int **)(a1 + 16);
                if (*v68 > 50) {
                  goto LABEL_158;
                }
                if (*v68 != -1) {
                  goto LABEL_157;
                }
                if (_LogCategory_Initialize((uint64_t)v68, 0x32u))
                {
                  v68 = *(int **)(a1 + 16);
                  uint64_t v65 = *v62;
LABEL_157:
                  LogPrintF((uint64_t)v68, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup client M4 bad status: 0x%X, %#m\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v65);
                }
                goto LABEL_158;
            }
          }
LABEL_285:
          CFNumberRef Int64 = 0;
LABEL_286:
          LOBYTE(v32) = 0;
          unsigned int v42 = -6743;
          goto LABEL_70;
        }
      }
      unsigned int v77 = -6750;
LABEL_247:
      unsigned int appended = v77;
      unsigned int appended = TLV8GetOrCopyCoalesced(a2, &a2[a3], 4, &v165, (size_t *)&v164, &v163, 0);
      if (appended) {
        goto LABEL_158;
      }
      unsigned int v104 = SRPClientVerify_libsrp(*(void ***)(a1 + 696));
      unsigned int appended = v104;
      if (v163)
      {
        free(v163);
        CFDictionaryRef v163 = 0;
        unsigned int v104 = appended;
      }
      if (v104)
      {
        CFNumberRef Int64 = 0;
LABEL_355:
        LOBYTE(v32) = 0;
        unsigned int v42 = -6754;
        goto LABEL_70;
      }
      v105 = *(void **)(a1 + 696);
      if (v105)
      {
        SRPDelete_libsrp(v105);
        *(void *)(a1 + 696) = 0;
      }
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, *(void *)(a1 + 736), *(void *)(a1 + 744), "Pair-Setup-Encrypt-Salt", 0x17uLL, (uint64_t)"Pair-Setup-Encrypt-Info", 23, 0x20uLL, a1 + 414);
      if (*(unsigned char *)(a1 + 100))
      {
        unsigned int v106 = _MFiClientVerify(a1, a2, a3, "PS-Msg04", *(void *)(a1 + 736), *(void *)(a1 + 744), "MFi-Pair-Setup-Salt", 0x13uLL, (uint64_t)"MFi-Pair-Setup-Info", 19, 0);
        if (v106 == -71164 || v106 == 0) {
          unsigned int v108 = v106;
        }
        else {
          unsigned int v108 = -71145;
        }
        unsigned int appended = v108;
        if (v108) {
          goto LABEL_158;
        }
      }
      else
      {
        _ClientDecryptExtra(a1, a2, a3);
      }
      int v109 = *(_DWORD *)(a1 + 100);
      if ((v109 & 0x10) == 0 && ((*(_DWORD *)(a1 + 288) ^ v109) & 0x200) == 0)
      {
        CFDictionaryRef v110 = *(void (**)(uint64_t, void, void))(a1 + 864);
        if (v110) {
          v110(3, 0, *(void *)(a1 + 872));
        }
        CFMutableDictionaryRef v111 = *(void **)(a1 + 184);
        *(unsigned char *)(a1 + 120) = 5;
        if (v111)
        {
          free(v111);
          *(void *)(a1 + 184) = 0;
        }
        *(void *)(a1 + 192) = 0;
        BOOL v156 = (char *)(a1 + 510);
        unsigned int appended = PairingSessionCopyIdentity(a1, 1, (char **)(a1 + 184), (_OWORD *)(a1 + 510), a1 + 542);
        if (appended) {
          goto LABEL_158;
        }
        size_t v112 = strlen(*(const char **)(a1 + 184));
        *(void *)(a1 + 192) = v112;
        if (!v112)
        {
          CFNumberRef Int64 = 0;
          LOBYTE(v32) = 0;
          unsigned int v42 = -6708;
          goto LABEL_70;
        }
        size_t v113 = v112 + 64;
        uint64_t v164 = v112 + 64;
        CFNumberRef v114 = (const __CFNumber *)malloc_type_malloc(v112 + 64, 0xDF8555D7uLL);
        CFNumberRef Int64 = v114;
        CFDictionaryRef v163 = v114;
        if (!v114) {
          goto LABEL_351;
        }
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, *(void *)(a1 + 736), *(void *)(a1 + 744), "Pair-Setup-Controller-Sign-Salt", 0x1FuLL, (uint64_t)"Pair-Setup-Controller-Sign-Info", 31, 0x20uLL, (uint64_t)v114);
        memcpy((char *)Int64 + 32, *(const void **)(a1 + 184), *(void *)(a1 + 192));
        CFTypeID v115 = (_OWORD *)((char *)Int64 + *(void *)(a1 + 192) + 32);
        long long v116 = *(_OWORD *)(a1 + 526);
        *CFTypeID v115 = *(_OWORD *)v156;
        v115[1] = v116;
        unsigned int v117 = *(void (**)(void, CFNumberRef, size_t, char *, void))(a1 + 928);
        if (v117)
        {
          v117(*(unsigned int *)(a1 + 100), Int64, v113, __dst, *(void *)(a1 + 936));
        }
        else
        {
          ccsha512_di();
          cced25519_sign();
        }
        free(Int64);
        CFDictionaryRef v163 = 0;
        unsigned int appended = TLV8BufferAppend((uint64_t)&v168, 1, *(char **)(a1 + 184), *(void *)(a1 + 192));
        if (appended) {
          goto LABEL_158;
        }
        unsigned int appended = TLV8BufferAppend((uint64_t)&v168, 3, v156, 0x20uLL);
        if (appended) {
          goto LABEL_158;
        }
        unsigned int appended = TLV8BufferAppend((uint64_t)&v168, 10, __dst, 0x40uLL);
        if (appended) {
          goto LABEL_158;
        }
        CFStringRef v131 = *(const __CFString **)(a1 + 176);
        if (v131)
        {
          CFDataRef DataMutable = OPACKEncoderCreateDataMutable(v131, 0, (int *)&appended);
          CFNumberRef Int64 = DataMutable;
          if (!DataMutable) {
            goto LABEL_159;
          }
          BytePtr = (char *)CFDataGetBytePtr(DataMutable);
          size_t Length = CFDataGetLength(Int64);
          unsigned int appended = TLV8BufferAppend((uint64_t)&v168, 18, BytePtr, Length);
          CFRelease(Int64);
          if (appended) {
            goto LABEL_158;
          }
        }
        v135 = *(char **)(a1 + 216);
        if (v135)
        {
          unsigned int appended = TLV8BufferAppend((uint64_t)&v168, 16, v135, *(void *)(a1 + 224));
          if (appended) {
            goto LABEL_158;
          }
        }
        int v136 = *(_DWORD *)(a1 + 100);
        if ((v136 & 0x5770FF34) != 0 && (v136 & 0x1000E001) == 0)
        {
          SelfInfo = _PairingSessionGetSelfInfo(a1);
          if (SelfInfo)
          {
            CFDataRef v138 = OPACKEncoderCreateDataMutable((const __CFString *)SelfInfo, 0, (int *)&appended);
            CFNumberRef Int64 = v138;
            if (!v138) {
              goto LABEL_159;
            }
            v139 = (char *)CFDataGetBytePtr(v138);
            size_t v140 = CFDataGetLength(Int64);
            unsigned int appended = TLV8BufferAppend((uint64_t)&v168, 17, v139, v140);
            CFRelease(Int64);
            if (appended) {
              goto LABEL_158;
            }
          }
        }
        CFDictionaryRef v141 = *(const __CFDictionary **)(a1 + 344);
        CFTypeID TypeID = CFDataGetTypeID();
        CFDataRef TypedValue = CFDictionaryGetTypedValue(v141, @"ownershipProof", TypeID, 0);
        if (TypedValue)
        {
          CFDataRef v144 = TypedValue;
          uint64_t v145 = (char *)CFDataGetBytePtr(TypedValue);
          size_t v146 = CFDataGetLength(v144);
          unsigned int appended = TLV8BufferAppend((uint64_t)&v168, 26, v145, v146);
          if (appended) {
            goto LABEL_158;
          }
        }
        unint64_t v147 = (int8x16_t *)malloc_type_malloc(v169 + 16, 0x9E18AA4uLL);
        CFNumberRef Int64 = (CFNumberRef)v147;
        CFDictionaryRef v163 = v147;
        if (!v147) {
          goto LABEL_351;
        }
        _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), "PS-Msg05", 8, 0, 0, v168, v169, v147, (uint64_t)v147->i64 + v169);
        unsigned int appended = TLV8BufferAppend((uint64_t)&v172, 5, (char *)Int64, v169 + 16);
        if (appended) {
          goto LABEL_158;
        }
        free(Int64);
        CFDictionaryRef v163 = 0;
        unsigned int appended = TLV8BufferAppend((uint64_t)&v172, 6, v15, 1uLL);
        if (appended) {
          goto LABEL_158;
        }
        unsigned int appended = TLV8BufferDetach((uint64_t)&v172, a4, v9);
        if (appended) {
          goto LABEL_158;
        }
        *(unsigned char *)(a1 + 120) = 6;
        unsigned int v148 = *(int **)(a1 + 16);
        int v149 = *v148;
        if (*v148 > 30) {
          goto LABEL_366;
        }
        if (v149 == -1)
        {
          if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
          {
LABEL_366:
            LOBYTE(v32) = 0;
            goto LABEL_312;
          }
          unsigned int v148 = *(int **)(a1 + 16);
          int v149 = *v148;
        }
        if (v149 > 10) {
          uint64_t v150 = 1;
        }
        else {
          uint64_t v150 = v149 == -1 && !_LogCategory_Initialize((uint64_t)v148, 0xAu);
        }
        LogPrintF((uint64_t)v148, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup client M5 -- exchange request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v150);
        goto LABEL_366;
      }
      *(unsigned char *)(a1 + 120) = 7;
      *a4 = 0;
      *CFDataRef v9 = 0;
      v118 = *(int **)(a1 + 16);
      if (*v118 > 30) {
        goto LABEL_306;
      }
      if (*v118 != -1) {
        goto LABEL_275;
      }
      if (_LogCategory_Initialize((uint64_t)v118, 0x1Eu))
      {
        v118 = *(int **)(a1 + 16);
LABEL_275:
        uint64_t v119 = "Pair-setup transient client done -- server authenticated\n";
LABEL_276:
        LogPrintF((uint64_t)v118, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)v119, (uint64_t)a5, a6, (uint64_t)a7, a8, v155);
      }
LABEL_306:
      LOBYTE(v32) = 1;
LABEL_312:
      CFNumberRef Int64 = 0;
      unsigned int appended = 0;
      goto LABEL_160;
    case 6:
      if (!*(void *)(a1 + 736) || !*(void *)(a1 + 744))
      {
LABEL_308:
        CFNumberRef Int64 = 0;
        LOBYTE(v32) = 0;
        unsigned int v42 = -6703;
        goto LABEL_70;
      }
      long long v39 = *(int **)(a1 + 16);
      int v40 = *v39;
      if (*v39 > 30) {
        goto LABEL_115;
      }
      if (v40 != -1) {
        goto LABEL_65;
      }
      if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
      {
        long long v39 = *(int **)(a1 + 16);
        int v40 = *v39;
LABEL_65:
        if (v40 > 10) {
          BOOL v41 = 0;
        }
        else {
          BOOL v41 = v40 != -1 || _LogCategory_Initialize((uint64_t)v39, 0xAu);
        }
        LogPrintF((uint64_t)v39, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup client M6 -- exchange response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, (uint64_t)a7, a8, !v41);
      }
LABEL_115:
      uint64_t v54 = a2;
      while (1)
      {
        if (v54 == (unsigned __int8 *)v16)
        {
LABEL_190:
          unsigned int v76 = -6727;
          goto LABEL_235;
        }
        if ((unint64_t)v54 >= v16) {
          break;
        }
        if (v16 - (unint64_t)v54 < 2) {
          goto LABEL_190;
        }
        int v55 = v54 + 2;
        uint64_t v56 = v54[1];
        if ((unint64_t)&v54[v56 + 2] > v16)
        {
          unsigned int v76 = -6750;
          goto LABEL_235;
        }
        int v57 = *v54;
        v54 += v56 + 2;
        if (v57 == 7)
        {
          if (v56 != 1) {
            goto LABEL_285;
          }
          uint64_t v58 = *v55;
          if (v58 >= 9)
          {
            if (v58 == 9) {
              unsigned int v59 = -6776;
            }
            else {
              unsigned int v59 = -6700;
            }
          }
          else
          {
            unsigned int v59 = dword_18E418B30[v58];
          }
          unsigned int appended = v59;
          size_t v60 = *(int **)(a1 + 16);
          if (*v60 <= 50)
          {
            if (*v60 != -1)
            {
LABEL_129:
              LogPrintF((uint64_t)v60, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup client M6 bad status: 0x%X, %#m\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v58);
              goto LABEL_158;
            }
            if (_LogCategory_Initialize((uint64_t)v60, 0x32u))
            {
              size_t v60 = *(int **)(a1 + 16);
              uint64_t v58 = *v55;
              goto LABEL_129;
            }
          }
LABEL_158:
          CFNumberRef Int64 = 0;
          goto LABEL_159;
        }
      }
      unsigned int v76 = -6705;
LABEL_235:
      unsigned int appended = v76;
      v92 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v162, (int *)&appended);
      CFNumberRef Int64 = (CFNumberRef)v92;
      if (appended) {
        goto LABEL_159;
      }
      size_t v93 = v162;
      if (v162 <= 0xF) {
        goto LABEL_286;
      }
      v162 -= 16;
      int v94 = &v92[-1].u8[v93];
      unsigned int appended = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), "PS-Msg06", 8, 0, 0, v92, v162, v92, (uint64_t)v94, 16);
      if (appended) {
        goto LABEL_159;
      }
      uint64_t v95 = *(void **)(a1 + 232);
      if (v95) {
        free(v95);
      }
      *(void *)(a1 + 240) = 0;
      *(void *)(a1 + 232) = TLV8CopyCoalesced((unsigned __int8 *)Int64, v94, 16, (size_t *)(a1 + 240), 0);
      size_t v96 = *(const void **)(a1 + 312);
      if (v96)
      {
        CFRelease(v96);
        *(void *)(a1 + 312) = 0;
      }
      v97 = (UInt8 *)TLV8CopyCoalesced((unsigned __int8 *)Int64, v94, 17, (size_t *)&v164, 0);
      if (v97)
      {
        size_t v98 = v97;
        *(void *)(a1 + 312) = _OPACKDecodeBytes(0, v97, v164, 0, &appended);
        free(v98);
        v99 = *(const void **)(a1 + 312);
        if (!v99) {
          goto LABEL_159;
        }
        CFTypeID v100 = CFGetTypeID(v99);
        if (v100 != CFDictionaryGetTypeID())
        {
          unsigned int appended = -6756;
          size_t v151 = *(const void **)(a1 + 312);
          if (v151)
          {
            CFRelease(v151);
            LOBYTE(v32) = 0;
            *(void *)(a1 + 312) = 0;
            goto LABEL_160;
          }
          goto LABEL_159;
        }
        CFDictionaryRef v101 = *(const __CFDictionary **)(a1 + 312);
        CFTypeID v102 = CFDictionaryGetTypeID();
        CFDictionaryRef v103 = CFDictionaryGetTypedValue(v101, @"groupInfo", v102, 0);
      }
      else
      {
        CFDictionaryRef v103 = 0;
      }
      PairingSessionSetProperty(a1, @"groupInfoPeer", v103);
      CFTypeID v123 = *(void **)(a1 + 296);
      if (v123)
      {
        free(v123);
        *(void *)(a1 + 296) = 0;
      }
      CFDataRef v124 = (void *)(a1 + 304);
      *(void *)(a1 + 304) = 0;
      *(void *)(a1 + 296) = TLV8CopyCoalesced((unsigned __int8 *)Int64, v94, 1, (size_t *)(a1 + 304), (int *)&appended);
      if (appended) {
        goto LABEL_159;
      }
      if (!*v124) {
        goto LABEL_286;
      }
      int v157 = (unsigned __int8 *)(a1 + 606);
      unsigned int appended = TLV8GetBytes((unsigned __int8 *)Int64, v94, 3, 0x20uLL, 0x20uLL, (char *)(a1 + 606), 0, 0);
      if (appended
        || (unsigned int appended = TLV8GetBytes((unsigned __int8 *)Int64, v94, 10, 0x40uLL, 0x40uLL, __dst, 0, 0)) != 0)
      {
LABEL_159:
        LOBYTE(v32) = 0;
        goto LABEL_160;
      }
      CFDataRef v125 = (char *)malloc_type_malloc(*v124 + 64, 0x1D50F9BDuLL);
      uint64_t v32 = v125;
      CFDictionaryRef v163 = v125;
      if (!v125) {
        goto LABEL_352;
      }
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, *(void *)(a1 + 736), *(void *)(a1 + 744), "Pair-Setup-Accessory-Sign-Salt", 0x1EuLL, (uint64_t)"Pair-Setup-Accessory-Sign-Info", 30, 0x20uLL, (uint64_t)v125);
      memcpy(v32 + 32, *(const void **)(a1 + 296), *(void *)(a1 + 304));
      unsigned int v126 = &v32[*(void *)(a1 + 304) + 32];
      long long v127 = *(_OWORD *)(a1 + 622);
      *(_OWORD *)unsigned int v126 = *(_OWORD *)v157;
      *((_OWORD *)v126 + 1) = v127;
      ccsha512_di();
      unsigned int appended = cced25519_verify();
      if (appended) {
        goto LABEL_355;
      }
      free(v32);
      CFDictionaryRef v163 = 0;
      if (Int64) {
        free(Int64);
      }
      uint64_t v128 = _PairingSessionVerifyAllowed(a1);
      unsigned int appended = v128;
      if (v128)
      {
        uint64_t v152 = v128;
        v153 = *(int **)(a1 + 16);
        if (*v153 > 50) {
          goto LABEL_158;
        }
        if (*v153 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v153, 0x32u)) {
            goto LABEL_158;
          }
          v153 = *(int **)(a1 + 16);
          uint64_t v152 = appended;
        }
        LogPrintF((uint64_t)v153, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup client: server not allowed: %#m\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v152);
        goto LABEL_158;
      }
      unsigned int appended = PairingSessionSavePeer(a1, *(char **)(a1 + 296), *(void *)(a1 + 304), v157, (uint64_t)a5, a6, (uint64_t)a7, a8);
      if (appended) {
        goto LABEL_158;
      }
      v129 = *(void **)(a1 + 384);
      if (v129)
      {
        free(v129);
        *(void *)(a1 + 384) = 0;
      }
      *(void *)(a1 + 392) = 0;
      *(unsigned char *)(a1 + 400) = 0;
      *(unsigned char *)(a1 + 120) = 7;
      *a4 = 0;
      *CFDataRef v9 = 0;
      v118 = *(int **)(a1 + 16);
      if (*v118 > 30) {
        goto LABEL_306;
      }
      if (*v118 != -1) {
        goto LABEL_304;
      }
      if (!_LogCategory_Initialize((uint64_t)v118, 0x1Eu)) {
        goto LABEL_306;
      }
      v118 = *(int **)(a1 + 16);
LABEL_304:
      uint64_t v119 = "Pair-setup client done -- server authenticated\n";
      goto LABEL_276;
    default:
      unint64_t v25 = *(int **)(a1 + 16);
      if (*v25 > 60) {
        goto LABEL_69;
      }
      if (*v25 != -1) {
        goto LABEL_27;
      }
      if (_LogCategory_Initialize((uint64_t)v25, 0x3Cu))
      {
        unint64_t v25 = *(int **)(a1 + 16);
        uint64_t v14 = *(unsigned __int8 *)(a1 + 120);
LABEL_27:
        LogPrintF((uint64_t)v25, (uint64_t)"OSStatus _SetupClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-setup client bad state: %d\n", (uint64_t)a5, a6, (uint64_t)a7, a8, v14);
      }
      goto LABEL_69;
  }
}

uint64_t _SetupServerExchange(uint64_t a1, unsigned __int8 *a2, CFIndex a3, UInt8 **a4, size_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = (unsigned char *)a6;
  CFDataRef v9 = a5;
  CFIndex v10 = a3;
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  CFIndex v13 = &a2[a3];
  memset(v186, 0, sizeof(v186));
  memset(v182, 0, sizeof(v182));
  size_t v174 = 0;
  CFIndex length = 0;
  size_t v172 = 0;
  long long v173 = 0;
  uint64_t v170 = 0;
  uint64_t v171 = 0;
  uint64_t v168 = 0;
  long long v169 = 0;
  CFTypeID v166 = 0;
  uint64_t v167 = 0;
  size_t v164 = 0;
  CFStringRef v165 = 0;
  unsigned __int8 __dst = 0;
  v183 = v186;
  long long v184 = xmmword_18E416F70;
  CFIndex v185 = 0;
  v179 = (int8x16_t *)v182;
  long long v180 = xmmword_18E416F70;
  uint64_t v14 = a2;
  v181 = 0;
  do
  {
    if (v14 == v13)
    {
LABEL_48:
      unsigned int v35 = -6727;
      goto LABEL_51;
    }
    if (v14 >= v13)
    {
      unsigned int v35 = -6705;
      goto LABEL_51;
    }
    if ((unint64_t)(v13 - v14) < 2) {
      goto LABEL_48;
    }
    uint64_t v15 = v14 + 2;
    CFIndex v16 = v14[1];
    if (&v14[v16 + 2] > v13)
    {
      unsigned int v35 = -6750;
LABEL_51:
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      goto LABEL_108;
    }
    int v17 = *v14;
    v14 += v16 + 2;
  }
  while (v17 != 6);
  CFIndex length = v16;
  unsigned int appended = 0;
  if (v16 != 1)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    LOBYTE(v34) = 0;
    unsigned int v35 = -6743;
    goto LABEL_108;
  }
  if (*v15 == 1) {
    _PairingSessionReset(a1);
  }
  uint64_t v19 = (unsigned char *)(a1 + 120);
  uint64_t v18 = *(unsigned __int8 *)(a1 + 120);
  if (!*(unsigned char *)(a1 + 120))
  {
    uint64_t v18 = 1;
    unsigned char *v19 = 1;
  }
  if (*v15 != v18)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    LOBYTE(v34) = 0;
    unsigned int v108 = -6709;
LABEL_246:
    unsigned int appended = v108;
    goto LABEL_86;
  }
  if (v18 == 5)
  {
    if (!*(void *)(a1 + 736) || !*(void *)(a1 + 744))
    {
LABEL_245:
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      unsigned int v108 = -6703;
      goto LABEL_246;
    }
    size_t v160 = v8;
    uint64_t v28 = *(int **)(a1 + 16);
    int v29 = *v28;
    if (*v28 <= 30)
    {
      if (v29 == -1)
      {
        if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
          goto LABEL_80;
        }
        uint64_t v28 = *(int **)(a1 + 16);
        int v29 = *v28;
      }
      if (v29 > 10) {
        BOOL v30 = 0;
      }
      else {
        BOOL v30 = v29 != -1 || _LogCategory_Initialize((uint64_t)v28, 0xAu);
      }
      LogPrintF((uint64_t)v28, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup server M5 -- exchange request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, !v30);
    }
LABEL_80:
    unsigned int v48 = (int8x16_t *)TLV8CopyCoalesced(a2, v13, 5, &v174, (int *)&appended);
    uint64_t v32 = (unsigned __int8 *)v48;
    if (appended)
    {
LABEL_81:
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
LABEL_82:
      id v8 = v160;
      goto LABEL_86;
    }
    size_t v49 = v174;
    id v8 = v160;
    if (v174 <= 0xF)
    {
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      unsigned int v108 = -6743;
      goto LABEL_246;
    }
    v174 -= 16;
    unint64_t v50 = &v48[-1].u8[v49];
    unsigned int appended = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), "PS-Msg05", 8, 0, 0, v48, v174, v48, (uint64_t)v50, 16);
    if (appended)
    {
LABEL_85:
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      goto LABEL_86;
    }
    unsigned int v52 = *(const void **)(a1 + 280);
    if (v52)
    {
      CFRelease(v52);
      *(void *)(a1 + 280) = 0;
    }
    v53 = (UInt8 *)TLV8CopyCoalesced(v32, v50, 18, (size_t *)&length, 0);
    if (v53)
    {
      uint64_t v54 = v53;
      int v55 = _OPACKDecodeBytes(0, v53, length, 0, &appended);
      free(v54);
      if (!v55) {
        goto LABEL_81;
      }
      CFTypeID v56 = CFGetTypeID(v55);
      if (v56 != CFDictionaryGetTypeID())
      {
        unsigned int appended = -6756;
        CFRelease(v55);
        goto LABEL_81;
      }
      *(void *)(a1 + 280) = _PairingSessionIntersectACL(a1, (CFDictionaryRef)v55, &appended);
      uint64_t v61 = appended;
      if (appended)
      {
        size_t v62 = *(int **)(a1 + 16);
        CFDataRef v9 = a5;
        if (*v62 > 50) {
          goto LABEL_197;
        }
        if (*v62 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v62, 0x32u))
          {
LABEL_197:
            CFRelease(v55);
            if ((int)appended > -6761)
            {
              id v8 = v160;
              if ((int)appended > -6728)
              {
                if (appended == -6727)
                {
                  unint64_t v102 = 4;
                }
                else
                {
                  if (appended != -6700) {
                    goto LABEL_219;
                  }
                  unint64_t v102 = 1;
                }
              }
              else if (appended == -6760)
              {
                unint64_t v102 = 3;
              }
              else
              {
                if (appended != -6754) {
                  goto LABEL_219;
                }
                unint64_t v102 = 2;
              }
            }
            else
            {
              id v8 = v160;
              if ((int)appended > -6765)
              {
                if (appended == -6764)
                {
                  unint64_t v102 = 6;
                }
                else
                {
                  if (appended != -6763) {
                    goto LABEL_219;
                  }
                  unint64_t v102 = 5;
                }
              }
              else
              {
                if (appended != -71144)
                {
                  if (appended == -6773)
                  {
                    unint64_t v102 = 7;
                    goto LABEL_222;
                  }
LABEL_219:
                  if (appended == -6776) {
                    unint64_t v102 = 9;
                  }
                  else {
                    unint64_t v102 = 1;
                  }
                  goto LABEL_222;
                }
                unint64_t v102 = 8;
              }
            }
LABEL_222:
            unsigned int appended = TLV8BufferAppendUInt64((uint64_t)&v183, 7, v102);
            if (appended) {
              goto LABEL_235;
            }
            __s[0] = 6;
            unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, __s, 1uLL);
            if (appended) {
              goto LABEL_235;
            }
            unsigned int v104 = TLV8BufferDetach((uint64_t)&v183, a4, a5);
            v51 = a4;
            goto LABEL_238;
          }
          size_t v62 = *(int **)(a1 + 16);
          uint64_t v61 = appended;
        }
        LogPrintF((uint64_t)v62, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server M5 requested ACL not allowed: %#m, %@\n", v57, v58, v59, v60, v61);
        goto LABEL_197;
      }
      CFRelease(v55);
      id v8 = v160;
    }
    uint64_t v72 = *(void **)(a1 + 232);
    if (v72) {
      free(v72);
    }
    *(void *)(a1 + 240) = 0;
    *(void *)(a1 + 232) = TLV8CopyCoalesced(v32, v50, 16, (size_t *)(a1 + 240), 0);
    BOOL v73 = *(const void **)(a1 + 312);
    if (v73)
    {
      CFRelease(v73);
      *(void *)(a1 + 312) = 0;
    }
    v74 = (UInt8 *)TLV8CopyCoalesced(v32, v50, 17, (size_t *)&length, 0);
    if (v74)
    {
      unsigned int v75 = v74;
      *(void *)(a1 + 312) = _OPACKDecodeBytes(0, v74, length, 0, &appended);
      free(v75);
      unsigned int v76 = *(const void **)(a1 + 312);
      if (!v76) {
        goto LABEL_85;
      }
      CFTypeID v77 = CFGetTypeID(v76);
      if (v77 != CFDictionaryGetTypeID())
      {
        unsigned int appended = -6756;
        size_t v140 = *(const void **)(a1 + 312);
        if (v140)
        {
          CFRelease(v140);
          uint64_t v33 = 0;
          LOBYTE(v34) = 0;
          *(void *)(a1 + 312) = 0;
          goto LABEL_328;
        }
LABEL_327:
        uint64_t v33 = 0;
        LOBYTE(v34) = 0;
LABEL_328:
        id v8 = v160;
        goto LABEL_86;
      }
      CFDictionaryRef v78 = *(const __CFDictionary **)(a1 + 312);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(v78, @"groupInfo", TypeID, 0);
    }
    else
    {
      CFDictionaryRef TypedValue = 0;
    }
    PairingSessionSetProperty(a1, @"groupInfoPeer", TypedValue);
    int v81 = (const UInt8 *)TLV8CopyCoalesced(v32, v50, 26, (size_t *)&length, 0);
    if (v81)
    {
      uint64_t v82 = (UInt8 *)v81;
      CFDataRef v34 = CFDataCreate(0, v81, length);
      free(v82);
      if (!v34)
      {
        uint64_t v33 = 0;
        goto LABEL_334;
      }
      unsigned int appended = PairingSessionSetProperty(a1, @"ownershipProof", v34);
      CFRelease(v34);
      if (appended) {
        goto LABEL_81;
      }
    }
    uint64_t v83 = *(void **)(a1 + 296);
    if (v83)
    {
      free(v83);
      *(void *)(a1 + 296) = 0;
    }
    v84 = (void *)(a1 + 304);
    *(void *)(a1 + 304) = 0;
    *(void *)(a1 + 296) = TLV8CopyCoalesced(v32, v50, 1, (size_t *)(a1 + 304), (int *)&appended);
    if (appended) {
      goto LABEL_81;
    }
    if (!*v84)
    {
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      unsigned int v141 = -6743;
      goto LABEL_344;
    }
    unsigned int appended = TLV8GetBytes(v32, v50, 3, 0x20uLL, 0x20uLL, (char *)(a1 + 606), 0, 0);
    if (appended) {
      goto LABEL_81;
    }
    unsigned int appended = TLV8GetBytes(v32, v50, 10, 0x40uLL, 0x40uLL, __s, 0, 0);
    if (appended) {
      goto LABEL_81;
    }
    CFIndex v159 = (unsigned __int8 *)(a1 + 606);
    CFIndex length = *v84 + 64;
    v85 = (int8x16_t *)malloc_type_malloc(length, 0xC95DCA2EuLL);
    uint64_t v33 = v85;
    if (v85)
    {
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, *(void *)(a1 + 736), *(void *)(a1 + 744), "Pair-Setup-Controller-Sign-Salt", 0x1FuLL, (uint64_t)"Pair-Setup-Controller-Sign-Info", 31, 0x20uLL, (uint64_t)v85);
      memcpy(&v33[2], *(const void **)(a1 + 296), *(void *)(a1 + 304));
      v86 = &v33[2].i8[*(void *)(a1 + 304)];
      long long v87 = *(_OWORD *)(a1 + 622);
      *(_OWORD *)v86 = *(_OWORD *)v159;
      *((_OWORD *)v86 + 1) = v87;
      ccsha512_di();
      uint64_t v88 = cced25519_verify();
      unsigned int appended = v88;
      if (v88)
      {
        uint64_t v93 = v88;
        int v94 = *(int **)(a1 + 16);
        id v8 = v160;
        CFDataRef v9 = a5;
        if (*v94 <= 50)
        {
          if (*v94 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v94, 0x32u)) {
              goto LABEL_262;
            }
            int v94 = *(int **)(a1 + 16);
            uint64_t v93 = appended;
          }
          LogPrintF((uint64_t)v94, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup server bad signature: %#m\n", v89, v90, v91, v92, v93);
        }
LABEL_262:
        v177[0] = 2;
        unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 7, v177, 1uLL);
        if (!appended)
        {
          v177[0] = 6;
          unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, v177, 1uLL);
          if (!appended)
          {
            unsigned int appended = TLV8BufferDetach((uint64_t)&v183, a4, a5);
            if (!appended) {
              _PairingSessionReset(a1);
            }
          }
        }
        goto LABEL_236;
      }
      free(v33);
      uint64_t v109 = _PairingSessionVerifyAllowed(a1);
      unsigned int appended = v109;
      id v8 = v160;
      if (v109)
      {
        uint64_t v114 = v109;
        CFTypeID v115 = *(int **)(a1 + 16);
        CFDataRef v9 = a5;
        if (*v115 > 50) {
          goto LABEL_277;
        }
        if (*v115 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v115, 0x32u))
          {
LABEL_277:
            v177[0] = 9;
            unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 7, v177, 1uLL);
            if (appended) {
              goto LABEL_235;
            }
            v177[0] = 6;
            unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, v177, 1uLL);
            if (appended) {
              goto LABEL_235;
            }
            unsigned int appended = TLV8BufferDetach((uint64_t)&v183, a4, a5);
            if (!appended) {
              _PairingSessionReset(a1);
            }
            goto LABEL_327;
          }
          CFTypeID v115 = *(int **)(a1 + 16);
          uint64_t v114 = appended;
        }
        LogPrintF((uint64_t)v115, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup server: client not allowed: %#m\n", v110, v111, v112, v113, v114);
        goto LABEL_277;
      }
      uint64_t v121 = PairingSessionSavePeer(a1, *(char **)(a1 + 296), *(void *)(a1 + 304), v159, v110, v111, v112, v113);
      unsigned int appended = v121;
      if (v121)
      {
        unsigned int v126 = *(int **)(a1 + 16);
        if (*v126 > 60) {
          goto LABEL_303;
        }
        if (*v126 == -1)
        {
          BOOL v137 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x3Cu);
          uint64_t v121 = appended;
          if (!v137)
          {
LABEL_303:
            if ((int)v121 > -6761)
            {
              if ((int)v121 > -6728)
              {
                if (v121 == -6727)
                {
                  unint64_t v138 = 4;
                  goto LABEL_325;
                }
                if (v121 == -6700)
                {
                  unint64_t v138 = 1;
                  goto LABEL_325;
                }
              }
              else
              {
                if (v121 == -6760)
                {
                  unint64_t v138 = 3;
                  goto LABEL_325;
                }
                if (v121 == -6754)
                {
                  unint64_t v138 = 2;
                  goto LABEL_325;
                }
              }
            }
            else if ((int)v121 > -6765)
            {
              if (v121 == -6764)
              {
                unint64_t v138 = 6;
                goto LABEL_325;
              }
              if (v121 == -6763)
              {
                unint64_t v138 = 5;
                goto LABEL_325;
              }
            }
            else
            {
              if (v121 == -71144)
              {
                unint64_t v138 = 8;
                goto LABEL_325;
              }
              if (v121 == -6773)
              {
                unint64_t v138 = 7;
                goto LABEL_325;
              }
            }
            if (v121 == -6776) {
              unint64_t v138 = 9;
            }
            else {
              unint64_t v138 = 1;
            }
LABEL_325:
            unsigned int appended = TLV8BufferAppendUInt64((uint64_t)&v183, 7, v138);
            if (!appended)
            {
              v177[0] = 6;
              unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, v177, 1uLL);
              if (!appended)
              {
                CFDataRef v9 = a5;
                unsigned int v139 = TLV8BufferDetach((uint64_t)&v183, a4, a5);
                v51 = a4;
                uint64_t v33 = 0;
                LOBYTE(v34) = 0;
                unsigned int appended = v139;
                id v8 = v160;
                goto LABEL_110;
              }
            }
            goto LABEL_327;
          }
          unsigned int v126 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v126, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-setup server save peer failed: %#m\n", v122, v123, v124, v125, v121);
        LODWORD(v121) = appended;
        goto LABEL_303;
      }
      long long v127 = *(void **)(a1 + 184);
      *(unsigned char *)(a1 + 120) = 6;
      if (v127)
      {
        free(v127);
        *(void *)(a1 + 184) = 0;
      }
      *(void *)(a1 + 192) = 0;
      unsigned int appended = PairingSessionCopyIdentity(a1, 1, (char **)(a1 + 184), (_OWORD *)(a1 + 510), a1 + 542);
      if (appended) {
        goto LABEL_299;
      }
      size_t v128 = strlen(*(const char **)(a1 + 184));
      *(void *)(a1 + 192) = v128;
      if (v128)
      {
        size_t v129 = v128 + 64;
        CFIndex length = v128 + 64;
        unsigned int v130 = (char *)malloc_type_malloc(v128 + 64, 0xD90CBB8EuLL);
        if (v130)
        {
          CFStringRef v131 = v130;
          CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, *(void *)(a1 + 736), *(void *)(a1 + 744), "Pair-Setup-Accessory-Sign-Salt", 0x1EuLL, (uint64_t)"Pair-Setup-Accessory-Sign-Info", 30, 0x20uLL, (uint64_t)v130);
          memcpy(v131 + 32, *(const void **)(a1 + 184), *(void *)(a1 + 192));
          int v132 = &v131[*(void *)(a1 + 192) + 32];
          long long v133 = *(_OWORD *)(a1 + 526);
          *(_OWORD *)int v132 = *(_OWORD *)(a1 + 510);
          *((_OWORD *)v132 + 1) = v133;
          v134 = *(void (**)(void, char *, size_t, char *, void))(a1 + 928);
          if (v134)
          {
            v134(*(unsigned int *)(a1 + 100), v131, v129, __s, *(void *)(a1 + 936));
          }
          else
          {
            ccsha512_di();
            cced25519_sign();
          }
          free(v131);
          unsigned int appended = TLV8BufferAppend((uint64_t)&v179, 1, *(char **)(a1 + 184), *(void *)(a1 + 192));
          if (appended) {
            goto LABEL_299;
          }
          unsigned int appended = TLV8BufferAppend((uint64_t)&v179, 3, (char *)(a1 + 510), 0x20uLL);
          if (appended) {
            goto LABEL_299;
          }
          unsigned int appended = TLV8BufferAppend((uint64_t)&v179, 10, __s, 0x40uLL);
          if (appended) {
            goto LABEL_299;
          }
          uint64_t v143 = *(char **)(a1 + 216);
          if (v143)
          {
            unsigned int appended = TLV8BufferAppend((uint64_t)&v179, 16, v143, *(void *)(a1 + 224));
            if (appended) {
              goto LABEL_299;
            }
          }
          if ((*(_DWORD *)(a1 + 100) & 0x5770FF34) != 0)
          {
            SelfInfo = _PairingSessionGetSelfInfo(a1);
            if (SelfInfo)
            {
              CFDataRef DataMutable = OPACKEncoderCreateDataMutable((const __CFString *)SelfInfo, 0, (int *)&appended);
              if (!DataMutable) {
                goto LABEL_299;
              }
              CFDataRef v146 = DataMutable;
              BytePtr = (char *)CFDataGetBytePtr(DataMutable);
              size_t v148 = CFDataGetLength(v146);
              unsigned int appended = TLV8BufferAppend((uint64_t)&v179, 17, BytePtr, v148);
              CFRelease(v146);
              if (appended) {
                goto LABEL_299;
              }
            }
          }
          int v149 = (int8x16_t *)malloc_type_malloc(v180 + 16, 0xD87EDE7uLL);
          uint64_t v33 = v149;
          if (v149)
          {
            _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), "PS-Msg06", 8, 0, 0, v179, v180, v149, (uint64_t)v149->i64 + v180);
            unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 5, v33->i8, v180 + 16);
            if (appended) {
              goto LABEL_300;
            }
            free(v33);
            unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, (char *)(a1 + 120), 1uLL);
            if (!appended)
            {
              unsigned int appended = TLV8BufferDetach((uint64_t)&v183, a4, a5);
              if (!appended)
              {
                *(unsigned char *)(a1 + 120) = 7;
                uint64_t v150 = *(int **)(a1 + 16);
                int v151 = *v150;
                if (*v150 > 30) {
                  goto LABEL_384;
                }
                if (v151 == -1)
                {
                  BOOL v154 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu);
                  uint64_t v150 = *(int **)(a1 + 16);
                  if (!v154) {
                    goto LABEL_380;
                  }
                  int v151 = *v150;
                }
                if (v151 > 10) {
                  uint64_t v152 = 1;
                }
                else {
                  uint64_t v152 = v151 == -1 && !_LogCategory_Initialize((uint64_t)v150, 0xAu);
                }
                LogPrintF((uint64_t)v150, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup server M6 -- exchange response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v152);
                uint64_t v150 = *(int **)(a1 + 16);
LABEL_380:
                if (*v150 <= 30)
                {
                  if (*v150 == -1)
                  {
                    if (!_LogCategory_Initialize((uint64_t)v150, 0x1Eu)) {
                      goto LABEL_384;
                    }
                    uint64_t v150 = *(int **)(a1 + 16);
                  }
                  LogPrintF((uint64_t)v150, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup server done -- client authenticated\n", (uint64_t)a5, a6, a7, a8, v158);
                }
LABEL_384:
                LOBYTE(v34) = 1;
                id v8 = v160;
                goto LABEL_292;
              }
            }
LABEL_299:
            uint64_t v33 = 0;
LABEL_300:
            LOBYTE(v34) = 0;
LABEL_301:
            id v8 = v160;
            goto LABEL_86;
          }
        }
        else
        {
          uint64_t v33 = 0;
        }
        LOBYTE(v34) = 0;
        unsigned int v153 = -6728;
      }
      else
      {
        uint64_t v33 = 0;
        LOBYTE(v34) = 0;
        unsigned int v153 = -6708;
      }
      unsigned int appended = v153;
      goto LABEL_301;
    }
    LOBYTE(v34) = 0;
LABEL_334:
    unsigned int v141 = -6728;
LABEL_344:
    unsigned int appended = v141;
    goto LABEL_82;
  }
  if (v18 == 3)
  {
    if (*(void *)(a1 + 696))
    {
      CFIndex v20 = v10;
      int v21 = v8;
      unint64_t v25 = *(int **)(a1 + 16);
      int v26 = *v25;
      if (*v25 > 30) {
        goto LABEL_66;
      }
      if (v26 == -1)
      {
        if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
          goto LABEL_66;
        }
        unint64_t v25 = *(int **)(a1 + 16);
        int v26 = *v25;
      }
      if (v26 > 10) {
        BOOL v27 = 0;
      }
      else {
        BOOL v27 = v26 != -1 || _LogCategory_Initialize((uint64_t)v25, 0xAu);
      }
      LogPrintF((uint64_t)v25, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup server M3 -- verify request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, !v27);
LABEL_66:
      unsigned int appended = TLV8GetOrCopyCoalesced(a2, v13, 3, &v171, (size_t *)&v170, &v169, 0);
      if (appended)
      {
LABEL_67:
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        LOBYTE(v34) = 0;
        id v8 = v21;
LABEL_68:
        CFIndex v10 = v20;
LABEL_86:
        CFDataRef v9 = a5;
        v51 = a4;
        goto LABEL_110;
      }
      unsigned int appended = TLV8GetOrCopyCoalesced(a2, v13, 4, &v168, (size_t *)&v167, &v166, 0);
      id v8 = v21;
      if (appended) {
        goto LABEL_70;
      }
      BOOL v41 = *(void **)(a1 + 736);
      CFIndex v10 = v20;
      if (v41)
      {
        memset_s(v41, *(void *)(a1 + 744), 0, *(void *)(a1 + 744));
        unsigned int v42 = *(void **)(a1 + 736);
        if (v42)
        {
          free(v42);
          *(void *)(a1 + 736) = 0;
        }
      }
      *(void *)(a1 + 744) = 0;
      unsigned int appended = SRPServerVerify_libsrp(*(void ***)(a1 + 696), v171, v170, v168, v167, (void *)(a1 + 736), (void *)(a1 + 744), &v165, &v164);
      if (appended)
      {
        uint64_t v47 = *(int **)(a1 + 16);
        CFDataRef v9 = a5;
        if (*v47 > 30) {
          goto LABEL_184;
        }
        if (*v47 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v47, 0x1Eu))
          {
LABEL_184:
            __s[0] = 2;
            unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 7, __s, 1uLL);
            if (!appended)
            {
              __s[0] = 4;
              unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, __s, 1uLL);
              if (!appended)
              {
                uint64_t v99 = mach_absolute_time();
                uint64_t v100 = gPairingThrottleNextTicks - v99;
                if (gPairingThrottleNextTicks <= v99) {
                  goto LABEL_194;
                }
                if (UpTicksPerSecond_sOnce != -1) {
                  dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
                }
                unint64_t v101 = v100 == v100 / UpTicksPerSecond_sTicksPerSecond * UpTicksPerSecond_sTicksPerSecond
                     ? v100 / UpTicksPerSecond_sTicksPerSecond
                     : v100 / UpTicksPerSecond_sTicksPerSecond + 1;
                if ((int)v101 < 1 || (unsigned int appended = TLV8BufferAppendUInt64((uint64_t)&v183, 8, v101)) == 0)
                {
LABEL_194:
                  unsigned int appended = TLV8BufferDetach((uint64_t)&v183, a4, a5);
                  if (!appended) {
                    _PairingSessionReset(a1);
                  }
                }
              }
            }
            goto LABEL_234;
          }
          uint64_t v47 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v47, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"### Pair-setup server wrong setup code\n", v43, v44, v45, v46, v156);
        goto LABEL_184;
      }
      uint64_t v63 = *(void (**)(void))(a1 + 40);
      if (v63) {
        v63(*(void *)(a1 + 24));
      }
      *(unsigned char *)(a1 + 413) = 0;
      int v64 = *(void **)(a1 + 384);
      if (v64)
      {
        free(v64);
        *(void *)(a1 + 384) = 0;
      }
      *(void *)(a1 + 392) = 0;
      PairingResetThrottle();
      *(unsigned char *)(a1 + 120) = 4;
      unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, (char *)(a1 + 120), 1uLL);
      if (appended) {
        goto LABEL_105;
      }
      unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 4, (char *)v165, v164);
      if (appended) {
        goto LABEL_105;
      }
      uint64_t v65 = *(void **)(a1 + 696);
      if (v65)
      {
        SRPDelete_libsrp(v65);
        *(void *)(a1 + 696) = 0;
      }
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, *(void *)(a1 + 736), *(void *)(a1 + 744), "Pair-Setup-Encrypt-Salt", 0x17uLL, (uint64_t)"Pair-Setup-Encrypt-Info", 23, 0x20uLL, a1 + 414);
      _ServerEncryptExtra(a1, (uint64_t)&v183);
      unsigned int appended = TLV8BufferDetach((uint64_t)&v183, a4, a5);
      if (appended)
      {
LABEL_105:
        uint64_t v32 = 0;
        goto LABEL_85;
      }
      v105 = *(int **)(a1 + 16);
      int v106 = *v105;
      if (*v105 <= 30)
      {
        if (v106 == -1)
        {
          if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
            goto LABEL_284;
          }
          v105 = *(int **)(a1 + 16);
          int v106 = *v105;
        }
        if (v106 > 10) {
          BOOL v107 = 0;
        }
        else {
          BOOL v107 = v106 != -1 || _LogCategory_Initialize((uint64_t)v105, 0xAu);
        }
        LogPrintF((uint64_t)v105, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup server M4 -- verify response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, !v107);
      }
LABEL_284:
      int v135 = *(_DWORD *)(a1 + 100);
      if ((v135 & 0x10) == 0 && ((*(_DWORD *)(a1 + 684) ^ v135) & 0x200) == 0)
      {
        uint64_t v32 = 0;
        LOBYTE(v34) = 0;
        unsigned char *v19 = 5;
LABEL_292:
        CFDataRef v9 = a5;
        v51 = a4;
        goto LABEL_293;
      }
      *(unsigned char *)(a1 + 120) = 7;
      int v136 = *(int **)(a1 + 16);
      if (*v136 <= 30)
      {
        if (*v136 != -1)
        {
LABEL_289:
          CFDataRef v9 = a5;
          LogPrintF((uint64_t)v136, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup transient server done -- client authenticated\n", (uint64_t)a5, a6, a7, a8, v157);
          uint64_t v32 = 0;
          LOBYTE(v34) = 1;
          v51 = a4;
LABEL_293:
          uint64_t v33 = 0;
          unsigned int appended = 0;
          goto LABEL_110;
        }
        if (_LogCategory_Initialize((uint64_t)v136, 0x1Eu))
        {
          int v136 = *(int **)(a1 + 16);
          goto LABEL_289;
        }
      }
      uint64_t v32 = 0;
      LOBYTE(v34) = 1;
      goto LABEL_292;
    }
    goto LABEL_245;
  }
  if (v18 != 1)
  {
    char v31 = *(int **)(a1 + 16);
    CFDataRef v9 = a5;
    if (*v31 <= 60)
    {
      if (*v31 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v31, 0x3Cu)) {
          goto LABEL_40;
        }
        char v31 = *(int **)(a1 + 16);
        uint64_t v18 = *(unsigned __int8 *)(a1 + 120);
      }
      LogPrintF((uint64_t)v31, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-setup server bad state: %d\n", (uint64_t)a5, a6, a7, a8, v18);
    }
LABEL_40:
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    LOBYTE(v34) = 0;
    unsigned int v35 = -6709;
    goto LABEL_108;
  }
  CFIndex v20 = v10;
  int v21 = v8;
  uint64_t v22 = *(int **)(a1 + 16);
  int v23 = *v22;
  if (*v22 <= 30)
  {
    if (v23 != -1) {
      goto LABEL_18;
    }
    if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
    {
      uint64_t v22 = *(int **)(a1 + 16);
      int v23 = *v22;
LABEL_18:
      if (v23 > 10) {
        BOOL v24 = 0;
      }
      else {
        BOOL v24 = v23 != -1 || _LogCategory_Initialize((uint64_t)v22, 0xAu);
      }
      LogPrintF((uint64_t)v22, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup server M1 -- start request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, !v24);
    }
  }
  unsigned int appended = TLV8GetBytes(a2, v13, 0, 1uLL, 1uLL, (char *)&__dst, 0, 0);
  if (appended) {
    goto LABEL_67;
  }
  unsigned int v36 = __dst;
  id v8 = v21;
  if (__dst)
  {
    int v37 = *(int **)(a1 + 16);
    CFIndex v10 = v20;
    CFDataRef v9 = a5;
    if (*v37 <= 50)
    {
      if (*v37 != -1) {
        goto LABEL_58;
      }
      if (_LogCategory_Initialize((uint64_t)v37, 0x32u))
      {
        int v37 = *(int **)(a1 + 16);
        unsigned int v36 = __dst;
LABEL_58:
        LogPrintF((uint64_t)v37, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup server unsupported method: %u\n", (uint64_t)a5, a6, a7, a8, v36);
      }
    }
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    LOBYTE(v34) = 0;
    unsigned int v35 = -6735;
LABEL_108:
    unsigned int appended = v35;
    goto LABEL_109;
  }
  *(unsigned char *)(a1 + 688) = 0;
  *(_DWORD *)(a1 + 684) = TLV8GetUInt64(a2, v13, 19, 0, 0) & 0x7770FF10;
  if ((*(unsigned char *)(a1 + 103) & 8) == 0)
  {
    uint64_t v38 = _PairingThrottle();
    uint64_t v39 = v38;
    if ((v38 & 0x80000000) == 0)
    {
      int v40 = *(int **)(a1 + 16);
      CFIndex v10 = v20;
      CFDataRef v9 = a5;
      if (*v40 <= 50)
      {
        if (*v40 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v40, 0x32u)) {
            goto LABEL_213;
          }
          int v40 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v40, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"Pair-setup server throttling for %d second(s)\n", (uint64_t)a5, a6, a7, a8, v39);
      }
LABEL_213:
      __s[0] = 3;
      unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 7, __s, 1uLL);
      if (appended)
      {
LABEL_234:
        uint64_t v32 = 0;
LABEL_235:
        uint64_t v33 = 0;
LABEL_236:
        LOBYTE(v34) = 0;
        goto LABEL_109;
      }
      unsigned int v103 = TLV8BufferAppendUInt64((uint64_t)&v183, 8, v39);
      goto LABEL_232;
    }
    if (v38 == -6764)
    {
      uint64_t v95 = *(int **)(a1 + 16);
      CFIndex v10 = v20;
      CFDataRef v9 = a5;
      if (*v95 <= 50)
      {
        if (*v95 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v95, 0x32u)) {
            goto LABEL_231;
          }
          uint64_t v95 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v95, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup server disabled after too many attempts\n", (uint64_t)a5, a6, a7, a8, v155);
      }
LABEL_231:
      __s[0] = 6;
      unsigned int v103 = TLV8BufferAppend((uint64_t)&v183, 7, __s, 1uLL);
LABEL_232:
      unsigned int appended = v103;
      if (v103) {
        goto LABEL_234;
      }
      __s[0] = 2;
      unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, __s, 1uLL);
      if (appended) {
        goto LABEL_234;
      }
      unsigned int v104 = TLV8BufferDetach((uint64_t)&v183, a4, v9);
      v51 = a4;
      uint64_t v32 = 0;
LABEL_238:
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      unsigned int appended = v104;
      goto LABEL_110;
    }
  }
  *(unsigned char *)(a1 + 120) = 2;
  if (!*(void *)(a1 + 384) || !*(void *)(a1 + 392))
  {
    size_t v96 = *(uint64_t (**)(void, char *, uint64_t, void))(a1 + 32);
    if (!v96)
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      unsigned int v142 = -6745;
      goto LABEL_340;
    }
    unsigned int appended = v96(*(unsigned int *)(a1 + 684), __s, 64, *(void *)(a1 + 24));
    if (appended) {
      goto LABEL_70;
    }
    *(unsigned char *)(a1 + 413) = 1;
    if (strlen(__s) <= 3)
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      unsigned int v142 = -6743;
      goto LABEL_340;
    }
    unsigned int appended = ReplaceString((void **)(a1 + 384), (size_t *)(a1 + 392), __s, 0xFFFFFFFFFFFFFFFFLL);
    if (appended)
    {
LABEL_70:
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      LOBYTE(v34) = 0;
      goto LABEL_68;
    }
  }
  v97 = *(void **)(a1 + 696);
  if (v97)
  {
    SRPDelete_libsrp(v97);
    *(void *)(a1 + 696) = 0;
  }
  size_t v98 = (uint64_t *)malloc_type_calloc(1uLL, 0x38uLL, 0x103004063A0F53DuLL);
  if (!v98)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    LOBYTE(v34) = 0;
    unsigned int v142 = -6728;
LABEL_340:
    unsigned int appended = v142;
    goto LABEL_68;
  }
  *(void *)(a1 + 696) = v98;
  unsigned int appended = 0;
  unsigned int appended = SRPServerStart_libsrp(v98, &_kSRPParameters_3072_SHA512, "Pair-Setup", 10, *(const char **)(a1 + 384), *(void *)(a1 + 392), 0x10uLL, v177, &v173, &v172);
  if (appended) {
    goto LABEL_70;
  }
  unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 6, (char *)(a1 + 120), 1uLL);
  if (appended) {
    goto LABEL_70;
  }
  unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 2, v177, 0x10uLL);
  CFDataRef v9 = a5;
  if (!appended)
  {
    unsigned int appended = TLV8BufferAppend((uint64_t)&v183, 3, (char *)v173, v172);
    if (!appended)
    {
      unint64_t v116 = *(_DWORD *)(a1 + 100) & 0x40000200;
      if (!v116 || (unsigned int appended = TLV8BufferAppendUInt64((uint64_t)&v183, 19, v116)) == 0)
      {
        unint64_t Int64Ranged = CFDictionaryGetInt64Ranged(*(const __CFDictionary **)(a1 + 344), @"setupCodeType", 0, 0xFFFFFFFFLL, 0);
        if (!Int64Ranged || (unsigned int appended = TLV8BufferAppendUInt64((uint64_t)&v183, 27, Int64Ranged)) == 0)
        {
          unsigned int appended = TLV8BufferDetach((uint64_t)&v183, a4, a5);
          if (!appended)
          {
            *(unsigned char *)(a1 + 120) = 3;
            v118 = *(int **)(a1 + 16);
            int v119 = *v118;
            if (*v118 <= 30)
            {
              if (v119 != -1)
              {
LABEL_254:
                if (v119 > 10) {
                  uint64_t v120 = 1;
                }
                else {
                  uint64_t v120 = v119 == -1 && !_LogCategory_Initialize((uint64_t)v118, 0xAu);
                }
                CFDataRef v9 = a5;
                LogPrintF((uint64_t)v118, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-setup server M2 -- start response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v120);
                v51 = a4;
                uint64_t v32 = 0;
                LOBYTE(v34) = 0;
                id v8 = v21;
                CFIndex v10 = v20;
                goto LABEL_293;
              }
              if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
              {
                v118 = *(int **)(a1 + 16);
                int v119 = *v118;
                goto LABEL_254;
              }
            }
            uint64_t v32 = 0;
            LOBYTE(v34) = 0;
            id v8 = v21;
            CFIndex v10 = v20;
            goto LABEL_292;
          }
        }
      }
    }
  }
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  LOBYTE(v34) = 0;
  CFIndex v10 = v20;
LABEL_109:
  v51 = a4;
LABEL_110:
  if (v9 && v51 && !appended) {
    _PairingSessionUpdateTranscript(a1, a2, v10, *v51, *v9);
  }
  unsigned char *v8 = (_BYTE)v34;
  if (v185)
  {
    free(v185);
    CFIndex v185 = 0;
  }
  if (v181)
  {
    free(v181);
    v181 = 0;
  }
  if (v32) {
    free(v32);
  }
  if (v33) {
    free(v33);
  }
  if (v173) {
    free(v173);
  }
  if (v169) {
    free(v169);
  }
  if (v166) {
    free(v166);
  }
  if (v165) {
    free(v165);
  }
  uint64_t v66 = appended;
  if (appended != -6771)
  {
    if (appended)
    {
      v67 = *(int **)(a1 + 16);
      int v68 = *v67;
      if (*v67 <= 50)
      {
        if (v68 == -1)
        {
          BOOL v70 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x32u);
          uint64_t v66 = appended;
          if (!v70) {
            return v66;
          }
          v67 = *(int **)(a1 + 16);
          int v68 = *v67;
        }
        uint64_t v69 = *(unsigned __int8 *)(a1 + 120);
        if (v68 == -1) {
          _LogCategory_Initialize((uint64_t)v67, 0x28u);
        }
        LogPrintF((uint64_t)v67, (uint64_t)"OSStatus _SetupServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-setup server state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v69);
        return appended;
      }
    }
  }
  return v66;
}

uint64_t _VerifyClientExchange(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = (unsigned char *)a6;
  CFDataRef v9 = (CFIndex *)a5;
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = (unsigned __int8 *)(a1 + 120);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 120);
  if (!*(unsigned char *)(a1 + 120))
  {
    uint64_t v14 = 1;
    *uint64_t v15 = 1;
  }
  unint64_t v16 = (unint64_t)&a2[a3];
  if (a3)
  {
    int v17 = a2;
    do
    {
      if (v17 == (unsigned __int8 *)v16) {
        goto LABEL_49;
      }
      if ((unint64_t)v17 >= v16) {
        goto LABEL_119;
      }
      if (v16 - (unint64_t)v17 < 2)
      {
LABEL_49:
        uint64_t appended = 4294960569;
        goto LABEL_98;
      }
      uint64_t v18 = v17 + 2;
      uint64_t v19 = v17[1];
      if ((unint64_t)&v17[v19 + 2] > v16)
      {
        uint64_t appended = 4294960546;
        goto LABEL_98;
      }
      int v20 = *v17;
      v17 += v19 + 2;
    }
    while (v20 != 6);
    if (v19 != 1)
    {
      uint64_t appended = 4294960553;
      goto LABEL_98;
    }
    if (*v18 != v14) {
      goto LABEL_46;
    }
  }
  if (v14 == 4)
  {
    long long v184 = 0u;
    long long v183 = 0u;
    long long v182 = 0u;
    long long v181 = 0u;
    long long v180 = 0u;
    long long v179 = 0u;
    long long v178 = 0u;
    long long v177 = 0u;
    long long v176 = 0u;
    long long v175 = 0u;
    long long v174 = 0u;
    long long v173 = 0u;
    long long v172 = 0u;
    long long v171 = 0u;
    long long v170 = 0u;
    long long v169 = 0u;
    long long v168 = 0u;
    long long v167 = 0u;
    long long v166 = 0u;
    *(_OWORD *)&v165[8] = xmmword_18E416F70;
    *(void *)CFStringRef v165 = &v166;
    *(void *)&v165[24] = 0;
    int v29 = *(int **)(a1 + 16);
    int v30 = *v29;
    if (*v29 <= 30)
    {
      if (v30 != -1)
      {
LABEL_35:
        if (v30 > 10) {
          BOOL v31 = 0;
        }
        else {
          BOOL v31 = v30 != -1 || _LogCategory_Initialize((uint64_t)v29, 0xAu);
        }
        LogPrintF((uint64_t)v29, (uint64_t)"OSStatus _VerifyClientM4(PairingSessionRef, const uint8_t *const, const uint8_t *const)", 0x1Eu, (uint64_t)"Pair-verify client M4 -- finish response\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, !v31);
        goto LABEL_81;
      }
      if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
      {
        int v29 = *(int **)(a1 + 16);
        int v30 = *v29;
        goto LABEL_35;
      }
    }
LABEL_81:
    uint64_t v46 = a2;
    while (v16 > (unint64_t)v46)
    {
      if (v16 - (unint64_t)v46 < 2) {
        break;
      }
      uint64_t v47 = v46 + 2;
      uint64_t v48 = v46[1];
      if ((unint64_t)&v46[v48 + 2] > v16) {
        break;
      }
      int v49 = *v46;
      v46 += v48 + 2;
      if (v49 == 7)
      {
        if (v48 == 1)
        {
          uint64_t v50 = *v47;
          if (v50 >= 9)
          {
            if (v50 == 9) {
              uint64_t appended = 4294960520;
            }
            else {
              uint64_t appended = 4294960596;
            }
          }
          else
          {
            uint64_t appended = dword_18E418B30[v50];
          }
          v51 = *(int **)(a1 + 16);
          if (*v51 <= 50)
          {
            if (*v51 != -1)
            {
LABEL_94:
              LogPrintF((uint64_t)v51, (uint64_t)"OSStatus _VerifyClientM4(PairingSessionRef, const uint8_t *const, const uint8_t *const)", 0x32u, (uint64_t)"### Pair-verify client M4 bad status: 0x%X, %#m\n", a5, a6, a7, a8, v50);
              goto LABEL_96;
            }
            if (_LogCategory_Initialize((uint64_t)v51, 0x32u))
            {
              v51 = *(int **)(a1 + 16);
              uint64_t v50 = *v47;
              goto LABEL_94;
            }
          }
        }
        else
        {
          uint64_t appended = 4294960553;
        }
        goto LABEL_96;
      }
    }
    CFTypeID v56 = a4;
    int v57 = *(_DWORD *)(a1 + 100);
    if ((v57 & 0x20000000) != 0) {
      uint64_t v58 = "PV-Msg4s";
    }
    else {
      uint64_t v58 = "PV-Msg04";
    }
    if (v57)
    {
      unsigned int v70 = _MFiClientVerify(a1, a2, a3, v58, a1 + 638, 32, "MFi-Pair-Verify-Salt", 0x14uLL, (uint64_t)"MFi-Pair-Verify-Info", 20, 1);
      if (v70 == -71164 || v70 == 0) {
        uint64_t appended = v70;
      }
      else {
        uint64_t appended = 4294896151;
      }
      if (appended) {
        goto LABEL_96;
      }
      uint64_t v60 = 0;
      a4 = v56;
LABEL_133:
      if ((*(unsigned char *)(a1 + 100) & 2) != 0)
      {
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, "Pair-Verify-ResumeSessionID-Salt", 0x20uLL, (uint64_t)"Pair-Verify-ResumeSessionID-Info", 32, 8uLL, (uint64_t)__s);
        BOOL v73 = *(int8x16_t **)__s;
        *(void *)(a1 + 376) = *(void *)__s;
        _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(void *)(a1 + 304), *(const void **)(a1 + 248), *(void *)(a1 + 256), (uint64_t)v73, (_OWORD *)(a1 + 638));
      }
      *(unsigned char *)(a1 + 120) = 5;
      v74 = *(int **)(a1 + 16);
      if (*v74 <= 30)
      {
        if (*v74 != -1)
        {
LABEL_137:
          LogPrintF((uint64_t)v74, (uint64_t)"OSStatus _VerifyClientM4(PairingSessionRef, const uint8_t *const, const uint8_t *const)", 0x1Eu, (uint64_t)"Pair-verify client done\n", a5, a6, a7, a8, v144);
          goto LABEL_204;
        }
        if (_LogCategory_Initialize((uint64_t)v74, 0x1Eu))
        {
          v74 = *(int **)(a1 + 16);
          goto LABEL_137;
        }
      }
LABEL_204:
      uint64_t appended = 0;
      if (!v60)
      {
LABEL_206:
        if (*(void *)&v165[24]) {
          free(*(void **)&v165[24]);
        }
        if (appended) {
          goto LABEL_98;
        }
        *a4 = 0;
        *CFDataRef v9 = 0;
        char v42 = 1;
        if (a4) {
          goto LABEL_69;
        }
        goto LABEL_71;
      }
LABEL_205:
      free(v60);
      goto LABEL_206;
    }
    uint64_t v145 = v8;
    *(void *)__s = 0;
    uint64_t v59 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, (size_t *)__s, 0);
    uint64_t v60 = v59;
    uint64_t v61 = 0;
    if (v59 && *(void *)__s)
    {
      a7 = *(void *)__s - 16;
      if (*(void *)__s < 0x10uLL)
      {
        uint64_t appended = 4294960553;
        goto LABEL_275;
      }
      uint64_t v61 = &v59->u8[a7];
      uint64_t v62 = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), v58, 8, 0, 0, v59, a7, v59, (uint64_t)v59->i64 + a7, 16);
      if (v62)
      {
        uint64_t appended = v62;
        id v8 = v145;
        a4 = v56;
        goto LABEL_205;
      }
    }
    if ((*(unsigned char *)(a1 + 103) & 0x20) == 0
      || (uint64_t GroupInfoTLV = _PairingSessionAppleIDVerifyPeer(a1, (unsigned __int8 *)v60, v61), !GroupInfoTLV))
    {
      uint64_t GroupInfoTLV = _ExtractGroupInfoTLV(a1, (unsigned __int8 *)v60, v61);
      if (!GroupInfoTLV)
      {
        a4 = v56;
        id v8 = v145;
        goto LABEL_133;
      }
    }
    uint64_t appended = GroupInfoTLV;
LABEL_275:
    id v8 = v145;
    a4 = v56;
    if (!v60) {
      goto LABEL_206;
    }
    goto LABEL_205;
  }
  if (v14 == 2)
  {
    unsigned int v152 = 0;
    memset(v158, 0, sizeof(v158));
    uint64_t v150 = 0;
    size_t v151 = 0;
    CFTypeRef cf = 0;
    uint64_t v155 = v158;
    long long v156 = xmmword_18E416F70;
    uint64_t v157 = 0;
    int v26 = *(int **)(a1 + 16);
    int v27 = *v26;
    if (*v26 > 30) {
      goto LABEL_52;
    }
    if (v27 == -1)
    {
      if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
        goto LABEL_52;
      }
      int v26 = *(int **)(a1 + 16);
      int v27 = *v26;
    }
    if (v27 > 10) {
      BOOL v28 = 0;
    }
    else {
      BOOL v28 = v27 != -1 || _LogCategory_Initialize((uint64_t)v26, 0xAu);
    }
    LogPrintF((uint64_t)v26, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify client M2 -- start response\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, !v28);
LABEL_52:
    CFDataRef v146 = (size_t *)v9;
    uint64_t v33 = (_OWORD *)(a1 + 574);
    uint64_t Bytes = TLV8GetBytes(a2, &a2[a3], 3, 0x20uLL, 0x20uLL, (char *)(a1 + 574), 0, 0);
    unsigned int v152 = Bytes;
    size_t v148 = a4;
    if (!Bytes)
    {
      cccurve25519();
      int8x16_t v35 = vorrq_s8(*(int8x16_t *)(v15 + 534), *(int8x16_t *)(v15 + 518));
      if (vorr_s8(*(int8x8_t *)v35.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL)))
      {
        unint64_t v147 = (_DWORD *)(a1 + 414);
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)(v15 + 518), 32, "Pair-Verify-Encrypt-Salt", 0x18uLL, (uint64_t)"Pair-Verify-Encrypt-Info", 24, 0x20uLL, a1 + 414);
        unsigned int v36 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v151, (int *)&v152);
        int v37 = (unsigned __int8 *)v36;
        uint64_t v38 = v152;
        if (v152)
        {
          int v136 = *(int **)(a1 + 16);
          if (*v136 <= 90)
          {
            if (*v136 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v136, 0x5Au)) {
                goto LABEL_57;
              }
              int v136 = *(int **)(a1 + 16);
              uint64_t v38 = v152;
            }
            LogPrintF((uint64_t)v136, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get encrypted data, %#m\n", a5, a6, a7, a8, v38);
          }
          goto LABEL_57;
        }
        size_t v39 = v151;
        if (v151 > 0xF)
        {
          v151 -= 16;
          int v40 = &v36[-1].u8[v39];
          unsigned int v152 = _chacha20_poly1305_decrypt_all(v147, "PV-Msg02", 8, 0, 0, v36, v151, v36, (uint64_t)v40, 16);
          if (v152) {
            goto LABEL_57;
          }
          *(void *)(a1 + 200) = TLV8GetUInt64(v37, v40, 25, 0, 0);
          int v43 = *(_DWORD *)(a1 + 100);
          if ((v43 & 0x1000) != 0)
          {
            if ((v43 & 0x20200000) == 0)
            {
              unsigned int v152 = _PairingSessionAppleIDVerifyPeer(a1, v37, v40);
              if (v152) {
                goto LABEL_57;
              }
            }
LABEL_149:
            unsigned int v152 = _PairingSessionVerifyACL(a1, (uint64_t)cf);
            if (v152)
            {
              uint64_t v89 = *(int **)(a1 + 16);
              CFDataRef v9 = (CFIndex *)v146;
              if (*v89 <= 50)
              {
                if (*v89 == -1)
                {
                  if (!_LogCategory_Initialize((uint64_t)v89, 0x32u)) {
                    goto LABEL_174;
                  }
                  uint64_t v89 = *(int **)(a1 + 16);
                }
                LogPrintF((uint64_t)v89, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x32u, (uint64_t)"### Pair-verify client -- server lacks ACL: %@\n", v85, v86, v87, v88, *(void *)(a1 + 176));
              }
LABEL_174:
              v165[0] = 7;
              unsigned int v152 = TLV8BufferAppend((uint64_t)&v155, 7, v165, 1uLL);
              if (!v152)
              {
                v165[0] = 3;
                unsigned int v152 = TLV8BufferAppend((uint64_t)&v155, 6, v165, 1uLL);
                if (!v152)
                {
                  unsigned int v152 = TLV8BufferDetach((uint64_t)&v155, v148, v146);
                  if (!v152) {
                    _PairingSessionReset(a1);
                  }
                }
              }
              goto LABEL_216;
            }
            uint64_t v90 = *(const void **)(a1 + 272);
            if (v90) {
              CFRelease(v90);
            }
            *(void *)(a1 + 272) = cf;
            CFTypeRef cf = 0;
            uint64_t v91 = (UInt8 *)TLV8CopyCoalesced(v37, v40, 29, (size_t *)&v150, 0);
            if (v91)
            {
              uint64_t v92 = v91;
              uint64_t v93 = _OPACKDecodeBytes(0, v91, v150, 0, &v152);
              free(v92);
              if (!v93) {
                goto LABEL_57;
              }
              CFTypeID v94 = CFGetTypeID(v93);
              if (v94 != CFDictionaryGetTypeID())
              {
                unsigned int v152 = -6756;
                CFRelease(v93);
                goto LABEL_57;
              }
              PairingSessionSetProperty(a1, @"appInfoPeer", v93);
              CFRelease(v93);
            }
            *(unsigned char *)(a1 + 120) = 3;
            int v153 = 0;
            long long v184 = 0u;
            long long v183 = 0u;
            long long v182 = 0u;
            long long v181 = 0u;
            long long v180 = 0u;
            long long v179 = 0u;
            long long v178 = 0u;
            long long v177 = 0u;
            long long v176 = 0u;
            long long v175 = 0u;
            long long v174 = 0u;
            long long v173 = 0u;
            long long v172 = 0u;
            long long v171 = 0u;
            long long v170 = 0u;
            long long v169 = 0u;
            long long v168 = 0u;
            long long v167 = 0u;
            long long v166 = 0u;
            memset(v164, 0, sizeof(v164));
            *(_OWORD *)&v165[8] = xmmword_18E416F70;
            *(void *)CFStringRef v165 = &v166;
            *(void *)&v165[24] = 0;
            *(void *)__s = v164;
            long long v162 = xmmword_18E416F70;
            CFDictionaryRef v163 = 0;
            int v95 = *(_DWORD *)(a1 + 100);
            if ((v95 & 0x1000) != 0)
            {
              if ((v95 & 0x100000) != 0) {
                goto LABEL_185;
              }
              int v116 = _PairingSessionAppleIDProveSelf(a1, (uint64_t)__s);
              goto LABEL_184;
            }
            size_t v96 = *(const void **)(a1 + 944);
            if (!v96)
            {
LABEL_164:
              int v106 = *(void **)(a1 + 184);
              if (v106)
              {
                free(v106);
                *(void *)(a1 + 184) = 0;
              }
              *(void *)(a1 + 192) = 0;
              int v153 = PairingSessionCopyIdentity(a1, 0, (char **)(a1 + 184), (_OWORD *)(a1 + 510), a1 + 542);
              if (v153) {
                goto LABEL_219;
              }
              size_t v107 = strlen(*(const char **)(a1 + 184));
              *(void *)(a1 + 192) = v107;
              if (!v107)
              {
                int v143 = -6708;
                goto LABEL_266;
              }
              size_t v108 = v107 + 64;
              uint64_t v109 = malloc_type_malloc(v107 + 64, 0xE714A490uLL);
              if (!v109)
              {
LABEL_263:
                int v143 = -6728;
LABEL_266:
                int v153 = v143;
                goto LABEL_219;
              }
              uint64_t v110 = v109;
              long long v111 = *(_OWORD *)(a1 + 462);
              *uint64_t v109 = *(_OWORD *)(a1 + 446);
              v109[1] = v111;
              uint64_t v112 = v109 + 2;
              memcpy(v109 + 2, *(const void **)(a1 + 184), *(void *)(a1 + 192));
              uint64_t v113 = (_OWORD *)((char *)v112 + *(void *)(a1 + 192));
              long long v114 = *(_OWORD *)(a1 + 590);
              *uint64_t v113 = *v33;
              v113[1] = v114;
              CFTypeID v115 = *(void (**)(void, void *, size_t, char *, void))(a1 + 928);
              if (v115)
              {
                v115(*(unsigned int *)(a1 + 100), v110, v108, v160, *(void *)(a1 + 936));
              }
              else
              {
                ccsha512_di();
                cced25519_sign();
              }
              free(v110);
              int v153 = TLV8BufferAppend((uint64_t)__s, 1, *(char **)(a1 + 184), *(void *)(a1 + 192));
              a4 = v148;
              if (v153) {
                goto LABEL_219;
              }
              int v116 = TLV8BufferAppend((uint64_t)__s, 10, v160, 0x40uLL);
LABEL_184:
              int v153 = v116;
              if (v116) {
                goto LABEL_219;
              }
LABEL_185:
              CFDictionaryRef v118 = *(const __CFDictionary **)(a1 + 344);
              CFTypeID TypeID = CFDictionaryGetTypeID();
              CFStringRef TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v118, @"appInfoSelf", TypeID, 0);
              if (TypedValue)
              {
                CFDataRef v121 = OPACKEncoderCreateDataMutable(TypedValue, 0, &v153);
                if (!v121) {
                  goto LABEL_219;
                }
                CFDataRef v122 = v121;
                BytePtr = (char *)CFDataGetBytePtr(v121);
                size_t Length = CFDataGetLength(v122);
                int v153 = TLV8BufferAppend((uint64_t)__s, 29, BytePtr, Length);
                CFRelease(v122);
                if (v153) {
                  goto LABEL_219;
                }
              }
              int v153 = _AddGroupInfoTLV(a1, (uint64_t)__s);
              if (v153) {
                goto LABEL_219;
              }
              uint64_t v125 = (int8x16_t *)malloc_type_malloc(v162 + 16, 0x334EBFuLL);
              if (v125)
              {
                unsigned int v126 = (char *)v125;
                _chacha20_poly1305_encrypt_all(v147, "PV-Msg03", 8, 0, 0, *(int8x16_t **)__s, v162, v125, (uint64_t)v125->i64 + v162);
                int v127 = TLV8BufferAppend((uint64_t)v165, 5, v126, v162 + 16);
                int v153 = v127;
                free(v126);
                if (!v127)
                {
                  int v153 = TLV8BufferAppend((uint64_t)v165, 6, (char *)v15, 1uLL);
                  if (!v153)
                  {
                    int v153 = TLV8BufferDetach((uint64_t)v165, a4, v146);
                    if (!v153)
                    {
                      *(unsigned char *)(a1 + 120) = 4;
                      size_t v128 = *(int **)(a1 + 16);
                      int v129 = *v128;
                      if (*v128 <= 30)
                      {
                        if (v129 != -1)
                        {
LABEL_195:
                          if (v129 > 10) {
                            uint64_t v130 = 1;
                          }
                          else {
                            uint64_t v130 = v129 == -1 && !_LogCategory_Initialize((uint64_t)v128, 0xAu);
                          }
                          LogPrintF((uint64_t)v128, (uint64_t)"OSStatus _VerifyClientM3(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify client M3 -- finish request\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, v130);
                          goto LABEL_219;
                        }
                        if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
                        {
                          size_t v128 = *(int **)(a1 + 16);
                          int v129 = *v128;
                          goto LABEL_195;
                        }
                      }
                    }
                  }
                }
LABEL_219:
                if (v163)
                {
                  free(v163);
                  CFDictionaryRef v163 = 0;
                }
                if (*(void *)&v165[24]) {
                  free(*(void **)&v165[24]);
                }
                BOOL v41 = 0;
                int v133 = v153;
                goto LABEL_224;
              }
              goto LABEL_263;
            }
            v97 = _Block_copy(v96);
            long long v98 = *(_OWORD *)(a1 + 462);
            v159[0] = *(_OWORD *)(a1 + 446);
            v159[1] = v98;
            long long v99 = *(_OWORD *)(a1 + 590);
            v159[2] = *v33;
            v159[3] = v99;
            uint64_t v100 = (*((uint64_t (**)(void *, void, _OWORD *, uint64_t, char *))v97 + 2))(v97, *(unsigned int *)(a1 + 100), v159, 64, v160);
            int v153 = v100;
            if (!v100)
            {
              int v131 = TLV8BufferAppend((uint64_t)__s, 10, v160, 0x40uLL);
              int v153 = v131;

              if (v131) {
                goto LABEL_219;
              }
              goto LABEL_185;
            }
            uint64_t v105 = v100;
            if (v100 == -6714)
            {

              goto LABEL_164;
            }
            int v132 = *(int **)(a1 + 16);
            if (*v132 <= 90)
            {
              if (*v132 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v132, 0x5Au)) {
                  goto LABEL_218;
                }
                int v132 = *(int **)(a1 + 16);
              }
              LogPrintF((uint64_t)v132, (uint64_t)"OSStatus _VerifyClientM3(PairingSessionRef, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M3 sign failed: %#m\n", v101, v102, v103, v104, v105);
            }
LABEL_218:

            goto LABEL_219;
          }
          uint64_t v44 = *(const void **)(a1 + 952);
          if (v44)
          {
            uint64_t v45 = _Block_copy(v44);
            unsigned int v152 = TLV8GetBytes(v37, v40, 10, 0x40uLL, 0x40uLL, __dst, 0, 0);
            if (v152)
            {

              goto LABEL_57;
            }
            long long v63 = *(_OWORD *)(a1 + 590);
            *(_OWORD *)CFStringRef v165 = *v33;
            *(_OWORD *)&v165[16] = v63;
            long long v64 = *(_OWORD *)(a1 + 462);
            long long v166 = *(_OWORD *)(a1 + 446);
            long long v167 = v64;
            uint64_t v65 = (*((uint64_t (**)(void *, void, unsigned char *, uint64_t, char *))v45 + 2))(v45, *(unsigned int *)(a1 + 100), v165, 64, __dst);
            unsigned int v152 = v65;
            if (v65 != -6714)
            {
              if (!v65)
              {

LABEL_148:
                a4 = v148;
                goto LABEL_149;
              }
              unsigned int v117 = *(int **)(a1 + 16);
              CFDataRef v9 = (CFIndex *)v146;
              if (*v117 <= 90)
              {
                if (*v117 == -1)
                {
                  if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x5Au)) {
                    goto LABEL_215;
                  }
                  unsigned int v117 = *(int **)(a1 + 16);
                  uint64_t v65 = v152;
                }
                LogPrintF((uint64_t)v117, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 verify signature failed: %#m\n", v66, v67, v68, v69, v65);
              }
LABEL_215:

LABEL_216:
              BOOL v41 = 0;
LABEL_59:
              if (cf) {
                CFRelease(cf);
              }
              if (v41) {
                free(v41);
              }
              if (v37) {
                free(v37);
              }
              a4 = v148;
              if (v157) {
                free(v157);
              }
              uint64_t appended = v152;
              if (!v152)
              {
LABEL_68:
                char v42 = 0;
                if (a4)
                {
LABEL_69:
                  if (v9) {
                    _PairingSessionUpdateTranscript(a1, a2, a3, (UInt8 *)*a4, *v9);
                  }
                }
LABEL_71:
                uint64_t appended = 0;
                unsigned char *v8 = v42;
                return appended;
              }
              goto LABEL_98;
            }
          }
          unsigned int v75 = *(void **)(a1 + 296);
          if (v75)
          {
            free(v75);
            *(void *)(a1 + 296) = 0;
          }
          unsigned int v76 = (size_t *)(a1 + 304);
          *(void *)(a1 + 304) = 0;
          CFTypeID v77 = (char *)TLV8CopyCoalesced(v37, v40, 1, (size_t *)(a1 + 304), (int *)&v152);
          *(void *)(a1 + 296) = v77;
          uint64_t v78 = v152;
          if (v152)
          {
            BOOL v137 = *(int **)(a1 + 16);
            if (*v137 <= 90)
            {
              if (*v137 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v137, 0x5Au)) {
                  goto LABEL_57;
                }
                BOOL v137 = *(int **)(a1 + 16);
                uint64_t v78 = v152;
              }
              LogPrintF((uint64_t)v137, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get identifier failed, %#m\n", a5, a6, a7, a8, v78);
            }
            goto LABEL_57;
          }
          if (*v76)
          {
            uint64_t Peer = PairingSessionFindPeerEx(a1, v77, *v76, (_OWORD *)(a1 + 606), &cf, a6, a7, a8);
            unsigned int v152 = Peer;
            if (Peer)
            {
              uint64_t v138 = Peer;
              unsigned int v139 = *(int **)(a1 + 16);
              if (*v139 <= 90)
              {
                if (*v139 == -1)
                {
                  if (!_LogCategory_Initialize((uint64_t)v139, 0x5Au)) {
                    goto LABEL_57;
                  }
                  unsigned int v139 = *(int **)(a1 + 16);
                  uint64_t v138 = v152;
                }
                LogPrintF((uint64_t)v139, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: find peer failed, %#m\n", a5, a6, a7, a8, v138);
              }
            }
            else
            {
              uint64_t v80 = TLV8GetBytes(v37, v40, 10, 0x40uLL, 0x40uLL, __dst, 0, 0);
              unsigned int v152 = v80;
              if (!v80)
              {
                uint64_t v150 = *v76 + 64;
                int v81 = (char *)malloc_type_malloc(v150, 0xF0FA24ECuLL);
                BOOL v41 = v81;
                if (v81)
                {
                  long long v82 = *(_OWORD *)(a1 + 590);
                  *(_OWORD *)int v81 = *v33;
                  *((_OWORD *)v81 + 1) = v82;
                  memcpy(v81 + 32, *(const void **)(a1 + 296), *(void *)(a1 + 304));
                  uint64_t v83 = &v41[*(void *)(a1 + 304) + 32];
                  long long v84 = *(_OWORD *)(a1 + 462);
                  *(_OWORD *)uint64_t v83 = *(_OWORD *)(a1 + 446);
                  *((_OWORD *)v83 + 1) = v84;
                  ccsha512_di();
                  unsigned int v152 = cced25519_verify();
                  if (!v152)
                  {
                    free(v41);
                    goto LABEL_148;
                  }
                  unsigned int v142 = -6754;
                }
                else
                {
                  unsigned int v142 = -6728;
                }
                unsigned int v152 = v142;
                goto LABEL_58;
              }
              uint64_t v140 = v80;
              unsigned int v141 = *(int **)(a1 + 16);
              if (*v141 <= 90)
              {
                if (*v141 == -1)
                {
                  if (!_LogCategory_Initialize((uint64_t)v141, 0x5Au)) {
                    goto LABEL_57;
                  }
                  unsigned int v141 = *(int **)(a1 + 16);
                  uint64_t v140 = v152;
                }
                LogPrintF((uint64_t)v141, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get signature failed, %#m\n", a5, a6, a7, a8, v140);
              }
            }
LABEL_57:
            BOOL v41 = 0;
LABEL_58:
            CFDataRef v9 = (CFIndex *)v146;
            goto LABEL_59;
          }
        }
        BOOL v41 = 0;
        int v133 = -6743;
      }
      else
      {
        BOOL v41 = 0;
        int v37 = 0;
        int v133 = -6742;
      }
LABEL_224:
      unsigned int v152 = v133;
      goto LABEL_58;
    }
    uint64_t v134 = Bytes;
    int v135 = *(int **)(a1 + 16);
    if (*v135 <= 90)
    {
      if (*v135 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v135, 0x5Au)) {
          goto LABEL_244;
        }
        int v135 = *(int **)(a1 + 16);
        uint64_t v134 = v152;
      }
      LogPrintF((uint64_t)v135, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get PK, %#m\n", a5, a6, a7, a8, v134);
    }
LABEL_244:
    BOOL v41 = 0;
    int v37 = 0;
    goto LABEL_58;
  }
  if (v14 != 1)
  {
    uint64_t v32 = *(int **)(a1 + 16);
    if (*v32 <= 60)
    {
      if (*v32 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v32, 0x3Cu)) {
          goto LABEL_46;
        }
        uint64_t v32 = *(int **)(a1 + 16);
        uint64_t v14 = *(unsigned __int8 *)(a1 + 120);
      }
      LogPrintF((uint64_t)v32, (uint64_t)"OSStatus _VerifyClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-verify client bad state: %d\n", a5, a6, a7, a8, v14);
    }
LABEL_46:
    uint64_t appended = 4294960587;
    goto LABEL_98;
  }
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v177 = 0u;
  long long v176 = 0u;
  long long v175 = 0u;
  long long v174 = 0u;
  long long v173 = 0u;
  long long v172 = 0u;
  long long v171 = 0u;
  long long v170 = 0u;
  long long v169 = 0u;
  long long v168 = 0u;
  long long v167 = 0u;
  long long v166 = 0u;
  *(_OWORD *)&v165[8] = xmmword_18E416F70;
  *(void *)CFStringRef v165 = &v166;
  *(void *)&v165[24] = 0;
  if (a3)
  {
LABEL_119:
    uint64_t appended = 4294960591;
  }
  else
  {
    RandomBytes((void *)(a1 + 478), 0x20uLL);
    CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 478, 32, "Pair-Verify-ECDH-Salt", 0x15uLL, (uint64_t)"Pair-Verify-ECDH-Info", 21, 0x20uLL, a1 + 478);
    cccurve25519_make_pub();
    if ((*(unsigned char *)(a1 + 100) & 1) == 0
      || (__s[0] = 7, uint64_t appended = TLV8BufferAppend((uint64_t)v165, 0, __s, 1uLL), !appended))
    {
      uint64_t appended = TLV8BufferAppend((uint64_t)v165, 6, (char *)v15, 1uLL);
      if (!appended)
      {
        uint64_t appended = TLV8BufferAppend((uint64_t)v165, 3, (char *)(a1 + 446), 0x20uLL);
        if (!appended)
        {
          unint64_t v22 = *(void *)(a1 + 208);
          if (!v22 || (uint64_t appended = TLV8BufferAppendUInt64((uint64_t)v165, 25, v22), !appended))
          {
            uint64_t appended = TLV8BufferDetach((uint64_t)v165, a4, (size_t *)v9);
            if (!appended)
            {
              *(unsigned char *)(a1 + 120) = 2;
              int v23 = *(int **)(a1 + 16);
              int v24 = *v23;
              if (*v23 > 30) {
                goto LABEL_227;
              }
              if (v24 == -1)
              {
                if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
                  goto LABEL_227;
                }
                int v23 = *(int **)(a1 + 16);
                int v24 = *v23;
              }
              if (v24 > 10) {
                uint64_t v25 = 1;
              }
              else {
                uint64_t v25 = v24 == -1 && !_LogCategory_Initialize((uint64_t)v23, 0xAu);
              }
              LogPrintF((uint64_t)v23, (uint64_t)"OSStatus _VerifyClientM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify client M1 -- start request\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, v25);
LABEL_227:
              if (*(void *)&v165[24]) {
                free(*(void **)&v165[24]);
              }
              goto LABEL_68;
            }
          }
        }
      }
    }
LABEL_96:
    if (*(void *)&v165[24]) {
      free(*(void **)&v165[24]);
    }
  }
LABEL_98:
  unsigned char *v8 = 0;
  unsigned int v52 = *(int **)(a1 + 16);
  int v53 = *v52;
  if (*v52 <= 50)
  {
    if (v53 == -1)
    {
      if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x32u)) {
        return appended;
      }
      unsigned int v52 = *(int **)(a1 + 16);
      int v53 = *v52;
    }
    uint64_t v54 = *v15;
    if (v53 == -1) {
      _LogCategory_Initialize((uint64_t)v52, 0x28u);
    }
    LogPrintF((uint64_t)v52, (uint64_t)"OSStatus _VerifyClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify client state %d failed: %#m\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, v54);
  }
  return appended;
}

uint64_t _VerifyServerExchange(uint64_t a1, unsigned __int8 *a2, CFIndex a3, UInt8 **a4, size_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = (unsigned char *)a6;
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v11 = (int8x16_t *)(a1 + 638);
  int v12 = &a2[a3];
  CFIndex v13 = a2;
  do
  {
    if (v13 == v12)
    {
LABEL_36:
      uint64_t v144 = (unsigned char *)a6;
      BOOL v26 = 0;
      int v27 = 0;
      uint64_t Bytes = 4294960569;
      goto LABEL_108;
    }
    if (v13 >= v12)
    {
      uint64_t v144 = (unsigned char *)a6;
      BOOL v26 = 0;
      int v27 = 0;
      uint64_t Bytes = 4294960591;
      goto LABEL_108;
    }
    if ((unint64_t)(v12 - v13) < 2) {
      goto LABEL_36;
    }
    uint64_t v14 = v13 + 2;
    uint64_t v15 = v13[1];
    if (&v13[v15 + 2] > v12)
    {
      uint64_t v144 = (unsigned char *)a6;
      BOOL v26 = 0;
      int v27 = 0;
      uint64_t Bytes = 4294960546;
      goto LABEL_108;
    }
    int v16 = *v13;
    v13 += v15 + 2;
  }
  while (v16 != 6);
  if (v15 != 1)
  {
    uint64_t v144 = (unsigned char *)a6;
    BOOL v26 = 0;
    int v27 = 0;
    uint64_t Bytes = 4294960553;
    goto LABEL_108;
  }
  if (*v14 == 1) {
    _PairingSessionReset(a1);
  }
  uint64_t v18 = (unsigned char *)(a1 + 120);
  uint64_t v17 = *(unsigned __int8 *)(a1 + 120);
  if (!*(unsigned char *)(a1 + 120))
  {
    uint64_t v17 = 1;
    unsigned char *v18 = 1;
  }
  if (*v14 != v17)
  {
    uint64_t v144 = v8;
    goto LABEL_33;
  }
  if (v17 != 3)
  {
    uint64_t v144 = v8;
    if (v17 == 1)
    {
      uint64_t v19 = *(int **)(a1 + 16);
      int v20 = *v19;
      if (*v19 <= 30)
      {
        if (v20 != -1) {
          goto LABEL_17;
        }
        if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
        {
          uint64_t v19 = *(int **)(a1 + 16);
          int v20 = *v19;
LABEL_17:
          if (v20 > 10) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = v20 == -1 && !_LogCategory_Initialize((uint64_t)v19, 0xAu);
          }
          LogPrintF((uint64_t)v19, (uint64_t)"OSStatus _VerifyServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server M1 -- start request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v21);
        }
      }
      LOBYTE(cf) = 0;
      if (TLV8GetBytes(a2, v12, 0, 1uLL, 1uLL, (char *)&cf, 0, 0))
      {
        LOBYTE(cf) = 2;
        goto LABEL_42;
      }
      unsigned int v29 = cf;
      if (cf == 2)
      {
LABEL_42:
        *(unsigned char *)(a1 + 688) = 2;
        RandomBytes((void *)(a1 + 478), 0x20uLL);
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 478, 32, "Pair-Verify-ECDH-Salt", 0x15uLL, (uint64_t)"Pair-Verify-ECDH-Info", 21, 0x20uLL, a1 + 478);
        int v30 = (_OWORD *)(a1 + 446);
        cccurve25519_make_pub();
        BOOL v31 = (_OWORD *)(a1 + 574);
        uint64_t Bytes = TLV8GetBytes(a2, v12, 3, 0x20uLL, 0x20uLL, (char *)(a1 + 574), 0, 0);
        if (!Bytes)
        {
          cccurve25519();
          int8x16_t v32 = vorrq_s8(v11[1], *v11);
          if (vorr_s8(*(int8x8_t *)v32.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL)))
          {
            *(void *)(a1 + 200) = TLV8GetUInt64(a2, v12, 25, 0, 0);
            *(unsigned char *)(a1 + 120) = 2;
            LODWORD(v149) = 0;
            long long v181 = 0u;
            long long v180 = 0u;
            long long v179 = 0u;
            long long v178 = 0u;
            long long v177 = 0u;
            long long v176 = 0u;
            long long v175 = 0u;
            long long v174 = 0u;
            long long v173 = 0u;
            long long v172 = 0u;
            long long v171 = 0u;
            long long v170 = 0u;
            long long v169 = 0u;
            long long v168 = 0u;
            long long v167 = 0u;
            long long v166 = 0u;
            long long v165 = 0u;
            long long v164 = 0u;
            long long v163 = 0u;
            memset(v155, 0, sizeof(v155));
            long long v161 = xmmword_18E416F70;
            __src = &v163;
            long long v162 = 0;
            unsigned __int8 __dst = (int8x16_t *)v155;
            long long v153 = xmmword_18E416F70;
            BOOL v154 = 0;
            int v33 = *(_DWORD *)(a1 + 100);
            if ((v33 & 0x1000) == 0)
            {
              CFDataRef v34 = *(const void **)(a1 + 944);
              if (!v34) {
                goto LABEL_49;
              }
              int8x16_t v35 = _Block_copy(v34);
              long long v36 = *(_OWORD *)(a1 + 462);
              v151[0] = *v30;
              v151[1] = v36;
              long long v37 = *(_OWORD *)(a1 + 590);
              v151[2] = *v31;
              v151[3] = v37;
              uint64_t v38 = (*((uint64_t (**)(void *, void, _OWORD *, uint64_t, long long *))v35 + 2))(v35, *(unsigned int *)(a1 + 100), v151, 64, &__s);
              LODWORD(v149) = v38;
              if (!v38)
              {
                int v99 = TLV8BufferAppend((uint64_t)&__dst, 10, (char *)&__s, 0x40uLL);
                LODWORD(v149) = v99;

                id v8 = v144;
                if (!v99) {
                  goto LABEL_154;
                }
                goto LABEL_186;
              }
              uint64_t v43 = v38;
              if (v38 == -6714)
              {

LABEL_49:
                uint64_t v44 = *(void **)(a1 + 184);
                if (v44)
                {
                  free(v44);
                  *(void *)(a1 + 184) = 0;
                }
                *(void *)(a1 + 192) = 0;
                uint64_t v45 = PairingSessionCopyIdentity(a1, 0, (char **)(a1 + 184), (_OWORD *)(a1 + 510), a1 + 542);
                LODWORD(v149) = v45;
                if (v45)
                {
                  uint64_t v139 = v45;
                  uint64_t v140 = *(int **)(a1 + 16);
                  id v8 = v144;
                  if (*v140 > 90) {
                    goto LABEL_186;
                  }
                  if (*v140 == -1)
                  {
                    id v8 = v144;
                    if (!_LogCategory_Initialize((uint64_t)v140, 0x5Au)) {
                      goto LABEL_186;
                    }
                    uint64_t v140 = *(int **)(a1 + 16);
                  }
                  LogPrintF((uint64_t)v140, (uint64_t)"OSStatus _VerifyServerM2(PairingSessionRef, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify server M2 failed: copy identity, %#m\n", (uint64_t)a5, a6, a7, a8, v139);
                }
                else
                {
                  size_t v46 = strlen(*(const char **)(a1 + 184));
                  *(void *)(a1 + 192) = v46;
                  if (v46)
                  {
                    size_t v47 = v46 + 64;
                    uint64_t v48 = malloc_type_malloc(v46 + 64, 0xB359A5B9uLL);
                    if (v48)
                    {
                      int v49 = v48;
                      long long v50 = *(_OWORD *)(a1 + 462);
                      *uint64_t v48 = *v30;
                      v48[1] = v50;
                      v51 = v48 + 2;
                      memcpy(v48 + 2, *(const void **)(a1 + 184), *(void *)(a1 + 192));
                      unsigned int v52 = (_OWORD *)((char *)v51 + *(void *)(a1 + 192));
                      long long v53 = *(_OWORD *)(a1 + 590);
                      _OWORD *v52 = *v31;
                      v52[1] = v53;
                      uint64_t v54 = *(void (**)(void, void *, size_t, long long *, void))(a1 + 928);
                      if (v54)
                      {
                        v54(*(unsigned int *)(a1 + 100), v49, v47, &__s, *(void *)(a1 + 936));
                      }
                      else
                      {
                        ccsha512_di();
                        cced25519_sign();
                      }
                      id v8 = v144;
                      free(v49);
                      LODWORD(v149) = TLV8BufferAppend((uint64_t)&__dst, 1, *(char **)(a1 + 184), *(void *)(a1 + 192));
                      if (!v149)
                      {
                        int v56 = TLV8BufferAppend((uint64_t)&__dst, 10, (char *)&__s, 0x40uLL);
LABEL_153:
                        LODWORD(v149) = v56;
                        if (!v56) {
                          goto LABEL_154;
                        }
                      }
                      goto LABEL_186;
                    }
                    int v141 = -6728;
                  }
                  else
                  {
                    int v141 = -6708;
                  }
                  LODWORD(v149) = v141;
                }
                id v8 = v144;
                goto LABEL_186;
              }
              uint64_t v100 = *(int **)(a1 + 16);
              id v8 = v144;
              if (*v100 <= 90)
              {
                if (*v100 != -1) {
                  goto LABEL_173;
                }
                if (_LogCategory_Initialize((uint64_t)v100, 0x5Au))
                {
                  uint64_t v100 = *(int **)(a1 + 16);
LABEL_173:
                  LogPrintF((uint64_t)v100, (uint64_t)"OSStatus _VerifyServerM2(PairingSessionRef, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify server M2 sign failed: %#m\n", v39, v40, v41, v42, v43);
                }
              }

              goto LABEL_186;
            }
            id v8 = v144;
            if ((v33 & 0x20100000) == 0)
            {
              int v56 = _PairingSessionAppleIDProveSelf(a1, (uint64_t)&__dst);
              goto LABEL_153;
            }
LABEL_154:
            unint64_t v85 = *(void *)(a1 + 208);
            if (!v85 || (LODWORD(v149) = TLV8BufferAppendUInt64((uint64_t)&__dst, 25, v85), !v149))
            {
              CFDictionaryRef v86 = *(const __CFDictionary **)(a1 + 344);
              CFTypeID TypeID = CFDictionaryGetTypeID();
              CFStringRef TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v86, @"appInfoSelf", TypeID, 0);
              if (!TypedValue
                || (CFDataRef DataMutable = OPACKEncoderCreateDataMutable(TypedValue, 0, (int *)&v149)) != 0
                && (CFDataRef v90 = DataMutable,
                    BytePtr = (char *)CFDataGetBytePtr(DataMutable),
                    size_t v92 = CFDataGetLength(v90),
                    LODWORD(v149) = TLV8BufferAppend((uint64_t)&__dst, 29, BytePtr, v92),
                    CFRelease(v90),
                    !v149))
              {
                uint64_t v93 = (int8x16_t *)malloc_type_malloc(v153 + 16, 0x46627000uLL);
                if (!v93)
                {
                  LODWORD(v149) = -6728;
                  goto LABEL_186;
                }
                CFTypeID v94 = v93;
                CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)v11, 32, "Pair-Verify-Encrypt-Salt", 0x18uLL, (uint64_t)"Pair-Verify-Encrypt-Info", 24, 0x20uLL, a1 + 414);
                _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), "PV-Msg02", 8, 0, 0, __dst, v153, v94, (uint64_t)v94->i64 + v153);
                int v95 = TLV8BufferAppend((uint64_t)&__src, 5, v94->i8, v153 + 16);
                LODWORD(v149) = v95;
                free(v94);
                if (!v95)
                {
                  unsigned char *v18 = 2;
                  LODWORD(v149) = TLV8BufferAppend((uint64_t)&__src, 6, (char *)(a1 + 120), 1uLL);
                  if (!v149)
                  {
                    LODWORD(v149) = TLV8BufferAppend((uint64_t)&__src, 3, (char *)(a1 + 446), 0x20uLL);
                    if (!v149)
                    {
                      LODWORD(v149) = TLV8BufferDetach((uint64_t)&__src, a4, a5);
                      if (!v149)
                      {
                        size_t v96 = *(int **)(a1 + 16);
                        int v97 = *v96;
                        if (*v96 <= 30)
                        {
                          if (v97 != -1) {
                            goto LABEL_166;
                          }
                          if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
                          {
                            size_t v96 = *(int **)(a1 + 16);
                            int v97 = *v96;
LABEL_166:
                            if (v97 > 10) {
                              uint64_t v98 = 1;
                            }
                            else {
                              uint64_t v98 = v97 == -1 && !_LogCategory_Initialize((uint64_t)v96, 0xAu);
                            }
                            LogPrintF((uint64_t)v96, (uint64_t)"OSStatus _VerifyServerM2(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server M2 -- start response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v98);
                          }
                        }
                        unsigned char *v18 = 3;
                      }
                    }
                  }
                }
              }
            }
LABEL_186:
            if (v154)
            {
              free(v154);
              BOOL v154 = 0;
            }
            if (v162) {
              free(v162);
            }
            uint64_t Bytes = v149;
            if (!v149)
            {
              BOOL v26 = 0;
              goto LABEL_192;
            }
          }
          else
          {
            uint64_t Bytes = 4294960554;
          }
        }
LABEL_107:
        BOOL v26 = 0;
        int v27 = 0;
LABEL_108:
        CFTypeID v77 = *(int **)(a1 + 16);
        int v78 = *v77;
        if (*v77 <= 50)
        {
          if (v78 != -1) {
            goto LABEL_110;
          }
          if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x32u))
          {
            CFTypeID v77 = *(int **)(a1 + 16);
            int v78 = *v77;
LABEL_110:
            uint64_t v79 = *(unsigned __int8 *)(a1 + 120);
            if (v78 == -1) {
              _LogCategory_Initialize((uint64_t)v77, 0x28u);
            }
            LogPrintF((uint64_t)v77, (uint64_t)"OSStatus _VerifyServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v79);
            if (v27) {
              goto LABEL_149;
            }
            goto LABEL_117;
          }
        }
        if (v27) {
          goto LABEL_149;
        }
LABEL_117:
        long long v181 = 0u;
        long long v180 = 0u;
        long long v179 = 0u;
        long long v178 = 0u;
        long long v177 = 0u;
        long long v176 = 0u;
        long long v175 = 0u;
        long long v174 = 0u;
        long long v173 = 0u;
        long long v172 = 0u;
        long long v171 = 0u;
        long long v170 = 0u;
        long long v169 = 0u;
        long long v168 = 0u;
        long long v167 = 0u;
        long long v166 = 0u;
        long long v165 = 0u;
        long long v164 = 0u;
        long long v163 = 0u;
        long long v161 = xmmword_18E416F70;
        __src = &v163;
        long long v162 = 0;
        if ((int)Bytes > -6761)
        {
          if ((int)Bytes > -6728)
          {
            if (Bytes == -6727)
            {
              unint64_t v80 = 4;
            }
            else
            {
              if (Bytes != -6700) {
                goto LABEL_136;
              }
              unint64_t v80 = 1;
            }
          }
          else if (Bytes == -6760)
          {
            unint64_t v80 = 3;
          }
          else
          {
            if (Bytes != -6754) {
              goto LABEL_136;
            }
            unint64_t v80 = 2;
          }
        }
        else if ((int)Bytes > -6765)
        {
          if (Bytes == -6764)
          {
            unint64_t v80 = 6;
          }
          else
          {
            if (Bytes != -6763) {
              goto LABEL_136;
            }
            unint64_t v80 = 5;
          }
        }
        else
        {
          if (Bytes != -71144)
          {
            if (Bytes == -6773)
            {
              unint64_t v80 = 7;
              goto LABEL_139;
            }
LABEL_136:
            if (Bytes == -6776) {
              unint64_t v80 = 9;
            }
            else {
              unint64_t v80 = 1;
            }
            goto LABEL_139;
          }
          unint64_t v80 = 8;
        }
LABEL_139:
        uint64_t Bytes = TLV8BufferAppendUInt64((uint64_t)&__src, 7, v80);
        if (Bytes) {
          goto LABEL_149;
        }
        uint64_t Bytes = TLV8BufferAppendUInt64((uint64_t)&__src, 6, *(unsigned __int8 *)(a1 + 120));
        if (Bytes) {
          goto LABEL_149;
        }
        size_t v81 = v161;
        long long v82 = (UInt8 *)v162;
        if (!v162)
        {
          if ((unint64_t)v161 <= 1) {
            size_t v83 = 1;
          }
          else {
            size_t v83 = v161;
          }
          long long v84 = (UInt8 *)malloc_type_malloc(v83, 0xF62D7A9CuLL);
          if (!v84)
          {
            uint64_t Bytes = 4294960568;
            goto LABEL_149;
          }
          long long v82 = v84;
          if (v81) {
            memcpy(v84, __src, v81);
          }
        }
        __src = &v163;
        *(void *)&long long v161 = 0;
        long long v162 = 0;
        *a4 = v82;
        *a5 = v81;
        _PairingSessionReset(a1);
        uint64_t Bytes = 0;
LABEL_149:
        id v8 = v144;
        goto LABEL_195;
      }
      int v55 = *(int **)(a1 + 16);
      if (*v55 <= 50)
      {
        if (*v55 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v55, 0x32u)) {
            goto LABEL_106;
          }
          int v55 = *(int **)(a1 + 16);
          unsigned int v29 = cf;
        }
        LogPrintF((uint64_t)v55, (uint64_t)"OSStatus _VerifyServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x32u, (uint64_t)"### Pair-verify server unsupported method: %u\n", (uint64_t)a5, a6, a7, a8, v29);
      }
LABEL_106:
      uint64_t Bytes = 4294960561;
      goto LABEL_107;
    }
    uint64_t v25 = *(int **)(a1 + 16);
    if (*v25 <= 60)
    {
      if (*v25 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v25, 0x3Cu)) {
          goto LABEL_33;
        }
        uint64_t v25 = *(int **)(a1 + 16);
        uint64_t v17 = *(unsigned __int8 *)(a1 + 120);
      }
      LogPrintF((uint64_t)v25, (uint64_t)"OSStatus _VerifyServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-verify server bad state: %d\n", (uint64_t)a5, a6, a7, a8, v17);
    }
LABEL_33:
    BOOL v26 = 0;
    int v27 = 0;
    uint64_t Bytes = 4294960587;
    goto LABEL_108;
  }
  unsigned int Peer = 0;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v177 = 0u;
  long long v176 = 0u;
  long long v175 = 0u;
  long long v174 = 0u;
  long long v173 = 0u;
  long long v172 = 0u;
  long long v171 = 0u;
  long long v170 = 0u;
  long long v169 = 0u;
  long long v168 = 0u;
  long long v167 = 0u;
  long long v166 = 0u;
  long long v165 = 0u;
  long long v164 = 0u;
  long long v163 = 0u;
  *(void *)&v151[0] = 0;
  CFTypeRef cf = 0;
  size_t v149 = 0;
  long long v161 = xmmword_18E416F70;
  __src = &v163;
  long long v162 = 0;
  unint64_t v22 = *(int **)(a1 + 16);
  int v23 = *v22;
  if (*v22 <= 30)
  {
    if (v23 != -1)
    {
LABEL_22:
      if (v23 > 10) {
        BOOL v24 = 0;
      }
      else {
        BOOL v24 = v23 != -1 || _LogCategory_Initialize((uint64_t)v22, 0xAu);
      }
      LogPrintF((uint64_t)v22, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x1Eu, (uint64_t)"Pair-verify server M3 -- finish request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, !v24);
      goto LABEL_63;
    }
    if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
    {
      unint64_t v22 = *(int **)(a1 + 16);
      int v23 = *v22;
      goto LABEL_22;
    }
  }
LABEL_63:
  int v57 = a2;
  do
  {
    if (v57 == v12)
    {
LABEL_174:
      unsigned int v101 = -6727;
      goto LABEL_180;
    }
    if (v57 >= v12)
    {
      unsigned int v101 = -6705;
      goto LABEL_180;
    }
    if ((unint64_t)(v12 - v57) < 2) {
      goto LABEL_174;
    }
    uint64_t v58 = v57 + 2;
    uint64_t v59 = v57[1];
    if (&v57[v59 + 2] > v12)
    {
      unsigned int v101 = -6750;
LABEL_180:
      int v27 = 0;
      unsigned int Peer = v101;
      goto LABEL_82;
    }
    int v60 = *v57;
    v57 += v59 + 2;
  }
  while (v60 != 7);
  *(void *)&v151[0] = v59;
  if (v59 != 1)
  {
    long long v64 = 0;
    BOOL v26 = 0;
    unsigned int Peer = -6743;
    goto LABEL_79;
  }
  uint64_t v61 = *v58;
  if (v61 >= 9)
  {
    if (v61 == 9) {
      unsigned int v62 = -6776;
    }
    else {
      unsigned int v62 = -6700;
    }
  }
  else
  {
    unsigned int v62 = dword_18E418B30[v61];
  }
  unsigned int Peer = v62;
  long long v63 = *(int **)(a1 + 16);
  if (*v63 > 50)
  {
    long long v64 = 0;
    BOOL v26 = 0;
LABEL_79:
    int v27 = 1;
    goto LABEL_84;
  }
  if (*v63 != -1) {
    goto LABEL_77;
  }
  if (_LogCategory_Initialize((uint64_t)v63, 0x32u))
  {
    long long v63 = *(int **)(a1 + 16);
    uint64_t v61 = *v58;
LABEL_77:
    LogPrintF((uint64_t)v63, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server M3 bad status: 0x%X, %#m\n", (uint64_t)a5, a6, a7, a8, v61);
  }
  int v27 = 1;
  if (Peer)
  {
    long long v64 = 0;
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v65 = (int8x16_t *)TLV8CopyCoalesced(a2, v12, 5, &v149, (int *)&Peer);
  long long v64 = (unsigned __int8 *)v65;
  if (!Peer)
  {
    size_t v66 = v149;
    if (v149 <= 0xF)
    {
      BOOL v26 = 0;
      unsigned int Peer = -6743;
      goto LABEL_84;
    }
    v149 -= 16;
    uint64_t v67 = &v65[-1].u8[v66];
    unsigned int Peer = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), "PV-Msg03", 8, 0, 0, v65, v149, v65, (uint64_t)v67, 16);
    if (Peer)
    {
      uint64_t v72 = *(int **)(a1 + 16);
      if (*v72 <= 50)
      {
        if (*v72 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v72, 0x32u)) {
            goto LABEL_176;
          }
          uint64_t v72 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v72, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server bad auth tag\n", v68, v69, v70, v71, v143);
      }
LABEL_176:
      LOBYTE(__dst) = 2;
      unsigned int Peer = TLV8BufferAppend((uint64_t)&__src, 7, (char *)&__dst, 1uLL);
      if (Peer) {
        goto LABEL_83;
      }
      LOBYTE(__dst) = 4;
      p_dst = (char *)&__dst;
LABEL_236:
      unsigned int Peer = TLV8BufferAppend((uint64_t)&__src, 6, p_dst, 1uLL);
      if (!Peer)
      {
        unsigned int Peer = TLV8BufferDetach((uint64_t)&__src, a4, a5);
        if (!Peer) {
          _PairingSessionReset(a1);
        }
      }
      goto LABEL_83;
    }
    int v73 = *(_DWORD *)(a1 + 100);
    if ((v73 & 0x1000) == 0)
    {
      v74 = *(const void **)(a1 + 952);
      if (v74)
      {
        unsigned int v75 = (uint64_t (**)(void *, void, long long *, uint64_t, int8x16_t **))_Block_copy(v74);
        unsigned int Peer = TLV8GetBytes(v64, v67, 10, 0x40uLL, 0x40uLL, (char *)&__dst, 0, 0);
        if (Peer) {
          goto LABEL_100;
        }
        long long v103 = *(_OWORD *)(a1 + 590);
        long long __s = *(_OWORD *)(a1 + 574);
        long long v157 = v103;
        long long v104 = *(_OWORD *)(a1 + 462);
        long long v158 = *(_OWORD *)(a1 + 446);
        long long v159 = v104;
        uint64_t v105 = v75[2](v75, *(unsigned int *)(a1 + 100), &__s, 64, &__dst);
        unsigned int Peer = v105;
        if (v105 != -6714)
        {
          if (v105)
          {
            uint64_t v120 = *(int **)(a1 + 16);
            if (*v120 <= 90)
            {
              if (*v120 == -1)
              {
                if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x5Au)) {
                  goto LABEL_100;
                }
                uint64_t v120 = *(int **)(a1 + 16);
                uint64_t v105 = Peer;
              }
              LogPrintF((uint64_t)v120, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x5Au, (uint64_t)"### Pair-verify server M3 verify signature failed: %#m\n", v106, v107, v108, v109, v105);
            }
LABEL_100:

            goto LABEL_83;
          }

          goto LABEL_213;
        }
      }
      long long v111 = v8;
      uint64_t v112 = *(void **)(a1 + 296);
      if (v112)
      {
        free(v112);
        *(void *)(a1 + 296) = 0;
      }
      uint64_t v113 = (size_t *)(a1 + 304);
      *(void *)(a1 + 304) = 0;
      long long v114 = (char *)TLV8CopyCoalesced(v64, v67, 1, (size_t *)(a1 + 304), (int *)&Peer);
      *(void *)(a1 + 296) = v114;
      if (Peer) {
        goto LABEL_200;
      }
      if (*v113)
      {
        unsigned int Peer = PairingSessionFindPeerEx(a1, v114, *v113, (_OWORD *)(a1 + 606), &cf, a6, a7, a8);
        if (Peer)
        {
          int v119 = *(int **)(a1 + 16);
          id v8 = v111;
          if (*v119 <= 50)
          {
            if (*v119 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v119, 0x32u)) {
                goto LABEL_231;
              }
              int v119 = *(int **)(a1 + 16);
            }
            LogPrintF((uint64_t)v119, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server unknown peer: %.*s\n", v115, v116, v117, v118, *(void *)(a1 + 304));
          }
          goto LABEL_231;
        }
        unsigned int Peer = TLV8GetBytes(v64, v67, 10, 0x40uLL, 0x40uLL, (char *)&__dst, 0, 0);
        if (Peer)
        {
LABEL_200:
          BOOL v26 = 0;
LABEL_201:
          id v8 = v111;
          goto LABEL_84;
        }
        *(void *)&v151[0] = *v113 + 64;
        CFDataRef v121 = malloc_type_malloc(*(size_t *)&v151[0], 0x2391685BuLL);
        if (v121)
        {
          CFDataRef v122 = v121;
          long long v123 = *(_OWORD *)(a1 + 590);
          _OWORD *v121 = *(_OWORD *)(a1 + 574);
          v121[1] = v123;
          uint64_t v124 = v121 + 2;
          memcpy(v121 + 2, *(const void **)(a1 + 296), *(void *)(a1 + 304));
          uint64_t v125 = (_OWORD *)((char *)v124 + *(void *)(a1 + 304));
          long long v126 = *(_OWORD *)(a1 + 462);
          *uint64_t v125 = *(_OWORD *)(a1 + 446);
          v125[1] = v126;
          ccsha512_di();
          unsigned int Peer = cced25519_verify();
          free(v122);
          id v8 = v111;
          goto LABEL_213;
        }
        BOOL v26 = 0;
        unsigned int v142 = -6728;
      }
      else
      {
        BOOL v26 = 0;
        unsigned int v142 = -6743;
      }
      unsigned int Peer = v142;
      goto LABEL_201;
    }
    if ((v73 & 0x200000) == 0)
    {
      uint64_t v76 = _PairingSessionAppleIDVerifyPeer(a1, v64, v67);
      unsigned int Peer = v76;
      goto LABEL_214;
    }
LABEL_213:
    uint64_t v76 = Peer;
LABEL_214:
    if (v76)
    {
      int v127 = *(int **)(a1 + 16);
      if (*v127 <= 50)
      {
        if (*v127 == -1)
        {
          if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x32u)) {
            goto LABEL_231;
          }
          int v127 = *(int **)(a1 + 16);
          uint64_t v76 = Peer;
        }
        LogPrintF((uint64_t)v127, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server bad signature: %#m\n", v68, v69, v70, v71, v76);
      }
LABEL_231:
      char v138 = 2;
LABEL_234:
      LOBYTE(__s) = v138;
      unsigned int Peer = TLV8BufferAppend((uint64_t)&__src, 7, (char *)&__s, 1uLL);
      if (Peer) {
        goto LABEL_83;
      }
      LOBYTE(__s) = 4;
      p_dst = (char *)&__s;
      goto LABEL_236;
    }
    unsigned int Peer = _PairingSessionVerifyACL(a1, (uint64_t)cf);
    if (!Peer)
    {
      int v133 = *(const void **)(a1 + 272);
      if (v133) {
        CFRelease(v133);
      }
      *(void *)(a1 + 272) = cf;
      CFTypeRef cf = 0;
      uint64_t v134 = (UInt8 *)TLV8CopyCoalesced(v64, v67, 29, (size_t *)v151, 0);
      if (v134)
      {
        int v135 = v134;
        int v136 = _OPACKDecodeBytes(0, v134, *(uint64_t *)&v151[0], 0, &Peer);
        free(v135);
        if (!v136) {
          goto LABEL_83;
        }
        CFTypeID v137 = CFGetTypeID(v136);
        if (v137 != CFDictionaryGetTypeID())
        {
          unsigned int Peer = -6756;
          CFRelease(v136);
          goto LABEL_83;
        }
        PairingSessionSetProperty(a1, @"appInfoPeer", v136);
        CFRelease(v136);
      }
      unsigned int Peer = _ExtractGroupInfoTLV(a1, v64, v67);
      if (!Peer)
      {
        *(unsigned char *)(a1 + 120) = 4;
        unsigned int Peer = _VerifyServerM4(a1, a4, a5);
        BOOL v26 = Peer == 0;
        goto LABEL_84;
      }
      goto LABEL_83;
    }
    int v132 = *(int **)(a1 + 16);
    if (*v132 <= 50)
    {
      if (*v132 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v132, 0x32u)) {
          goto LABEL_233;
        }
        int v132 = *(int **)(a1 + 16);
      }
      LogPrintF((uint64_t)v132, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server -- client lacks ACL: %@\n", v128, v129, v130, v131, *(void *)(a1 + 176));
    }
LABEL_233:
    char v138 = 7;
    goto LABEL_234;
  }
LABEL_83:
  BOOL v26 = 0;
LABEL_84:
  if (cf) {
    CFRelease(cf);
  }
  if (v64) {
    free(v64);
  }
  if (v162) {
    free(v162);
  }
  uint64_t Bytes = Peer;
  if (Peer)
  {
    uint64_t v144 = v8;
    goto LABEL_108;
  }
LABEL_192:
  uint64_t Bytes = 0;
  if (a4 && a5)
  {
    _PairingSessionUpdateTranscript(a1, a2, a3, *a4, *a5);
    uint64_t Bytes = 0;
  }
LABEL_195:
  unsigned char *v8 = v26;
  return Bytes;
}

uint64_t _ResumePairingClientExchange(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, size_t *a5, char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  size_t v53 = 0;
  uint64_t v59 = v62;
  long long v60 = xmmword_18E416F70;
  uint64_t v61 = 0;
  uint64_t v15 = (char *)(a1 + 120);
  int v14 = *(unsigned __int8 *)(a1 + 120);
  if (!*(unsigned char *)(a1 + 120))
  {
    int v14 = 1;
    *uint64_t v15 = 1;
  }
  unint64_t v16 = (unint64_t)&a2[a3];
  memset(v62, 0, sizeof(v62));
  if (a3)
  {
    uint64_t v17 = a2;
    do
    {
      if (v17 == (unsigned __int8 *)v16) {
        goto LABEL_42;
      }
      if ((unint64_t)v17 >= v16) {
        goto LABEL_69;
      }
      if (v16 - (unint64_t)v17 < 2)
      {
LABEL_42:
        unsigned int v30 = -6727;
        goto LABEL_71;
      }
      uint64_t v18 = v17 + 2;
      uint64_t v19 = v17[1];
      if ((unint64_t)&v17[v19 + 2] > v16)
      {
        unsigned int v30 = -6750;
        goto LABEL_71;
      }
      int v20 = *v17;
      v17 += v19 + 2;
    }
    while (v20 != 6);
    if (v19 == 1)
    {
      if (*v18 == v14) {
        goto LABEL_12;
      }
      unsigned int v30 = -6709;
    }
    else
    {
      unsigned int v30 = -6743;
    }
    goto LABEL_71;
  }
LABEL_12:
  if (v14 == 2)
  {
    BOOL v26 = *(int **)(a1 + 16);
    int v27 = *v26;
    if (*v26 <= 30)
    {
      if (v27 == -1)
      {
        if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu)) {
          goto LABEL_45;
        }
        BOOL v26 = *(int **)(a1 + 16);
        int v27 = *v26;
      }
      if (v27 > 10) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = v27 == -1 && !_LogCategory_Initialize((uint64_t)v26, 0xAu);
      }
      LogPrintF((uint64_t)v26, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume client M2 -- resume response\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v28);
    }
LABEL_45:
    unsigned int Bytes = TLV8GetBytes(a2, &a2[a3], 0, 1uLL, 1uLL, (char *)&__dst, 0, 0);
    if (!Bytes && __dst == 6)
    {
      uint64_t UInt64 = TLV8GetUInt64(a2, &a2[a3], 14, (int *)&Bytes, 0);
      *(void *)(a1 + 376) = UInt64;
      if (Bytes) {
        goto LABEL_57;
      }
      long long v36 = *(_OWORD *)(a1 + 462);
      long long __dst = *(_OWORD *)(a1 + 446);
      long long v56 = v36;
      uint64_t v57 = UInt64;
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)&__dst, 0x28uLL, (uint64_t)"Pair-Resume-Response-Info", 25, 0x20uLL, (uint64_t)__s);
      long long v37 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v53, (int *)&Bytes);
      BOOL v24 = v37;
      if (!Bytes)
      {
        size_t v38 = v53;
        if (v53 <= 0xF)
        {
          char v29 = 0;
          unsigned int Bytes = -6743;
LABEL_35:
          *a6 = v29;
          if (v61)
          {
            free(v61);
            uint64_t v61 = 0;
          }
          if (!v24) {
            goto LABEL_59;
          }
LABEL_38:
          free(v24);
          goto LABEL_59;
        }
        unint64_t v39 = v53 - 16;
        size_t v53 = v39;
        unsigned int Bytes = _chacha20_poly1305_decrypt_all(__s, "PR-Msg02", 8, 0, 0, v37, v39, v37, (uint64_t)v37[-1].i64 + v38, 16);
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
        if (!Bytes)
        {
          size_t v47 = *(uint64_t (**)(int8x16_t *, unint64_t, void))(a1 + 88);
          if (!v47 || (unsigned int Bytes = v47(v24, v39, *(void *)(a1 + 24))) == 0)
          {
            CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)&__dst, 0x28uLL, (uint64_t)"Pair-Resume-Shared-Secret-Info", 30, 0x20uLL, a1 + 638);
            _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(void *)(a1 + 304), *(const void **)(a1 + 248), *(void *)(a1 + 256), *(void *)(a1 + 376), (_OWORD *)(a1 + 638));
            *a4 = 0;
            *a5 = 0;
            *(unsigned char *)(a1 + 120) = 3;
            uint64_t v48 = *(int **)(a1 + 16);
            if (*v48 <= 30)
            {
              if (*v48 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v48, 0x1Eu)) {
                  goto LABEL_78;
                }
                uint64_t v48 = *(int **)(a1 + 16);
              }
              LogPrintF((uint64_t)v48, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume client done\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v52);
            }
LABEL_78:
            char v29 = 1;
            goto LABEL_34;
          }
        }
      }
      char v29 = 0;
      goto LABEL_35;
    }
    uint64_t v40 = *(int **)(a1 + 16);
    if (*v40 <= 50)
    {
      if (*v40 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v40, 0x32u)) {
          goto LABEL_56;
        }
        uint64_t v40 = *(int **)(a1 + 16);
      }
      LogPrintF((uint64_t)v40, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"Pair-resume client M2 for ID %llu failed %#m...doing pair-verify\n", v31, v32, v33, v34, *(void *)(a1 + 376));
    }
LABEL_56:
    *(unsigned char *)(a1 + 120) = 2;
    *(_DWORD *)(a1 + 96) = 3;
    unsigned int Bytes = _VerifyClientExchange(a1, a2, a3, a4, (uint64_t)a5, (uint64_t)a6, v33, v34);
    goto LABEL_57;
  }
  if (v14 != 1)
  {
    BOOL v24 = 0;
    char v29 = 0;
LABEL_34:
    unsigned int Bytes = 0;
    goto LABEL_35;
  }
  if (a3)
  {
LABEL_69:
    unsigned int v30 = -6705;
  }
  else if (*(void *)(a1 + 352))
  {
    uint64_t v21 = (void *)(a1 + 296);
    unint64_t v22 = *(void **)(a1 + 296);
    if (v22)
    {
      free(v22);
      void *v21 = 0;
    }
    *(void *)(a1 + 304) = 0;
    if (_PairingFindResumeState(*(void *)(a1 + 376), (void *)(a1 + 296), (void *)(a1 + 304), (_OWORD *)(a1 + 638)))
    {
      unsigned int v30 = -6767;
    }
    else
    {
      RandomBytes((void *)(a1 + 478), 0x20uLL);
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 478, 32, "Pair-Verify-ECDH-Salt", 0x15uLL, (uint64_t)"Pair-Verify-ECDH-Info", 21, 0x20uLL, a1 + 478);
      cccurve25519_make_pub();
      int v23 = (int8x16_t *)malloc_type_malloc(*(void *)(a1 + 360) + 16, 0xECA03EE7uLL);
      if (v23)
      {
        BOOL v24 = v23;
        long long v25 = *(_OWORD *)(a1 + 462);
        long long __dst = *(_OWORD *)(a1 + 446);
        long long v56 = v25;
        uint64_t v57 = *(void *)(a1 + 376);
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)&__dst, 0x28uLL, (uint64_t)"Pair-Resume-Request-Info", 24, 0x20uLL, (uint64_t)__s);
        _chacha20_poly1305_encrypt_all(__s, "PR-Msg01", 8, 0, 0, *(int8x16_t **)(a1 + 352), *(void *)(a1 + 360), v24, (uint64_t)v24->i64 + *(void *)(a1 + 360));
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
        unsigned int Bytes = TLV8BufferAppend((uint64_t)&v59, 6, v15, 1uLL);
        if (Bytes
          || (v63[0] = 6, (unsigned int Bytes = TLV8BufferAppend((uint64_t)&v59, 0, v63, 1uLL)) != 0)
          || (unsigned int Bytes = TLV8BufferAppendUInt64((uint64_t)&v59, 14, *(void *)(a1 + 376))) != 0
          || (unsigned int Bytes = TLV8BufferAppend((uint64_t)&v59, 5, v24->i8, *(void *)(a1 + 360) + 16)) != 0
          || (unsigned int Bytes = TLV8BufferAppend((uint64_t)&v59, 3, (char *)(a1 + 446), 0x20uLL)) != 0
          || (unsigned int Bytes = TLV8BufferDetach((uint64_t)&v59, a4, a5)) != 0)
        {
          *a6 = 0;
          if (v61)
          {
            free(v61);
            uint64_t v61 = 0;
          }
          goto LABEL_38;
        }
        int v49 = *(int **)(a1 + 16);
        int v50 = *v49;
        if (*v49 > 30) {
          goto LABEL_94;
        }
        if (v50 == -1)
        {
          if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
          {
LABEL_94:
            char v29 = 0;
            *uint64_t v15 = 2;
            goto LABEL_34;
          }
          int v49 = *(int **)(a1 + 16);
          int v50 = *v49;
        }
        if (v50 > 10) {
          uint64_t v51 = 1;
        }
        else {
          uint64_t v51 = v50 == -1 && !_LogCategory_Initialize((uint64_t)v49, 0xAu);
        }
        LogPrintF((uint64_t)v49, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume client M1 -- resume request\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v51);
        goto LABEL_94;
      }
      unsigned int v30 = -6728;
    }
  }
  else
  {
    unsigned int v30 = -6745;
  }
LABEL_71:
  unsigned int Bytes = v30;
LABEL_57:
  *a6 = 0;
  if (v61)
  {
    free(v61);
    uint64_t v61 = 0;
  }
LABEL_59:
  uint64_t v41 = Bytes;
  if (Bytes)
  {
    uint64_t v42 = *(int **)(a1 + 16);
    int v43 = *v42;
    if (*v42 <= 50)
    {
      if (v43 == -1)
      {
        BOOL v45 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x32u);
        uint64_t v41 = Bytes;
        if (!v45) {
          return v41;
        }
        uint64_t v42 = *(int **)(a1 + 16);
        int v43 = *v42;
      }
      uint64_t v44 = *v15;
      if (v43 == -1) {
        _LogCategory_Initialize((uint64_t)v42, 0x28u);
      }
      LogPrintF((uint64_t)v42, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-resume client state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v44);
      return Bytes;
    }
  }
  return v41;
}

uint64_t _ResumePairingServerExchange(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, size_t *a5, char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  int v14 = &a2[a3];
  memset(v63, 0, sizeof(v63));
  size_t __n = 0;
  __src = 0;
  long long v60 = v63;
  long long v61 = xmmword_18E416F70;
  uint64_t v15 = a2;
  unsigned int v62 = 0;
  do
  {
    if (v15 == v14)
    {
LABEL_78:
      unsigned int v27 = -6727;
      goto LABEL_81;
    }
    if (v15 >= v14)
    {
      unsigned int v27 = -6705;
      goto LABEL_81;
    }
    if ((unint64_t)(v14 - v15) < 2) {
      goto LABEL_78;
    }
    unint64_t v16 = v15 + 2;
    uint64_t v17 = v15[1];
    if (&v15[v17 + 2] > v14)
    {
      unsigned int v27 = -6750;
LABEL_81:
      long long v25 = 0;
      char v26 = 0;
      goto LABEL_27;
    }
    int v18 = *v15;
    v15 += v17 + 2;
  }
  while (v18 != 6);
  unsigned int Bytes = 0;
  if (v17 != 1)
  {
    long long v25 = 0;
    goto LABEL_85;
  }
  if (*v16 == 1) {
    _PairingSessionReset(a1);
  }
  int v20 = (unsigned char *)(a1 + 120);
  uint64_t v19 = *(unsigned __int8 *)(a1 + 120);
  if (*(unsigned char *)(a1 + 120))
  {
    if (*v16 != v19) {
      goto LABEL_26;
    }
    if (v19 != 1)
    {
      uint64_t v21 = *(int **)(a1 + 16);
      if (*v21 <= 60)
      {
        if (*v21 != -1) {
          goto LABEL_15;
        }
        if (_LogCategory_Initialize((uint64_t)v21, 0x3Cu))
        {
          uint64_t v21 = *(int **)(a1 + 16);
          uint64_t v19 = *(unsigned __int8 *)(a1 + 120);
LABEL_15:
          LogPrintF((uint64_t)v21, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-resume server bad state: %d\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v19);
        }
      }
LABEL_26:
      long long v25 = 0;
      char v26 = 0;
      unsigned int v27 = -6709;
LABEL_27:
      unsigned int Bytes = v27;
      goto LABEL_35;
    }
  }
  else
  {
    unsigned char *v20 = 1;
    if (*v16 != 1) {
      goto LABEL_26;
    }
  }
  unint64_t v22 = *(int **)(a1 + 16);
  int v23 = *v22;
  if (*v22 <= 30)
  {
    if (v23 != -1)
    {
LABEL_19:
      if (v23 > 10) {
        BOOL v24 = 0;
      }
      else {
        BOOL v24 = v23 != -1 || _LogCategory_Initialize((uint64_t)v22, 0xAu);
      }
      LogPrintF((uint64_t)v22, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume server M1 -- resume request\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, !v24);
      goto LABEL_30;
    }
    if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu))
    {
      unint64_t v22 = *(int **)(a1 + 16);
      int v23 = *v22;
      goto LABEL_19;
    }
  }
LABEL_30:
  unsigned int Bytes = TLV8GetBytes(a2, v14, 0, 1uLL, 1uLL, (char *)__dst, 0, 0);
  if (Bytes) {
    goto LABEL_33;
  }
  if (LOBYTE(__dst[0]) != 6)
  {
    long long v25 = 0;
    char v26 = 0;
    unsigned int v27 = -6707;
    goto LABEL_27;
  }
  uint64_t UInt64 = TLV8GetUInt64(a2, v14, 14, (int *)&Bytes, 0);
  *(void *)(a1 + 376) = UInt64;
  if (Bytes) {
    goto LABEL_33;
  }
  if (*(void *)(a1 + 296))
  {
    free(*(void **)(a1 + 296));
    *(void *)(a1 + 296) = 0;
    uint64_t UInt64 = *(void *)(a1 + 376);
  }
  *(void *)(a1 + 304) = 0;
  unsigned int Bytes = _PairingFindResumeState(UInt64, (void *)(a1 + 296), (void *)(a1 + 304), (_OWORD *)(a1 + 638));
  if (Bytes)
  {
    size_t v38 = *(int **)(a1 + 16);
    if (*v38 <= 50)
    {
      if (*v38 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v38, 0x32u)) {
          goto LABEL_83;
        }
        size_t v38 = *(int **)(a1 + 16);
      }
      LogPrintF((uint64_t)v38, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"Pair-resume server M1 for ID %llu failed %#m...doing pair-verify\n", v34, v35, v36, v37, *(void *)(a1 + 376));
    }
LABEL_83:
    *(unsigned char *)(a1 + 120) = 0;
    *(_DWORD *)(a1 + 96) = 3;
    unsigned int v49 = _VerifyClientExchange(a1, a2, a3, a4, (uint64_t)a5, (uint64_t)a6, v36, v37);
    long long v25 = 0;
    char v26 = 0;
    unsigned int Bytes = v49;
    goto LABEL_35;
  }
  unsigned int Bytes = TLV8GetBytes(a2, v14, 3, 0x20uLL, 0x20uLL, (char *)(a1 + 574), 0, 0);
  if (Bytes)
  {
LABEL_33:
    long long v25 = 0;
LABEL_34:
    char v26 = 0;
    goto LABEL_35;
  }
  size_t v55 = 0;
  long long v40 = *(_OWORD *)(a1 + 590);
  __dst[0] = *(_OWORD *)(a1 + 574);
  __dst[1] = v40;
  uint64_t v58 = *(void *)(a1 + 376);
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)__dst, 0x28uLL, (uint64_t)"Pair-Resume-Request-Info", 24, 0x20uLL, (uint64_t)__s);
  uint64_t v41 = (int8x16_t *)TLV8CopyCoalesced(a2, v14, 5, &v55, (int *)&Bytes);
  long long v25 = v41;
  if (Bytes) {
    goto LABEL_34;
  }
  if (v55 <= 0xF)
  {
LABEL_85:
    char v26 = 0;
    unsigned int v27 = -6743;
    goto LABEL_27;
  }
  size_t v42 = v55 - 16;
  unsigned int Bytes = _chacha20_poly1305_decrypt_all(__s, "PR-Msg01", 8, 0, 0, v41, v55 - 16, v41, (uint64_t)v41[-1].i64 + v55, 16);
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  if (Bytes) {
    goto LABEL_34;
  }
  _PairingRemoveResumeSessionID(*(void *)(a1 + 376));
  RandomBytes(&v58, 8uLL);
  unsigned int Bytes = 0;
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)&v58, 8, "Pair-Resume-SessionID-Salt", 0x1AuLL, (uint64_t)"Pair-Resume-SessionID-Info", 26, 8uLL, (uint64_t)&v58);
  *(void *)(a1 + 376) = v58;
  int v43 = *(uint64_t (**)(void, void, int8x16_t *, size_t, void **, size_t *, void))(a1 + 80);
  if (v43)
  {
    unsigned int Bytes = v43(*(void *)(a1 + 296), *(void *)(a1 + 304), v25, v42, &__src, &__n, *(void *)(a1 + 24));
    if (Bytes) {
      goto LABEL_34;
    }
  }
  if (v25) {
    free(v25);
  }
  unsigned char *v20 = 2;
  size_t v44 = __n + 16;
  size_t v55 = __n + 16;
  BOOL v45 = (int8x16_t *)malloc_type_malloc(__n + 16, 0x59058CF1uLL);
  long long v25 = v45;
  if (!v45)
  {
    char v26 = 0;
    unsigned int v27 = -6728;
    goto LABEL_27;
  }
  if (__n) {
    memcpy(v45, __src, __n);
  }
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)__dst, 0x28uLL, (uint64_t)"Pair-Resume-Response-Info", 25, 0x20uLL, (uint64_t)__s);
  _chacha20_poly1305_encrypt_all(__s, "PR-Msg02", 8, 0, 0, (int8x16_t *)__src, __n, v25, (uint64_t)v25->i64 + __n);
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)__dst, 0x28uLL, (uint64_t)"Pair-Resume-Shared-Secret-Info", 30, 0x20uLL, a1 + 638);
  _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(void *)(a1 + 304), *(const void **)(a1 + 248), *(void *)(a1 + 256), *(void *)(a1 + 376), (_OWORD *)(a1 + 638));
  unsigned int Bytes = TLV8BufferAppend((uint64_t)&v60, 6, (char *)(a1 + 120), 1uLL);
  if (Bytes) {
    goto LABEL_34;
  }
  v64[0] = 6;
  unsigned int Bytes = TLV8BufferAppend((uint64_t)&v60, 0, v64, 1uLL);
  if (Bytes) {
    goto LABEL_34;
  }
  unsigned int Bytes = TLV8BufferAppendUInt64((uint64_t)&v60, 14, *(void *)(a1 + 376));
  if (Bytes) {
    goto LABEL_34;
  }
  unsigned int Bytes = TLV8BufferAppend((uint64_t)&v60, 5, v25->i8, v44);
  if (Bytes) {
    goto LABEL_34;
  }
  unsigned int Bytes = TLV8BufferDetach((uint64_t)&v60, a4, a5);
  if (Bytes) {
    goto LABEL_34;
  }
  size_t v46 = *(int **)(a1 + 16);
  int v47 = *v46;
  if (*v46 >= 31)
  {
    unsigned char *v20 = 3;
    goto LABEL_100;
  }
  if (v47 == -1)
  {
    BOOL v50 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu);
    size_t v46 = *(int **)(a1 + 16);
    if (!v50) {
      goto LABEL_96;
    }
    int v47 = *v46;
  }
  if (v47 > 10) {
    uint64_t v48 = 1;
  }
  else {
    uint64_t v48 = v47 == -1 && !_LogCategory_Initialize((uint64_t)v46, 0xAu);
  }
  LogPrintF((uint64_t)v46, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume server M2 -- resume response\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v48);
  size_t v46 = *(int **)(a1 + 16);
LABEL_96:
  int v51 = *v46;
  unsigned char *v20 = 3;
  if (v51 <= 30)
  {
    if (v51 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v46, 0x1Eu)) {
        goto LABEL_100;
      }
      size_t v46 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v46, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume server done\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v52);
  }
LABEL_100:
  unsigned int Bytes = 0;
  char v26 = 1;
LABEL_35:
  *a6 = v26;
  if (v62)
  {
    free(v62);
    unsigned int v62 = 0;
  }
  if (__src)
  {
    free(__src);
    __src = 0;
  }
  if (v25) {
    free(v25);
  }
  uint64_t v29 = Bytes;
  if (Bytes)
  {
    unsigned int v30 = *(int **)(a1 + 16);
    int v31 = *v30;
    if (*v30 <= 50)
    {
      if (v31 == -1)
      {
        BOOL v33 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x32u);
        uint64_t v29 = Bytes;
        if (!v33) {
          return v29;
        }
        unsigned int v30 = *(int **)(a1 + 16);
        int v31 = *v30;
      }
      uint64_t v32 = *(unsigned __int8 *)(a1 + 120);
      if (v31 == -1) {
        _LogCategory_Initialize((uint64_t)v30, 0x28u);
      }
      LogPrintF((uint64_t)v30, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-resume server state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v32);
      return Bytes;
    }
  }
  return v29;
}

uint64_t _PairingSessionSavePeerKeychain(uint64_t a1, char *a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v34[0] = 0;
  pthread_mutex_lock(&gPairingGlobalLock);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable)
  {
    CFDataRef Data = 0;
    goto LABEL_22;
  }
  uint64_t v15 = Mutable;
  unint64_t v16 = (const void **)MEMORY[0x1E4F1CFD0];
  if ((*(unsigned char *)(a1 + 808) & 4) != 0) {
    CFDictionarySetValue(Mutable, @"homeKitRegistered", (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  if (a5)
  {
    CFDictionarySetInt64(v15, @"permissions", a5);
    if (a5)
    {
      uint64_t v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDataRef Data = v17;
      if (v17)
      {
        CFDictionarySetValue(v17, @"com.apple.admin", *v16);
        CFDictionarySetValue(v15, @"acl", Data);
        CFRelease(Data);
        goto LABEL_8;
      }
LABEL_22:
      uint64_t v20 = 4294960568;
      goto LABEL_23;
    }
  }
LABEL_8:
  if (CFDictionaryGetCount(v15) < 1)
  {
    CFRelease(v15);
    CFDataRef Data = 0;
  }
  else
  {
    CFDataRef Data = CFPropertyListCreateData(0, v15, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFRelease(v15);
    if (!Data)
    {
      uint64_t v20 = 4294960596;
      goto LABEL_23;
    }
  }
  _PairingSessionDeletePeer(a1, a2, a3, v19, v11, v12, v13, v14);
  v34[0] = 0;
  ASPrintF(v34, (uint64_t)"%@: %.*s", v21, v22, v23, v24, v25, v26, *(void *)(a1 + 784));
  unsigned int v27 = v34[0];
  if (!v34[0]) {
    goto LABEL_22;
  }
  for (uint64_t i = 0; i != 64; i += 2)
  {
    uint64_t v29 = (char *)&v34[1] + i + 7;
    unsigned int v30 = *a4++;
    *uint64_t v29 = a0123456789abcd[(unint64_t)v30 >> 4];
    v29[1] = a0123456789abcd[v30 & 0xF];
  }
  char v35 = 0;
  uint64_t v31 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%i%kO=%s%kO=%O%kO=%.*s%kO=%O%kO=%O%kO=%D%kO=%O}", *MEMORY[0x1E4F3B5C0], *MEMORY[0x1E4F3B850], *MEMORY[0x1E4F3B688], *(void *)(a1 + 784), *MEMORY[0x1E4F3BD38], *MEMORY[0x1E4F3B878], *MEMORY[0x1E4F3B978]);
  free(v27);
  if (!v31)
  {
    uint64_t v20 = 0;
    goto LABEL_17;
  }
  uint64_t v20 = v31;
LABEL_23:
  BOOL v33 = *(int **)(a1 + 16);
  if (*v33 > 60) {
    goto LABEL_17;
  }
  if (*v33 != -1) {
    goto LABEL_25;
  }
  if (_LogCategory_Initialize((uint64_t)v33, 0x3Cu))
  {
    BOOL v33 = *(int **)(a1 + 16);
LABEL_25:
    LogPrintF((uint64_t)v33, (uint64_t)"OSStatus _PairingSessionSavePeerKeychain(PairingSessionRef, const void *, size_t, const uint8_t *, PairingPermissions)", 0x3Cu, (uint64_t)"### Save %@ %.*s failed: %#m\n", v11, v12, v13, v14, *(void *)(a1 + 784));
  }
LABEL_17:
  if (Data) {
    CFRelease(Data);
  }
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v20;
}

void _PairingSessionDeletePeer(uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v31 = a3;
  if (a3 == -1) {
    size_t v31 = strlen(__s);
  }
  CFIndex v10 = (const void *)*MEMORY[0x1E4F3B8C0];
  CFArrayRef v11 = (const __CFArray *)KeychainCopyMatchingFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O%kO=%O}", a3, a4, a5, a6, a7, a8, *MEMORY[0x1E4F3B978]);
  if (v11)
  {
    CFArrayRef v12 = v11;
    int v33 = 0;
    CFIndex Count = CFArrayGetCount(v11);
    if (Count >= 1)
    {
      CFIndex v14 = Count;
      CFIndex v15 = 0;
      uint64_t v32 = (const void *)*MEMORY[0x1E4F3B5C0];
      unint64_t v16 = (const void *)*MEMORY[0x1E4F3BD40];
      do
      {
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFDictionaryRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v12, v15, TypeID, 0);
        if (TypedValueAtIndex)
        {
          CFDictionaryRef v19 = TypedValueAtIndex;
          if (*(_DWORD *)(a1 + 792) == CFDictionaryGetInt64(TypedValueAtIndex, v10, &v33))
          {
            if (!__s
              || (uint64_t v20 = CFDictionaryCopyCString(v19, v32, &v33), !v33)
              && (uint64_t v21 = v20, v22 = strnicmpx((unsigned __int8 *)__s, v31, v20), free(v21), !v22))
            {
              CFTypeID v23 = CFDataGetTypeID();
              CFDictionaryGetTypedValue(v19, v16, v23, &v33);
              if (!v33) {
                int v33 = KeychainDeleteFormatted((uint64_t)"{%kO=%O}", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v16);
              }
            }
          }
        }
        ++v15;
      }
      while (v14 != v15);
    }
    CFRelease(v12);
  }
}

__CFArray *_PairingSessionCopyPeers(int a1, char *__s, uint64_t a3, _DWORD *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a3 == -1) {
    strlen(__s);
  }
  int v48 = 0;
  unint64_t v47 = 0;
  pthread_mutex_lock(&gPairingGlobalLock);
  uint64_t v5 = (const void *)*MEMORY[0x1E4F3B5C0];
  uint64_t v45 = *MEMORY[0x1E4F3B978];
  CFArrayRef v11 = (const __CFArray *)KeychainCopyMatchingFormatted(&v48, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%?.*s%kO=%O%kO=%O%kO=%O}", *MEMORY[0x1E4F1CFD0], v6, v7, v8, v9, v10, *MEMORY[0x1E4F3B978]);
  if (v48 == -25300)
  {
    int v48 = 0;
  }
  else if (v48)
  {
    Mutable = 0;
    goto LABEL_29;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (!Mutable)
  {
    Mutable = 0;
    int v48 = -6728;
    goto LABEL_29;
  }
  size_t v44 = a4;
  if (!v11 || (CFIndex Count = CFArrayGetCount(v11), Count < 1))
  {
LABEL_27:
    int v48 = 0;
    goto LABEL_28;
  }
  CFIndex v13 = Count;
  CFIndex v14 = 0;
  CFIndex v15 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  unint64_t v16 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  int v43 = (const void *)*MEMORY[0x1E4F3B688];
  while (1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFArrayRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v11, v14, TypeID, &v48);
    if (v48) {
      goto LABEL_26;
    }
    CFDictionaryRef v19 = TypedValueAtIndex;
    CFMutableDictionaryRef v20 = CFDictionaryCreateMutable(0, 0, v15, v16);
    if (!v20) {
      break;
    }
    uint64_t v21 = v20;
    CFTypeID v22 = CFStringGetTypeID();
    CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(v19, v5, v22, &v48);
    if (v48)
    {
      CFDataRef v24 = v21;
    }
    else
    {
      CFDictionarySetValue(v21, @"identifier", TypedValue);
      CFDataRef v31 = (const __CFData *)KeychainCopyMatchingFormatted(&v48, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v25, v26, v27, v28, v29, v30, v45);
      CFDataRef v24 = v31;
      if (!v48)
      {
        unint64_t v47 = 0;
        uint64_t v32 = v15;
        BytePtr = CFDataGetBytePtr(v31);
        CFIndex Length = CFDataGetLength(v24);
        char v35 = (char *)BytePtr;
        CFIndex v15 = v32;
        int v48 = HexToData(v35, Length, 22, (uint64_t)bytes, 0x20uLL, &v47, 0, 0);
        if (!v48 && v47 == 32)
        {
          CFDictionarySetData(v21, @"pk", bytes, 32);
          CFTypeID v36 = CFDataGetTypeID();
          CFDataRef v37 = CFDictionaryGetTypedValue(v19, v43, v36, 0);
          if (v37)
          {
            CFPropertyListRef v38 = CFPropertyListCreateWithData(0, v37, 0, 0, 0);
            if (v38)
            {
              unint64_t v39 = v38;
              CFTypeID v40 = CFGetTypeID(v38);
              if (v40 == CFDictionaryGetTypeID())
              {
                CFDictionarySetValue(v21, @"info", v39);
                Value = CFDictionaryGetValue((CFDictionaryRef)v39, @"permissions");
                if (Value) {
                  CFDictionarySetValue(v21, @"permissions", Value);
                }
              }
              CFRelease(v39);
              CFIndex v15 = v32;
            }
          }
          CFArrayAppendValue(Mutable, v21);
        }
      }
      CFRelease(v21);
      if (!v24) {
        goto LABEL_26;
      }
    }
    CFRelease(v24);
LABEL_26:
    if (v13 == ++v14) {
      goto LABEL_27;
    }
  }
  int v48 = -6728;
  CFRelease(Mutable);
  Mutable = 0;
LABEL_28:
  a4 = v44;
LABEL_29:
  if (v11) {
    CFRelease(v11);
  }
  if (a4) {
    *a4 = v48;
  }
  pthread_mutex_unlock(&gPairingGlobalLock);
  return Mutable;
}

uint64_t _PairingFindResumeState(uint64_t a1, void *a2, void *a3, _OWORD *a4)
{
  uint64_t v8 = mach_absolute_time();
  pthread_mutex_lock(&gPairingGlobalLock);
  uint64_t v9 = &gPairingResumeStateList;
  do
  {
    uint64_t v9 = (uint64_t *)*v9;
    if (!v9)
    {
      uint64_t v13 = 4294960569;
      goto LABEL_12;
    }
  }
  while (v9[10] != a1);
  if (v8 >= v9[5])
  {
    uint64_t v13 = 4294960574;
  }
  else
  {
    if (!a2 || !a3) {
      goto LABEL_10;
    }
    size_t v10 = v9[2];
    if (v10)
    {
      CFArrayRef v11 = malloc_type_malloc(v10, 0x55095BA6uLL);
      if (v11)
      {
        CFArrayRef v12 = v11;
        memcpy(v11, (const void *)v9[1], v9[2]);
        *a2 = v12;
        *a3 = v9[2];
LABEL_10:
        uint64_t v13 = 0;
        long long v14 = *((_OWORD *)v9 + 4);
        *a4 = *((_OWORD *)v9 + 3);
        a4[1] = v14;
        goto LABEL_12;
      }
      uint64_t v13 = 4294960568;
    }
    else
    {
      uint64_t v13 = 4294960553;
    }
  }
LABEL_12:
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v13;
}

uint64_t _PairingRemoveResumeSessionID(uint64_t a1)
{
  pthread_mutex_lock(&gPairingGlobalLock);
  uint64_t v2 = gPairingResumeStateList;
  if (gPairingResumeStateList)
  {
    id v3 = &gPairingResumeStateList;
    do
    {
      id v4 = v3;
      id v3 = (uint64_t *)v2;
      while (1)
      {
        uint64_t v2 = *v3;
        if (v3[10] != a1) {
          break;
        }
        uint64_t *v4 = v2;
        _PairingFreeResumeState(v3);
        id v3 = (uint64_t *)*v4;
        if (!*v4) {
          goto LABEL_8;
        }
      }
    }
    while (v2);
  }
LABEL_8:
  return pthread_mutex_unlock(&gPairingGlobalLock);
}

void _PairingSaveResumeState(uint64_t a1, const void *a2, size_t a3, const void *a4, size_t a5, uint64_t a6, _OWORD *a7)
{
  pthread_mutex_lock(&gPairingGlobalLock);
  uint64_t v14 = gPairingResumeStateList;
  if (gPairingResumeStateList)
  {
    CFIndex v15 = &gPairingResumeStateList;
    do
    {
      unint64_t v16 = v15;
      CFIndex v15 = (uint64_t *)v14;
      while (v15[2] == a3
           && !memcmp(a2, (const void *)v15[1], a3)
           && ((*(unsigned char *)(a1 + 102) & 0x80) == 0 || v15[4] == a5 && !memcmp(a4, (const void *)v15[3], a5)))
      {
        *unint64_t v16 = *v15;
        _PairingFreeResumeState(v15);
        CFIndex v15 = (uint64_t *)*v16;
        if (!*v16) {
          goto LABEL_12;
        }
      }
      uint64_t v14 = *v15;
    }
    while (*v15);
LABEL_12:
    uint64_t v17 = gPairingResumeStateList;
    if (gPairingResumeStateList)
    {
      unsigned int v18 = 0;
      CFDictionaryRef v19 = &gPairingResumeStateList;
      do
      {
        CFMutableDictionaryRef v20 = v19;
        ++v18;
        CFDictionaryRef v19 = (uint64_t *)v17;
        while (1)
        {
          uint64_t v17 = *v19;
          if (v18 <= gPairingMaxResumeSessions) {
            break;
          }
          uint64_t *v20 = v17;
          _PairingFreeResumeState(v19);
          CFDictionaryRef v19 = (uint64_t *)*v20;
          ++v18;
          if (!*v20) {
            goto LABEL_19;
          }
        }
      }
      while (v17);
    }
  }
LABEL_19:
  uint64_t v21 = malloc_type_calloc(1uLL, 0x58uLL, 0x10300402A0090E4uLL);
  if (v21)
  {
    if (a3)
    {
      CFTypeID v22 = malloc_type_malloc(a3, 0xB03E7DDuLL);
      v21[1] = v22;
      if (v22)
      {
        memcpy(v22, a2, a3);
        v21[2] = a3;
        size_t v23 = a5 <= 1 ? 1 : a5;
        CFDataRef v24 = malloc_type_malloc(v23, 0xBA9EAA6FuLL);
        v21[3] = v24;
        if (v24)
        {
          if (a5) {
            memcpy(v24, a4, a5);
          }
          v21[4] = a5;
          long long v25 = a7[1];
          *((_OWORD *)v21 + 3) = *a7;
          *((_OWORD *)v21 + 4) = v25;
          v21[10] = a6;
          v21[5] = *(void *)(a1 + 368) + mach_absolute_time();
          uint64_t v26 = &gPairingResumeStateList;
          do
          {
            uint64_t v27 = v26;
            uint64_t v26 = (uint64_t *)*v26;
          }
          while (v26);
          void *v21 = 0;
          *uint64_t v27 = (uint64_t)v21;
          uint64_t v21 = 0;
        }
      }
    }
  }
  pthread_mutex_unlock(&gPairingGlobalLock);
  _PairingFreeResumeState(v21);
}

void _PairingFreeResumeState(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[1];
    if (v2)
    {
      free(v2);
      a1[1] = 0;
    }
    a1[2] = 0;
    id v3 = (void *)a1[3];
    if (v3) {
      free(v3);
    }
    free(a1);
  }
}

uint64_t _PairingSessionAppleIDProveSelf(uint64_t a1, uint64_t a2)
{
  id v4 = (CUAppleIDClient *)*(id *)(a1 + 840);
  if (!v4)
  {
    uint64_t v5 = objc_alloc_init(CUAppleIDClient);
    id v4 = v5;
    *(void *)(a1 + 840) = v5;
    if (*(void *)(a1 + 816)) {
      -[CUAppleIDClient setMyAppleID:](v5, "setMyAppleID:");
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v6 appendBytes:a1 + 446 length:32];
  [v6 appendBytes:a1 + 574 length:32];
  id v54 = 0;
  uint64_t v7 = [(CUAppleIDClient *)v4 signData:v6 error:&v54];
  id v8 = v54;
  id v9 = v8;
  if (!v7)
  {
    unsigned int v20 = NSErrorToOSStatusEx(v8, 0);
    if (v20) {
      uint64_t v12 = v20;
    }
    else {
      uint64_t v12 = 4294960580;
    }
    long long v25 = *(int **)(a1 + 16);
    if (*v25 > 60) {
      goto LABEL_7;
    }
    if (*v25 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v25, 0x3Cu)) {
        goto LABEL_7;
      }
      long long v25 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v25, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### AppleID sign data failed: %{error}\n", v21, v22, v23, v24, (uint64_t)v9);
    goto LABEL_7;
  }
  id v10 = v7;
  uint64_t v11 = TLV8BufferAppend(a2, 10, (char *)[v10 bytes], objc_msgSend(v10, "length"));
  if (v11)
  {
    uint64_t v12 = v11;
    goto LABEL_7;
  }
  id v53 = v9;
  id v14 = [(CUAppleIDClient *)v4 copyMyCertificateDataAndReturnError:&v53];
  id v15 = v53;

  if (!v14)
  {
    unsigned int v26 = NSErrorToOSStatusEx(v15, 0);
    if (v26) {
      uint64_t v12 = v26;
    }
    else {
      uint64_t v12 = 4294960596;
    }
    CFDataRef v31 = *(int **)(a1 + 16);
    if (*v31 > 60) {
      goto LABEL_50;
    }
    if (*v31 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v31, 0x3Cu)) {
        goto LABEL_50;
      }
      CFDataRef v31 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v31, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### AppleID get my certificate failed: %{error}\n", v27, v28, v29, v30, (uint64_t)v15);
LABEL_50:
    id v13 = 0;
    id v9 = v15;
    goto LABEL_15;
  }
  id v52 = v15;
  NSDataCompress(v14, 3, &v52);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v52;

  if (!v13)
  {
    unsigned int v32 = NSErrorToOSStatusEx(v9, 0);
    if (v32) {
      uint64_t v12 = v32;
    }
    else {
      uint64_t v12 = 4294960596;
    }
    CFDataRef v37 = *(int **)(a1 + 16);
    if (*v37 > 60) {
      goto LABEL_15;
    }
    if (*v37 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x3Cu)) {
        goto LABEL_7;
      }
      CFDataRef v37 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v37, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### Compress AppleID my certificate failed: %{error}\n", v33, v34, v35, v36, (uint64_t)v9);
LABEL_7:
    id v13 = 0;
    goto LABEL_15;
  }
  id v13 = v13;
  uint64_t v16 = TLV8BufferAppend(a2, 9, (char *)[v13 bytes], objc_msgSend(v13, "length"));
  if (v16)
  {
LABEL_14:
    uint64_t v12 = v16;
    goto LABEL_15;
  }
  id v51 = v9;
  id v17 = [(CUAppleIDClient *)v4 copyMyValidationDataAndReturnError:&v51];
  id v18 = v51;

  if (!v17)
  {
    id v9 = v18;
    unsigned int v38 = NSErrorToOSStatusEx(v18, 0);
    if (v38) {
      uint64_t v12 = v38;
    }
    else {
      uint64_t v12 = 4294960596;
    }
    int v43 = *(int **)(a1 + 16);
    if (*v43 > 60) {
      goto LABEL_7;
    }
    if (*v43 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v43, 0x3Cu)) {
        goto LABEL_7;
      }
      int v43 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v43, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### AppleID get my validatidation data failed: %{error}\n", v39, v40, v41, v42, (uint64_t)v18);
    goto LABEL_7;
  }
  id v50 = v18;
  NSDataCompress(v17, 3, &v50);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v50;

  if (v13)
  {
    id v13 = v13;
    uint64_t v16 = TLV8BufferAppend(a2, 20, (char *)[v13 bytes], objc_msgSend(v13, "length"));
    goto LABEL_14;
  }
  unsigned int v44 = NSErrorToOSStatusEx(v9, 0);
  if (v44) {
    uint64_t v12 = v44;
  }
  else {
    uint64_t v12 = 4294960596;
  }
  unsigned int v49 = *(int **)(a1 + 16);
  if (*v49 <= 60)
  {
    if (*v49 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v49, 0x3Cu)) {
        goto LABEL_7;
      }
      unsigned int v49 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v49, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### Compress AppleID my validatidation data failed: %{error}\n", v45, v46, v47, v48, (uint64_t)v9);
    goto LABEL_7;
  }
LABEL_15:

  return v12;
}

uint64_t PairingSessionCopyIdentity(uint64_t a1, uint64_t a2, char **a3, _OWORD *a4, uint64_t a5)
{
  uint64_t v6 = (uint64_t)a4;
  uint64_t v7 = a3;
  int v8 = a2;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v10 = *(uint64_t (**)(uint64_t, char **, _OWORD *, uint64_t, uint64_t))(a1 + 56);
  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 24);
    return v10(a2, a3, a4, a5, v11);
  }
  unint64_t v13 = *(unsigned int *)(a1 + 100);
  if ((v13 & 4) != 0)
  {
    uint64_t v67 = a2 != 0;
    if (a5) {
      v67 |= 2uLL;
    }
    uint64_t v68 = v67 | (v13 >> 19) & 8;
    unint64_t v69 = v13 >> 21;
    uint64_t v70 = v68 | (v13 >> 21) & 0x10;
    if ((v13 & 0x80000000) == 0) {
      uint64_t v71 = v70;
    }
    else {
      uint64_t v71 = v70 | 0x100;
    }
    return _PairingSessionCopyIdentityPairingManager(a1, v71 | v69 & 0x20, a3, 0, a4, (_OWORD *)a5);
  }
  pthread_mutex_lock(&gPairingGlobalLock);
  uint64_t v79 = *MEMORY[0x1E4F3B978];
  BOOL v73 = (v6 | a5) != 0;
  int v78 = (const void *)*MEMORY[0x1E4F3B5C0];
  int v20 = 1;
  CFTypeID v77 = (const void *)*MEMORY[0x1E4F3BD38];
  unsigned int v75 = (_OWORD *)v6;
  uint64_t v76 = v7;
  int v74 = v8;
  do
  {
    if (v20 != 1) {
      usleep(0x4E20u);
    }
    LODWORD(v82[0]) = 0;
    *(void *)__str = 0;
    *(void *)&v83[0] = 0;
    CFDictionaryRef v27 = (const __CFDictionary *)KeychainCopyMatchingFormatted(v82, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v14, v15, v16, v17, v18, v19, v79);
    if (!v27)
    {
      if (*(_DWORD *)(a1 + 768) == 1751216195) {
        CFDictionaryRef v27 = (const __CFDictionary *)KeychainCopyMatchingFormatted(v82, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v21, v22, v23, v24, v25, v26, v79);
      }
      else {
        CFDictionaryRef v27 = 0;
      }
    }
    if (!LODWORD(v82[0]))
    {
      if (v7)
      {
        uint64_t v28 = CFDictionaryCopyCString(v27, v78, v82);
        if (LODWORD(v82[0])) {
          goto LABEL_19;
        }
        *uint64_t v7 = v28;
      }
      if (v73)
      {
        *(void *)__str = 0;
        CFDictionaryGetData(v27, v77, __s, 0x84uLL, __str, (int *)v82);
        *(void *)&v83[0] = __s;
        int64_t v29 = *(void *)__str;
        LODWORD(v82[0]) = HexToData(__s, *(int64_t *)__str, 22, v6, 0x20uLL, (unint64_t *)__str, 0, (char **)v83);
        if (!LODWORD(v82[0]))
        {
          if (*(void *)__str != 32) {
            goto LABEL_54;
          }
          if (!a5) {
            goto LABEL_19;
          }
          uint64_t v65 = *(void *)&v83[0];
          if (*(void *)&v83[0] >= (unint64_t)&__s[v29] || **(unsigned char **)&v83[0] != 43)
          {
            int v66 = -6742;
            goto LABEL_61;
          }
          ++*(void *)&v83[0];
          LODWORD(v82[0]) = HexToData(*(char **)&v83[0], (int64_t)&__s[v29 - 1 - v65], 22, a5, 0x20uLL, (unint64_t *)__str, 0, 0);
          if (!LODWORD(v82[0]) && *(void *)__str != 32)
          {
LABEL_54:
            int v66 = -6743;
LABEL_61:
            LODWORD(v82[0]) = v66;
          }
        }
      }
    }
LABEL_19:
    if (v27) {
      CFRelease(v27);
    }
    memset_s(__s, 0x84uLL, 0, 0x84uLL);
    uint64_t v33 = LODWORD(v82[0]);
    if (LODWORD(v82[0]) == -25293) {
      break;
    }
    if (!LODWORD(v82[0]) || !v8) {
      goto LABEL_74;
    }
    _PairingSessionDeleteIdentity(a1, v30, v31, v32, v16, v17, v18, v19);
    uint64_t v34 = *(char **)(a1 + 248);
    if (!v34 || (size_t v35 = *(void *)(a1 + 256)) == 0)
    {
      RandomBytes(bytes, 0x10uLL);
      int v36 = v86 & 0xF | 0x40;
      char v86 = v86 & 0xF | 0x40;
      int v37 = v88 & 0x3F | 0x80;
      char v88 = v88 & 0x3F | 0x80;
      uint64_t v34 = __str;
      snprintf(__str, 0x25uLL, "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], v36, v87, v37, v89, v90, v91, v92, v93, v94, v95);
      size_t v35 = strlen(__str);
    }
    cced25519_make_key_pair_compat((uint64_t)v83, (uint64_t)v82);
    SNPrintF((uint64_t)__s, 132, (uint64_t)"%.3H+%.3H", v38, v39, v40, v41, v42, (uint64_t)v83);
    unint64_t v80 = 0;
    ASPrintF(&v80, (uint64_t)"%@: %.*s", v43, v44, v45, v46, v47, v48, *(void *)(a1 + 760));
    unsigned int v49 = v80;
    if (v80)
    {
      strlen(__s);
      uint64_t v33 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%i%kO=%s%kO=%O%kO=%.*s%kO=%O%kO=%D%kO=%O}", v50, v51, v52, v53, v54, v55, v79);
      free(v49);
      if (v33)
      {
        uint64_t v6 = (uint64_t)v75;
        uint64_t v7 = v76;
        int v8 = v74;
      }
      else
      {
        uint64_t v6 = (uint64_t)v75;
        uint64_t v7 = v76;
        int v8 = v74;
        if (!v76) {
          goto LABEL_32;
        }
        long long v60 = strndup(v34, v35);
        if (v60)
        {
          *uint64_t v76 = v60;
LABEL_32:
          if (v75)
          {
            long long v61 = v83[1];
            *unsigned int v75 = v83[0];
            v75[1] = v61;
          }
          if (a5)
          {
            long long v62 = v82[1];
            *(_OWORD *)a5 = v82[0];
            *(_OWORD *)(a5 + 16) = v62;
          }
          long long v63 = *(int **)(a1 + 16);
          if (*v63 <= 50)
          {
            if (*v63 != -1) {
              goto LABEL_38;
            }
            if (_LogCategory_Initialize((uint64_t)v63, 0x32u))
            {
              long long v63 = *(int **)(a1 + 16);
LABEL_38:
              LogPrintF((uint64_t)v63, (uint64_t)"OSStatus _PairingSessionCreateIdentityKeychain(PairingSessionRef, char **, uint8_t *, uint8_t *)", 0x32u, (uint64_t)"Created %@: %.*s\n", v56, v57, v58, v59, *(void *)(a1 + 760));
            }
          }
          uint64_t v33 = 0;
          goto LABEL_41;
        }
        uint64_t v33 = 4294960568;
      }
    }
    else
    {
      uint64_t v33 = 4294960568;
    }
LABEL_41:
    memset_s(v82, 0x20uLL, 0, 0x20uLL);
    memset_s(__s, 0x84uLL, 0, 0x84uLL);
    if (!v33) {
      goto LABEL_74;
    }
    uint64_t v64 = *(int **)(a1 + 16);
    if (*v64 > 40) {
      goto LABEL_46;
    }
    if (*v64 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v64, 0x28u)) {
        goto LABEL_46;
      }
      uint64_t v64 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v64, (uint64_t)"OSStatus _PairingSessionGetOrCreateIdentityKeychain(PairingSessionRef, Boolean, char **, uint8_t *, uint8_t *)", 0x28u, (uint64_t)"### Create %@ failed (try %d of %d): %#m\n", v16, v17, v18, v19, *(void *)(a1 + 760));
LABEL_46:
    ++v20;
  }
  while (v20 != 11);
  uint64_t v72 = *(int **)(a1 + 16);
  if (*v72 <= 60)
  {
    if (*v72 != -1) {
      goto LABEL_72;
    }
    if (_LogCategory_Initialize((uint64_t)v72, 0x3Cu))
    {
      uint64_t v72 = *(int **)(a1 + 16);
LABEL_72:
      LogPrintF((uint64_t)v72, (uint64_t)"OSStatus _PairingSessionGetOrCreateIdentityKeychain(PairingSessionRef, Boolean, char **, uint8_t *, uint8_t *)", 0x3Cu, (uint64_t)"### Failed to create %@ after %d tries: %#m\n", v16, v17, v18, v19, *(void *)(a1 + 760));
    }
  }
LABEL_74:
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v33;
}

uint64_t _PairingSessionAppleIDVerifyPeer(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned int v45 = 0;
  size_t v44 = 0;
  id v6 = TLV8CopyCoalesced(a2, a3, 9, &v44, (int *)&v45);
  if (!v6 || !v44)
  {
    id v11 = 0;
    uint64_t v14 = 0;
    uint64_t v17 = 0;
    uint64_t v39 = 0;
LABEL_33:
    id v9 = 0;
    unsigned int v45 = -6711;
    goto LABEL_39;
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:v44];
  id v9 = v7;
  if (!v7)
  {
    uint64_t v39 = 0;
    uint64_t v17 = 0;
    uint64_t v14 = 0;
    id v11 = 0;
LABEL_35:
    unsigned int v45 = -6728;
LABEL_52:
    free(v6);
    id v6 = 0;
LABEL_53:
    uint64_t v19 = 0;
    goto LABEL_27;
  }
  id v43 = 0;
  uint64_t v10 = NSDataDecompress(v7, v8, &v43);
  id v11 = v43;

  uint64_t v39 = (void *)v10;
  if (!v10)
  {
    if (v11) {
      unsigned int v30 = NSErrorToOSStatusEx(v11, 0);
    }
    else {
      unsigned int v30 = -6700;
    }
    id v9 = 0;
    uint64_t v39 = 0;
    uint64_t v17 = 0;
    uint64_t v14 = 0;
    unsigned int v45 = v30;
    goto LABEL_52;
  }
  id v6 = TLV8CopyCoalesced(a2, a3, 20, &v44, (int *)&v45);
  if (!v6 || !v44)
  {
    uint64_t v14 = 0;
    uint64_t v17 = 0;
    goto LABEL_33;
  }
  uint64_t v12 = (CUAppleIDClient *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:v44];
  uint64_t v14 = v12;
  if (!v12)
  {
    id v9 = 0;
    uint64_t v17 = 0;
    goto LABEL_35;
  }
  id v42 = v11;
  id v9 = NSDataDecompress(v12, v13, &v42);
  id v15 = v42;

  if (!v9)
  {
    if (v15) {
      unsigned int v31 = NSErrorToOSStatusEx(v15, 0);
    }
    else {
      unsigned int v31 = -6700;
    }
    id v9 = 0;
    uint64_t v17 = 0;
    uint64_t v14 = 0;
    unsigned int v45 = v31;
    goto LABEL_51;
  }
  uint64_t v14 = (CUAppleIDClient *)*(id *)(a1 + 840);
  if (!v14)
  {
    uint64_t v16 = objc_alloc_init(CUAppleIDClient);
    uint64_t v14 = v16;
    *(void *)(a1 + 840) = v16;
    if (*(void *)(a1 + 816)) {
      -[CUAppleIDClient setMyAppleID:](v16, "setMyAppleID:");
    }
  }
  uint64_t v17 = (CUAppleIDClient *)*(id *)(a1 + 848);
  if (!v17)
  {
    uint64_t v17 = objc_alloc_init(CUAppleIDClient);
    *(void *)(a1 + 848) = v17;
  }
  [(CUAppleIDClient *)v17 setMyInfoClient:v14];
  if (*(void *)(a1 + 824)) {
    -[CUAppleIDClient setPeerAppleID:](v17, "setPeerAppleID:");
  }
  if (*(void *)(a1 + 832)) {
    -[CUAppleIDClient setPeerAppleIDs:](v17, "setPeerAppleIDs:");
  }
  [(CUAppleIDClient *)v17 setPeerCertificateData:v10];
  [(CUAppleIDClient *)v17 setPeerValidationData:v9];
  id v6 = TLV8CopyCoalesced(a2, a3, 10, &v44, (int *)&v45);
  if (!v6 || !v44)
  {
    unsigned int v45 = -6711;
    id v11 = v15;
LABEL_39:
    if (!v6) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:v44];
  if (!v18)
  {
    unsigned int v45 = -6743;
LABEL_51:
    id v11 = v15;
    goto LABEL_52;
  }
  uint64_t v19 = (void *)v18;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v6 appendBytes:a1 + 574 length:32];
  [v6 appendBytes:a1 + 446 length:32];
  id v41 = v15;
  BOOL v20 = [(CUAppleIDClient *)v17 verifyData:v6 signature:v19 error:&v41];
  id v11 = v41;

  if (v20)
  {
    if (*(void *)(a1 + 824)) {
      BOOL v25 = 0;
    }
    else {
      BOOL v25 = *(void *)(a1 + 832) == 0;
    }
    id v40 = v11;
    BOOL v26 = [(CUAppleIDClient *)v17 validatePeerWithFlags:v25 error:&v40];
    id v27 = v40;

    if (v26) {
      goto LABEL_26;
    }
    unsigned int v37 = [v27 code] ? objc_msgSend(v27, "code") : -6754;
    unsigned int v45 = v37;
    uint64_t v38 = *(int **)(a1 + 16);
    if (*v38 > 60) {
      goto LABEL_26;
    }
    if (*v38 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v38, 0x3Cu)) {
        goto LABEL_26;
      }
      uint64_t v38 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v38, (uint64_t)"OSStatus _PairingSessionAppleIDVerifyPeer(PairingSessionRef, const uint8_t *, const uint8_t *)", 0x3Cu, (uint64_t)"### AppleID validate peer failed: %{error}\n", v33, v34, v35, v36, (uint64_t)v27);
LABEL_26:
    id v11 = v27;
    goto LABEL_27;
  }
  unsigned int v45 = -6754;
  uint64_t v32 = *(int **)(a1 + 16);
  if (*v32 <= 60)
  {
    if (*v32 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v32, 0x3Cu)) {
        goto LABEL_27;
      }
      uint64_t v32 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v32, (uint64_t)"OSStatus _PairingSessionAppleIDVerifyPeer(PairingSessionRef, const uint8_t *, const uint8_t *)", 0x3Cu, (uint64_t)"### AppleID verify peer signature failed: %{error}\n", v21, v22, v23, v24, (uint64_t)v11);
  }
LABEL_27:
  uint64_t v28 = v45;

  return v28;
}

uint64_t PairingSessionFindPeerEx(uint64_t a1, char *__s, size_t a3, _OWORD *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = a3;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *(unsigned int (**)(char *, size_t, _OWORD *, void))(a1 + 64);
  if (v12)
  {
    if (v12(__s, a3, a4, *(void *)(a1 + 24))) {
      return 4294960569;
    }
    else {
      return 0;
    }
  }
  if ((*(unsigned char *)(a1 + 100) & 4) != 0)
  {
    uint64_t v93 = 0;
    unsigned __int8 v94 = &v93;
    uint64_t v95 = 0x2020000000;
    int v96 = 1;
    uint64_t v87 = 0;
    char v88 = &v87;
    uint64_t v89 = 0x3032000000;
    unsigned __int8 v90 = __Block_byref_object_copy__12418;
    unsigned __int8 v91 = __Block_byref_object_dispose__12419;
    id v92 = 0;
    int v34 = StringToUUIDEx(__s, a3, 0, 0, &v97, a6, a7, a8);
    *((_DWORD *)v94 + 6) = v34;
    if (v34)
    {
      long long v97 = 0uLL;
      int v35 = TextToHardwareAddress(__s, v9, 6, (unsigned char *)&v97 + 10);
      *((_DWORD *)v94 + 6) = v35;
      if (v35)
      {
        uint64_t v38 = 0;
        unsigned int v37 = 0;
        uint64_t v39 = 0;
        long long v61 = 0;
        goto LABEL_79;
      }
      id v36 = [NSString alloc];
      if (v9 == -1) {
        size_t v9 = strlen(__s);
      }
      unsigned int v37 = (void *)[v36 initWithBytes:__s length:v9 encoding:4];
    }
    else
    {
      unsigned int v37 = 0;
    }
    uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v97];
    if (v38)
    {
      uint64_t v39 = objc_alloc_init(CUPairedPeer);
      [(CUPairedPeer *)v39 setIdentifier:v38];
      if (v37) {
        [(CUPairedPeer *)v39 setIdentifierStr:v37];
      }
      unsigned int v40 = *(_DWORD *)(a1 + 100);
      if ((v40 & 0x80000000) == 0) {
        uint64_t v41 = (v40 >> 21) & 0x10 | (v40 >> 19) & 8;
      }
      else {
        uint64_t v41 = (v40 >> 21) & 0x10 | (v40 >> 19) & 8 | 0x100;
      }
      id v42 = _Block_copy(*(const void **)(a1 + 968));
      id v43 = v42;
      uint64_t v44 = v41 | (v40 >> 1) & 4 | (v40 >> 21) & 0x20;
      if (v42)
      {
        v83[0] = 0;
        uint64_t v45 = (*((void (**)(void *, CUPairedPeer *, uint64_t, id *))v42 + 2))(v42, v39, v44, v83);
        id v46 = v83[0];
        uint64_t v47 = (void *)v88[5];
        v88[5] = v45;

        if (!v46)
        {
          if (v88[5]) {
            int v67 = 0;
          }
          else {
            int v67 = -6700;
          }
          goto LABEL_62;
        }
        uint64_t v55 = *(int **)(a1 + 16);
        if (*v55 <= 90)
        {
          if (*v55 != -1)
          {
LABEL_32:
            long long v82 = NSPrintF((uint64_t)"%{error}", v48, v49, v50, v51, v52, v53, v54, (uint64_t)v46);
            LogPrintF((uint64_t)v55, (uint64_t)"OSStatus _PairingSessionFindPeerPairingManager(PairingSessionRef, const void *, size_t, uint8_t *, CFDictionaryRef *)", 0x5Au, (uint64_t)"### FindPeerHandler failed: %@, %@", v56, v57, v58, v59, (uint64_t)v39);

            goto LABEL_59;
          }
          if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x5Au))
          {
            uint64_t v55 = *(int **)(a1 + 16);
            goto LABEL_32;
          }
        }
LABEL_59:
        if (v88[5]) {
          int v67 = 0;
        }
        else {
          int v67 = NSErrorToOSStatusEx(v46, 0);
        }
LABEL_62:
        *((_DWORD *)v94 + 6) = v67;

        long long v61 = 0;
        goto LABEL_63;
      }
      long long v60 = +[CUPairingDaemon sharedPairingDaemon];
      long long v61 = v60;
      if (v60)
      {
        uint64_t v62 = [v60 findPairedPeer:v39 options:v44 error:v94 + 3];
        long long v63 = (void *)v88[5];
        v88[5] = v62;

        uint64_t v64 = v94;
        if (!*((_DWORD *)v94 + 6))
        {
          if (v88[5])
          {
LABEL_63:
            uint64_t v65 = 0;
            int v66 = 0;
            goto LABEL_64;
          }
          uint64_t v65 = 0;
          int v66 = 0;
          goto LABEL_89;
        }
LABEL_79:
        uint64_t v65 = 0;
        int v66 = 0;
        goto LABEL_73;
      }
      uint64_t v65 = objc_alloc_init(CUPairingManager);
      dispatch_queue_t v68 = dispatch_queue_create("OSStatus _PairingSessionFindPeerPairingManager(PairingSessionRef, const void *, size_t, uint8_t *, CFDictionaryRef *)", 0);
      [(CUPairingManager *)v65 setDispatchQueue:v68];

      if ((*(unsigned char *)(a1 + 100) & 0x40) != 0) {
        [(CUPairingManager *)v65 setTargetUserSession:1];
      }
      dispatch_semaphore_t v69 = dispatch_semaphore_create(0);
      v83[0] = (id)MEMORY[0x1E4F143A8];
      v83[1] = (id)3221225472;
      _OWORD v83[2] = ___PairingSessionFindPeerPairingManager_block_invoke;
      v83[3] = &unk_1E55BF8C8;
      unint64_t v85 = &v87;
      char v86 = &v93;
      int v66 = v69;
      long long v84 = v66;
      [(CUPairingManager *)v65 findPairedPeer:v39 options:v44 completion:v83];

      dispatch_time_t v70 = dispatch_time(0, 120000000000);
      intptr_t v71 = dispatch_semaphore_wait(v66, v70);
      [(CUPairingManager *)v65 invalidate];
      uint64_t v64 = v94;
      if (!v71)
      {
        if (*((_DWORD *)v94 + 6))
        {
          long long v61 = 0;
          goto LABEL_73;
        }
        if (v88[5])
        {
          long long v61 = 0;
LABEL_64:
          if (!a4)
          {
LABEL_68:
            if (a5)
            {
              *a5 = [(id)v88[5] acl];
            }
            CFTypeID v77 = *(const void **)(a1 + 264);
            if (v77) {
              CFRelease(v77);
            }
            *(void *)(a1 + 264) = (id)v88[5];
            goto LABEL_73;
          }
          uint64_t v72 = [(id)v88[5] publicKey];
          BOOL v73 = v72;
          if (v72)
          {
            if ([v72 length] == 32)
            {
              id v74 = v73;
              unsigned int v75 = (_OWORD *)[v74 bytes];
              long long v76 = v75[1];
              *a4 = *v75;
              a4[1] = v76;

              goto LABEL_68;
            }
            int v81 = -6743;
          }
          else
          {
            int v81 = -6727;
          }
          *((_DWORD *)v94 + 6) = v81;

LABEL_73:
          uint64_t v13 = *((unsigned int *)v94 + 6);
          _Block_object_dispose(&v87, 8);

          _Block_object_dispose(&v93, 8);
          return v13;
        }
        long long v61 = 0;
LABEL_89:
        int v80 = -6762;
        goto LABEL_90;
      }
      long long v61 = 0;
      int v80 = -6722;
    }
    else
    {
      uint64_t v39 = 0;
      long long v61 = 0;
      uint64_t v65 = 0;
      int v66 = 0;
      uint64_t v64 = v94;
      int v80 = -6708;
    }
LABEL_90:
    *((_DWORD *)v64 + 6) = v80;
    goto LABEL_73;
  }
  pthread_mutex_lock(&gPairingGlobalLock);
  if (v9 == -1) {
    strlen(__s);
  }
  LODWORD(v87) = 0;
  v83[0] = 0;
  CFDictionaryRef v21 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v87, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%.*s%kO=%O%kO=%O}", v15, v16, v17, v18, v19, v20, *MEMORY[0x1E4F3B978]);
  if (v87)
  {
LABEL_54:
    if (!v21) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  CFDataRef TypedValue = CFDictionaryGetTypedValue(v21, (const void *)*MEMORY[0x1E4F3BD38], TypeID, 0);
  CFDataRef v24 = TypedValue;
  if (TypedValue)
  {
    v83[0] = 0;
    BytePtr = (char *)CFDataGetBytePtr(TypedValue);
    CFIndex Length = CFDataGetLength(v24);
    LODWORD(v87) = HexToData(BytePtr, Length, 22, (uint64_t)a4, 0x20uLL, (unint64_t *)v83, 0, 0);
    if (v87) {
      goto LABEL_54;
    }
    if (v83[0] == (id)32)
    {
      CFTypeID v27 = CFDataGetTypeID();
      CFDataRef v28 = CFDictionaryGetTypedValue(v21, (const void *)*MEMORY[0x1E4F3B688], v27, 0);
      if (v28)
      {
        int64_t v29 = OPACKDecodeData(v28, 0, 0);
        CFDictionaryRef v30 = (const __CFDictionary *)v29;
        if (v29)
        {
          CFTypeID v31 = CFGetTypeID(v29);
          if (v31 == CFDictionaryGetTypeID())
          {
            CFTypeID v32 = CFDictionaryGetTypeID();
            CFDictionaryRef v33 = CFDictionaryGetTypedValue(v30, @"acl", v32, 0);
LABEL_48:
            if (a5)
            {
              if (v33) {
                CFRetain(v33);
              }
              *a5 = v33;
            }
            if (v30) {
              CFRelease(v30);
            }
            goto LABEL_54;
          }
        }
      }
      else
      {
        CFDictionaryRef v30 = 0;
      }
      CFDictionaryRef v33 = 0;
      goto LABEL_48;
    }
    int v79 = -6743;
  }
  else
  {
    int v79 = -6737;
  }
  LODWORD(v87) = v79;
  if (v21) {
LABEL_55:
  }
    CFRelease(v21);
LABEL_56:
  pthread_mutex_unlock(&gPairingGlobalLock);
  if (v87) {
    return 4294960569;
  }
  else {
    return 0;
  }
}

void sub_18E3ED950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

CFDictionaryRef _PairingSessionVerifyACL(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 176);
  if (result)
  {
    if (CFDictionaryGetCount(result) < 1)
    {
      return 0;
    }
    else if (a2)
    {
      uint64_t v6 = 0;
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 176), (CFDictionaryApplierFunction)_PairingSessionVerifyACLApplier, &v5);
      return (const __CFDictionary *)v6;
    }
    else
    {
      return (const __CFDictionary *)4294960523;
    }
  }
  return result;
}

uint64_t _ExtractGroupInfoTLV(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned int v10 = 0;
  size_t v9 = 0;
  id v4 = (UInt8 *)TLV8CopyCoalesced(a2, a3, 30, &v9, 0);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = _OPACKDecodeBytes(0, v4, v9, 0, &v10);
  free(v5);
  if (v6)
  {
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 != CFDictionaryGetTypeID())
    {
      unsigned int v10 = -6756;
      CFRelease(v6);
      return v10;
    }
    PairingSessionSetProperty(a1, @"groupInfoPeer", v6);
    CFRelease(v6);
    return 0;
  }
  return v10;
}

uint64_t _VerifyServerM4(uint64_t a1, void *a2, size_t *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  memset(v36, 0, sizeof(v36));
  memset(v32, 0, sizeof(v32));
  __src = v36;
  long long v34 = xmmword_18E416F70;
  int v35 = 0;
  int64_t v29 = (int8x16_t *)v32;
  long long v30 = xmmword_18E416F70;
  uint64_t v6 = (unsigned char *)(a1 + 120);
  uint64_t v31 = 0;
  uint64_t v7 = TLV8BufferAppend((uint64_t)&__src, 6, (char *)(a1 + 120), 1uLL);
  if (!v7)
  {
    if ((*(_DWORD *)(a1 + 100) & 0x20000000) != 0) {
      uint64_t v8 = "PV-Msg4s";
    }
    else {
      uint64_t v8 = "PV-Msg04";
    }
    uint64_t v9 = _AddGroupInfoTLV(a1, (uint64_t)&v29);
    if (v9
      || (*(unsigned char *)(a1 + 103) & 0x20) != 0 && (uint64_t v9 = _PairingSessionAppleIDProveSelf(a1, (uint64_t)&v29), v9))
    {
      uint64_t v7 = v9;
      goto LABEL_36;
    }
    if ((void)v30)
    {
      uint64_t v14 = (int8x16_t *)malloc_type_malloc(v30 + 16, 0x61129CCAuLL);
      if (!v14)
      {
LABEL_42:
        uint64_t v7 = 4294960568;
        goto LABEL_36;
      }
      uint64_t v15 = v14;
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, "Pair-Verify-Encrypt-Salt", 0x18uLL, (uint64_t)"Pair-Verify-Encrypt-Info", 24, 0x20uLL, a1 + 414);
      _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), v8, 8, 0, 0, v29, v30, v15, (uint64_t)v15->i64 + v30);
      uint64_t v7 = TLV8BufferAppend((uint64_t)&__src, 5, v15->i8, v30 + 16);
      free(v15);
      if (v7) {
        goto LABEL_36;
      }
    }
    size_t v16 = v34;
    uint64_t v17 = v35;
    if (v35) {
      goto LABEL_18;
    }
    if ((unint64_t)v34 <= 1) {
      size_t v18 = 1;
    }
    else {
      size_t v18 = v34;
    }
    uint64_t v19 = malloc_type_malloc(v18, 0xF62D7A9CuLL);
    if (v19)
    {
      uint64_t v17 = v19;
      if (v16) {
        memcpy(v19, __src, v16);
      }
LABEL_18:
      __src = v36;
      *(void *)&long long v34 = 0;
      int v35 = 0;
      *a2 = v17;
      *a3 = v16;
      if ((*(unsigned char *)(a1 + 100) & 2) != 0)
      {
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a1 + 638, 32, "Pair-Verify-ResumeSessionID-Salt", 0x20uLL, (uint64_t)"Pair-Verify-ResumeSessionID-Info", 32, 8uLL, (uint64_t)&v28);
        uint64_t v20 = v28;
        *(void *)(a1 + 376) = v28;
        _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(void *)(a1 + 304), *(const void **)(a1 + 248), *(void *)(a1 + 256), v20, (_OWORD *)(a1 + 638));
      }
      CFDictionaryRef v21 = *(int **)(a1 + 16);
      int v22 = *v21;
      if (*v21 >= 31)
      {
        uint64_t v7 = 0;
        unsigned char *v6 = 5;
        goto LABEL_36;
      }
      if (v22 == -1)
      {
        BOOL v24 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x1Eu);
        CFDictionaryRef v21 = *(int **)(a1 + 16);
        if (!v24) {
          goto LABEL_31;
        }
        int v22 = *v21;
      }
      if (v22 > 10) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v22 == -1 && !_LogCategory_Initialize((uint64_t)v21, 0xAu);
      }
      LogPrintF((uint64_t)v21, (uint64_t)"OSStatus _VerifyServerM4(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server M4 -- finish response\n%?{end}%1{tlv8}\n", v10, v11, v12, v13, v23);
      CFDictionaryRef v21 = *(int **)(a1 + 16);
LABEL_31:
      int v25 = *v21;
      unsigned char *v6 = 5;
      if (v25 <= 30)
      {
        if (v25 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v21, 0x1Eu)) {
            goto LABEL_35;
          }
          CFDictionaryRef v21 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v21, (uint64_t)"OSStatus _VerifyServerM4(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server done\n", v10, v11, v12, v13, v27);
      }
LABEL_35:
      uint64_t v7 = 0;
      goto LABEL_36;
    }
    goto LABEL_42;
  }
LABEL_36:
  if (v31)
  {
    free(v31);
    uint64_t v31 = 0;
  }
  if (v35) {
    free(v35);
  }
  return v7;
}

void _PairingSessionUpdateTranscript(uint64_t a1, UInt8 *bytes, CFIndex length, UInt8 *a4, CFIndex a5)
{
  if (*(_DWORD *)(a1 + 680))
  {
    Mutable = *(__CFData **)(a1 + 672);
    if (Mutable || (Mutable = CFDataCreateMutable(0, 0), (*(void *)(a1 + 672) = Mutable) != 0))
    {
      if (bytes && length) {
        CFDataAppendBytes(Mutable, bytes, length);
      }
      if (a4 && a5)
      {
        uint64_t v11 = *(__CFData **)(a1 + 672);
        CFDataAppendBytes(v11, a4, a5);
      }
    }
  }
}

uint64_t _AddGroupInfoTLV(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 344);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFStringRef TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v4, @"groupInfoSelf", TypeID, 0);
  if (!TypedValue)
  {
    uint64_t v7 = *(void **)(a1 + 264);
    if (v7) {
      id v8 = v7;
    }
    CFDictionaryRef v9 = [v7 info];
    CFTypeID v10 = CFDictionaryGetTypeID();
    CFStringRef TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v9, @"groupInfo", v10, 0);

    if (!TypedValue) {
      return 0;
    }
  }
  unsigned int v16 = 0;
  CFDataRef DataMutable = OPACKEncoderCreateDataMutable(TypedValue, 0, (int *)&v16);
  if (!DataMutable) {
    return v16;
  }
  CFDataRef v12 = DataMutable;
  BytePtr = (char *)CFDataGetBytePtr(DataMutable);
  size_t Length = CFDataGetLength(v12);
  unsigned int v16 = TLV8BufferAppend(a2, 30, BytePtr, Length);
  CFRelease(v12);
  uint64_t result = v16;
  if (!v16) {
    return 0;
  }
  return result;
}

unint64_t _PairingSessionVerifyACLApplier(unint64_t result, uint64_t a2, uint64_t a3)
{
  if (!*(_DWORD *)(a3 + 8))
  {
    CFDictionaryRef v4 = (const void *)result;
    CFDictionaryRef v5 = *(const __CFDictionary **)a3;
    uint64_t result = CFDictionaryGetInt64(*(const __CFDictionary **)a3, (const void *)result, 0);
    if (!result)
    {
      uint64_t result = CFDictionaryGetInt64(v5, @"com.apple.admin", 0);
      if (!result)
      {
        uint64_t result = CFEqual(v4, @"com.apple.ScreenCapture");
        if (!result || (uint64_t result = CFDictionaryGetInt64(v5, @"com.apple.developer", 0)) == 0) {
          *(_DWORD *)(a3 + 8) = -6773;
        }
      }
    }
  }
  return result;
}

uint64_t __Block_byref_object_copy__12418(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12419(uint64_t a1)
{
}

uint64_t _PairingSessionCopyIdentityPairingManager(uint64_t a1, uint64_t a2, char **a3, void *a4, _OWORD *a5, _OWORD *a6)
{
  uint64_t v68 = 0;
  dispatch_semaphore_t v69 = &v68;
  uint64_t v70 = 0x2020000000;
  int v71 = 1;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy__12418;
  int v66 = __Block_byref_object_dispose__12419;
  id v67 = 0;
  unint64_t v11 = ((unint64_t)*(unsigned int *)(a1 + 100) >> 1) & 4 | a2;
  CFDataRef v12 = _Block_copy(*(const void **)(a1 + 960));
  if (v12)
  {
    uint64_t v13 = v12;
    id v61 = 0;
    uint64_t v14 = ((void (*)(NSObject *, unint64_t, id *))v12[2].isa)(v12, v11, &v61);
    id v15 = v61;
    unsigned int v16 = (void *)v63[5];
    v63[5] = v14;

    if (!v15)
    {
      if (v63[5]) {
        int v37 = 0;
      }
      else {
        int v37 = -6700;
      }
      goto LABEL_24;
    }
    BOOL v24 = *(int **)(a1 + 16);
    if (*v24 <= 90)
    {
      if (*v24 != -1)
      {
LABEL_5:
        int v25 = NSPrintF((uint64_t)"%{error}", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v15);
        LogPrintF((uint64_t)v24, (uint64_t)"OSStatus _PairingSessionCopyIdentityPairingManager(PairingSessionRef, CUPairingOptions, char **, CFDataRef *, uint8_t *, uint8_t *)", 0x5Au, (uint64_t)"### CopyIdentityHandler failed: %@", v26, v27, v28, v29, (uint64_t)v25);

        goto LABEL_21;
      }
      if (_LogCategory_Initialize(*(void *)(a1 + 16), 0x5Au))
      {
        BOOL v24 = *(int **)(a1 + 16);
        goto LABEL_5;
      }
    }
LABEL_21:
    if (v63[5]) {
      int v37 = 0;
    }
    else {
      int v37 = NSErrorToOSStatusEx(v15, 0);
    }
LABEL_24:
    *((_DWORD *)v69 + 6) = v37;

    int v35 = 0;
    id v36 = 0;
LABEL_25:

    uint64_t v31 = 0;
    if (!a3) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  long long v30 = +[CUPairingDaemon sharedPairingDaemon];
  uint64_t v31 = v30;
  if (!v30)
  {
    int v35 = objc_alloc_init(CUPairingManager);
    dispatch_queue_t v38 = dispatch_queue_create("OSStatus _PairingSessionCopyIdentityPairingManager(PairingSessionRef, CUPairingOptions, char **, CFDataRef *, uint8_t *, uint8_t *)", 0);
    [(CUPairingManager *)v35 setDispatchQueue:v38];

    if ((*(unsigned char *)(a1 + 100) & 0x40) != 0) {
      [(CUPairingManager *)v35 setTargetUserSession:1];
    }
    dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = ___PairingSessionCopyIdentityPairingManager_block_invoke;
    v57[3] = &unk_1E55BF8F0;
    uint64_t v59 = &v62;
    long long v60 = &v68;
    id v36 = v39;
    uint64_t v58 = v36;
    [(CUPairingManager *)v35 getPairingIdentityWithOptions:v11 completion:v57];
    dispatch_time_t v40 = dispatch_time(0, 120000000000);
    intptr_t v41 = dispatch_semaphore_wait(v36, v40);
    [(CUPairingManager *)v35 invalidate];
    if (v41)
    {
      int v56 = -6722;
    }
    else
    {
      if (*((_DWORD *)v69 + 6))
      {
LABEL_55:

        uint64_t v31 = 0;
        goto LABEL_56;
      }
      if (v63[5])
      {
        uint64_t v13 = v58;
        goto LABEL_25;
      }
      int v56 = -6762;
    }
    *((_DWORD *)v69 + 6) = v56;
    goto LABEL_55;
  }
  uint64_t v32 = [v30 copyIdentityWithOptions:v11 error:v69 + 3];
  CFDictionaryRef v33 = (void *)v63[5];
  v63[5] = v32;

  long long v34 = v69;
  if (*((_DWORD *)v69 + 6))
  {
    int v35 = 0;
    id v36 = 0;
    goto LABEL_56;
  }
  if (!v63[5])
  {
    int v35 = 0;
    id v36 = 0;
    id v47 = 0;
    int v54 = -6762;
    goto LABEL_46;
  }
  int v35 = 0;
  id v36 = 0;
  if (a3)
  {
LABEL_26:
    id v42 = [(id)v63[5] identifier];
    id v43 = [v42 UUIDString];

    if (v43)
    {
      uint64_t v44 = CFCopyCString(v43, 0);
      if (v44)
      {
        *a3 = v44;

        goto LABEL_29;
      }
      int v55 = -6728;
    }
    else
    {
      int v55 = -6727;
    }
    *((_DWORD *)v69 + 6) = v55;

LABEL_56:
    id v47 = 0;
    goto LABEL_43;
  }
LABEL_29:
  if (a4)
  {
    uint64_t v45 = [(id)v63[5] altIRK];
    if (v45) {
      id v46 = v45;
    }
    else {
      id v46 = 0;
    }
    *a4 = v46;
    if (a5) {
      goto LABEL_39;
    }
LABEL_33:
    if (!a6)
    {
LABEL_42:
      id v47 = v46;
      goto LABEL_43;
    }
    goto LABEL_34;
  }
  id v46 = 0;
  if (!a5) {
    goto LABEL_33;
  }
LABEL_39:
  id v47 = [(id)v63[5] publicKey];

  if (!v47) {
    goto LABEL_44;
  }
  if ([v47 length] != 32) {
    goto LABEL_45;
  }
  id v46 = v47;
  uint64_t v50 = (_OWORD *)[v46 bytes];
  long long v51 = v50[1];
  *a5 = *v50;
  a5[1] = v51;
  if (!a6) {
    goto LABEL_42;
  }
LABEL_34:
  id v47 = [(id)v63[5] secretKey];

  if (!v47)
  {
LABEL_44:
    long long v34 = v69;
    int v54 = -6727;
LABEL_46:
    *((_DWORD *)v34 + 6) = v54;
    goto LABEL_43;
  }
  if ([v47 length] != 32)
  {
LABEL_45:
    long long v34 = v69;
    int v54 = -6743;
    goto LABEL_46;
  }
  id v47 = v47;
  uint64_t v48 = (_OWORD *)[v47 bytes];
  long long v49 = v48[1];
  *a6 = *v48;
  a6[1] = v49;
LABEL_43:
  uint64_t v52 = *((unsigned int *)v69 + 6);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);
  return v52;
}

void sub_18E3EE6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void _PairingSessionDeleteIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef v9 = (const void *)*MEMORY[0x1E4F3B8C0];
  CFArrayRef v10 = (const __CFArray *)KeychainCopyMatchingFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O%kO=%O}", a3, a4, a5, a6, a7, a8, *MEMORY[0x1E4F3B978]);
  if (v10)
  {
    CFArrayRef v11 = v10;
    int v27 = 0;
    CFIndex Count = CFArrayGetCount(v10);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      CFIndex v14 = 0;
      id v15 = (const void *)*MEMORY[0x1E4F3BD40];
      do
      {
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFDictionaryRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v11, v14, TypeID, 0);
        if (TypedValueAtIndex)
        {
          CFDictionaryRef v18 = TypedValueAtIndex;
          if (*(_DWORD *)(a1 + 768) == CFDictionaryGetInt64(TypedValueAtIndex, v9, &v27))
          {
            CFTypeID v19 = CFDataGetTypeID();
            CFDictionaryGetTypedValue(v18, v15, v19, &v27);
            if (!v27) {
              int v27 = KeychainDeleteFormatted((uint64_t)"{%kO=%O}", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v15);
            }
          }
        }
        ++v14;
      }
      while (v13 != v14);
    }
    CFRelease(v11);
  }
}

uint64_t _MFiClientVerify(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, char *a7, unint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unsigned int GroupInfoTLV = 0;
  size_t v43 = 0;
  dispatch_time_t v40 = 0;
  int v37 = 0;
  uint64_t v17 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v43, (int *)&GroupInfoTLV);
  uint64_t v22 = (unsigned __int8 *)v17;
  if (GroupInfoTLV) {
    goto LABEL_18;
  }
  if (v43 <= 0xF)
  {
    unsigned int v33 = -6743;
LABEL_29:
    unsigned int GroupInfoTLV = v33;
    goto LABEL_16;
  }
  uint64_t v23 = &v17[-1].u8[v43];
  unsigned int GroupInfoTLV = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), a4, 8, 0, 0, v17, v43 - 16, v17, (uint64_t)v23, 16);
  if (!GroupInfoTLV)
  {
    CFIndex v41 = 0;
    id v42 = 0;
    unsigned int GroupInfoTLV = TLV8GetOrCopyCoalesced(v22, v23, 10, &v42, (size_t *)&v41, &v40, 0);
    if (!GroupInfoTLV)
    {
      uint64_t v38 = 0;
      dispatch_semaphore_t v39 = 0;
      unsigned int GroupInfoTLV = TLV8GetOrCopyCoalesced(v22, v23, 9, &v39, (size_t *)&v38, &v37, 0);
      if (!GroupInfoTLV)
      {
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, a5, a6, a7, a8, a9, a10, 0x20uLL, (uint64_t)v45);
        CFIndex v25 = v38;
        uint64_t v24 = v39;
        unsigned int GroupInfoTLV = MFiPlatform_VerifySignatureEx(v45, 32, v42, v41, v39, v38, 0, v26);
        if (!GroupInfoTLV)
        {
          CFIndex length = 0;
          bytes = 0;
          long long v34 = 0;
          TLV8GetOrCopyCoalesced(v22, v23, 28, &bytes, (size_t *)&length, &v34, 0);
          if (bytes)
          {
            CFDataRef v27 = CFDataCreate(0, bytes, length);
            if (v34) {
              free(v34);
            }
            if (!v27)
            {
LABEL_31:
              unsigned int v33 = -6728;
              goto LABEL_29;
            }
            unsigned int GroupInfoTLV = PairingSessionSetProperty(a1, @"productData", v27);
            CFRelease(v27);
            if (GroupInfoTLV) {
              goto LABEL_16;
            }
          }
          if (!a11 || (unsigned int GroupInfoTLV = _ExtractGroupInfoTLV(a1, v22, v23)) == 0)
          {
            CFDataRef v28 = CFDataCreate(0, v24, v25);
            if (v28)
            {
              CFDataRef v29 = v28;
              unsigned int GroupInfoTLV = PairingSessionSetProperty(a1, @"certificate", v28);
              CFRelease(v29);
              goto LABEL_16;
            }
            goto LABEL_31;
          }
        }
      }
    }
  }
LABEL_16:
  if (v37) {
    free(v37);
  }
LABEL_18:
  if (v40) {
    free(v40);
  }
  if (v22) {
    free(v22);
  }
  uint64_t result = GroupInfoTLV;
  if (GroupInfoTLV)
  {
    uint64_t v31 = *(int **)(a1 + 16);
    if (*v31 <= 90)
    {
      if (*v31 != -1)
      {
LABEL_25:
        LogPrintF((uint64_t)v31, (uint64_t)"OSStatus _MFiClientVerify(PairingSessionRef, const void *, size_t, const uint8_t *, const void *, size_t, const void *, size_t, const void *, size_t, Boolean)", 0x5Au, (uint64_t)"### MFi verify failed: %#m\n", v18, v19, v20, v21, result);
        return GroupInfoTLV;
      }
      BOOL v32 = _LogCategory_Initialize(*(void *)(a1 + 16), 0x5Au);
      uint64_t result = GroupInfoTLV;
      if (v32)
      {
        uint64_t v31 = *(int **)(a1 + 16);
        goto LABEL_25;
      }
    }
  }
  return result;
}

uint64_t _PairingThrottle()
{
  pthread_mutex_lock(&gPairingGlobalLock);
  if (gPairingMaxTries)
  {
    if (gPairingTries >= gPairingMaxTries)
    {
      uint64_t v4 = 4294960532;
      goto LABEL_20;
    }
    ++gPairingTries;
    goto LABEL_19;
  }
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  uint64_t v0 = UpTicksPerSecond_sTicksPerSecond;
  uint64_t v1 = mach_absolute_time();
  if (!gPairingThrottleNextTicks || (uint64_t v2 = gPairingThrottleNextTicks - v1, gPairingThrottleNextTicks <= v1))
  {
    unsigned int v5 = 2 * gPairingThrottleCounter;
    if ((2 * gPairingThrottleCounter) >= 0x2A30) {
      unsigned int v5 = 10800;
    }
    if (gPairingThrottleCounter) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 1;
    }
    gPairingThrottleCounter = v6;
    gPairingThrottleNextTicks = v1 + v0 * v6;
LABEL_19:
    uint64_t v4 = 4294960539;
    goto LABEL_20;
  }
  if (UpTicksPerSecond_sOnce != -1)
  {
    uint64_t v8 = gPairingThrottleNextTicks - v1;
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
    uint64_t v2 = v8;
  }
  unint64_t v3 = v2 / UpTicksPerSecond_sTicksPerSecond;
  if (v2 == v2 / UpTicksPerSecond_sTicksPerSecond * UpTicksPerSecond_sTicksPerSecond) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = (v3 + 1);
  }
LABEL_20:
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v4;
}

uint64_t PairingResetThrottle()
{
  pthread_mutex_lock(&gPairingGlobalLock);
  gPairingThrottleNextTicks = 0;
  gPairingThrottleCounter = 0;
  gPairingTries = 0;
  return pthread_mutex_unlock(&gPairingGlobalLock);
}

void _ServerEncryptExtra(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(v21, 0, sizeof(v21));
  uint64_t v18 = (int8x16_t *)v21;
  long long v19 = xmmword_18E416F70;
  uint64_t v20 = 0;
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 344);
  CFTypeID TypeID = CFDataGetTypeID();
  CFDataRef TypedValue = CFDictionaryGetTypedValue(v4, @"productData", TypeID, 0);
  if (!TypedValue
    || (CFDataRef v7 = TypedValue,
        BytePtr = (char *)CFDataGetBytePtr(TypedValue),
        size_t Length = CFDataGetLength(v7),
        uint64_t v14 = TLV8BufferAppend((uint64_t)&v18, 28, BytePtr, Length),
        !v14))
  {
    if (!(void)v19)
    {
      if (v20) {
        free(v20);
      }
      return;
    }
    id v15 = (int8x16_t *)malloc_type_malloc(v19 + 16, 0x21DCD4F5uLL);
    if (v15)
    {
      unsigned int v16 = v15;
      _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), "PS-Msg04", 8, 0, 0, v18, v19, v16, (uint64_t)v16->i64 + v19);
      uint64_t v14 = TLV8BufferAppend(a2, 5, v16->i8, v19 + 16);
      free(v16);
      if (v20)
      {
        free(v20);
        uint64_t v20 = 0;
      }
      if (!v14) {
        return;
      }
      goto LABEL_10;
    }
    uint64_t v14 = 4294960568;
  }
  if (v20)
  {
    free(v20);
    uint64_t v20 = 0;
  }
LABEL_10:
  uint64_t v17 = *(int **)(a1 + 16);
  if (*v17 <= 90)
  {
    if (*v17 != -1)
    {
LABEL_12:
      LogPrintF((uint64_t)v17, (uint64_t)"OSStatus _ServerEncryptExtra(PairingSessionRef, const uint8_t *, TLV8Buffer *)", 0x5Au, (uint64_t)"### ServerEncryptExtra failed: %#m\n", v10, v11, v12, v13, v14);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v17, 0x5Au))
    {
      uint64_t v17 = *(int **)(a1 + 16);
      goto LABEL_12;
    }
  }
}

CFTypeRef _PairingSessionIntersectACL(uint64_t a1, CFDictionaryRef theDict, _DWORD *a3)
{
  uint64_t v6 = *(const void **)(a1 + 176);
  context[0] = 0;
  context[1] = v6;
  uint64_t v10 = 0;
  if (CFDictionaryGetCount(theDict) >= 1)
  {
    CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 176);
    if (!v7 || CFDictionaryGetCount(v7) <= 0)
    {
      CFTypeRef result = 0;
      LODWORD(v10) = -6773;
      goto LABEL_5;
    }
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_PairingSessionIntersectACLApplier, context);
    CFTypeRef result = context[0];
    if (!v10 || !context[0]) {
      goto LABEL_5;
    }
    CFRelease(context[0]);
  }
  CFTypeRef result = 0;
LABEL_5:
  if (a3) {
    *a3 = v10;
  }
  return result;
}

uint64_t _PairingSessionVerifyAllowed(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 344);
  CFTypeID TypeID = CFArrayGetTypeID();
  uint64_t result = (uint64_t)CFDictionaryGetTypedValue(v2, @"allowedMACAddresses", TypeID, 0);
  if (result)
  {
    CFArrayRef v5 = (const __CFArray *)result;
    CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 312);
    CFTypeID v7 = CFDataGetTypeID();
    CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(v6, @"mac", v7, 0);
    CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 312);
    CFTypeID v10 = CFDataGetTypeID();
    CFDictionaryRef v11 = CFDictionaryGetTypedValue(v9, @"wifiMAC", v10, 0);
    if ((unint64_t)TypedValue | (unint64_t)v11)
    {
      uint64_t v12 = v11;
      CFIndex Count = CFArrayGetCount(v5);
      if (Count < 1)
      {
        return 4294960520;
      }
      else
      {
        CFIndex v14 = Count;
        CFIndex v15 = 0;
        while (1)
        {
          CFTypeID v16 = CFDataGetTypeID();
          CFArrayRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v5, v15, v16, 0);
          if (TypedValueAtIndex)
          {
            CFArrayRef v18 = TypedValueAtIndex;
            if (TypedValue)
            {
              if (CFEqual(TypedValueAtIndex, TypedValue)) {
                break;
              }
            }
            if (v12 && CFEqual(v18, v12)) {
              break;
            }
          }
          if (v14 == ++v15) {
            return 4294960520;
          }
        }
        return 0;
      }
    }
    else
    {
      return 4294960535;
    }
  }
  return result;
}

uint64_t PairingSessionSavePeer(uint64_t a1, char *__s, size_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (a3 == -1) {
    size_t v9 = strlen(__s);
  }
  uint64_t v12 = *(uint64_t (**)(char *, size_t, unsigned __int8 *, uint64_t))(a1 + 72);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 24);
    return v12(__s, v9, a4, v13);
  }
  if ((*(unsigned char *)(a1 + 100) & 4) != 0)
  {
    uint64_t v57 = 0;
    uint64_t v58 = &v57;
    uint64_t v59 = 0x2020000000;
    int v60 = 1;
    int v15 = StringToUUIDEx(__s, v9, 0, 0, &v61, a6, a7, a8);
    *((_DWORD *)v58 + 6) = v15;
    if (v15)
    {
      long long v61 = 0uLL;
      uint64_t v16 = TextToHardwareAddress(__s, v9, 6, (unsigned char *)&v61 + 10);
      *((_DWORD *)v58 + 6) = v16;
      if (v16)
      {
        uint64_t v45 = v16;
        uint64_t v17 = 0;
        CFArrayRef v18 = 0;
        uint64_t v44 = 0;
        uint64_t v46 = 0;
        id v47 = 0;
        goto LABEL_37;
      }
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v61];
    if (v17)
    {
      CFArrayRef v18 = objc_alloc_init(CUPairedPeer);
      [(CUPairedPeer *)v18 setIdentifier:v17];
      unsigned int v19 = *(_DWORD *)(a1 + 96);
      if (v19 <= 0xD && ((1 << v19) & 0x2A2A) != 0) {
        uint64_t v20 = (void *)(a1 + 176);
      }
      else {
        uint64_t v20 = (void *)(a1 + 280);
      }
      [(CUPairedPeer *)v18 setAcl:*v20];
      CFDictionaryRef v21 = *(const __CFDictionary **)(a1 + 312);
      CFTypeID TypeID = CFDataGetTypeID();
      [(CUPairedPeer *)v18 setAltIRK:CFDictionaryGetTypedValue(v21, @"altIRK", TypeID, 0)];
      CFMutableDictionaryRef v23 = PairingSessionCopyPeerInfo((void *)a1, 0);
      [(CUPairedPeer *)v18 setInfo:v23];

      uint64_t v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:32];
      [(CUPairedPeer *)v18 setPublicKey:v24];

      unint64_t v25 = *(unsigned int *)(a1 + 100);
      uint64_t v26 = _Block_copy(*(const void **)(a1 + 976));
      CFDataRef v27 = v26;
      uint64_t v28 = (v25 >> 1) & 4;
      if (v26)
      {
        v54[0] = 0;
        (*((void (**)(void *, CUPairedPeer *, unint64_t, id *))v26 + 2))(v26, v18, (v25 >> 1) & 4, v54);
        id v29 = v54[0];
        int v37 = v29;
        if (!v29)
        {
LABEL_33:
          *((_DWORD *)v58 + 6) = v29;

          uint64_t v44 = 0;
          uint64_t v46 = 0;
          id v47 = 0;
          goto LABEL_34;
        }
        uint64_t v38 = *(int **)(a1 + 16);
        if (*v38 <= 90)
        {
          if (*v38 == -1)
          {
            if (!_LogCategory_Initialize(*(void *)(a1 + 16), 0x5Au)) {
              goto LABEL_32;
            }
            uint64_t v38 = *(int **)(a1 + 16);
          }
          uint64_t v53 = NSPrintF((uint64_t)"%{error}", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v37);
          LogPrintF((uint64_t)v38, (uint64_t)"OSStatus _PairingSessionSavePeerPairingManager(PairingSessionRef, const void *, size_t, const uint8_t *)", 0x5Au, (uint64_t)"### SavePeerHandler failed: %@, %@", v39, v40, v41, v42, (uint64_t)v18);
        }
LABEL_32:
        LODWORD(v29) = NSErrorToOSStatusEx(v37, 0);
        goto LABEL_33;
      }
      size_t v43 = +[CUPairingDaemon sharedPairingDaemon];
      uint64_t v44 = v43;
      if (v43)
      {
        uint64_t v45 = [v43 savePairedPeer:v18 options:v28];
        uint64_t v46 = 0;
        *((_DWORD *)v58 + 6) = v45;
        id v47 = 0;
        if (v45)
        {
          id v47 = 0;
LABEL_37:

          _Block_object_dispose(&v57, 8);
          return v45;
        }
LABEL_34:
        uint64_t v52 = *(const void **)(a1 + 264);
        if (v52) {
          CFRelease(v52);
        }
        CFArrayRef v18 = v18;
        *(void *)(a1 + 264) = v18;
        uint64_t v45 = *((unsigned int *)v58 + 6);
        goto LABEL_37;
      }
      uint64_t v46 = objc_alloc_init(CUPairingManager);
      dispatch_queue_t v48 = dispatch_queue_create("OSStatus _PairingSessionSavePeerPairingManager(PairingSessionRef, const void *, size_t, const uint8_t *)", 0);
      [(CUPairingManager *)v46 setDispatchQueue:v48];

      if ((*(unsigned char *)(a1 + 100) & 0x40) != 0) {
        [(CUPairingManager *)v46 setTargetUserSession:1];
      }
      dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
      v54[0] = (id)MEMORY[0x1E4F143A8];
      v54[1] = (id)3221225472;
      v54[2] = ___PairingSessionSavePeerPairingManager_block_invoke;
      v54[3] = &unk_1E55BF918;
      int v56 = &v57;
      id v47 = v49;
      int v55 = v47;
      [(CUPairingManager *)v46 savePairedPeer:v18 options:v28 completion:v54];

      dispatch_time_t v50 = dispatch_time(0, 120000000000);
      uint64_t v44 = (void *)dispatch_semaphore_wait(v47, v50);
      [(CUPairingManager *)v46 invalidate];
      long long v51 = v58;
      if (!v44)
      {
        uint64_t v45 = *((unsigned int *)v58 + 6);
        if (v45) {
          goto LABEL_37;
        }
        goto LABEL_34;
      }
      uint64_t v44 = 0;
      uint64_t v45 = 4294960574;
    }
    else
    {
      CFArrayRef v18 = 0;
      uint64_t v44 = 0;
      uint64_t v46 = 0;
      id v47 = 0;
      long long v51 = v58;
      uint64_t v45 = 4294960588;
    }
    *((_DWORD *)v51 + 6) = v45;
    goto LABEL_37;
  }
  return _PairingSessionSavePeerKeychain(a1, __s, v9, a4, 0);
}

void sub_18E3EF75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFDictionary *_PairingSessionGetSelfInfo(uint64_t a1)
{
  Mutable = *(__CFDictionary **)(a1 + 328);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      int v19 = 0;
      if ((*(unsigned char *)(a1 + 100) & 4) != 0)
      {
        value = 0;
        uint64_t v17 = 0;
        _PairingSessionCopyIdentityPairingManager(a1, 3, (char **)&v17, &value, 0, 0);
        if (v17)
        {
          CFDictionarySetCString(Mutable, @"accountID", (const char *)v17, -1);
          free(v17);
        }
        if (value)
        {
          CFDictionarySetValue(Mutable, @"altIRK", value);
          CFRelease(value);
        }
      }
      unint64_t v3 = (const void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0, 0);
      if (v3)
      {
        CFDictionaryRef v4 = v3;
        CFDictionarySetValue(Mutable, @"name", v3);
        CFRelease(v4);
      }
      CFArrayRef v5 = (const void *)GestaltCopyAnswer(@"BluetoothAddress", 0, 0);
      if (v5)
      {
        CFDictionaryRef v6 = v5;
        CFDictionarySetValue(Mutable, @"btAddr", v5);
        CFRelease(v6);
      }
      GetPrimaryMACAddress((char *)bytes, &v19);
      if (!v19) {
        CFDictionarySetData(Mutable, @"mac", bytes, 6);
      }
      CFTypeID v7 = (const void *)GestaltCopyAnswer(@"ProductType", 0, 0);
      if (v7)
      {
        uint64_t v8 = v7;
        CFDictionarySetValue(Mutable, @"model", v7);
        CFRelease(v8);
      }
      size_t v9 = (const void *)GestaltCopyAnswer(@"WifiAddressData", 0, 0);
      if (v9)
      {
        CFTypeID v10 = v9;
        CFDictionarySetValue(Mutable, @"wifiMAC", v9);
        CFRelease(v10);
      }
      CFDictionaryRef v11 = *(const __CFDictionary **)(a1 + 336);
      if (v11) {
        CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)_CFDictionaryMergeDictionaryApplier, Mutable);
      }
      CFDictionaryRef v12 = *(const __CFDictionary **)(a1 + 344);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(v12, @"groupInfoSelf", TypeID, 0);
      if (TypedValue) {
        CFDictionarySetValue(Mutable, @"groupInfo", TypedValue);
      }
      *(void *)(a1 + 328) = Mutable;
    }
  }
  return Mutable;
}

void _PairingSessionIntersectACLApplier(void *key, const void *a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16)) {
    return;
  }
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), key);
  if (!Value || (CFTypeID v7 = Value, !CFEqual(Value, a2)))
  {
    int v9 = -6773;
LABEL_10:
    *(_DWORD *)(a3 + 16) = v9;
    return;
  }
  Mutable = *(__CFDictionary **)a3;
  if (!*(void *)a3)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    *(void *)a3 = Mutable;
    if (!Mutable)
    {
      int v9 = -6728;
      goto LABEL_10;
    }
  }
  CFDictionarySetValue(Mutable, key, v7);
}

void _ClientDecryptExtra(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  size_t v19 = 0;
  unsigned int v18 = 0;
  CFDictionaryRef v4 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v19, (int *)&v18);
  if (!v4) {
    return;
  }
  CFArrayRef v5 = (unsigned __int8 *)v4;
  if (v19 <= 0xF)
  {
    unsigned int v14 = -6743;
    goto LABEL_17;
  }
  CFDictionaryRef v6 = &v4[-1].u8[v19];
  unsigned int v18 = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), "PS-Msg04", 8, 0, 0, v4, v19 - 16, v4, (uint64_t)v6, 16);
  if (!v18)
  {
    CFIndex length = 0;
    bytes = 0;
    int v15 = 0;
    TLV8GetOrCopyCoalesced(v5, v6, 28, &bytes, (size_t *)&length, &v15, 0);
    if (bytes)
    {
      CFDataRef v7 = CFDataCreate(0, bytes, length);
      if (v15) {
        free(v15);
      }
      if (v7)
      {
        unsigned int v18 = PairingSessionSetProperty(a1, @"productData", v7);
        CFRelease(v7);
        goto LABEL_9;
      }
      unsigned int v14 = -6728;
LABEL_17:
      unsigned int v18 = v14;
    }
  }
LABEL_9:
  free(v5);
  uint64_t v12 = v18;
  if (v18)
  {
    uint64_t v13 = *(int **)(a1 + 16);
    if (*v13 <= 90)
    {
      if (*v13 != -1)
      {
LABEL_12:
        LogPrintF((uint64_t)v13, (uint64_t)"OSStatus _ClientDecryptExtra(PairingSessionRef, const void *, size_t, const uint8_t *)", 0x5Au, (uint64_t)"### ClientDecryptExtra failed: %#m\n", v8, v9, v10, v11, v12);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v13, 0x5Au))
      {
        uint64_t v12 = v18;
        uint64_t v13 = *(int **)(a1 + 16);
        goto LABEL_12;
      }
    }
  }
}

uint64_t PairingSessionDeleteIdentity(uint64_t a1)
{
  pthread_mutex_lock(&gPairingGlobalLock);
  _PairingSessionDeleteIdentity(a1, v2, v3, v4, v5, v6, v7, v8);
  pthread_mutex_unlock(&gPairingGlobalLock);
  return 0;
}

CFArrayRef PairingSessionCopyPeer(int a1, char *a2, uint64_t a3, _DWORD *a4)
{
  int v12 = 0;
  uint64_t v5 = _PairingSessionCopyPeers(a1, a2, a3, &v12);
  CFArrayRef v6 = v5;
  if (v12)
  {
    CFArrayRef v9 = 0;
  }
  else if (CFArrayGetCount(v5) <= 0)
  {
    CFArrayRef v9 = 0;
    int v12 = -6727;
  }
  else
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFArrayRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v6, 0, TypeID, &v12);
    CFArrayRef v9 = 0;
    if (!v12)
    {
      CFArrayRef v10 = TypedValueAtIndex;
      CFRetain(TypedValueAtIndex);
      CFArrayRef v9 = v10;
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  if (a4) {
    *a4 = v12;
  }
  return v9;
}

__CFArray *PairingSessionCopyPeers(int a1, _DWORD *a2)
{
  return _PairingSessionCopyPeers(a1, 0, 0, a2);
}

uint64_t PairingSessionDeletePeer(uint64_t a1, char *__s, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a1 + 100) & 4) != 0)
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    int v38 = 1;
    int v17 = StringToUUIDEx(__s, a3, 0, 0, &v39, a6, a7, a8);
    *((_DWORD *)v36 + 6) = v17;
    if (v17
      && (long long v39 = 0uLL, v18 = TextToHardwareAddress(__s, a3, 6, (unsigned char *)&v39 + 10), (*((_DWORD *)v36 + 6) = v18) != 0))
    {
      uint64_t v16 = v18;
    }
    else
    {
      size_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v39];
      if (v19)
      {
        uint64_t v20 = objc_alloc_init(CUPairedPeer);
        [(CUPairedPeer *)v20 setIdentifier:v19];
        unint64_t v21 = *(unsigned int *)(a1 + 100);
        uint64_t v22 = +[CUPairingDaemon sharedPairingDaemon];
        CFMutableDictionaryRef v23 = v22;
        uint64_t v24 = (v21 >> 1) & 4;
        if (v22)
        {
          uint64_t v16 = [v22 removePairedPeer:v20 options:v24];
          *((_DWORD *)v36 + 6) = v16;
        }
        else
        {
          unint64_t v25 = objc_alloc_init(CUPairingManager);
          dispatch_queue_t v26 = dispatch_queue_create("OSStatus _PairingSessionDeletePeerPairingManager(PairingSessionRef, const void *, size_t)", 0);
          [(CUPairingManager *)v25 setDispatchQueue:v26];

          if ((*(unsigned char *)(a1 + 100) & 0x40) != 0) {
            [(CUPairingManager *)v25 setTargetUserSession:1];
          }
          dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = ___PairingSessionDeletePeerPairingManager_block_invoke;
          v32[3] = &unk_1E55BF918;
          uint64_t v34 = &v35;
          uint64_t v28 = v27;
          uint64_t v33 = v28;
          [(CUPairingManager *)v25 removePairedPeer:v20 options:v24 completion:v32];

          dispatch_time_t v29 = dispatch_time(0, 120000000000);
          intptr_t v30 = dispatch_semaphore_wait(v28, v29);
          [(CUPairingManager *)v25 invalidate];
          if (v30)
          {
            *((_DWORD *)v36 + 6) = -6722;

            uint64_t v16 = 4294960574;
          }
          else
          {
            uint64_t v16 = *((unsigned int *)v36 + 6);
          }
        }
      }
      else
      {
        uint64_t v16 = 4294960588;
        *((_DWORD *)v36 + 6) = -6708;
      }
    }
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    pthread_mutex_lock(&gPairingGlobalLock);
    _PairingSessionDeletePeer(a1, __s, a3, v11, v12, v13, v14, v15);
    pthread_mutex_unlock(&gPairingGlobalLock);
    return 0;
  }
  return v16;
}

void sub_18E3F0038(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t PairingSessionFindPeer(uint64_t a1, char *a2, size_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PairingSessionFindPeerEx(a1, a2, a3, a4, 0, a6, a7, a8);
}

uint64_t PairingSessionUpdatePeerInfo(uint64_t a1, char *__s, uint64_t a3, const void *a4)
{
  CFDictionaryRef v22 = 0;
  if (a3 == -1) {
    strlen(__s);
  }
  pthread_mutex_lock(&gPairingGlobalLock);
  uint64_t Formatted = CFPropertyListCreateFormatted(0, (CFTypeRef *)&v22, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%.*s%kO=%O}", v6, v7, v8, v9, v10, *MEMORY[0x1E4F3B978]);
  if (!Formatted)
  {
    CFDataRef Data = CFPropertyListCreateData(0, a4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if (Data)
    {
      CFDataRef v19 = Data;
      uint64_t Formatted = KeychainUpdateFormatted(v22, (uint64_t)"{%kO=%O}", v17, v18, v11, v12, v13, v14, *MEMORY[0x1E4F3B688]);
      CFRelease(v19);
      if (!Formatted) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t Formatted = 4294960596;
    }
  }
  uint64_t v20 = *(int **)(a1 + 16);
  if (*v20 <= 60)
  {
    if (*v20 != -1)
    {
LABEL_8:
      LogPrintF((uint64_t)v20, (uint64_t)"OSStatus PairingSessionUpdatePeerInfo(PairingSessionRef, const void *, size_t, CFDictionaryRef)", 0x3Cu, (uint64_t)"### Update %@ %.*s info failed: %#m\n", v11, v12, v13, v14, *(void *)(a1 + 784));
      goto LABEL_10;
    }
    if (_LogCategory_Initialize((uint64_t)v20, 0x3Cu))
    {
      uint64_t v20 = *(int **)(a1 + 16);
      goto LABEL_8;
    }
  }
LABEL_10:
  if (v22) {
    CFRelease(v22);
  }
  pthread_mutex_unlock(&gPairingGlobalLock);
  return Formatted;
}

uint64_t PairingSessionSetCopyIdentityHandler_b(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    uint64_t v5 = [v3 copy];
    uint64_t v6 = *(const void **)(a1 + 960);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 960) = v5;
    id v4 = v8;
  }
  else
  {
    uint64_t v6 = *(const void **)(a1 + 960);
    if (v6)
    {
      CFRelease(v6);
      id v4 = 0;
      *(void *)(a1 + 960) = 0;
    }
  }
  return MEMORY[0x1F41817F8](v6, v4);
}

uint64_t PairingSessionSetFindPeerHandler_b(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    uint64_t v5 = [v3 copy];
    uint64_t v6 = *(const void **)(a1 + 968);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 968) = v5;
    id v4 = v8;
  }
  else
  {
    uint64_t v6 = *(const void **)(a1 + 968);
    if (v6)
    {
      CFRelease(v6);
      id v4 = 0;
      *(void *)(a1 + 968) = 0;
    }
  }
  return MEMORY[0x1F41817F8](v6, v4);
}

uint64_t PairingSessionSetSavePeerHandler_b(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    uint64_t v5 = [v3 copy];
    uint64_t v6 = *(const void **)(a1 + 976);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 976) = v5;
    id v4 = v8;
  }
  else
  {
    uint64_t v6 = *(const void **)(a1 + 976);
    if (v6)
    {
      CFRelease(v6);
      id v4 = 0;
      *(void *)(a1 + 976) = 0;
    }
  }
  return MEMORY[0x1F41817F8](v6, v4);
}

uint64_t PairingSessionSetMyAppleID(uint64_t a1, CFTypeRef cf)
{
  id v4 = *(const void **)(a1 + 816);
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(a1 + 816) = cf;
  if (v4) {
    CFRelease(v4);
  }
  return 0;
}

uint64_t PairingSessionSetMyAppleIDInfoClient(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(const void **)(a1 + 840);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 840) = v3;

  return 0;
}

uint64_t PairingSessionSetPeerAppleID(uint64_t a1, CFTypeRef cf)
{
  id v4 = *(const void **)(a1 + 824);
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(a1 + 824) = cf;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a1 + 832);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 832) = 0;
  }
  return 0;
}

uint64_t PairingSessionSetPeerAppleIDs(uint64_t a1, CFTypeRef cf)
{
  id v4 = *(const void **)(a1 + 832);
  if (cf) {
    CFRetain(cf);
  }
  *(void *)(a1 + 832) = cf;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a1 + 824);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 824) = 0;
  }
  return 0;
}

uint64_t PrintFRegisterExtension(const char *a1, uint64_t a2, uint64_t a3)
{
  pthread_mutex_lock(&gPrintFUtilsLock);
  uint64_t v6 = &gExtensionList;
  while (1)
  {
    uint64_t v6 = (uint64_t *)*v6;
    if (!v6) {
      break;
    }
    if (!strcasecmp((const char *)v6 + 24, a1))
    {
      uint64_t v7 = 4294960566;
      goto LABEL_7;
    }
  }
  size_t v8 = strlen(a1);
  uint64_t v9 = malloc_type_malloc(v8 + 25, 0xB6036271uLL);
  if (v9)
  {
    uint64_t v10 = v9;
    v9[1] = a2;
    v9[2] = a3;
    memcpy(v9 + 3, a1, v8 + 1);
    uint64_t v7 = 0;
    *uint64_t v10 = gExtensionList;
    gExtensionList = (uint64_t)v10;
  }
  else
  {
    uint64_t v7 = 4294960568;
  }
LABEL_7:
  pthread_mutex_unlock(&gPrintFUtilsLock);
  return v7;
}

uint64_t PrintFDeregisterExtension(const char *a1)
{
  pthread_mutex_lock(&gPrintFUtilsLock);
  uint64_t v2 = (char *)&gExtensionList;
  while (1)
  {
    id v3 = v2;
    uint64_t v2 = *(char **)v2;
    if (!v2) {
      break;
    }
    if (!strcasecmp(v2 + 24, a1))
    {
      *(void *)id v3 = *(void *)v2;
      free(v2);
      uint64_t v4 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 4294960569;
LABEL_6:
  pthread_mutex_unlock(&gPrintFUtilsLock);
  return v4;
}

uint64_t CFAppendPrintF(CFMutableStringRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return CFAppendPrintV(a1, a2, (uint64_t)&a9);
}

uint64_t CFAppendPrintV(CFMutableStringRef *a1, uint64_t a2, uint64_t a3)
{
  if (!*a1)
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    *a1 = Mutable;
    if (!Mutable) {
      return 4294960568;
    }
  }
  cStr = 0;
  VASPrintF((void **)&cStr, a2, a3);
  uint64_t v7 = cStr;
  if (!cStr) {
    return 4294960568;
  }
  CFStringAppendCString(*a1, cStr, 0x8000100u);
  free(v7);
  return 0;
}

uint64_t SNPrintF_Add(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a2 - *a1;
  if (a2 == *a1) {
    return 4294960533;
  }
  uint64_t result = VSNPrintF(v9, v10, a3, (uint64_t)&a9);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v14 = v9 + result;
    if ((int)result < (int)v10)
    {
      uint64_t result = 0;
    }
    else
    {
      uint64_t v14 = a2;
      uint64_t result = 4294960545;
    }
    *a1 = v14;
  }
  return result;
}

uint64_t PrintFWriteMultiLineText(uint64_t (**a1)(unsigned __int8 *, int64_t, void), uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a4 < 1) {
    return 0;
  }
  uint64_t v4 = a3;
  uint64_t v6 = 0;
  unint64_t v7 = (unint64_t)&a3[a4];
  while (1)
  {
    size_t v8 = v4;
    uint64_t v9 = v4;
    while (1)
    {
      int v10 = *v9;
      if (v10 == 10) {
        break;
      }
      if (v10 == 13)
      {
        if ((unint64_t)(v9 + 1) < v7 && v9[1] == 10)
        {
          uint64_t v4 = v9 + 2;
          goto LABEL_12;
        }
        break;
      }
      if ((unint64_t)++v9 >= v7)
      {
        int v11 = 0;
        uint64_t v4 = v9;
        goto LABEL_13;
      }
    }
    uint64_t v4 = v9 + 1;
LABEL_12:
    int v11 = 1;
LABEL_13:
    if (v8 >= v9) {
      goto LABEL_24;
    }
    int v12 = *v8;
    if (v12 != 10 && v12 != 13)
    {
      int v14 = *(_DWORD *)(a2 + 8);
      if (v14) {
        break;
      }
    }
LABEL_22:
    int64_t v16 = v9 - v8;
    uint64_t v15 = (*a1)(v8, v16, a1);
    if ((v15 & 0x80000000) != 0) {
      return v15;
    }
    uint64_t v6 = (v6 + v16);
LABEL_24:
    if (v11)
    {
      uint64_t v15 = (*a1)("\n", 1, a1);
      if ((v15 & 0x80000000) != 0) {
        return v15;
      }
      uint64_t v6 = (v6 + 1);
    }
    if ((unint64_t)v4 >= v7) {
      return v6;
    }
  }
  LODWORD(v6) = v6 + 4 * v14;
  while (1)
  {
    uint64_t v15 = (*a1)("    ", 4, a1);
    if ((v15 & 0x80000000) != 0) {
      return v15;
    }
    if (!--v14) {
      goto LABEL_22;
    }
  }
}

uint64_t PrintFWriteHex(uint64_t (**a1)(const char *, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  int v84 = a7;
  uint64_t v8 = a4;
  uint64_t v87 = 0;
  uint64_t v9 = 0;
  int v89 = 0;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (a5 >= a6) {
    unint64_t v10 = a6;
  }
  else {
    unint64_t v10 = a5;
  }
  uint64_t v91 = (4 * a3);
  int v11 = &v96;
  int v12 = &v97;
  while (1)
  {
    unint64_t v13 = 0;
    unint64_t v14 = v10 >= 0x10 ? 16 : v10;
    unsigned __int8 v94 = v12;
    do
    {
      if (v13 && (v13 & 3) == 0) {
        *v12++ = 32;
      }
      if (v13 >= v14)
      {
        char v15 = 32;
        *int v12 = 32;
      }
      else
      {
        *int v12 = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(v8 + v13) >> 4];
        char v15 = a0123456789abcd[*(unsigned char *)(v8 + v13) & 0xF];
      }
      v12[1] = v15;
      v12 += 2;
      ++v13;
    }
    while (v13 != 16);
    unint64_t v16 = 0;
    *int v12 = 0;
    do
    {
      if (v16 >= v14)
      {
        LOBYTE(v17) = 32;
      }
      else
      {
        int v17 = *(unsigned __int8 *)(v8 + v16);
        if ((v17 - 32) >= 0x5F) {
          LOBYTE(v17) = 94;
        }
      }
      v95[v16++] = v17;
    }
    while (v16 != 16);
    v95[16] = 0;
    if (a5 > 0x10)
    {
      if (v8 == a4)
      {
        unsigned __int8 v90 = v11;
        uint64_t v26 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", a3, a4, a5, a6, a7, a8, v91);
        if ((v26 & 0x80000000) != 0) {
          return v26;
        }
        uint64_t v27 = PrintFCore((uint64_t)a1, (uint64_t)"+%04X: %s |%s| (%zu bytes)", v51, v52, v53, v54, v55, v56, 0);
        if ((v27 & 0x80000000) != 0) {
          return v27;
        }
        int v50 = v26 + v9;
LABEL_49:
        uint64_t v9 = (v50 + v27);
        int v11 = v90;
        goto LABEL_50;
      }
      if (*(char *)(a2 + 24) < 1
        || (*(void *)v94 == *(void *)v11 ? (BOOL v28 = *((void *)v94 + 1) == *((void *)v11 + 1)) : (BOOL v28 = 0),
            v28 ? (BOOL v29 = *((void *)v94 + 2) == *((void *)v11 + 2)) : (BOOL v29 = 0),
            v29 ? (BOOL v30 = *((void *)v94 + 3) == *((void *)v11 + 3)) : (BOOL v30 = 0),
            !v30))
      {
        uint64_t v27 = (*a1)("\n", 1);
        if ((v27 & 0x80000000) != 0) {
          return v27;
        }
        unsigned __int8 v90 = v11;
        int v37 = v9 + 1;
        if (v89 >= 1)
        {
          uint64_t v9 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", v31, v32, v33, v34, v35, v36, v91);
          if ((v9 & 0x80000000) != 0) {
            return v9;
          }
          uint64_t v27 = PrintFCore((uint64_t)a1, (uint64_t)"* (%zu more identical bytes, %zu total)\n", v38, v39, v40, v41, v42, v43, v87);
          if ((v27 & 0x80000000) != 0) {
            return v27;
          }
          int v89 = 0;
          uint64_t v87 = 0;
          v37 += v9 + v27;
        }
        uint64_t v9 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", v31, v32, v33, v34, v35, v36, v91);
        if ((v9 & 0x80000000) != 0) {
          return v9;
        }
        uint64_t v27 = PrintFCore((uint64_t)a1, (uint64_t)"+%04X: %s |%s|", v44, v45, v46, v47, v48, v49, v8 - a4);
        if ((v27 & 0x80000000) != 0) {
          return v27;
        }
        int v50 = v9 + v37;
        goto LABEL_49;
      }
      ++v89;
      v87 += v14;
    }
    else
    {
      unint64_t v18 = v10;
      CFDataRef v19 = v11;
      uint64_t v26 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", a3, a4, a5, a6, a7, a8, v91);
      if ((v26 & 0x80000000) != 0) {
        return v26;
      }
      uint64_t v27 = PrintFCore((uint64_t)a1, (uint64_t)"%s |%s| (%zu bytes)", v20, v21, v22, v23, v24, v25, (uint64_t)v94);
      if ((v27 & 0x80000000) != 0) {
        return v27;
      }
      uint64_t v9 = (v26 + v9 + v27);
      int v11 = v19;
      unint64_t v10 = v18;
    }
LABEL_50:
    v10 -= v14;
    if (!v10) {
      break;
    }
    v8 += v14;
    int v12 = v11;
    int v11 = v94;
  }
  if (v89 < 1)
  {
    uint64_t v57 = (uint64_t (**)(const char *, uint64_t, void))a1;
LABEL_59:
    if (a5 > a6)
    {
      uint64_t v27 = (*v57)("\n", 1, v57);
      if ((v27 & 0x80000000) != 0) {
        return v27;
      }
      uint64_t v26 = PrintFCore((uint64_t)v57, (uint64_t)"%*s", v70, v71, v72, v73, v74, v75, v91);
      if ((v26 & 0x80000000) != 0) {
        return v26;
      }
      uint64_t v27 = PrintFCore((uint64_t)v57, (uint64_t)"... %zu more bytes ...", v76, v77, v78, v79, v80, v81, a5 - a6);
      if ((v27 & 0x80000000) != 0) {
        return v27;
      }
      uint64_t v9 = (v9 + v26 + v27 + 1);
    }
    if (v84)
    {
      int v82 = (*v57)("\n", 1, v57);
      if (v82 >= 0) {
        return (v9 + 1);
      }
      else {
        return v82;
      }
    }
  }
  else
  {
    uint64_t v57 = (uint64_t (**)(const char *, uint64_t, void))a1;
    uint64_t v27 = ((uint64_t (*)(const char *, uint64_t, uint64_t (**)(const char *, uint64_t)))*a1)("\n", 1, a1);
    if ((v27 & 0x80000000) != 0) {
      return v27;
    }
    uint64_t v26 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", v58, v59, v60, v61, v62, v63, v91);
    if ((v26 & 0x80000000) == 0)
    {
      uint64_t v27 = PrintFCore((uint64_t)a1, (uint64_t)"* (%zu more identical bytes, %zu total)", v64, v65, v66, v67, v68, v69, v87);
      if ((v27 & 0x80000000) == 0)
      {
        uint64_t v9 = (v9 + v26 + v27 + 1);
        goto LABEL_59;
      }
      return v27;
    }
    return v26;
  }
  return v9;
}

uint64_t _PrintFObfuscateIPv4(unsigned __int8 *a1, unsigned char *a2)
{
  if (gObfuscateOnce != -1) {
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
  }
  uint64_t result = SipHash(gObfuscateKey, a1, 4);
  *a2 = -69;
  a2[1] = BYTE2(result);
  a2[2] = BYTE1(result);
  a2[3] = result;
  return result;
}

void _PrintFObfuscateHardwareAddress(unsigned __int8 *a1, unint64_t a2, _WORD *a3)
{
  if (gObfuscateOnce != -1) {
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
  }
  unint64_t v6 = SipHash(gObfuscateKey, a1, a2);
  *a3 = 187;
  unint64_t v7 = a3 + 1;
  uint64_t v8 = 8;
  if (a2 < 8) {
    uint64_t v8 = a2;
  }
  uint64_t v9 = v8 - 2;
  do
  {
    *v7++ = v6;
    v6 >>= 8;
    --v9;
  }
  while (v9);
  if (a2 >= 9)
  {
    bzero((char *)a3 + v8, a2 - v8);
  }
}

uint64_t _PrintFObfuscateIPv6(unsigned __int8 *a1, uint64_t a2)
{
  if (gObfuscateOnce != -1) {
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
  }
  uint64_t result = SipHash(gObfuscateKey, a1, 16);
  *(unsigned char *)a2 = -69;
  *(void *)(a2 + 1) = 0;
  *(_DWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 12) = bswap32(result);
  return result;
}

uint64_t PrintFWriteMaskObject(uint64_t (**a1)(unsigned __int8 *, uint64_t, void), const __CFURL *cf)
{
  CFURLRef v2 = cf;
  uint64_t v60 = 0;
  CFTypeID TypeID = CFGetTypeID(cf);
  if (TypeID == CFURLGetTypeID())
  {
    CFURLRef v2 = (const __CFURL *)CFURLGetString(v2);
    CFTypeID TypeID = CFStringGetTypeID();
  }
  if (TypeID == CFStringGetTypeID())
  {
    size_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v5 = CFStringGetOrCopyCStringUTF8((const __CFString *)v2, (const char **)&v59, (UInt8 **)&v60, &v58);
    if (!v5)
    {
      size_t v10 = v58;
      uint64_t v9 = (unsigned __int8 *)v59;
      if (v58 < 0x24 || StringToUUIDEx(v59, v58, 1, 0, 0, v6, v7, v8))
      {
        if (stricmp_prefix(v9, "http://"))
        {
          if (!stricmp_prefix(v9, "https://")) {
            goto LABEL_24;
          }
          if (stricmp_prefix(v9, "mailto:"))
          {
            if (stricmp_prefix(v9, "file:///"))
            {
              if (stricmp_prefix(v9, "tel:"))
              {
                unsigned int v17 = *v9;
                uint64_t v18 = 1;
                if ((v17 > 0x2F || ((1 << v17) & 0x881000000000) == 0) && v17 != 126)
                {
                  uint64_t v19 = 0;
                  uint64_t v20 = (char *)v9;
                  goto LABEL_27;
                }
              }
              else
              {
                uint64_t v18 = 4;
              }
LABEL_25:
              uint64_t v38 = (*a1)(v9, v18, a1);
              if ((v38 & 0x80000000) != 0)
              {
                uint64_t v19 = 0;
                goto LABEL_112;
              }
              uint64_t v19 = v38;
              uint64_t v20 = (char *)&v9[v18];
              uint64_t v59 = v20;
LABEL_27:
              if (stricmp_prefix((unsigned __int8 *)v20, "www."))
              {
                if (stricmp_prefix((unsigned __int8 *)v20, "+1-"))
                {
                  if (stricmp_prefix((unsigned __int8 *)v20, "1-")
                    && stricmp_prefix((unsigned __int8 *)v20, "+1"))
                  {
                    if (*v20 != 49) {
                      goto LABEL_38;
                    }
                    uint64_t v39 = 1;
                  }
                  else
                  {
                    uint64_t v39 = 2;
                  }
                }
                else
                {
                  uint64_t v39 = 3;
                }
              }
              else
              {
                uint64_t v39 = 4;
              }
              int v40 = (*a1)((unsigned __int8 *)v20, v39, a1);
              if (v40 < 0) {
                goto LABEL_112;
              }
              uint64_t v19 = (v40 + v19);
              v20 += v39;
              uint64_t v59 = v20;
LABEL_38:
              uint64_t v41 = &v9[v10];
              if ((unint64_t)(v41 - (unsigned __int8 *)v20) >= 2) {
                uint64_t v42 = 2;
              }
              else {
                uint64_t v42 = v41 - (unsigned __int8 *)v20;
              }
              int v43 = (*a1)((unsigned __int8 *)v20, v42, a1);
              if (v43 < 0) {
                goto LABEL_112;
              }
              uint64_t v19 = (v43 + v19);
              uint64_t v44 = &v59[v42];
              v59 += v42;
              int v45 = (*a1)("*", 1, a1);
              if (v45 < 0) {
                goto LABEL_112;
              }
              uint64_t v19 = (v45 + v19);
              uint64_t v46 = strchr(v44, 64);
              uint64_t v47 = v46;
              if (v46)
              {
                int v48 = (*a1)((unsigned __int8 *)v46, 1, a1);
                if (v48 < 0) {
                  goto LABEL_112;
                }
                uint64_t v19 = (v48 + v19);
                uint64_t v44 = v47 + 1;
                uint64_t v59 = v47 + 1;
              }
              unint64_t v49 = v41 - (unsigned __int8 *)v44;
              size_t v58 = v41 - (unsigned __int8 *)v44;
              size_t v50 = v41 - (unsigned __int8 *)v44;
              if ((unint64_t)(v41 - (unsigned __int8 *)v44) >= 9)
              {
                uint64_t v51 = 9;
                if (!memicmp(v41 - 9, "gmail.com", 9)) {
                  goto LABEL_99;
                }
                size_t v50 = v58;
                if (v58 >= 0xA)
                {
                  uint64_t v51 = 10;
                  if (!memicmp((unsigned __int8 *)&v44[v58 - 10], "icloud.com", 10)) {
                    goto LABEL_99;
                  }
                  size_t v50 = v58;
                }
                if (v50 >= 9)
                {
                  uint64_t v51 = 9;
                  if (!memicmp((unsigned __int8 *)&v44[v50 - 9], "yahoo.com", 9)) {
                    goto LABEL_99;
                  }
                  size_t v50 = v58;
                }
              }
              if (v50 >= 7)
              {
                uint64_t v51 = 7;
                if (!memicmp((unsigned __int8 *)&v44[v50 - 7], "mac.com", 7)) {
                  goto LABEL_99;
                }
                size_t v50 = v58;
              }
              if (v50 >= 6)
              {
                uint64_t v51 = 6;
                if (!memicmp((unsigned __int8 *)&v44[v50 - 6], "me.com", 6)) {
                  goto LABEL_99;
                }
                size_t v50 = v58;
                if (v58 >= 9)
                {
                  uint64_t v51 = 9;
                  if (!memicmp((unsigned __int8 *)&v44[v58 - 9], "apple.com", 9)) {
                    goto LABEL_99;
                  }
                  size_t v50 = v58;
                  if (v58 >= 0xF)
                  {
                    uint64_t v51 = 15;
                    if (!memicmp((unsigned __int8 *)&v44[v58 - 15], ".com/index.html", 15)) {
                      goto LABEL_99;
                    }
                    size_t v50 = v58;
                  }
                  if (v50 >= 0xB)
                  {
                    uint64_t v51 = 11;
                    if (!memicmp((unsigned __int8 *)&v44[v50 - 11], "/index.html", 11)) {
                      goto LABEL_99;
                    }
                    size_t v50 = v58;
                  }
                  if (v50 >= 0xA)
                  {
                    uint64_t v51 = 10;
                    if (!memicmp((unsigned __int8 *)&v44[v50 - 10], "index.html", 10)) {
                      goto LABEL_99;
                    }
                    size_t v50 = v58;
                  }
                }
              }
              if (v50 >= 5)
              {
                uint64_t v51 = 5;
                if (!memicmp((unsigned __int8 *)&v44[v50 - 5], ".html", 5)) {
                  goto LABEL_99;
                }
                size_t v50 = v58;
                if (v58 >= 5)
                {
                  uint64_t v51 = 5;
                  if (!memicmp((unsigned __int8 *)&v44[v58 - 5], ".jpeg", 5)) {
                    goto LABEL_99;
                  }
                  size_t v50 = v58;
                }
              }
              if (v50 < 4) {
                goto LABEL_83;
              }
              uint64_t v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v50 - 4], ".com", 4)) {
                goto LABEL_99;
              }
              if (v58 < 4) {
                goto LABEL_83;
              }
              uint64_t v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".net", 4)) {
                goto LABEL_99;
              }
              if (v58 < 4) {
                goto LABEL_83;
              }
              uint64_t v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".jpg", 4)) {
                goto LABEL_99;
              }
              if (v58 < 4) {
                goto LABEL_83;
              }
              uint64_t v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".pdf", 4)) {
                goto LABEL_99;
              }
              if (v58 < 4) {
                goto LABEL_83;
              }
              uint64_t v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".png", 4)) {
                goto LABEL_99;
              }
              if (v58 < 4) {
                goto LABEL_83;
              }
              uint64_t v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".txt", 4)) {
                goto LABEL_99;
              }
              if (v58 < 4) {
                goto LABEL_83;
              }
              uint64_t v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".bin", 4)) {
                goto LABEL_99;
              }
              if (v58 < 5)
              {
LABEL_83:
                uint64_t v51 = 0;
                int v52 = 0;
LABEL_101:
                if (v49 >= 2) {
                  uint64_t v54 = 2;
                }
                else {
                  uint64_t v54 = v49;
                }
                if (!v54)
                {
LABEL_110:
                  if (v52)
                  {
                    int v57 = (*a1)(v41, v51, a1);
                    uint64_t v19 = (v57 & ~(v57 >> 31)) + v19;
                  }
                  goto LABEL_112;
                }
                if (v47)
                {
                  int v55 = (*a1)("*", 1, a1);
                  if (v55 < 0) {
                    goto LABEL_112;
                  }
                  uint64_t v19 = (v55 + v19);
                }
                int v56 = (*a1)(&v41[-v54], v54, a1);
                if ((v56 & 0x80000000) == 0)
                {
                  uint64_t v19 = (v56 + v19);
                  goto LABEL_110;
                }
LABEL_112:
                if (v60) {
                  free(v60);
                }
                return v19;
              }
              uint64_t v51 = 5;
              if (memicmp((unsigned __int8 *)&v44[v58 - 5], " iPad", 5))
              {
                if (v58 < 7) {
                  goto LABEL_83;
                }
                uint64_t v51 = 7;
                if (memicmp((unsigned __int8 *)&v44[v58 - 7], " iPhone", 7)) {
                  goto LABEL_83;
                }
                uint64_t v53 = -7;
LABEL_100:
                v41 += v53;
                unint64_t v49 = v41 - (unsigned __int8 *)v44;
                int v52 = 1;
                goto LABEL_101;
              }
LABEL_99:
              uint64_t v53 = -v51;
              goto LABEL_100;
            }
LABEL_24:
            uint64_t v18 = 8;
            goto LABEL_25;
          }
        }
        uint64_t v18 = 7;
        goto LABEL_25;
      }
      uint64_t v5 = PrintFCore((uint64_t)a1, (uint64_t)"U<%.4s*%.4s>", v11, v12, v13, v14, v15, v16, (uint64_t)v9);
    }
    uint64_t v19 = v5;
    goto LABEL_112;
  }
  if (TypeID != CFDataGetTypeID()) {
    return PrintFCore((uint64_t)a1, (uint64_t)"<<UNSUPPORTED OBJ: %d>>", v21, v22, v23, v24, v25, v26, TypeID);
  }
  unint64_t Length = CFDataGetLength(v2);
  if (Length >= 0x80) {
    uint64_t v34 = 128;
  }
  else {
    uint64_t v34 = Length;
  }
  if (v34)
  {
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v2);
    uint64_t v36 = SipHash(qword_18E418B56, BytePtr, v34) & 0xFFFFFF;
  }
  else
  {
    uint64_t v36 = 0;
  }
  return PrintFCore((uint64_t)a1, (uint64_t)"H<%06x>", v28, v29, v30, v31, v32, v33, v36);
}

uint64_t PrintFWriteSingleLineText(uint64_t (**a1)(unsigned __int8 *, int64_t, void), unsigned __int8 *a2, uint64_t a3, int a4)
{
  if (a3 >= 1)
  {
    uint64_t v5 = a2;
    uint64_t v7 = 0;
    uint64_t v8 = &a2[a3];
    while (1)
    {
      uint64_t v9 = v5;
      do
      {
        int v10 = *v9;
        if (v10 == 10 || v10 == 13) {
          break;
        }
        ++v9;
      }
      while (v9 < v8);
      if (v5 < v9)
      {
        uint64_t v12 = (*a1)(v5, v9 - v5, a1);
        if ((v12 & 0x80000000) != 0) {
          return v12;
        }
        uint64_t v7 = (v12 + v7);
      }
      if (v9 >= v8)
      {
        uint64_t v5 = v9;
      }
      else
      {
        uint64_t v13 = v8 - v9;
        uint64_t v5 = v9;
        while (1)
        {
          int v14 = *v5;
          if (v14 != 13 && v14 != 10) {
            break;
          }
          ++v5;
          if (!--v13)
          {
            uint64_t v5 = v8;
            goto LABEL_22;
          }
        }
        if (v9 < v5)
        {
          if (a4)
          {
            uint64_t v16 = " ";
            uint64_t v17 = 1;
          }
          else
          {
            uint64_t v16 = " ⏎ ";
            uint64_t v17 = 5;
          }
          uint64_t v12 = (*a1)((unsigned __int8 *)v16, v17, a1);
          if ((v12 & 0x80000000) != 0) {
            return v12;
          }
          uint64_t v7 = (v12 + v7);
        }
      }
LABEL_22:
      if (v5 >= v8) {
        return v7;
      }
    }
  }
  return 0;
}

uint64_t PrintFWriteTLV8(uint64_t a1, uint64_t a2, const char *a3, unsigned __int8 *a4, uint64_t a5)
{
  uint64_t v5 = a4;
  unint64_t v6 = (unint64_t)&a4[a5];
  if (a5 < 2)
  {
    unsigned int v8 = 0;
  }
  else
  {
    uint64_t v47 = a5;
    unsigned int v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = a4;
    do
    {
      uint64_t v10 = v9[1];
      unint64_t v11 = (unint64_t)&v9[v10 + 2];
      if (v11 > v6) {
        break;
      }
      int v12 = *v9;
      v9 += v10 + 2;
      for (uint64_t i = a3; ; i += v14 + 2)
      {
        unsigned int v14 = strlen(i + 1);
        if (!v14) {
          break;
        }
        if (v8 < v14 && *(unsigned __int8 *)i == v12) {
          unsigned int v8 = v14;
        }
      }
      if (v7 <= v10) {
        unsigned int v7 = v10;
      }
    }
    while ((uint64_t)(v6 - v11) >= 2);
    a5 = v47;
  }
  if (a5 >= 2)
  {
    uint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = v5[1];
      uint64_t v18 = v5 + 2;
      uint64_t v19 = &v5[v17 + 2];
      if ((unint64_t)v19 > v6) {
        return v16;
      }
      int v20 = *v5;
      v5 += v17 + 2;
      for (j = a3; ; j = &v22[v23 + 1])
      {
        uint64_t v22 = j + 1;
        int v23 = strlen(j + 1);
        if (!v23) {
          break;
        }
        if (*(unsigned __int8 *)j == v20) {
          goto LABEL_25;
        }
      }
      uint64_t v22 = 0;
LABEL_25:
      if (v17)
      {
        uint64_t v30 = v17 - 1;
        uint64_t v31 = v18;
        do
        {
          int v32 = *v31++;
          BOOL v33 = (v32 - 32) < 0x5F;
        }
        while ((v32 - 32) <= 0x5E && v30-- != 0);
      }
      else
      {
        BOOL v33 = 1;
      }
      uint64_t v35 = PrintFCore(a1, (uint64_t)"%*s0x%02X", v24, v25, v26, v27, v28, v29, (4 * *(_DWORD *)(a2 + 8)));
      if ((v35 & 0x80000000) != 0) {
        return v35;
      }
      int v42 = v35 + v16;
      if (v22)
      {
        uint64_t v43 = PrintFCore(a1, (uint64_t)" (%s)", v36, v37, v38, v39, v40, v41, (uint64_t)v22);
        uint64_t v16 = v43;
        if ((v43 & 0x80000000) != 0) {
          return v16;
        }
        v42 += v43;
        uint64_t v44 = v8 - strlen(v22);
        if (v17)
        {
LABEL_38:
          if (v33)
          {
            uint64_t v45 = PrintFCore(a1, (uint64_t)", %*s%*u bytes, \"%.*s\"\n", v36, v37, v38, v39, v40, v41, v44);
          }
          else if (v17 > 0x10)
          {
            uint64_t v45 = PrintFCore(a1, (uint64_t)"\n%*.1H", v36, v37, v38, v39, v40, v41, (*(_DWORD *)(a2 + 8) + 1));
          }
          else
          {
            uint64_t v45 = PrintFCore(a1, (uint64_t)", %*s%*u bytes, %#H\n", v36, v37, v38, v39, v40, v41, v44);
          }
          goto LABEL_45;
        }
      }
      else
      {
        uint64_t v44 = v8 + 3;
        if (v17) {
          goto LABEL_38;
        }
      }
      uint64_t v45 = PrintFCore(a1, (uint64_t)", %*s%*u bytes\n", v36, v37, v38, v39, v40, v41, v44);
LABEL_45:
      uint64_t v16 = v45;
      if ((v45 & 0x80000000) == 0)
      {
        uint64_t v16 = (v45 + v42);
        if ((uint64_t)(v6 - (void)v19) > 1) {
          continue;
        }
      }
      return v16;
    }
  }
  return 0;
}

uint64_t PrintFWriteTXTRecord(uint64_t a1, char a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = &a4[a5];
  if (a2)
  {
    if (a5 < 1) {
      return 0;
    }
    uint64_t v12 = 0;
    uint64_t v13 = "";
    do
    {
      unsigned int v16 = *v9;
      unsigned int v14 = v9 + 1;
      uint64_t v15 = v16;
      if (v11 - v14 < (unint64_t)v16) {
        break;
      }
      uint64_t v17 = PrintFCore(a1, (uint64_t)"%s%.*s", a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)v13);
      if ((v17 & 0x80000000) != 0) {
        return v17;
      }
      uint64_t v12 = (v17 + v12);
      uint64_t v9 = &v14[v15];
      uint64_t v13 = " | ";
    }
    while (v9 < v11);
    return v12;
  }
  uint64_t v18 = (4 * a3);
  if ((unint64_t)a5 < 6 || (*(_DWORD *)(a4 + 1) == 1095590263 ? (BOOL v19 = a4[5] == 61) : (BOOL v19 = 0), !v19))
  {
    if (a5 >= 1)
    {
      LODWORD(v12) = 0;
      int v20 = a4;
      while (1)
      {
        unint64_t v21 = (unint64_t)&v20[*v20 + 1];
        if (v21 > (unint64_t)v11) {
          break;
        }
        uint64_t v17 = PrintFCore(a1, (uint64_t)"%*s%.*s\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
        if ((v17 & 0x80000000) != 0) {
          return v17;
        }
        uint64_t v12 = (v17 + v12);
        int v20 = (unsigned __int8 *)v21;
        if (v21 >= (unint64_t)v11) {
          goto LABEL_37;
        }
      }
      int v22 = PrintFCore(a1, (uint64_t)"%*s### TXT record length byte too big (%zu, %zu max)\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
LABEL_40:
      if (v22 >= 0) {
        int v28 = v12;
      }
      else {
        int v28 = 0;
      }
      return (v28 + v22);
    }
    goto LABEL_36;
  }
  if (&a4[*a4 + 1] == v11)
  {
    if (a5 >= 2)
    {
      LODWORD(v12) = 0;
      int v23 = a4 + 1;
      do
      {
        uint64_t v24 = &v31;
        uint64_t v25 = v23;
        do
        {
          int v27 = *v23++;
          int v26 = v27;
          if (v27 == 92)
          {
            if (v23 >= v11)
            {
              int v22 = PrintFCore(a1, (uint64_t)"%*s### bad TXT escape: %.*s\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
              goto LABEL_40;
            }
            int v23 = v25 + 2;
            LOBYTE(v26) = v25[1];
          }
          else if (v26 == 44)
          {
            break;
          }
          *v24++ = v26;
          uint64_t v25 = v23;
        }
        while (v23 < v11);
        uint64_t v17 = PrintFCore(a1, (uint64_t)"%*s%.*s\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
        if ((v17 & 0x80000000) != 0) {
          return v17;
        }
        uint64_t v12 = (v17 + v12);
      }
      while (v23 < v11);
      goto LABEL_37;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_37:
    if (a5 && *v9) {
      return v12;
    }
    int v22 = PrintFCore(a1, (uint64_t)"\n", a3, (uint64_t)a4, a5, a6, a7, a8, v30);
    goto LABEL_40;
  }
  return PrintFCore(a1, (uint64_t)"%*s### bad TXT record length byte (%zu, %zu expected)\n", a3, (uint64_t)a4, a5, a6, a7, a8, (4 * a3));
}

uint64_t PrintFWriteXMLEscaped(uint64_t (**a1)(char *, int64_t, void), char *__s, int64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = __s;
  if (a3 == -1) {
    a3 = strlen(__s);
  }
  if (a3 < 1) {
    return 0;
  }
  uint64_t v10 = 0;
  unint64_t v11 = &v8[a3];
  uint64_t v12 = v8;
  do
  {
    int v13 = *v12;
    if (v13 <= 38)
    {
      if (v13 == 34)
      {
        unsigned int v14 = "&quot;";
      }
      else
      {
        unsigned int v14 = "&amp;";
        if (v13 != 38)
        {
LABEL_12:
          ++v12;
          continue;
        }
      }
    }
    else
    {
      switch(v13)
      {
        case '\'':
          unsigned int v14 = "&#39;";
          break;
        case '<':
          unsigned int v14 = "&lt;";
          break;
        case '>':
          unsigned int v14 = "&gt;";
          break;
        default:
          goto LABEL_12;
      }
    }
    if (v12 != v8)
    {
      uint64_t v15 = (*a1)(v8, v12 - v8, a1);
      if ((v15 & 0x80000000) != 0) {
        return v15;
      }
      LODWORD(v10) = v15 + v10;
    }
    uint64_t v15 = PrintFCore((uint64_t)a1, (uint64_t)"%s", a3, a4, a5, a6, a7, a8, (uint64_t)v14);
    if ((v15 & 0x80000000) != 0) {
      return v15;
    }
    ++v12;
    uint64_t v10 = (v15 + v10);
    unsigned int v8 = v12;
  }
  while (v12 < v11);
  if (v12 != v8)
  {
    int v16 = (*a1)(v8, v12 - v8, a1);
    if (v16 >= 0) {
      int v17 = v10;
    }
    else {
      int v17 = 0;
    }
    return (v17 + v16);
  }
  return v10;
}

uint64_t _PrintFObfuscateInit()
{
  return RandomBytes(&gObfuscateKey, 0x10uLL);
}

void CUAppendF(id *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CUAppendV(id *a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = 0;
  VASPrintF(&v12, a3, a4);
  unint64_t v6 = (char *)v12;
  if (!v12) {
    return;
  }
  if (*(unsigned char *)v12)
  {
    id v7 = *a1;
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      *a1 = v7;
    }
    int v8 = *a2;
    id v11 = v7;
    if ((*a2 & 1) == 0)
    {
      v8 |= 1u;
LABEL_20:
      CFStringAppendCString((CFMutableStringRef)*a1, v6, 0x8000100u);
      free(v6);
      *a2 = v8;

      return;
    }
    if ((v8 & 2) != 0)
    {
      if ((v8 & 8) != 0) {
        [v7 appendString:@", "];
      }
      goto LABEL_20;
    }
    if ((v8 & 4) != 0)
    {
      uint64_t v10 = @": ";
    }
    else
    {
      if ((v8 & 8) == 0)
      {
LABEL_19:
        v8 |= 2u;
        goto LABEL_20;
      }
      uint64_t v10 = @", ";
    }
    objc_msgSend(v7, "appendString:", v10, v7);
    goto LABEL_19;
  }
  uint64_t v9 = v12;
  free(v9);
}

id NSPrintF_safe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = NSPrintV(a1, (uint64_t)&a9);
  return v9;
}

id NSPrintTypedObject(const char *a1, void *a2, int *a3)
{
  uint64_t v5 = a2;
  id v6 = 0;
  int v7 = -6735;
  int v8 = 0;
  uint64_t v9 = 0;
  switch(*a1)
  {
    case 'a':
      if (!strcasecmp(a1, "addr"))
      {
        uint64_t v9 = v5;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_80;
        }
        uint64_t v9 = v9;
        [(__CFString *)v9 bytes];
        uint64_t v105 = [(__CFString *)v9 length];
        *((void *)&v114 + 1) = v105;
        *(void *)&long long v114 = v105 - 2;
        unint64_t v113 = v114 >> 1;
        if (v113 < 4 || v113 == 7)
        {
          NSPrintF((uint64_t)"%.*a", v106, v107, v108, v109, v110, v111, v112, v105);
          goto LABEL_61;
        }
        goto LABEL_77;
      }
      if (strcasecmp(a1, "asbd")) {
        goto LABEL_50;
      }
      uint64_t v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_80;
      }
      if ([(__CFString *)v9 length] != 40) {
        goto LABEL_77;
      }
      uint64_t v9 = v9;
      uint64_t v155 = [(__CFString *)v9 bytes];
      NSPrintF((uint64_t)"%{asbd}", v10, v11, v12, v13, v14, v15, v16, v155);
      goto LABEL_61;
    case 'b':
      if (strcasecmp(a1, "base2")) {
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_78;
      }
      uint64_t v158 = [(__CFString *)v5 unsignedLongLongValue];
      NSPrintF((uint64_t)"%llb", v48, v49, v50, v51, v52, v53, v54, v158);
      goto LABEL_67;
    case 'c':
      if (strcasecmp(a1, "cec")) {
        goto LABEL_50;
      }
      uint64_t v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v9 = v9;
      uint64_t v62 = [(__CFString *)v9 bytes];
      [(__CFString *)v9 length];
      NSPrintF((uint64_t)"%{cec}", v63, v64, v65, v66, v67, v68, v69, v62);
      goto LABEL_61;
    case 'd':
      if (strcasecmp(a1, "dur")) {
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_78;
      }
      uint64_t v160 = [(__CFString *)v5 unsignedLongLongValue];
      NSPrintF((uint64_t)"%ll{dur}", v77, v78, v79, v80, v81, v82, v83, v160);
      goto LABEL_67;
    case 'e':
      if (!strcasecmp(a1, "err"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_78;
        }
        uint64_t v161 = [(__CFString *)v5 longValue];
        NSPrintF((uint64_t)"%#m", v115, v116, v117, v118, v119, v120, v121, v161);
      }
      else
      {
        if (strcasecmp(a1, "error")) {
          goto LABEL_50;
        }
        NSPrintF((uint64_t)"%{error}", v55, v56, v57, v58, v59, v60, v61, (uint64_t)v5);
      }
      goto LABEL_67;
    case 'f':
    case 'g':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'q':
    case 'r':
    case 'v':
    case 'w':
      goto LABEL_73;
    case 'h':
      if (strcasecmp(a1, "hex")) {
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_78;
      }
LABEL_48:
      NSPrintF((uint64_t)"%@", v84, v85, v86, v87, v88, v89, v90, (uint64_t)v5);
      goto LABEL_67;
    case 'o':
      if (!strcasecmp(a1, "obj")) {
        goto LABEL_48;
      }
      if (!strcasecmp(a1, "obj1"))
      {
        NSPrintF((uint64_t)"%##@", v91, v92, v93, v94, v95, v96, v97, (uint64_t)v5);
        goto LABEL_67;
      }
      if (strcasecmp(a1, "oneline"))
      {
        if (strcasecmp(a1, "onoff")) {
          goto LABEL_50;
        }
        unint64_t v24 = CFGetInt64(v5, 0);
        uint64_t v32 = "on";
        BOOL v33 = "off";
LABEL_35:
        if (!v24) {
          uint64_t v32 = v33;
        }
        NSPrintF((uint64_t)"%s", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v32);
        goto LABEL_67;
      }
      int v136 = NSPrintF((uint64_t)"%@", v98, v99, v100, v101, v102, v103, v104, (uint64_t)v5);
      if (v136)
      {
        id v137 = v136;
        uint64_t v138 = [v137 UTF8String];
        int v8 = NSPrintF((uint64_t)"%{sline}", v139, v140, v141, v142, v143, v144, v145, v138);

        goto LABEL_68;
      }
      id v6 = 0;
      int v8 = 0;
      uint64_t v9 = 0;
      int v7 = -6700;
      goto LABEL_73;
    case 'p':
      if (!strcasecmp(a1, "pid"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_78;
        }
        uint64_t v162 = [(__CFString *)v5 unsignedLongLongValue];
        NSPrintF((uint64_t)"%#{pid}", v122, v123, v124, v125, v126, v127, v128, v162);
      }
      else
      {
        if (strcasecmp(a1, "ptr"))
        {
LABEL_50:
          id v6 = 0;
          int v8 = 0;
          uint64_t v9 = 0;
          goto LABEL_51;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_78;
        }
        uint64_t v159 = [(__CFString *)v5 unsignedLongLongValue];
        NSPrintF((uint64_t)"%{ptr}", v70, v71, v72, v73, v74, v75, v76, v159);
      }
      goto LABEL_67;
    case 's':
      if (strcasecmp(a1, "sa")) {
        goto LABEL_50;
      }
      uint64_t v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v9 = v9;
      uint64_t v163 = [(__CFString *)v9 bytes];
      NSPrintF((uint64_t)"%##a", v129, v130, v131, v132, v133, v134, v135, v163);
      goto LABEL_61;
    case 't':
      if (strcasecmp(a1, "truefalse")) {
        goto LABEL_50;
      }
      unint64_t v24 = CFGetInt64(v5, 0);
      uint64_t v32 = "true";
      BOOL v33 = "false";
      goto LABEL_35;
    case 'u':
      if (strcasecmp(a1, "uuid")) {
        goto LABEL_50;
      }
      uint64_t v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_80:
        id v6 = 0;
        int v8 = 0;
        goto LABEL_79;
      }
      if ([(__CFString *)v9 length] != 16) {
        goto LABEL_77;
      }
      uint64_t v9 = v9;
      uint64_t v157 = [(__CFString *)v9 bytes];
      NSPrintF((uint64_t)"%#U", v41, v42, v43, v44, v45, v46, v47, v157);
      goto LABEL_61;
    case 'x':
      if (strcasecmp(a1, "xpc")) {
        goto LABEL_50;
      }
      NSPrintF((uint64_t)"%{xpc}", v34, v35, v36, v37, v38, v39, v40, (uint64_t)v5);
      goto LABEL_67;
    case 'y':
      if (strcasecmp(a1, "yesno")) {
        goto LABEL_50;
      }
      unint64_t v24 = CFGetInt64(v5, 0);
      uint64_t v32 = "yes";
      BOOL v33 = "no";
      goto LABEL_35;
    default:
      if (*a1 != 52) {
        goto LABEL_73;
      }
      if (strcasecmp(a1, "4cc")) {
        goto LABEL_50;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = v5;
        if ([(__CFString *)v9 length] != 4)
        {
LABEL_77:
          id v6 = 0;
          int v8 = 0;
          int v7 = -6743;
          goto LABEL_73;
        }
        uint64_t v9 = v9;
        uint64_t v156 = *(unsigned int *)[(__CFString *)v9 bytes];
        NSPrintF((uint64_t)"%C", v17, v18, v19, v20, v21, v22, v23, v156);
        int v8 = LABEL_61:;
        goto LABEL_69;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v164 = [(__CFString *)v5 unsignedIntValue];
        NSPrintF((uint64_t)"%C", v146, v147, v148, v149, v150, v151, v152, v164);
        int v8 = LABEL_67:;
LABEL_68:
        uint64_t v9 = 0;
LABEL_69:
        if (v8)
        {
          id v6 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];

          if (v6) {
            int v7 = 0;
          }
          else {
            int v7 = -6700;
          }
        }
        else
        {
          id v6 = 0;
LABEL_51:
          int v7 = -6717;
        }
        goto LABEL_73;
      }
LABEL_78:
      id v6 = 0;
      int v8 = 0;
      uint64_t v9 = 0;
LABEL_79:
      int v7 = -6756;
LABEL_73:
      if (a3) {
        *a3 = v7;
      }
      id v153 = v6;

      return v153;
  }
}

uint64_t AppendPrintF(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v13[0] = 0;
  v13[1] = &a9;
  uint64_t v10 = (const char *)*a1;
  if (!*a1) {
    uint64_t v10 = "";
  }
  uint64_t v11 = ASPrintF(v13, (uint64_t)"%s%V", a3, a4, a5, a6, a7, a8, (uint64_t)v10);
  if ((v11 & 0x80000000) == 0)
  {
    if (*a1) {
      free(*a1);
    }
    *a1 = v13[0];
  }
  return v11;
}

uint64_t CPrintF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF(a1, a2, a3, &a9);
}

uint64_t FPrintF(uint64_t (*a1)(const char *, uint64_t), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF((uint64_t (*)(const char *, uint64_t))FPrintFCallBack, a1, a2, (uint64_t)&a9, a5, a6, a7, a8);
}

size_t FPrintFCallBack(const void *a1, size_t __nitems, FILE *__stream)
{
  if (__stream) {
    fwrite(a1, 1uLL, __nitems, __stream);
  }
  return __nitems;
}

uint64_t VFPrintF(uint64_t (*a1)(const char *, uint64_t), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return VCPrintF((uint64_t (*)(const char *, uint64_t))FPrintFCallBack, a1, a2, a3, a5, a6, a7, a8);
}

uint64_t FPrintF_safe(uint64_t (*a1)(const char *, uint64_t), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF((uint64_t (*)(const char *, uint64_t))FPrintFCallBack, a1, a2, (uint64_t)&a9, a5, a6, a7, a8);
}

uint64_t VFPrintF_safe(uint64_t (*a1)(const char *, uint64_t), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return VCPrintF((uint64_t (*)(const char *, uint64_t))FPrintFCallBack, a1, a2, a3, a5, a6, a7, a8);
}

uint64_t MemPrintF(uint64_t (*a1)(const char *, uint64_t), uint64_t (*a2)(const char *, uint64_t), unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v10[4] = 0;
  v10[5] = 0;
  v10[0] = (uint64_t (*)(const char *, uint64_t))PrintFCallBackFixedString;
  v10[1] = a1;
  v10[2] = 0;
  v10[3] = a2;
  return PrintFCoreVAList(v10, a3, (uint64_t)&a9, a4, a5, a6, a7, a8);
}

uint64_t CUObfuscatedPtr(uint64_t a1)
{
  uint64_t v3 = a1;
  if (gObfuscateOnce != -1)
  {
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
    if (a1) {
      goto LABEL_3;
    }
LABEL_5:
    LOWORD(result) = 0;
    return (unsigned __int16)result;
  }
  if (!a1) {
    goto LABEL_5;
  }
LABEL_3:
  LOWORD(result) = SipHash(gObfuscateKey, (unsigned __int8 *)&v3, 8);
  return (unsigned __int16)result;
}

__CFString *CUPrintAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = @"NULL";
  switch(__ROR8__(a2, 1))
  {
    case 0:
      goto LABEL_14;
    case 1:
      NSPrintF((uint64_t)"%.2a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    case 2:
      if (a3) {
        NSPrintF((uint64_t)"%#.4a", a2, a3, a4, a5, a6, a7, a8, a1);
      }
      else {
        NSPrintF((uint64_t)"%.4a", a2, a3, a4, a5, a6, a7, a8, a1);
      }
      goto LABEL_13;
    case 3:
      if (a3) {
        NSPrintF((uint64_t)"%#.6a", a2, a3, a4, a5, a6, a7, a8, a1);
      }
      else {
        NSPrintF((uint64_t)"%.6a", a2, a3, a4, a5, a6, a7, a8, a1);
      }
      goto LABEL_13;
    case 4:
      NSPrintF((uint64_t)"%.8a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    case 8:
      NSPrintF((uint64_t)"%.16a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    default:
      if (a1)
      {
        NSPrintF((uint64_t)"<< ERROR: Bad Address Size: %zu >>", a2, a3, a4, a5, a6, a7, a8, a2);
LABEL_13:
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v9 = @"NULL";
      }
LABEL_14:
      return v9;
  }
}

id CUPrintASBD(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{asbd}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintDateCF(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return NSPrintF((uint64_t)"%{DateCF}", a3, a4, a5, a6, a7, a8, a9, *(uint64_t *)&a1);
}

id CUPrintDuration32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{dur}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintDurationDouble(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return NSPrintF((uint64_t)"%ll{dur}", a3, a4, a5, a6, a7, a8, a9, (unint64_t)a1);
}

id CUPrintErrorCode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%#m", a2, a3, a4, a5, a6, a7, a8, a1);
}

__CFString *CUPrintFlags(unint64_t a1, unsigned char *a2, char a3)
{
  id v6 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  int v7 = v6;
  if (a3) {
    [(__CFString *)v6 appendString:@"["];
  }
  int v8 = 0;
  char v9 = *a2;
  do
  {
    uint64_t v10 = a2 + 1;
    if ((a1 >> v9))
    {
      if (v8 <= 0) {
        uint64_t v11 = "";
      }
      else {
        uint64_t v11 = ", ";
      }
      [(__CFString *)v7 appendFormat:@"%s%s", v11, v10];
      ++v8;
    }
    uint64_t v12 = &v10[strlen(v10)];
    int v13 = *((unsigned __int8 *)v12 + 1);
    a2 = v12 + 1;
    char v9 = v13;
  }
  while (v13);
  if (a3) {
    [(__CFString *)v7 appendString:@"]"];
  }
  if (v7) {
    uint64_t v14 = v7;
  }
  else {
    uint64_t v14 = &stru_1EDD2ACE8;
  }
  uint64_t v15 = v14;

  return v15;
}

id CUPrintHex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = "%.3H";
  if (a4) {
    int v8 = "%H";
  }
  char v9 = NSPrintF((uint64_t)v8, a2, a3, a4, a5, a6, a7, a8, a1);
  return v9;
}

id CUPrintNSError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{error}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintNSObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%.*@", a2, a3, a4, a5, a6, a7, a8, a2);
}

id CUPrintNSObjectMasked(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{mask}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintNSObjectOneLine(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%##@", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintNSObjectOneLineEx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%##.*@", a2, a3, a4, a5, a6, a7, a8, a2);
}

id CUPrintSockAddr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%##a", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintText(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%*{text}", a2, a3, a4, a5, a6, a7, a8, a3);
}

id CUPrintTimeNow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 <= 2)
  {
    a1 = NSPrintF((uint64_t)off_1E55BFAD0[a1], a2, a3, a4, a5, a6, a7, a8, v8);
  }
  return (id)a1;
}

id CUPrintXPC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{xpc}", a2, a3, a4, a5, a6, a7, a8, a1);
}

uint64_t CryptoRandomKey(void *a1, size_t a2, char *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)a1, a2, a3, a4, a5, a6, a2, (uint64_t)a1);
}

unsigned char *RandomString(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  unsigned int bytes = 0;
  RandomBytes(&bytes, 4uLL);
  uint64_t v10 = bytes % (unint64_t)(a4 - a3 + 1) + a3;
  uint64_t v11 = a5;
  if (v10 >= 1)
  {
    unint64_t v12 = (unint64_t)&a5[v10];
    uint64_t v11 = a5;
    do
    {
      RandomBytes(&bytes, 4uLL);
      *v11++ = *(unsigned char *)(a1 + bytes % a2);
    }
    while ((unint64_t)v11 < v12);
  }
  *uint64_t v11 = 0;
  return a5;
}

uint64_t ScreenGetTypeID()
{
  if (gScreenInitOnce != -1) {
    dispatch_once_f(&gScreenInitOnce, 0, (dispatch_function_t)_ScreenGetTypeID);
  }
  return gScreenTypeID;
}

uint64_t _ScreenGetTypeID()
{
  uint64_t result = _CFRuntimeRegisterClass();
  gScreenCFTypeID TypeID = result;
  return result;
}

void _ScreenFinalize(void *a1)
{
  CFURLRef v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  uint64_t v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  uint64_t v4 = (const void *)a1[8];
  if (v4)
  {
    CFRelease(v4);
    a1[8] = 0;
  }
}

uint64_t ScreenCreate(uint64_t *a1, const __CFDictionary *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (gScreenInitOnce != -1) {
    dispatch_once_f(&gScreenInitOnce, 0, (dispatch_function_t)_ScreenGetTypeID);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 4294960568;
  }
  uint64_t v5 = Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  id v6 = (const __CFDictionary **)(Instance + 16);
  *(void *)(Instance + 64) = 0;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  CFObjectSetPropertyInt64((const void *)Instance, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, @"features", 0, 14);
  CFObjectSetPropertyInt64((const void *)v5, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, @"maxFPS", 0, 60);
  CFObjectSetPropertyInt64((const void *)v5, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, @"widthPixels", 0, 960);
  CFObjectSetPropertyInt64((const void *)v5, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, @"heightPixels", 0, 540);
  _ScreenSetProperty(v5, v7, @"uuid", v8, @"e5f7a68d-7b0f-4305-984b-974f677a150b");
  if (!a2) {
    goto LABEL_24;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(a2, @"edid", TypeID, 0);
  __CFString *v6 = TypedValue;
  if (TypedValue) {
    CFRetain(TypedValue);
  }
  unsigned int v21 = 0;
  int Int64 = CFDictionaryGetInt64(a2, @"features", (int *)&v21);
  if (!v21) {
    *(_DWORD *)(v5 + 24) = Int64;
  }
  int v12 = CFDictionaryGetInt64(a2, @"maxFPS", (int *)&v21);
  if (!v21) {
    *(_DWORD *)(v5 + 28) = v12;
  }
  int v13 = CFDictionaryGetInt64(a2, @"primaryInputDevice", (int *)&v21);
  if (!v21) {
    *(_DWORD *)(v5 + 56) = v13;
  }
  int v14 = CFDictionaryGetInt64(a2, @"widthPixels", (int *)&v21);
  if (!v21) {
    *(_DWORD *)(v5 + 40) = v14;
  }
  int v15 = CFDictionaryGetInt64(a2, @"heightPixels", (int *)&v21);
  if (!v21) {
    *(_DWORD *)(v5 + 44) = v15;
  }
  int v16 = CFDictionaryGetInt64(a2, @"widthPhysical", (int *)&v21);
  if (!v21) {
    *(_DWORD *)(v5 + 48) = v16;
  }
  int v17 = CFDictionaryGetInt64(a2, @"heightPhysical", (int *)&v21);
  if (!v21) {
    *(_DWORD *)(v5 + 52) = v17;
  }
  Value = (__CFString *)CFDictionaryGetValue(a2, @"uuid");
  if (Value
    && (unsigned int v21 = CFGetUUIDEx(Value, 0, (uint64_t)v22)) == 0
    && (snprintf(__str, 0x25uLL, "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", v22[0], v22[1], v22[2], v22[3], v22[4], v22[5], v22[6], v22[7], v22[8], v22[9], v22[10], v22[11], v22[12], v22[13], v22[14], v22[15]),
        CFStringRef v19 = CFStringCreateWithCString(0, __str, 0x8000100u),
        (*(void *)(v5 + 64) = v19) == 0))
  {
    unsigned int v21 = -6700;
    CFRelease((CFTypeRef)v5);
    return v21;
  }
  else
  {
LABEL_24:
    uint64_t result = 0;
    *a1 = v5;
  }
  return result;
}

uint64_t _ScreenSetProperty(uint64_t a1, int a2, CFTypeRef cf1, uint64_t a4, const __CFString *a5)
{
  if (CFEqual(cf1, @"edid"))
  {
    if (a5)
    {
      CFTypeID v8 = CFGetTypeID(a5);
      if (v8 == CFDataGetTypeID())
      {
        uint64_t v11 = *(const void **)(a1 + 16);
        uint64_t v9 = (const __CFString **)(a1 + 16);
        uint64_t v10 = v11;
LABEL_5:
        CFRetain(a5);
        goto LABEL_9;
      }
      return 4294960540;
    }
    int v14 = *(const void **)(a1 + 16);
    uint64_t v9 = (const __CFString **)(a1 + 16);
    uint64_t v10 = v14;
    goto LABEL_9;
  }
  if (CFEqual(cf1, @"features"))
  {
    int v12 = CFGetInt64(a5, 0);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 24) = v12;
    return result;
  }
  if (CFEqual(cf1, @"maxFPS"))
  {
    int v15 = CFGetInt64(a5, 0);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 28) = v15;
    return result;
  }
  if (CFEqual(cf1, @"platformLayer"))
  {
    uint64_t v10 = *(const void **)(a1 + 32);
    if (a5) {
      CFRetain(a5);
    }
    *(void *)(a1 + 32) = a5;
    if (!v10) {
      return 0;
    }
    goto LABEL_10;
  }
  if (CFEqual(cf1, @"widthPhysical"))
  {
    int v16 = CFGetInt64(a5, 0);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 48) = v16;
    return result;
  }
  if (CFEqual(cf1, @"heightPhysical"))
  {
    int v17 = CFGetInt64(a5, 0);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 52) = v17;
    return result;
  }
  if (CFEqual(cf1, @"widthPixels"))
  {
    int v18 = CFGetInt64(a5, 0);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 40) = v18;
    return result;
  }
  if (CFEqual(cf1, @"heightPixels"))
  {
    int v19 = CFGetInt64(a5, 0);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 44) = v19;
    return result;
  }
  if (CFEqual(cf1, @"primaryInputDevice"))
  {
    int v20 = CFGetInt64(a5, 0);
    uint64_t result = 0;
    *(_DWORD *)(a1 + 56) = v20;
    return result;
  }
  if (CFEqual(cf1, @"uuid"))
  {
    if (a5)
    {
      CFTypeID v21 = CFGetTypeID(a5);
      if (v21 == CFStringGetTypeID())
      {
        uint64_t v22 = *(const void **)(a1 + 64);
        uint64_t v9 = (const __CFString **)(a1 + 64);
        uint64_t v10 = v22;
        goto LABEL_5;
      }
      return 4294960540;
    }
    uint64_t v23 = *(const void **)(a1 + 64);
    uint64_t v9 = (const __CFString **)(a1 + 64);
    uint64_t v10 = v23;
LABEL_9:
    *uint64_t v9 = a5;
    if (!v10) {
      return 0;
    }
LABEL_10:
    CFRelease(v10);
    return 0;
  }
  return 4294960582;
}

CFNumberRef _ScreenCopyProperty(void *a1, int a2, CFTypeRef cf1, uint64_t a4, int *a5)
{
  if (CFEqual(cf1, @"edid"))
  {
    CFNumberRef v8 = (CFNumberRef)a1[2];
    if (v8)
    {
LABEL_3:
      CFRetain(v8);
LABEL_9:
      int v10 = 0;
      goto LABEL_10;
    }
    goto LABEL_31;
  }
  if (CFEqual(cf1, @"features"))
  {
    uint64_t v9 = a1 + 3;
LABEL_8:
    CFNumberRef v8 = CFNumberCreate(0, kCFNumberSInt32Type, v9);
    if (v8) {
      goto LABEL_9;
    }
    int v10 = -6728;
    goto LABEL_10;
  }
  if (CFEqual(cf1, @"maxFPS"))
  {
    uint64_t v9 = (char *)a1 + 28;
    goto LABEL_8;
  }
  if (a1[4] && CFEqual(cf1, @"platformLayer"))
  {
    CFNumberRef v8 = (CFNumberRef)a1[4];
    goto LABEL_3;
  }
  if (CFEqual(cf1, @"widthPhysical"))
  {
    uint64_t v9 = a1 + 6;
    goto LABEL_8;
  }
  if (CFEqual(cf1, @"heightPhysical"))
  {
    uint64_t v9 = (char *)a1 + 52;
    goto LABEL_8;
  }
  if (CFEqual(cf1, @"widthPixels"))
  {
    uint64_t v9 = a1 + 5;
    goto LABEL_8;
  }
  if (CFEqual(cf1, @"heightPixels"))
  {
    uint64_t v9 = (char *)a1 + 44;
    goto LABEL_8;
  }
  if (CFEqual(cf1, @"primaryInputDevice"))
  {
    uint64_t v9 = a1 + 7;
    goto LABEL_8;
  }
  if (!CFEqual(cf1, @"uuid"))
  {
    CFNumberRef v8 = 0;
LABEL_31:
    int v10 = -6714;
    goto LABEL_10;
  }
  CFNumberRef v8 = (CFNumberRef)a1[8];
  if (v8) {
    goto LABEL_3;
  }
  int v10 = -6745;
LABEL_10:
  if (a5) {
    *a5 = v10;
  }
  return v8;
}

__CFArray *ScreenCopyAllScreens(int *a1)
{
  CFMutableStringRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (!Mutable)
  {
    int v7 = -6728;
    if (!a1) {
      return Mutable;
    }
    goto LABEL_7;
  }
  pthread_mutex_lock(&gScreenLock);
  if (gScreenArray)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)gScreenArray);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)gScreenArray, i);
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }
  pthread_mutex_unlock(&gScreenLock);
  int v7 = 0;
  if (a1) {
LABEL_7:
  }
    *a1 = v7;
  return Mutable;
}

void *ScreenCopyMain(int *a1)
{
  value = 0;
  pthread_mutex_lock(&gScreenLock);
  if (gScreenArray)
  {
    if (CFArrayGetCount((CFArrayRef)gScreenArray) >= 1)
    {
      value = (void *)CFArrayGetValueAtIndex((CFArrayRef)gScreenArray, 0);
      CFRetain(value);
      if (value)
      {
        int v2 = 0;
        goto LABEL_9;
      }
    }
    if (gScreenArray) {
      goto LABEL_7;
    }
  }
  gScreenArray = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  if (gScreenArray)
  {
LABEL_7:
    int v2 = ScreenCreate((uint64_t *)&value, 0);
    if (!v2) {
      CFArrayAppendValue((CFMutableArrayRef)gScreenArray, value);
    }
  }
  else
  {
    int v2 = -6728;
  }
LABEL_9:
  pthread_mutex_unlock(&gScreenLock);
  if (a1) {
    *a1 = v2;
  }
  return value;
}

uint64_t ScreenRegister(uint64_t *a1)
{
  pthread_mutex_lock(&gScreenLock);
  CFMutableStringRef Mutable = (__CFArray *)gScreenArray;
  if (gScreenArray
    || (CFMutableStringRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]), (gScreenArray = (uint64_t)Mutable) != 0))
  {
    CFArrayAppendValue(Mutable, a1);
    if (gLogCategory_Screen <= 50
      && (gLogCategory_Screen != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_Screen, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_Screen, (uint64_t)"OSStatus ScreenRegister(ScreenRef)", 0x32u, (uint64_t)"Registered screen %@ %u x %u, %u FPS\n", v3, v4, v5, v6, a1[8]);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 4294960568;
  }
  pthread_mutex_unlock(&gScreenLock);
  return v7;
}

uint64_t ScreenDeregister(uint64_t *a1)
{
  pthread_mutex_lock(&gScreenLock);
  if (!gScreenArray) {
    goto LABEL_12;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)gScreenArray);
  CFIndex v3 = Count;
  if (Count >= 1)
  {
    unint64_t v4 = Count + 1;
    do
    {
      if (CFArrayGetValueAtIndex((CFArrayRef)gScreenArray, v4 - 2) == a1)
      {
        if (gLogCategory_Screen <= 50
          && (gLogCategory_Screen != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_Screen, 0x32u)))
        {
          LogPrintF((uint64_t)&gLogCategory_Screen, (uint64_t)"OSStatus ScreenDeregister(ScreenRef)", 0x32u, (uint64_t)"Deregistered screen %@ %u x %u\n", v5, v6, v7, v8, a1[8]);
        }
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)gScreenArray, v4 - 2);
        --v3;
      }
      --v4;
    }
    while (v4 > 1);
  }
  if (!v3)
  {
LABEL_12:
    if (gScreenArray)
    {
      CFRelease((CFTypeRef)gScreenArray);
      gScreenArray = 0;
    }
  }
  pthread_mutex_unlock(&gScreenLock);
  return 0;
}

uint64_t _ScreenStreamGetTypeID()
{
  uint64_t result = _CFRuntimeRegisterClass();
  gScreenStreamCFTypeID TypeID = result;
  return result;
}

void _ScreenStreamFinalize(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2)
  {
    ((void (*)(uint64_t))softLinkVTDecompressionSessionInvalidate[0])(v2);
    CFRelease((CFTypeRef)a1[7]);
    a1[7] = 0;
  }
  CFIndex v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
    a1[6] = 0;
  }
  unint64_t v4 = (const void *)a1[2];
  if (v4)
  {
    CFRelease(v4);
    a1[2] = 0;
  }
  uint64_t v5 = a1[9];
  if (v5)
  {
    ((void (*)(uint64_t))softLinkCAImageQueueInvalidate[0])(v5);
    CFRelease((CFTypeRef)a1[9]);
    a1[9] = 0;
  }
  uint64_t v6 = (const void *)a1[8];
  if (v6)
  {
    CFRelease(v6);
    a1[8] = 0;
  }
}

uint64_t initCAImageQueueInvalidate(uint64_t a1)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueInvalidate");
  softLinkCAImageQueueInvalidate[0] = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void *__QuartzCoreLibrary_block_invoke_12997()
{
  uint64_t result = dlopen("/System/Library/Frameworks/QuartzCore.framework/QuartzCore", 2);
  QuartzCoreLibrary_sLib_12993 = (uint64_t)result;
  return result;
}

uint64_t initVTDecompressionSessionInvalidate(uint64_t a1)
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_13000, "VTDecompressionSessionInvalidate");
  softLinkVTDecompressionSessionInvalidate[0] = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void *__VideoToolboxLibrary_block_invoke_13003()
{
  uint64_t result = dlopen("/System/Library/Frameworks/VideoToolbox.framework/VideoToolbox", 2);
  VideoToolboxLibrary_sLib_13000 = (uint64_t)result;
  return result;
}

uint64_t ScreenStreamCreate(void *a1)
{
  if (gScreenStreamInitOnce != -1) {
    dispatch_once_f(&gScreenStreamInitOnce, 0, (dispatch_function_t)_ScreenStreamGetTypeID);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 4294960568;
  }
  CFIndex v3 = (_OWORD *)Instance;
  uint64_t result = 0;
  v3[5] = 0u;
  v3[6] = 0u;
  v3[3] = 0u;
  v3[4] = 0u;
  v3[1] = 0u;
  v3[2] = 0u;
  *a1 = v3;
  return result;
}

uint64_t ScreenStreamSetFrameHook(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 80) = a2;
  *(void *)(result + 88) = a3;
  return result;
}

uint64_t _ScreenStreamSetProperty(uint64_t a1, int a2, CFTypeRef cf1, uint64_t a4, __CFString *a5)
{
  if (CFEqual(cf1, @"avcc"))
  {
    if (a5)
    {
      CFTypeID v8 = CFGetTypeID(a5);
      if (v8 == CFDataGetTypeID())
      {
        uint64_t v9 = *(__CFString **)(a1 + 16);
        if (v9 == a5) {
          return 0;
        }
        if (v9)
        {
          if (!CFEqual(a5, v9))
          {
            int v10 = *(const void **)(a1 + 16);
            CFRetain(a5);
            *(void *)(a1 + 16) = a5;
            if (v10) {
              CFRelease(v10);
            }
            goto LABEL_21;
          }
          return 0;
        }
        CFRetain(a5);
        *(void *)(a1 + 16) = a5;
LABEL_21:
        *(unsigned char *)(a1 + 41) = 1;
        return 0;
      }
    }
    return 4294960540;
  }
  if (CFEqual(cf1, @"platformLayer"))
  {
    uint64_t v11 = a5;
    getCALayerClass_13007();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFRetain(v11);
      int v12 = *(const void **)(a1 + 64);
      if (v12) {
        CFRelease(v12);
      }
      *(void *)(a1 + 64) = v11;

      return 0;
    }

    return 4294960540;
  }
  if (CFEqual(cf1, @"widthPhysical"))
  {
    int v13 = CFGetInt64(a5, 0);
    if (*(_DWORD *)(a1 + 32) == v13) {
      return 0;
    }
    *(_DWORD *)(a1 + 32) = v13;
    goto LABEL_21;
  }
  if (CFEqual(cf1, @"heightPhysical"))
  {
    int v14 = CFGetInt64(a5, 0);
    if (*(_DWORD *)(a1 + 36) == v14) {
      return 0;
    }
    *(_DWORD *)(a1 + 36) = v14;
    goto LABEL_21;
  }
  unsigned int v16 = 0;
  if (CFEqual(cf1, @"widthPixels"))
  {
    *(_DWORD *)(a1 + 24) = CFGetInt64(a5, (int *)&v16);
  }
  else
  {
    if (!CFEqual(cf1, @"heightPixels"))
    {
      if (!CFEqual(cf1, @"requireHardwareDecoder")) {
        return 4294960582;
      }
      *(unsigned char *)(a1 + 40) = CFGetInt64(a5, 0) != 0;
      return 0;
    }
    *(_DWORD *)(a1 + 28) = CFGetInt64(a5, (int *)&v16);
  }
  uint64_t result = v16;
  if (!v16) {
    return 0;
  }
  return result;
}

Class initCALayer_13024()
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  Class result = objc_getClass("CALayer");
  classCALayer_13026 = (uint64_t)result;
  getCALayerClass_13007 = (uint64_t (*)())CALayerFunction_13028;
  return result;
}

id CALayerFunction_13028()
{
  return (id)classCALayer_13026;
}

uint64_t ScreenStreamStart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 64))
  {
    uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueCreate[0])(1, 1, 17);
    *(void *)(a1 + 72) = v9;
    if (v9)
    {
      uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueSetFlags[0])(v9, 1, 1);
      uint64_t v11 = (void *)MEMORY[0x192FAA9B0](v10);
      int v12 = getCATransactionClass_13033;
      id v13 = *(id *)(a1 + 64);
      [(objc_class *)v12() begin];
      [(objc_class *)getCATransactionClass_13033() setDisableActions:1];
      [v13 setContents:*(void *)(a1 + 72)];
      [v13 setEdgeAntialiasingMask:0];

      [(objc_class *)getCATransactionClass_13033() commit];
      uint64_t v18 = 0;
      if (gLogCategory_ScreenStream <= 50)
      {
        if (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u)) {
          LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus ScreenStreamStart(ScreenStreamRef)", 0x32u, (uint64_t)"Screen stream started\n", v14, v15, v16, v17, v20);
        }
        return 0;
      }
      return v18;
    }
    uint64_t v18 = 4294960596;
  }
  else
  {
    uint64_t v18 = 4294960551;
  }
  if (gLogCategory_ScreenStream <= 90
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x5Au)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus ScreenStreamStart(ScreenStreamRef)", 0x5Au, (uint64_t)"### Start screen stream failed: %#m\n", a5, a6, a7, a8, v18);
  }
  ScreenStreamStop(a1, a2, a3, a4, a5, a6, a7, a8, v20);
  return v18;
}

void ScreenStreamStop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (gLogCategory_ScreenStream <= 50
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void ScreenStreamStop(ScreenStreamRef)", 0x32u, (uint64_t)"Screen stream stopping...\n", a5, a6, a7, a8, v12);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10)
  {
    ((void (*)(uint64_t))softLinkVTDecompressionSessionWaitForAsynchronousFrames[0])(v10);
    ((void (*)(uint64_t))softLinkVTDecompressionSessionInvalidate[0])(*(void *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 56));
    *(void *)(a1 + 56) = 0;
  }
  if (*(void *)(a1 + 72))
  {
    [(objc_class *)getCATransactionClass_13033() begin];
    [(objc_class *)getCATransactionClass_13033() setDisableActions:1];
    uint64_t v11 = *(void **)(a1 + 64);
    if (v11) {
      [v11 setContents:0];
    }
    [(objc_class *)getCATransactionClass_13033() commit];
    ((void (*)(uint64_t))softLinkCAImageQueueInvalidate[0])(*(void *)(a1 + 72));
    CFRelease(*(CFTypeRef *)(a1 + 72));
    *(void *)(a1 + 72) = 0;
  }
  if (gLogCategory_ScreenStream <= 50
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void ScreenStreamStop(ScreenStreamRef)", 0x32u, (uint64_t)"Screen stream stopped\n", a5, a6, a7, a8, a9);
  }
}

uint64_t initVTDecompressionSessionWaitForAsynchronousFrames(uint64_t a1)
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_13000, "VTDecompressionSessionWaitForAsynchronousFrames");
  softLinkVTDecompressionSessionWaitForAsynchronousFrames[0] = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

Class initCATransaction_13041()
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  Class result = objc_getClass("CATransaction");
  classCATransaction_13043 = (uint64_t)result;
  getCATransactionClass_13033 = (uint64_t (*)())CATransactionFunction_13045;
  return result;
}

id CATransactionFunction_13045()
{
  return (id)classCATransaction_13043;
}

uint64_t initCAImageQueueSetFlags(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueSetFlags");
  softLinkCAImageQueueSetFlags[0] = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initCAImageQueueCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueCreate");
  softLinkCAImageQueueCreate[0] = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t ScreenStreamProcessData(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8)
{
  int v11 = a3;
  CFTypeRef v50 = 0;
  uint64_t v51 = a3;
  int v49 = 0;
  uint64_t v48 = 0;
  long long v47 = 0u;
  memset(v46, 0, sizeof(v46));
  CFTypeRef cf = 0;
  if (!*(void *)(a1 + 48) || *(unsigned char *)(a1 + 41))
  {
    *(void *)&long long v43 = 0;
    CFDataRef v14 = *(const __CFData **)(a1 + 16);
    if (!v14 || !*(_DWORD *)(a1 + 24) || !*(_DWORD *)(a1 + 28))
    {
      uint64_t v22 = 4294960551;
      goto LABEL_39;
    }
    int BytePtr = CFDataGetBytePtr(v14);
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 16));
    if (gLogCategory_ScreenStream <= 40
      && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x28u)))
    {
      LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus _ScreenStreamEnsureDecoderSetUp(ScreenStreamRef)", 0x28u, (uint64_t)"Screen stream format change to %u x %x, avcc 0x%.3H\n", v16, v17, v18, v19, *(unsigned int *)(a1 + 24));
    }
    uint64_t v21 = softLinkFigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom(0, 1635148593, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), 1635148611, BytePtr, Length, 0, (uint64_t)&v43);
    if (v21) {
      goto LABEL_11;
    }
    uint64_t v23 = *(const void **)(a1 + 48);
    if (v23) {
      CFRelease(v23);
    }
    *(void *)(a1 + 48) = v43;
    ((void (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueSetSize[0])(*(void *)(a1 + 72), *(unsigned int *)(a1 + 24), *(unsigned int *)(a1 + 28));
    uint64_t v24 = *(void *)(a1 + 56);
    if (v24
      && !((unsigned int (*)(uint64_t, uint64_t))softLinkVTDecompressionSessionCanAcceptFormatDescription[0])(v24, *(void *)(a1 + 48)))
    {
      if (gLogCategory_ScreenStream <= 40
        && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x28u)))
      {
        LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus _ScreenStreamEnsureDecoderSetUp(ScreenStreamRef)", 0x28u, (uint64_t)"Screen stream rebuilding for format change\n", v25, v26, v27, v28, v42);
      }
      ((void (*)(uint64_t))softLinkVTDecompressionSessionWaitForAsynchronousFrames[0])(*(void *)(a1 + 56));
      ((void (*)(uint64_t))softLinkVTDecompressionSessionInvalidate[0])(*(void *)(a1 + 56));
      CFRelease(*(CFTypeRef *)(a1 + 56));
      *(void *)(a1 + 56) = 0;
    }
    *(unsigned char *)(a1 + 41) = 0;
  }
  if (!*(void *)(a1 + 56))
  {
    *(void *)&long long v43 = _ScreenStreamDecodeCompleted;
    *((void *)&v43 + 1) = a1;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (!Mutable)
    {
      uint64_t v22 = 4294960568;
      goto LABEL_39;
    }
    uint64_t v30 = Mutable;
    uint64_t v31 = (const void *)getkVTDecompressionPropertyKey_Usage[0]();
    CFDictionarySetInt64(v30, v31, 20);
    uint64_t v32 = (const void *)getkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder[0]();
    BOOL v33 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionarySetValue(v30, v32, (const void *)*MEMORY[0x1E4F1CFD0]);
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v34 = (const void *)getkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder[0]();
      CFDictionarySetValue(v30, v34, v33);
    }
    uint64_t v35 = (const void *)getkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder[0]();
    CFDictionarySetValue(v30, v35, (const void *)*MEMORY[0x1E4F1CFC8]);
    uint64_t v36 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionCreate[0])(0, *(void *)(a1 + 48), (uint64_t)v30, 0, (uint64_t)&v43, a1 + 56);
    CFRelease(v30);
    if (v36)
    {
      if (gLogCategory_ScreenStream <= 50
        && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u)))
      {
        LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus _ScreenStreamEnsureDecoderSetUp(ScreenStreamRef)", 0x32u, (uint64_t)"### Screen stream setup decoder failed...retrying with defaults: %#m\n", v37, v38, v39, v40, v36);
      }
      uint64_t v21 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionCreate[0])(0, *(void *)(a1 + 48), 0, 0, (uint64_t)&v43, a1 + 56);
      if (v21)
      {
LABEL_11:
        uint64_t v22 = v21;
        goto LABEL_39;
      }
    }
  }
  uint64_t v22 = softLinkCMBlockBufferCreateWithMemoryBlock(0, a2, v11, *MEMORY[0x1E4F1CFA0], 0, 0, v11, 0, (uint64_t)&v50);
  if (!v22)
  {
    ((void (*)(uint64_t@<X8>))getkCMTimeInvalid[0])((uint64_t)v46);
    ((void (*)(uint64_t@<X8>))getkCMTimeInvalid[0])((uint64_t)&v43);
    long long v47 = v43;
    uint64_t v48 = v44;
    softLinkCMClockMakeHostTimeFromSystemUnits(a4);
    *(_OWORD *)((char *)&v46[1] + 8) = v43;
    *((void *)&v46[2] + 1) = v44;
    uint64_t v22 = softLinkCMSampleBufferCreate(0, (int)v50, 1, 0, 0, *(void *)(a1 + 48), 1, 1, (uint64_t)v46, 1, (uint64_t)&v51, (uint64_t)&cf);
    CFRelease(v50);
    if (!v22)
    {
      uint64_t v22 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionDecodeFrame[0])(*(void *)(a1 + 56), (uint64_t)cf, 0, 0, (uint64_t)&v49);
      CFRelease(cf);
      if (!v22)
      {
        uint64_t v22 = 0;
        if ((v49 & 2) != 0) {
          ++*(_DWORD *)(a1 + 96);
        }
      }
    }
  }
LABEL_39:
  if (a6) {
    a6(a7);
  }
  if (v22
    && gLogCategory_ScreenStream <= 90
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x5Au)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus ScreenStreamProcessData(ScreenStreamRef, const uint8_t *, size_t, uint64_t, CFDictionaryRef, ScreenStreamCompletion_f, void *)", 0x5Au, (uint64_t)"### Screen stream process data failed: %#m\n", a5, (uint64_t)a6, a7, a8, v22);
  }
  return v22;
}

uint64_t initVTDecompressionSessionDecodeFrame(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v10 = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_13000, "VTDecompressionSessionDecodeFrame");
  softLinkVTDecompressionSessionDecodeFrame[0] = v10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v10)(a1, a2, a3, a4, a5);
}

uint64_t initCMSampleBufferCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (CoreMediaLibrary_sOnce != -1) {
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_40);
  }
  uint64_t v18 = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t))dlsym((void *)CoreMediaLibrary_sLib, "CMSampleBufferCreate");
  softLinkCMSampleBufferCreate = v18;
  return v18(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

void *__CoreMediaLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 2);
  CoreMediaLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initCMClockMakeHostTimeFromSystemUnits(uint64_t a1)
{
  if (CoreMediaLibrary_sOnce != -1) {
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_40);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)CoreMediaLibrary_sLib, "CMClockMakeHostTimeFromSystemUnits");
  softLinkCMClockMakeHostTimeFromSystemUnits = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

double initValkCMTimeInvalid@<D0>(uint64_t a1@<X8>)
{
  if (CoreMediaLibrary_sOnce != -1) {
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_40);
  }
  uint64_t v2 = (long long *)dlsym((void *)CoreMediaLibrary_sLib, "kCMTimeInvalid");
  if (v2)
  {
    long long v3 = *v2;
    qword_1E91CFAF0 = *((void *)v2 + 2);
    constantValkCMTimeInvalid = v3;
  }
  getkCMTimeInvalid[0] = (uint64_t (*)())kCMTimeInvalidFunction;
  double result = *(double *)&constantValkCMTimeInvalid;
  *(_OWORD *)a1 = constantValkCMTimeInvalid;
  *(void *)(a1 + 16) = qword_1E91CFAF0;
  return result;
}

double kCMTimeInvalidFunction@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)&constantValkCMTimeInvalid;
  *(_OWORD *)a1 = constantValkCMTimeInvalid;
  *(void *)(a1 + 16) = qword_1E91CFAF0;
  return result;
}

uint64_t initCMBlockBufferCreateWithMemoryBlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (CoreMediaLibrary_sOnce != -1) {
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_40);
  }
  uint64_t v17 = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t))dlsym((void *)CoreMediaLibrary_sLib, "CMBlockBufferCreateWithMemoryBlock");
  softLinkCMBlockBufferCreateWithMemoryBlock = v17;
  return v17(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t initVTDecompressionSessionCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v12 = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_13000, "VTDecompressionSessionCreate");
  softLinkVTDecompressionSessionCreate[0] = v12;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v12)(a1, a2, a3, a4, a5, a6);
}

uint64_t initValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder()
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_13000, "kVTVideoDecoderSpecification_EnableSandboxedVideoDecoder");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder = result;
  }
  else
  {
    uint64_t result = constantValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder;
  }
  getkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder[0] = kVTVideoDecoderSpecification_EnableSandboxedVideoDecoderFunction;
  return result;
}

uint64_t kVTVideoDecoderSpecification_EnableSandboxedVideoDecoderFunction()
{
  return constantValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder;
}

uint64_t initValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder()
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_13000, "kVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder = result;
  }
  else
  {
    uint64_t result = constantValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder;
  }
  getkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder[0] = kVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoderFunction;
  return result;
}

uint64_t kVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoderFunction()
{
  return constantValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder;
}

uint64_t initValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder()
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_13000, "kVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder = result;
  }
  else
  {
    uint64_t result = constantValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder;
  }
  getkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder[0] = kVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoderFunction;
  return result;
}

uint64_t kVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoderFunction()
{
  return constantValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder;
}

uint64_t initValkVTDecompressionPropertyKey_Usage()
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_13000, "kVTDecompressionPropertyKey_Usage");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkVTDecompressionPropertyKey_Usage = result;
  }
  else
  {
    uint64_t result = constantValkVTDecompressionPropertyKey_Usage;
  }
  getkVTDecompressionPropertyKey_Usage[0] = kVTDecompressionPropertyKey_UsageFunction;
  return result;
}

uint64_t kVTDecompressionPropertyKey_UsageFunction()
{
  return constantValkVTDecompressionPropertyKey_Usage;
}

uint64_t _ScreenStreamDecodeCompleted(uint64_t result, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a3;
  uint64_t v10 = result;
  if (a3)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_13:
    ++*(_DWORD *)(v10 + 96);
    if (!v9) {
      return result;
    }
    goto LABEL_14;
  }
  id v13 = *(void (**)(uint64_t, uint64_t, void))(result + 80);
  if (v13)
  {
    long long v19 = *(_OWORD *)a6;
    uint64_t v20 = *(void *)(a6 + 16);
    uint64_t v14 = ((uint64_t (*)(long long *))softLinkCMClockConvertHostTimeToSystemUnits[0])(&v19);
    v13(a5, v14, *(void *)(v10 + 88));
  }
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueRegisterCVImageBuffer[0])(*(void *)(v10 + 72), a5, 0);
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v15 = result;
  ((void (*)(uint64_t))softLinkCAImageQueueCollect[0])(*(void *)(v10 + 72));
  uint64_t v16 = *(void *)(v10 + 72);
  long long v19 = *(_OWORD *)a6;
  uint64_t v20 = *(void *)(a6 + 16);
  ((void (*)(long long *))softLinkCMTimeGetSeconds[0])(&v19);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))softLinkCAImageQueueInsertImage[0])(v16, 3, v15, 1, (uint64_t)_ScreenStreamImageReleased, v10, v17);
  if ((result & 1) == 0)
  {
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))softLinkCAImageQueueDeleteBuffer[0])(*(void *)(v10 + 72), v15);
LABEL_12:
    int v9 = -6700;
    if ((a4 & 2) != 0) {
      goto LABEL_13;
    }
    goto LABEL_3;
  }
  int v9 = 0;
  if ((a4 & 2) != 0) {
    goto LABEL_13;
  }
LABEL_3:
  if (!v9) {
    return result;
  }
LABEL_14:
  uint64_t v18 = (*(_DWORD *)(v10 + 100) + 1);
  *(_DWORD *)(v10 + 100) = v18;
  if (gLogCategory_ScreenStream <= 50)
  {
    if (gLogCategory_ScreenStream != -1) {
      return LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void _ScreenStreamDecodeCompleted(void *, void *, OSStatus, VTDecodeInfoFlags, CVImageBufferRef, CMTime, CMTime)", 0x32u, (uint64_t)"### Screen stream decode error (%u total): %#m\n", a5, a6, a7, a8, v18);
    }
    uint64_t result = _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u);
    if (result)
    {
      uint64_t v18 = *(unsigned int *)(v10 + 100);
      return LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void _ScreenStreamDecodeCompleted(void *, void *, OSStatus, VTDecodeInfoFlags, CVImageBufferRef, CMTime, CMTime)", 0x32u, (uint64_t)"### Screen stream decode error (%u total): %#m\n", a5, a6, a7, a8, v18);
    }
  }
  return result;
}

uint64_t initCAImageQueueDeleteBuffer(uint64_t a1, uint64_t a2)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  unint64_t v4 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueDeleteBuffer");
  softLinkCAImageQueueDeleteBuffer[0] = v4;
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initCAImageQueueInsertImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v14 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueInsertImage");
  softLinkCAImageQueueInsertImage[0] = v14;
  v15.n128_f64[0] = a7;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128))v14)(a1, a2, a3, a4, a5, a6, v15);
}

uint64_t _ScreenStreamImageReleased(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (_DWORD *)softLinkCAImageQueueGetReleasedImageInfo[0]();
  if (v5 && !*v5) {
    ++*(_DWORD *)(a3 + 104);
  }
  uint64_t v6 = *(void *)(a3 + 72);
  uint64_t v7 = softLinkCAImageQueueDeleteBuffer[0];
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(v6, a2);
}

uint64_t initCAImageQueueGetReleasedImageInfo()
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v0 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueGetReleasedImageInfo");
  softLinkCAImageQueueGetReleasedImageInfo[0] = v0;
  return v0();
}

uint64_t initCMTimeGetSeconds(long long *a1)
{
  if (CoreMediaLibrary_sOnce != -1) {
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_40);
  }
  softLinkCMTimeGetSeconds[0] = (uint64_t (*)())dlsym((void *)CoreMediaLibrary_sLib, "CMTimeGetSeconds");
  long long v3 = *a1;
  uint64_t v4 = *((void *)a1 + 2);
  return ((uint64_t (*)(long long *))softLinkCMTimeGetSeconds[0])(&v3);
}

uint64_t initCAImageQueueCollect(uint64_t a1)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueCollect");
  softLinkCAImageQueueCollect[0] = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t initCAImageQueueRegisterCVImageBuffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueRegisterCVImageBuffer");
  softLinkCAImageQueueRegisterCVImageBuffer[0] = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initCMClockConvertHostTimeToSystemUnits(long long *a1)
{
  if (CoreMediaLibrary_sOnce != -1) {
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_40);
  }
  softLinkCMClockConvertHostTimeToSystemUnits[0] = (uint64_t (*)())dlsym((void *)CoreMediaLibrary_sLib, "CMClockConvertHostTimeToSystemUnits");
  long long v3 = *a1;
  uint64_t v4 = *((void *)a1 + 2);
  return ((uint64_t (*)(long long *))softLinkCMClockConvertHostTimeToSystemUnits[0])(&v3);
}

uint64_t initVTDecompressionSessionCanAcceptFormatDescription(uint64_t a1, uint64_t a2)
{
  if (VideoToolboxLibrary_sOnce_12999 != -1) {
    dispatch_once(&VideoToolboxLibrary_sOnce_12999, &__block_literal_global_34);
  }
  uint64_t v4 = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_13000, "VTDecompressionSessionCanAcceptFormatDescription");
  softLinkVTDecompressionSessionCanAcceptFormatDescription[0] = v4;
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initCAImageQueueSetSize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12991 != -1) {
    dispatch_once(&QuartzCoreLibrary_sOnce_12991, &__block_literal_global_12992);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12993, "CAImageQueueSetSize");
  softLinkCAImageQueueSetSize[0] = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t initFigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (CoreMediaLibrary_sOnce != -1) {
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_40);
  }
  double v17 = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t))dlsym((void *)CoreMediaLibrary_sLib, "FigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom");
  softLinkFigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom = v17;
  return v17(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t SDPFindAttribute(char *a1, unint64_t a2, unsigned __int8 *a3, void *a4, void *a5, char **a6)
{
  uint64_t v21 = a1;
  char v20 = 0;
  uint64_t v18 = 0;
  long long v19 = 0;
  while (1)
  {
    uint64_t result = SDPGetNext(a1, a2, &v20, &v19, (unsigned __int8 **)&v18, &v21);
    if (result) {
      break;
    }
    if (v20 == 97 && v18 >= 1)
    {
      uint64_t v12 = 0;
      id v13 = v19;
      uint64_t v14 = &v19[v18];
      __n128 v15 = v19;
      while (*v15 != 58)
      {
        ++v15;
        --v12;
        if (v15 >= v14) {
          goto LABEL_15;
        }
      }
      uint64_t v16 = a3;
      while (v12)
      {
        int v17 = *v16;
        if (*v13 != v17) {
          goto LABEL_15;
        }
        ++v16;
        ++v13;
        ++v12;
        if (!v17) {
          goto LABEL_16;
        }
      }
      if (a3[v15 - v19]) {
        goto LABEL_15;
      }
LABEL_16:
      uint64_t result = 0;
      *a4 = v15 + 1;
      *a5 = v14 - (v15 + 1);
      break;
    }
LABEL_15:
    a1 = v21;
  }
  if (a6) {
    *a6 = v21;
  }
  return result;
}

uint64_t SDPGetNext(char *a1, unint64_t a2, unsigned char *a3, void *a4, unsigned __int8 **a5, void *a6)
{
  if ((unint64_t)a1 >= a2) {
    return 4294960569;
  }
  uint64_t v6 = a2 - (void)a1 - 2;
  if ((uint64_t)(a2 - (void)a1) < 2) {
    return 4294960553;
  }
  if (a1[1] != 61) {
    return 4294960554;
  }
  uint64_t v7 = a1 + 2;
  CFTypeID v8 = (unsigned __int8 *)(a1 + 2);
  if ((unint64_t)(a1 + 2) < a2)
  {
    CFTypeID v8 = (unsigned __int8 *)(a1 + 2);
    while (1)
    {
      int v9 = *v8;
      if (v9 == 10 || v9 == 13) {
        break;
      }
      ++v8;
      if (!--v6)
      {
        CFTypeID v8 = (unsigned __int8 *)a2;
        break;
      }
    }
  }
  char v11 = *a1;
  uint64_t v12 = (unsigned __int8 *)(v8 - v7);
  if ((unint64_t)v8 < a2)
  {
    unint64_t v13 = a2 - (void)v8;
    while (1)
    {
      int v14 = *v8;
      if (v14 != 13 && v14 != 10) {
        break;
      }
      ++v8;
      if (!--v13)
      {
        CFTypeID v8 = (unsigned __int8 *)a2;
        break;
      }
    }
  }
  uint64_t result = 0;
  *a3 = v11;
  *a4 = v7;
  *a5 = v12;
  *a6 = v8;
  return result;
}

uint64_t SDPFindMediaSection(char *a1, unint64_t a2, void *a3, void *a4, void *a5, unsigned __int8 **a6, void *a7)
{
  char v20 = a1;
  char v19 = 0;
  int v17 = 0;
  uint64_t v18 = 0;
  do
  {
    if (SDPGetNext(v20, a2, &v19, &v18, &v17, &v20)) {
      return 4294960569;
    }
  }
  while (v19 != 109);
  unint64_t v13 = v17;
  uint64_t v14 = v18;
  uint64_t v15 = v18 - 2;
  while (!SDPGetNext(v20, a2, &v19, &v18, &v17, &v20))
  {
    if (v19 == 109)
    {
      char v20 = (char *)(v18 - 2);
      break;
    }
  }
  if (a3) {
    *a3 = v15;
  }
  if (a4) {
    *a4 = v20;
  }
  if (a5) {
    *a5 = v14;
  }
  if (a6) {
    *a6 = v13;
  }
  uint64_t result = 0;
  if (a7) {
    *a7 = v20;
  }
  return result;
}

uint64_t SDPFindParameter(unsigned char *a1, unsigned char *a2, unsigned __int8 *a3, void *a4, void *a5, void *a6)
{
  uint64_t v12 = a2 - 1;
  uint64_t v13 = MEMORY[0x1E4F14390];
LABEL_2:
  while (2)
  {
    uint64_t v14 = a1;
    if (a1 < a2)
    {
      uint64_t v15 = a2 - a1;
      uint64_t v14 = a1;
      do
      {
        uint64_t v16 = *v14;
        if ((char)*v14 < 0)
        {
          if (!__maskrune(v16, 0x4000uLL)) {
            goto LABEL_10;
          }
        }
        else if ((*(_DWORD *)(v13 + 4 * v16 + 60) & 0x4000) == 0)
        {
          goto LABEL_10;
        }
        ++v14;
        --v15;
      }
      while (v15);
      uint64_t v14 = a2;
    }
LABEL_10:
    if (v14 == a2)
    {
      uint64_t v29 = 4294960569;
      uint64_t result = 4294960569;
      if (!a6) {
        return result;
      }
      goto LABEL_45;
    }
    if (v14 >= a2)
    {
      BOOL v17 = 0;
      goto LABEL_15;
    }
    if (*v14 == 61)
    {
      BOOL v17 = 1;
LABEL_15:
      uint64_t v18 = v14;
      goto LABEL_22;
    }
    uint64_t v19 = v12 - v14;
    uint64_t v18 = v14;
    while (v19)
    {
      int v20 = *++v18;
      --v19;
      if (v20 == 61) {
        goto LABEL_21;
      }
    }
    uint64_t v18 = a2;
LABEL_21:
    BOOL v17 = v18 < a2;
LABEL_22:
    uint64_t v21 = &v18[v17];
    if (v21 >= a2)
    {
      uint64_t v23 = 0;
      uint64_t v22 = v21;
    }
    else
    {
      uint64_t v22 = v21;
      while (*v22 != 59)
      {
        if (++v22 >= a2)
        {
          uint64_t v23 = 0;
          uint64_t v22 = a2;
          goto LABEL_29;
        }
      }
      uint64_t v23 = 1;
    }
LABEL_29:
    uint64_t v24 = v18 - v14;
    a1 = &v22[v23];
    uint64_t v25 = (unsigned char *)(v14 - v18);
    uint64_t v26 = a3;
    while (v25)
    {
      int v27 = *v26;
      if (*v14 != v27) {
        goto LABEL_2;
      }
      ++v26;
      ++v14;
      ++v25;
      if (!v27) {
        goto LABEL_40;
      }
    }
    if (a3[v24]) {
      int v28 = -1;
    }
    else {
      int v28 = 0;
    }
    if (v28) {
      continue;
    }
    break;
  }
LABEL_40:
  if (a4) {
    *a4 = v21;
  }
  if (a5) {
    *a5 = v22 - v21;
  }
  uint64_t v29 = 0;
  uint64_t result = 0;
  if (a6)
  {
LABEL_45:
    *a6 = a1;
    return v29;
  }
  return result;
}

uint64_t SDPFindSessionSection(char *a1, unint64_t a2, char **a3, void *a4, void *a5)
{
  uint64_t v14 = a1;
  char v13 = 0;
  uint64_t v12 = 0;
  while (!SDPGetNext(v14, a2, &v13, &v12, &v11, &v14))
  {
    if (v13 == 109)
    {
      uint64_t v14 = (char *)(v12 - 2);
      break;
    }
  }
  if (a3) {
    *a3 = a1;
  }
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v14;
  }
  return 0;
}

uint64_t SDPFindType(char *a1, unint64_t a2, unsigned __int8 a3, void *a4, void *a5, void *a6)
{
  uint64_t v15 = a1;
  unsigned __int8 v14 = 0;
  int v10 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  while (1)
  {
    uint64_t result = SDPGetNext(v15, a2, &v14, &v13, &v12, &v15);
    if (result) {
      break;
    }
    if (v14 == v10)
    {
      if (a4) {
        *a4 = v13;
      }
      uint64_t result = 0;
      if (a5) {
        *a5 = v12;
      }
      break;
    }
  }
  if (a6) {
    *a6 = v15;
  }
  return result;
}

uint64_t SDPGetNextAttribute(char *a1, unint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v22 = a1;
  char v21 = 0;
  uint64_t v19 = 0;
  int v20 = 0;
  do
    uint64_t result = SDPGetNext(v22, a2, &v21, &v20, (unsigned __int8 **)&v19, &v22);
  while (!result && v21 != 97);
  if (result) {
    goto LABEL_18;
  }
  unsigned __int8 v14 = v20;
  uint64_t v15 = &v20[v19];
  if (v19 < 1)
  {
    uint64_t v16 = 0;
    BOOL v17 = v20;
    if (!a3) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = 1;
    BOOL v17 = v20;
    while (*v17 != 58)
    {
      if (++v17 >= v15)
      {
        uint64_t v16 = 0;
        break;
      }
    }
    if (!a3) {
      goto LABEL_12;
    }
  }
  *a3 = v20;
LABEL_12:
  if (a4) {
    *a4 = v17 - v14;
  }
  uint64_t v18 = &v17[v16];
  if (a5) {
    *a5 = v18;
  }
  if (a6) {
    *a6 = v15 - v18;
  }
LABEL_18:
  if (a7) {
    *a7 = v22;
  }
  return result;
}

uint64_t SerialStreamGetTypeID()
{
  if (gSerialStreamInitOnce != -1) {
    dispatch_once_f(&gSerialStreamInitOnce, 0, (dispatch_function_t)_SerialStreamGetTypeID);
  }
  return gSerialStreamTypeID;
}

uint64_t _SerialStreamGetTypeID()
{
  uint64_t result = _CFRuntimeRegisterClass();
  gSerialStreamCFTypeID TypeID = result;
  return result;
}

void _SerialStreamFinalize(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 16);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 16) = 0;
  }
}

uint64_t SerialStreamCreate(uint64_t *a1)
{
  if (gSerialStreamInitOnce != -1) {
    dispatch_once_f(&gSerialStreamInitOnce, 0, (dispatch_function_t)_SerialStreamGetTypeID);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 4294960568;
  }
  uint64_t v3 = Instance;
  bzero((void *)(Instance + 24), 0x478uLL);
  uint64_t v4 = MEMORY[0x1E4F14428];
  *(void *)(v3 + 16) = MEMORY[0x1E4F14428];
  dispatch_retain(v4);
  uint64_t result = 0;
  *(_DWORD *)(v3 + 24) = -1;
  *(void *)(v3 + 104) = v3 + 96;
  *(void *)(v3 + 120) = v3 + 112;
  *a1 = v3;
  return result;
}

uint64_t SerialStreamSetConfig(uint64_t a1, void *a2)
{
  if (!*a2) {
    return 4294960592;
  }
  __strlcpy_chk();
  uint64_t result = 0;
  *(void *)(a1 + 1156) = a2[1];
  return result;
}

void SerialStreamSetDispatchQueue(uint64_t a1, NSObject *a2)
{
  if (a2) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F14428];
  }
  dispatch_retain(v3);
  uint64_t v4 = *(NSObject **)(a1 + 16);
  if (v4) {
    dispatch_release(v4);
  }
  *(void *)(a1 + 16) = v3;
}

void SerialStreamInvalidate(void *a1)
{
  CFRetain(a1);
  uint64_t v2 = a1[2];
  dispatch_async_f(v2, a1, (dispatch_function_t)_SerialStreamInvalidate);
}

void _SerialStreamInvalidate(const void *a1)
{
  _SerialStreamErrorHandler((uint64_t)a1, 4294960573);
  CFRelease(a1);
}

void _SerialStreamErrorHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    dispatch_source_cancel(v4);
    if (*(unsigned char *)(a1 + 40))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 32));
      *(unsigned char *)(a1 + 40) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v5 = *(NSObject **)(a1 + 80);
  if (v5)
  {
    dispatch_source_cancel(v5);
    if (*(unsigned char *)(a1 + 88))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 80));
      *(unsigned char *)(a1 + 88) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(a1 + 80));
    *(void *)(a1 + 80) = 0;
  }
  while (1)
  {
    uint64_t v6 = *(void **)(a1 + 96);
    if (!v6) {
      break;
    }
    v6[5] = 0;
    _SerialStreamReadCompleted(a1, v6, a2);
  }
  while (1)
  {
    uint64_t v7 = *(uint64_t **)(a1 + 112);
    if (!v7) {
      break;
    }
    _SerialStreamWriteCompleted(a1, v7, a2);
  }
  CFTypeID v8 = *(void **)(a1 + 48);
  if (v8)
  {
    free(v8);
    *(void *)(a1 + 48) = 0;
  }
}

void _SerialStreamReadCompleted(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void, void, void))a2;
  *(void *)(a1 + 96) = *(void *)a2;
  if (!v4) {
    *(void *)(a1 + 104) = a1 + 96;
  }
  (*((void (**)(uint64_t, void, void, void))a2 + 7))(a3, *((void *)a2 + 6), *((void *)a2 + 5), *((void *)a2 + 8));
  CFRelease(*((CFTypeRef *)a2 + 1));
  free(a2);
}

void _SerialStreamWriteCompleted(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *(void *)(a1 + 112) = *a2;
  if (!v4) {
    *(void *)(a1 + 120) = a1 + 112;
  }
  uint64_t v5 = (void (*)(uint64_t, uint64_t))a2[6];
  if (v5) {
    v5(a3, a2[7]);
  }
  CFRelease((CFTypeRef)a2[1]);
  free(a2);
}

uint64_t SerialStreamRead(dispatch_queue_t *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    size_t v12 = 72;
  }
  else {
    size_t v12 = a3 + 72;
  }
  uint64_t v13 = malloc_type_malloc(v12, 0x375A5518uLL);
  if (!v13) {
    return 4294960568;
  }
  unsigned __int8 v14 = v13;
  CFRetain(a1);
  v14[1] = a1;
  *((_DWORD *)v14 + 4) = 0;
  v14[3] = a2;
  v14[4] = a3;
  uint64_t v15 = (char *)(v14 + 9);
  if (a4) {
    uint64_t v15 = a4;
  }
  v14[5] = 0;
  v14[6] = v15;
  v14[7] = a5;
  v14[8] = a6;
  dispatch_async_f(a1[2], v14, (dispatch_function_t)_SerialStreamRead);
  return 0;
}

void _SerialStreamRead(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1[1];
  *a1 = 0;
  **(void **)(v8 + 104) = a1;
  *(void *)(v8 + 104) = a1;
  uint64_t v9 = _SerialStreamEnsureSetUp(v8, a2, a3, a4, a5, a6, a7, a8);
  if (v9)
  {
    _SerialStreamErrorHandler(v8, v9);
  }
  else
  {
    _SerialStreamReadHandler(v8);
  }
}

uint64_t _SerialStreamEnsureSetUp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)(a1 + 24) & 0x80000000) == 0) {
    return 0;
  }
  if (gLogCategory_SerialUtils <= 20
    && (gLogCategory_SerialUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_SerialUtils, 0x14u)))
  {
    LogPrintF((uint64_t)&gLogCategory_SerialUtils, (uint64_t)"OSStatus _SerialStreamEnsureSetUp(SerialStreamRef)", 0x14u, (uint64_t)"Opening serial port '%s'\n", a5, a6, a7, a8, a1 + 128);
  }
  memset(&v28, 0, sizeof(v28));
  uint64_t v9 = 1;
  while (1)
  {
    int v10 = open((const char *)(a1 + 128), 131078);
    *(_DWORD *)(a1 + 24) = v10;
    if ((v10 & 0x80000000) == 0) {
      break;
    }
    if (*__error())
    {
      uint64_t v15 = *__error();
      if (!v15) {
        break;
      }
    }
    else
    {
      uint64_t v15 = 4294960596;
    }
    if (gLogCategory_SerialUtils <= 50
      && (gLogCategory_SerialUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_SerialUtils, 0x32u)))
    {
      uint64_t v25 = v9;
      uint64_t v26 = v15;
      LogPrintF((uint64_t)&gLogCategory_SerialUtils, (uint64_t)"OSStatus _SerialStreamEnsureSetUp(SerialStreamRef)", 0x32u, (uint64_t)"### Open '%s' error %d of 10: %#m\n", v11, v12, v13, v14, a1 + 128);
    }
    if (v15 != 16) {
      goto LABEL_48;
    }
    usleep(0x186A0u);
    uint64_t v9 = (v9 + 1);
    if (v9 == 10)
    {
      uint64_t v9 = 10;
      goto LABEL_20;
    }
  }
  if (v9 < 2) {
    goto LABEL_24;
  }
LABEL_20:
  if (gLogCategory_SerialUtils <= 50
    && (gLogCategory_SerialUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_SerialUtils, 0x32u)))
  {
    uint64_t v25 = v9;
    LogPrintF((uint64_t)&gLogCategory_SerialUtils, (uint64_t)"OSStatus _SerialStreamEnsureSetUp(SerialStreamRef)", 0x32u, (uint64_t)"Opened '%s' after %d attempts\n", v11, v12, v13, v14, a1 + 128);
  }
LABEL_24:
  if (ioctl(*(_DWORD *)(a1 + 24), 0x2000740DuLL))
  {
    if (!*__error()) {
      goto LABEL_47;
    }
    uint64_t v15 = *__error();
    if (v15) {
      goto LABEL_48;
    }
  }
  int v16 = *(_DWORD *)(a1 + 24);
  int v17 = fcntl(v16, 3, 0, v25, v26);
  if (fcntl(v16, 4, v17 | 4u) == -1)
  {
    if (!*__error()) {
      goto LABEL_47;
    }
    uint64_t v15 = *__error();
    if (v15) {
      goto LABEL_48;
    }
  }
  memset(&v28, 0, sizeof(v28));
  if (tcgetattr(*(_DWORD *)(a1 + 24), &v28))
  {
    if (!*__error()) {
      goto LABEL_47;
    }
    uint64_t v15 = *__error();
    if (v15) {
      goto LABEL_48;
    }
  }
  int8x16_t v18 = vandq_s8(*(int8x16_t *)&v28.c_iflag, (int8x16_t)xmmword_18E416F90);
  *(int8x16_t *)&v28.c_iflag = v18;
  int v19 = *(_DWORD *)(a1 + 1160);
  if (v19 == 2)
  {
    tcflag_t v20 = v28.c_cflag | 0x38800;
  }
  else
  {
    tcflag_t v20 = v28.c_cflag & 0xFFFFFFFFFFFC77FFLL | 0x8800;
    if (v19 == 1) {
      v28.c_iflag = v18.i64[0] | 0xE00;
    }
  }
  v28.c_cflag = v20 & 0xFFFFFFFFFFFF88FFLL | 0x4300;
  v28.c_lflag &= 0xFFFFFFFFFFFFFE75;
  *(_WORD *)&v28.c_cc[16] = 0;
  if (tcsetattr(*(_DWORD *)(a1 + 24), 0, &v28))
  {
    if (!*__error()) {
      goto LABEL_47;
    }
    uint64_t v15 = *__error();
    if (v15) {
      goto LABEL_48;
    }
  }
  uint64_t v27 = *(int *)(a1 + 1156);
  if (!ioctl(*(_DWORD *)(a1 + 24), 0x80085402uLL, &v27))
  {
LABEL_44:
    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14478], *(int *)(a1 + 24), 0, *(dispatch_queue_t *)(a1 + 16));
    *(void *)(a1 + 32) = v21;
    if (v21)
    {
      ++*(_DWORD *)(a1 + 28);
      CFRetain((CFTypeRef)a1);
      dispatch_set_context(*(dispatch_object_t *)(a1 + 32), (void *)a1);
      dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 32), (dispatch_function_t)_SerialStreamReadHandler);
      dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 32), (dispatch_function_t)_SerialStreamCancelHandler);
      *(unsigned char *)(a1 + 40) = 1;
      dispatch_source_t v22 = dispatch_source_create(MEMORY[0x1E4F144B0], *(int *)(a1 + 24), 0, *(dispatch_queue_t *)(a1 + 16));
      *(void *)(a1 + 80) = v22;
      if (v22)
      {
        ++*(_DWORD *)(a1 + 28);
        CFRetain((CFTypeRef)a1);
        dispatch_set_context(*(dispatch_object_t *)(a1 + 80), (void *)a1);
        dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 80), (dispatch_function_t)_SerialStreamWriteHandler);
        dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 80), (dispatch_function_t)_SerialStreamCancelHandler);
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 88) = 1;
        return v15;
      }
    }
    goto LABEL_47;
  }
  if (*__error())
  {
    uint64_t v15 = *__error();
    if (v15) {
      goto LABEL_48;
    }
    goto LABEL_44;
  }
LABEL_47:
  uint64_t v15 = 4294960596;
LABEL_48:
  if (!*(_DWORD *)(a1 + 28))
  {
    int v23 = *(_DWORD *)(a1 + 24);
    if ((v23 & 0x80000000) == 0)
    {
      if (close(v23) && *__error()) {
        __error();
      }
      *(_DWORD *)(a1 + 24) = -1;
    }
  }
  _SerialStreamErrorHandler(a1, v15);
  return v15;
}

void _SerialStreamReadHandler(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (!v2)
  {
LABEL_74:
    if (!*(unsigned char *)(a1 + 40))
    {
      *(unsigned char *)(a1 + 40) = 1;
      uint64_t v31 = *(NSObject **)(a1 + 32);
      dispatch_suspend(v31);
    }
    return;
  }
  uint64_t v3 = (void *)(a1 + 64);
  while (1)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    int64_t v5 = *(void *)(a1 + 72);
    int v6 = *(_DWORD *)(v2 + 16);
    if ((v6 & 0x10000) != 0) {
      break;
    }
    if (v5 == v4)
    {
      size_t v7 = *(void *)(v2 + 40);
    }
    else
    {
      uint64_t v13 = *(void *)(v2 + 40);
      if (*(void *)(v2 + 32) - v13 >= (unint64_t)(v5 - v4)) {
        size_t v14 = v5 - v4;
      }
      else {
        size_t v14 = *(void *)(v2 + 32) - v13;
      }
      memcpy((void *)(*(void *)(v2 + 48) + v13), (const void *)(*(void *)(a1 + 48) + v4), v14);
      *(void *)(a1 + 64) += v14;
      size_t v7 = *(void *)(v2 + 40) + v14;
      *(void *)(v2 + 40) = v7;
    }
    if (v7 >= *(void *)(v2 + 24)) {
      goto LABEL_50;
    }
    size_t v15 = *(void *)(v2 + 32) - v7;
    int v16 = (void *)(*(void *)(v2 + 48) + v7);
    while (1)
    {
      ssize_t v17 = read(*(_DWORD *)(a1 + 24), v16, v15);
      if ((v17 & 0x8000000000000000) == 0)
      {
        unsigned int v18 = 0;
        goto LABEL_44;
      }
      if (!*__error()) {
        break;
      }
      unsigned int v18 = *__error();
      if (v18 != 4) {
        goto LABEL_44;
      }
    }
    unsigned int v18 = -6700;
LABEL_44:
    if (v17) {
      uint64_t v24 = v18;
    }
    else {
      uint64_t v24 = 35;
    }
    if (v24 == 35) {
      goto LABEL_70;
    }
    if (v24) {
      goto LABEL_81;
    }
    unint64_t v25 = *(void *)(v2 + 40) + v17;
    *(void *)(v2 + 40) = v25;
    if (v25 >= *(void *)(v2 + 24)) {
      goto LABEL_50;
    }
LABEL_51:
    uint64_t v2 = *(void *)(a1 + 96);
    if (!v2) {
      goto LABEL_74;
    }
  }
  uint64_t v8 = *(unsigned char **)(a1 + 48);
  unint64_t v9 = (unint64_t)&v8[v4];
  if ((v6 & 4) != 0)
  {
    if (v5 > v4)
    {
      int v19 = &v8[v4];
      while (1)
      {
        int v20 = *v19;
        if (v20 == 7 || v20 == 13) {
          break;
        }
        if (++v19 >= &v8[v5]) {
          goto LABEL_32;
        }
      }
      void *v3 = v19 - v8 + 1;
      *(void *)(v2 + 48) = v9;
      if (*v19 == 7) {
        uint64_t v12 = (uint64_t)&v19[-v9 + 1];
      }
      else {
        uint64_t v12 = (uint64_t)&v19[-v9];
      }
      goto LABEL_42;
    }
  }
  else
  {
    if ((v6 & 2) != 0) {
      int v10 = 13;
    }
    else {
      int v10 = 10;
    }
    uint64_t v11 = memchr(&v8[v4], v10, v5 - v4);
    if (v11)
    {
      void *v3 = v11 - v8 + 1;
      if ((unint64_t)v11 > v9 && *(v11 - 1) == 13) {
        --v11;
      }
      *(void *)(v2 + 48) = v9;
      uint64_t v12 = (uint64_t)&v11[-v9];
LABEL_42:
      *(void *)(v2 + 40) = v12;
LABEL_50:
      _SerialStreamReadCompleted(a1, (void *)v2, 0);
      goto LABEL_51;
    }
  }
LABEL_32:
  if (v5 != v4)
  {
    uint64_t v23 = *(void *)(a1 + 56);
    size_t v22 = v23 - v5;
    if (v23 != v5) {
      goto LABEL_56;
    }
    if (v4)
    {
      memmove(v8, &v8[v4], v5 - v4);
      size_t v22 = *(void *)(a1 + 64);
      int64_t v5 = *(void *)(a1 + 72) - v22;
      *(void *)(a1 + 64) = 0;
      *(void *)(a1 + 72) = v5;
      uint64_t v8 = *(unsigned char **)(a1 + 48);
      goto LABEL_56;
    }
LABEL_53:
    if (v8)
    {
      uint64_t v24 = 4294960533;
    }
    else
    {
      *(void *)(a1 + 56) = 4096;
      uint64_t v26 = malloc_type_malloc(0x1000uLL, 0x151C163AuLL);
      *(void *)(a1 + 48) = v26;
      if (v26)
      {
        uint64_t v8 = v26;
        size_t v22 = *(void *)(a1 + 56);
        int64_t v5 = *(void *)(a1 + 72);
        goto LABEL_56;
      }
      uint64_t v24 = 4294960568;
    }
LABEL_81:
    _SerialStreamErrorHandler(a1, v24);
    return;
  }
  void *v3 = 0;
  *(void *)(a1 + 72) = 0;
  size_t v22 = *(void *)(a1 + 56);
  if (!v22) {
    goto LABEL_53;
  }
  int64_t v5 = 0;
LABEL_56:
  uint64_t v27 = &v8[v5];
  while (1)
  {
    ssize_t v28 = read(*(_DWORD *)(a1 + 24), v27, v22);
    if ((v28 & 0x8000000000000000) == 0)
    {
      unsigned int v29 = 0;
      goto LABEL_63;
    }
    if (!*__error()) {
      break;
    }
    unsigned int v29 = *__error();
    if (v29 != 4) {
      goto LABEL_63;
    }
  }
  unsigned int v29 = -6700;
LABEL_63:
  if (v28) {
    uint64_t v24 = v29;
  }
  else {
    uint64_t v24 = 35;
  }
  if (v24 != 35)
  {
    if (v24) {
      goto LABEL_81;
    }
    *(void *)(a1 + 72) += v28;
    goto LABEL_51;
  }
LABEL_70:
  if (*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(a1 + 40) = 0;
    uint64_t v30 = *(NSObject **)(a1 + 32);
    dispatch_resume(v30);
  }
}

void _SerialStreamWriteHandler(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (!v2)
  {
LABEL_24:
    if (!*(unsigned char *)(a1 + 88))
    {
      *(unsigned char *)(a1 + 88) = 1;
      uint64_t v8 = *(NSObject **)(a1 + 80);
      dispatch_suspend(v8);
    }
    return;
  }
  while (1)
  {
    do
    {
      ssize_t v3 = writev(*(_DWORD *)(a1 + 24), *(const iovec **)(v2 + 40), *(_DWORD *)(v2 + 32));
      if ((v3 & 0x8000000000000000) == 0)
      {
        unsigned int v4 = 0;
        break;
      }
      if (!*__error())
      {
        unsigned int v4 = -6700;
        break;
      }
      unsigned int v4 = *__error();
    }
    while (v4 == 4);
    if (v3) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 35;
    }
    if (v5 == 35) {
      goto LABEL_20;
    }
    if (v5) {
      goto LABEL_18;
    }
    uint64_t updated = UpdateIOVec((uint64_t **)(v2 + 40), (int *)(v2 + 32), v3);
    if (updated != 35) {
      break;
    }
LABEL_16:
    uint64_t v2 = *(void *)(a1 + 112);
    if (!v2) {
      goto LABEL_24;
    }
  }
  uint64_t v5 = updated;
  if (!updated)
  {
    _SerialStreamWriteCompleted(a1, (uint64_t *)v2, 0);
    goto LABEL_16;
  }
LABEL_18:
  if (!v5) {
    goto LABEL_24;
  }
  if (v5 == 35)
  {
LABEL_20:
    if (*(unsigned char *)(a1 + 88))
    {
      *(unsigned char *)(a1 + 88) = 0;
      size_t v7 = *(NSObject **)(a1 + 80);
      dispatch_resume(v7);
    }
    return;
  }
  _SerialStreamErrorHandler(a1, v5);
}

void _SerialStreamCancelHandler(_DWORD *cf)
{
  int v2 = cf[7] - 1;
  cf[7] = v2;
  if (!v2)
  {
    int v3 = cf[6];
    if ((v3 & 0x80000000) == 0)
    {
      if (close(v3) && *__error()) {
        __error();
      }
      cf[6] = -1;
    }
  }
  CFRelease(cf);
}

uint64_t SerialStreamReadLine(dispatch_queue_t *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc_type_malloc(0x48uLL, 0xB2CA33D3uLL);
  if (!v8) {
    return 4294960568;
  }
  unint64_t v9 = v8;
  CFRetain(a1);
  *((void *)v9 + 1) = a1;
  *((_DWORD *)v9 + 4) = a2 | 0x10000;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *((void *)v9 + 7) = a3;
  *((void *)v9 + 8) = a4;
  dispatch_async_f(a1[2], v9, (dispatch_function_t)_SerialStreamRead);
  return 0;
}

uint64_t SerialStreamReadLineSync(dispatch_queue_t *a1, int a2, void *a3, void *a4)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  if (dsema)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    LODWORD(v10) = SerialStreamReadLine(a1, a2, (uint64_t)_SerialStreamReadLineSyncCompletion, (uint64_t)&dsema);
    if (!v10)
    {
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      *a3 = v11;
      if (a4) {
        *a4 = v12;
      }
    }
    if (dsema) {
      dispatch_release(dsema);
    }
  }
  else
  {
    LODWORD(v10) = -6700;
  }
  return v10;
}

intptr_t _SerialStreamReadLineSyncCompletion(int a1, const void *a2, size_t a3, uint64_t a4)
{
  if (a1)
  {
    int v6 = 0;
  }
  else
  {
    uint64_t v8 = malloc_type_malloc(a3 + 1, 0x5B67A339uLL);
    int v6 = v8;
    if (v8)
    {
      if (a3) {
        memcpy(v8, a2, a3);
      }
      a1 = 0;
      v6[a3] = 0;
    }
    else
    {
      a1 = -6728;
    }
  }
  *(_DWORD *)(a4 + 8) = a1;
  *(void *)(a4 + 16) = v6;
  *(void *)(a4 + 24) = a3;
  unint64_t v9 = *(NSObject **)a4;
  return dispatch_semaphore_signal(v9);
}

uint64_t SerialStreamReadSync(dispatch_queue_t *a1, uint64_t a2, uint64_t a3, char *a4, void *a5)
{
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  if (!dsema) {
    return 4294960596;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t result = SerialStreamRead(a1, a2, a3, a4, (uint64_t)_SerialStreamReadSyncCompletion, (uint64_t)&dsema);
  LODWORD(v12) = result;
  if (!result)
  {
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t result = v12;
    if (a5)
    {
      if (!v12) {
        *a5 = v14;
      }
    }
  }
  if (dsema)
  {
    dispatch_release(dsema);
    return v12;
  }
  return result;
}

intptr_t _SerialStreamReadSyncCompletion(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a4 + 8) = a1;
  *(void *)(a4 + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)a4);
}

uint64_t SerialStreamWrite(dispatch_queue_t *a1, char a2, char *a3, int a4, uint64_t a5, uint64_t a6)
{
  int v8 = a4;
  unint64_t v9 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = malloc_type_malloc(0x40uLL, 0xBB4D53ADuLL);
    if (!v11) {
      return 4294960568;
    }
LABEL_14:
    v11[8] = v8;
    *((void *)v11 + 5) = v9;
    CFRetain(a1);
    *((void *)v11 + 1) = a1;
    *((void *)v11 + 6) = a5;
    *((void *)v11 + 7) = a6;
    dispatch_async_f(a1[2], v11, (dispatch_function_t)_SerialStreamWrite);
    return 0;
  }
  if (a4 >= 1)
  {
    uint64_t v12 = a4;
    uint64_t v13 = (uint64_t *)(a3 + 8);
    size_t v14 = 64;
    uint64_t v15 = a4;
    do
    {
      uint64_t v16 = *v13;
      v13 += 2;
      v14 += v16;
      --v15;
    }
    while (v15);
    ssize_t v17 = malloc_type_malloc(v14, 0x313BACC5uLL);
    if (!v17) {
      return 4294960568;
    }
    uint64_t v11 = v17;
    uint64_t v18 = 0;
    int v19 = (size_t *)(v9 + 8);
    do
    {
      size_t v20 = *v19;
      memcpy((char *)v11 + v18 + 64, (const void *)*(v19 - 1), *v19);
      v18 += v20;
      v19 += 2;
      --v12;
    }
    while (v12);
    goto LABEL_13;
  }
  dispatch_source_t v21 = malloc_type_malloc(0x40uLL, 0x313BACC5uLL);
  if (v21)
  {
    uint64_t v11 = v21;
    uint64_t v18 = 0;
LABEL_13:
    *((void *)v11 + 2) = v11 + 16;
    *((void *)v11 + 3) = v18;
    unint64_t v9 = (char *)(v11 + 4);
    int v8 = 1;
    goto LABEL_14;
  }
  return 4294960568;
}

void _SerialStreamWrite(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1[1];
  *a1 = 0;
  **(void **)(v8 + 120) = a1;
  *(void *)(v8 + 120) = a1;
  uint64_t v9 = _SerialStreamEnsureSetUp(v8, a2, a3, a4, a5, a6, a7, a8);
  if (v9)
  {
    _SerialStreamErrorHandler(v8, v9);
  }
  else
  {
    _SerialStreamWriteHandler(v8);
  }
}

uint64_t SerialStreamWriteSync(dispatch_queue_t *a1, char *a2, int a3)
{
  uint64_t v8 = 0;
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  if (dsema)
  {
    LODWORD(v8) = SerialStreamWrite(a1, 0, a2, a3, (uint64_t)_SerialStreamWriteSyncCompletion, (uint64_t)&dsema);
    if (!v8) {
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (dsema) {
      dispatch_release(dsema);
    }
  }
  else
  {
    LODWORD(v8) = -6700;
  }
  return v8;
}

intptr_t _SerialStreamWriteSyncCompletion(int a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = a1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)a2);
}

uint64_t _SHA3_Block(uint64_t *a1, void *a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *a2 ^ *a1;
  uint64_t v4 = a2[1] ^ a1[1];
  uint64_t v5 = a2[2] ^ a1[2];
  uint64_t v79 = a2[3] ^ a1[3];
  uint64_t v78 = a2[4] ^ a1[4];
  uint64_t v76 = a2[5] ^ a1[5];
  uint64_t v74 = a2[6] ^ a1[6];
  uint64_t v77 = a2[7] ^ a1[7];
  uint64_t v6 = a1[9];
  uint64_t v75 = a2[8] ^ a1[8];
  uint64_t v7 = a1[10];
  uint64_t v8 = a1[11];
  uint64_t v10 = a1[12];
  uint64_t v9 = a1[13];
  uint64_t v12 = a1[14];
  uint64_t v11 = a1[15];
  uint64_t v13 = a1[16];
  uint64_t v14 = a1[17];
  uint64_t v16 = a1[18];
  uint64_t v15 = a1[19];
  uint64_t v18 = a1[20];
  uint64_t v17 = a1[21];
  uint64_t v19 = a1[22];
  uint64_t v20 = a1[23];
  uint64_t v21 = a1[24];
  do
  {
    uint64_t v72 = v8;
    uint64_t v71 = v20;
    uint64_t v22 = v74 ^ v4 ^ v8 ^ v13 ^ v17;
    uint64_t v73 = v14;
    uint64_t v23 = v6 ^ v78 ^ v12 ^ v15 ^ v21;
    uint64_t v24 = v23 ^ __ROR8__(v22, 63);
    uint64_t v25 = v75 ^ v79 ^ v9 ^ v16 ^ v20;
    uint64_t v26 = v22 ^ __ROR8__(v25, 63);
    uint64_t v27 = v76 ^ v3 ^ v7 ^ v11 ^ v18;
    uint64_t v28 = v25 ^ __ROR8__(v27, 63);
    uint64_t v29 = v77 ^ v5 ^ v10 ^ v14 ^ v19;
    uint64_t v30 = v27 ^ __ROR8__(v29, 63);
    uint64_t v31 = v28 ^ v21;
    uint64_t v32 = v29 ^ __ROR8__(v23, 63);
    uint64_t v33 = v32 ^ v16;
    uint64_t v34 = __ROR8__(v31, 50) & ~__ROR8__(v32 ^ v16, 43);
    uint64_t v35 = v24 ^ v3;
    uint64_t v36 = v32 ^ v79;
    uint64_t v79 = v35 & ~__ROR8__(v31, 50) ^ __ROR8__(v33, 43);
    uint64_t v37 = v26 ^ v10;
    uint64_t v38 = __ROR8__(v33, 43) & ~__ROR8__(v26 ^ v10, 21);
    uint64_t v39 = v26 ^ v5;
    uint64_t v69 = v34 ^ __ROR8__(v37, 21);
    uint64_t v70 = __ROR8__(v37, 21) & ~__ROR8__(v30 ^ v74, 20);
    uint64_t v40 = v24 ^ v76;
    uint64_t v41 = v30 ^ v4;
    uint64_t v42 = v2;
    uint64_t v43 = v38 ^ __ROR8__(v30 ^ v74, 20);
    uint64_t v44 = v24 ^ v7;
    uint64_t v45 = v24 ^ v11;
    uint64_t v46 = v24 ^ v18;
    uint64_t v47 = v28 ^ v78;
    uint64_t v48 = v28 ^ v6;
    uint64_t v49 = __ROR8__(v28 ^ v6, 44);
    uint64_t v78 = __ROR8__(v30 ^ v74, 20) & ~v35 ^ __ROR8__(v31, 50);
    uint64_t v50 = v30 ^ v72;
    uint64_t v51 = v30 ^ v13;
    uint64_t v52 = v26 ^ v19;
    uint64_t v53 = v30 ^ v17;
    uint64_t v54 = v26 ^ v77;
    uint64_t v55 = v26 ^ v73;
    uint64_t v56 = v32 ^ v75;
    uint64_t v57 = v32 ^ v9;
    uint64_t v58 = v32 ^ v71;
    uint64_t v59 = v28 ^ v12;
    uint64_t v60 = v28 ^ v15;
    uint64_t v61 = __ROR8__(v57, 39);
    uint64_t v74 = __ROR8__(v51, 19) & ~__ROR8__(v44, 61) ^ __ROR8__(v48, 44);
    uint64_t v77 = __ROR8__(v52, 3) & ~__ROR8__(v51, 19) ^ __ROR8__(v44, 61);
    uint64_t v75 = __ROR8__(v36, 36) & ~__ROR8__(v52, 3) ^ __ROR8__(v51, 19);
    uint64_t v76 = __ROR8__(v44, 61) & ~__ROR8__(v48, 44) ^ __ROR8__(v36, 36);
    uint64_t v6 = v49 & ~__ROR8__(v36, 36) ^ __ROR8__(v52, 3);
    uint64_t v62 = __ROR8__(v46, 46) & ~__ROR8__(v60, 56) ^ v61;
    uint64_t v9 = __ROR8__(v41, 63) & ~__ROR8__(v46, 46) ^ __ROR8__(v60, 56);
    uint64_t v63 = v61 & ~__ROR8__(v54, 58);
    uint64_t v8 = __ROR8__(v60, 56) & ~v61 ^ __ROR8__(v54, 58);
    uint64_t v64 = __ROR8__(v54, 58);
    uint64_t v7 = v63 ^ __ROR8__(v41, 63);
    uint64_t v12 = v64 & ~__ROR8__(v41, 63) ^ __ROR8__(v46, 46);
    uint64_t v14 = __ROR8__(v58, 8) & ~__ROR8__(v55, 49) ^ __ROR8__(v50, 54);
    uint64_t result = __ROR8__(v55, 49) & ~__ROR8__(v50, 54) ^ __ROR8__(v40, 28);
    uint64_t v4 = v43;
    uint64_t v16 = __ROR8__(v47, 37) & ~__ROR8__(v58, 8) ^ __ROR8__(v55, 49);
    uint64_t v11 = __ROR8__(v50, 54) & ~__ROR8__(v40, 28) ^ __ROR8__(v47, 37);
    uint64_t v15 = __ROR8__(v40, 28) & ~__ROR8__(v47, 37) ^ __ROR8__(v58, 8);
    uint64_t v20 = __ROR8__(v39, 2) & ~__ROR8__(v53, 62) ^ __ROR8__(v45, 23);
    uint64_t v19 = __ROR8__(v53, 62) & ~__ROR8__(v45, 23) ^ __ROR8__(v59, 25);
    uint64_t v5 = v69;
    uint64_t v66 = __ROR8__(v59, 25) & ~__ROR8__(v56, 9);
    uint64_t v17 = __ROR8__(v45, 23) & ~__ROR8__(v59, 25) ^ __ROR8__(v56, 9);
    uint64_t v3 = v70 ^ *(uint64_t *)((char *)&kSHA3RoundConstants + v42) ^ v35;
    uint64_t v18 = v66 ^ __ROR8__(v39, 2);
    uint64_t v67 = __ROR8__(v56, 9) & ~__ROR8__(v39, 2);
    uint64_t v10 = v62;
    uint64_t v13 = result;
    uint64_t v21 = v67 ^ __ROR8__(v53, 62);
    uint64_t v2 = v42 + 8;
  }
  while (v42 != 184);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v69;
  a1[3] = v79;
  a1[4] = v78;
  a1[5] = v76;
  a1[6] = v74;
  a1[7] = v77;
  a1[8] = v75;
  a1[9] = v6;
  a1[10] = v7;
  a1[11] = v8;
  a1[12] = v10;
  a1[13] = v9;
  a1[14] = v12;
  a1[15] = v11;
  a1[16] = result;
  a1[17] = v14;
  a1[18] = v16;
  a1[19] = v15;
  a1[20] = v18;
  a1[21] = v17;
  a1[22] = v19;
  a1[23] = v20;
  a1[24] = v21;
  return result;
}

uint64_t HMAC_SHA1_Init(CC_SHA1_CTX *c, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 < 0x41)
  {
    if (!a3)
    {
LABEL_7:
      memset(&data[v3], 54, 64 - v3);
      memset((char *)&c[1] + v3, 92, 64 - v3);
      goto LABEL_8;
    }
  }
  else
  {
    CC_SHA1_Init(c);
    CC_SHA1_Update(c, a2, v3);
    a2 = md;
    CC_SHA1_Final(md, c);
    unint64_t v3 = 20;
  }
  uint64_t v6 = 0;
  do
  {
    unsigned __int8 v7 = a2[v6];
    data[v6] = v7 ^ 0x36;
    *((unsigned char *)&c[1].h0 + v6++) = v7 ^ 0x5C;
  }
  while (v3 != v6);
  if (v3 <= 0x3F) {
    goto LABEL_7;
  }
LABEL_8:
  CC_SHA1_Init(c);
  return CC_SHA1_Update(c, data, 0x40u);
}

uint64_t HMAC_SHA1_Final(CC_SHA1_CTX *c, unsigned __int8 *md)
{
  CC_SHA1_Final(md, c);
  CC_SHA1_Init(c);
  CC_SHA1_Update(c, &c[1], 0x40u);
  CC_SHA1_Update(c, md, 0x14u);
  return CC_SHA1_Final(md, c);
}

void *PBKDF2_HMAC_SHA1(char *__s, size_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  size_t v7 = a2;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a2 == -1) {
    size_t v7 = strlen(__s);
  }
  if (a4 == -1) {
    LODWORD(a4) = strlen(a3);
  }
  uint64_t v9 = 0;
  int data = 0x1000000;
  memset(&c, 0, sizeof(c));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v10 = 32;
  do
  {
    HMAC_SHA1_Init(&c, (unsigned __int8 *)__s, v7);
    CC_SHA1_Update(&c, a3, a4);
    CC_SHA1_Update(&c, &data, 4u);
    HMAC_SHA1_Final(&c, __src);
    for (int i = 1; i != 4096; ++i)
    {
      HMAC_SHA1_Init(&c, (unsigned __int8 *)__s, v7);
      if (i == 1) {
        uint64_t v12 = __src;
      }
      else {
        uint64_t v12 = md;
      }
      CC_SHA1_Update(&c, v12, 0x14u);
      HMAC_SHA1_Final(&c, md);
      for (uint64_t j = 0; j != 20; ++j)
        __src[j] ^= md[j];
    }
    if (v10 >= 0x14) {
      size_t v14 = 20;
    }
    else {
      size_t v14 = v10;
    }
    uint64_t result = memcpy((void *)(a5 + v9), __src, v14);
    v9 += v14;
    v10 -= v14;
    uint64_t v16 = 3;
    do
    {
      if (v16 == -1) {
        break;
      }
      __int16 v17 = ++md[v16-- - 4];
    }
    while ((v17 & 0x100) != 0);
  }
  while (v10);
  return result;
}

uint64_t srp6_client_respond(uint64_t a1, void **a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *a2;
  if (!*a2)
  {
    uint64_t v5 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      uint64_t v5 = malloc_allocator;
      default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
    }
    uint64_t v4 = (void *)((uint64_t (*)(uint64_t, uint64_t (*)()))*v5)(32, v5[2]);
    if (v4)
    {
      void *v4 = &cstr_empty_string;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 1;
      v4[3] = v5;
    }
    *a2 = v4;
  }
  cstr_set_length((uint64_t)v4, **(_DWORD **)(a1 + 144));
  (*(void (**)(void, void))(*(void *)(a1 + 144) + 32))(**a2, *(void *)(a1 + 104));
  (*(void (**)(uint64_t, void, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, **a2, *((int *)*a2 + 2));
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, *(void *)(a1 + 104) + 416, *(void *)(*(void *)(a1 + 144) + 8));
  return 0;
}

uint64_t srp6_client_verify(uint64_t a1, const void *a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  (*(void (**)(unsigned char *, uint64_t))(*(void *)(a1 + 144) + 32))(__s1, *(void *)(a1 + 104) + 208);
  if (**(_DWORD **)(a1 + 144) != a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, a2, a3);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t srp6a_client_key(uint64_t a1, uint64_t *a2, const void *a3, int a4)
{
  LODWORD(v4) = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  memset(v27, 0, sizeof(v27));
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v27);
  uint64_t v8 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    uint64_t v8 = malloc_allocator;
    default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
  }
  uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v8)(32, v8[2]);
  unint64_t v10 = (void *)v9;
  if (v9)
  {
    *(void *)uint64_t v9 = &cstr_empty_string;
    *(void *)(v9 + 8) = 0;
    *(_DWORD *)(v9 + 16) = 1;
    *(void *)(v9 + 24) = v8;
  }
  BigIntegerToCstr(*(void *)(a1 + 16), v9);
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v27, *v10, *((int *)v10 + 2));
  uint64_t v11 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(a1 + 4) & 2) != 0) {
    BigIntegerToCstrEx(v11, (const void **)v10, *((_DWORD *)v10 + 2));
  }
  else {
    BigIntegerToCstr(v11, (uint64_t)v10);
  }
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v27, *v10, *((int *)v10 + 2));
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v30, v27);
  cstr_free((uint64_t)v10);
  LODWORD(v28[0]) = 0;
  CCBigNumFromData();
  if (!MEMORY[0x192FA8910]()) {
    goto LABEL_23;
  }
  int v12 = CCBigNumBitCount();
  int v13 = v12 + 7;
  if (v12 < -7) {
    int v13 = v12 + 14;
  }
  int v14 = v13 >> 3;
  if (v13 >> 3 < (int)v4) {
    goto LABEL_23;
  }
  memset(v28, 0, sizeof(v28));
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v28);
  uint64_t v15 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    uint64_t v15 = malloc_allocator;
    default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
  }
  uint64_t v16 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v15)(32, v15[2]);
  __int16 v17 = (void *)v16;
  if (v16)
  {
    *(void *)uint64_t v16 = &cstr_empty_string;
    *(void *)(v16 + 8) = 0;
    *(_DWORD *)(v16 + 16) = 1;
    *(void *)(v16 + 24) = v15;
  }
  uint64_t v18 = *(void *)(a1 + 56);
  if ((*(unsigned char *)(a1 + 4) & 2) == 0)
  {
    BigIntegerToCstr(v18, (uint64_t)v17);
    (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v28, *v17, *((int *)v17 + 2));
LABEL_20:
    uint64_t v4 = (int)v4;
    (*(void (**)(_OWORD *, const void *, void))(*(void *)(a1 + 144) + 24))(v28, a3, (int)v4);
    goto LABEL_21;
  }
  BigIntegerToCstrEx(v18, (const void **)v17, v14);
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v28, *v17, *((int *)v17 + 2));
  int v19 = v14 - v4;
  if (v14 <= (int)v4) {
    goto LABEL_20;
  }
  size_t v20 = v19;
  uint64_t v4 = (int)v4;
  memcpy((void *)(*v17 + v19), a3, (int)v4);
  bzero((void *)*v17, v20);
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v28, *v17, v14);
LABEL_21:
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v31, v28);
  int v29 = 0;
  *(void *)(a1 + 72) = CCBigNumFromData();
  (*(void (**)(void, const void *, uint64_t))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104), a3, v4);
  int v29 = 0;
  uint64_t v21 = CCBigNumFromData();
  if ((MEMORY[0x192FA8900](v21, *(void *)(a1 + 16)) & 0x80000000) == 0
    || !MEMORY[0x192FA8910](v21, 0))
  {
    CCBigNumFree();
    cstr_clear_free((uint64_t)v17);
LABEL_23:
    uint64_t v22 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }
  BigIntegerFromInt();
  *(void *)(a1 + 80) = BigIntegerFromInt();
  CCBigNumSub();
  CCBigNumMul();
  CCBigNumAdd();
  CCBigNumMod();
  CCBigNumMul();
  CCBigNumAdd();
  CCBigNumModExp();
  CCBigNumFree();
  CCBigNumFree();
  BigIntegerToCstr(*(void *)(a1 + 80), (uint64_t)v17);
  uint64_t v24 = *(void *)(a1 + 144);
  if (*(void *)(v24 + 8) == 40)
  {
    t_mgf1(*(void *)(a1 + 104) + 416, (const void *)*v17, *((_DWORD *)v17 + 2));
  }
  else
  {
    (*(void (**)(_OWORD *))(v24 + 16))(v28);
    (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v28, *v17, *((int *)v17 + 2));
    (*(void (**)(uint64_t, _OWORD *))(*(void *)(a1 + 144) + 32))(*(void *)(a1 + 104) + 416, v28);
  }
  cstr_clear_free((uint64_t)v17);
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104), *(void *)(a1 + 104) + 416, *(void *)(*(void *)(a1 + 144) + 8));
  uint64_t v25 = *(void *)(a1 + 88);
  if (*(int *)(v25 + 8) >= 1) {
    (*(void (**)(void, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104), *(void *)v25);
  }
  if (a2)
  {
    uint64_t v26 = *a2;
    if (!*a2)
    {
      uint64_t v26 = cstr_new();
      *a2 = v26;
    }
    cstr_setn(v26, (const void *)(*(void *)(a1 + 104) + 416), *(_DWORD *)(*(void *)(a1 + 144) + 8));
  }
  uint64_t v22 = 0;
LABEL_24:
  CCBigNumFree();
  return v22;
}

uint64_t srp6_client_genpub(uint64_t *a1, uint64_t *a2)
{
  CCBigNumBitCount();
  if (a2)
  {
    uint64_t v4 = (void *)*a2;
    if (!*a2)
    {
      uint64_t v5 = (uint64_t (**)())default_alloc;
      if (!default_alloc)
      {
        uint64_t v5 = malloc_allocator;
        default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
      }
      uint64_t v6 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v5)(32, v5[2]);
      uint64_t v4 = (void *)v6;
      if (v6)
      {
        *(void *)uint64_t v6 = &cstr_empty_string;
        *(void *)(v6 + 8) = 0;
        *(_DWORD *)(v6 + 16) = 1;
        *(void *)(v6 + 24) = v5;
      }
      *a2 = v6;
    }
  }
  else
  {
    size_t v7 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      size_t v7 = malloc_allocator;
      default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
    }
    uint64_t v8 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v7)(32, v7[2]);
    uint64_t v4 = (void *)v8;
    if (v8)
    {
      *(void *)uint64_t v8 = &cstr_empty_string;
      *(void *)(v8 + 8) = 0;
      *(_DWORD *)(v8 + 16) = 1;
      *(void *)(v8 + 24) = v7;
    }
  }
  int v9 = CCBigNumBitCount();
  int v10 = v9 + 7;
  if (v9 < -7) {
    int v10 = v9 + 14;
  }
  cstr_set_length((uint64_t)v4, v10 >> 3);
  RandomBytes((void *)*v4, 0x20uLL);
  a1[8] = CCBigNumFromData();
  CCBigNumBitCount();
  CCBigNumAddI();
  a1[7] = BigIntegerFromInt();
  CCBigNumModExp();
  BigIntegerToCstr(a1[7], (uint64_t)v4);
  (*(void (**)(uint64_t, void, void))(a1[18] + 24))(a1[13], *v4, *((int *)v4 + 2));
  (*(void (**)(uint64_t, void, void))(a1[18] + 24))(a1[13] + 208, *v4, *((int *)v4 + 2));
  if (!a2) {
    cstr_clear_free((uint64_t)v4);
  }
  return 0;
}

uint64_t srp6_client_passwd(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  (*(void (**)(long long *))(*(void *)(a1 + 144) + 16))(&v8);
  (*(void (**)(long long *, void, void))(*(void *)(a1 + 144) + 24))(&v8, **(void **)(a1 + 8), *(int *)(*(void *)(a1 + 8) + 8));
  (*(void (**)(long long *, const char *, uint64_t))(*(void *)(a1 + 144) + 24))(&v8, ":", 1);
  (*(void (**)(long long *, uint64_t, void))(*(void *)(a1 + 144) + 24))(&v8, a2, a3);
  (*(void (**)(unsigned char *, long long *))(*(void *)(a1 + 144) + 32))(v21, &v8);
  (*(void (**)(long long *))(*(void *)(a1 + 144) + 16))(&v8);
  (*(void (**)(long long *, void, void))(*(void *)(a1 + 144) + 24))(&v8, **(void **)(a1 + 32), *(int *)(*(void *)(a1 + 32) + 8));
  (*(void (**)(long long *, unsigned char *, void))(*(void *)(a1 + 144) + 24))(&v8, v21, **(void **)(a1 + 144));
  (*(void (**)(unsigned char *, long long *))(*(void *)(a1 + 144) + 32))(v21, &v8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, unsigned char *, void))(*(void *)(a1 + 96) + 32))(a1, v21, **(unsigned int **)(a1 + 144));
  __memset_chk();
  return v6;
}

uint64_t srp6_client_auth(uint64_t a1)
{
  *(void *)(a1 + 48) = CCBigNumFromData();
  *(void *)(a1 + 40) = BigIntegerFromInt();
  CCBigNumModExp();
  return 0;
}

uint64_t srp6_client_params(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, sizeof(v17));
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, void))(*(void *)(a1 + 144) + 24))(v17, a2, a3);
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, void))(*(void *)(a1 + 144) + 24))(v17, a4, a5);
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v18, v17);
  uint64_t v14 = *(void *)(a1 + 144);
  if ((int)*(void *)v14 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      v19[v15] ^= v18[v15];
      ++v15;
    }
    while (v15 < (int)*(void *)v14);
  }
  (*(void (**)(void, unsigned char *))(v14 + 24))(*(void *)(a1 + 104), v19);
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v17, **(void **)(a1 + 8), *(int *)(*(void *)(a1 + 8) + 8));
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(void, unsigned char *, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104), v19, **(void **)(a1 + 144));
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104), a6, a7);
  return 0;
}

uint64_t srp6_client_finish(uint64_t a1)
{
  uint64_t v1 = *(_OWORD **)(a1 + 104);
  if (v1)
  {
    v1[28] = 0u;
    v1[29] = 0u;
    v1[26] = 0u;
    v1[27] = 0u;
    v1[24] = 0u;
    v1[25] = 0u;
    v1[22] = 0u;
    v1[23] = 0u;
    v1[20] = 0u;
    v1[21] = 0u;
    v1[18] = 0u;
    v1[19] = 0u;
    v1[16] = 0u;
    v1[17] = 0u;
    v1[14] = 0u;
    v1[15] = 0u;
    v1[12] = 0u;
    v1[13] = 0u;
    v1[10] = 0u;
    v1[11] = 0u;
    v1[8] = 0u;
    v1[9] = 0u;
    v1[6] = 0u;
    v1[7] = 0u;
    v1[4] = 0u;
    v1[5] = 0u;
    v1[2] = 0u;
    v1[3] = 0u;
    _OWORD *v1 = 0u;
    v1[1] = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6a_client_init(void *a1)
{
  *a1 = 0x30000000CLL;
  a1[13] = malloc_type_malloc(0x1E0uLL, 0x1000040048C4DA3uLL);
  (*(void (**)(void))(a1[18] + 16))();
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 208);
  return 0;
}

uint64_t srp6_server_respond(uint64_t a1, void ***a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *a2;
  if (!*a2)
  {
    uint64_t v5 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      uint64_t v5 = malloc_allocator;
      default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
    }
    uint64_t v4 = (void **)((uint64_t (*)(uint64_t, uint64_t (*)()))*v5)(32, v5[2]);
    if (v4)
    {
      void *v4 = &cstr_empty_string;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 1;
      v4[3] = v5;
    }
    *a2 = v4;
  }
  cstr_set_length((uint64_t)v4, **(_DWORD **)(a1 + 144));
  memcpy(**a2, (const void *)(*(void *)(a1 + 104) + 896), **(void **)(a1 + 144));
  return 0;
}

uint64_t srp6_server_verify(uint64_t a1, const void *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  (*(void (**)(unsigned char *, uint64_t))(*(void *)(a1 + 144) + 32))(__s1, *(void *)(a1 + 104) + 624);
  uint64_t v6 = *(void *)(a1 + 144);
  if (*(_DWORD *)v6 == a3 && !memcmp(__s1, a2, a3))
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 32))(*(void *)(a1 + 104) + 896, *(void *)(a1 + 104) + 416);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v6 + 32))(__s1, *(void *)(a1 + 104) + 208);
    size_t v7 = *(uint64_t **)(a1 + 144);
    uint64_t v8 = *v7;
    if (*v7 != a3 || memcmp(__s1, a2, a3)) {
      return 0xFFFFFFFFLL;
    }
    ((void (*)(void, unsigned char *, uint64_t))v7[3])(*(void *)(a1 + 104), __s1, v8);
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104), *(void *)(a1 + 104) + 832, *(void *)(*(void *)(a1 + 144) + 8));
    (*(void (**)(uint64_t, void))(*(void *)(a1 + 144) + 32))(*(void *)(a1 + 104) + 896, *(void *)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_server_key(uint64_t a1, uint64_t *a2, const void *a3, int a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v8 = CCBigNumBitCount();
  int v9 = v8 + 7;
  if (v8 < -7) {
    int v9 = v8 + 14;
  }
  int v10 = v9 >> 3;
  if (v9 >> 3 < a4) {
    return 0xFFFFFFFFLL;
  }
  memset(v22, 0, sizeof(v22));
  (*(void (**)(uint64_t, const void *, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, a3, a4);
  uint64_t v11 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    uint64_t v11 = malloc_allocator;
    default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
  }
  uint64_t v12 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v11)(32, v11[2]);
  long long v13 = (void *)v12;
  if (v12)
  {
    *(void *)uint64_t v12 = &cstr_empty_string;
    *(void *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 16) = 1;
    *(void *)(v12 + 24) = v11;
  }
  BigIntegerToCstr(*(void *)(a1 + 56), v12);
  (*(void (**)(uint64_t, void, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, *v13, *((int *)v13 + 2));
  (*(void (**)(void, const void *, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104), a3, a4);
  (*(void (**)(uint64_t, const void *, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 416, a3, a4);
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v22);
  if ((*(unsigned char *)(a1 + 4) & 2) != 0)
  {
    int v14 = v10 - a4;
    if (v10 <= a4)
    {
      (*(void (**)(_OWORD *, const void *, void))(*(void *)(a1 + 144) + 24))(v22, a3, a4);
      if (*((_DWORD *)v13 + 2) >= v10) {
        goto LABEL_14;
      }
    }
    else
    {
      cstr_set_length((uint64_t)v13, v10);
      memcpy((void *)(*v13 + v14), a3, a4);
      bzero((void *)*v13, v14);
      (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v22, *v13, v10);
    }
    BigIntegerToCstrEx(*(void *)(a1 + 56), (const void **)v13, v10);
    goto LABEL_14;
  }
  (*(void (**)(_OWORD *, const void *, void))(*(void *)(a1 + 144) + 24))(v22, a3, a4);
LABEL_14:
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v22, *v13, *((int *)v13 + 2));
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v24, v22);
  int v23 = 0;
  *(void *)(a1 + 72) = CCBigNumFromData();
  uint64_t v15 = BigIntegerFromInt();
  CCBigNumModExp();
  int v23 = 0;
  CCBigNumFromData();
  uint64_t v16 = BigIntegerFromInt();
  CCBigNumMulMod();
  CCBigNumFree();
  if ((int)MEMORY[0x192FA8910](v16, 1) <= 0
    || (CCBigNumAddI(), !MEMORY[0x192FA8900](v15, *(void *)(a1 + 16))))
  {
    CCBigNumFree();
    CCBigNumFree();
    cstr_free((uint64_t)v13);
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 80) = BigIntegerFromInt();
  CCBigNumModExp();
  CCBigNumFree();
  CCBigNumFree();
  BigIntegerToCstr(*(void *)(a1 + 80), (uint64_t)v13);
  uint64_t v17 = *(void *)(a1 + 144);
  if (*(void *)(v17 + 8) == 40)
  {
    t_mgf1(*(void *)(a1 + 104) + 832, (const void *)*v13, *((_DWORD *)v13 + 2));
  }
  else
  {
    (*(void (**)(_OWORD *))(v17 + 16))(v22);
    (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v22, *v13, *((int *)v13 + 2));
    (*(void (**)(uint64_t, _OWORD *))(*(void *)(a1 + 144) + 32))(*(void *)(a1 + 104) + 832, v22);
  }
  cstr_clear_free((uint64_t)v13);
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, *(void *)(a1 + 104) + 832, *(void *)(*(void *)(a1 + 144) + 8));
  uint64_t v19 = *(void *)(a1 + 88);
  if (*(int *)(v19 + 8) >= 1) {
    (*(void (**)(uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, *(void *)v19);
  }
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 416, *(void *)(a1 + 104) + 832, *(void *)(*(void *)(a1 + 144) + 8));
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 624, *(void *)(a1 + 104) + 832, *(void *)(*(void *)(a1 + 144) + 8));
  if (a2)
  {
    uint64_t v20 = *a2;
    if (!*a2)
    {
      uint64_t v21 = (uint64_t (**)())default_alloc;
      if (!default_alloc)
      {
        uint64_t v21 = malloc_allocator;
        default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
      }
      uint64_t v20 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v21)(32, v21[2]);
      if (v20)
      {
        *(void *)uint64_t v20 = &cstr_empty_string;
        *(void *)(v20 + 8) = 0;
        *(_DWORD *)(v20 + 16) = 1;
        *(void *)(v20 + 24) = v21;
      }
      *a2 = v20;
    }
    cstr_setn(v20, (const void *)(*(void *)(a1 + 104) + 832), *(_DWORD *)(*(void *)(a1 + 144) + 8));
  }
  return 0;
}

uint64_t srp6_server_passwd(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  (*(void (**)(long long *))(*(void *)(a1 + 144) + 16))(&v7);
  (*(void (**)(long long *, void, void))(*(void *)(a1 + 144) + 24))(&v7, **(void **)(a1 + 8), *(int *)(*(void *)(a1 + 8) + 8));
  (*(void (**)(long long *, const char *, uint64_t))(*(void *)(a1 + 144) + 24))(&v7, ":", 1);
  (*(void (**)(long long *, uint64_t, void))(*(void *)(a1 + 144) + 24))(&v7, a2, a3);
  (*(void (**)(unsigned char *, long long *))(*(void *)(a1 + 144) + 32))(v21, &v7);
  (*(void (**)(long long *))(*(void *)(a1 + 144) + 16))(&v7);
  (*(void (**)(long long *, void, void))(*(void *)(a1 + 144) + 24))(&v7, **(void **)(a1 + 32), *(int *)(*(void *)(a1 + 32) + 8));
  (*(void (**)(long long *, unsigned char *, void))(*(void *)(a1 + 144) + 24))(&v7, v21, **(void **)(a1 + 144));
  (*(void (**)(unsigned char *, long long *))(*(void *)(a1 + 144) + 32))(v21, &v7);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  int v20 = 0;
  *(void *)(a1 + 48) = CCBigNumFromData();
  __memset_chk();
  *(void *)(a1 + 40) = BigIntegerFromInt();
  CCBigNumModExp();
  return 0;
}

uint64_t srp6_server_auth(uint64_t a1)
{
  *(void *)(a1 + 40) = CCBigNumFromData();
  return 0;
}

uint64_t srp6_server_params(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, sizeof(v17));
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, void))(*(void *)(a1 + 144) + 24))(v17, a2, a3);
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, void))(*(void *)(a1 + 144) + 24))(v17, a4, a5);
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v18, v17);
  uint64_t v14 = *(void *)(a1 + 144);
  if ((int)*(void *)v14 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      v19[v15] ^= v18[v15];
      ++v15;
    }
    while (v15 < (int)*(void *)v14);
  }
  (*(void (**)(uint64_t, unsigned char *))(v14 + 24))(*(void *)(a1 + 104) + 208, v19);
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v17, **(void **)(a1 + 8), *(int *)(*(void *)(a1 + 8) + 8));
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(uint64_t, unsigned char *, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, v19, **(void **)(a1 + 144));
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 208, a6, a7);
  return 0;
}

uint64_t srp6_server_finish(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 104);
  if (v2)
  {
    bzero(v2, 0x3C0uLL);
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6a_server_genpub(uint64_t a1, uint64_t *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, sizeof(v17));
  (*(void (**)(_OWORD *))(*(void *)(a1 + 144) + 16))(v17);
  uint64_t v4 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    uint64_t v4 = malloc_allocator;
    default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
  }
  uint64_t v5 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v4)(32, v4[2]);
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    *(void *)uint64_t v5 = &cstr_empty_string;
    *(void *)(v5 + 8) = 0;
    *(_DWORD *)(v5 + 16) = 1;
    *(void *)(v5 + 24) = v4;
  }
  BigIntegerToCstr(*(void *)(a1 + 16), v5);
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v17, *v6, *((int *)v6 + 2));
  uint64_t v7 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(a1 + 4) & 2) != 0) {
    BigIntegerToCstrEx(v7, (const void **)v6, *((_DWORD *)v6 + 2));
  }
  else {
    BigIntegerToCstr(v7, (uint64_t)v6);
  }
  (*(void (**)(_OWORD *, void, void))(*(void *)(a1 + 144) + 24))(v17, *v6, *((int *)v6 + 2));
  (*(void (**)(unsigned char *, _OWORD *))(*(void *)(a1 + 144) + 32))(v19, v17);
  cstr_free((uint64_t)v6);
  int v18 = 0;
  CCBigNumFromData();
  if (MEMORY[0x192FA8910]())
  {
    CCBigNumBitCount();
    if (a2)
    {
      long long v8 = (void *)*a2;
      if (!*a2)
      {
        long long v9 = (uint64_t (**)())default_alloc;
        if (!default_alloc)
        {
          long long v9 = malloc_allocator;
          default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
        }
        uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v9)(32, v9[2]);
        long long v8 = (void *)v10;
        if (v10)
        {
          *(void *)uint64_t v10 = &cstr_empty_string;
          *(void *)(v10 + 8) = 0;
          *(_DWORD *)(v10 + 16) = 1;
          *(void *)(v10 + 24) = v9;
        }
        *a2 = v10;
      }
    }
    else
    {
      long long v12 = (uint64_t (**)())default_alloc;
      if (!default_alloc)
      {
        long long v12 = malloc_allocator;
        default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
      }
      uint64_t v13 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v12)(32, v12[2]);
      long long v8 = (void *)v13;
      if (v13)
      {
        *(void *)uint64_t v13 = &cstr_empty_string;
        *(void *)(v13 + 8) = 0;
        *(_DWORD *)(v13 + 16) = 1;
        *(void *)(v13 + 24) = v12;
      }
    }
    int v14 = CCBigNumBitCount();
    int v15 = v14 + 7;
    if (v14 < -7) {
      int v15 = v14 + 14;
    }
    cstr_set_length((uint64_t)v8, v15 >> 3);
    RandomBytes((void *)*v8, 0x20uLL);
    int v18 = 0;
    *(void *)(a1 + 64) = CCBigNumFromData();
    *(void *)(a1 + 56) = BigIntegerFromInt();
    CCBigNumMul();
    CCBigNumModExp();
    CCBigNumAdd();
    CCBigNumMod();
    BigIntegerToCstr(*(void *)(a1 + 56), (uint64_t)v8);
    (*(void (**)(uint64_t, void, void))(*(void *)(a1 + 144) + 24))(*(void *)(a1 + 104) + 624, *v8, *((int *)v8 + 2));
    uint64_t v11 = 0;
    if (!a2)
    {
      cstr_clear_free((uint64_t)v8);
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  CCBigNumFree();
  return v11;
}

uint64_t srp6a_server_init(void *a1)
{
  *a1 = 0x30000001CLL;
  a1[13] = malloc_type_malloc(0x3C0uLL, 0x100004020E4CBADuLL);
  (*(void (**)(void))(a1[18] + 16))();
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 208);
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 416);
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 624);
  return 0;
}

void *SRP_new(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x98uLL, 0x10E004039FB2966uLL);
  unint64_t v3 = v2;
  if (v2)
  {
    v2[1] = 0;
    uint64_t v4 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      uint64_t v4 = malloc_allocator;
      default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
    }
    uint64_t v5 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v4)(32, v4[2]);
    if (v5)
    {
      *(void *)uint64_t v5 = &cstr_empty_string;
      *(void *)(v5 + 8) = 0;
      *(_DWORD *)(v5 + 16) = 1;
      *(void *)(v5 + 24) = v4;
    }
    v3[1] = v5;
    *((_OWORD *)v3 + 1) = 0u;
    *((_OWORD *)v3 + 2) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *((_OWORD *)v3 + 4) = 0u;
    v3[10] = 0;
    v3[14] = 0;
    v3[15] = 0;
    uint64_t v6 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      uint64_t v6 = malloc_allocator;
      default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
    }
    uint64_t v7 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v6)(32, v6[2]);
    if (v7)
    {
      *(void *)uint64_t v7 = &cstr_empty_string;
      *(void *)(v7 + 8) = 0;
      *(_DWORD *)(v7 + 16) = 1;
      *(void *)(v7 + 24) = v6;
    }
    v3[11] = v7;
    v3[12] = a1;
    v3[13] = 0;
    v3[16] = 0;
    v3[17] = 0;
    v3[18] = &kSRPHashDescriptor_SHA512;
    long long v8 = *(unsigned int (**)(void *))(a1 + 8);
    if (v8 && v8(v3))
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

void SRP_free(void *a1)
{
  uint64_t v2 = *(void (**)(void *))(a1[12] + 16);
  if (v2) {
    v2(a1);
  }
  uint64_t v3 = a1[1];
  if (v3) {
    cstr_clear_free(v3);
  }
  if (a1[2]) {
    CCBigNumFree();
  }
  if (a1[3]) {
    CCBigNumFree();
  }
  uint64_t v4 = a1[4];
  if (v4) {
    cstr_clear_free(v4);
  }
  if (a1[5]) {
    CCBigNumFree();
  }
  if (a1[6]) {
    CCBigNumFree();
  }
  if (a1[7]) {
    CCBigNumFree();
  }
  if (a1[8]) {
    CCBigNumFree();
  }
  if (a1[9]) {
    CCBigNumFree();
  }
  if (a1[10]) {
    CCBigNumFree();
  }
  uint64_t v5 = a1[11];
  if (v5) {
    cstr_clear_free(v5);
  }
  free(a1);
}

uint64_t SRP_set_user_raw(uint64_t a1, const void *a2, int a3)
{
  cstr_setn(*(void *)(a1 + 8), a2, a3);
  uint64_t result = *(void *)(a1 + 136);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)result + 24);
    return v5();
  }
  return result;
}

uint64_t SRP_set_params(uint64_t a1, const void *a2, uint64_t a3)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 16) = CCBigNumFromData();
  if (*(unsigned char *)(a1 + 4)) {
    *(void *)(a1 + 120) = 0;
  }
  *(void *)(a1 + 24) = CCBigNumFromData();
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6)
  {
    uint64_t v7 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      uint64_t v7 = malloc_allocator;
      default_alloCC_SHA1_CTX c = (uint64_t)malloc_allocator;
    }
    uint64_t v6 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v7)(32, v7[2]);
    if (v6)
    {
      *(void *)uint64_t v6 = &cstr_empty_string;
      *(void *)(v6 + 8) = 0;
      *(_DWORD *)(v6 + 16) = 1;
      *(void *)(v6 + 24) = v7;
    }
    *(void *)(a1 + 32) = v6;
  }
  cstr_setn(v6, a2, a3);
  if ((int)CCBigNumBitCount() < 512) {
    return 0xFFFFFFFFLL;
  }
  long long v9 = *(uint64_t (**)(uint64_t, void *, uint64_t, void *, uint64_t))(a1 + 128);
  if (!v9 || (uint64_t result = v9(a1, &kSRPModulus3072, 384, &kSRPGenerator5, 1), !result))
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, void *, uint64_t, void *, uint64_t, const void *, uint64_t))(*(void *)(a1 + 96) + 24);
    return v10(a1, &kSRPModulus3072, 384, &kSRPGenerator5, 1, a2, a3);
  }
  return result;
}

uint64_t t_mgf1(uint64_t a1, const void *a2, CC_LONG a3)
{
  uint64_t v6 = 0;
  unsigned int v7 = 0;
  memset(&c, 0, sizeof(c));
  do
  {
    unsigned int data = bswap32(v7);
    CC_SHA1_Init(&c);
    CC_SHA1_Update(&c, a2, a3);
    CC_SHA1_Update(&c, &data, 4u);
    uint64_t result = CC_SHA1_Final((unsigned __int8 *)(a1 + v6), &c);
    ++v7;
    v6 += 20;
  }
  while (v6 != 40);
  return result;
}

uint64_t SRPCreate_corecrypto(void *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x38uLL, 0x103004063A0F53DuLL);
  if (!v2) {
    return 4294960568;
  }
  uint64_t v3 = v2;
  uint64_t result = 0;
  *a1 = v3;
  return result;
}

void SRPDelete_corecrypto(void *a1)
{
  if (a1)
  {
    _SRPCleanup_corecrypto((uint64_t)a1);
    free(a1);
  }
}

void _SRPCleanup_corecrypto(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    memset_s(v2, *(void *)(a1 + 8), 0, *(void *)(a1 + 8));
    if (*(void *)a1)
    {
      free(*(void **)a1);
      *(void *)a1 = 0;
    }
  }
  *(void *)(a1 + 8) = 0;
  uint64_t v3 = *(void **)(a1 + 16);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 16) = 0;
  }
  uint64_t v4 = *(void **)(a1 + 24);
  if (v4)
  {
    memset_s(v4, *(void *)(a1 + 32), 0, *(void *)(a1 + 32));
    uint64_t v5 = *(void **)(a1 + 24);
    if (v5)
    {
      free(v5);
      *(void *)(a1 + 24) = 0;
    }
  }
  *(void *)(a1 + 32) = 0;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    memset_s(v6, *(void *)(a1 + 48), 0, *(void *)(a1 + 48));
    unsigned int v7 = *(void **)(a1 + 40);
    if (v7)
    {
      free(v7);
      *(void *)(a1 + 40) = 0;
    }
  }
  *(void *)(a1 + 48) = 0;
}

uint64_t SRPClientStart_corecrypto(void *a1, void *a2, const char *a3, size_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, size_t a10, void *a11, size_t *a12, void *a13, size_t *a14, void *a15, size_t *a16)
{
  if (a2 != &_kSRPParameters_3072_SHA512)
  {
    uint64_t v17 = 4294960561;
LABEL_33:
    _SRPCleanup_corecrypto((uint64_t)a1);
    return v17;
  }
  uint64_t v22 = (void *)ccsha512_di();
  ccsrp_gp_rfc5054_3072();
  size_t v23 = 4 * (*v22 + ccdh_ccn_size()) + 48;
  a1[1] = v23;
  uint64_t v24 = malloc_type_calloc(1uLL, v23, 0x710ECAE9uLL);
  *a1 = v24;
  if (!v24) {
    goto LABEL_32;
  }
  long long __s = a5;
  ccrng();
  ccsrp_ctx_init_option();
  uint64_t v25 = MEMORY[0x192FA9F90](*(void *)(*a1 + 8));
  size_t v26 = 8 * v25;
  size_t v27 = 8 * v25 - a10;
  if (8 * v25 > a10)
  {
    uint64_t v28 = (char *)malloc_type_malloc(8 * v25, 0x36488BDDuLL);
    if (v28)
    {
      int v29 = v28;
      memset(v28, 48, v27);
      memcpy(&v29[v27], a9, a10);
      goto LABEL_9;
    }
LABEL_32:
    uint64_t v17 = 4294960568;
    goto LABEL_33;
  }
  if (v26 != a10)
  {
    uint64_t v17 = 4294960553;
    goto LABEL_33;
  }
  int v29 = 0;
LABEL_9:
  uint64_t v30 = malloc_type_malloc(v26, 0x54BD6131uLL);
  if (!v30)
  {
    LOBYTE(v31) = 0;
    uint64_t v32 = 0;
LABEL_37:
    uint64_t v33 = 0;
LABEL_40:
    uint64_t v17 = 4294960568;
    goto LABEL_22;
  }
  if (ccsrp_client_start_authentication())
  {
    LOBYTE(v31) = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v17 = 4294960596;
    goto LABEL_22;
  }
  if (a4 == -1) {
    a4 = strlen(a3);
  }
  uint64_t v32 = strndup(a3, a4);
  if (!v32)
  {
    LOBYTE(v31) = 0;
    goto LABEL_37;
  }
  session_key_CFIndex length = ccsrp_get_session_key_length();
  if (!session_key_length)
  {
    LOBYTE(v31) = 0;
    uint64_t v33 = 0;
    uint64_t v17 = 4294960553;
    goto LABEL_22;
  }
  size_t v35 = session_key_length;
  uint64_t v33 = malloc_type_malloc(session_key_length, 0xA9E72F20uLL);
  if (!v33)
  {
    LOBYTE(v31) = 0;
    goto LABEL_40;
  }
  if (a6 == -1) {
    strlen(__s);
  }
  if (!ccsrp_client_process_challenge())
  {
    uint64_t v31 = malloc_type_malloc(v35, 0x2414696EuLL);
    if (v31)
    {
      uint64_t v36 = *a1;
      uint64_t v37 = MEMORY[0x192FA9F90](*(void *)(*a1 + 8));
      memcpy(v31, (const void *)(v36 + 32 * v37 + 32), v35);
      uint64_t v17 = 0;
      *a11 = v30;
      *a12 = v26;
      *a13 = v31;
      *a14 = v35;
      LOBYTE(v31) = 1;
      *a15 = v33;
      *a16 = v35;
      uint64_t v30 = 0;
      uint64_t v33 = 0;
      goto LABEL_22;
    }
    goto LABEL_40;
  }
  LOBYTE(v31) = 0;
  uint64_t v17 = 4294960542;
LABEL_22:
  if (v29) {
    free(v29);
  }
  if (v30) {
    free(v30);
  }
  if (v32) {
    free(v32);
  }
  if (v33) {
    free(v33);
  }
  if ((v31 & 1) == 0) {
    goto LABEL_33;
  }
  return 0;
}

uint64_t SRPClientVerify_corecrypto(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1)
  {
    if (ccsrp_get_session_key_length() == a3)
    {
      if (ccsrp_client_verify_session()) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = 4294960542;
      }
    }
    else
    {
      uint64_t v4 = 4294960553;
    }
  }
  else
  {
    uint64_t v4 = 4294960551;
  }
  _SRPCleanup_corecrypto((uint64_t)a1);
  return v4;
}

uint64_t SRPServerStart_corecrypto(uint64_t a1, void *a2, const char *a3, size_t a4, const char *a5, uint64_t a6, size_t a7, void *a8, void *a9, size_t *a10)
{
  if (a2 == &_kSRPParameters_3072_SHA512)
  {
    int v18 = (void *)ccsha512_di();
    ccsrp_gp_rfc5054_3072();
    size_t v19 = 4 * (*v18 + ccdh_ccn_size()) + 48;
    *(void *)(a1 + 8) = v19;
    uint64_t v20 = malloc_type_calloc(1uLL, v19, 0x643B0AA6uLL);
    *(void *)a1 = v20;
    if (v20)
    {
      ccrng();
      ccsrp_ctx_init_option();
      size_t v21 = 8 * MEMORY[0x192FA9F90](*(void *)(*(void *)a1 + 8));
      uint64_t v22 = malloc_type_malloc(v21, 0x14CF2659uLL);
      *(void *)(a1 + 40) = v22;
      if (v22)
      {
        if (a4 == -1) {
          a4 = strlen(a3);
        }
        size_t v23 = strndup(a3, a4);
        *(void *)(a1 + 16) = v23;
        if (v23)
        {
          uint64_t v24 = malloc_type_malloc(a7, 0xC38E206DuLL);
          *(void *)(a1 + 24) = v24;
          if (v24)
          {
            *(void *)(a1 + 32) = a7;
            if (a6 == -1) {
              strlen(a5);
            }
            if (ccsrp_generate_salt_and_verification())
            {
LABEL_15:
              uint64_t v11 = 4294960596;
              goto LABEL_16;
            }
            memcpy(a8, *(const void **)(a1 + 24), a7);
            uint64_t v25 = malloc_type_malloc(v21, 0x84993042uLL);
            if (v25)
            {
              size_t v26 = v25;
              if (!ccsrp_server_generate_public_key())
              {
                uint64_t v11 = 0;
                *a9 = v26;
                *a10 = v21;
                return v11;
              }
              free(v26);
              goto LABEL_15;
            }
          }
        }
      }
    }
    uint64_t v11 = 4294960568;
    goto LABEL_16;
  }
  uint64_t v11 = 4294960561;
LABEL_16:
  _SRPCleanup_corecrypto(a1);
  return v11;
}

uint64_t SRPServerVerify_corecrypto(void *a1, const void *a2, size_t a3, uint64_t a4, size_t a5, void *a6, size_t *a7, void *a8, size_t *a9)
{
  if (!*a1 || !a1[2] || !a1[3] || !a1[4])
  {
    uint64_t v17 = 4294960551;
    goto LABEL_21;
  }
  session_key_CFIndex length = ccsrp_get_session_key_length();
  uint64_t v17 = 4294960553;
  if (session_key_length && session_key_length == a5)
  {
    size_t v18 = 8 * MEMORY[0x192FA9F90](*(void *)(*a1 + 8));
    size_t v19 = v18 - a3;
    if (v18 < a3)
    {
      uint64_t v17 = 4294960553;
      goto LABEL_21;
    }
    if (v18 > a3)
    {
      uint64_t v20 = (char *)malloc_type_malloc(v18, 0xBBD66175uLL);
      if (!v20)
      {
        uint64_t v17 = 4294960568;
        goto LABEL_21;
      }
      size_t v21 = v20;
      bzero(v20, v19);
      memcpy(&v21[v19], a2, a3);
    }
    else
    {
      size_t v21 = 0;
    }
    if (ccsrp_server_compute_session())
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = malloc_type_malloc(a5, 0x6CD85071uLL);
      if (!v22) {
        goto LABEL_23;
      }
      if (ccsrp_server_verify_session())
      {
        size_t v23 = malloc_type_malloc(a5, 0xD7E278AuLL);
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *a1;
          uint64_t v26 = MEMORY[0x192FA9F90](*(void *)(*a1 + 8));
          memcpy(v24, (const void *)(v25 + 32 * v26 + 32), a5);
          uint64_t v17 = 0;
          *a6 = v24;
          *a7 = a5;
          *a8 = v22;
          *a9 = a5;
          uint64_t v22 = 0;
LABEL_17:
          if (v21) {
            free(v21);
          }
          if (v22) {
            free(v22);
          }
          goto LABEL_21;
        }
LABEL_23:
        uint64_t v17 = 4294960568;
        goto LABEL_17;
      }
    }
    uint64_t v17 = 4294960542;
    goto LABEL_17;
  }
LABEL_21:
  _SRPCleanup_corecrypto((uint64_t)a1);
  return v17;
}

uint64_t SRPCreate_libsrp(void *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x38uLL, 0x103004063A0F53DuLL);
  if (!v2) {
    return 4294960568;
  }
  uint64_t v3 = v2;
  uint64_t result = 0;
  *a1 = v3;
  return result;
}

void SRPDelete_libsrp(void *a1)
{
  uint64_t v2 = (void *)*a1;
  if (v2) {
    SRP_free(v2);
  }
  free(a1);
}

uint64_t SRPClientStart_libsrp(uint64_t *a1, void *a2, const char *a3, uint64_t a4, const char *a5, uint64_t a6, const void *a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  if (a2 == &_kSRPParameters_3072_SHA512)
  {
    uint64_t v24 = (void *)*a1;
    if (v24)
    {
      SRP_free(v24);
      *a1 = 0;
    }
    uint64_t v25 = SRP_new((uint64_t)&srp6a_client_meth);
    *a1 = (uint64_t)v25;
    if (!v25) {
      return 4294960568;
    }
    uint64_t v26 = (uint64_t)v25;
    if (a4 == -1) {
      LODWORD(a4) = strlen(a3);
    }
    if (SRP_set_user_raw(v26, a3, a4) || SRP_set_params(*a1, a7, a8)) {
      return 4294960596;
    }
    if (a6 == -1) {
      strlen(a5);
    }
    if ((*(unsigned int (**)(void))(*(void *)(*a1 + 96) + 40))()
      || (*(unsigned int (**)(void))(*(void *)(*a1 + 96) + 48))())
    {
      return 4294960596;
    }
    if (MEMORY[8] < 1)
    {
      uint64_t v16 = 4294960553;
      cstr_free(0);
      return v16;
    }
    if ((*(unsigned int (**)(void))(*(void *)(*a1 + 96) + 56))()) {
      return 4294960596;
    }
    if (MEMORY[8] >= 1)
    {
      if ((*(unsigned int (**)(void))(*(void *)(*a1 + 96) + 72))()) {
        return 4294960596;
      }
      if (MEMORY[8] >= 1)
      {
        uint64_t v16 = 0;
        *a11 = MEMORY[0];
        *a12 = MEMORY[8];
        MEMORY[8] = 0;
        *a13 = MEMORY[0];
        *a14 = MEMORY[8];
        MEMORY[8] = 0;
        *a15 = MEMORY[0];
        *a16 = MEMORY[8];
        MEMORY[8] = 0;
        return v16;
      }
    }
    return 4294960553;
  }
  return 4294960561;
}

uint64_t SRPClientVerify_libsrp(void **a1)
{
  uint64_t v2 = (uint64_t)*a1;
  if (!v2) {
    return 4294960551;
  }
  if ((*(unsigned int (**)(void))(*(void *)(v2 + 96) + 64))()) {
    uint64_t v3 = 4294960542;
  }
  else {
    uint64_t v3 = 0;
  }
  if (*a1)
  {
    SRP_free(*a1);
    *a1 = 0;
  }
  return v3;
}

uint64_t SRPServerStart_libsrp(uint64_t *a1, void *a2, const char *a3, uint64_t a4, const char *a5, uint64_t a6, size_t a7, void *a8, void *a9, void *a10)
{
  if (a2 != &_kSRPParameters_3072_SHA512) {
    return 4294960561;
  }
  size_t v18 = (void *)*a1;
  if (v18)
  {
    SRP_free(v18);
    *a1 = 0;
  }
  size_t v19 = SRP_new((uint64_t)&srp6a_server_meth);
  *a1 = (uint64_t)v19;
  if (!v19) {
    return 4294960568;
  }
  uint64_t v20 = (uint64_t)v19;
  if (a4 == -1) {
    LODWORD(a4) = strlen(a3);
  }
  if (SRP_set_user_raw(v20, a3, a4)) {
    return 4294960596;
  }
  if (a7 < 0x10) {
    return 4294960591;
  }
  RandomBytes(a8, a7);
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)a8, a7, "SRP-Salt-Salt", 0xDuLL, (uint64_t)"SRP-Salt-Info", 13, a7, (uint64_t)a8);
  if (SRP_set_params(*a1, a8, a7)) {
    return 4294960596;
  }
  if (a6 == -1) {
    strlen(a5);
  }
  if ((*(unsigned int (**)(void))(*(void *)(*a1 + 96) + 40))()) {
    return 4294960596;
  }
  if ((*(unsigned int (**)(void))(*(void *)(*a1 + 96) + 48))()) {
    return 4294960596;
  }
  uint64_t v10 = 0;
  *a9 = MEMORY[0];
  *a10 = MEMORY[8];
  MEMORY[8] = 0;
  cstr_free(0);
  return v10;
}

uint64_t SRPServerVerify_libsrp(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v10 = (uint64_t)*a1;
  if (!v10) {
    return 4294960551;
  }
  if ((*(unsigned int (**)(void))(*(void *)(v10 + 96) + 56))()) {
    goto LABEL_6;
  }
  if (MEMORY[8] < 1)
  {
    uint64_t v14 = 4294960553;
    cstr_clear_free(0);
  }
  else if ((*(unsigned int (**)(void))((*a1)[12] + 64))())
  {
    uint64_t v14 = 4294960542;
  }
  else
  {
    if ((*(unsigned int (**)(void))((*a1)[12] + 72))())
    {
LABEL_6:
      uint64_t v14 = 4294960596;
      goto LABEL_7;
    }
    if (MEMORY[8] < 1)
    {
      uint64_t v14 = 4294960553;
    }
    else
    {
      uint64_t v14 = 0;
      *a6 = MEMORY[0];
      *a7 = MEMORY[8];
      MEMORY[8] = 0;
      *a8 = MEMORY[0];
      *a9 = MEMORY[8];
      MEMORY[8] = 0;
    }
  }
LABEL_7:
  if (*a1)
  {
    SRP_free(*a1);
    *a1 = 0;
  }
  return v14;
}

uint64_t ParseIPv4Address(unsigned __int8 *a1, unsigned char *a2, unsigned __int8 **a3)
{
  *a2 = 0;
  unsigned __int8 v3 = *a1;
  if (!*a1) {
    return 4294960546;
  }
  LOBYTE(v4) = 0;
  int v5 = 0;
  int v6 = 0;
  do
  {
    if (v3 - 48 <= 9)
    {
      int v4 = 10 * v4 + (char)v3 - 48;
      if (v4 > 255) {
        return 4294960586;
      }
      *a2 = v4;
      if (!v5)
      {
        if (v6 > 3) {
          return 4294960545;
        }
        ++v6;
      }
      int v5 = 1;
      goto LABEL_13;
    }
    if (!v5 || v3 != 46) {
      break;
    }
    if (v6 > 3) {
      return 4294960554;
    }
    LOBYTE(v4) = 0;
    int v5 = 0;
    *++a2 = 0;
LABEL_13:
    int v7 = *++a1;
    unsigned __int8 v3 = v7;
  }
  while (v7);
  if (v6 != 4) {
    return 4294960546;
  }
  uint64_t v8 = 0;
  *a3 = a1;
  return v8;
}

uint64_t StringToIPv4Address(unsigned __int8 *a1, _DWORD *a2, int *a3)
{
  uint64_t v16 = (char *)a1;
  if (!a1) {
    return 4294960591;
  }
  uint64_t result = ParseIPv4Address(a1, &v15, (unsigned __int8 **)&v16);
  if (!result)
  {
    int v6 = (unsigned __int8 *)v16;
    int v7 = *v16;
    if (v7 == 58)
    {
      int v6 = (unsigned __int8 *)(v16 + 1);
      int v8 = v16[1];
      if ((v8 - 48) > 9)
      {
        int v9 = 0;
        ++v16;
      }
      else
      {
        int v9 = 0;
        do
        {
          int v9 = v8 + 10 * v9 - 48;
          int v10 = (char)*++v6;
          int v8 = v10;
        }
        while ((v10 - 48) < 0xA);
        uint64_t v16 = (char *)v6;
        if (v9 >= 0x10000) {
          return 4294960586;
        }
      }
    }
    else
    {
      int v9 = 0;
      int v8 = *v16;
    }
    if (v8 == 47)
    {
      int v11 = v6[1];
      if ((v11 - 48) <= 9)
      {
        unsigned int v12 = 0;
        uint64_t v13 = v6 + 2;
        do
        {
          unsigned int v12 = v11 + 10 * v12 - 48;
          int v14 = *v13++;
          int v11 = v14;
        }
        while ((v14 - 48) < 0xA);
        if (v12 > 0x20) {
          return 4294960586;
        }
      }
    }
    if (a2) {
      *a2 = bswap32(v15);
    }
    uint64_t result = 0;
    if (a3)
    {
      if (v7 == 58)
      {
        uint64_t result = 0;
        *a3 = v9;
      }
    }
  }
  return result;
}

unsigned char *IPv4AddressToCString(unsigned int a1, unsigned int a2, unsigned char *a3)
{
  unsigned int v3 = 1;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = a3;
  do
  {
    unsigned int v5 = (a1 >> (-8 * v3));
    int v6 = v12;
    do
    {
      *v6++ = (v5 % 0xA) | 0x30;
      BOOL v7 = v5 > 9;
      v5 /= 0xAu;
    }
    while (v7);
    while (v6 > v12)
    {
      char v8 = *--v6;
      *v4++ = v8;
    }
    if (v3 <= 3) {
      *v4++ = 46;
    }
    ++v3;
  }
  while (v3 != 5);
  if ((int)a2 >= 1)
  {
    unsigned char *v4 = 58;
    int v9 = v12;
    do
    {
      *v9++ = (a2 % 0xA) | 0x30;
      BOOL v7 = a2 > 9;
      a2 /= 0xAu;
    }
    while (v7);
    ++v4;
    while (v9 > v12)
    {
      char v10 = *--v9;
      *v4++ = v10;
    }
  }
  unsigned char *v4 = 0;
  return a3;
}

unsigned char *BitListString_Make(unsigned int a1, unsigned char *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a2;
  if (a1)
  {
    unsigned int v4 = 0;
    unsigned int v3 = a2;
    do
    {
      if (a1)
      {
        unsigned int v5 = a2;
        if (v3 != a2)
        {
          unsigned char *v3 = 44;
          unsigned int v5 = v3 + 1;
        }
        int v6 = v11;
        unsigned int v7 = v4;
        do
        {
          *v6++ = (v7 % 0xA) | 0x30;
          BOOL v8 = v7 > 9;
          v7 /= 0xAu;
        }
        while (v8);
        while (v6 > v11)
        {
          char v9 = *--v6;
          *v5++ = v9;
        }
        unsigned int v3 = v5;
      }
      ++v4;
      BOOL v8 = a1 > 1;
      a1 >>= 1;
    }
    while (v8);
  }
  unsigned char *v3 = 0;
  if (a3) {
    *a3 = v3 - a2;
  }
  return a2;
}

uint64_t BitListString_Parse(char *__s, int64_t a2, _DWORD *a3)
{
  unsigned int v4 = __s;
  if (a2 == -1) {
    a2 = strlen(__s);
  }
  if (a2 < 1)
  {
    int v5 = 0;
LABEL_15:
    uint64_t result = 0;
    *a3 = v5;
  }
  else
  {
    int v5 = 0;
    unint64_t v6 = (unint64_t)&v4[a2];
    while (1)
    {
      unsigned int v7 = 0;
      BOOL v8 = v4;
      do
      {
        int v9 = *v8;
        if ((v9 - 48) > 9) {
          break;
        }
        unsigned int v7 = v9 + 10 * v7 - 48;
        ++v8;
      }
      while ((unint64_t)v8 < v6);
      if (v8 == v4 || v8 != (char *)v6 && v9 != 44) {
        return 4294960554;
      }
      if (v7 > 0x1F) {
        return 4294960586;
      }
      v5 |= 1 << v7;
      unsigned int v4 = v8 + 1;
      if ((unint64_t)(v8 + 1) >= v6) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

unsigned char *FourCharCodeToCString(unsigned int a1, unsigned char *a2)
{
  unsigned int v2 = HIBYTE(a1);
  if (!HIBYTE(a1)) {
    LOBYTE(v2) = 32;
  }
  *a2 = v2;
  unsigned int v3 = HIWORD(a1);
  if (!BYTE2(a1)) {
    LOBYTE(v3) = 32;
  }
  a2[1] = v3;
  unsigned int v4 = a1 >> 8;
  if (!BYTE1(a1)) {
    LOBYTE(v4) = 32;
  }
  a2[2] = v4;
  if ((_BYTE)a1) {
    char v5 = a1;
  }
  else {
    char v5 = 32;
  }
  a2[3] = v5;
  a2[4] = 0;
  return a2;
}

uint64_t TextToFourCharCode(char *__s, size_t a2)
{
  if (a2 == -1) {
    a2 = strlen(__s);
  }
  int v3 = 0x2000;
  if (a2)
  {
    if (*__s) {
      int v4 = *__s << 8;
    }
    else {
      int v4 = 0x2000;
    }
    int v5 = 32;
    if (a2 == 1)
    {
      int v6 = 32;
    }
    else
    {
      if (__s[1]) {
        int v6 = __s[1];
      }
      else {
        int v6 = 32;
      }
      int v3 = 0x2000;
      if (a2 >= 3)
      {
        if (__s[2]) {
          int v3 = __s[2] << 8;
        }
        else {
          int v3 = 0x2000;
        }
        int v5 = 32;
        if (a2 != 3)
        {
          if (__s[3]) {
            int v5 = __s[3];
          }
          else {
            int v5 = 32;
          }
        }
      }
    }
  }
  else
  {
    int v6 = 32;
    int v4 = 0x2000;
    int v5 = 32;
  }
  return v5 | v3 | ((v4 | v6) << 16);
}

unint64_t TextToHardwareAddressScalar(char *a1, size_t a2, unint64_t a3)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (a3 > 8 || TextToHardwareAddress(a1, a2, a3, v5)) {
    return 0;
  }
  if (a3 != 8)
  {
    if (a3 == 6) {
      return ((unint64_t)LOBYTE(v5[0]) << 40) | ((unint64_t)BYTE1(v5[0]) << 32) | ((unint64_t)BYTE2(v5[0]) << 24) | ((unint64_t)BYTE3(v5[0]) << 16) | ((unint64_t)BYTE4(v5[0]) << 8) | BYTE5(v5[0]);
    }
    return 0;
  }
  return bswap64(v5[0]);
}

unsigned char *HardwareAddressToCString(unsigned __int8 *a1, uint64_t a2, unsigned char *a3)
{
  int v3 = a3;
  if (a2 >= 1)
  {
    int v4 = &a1[a2];
    int v3 = a3;
    do
    {
      int v5 = a3;
      if (v3 != a3)
      {
        unsigned char *v3 = 58;
        int v5 = v3 + 1;
      }
      unsigned int v6 = *a1++;
      unsigned char *v5 = a0123456789abcd_0[(unint64_t)v6 >> 4];
      int v3 = v5 + 2;
      v5[1] = a0123456789abcd_0[v6 & 0xF];
    }
    while (a1 < v4);
  }
  unsigned char *v3 = 0;
  return a3;
}

uint64_t TextToInt32(char *__s, int64_t a2, int a3)
{
  int64_t v4 = a2;
  if (a2 == -1) {
    int64_t v4 = strlen(__s);
  }
  unsigned int v6 = &__s[v4];
  if (v4 < 1)
  {
    BOOL v8 = __s;
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14390];
    BOOL v8 = __s;
    do
    {
      uint64_t v9 = *v8;
      if (*v8 < 0)
      {
        if (!__maskrune(v9, 0x4000uLL)) {
          break;
        }
      }
      else if ((*(_DWORD *)(v7 + 4 * v9 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v8;
    }
    while (v8 < v6);
  }
  if (v6 - v8 <= 1)
  {
    if (a3) {
      goto LABEL_22;
    }
  }
  else
  {
    if (*v8 == 48)
    {
      if (__tolower(v8[1]) == 120)
      {
        v8 += 2;
        a3 = 16;
LABEL_22:
        int v10 = a3 - 2;
        goto LABEL_27;
      }
      if (*v8 == 48 && __tolower(v8[1]) == 98)
      {
        v8 += 2;
        a3 = 2;
        goto LABEL_22;
      }
    }
    if (a3) {
      goto LABEL_22;
    }
    if (*v8 == 48 && (v8[1] & 0xF8) == 0x30)
    {
      a3 = 8;
      ++v8;
      goto LABEL_22;
    }
  }
  int v10 = 8;
LABEL_27:
  uint64_t v11 = 0;
  HIDWORD(v12) = v10;
  LODWORD(v12) = v10;
  switch((v12 >> 1))
  {
    case 0u:
      if (v8 >= v6) {
        goto LABEL_54;
      }
      uint64_t v11 = 0;
      uint64_t v13 = (char *)(&__s[v4] - v8);
      do
      {
        int v14 = *v8;
        if ((v14 - 50) < 0xFFFFFFFE) {
          break;
        }
        ++v8;
        uint64_t v11 = (v14 + 2 * v11 - 48);
        --v13;
      }
      while (v13);
      break;
    case 3u:
      if (v8 >= v6) {
        goto LABEL_54;
      }
      uint64_t v11 = 0;
      unsigned int v15 = (char *)(&__s[v4] - v8);
      do
      {
        int v16 = *v8;
        if ((v16 - 56) < 0xFFFFFFF8) {
          break;
        }
        ++v8;
        uint64_t v11 = (v16 + 8 * v11 - 48);
        --v15;
      }
      while (v15);
      break;
    case 4u:
      int v17 = *v8;
      if (v17 == 45 || v17 == 43) {
        ++v8;
      }
      unsigned int v18 = 0;
      while (v8 < v6)
      {
        int v20 = *v8++;
        int v19 = v20;
        if (v20 != 44)
        {
          unsigned int v21 = v19 - 48;
          if (v21 > 9) {
            break;
          }
          unsigned int v18 = v21 + 10 * v18;
        }
      }
      if (v17 == 45) {
        uint64_t v11 = -v18;
      }
      else {
        uint64_t v11 = v18;
      }
      break;
    case 7u:
      if (v8 >= v6)
      {
LABEL_54:
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v22 = (char *)(&__s[v4] - v8);
        uint64_t v23 = MEMORY[0x1E4F14390];
        do
        {
          unsigned int v25 = *v8++;
          unsigned int v24 = v25;
          unsigned int v26 = v25 - 48;
          if (v25 - 48 > 9)
          {
            if ((*(_DWORD *)(v23 + 4 * v24 + 60) & 0x10000) == 0) {
              return v11;
            }
            uint64_t v11 = (__tolower(v24) + 16 * v11 - 87);
          }
          else
          {
            uint64_t v11 = v26 + 16 * v11;
          }
          --v22;
        }
        while (v22);
      }
      break;
    default:
      return v11;
  }
  return v11;
}

uint64_t TextToSourceVersion(char *__s, int64_t a2)
{
  int64_t v2 = a2;
  if (a2 == -1) {
    int64_t v2 = strlen(__s);
  }
  int64_t v4 = &__s[v2];
  if (v2 < 1)
  {
    unsigned int v6 = __s;
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14390];
    unsigned int v6 = __s;
    do
    {
      uint64_t v7 = *v6;
      if (*v6 < 0)
      {
        if (!__maskrune(v7, 0x4000uLL)) {
          break;
        }
      }
      else if ((*(_DWORD *)(v5 + 4 * v7 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v6;
    }
    while (v6 < v4);
  }
  if (v6 >= v4)
  {
    int v10 = 0;
    unsigned int v8 = 0;
  }
  else
  {
    unsigned int v8 = 0;
    uint64_t v9 = (char *)(&__s[v2] - v6);
    while (1)
    {
      int v10 = *v6;
      if ((v10 - 48) > 9 || v8 >= 0x346DC) {
        break;
      }
      unsigned int v8 = v10 - 48 + 10 * v8;
      ++v6;
      if (!--v9)
      {
        unsigned int v6 = &__s[v2];
        break;
      }
    }
    if (v8 > 0x346DB) {
      return 0;
    }
  }
  if (v10 == 46) {
    unint64_t v12 = v6 + 1;
  }
  else {
    unint64_t v12 = v6;
  }
  if (v12 >= v4)
  {
    unsigned int v13 = 0;
  }
  else
  {
    unsigned int v13 = 0;
    while (1)
    {
      int v10 = *v12;
      if ((v10 - 48) > 9 || v13 > 0x63) {
        break;
      }
      unsigned int v13 = v10 - 48 + 10 * v13;
      if (++v12 >= v4)
      {
        unint64_t v12 = &__s[v2];
        break;
      }
    }
    if (v13 > 0x63) {
      return 0;
    }
  }
  if (v10 == 46) {
    ++v12;
  }
  if (v12 >= v4)
  {
    unsigned int v14 = 0;
  }
  else
  {
    unsigned int v14 = 0;
    do
    {
      unsigned int v15 = *v12 - 48;
      if (v15 > 9) {
        break;
      }
      if (v14 > 0x63) {
        break;
      }
      unsigned int v14 = v15 + 10 * v14;
      ++v12;
    }
    while (v12 < v4);
    if (v14 > 0x63) {
      return 0;
    }
  }
  return 10000 * v8 + 100 * v13 + v14;
}

char *SourceVersionToCString(unsigned int a1, char *__str)
{
  if (a1 % 0x64)
  {
    snprintf(__str, 0x10uLL, "%u.%u.%u");
  }
  else if (a1 / 0x64 == 100 * ((42949673 * (unint64_t)(a1 / 0x64)) >> 32))
  {
    snprintf(__str, 0x10uLL, "%u");
  }
  else
  {
    snprintf(__str, 0x10uLL, "%u.%u");
  }
  return __str;
}

uint64_t HexToDataCopy(char *a1, int64_t a2, char a3, void *a4, unint64_t *a5, char **a6)
{
  unint64_t v15 = 0;
  HexToData(a1, a2, a3, 0, 0, 0, &v15, 0);
  unint64_t v12 = malloc_type_malloc(v15 + 1, 0x316D1E43uLL);
  if (!v12) {
    return 4294960568;
  }
  unsigned int v13 = v12;
  HexToData(a1, a2, a3, (uint64_t)v12, v15, a5, 0, a6);
  uint64_t result = 0;
  v13[v15] = 0;
  *a4 = v13;
  return result;
}

unsigned char *DataToHexCStringEx(unsigned __int8 *a1, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  int64_t v4 = a3;
  if (a2 >= 1)
  {
    uint64_t v5 = &a1[a2];
    unsigned int v6 = a3;
    do
    {
      unsigned int v7 = *a1++;
      unsigned char *v6 = *(unsigned char *)(a4 + ((unint64_t)v7 >> 4));
      int64_t v4 = v6 + 2;
      v6[1] = *(unsigned char *)(a4 + (v7 & 0xF));
      v6 += 2;
    }
    while (a1 < v5);
  }
  unsigned char *v4 = 0;
  return a3;
}

char *UUIDtoCString(unsigned char *a1, int a2, char *__str)
{
  return UUIDtoCStringFlags(a1, 16, 0, a2 != 0, __str, 0);
}

char *UUIDtoCStringEx(unsigned char *a1, uint64_t a2, int a3, long long *a4, char *a5)
{
  return UUIDtoCStringFlags(a1, a2, a4, a3 != 0, a5, 0);
}

uint64_t StringToUUID(char *a1, size_t a2, int a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return StringToUUIDEx(a1, a2, a3, 0, a4, a6, a7, a8);
}

uint64_t memicmp(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  int64_t v4 = a1;
  unint64_t v5 = (unint64_t)&a1[a3];
  while (1)
  {
    if ((unint64_t)v4 >= v5) {
      return 0;
    }
    __darwin_ct_rune_t v6 = *a2;
    __darwin_ct_rune_t v7 = __tolower(*v4);
    __darwin_ct_rune_t v8 = __tolower(v6);
    if (v7 < v8) {
      break;
    }
    ++a2;
    ++v4;
    if (v7 > v8) {
      return 1;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t snprintf_add(char **a1, char *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = *a1;
  size_t v10 = a2 - *a1;
  if (a2 == *a1) {
    return 4294960533;
  }
  uint64_t result = vsnprintf(*a1, v10, a3, &a9);
  if ((result & 0x80000000) == 0)
  {
    unsigned int v14 = &v9[result];
    if ((int)result < (int)v10)
    {
      uint64_t result = 0;
    }
    else
    {
      unsigned int v14 = a2;
      uint64_t result = 4294960545;
    }
    *a1 = v14;
  }
  return result;
}

uint64_t strcmp_prefix(unsigned __int8 *a1, unsigned char *a2)
{
  unsigned int v2 = *a2;
  if (!*a2) {
    return 0;
  }
  int v3 = a2 + 1;
  while (1)
  {
    unsigned int v4 = *a1;
    if (v4 < v2) {
      return 0xFFFFFFFFLL;
    }
    if (v4 > v2) {
      break;
    }
    ++a1;
    unsigned int v5 = *v3++;
    unsigned int v2 = v5;
    if (!v5) {
      return 0;
    }
  }
  return 1;
}

uint64_t stricmp_prefix(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    __darwin_ct_rune_t v4 = __tolower(*a1);
    uint64_t result = __tolower(*a2);
    if (!result) {
      break;
    }
    if (v4 < (int)result) {
      return 0xFFFFFFFFLL;
    }
    if (v4 > (int)result) {
      return 1;
    }
    ++a1;
    ++a2;
  }
  return result;
}

uint64_t strncmp_prefix(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  __darwin_ct_rune_t v4 = a3;
  while (v3)
  {
    unsigned int v6 = *v4++;
    unsigned int v5 = v6;
    if (!v6) {
      return 0;
    }
    unsigned int v8 = *a1++;
    unsigned int v7 = v8;
    if (v8 < v5) {
      return 0xFFFFFFFFLL;
    }
    --v3;
    if (v7 > v5) {
      return 1;
    }
  }
  if (a3[a2]) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t strnicmp_prefix(unsigned __int8 *a1, uint64_t a2, unsigned char *a3)
{
  if (a2)
  {
    uint64_t v4 = a2;
    while (1)
    {
      __darwin_ct_rune_t v6 = __tolower(*a1);
      uint64_t result = __tolower(*a3);
      if (!result) {
        break;
      }
      --v4;
      if (v6 < (int)result) {
        return 0xFFFFFFFFLL;
      }
      if (v6 > (int)result) {
        return 1;
      }
      ++a1;
      ++a3;
      if (!v4) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    if (*a3) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t strncmpx(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  uint64_t v4 = a3;
  while (v3)
  {
    unsigned int v6 = *a1++;
    unsigned int v5 = v6;
    unsigned int v8 = *v4++;
    unsigned int v7 = v8;
    BOOL v9 = v5 > v8;
    if (v5 < v8) {
      return 0xFFFFFFFFLL;
    }
    if (v9) {
      return 1;
    }
    --v3;
    if (!v7) {
      return 0;
    }
  }
  if (a3[a2]) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t strnicmp_suffix(uint64_t a1, size_t a2, char *__s)
{
  size_t v5 = 0;
  if (a2)
  {
    while (*(unsigned char *)(a1 + v5))
    {
      if (a2 == ++v5)
      {
        size_t v5 = a2;
        break;
      }
    }
  }
  size_t v6 = strlen(__s);
  if (v5 < v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v6;
  BOOL v9 = (unsigned __int8 *)(a1 + v5 - v6);
  return strnicmpx(v9, v8, __s);
}

unsigned char *stristr(unsigned char *a1, unsigned char *a2)
{
  if (a2 && *a2)
  {
    __darwin_ct_rune_t v4 = __tolower(*a2);
    while (*a1)
    {
      if (__tolower(*a1) == v4)
      {
        uint64_t v5 = 1;
        do
        {
          __darwin_ct_rune_t v6 = __tolower(a1[v5]);
          __darwin_ct_rune_t v7 = __tolower(a2[v5++]);
          if (v6) {
            BOOL v8 = v6 == v7;
          }
          else {
            BOOL v8 = 0;
          }
        }
        while (v8);
        if (!v7) {
          return a1;
        }
      }
      ++a1;
    }
    return 0;
  }
  return a1;
}

const char *strncasestr(const char *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = (const char *)(a2 + 1);
  __darwin_ct_rune_t v6 = __tolower(*a2) << 24;
  if (v6)
  {
    size_t v7 = strlen(v5);
    for (size_t i = a3 - 1; i != -1; --i)
    {
      __darwin_ct_rune_t v9 = __tolower(*(unsigned __int8 *)a1) << 24;
      if (!v9) {
        break;
      }
      if (v9 == v6)
      {
        if (v7 > i) {
          return 0;
        }
        if (!strncasecmp(a1 + 1, v5, v7)) {
          return a1;
        }
      }
      ++a1;
    }
    return 0;
  }
  return a1;
}

unint64_t memrchr(unint64_t a1, int a2, uint64_t a3)
{
  unint64_t result = a1 + a3;
  while (result > a1)
  {
    int v5 = *(unsigned __int8 *)--result;
    if (v5 == a2) {
      return result;
    }
  }
  return 0;
}

uint64_t memrlen(uint64_t a1, uint64_t a2)
{
  while (a2)
  {
    uint64_t v2 = a2 - 1;
    if (*(unsigned __int8 *)(a1 - 1 + a2--)) {
      return v2 + 1;
    }
  }
  return 0;
}

char *CUTrimText(char *a1, char *a2, char **a3)
{
  __darwin_ct_rune_t v4 = a2;
  int v5 = a1;
  uint64_t v6 = MEMORY[0x1E4F14390];
  if (a1 < a2)
  {
    uint64_t v7 = a2 - a1;
    while (1)
    {
      uint64_t v8 = *v5;
      if (*v5 < 0)
      {
        if (!__maskrune(v8, 0x4000uLL)) {
          break;
        }
      }
      else if ((*(_DWORD *)(v6 + 4 * v8 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v5;
      if (!--v7)
      {
        int v5 = v4;
        break;
      }
    }
  }
  while (1)
  {
    __darwin_ct_rune_t v9 = v4;
    if (v5 >= v4) {
      break;
    }
    --v4;
    uint64_t v10 = *(v9 - 1);
    if (*(v9 - 1) < 0)
    {
      if (!__maskrune(v10, 0x4000uLL)) {
        break;
      }
    }
    else if ((*(_DWORD *)(v6 + 4 * v10 + 60) & 0x4000) == 0)
    {
      break;
    }
  }
  *a3 = v9;
  return v5;
}

uint64_t TruncatedUTF8Length(char *__s, size_t a2, unint64_t a3)
{
  if (a2 == -1) {
    a2 = strlen(__s);
  }
  if (a2 >= a3) {
    uint64_t result = a3;
  }
  else {
    uint64_t result = a2;
  }
  if (result)
  {
    do
    {
      uint64_t v6 = result - 1;
      if ((__s[result - 1] & 0x80000000) == 0) {
        return result;
      }
      char v7 = 0;
      unsigned int v8 = __s[result - 1];
      unsigned int v9 = 1;
      if (result == 1 || v8 > 0xBF)
      {
        LOBYTE(v14) = 0;
      }
      else
      {
        char v10 = 0;
        uint64_t v11 = result - 2;
        while (1)
        {
          char v7 = v8;
          unsigned int v12 = v9;
          if ((__s[v11] & 0x80000000) == 0) {
            break;
          }
          unsigned int v8 = __s[v11];
          ++v9;
          if (v11-- != 0)
          {
            char v10 = v7;
            if (v8 < 0xC0) {
              continue;
            }
          }
          uint64_t v6 = v11 + 1;
          unsigned int v14 = v12;
          goto LABEL_18;
        }
        unsigned int v14 = v9 - 1;
        uint64_t v6 = v11 + 1;
        char v7 = v10;
LABEL_18:
        if (v14 >= 6) {
          goto LABEL_22;
        }
      }
      if ((((255 << (v14 ^ 7)) | (1 << (6 - v14))) & v8) == (255 << (v14 ^ 7))
        && (v8 != 237 || (v7 & 0xF0) != 0xA0))
      {
        return v6 + v9;
      }
LABEL_22:
      uint64_t result = v6;
    }
    while (v6);
  }
  return result;
}

const char *GetLastFilePathSegment(const char *__s, uint64_t a2, size_t *a3)
{
  __darwin_ct_rune_t v4 = __s;
  if (a2 == -1)
  {
    for (size_t i = __s + 1; ; ++i)
    {
      if (*(i - 1) == 47)
      {
        __darwin_ct_rune_t v4 = i;
      }
      else if (!*(i - 1))
      {
        if (a3)
        {
          size_t v8 = strlen(v4);
          long long __s = v4;
          goto LABEL_18;
        }
        return v4;
      }
    }
  }
  unint64_t v5 = (unint64_t)&__s[a2];
  if (a2 < 1)
  {
    if (!a3) {
      return __s;
    }
  }
  else
  {
    do
    {
      int v6 = *(unsigned __int8 *)v4++;
      if (v6 == 47) {
        long long __s = v4;
      }
    }
    while ((unint64_t)v4 < v5);
    if (!a3) {
      return __s;
    }
  }
  size_t v8 = v5 - (void)__s;
LABEL_18:
  *a3 = v8;
  return __s;
}

uint64_t LevenshteinDistance(char *__s, uint64_t a2, char *a3, size_t a4, int a5, int a6, uint64_t a7, int a8, int *a9)
{
  int v12 = a2;
  if (a2 == -1) {
    int v12 = strlen(__s);
  }
  unsigned int v14 = a9;
  if (a4 == -1) {
    a4 = strlen(a3);
  }
  size_t v15 = (uint64_t)((a4 << 32) + 0x100000000) >> 30;
  int v16 = malloc_type_malloc(v15, 0x100004052888210uLL);
  if (!v16)
  {
    uint64_t v42 = 0x7FFFFFFFLL;
    int v43 = -6728;
    if (!a9) {
      return v42;
    }
    goto LABEL_34;
  }
  int v17 = v16;
  unsigned int v18 = malloc_type_malloc(v15, 0x100004052888210uLL);
  if (v18)
  {
    int v19 = v18;
    int v20 = malloc_type_malloc(v15, 0x100004052888210uLL);
    if (v20)
    {
      if ((a4 & 0x80000000) == 0)
      {
        int v21 = 0;
        uint64_t v22 = (a4 + 1);
        uint64_t v23 = v19;
        do
        {
          *v23++ = v21;
          v21 += a7;
          --v22;
        }
        while (v22);
      }
      uint64_t v45 = a4 << 32;
      if (v12 < 1)
      {
        uint64_t v41 = v20;
      }
      else
      {
        uint64_t v24 = 0;
        uint64_t v46 = v12;
        int v47 = a4;
        uint64_t v53 = a4;
        do
        {
          uint64_t v51 = v19;
          uint64_t v52 = v17;
          uint64_t v48 = v24 + 1;
          uint64_t v50 = v20;
          _DWORD *v20 = (v24 + 1) * a8;
          if ((int)a4 >= 1)
          {
            uint64_t v25 = 0;
            unsigned int v26 = v19 + 1;
            size_t v27 = v20 + 1;
            do
            {
              uint64_t v28 = a7;
              int v29 = *(v26 - 1);
              __darwin_ct_rune_t v30 = __tolower(__s[v24]);
              __darwin_ct_rune_t v31 = __tolower(a3[v25]);
              int v32 = a6;
              if (v30 == v31) {
                int v32 = 0;
              }
              int v33 = v32 + v29;
              *size_t v27 = v33;
              if (v24)
              {
                if (v25)
                {
                  __darwin_ct_rune_t v34 = __tolower(__s[(v24 - 1)]);
                  if (v34 == __tolower(a3[v25]))
                  {
                    __darwin_ct_rune_t v35 = __tolower(__s[v24]);
                    uint64_t v36 = (v25 - 1);
                    if (v35 == __tolower(a3[v36]))
                    {
                      int v37 = v52[v36] + a5;
                      if (v33 > v37) {
                        *size_t v27 = v37;
                      }
                    }
                  }
                }
              }
              int v38 = *v27;
              int v39 = *v26 + a8;
              if (*v27 > v39)
              {
                *size_t v27 = v39;
                int v38 = v39;
              }
              a7 = v28;
              int v40 = *(v27 - 1) + v28;
              if (v38 > v40) {
                *size_t v27 = v40;
              }
              ++v25;
              ++v26;
              ++v27;
            }
            while (v53 != v25);
          }
          LODWORD(a4) = v47;
          ++v24;
          int v17 = v51;
          uint64_t v41 = v52;
          int v20 = v52;
          int v19 = v50;
        }
        while (v48 != v46);
      }
      uint64_t v42 = *(unsigned int *)((char *)v19 + (v45 >> 30));
      free(v17);
      int v43 = 0;
      int v17 = v19;
      int v19 = v41;
      unsigned int v14 = a9;
    }
    else
    {
      uint64_t v42 = 0x7FFFFFFFLL;
      int v43 = -6728;
    }
    free(v17);
    int v17 = v19;
  }
  else
  {
    uint64_t v42 = 0x7FFFFFFFLL;
    int v43 = -6728;
  }
  free(v17);
  if (v14) {
LABEL_34:
  }
    *unsigned int v14 = v43;
  return v42;
}

uint64_t MapStringToValue(char *__s1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v16 = (const char **)&a9;
  while (1)
  {
    uint64_t v11 = v16;
    int v17 = (unsigned int *)(v16 + 1);
    int v12 = *v11;
    if (!*v11) {
      break;
    }
    unsigned int v13 = v17;
    int v16 = (const char **)(v17 + 2);
    uint64_t v14 = *v13;
    if (!strcmp(__s1, v12)) {
      return v14;
    }
  }
  return a2;
}

const char *MIMETypeToExtension(uint64_t a1)
{
  v3[0] = a1;
  v3[1] = 0;
  uint64_t v1 = bsearch(v3, kMIMEMap, 0x10uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_MIMETypeMatch);
  if (v1) {
    return (const char *)v1[1];
  }
  else {
    return "";
  }
}

uint64_t _MIMETypeMatch(const char **a1, const char **a2)
{
  return strcasecmp(*a1, *a2);
}

uint64_t NMEAParse(uint64_t a1, char a2, char *__s, int64_t a4, char **a5)
{
  int64_t v6 = a4;
  if (a4 == -1) {
    int64_t v6 = strlen(__s);
  }
  char v10 = &__s[v6];
  *(_DWORD *)(a1 + 308) = 0;
  *(_OWORD *)(a1 + 244) = 0u;
  *(_OWORD *)(a1 + 228) = 0u;
  *(_OWORD *)(a1 + 212) = 0u;
  *(_OWORD *)(a1 + 196) = 0u;
  *(_OWORD *)(a1 + 180) = 0u;
  *(_OWORD *)(a1 + 164) = 0u;
  *(_OWORD *)(a1 + 148) = 0u;
  *(_OWORD *)(a1 + 132) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 276) = 0u;
  *(_OWORD *)(a1 + 292) = 0u;
  *(_OWORD *)(a1 + 260) = 0u;
  *(_DWORD *)a1 = a2 & 0x10;
  if ((a2 & 8) != 0)
  {
    uint64_t v11 = __s;
    if (v6 >= 1)
    {
      uint64_t v11 = __s;
      do
      {
        if (*v11 == 36) {
          break;
        }
        ++v11;
      }
      while (v11 < v10);
    }
  }
  else
  {
    uint64_t v11 = __s;
    if (v6 >= 1)
    {
      uint64_t v12 = MEMORY[0x1E4F14390];
      uint64_t v11 = __s;
      do
      {
        uint64_t v13 = *v11;
        if (*v11 < 0)
        {
          if (!__maskrune(v13, 0x4000uLL)) {
            break;
          }
        }
        else if ((*(_DWORD *)(v12 + 4 * v13 + 60) & 0x4000) == 0)
        {
          break;
        }
        ++v11;
      }
      while (v11 < v10);
    }
  }
  if (v11 >= v10)
  {
    if (a5) {
      *a5 = v11;
    }
    return 4294960569;
  }
  if (*v11 == 36)
  {
    ++v11;
    *(_DWORD *)a1 |= 1u;
  }
  uint64_t v14 = v11;
  if (v11 < v10)
  {
    size_t v15 = (char *)(&__s[v6] - v11);
    uint64_t v14 = v11;
    while (1)
    {
      int v16 = *v14;
      if (v16 == 10 || v16 == 13) {
        break;
      }
      ++v14;
      if (!--v15)
      {
        uint64_t v14 = &__s[v6];
        break;
      }
    }
  }
  if (a5)
  {
    unsigned int v18 = v14;
    if (v14 < v10)
    {
      int v19 = (char *)(&__s[v6] - v14);
      unsigned int v18 = v14;
      while (1)
      {
        int v20 = *v18;
        if (v20 != 13 && v20 != 10) {
          break;
        }
        ++v18;
        if (!--v19)
        {
          unsigned int v18 = &__s[v6];
          break;
        }
      }
    }
    *a5 = v18;
  }
  if (v11 >= v14)
  {
LABEL_42:
    uint64_t v24 = v14;
  }
  else
  {
    unsigned __int8 v22 = 0;
    uint64_t v23 = v11;
    uint64_t v24 = v11;
    while (1)
    {
      int v25 = *v24;
      if (v25 == 42) {
        break;
      }
      v22 ^= v25;
      ++v24;
      if (v14 == ++v23) {
        goto LABEL_42;
      }
    }
    if (v14 - v24 >= 3)
    {
      uint64_t v27 = v24[1];
      if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v27 + 60) & 0x10000) != 0)
      {
        uint64_t v28 = v24[2];
        if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v28 + 60) & 0x10000) != 0)
        {
          unsigned int v29 = v27 - 48;
          unsigned int v30 = v27 - 65;
          if ((v27 - 97) >= 6) {
            char v31 = 0;
          }
          else {
            char v31 = v27 - 87;
          }
          char v32 = v27 - 55;
          if (v30 > 5) {
            char v32 = v31;
          }
          if (v29 < 0xA) {
            char v32 = v29;
          }
          char v33 = 16 * v32;
          unsigned int v34 = v28 - 48;
          unsigned int v35 = v28 - 65;
          if ((v28 - 97) >= 6) {
            char v36 = 0;
          }
          else {
            char v36 = v28 - 87;
          }
          char v37 = v28 - 55;
          if (v35 > 5) {
            char v37 = v36;
          }
          if (v34 < 0xA) {
            char v37 = v34;
          }
          if ((v37 | v33) == v22) {
            *(_DWORD *)a1 |= 2u;
          }
        }
      }
    }
    uint64_t v14 = v24;
  }
  if (v11 >= v24)
  {
    *(unsigned char *)(a1 + 4) = 0;
    int v38 = (const char *)(a1 + 4);
    int v39 = v11;
    goto LABEL_79;
  }
  if (*v11 == 44)
  {
    *(unsigned char *)(a1 + 4) = 0;
    int v38 = (const char *)(a1 + 4);
    int v39 = v11;
LABEL_77:
    if (*v39 == 44) {
      ++v39;
    }
    goto LABEL_79;
  }
  int v40 = 0;
  while (&v14[~(unint64_t)v11] != v40)
  {
    int v41 = (v40++)[(void)v11 + 1];
    if (v41 == 44)
    {
      int v39 = &v40[(void)v11];
      goto LABEL_75;
    }
  }
  int v39 = v14;
LABEL_75:
  if ((unint64_t)(v39 - v11) > 7) {
    return 4294960540;
  }
  int v38 = (const char *)(a1 + 4);
  memcpy((void *)(a1 + 4), v11, v39 - v11);
  *(unsigned char *)(a1 + 4 + v39 - v11) = 0;
  if (v39 < v24) {
    goto LABEL_77;
  }
LABEL_79:
  if (!strcasecmp(v38, "GPGGA"))
  {
    uint64_t v148 = 0;
    HIDWORD(v147) = 0;
    int v102 = 1;
    while (1)
    {
      uint64_t v103 = v39;
      if (v39 >= v24)
      {
LABEL_99:
        uint64_t v105 = v14;
        int v39 = v24;
        if (v103 == v24)
        {
LABEL_234:
          uint64_t result = 0;
          *(_DWORD *)a1 |= 4u;
          return result;
        }
      }
      else
      {
        int64_t v104 = v14 - v39;
        uint64_t v105 = v39;
        while (*v105 != 44)
        {
          ++v105;
          if (!--v104) {
            goto LABEL_99;
          }
        }
        int v39 = v105 + 1;
      }
      size_t v106 = v105 - v103;
      switch(v102)
      {
        case 1:
          if ((int)SNScanF(v103, v106, "%2u%2u%lf", v42, v43, v44, v45, v46, (int)&v148 + 4) < 3) {
            return 4294960554;
          }
          *(double *)(a1 + 16) = (double)(3600 * HIDWORD(v148) + 60 * v148) + 0.0;
          goto LABEL_125;
        case 2:
          if (SNScanF(v103, v106, "%2u%lf", v42, v43, v44, v45, v46, (int)&v147 + 4) != 2) {
            return 4294960554;
          }
          LODWORD(v107) = HIDWORD(v147);
          *(double *)(a1 + 24) = 0.0 / 60.0 + (double)v107;
          goto LABEL_125;
        case 3:
          if (v105 == v103) {
            char v108 = 63;
          }
          else {
            char v108 = *v103;
          }
          *(unsigned char *)(a1 + 32) = v108;
          goto LABEL_125;
        case 4:
          if (SNScanF(v103, v106, "%3u%lf", v42, v43, v44, v45, v46, (int)&v147 + 4) != 2) {
            return 4294960554;
          }
          LODWORD(v109) = HIDWORD(v147);
          *(double *)(a1 + 40) = 0.0 / 60.0 + (double)v109;
LABEL_125:
          ++v102;
          break;
        case 5:
          if (v105 == v103) {
            char v110 = 63;
          }
          else {
            char v110 = *v103;
          }
          *(unsigned char *)(a1 + 48) = v110;
          goto LABEL_125;
        case 6:
          if (v105 == v103) {
            char v111 = 63;
          }
          else {
            char v111 = *v103;
          }
          *(unsigned char *)(a1 + 49) = v111;
          goto LABEL_125;
        case 7:
          SNScanF(v103, v106, "%u", v42, v43, v44, v45, v46, a1 + 52);
          goto LABEL_125;
        case 8:
          SNScanF(v103, v106, "%lf", v42, v43, v44, v45, v46, a1 + 56);
          goto LABEL_125;
        case 9:
          SNScanF(v103, v106, "%lf", v42, v43, v44, v45, v46, a1 + 64);
          goto LABEL_125;
        case 10:
          if (v105 == v103) {
            char v112 = 63;
          }
          else {
            char v112 = *v103;
          }
          *(unsigned char *)(a1 + 72) = v112;
          goto LABEL_125;
        case 11:
          int v113 = a1 + 80;
          goto LABEL_124;
        case 12:
          if (v105 == v103) {
            char v114 = 63;
          }
          else {
            char v114 = *v103;
          }
          *(unsigned char *)(a1 + 88) = v114;
          goto LABEL_125;
        case 13:
          int v113 = a1 + 96;
LABEL_124:
          SNScanF(v103, v106, "%lf", v42, v43, v44, v45, v46, v113);
          goto LABEL_125;
        case 14:
          SNScanF(v103, v106, "%.s", v42, v43, v44, v45, v46, 8);
          goto LABEL_125;
        default:
          goto LABEL_125;
      }
    }
  }
  if (!strcasecmp(v38, "GPGLL"))
  {
    int v115 = 1;
    uint64_t v147 = 0;
    uint64_t v148 = 0;
    while (1)
    {
      uint64_t v116 = v39;
      if (v39 >= v24)
      {
LABEL_142:
        uint64_t v118 = v14;
        int v39 = v24;
        if (v116 == v24) {
          goto LABEL_234;
        }
      }
      else
      {
        int64_t v117 = v14 - v39;
        uint64_t v118 = v39;
        while (*v118 != 44)
        {
          ++v118;
          if (!--v117) {
            goto LABEL_142;
          }
        }
        int v39 = v118 + 1;
      }
      size_t v119 = v118 - v116;
      switch(v115)
      {
        case 1:
          if (SNScanF(v116, v119, "%2u%lf", v47, v48, v49, v50, v51, (int)&v147) != 2) {
            return 4294960554;
          }
          LODWORD(v120) = v147;
          *(double *)(a1 + 16) = 0.0 / 60.0 + (double)v120;
          break;
        case 2:
          if (v118 == v116) {
            char v121 = 63;
          }
          else {
            char v121 = *v116;
          }
          *(unsigned char *)(a1 + 24) = v121;
          break;
        case 3:
          if (SNScanF(v116, v119, "%3u%lf", v47, v48, v49, v50, v51, (int)&v147) != 2) {
            return 4294960554;
          }
          LODWORD(v122) = v147;
          *(double *)(a1 + 32) = 0.0 / 60.0 + (double)v122;
          break;
        case 4:
          if (v118 == v116) {
            char v123 = 63;
          }
          else {
            char v123 = *v116;
          }
          *(unsigned char *)(a1 + 40) = v123;
          break;
        case 5:
          if ((int)SNScanF(v116, v119, "%2u%2u%2u%lf", v47, v48, v49, v50, v51, (int)&v148 + 4) < 3) {
            return 4294960554;
          }
          *(double *)(a1 + 48) = (double)(3600 * HIDWORD(v148) + 60 * v148 + HIDWORD(v147)) + 0.0;
          break;
        case 6:
          if (v118 == v116) {
            char v124 = 63;
          }
          else {
            char v124 = *v116;
          }
          *(unsigned char *)(a1 + 56) = v124;
          break;
        case 7:
          if (v118 == v116) {
            char v125 = 63;
          }
          else {
            char v125 = *v116;
          }
          *(unsigned char *)(a1 + 57) = v125;
          break;
        default:
          break;
      }
      ++v115;
    }
  }
  if (!strcasecmp(v38, "GPGSA"))
  {
    for (int i = 1; ; ++i)
    {
      uint64_t v127 = v39;
      if (v39 >= v24)
      {
LABEL_174:
        uint64_t v129 = v14;
        int v39 = v24;
        if (v127 == v24) {
          goto LABEL_234;
        }
      }
      else
      {
        int64_t v128 = v14 - v39;
        uint64_t v129 = v39;
        while (*v129 != 44)
        {
          ++v129;
          if (!--v128) {
            goto LABEL_174;
          }
        }
        int v39 = v129 + 1;
      }
      size_t v130 = v129 - v127;
      if ((i - 3) >= 0xC)
      {
        if (i <= 14)
        {
          if (i == 1)
          {
            if (v129 == v127) {
              char v132 = 63;
            }
            else {
              char v132 = *v127;
            }
            *(unsigned char *)(a1 + 16) = v132;
          }
          else if (i == 2)
          {
            if (v129 == v127) {
              char v131 = 63;
            }
            else {
              char v131 = *v127;
            }
            *(unsigned char *)(a1 + 17) = v131;
          }
        }
        else
        {
          switch(i)
          {
            case 15:
              SNScanF(v127, v130, "%lf", v52, v53, v54, v55, v56, a1 + 72);
              break;
            case 16:
              SNScanF(v127, v130, "%lf", v52, v53, v54, v55, v56, a1 + 80);
              break;
            case 17:
              SNScanF(v127, v130, "%lf", v52, v53, v54, v55, v56, a1 + 88);
              break;
          }
        }
      }
      else
      {
        SNScanF(v127, v130, "%u", v52, v53, v54, v55, v56, a1 + 20 + 4 * (i - 3));
      }
    }
  }
  if (!strcasecmp(v38, "GPGSV"))
  {
    int v133 = a1 + 32;
    int v134 = 1;
    while (1)
    {
      uint64_t v135 = v39;
      if (v39 >= v24)
      {
LABEL_202:
        id v137 = v14;
        int v39 = v24;
        if (v135 == v24) {
          goto LABEL_234;
        }
      }
      else
      {
        int64_t v136 = v14 - v39;
        id v137 = v39;
        while (*v137 != 44)
        {
          ++v137;
          if (!--v136) {
            goto LABEL_202;
          }
        }
        int v39 = v137 + 1;
      }
      size_t v138 = v137 - v135;
      switch(v134)
      {
        case 1:
          int v146 = a1 + 16;
          goto LABEL_217;
        case 2:
          int v146 = a1 + 20;
          goto LABEL_217;
        case 3:
          int v146 = a1 + 24;
LABEL_217:
          uint64_t v140 = "%d";
          goto LABEL_212;
        case 4:
        case 8:
        case 12:
        case 16:
          if (SNScanF(v135, v138, "%d", v57, v58, v59, v60, v61, v133 + 32 * ((v134 - 4) >> 2)) != 1)return 4294960554; {
          ++*(_DWORD *)(a1 + 28);
          }
          goto LABEL_213;
        case 5:
        case 9:
        case 13:
        case 17:
          int v139 = v133 + 32 * ((v134 - 4) >> 2) + 8;
          goto LABEL_211;
        case 6:
        case 10:
        case 14:
        case 18:
          int v139 = v133 + 32 * ((v134 - 4) >> 2) + 16;
          goto LABEL_211;
        case 7:
        case 11:
        case 15:
        case 19:
          int v139 = v133 + 32 * ((v134 - 4) >> 2) + 24;
LABEL_211:
          int v146 = v139;
          uint64_t v140 = "%lf";
LABEL_212:
          if (SNScanF(v135, v138, (unsigned __int8 *)v140, v57, v58, v59, v60, v61, v146) == 1) {
            goto LABEL_213;
          }
          return 4294960554;
        default:
LABEL_213:
          ++v134;
          break;
      }
    }
  }
  if (!strcasecmp(v38, "GPHDT"))
  {
    for (int j = 1; ; ++j)
    {
      if (v39 >= v24)
      {
LABEL_223:
        uint64_t v143 = v14;
        uint64_t v144 = v24;
        if (v39 == v24) {
          goto LABEL_234;
        }
      }
      else
      {
        int64_t v142 = v14 - v39;
        uint64_t v143 = v39;
        while (*v143 != 44)
        {
          ++v143;
          if (!--v142) {
            goto LABEL_223;
          }
        }
        uint64_t v144 = v143 + 1;
      }
      if (j == 2)
      {
        if (v143 == v39) {
          char v145 = 63;
        }
        else {
          char v145 = *v39;
        }
        *(unsigned char *)(a1 + 24) = v145;
      }
      else if (j == 1)
      {
        SNScanF(v39, v143 - v39, "%lf", v62, v63, v64, v65, v66, a1 + 16);
      }
      int v39 = v144;
    }
  }
  if (!strcasecmp(v38, "GPRMC"))
  {
    return _NMEAParseGPRMC(a1, v39, v24, v67, v68, v69, v70, v71);
  }
  else
  {
    if (!strcasecmp(v38, "GPVTG"))
    {
      _NMEAParseGPVTG(a1, v39, v24, v72, v73, v74, v75, v76);
      return 0;
    }
    if (!strcasecmp(v38, "GPZDA"))
    {
      return _NMEAParseGPZDA(a1, v39, v24, v77, v78, v79, v80, v81);
    }
    else
    {
      if (!strcasecmp(v38, "OHPR"))
      {
        _NMEAParseOHPR(a1, v39, v24, v82, v83, v84, v85, v86);
        return 0;
      }
      if (!strcasecmp(v38, "PAACD"))
      {
        return _NMEAParsePAACD(a1, v39, v24, v87, v88, v89, v90, v91);
      }
      else
      {
        if (strcasecmp(v38, "PAGCD"))
        {
          if (!strcasecmp(v38, "PASCD"))
          {
            return _NMEAParsePASCD(a1, v39, v24, v97, v98, v99, v100, v101);
          }
          return 0;
        }
        return _NMEAParsePAGCD(a1, v39, v24, v92, v93, v94, v95, v96);
      }
    }
  }
}

uint64_t _NMEAParseGPRMC(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = 0;
  char v31 = 0;
  int v11 = a1 + 88;
  int v12 = a1 + 72;
  int v13 = a1 + 64;
  int v14 = 1;
  uint64_t v29 = 0;
  while (2)
  {
    size_t v15 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      if (a2 == a3)
      {
        uint64_t result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
      char v31 = a2;
      int v17 = a3;
      a2 = a3;
    }
    else
    {
      uint64_t v16 = 0;
      while (1)
      {
        int v17 = &a2[v16];
        if (a2[v16] == 44) {
          break;
        }
        if (a3 - a2 == ++v16) {
          goto LABEL_6;
        }
      }
      char v31 = a2;
      a2 = v17 + 1;
    }
    size_t v18 = v17 - v15;
    switch(v14)
    {
      case 1:
        if ((int)SNScanF(v15, v18, "%2u%2u%2u%lf", a4, a5, a6, a7, a8, (int)&v30 + 4) < 3) {
          return 4294960554;
        }
        double v19 = (double)(3600 * HIDWORD(v30) + 60 * v30 + HIDWORD(v29)) + 0.0;
        *(double *)(a1 + 16) = v19;
        goto LABEL_26;
      case 2:
        if (v17 == v15) {
          char v20 = 63;
        }
        else {
          char v20 = *v15;
        }
        *(unsigned char *)(a1 + 24) = v20;
        goto LABEL_43;
      case 3:
        if (SNScanF(v15, v18, "%2u%lf", a4, a5, a6, a7, a8, (int)&v29) != 2) {
          return 4294960554;
        }
        LODWORD(v21) = v29;
        *(double *)(a1 + 32) = 0.0 / 60.0 + (double)v21;
        goto LABEL_43;
      case 4:
        if (v17 == v15) {
          char v22 = 63;
        }
        else {
          char v22 = *v15;
        }
        *(unsigned char *)(a1 + 40) = v22;
        goto LABEL_43;
      case 5:
        if (SNScanF(v15, v18, "%3u%lf", a4, a5, a6, a7, a8, (int)&v29) != 2) {
          return 4294960554;
        }
        LODWORD(v23) = v29;
        *(double *)(a1 + 48) = 0.0 / 60.0 + (double)v23;
        goto LABEL_43;
      case 6:
        if (v17 == v15) {
          char v24 = 63;
        }
        else {
          char v24 = *v15;
        }
        *(unsigned char *)(a1 + 56) = v24;
        goto LABEL_43;
      case 7:
        SNScanF(v15, v18, "%lf", a4, a5, a6, a7, a8, v13);
        goto LABEL_43;
      case 8:
        SNScanF(v15, v18, "%lf", a4, a5, a6, a7, a8, v12);
        goto LABEL_43;
      case 9:
        if (SNScanF(v15, v18, "%2u%2u%2u", a4, a5, a6, a7, a8, (int)&v29) == 3)
        {
          uint64_t v25 = YMD_HMStoSeconds(2000, v30, v29, 0, 0, 0, 0);
          *(_DWORD *)(a1 + 80) = (int)v25 / 86400;
          double v19 = (double)(v25 - 0xEB1E31100);
LABEL_26:
          *(double *)(a1 + 104) = *(double *)(a1 + 104) + v19;
LABEL_43:
          ++v14;
          continue;
        }
        return 4294960554;
      case 10:
        SNScanF(v15, v18, "%lf", a4, a5, a6, a7, a8, v11);
        goto LABEL_43;
      case 11:
        if (v17 == v15) {
          char v26 = 63;
        }
        else {
          char v26 = *v15;
        }
        *(unsigned char *)(a1 + 96) = v26;
        goto LABEL_43;
      case 12:
        if (v17 == v15) {
          char v27 = 63;
        }
        else {
          char v27 = *v15;
        }
        *(unsigned char *)(a1 + 97) = v27;
        goto LABEL_43;
      default:
        goto LABEL_43;
    }
  }
}

char *_NMEAParseGPVTG(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = a1 + 64;
  int v12 = a1 + 48;
  int v13 = a1 + 16;
  int v14 = a1 + 32;
  for (int i = 1; ; ++i)
  {
    uint64_t result = a2;
    if (a2 >= a3) {
      break;
    }
    int64_t v17 = a3 - a2;
    size_t v18 = a2;
    while (*v18 != 44)
    {
      ++v18;
      if (!--v17) {
        goto LABEL_6;
      }
    }
    a2 = v18 + 1;
LABEL_9:
    size_t v19 = v18 - result;
    switch(i)
    {
      case 1:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v13);
        break;
      case 2:
        if (v18 == result) {
          char v20 = 63;
        }
        else {
          char v20 = *result;
        }
        *(unsigned char *)(a1 + 24) = v20;
        break;
      case 3:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v14);
        break;
      case 4:
        if (v18 == result) {
          char v21 = 63;
        }
        else {
          char v21 = *result;
        }
        *(unsigned char *)(a1 + 40) = v21;
        break;
      case 5:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v12);
        break;
      case 6:
        if (v18 == result) {
          char v22 = 63;
        }
        else {
          char v22 = *result;
        }
        *(unsigned char *)(a1 + 56) = v22;
        break;
      case 7:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v11);
        break;
      case 8:
        if (v18 == result) {
          char v23 = 63;
        }
        else {
          char v23 = *result;
        }
        *(unsigned char *)(a1 + 72) = v23;
        break;
      case 9:
        if (v18 == result) {
          char v24 = 63;
        }
        else {
          char v24 = *result;
        }
        *(unsigned char *)(a1 + 73) = v24;
        break;
      default:
        continue;
    }
  }
LABEL_6:
  size_t v18 = a3;
  a2 = a3;
  if (result != a3) {
    goto LABEL_9;
  }
  *(_DWORD *)a1 |= 4u;
  return result;
}

uint64_t _NMEAParseGPZDA(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v23 = a1 + 16;
  int v24 = a1 + 48;
  int v21 = a1 + 40;
  int v22 = a1 + 44;
  int v11 = (_DWORD *)(a1 + 36);
  int v12 = (_DWORD *)(a1 + 32);
  int v13 = 1;
  while (1)
  {
    int v14 = a2;
    if (a2 >= a3) {
      break;
    }
    int64_t v15 = a3 - a2;
    uint64_t v16 = a2;
    while (*v16 != 44)
    {
      ++v16;
      if (!--v15) {
        goto LABEL_6;
      }
    }
    a2 = v16 + 1;
LABEL_9:
    size_t v17 = v16 - v14;
    switch(v13)
    {
      case 1:
        if (SNScanF(v14, v17, "%2u%2u%lf", a4, a5, a6, a7, a8, v23) == 3) {
          goto LABEL_20;
        }
        return 4294960554;
      case 2:
        SNScanF(v14, v17, "%u", a4, a5, a6, a7, a8, (int)v12);
        if (*v12 >= 0x20u) {
          return 4294960554;
        }
        goto LABEL_20;
      case 3:
        SNScanF(v14, v17, "%u", a4, a5, a6, a7, a8, (int)v11);
        if (*v11 < 0xDu) {
          goto LABEL_20;
        }
        return 4294960554;
      case 4:
        SNScanF(v14, v17, "%u", a4, a5, a6, a7, a8, v21);
        goto LABEL_20;
      case 5:
        int v18 = v22;
        goto LABEL_19;
      case 6:
        int v18 = v24;
LABEL_19:
        SNScanF(v14, v17, "%d", a4, a5, a6, a7, a8, v18);
        goto LABEL_20;
      default:
LABEL_20:
        ++v13;
        break;
    }
  }
LABEL_6:
  uint64_t v16 = a3;
  a2 = a3;
  if (v14 != a3) {
    goto LABEL_9;
  }
  uint64_t v19 = YMD_HMStoSeconds(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 20), 0, 730486);
  uint64_t result = 0;
  *(double *)(a1 + 56) = *(double *)(a1 + 24)
                       + (double)v19
                       + (double)(3600 * *(_DWORD *)(a1 + 44))
                       + (double)(60 * *(_DWORD *)(a1 + 48));
  *(_DWORD *)a1 |= 4u;
  return result;
}

uint64_t _NMEAParseOHPR(uint64_t result, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v10 = (_DWORD *)result;
  int v11 = result + 48;
  int v12 = result + 16;
  int v13 = result + 40;
  int v14 = result + 32;
  int v15 = result + 24;
  int v16 = 1;
  while (a2 < a3)
  {
    int64_t v17 = a3 - a2;
    int v18 = a2;
    while (*v18 != 44)
    {
      ++v18;
      if (!--v17) {
        goto LABEL_6;
      }
    }
    uint64_t v19 = v18 + 1;
LABEL_9:
    int v20 = v12;
    switch(v16)
    {
      case 1:
        goto LABEL_14;
      case 2:
        int v20 = v15;
        goto LABEL_14;
      case 3:
        int v20 = v14;
        goto LABEL_14;
      case 4:
        int v20 = v13;
        goto LABEL_14;
      case 5:
        int v20 = v11;
LABEL_14:
        uint64_t result = SNScanF(a2, v18 - a2, "%lf", a4, a5, a6, a7, a8, v20);
        break;
      default:
        break;
    }
    ++v16;
    a2 = v19;
  }
LABEL_6:
  int v18 = a3;
  uint64_t v19 = a3;
  if (a2 != a3) {
    goto LABEL_9;
  }
  *v10 |= 4u;
  return result;
}

uint64_t _NMEAParsePAACD(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = a1 + 32;
  int v27 = a1 + 24;
  int v28 = a1 + 16;
  int v25 = a1 + 32;
  __srCC_SHA1_CTX c = (void *)(a1 + 48);
  for (int i = 1; ; ++i)
  {
    int v13 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      int v15 = a3;
      a2 = a3;
      if (v13 == a3)
      {
        uint64_t result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
    }
    else
    {
      int64_t v14 = a3 - a2;
      int v15 = a2;
      while (*v15 != 44)
      {
        ++v15;
        if (!--v14) {
          goto LABEL_6;
        }
      }
      a2 = v15 + 1;
    }
    size_t v16 = v15 - v13;
    if (i == 3)
    {
      SNScanF(v13, v15 - v13, "%u", a4, a5, a6, a7, a8, v11);
      continue;
    }
    if (i == 2)
    {
      int v18 = v27;
      goto LABEL_15;
    }
    int v17 = i - 1;
    if (i == 1)
    {
      int v18 = v28;
LABEL_15:
      SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v18);
      continue;
    }
    if (i >= 4) {
      int v17 = i - 4;
    }
    uint64_t v19 = (uint64_t)v17 >> 2;
    if ((v17 >> 2) >= 8) {
      break;
    }
    LODWORD(v20) = __src;
    *(void *)(a1 + 40) = __src;
LABEL_24:
    int v21 = i - 4 - 4 * v19;
    if (v21 == 2)
    {
      SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v20 + 32 * v19 + 16);
    }
    else
    {
      if (v21 == 1)
      {
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v20 + 32 * v19 + 8);
      }
      else if (!v21)
      {
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v20 + 32 * v19);
        ++*(_DWORD *)(a1 + 36);
      }
      SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v20 + 32 * v19 + 24);
    }
LABEL_16:
    ;
  }
  if ((*(unsigned char *)a1 & 0x10) == 0) {
    goto LABEL_16;
  }
  if (v19 < *(_DWORD *)(a1 + 36))
  {
    int v20 = *(char **)(a1 + 40);
    goto LABEL_24;
  }
  size_t v16 = 32 * v19 + 32;
  int v22 = (char *)malloc_type_realloc(*(void **)(a1 + 304), v16, 0x5320506AuLL);
  if (v22)
  {
    int v20 = v22;
    if (!*(void *)(a1 + 304)) {
      memcpy(v22, __src, 32 * v19);
    }
    int v23 = &v20[32 * v19];
    *(_OWORD *)int v23 = 0u;
    *((_OWORD *)v23 + 1) = 0u;
    *(void *)(a1 + 304) = v20;
    *(void *)(a1 + 40) = v20;
    int v11 = v25;
    goto LABEL_24;
  }
  return 4294960568;
}

uint64_t _NMEAParsePAGCD(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = a1 + 24;
  __srCC_SHA1_CTX c = (void *)(a1 + 40);
  int v30 = a1 + 16;
  int v12 = 1;
  int v28 = a1 + 24;
  while (1)
  {
    int v13 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      int v15 = a3;
      a2 = a3;
      if (v13 == a3)
      {
        uint64_t result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
    }
    else
    {
      int64_t v14 = a3 - a2;
      int v15 = a2;
      while (*v15 != 44)
      {
        ++v15;
        if (!--v14) {
          goto LABEL_6;
        }
      }
      a2 = v15 + 1;
    }
    size_t v16 = v15 - v13;
    if (v12 == 2)
    {
      int v27 = v11;
      int v17 = v13;
      size_t v18 = v15 - v13;
      uint64_t v19 = "%u";
      goto LABEL_14;
    }
    if (v12 == 1)
    {
      int v27 = v30;
      int v17 = v13;
      size_t v18 = v15 - v13;
LABEL_12:
      uint64_t v19 = "%lf";
LABEL_14:
      SNScanF(v17, v18, (unsigned __int8 *)v19, a4, a5, a6, a7, a8, v27);
      goto LABEL_30;
    }
    if (v12 >= 3) {
      int v20 = v12 - 3;
    }
    else {
      int v20 = v12;
    }
    uint64_t v21 = (uint64_t)v20 >> 2;
    if ((v20 >> 2) < 8)
    {
      LODWORD(v22) = __src;
      *(void *)(a1 + 32) = __src;
      goto LABEL_23;
    }
    if ((*(unsigned char *)a1 & 0x10) == 0) {
      goto LABEL_30;
    }
    if (v21 >= *(_DWORD *)(a1 + 28)) {
      break;
    }
    int v22 = *(char **)(a1 + 32);
LABEL_23:
    int v23 = v12 - 3 - 4 * v21;
    switch(v23)
    {
      case 2:
        int v27 = v22 + 32 * v21 + 16;
        int v17 = v13;
        size_t v18 = v16;
        goto LABEL_12;
      case 1:
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v22 + 32 * v21 + 8);
        break;
      case 0:
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v22 + 32 * v21);
        ++*(_DWORD *)(a1 + 28);
        break;
    }
    SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v22 + 32 * v21 + 24);
LABEL_30:
    ++v12;
  }
  size_t v16 = 32 * v21 + 32;
  int v24 = (char *)malloc_type_realloc(*(void **)(a1 + 296), v16, 0xD7105D8CuLL);
  if (v24)
  {
    int v22 = v24;
    if (!*(void *)(a1 + 296)) {
      memcpy(v24, __src, 32 * v21);
    }
    int v25 = &v22[32 * v21];
    *(_OWORD *)int v25 = 0u;
    *((_OWORD *)v25 + 1) = 0u;
    *(void *)(a1 + 296) = v22;
    *(void *)(a1 + 32) = v22;
    int v11 = v28;
    goto LABEL_23;
  }
  return 4294960568;
}

uint64_t _NMEAParsePASCD(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = a1 + 32;
  int v12 = a1 + 16;
  __srCC_SHA1_CTX c = (void *)(a1 + 48);
  int v31 = a1 + 28;
  int v13 = 1;
  while (2)
  {
    int64_t v14 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      size_t v16 = a3;
      a2 = a3;
      if (v14 == a3)
      {
        uint64_t result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
    }
    else
    {
      int64_t v15 = a3 - a2;
      size_t v16 = a2;
      while (*v16 != 44)
      {
        ++v16;
        if (!--v15) {
          goto LABEL_6;
        }
      }
      a2 = v16 + 1;
    }
    size_t v17 = v16 - v14;
    switch(v13)
    {
      case 1:
        int v29 = v12;
        size_t v18 = v14;
        size_t v19 = v16 - v14;
        goto LABEL_32;
      case 2:
        if (v17) {
          char v23 = *v14;
        }
        else {
          char v23 = 63;
        }
        *(unsigned char *)(a1 + 24) = v23;
        goto LABEL_34;
      case 3:
        if (v17) {
          char v24 = *v14;
        }
        else {
          char v24 = 63;
        }
        *(unsigned char *)(a1 + 25) = v24;
        goto LABEL_34;
      case 4:
        int v29 = v31;
        goto LABEL_23;
      case 5:
        int v29 = v11;
LABEL_23:
        size_t v18 = v14;
        size_t v19 = v16 - v14;
        int v25 = "%u";
        goto LABEL_33;
      default:
        int v20 = v13 - 6;
        if (v13 < 6) {
          int v20 = v13 - 5;
        }
        uint64_t v21 = (uint64_t)v20 >> 1;
        if ((v20 >> 1) < 8)
        {
          LODWORD(v22) = __src;
          *(void *)(a1 + 40) = __src;
          goto LABEL_25;
        }
        if ((*(unsigned char *)a1 & 0x10) == 0) {
          goto LABEL_34;
        }
        if (v21 < *(_DWORD *)(a1 + 36))
        {
          int v22 = *(char **)(a1 + 40);
          goto LABEL_25;
        }
        size_t v17 = 16 * v21 + 16;
        char v26 = (char *)malloc_type_realloc(*(void **)(a1 + 176), v17, 0xD23C2302uLL);
        if (v26)
        {
          int v22 = v26;
          if (!*(void *)(a1 + 176)) {
            memcpy(v26, __src, 16 * v21);
          }
          int v27 = &v22[16 * v21];
          *(void *)int v27 = 0;
          *((void *)v27 + 1) = 0;
          *(void *)(a1 + 176) = v22;
          *(void *)(a1 + 40) = v22;
LABEL_25:
          if (v13)
          {
            int v29 = v22 + 16 * v21 + 8;
            size_t v18 = v14;
            size_t v19 = v17;
LABEL_32:
            int v25 = "%lf";
LABEL_33:
            SNScanF(v18, v19, (unsigned __int8 *)v25, a4, a5, a6, a7, a8, v29);
          }
          else
          {
            SNScanF(v14, v17, "%lf", a4, a5, a6, a7, a8, v22 + 16 * v21);
            ++*(_DWORD *)(a1 + 36);
          }
LABEL_34:
          ++v13;
          continue;
        }
        return 4294960568;
    }
  }
}

void NMEAFree(uint64_t a1)
{
  uint64_t v2 = (const char *)(a1 + 4);
  if (!strcmp((const char *)(a1 + 4), "PAACD"))
  {
    *(_DWORD *)(a1 + 36) = 0;
    *(void *)(a1 + 40) = 0;
    uint64_t v3 = *(void **)(a1 + 304);
    if (!v3) {
      return;
    }
    __darwin_ct_rune_t v4 = (void *)(a1 + 304);
    goto LABEL_10;
  }
  if (!strcmp(v2, "PAGCD"))
  {
    *(_DWORD *)(a1 + 28) = 0;
    *(void *)(a1 + 32) = 0;
    uint64_t v3 = *(void **)(a1 + 296);
    if (!v3) {
      return;
    }
    __darwin_ct_rune_t v4 = (void *)(a1 + 296);
    goto LABEL_10;
  }
  if (!strcmp(v2, "PASCD"))
  {
    unint64_t v5 = *(void **)(a1 + 176);
    __darwin_ct_rune_t v4 = (void *)(a1 + 176);
    uint64_t v3 = v5;
    *((_DWORD *)v4 - 35) = 0;
    *(v4 - 17) = 0;
    if (v5)
    {
LABEL_10:
      free(v3);
      void *v4 = 0;
    }
  }
}

uint64_t ParseCommandLineIntoArgV(const char *a1, unsigned int *a2, void *a3)
{
  unint64_t v5 = a1;
  int64_t v6 = strlen(a1);
  char v7 = malloc_type_malloc(v6 + 1, 0x77B79F79uLL);
  if (!v7) {
    return 4294960568;
  }
  size_t v8 = v7;
  unsigned int v9 = malloc_type_malloc(0x88uLL, 0x10040436913F5uLL);
  if (!v9)
  {
LABEL_57:
    uint64_t v28 = 4294960568;
    goto LABEL_53;
  }
  char v10 = v9;
  if (v6 < 1)
  {
    uint64_t v28 = 0;
    *unsigned int v9 = 0;
    *a2 = 0;
    *a3 = v9;
    goto LABEL_53;
  }
  uint64_t v11 = 0;
  int v12 = (unsigned __int8 *)&v5[v6];
  int v32 = 16;
  uint64_t v13 = MEMORY[0x1E4F14390];
  int64_t v14 = v8;
  do
  {
    while (1)
    {
      uint64_t v15 = *(unsigned __int8 *)v5;
      if (*v5 < 0)
      {
        if (__maskrune(v15, 0x4000uLL)) {
          goto LABEL_7;
        }
        break;
      }
      if ((*(_DWORD *)(v13 + 4 * v15 + 60) & 0x4000) == 0) {
        break;
      }
LABEL_7:
      if (++v5 >= (const char *)v12)
      {
        unsigned int v26 = v11;
        int v27 = v10;
        goto LABEL_50;
      }
    }
    int v30 = a3;
    int v31 = a2;
    uint64_t v16 = 0;
    int v17 = 0;
    size_t v18 = v14;
    size_t v19 = v5;
    while (1)
    {
      do
      {
        while (1)
        {
          unint64_t v5 = v19;
          uint64_t v20 = v16;
          while (1)
          {
            if (v5 >= (const char *)v12) {
              goto LABEL_42;
            }
            uint64_t v16 = v20;
            size_t v19 = v5 + 1;
            uint64_t v21 = *(unsigned __int8 *)v5;
            if (!v20) {
              break;
            }
            uint64_t v20 = 0;
            ++v5;
            if (v21 != 39) {
              goto LABEL_15;
            }
          }
          if (!v17) {
            break;
          }
          uint64_t v16 = 0;
          int v17 = 0;
          if (v21 != 34)
          {
            if (v21 != 92) {
              goto LABEL_34;
            }
            if (v19 >= (const char *)v12) {
              goto LABEL_33;
            }
            LODWORD(v21) = *(unsigned __int8 *)v19;
            if (v21 != 10)
            {
              if (v21 == 92 || v21 == 34)
              {
                uint64_t v16 = 0;
                size_t v19 = v5 + 2;
              }
              else
              {
LABEL_33:
                uint64_t v16 = 0;
                LOBYTE(v21) = 92;
              }
LABEL_34:
              int v17 = 1;
LABEL_15:
              *v18++ = v21;
              continue;
            }
            uint64_t v16 = 0;
            size_t v19 = v5 + 2;
LABEL_29:
            int v17 = 1;
          }
        }
        if (v21 == 34)
        {
          uint64_t v16 = 0;
          goto LABEL_29;
        }
        int v17 = 0;
        uint64_t v16 = 1;
      }
      while (v21 == 39);
      if (v21 != 92) {
        break;
      }
      if (v19 >= (const char *)v12)
      {
        uint64_t v16 = 0;
        int v17 = 0;
        LOBYTE(v21) = 92;
        goto LABEL_15;
      }
      uint64_t v16 = 0;
      size_t v19 = v5 + 2;
      LODWORD(v21) = *((unsigned __int8 *)v5 + 1);
      int v17 = 0;
      if (v21 != 10)
      {
        int v17 = 0;
        goto LABEL_15;
      }
    }
    if ((v21 & 0x80) != 0) {
      int v22 = __maskrune(*(unsigned __int8 *)v5, 0x4000uLL);
    }
    else {
      int v22 = *(_DWORD *)(v13 + 4 * v21 + 60) & 0x4000;
    }
    if (!v22)
    {
      uint64_t v16 = 0;
      int v17 = 0;
      goto LABEL_15;
    }
    ++v5;
LABEL_42:
    unsigned char *v18 = 0;
    char v23 = v18 + 1;
    a2 = v31;
    if (v11 < v32)
    {
      int v27 = v10;
      goto LABEL_49;
    }
    char v24 = malloc_type_malloc(8 * ((2 * v32) | 1), 0x10040436913F5uLL);
    if (!v24)
    {
      free(v10);
      goto LABEL_57;
    }
    int v27 = v24;
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
        v24[i] = *((void *)v10 + i);
    }
    v32 *= 2;
    free(v10);
    char v10 = v27;
LABEL_49:
    unsigned int v26 = v11 + 1;
    *((void *)v27 + v11++) = v14;
    int64_t v14 = v23;
    a3 = v30;
  }
  while (v5 < (const char *)v12);
LABEL_50:
  uint64_t v28 = 0;
  *((void *)v27 + v26) = 0;
  *a2 = v26;
  *a3 = v27;
  if (!v26) {
LABEL_53:
  }
    free(v8);
  return v28;
}

void FreeCommandLineArgV(int a1, void **a2)
{
  if (a2)
  {
    if (*a2) {
      free(*a2);
    }
    free(a2);
  }
}

uint64_t ParseCommaSeparatedNameValuePair(unsigned __int8 *a1, unint64_t a2, unsigned char *a3, uint64_t a4, void *a5, unsigned char *a6, void *a7, void *a8)
{
  uint64_t v13 = a1;
  if ((unint64_t)a1 >= a2)
  {
    uint64_t result = 4294960569;
    if (!a8) {
      return result;
    }
    goto LABEL_5;
  }
  uint64_t result = ParseEscapedString(a1, a2, 0x3Du, a3, a4, a5, &v13);
  if (!result) {
    uint64_t result = ParseEscapedString(v13, a2, 0x2Cu, a6, 256, a7, &v13);
  }
  if (a8) {
LABEL_5:
  }
    *a8 = v13;
  return result;
}

uint64_t ParseEscapedString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 a3, unsigned char *a4, uint64_t a5, void *a6, unsigned __int8 **a7)
{
  if (a5) {
    uint64_t v7 = a5 - 1;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((unint64_t)a1 < a2)
  {
    unint64_t v8 = (unint64_t)&a4[v7];
    unsigned int v9 = a4;
    while (1)
    {
      char v10 = a1 + 1;
      int v11 = *a1;
      if (v11 == a3)
      {
        ++a1;
        goto LABEL_19;
      }
      if (v11 == 92)
      {
        if ((unint64_t)v10 >= a2)
        {
          uint64_t v12 = 4294960546;
          if (!a6) {
            goto LABEL_23;
          }
LABEL_22:
          *a6 = v9 - a4;
          goto LABEL_23;
        }
        LOBYTE(v11) = a1[1];
        a1 += 2;
      }
      else
      {
        ++a1;
      }
      if ((unint64_t)v9 < v8)
      {
        if (a4) {
          *unsigned int v9 = v11;
        }
        ++v9;
      }
      if ((unint64_t)a1 >= a2) {
        goto LABEL_19;
      }
    }
  }
  unsigned int v9 = a4;
LABEL_19:
  uint64_t v12 = 0;
  if (a4) {
    *unsigned int v9 = 0;
  }
  char v10 = a1;
  if (a6) {
    goto LABEL_22;
  }
LABEL_23:
  if (a7) {
    *a7 = v10;
  }
  return v12;
}

uint64_t ParseLine(unint64_t a1, unint64_t a2, unint64_t *a3, void *a4, unint64_t *a5)
{
  if (a1 == a2) {
    return 0;
  }
  unint64_t v5 = a1;
  unint64_t v6 = a1;
  if (a1 >= a2)
  {
LABEL_10:
    *a3 = a1;
    *a4 = v5 - a1;
  }
  else
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = a1 + v7;
      int v9 = *(unsigned __int8 *)(a1 + v7);
      if (v9 == 10 || v9 == 13) {
        break;
      }
      if (a2 - a1 == ++v7)
      {
        unint64_t v5 = a2;
        unint64_t v6 = a2;
        goto LABEL_10;
      }
    }
    *a3 = a1;
    *a4 = v7;
    unint64_t v6 = v8 + 1;
    if (v9 == 13 && v6 < a2)
    {
      int v13 = *(unsigned __int8 *)(v8 + 1);
      unint64_t v14 = v8 + 2;
      if (v13 == 10) {
        unint64_t v6 = v14;
      }
    }
  }
  *a5 = v6;
  return 1;
}

uint64_t ReplaceDifferentString(void **a1, char *a2)
{
  uint64_t v2 = a2;
  __darwin_ct_rune_t v4 = (char *)*a1;
  if (a2) {
    unint64_t v5 = a2;
  }
  else {
    unint64_t v5 = "";
  }
  if (v4) {
    unint64_t v6 = v4;
  }
  else {
    unint64_t v6 = "";
  }
  uint64_t result = strcmp(v5, v6);
  if (result)
  {
    if (v2)
    {
      if (!*v2)
      {
        uint64_t v2 = 0;
        if (!v4) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      uint64_t v2 = strdup(v2);
      if (!v2) {
        return 4294960568;
      }
    }
    if (!v4)
    {
LABEL_13:
      uint64_t result = 0;
      *a1 = v2;
      return result;
    }
LABEL_12:
    free(v4);
    goto LABEL_13;
  }
  return result;
}

uint64_t ReplaceString(void **a1, size_t *a2, char *__s, size_t a4)
{
  size_t v4 = a4;
  if (__s)
  {
    if (a4 == -1) {
      size_t v4 = strlen(__s);
    }
    uint64_t v8 = malloc_type_malloc(v4 + 1, 0xEED87A76uLL);
    if (!v8) {
      return 4294960568;
    }
    int v9 = v8;
    memcpy(v8, __s, v4);
    v9[v4] = 0;
  }
  else
  {
    int v9 = 0;
  }
  if (*a1) {
    free(*a1);
  }
  *a1 = v9;
  uint64_t result = 0;
  if (a2) {
    *a2 = v4;
  }
  return result;
}

const char *GetFileExtensionFromString(char *a1)
{
  uint64_t v1 = strrchr(a1, 46);
  if (!v1) {
    return "";
  }
  int v4 = v1[1];
  uint64_t result = v1 + 1;
  int v3 = v4;
  if ((v4 - 48) < 0xA || v3 == 37 || v3 == 32) {
    return "";
  }
  return result;
}

uint64_t StringArray_Append(const void **a1, uint64_t *a2, char *__s1)
{
  unint64_t v5 = strdup(__s1);
  if (!v5) {
    return 4294960568;
  }
  unint64_t v6 = v5;
  uint64_t v7 = *a2;
  uint64_t v8 = *a2 + 1;
  int v9 = malloc_type_malloc(8 * v8, 0x10040436913F5uLL);
  if (!v9)
  {
    free(v6);
    return 4294960568;
  }
  char v10 = v9;
  if (v7)
  {
    int v11 = (void *)*a1;
    memcpy(v9, *a1, 8 * v7);
    free(v11);
  }
  uint64_t result = 0;
  v10[v7] = v6;
  *a1 = v10;
  *a2 = v8;
  return result;
}

void StringArray_Free(void **a1, uint64_t a2)
{
  if (a2)
  {
    for (uint64_t i = 0; i != a2; ++i)
      free(a1[i]);
    free(a1);
  }
}

uint64_t TextFindColumn(char *__s, size_t a2, unsigned char *a3, int a4, void *a5, void *a6)
{
  char v10 = __s;
  if (a2 == -1) {
    a2 = strlen(__s);
  }
  int v11 = &v10[a2];
  int v12 = 1;
  do
  {
    int v13 = v10;
    if (v10 >= v11)
    {
LABEL_11:
      unint64_t v14 = v11;
      char v10 = v11;
      if (v13 == v11) {
        return 4294960569;
      }
    }
    else
    {
      unint64_t v14 = v10;
      while (!*a3)
      {
LABEL_10:
        if (++v14 == v11) {
          goto LABEL_11;
        }
      }
      uint64_t v15 = a3 + 1;
      int v16 = *a3;
      while (*v14 != v16)
      {
        int v17 = *v15++;
        int v16 = v17;
        if (!v17) {
          goto LABEL_10;
        }
      }
      char v10 = v14 + 1;
    }
  }
  while (v12++ != a4);
  if (a5) {
    *a5 = v13;
  }
  uint64_t result = 0;
  if (a6) {
    *a6 = v14 - v13;
  }
  return result;
}

uint64_t TextSep(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4, void *a5, unsigned __int8 **a6)
{
  if (a1 < a2)
  {
    int v8 = *a3;
    unint64_t v6 = a3 + 1;
    int v7 = v8;
    int v9 = a1;
    while (!v7)
    {
LABEL_7:
      if (++v9 == a2) {
        goto LABEL_8;
      }
    }
    char v10 = v6;
    int v11 = v7;
    while (*v9 != v11)
    {
      int v12 = *v10++;
      int v11 = v12;
      if (!v12) {
        goto LABEL_7;
      }
    }
    *a4 = a1;
    *a5 = v9 - a1;
    if (!a6) {
      return 1;
    }
    a2 = v9 + 1;
    uint64_t v13 = 1;
    goto LABEL_14;
  }
LABEL_8:
  if (a1 != a2)
  {
    *a4 = a1;
    *a5 = a2 - a1;
    uint64_t v13 = 1;
    if (!a6) {
      return v13;
    }
    goto LABEL_14;
  }
  uint64_t v13 = 0;
  a2 = a1;
  if (a6) {
LABEL_14:
  }
    *a6 = a2;
  return v13;
}

size_t TruncateUTF8(char *a1, size_t a2, void *a3, uint64_t a4, int a5)
{
  if (!a4) {
    return 0;
  }
  size_t v8 = TruncatedUTF8Length(a1, a2, a4 - (a5 != 0));
  memmove(a3, a1, v8);
  if (a5) {
    *((unsigned char *)a3 + v8) = 0;
  }
  return v8;
}

int64_t XMLEscape(const char *a1, char *a2, void *a3)
{
  unint64_t v5 = a1;
  int64_t result = strlen(a1);
  int v7 = a2;
  if (result >= 1)
  {
    size_t v8 = (char *)&v5[result];
    int v7 = a2;
    do
    {
      int v9 = *v5;
      if (v9 <= 38)
      {
        if (v9 == 34)
        {
          char v10 = "&quot;";
        }
        else
        {
          char v10 = "&amp;";
          if (v9 != 38)
          {
LABEL_10:
            if (a2) {
              *int v7 = v9;
            }
            ++v7;
            goto LABEL_21;
          }
        }
      }
      else
      {
        switch(v9)
        {
          case '\'':
            char v10 = "&#39;";
            break;
          case '<':
            char v10 = "&lt;";
            break;
          case '>':
            char v10 = "&gt;";
            break;
          default:
            goto LABEL_10;
        }
      }
      char v11 = *v10;
      if (*v10)
      {
        int v12 = (unsigned __int8 *)(v10 + 1);
        do
        {
          if (a2) {
            *int v7 = v11;
          }
          ++v7;
          int v13 = *v12++;
          char v11 = v13;
        }
        while (v13);
      }
LABEL_21:
      ++v5;
    }
    while (v5 < v8);
  }
  *a3 = v7 - a2;
  return result;
}

uint64_t XMLEscapeCopy(const char *a1, char **a2)
{
  uint64_t v7 = 0;
  XMLEscape(a1, 0, &v7);
  int v4 = (char *)malloc_type_malloc(v7 + 1, 0x22A45918uLL);
  if (!v4) {
    return 4294960568;
  }
  unint64_t v5 = v4;
  XMLEscape(a1, v4, &v7);
  uint64_t result = 0;
  v5[v7] = 0;
  *a2 = v5;
  return result;
}

uint64_t DNSServiceConstructFullNameEx(unsigned char *a1, uint64_t a2, char *__s, unsigned __int8 *a4)
{
  if (!__s) {
    return 4294960591;
  }
  size_t v8 = strlen(__s);
  BOOL v9 = DomainEndsInDot((unsigned __int8 *)__s);
  uint64_t result = 4294960591;
  if (a4)
  {
    unint64_t v11 = v8 - v9;
    if (v11 >= 6)
    {
      if (*a4)
      {
        int v12 = &__s[v11 - 4];
        if (strncasecmp(v12, "_tcp", 4uLL) && strncasecmp(v12, "_udp", 4uLL)) {
          return 4294960591;
        }
        if (a2)
        {
          unsigned __int8 v13 = *(unsigned char *)a2;
          if (*(unsigned char *)a2)
          {
            uint64_t v14 = 0;
            uint64_t v15 = (unsigned __int8 *)(a2 + 1);
            int v16 = a1;
            while (1)
            {
              if (v13 < 0x21u)
              {
LABEL_13:
                if (v14 > 1000) {
                  goto LABEL_47;
                }
                *int v16 = 92;
                int v17 = &a1[v14];
                v17[1] = 48;
                uint64_t v18 = v14 + 3;
                v17[2] = (v13 / 0xAu) | 0x30;
                unsigned __int8 v13 = (v13 % 0xAu) | 0x30;
                goto LABEL_25;
              }
              if (v13 > 0x39u)
              {
                if (v13 != 92)
                {
                  if (v13 == 58) {
                    goto LABEL_13;
                  }
LABEL_21:
                  if (v14 >= 1004) {
                    goto LABEL_47;
                  }
                  uint64_t v18 = v14;
                  goto LABEL_25;
                }
              }
              else
              {
                if (v13 == 37) {
                  goto LABEL_13;
                }
                if (v13 != 46) {
                  goto LABEL_21;
                }
              }
              if (v14 > 1002)
              {
LABEL_47:
                int v25 = &a1[v14];
                goto LABEL_53;
              }
              uint64_t v18 = v14 + 1;
              *int v16 = 92;
LABEL_25:
              uint64_t v14 = v18 + 1;
              a1[v18] = v13;
              unsigned __int8 v19 = *v15++;
              unsigned __int8 v13 = v19;
              int v16 = &a1[v18 + 1];
              if (!v19)
              {
                a2 = v18 + 2;
                *int v16 = 46;
                goto LABEL_28;
              }
            }
          }
          a2 = 0;
        }
LABEL_28:
        char v20 = *__s;
        if (*__s)
        {
          uint64_t v21 = 1004;
          if (a2 > 1004) {
            uint64_t v21 = a2;
          }
          int v22 = __s + 1;
          while (v21 != a2)
          {
            uint64_t v23 = a2 + 1;
            a1[a2] = v20;
            int v24 = *v22++;
            char v20 = v24;
            ++a2;
            if (!v24)
            {
              int v25 = &a1[v23];
              a2 = v23;
              goto LABEL_36;
            }
          }
          goto LABEL_46;
        }
        int v25 = &a1[a2];
LABEL_36:
        if (!DomainEndsInDot((unsigned __int8 *)__s))
        {
          if (a2 > 1003) {
            goto LABEL_53;
          }
          ++a2;
          *int v25 = 46;
        }
        unsigned __int8 v26 = *a4;
        if (*a4)
        {
          uint64_t v27 = 1004;
          if (a2 > 1004) {
            uint64_t v27 = a2;
          }
          uint64_t v28 = a4 + 1;
          while (v27 != a2)
          {
            uint64_t v29 = a2 + 1;
            a1[a2] = v26;
            int v30 = *v28++;
            unsigned __int8 v26 = v30;
            ++a2;
            if (!v30)
            {
              int v25 = &a1[v29];
              a2 = v29;
              goto LABEL_49;
            }
          }
LABEL_46:
          int v25 = &a1[a2];
          goto LABEL_53;
        }
        int v25 = &a1[a2];
LABEL_49:
        if (DomainEndsInDot(a4))
        {
          uint64_t result = 0;
        }
        else if (a2 > 1003)
        {
LABEL_53:
          uint64_t result = 4294960591;
        }
        else
        {
          uint64_t result = 0;
          *v25++ = 46;
        }
        *int v25 = 0;
      }
    }
  }
  return result;
}

BOOL DomainEndsInDot(unsigned __int8 *a1)
{
  int v1 = *a1;
  if (*a1)
  {
    while (1)
    {
      int v2 = a1[1];
      if (!a1[1]) {
        break;
      }
      if (v1 == 92)
      {
        if ((v2 - 48) > 9 || a1[2] - 48 > 9 || a1[3] - 48 >= 0xA) {
          uint64_t v3 = 2;
        }
        else {
          uint64_t v3 = 4;
        }
        a1 += v3;
        int v1 = *a1;
        if (!*a1) {
          return v1 == 46;
        }
      }
      else
      {
        int v1 = *++a1;
        if (!v2) {
          return v1 == 46;
        }
      }
    }
  }
  return v1 == 46;
}

unsigned char *MakeDomainNameFromDNSNameString(unsigned char *a1, char *a2)
{
  uint64_t v2 = 0;
  *a1 = 0;
  while (1)
  {
    uint64_t v3 = a1[v2];
    if (v3 > 0x3F)
    {
LABEL_5:
      int v4 = a1 + 255;
      goto LABEL_6;
    }
    if (!a1[v2]) {
      break;
    }
    v2 += v3 + 1;
    if ((unint64_t)v2 >= 0xFF) {
      goto LABEL_5;
    }
  }
  unint64_t v7 = (unint64_t)&a1[v2];
  if ((unint64_t)v2 > 0xFD || (char v8 = *a2) == 0)
  {
    int v4 = &a1[v2];
    goto LABEL_6;
  }
  BOOL v9 = a1 + 1;
  do
  {
    if (v8 == 46) {
      return 0;
    }
    if (v2 <= 253) {
      uint64_t v10 = 253;
    }
    else {
      uint64_t v10 = v2;
    }
    for (uint64_t i = v2; ; ++i)
    {
      if (!v8 || v8 == 46)
      {
        uint64_t v10 = i;
LABEL_29:
        uint64_t v2 = i + 1;
        int v4 = &v9[i];
        uint64_t i = v10;
        goto LABEL_30;
      }
      if (v10 == i) {
        goto LABEL_29;
      }
      int v12 = a2 + 1;
      if (v8 == 92) {
        break;
      }
LABEL_27:
      v9[i] = v8;
      char v8 = *v12;
      a2 = v12;
    }
    int v13 = *v12;
    if (*v12)
    {
      char v8 = *v12;
      int v12 = a2 + 2;
      if (v13 - 48 <= 9)
      {
        int v14 = *v12;
        if ((v14 - 48) <= 9)
        {
          int v15 = a2[3];
          if ((v15 - 48) <= 9)
          {
            int v16 = 100 * v13 + 10 * (char)v14 + (char)v15;
            int v17 = a2 + 4;
            if (v16 < 5584)
            {
              char v8 = v16 + 48;
              int v12 = v17;
            }
          }
        }
      }
      goto LABEL_27;
    }
    char v8 = 0;
    uint64_t v2 = i + 1;
    int v4 = &v9[i];
    ++a2;
LABEL_30:
    uint64_t v18 = (uint64_t)&v4[~v7];
    if (v18 > 63) {
      return 0;
    }
    if (v8) {
      ++a2;
    }
    *(unsigned char *)unint64_t v7 = v18;
    char v8 = *a2;
    if (!*a2) {
      break;
    }
    unint64_t v7 = (unint64_t)v4;
  }
  while (i < 253);
LABEL_6:
  unsigned char *v4 = 0;
  unint64_t v5 = v4 + 1;
  if (*a2) {
    return 0;
  }
  else {
    return v5;
  }
}

uint64_t IncrementNumericSuffix(char *__s, unint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  size_t v8 = a2;
  if (a4)
  {
    if (a2 < 4 || __s[a2 - 1] != 41 || __s[a2 - 2] - 48 > 9) {
      goto LABEL_43;
    }
    unint64_t v10 = a2;
    while (v10 - 2 > 2)
    {
      int v11 = __s[v10-- - 3];
      if ((v11 - 48) >= 0xA)
      {
        uint64_t v12 = v10 - 1;
        goto LABEL_19;
      }
    }
    int v11 = __s[1];
    uint64_t v12 = 2;
LABEL_19:
    if (v11 != 40 || __s[v12 - 2] != 32) {
      goto LABEL_43;
    }
    if (a2 != 0 && a4 != 0) {
      size_t v8 = a2 - 1;
    }
  }
  else
  {
    unint64_t v13 = a2 - 2;
    if (a2 < 2 || __s[a2 - 1] - 48 > 9)
    {
      BOOL v15 = 0;
      uint64_t v16 = 2;
      uint32_t v17 = 2;
      goto LABEL_51;
    }
    while (v13 + 1 > 1)
    {
      int v14 = __s[v13--];
      if ((v14 - 48) >= 0xA) {
        goto LABEL_16;
      }
    }
    int v14 = *__s;
LABEL_16:
    if (v14 != 45) {
      goto LABEL_43;
    }
  }
  if (v8)
  {
    unsigned int v18 = 0;
    int v19 = 1;
    while (1)
    {
      size_t v20 = v8 - 1;
      int v21 = __s[v8 - 1];
      if ((v21 - 48) > 9) {
        break;
      }
      v18 += (v21 - 48) * v19;
      v19 *= 10;
      --v8;
      if (!v20) {
        goto LABEL_40;
      }
    }
    if (a4)
    {
      if (v8 < 2)
      {
        size_t v8 = 1;
      }
      else if (v21 == 40 && __s[v8 - 2] == 32)
      {
        v8 -= 2;
      }
    }
    else if (v21 == 45)
    {
      --v8;
    }
LABEL_40:
    if (v18)
    {
      if (v18 > 9) {
        uint32_t v17 = v18 + (arc4random() & 0x7F) + 1;
      }
      else {
        uint32_t v17 = v18 + 1;
      }
      goto LABEL_44;
    }
LABEL_43:
    uint32_t v17 = 2;
LABEL_44:
    BOOL v15 = a4 != 0;
    uint64_t v16 = 2;
    if (a4) {
      uint64_t v16 = 4;
    }
    if (v8 && a4)
    {
      do
      {
        if (__s[v8 - 1] != 32) {
          break;
        }
        --v8;
      }
      while (v8);
      BOOL v15 = 1;
    }
    goto LABEL_51;
  }
  BOOL v15 = a4 != 0;
  uint32_t v17 = 2;
  uint64_t v16 = 4;
  if (!a4) {
    uint64_t v16 = 2;
  }
LABEL_51:
  unint64_t v22 = v17;
  uint64_t v23 = v16 - 1;
  unint64_t v24 = 1;
  do
  {
    unint64_t v25 = v24;
    v24 *= 10;
    ++v23;
  }
  while (v24 <= v22);
  uint64_t result = TruncatedUTF8Length(__s, v8, a3 - v23);
  if (v15)
  {
    uint64_t v27 = result + 1;
    __s[result + 1] = 40;
    char v28 = 32;
  }
  else
  {
    char v28 = 45;
    uint64_t v27 = result;
  }
  __s[result] = v28;
  if (v25)
  {
    do
    {
      __s[v27 + 1] = v22 / v25 + 48;
      v22 %= v25;
      ++v27;
      BOOL v29 = v25 > 9;
      v25 /= 0xAuLL;
    }
    while (v29);
  }
  uint64_t v30 = v27 + 1;
  if (v15)
  {
    __s[v30] = 41;
    uint64_t v30 = v27 + 2;
  }
  *a5 = v30;
  return result;
}

char *GetDeviceInternalModelString(char *a1, size_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  size_t v11 = 63;
  if (sysctlbyname("hw.target", v12, &v11, 0, 0))
  {
    size_t v11 = 63;
    if (sysctlbyname("hw.model", v12, &v11, 0, 0)) {
      size_t v11 = 0;
    }
  }
  v12[v11] = 0;
  int v4 = (char *)&v11 + 6;
  uint64_t v5 = MEMORY[0x1E4F14390];
  do
  {
    uint64_t v6 = v4[2];
    if (v4[2] < 0) {
      int v7 = __maskrune(v6, 0x100uLL);
    }
    else {
      int v7 = *(_DWORD *)(v5 + 4 * v6 + 60) & 0x100;
    }
    ++v4;
  }
  while (v7);
  do
    int v8 = *++v4;
  while ((v8 - 48) < 0xA);
  char *v4 = 0;
  if (v12[0]) {
    BOOL v9 = v12;
  }
  else {
    BOOL v9 = "N88";
  }
  strlcpy(a1, v9, a2);
  return a1;
}

uint64_t GestaltSetDomain(const void *a1)
{
  pthread_mutex_lock(&gGestaltLock);
  uint64_t v2 = (const void *)gGestaltDomain;
  if (a1) {
    CFRetain(a1);
  }
  gGestaltDomain = (uint64_t)a1;
  if (v2) {
    CFRelease(v2);
  }
  return pthread_mutex_unlock(&gGestaltLock);
}

void *GestaltSetHook(void *result, uint64_t a2)
{
  gGestaltHook_f = result;
  gGestaltHook_ctx = a2;
  return result;
}

char *GestaltGetCString(const void *a1, uint64_t a2, char *a3, size_t a4, int *a5)
{
  CFStringRef v8 = (const __CFString *)GestaltCopyAnswer(a1, a2, a5);
  if (v8)
  {
    CFStringRef v9 = v8;
    a3 = (char *)CFGetCString(v8, a3, a4);
    CFRelease(v9);
    if (a5) {
      *a5 = 0;
    }
  }
  return a3;
}

const char *GestaltGetData(const void *a1, uint64_t a2, const char *a3, unint64_t a4, void *a5, int *a6)
{
  unint64_t v10 = (__CFString *)GestaltCopyAnswer(a1, a2, a6);
  if (v10)
  {
    size_t v11 = v10;
    uint64_t v12 = CFGetData(v10, a3, a4, a5, a6);
    CFRelease(v11);
    return v12;
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    return 0;
  }
}

uint64_t __GestaltGetDeviceClass_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  GestaltGetDeviceClass_deviceClass = result;
  return result;
}

uint64_t GestaltProductTypeStringToDeviceClass(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"iPhone"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 hasPrefix:@"iPad"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 containsString:@"Mac"])
  {
    uint64_t v2 = 100;
  }
  else if ([v1 hasPrefix:@"AppleTV"])
  {
    uint64_t v2 = 4;
  }
  else if (([v1 hasPrefix:@"AudioAccessory1,"] & 1) != 0 {
         || ([v1 hasPrefix:@"AudioAccessory5,"] & 1) != 0
  }
         || ([v1 hasPrefix:@"AudioAccessory6,"] & 1) != 0
         || ([v1 hasPrefix:@"HomePod"] & 1) != 0)
  {
    uint64_t v2 = 7;
  }
  else if ([v1 hasPrefix:@"Watch"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 hasPrefix:@"iPod"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 hasPrefix:@"RealityDevice"])
  {
    uint64_t v2 = 11;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *CUGestaltDeviceClassToString(int a1)
{
  int v1 = a1 - 1;
  uint64_t result = @"AppleTV";
  switch(v1)
  {
    case 0:
      uint64_t result = @"iPhone";
      break;
    case 1:
      uint64_t result = @"iPod";
      break;
    case 2:
      uint64_t result = @"iPad";
      break;
    case 3:
      return result;
    case 4:
    case 7:
    case 8:
    case 9:
      goto LABEL_5;
    case 5:
      uint64_t result = @"Watch";
      break;
    case 6:
      uint64_t result = @"HomePod";
      break;
    case 10:
      uint64_t result = @"RealityDevice";
      break;
    default:
      if (@"AppleTV" == 100) {
        uint64_t result = @"Mac";
      }
      else {
LABEL_5:
      }
        uint64_t result = @"?";
      break;
  }
  return result;
}

BOOL DeviceOSVersionAtOrLater(int a1, int a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, a5, a6, a7, a8, 0x2710u);
}

BOOL DeviceOSVersionAtOrLaterEx(int a1, int a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9)
{
  BOOL result = 0;
  unsigned int v11 = 10000 * a2 + 100 * a3 + a4;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
      return v11 >= a5;
    case 4:
    case 7:
      return v11 >= a7;
    case 5:
    case 8:
    case 9:
    case 10:
      return result;
    case 6:
      return v11 >= a8;
    case 11:
      return v11 >= a9;
    default:
      if (a1 != 100) {
        return result;
      }
      return v11 >= a6;
  }
}

BOOL wInTP56r94EFs9NAAi(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1D4C0u, 0x18C18u, 0x1D4C0u, 0xC350u, 0x2710u);
}

BOOL se1P4X0Kh(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1D524u, 0x18C19u, 0x1D524u, 0xC3B4u, 0x2710u);
}

BOOL TN6sBSnEP2(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1D588u, 0x18C1Cu, 0x1D588u, 0xC418u, 0x2710u);
}

BOOL NADyFF4UGjtVGBmEW6h(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1FBD0u, 0x18C7Cu, 0x1FBD0u, 0xEA60u, 0x2710u);
}

char *GetDeviceModelString(char *a1, size_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  __source[0] = 0;
  size_t __n = 63;
  if (sysctlbyname("hw.machine", __source, &__n, 0, 0)
    || (size_t v6 = __n, !memchr(__source, 44, __n))
    || strnstr(__source, "iProd", v6))
  {
    size_t v4 = 0;
    size_t __n = 0;
  }
  else
  {
    size_t v4 = __n;
  }
  __source[v4] = 0;
  strlcpy(a1, __source, a2);
  return a1;
}

const char *GetDeviceName(char *a1, CFIndex a2)
{
  size_t v4 = (__CFString *)MGCopyAnswer();
  if (!v4)
  {
LABEL_4:
    uint64_t v5 = (__CFString *)MGCopyAnswer();
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 != CFStringGetTypeID())
  {
    CFRelease(v5);
    goto LABEL_4;
  }
LABEL_5:
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 == CFStringGetTypeID()) {
    goto LABEL_8;
  }
  CFRelease(v5);
LABEL_7:
  uint64_t v5 = &stru_1EDD2ACE8;
  CFRetain(&stru_1EDD2ACE8);
LABEL_8:
  if (a2)
  {
    *a1 = 0;
    CFStringRef v8 = a1;
  }
  else
  {
    CFStringRef v8 = "";
  }
  CFStringGetCString(v5, a1, a2, 0x8000100u);
  CFRelease(v5);
  return v8;
}

char *GetDeviceUniqueID(char *a1, CFIndex a2)
{
  CFStringRef v4 = (const __CFString *)MGCopyAnswer();
  if (v4)
  {
    CFStringRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID()) {
      CFStringGetCString(v5, a1, a2, 0x8000100u);
    }
    CFRelease(v5);
  }
  return a1;
}

char *GetSystemBuildVersionString(char *a1, CFIndex a2)
{
  CFStringRef v4 = (const __CFString *)MGCopyAnswer();
  if (v4)
  {
    CFStringRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID()) {
      CFStringGetCString(v5, a1, a2, 0x8000100u);
    }
    CFRelease(v5);
  }
  return a1;
}

uint64_t CUIsGreenTeaDevice()
{
  if (CUIsGreenTeaDevice_sOnce != -1) {
    dispatch_once(&CUIsGreenTeaDevice_sOnce, &__block_literal_global_82);
  }
  return CUIsGreenTeaDevice_sResult;
}

uint64_t __CUIsGreenTeaDevice_block_invoke()
{
  if (MGGetBoolAnswer()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = MGGetBoolAnswer();
  }
  CUIsGreenTeaDevice_sResult = result;
  return result;
}

uint64_t CUSetSystemName(const __CFString *a1, const __CFString *a2, char a3)
{
  CFTypeID v6 = SCPreferencesCreateWithAuthorization(0, @"com.apple.CoreUtils", 0, 0);
  if (v6)
  {
    CFTypeID v7 = v6;
    if (SCPreferencesSetComputerName(v6, a1, 0x8000100u))
    {
      uint64_t v12 = 0;
      if (a2)
      {
LABEL_4:
        CFStringRef v13 = 0;
        goto LABEL_5;
      }
    }
    else
    {
      if (gLogCategory_CUMisc <= 60
        && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
      {
        SCError();
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set computer name %@' failed: %#m\n", v19, v20, v21, v22, (uint64_t)a1);
      }
      uint64_t v12 = SCError();
      if (a2) {
        goto LABEL_4;
      }
    }
    if (a3)
    {
      a2 = (const __CFString *)((uint64_t (*)(uint64_t, uint64_t))softLink_CSCopyLocalHostnameForComputerName[0])(0, (uint64_t)a1);
      CFStringRef v13 = a2;
      if (a2)
      {
LABEL_5:
        if ((a3 & 2) != 0)
        {
          CFMutableDictionaryRef MutableCopy = CFStringCreateMutableCopy(0, 0, a2);
          if (MutableCopy)
          {
            memset(bytes, 0, 6);
            uint64_t InterfaceMACAddress = GetInterfaceMACAddress("en0", (uint64_t)bytes);
            if (InterfaceMACAddress
              && gLogCategory_CUMisc <= 60
              && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
            {
              LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set computer name, get en0 failed: %#m", v23, v24, v25, v26, InterfaceMACAddress);
            }
            v28.i32[0] = *(_DWORD *)((char *)bytes + 1);
            if (InterfaceMACAddress | vmovn_s16((int16x8_t)vmovl_u8(v28)).u32[0]
              || LOBYTE(bytes[0]) != 2
              || BYTE1(bytes[1]))
            {
              if (InterfaceMACAddress) {
                goto LABEL_48;
              }
            }
            else
            {
              unint64_t Int64 = CFPrefs_GetInt64(0, @"CUSystemNameAddress", 0);
              if (Int64)
              {
                uint64_t v34 = Int64;
                if (gLogCategory_CUMisc <= 50
                  && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x32u)))
                {
                  LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x32u, (uint64_t)"Computer name address: existing=0x%012lX", v30, v31, v32, v33, v34);
                }
                LOBYTE(bytes[0]) = BYTE5(v34);
                BYTE1(bytes[0]) = BYTE4(v34);
                BYTE2(bytes[0]) = BYTE3(v34);
                HIBYTE(bytes[0]) = BYTE2(v34);
                LOBYTE(bytes[1]) = BYTE1(v34);
                BYTE1(bytes[1]) = v34;
              }
              else
              {
                RandomBytes(bytes, 6uLL);
                unint64_t v35 = ((unint64_t)LOBYTE(bytes[0]) << 40) | ((unint64_t)BYTE1(bytes[0]) << 32) | ((unint64_t)BYTE2(bytes[0]) << 24) | ((unint64_t)HIBYTE(bytes[0]) << 16) | ((unint64_t)LOBYTE(bytes[1]) << 8) | BYTE1(bytes[1]);
                CFPrefs_SetInt64(0, @"CUSystemNameAddress", v35);
                if (gLogCategory_CUMisc <= 50
                  && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x32u)))
                {
                  LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x32u, (uint64_t)"Computer name address: generated=0x%012lX", v36, v37, v38, v39, v35);
                }
              }
            }
            CFStringAppendFormat(MutableCopy, 0, @"-%02X%02X%02X%02X%02X%02X", LOBYTE(bytes[0]), BYTE1(bytes[0]), BYTE2(bytes[0]), HIBYTE(bytes[0]), LOBYTE(bytes[1]), BYTE1(bytes[1]));
            a2 = MutableCopy;
          }
        }
        else
        {
          CFMutableDictionaryRef MutableCopy = 0;
        }
LABEL_48:
        if (!SCPreferencesSetHostName())
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set hostname %@' failed: %#m\n", v40, v41, v42, v43, (uint64_t)a2);
          }
          if (!v12) {
            uint64_t v12 = SCError();
          }
        }
        if (!SCPreferencesSetLocalHostName(v7, a2))
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set locale hostname %@' failed: %#m\n", v44, v45, v46, v47, (uint64_t)a2);
          }
          if (!v12) {
            uint64_t v12 = SCError();
          }
        }
        goto LABEL_62;
      }
      if (gLogCategory_CUMisc > 60)
      {
        CFMutableDictionaryRef MutableCopy = 0;
        CFStringRef v13 = 0;
LABEL_66:
        if (!SCPreferencesCommitChanges(v7))
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            uint64_t v48 = SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Commit name changes failed: %#m\n", v49, v50, v51, v52, v48);
          }
          if (!v12) {
            uint64_t v12 = SCError();
          }
        }
        if (!SCPreferencesApplyChanges(v7))
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            uint64_t v53 = SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Apply name changes failed: %#m\n", v54, v55, v56, v57, v53);
          }
          if (!v12) {
            uint64_t v12 = SCError();
          }
        }
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        if (v13) {
          CFRelease(v13);
        }
        CFRelease(v7);
        return v12;
      }
      if (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)) {
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Convert name to local hostname failed %@'\n", v8, v9, v10, v11, (uint64_t)a1);
      }
    }
    CFStringRef v13 = 0;
    CFMutableDictionaryRef MutableCopy = 0;
LABEL_62:
    if (gLogCategory_CUMisc <= 30
      && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x1Eu, (uint64_t)"Setting system name '%@', hostname '%@', flags %#{flags}", v8, v9, v10, v11, (uint64_t)a1);
    }
    goto LABEL_66;
  }
  if (SCError()) {
    uint64_t v12 = SCError();
  }
  else {
    uint64_t v12 = 4294960596;
  }
  if (gLogCategory_CUMisc <= 30
    && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef _Nullable, CUSystemNameFlags)", 0x1Eu, (uint64_t)"### Create prefs to set name failed: %#m\n", v15, v16, v17, v18, v12);
  }
  return v12;
}

uint64_t init_CSCopyLocalHostnameForComputerName(uint64_t a1, uint64_t a2)
{
  if (MobileCoreServicesLibrary_sOnce_13574 != -1) {
    dispatch_once(&MobileCoreServicesLibrary_sOnce_13574, &__block_literal_global_132);
  }
  CFStringRef v4 = (uint64_t (*)())dlsym((void *)MobileCoreServicesLibrary_sLib_13575, "_CSCopyLocalHostnameForComputerName");
  softLink_CSCopyLocalHostnameForComputerName[0] = v4;
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void *__MobileCoreServicesLibrary_block_invoke_13578()
{
  uint64_t result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
  MobileCoreServicesLibrary_sLib_13575 = (uint64_t)result;
  return result;
}

void __IsAppleTV_block_invoke()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    int v1 = v0;
    IsAppleTV_sIsAppleTV = CFEqual(v0, @"AppleTV");
    CFRelease(v1);
  }
}

uint64_t BigIntegerFromInt()
{
  uint64_t v0 = CCCreateBigNum();
  if (v0) {
    CCBigNumSetI();
  }
  return v0;
}

uint64_t BigIntegerToCstr(uint64_t a1, uint64_t a2)
{
  int v3 = CCBigNumBitCount();
  int v4 = v3 + 7;
  if (v3 < -7) {
    int v4 = v3 + 14;
  }
  uint64_t result = cstr_set_length(a2, v4 >> 3);
  if ((result & 0x80000000) == 0)
  {
    int v6 = CCBigNumToData();
    return cstr_set_length(a2, v6);
  }
  return result;
}

void BigIntegerToCstrEx(uint64_t a1, const void **a2, int a3)
{
  if ((cstr_set_length((uint64_t)a2, a3) & 0x80000000) == 0)
  {
    int v5 = CCBigNumToData();
    int v6 = a3 - v5;
    if (a3 > v5)
    {
      size_t v7 = v6;
      memmove((char *)*a2 + v6, *a2, v5);
      bzero((void *)*a2, v7);
    }
  }
}

void sub_18E400FD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E40105C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TUInitialize(int a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (uint64_t (**)(const char *, uint64_t))MEMORY[0x1E4F143D8];
  if (a1 >= 1)
  {
    uint64_t v11 = *a2;
    uint64_t v12 = strrchr(*a2, 47);
    uint64_t v13 = (uint64_t)(v12 ? v12 + 1 : v11);
    gTUProgramName = v13;
    if (a1 != 1)
    {
      int v24 = 1;
      do
      {
        uint64_t v25 = v24 + 1;
        uint64_t v26 = a2[v24];
        if (!strcasecmp(v26, "--BATS"))
        {
          if ((int)v25 >= a1) {
            goto LABEL_133;
          }
          v24 += 2;
          uint64_t v33 = (unsigned __int8 *)a2[v25];
          if (strnicmpx(v33, -1, "true")
            && strnicmpx(v33, -1, "yes")
            && strnicmpx(v33, -1, "y")
            && strnicmpx(v33, -1, "on")
            && strnicmpx(v33, -1, "1"))
          {
            if (strnicmpx(v33, -1, "false")
              && strnicmpx(v33, -1, "no")
              && strnicmpx(v33, -1, "n")
              && strnicmpx(v33, -1, "off")
              && strnicmpx(v33, -1, "0"))
            {
              goto LABEL_132;
            }
            gTUBATSMode = 0;
          }
          else
          {
            gTUBATSMode = 1;
          }
        }
        else if (!strcasecmp(v26, "--BreakOnFail"))
        {
          if ((int)v25 >= a1) {
            goto LABEL_133;
          }
          v24 += 2;
          uint64_t v34 = (unsigned __int8 *)a2[(int)v25];
          if (strnicmpx(v34, -1, "true")
            && strnicmpx(v34, -1, "yes")
            && strnicmpx(v34, -1, "y")
            && strnicmpx(v34, -1, "on")
            && strnicmpx(v34, -1, "1"))
          {
            if (strnicmpx(v34, -1, "false")
              && strnicmpx(v34, -1, "no")
              && strnicmpx(v34, -1, "n")
              && strnicmpx(v34, -1, "off")
              && strnicmpx(v34, -1, "0"))
            {
              goto LABEL_132;
            }
            gTUBreakOnFail = 1;
          }
          else
          {
            gTUBreakOnFail = 0;
          }
        }
        else
        {
          if (!strcasecmp(v26, "--ConvertTURtoJUnit"))
          {
            if ((int)v25 >= a1)
            {
              FPrintF(*v8, "#=error: '%s' option requires an input path argument\n", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
            }
            else
            {
              if (v24 + 2 < a1)
              {
                BOOL v43 = TUConvertToJUnit(a2[(int)v25], (CFMutableArrayRef)a2[v24 + 2]) != 0;
                exit(v43);
              }
              FPrintF(*v8, "#=error: '%s' option requires an output path argument\n", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
            }
            exit(1);
          }
          if (!strcasecmp(v26, "--DontRunLeaks"))
          {
            if ((int)v25 >= a1) {
              goto LABEL_133;
            }
            v24 += 2;
            unint64_t v35 = (unsigned __int8 *)a2[(int)v25];
            if (strnicmpx(v35, -1, "true")
              && strnicmpx(v35, -1, "yes")
              && strnicmpx(v35, -1, "y")
              && strnicmpx(v35, -1, "on")
              && strnicmpx(v35, -1, "1"))
            {
              if (strnicmpx(v35, -1, "false")
                && strnicmpx(v35, -1, "no")
                && strnicmpx(v35, -1, "n")
                && strnicmpx(v35, -1, "off")
                && strnicmpx(v35, -1, "0"))
              {
                goto LABEL_132;
              }
              gTUDontRunLeaks = 0;
            }
            else
            {
              gTUDontRunLeaks = 1;
            }
          }
          else if (!strcasecmp(v26, "--ExcludeNonTestUtilsTests"))
          {
            if ((int)v25 >= a1) {
              goto LABEL_133;
            }
            v24 += 2;
            uint64_t v36 = (unsigned __int8 *)a2[(int)v25];
            if (!strnicmpx(v36, -1, "true")
              || !strnicmpx(v36, -1, "yes")
              || !strnicmpx(v36, -1, "y")
              || !strnicmpx(v36, -1, "on")
              || !strnicmpx(v36, -1, "1"))
            {
              goto LABEL_91;
            }
            if (strnicmpx(v36, -1, "false")
              && strnicmpx(v36, -1, "no")
              && strnicmpx(v36, -1, "n")
              && strnicmpx(v36, -1, "off")
              && strnicmpx(v36, -1, "0"))
            {
              goto LABEL_132;
            }
            gTUExcludeNonTestUtilsTests = 0;
          }
          else
          {
            if (!strcasecmp(v26, "--ExcludedTests"))
            {
              if ((int)v25 >= a1) {
                goto LABEL_133;
              }
              v24 += 2;
              gTUExcludedTests = (uint64_t)a2[(int)v25];
LABEL_91:
              gTUExcludeNonTestUtilsTests = 1;
              continue;
            }
            if (!strcasecmp(v26, "--Filter"))
            {
              if ((int)v25 >= a1) {
                goto LABEL_133;
              }
              v24 += 2;
              gTUFilter = (uint64_t)a2[(int)v25];
              goto LABEL_91;
            }
            if (!strcasecmp(v26, "--JUnitXMLOutputPath"))
            {
              if ((int)v25 >= a1) {
                goto LABEL_133;
              }
              v24 += 2;
              gTUJUnitXMLOutputPath = (uint64_t)a2[(int)v25];
            }
            else if (!strcasecmp(v26, "--Level"))
            {
              if ((int)v25 >= a1) {
                goto LABEL_133;
              }
              v24 += 2;
              int v37 = LUStringToLevel(a2[(int)v25]);
              if (v37 == -1) {
                goto LABEL_132;
              }
              gTULogLevel = v37;
            }
            else
            {
              if (!strcasecmp(v26, "--LogControl"))
              {
                if ((int)v25 < a1)
                {
                  v24 += 2;
                  uint64_t v38 = a2[(int)v25];
                  if (LogControl(v38)) {
                    FPrintF(*v8, "#=error: LogControl( \"%s\") failed: %#m\n", a3, a4, a5, a6, a7, a8, (uint64_t)v38);
                  }
                  continue;
                }
LABEL_133:
                FPrintF(*v8, "#=error: '%s' option requires an argument\n", a3, a4, a5, a6, a7, a8, (uint64_t)v26);
                goto LABEL_134;
              }
              if (!strcasecmp(v26, "--OutputPath"))
              {
                if ((int)v25 < a1)
                {
                  v24 += 2;
                  uint64_t v39 = a2[(int)v25];
                  uint64_t v40 = fopen(v39, "w");
                  if (v40 || *__error() && !*__error())
                  {
                    if (gTUOutputFile && fclose((FILE *)gTUOutputFile) && *__error()) {
                      __error();
                    }
                    gTUOutputFile = (uint64_t)v40;
                    gTUOutputFilePtr = (uint64_t)v40;
                    gTUOutputPath = (uint64_t)v39;
                  }
                  else
                  {
                    FPrintF(*v8, "#=error: Open output path '%s' failed: %#m\n", a3, a4, a5, a6, a7, a8, (uint64_t)v39);
                  }
                  continue;
                }
                goto LABEL_133;
              }
              if (!strcasecmp(v26, "--Qualifier"))
              {
                if ((int)v25 >= a1) {
                  goto LABEL_133;
                }
                v24 += 2;
                gTUQualifier = (uint64_t)a2[(int)v25];
              }
              else
              {
                if (strcasecmp(v26, "--StopOnFirstFail"))
                {
                  if (strcasecmp(v26, "--UserMode"))
                  {
                    FPrintF(*v8, "#=error: unknown option '%s'\n", a3, a4, a5, a6, a7, a8, (uint64_t)v26);
LABEL_134:
                    ++v24;
                    continue;
                  }
                  if ((int)v25 >= a1) {
                    goto LABEL_133;
                  }
                  v24 += 2;
                  uint64_t v42 = (unsigned __int8 *)a2[(int)v25];
                  if (!strnicmpx(v42, -1, "true")
                    || !strnicmpx(v42, -1, "yes")
                    || !strnicmpx(v42, -1, "y")
                    || !strnicmpx(v42, -1, "on")
                    || !strnicmpx(v42, -1, "1"))
                  {
                    gTUUserMode = 1;
                    continue;
                  }
                  if (!strnicmpx(v42, -1, "false")
                    || !strnicmpx(v42, -1, "no")
                    || !strnicmpx(v42, -1, "n")
                    || !strnicmpx(v42, -1, "off")
                    || !strnicmpx(v42, -1, "0"))
                  {
                    gTUUserMode = 0;
                    continue;
                  }
LABEL_132:
                  FPrintF(*v8, "#=error: '%s' option bad argument '%s'\n", a3, a4, a5, a6, a7, a8, (uint64_t)v26);
                  continue;
                }
                if ((int)v25 >= a1) {
                  goto LABEL_133;
                }
                v24 += 2;
                uint64_t v41 = (unsigned __int8 *)a2[(int)v25];
                if (!strnicmpx(v41, -1, "true")
                  || !strnicmpx(v41, -1, "yes")
                  || !strnicmpx(v41, -1, "y")
                  || !strnicmpx(v41, -1, "on")
                  || !strnicmpx(v41, -1, "1"))
                {
                  gTUStopOnFirstFail = 0;
                  continue;
                }
                if (strnicmpx(v41, -1, "false")
                  && strnicmpx(v41, -1, "no")
                  && strnicmpx(v41, -1, "n")
                  && strnicmpx(v41, -1, "off")
                  && strnicmpx(v41, -1, "0"))
                {
                  goto LABEL_132;
                }
                gTUStopOnFirstFail = 1;
              }
            }
          }
        }
      }
      while (v24 < a1);
    }
  }
  if (gTUUserMode) {
    LogControl("?.*:level=error");
  }
  if (gTUOutputPath) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = gTUJUnitXMLOutputPath == 0;
  }
  if (!v14) {
    FPrintF(*v8, "#=error: --JUnitXMLOutputPath specified when not using a TU file\n", a3, a4, a5, a6, a7, a8, v44);
  }
  uint64_t v15 = (uint64_t (*)(const char *, uint64_t))gTUOutputFilePtr;
  if (!gTUOutputFilePtr)
  {
    uint64_t v15 = *v8;
    gTUOutputFilePtr = (uint64_t)*v8;
  }
  setvbuf((FILE *)v15, 0, 1, 0x400uLL);
  setvbuf((FILE *)*MEMORY[0x1E4F143C8], 0, 1, 0x400uLL);
  setvbuf((FILE *)*v8, 0, 1, 0x400uLL);
  if (gTUBATSMode == 1)
  {
    _TUPrintF("[TOOL] %s\n\n", v16, v17, v18, v19, v20, v21, v22, gTUProgramName);
  }
  else if (!gTUUserMode)
  {
    _TUPrintF("T=\n", v16, v17, v18, v19, v20, v21, v22, v44);
  }
  gTUTotalPasses = 0;
  gTUTotalFailures = 0;
  gTUTotalExpectedTests = 0;
  gTUStartTicks = mach_absolute_time();
  return 0;
}

uint64_t TUConvertToJUnit(const char *a1, CFMutableArrayRef Mutable)
{
  uint64_t v126 = 0;
  if (!strcmp(a1, "-"))
  {
    int v4 = 0;
    int v5 = (FILE *)*MEMORY[0x1E4F143D0];
    goto LABEL_7;
  }
  int v4 = fopen(a1, "r");
  int v5 = v4;
  if (!v4)
  {
    if (*__error())
    {
      uint64_t appended = *__error();
      if (!appended)
      {
        int v4 = 0;
        int v5 = 0;
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t appended = 4294960596;
    }
LABEL_176:
    FPrintF((uint64_t (*)(const char *, uint64_t))*MEMORY[0x1E4F143D8], "#=error: Convert TestUtils '%s' to JUnit '%s' failed: %#m\n", v6, v7, v8, v9, v10, v11, (uint64_t)a1);
    return appended;
  }
LABEL_7:
  size_t v119 = v4;
  CFTypeRef cf = 0;
  __s1 = (char *)Mutable;
  theDict = 0;
  CFArrayRef v124 = 0;
  CFIndex theArray = 0;
  LODWORD(Mutable) = 0;
  int v13 = 0;
  int v14 = 0;
  uint64_t v15 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  while (1)
  {
    int v16 = fcopyline(v5, (unint64_t *)&v126, 0);
    if (v16) {
      break;
    }
    if (Mutable)
    {
      uint64_t appended = 4294960560;
      LODWORD(Mutable) = 1;
    }
    else
    {
      int v17 = *(char *)v126;
      if (*(unsigned char *)v126 && *((unsigned char *)v126 + 1) == 61)
      {
        LODWORD(Mutable) = 0;
        uint64_t v132 = 0;
        int v133 = 0;
        v134[0] = 0;
        size_t v130 = 0;
        int64_t v131 = 0;
        size_t v129 = 0;
        int64_t v127 = 0;
        int64_t v128 = 0;
        HIDWORD(v18) = v17;
        LODWORD(v18) = v17 - 84;
        uint64_t v19 = (char *)v126 + 2;
        switch((v18 >> 1))
        {
          case 0u:
            if (theArray) {
              goto LABEL_69;
            }
            LODWORD(Mutable) = 0;
            CFIndex theArray = CFArrayCreateMutable(0, 0, v15);
            if (theArray) {
              goto LABEL_60;
            }
            CFIndex theArray = 0;
            goto LABEL_89;
          case 3u:
            if (!theArray) {
              goto LABEL_68;
            }
            if (!theDict)
            {
              theDict = 0;
              LODWORD(Mutable) = 1;
              goto LABEL_60;
            }
            LODWORD(Mutable) = 0;
            uint64_t appended = 4294960560;
            break;
          case 8u:
            if (v14)
            {
              LODWORD(Mutable) = 0;
              uint64_t appended = 4294960566;
              int v14 = 1;
              break;
            }
            if (!theDict)
            {
              LODWORD(Mutable) = 0;
              theDict = 0;
              int v14 = 0;
              goto LABEL_84;
            }
            if (sscanf(v19, "%lfs", v134) != 1)
            {
              LODWORD(Mutable) = 0;
              int v14 = 0;
              goto LABEL_66;
            }
            if (*(double *)v134 < 0.0)
            {
              LODWORD(Mutable) = 0;
              int v14 = 0;
              goto LABEL_80;
            }
            uint64_t v20 = CFDictionarySetDouble(theDict, @"duration", *(double *)v134);
            LODWORD(Mutable) = 0;
            if (v20)
            {
              uint64_t appended = v20;
              int v14 = 0;
              break;
            }
            int v14 = 1;
            goto LABEL_60;
          case 9u:
            if (theDict)
            {
              if (v13)
              {
LABEL_70:
                LODWORD(Mutable) = 0;
                uint64_t appended = 4294960560;
                goto LABEL_77;
              }
              CFMutableDictionaryRef Mutable = cf;
              if (!cf)
              {
                CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, v15);
                if (!Mutable)
                {
                  CFTypeRef cf = 0;
                  int v13 = 0;
                  goto LABEL_89;
                }
                CFDictionarySetValue(theDict, @"failures", Mutable);
                CFTypeRef cf = Mutable;
              }
            }
            else
            {
              CFMutableDictionaryRef Mutable = v124;
              if (!v124)
              {
                CFMutableArrayRef v26 = CFArrayCreateMutable(0, 0, v15);
                if (!v26)
                {
                  CFArrayRef v124 = 0;
                  goto LABEL_88;
                }
                CFArrayRef v124 = v26;
                CFMutableDictionaryRef Mutable = v26;
              }
            }
            uint64_t v27 = _TUConvertToJUnitParseAssertion((unsigned __int8 *)v19, &v133, &v131, &v130, &v129, &v128, &v127);
            if (v27)
            {
              uint64_t appended = v27;
              LODWORD(Mutable) = 0;
              break;
            }
            uint64_t appended = CFPropertyListAppendFormatted(0, Mutable, (uint64_t)"{%kO=%.*s%kO=%.*s%kO=%.*s}", v7, v8, v9, v10, v11, @"type");
            LODWORD(Mutable) = 0;
            if (appended) {
              break;
            }
            goto LABEL_60;
          case 0xEu:
            if (theDict && v13) {
              goto LABEL_70;
            }
            uint64_t v21 = _TUConvertToJUnitParseAssertion((unsigned __int8 *)v19, &v133, &v131, &v130, &v129, &v128, &v127);
            LODWORD(Mutable) = 0;
            if (!v21) {
              goto LABEL_60;
            }
            uint64_t appended = v21;
            break;
          case 0xFu:
            if (v13)
            {
              LODWORD(Mutable) = 0;
              uint64_t appended = 4294960566;
LABEL_77:
              int v13 = 1;
              break;
            }
            if (sscanf((const char *)v126 + 2, "%u/%u", (char *)&v132 + 4, &v132) != 2)
            {
              LODWORD(Mutable) = 0;
              int v13 = 0;
              goto LABEL_66;
            }
            uint64_t v6 = HIDWORD(v132);
            if (HIDWORD(v132) > v132)
            {
              LODWORD(Mutable) = 0;
              int v13 = 0;
LABEL_80:
              uint64_t appended = 4294960586;
              break;
            }
            if (!theDict)
            {
              LODWORD(Mutable) = 0;
              theDict = 0;
              int v13 = 0;
              goto LABEL_84;
            }
            uint64_t v22 = CFDictionarySetInt64(theDict, @"passes", HIDWORD(v132));
            if (v22)
            {
              uint64_t appended = v22;
              LODWORD(Mutable) = 0;
              int v13 = 0;
              break;
            }
            uint64_t v28 = CFDictionarySetInt64(theDict, @"total", v132);
            LODWORD(Mutable) = 0;
            if (v28)
            {
              uint64_t appended = v28;
              int v13 = 0;
              break;
            }
            int v13 = 1;
            goto LABEL_60;
          case 0x10u:
            if (!theArray) {
              goto LABEL_68;
            }
            if (theDict)
            {
LABEL_69:
              LODWORD(Mutable) = 0;
              uint64_t appended = 4294960575;
            }
            else
            {
              uint64_t v23 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              if (v23)
              {
                theDict = v23;
                if (*v19)
                {
                  int v24 = v19;
                  uint64_t v25 = v23;
                  CFDictionarySetCString(v23, @"name", v24, -1);
                  CFArrayAppendValue(theArray, v25);
                  LODWORD(Mutable) = 0;
                  goto LABEL_60;
                }
                LODWORD(Mutable) = 0;
                uint64_t appended = 4294960552;
              }
              else
              {
LABEL_88:
                LODWORD(Mutable) = 0;
                theDict = 0;
LABEL_89:
                uint64_t appended = 4294960568;
              }
            }
            break;
          case 0x13u:
            if (!theArray)
            {
LABEL_68:
              CFIndex theArray = 0;
              LODWORD(Mutable) = 0;
LABEL_84:
              uint64_t appended = 4294960551;
              break;
            }
            if (!theDict)
            {
              LODWORD(Mutable) = 0;
              theDict = 0;
              goto LABEL_84;
            }
            CFRelease(theDict);
            if (cf) {
              CFRelease(cf);
            }
            LODWORD(Mutable) = 0;
            theDict = 0;
            CFTypeRef cf = 0;
            int v13 = 0;
            int v14 = 0;
LABEL_60:
            uint64_t appended = 0;
            break;
          default:
            goto LABEL_60;
        }
      }
      else
      {
        LODWORD(Mutable) = 0;
LABEL_66:
        uint64_t appended = 4294960554;
      }
    }
    if (v126)
    {
      free(v126);
      uint64_t v126 = 0;
    }
    if (appended) {
      goto LABEL_163;
    }
  }
  if (v16 != -6752)
  {
    uint64_t appended = 4294960550;
    goto LABEL_163;
  }
  if (!Mutable)
  {
    uint64_t appended = 4294960560;
    goto LABEL_163;
  }
  LODWORD(v131) = 0;
  int v133 = 0;
  v134[0] = 0;
  if (!strcmp(__s1, "-"))
  {
    uint64_t v32 = 0;
    uint64_t v31 = (uint64_t (*)(const char *, uint64_t))*MEMORY[0x1E4F143D8];
    CFArrayRef v30 = theArray;
    goto LABEL_98;
  }
  uint64_t v29 = fopen(__s1, "w");
  CFArrayRef v30 = theArray;
  if (v29)
  {
    uint64_t v31 = (uint64_t (*)(const char *, uint64_t))v29;
    LODWORD(v131) = 0;
    uint64_t v32 = v29;
    goto LABEL_98;
  }
  if (!*__error())
  {
    uint64_t v32 = 0;
    LODWORD(v131) = -6700;
    goto LABEL_154;
  }
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  LODWORD(v131) = *__error();
  if (!v131)
  {
LABEL_98:
    FPrintF(v31, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n", v6, v7, v8, v9, v10, v11, v112);
    FPrintF(v31, "<testsuites>\n", v33, v34, v35, v36, v37, v38, v113);
    double v39 = 0.0;
    uint64_t v118 = v32;
    if (v30)
    {
      CFIndex Count = CFArrayGetCount(v30);
      if (Count >= 1)
      {
        CFIndex v40 = 0;
        LODWORD(v41) = 0;
        int v42 = 0;
        while (1)
        {
          CFTypeID TypeID = CFDictionaryGetTypeID();
          CFDictionaryRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v30, v40, TypeID, (int *)&v131);
          if (v131) {
            break;
          }
          CFDictionaryRef v45 = TypedValueAtIndex;
          int Int64Ranged = CFDictionaryGetInt64Ranged(TypedValueAtIndex, @"total", 0, 0xFFFFFFFFLL, (int *)&v131);
          if (v131) {
            break;
          }
          int v47 = Int64Ranged;
          uint64_t v41 = Int64Ranged ? (v41 + 1) : v41;
          int v48 = CFDictionaryGetInt64Ranged(v45, @"passes", 0, 0xFFFFFFFFLL, (int *)&v131);
          if (v131) {
            break;
          }
          int v49 = v48;
          double Double = CFDictionaryGetDouble(v45, @"duration", &v131);
          if (v131) {
            break;
          }
          if (v47 != v49) {
            ++v42;
          }
          double v39 = v39 + Double;
          ++v40;
          CFArrayRef v30 = theArray;
          if (Count == v40)
          {
            int v51 = 1;
            goto LABEL_115;
          }
        }
LABEL_153:
        uint64_t v32 = v118;
        goto LABEL_154;
      }
      int v51 = 0;
    }
    else
    {
      int v51 = 0;
      CFIndex Count = 0;
    }
    uint64_t v41 = 0;
LABEL_115:
    if (v124) {
      CFArrayGetCount(v124);
    }
    FPrintF(v31, "\t<testsuite name=\"AllTests\" tests=\"%u\" failures=\"%u\" time=\"%f\">\n", v6, v7, v8, v9, v10, v11, v41);
    if (v51)
    {
      CFIndex v52 = 0;
      while (1)
      {
        CFTypeID v53 = CFDictionaryGetTypeID();
        CFArrayRef v54 = CFArrayGetTypedValueAtIndex(v30, v52, v53, (int *)&v131);
        if (v131) {
          break;
        }
        CFDictionaryRef v55 = v54;
        CFTypeID v56 = CFStringGetTypeID();
        CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(v55, @"name", v56, (int *)&v131);
        if (v131) {
          break;
        }
        uint64_t v58 = (uint64_t)TypedValue;
        int v59 = CFDictionaryGetInt64Ranged(v55, @"total", 0, 0xFFFFFFFFLL, (int *)&v131);
        if (v131) {
          break;
        }
        int v60 = v59;
        int v61 = CFDictionaryGetInt64Ranged(v55, @"passes", 0, 0xFFFFFFFFLL, (int *)&v131);
        if (v131) {
          break;
        }
        int v62 = v61;
        CFDictionaryGetDouble(v55, @"duration", &v131);
        if (v131) {
          break;
        }
        FPrintF(v31, "\t\t<testcase name=\"%@\" classname=\"%@\" time=\"%f\"%s>\n", v6, v7, v8, v9, v10, v11, v58);
        CFTypeID v63 = CFArrayGetTypeID();
        CFDictionaryRef v64 = CFDictionaryGetTypedValue(v55, @"failures", v63, 0);
        if ((v60 != v62) != (v64 != 0))
        {
          LODWORD(v131) = -6762;
          goto LABEL_153;
        }
        CFArrayRef v65 = v64;
        if (v64)
        {
          CFIndex v66 = CFArrayGetCount(v64);
          if (v66 >= 1)
          {
            CFIndex v67 = v66;
            CFIndex v68 = 0;
            do
            {
              CFTypeID v69 = CFDictionaryGetTypeID();
              CFArrayRef v70 = CFArrayGetTypedValueAtIndex(v65, v68, v69, (int *)&v131);
              if (v131) {
                goto LABEL_153;
              }
              CFDictionaryRef v71 = v70;
              CFTypeID v72 = CFStringGetTypeID();
              CFDictionaryRef v73 = CFDictionaryGetTypedValue(v71, @"type", v72, (int *)&v131);
              if (v131) {
                goto LABEL_153;
              }
              uint64_t v74 = (uint64_t)v73;
              uint64_t v75 = CFDictionaryCopyCString(v71, @"message", &v131);
              if (v131) {
                goto LABEL_153;
              }
              uint64_t v76 = v75;
              LODWORD(v131) = XMLEscapeCopy(v75, v134);
              free(v76);
              if (v131) {
                goto LABEL_153;
              }
              uint64_t v77 = CFDictionaryCopyCString(v71, @"detail", &v131);
              if (v131) {
                goto LABEL_153;
              }
              uint64_t v78 = v77;
              LODWORD(v131) = XMLEscapeCopy(v77, (char **)&v133);
              free(v78);
              if (v131) {
                goto LABEL_153;
              }
              uint64_t v79 = v133;
              uint64_t v80 = v134[0];
              FPrintF(v31, "\t\t\t<failure type=\"%@\" message=\"%s\">%s</failure>\n", v6, v7, v8, v9, v10, v11, v74);
              if (v80)
              {
                free(v80);
                v134[0] = 0;
              }
              if (v79)
              {
                free(v79);
                int v133 = 0;
              }
            }
            while (v67 != ++v68);
          }
        }
        CFArrayRef v30 = theArray;
        if (v60 != v62) {
          FPrintF(v31, "\t\t</testcase>\n", v6, v7, v8, v9, v10, v11, v114);
        }
        if (++v52 == Count) {
          goto LABEL_142;
        }
      }
    }
    else
    {
LABEL_142:
      if (v124 && (CFIndex v81 = CFArrayGetCount(v124), v81 >= 1))
      {
        CFIndex v82 = v81;
        CFIndex v83 = 0;
        while (1)
        {
          CFTypeID v84 = CFDictionaryGetTypeID();
          CFArrayRef v85 = CFArrayGetTypedValueAtIndex(v124, v83, v84, (int *)&v131);
          if (v131) {
            break;
          }
          CFDictionaryRef v86 = v85;
          CFTypeID v87 = CFStringGetTypeID();
          CFDictionaryRef v88 = CFDictionaryGetTypedValue(v86, @"type", v87, (int *)&v131);
          if (v131) {
            break;
          }
          uint64_t v89 = (uint64_t)v88;
          uint64_t v90 = CFDictionaryCopyCString(v86, @"message", &v131);
          if (v131) {
            break;
          }
          uint64_t v91 = v90;
          LODWORD(v131) = XMLEscapeCopy(v90, v134);
          free(v91);
          if (v131) {
            break;
          }
          FPrintF(v31, "\t\t<testcase name=\"global.%@\" classname=\"global.%@\">\n", v6, v7, v8, v9, v10, v11, v89);
          uint64_t v92 = v134[0];
          FPrintF(v31, "\t\t\t<failure type=\"%@\" message=\"%s\"/>\n", v93, v94, v95, v96, v97, v98, v89);
          FPrintF(v31, "\t\t</testcase>\n", v99, v100, v101, v102, v103, v104, v115);
          if (v92)
          {
            free(v92);
            v134[0] = 0;
          }
          if (v82 == ++v83) {
            goto LABEL_152;
          }
        }
      }
      else
      {
LABEL_152:
        FPrintF(v31, "\t</testsuite>\n", v6, v7, v8, v9, v10, v11, v114);
        FPrintF(v31, "</testsuites>\n", v105, v106, v107, v108, v109, v110, v116);
        LODWORD(v131) = 0;
      }
    }
    goto LABEL_153;
  }
LABEL_154:
  if (v134[0]) {
    free(v134[0]);
  }
  if (v133) {
    free(v133);
  }
  if (v32 && fclose(v32) && *__error()) {
    __error();
  }
  uint64_t appended = v131;
LABEL_163:
  if (v119 && fclose(v119) && *__error()) {
    __error();
  }
  if (theArray) {
    CFRelease(theArray);
  }
  if (v124) {
    CFRelease(v124);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (appended) {
    goto LABEL_176;
  }
  return appended;
}

uint64_t _TUPrintF(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF((uint64_t (*)(const char *, uint64_t))_TUPrintFCallback, 0, a1, (uint64_t)&a9, a5, a6, a7, a8);
}

uint64_t _TUPrintFCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (gTUOutputFilePtr) {
      FPrintF((uint64_t (*)(const char *, uint64_t))gTUOutputFilePtr, "%.*s", a3, a4, a5, a6, a7, a8, a2);
    }
    if (!gTUUserMode && (gTUBATSMode & 1) == 0) {
      FPrintF((uint64_t (*)(const char *, uint64_t))*MEMORY[0x1E4F143C8], "%.*s", a3, a4, a5, a6, a7, a8, a2);
    }
  }
  return a2;
}

uint64_t _TUConvertToJUnitParseAssertion(unsigned __int8 *a1, unsigned __int8 **a2, int64_t *a3, const char **a4, size_t *a5, const char **a6, int64_t *a7)
{
  for (uint64_t i = a1; ; ++i)
  {
    int v15 = *i;
    if (!*i || v15 == 58) {
      break;
    }
  }
  if (v15 != 58) {
    return 4294960554;
  }
  int64_t v16 = i - a1;
  int v17 = (const char *)(i + 1);
  if (strnicmpx(a1, i - a1, "leaks") && strnicmpx(a1, i - a1, "total"))
  {
    for (int j = (const char *)(i + 2); *(j - 1); ++j)
    {
      if (*(j - 1) == 44)
      {
        uint64_t v32 = a5;
        do
        {
          uint64_t v22 = j;
          int v24 = *(unsigned __int8 *)j++;
          int v23 = v24;
        }
        while (v24 != 44 && v23 != 0);
        uint64_t v31 = a7;
        if (v23 == 44)
        {
          uint64_t v19 = a6;
          int64_t v20 = v22 - v17;
          uint64_t v26 = MEMORY[0x1E4F14390];
          do
          {
            uint64_t v21 = j;
            uint64_t v27 = *(unsigned __int8 *)j;
            if (!*j) {
              break;
            }
            int v28 = (v27 & 0x80) != 0 ? __maskrune(v27, 0x4000uLL) : *(_DWORD *)(v26 + 4 * v27 + 60) & 0x4000;
            int j = v21 + 1;
          }
          while (v28);
          a7 = v31;
          goto LABEL_27;
        }
        return 4294960554;
      }
    }
    return 4294960554;
  }
  uint64_t v32 = a5;
  uint64_t v19 = a6;
  int64_t v20 = 0;
  uint64_t v21 = v17;
  int v17 = 0;
LABEL_27:
  size_t v29 = strlen(v21);
  uint64_t result = 0;
  *a2 = a1;
  *a3 = v16;
  *a4 = v21;
  *uint64_t v32 = v29;
  char *v19 = v17;
  *a7 = v20;
  return result;
}

void TUFinalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (gTUDontRunLeaks) {
    goto LABEL_64;
  }
  int v8 = gTUBreakOnFail;
  CFIndex v66 = 0;
  if (gTUBATSMode == 1) {
    _TUPrintF("[BEGIN] Leaks\n", a2, a3, a4, a5, a6, a7, a8, v64);
  }
  uint64_t v9 = mach_absolute_time();
  pid_t v10 = getpid();
  snprintf(__str, 0x40uLL, "/usr/bin/leaks %d", v10);
  uint64_t v11 = popen(__str, "r");
  if (!v11)
  {
    if (*__error())
    {
      uint64_t v12 = *__error();
      if (!v12) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v12 = 4294960596;
    }
LABEL_31:
    unint64_t v26 = mach_absolute_time() - v9;
LABEL_37:
    atomic_fetch_add(&gTUTotalFailures, 1u);
    if ((gTUUserMode != 0) | gTUBATSMode & 1) {
      int v28 = "### Leaks: FAILED: ";
    }
    else {
      int v28 = "f=leaks:";
    }
    _TUPrintF((unsigned __int8 *)v28, a2, a3, a4, a5, a6, a7, a8, v64);
    int v27 = 0;
    goto LABEL_41;
  }
LABEL_7:
  pid_t v13 = getpid();
  snprintf((char *)__filename, 0x40uLL, "/tmp/leaks-%d-output", v13);
  int v14 = fopen((const char *)__filename, "w");
  if (v14) {
    goto LABEL_10;
  }
  if (!*__error())
  {
    int v14 = 0;
    int v17 = 1;
    uint64_t v12 = 4294960596;
    if (!v11) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v12 = *__error();
  if (v12)
  {
    int v14 = 0;
    int v17 = 1;
    if (v11) {
      goto LABEL_28;
    }
LABEL_29:
    if (v14)
    {
      fclose(v14);
      if (v17) {
        goto LABEL_31;
      }
    }
    else if (v17)
    {
      goto LABEL_31;
    }
LABEL_120:
    char v25 = 0;
    goto LABEL_34;
  }
LABEL_10:
  while (1)
  {
    size_t v16 = fread(__ptr, 1uLL, 0x80uLL, v11);
    if (!v16) {
      break;
    }
    if (fwrite(__ptr, 1uLL, v16, v14) != v16)
    {
      int v17 = 0;
      uint64_t v12 = 4294960549;
      if (!v11) {
        goto LABEL_29;
      }
LABEL_28:
      pclose(v11);
      goto LABEL_29;
    }
  }
  fclose(v14);
  uint64_t v18 = pclose(v11);
  uint64_t v12 = v18;
  if (!v18) {
    goto LABEL_33;
  }
  if (v18 == -1)
  {
    __error();
    goto LABEL_18;
  }
  if ((v18 & 0xFF00) == 0)
  {
    uint64_t v12 = 0;
LABEL_33:
    char v25 = 1;
    goto LABEL_34;
  }
LABEL_18:
  if (gTULogLevel > 50)
  {
LABEL_25:
    char v25 = 0;
    uint64_t v12 = 0;
    goto LABEL_34;
  }
  uint64_t v19 = fopen((const char *)__filename, "r");
  if (v19)
  {
LABEL_22:
    while (1)
    {
      uint64_t v20 = fcopyline(v19, (unint64_t *)&v66, 0);
      if (v20) {
        break;
      }
      TULogF(v20, 50, "Leaks: ", "%s", v21, v22, v23, v24, (uint64_t)v66);
      free(v66);
    }
    fclose(v19);
    goto LABEL_25;
  }
  if (*__error())
  {
    uint64_t v12 = *__error();
    if (!v12) {
      goto LABEL_22;
    }
    goto LABEL_120;
  }
  char v25 = 0;
  uint64_t v12 = 4294960596;
LABEL_34:
  remove(__filename, v15);
  unint64_t v26 = mach_absolute_time() - v9;
  if ((v25 & 1) == 0) {
    goto LABEL_37;
  }
  if (gTULogLevel <= 50)
  {
    if ((gTUUserMode != 0) | gTUBATSMode & 1) {
      uint64_t v50 = "Leaks: passed";
    }
    else {
      uint64_t v50 = "p=leaks:";
    }
    _TUPrintF((unsigned __int8 *)v50, a2, a3, a4, a5, a6, a7, a8, v64);
    int v27 = 1;
    if (gTUUserMode)
    {
LABEL_47:
      if (v12) {
        _TUPrintF(", %#m", v29, v30, v31, v32, v33, v34, v35, v12);
      }
      _TUPrintF("\n", v29, v30, v31, v32, v33, v34, v35, v65);
      goto LABEL_50;
    }
LABEL_41:
    uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/CoreUtils/CoreUtils/TestUtils.c";
    for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/CoreUtils/CoreUtils/TestUtils.c"; ; ++i)
    {
      if (*(i - 1) == 47)
      {
        uint64_t v36 = i;
      }
      else if (!*(i - 1))
      {
        _TUPrintF("%s:%ld, %###s()", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v36);
        goto LABEL_47;
      }
    }
  }
  int v27 = 1;
LABEL_50:
  if (gTUBATSMode == 1)
  {
    if (sUpTicksToSecondsOnce != -1) {
      dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
    }
    _TUPrintF("# %.6f seconds\n", a2, a3, a4, a5, a6, a7, a8, COERCE__INT64(*(double *)&sUpTicksToSecondsMultiplier * (double)v26));
    CFDictionaryRef v45 = "[FAIL]";
    if (v27) {
      CFDictionaryRef v45 = "[PASS]";
    }
    _TUPrintF("%s Leaks\n\n", v38, v39, v40, v41, v42, v43, v44, (uint64_t)v45);
  }
  if (gTUXCTestFailer) {
    char v46 = v27;
  }
  else {
    char v46 = 1;
  }
  if ((v46 & 1) == 0) {
    (*(void (**)(void))(gTUXCTestFailer + 16))();
  }
  if (((v27 | v8) & 1) == 0 && DebugIsDebuggerPresent()) {
    __debugbreak();
  }
LABEL_64:
  if (gTUBATSMode == 1)
  {
    _TUPrintF("[SUMMARY]\n", a2, a3, a4, a5, a6, a7, a8, v64);
    int v47 = gTUBATSMode;
  }
  else
  {
    int v47 = 0;
  }
  if (gTUUserMode) {
    BOOL v48 = 0;
  }
  else {
    BOOL v48 = v47 == 0;
  }
  if (!v48)
  {
    if (gTUTotalFailures)
    {
      int v49 = gTUTotalExpectedTests;
      goto LABEL_74;
    }
    int v49 = gTUTotalExpectedTests;
    if (gTUTotalPasses < gTUTotalExpectedTests)
    {
LABEL_74:
      if (v49 < 1) {
        _TUPrintF("### %d tests failed, %d tests passed\n", a2, a3, a4, a5, a6, a7, a8, gTUTotalFailures);
      }
      else {
        _TUPrintF("### %d tests failed, %d of %d tests passed\n", a2, a3, a4, a5, a6, a7, a8, gTUTotalFailures);
      }
      goto LABEL_87;
    }
    if (gTUUserMode) {
      _TUPrintF("\n", a2, a3, a4, a5, a6, a7, a8, v64);
    }
    uint64_t v51 = gTUSuitePasses;
    mach_absolute_time();
    if (sUpTicksToSecondsOnce != -1) {
      dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
    }
    _TUPrintF("All %d suites, %d tests passed (%.6f seconds)\n", v52, v53, v54, v55, v56, v57, v58, v51);
  }
LABEL_87:
  uint64_t v59 = (gTUTotalFailures + gTUTotalPasses);
  if (gTUTotalFailures + gTUTotalPasses && (!gTUTotalExpectedTests || v59 == gTUTotalExpectedTests))
  {
    if (gTULogLevel <= 30)
    {
      if (gTUUserMode || gTUBATSMode) {
        _TUPrintF("Total tests matched expected: %d total tests\n", a2, a3, a4, a5, a6, a7, a8, v59);
      }
      _TUPrintF("p=total:%d/%d\n", a2, a3, a4, a5, a6, a7, a8, v59);
    }
  }
  else
  {
    if ((gTUUserMode != 0) | gTUBATSMode & 1) {
      int v60 = "### Total tests mismatch: %d actual vs %d expected\n";
    }
    else {
      int v60 = "f=total:%d/%d\n";
    }
    _TUPrintF((unsigned __int8 *)v60, a2, a3, a4, a5, a6, a7, a8, v59);
    atomic_fetch_add(&gTUTotalFailures, 1u);
  }
  if (!gTUUserMode && (gTUBATSMode & 1) == 0) {
    _TUPrintF("Z=\n", a2, a3, a4, a5, a6, a7, a8, v64);
  }
  if (gTUOutputFilePtr) {
    fflush((FILE *)gTUOutputFilePtr);
  }
  fflush((FILE *)*MEMORY[0x1E4F143C8]);
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
  if (gTUOutputFile)
  {
    if (fclose((FILE *)gTUOutputFile) && *__error()) {
      __error();
    }
    gTUOutputFile = 0;
  }
  gTUOutputFilePtr = 0;
  if (gTUOutputPath && gTUJUnitXMLOutputPath) {
    TUConvertToJUnit((const char *)gTUOutputPath, (CFMutableArrayRef)gTUJUnitXMLOutputPath);
  }
  int v61 = (void *)gTUXCTestFailer;
  gTUXCTestFailer = 0;

  BOOL v63 = gTUTotalPasses < 1 || gTUTotalFailures != 0;
  gTUExitCode = v63;
}

uint64_t TULogF(uint64_t a1, int a2, const char *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (gTULogLevel <= a2)
  {
    uint64_t v9 = "";
    if (a3) {
      uint64_t v9 = a3;
    }
    v11[0] = v9;
    v11[1] = 0;
    return VCPrintF((uint64_t (*)(const char *, uint64_t))_TULogPrintFCallback, (uint64_t (*)(const char *, uint64_t))v11, a4, (uint64_t)&a9, a5, a6, a7, a8);
  }
  return result;
}

uint64_t _TULogPrintFCallback(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 1)
  {
    unint64_t v9 = a1;
    unint64_t v10 = a1 + a2;
    do
    {
      if (!*(unsigned char *)(a3 + 8))
      {
        uint64_t v11 = "";
        if (!gTUUserMode) {
          uint64_t v11 = "#=";
        }
        FPrintF((uint64_t (*)(const char *, uint64_t))gTUOutputFilePtr, "%s%s", a3, a4, a5, a6, a7, a8, (uint64_t)v11);
        *(unsigned char *)(a3 + 8) = 1;
      }
      unint64_t v12 = v9;
      unint64_t v13 = v9;
      if (v9 >= v10)
      {
LABEL_12:
        FPrintF((uint64_t (*)(const char *, uint64_t))gTUOutputFilePtr, "%.*s", a3, a4, a5, a6, a7, a8, v12 - v9);
        unint64_t v9 = v13;
      }
      else
      {
        uint64_t v14 = 0;
        while (1)
        {
          unint64_t v15 = v9 + v14;
          if (*(unsigned char *)(v9 + v14) == 10) {
            break;
          }
          if (v10 - v9 == ++v14)
          {
            unint64_t v12 = v10;
            unint64_t v13 = v10;
            goto LABEL_12;
          }
        }
        FPrintF((uint64_t (*)(const char *, uint64_t))gTUOutputFilePtr, "%.*s", a3, a4, a5, a6, a7, a8, v14);
        unint64_t v9 = v15 + 1;
        FPrintF((uint64_t (*)(const char *, uint64_t))gTUOutputFilePtr, "\n", v16, v17, v18, v19, v20, v21, v24);
        *(unsigned char *)(a3 + 8) = 0;
      }
    }
    while (v9 < v10);
  }
  if (!a2 && *(unsigned char *)(a3 + 8))
  {
    FPrintF((uint64_t (*)(const char *, uint64_t))gTUOutputFilePtr, "\n", a3, a4, a5, a6, a7, a8, v23);
    *(unsigned char *)(a3 + 8) = 0;
  }
  return a2;
}

BOOL TULogLevelEnabled(uint64_t a1, int a2)
{
  return gTULogLevel <= a2;
}

void _TUXCTestSetup(void *a1)
{
  id v3 = (id)[a1 copy];
  int v1 = _Block_copy(v3);
  uint64_t v2 = (void *)gTUXCTestFailer;
  gTUXCTestFailer = (uint64_t)v1;
}

uint64_t TUSetExpectedTestCount(uint64_t result)
{
  gTUTotalExpectedTests = result;
  return result;
}

size_t _TUPerformTest(unsigned char *a1, void (*a2)(long long *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v55 = xmmword_1E55BFBF0;
  long long v56 = unk_1E55BFC00;
  unint64_t v10 = (unsigned __int8 *)gTUExcludedTests;
  if (!gTUExcludedTests)
  {
LABEL_12:
    uint64_t v16 = (unsigned __int8 *)gTUFilter;
    if (gTUFilter)
    {
      size_t result = strlen((const char *)gTUFilter);
      uint64_t v17 = (unsigned __int8 *)(gTUFilter + result);
      do
      {
        if (v16 >= v17)
        {
LABEL_18:
          uint64_t v19 = v17;
          uint64_t v20 = v17;
          if (v16 == v17) {
            return result;
          }
        }
        else
        {
          int64_t v18 = v17 - v16;
          uint64_t v19 = v16;
          while (*v19 != 44)
          {
            ++v19;
            if (!--v18) {
              goto LABEL_18;
            }
          }
          uint64_t v20 = v19 + 1;
        }
        size_t result = strnicmpx(v16, v19 - v16, a1);
        uint64_t v16 = v20;
      }
      while (result);
    }
    uint64_t v21 = (FILE **)MEMORY[0x1E4F143D8];
    if (!gTUOutputFilePtr) {
      gTUOutputFilePtr = *MEMORY[0x1E4F143D8];
    }
    *(void *)&long long v55 = a1;
    uint64_t v22 = gTUQualifier;
    if (gTUQualifier)
    {
      if (gTUBATSMode)
      {
        if (*(unsigned char *)gTUQualifier)
        {
          _TUPrintF("[BEGIN] %s.%s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
          goto LABEL_41;
        }
        goto LABEL_29;
      }
      if (*(unsigned char *)gTUQualifier) {
        uint64_t v23 = gTUQualifier;
      }
      else {
        uint64_t v23 = 0;
      }
      if (gTUUserMode)
      {
        uint64_t v22 = v23;
        goto LABEL_41;
      }
      if (*(unsigned char *)gTUQualifier)
      {
        _TUPrintF("t=%s.%s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
        goto LABEL_41;
      }
    }
    else
    {
      if (gTUBATSMode)
      {
LABEL_29:
        _TUPrintF("[BEGIN] %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
LABEL_40:
        uint64_t v22 = 0;
LABEL_41:
        uint64_t v24 = (void *)MEMORY[0x192FAA9B0]();
        uint64_t v25 = mach_absolute_time();
        a2(&v55);
        unint64_t v26 = mach_absolute_time() - v25;
        if (v56) {
          BOOL v34 = DWORD1(v56) == 0;
        }
        else {
          BOOL v34 = 0;
        }
        int v35 = v34;
        if (gTUUserMode)
        {
          if (v35) {
            uint64_t v36 = "";
          }
          else {
            uint64_t v36 = "### ";
          }
          if (sUpTicksToSecondsOnce != -1) {
            dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
          }
          _TUPrintF("%s%s: %s (%.6f seconds)\n", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v36);
          goto LABEL_66;
        }
        if (gTUBATSMode == 1)
        {
          if (sUpTicksToSecondsOnce != -1) {
            dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
          }
          _TUPrintF("# %.6f seconds\n", v27, v28, v29, v30, v31, v32, v33, COERCE__INT64(*(double *)&sUpTicksToSecondsMultiplier * (double)v26));
          uint64_t v44 = "[FAIL]";
          if (v35) {
            uint64_t v44 = "[PASS]";
          }
          if (v22)
          {
            _TUPrintF("%s %s.%s\n\n", v37, v38, v39, v40, v41, v42, v43, (uint64_t)v44);
LABEL_66:
            uint64_t v53 = (int *)&gTUSuiteFailures;
            if (v35) {
              uint64_t v53 = &gTUSuitePasses;
            }
            ++*v53;
            if (gTUOutputFilePtr) {
              fflush((FILE *)gTUOutputFilePtr);
            }
            fflush((FILE *)*MEMORY[0x1E4F143C8]);
            return fflush(*v21);
          }
          uint64_t v54 = (uint64_t)v44;
          uint64_t v52 = "%s %s\n\n";
        }
        else
        {
          _TUPrintF("r=%u/%u\n", v27, v28, v29, v30, v31, v32, v33, v56);
          if (sUpTicksToSecondsOnce != -1) {
            dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
          }
          _TUPrintF("d=%fs\n", v45, v46, v47, v48, v49, v50, v51, COERCE__INT64(*(double *)&sUpTicksToSecondsMultiplier * (double)v26));
          uint64_t v52 = "z=\n";
        }
        _TUPrintF((unsigned __int8 *)v52, v37, v38, v39, v40, v41, v42, v43, v54);
        goto LABEL_66;
      }
      if (gTUUserMode) {
        goto LABEL_40;
      }
    }
    _TUPrintF("t=%s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
    goto LABEL_40;
  }
  size_t v11 = gTUExcludedTests + strlen((const char *)gTUExcludedTests);
  do
  {
    if ((unint64_t)v10 >= v11)
    {
LABEL_7:
      unint64_t v13 = (unsigned char *)v11;
      uint64_t v14 = (unsigned __int8 *)v11;
      if (v10 == (unsigned __int8 *)v11) {
        goto LABEL_12;
      }
    }
    else
    {
      size_t v12 = v11 - (void)v10;
      unint64_t v13 = v10;
      while (*v13 != 44)
      {
        ++v13;
        if (!--v12) {
          goto LABEL_7;
        }
      }
      uint64_t v14 = v13 + 1;
    }
    size_t result = strnicmpx(v10, v13 - v10, a1);
    unint64_t v10 = v14;
  }
  while (result);
  return result;
}

uint64_t TUTestRequire(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a4;
  int v9 = a3;
  if ((*(unsigned char *)(a1 + 28) & 8) == 0)
  {
    size_t v11 = &gTUTotalFailures;
    if (a3) {
      size_t v11 = &gTUTotalPasses;
    }
    atomic_fetch_add(v11, 1u);
    int v12 = *(_DWORD *)(a1 + 16);
    int v13 = *(_DWORD *)(a1 + 20);
    if (a3) {
      ++v12;
    }
    else {
      ++v13;
    }
    *(_DWORD *)(a1 + 16) = v12;
    *(_DWORD *)(a1 + 20) = v13;
  }
  if (a3)
  {
    uint64_t v14 = 0;
    if (gTULogLevel > 30) {
      return v14;
    }
  }
  else if ((a2 & 1) == 0 && ((gTUStopOnFirstFail & 1) != 0 || (*(unsigned char *)(a1 + 28) & 4) != 0))
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 4294960544;
  }
  if ((*(unsigned char *)(a1 + 28) & 8) != 0) {
    goto LABEL_37;
  }
  if (gTUUserMode || gTUBATSMode)
  {
    if (a3) {
      uint64_t v23 = "";
    }
    else {
      uint64_t v23 = "### ";
    }
    _TUPrintF((unsigned __int8 *)v23, a2, a3, a4, a5, a6, a7, a8, v26);
  }
  else
  {
    uint64_t v15 = 102;
    if (a3) {
      uint64_t v15 = 112;
    }
    _TUPrintF("%c=BOOL:", a2, a3, a4, a5, a6, a7, a8, v15);
  }
  for (uint64_t i = v8 + 1; *(unsigned char *)(i - 1) == 47; ++i)
  {
    uint64_t v8 = i;
LABEL_31:
    ;
  }
  if (*(unsigned char *)(i - 1)) {
    goto LABEL_31;
  }
  _TUPrintF("%s:%ld, %###s(), %''s\n", v16, v17, v18, v19, v20, v21, v22, v8);
  if (v9 || (gTUBreakOnFail & 1) != 0)
  {
LABEL_37:
    if (!v9) {
      goto LABEL_38;
    }
    return v14;
  }
  if ((*(unsigned char *)(a1 + 28) & 2) == 0 && DebugIsDebuggerPresent())
  {
    __debugbreak();
    JUMPOUT(0x18E403AE4);
  }
LABEL_38:
  if (!*(_DWORD *)(a1 + 24)) {
    *(_DWORD *)(a1 + 24) = -6737;
  }
  if ((*(unsigned char *)(a1 + 28) & 8) == 0 && gTUXCTestFailer) {
    (*(void (**)(void))(gTUXCTestFailer + 16))();
  }
  return v14;
}

uint64_t TUTestRequireNoErr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a4;
  int v9 = a3;
  if ((*(unsigned char *)(a1 + 28) & 8) == 0)
  {
    size_t v11 = &gTUTotalFailures;
    if (!a3) {
      size_t v11 = &gTUTotalPasses;
    }
    atomic_fetch_add(v11, 1u);
    int v12 = *(_DWORD *)(a1 + 16);
    int v13 = *(_DWORD *)(a1 + 20);
    if (a3) {
      ++v13;
    }
    else {
      ++v12;
    }
    *(_DWORD *)(a1 + 16) = v12;
    *(_DWORD *)(a1 + 20) = v13;
  }
  if (a3)
  {
    uint64_t v14 = a3;
    if ((a2 & 1) == 0)
    {
      if (gTUStopOnFirstFail)
      {
        uint64_t v14 = 0;
      }
      else if ((*(unsigned char *)(a1 + 28) & 4) != 0)
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = a3;
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (gTULogLevel > 30) {
      return v14;
    }
  }
  if ((*(unsigned char *)(a1 + 28) & 8) != 0) {
    goto LABEL_38;
  }
  if (gTUUserMode || gTUBATSMode)
  {
    if (a3) {
      uint64_t v23 = "### ";
    }
    else {
      uint64_t v23 = "";
    }
    _TUPrintF((unsigned __int8 *)v23, a2, a3, a4, a5, a6, a7, a8, v26);
  }
  else
  {
    uint64_t v15 = 102;
    if (!a3) {
      uint64_t v15 = 112;
    }
    _TUPrintF("%c=err:", a2, a3, a4, a5, a6, a7, a8, v15);
  }
  for (uint64_t i = v8 + 1; *(unsigned char *)(i - 1) == 47; ++i)
  {
    uint64_t v8 = i;
LABEL_32:
    ;
  }
  if (*(unsigned char *)(i - 1)) {
    goto LABEL_32;
  }
  _TUPrintF("%s:%ld, %###s(), %#m\n", v16, v17, v18, v19, v20, v21, v22, v8);
  if (!v9 || (gTUBreakOnFail & 1) != 0)
  {
LABEL_38:
    if (v9) {
      goto LABEL_39;
    }
    return v14;
  }
  if ((*(unsigned char *)(a1 + 28) & 2) == 0 && DebugIsDebuggerPresent())
  {
    __debugbreak();
    JUMPOUT(0x18E403CA0);
  }
LABEL_39:
  if (!*(_DWORD *)(a1 + 24)) {
    *(_DWORD *)(a1 + 24) = v9;
  }
  if ((*(unsigned char *)(a1 + 28) & 8) == 0 && gTUXCTestFailer) {
    (*(void (**)(void))(gTUXCTestFailer + 16))();
  }
  return v14;
}

BOOL TUTestRequireNoNSError(uint64_t a1, char a2, int a3, void *a4, uint64_t a5)
{
  id v16 = a4;
  if ((*(unsigned char *)(a1 + 28) & 8) == 0)
  {
    uint64_t v17 = &gTUTotalFailures;
    if (a3) {
      uint64_t v17 = &gTUTotalPasses;
    }
    atomic_fetch_add(v17, 1u);
    int v18 = *(_DWORD *)(a1 + 20) + (a3 ^ 1);
    *(_DWORD *)(a1 + 16) += a3;
    *(_DWORD *)(a1 + 20) = v18;
  }
  if (a3)
  {
    BOOL v19 = 0;
    if (gTULogLevel > 30) {
      goto LABEL_34;
    }
  }
  else
  {
    BOOL v19 = (a2 & 1) != 0 || (gTUStopOnFirstFail & 1) == 0 && (*(unsigned char *)(a1 + 28) & 4) == 0;
  }
  if ((*(unsigned char *)(a1 + 28) & 8) == 0)
  {
    if (gTUUserMode || gTUBATSMode)
    {
      if (a3) {
        uint64_t v28 = "";
      }
      else {
        uint64_t v28 = "### ";
      }
      _TUPrintF((unsigned __int8 *)v28, v9, v10, v11, v12, v13, v14, v15, v31);
    }
    else
    {
      uint64_t v20 = 102;
      if (a3) {
        uint64_t v20 = 112;
      }
      _TUPrintF("%c=err:", v9, v10, v11, v12, v13, v14, v15, v20);
    }
    for (uint64_t i = a5 + 1; ; ++i)
    {
      if (*(unsigned char *)(i - 1) == 47)
      {
        a5 = i;
      }
      else if (!*(unsigned char *)(i - 1))
      {
        _TUPrintF("%s:%ld, %###s(), %{error}\n", v21, v22, v23, v24, v25, v26, v27, a5);
        if ((a3 & 1) == 0
          && (gTUBreakOnFail & 1) == 0
          && (*(unsigned char *)(a1 + 28) & 2) == 0
          && DebugIsDebuggerPresent())
        {
          __debugbreak();
        }
        break;
      }
    }
  }
LABEL_34:
  if (v16 && !*(_DWORD *)(a1 + 24))
  {
    *(_DWORD *)(a1 + 24) = NSErrorToOSStatusEx(v16, 0);
    if (a3) {
      goto LABEL_41;
    }
  }
  else if (a3)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)(a1 + 28) & 8) == 0 && gTUXCTestFailer) {
    (*(void (**)(void))(gTUXCTestFailer + 16))();
  }
LABEL_41:

  return v19;
}

uint64_t TULogV(uint64_t a1, int a2, const char *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = "";
  if (a3) {
    uint64_t v8 = a3;
  }
  v10[0] = v8;
  if (gTULogLevel <= a2)
  {
    v10[1] = 0;
    return VCPrintF((uint64_t (*)(const char *, uint64_t))_TULogPrintFCallback, (uint64_t (*)(const char *, uint64_t))v10, a4, a5, a5, a6, a7, a8);
  }
  return result;
}

uint64_t TUFaultEnable(char *a1, uint64_t a2)
{
  uint64_t v10 = 0;
  pthread_mutex_lock(&gTUFaultLock);
  if (!_TUFaultLookup(a1, &v10))
  {
    uint64_t v7 = 0;
    *((void *)*v10 + 2) = a2;
    goto LABEL_6;
  }
  int v4 = malloc_type_calloc(1uLL, 0x18uLL, 0x103004013764637uLL);
  if (!v4)
  {
LABEL_8:
    uint64_t v7 = 4294960568;
    goto LABEL_6;
  }
  int v5 = v4;
  uint64_t v6 = strdup(a1);
  v5[1] = v6;
  if (!v6)
  {
    free(v5);
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  unint64_t v5[2] = a2;
  uint64_t v8 = v10;
  void *v5 = *v10;
  const char *v8 = (const char *)v5;
LABEL_6:
  pthread_mutex_unlock(&gTUFaultLock);
  return v7;
}

uint64_t _TUFaultLookup(char *a1, const char ***a2)
{
  int v4 = *a1;
  if (*a1)
  {
    int v5 = a1 + 1;
    unsigned int v6 = -2128831035;
    do
    {
      unsigned int v6 = 16777619 * (v6 ^ v4);
      int v7 = *v5++;
      int v4 = v7;
    }
    while (v7);
    uint64_t v8 = v6 % 0x1F;
  }
  else
  {
    uint64_t v8 = 8;
  }
  uint64_t v9 = (const char **)((char *)&gTUFaultHashTable + 8 * v8);
  do
  {
    uint64_t v10 = v9;
    uint64_t v9 = (const char **)*v9;
  }
  while (v9 && strcasecmp(v9[1], a1));
  if (a2) {
    *a2 = v10;
  }
  if (v9) {
    return 0;
  }
  else {
    return 4294960569;
  }
}

uint64_t TUFaultDisable(char *a1)
{
  int v5 = 0;
  pthread_mutex_lock(&gTUFaultLock);
  uint64_t v2 = _TUFaultLookup(a1, (const char ***)&v5);
  if (!v2)
  {
    id v3 = (void **)*v5;
    char *v5 = (const char **)**v5;
    free(v3[1]);
    free(v3);
  }
  pthread_mutex_unlock(&gTUFaultLock);
  return v2;
}

uint64_t TUFaultInject(char *a1, int a2, unsigned char *a3)
{
  uint64_t v11 = 0;
  pthread_mutex_lock(&gTUFaultLock);
  uint64_t v6 = _TUFaultLookup(a1, &v11);
  if (v6)
  {
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 4294960564;
    uint64_t v8 = (uint64_t)*v11;
    switch(a2)
    {
      case 1:
      case 2:
      case 3:
        uint64_t v7 = 0;
        *a3 = *(void *)(v8 + 16);
        break;
      case 4:
      case 5:
        uint64_t v7 = 0;
        *(_WORD *)a3 = *(void *)(v8 + 16);
        break;
      case 6:
      case 7:
      case 10:
        uint64_t v7 = 0;
        *(_DWORD *)a3 = *(void *)(v8 + 16);
        break;
      case 8:
      case 9:
      case 11:
        uint64_t v7 = 0;
        *(void *)a3 = *(void *)(v8 + 16);
        break;
      case 20:
      case 22:
        uint64_t v7 = 0;
        float v9 = *(double *)(v8 + 16);
        *(float *)a3 = v9;
        break;
      case 21:
      case 23:
        uint64_t v7 = 0;
        *(void *)a3 = *(void *)(v8 + 16);
        break;
      default:
        break;
    }
  }
  pthread_mutex_unlock(&gTUFaultLock);
  return v7;
}

_OWORD *TUTestStateCreate(int *a1)
{
  if (TUTestStateGetTypeID_sOnce != -1) {
    dispatch_once_f(&TUTestStateGetTypeID_sOnce, &TUTestStateGetTypeID_sTypeID, (dispatch_function_t)_TUTestStateGetTypeID);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  id v3 = Instance;
  if (Instance)
  {
    Instance[8] = 0u;
    Instance[9] = 0u;
    Instance[6] = 0u;
    Instance[7] = 0u;
    Instance[4] = 0u;
    Instance[5] = 0u;
    Instance[2] = 0u;
    Instance[3] = 0u;
    Instance[1] = 0u;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    *((void *)v3 + 2) = Mutable;
    if (!Mutable)
    {
      int v5 = -6728;
LABEL_7:
      CFRelease(v3);
      id v3 = 0;
      goto LABEL_8;
    }
    int v5 = pthread_mutex_init((pthread_mutex_t *)((char *)v3 + 24), 0);
    if (v5) {
      goto LABEL_7;
    }
    *((void *)v3 + 11) = (char *)v3 + 24;
    int v5 = pthread_cond_init((pthread_cond_t *)v3 + 2, 0);
    if (v5) {
      goto LABEL_7;
    }
    *((void *)v3 + 18) = v3 + 6;
  }
  else
  {
    int v5 = -6728;
  }
LABEL_8:
  if (a1) {
    *a1 = v5;
  }
  return v3;
}

uint64_t _TUTestStateGetTypeID(uint64_t *a1)
{
  uint64_t result = _CFRuntimeRegisterClass();
  *a1 = result;
  return result;
}

CFMutableStringRef _TUTestStateCopyDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFMutableStringRef v9 = 0;
  CFAppendPrintF(&v9, (uint64_t)"TUTestState: Signals %d, Objects:\n%@", a3, a4, a5, a6, a7, a8, *(unsigned int *)(a1 + 152));
  return v9;
}

pthread_mutex_t *_TUTestStateFinalize(void *a1)
{
  uint64_t v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  id v3 = (pthread_cond_t *)a1[18];
  if (v3)
  {
    pthread_cond_destroy(v3);
    a1[18] = 0;
  }
  uint64_t result = (pthread_mutex_t *)a1[11];
  if (result)
  {
    uint64_t result = (pthread_mutex_t *)pthread_mutex_destroy(result);
    a1[11] = 0;
  }
  return result;
}

const void *TUTestStateGetObject(uint64_t a1, const void *a2)
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  int v4 = *(pthread_mutex_t **)(a1 + 88);
  if (!v4) {
    return 0;
  }
  pthread_mutex_lock(v4);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  return Value;
}

uint64_t TUTestStateSetObject(uint64_t result, const void *a2, const void *a3)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v4 = result;
      if (*(void *)(result + 16))
      {
        uint64_t result = *(void *)(result + 88);
        if (result)
        {
          pthread_mutex_lock((pthread_mutex_t *)result);
          uint64_t v6 = *(__CFDictionary **)(v4 + 16);
          if (a3) {
            CFDictionarySetValue(v6, a2, a3);
          }
          else {
            CFDictionaryRemoveValue(v6, a2);
          }
          uint64_t v7 = *(pthread_mutex_t **)(v4 + 88);
          return pthread_mutex_unlock(v7);
        }
      }
    }
  }
  return result;
}

int64_t TUTestStateGetSInt32(uint64_t a1, const void *a2, _DWORD *a3)
{
  int v9 = 0;
  if (!a1 || !a2 || !*(void *)(a1 + 16) || (uint64_t v6 = *(pthread_mutex_t **)(a1 + 88)) == 0)
  {
    int64_t Int64Ranged = 0;
    int v9 = -6745;
    if (!a3) {
      return Int64Ranged;
    }
    goto LABEL_6;
  }
  pthread_mutex_lock(v6);
  int64_t Int64Ranged = CFDictionaryGetInt64Ranged(*(const __CFDictionary **)(a1 + 16), a2, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v9);
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  if (a3) {
LABEL_6:
  }
    *a3 = v9;
  return Int64Ranged;
}

uint64_t TUTestStateSetSInt32(uint64_t result, const void *a2, int a3)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v4 = result;
      if (*(void *)(result + 16))
      {
        uint64_t result = *(void *)(result + 88);
        if (result)
        {
          pthread_mutex_lock((pthread_mutex_t *)result);
          CFDictionarySetInt64(*(__CFDictionary **)(v4 + 16), a2, a3);
          uint64_t v6 = *(pthread_mutex_t **)(v4 + 88);
          return pthread_mutex_unlock(v6);
        }
      }
    }
  }
  return result;
}

uint64_t TUTestStateUpdateSInt32(uint64_t a1, const void *a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 16) && (uint64_t v6 = *(pthread_mutex_t **)(a1 + 88)) != 0)
    {
      pthread_mutex_lock(v6);
      uint64_t v3 = CFDictionaryGetInt64Ranged(*(const __CFDictionary **)(a1 + 16), a2, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0)+ a3;
      CFDictionarySetInt64(*(__CFDictionary **)(a1 + 16), a2, (int)v3);
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t TUTestStateSignal(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = *(void *)(result + 88);
    if (result)
    {
      if (*(void *)(v1 + 144))
      {
        pthread_mutex_lock((pthread_mutex_t *)result);
        ++*(_DWORD *)(v1 + 152);
        pthread_cond_signal(*(pthread_cond_t **)(v1 + 144));
        uint64_t v2 = *(pthread_mutex_t **)(v1 + 88);
        return pthread_mutex_unlock(v2);
      }
    }
  }
  return result;
}

uint64_t TUTestStateSignalCount(uint64_t a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 88));
  uint64_t v2 = *(unsigned int *)(a1 + 152);
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  return v2;
}

uint64_t TUTestStateWait(uint64_t a1, double a2)
{
  if (!a1 || !*(void *)(a1 + 88) || !*(void *)(a1 + 144)) {
    return 4294960551;
  }
  v13.tv_seCC_SHA1_CTX c = 0;
  v13.tv_nseCC_SHA1_CTX c = 0;
  clock_gettime(_CLOCK_REALTIME, &v13);
  __darwin_time_t v4 = v13.tv_sec + (uint64_t)a2;
  v13.tv_seCC_SHA1_CTX c = v4;
  double v5 = (a2 - (double)(uint64_t)a2) * 1000000000.0;
  uint64_t v6 = v13.tv_nsec + (uint64_t)v5;
  if (v6 > 999999999)
  {
    uint64_t v7 = 1999999999;
    if (v6 < 1999999999) {
      uint64_t v7 = v13.tv_nsec + (uint64_t)v5;
    }
    unint64_t v8 = (v6 + 999999999 - v7) / 0x3B9ACA00uLL;
    uint64_t v6 = v6 - 1000000000 * v8 - 1000000000;
    v13.tv_seCC_SHA1_CTX c = v4 + v8 + 1;
  }
  v13.tv_nseCC_SHA1_CTX c = v6;
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 88));
  while (1)
  {
    int v9 = *(_DWORD *)(a1 + 152);
    if (v9) {
      break;
    }
    uint64_t v10 = pthread_cond_timedwait(*(pthread_cond_t **)(a1 + 144), *(pthread_mutex_t **)(a1 + 88), &v13);
    if (v10)
    {
      uint64_t v11 = v10;
      goto LABEL_14;
    }
  }
  uint64_t v11 = 0;
  *(_DWORD *)(a1 + 152) = v9 - 1;
LABEL_14:
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  return v11;
}

uint64_t GetMachThreadPriority(_DWORD *a1, kern_return_t *a2)
{
  kern_return_t v6;
  uint64_t v7;
  int v9;
  long long v10;
  long long v11;
  long long v12;
  uint64_t v13;
  integer_t thread_info_out[4];
  long long v15;
  uint64_t v16;
  mach_msg_type_number_t thread_info_outCnt;

  id v16 = 0;
  *(_OWORD *)thread_info_out = 0u;
  uint64_t v15 = 0u;
  timespec v13 = 0;
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  uint64_t v10 = 0u;
  __darwin_time_t v4 = pthread_self();
  thread_inspect_t v5 = pthread_mach_thread_np(v4);
  thread_info_outCnt = 10;
  uint64_t v6 = thread_info(v5, 3u, thread_info_out, &thread_info_outCnt);
  if (v6) {
    goto LABEL_2;
  }
  int v9 = DWORD1(v15);
  if (a1) {
    *a1 = DWORD1(v15);
  }
  switch(v9)
  {
    case 4:
      thread_info_outCnt = 4;
      uint64_t v6 = thread_info(v5, 0xCu, (thread_info_t)&v12 + 2, &thread_info_outCnt);
      if (v6) {
        goto LABEL_2;
      }
      uint64_t v7 = HIDWORD(v12);
      break;
    case 2:
      thread_info_outCnt = 5;
      uint64_t v6 = thread_info(v5, 0xBu, (thread_info_t)&v11 + 1, &thread_info_outCnt);
      if (v6) {
        goto LABEL_2;
      }
      uint64_t v7 = DWORD2(v11);
      break;
    case 1:
      thread_info_outCnt = 5;
      uint64_t v6 = thread_info(v5, 0xAu, (thread_info_t)&v10, &thread_info_outCnt);
      if (!v6)
      {
        uint64_t v7 = DWORD1(v10);
        break;
      }
LABEL_2:
      uint64_t v7 = 0;
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = -6735;
      break;
  }
  if (a2) {
    *a2 = v6;
  }
  return v7;
}

uint64_t SetCurrentThreadPriority(integer_t a1)
{
  if (a1 == 0x7FFFFFFF)
  {
    *(void *)policy_info = 0;
    uint64_t v10 = 0;
    BOOLean_t get_default = 1;
    mach_msg_type_number_t policy_infoCnt = 4;
    thread_inspect_t v1 = MEMORY[0x192FAA6F0]();
    uint64_t result = thread_policy_get(v1, 2u, policy_info, &policy_infoCnt, &get_default);
    if (!result)
    {
      thread_act_t v3 = MEMORY[0x192FAA6F0]();
      return thread_policy_set(v3, 2u, policy_info, 4u);
    }
  }
  else
  {
    mach_msg_type_number_t policy_infoCnt = 0;
    *(void *)policy_info = 0;
    thread_inspect_t v5 = pthread_self();
    uint64_t result = pthread_getschedparam(v5, (int *)&policy_infoCnt, (sched_param *)policy_info);
    if (!result)
    {
      policy_info[0] = a1;
      uint64_t v6 = pthread_self();
      return pthread_setschedparam(v6, 2, (const sched_param *)policy_info);
    }
  }
  return result;
}

uint64_t UpTicksPerSecond()
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  return UpTicksPerSecond_sTicksPerSecond;
}

uint64_t _UpTicksPerSecondInit(unint64_t *a1)
{
  unint64_t v2 = 1000000000;
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  if (!result)
  {
    if (info.numer) {
      BOOL v4 = info.denom == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4) {
      unint64_t v2 = 1000000000 * (unint64_t)info.denom / info.numer;
    }
  }
  *a1 = v2;
  return result;
}

uint64_t SleepForUpTicks(uint64_t a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  unint64_t v2 = UpTicksPerSecond_sTicksPerSecond;
  uint64_t result = mach_absolute_time();
  for (i = result + a1; result < i; uint64_t result = mach_absolute_time())
  {
    v5.tv_seCC_SHA1_CTX c = (int)((i - result) / v2);
    v5.tv_nseCC_SHA1_CTX c = (int)(1000000000 * ((i - result) % v2) / v2);
    if (nanosleep(&v5, 0))
    {
      if (*__error()) {
        __error();
      }
    }
  }
  return result;
}

uint64_t SleepUntilUpTicks(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = mach_absolute_time();
    BOOL v3 = v1 >= v2;
    uint64_t result = v1 - v2;
    if (result != 0 && v3)
    {
      return SleepForUpTicks(result);
    }
  }
  return result;
}

double _UpTicksToSecondsInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = 1.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

double UpTicksToSecondsF(unint64_t a1)
{
  if (sUpTicksToSecondsOnce != -1) {
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  }
  return *(double *)&sUpTicksToSecondsMultiplier * (double)a1;
}

unint64_t UpTicksToMilliseconds(unint64_t a1)
{
  if (UpTicksToMilliseconds_sOnce != -1) {
    dispatch_once_f(&UpTicksToMilliseconds_sOnce, &UpTicksToMilliseconds_sMultiplier, (dispatch_function_t)_UpTicksToMillisecondsInit);
  }
  return (unint64_t)(*(double *)&UpTicksToMilliseconds_sMultiplier * (double)a1);
}

double _UpTicksToMillisecondsInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = 1000.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

unint64_t UpTicksToMicroseconds(unint64_t a1)
{
  if (UpTicksToMicroseconds_sOnce != -1) {
    dispatch_once_f(&UpTicksToMicroseconds_sOnce, &UpTicksToMicroseconds_sMultiplier, (dispatch_function_t)_UpTicksToMicrosecondsInit);
  }
  return (unint64_t)(*(double *)&UpTicksToMicroseconds_sMultiplier * (double)a1);
}

double _UpTicksToMicrosecondsInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = 1000000.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

unint64_t UpTicksToNanoseconds(unint64_t a1)
{
  if (UpTicksToNanoseconds_sOnce != -1) {
    dispatch_once_f(&UpTicksToNanoseconds_sOnce, &UpTicksToNanoseconds_sMultiplier, (dispatch_function_t)_UpTicksToNanosecondsInit);
  }
  return (unint64_t)(*(double *)&UpTicksToNanoseconds_sMultiplier * (double)a1);
}

double _UpTicksToNanosecondsInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = 1000000000.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

unint64_t UpTicksToNTP(unint64_t a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  return (((unint64_t)(a1 % UpTicksPerSecond_sTicksPerSecond) << 32)
        / UpTicksPerSecond_sTicksPerSecond) | ((a1 / UpTicksPerSecond_sTicksPerSecond) << 32);
}

uint64_t SecondsToUpTicks(uint64_t a1)
{
  if (SecondsToUpTicks_sOnce != -1) {
    dispatch_once_f(&SecondsToUpTicks_sOnce, &SecondsToUpTicks_sMultiplier, (dispatch_function_t)_SecondsToUpTicksInit);
  }
  return SecondsToUpTicks_sMultiplier * a1;
}

void _SecondsToUpTicksInit(void *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  *a1 = UpTicksPerSecond_sTicksPerSecond;
}

unint64_t SecondsToUpTicksF(double a1)
{
  if (SecondsToUpTicksF_sOnce != -1) {
    dispatch_once_f(&SecondsToUpTicksF_sOnce, &SecondsToUpTicksF_sMultiplier, (dispatch_function_t)_SecondsToUpTicksFInit);
  }
  return (unint64_t)(*(double *)&SecondsToUpTicksF_sMultiplier * a1);
}

double _SecondsToUpTicksFInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  return result;
}

unint64_t MillisecondsToUpTicks(unint64_t a1)
{
  if (MillisecondsToUpTicks_sOnce != -1) {
    dispatch_once_f(&MillisecondsToUpTicks_sOnce, &MillisecondsToUpTicks_sMultiplier, (dispatch_function_t)_MillisecondsToUpTicksInit);
  }
  return (unint64_t)(*(double *)&MillisecondsToUpTicks_sMultiplier * (double)a1);
}

double _MillisecondsToUpTicksInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond / 1000.0;
  *a1 = result;
  return result;
}

unint64_t MicrosecondsToUpTicks(unint64_t a1)
{
  if (MicrosecondsToUpTicks_sOnce != -1) {
    dispatch_once_f(&MicrosecondsToUpTicks_sOnce, &MicrosecondsToUpTicks_sMultiplier, (dispatch_function_t)_MicrosecondsToUpTicksInit);
  }
  return (unint64_t)(*(double *)&MicrosecondsToUpTicks_sMultiplier * (double)a1);
}

double _MicrosecondsToUpTicksInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond / 1000000.0;
  *a1 = result;
  return result;
}

unint64_t NanosecondsToUpTicks(unint64_t a1)
{
  if (NanosecondsToUpTicks_sOnce != -1) {
    dispatch_once_f(&NanosecondsToUpTicks_sOnce, &NanosecondsToUpTicks_sMultiplier, (dispatch_function_t)_NanosecondsToUpTicksInit);
  }
  return (unint64_t)(*(double *)&NanosecondsToUpTicks_sMultiplier * (double)a1);
}

double _NanosecondsToUpTicksInit(double *a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  double result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond / 1000000000.0;
  *a1 = result;
  return result;
}

unint64_t NTPtoUpTicks(unint64_t a1)
{
  if (UpTicksPerSecond_sOnce != -1) {
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  }
  return UpTicksPerSecond_sTicksPerSecond * HIDWORD(a1)
       + ((UpTicksPerSecond_sTicksPerSecond * (unint64_t)a1) >> 32);
}

__darwin_time_t NanoTimeGetCurrent()
{
  v1.tv_seCC_SHA1_CTX c = 0;
  *(void *)&v1.tv_useCC_SHA1_CTX c = 0;
  gettimeofday(&v1, 0);
  return (1000 * v1.tv_usec) + 1000000000 * v1.tv_sec;
}

uint64_t YMD_HMStoSeconds(int a1, int a2, int a3, int a4, int a5, unsigned int a6, int a7)
{
  int v7 = a1 + 2;
  if (a1 >= 1) {
    int v7 = a1 - 1;
  }
  int v8 = 365 * (a1 - 1) + (v7 >> 2) + (a1 - 1) / -100 + (a1 - 1) / 400 + (3057 * a2 - 3007) / 100;
  HIDWORD(v10) = -1030792151 * a1 + 85899344;
  LODWORD(v10) = HIDWORD(v10);
  unsigned int v9 = v10 >> 2;
  LODWORD(v10) = HIDWORD(v10);
  if ((v10 >> 4) >= 0xA3D70B) {
    int v11 = -2;
  }
  else {
    int v11 = -1;
  }
  if (v9 <= 0x28F5C28) {
    int v12 = v11;
  }
  else {
    int v12 = -1;
  }
  if ((a1 & 3) != 0) {
    int v12 = -2;
  }
  int v13 = v12 + v8;
  if (a2 >= 3) {
    int v8 = v13;
  }
  return 60 * a5 + (uint64_t)(3600 * a4) + a6 + 86400 * (a3 - a7 + v8);
}

unint64_t SecondsToYMD_HMS(uint64_t a1, int *a2, _DWORD *a3, _DWORD *a4, int *a5, unsigned int *a6, _DWORD *a7)
{
  uint64_t v7 = a1 / 86400;
  uint64_t v8 = 963315389 * (int)(400 * (a1 / 86400));
  int v9 = (v8 >> 47) + ((unint64_t)v8 >> 63);
  int v10 = 365 * v9 - 365;
  do
  {
    int v11 = v9;
    if (v9 >= 0) {
      int v12 = v9;
    }
    else {
      int v12 = v9 + 3;
    }
    int v13 = v9 / -100;
    int v14 = v9 / 400;
    ++v9;
    v10 += 365;
  }
  while (v10 + v14 + v13 + (v12 >> 2) < (int)v7);
  int v15 = a1 % 86400;
  int v16 = v11 - 1;
  if (v11 >= 1) {
    int v17 = v11 - 1;
  }
  else {
    int v17 = v11 + 2;
  }
  unint64_t result = (unint64_t)(-1374389535 * v16) >> 63;
  int v19 = v7 - (v17 >> 2) - 365 * v16 + v16 / 100 + v16 / -400;
  int v20 = v19;
  if (v19 >= 60)
  {
    int v20 = v19 + 2;
    if ((v11 & 3) == 0)
    {
      HIDWORD(v21) = -1030792151 * v11 + 85899344;
      LODWORD(v21) = HIDWORD(v21);
      if ((v21 >> 2) > 0x28F5C28 || -400 * v14 == -v11)
      {
        if (v19 <= 0x3E) {
          int v22 = -2;
        }
        else {
          int v22 = -1;
        }
        v20 += v22;
      }
    }
  }
  unint64_t v23 = 1438680573 * (100 * v20 + 3007);
  unint64_t v24 = HIDWORD(v23);
  unint64_t v25 = v23 >> 63;
  int v26 = v15 / 3600;
  int v27 = v15 + 61936 * (v15 / 3600);
  if (a2) {
    *a2 = v11;
  }
  int v28 = v25 + ((int)v24 >> 10);
  if (a3) {
    *a3 = v28;
  }
  if (a4) {
    *a4 = (3057 * v28 - 3007) / -100 + v20;
  }
  if (a5) {
    *a5 = v26;
  }
  unsigned int v29 = ((__int16)((34953 * (__int16)v27) >> 16) >> 5)
      + (((v27 + ((-30583 * (__int16)v27) >> 16)) & 0x8000) >> 15);
  if (a6) {
    *a6 = v29;
  }
  if (a7) {
    *a7 = (__int16)(v27 - 60 * v29);
  }
  return result;
}

const char *MakeFractionalDateString(timeval *a1, char *a2, size_t a3)
{
  timespec v5 = a1;
  v10.tv_seCC_SHA1_CTX c = 0;
  *(void *)&v10.tv_useCC_SHA1_CTX c = 0;
  if (!a1)
  {
    timespec v5 = &v10;
    gettimeofday(&v10, 0);
  }
  tv_seCC_SHA1_CTX c = v5->tv_sec;
  uint64_t v6 = gmtime(&tv_sec);
  if (!v6) {
    return "";
  }
  size_t v7 = strftime(a2, a3, "%Y-%m-%dT%H:%M:%S", v6);
  snprintf(&a2[v7], a3 - v7, ".%06uZ", v5->tv_usec);
  return a2;
}

uint64_t ParseFractionalDateString(char *__s, int64_t a2, uint64_t a3, char **a4, double a5, int32x2_t a6)
{
  int64_t v8 = a2;
  if (a2 == -1) {
    int64_t v8 = strlen(__s);
  }
  timeval v10 = &__s[v8];
  if (v8 < 1)
  {
    int v11 = 0;
    int v13 = 0;
    int v12 = __s;
  }
  else
  {
    int v11 = 0;
    int v12 = __s;
    do
    {
      int v13 = *v12;
      if ((v13 - 48) > 9) {
        break;
      }
      int v11 = *v12++ + 10 * v11 - 48;
    }
    while (v12 < v10);
  }
  if (v12 - __s != 4) {
    return 4294960554;
  }
  if (v12 == v10)
  {
    unsigned int v18 = 0;
    unsigned int v19 = 0;
    unsigned int v20 = 0;
    LODWORD(v21) = 0;
    int v15 = 1;
LABEL_29:
    unsigned int v23 = 1;
    goto LABEL_30;
  }
  if (v13 != 90 && v13 != 45) {
    return 4294960554;
  }
  int v14 = v12 + 1;
  if (v12 + 1 >= v10)
  {
    int v15 = 0;
    int v17 = v12 + 1;
  }
  else
  {
    int v15 = 0;
    int v16 = (char *)(&__s[v8] - v12 - 1);
    int v17 = v12 + 1;
    while (1)
    {
      int v13 = *v17;
      if ((v13 - 48) > 9) {
        break;
      }
      int v15 = *v17++ + 10 * v15 - 48;
      if (!--v16)
      {
        int v17 = &__s[v8];
        break;
      }
    }
  }
  if (v17 - v14 != 2) {
    return 4294960554;
  }
  if ((v15 - 13) < 0xFFFFFFF4) {
    return 4294960586;
  }
  if (v17 == v10)
  {
    unsigned int v18 = 0;
    unsigned int v19 = 0;
    unsigned int v20 = 0;
    LODWORD(v21) = 0;
    goto LABEL_29;
  }
  if (v13 != 90 && v13 != 45) {
    return 4294960554;
  }
  int v22 = v17 + 1;
  if (v13 == 90)
  {
    unsigned int v18 = 0;
    unsigned int v19 = 0;
    unsigned int v20 = 0;
    LODWORD(v21) = 0;
    unsigned int v23 = 1;
LABEL_27:
    timeval v10 = v22;
    goto LABEL_30;
  }
  if (v22 >= v10) {
    return 4294960554;
  }
  unsigned int v23 = 0;
  unint64_t v25 = &__s[v8];
  int v26 = &__s[v8 + ~(unint64_t)v17];
  int v27 = v17 + 1;
  while (1)
  {
    int v28 = *v27;
    unsigned __int8 v29 = *v27;
    if ((v28 - 48) > 9) {
      break;
    }
    unsigned int v23 = (char)v28 + 10 * v23 - 48;
    ++v27;
    if (!--v26)
    {
      int v27 = &__s[v8];
      break;
    }
  }
  if (v27 - v22 != 2) {
    return 4294960554;
  }
  if (v23 > 0x1F) {
    return 4294960586;
  }
  if (v27 == v10)
  {
    unsigned int v18 = 0;
    goto LABEL_49;
  }
  if ((char)v28 != 90 && v29 != 84) {
    return 4294960554;
  }
  int v22 = v27 + 1;
  if ((char)v28 == 90)
  {
    unsigned int v18 = 0;
LABEL_46:
    unsigned int v19 = 0;
LABEL_47:
    unsigned int v20 = 0;
    LODWORD(v21) = 0;
    goto LABEL_27;
  }
  if (v22 >= v10) {
    return 4294960554;
  }
  unsigned int v18 = 0;
  uint64_t v30 = &__s[v8 + ~(unint64_t)v27];
  uint64_t v31 = v27 + 1;
  while (1)
  {
    int v32 = *v31;
    unsigned __int8 v33 = *v31;
    if ((v32 - 48) > 9) {
      break;
    }
    unsigned int v18 = (char)v32 + 10 * v18 - 48;
    ++v31;
    if (!--v30)
    {
      uint64_t v31 = &__s[v8];
      break;
    }
  }
  if (v31 - v22 != 2) {
    return 4294960554;
  }
  if (v18 > 0x17) {
    return 4294960586;
  }
  if (v31 == v10)
  {
LABEL_49:
    unsigned int v19 = 0;
LABEL_50:
    unsigned int v20 = 0;
    goto LABEL_51;
  }
  if ((char)v32 != 90 && v33 != 58) {
    return 4294960554;
  }
  int v22 = v31 + 1;
  if ((char)v32 == 90) {
    goto LABEL_46;
  }
  if (v22 >= v10) {
    return 4294960554;
  }
  unsigned int v19 = 0;
  BOOL v34 = &__s[v8 + ~(unint64_t)v31];
  int v35 = v31 + 1;
  while (1)
  {
    int v36 = *v35;
    unsigned __int8 v37 = *v35;
    if ((v36 - 48) > 9) {
      break;
    }
    unsigned int v19 = (char)v36 + 10 * v19 - 48;
    ++v35;
    if (!--v34)
    {
      int v35 = &__s[v8];
      break;
    }
  }
  if (v35 - v22 != 2) {
    return 4294960554;
  }
  if (v19 > 0x3B) {
    return 4294960586;
  }
  if (v35 == v10) {
    goto LABEL_50;
  }
  if ((char)v36 != 90 && v37 != 58) {
    return 4294960554;
  }
  int v22 = v35 + 1;
  if ((char)v36 == 90) {
    goto LABEL_47;
  }
  if (v22 >= v10) {
    return 4294960554;
  }
  unsigned int v20 = 0;
  uint64_t v38 = &__s[v8 + ~(unint64_t)v35];
  uint64_t v39 = v35 + 1;
  while (1)
  {
    int v40 = *v39;
    if ((v40 - 48) > 9) {
      break;
    }
    unsigned int v20 = *v39++ + 10 * v20 - 48;
    if (!--v38)
    {
      uint64_t v39 = &__s[v8];
      break;
    }
  }
  if (v39 - v22 != 2) {
    return 4294960554;
  }
  if (v20 > 0x3D) {
    return 4294960586;
  }
  if (v39 == v10)
  {
LABEL_51:
    LODWORD(v21) = 0;
    goto LABEL_30;
  }
  if (v40 != 90 && v40 != 46) {
    return 4294960554;
  }
  uint64_t v41 = v39 + 1;
  if (v40 == 90)
  {
    LODWORD(v21) = 0;
    timeval v10 = v39 + 1;
    goto LABEL_30;
  }
  if (v41 >= v10)
  {
    uint64_t v42 = 0;
    uint64_t v44 = v39 + 1;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v43 = &__s[v8 + ~(unint64_t)v39];
    uint64_t v44 = v41;
    while (1)
    {
      int v40 = *v44;
      if ((v40 - 48) > 9) {
        break;
      }
      uint64_t v42 = *v44++ + 10 * v42 - 48;
      if (!--v43)
      {
        uint64_t v44 = v25;
        break;
      }
    }
  }
  int v45 = v44 - v41;
  if ((int)v44 - (int)v41 > 9) {
    return 4294960586;
  }
  int v46 = v45 - 1;
  if (v45 < 1)
  {
    uint64_t v53 = 1;
  }
  else
  {
    unsigned int v47 = (v45 + 3) & 0xFFFFFFFC;
    a6.i32[0] = v46;
    unsigned int v48 = v46 & 0xFFFFFFFC;
    v49.i64[0] = 0x100000001;
    v49.i64[1] = 0x100000001;
    v50.i64[0] = 0xA0000000ALL;
    v50.i64[1] = 0xA0000000ALL;
    do
    {
      int8x16_t v51 = (int8x16_t)v49;
      int32x4_t v49 = vmulq_s32(v49, v50);
      v47 -= 4;
    }
    while (v47);
    int8x16_t v52 = vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v48), (int8x16_t)xmmword_18E416FA0), (uint32x4_t)vdupq_lane_s32(a6, 0)), v51, (int8x16_t)v49);
    *(int32x2_t *)v52.i8 = vmul_s32(*(int32x2_t *)v52.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL));
    uint64_t v53 = (v52.i32[0] * v52.i32[1]);
  }
  uint64_t v21 = 1000000 * v42 / v53;
  if (v44 != v10)
  {
    if (v40 == 90)
    {
      timeval v10 = v44 + 1;
      goto LABEL_30;
    }
    return 4294960554;
  }
LABEL_30:
  if (a3)
  {
    *(void *)a3 = (int)YMD_HMStoSeconds(v11, v15, v23, v18, v19, v20, 719163);
    *(_DWORD *)(a3 + 8) = v21;
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = v10;
  }
  return result;
}

uint64_t TLV8Get(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, void *a5, unsigned __int8 **a6)
{
  do
  {
    if (a1 == a2) {
      return 4294960569;
    }
    if (a1 >= a2) {
      return 4294960591;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      return 4294960569;
    }
    uint64_t v6 = a1 + 2;
    uint64_t v7 = a1[1];
    int64_t v8 = &a1[v7 + 2];
    if (v8 > a2) {
      return 4294960546;
    }
    int v9 = *a1;
    a1 += v7 + 2;
  }
  while (v9 != a3);
  if (a4) {
    *a4 = v6;
  }
  if (a5) {
    *a5 = v7;
  }
  uint64_t result = 0;
  if (a6) {
    *a6 = v8;
  }
  return result;
}

uint64_t TLV8GetBytes(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unint64_t a4, size_t a5, char *__dst, void *a7, unsigned __int8 **a8)
{
  do
  {
    if (a1 == a2) {
      return 4294960569;
    }
    if (a1 >= a2) {
      return 4294960591;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      return 4294960569;
    }
    int v14 = a1 + 2;
    size_t v15 = a1[1];
    int v16 = &a1[v15 + 2];
    if (v16 > a2) {
      return 4294960546;
    }
    int v17 = *a1;
    a1 += v15 + 2;
  }
  while (v17 != a3);
  if (v15 > a5) {
    return 4294960545;
  }
  unsigned int v18 = &__dst[a5];
  memcpy(__dst, v14, v15);
  unsigned int v19 = &__dst[v15];
LABEL_8:
  unsigned int v20 = v16;
  while (a2 > v20)
  {
    if ((unint64_t)(a2 - v20) < 2) {
      break;
    }
    uint64_t v21 = v20 + 2;
    size_t v22 = v20[1];
    int v16 = &v20[v22 + 2];
    if (v16 > a2 || *v20 != a3) {
      break;
    }
    v20 += v22 + 2;
    if (v22)
    {
      if (v18 - v19 < v22) {
        return 4294960545;
      }
      memcpy(v19, v21, v22);
      v19 += v22;
      goto LABEL_8;
    }
  }
  if (v19 - __dst < a4) {
    return 4294960546;
  }
  if (a7) {
    *a7 = v19 - __dst;
  }
  uint64_t result = 0;
  if (a8) {
    *a8 = v20;
  }
  return result;
}

unint64_t TLVParseSInt64(unsigned __int8 *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result = 0;
  int v6 = -6743;
  if (a3)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        int v6 = 0;
        unint64_t result = (char)*a1;
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 2:
        int v6 = 0;
        unint64_t result = (__int16)(*a1 << 8) | (unint64_t)a1[1];
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 4:
        int v6 = 0;
        unint64_t result = (*a1 << 24) | ((unint64_t)a1[1] << 16) | ((unint64_t)a1[2] << 8) | a1[3];
        goto LABEL_15;
      case 8:
        int v6 = 0;
        unint64_t result = bswap64(*(void *)a1);
        if (!a4) {
          return result;
        }
        goto LABEL_16;
      default:
LABEL_15:
        if (a4) {
LABEL_16:
        }
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        int v6 = 0;
        unint64_t result = (__int16)(a1[1] << 8) | (unint64_t)*a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 4:
        int v6 = 0;
        unint64_t result = *(int *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 8:
        int v6 = 0;
        unint64_t result = *(void *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

uint64_t TLV8GetUInt64(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int *a4, unsigned __int8 **a5)
{
  do
  {
    if (a1 == a2)
    {
LABEL_16:
      uint64_t result = 0;
      int v9 = -6727;
      goto LABEL_13;
    }
    timespec v5 = a1;
    if (a1 >= a2)
    {
      uint64_t result = 0;
      int v9 = -6705;
      goto LABEL_13;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      goto LABEL_16;
    }
    int v6 = a1 + 2;
    uint64_t v7 = a1[1];
    a1 += v7 + 2;
    if (a1 > a2)
    {
      uint64_t result = 0;
      int v9 = -6750;
      goto LABEL_13;
    }
  }
  while (*v5 != a3);
  if (a5) {
    *a5 = a1;
  }
  uint64_t result = 0;
  int v9 = -6743;
  switch((int)v7)
  {
    case 1:
      int v9 = 0;
      uint64_t result = *v6;
      break;
    case 2:
      int v9 = 0;
      uint64_t result = *((unsigned __int16 *)v5 + 1);
      break;
    case 4:
      int v9 = 0;
      uint64_t result = *(unsigned int *)v6;
      break;
    case 8:
      int v9 = 0;
      uint64_t result = *(void *)v6;
      break;
    default:
      break;
  }
LABEL_13:
  if (a4) {
    *a4 = v9;
  }
  return result;
}

unint64_t TLVParseUInt64(unsigned int *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result = 0;
  int v6 = -6743;
  if (a3)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        int v6 = 0;
        unint64_t result = *(unsigned __int8 *)a1;
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 2:
        int v6 = 0;
        unint64_t result = __rev16(*(unsigned __int16 *)a1);
        if (a4) {
          goto LABEL_16;
        }
        return result;
      case 4:
        int v6 = 0;
        unint64_t result = bswap32(*a1);
        goto LABEL_15;
      case 8:
        int v6 = 0;
        unint64_t result = bswap64(*(void *)a1);
        if (!a4) {
          return result;
        }
        goto LABEL_16;
      default:
LABEL_15:
        if (a4) {
LABEL_16:
        }
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        int v6 = 0;
        unint64_t result = *(unsigned __int16 *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 4:
        int v6 = 0;
        unint64_t result = *a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      case 8:
        int v6 = 0;
        unint64_t result = *(void *)a1;
        if (a4) {
          goto LABEL_16;
        }
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

void *TLV8CopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, size_t *a4, int *a5)
{
  size_t v15 = 0;
  __srCC_SHA1_CTX c = 0;
  int v13 = 0;
  int v14 = 0;
  int v7 = TLV8GetOrCopyCoalesced(a1, a2, a3, &__src, &v15, &v14, &v13);
  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = v14;
    size_t v9 = v15;
    if (v14)
    {
LABEL_8:
      int v7 = 0;
      *a4 = v9;
      goto LABEL_9;
    }
    if (v15 <= 1) {
      size_t v10 = 1;
    }
    else {
      size_t v10 = v15;
    }
    int v11 = malloc_type_malloc(v10, 0x62CA982BuLL);
    int64_t v8 = v11;
    if (v11)
    {
      memcpy(v11, __src, v9);
      goto LABEL_8;
    }
    int v7 = -6728;
  }
LABEL_9:
  if (a5) {
    *a5 = v7;
  }
  return v8;
}

uint64_t TLV8GetOrCopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, void *a4, size_t *a5, void *a6, unsigned __int8 **a7)
{
  do
  {
    if (a1 == a2) {
      return 4294960569;
    }
    if (a1 >= a2) {
      return 4294960591;
    }
    if ((unint64_t)(a2 - a1) < 2) {
      return 4294960569;
    }
    size_t v9 = a1 + 2;
    size_t v10 = a1[1];
    int v11 = &a1[v10 + 2];
    if (v11 > a2) {
      return 4294960546;
    }
    int v12 = *a1;
    a1 += v10 + 2;
  }
  while (v12 != a3);
  int v13 = 0;
  while (2)
  {
    int v14 = v13;
    size_t v15 = v10;
    while (2)
    {
      size_t v16 = v15;
      int v17 = v9;
      unsigned int v18 = v11;
      do
      {
        if (a2 <= v18
          || (unint64_t)(a2 - v18) < 2
          || (size_t v9 = v18 + 2, v15 = v18[1], v11 = &v18[v15 + 2], v11 > a2)
          || *v18 != a3)
        {
          *a4 = v17;
          *a5 = v16;
          *a6 = v13;
          uint64_t result = 0;
          if (a7) {
            *a7 = v18;
          }
          return result;
        }
        v18 += v15 + 2;
      }
      while (!v15);
      if (!v16) {
        continue;
      }
      break;
    }
    uint64_t v21 = a4;
    size_t v22 = a5;
    unsigned int v23 = a6;
    unint64_t v24 = a7;
    size_t v10 = v16 + v15;
    unsigned int v19 = (char *)malloc_type_malloc(v16 + v15, 0xCDDDB754uLL);
    if (v19)
    {
      int v13 = v19;
      memcpy(v19, v17, v16);
      memcpy(&v13[v16], v9, v15);
      size_t v9 = v13;
      a6 = v23;
      a7 = v24;
      a4 = v21;
      a5 = v22;
      if (v14)
      {
        free(v14);
        a4 = v21;
        a5 = v22;
        a6 = v23;
        a7 = v24;
        size_t v9 = v13;
      }
      continue;
    }
    break;
  }
  if (v13) {
    free(v13);
  }
  return 4294960568;
}

void *TLV8BufferInit(void *result, uint64_t a2)
{
  *uint64_t result = result + 4;
  result[1] = 0;
  result[2] = a2;
  result[3] = 0;
  return result;
}

void TLV8BufferFree(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
}

uint64_t TLV8BufferAppend(uint64_t a1, char a2, char *__s, size_t a4)
{
  size_t v4 = a4;
  timespec v5 = __s;
  if (a4 == -1) {
    size_t v4 = strlen(__s);
  }
  if (v4 >= 0x100)
  {
    unint64_t v9 = v4 / 0xFF;
    if (v4 % 0xFF) {
      ++v9;
    }
    uint64_t v8 = 2 * v9;
  }
  else
  {
    uint64_t v8 = 2;
  }
  size_t v10 = v8 + v4;
  size_t v11 = *(void *)(a1 + 8);
  size_t v12 = v10 + v11;
  if (v10 + v11 > *(void *)(a1 + 16)) {
    return 4294960553;
  }
  if (v12 < v11) {
    return 4294960545;
  }
  if (v12 > 0x12C)
  {
    int v14 = (char *)malloc_type_malloc(v12, 0x21EF39BEuLL);
    if (!v14) {
      return 4294960568;
    }
    size_t v15 = v14;
    size_t v16 = *(const void **)(a1 + 24);
    size_t v17 = *(void *)(a1 + 8);
    if (v16)
    {
      memcpy(v14, v16, v17);
      free(*(void **)(a1 + 24));
    }
    else if (v17)
    {
      memcpy(v14, (const void *)(a1 + 32), v17);
    }
    *(void *)a1 = v15;
    *(void *)(a1 + 24) = v15;
    int v13 = &v15[*(void *)(a1 + 8)];
  }
  else
  {
    int v13 = (char *)(a1 + v11 + 32);
  }
  unsigned int v18 = &v5[v4];
  do
  {
    if ((unint64_t)(v18 - v5) >= 0xFF) {
      size_t v19 = 255;
    }
    else {
      size_t v19 = v18 - v5;
    }
    *int v13 = a2;
    v13[1] = v19;
    if (v19) {
      memcpy(v13 + 2, v5, v19);
    }
    v5 += v19;
    v13 += v19 + 2;
  }
  while (v5 != v18);
  uint64_t result = 0;
  *(void *)(a1 + 8) = &v13[-*(void *)a1];
  return result;
}

uint64_t TLV8BufferAppendSInt64(uint64_t a1, char a2, uint64_t a3)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (a3 == (char)a3)
  {
    LOBYTE(v5[0]) = a3;
    size_t v3 = 1;
  }
  else
  {
    v5[0] = a3;
    size_t v3 = 8;
  }
  return TLV8BufferAppend(a1, a2, (char *)v5, v3);
}

uint64_t TLV8BufferAppendUInt64(uint64_t a1, char a2, unint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 > 0xFF)
  {
    if (a3 >> 16)
    {
      int v5 = a3;
      if (HIDWORD(a3))
      {
        char v6 = BYTE4(a3);
        char v7 = BYTE5(a3);
        char v8 = BYTE6(a3);
        char v9 = HIBYTE(a3);
        size_t v3 = 8;
      }
      else
      {
        size_t v3 = 4;
      }
    }
    else
    {
      LOWORD(v5) = a3;
      size_t v3 = 2;
    }
  }
  else
  {
    LOBYTE(v5) = a3;
    size_t v3 = 1;
  }
  return TLV8BufferAppend(a1, a2, (char *)&v5, v3);
}

uint64_t TLV8BufferDetach(uint64_t a1, void *a2, size_t *a3)
{
  size_t v6 = *(void *)(a1 + 8);
  char v7 = *(void **)(a1 + 24);
  if (v7) {
    goto LABEL_8;
  }
  if (v6 <= 1) {
    size_t v8 = 1;
  }
  else {
    size_t v8 = *(void *)(a1 + 8);
  }
  char v9 = malloc_type_malloc(v8, 0xF62D7A9CuLL);
  if (v9)
  {
    char v7 = v9;
    if (v6) {
      memcpy(v9, *(const void **)a1, v6);
    }
LABEL_8:
    uint64_t result = 0;
    *(void *)a1 = a1 + 32;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 24) = 0;
    *a2 = v7;
    *a3 = v6;
    return result;
  }
  return 4294960568;
}

uint64_t URLDecodeEx(char *__s, int64_t a2, unsigned char *a3, uint64_t a4, void *a5, _DWORD *a6)
{
  uint64_t v10 = __s;
  if (a2 == -1) {
    a2 = strlen(__s);
  }
  if (a2 < 1)
  {
    uint64_t result = 0;
    int v11 = 0;
    int v13 = a3;
    goto LABEL_27;
  }
  int v11 = 0;
  size_t v12 = &v10[a2];
  int v13 = a3;
  while (1)
  {
    int v14 = *v10;
    if (v14 != 43) {
      break;
    }
    ++v11;
    LOBYTE(v14) = 32;
LABEL_12:
    ++v10;
    if (!a3) {
      goto LABEL_24;
    }
LABEL_22:
    if (v13 >= &a3[a4])
    {
      uint64_t result = 4294960545;
      goto LABEL_27;
    }
    *int v13 = v14;
LABEL_24:
    ++v13;
    if (v10 >= v12)
    {
      uint64_t result = 0;
      goto LABEL_27;
    }
  }
  if (v14 != 37) {
    goto LABEL_12;
  }
  if (v12 - (v10 + 1) >= 2)
  {
    int v15 = v10[1];
    char v16 = v15 - 48;
    if ((v15 - 48) >= 0xA)
    {
      if ((v15 - 97) > 5)
      {
        if ((v15 - 65) > 5) {
          goto LABEL_32;
        }
        char v16 = v15 - 55;
      }
      else
      {
        char v16 = v15 - 87;
      }
    }
    int v17 = v10[2];
    char v18 = v17 - 48;
    if ((v17 - 48) >= 0xA)
    {
      if ((v17 - 97) > 5)
      {
        if ((v17 - 65) > 5)
        {
LABEL_32:
          uint64_t result = 4294960554;
          goto LABEL_27;
        }
        char v18 = v17 - 55;
      }
      else
      {
        char v18 = v17 - 87;
      }
    }
    v10 += 3;
    LOBYTE(v14) = v18 | (16 * v16);
    ++v11;
    if (!a3) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  uint64_t result = 4294960546;
LABEL_27:
  if (a5) {
    *a5 = v13 - a3;
  }
  if (a6) {
    *a6 = v11;
  }
  return result;
}

uint64_t URLDecodeCopy(char *__s, size_t a2, void *a3, void *a4)
{
  size_t v6 = a2;
  if (a2 == -1) {
    size_t v6 = strlen(__s);
  }
  uint64_t v14 = 0;
  uint64_t v8 = URLDecodeEx(__s, v6, 0, 0, &v14, 0);
  if (v8) {
    return v8;
  }
  char v9 = malloc_type_malloc(v14 + 1, 0x8B02BB2EuLL);
  if (!v9) {
    return 4294960568;
  }
  uint64_t v10 = v9;
  uint64_t v11 = URLDecodeEx(__s, v6, v9, v14, &v14, 0);
  if (v11)
  {
    uint64_t v12 = v11;
    free(v10);
  }
  else
  {
    *((unsigned char *)v10 + v14) = 0;
    *a3 = v10;
    uint64_t v12 = 0;
    if (a4) {
      *a4 = v14;
    }
  }
  return v12;
}

uint64_t URLParseComponents(char *__s, char *a2, char **a3, char **a4)
{
  size_t v6 = __s;
  if (!a2) {
    a2 = &__s[strlen(__s)];
  }
  char v7 = 0;
  if (a2 <= v6)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v6;
  }
  else
  {
    do
    {
      unsigned int v8 = v7[(void)v6];
      if (v8 <= 0x3F && ((1 << v8) & 0x8400800800000000) != 0)
      {
        char v7 = &v7[(void)v6];
        goto LABEL_12;
      }
      ++v7;
    }
    while ((char *)(a2 - v6) != v7);
    char v7 = a2;
LABEL_12:
    BOOL v12 = v8 == 58;
    if (v8 == 58) {
      uint64_t v11 = v7 + 1;
    }
    else {
      uint64_t v11 = v6;
    }
    if (v12) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v12) {
      size_t v6 = v7 + 1;
    }
    if (!v12) {
      char v7 = 0;
    }
  }
  int v13 = (char *)(a2 - v11);
  if (a2 - v11 >= 2 && *v6 == 47 && v6[1] == 47)
  {
    uint64_t v14 = v6 + 2;
    if (v6 + 2 >= a2)
    {
      size_t v22 = 0;
      unsigned int v23 = 0;
      unint64_t v24 = 0;
      unint64_t v25 = 0;
      unsigned int v20 = v6 + 2;
      int v26 = v6 + 2;
    }
    else
    {
      uint64_t v15 = 2;
      while (1)
      {
        unsigned int v16 = v6[v15];
        BOOL v17 = v16 > 0x3F;
        unint64_t v18 = (1 << v16) & 0x8000800800000000;
        if (!v17 && v18 != 0) {
          break;
        }
        if (v13 == (char *)++v15)
        {
          uint64_t v15 = (uint64_t)v13;
          break;
        }
      }
      unsigned int v20 = &v6[v15];
      if (v15 < 3)
      {
LABEL_39:
        size_t v22 = 0;
        unsigned int v23 = 0;
        unint64_t v24 = 0;
        unint64_t v25 = 0;
      }
      else
      {
        unint64_t v21 = 2;
        while (v6[v21] != 64)
        {
          if (v15 == ++v21) {
            goto LABEL_39;
          }
        }
        unsigned int v47 = &v6[v21];
        if (v21 < 3)
        {
          unint64_t v25 = 0;
          unint64_t v24 = 0;
          unsigned int v23 = v6 + 2;
        }
        else
        {
          unsigned int v23 = v6 + 2;
          unint64_t v24 = v6 + 2;
          while (1)
          {
            int v48 = *v24++;
            if (v48 == 58) {
              break;
            }
            unsigned int v23 = v24;
            if (v24 >= v47)
            {
              unint64_t v25 = 0;
              unsigned int v23 = v24;
              unint64_t v24 = 0;
              goto LABEL_95;
            }
          }
          unint64_t v25 = v47;
        }
LABEL_95:
        size_t v22 = v6 + 2;
        uint64_t v14 = v47 + 1;
      }
      int v26 = v20;
    }
  }
  else
  {
    size_t v22 = 0;
    unsigned int v23 = 0;
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    uint64_t v14 = 0;
    int v26 = 0;
    unsigned int v20 = v6;
  }
  if (v20 >= a2)
  {
    BOOL v30 = 0;
    if (v14)
    {
      uint64_t v31 = 0;
      int v32 = 0;
      unsigned __int8 v33 = 0;
      BOOL v34 = 0;
      int v35 = 0;
      int v36 = 0;
      unsigned __int8 v37 = 0;
      uint64_t v38 = v20;
      unsigned __int8 v29 = v20;
      goto LABEL_79;
    }
    unsigned __int8 v33 = 0;
    int v32 = 0;
    uint64_t v31 = 0;
    BOOL v41 = 0;
    unsigned __int8 v29 = v20;
    uint64_t v38 = v20;
  }
  else
  {
    uint64_t v27 = 0;
    while (1)
    {
      int v28 = v20[v27];
      if (v28 == 35 || v28 == 63) {
        break;
      }
      if (a2 - v20 == ++v27)
      {
        unsigned __int8 v29 = a2;
        goto LABEL_50;
      }
    }
    unsigned __int8 v29 = &v20[v27];
LABEL_50:
    if (v28 == 63)
    {
      unsigned __int8 v33 = v29 + 1;
      if (v29 + 1 >= a2)
      {
        int v28 = 63;
        int v40 = v29 + 1;
        int v32 = v29 + 1;
      }
      else
      {
        uint64_t v39 = &a2[~(unint64_t)v29];
        int v40 = v29 + 1;
        while (1)
        {
          int v28 = *v40;
          if (v28 == 35) {
            break;
          }
          ++v40;
          if (!--v39)
          {
            int v40 = a2;
            int v32 = a2;
            goto LABEL_60;
          }
        }
        int v32 = v40;
      }
    }
    else
    {
      unsigned __int8 v33 = 0;
      int v32 = 0;
      int v40 = v29;
    }
LABEL_60:
    BOOL v42 = v28 == 35;
    BOOL v30 = v28 == 35;
    if (v28 == 35) {
      uint64_t v38 = a2;
    }
    else {
      uint64_t v38 = v40;
    }
    if (v42) {
      uint64_t v31 = (unsigned __int8 *)(v40 + 1);
    }
    else {
      uint64_t v31 = 0;
    }
    if (v14)
    {
      BOOL v34 = 0;
      int v35 = 0;
      int v36 = 0;
      unsigned __int8 v37 = 0;
      goto LABEL_79;
    }
    if (*v20 != 58)
    {
      uint64_t v43 = &a2[~(unint64_t)v20];
      int v35 = v20;
      while (v43)
      {
        int v44 = *++v35;
        --v43;
        if (v44 == 58) {
          goto LABEL_77;
        }
      }
      int v35 = a2;
LABEL_77:
      BOOL v41 = v35 < a2;
      goto LABEL_78;
    }
    BOOL v41 = 1;
  }
  int v35 = v20;
LABEL_78:
  int v36 = &v35[v41];
  BOOL v34 = v20;
  unsigned __int8 v37 = a2;
LABEL_79:
  *a3 = v10;
  a3[1] = (char *)(v7 - v10);
  a3[2] = v22;
  a3[3] = (char *)(v23 - v22);
  a3[4] = v24;
  a3[5] = (char *)(v25 - v24);
  a3[6] = v14;
  a3[7] = (char *)(v26 - v14);
  a3[8] = v20;
  a3[9] = (char *)(v29 - v20);
  a3[10] = v33;
  a3[11] = (char *)(v32 - v33);
  if (v30) {
    int v45 = a2;
  }
  else {
    int v45 = 0;
  }
  a3[12] = (char *)v31;
  a3[13] = (char *)(v45 - (char *)v31);
  if (v20 < v29 && *v20 == 47) {
    ++v20;
  }
  a3[14] = v20;
  a3[15] = v29;
  a3[16] = v34;
  a3[17] = (char *)(v35 - v34);
  a3[18] = v36;
  a3[19] = (char *)(v37 - v36);
  if (a4) {
    *a4 = v38;
  }
  return 0;
}

uint64_t URLGetNextPathSegment(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 112);
  unint64_t v4 = *(void *)(a1 + 120);
  if (v3 >= v4 || *(unsigned char *)v3 == 47) {
    return 4294960569;
  }
  uint64_t v5 = 0;
  size_t v6 = *(unsigned char **)(a1 + 120);
  while (~v3 + v4 != v5)
  {
    int v7 = *(unsigned __int8 *)(v3 + v5++ + 1);
    if (v7 == 47)
    {
      size_t v6 = (unsigned char *)(v3 + v5);
      break;
    }
  }
  if (v6 == (unsigned char *)v3) {
    return 4294960569;
  }
  uint64_t v8 = 0;
  *a2 = v3;
  *a3 = &v6[-v3];
  if ((unint64_t)v6 >= v4) {
    char v9 = v6;
  }
  else {
    char v9 = v6 + 1;
  }
  *(void *)(a1 + 112) = v9;
  return v8;
}

uint64_t URLGetOrCopyNextVariable(unint64_t a1, unsigned char *a2, char **a3, size_t *a4, void *a5, void *a6, size_t *a7, void *a8, void *a9)
{
  size_t v31 = 0;
  int v32 = 0;
  size_t v28 = 0;
  unsigned __int8 v29 = 0;
  int v26 = 0;
  BOOL v30 = 0;
  uint64_t v27 = 0;
  uint64_t v15 = URLGetNextVariable(a1, a2, (unint64_t *)&v32, &v31, &v29, &v28, a9);
  if (v15) {
    return v15;
  }
  size_t v17 = v31;
  unsigned int v16 = v32;
  uint64_t v18 = URLDecodeEx(v32, v31, 0, 0, 0, &v26);
  if (v18) {
    goto LABEL_17;
  }
  if (v26 < 1)
  {
    unsigned int v20 = 0;
    if (!a8) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v19 = URLDecodeCopy(v16, v17, &v30, &v31);
    unsigned int v20 = v30;
    if (v19) {
      goto LABEL_15;
    }
    int v32 = (char *)v30;
    unsigned int v16 = (char *)v30;
    if (!a8)
    {
LABEL_6:
      unint64_t v21 = 0;
      goto LABEL_7;
    }
  }
  unint64_t v25 = a7;
  size_t v22 = v28;
  unsigned int v23 = v29;
  uint64_t v19 = URLDecodeEx(v29, v28, 0, 0, 0, &v26);
  if (v19)
  {
LABEL_15:
    uint64_t v18 = v19;
    if (v20) {
      free(v20);
    }
    goto LABEL_17;
  }
  if (v26 < 1)
  {
    unint64_t v21 = 0;
    a7 = v25;
  }
  else
  {
    uint64_t v19 = URLDecodeCopy(v23, v22, &v27, &v28);
    a7 = v25;
    if (v19) {
      goto LABEL_15;
    }
    unint64_t v21 = v27;
    unsigned __int8 v29 = (char *)v27;
  }
LABEL_7:
  *a3 = v16;
  *a4 = v31;
  *a5 = v20;
  if (a6) {
    *a6 = v29;
  }
  if (a7) {
    *a7 = v28;
  }
  uint64_t v18 = 0;
  if (a8)
  {
    *a8 = v21;
    return v18;
  }
LABEL_17:
  if (v27) {
    free(v27);
  }
  return v18;
}

uint64_t URLGetNextVariable(unint64_t a1, unsigned char *a2, unint64_t *a3, void *a4, void *a5, void *a6, void *a7)
{
  if (a1 >= (unint64_t)a2) {
    return 4294960569;
  }
  int v7 = 0;
  BOOL v8 = 1;
  while (1)
  {
    int v9 = v7[a1];
    if (v9 == 38 || v9 == 61) {
      break;
    }
    BOOL v8 = &(++v7)[a1] < a2;
    if (&a2[-a1] == v7)
    {
      uint64_t v10 = a2;
      goto LABEL_8;
    }
  }
  uint64_t v10 = &v7[a1];
LABEL_8:
  uint64_t v11 = &v10[v8];
  if (v9 == 61)
  {
    if (v11 >= a2)
    {
      uint64_t v12 = 0;
      int v13 = v11;
    }
    else
    {
      uint64_t v12 = 1;
      int v13 = v11;
      while (*v13 != 38)
      {
        if (++v13 >= a2)
        {
          uint64_t v12 = 0;
          int v13 = a2;
          break;
        }
      }
    }
    uint64_t v14 = &v13[v12];
  }
  else
  {
    int v13 = 0;
    uint64_t v14 = &v10[v8];
    uint64_t v11 = 0;
  }
  uint64_t v15 = 0;
  *a3 = a1;
  *a4 = &v10[-a1];
  *a5 = v11;
  *a6 = v13 - v11;
  *a7 = v14;
  return v15;
}

uint64_t URLGetOrCopyVariable(unint64_t a1, unsigned char *a2, unsigned __int8 *a3, void *a4, void *a5, char **a6, void *a7)
{
  int v26 = 0;
  unint64_t v27 = a1;
  unint64_t v24 = 0;
  size_t v25 = 0;
  size_t v22 = 0;
  unsigned int v23 = 0;
  int v20 = 0;
  while (1)
  {
    uint64_t result = URLGetOrCopyNextVariable(v27, a2, &v26, &v25, &v24, &v23, &v22, 0, &v27);
    if (result) {
      return result;
    }
    uint64_t v14 = v26;
    size_t v15 = v25;
    unsigned int v16 = a3;
    while (v15)
    {
      int v17 = *v16;
      if (*v14 != v17)
      {
        int v18 = 1;
        goto LABEL_12;
      }
      ++v16;
      ++v14;
      --v15;
      if (!v17)
      {
        int v18 = 0;
        goto LABEL_12;
      }
    }
    if (a3[v25]) {
      int v18 = -1;
    }
    else {
      int v18 = 0;
    }
LABEL_12:
    if (v24) {
      free(v24);
    }
    if (!v18)
    {
      unint64_t v21 = 0;
      if (!a6) {
        goto LABEL_20;
      }
      uint64_t result = URLDecodeEx(v23, v22, 0, 0, 0, &v20);
      if (result) {
        return result;
      }
      if (v20 >= 1)
      {
        uint64_t result = URLDecodeCopy(v23, v22, &v21, &v22);
        if (result) {
          return result;
        }
        uint64_t v19 = v21;
        unsigned int v23 = v21;
      }
      else
      {
LABEL_20:
        uint64_t v19 = 0;
      }
      if (a4) {
        *a4 = v23;
      }
      if (a5) {
        *a5 = v22;
      }
      if (a6) {
        *a6 = v19;
      }
      uint64_t result = 0;
      if (a7) {
        *a7 = v27;
      }
      return result;
    }
  }
}

uint64_t URLGetVariable(unint64_t a1, unsigned char *a2, unsigned __int8 *a3, void *a4, void *a5, void *a6)
{
  int v20 = 0;
  unint64_t v21 = a1;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
LABEL_2:
  while (2)
  {
    uint64_t result = URLGetNextVariable(v21, a2, (unint64_t *)&v20, &v19, &v18, &v17, &v21);
    if (!result)
    {
      uint64_t v12 = v20;
      uint64_t v13 = v19;
      uint64_t v14 = a3;
      while (v13)
      {
        int v15 = *v14;
        if (*v12 != v15) {
          goto LABEL_2;
        }
        ++v14;
        ++v12;
        --v13;
        if (!v15) {
          goto LABEL_14;
        }
      }
      if (a3[v19]) {
        int v16 = -1;
      }
      else {
        int v16 = 0;
      }
      if (v16) {
        continue;
      }
LABEL_14:
      if (a4) {
        *a4 = v18;
      }
      if (a5) {
        *a5 = v17;
      }
      uint64_t result = 0;
      if (a6) {
        *a6 = v21;
      }
    }
    return result;
  }
}

uint64_t UUIDGet(unsigned char *a1)
{
  uint64_t result = RandomBytes(a1, 0x10uLL);
  a1[6] = a1[6] & 0xF | 0x40;
  a1[8] = a1[8] & 0x3F | 0x80;
  return result;
}

uint64_t UUIDGetPerSystemHost(const char *a1, size_t a2, uuid_t a3)
{
  v13.tv_seCC_SHA1_CTX c = 0;
  v13.tv_nseCC_SHA1_CTX c = 0;
  uint64_t v6 = gethostuuid(a3, &v13);
  if (v6)
  {
    if (gLogCategory_CUMisc <= 90)
    {
      uint64_t v11 = v6;
      if (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x5Au)) {
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"void UUIDGetPerSystemHost(const void *, size_t, void *)", 0x5Au, (uint64_t)"### gethostuuid failed for per-system host UUID: %#m\n", v7, v8, v9, v10, v11);
      }
    }
    RandomBytes(a3, 0x10uLL);
    a3[6] = a3[6] & 0xF | 0x40;
    a3[8] = a3[8] & 0x3F | 0x80;
  }
  if (a2 == -1) {
    a2 = strlen(a1);
  }
  uint64_t result = CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)a3, 16, "PerSystem", 9uLL, (uint64_t)a1, a2, 0x10uLL, (uint64_t)a3);
  a3[6] = a3[6] & 0xF | 0x40;
  a3[8] = a3[8] & 0x3F | 0x80;
  return result;
}

uint64_t UUIDGetPerUserHost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(bytes, 0, sizeof(bytes));
  v14.tv_seCC_SHA1_CTX c = 0;
  v14.tv_nseCC_SHA1_CTX c = 0;
  uint64_t v6 = gethostuuid(bytes, &v14);
  if (v6)
  {
    if (gLogCategory_CUMisc <= 90)
    {
      uint64_t v11 = v6;
      if (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x5Au)) {
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"void UUIDGetPerUserHost(const void *, size_t, void *)", 0x5Au, (uint64_t)"### gethostuuid failed for per-user host UUID: %#m\n", v7, v8, v9, v10, v11);
      }
    }
    RandomBytes(bytes, 0x10uLL);
    UInt8 bytes[6] = bytes[6] & 0xF | 0x40;
    bytes[8] = bytes[8] & 0x3F | 0x80;
  }
  uid_t v12 = getuid();
  int v16 = 0;
  char v17 = HIBYTE(v12);
  char v18 = BYTE2(v12);
  char v19 = BYTE1(v12);
  char v20 = v12;
  uint64_t result = CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)bytes, 24, "PerUser", 7uLL, a1, a2, 0x10uLL, a3);
  *(unsigned char *)(a3 + 6) = *(unsigned char *)(a3 + 6) & 0xF | 0x40;
  *(unsigned char *)(a3 + 8) = *(unsigned char *)(a3 + 8) & 0x3F | 0x80;
  return result;
}

uint64_t _WiFiManagerGetTypeID()
{
  uint64_t result = _CFRuntimeRegisterClass();
  gWiFiManagerCFTypeID TypeID = result;
  return result;
}

pthread_mutex_t *_WiFiManagerFinalize(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 88);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 88) = 0;
  }
  int v3 = *(_DWORD *)(a1 + 104);
  if ((v3 & 0x80000000) == 0)
  {
    if (close(v3) && *__error()) {
      __error();
    }
    *(_DWORD *)(a1 + 104) = -1;
  }
  unint64_t v4 = *(const void **)(a1 + 176);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 176) = 0;
  }
  uint64_t v5 = *(const void **)(a1 + 184);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 184) = 0;
  }
  if (*(void *)(a1 + 152))
  {
    Apple80211Close();
    *(void *)(a1 + 152) = 0;
  }
  uint64_t v6 = *(const void **)(a1 + 168);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 168) = 0;
  }
  uint64_t result = *(pthread_mutex_t **)(a1 + 80);
  if (result)
  {
    uint64_t result = (pthread_mutex_t *)pthread_mutex_destroy(result);
    *(void *)(a1 + 80) = 0;
  }
  return result;
}

uint64_t WiFiManagerCreate(void *a1)
{
  if (gWiFiManagerInitOnce != -1) {
    dispatch_once_f(&gWiFiManagerInitOnce, 0, (dispatch_function_t)_WiFiManagerGetTypeID);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 4294960568;
  }
  int v3 = (void *)Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  uint64_t v4 = Instance + 16;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 176) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_DWORD *)(Instance + 104) = -1;
  uint64_t v5 = pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0);
  if (v5)
  {
    CFRelease(v3);
  }
  else
  {
    v3[10] = v4;
    *a1 = v3;
  }
  return v5;
}

uint64_t WiFiManagerDoApple80211(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  size_t v25 = 0;
  if (gLogCategory_WiFiManagerCore <= 30
    && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
  {
    timespec v13 = "get";
    if (!a2) {
      timespec v13 = "set";
    }
    LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x1Eu, (uint64_t)"WiFiManagerDoApple80211: %s, ioc 0x%X, len %zu", a5, a6, a7, a8, (uint64_t)v13);
  }
  if (a1)
  {
    timespec v14 = 0;
  }
  else
  {
    uint64_t v22 = WiFiManagerCreate(&v25);
    timespec v14 = v25;
    a1 = (uint64_t)v25;
    if (v22) {
      goto LABEL_38;
    }
  }
  uint64_t v15 = _WiFiManagerEnsureInitialized(a1);
  if (v15)
  {
    uint64_t v22 = v15;
    goto LABEL_38;
  }
  if (!*(void *)(a1 + 152) && (uint64_t v20 = Apple80211Open(), v20))
  {
    uint64_t v22 = v20;
    if (gLogCategory_WiFiManagerCore <= 60
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x3Cu, (uint64_t)"### Open failed: %#m", v16, v17, v18, v19, v22);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 160)) {
      goto LABEL_16;
    }
    if (!*(void *)(a1 + 168))
    {
      if (gLogCategory_WiFiManagerCore <= 60
        && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
      {
        uint64_t v22 = 4294960596;
        LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x3Cu, (uint64_t)"### No ifname: %#m", v16, v17, v18, v19, 4294960596);
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    uint64_t v21 = Apple80211BindToInterface();
    if (!v21)
    {
      *(unsigned char *)(a1 + 160) = 1;
LABEL_16:
      *(_DWORD *)(a1 + 128) = a3;
      *(_DWORD *)(a1 + 136) = v8;
      *(void *)(a1 + 144) = a4;
      if (a2)
      {
        if (Apple80211RawGet()) {
          goto LABEL_18;
        }
      }
      else if (Apple80211RawSet())
      {
LABEL_18:
        if (*__error())
        {
          uint64_t v22 = *__error();
          goto LABEL_38;
        }
LABEL_37:
        uint64_t v22 = 4294960596;
        goto LABEL_38;
      }
      uint64_t v22 = 0;
      goto LABEL_38;
    }
    uint64_t v22 = v21;
    if (gLogCategory_WiFiManagerCore <= 60
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x3Cu, (uint64_t)"### Bind failed: '%@', %#m", v16, v17, v18, v19, *(void *)(a1 + 168));
    }
  }
LABEL_38:
  if (v14) {
    CFRelease(v14);
  }
  if (v22
    && gLogCategory_WiFiManagerCore <= 90
    && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x5Au)))
  {
    unsigned int v23 = "get";
    if (!a2) {
      unsigned int v23 = "set";
    }
    LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x5Au, (uint64_t)"### WiFiManagerDoApple80211 failed: %s, ioc 0x%X, len %zu, error %#m", v16, v17, v18, v19, (uint64_t)v23);
  }
  return v22;
}

uint64_t _WiFiManagerEnsureInitialized(uint64_t a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 80));
  if (*(void *)(a1 + 184))
  {
    uint64_t v2 = 0;
    goto LABEL_32;
  }
  uint64_t v3 = WiFiManagerClientCreate();
  if (!v3)
  {
    uint64_t v2 = 4294960596;
    goto LABEL_32;
  }
  uint64_t v4 = (const void *)v3;
  CFArrayRef v5 = (const __CFArray *)WiFiManagerClientCopyInterfaces();
  CFArrayRef v10 = v5;
  if (v5)
  {
    CFIndex Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      CFIndex v12 = Count;
      for (CFIndex i = 0; v12 != i; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v10, i);
        if (*(void *)(a1 + 88))
        {
          InterfaceName = (const void *)WiFiDeviceClientGetInterfaceName();
          if (InterfaceName && CFEqual(InterfaceName, *(CFTypeRef *)(a1 + 88)))
          {
LABEL_14:
            CFRetain(ValueAtIndex);
            *(void *)(a1 + 184) = ValueAtIndex;
            *(unsigned char *)(a1 + 96) = WiFiDeviceClientIsInterfaceAWDL();
            break;
          }
        }
        else if (!WiFiDeviceClientGetInterfaceRoleIndex())
        {
          goto LABEL_14;
        }
      }
    }
  }
  if (!*(void *)(a1 + 184))
  {
    if (gLogCategory_WiFiManagerCore <= 30
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
    {
      unsigned int v23 = *(__CFString **)(a1 + 88);
      if (!v23) {
        unsigned int v23 = @"*";
      }
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus _WiFiManagerEnsureInitialized(CUWiFiManagerRef)", 0x1Eu, (uint64_t)"### Init interface not found (%@)\n", v6, v7, v8, v9, (uint64_t)v23);
    }
    uint64_t v2 = 4294960569;
    goto LABEL_28;
  }
  *(void *)(a1 + 176) = v4;
  int v16 = socket(2, 2, 0);
  *(_DWORD *)(a1 + 104) = v16;
  if ((v16 & 0x80000000) == 0) {
    goto LABEL_17;
  }
  if (*__error())
  {
    uint64_t v2 = *__error();
    if (v2)
    {
LABEL_27:
      uint64_t v4 = 0;
      goto LABEL_28;
    }
LABEL_17:
    CFStringRef v17 = (const __CFString *)WiFiDeviceClientGetInterfaceName();
    uint64_t v4 = v17;
    if (!v17)
    {
      uint64_t v2 = 4294960552;
      goto LABEL_28;
    }
    CFStringGetCString(v17, (char *)(a1 + 112), 16, 0x8000100u);
    *(void *)(a1 + 168) = CFRetain(v4);
    if (gLogCategory_WiFiManagerCore <= 30
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus _WiFiManagerEnsureInitialized(CUWiFiManagerRef)", 0x1Eu, (uint64_t)"Initialized for %@ (%.6a)\n", v18, v19, v20, v21, (uint64_t)v4);
    }
    uint64_t v2 = 0;
    goto LABEL_27;
  }
  uint64_t v4 = 0;
  uint64_t v2 = 4294960596;
LABEL_28:
  if (v10) {
    CFRelease(v10);
  }
  if (v4) {
    CFRelease(v4);
  }
LABEL_32:
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 80));
  return v2;
}

unint64_t WiFiManagerGetInt64(uint64_t a1, const void *a2, uint64_t a3, int *a4)
{
  uint64_t v6 = a1;
  uint64_t v7 = 0;
  BOOL v41 = 0;
  if (!a1)
  {
    int v42 = WiFiManagerCreate(&v41);
    uint64_t v7 = v41;
    if (v42) {
      goto LABEL_14;
    }
    uint64_t v6 = (uint64_t)v41;
  }
  int v42 = _WiFiManagerEnsureInitialized(v6);
  if (!v42)
  {
    if (CFEqual(a2, @"channel"))
    {
      if (*(unsigned char *)(v6 + 96)) {
        uint64_t v8 = 132;
      }
      else {
        uint64_t v8 = 4;
      }
      CFNumberRef Int64 = CFNumberCreateInt64(v8);
      if (Int64)
      {
        CFNumberRef v10 = Int64;
        CFDictionaryRef v11 = (const __CFDictionary *)WiFiDeviceClientCopyProperty();
        CFRelease(v10);
        if (v11)
        {
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v11, @"CHANNEL");
          if (Value)
          {
LABEL_10:
            CFRetain(Value);
            int v42 = 0;
            goto LABEL_11;
          }
          int v29 = -6727;
LABEL_63:
          int v42 = v29;
LABEL_11:
          CFRelease(v11);
          if (!v7) {
            goto LABEL_40;
          }
LABEL_39:
          CFRelease(v7);
          goto LABEL_40;
        }
        goto LABEL_56;
      }
      goto LABEL_60;
    }
    if (CFEqual(a2, @"features"))
    {
      LOBYTE(valuePtr[0]) = 12;
      CFNumberRef v13 = CFNumberCreate(0, kCFNumberSInt8Type, valuePtr);
      if (!v13)
      {
LABEL_60:
        CFStringRef Value = 0;
        goto LABEL_61;
      }
      CFNumberRef v14 = v13;
      CFStringRef Value = (const __CFString *)WiFiDeviceClientCopyProperty();
      CFRelease(v14);
      if (!Value)
      {
LABEL_57:
        int v25 = -6735;
        goto LABEL_58;
      }
      CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
      if (Count < 1)
      {
        uint64_t v17 = 0;
      }
      else
      {
        CFIndex v16 = Count;
        uint64_t v17 = 0;
        for (CFIndex i = 0; i != v16; ++i)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)Value, i);
          if (CFGetInt64(ValueAtIndex, &v42) == 51 && v42 == 0) {
            uint64_t v17 = 1;
          }
        }
      }
      CFRelease(Value);
      CFStringRef Value = (const __CFString *)CFNumberCreateInt64(v17);
      if (!Value)
      {
LABEL_61:
        int v25 = -6728;
LABEL_58:
        int v42 = v25;
        if (v7) {
          goto LABEL_39;
        }
        goto LABEL_40;
      }
LABEL_38:
      int v42 = 0;
      if (!v7) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    if (!CFEqual(a2, @"rssiAggregate"))
    {
      if (!CFEqual(a2, @"powered"))
      {
        if (gLogCategory_WiFiManagerCore <= 60
          && (gLogCategory_WiFiManagerCore != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
        {
          LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"CFTypeRef WiFiManagerCopyProperty(CUWiFiManagerRef, CFStringRef, CFTypeRef, OSStatus *)", 0x3Cu, (uint64_t)"### Get of unknown property '%@'\n", v30, v31, v32, v33, (uint64_t)a2);
        }
LABEL_56:
        CFStringRef Value = 0;
        goto LABEL_57;
      }
      int Power = WiFiDeviceClientGetPower();
      int v35 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
      if (!Power) {
        int v35 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
      }
      CFStringRef Value = (const __CFString *)*v35;
      CFRetain(*v35);
      goto LABEL_38;
    }
    if (!*(unsigned char *)(v6 + 96) || !*(unsigned char *)(v6 + 103))
    {
      CFDictionaryRef v28 = (const __CFDictionary *)WiFiDeviceClientCopyProperty();
      if (v28)
      {
        CFDictionaryRef v11 = v28;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v28, @"RSSI_CTL_AGR");
        if (Value) {
          goto LABEL_10;
        }
        int v29 = -6735;
        goto LABEL_63;
      }
      goto LABEL_56;
    }
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    int v40 = 0;
    uint64_t v39 = 0;
    LOWORD(v37) = *(_WORD *)(v6 + 101);
    int v24 = *(_DWORD *)(v6 + 97);
    valuePtr[0] = 1;
    valuePtr[1] = v24;
    int v42 = WiFiManagerDoApple80211(v6, 1, 153, (uint64_t)valuePtr, 36, v21, v22, v23);
    if (!v42)
    {
      CFStringRef Value = (const __CFString *)CFNumberCreateInt64((int)v38);
      if (!Value)
      {
        int v25 = -6727;
        goto LABEL_58;
      }
      goto LABEL_38;
    }
  }
LABEL_14:
  CFStringRef Value = 0;
  if (v7) {
    goto LABEL_39;
  }
LABEL_40:
  if (a4) {
    *a4 = v42;
  }
  if (!Value) {
    return 0;
  }
  unint64_t v26 = CFGetInt64(Value, a4);
  CFRelease(Value);
  return v26;
}

uint64_t WiFiManagerSetProperty(uint64_t a1, CFTypeRef cf1, const __CFString *a3, const __CFString *a4)
{
  if (CFEqual(cf1, @"interfaceName"))
  {
    if (a4 && (CFTypeID v8 = CFGetTypeID(a4), v8 == CFStringGetTypeID()))
    {
      unsigned int v13 = 0;
      uint64_t v9 = (char *)(a1 + 97);
      if (!a3)
      {
        char v11 = 0;
        *(_WORD *)(a1 + 101) = 0;
        *(_DWORD *)uint64_t v9 = 0;
LABEL_11:
        *(unsigned char *)(a1 + 103) = v11;
        CFIndex v12 = *(const void **)(a1 + 88);
        CFRetain(a4);
        *(void *)(a1 + 88) = a4;
        if (v12) {
          CFRelease(v12);
        }
        return 0;
      }
      CFGetHardwareAddress(a3, v9, 6uLL, (int *)&v13);
      uint64_t result = v13;
      if (!v13)
      {
        char v11 = 1;
        goto LABEL_11;
      }
    }
    else
    {
      return 4294960540;
    }
  }
  else if (CFEqual(cf1, @"powered"))
  {
    CFGetInt64(a4, 0);
    uint64_t result = WiFiDeviceClientSetPower();
    if (!result) {
      return 0;
    }
  }
  else
  {
    return 4294960561;
  }
  return result;
}

uint64_t AWDLTrafficRegister(uint64_t a1, int a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v6 = WiFiManagerCreate(&cf);
  CFTypeRef v7 = cf;
  if (!v6)
  {
    WiFiManagerSetProperty((uint64_t)cf, @"interfaceName", 0, @"awdl0");
    memset(&v13[4], 0, 180);
    *(_DWORD *)unsigned int v13 = 1;
    if (a1)
    {
      *(_DWORD *)&v13[4] = *(_DWORD *)a1;
      *(_WORD *)&v13[8] = *(_WORD *)(a1 + 4);
    }
    *(_DWORD *)&v13[12] = 26;
    qmemcpy(&v13[16], "airplay-connectivity-check", 26);
    *(_DWORD *)&v13[168] = a2;
    if (a2) {
      *(_DWORD *)&v13[172] = 1;
    }
    if (a3) {
      *(_DWORD *)&v13[172] = 2;
    }
    uint64_t v6 = WiFiManagerDoApple80211((uint64_t)v7, 0, 164, (uint64_t)v13, 184, v8, v9, v10);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v6;
}

uint64_t WiFiJoinNetworkEx(const __CFDictionary *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1);
  uint64_t v8 = _Block_copy(v5);

  id v9 = v8;
  CFDictionarySetValue(MutableCopy, @"joinExCompletion", v9);
  CFRelease(v9);
  CFDictionarySetValue(MutableCopy, @"queue", v6);
  uint64_t v10 = WiFiJoinNetwork(MutableCopy, v6, 0, 0);

  CFRelease(MutableCopy);
  return v10;
}

uint64_t WiFiJoinNetwork(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  *(void *)uint64_t v21 = a4;
  *(void *)uuid_t bytes = a3;
  uint64_t v8 = logger_14347();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_18E2F5000, v8, OS_LOG_TYPE_DEFAULT, "WiFiJoinNetwork start", v20, 2u);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable)
  {
    uint64_t v18 = 4294960568;
    goto LABEL_28;
  }
  uint64_t v10 = Mutable;
  CFDictionarySetValue(Mutable, @"options", a1);
  if (!CFDictionaryGetValue((CFDictionaryRef)a1, @"platformNetwork"))
  {
    uint64_t v18 = 4294960591;
    goto LABEL_33;
  }
  if (CFDictionaryGetInt64((const __CFDictionary *)a1, @"directed", 0)) {
    WiFiNetworkSetDirectedState();
  }
  if (getkWiFiNetworkShareableEAPConfig[0]() && CFDictionaryGetValue((CFDictionaryRef)a1, @"eapConfig"))
  {
    getkWiFiNetworkShareableEAPConfig[0]();
    WiFiNetworkSetProperty();
  }
  if (CFDictionaryGetValue((CFDictionaryRef)a1, @"eapTrustExceptions"))
  {
    getkWiFiNetworkShareableEAPTrustExceptions[0]();
    WiFiNetworkSetProperty();
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (CFDictionaryGetTypedValue((const __CFDictionary *)a1, @"password", TypeID, 0)
    && !WiFiNetworkSetPassword())
  {
    goto LABEL_30;
  }
  CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"persistent");
  if (Value) {
    CFDictionarySetValue(v10, @"persistent", Value);
  }
  uint64_t v13 = WiFiManagerClientCreate();
  if (!v13)
  {
LABEL_30:
    uint64_t v18 = 4294960596;
LABEL_33:
    CFArrayRef v16 = v10;
    goto LABEL_27;
  }
  uint64_t v14 = (const void *)v13;
  CFRunLoopGetMain();
  WiFiManagerClientScheduleWithRunLoop();
  CFDictionarySetValue(v10, @"platformManager", v14);
  CFArrayRef v15 = (const __CFArray *)WiFiManagerClientCopyDevices();
  CFArrayRef v16 = v15;
  if (!v15 || CFArrayGetCount(v15) < 1)
  {
    uint64_t v18 = 4294960569;
    goto LABEL_24;
  }
  CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v16, 0);
  CFDictionarySetValue(v10, @"platformDevice", ValueAtIndex);
  if (v7) {
    CFDictionarySetValue(v10, @"queue", v7);
  }
  if (a3)
  {
    CFDictionarySetData(v10, @"callback", bytes, 8);
    CFDictionarySetData(v10, @"context", v21, 8);
  }
  uint64_t v18 = WiFiDeviceClientAssociateAsync();
  if (v18)
  {
LABEL_24:
    CFRelease(v10);
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(v14);
    if (!v16) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  CFRelease(v14);
LABEL_27:
  CFRelease(v16);
LABEL_28:

  return v18;
}

id logger_14347()
{
  if (sCUOSLogCreateOnce_logger_14418 != -1) {
    dispatch_once(&sCUOSLogCreateOnce_logger_14418, &__block_literal_global_14419);
  }
  uint64_t v0 = (void *)sCUOSLogHandle_logger_14420;
  return v0;
}

void _WiFiJoinNetworkCB(int a1, uint64_t a2, int a3, uint64_t a4, CFDictionaryRef theDict)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  CFDictionaryGetValue(theDict, @"platformManager");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(theDict, @"options", TypeID, 0);
  if (a2 && !a4 && CFDictionaryGetInt64(theDict, @"persistent", 0))
  {
    if (CFDictionaryGetInt64(TypedValue, @"directed", 0)) {
      WiFiNetworkSetDirectedState();
    }
    if (CFDictionaryGetInt64(TypedValue, @"homeNetwork", 0))
    {
      WiFiNetworkSetIntProperty();
      WiFiNetworkSetProperty();
    }
    if (CFDictionaryGetInt64(TypedValue, @"forceFix", 0)) {
      WiFiNetworkSetProperty();
    }
    WiFiManagerClientAddNetwork();
  }
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v10 = CFDictionaryGetValue(theDict, @"queue");
  char v11 = v10;
  if (TypedValue)
  {
    CFDictionaryGetValue(TypedValue, @"joinExCompletion");
    CFDictionaryRef TypedValue = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = v11 != 0;
    if (TypedValue && v11)
    {
      if (a2)
      {
        Property = (__CFDictionary *)WiFiNetworkGetProperty();
        if (!Property || (Mutable = Property, CFTypeID v15 = CFGetTypeID(Property), v15 != CFDictionaryGetTypeID()))
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          _WiFiDictionaryAddNetworkAdditionalInfo(Mutable);
          CFArrayRef v16 = Mutable;
LABEL_28:
          unint64_t v27 = logger_14347();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v35 = NSPrintF((uint64_t)"%##@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)Mutable);
            uint64_t v43 = NSPrintF((uint64_t)"%#m", v36, v37, v38, v39, v40, v41, v42, a4);
            *(_DWORD *)buf = 138412546;
            uint64_t v54 = v35;
            __int16 v55 = 2112;
            long long v56 = v43;
            _os_log_impl(&dword_18E2F5000, v27, OS_LOG_TYPE_DEFAULT, "WiFiJoinNetwork completed: info=%@, error=%@", buf, 0x16u);
          }
          if (Mutable) {
            CFRetain(Mutable);
          }
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = ___WiFiJoinNetworkCB_block_invoke;
          _OWORD v46[3] = &unk_1E55BFCC8;
          CFDictionaryRef TypedValue = TypedValue;
          CFDictionaryRef v47 = TypedValue;
          int v48 = Mutable;
          int v50 = a4;
          int32x4_t v49 = v16;
          dispatch_async(v11, v46);

          goto LABEL_33;
        }
      }
      else
      {
        CFMutableDictionaryRef Mutable = 0;
      }
      CFArrayRef v16 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    BOOL v12 = v10 != 0;
  }
  uint64_t v17 = logger_14347();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = NSPrintF((uint64_t)"%#m", v18, v19, v20, v21, v22, v23, v24, a4);
    *(_DWORD *)buf = 138412290;
    uint64_t v54 = v25;
    _os_log_impl(&dword_18E2F5000, v17, OS_LOG_TYPE_DEFAULT, "WiFiJoinNetwork completed: error=%@", buf, 0xCu);
  }
  uint64_t v52 = 0;
  CFDictionaryGetData(theDict, @"callback", (const char *)&v52, 8uLL, 0, 0);
  uint64_t v51 = 0;
  CFDictionaryGetData(theDict, @"context", (const char *)&v51, 8uLL, 0, 0);
  if (v52) {
    BOOL v26 = v12;
  }
  else {
    BOOL v26 = 0;
  }
  if (v26)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___WiFiJoinNetworkCB_block_invoke_182;
    block[3] = &__block_descriptor_52_e5_v8__0l;
    int v45 = a4;
    block[4] = v52;
    block[5] = v51;
    dispatch_async(v11, block);
  }
LABEL_33:
  CFRunLoopGetMain();
  WiFiManagerClientUnscheduleFromRunLoop();
  CFRelease(theDict);
}

void _WiFiDictionaryAddNetworkAdditionalInfo(__CFDictionary *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  Property = (const void *)WiFiNetworkGetProperty();
  if (Property) {
    CFDictionarySetValue(a1, @"cca", Property);
  }
  CFStringRef v3 = (const __CFString *)WiFiNetworkGetProperty();
  if (v3)
  {
    __int16 v8 = 0;
    int v7 = 0;
    CFGetHardwareAddress(v3, (char *)&v7, 6uLL, 0);
    __int16 v10 = 0;
    *(void *)__str = 0;
    snprintf(__str, 0xAuLL, "%02X:%02X:%02X", v7, BYTE1(v7), BYTE2(v7));
    CFDictionarySetCString(a1, @"oui", __str, -1);
  }
  uint64_t v4 = (const void *)WiFiNetworkGetProperty();
  if (v4) {
    CFDictionarySetValue(a1, @"channel", v4);
  }
  if (WiFiNetworkIsEAP() && WiFiNetworkIsSAE())
  {
    id v5 = "SAE-EAP";
  }
  else if (WiFiNetworkIsSAE())
  {
    id v5 = "SAE";
  }
  else if (WiFiNetworkIsEAP() && WiFiNetworkIsWPA())
  {
    id v5 = "WPA-EAP";
  }
  else if (WiFiNetworkIsWPA())
  {
    id v5 = "WPA";
  }
  else if (WiFiNetworkIsEAP())
  {
    id v5 = "EAP";
  }
  else if (WiFiNetworkIsWEP())
  {
    id v5 = "WEP";
  }
  else if (WiFiNetworkIsOpen())
  {
    id v5 = "Open";
  }
  else
  {
    id v5 = "Unknown";
  }
  CFDictionarySetCString(a1, @"securityStr", v5, -1);
  id v6 = (const void *)WiFiNetworkGetProperty();
  if (v6) {
    CFDictionarySetValue(a1, @"rssi", v6);
  }
}

uint64_t initValkWiFiNetworkShareableEAPTrustExceptions()
{
  if (MobileWiFiLibrary_sOnce != -1) {
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_170_14403);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)MobileWiFiLibrary_sLib, "kWiFiNetworkShareableEAPTrustExceptions");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkWiFiNetworkShareableEAPTrustExceptions = result;
  }
  else
  {
    uint64_t result = constantValkWiFiNetworkShareableEAPTrustExceptions;
  }
  getkWiFiNetworkShareableEAPTrustExceptions[0] = kWiFiNetworkShareableEAPTrustExceptionsFunction;
  return result;
}

uint64_t kWiFiNetworkShareableEAPTrustExceptionsFunction()
{
  return constantValkWiFiNetworkShareableEAPTrustExceptions;
}

void *__MobileWiFiLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/MobileWiFi.framework/MobileWiFi", 2);
  MobileWiFiLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t initValkWiFiNetworkShareableEAPConfig()
{
  if (MobileWiFiLibrary_sOnce != -1) {
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_170_14403);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)MobileWiFiLibrary_sLib, "kWiFiNetworkShareableEAPConfig");
  if (v0)
  {
    uint64_t result = *v0;
    constantValkWiFiNetworkShareableEAPConfig = result;
  }
  else
  {
    uint64_t result = constantValkWiFiNetworkShareableEAPConfig;
  }
  getkWiFiNetworkShareableEAPConfig[0] = kWiFiNetworkShareableEAPConfigFunction;
  return result;
}

uint64_t kWiFiNetworkShareableEAPConfigFunction()
{
  return constantValkWiFiNetworkShareableEAPConfig;
}

uint64_t __logger_block_invoke_14423()
{
  os_log_t v0 = os_log_create("com.apple.CoreUtils", "WiFiUtils");
  uint64_t v1 = sCUOSLogHandle_logger_14420;
  sCUOSLogHandle_logger_14420 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t WiFiJoinNetwork_b(const void *a1, void *a2, const void *a3)
{
  id v5 = a2;
  id v6 = _Block_copy(a3);

  uint64_t v7 = WiFiJoinNetwork(a1, v5, (uint64_t)_WiFiJoinNetwork_bCallBack, (uint64_t)v6);
  if (v7) {

  }
  return v7;
}

void _WiFiJoinNetwork_bCallBack(uint64_t a1, void (**a2)(void, void))
{
  a2[2](a2, a1);
}

__CFDictionary *WiFiCopyCurrentNetworkInfo(int *a1)
{
  return WiFiCopyCurrentNetworkInfoEx(0, a1);
}

__CFDictionary *WiFiCopyCurrentNetworkInfoEx(char a1, int *a2)
{
  uint64_t v4 = WiFiManagerClientCreate();
  if (!v4)
  {
    CFMutableDictionaryRef Mutable = 0;
    int v11 = -6700;
    if (!a2) {
      return Mutable;
    }
    goto LABEL_10;
  }
  id v5 = (const void *)v4;
  CFArrayRef v6 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v6)
  {
    CFArrayRef v7 = v6;
    if (CFArrayGetCount(v6) < 1)
    {
      CFMutableDictionaryRef Mutable = 0;
      int v11 = -6727;
    }
    else
    {
      CFArrayGetValueAtIndex(v7, 0);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (Mutable)
      {
        id v9 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
        if (v9)
        {
          __int16 v10 = v9;
          _WiFiDictionaryAddNetworkInfo(Mutable, a1, v9);
          CFRelease(v10);
        }
        int v11 = 0;
      }
      else
      {
        int v11 = -6728;
      }
    }
    CFRelease(v5);
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    int v11 = -6727;
    CFArrayRef v7 = (const __CFArray *)v5;
  }
  CFRelease(v7);
  if (a2) {
LABEL_10:
  }
    *a2 = v11;
  return Mutable;
}

void _WiFiDictionaryAddNetworkInfo(__CFDictionary *a1, char a2, const void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  Channel = (const void *)WiFiNetworkGetChannel();
  if (Channel) {
    CFDictionarySetValue(a1, @"channel", Channel);
  }
  int DirectedState = WiFiNetworkGetDirectedState();
  __int16 v8 = (const void **)MEMORY[0x1E4F1CFD0];
  if (DirectedState) {
    CFDictionarySetValue(a1, @"directed", (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  int IsCaptive = WiFiNetworkIsCaptive();
  if (IsCaptive) {
    CFDictionarySetValue(a1, @"captive", *v8);
  }
  int v10 = WiFiNetworkWasCaptive();
  if (v10) {
    CFDictionarySetValue(a1, @"wasCaptive", *v8);
  }
  CFStringRef Property = (const __CFString *)WiFiNetworkGetProperty();
  if (Property && CFGetInt64(Property, 0) == 1) {
    CFDictionarySetValue(a1, @"homeNetwork", *v8);
  }
  int IsEAP = WiFiNetworkIsEAP();
  if (IsEAP) {
    CFDictionarySetValue(a1, @"enterprise", *v8);
  }
  if (WiFiNetworkIsHidden()) {
    CFDictionarySetValue(a1, @"hidden", *v8);
  }
  if (WiFiNetworkIsProfileBased()) {
    CFDictionarySetValue(a1, @"profileBased", *v8);
  }
  int IsOpen = WiFiNetworkIsOpen();
  if (IsOpen) {
    CFDictionarySetValue(a1, @"open", *v8);
  }
  if (IsCaptive || v10 && IsOpen) {
    CFDictionarySetValue(a1, @"likelyCaptive", *v8);
  }
  SSID = (const void *)WiFiNetworkGetSSID();
  if (SSID) {
    CFDictionarySetValue(a1, @"ssid", SSID);
  }
  SSIDCFDataRef Data = (const __CFString *)WiFiNetworkGetSSIDData();
  if (SSIDData) {
    CFDictionarySetValue(a1, @"ssidData", SSIDData);
  }
  unsigned int ShareMode = WiFiNetworkGetShareMode();
  CFDictionarySetInt64(a1, @"shareMode", ShareMode);
  if ((const void *)WiFiNetworkGetProperty() == *v8) {
    uint64_t v17 = *v8;
  }
  else {
    uint64_t v17 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFDictionarySetValue(a1, @"standalone6G", v17);
  if (MobileWiFiLibrary_sOnce != -1) {
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_170_14403);
  }
  if (MobileWiFiLibrary_sLib && dlsym((void *)MobileWiFiLibrary_sLib, "WiFiNetworkGetShareableStatus"))
  {
    int ShareableStatus = softLinkWiFiNetworkGetShareableStatus((uint64_t)a3);
    CFDictionarySetInt64(a1, @"shareableStatus", ShareableStatus);
  }
  if ((a2 & 3) != 0)
  {
    CFStringRef v19 = (const __CFString *)WiFiNetworkCopyPassword();
    if (v19)
    {
      CFStringRef v20 = v19;
      CFDictionarySetValue(a1, @"password", v19);
      if ((a2 & 2) != 0 && !WPAHashPSK(SSIDData, v20, bytes, v25))
      {
        CFDictionarySetData(a1, @"psk", bytes, 32);
        CFDictionarySetCString(a1, @"pskStr", v25, -1);
      }
      CFRelease(v20);
    }
  }
  if ((a2 & 4) != 0)
  {
    uint64_t v21 = (const void *)WiFiNetworkCopyRecord();
    if (v21)
    {
      uint64_t v22 = v21;
      CFDictionarySetValue(a1, @"rawRecord", v21);
      CFRelease(v22);
    }
  }
  CFDictionarySetValue(a1, @"platformNetwork", a3);
  if (IsEAP)
  {
    if (getkWiFiNetworkShareableEAPConfig[0]())
    {
      getkWiFiNetworkShareableEAPConfig[0]();
      uint64_t v23 = (const void *)WiFiNetworkGetProperty();
      if (v23) {
        CFDictionarySetValue(a1, @"eapConfig", v23);
      }
    }
    if (getkWiFiNetworkShareableEAPTrustExceptions[0]())
    {
      getkWiFiNetworkShareableEAPTrustExceptions[0]();
      uint64_t v24 = (const void *)WiFiNetworkGetProperty();
      if (v24) {
        CFDictionarySetValue(a1, @"eapTrustExceptions", v24);
      }
    }
  }
  _WiFiDictionaryAddNetworkAdditionalInfo(a1);
}

uint64_t WPAHashPSK(const __CFString *a1, CFStringRef theString, _OWORD *a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  buffer[0] = 0;
  if (!CFStringGetCString(theString, buffer, 128, 0x8000100u)) {
    return 4294960579;
  }
  size_t v7 = strlen(buffer);
  size_t v18 = v7;
  if (v7 - 8 > 0x37)
  {
    uint64_t result = HexToData(buffer, v7, 30, (uint64_t)v20, 0x20uLL, 0, &v18, 0);
    if (result) {
      return result;
    }
    if (v18 != 32) {
      return 4294960553;
    }
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  CFTypeID v8 = CFGetTypeID(a1);
  if (v8 == CFDataGetTypeID())
  {
    int BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    size_t v11 = v7;
    BOOL v12 = (char *)BytePtr;
  }
  else
  {
    if (v8 != CFStringGetTypeID()) {
      return 4294960540;
    }
    v23.CFIndex length = CFStringGetLength(a1);
    CFIndex usedBufLen = 0;
    v23.location = 0;
    CFStringGetBytes(a1, v23, 0x8000100u, 0, 0, v19, 64, &usedBufLen);
    CFIndex Length = usedBufLen;
    BOOL v12 = (char *)v19;
    size_t v11 = v7;
  }
  PBKDF2_HMAC_SHA1(buffer, v11, v12, Length, (uint64_t)v20);
  if (a3)
  {
LABEL_8:
    long long v14 = v20[1];
    *a3 = v20[0];
    a3[1] = v14;
  }
LABEL_9:
  if (!a4) {
    return 0;
  }
  for (uint64_t i = 0; i != 32; ++i)
  {
    unint64_t v16 = *((unsigned __int8 *)v20 + i);
    *a4 = a0123456789abcd_0[v16 >> 4];
    a4[1] = a0123456789abcd_0[v16 & 0xF];
    a4 += 2;
  }
  uint64_t result = 0;
  *a4 = 0;
  return result;
}

uint64_t initWiFiNetworkGetShareableStatus(uint64_t a1)
{
  if (MobileWiFiLibrary_sOnce != -1) {
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_170_14403);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)MobileWiFiLibrary_sLib, "WiFiNetworkGetShareableStatus");
  softLinkWiFiNetworkGetint ShareableStatus = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

__CFDictionary *WiFiCopyNetworkInfo(const __CFDictionary *a1, char a2, int *a3)
{
  uint64_t v6 = WiFiManagerClientCreate();
  if (v6)
  {
    size_t v11 = (const void *)v6;
    CFArrayRef v12 = (const __CFArray *)WiFiManagerClientCopyNetworks();
    if (v12)
    {
      CFArrayRef v13 = v12;
      CFIndex Count = CFArrayGetCount(v12);
      if (Count < 1) {
        goto LABEL_9;
      }
      CFIndex v15 = Count;
      CFIndex v16 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v13, v16);
        CFTypeID TypeID = CFStringGetTypeID();
        CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(a1, @"ssid", TypeID, 0);
        if (!TypedValue) {
          break;
        }
        CFDictionaryRef v20 = TypedValue;
        SSID = (const void *)WiFiNetworkGetSSID();
        if (SSID)
        {
          if (CFEqual(SSID, v20)) {
            break;
          }
        }
        if (v15 == ++v16) {
          goto LABEL_9;
        }
      }
      if (ValueAtIndex)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v22 = Mutable;
        if (Mutable)
        {
          _WiFiDictionaryAddNetworkInfo(Mutable, a2, ValueAtIndex);
          int v23 = 0;
        }
        else
        {
          int v23 = -6728;
        }
      }
      else
      {
LABEL_9:
        uint64_t v22 = 0;
        int v23 = -6727;
      }
      CFRelease(v13);
    }
    else
    {
      uint64_t v22 = 0;
      int v23 = -6727;
    }
    CFRelease(v11);
    if (a3) {
      goto LABEL_16;
    }
  }
  else
  {
    if (gLogCategory_WiFiManagerCore <= 60
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"CFDictionaryRef WiFiCopyNetworkInfo(CFDictionaryRef, WiFiNetworkInfoFlags, OSStatus *)", 0x3Cu, (uint64_t)"### WiFiManagerClientCreate failed\n", v7, v8, v9, v10, v26);
    }
    uint64_t v22 = 0;
    int v23 = -6700;
    if (a3) {
LABEL_16:
    }
      *a3 = v23;
  }
  return v22;
}

uint64_t WiFiRestoreNetwork(const __CFDictionary *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t Value = (uint64_t)CFDictionaryGetValue(a1, @"platformNetwork");
  if (Value)
  {
    uint64_t v8 = WiFiManagerClientCreate();
    if (!v8)
    {
      id v16 = 0;
      CFArrayRef v13 = 0;
      uint64_t Value = 4294960596;
      goto LABEL_13;
    }
    uint64_t v9 = (const void *)v8;
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    CFArrayRef v10 = (const __CFArray *)WiFiManagerClientCopyDevices();
    CFArrayRef v11 = v10;
    if (v10 && CFArrayGetCount(v10) >= 1)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v11, 0);
      CFArrayRef v13 = (void *)[v6 copy];
      if (v6)
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        CFIndex v15 = _Block_copy(v13);
        [v14 setObject:v15 forKeyedSubscript:@"block"];

        [v14 setObject:ValueAtIndex forKeyedSubscript:@"platformDevice"];
        [v14 setObject:v9 forKeyedSubscript:@"platformManager"];
        [v14 setObject:v5 forKeyedSubscript:@"queue"];
        id v16 = v14;
        uint64_t Value = WiFiDeviceClientAssociateAsync();
        if (!Value)
        {
          CFRelease(v9);

          id v16 = 0;
LABEL_12:
          CFRelease(v11);
          goto LABEL_13;
        }
        CFRelease(v16);
      }
      else
      {
        id v16 = 0;
        uint64_t Value = 4294960568;
      }
    }
    else
    {
      id v16 = 0;
      CFArrayRef v13 = 0;
      uint64_t Value = 4294960569;
    }
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(v9);
    if (!v11) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __WiFiRestoreNetwork_block_invoke;
  block[3] = &unk_1E55BFC80;
  id v19 = v6;
  dispatch_async(v5, block);

  id v16 = 0;
  CFArrayRef v13 = 0;
LABEL_13:

  return Value;
}

uint64_t __WiFiRestoreNetwork_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void _WiFiRestoreNetworkCB(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v7 = [a5 objectForKeyedSubscript:@"platformManager"];
  uint64_t v8 = [a5 objectForKeyedSubscript:@"block"];
  uint64_t v9 = [a5 objectForKeyedSubscript:@"queue"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = ___WiFiRestoreNetworkCB_block_invoke;
  v11[3] = &unk_1E55BFD10;
  id v12 = v8;
  int v13 = a4;
  id v10 = v8;
  dispatch_async(v9, v11);
  CFRunLoopGetMain();
  WiFiManagerClientUnscheduleFromRunLoop();
  CFRelease(v7);
}

uint64_t WiFiScan(const __CFDictionary *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  *(void *)uint64_t v80 = a4;
  *(void *)uuid_t bytes = a3;
  unsigned int v79 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int v13 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
  if (Mutable)
  {
    id v14 = Mutable;
    uint64_t v15 = mach_absolute_time();
    CFDictionarySetInt64(v14, @"startTime", v15);
    uint64_t v16 = WiFiManagerClientCreate();
    if (!v16)
    {
      unsigned int v79 = -6700;
      goto LABEL_59;
    }
    uint64_t v17 = (const void *)v16;
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    CFDictionarySetValue(v14, @"platformManager", v17);
    CFArrayRef v18 = (const __CFArray *)WiFiManagerClientCopyDevices();
    CFArrayRef v19 = v18;
    if (v18 && CFArrayGetCount(v18) > 0)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v19, 0);
      CFDictionarySetValue(v14, @"platformDevice", ValueAtIndex);
      CFRelease(v19);
      CFDictionarySetData(v14, @"callback", bytes, 8);
      CFDictionarySetData(v14, @"context", v80, 8);
      CFDictionarySetValue(v14, @"queue", v7);
      CFDictionaryRef v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFArrayRef v19 = v20;
      if (!v20)
      {
        CFIndex v68 = 0;
        theDict = 0;
LABEL_82:
        unsigned int v69 = -6728;
        goto LABEL_83;
      }
      uint64_t v21 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFDictionarySetValue(v20, @"SCAN_MERGE", (const void *)*MEMORY[0x1E4F1CFD0]);
      uint64_t Value = CFDictionaryGetValue(a1, @"scanDwellTime");
      if (Value) {
        CFDictionarySetValue(v19, @"SCAN_DWELL_TIME", Value);
      }
      CFTypeID TypeID = CFStringGetTypeID();
      CFDictionaryRef TypedValue = CFDictionaryGetTypedValue(a1, @"ssid", TypeID, 0);
      if (TypedValue)
      {
        CFDictionaryRef v25 = TypedValue;
        CFDictionarySetValue(v19, @"HIDDEN_NETWORK", v21);
        CFDictionarySetValue(v19, @"SCAN_DIRECTED", v21);
        CFDictionarySetValue(v19, @"SSID_STR", v25);
      }
      int Int64Ranged = CFDictionaryGetInt64Ranged(a1, @"channel", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      unint64_t Int64 = CFDictionaryGetInt64(a1, @"channel_2pt4GHz", (int *)&v79);
      if (v79) {
        BOOL v28 = 0;
      }
      else {
        BOOL v28 = Int64 == 0;
      }
      CFDictionaryRef v29 = a1;
      int v30 = !v28;
      CFDictionaryRef v77 = v29;
      unint64_t v31 = CFDictionaryGetInt64(v29, @"channel_5GHz", (int *)&v79);
      if (v79) {
        BOOL v32 = 0;
      }
      else {
        BOOL v32 = v31 == 0;
      }
      uint64_t v33 = !v32;
      if (v30 & 1) != 0 || (v33)
      {
        if (Int64Ranged < 1) {
          int v34 = v30;
        }
        else {
          int v34 = 0;
        }
        if (v34 & v33) {
          goto LABEL_48;
        }
        CFMutableArrayRef v35 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        theDict = v19;
        if (v35)
        {
          CFIndex theArray = v35;
          char valuePtr = 27;
          CFNumberRef v36 = CFNumberCreate(0, kCFNumberSInt8Type, &valuePtr);
          if (v36)
          {
            CFNumberRef v37 = v36;
            CFArrayRef v19 = (const __CFArray *)WiFiDeviceClientCopyProperty();
            CFRelease(v37);
            if (v19)
            {
              CFTypeID v72 = v17;
              CFDictionaryRef v73 = v14;
              id v74 = v7;
              CFIndex Count = CFArrayGetCount(v19);
              if (Count >= 1)
              {
                CFIndex v39 = Count;
                CFIndex v40 = 0;
                uint64_t v41 = @"SUP_CHANNEL";
                uint64_t v42 = @"SUP_CHANNEL_FLAGS";
                int v71 = v30;
                while (1)
                {
                  CFTypeID v43 = CFDictionaryGetTypeID();
                  CFDictionaryRef TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v19, v40, v43, (int *)&v79);
                  if (v79) {
                    break;
                  }
                  CFDictionaryRef v45 = TypedValueAtIndex;
                  int v46 = CFDictionaryGetInt64Ranged(TypedValueAtIndex, v41, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
                  int v47 = v46;
                  if (Int64Ranged < 1 || v46 == Int64Ranged)
                  {
                    unsigned int v48 = CFDictionaryGetInt64(v45, v42, 0);
                    unsigned int v49 = v48;
                    int v50 = (v48 & 8) != 0 ? v30 : 1;
                    if (v50 == 1)
                    {
                      int v51 = (v48 & 0x10) != 0 ? v33 : 1;
                      if (v51 == 1)
                      {
                        uint64_t v52 = v41;
                        uint64_t v53 = v33;
                        uint64_t v54 = v42;
                        __int16 v55 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                        if (!v55)
                        {
                          unsigned int v79 = -6728;
                          break;
                        }
                        long long v56 = v55;
                        CFDictionarySetInt64(v55, @"CHANNEL", v47);
                        CFDictionarySetInt64(v56, @"CHANNEL_FLAGS", v49);
                        CFArrayAppendValue(theArray, v56);
                        CFRelease(v56);
                        uint64_t v42 = v54;
                        uint64_t v33 = v53;
                        uint64_t v41 = v52;
                        int v30 = v71;
                      }
                    }
                  }
                  if (v39 == ++v40) {
                    goto LABEL_47;
                  }
                }
                id v14 = v73;
                id v7 = v74;
                int v13 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
                uint64_t v17 = v72;
                goto LABEL_73;
              }
LABEL_47:
              CFRelease(v19);
              CFArrayRef v19 = theDict;
              CFDictionarySetValue(theDict, @"SCAN_CHANNELS", theArray);
              CFRelease(theArray);
              id v14 = v73;
              id v7 = v74;
              int v13 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
              uint64_t v17 = v72;
LABEL_48:
              int v57 = CFDictionaryGetInt64Ranged(v77, @"scanRSSIThreshold", 0xFFFFFFFF80000000, 0x7FFFFFFFLL, (int *)&v79);
              if (v79) {
                int v62 = -80;
              }
              else {
                int v62 = v57;
              }
              if (v62 < 0) {
                CFDictionarySetInt64(v19, @"SCAN_RSSI_THRESHOLD", v62);
              }
              int v63 = v13[576];
              if (v63 <= 30 && (v63 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu))) {
                LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiScan(CFDictionaryRef, __strong dispatch_queue_t, WiFiScanCompletion_f, void *)", 0x1Eu, (uint64_t)"WiFi scan starting\n", v58, v59, v60, v61, v70);
              }
              unsigned int v79 = WiFiDeviceClientScanAsync();
              if (!v79)
              {
                CFRelease(v17);
                id v14 = v19;
                goto LABEL_59;
              }
              theDict = v19;
              CFIndex v68 = 0;
              CFArrayRef v19 = 0;
              goto LABEL_74;
            }
          }
          else
          {
            CFArrayRef v19 = 0;
          }
          unsigned int v79 = -6700;
LABEL_73:
          CFIndex v68 = theArray;
LABEL_74:
          CFRunLoopGetMain();
          WiFiManagerClientUnscheduleFromRunLoop();
          if (v68) {
            CFRelease(v68);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (theDict) {
            CFRelease(theDict);
          }
          CFRelease(v17);
LABEL_59:
          CFRelease(v14);
          uint64_t v64 = v79;
          if (!v79) {
            goto LABEL_64;
          }
          goto LABEL_60;
        }
        CFIndex v68 = 0;
        CFArrayRef v19 = 0;
        goto LABEL_82;
      }
      theDict = v19;
      CFIndex v68 = 0;
      CFArrayRef v19 = 0;
      unsigned int v69 = -6705;
    }
    else
    {
      CFIndex v68 = 0;
      theDict = 0;
      unsigned int v69 = -6727;
    }
LABEL_83:
    unsigned int v79 = v69;
    goto LABEL_74;
  }
  uint64_t v64 = 4294960568;
  unsigned int v79 = -6728;
LABEL_60:
  int v65 = v13[576];
  if (v65 <= 60)
  {
    if (v65 != -1 || (BOOL v66 = _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu), v64 = v79, v66))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiScan(CFDictionaryRef, __strong dispatch_queue_t, WiFiScanCompletion_f, void *)", 0x3Cu, (uint64_t)"### WiFi scan failed: %#m\n", v9, v10, v11, v12, v64);
      uint64_t v64 = v79;
    }
  }
LABEL_64:

  return v64;
}

void _WiFiScanCallback(int a1, const __CFArray *a2, int a3, CFDictionaryRef theDict)
{
  CFDictionaryGetValue(theDict, @"platformManager");
  mach_absolute_time();
  CFDictionaryGetInt64(theDict, @"startTime", 0);
  if (sUpTicksToSecondsOnce != -1) {
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  }
  if (gLogCategory_WiFiManagerCore <= 30
    && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
  {
    if (a2) {
      CFIndex Count = CFArrayGetCount(a2);
    }
    else {
      CFIndex Count = 0;
    }
    LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"void _WiFiScanCallback(WiFiDeviceClientRef, CFArrayRef, WiFiError, void *)", 0x1Eu, (uint64_t)"WiFi scan completed: %ld results, %.3f seconds, %#m\n", v7, v8, v9, v10, Count);
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  CFDictionaryGetData(theDict, @"callback", (const char *)&v16, 8uLL, 0, 0);
  CFDictionaryGetData(theDict, @"context", (const char *)&v15, 8uLL, 0, 0);
  uint64_t v12 = CFDictionaryGetValue(theDict, @"queue");
  if (a2) {
    CFRetain(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___WiFiScanCallback_block_invoke;
  block[3] = &__block_descriptor_60_e5_v8__0l;
  int v14 = a3;
  void block[4] = a2;
  block[5] = v16;
  void block[6] = v15;
  dispatch_async(v12, block);
  CFRunLoopGetMain();
  WiFiManagerClientUnscheduleFromRunLoop();
  CFRelease(theDict);
}

uint64_t WiFiScan_b(const __CFDictionary *a1, void *a2, const void *a3)
{
  id v5 = a2;
  id v6 = _Block_copy(a3);

  uint64_t v7 = WiFiScan(a1, v5, (uint64_t)_WiFiScan_bCallBack, (uint64_t)v6);
  if (v7) {

  }
  return v7;
}

void _WiFiScan_bCallBack(uint64_t a1, uint64_t a2, void (**a3)(void, void, void))
{
  a3[2](a3, a1, a2);
}

uint64_t WiFiSWAPStart(__CFDictionary **a1, const __CFDictionary *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a3;
  uint64_t v27 = a5;
  *(void *)uuid_t bytes = a4;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable)
  {
    uint64_t started = 4294960568;
    goto LABEL_21;
  }
  uint64_t v11 = Mutable;
  uint64_t v12 = (const void *)WiFiManagerClientCreate();
  if (!v12)
  {
    uint64_t started = 4294960596;
    goto LABEL_20;
  }
  int v13 = v12;
  CFDictionarySetValue(v11, @"platformManager", v12);
  CFRunLoopGetMain();
  WiFiManagerClientScheduleWithRunLoop();
  CFArrayRef v14 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (!v14)
  {
    CFRelease(v13);
    uint64_t started = 4294960569;
    goto LABEL_20;
  }
  CFArrayRef v15 = v14;
  if (CFArrayGetCount(v14) < 1)
  {
    uint64_t started = 4294960569;
  }
  else
  {
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v15, 0);
    CFDictionarySetValue(v11, @"platformDevice", ValueAtIndex);
    if (a4) {
      CFDictionarySetData(v11, @"startedCallback", bytes, 8);
    }
    if (a5) {
      CFDictionarySetData(v11, @"startedContext", (UInt8 *)&v27, 8);
    }
    if (v9) {
      CFDictionarySetValue(v11, @"startedQueue", v9);
    }
    unsigned int v32 = 0;
    uint64_t v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v17)
    {
      CFArrayRef v18 = v17;
      int v30 = 0;
      unint64_t v31 = 0;
      CFIndex length = 0;
      CFDictionarySetInt64(v17, @"AP_MODE_AUTH_LOWER", 1);
      CFDictionarySetInt64(v18, @"AP_MODE_AUTH_UPPER", 0);
      CFDictionarySetInt64(v18, @"AP_MODE_CYPHER_TYPE", 0);
      int64_t Int64 = CFDictionaryGetInt64(a2, @"channel_2pt4GHz", (int *)&v32);
      if (v32 && (int64_t Int64 = CFDictionaryGetInt64(a2, @"channel_5GHz", (int *)&v32), v32))
      {
        uint64_t v20 = 6;
      }
      else
      {
        uint64_t v20 = Int64;
        if (Int64 <= 0)
        {
          unsigned int v32 = -6705;
LABEL_18:
          CFRelease(v18);
          uint64_t started = v32;
          goto LABEL_19;
        }
      }
      CFDictionarySetInt64(v18, @"CHANNEL", v20);
      CFTypeID TypeID = CFStringGetTypeID();
      CFStringRef TypedValue = (const __CFString *)CFDictionaryGetTypedValue(a2, @"ssid", TypeID, (int *)&v32);
      if (v32) {
        goto LABEL_18;
      }
      unsigned int v32 = CFStringGetOrCopyCStringUTF8(TypedValue, (const char **)&v31, (UInt8 **)&v30, (size_t *)&length);
      if (v32) {
        goto LABEL_18;
      }
      CFDictionarySetData(v18, @"AP_MODE_SSID_BYTES", v31, length);
      if (v30) {
        free(v30);
      }
      CFTypeID v25 = CFDataGetTypeID();
      CFDictionaryRef v26 = CFDictionaryGetTypedValue(a2, @"ie", v25, 0);
      if (v26) {
        CFDictionarySetValue(v18, @"AP_MODE_IE_LIST", v26);
      }
      CFRetain(v11);
      uint64_t started = WiFiDeviceClientStartNetwork();
      CFRelease(v18);
      if (started)
      {
        CFRelease(v11);
      }
      else
      {
        *a1 = v11;
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t started = 4294960568;
    }
  }
LABEL_19:
  CFRelease(v13);
  CFRelease(v15);
  if (v11) {
LABEL_20:
  }
    CFRelease(v11);
LABEL_21:

  return started;
}

void _WiFiSWAPStartCallBack(int a1, int a2, void *value, int a4, CFMutableDictionaryRef theDict)
{
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  if (value) {
    CFDictionarySetValue(theDict, @"platformNetwork", value);
  }
  CFDictionarySetInt64(theDict, @"startedStatus", a2);
  uint64_t v8 = CFDictionaryGetValue(theDict, @"startedQueue");
  CFDictionaryGetData(theDict, @"startedCallback", (const char *)&v14, 8uLL, 0, 0);
  CFDictionaryGetData(theDict, @"startedContext", (const char *)&v13, 8uLL, 0, 0);
  if (v8 && v14)
  {
    CFRetain(theDict);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = ___WiFiSWAPStartCallBack_block_invoke;
    v11[3] = &__block_descriptor_60_e5_v8__0l;
    void v11[4] = v14;
    v11[5] = theDict;
    int v12 = a2;
    v11[6] = v13;
    dispatch_async(v8, v11);
  }
  if (CFDictionaryGetInt64(theDict, @"stopPending", 0))
  {
    int v9 = CFRetain(theDict);
    if (value)
    {
      if (WiFiDeviceClientStopNetwork()) {
        CFRelease(theDict);
      }
    }
    else
    {
      _WiFiSWAPStopCallBack(v9, 0, v10, theDict);
    }
  }
  CFRelease(theDict);
}

void _WiFiSWAPStopCallBack(int a1, int a2, int a3, CFDictionaryRef theDict)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  id v6 = CFDictionaryGetValue(theDict, @"stoppedQueue");
  CFDictionaryGetData(theDict, @"stoppedCallback", (const char *)&v10, 8uLL, 0, 0);
  CFDictionaryGetData(theDict, @"stoppedContext", (const char *)&v9, 8uLL, 0, 0);
  if (v6 && v10)
  {
    CFRetain(theDict);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___WiFiSWAPStopCallBack_block_invoke;
    v7[3] = &__block_descriptor_60_e5_v8__0l;
    v7[4] = v10;
    v7[5] = theDict;
    int v8 = a2;
    v7[6] = v9;
    dispatch_async(v6, v7);
  }
  if (CFDictionaryGetValue(theDict, @"platformManager"))
  {
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
  }
  CFRelease(theDict);
}

uint64_t WiFiSWAPStop(__CFDictionary *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v12 = a4;
  *(void *)uuid_t bytes = a3;
  if (CFDictionaryGetValue(a1, @"platformDevice"))
  {
    if (a3) {
      CFDictionarySetData(a1, @"stoppedCallback", bytes, 8);
    }
    if (a4) {
      CFDictionarySetData(a1, @"stoppedContext", (UInt8 *)&v12, 8);
    }
    if (v7) {
      CFDictionarySetValue(a1, @"stoppedQueue", v7);
    }
    if (CFDictionaryGetValue(a1, @"platformNetwork"))
    {
      CFRetain(a1);
      uint64_t v8 = WiFiDeviceClientStopNetwork();
      if (v8) {
        CFRelease(a1);
      }
    }
    else
    {
      if (CFDictionaryGetInt64(a1, @"startedStatus", 0))
      {
        int v9 = CFRetain(a1);
        _WiFiSWAPStopCallBack(v9, 0, v10, a1);
      }
      else
      {
        CFDictionarySetValue(a1, @"stopPending", (const void *)*MEMORY[0x1E4F1CFD0]);
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 4294960576;
  }
  CFRelease(a1);

  return v8;
}

BOOL xpc_connection_has_entitlement()
{
  uint64_t v0 = xpc_connection_copy_entitlement_value();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = (void *)v0;
  BOOL v2 = MEMORY[0x192FAB6C0]() == MEMORY[0x1E4F14570] && xpc_BOOL_get_value(v1);
  xpc_release(v1);
  return v2;
}

void xpc_connection_set_event_handler_f(_xpc_connection_s *a1, uint64_t a2, uint64_t a3)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  void v3[2] = __xpc_connection_set_event_handler_f_block_invoke;
  v3[3] = &__block_descriptor_tmp_14563;
  v3[4] = a2;
  v3[5] = a3;
  xpc_connection_set_event_handler(a1, v3);
}

uint64_t __xpc_connection_set_event_handler_f_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 32))(a2, *(void *)(a1 + 40));
}

void xpc_connection_send_message_with_reply_f(_xpc_connection_s *a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  void v5[2] = __xpc_connection_send_message_with_reply_f_block_invoke;
  v5[3] = &__block_descriptor_tmp_1;
  v5[4] = a4;
  v5[5] = a5;
  xpc_connection_send_message_with_reply(a1, a2, a3, v5);
}

uint64_t __xpc_connection_send_message_with_reply_f_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 32))(a2, *(void *)(a1 + 40));
}

uint64_t xpc_dictionary_copy_cf_object(void *a1, const char *a2, int *a3)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    int v5 = -6727;
    if (!a3) {
      return result;
    }
    goto LABEL_6;
  }
  uint64_t result = _CFXPCCreateCFObjectFromXPCObject();
  if (result) {
    int v5 = 0;
  }
  else {
    int v5 = -6756;
  }
  if (a3) {
LABEL_6:
  }
    *a3 = v5;
  return result;
}

uint64_t xpc_dictionary_set_cf_object(void *a1, const char *a2)
{
  uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!v4) {
    return 4294960540;
  }
  int v5 = v4;
  xpc_dictionary_set_value(a1, a2, v4);
  xpc_release(v5);
  return 0;
}

uint64_t xpc_send_message_sync(const char *a1, uint64_t a2, int a3, void *a4, void *a5)
{
  uint64_t v28 = 0;
  CFDictionaryRef v29 = 0;
  uint64_t v25 = 0;
  CFDictionaryRef v26 = &v25;
  uint64_t v27 = 0x2000000000;
  asprintf(&v29, "xpc_send_message_sync:%s", a1);
  if (v29 && (int v10 = dispatch_queue_create(v29, 0), free(v29), v10))
  {
    mach_service = xpc_connection_create_mach_service(a1, v10, a2);
    if (!mach_service)
    {
      uint64_t v19 = 4294960596;
      uint64_t v14 = v10;
LABEL_12:
      dispatch_release(v14);
      goto LABEL_13;
    }
    uint64_t v12 = mach_service;
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_14566);
    if (a3) {
      xpc_connection_set_target_uid();
    }
    xpc_connection_resume(v12);
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v14 = v13;
    if (v13)
    {
      if (a5)
      {
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 0x40000000;
        handler[2] = __xpc_send_message_sync_block_invoke_2;
        handler[3] = &unk_1E55BFDB8;
        handler[4] = &v25;
        handler[5] = v13;
        xpc_connection_send_message_with_reply(v12, a4, v10, handler);
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        if (MEMORY[0x192FAB6C0](v26[3]) == MEMORY[0x1E4F145A8])
        {
          if (gLogCategory_XPCUtils <= 50
            && (gLogCategory_XPCUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_XPCUtils, 0x32u)))
          {
            LogPrintF((uint64_t)&gLogCategory_XPCUtils, (uint64_t)"OSStatus xpc_send_message_sync(const char *, uint64_t, uid_t, xpc_object_t, xpc_object_t *)", 0x32u, (uint64_t)"### XPC service '%s' error: %{xpc}\n", v15, v16, v17, v18, (uint64_t)a1);
          }
          uint64_t v19 = 4294960543;
        }
        else
        {
          uint64_t v19 = 0;
          uint64_t v20 = v26;
          *a5 = v26[3];
          v20[3] = 0;
        }
      }
      else
      {
        xpc_connection_send_message(v12, a4);
        barrier[0] = MEMORY[0x1E4F143A8];
        barrier[1] = 0x40000000;
        barrier[2] = __xpc_send_message_sync_block_invoke_3;
        barrier[3] = &__block_descriptor_tmp_7_14568;
        barrier[4] = v14;
        xpc_connection_send_barrier(v12, barrier);
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 4294960568;
    }
    xpc_connection_cancel(v12);
    xpc_release(v12);
    dispatch_release(v10);
    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v19 = 4294960568;
  }
LABEL_13:
  uint64_t v21 = (void *)v26[3];
  if (v21) {
    xpc_release(v21);
  }
  _Block_object_dispose(&v25, 8);
  return v19;
}

intptr_t __xpc_send_message_sync_block_invoke_2(uint64_t a1, xpc_object_t object)
{
  xpc_retain(object);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = object;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v4);
}

intptr_t __xpc_send_message_sync_block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t Apple80211BindToInterface()
{
  return MEMORY[0x1F4124780]();
}

uint64_t Apple80211Close()
{
  return MEMORY[0x1F4124798]();
}

uint64_t Apple80211Open()
{
  return MEMORY[0x1F41247F8]();
}

uint64_t Apple80211RawGet()
{
  return MEMORY[0x1F4124818]();
}

uint64_t Apple80211RawSet()
{
  return MEMORY[0x1F4124820]();
}

uint64_t CCBigNumAdd()
{
  return MEMORY[0x1F40C9430]();
}

uint64_t CCBigNumAddI()
{
  return MEMORY[0x1F40C9438]();
}

uint64_t CCBigNumBitCount()
{
  return MEMORY[0x1F40C9440]();
}

uint64_t CCBigNumCompare()
{
  return MEMORY[0x1F40C9448]();
}

uint64_t CCBigNumCompareI()
{
  return MEMORY[0x1F40C9450]();
}

uint64_t CCBigNumFree()
{
  return MEMORY[0x1F40C9458]();
}

uint64_t CCBigNumFromData()
{
  return MEMORY[0x1F40C9460]();
}

uint64_t CCBigNumMod()
{
  return MEMORY[0x1F40C9468]();
}

uint64_t CCBigNumModExp()
{
  return MEMORY[0x1F40C9470]();
}

uint64_t CCBigNumMul()
{
  return MEMORY[0x1F40C9478]();
}

uint64_t CCBigNumMulMod()
{
  return MEMORY[0x1F40C9480]();
}

uint64_t CCBigNumSetI()
{
  return MEMORY[0x1F40C9488]();
}

uint64_t CCBigNumSub()
{
  return MEMORY[0x1F40C9490]();
}

uint64_t CCBigNumToData()
{
  return MEMORY[0x1F40C9498]();
}

uint64_t CCCreateBigNum()
{
  return MEMORY[0x1F40C94A0]();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1F40C94B8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1F40C94C0](*(void *)&op, *(void *)&mode, *(void *)&alg, *(void *)&padding, iv, key, keyLength, tweak);
}

uint64_t CCCryptorGCMAddAAD()
{
  return MEMORY[0x1F40C94D8]();
}

uint64_t CCCryptorGCMDecrypt()
{
  return MEMORY[0x1F40C94E0]();
}

uint64_t CCCryptorGCMEncrypt()
{
  return MEMORY[0x1F40C94E8]();
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x1F40C94F0]();
}

uint64_t CCCryptorGCMReset()
{
  return MEMORY[0x1F40C9508]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1F40C9528](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1F40C9530](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C9538](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCRSACryptorImport()
{
  return MEMORY[0x1F40C9680]();
}

uint64_t CCRSACryptorRelease()
{
  return MEMORY[0x1F40C9688]();
}

uint64_t CCRSACryptorSign()
{
  return MEMORY[0x1F40C9690]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1F40C96C8](bytes, count);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97C0](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
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

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
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

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1F40D7678](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x1F40D7680]();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
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

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1F40D7888](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
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

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x1F40D7AC0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1F40D7DF8](number);
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

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
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

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8700](allocator, name, tryAbbrev);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
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

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

uint64_t CUErrorCodesTableGet()
{
  return MEMORY[0x1F4116D90]();
}

uint64_t CUErrorDomainTableGet()
{
  return MEMORY[0x1F4116D98]();
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x1F40C9808](sdRef, *(void *)&flags, *(void *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x1F40C9818](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x1F40C9820](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x1F40C9840](sdRef, *(void *)&flags, *(void *)&interfaceIndex, *(void *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x1F40C9858](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x1F40C9860](sdRef, *(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

DNSServiceErrorType DNSServiceReconfirmRecord(DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata)
{
  return MEMORY[0x1F40C9870](*(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, rdlen, rdata);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x1F40C9888](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x1F40C98A0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x1F40C98B0](service, queue);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return MEMORY[0x1F40C98C8](sdRef, recordRef, *(void *)&flags, rdlen, rdata, *(void *)&ttl);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1F40E8798](device, *(void *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x1F40E87B0](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E87B8](device, key);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1F40E87E8](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputReportCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportCallback callback, void *context)
{
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
}

void IOHIDDeviceScheduleWithRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDDeviceUnscheduleFromRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1F40E8F38](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x1F40E90D0]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1F40E90D8]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1F40E90F0](blob);
}

uint64_t IOPSCreatePowerSource()
{
  return MEMORY[0x1F40E90F8]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1F40E9100]();
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9118](blob, ps);
}

uint64_t IOPSReleasePowerSource()
{
  return MEMORY[0x1F40E9138]();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return MEMORY[0x1F40E9140]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1F40E91C8](*(void *)&entry, plane, parent);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1F40E9238](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x1F4101D70](store, nameEncoding);
}

CFStringRef SCDynamicStoreCopyLocalHostName(SCDynamicStoreRef store)
{
  return (CFStringRef)MEMORY[0x1F4101D90](store);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateComputerName(CFAllocatorRef allocator)
{
  return (CFStringRef)MEMORY[0x1F4101DC8](allocator);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x1F4101E20]();
}

uint64_t SCNetworkReachabilityCreateWithOptions()
{
  return MEMORY[0x1F4101F00]();
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
}

uint64_t SCNetworkSignatureCopyActiveIdentifiers()
{
  return MEMORY[0x1F4101FD8]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FE8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FF0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1F4102000](allocator, name, prefsID, authorization);
}

Boolean SCPreferencesSetComputerName(SCPreferencesRef prefs, CFStringRef name, CFStringEncoding nameEncoding)
{
  return MEMORY[0x1F4102038](prefs, name, *(void *)&nameEncoding);
}

uint64_t SCPreferencesSetHostName()
{
  return MEMORY[0x1F4102048]();
}

Boolean SCPreferencesSetLocalHostName(SCPreferencesRef prefs, CFStringRef name)
{
  return MEMORY[0x1F4102050](prefs, name);
}

OSStatus SSLCopyPeerTrust(SSLContextRef context, SecTrustRef *trust)
{
  return MEMORY[0x1F40F68C8](context, trust);
}

SSLContextRef SSLCreateContext(CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x1F40F68D0](alloc, *(void *)&protocolSide, *(void *)&connectionType);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x1F40F6938](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x1F40F6948](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x1F40F6968](context, certRefs);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x1F40F6978](context, connection);
}

OSStatus SSLSetEnabledCiphers(SSLContextRef context, const SSLCipherSuite *ciphers, size_t numCiphers)
{
  return MEMORY[0x1F40F6988](context, ciphers, numCiphers);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x1F40F6990](context, readFunc, writeFunc);
}

uint64_t SSLSetPSKIdentity()
{
  return MEMORY[0x1F40F69B0]();
}

uint64_t SSLSetPSKSharedSecret()
{
  return MEMORY[0x1F40F69B8]();
}

OSStatus SSLSetPeerDomainName(SSLContextRef context, const char *peerName, size_t peerNameLen)
{
  return MEMORY[0x1F40F69C0](context, peerName, peerNameLen);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x1F40F69D8](context, *(void *)&minVersion);
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x1F40F69E8](context, *(void *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x1F40F69F0](context, data, dataLength, processed);
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return MEMORY[0x1F40F6A78]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1F40F6AB8](certificate, commonName);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6B48](certificate, error);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1F40F6BB8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x1F40F6DC0](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1F40F6DC8]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x1F40F6F40](key);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x1F40F6F68](key, *(void *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x1F40F6F70](key, *(void *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateAppleBasicAttestationUser()
{
  return MEMORY[0x1F40F6FE0]();
}

uint64_t SecPolicyCreateiAP()
{
  return MEMORY[0x1F40F70A8]();
}

uint64_t SecPolicyCreateiAPSWAuth()
{
  return MEMORY[0x1F40F70B0]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1F40F71D0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1F40F7258](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x1F40F7260](trust, anchorCertificatesOnly);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x1F40C9A38](txtRecord);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x1F40C9A50](txtRecord);
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x1F40C9A58](txtLen, txtRecord, key, valueLen);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x1F40C9A68](txtRecord, key, valueSize, value);
}

uint64_t WiFiDeviceClientAssociateAsync()
{
  return MEMORY[0x1F412FD88]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1F412FD90]();
}

uint64_t WiFiDeviceClientCopyHostedNetworks()
{
  return MEMORY[0x1F412FDA0]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x1F412FDB0]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x1F412FDB8]();
}

uint64_t WiFiDeviceClientGetInterfaceRoleIndex()
{
  return MEMORY[0x1F412FDC0]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x1F412FDC8]();
}

uint64_t WiFiDeviceClientIsInterfaceAWDL()
{
  return MEMORY[0x1F412FDD8]();
}

uint64_t WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback()
{
  return MEMORY[0x1F412FDE8]();
}

uint64_t WiFiDeviceClientRegisterAutoJoinNotificationCallback()
{
  return MEMORY[0x1F412FDF0]();
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback()
{
  return MEMORY[0x1F412FE08]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x1F412FE18]();
}

uint64_t WiFiDeviceClientRegisterRemovalCallback()
{
  return MEMORY[0x1F412FE20]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x1F412FE38]();
}

uint64_t WiFiDeviceClientSetPower()
{
  return MEMORY[0x1F412FE48]();
}

uint64_t WiFiDeviceClientStartNetwork()
{
  return MEMORY[0x1F412FE50]();
}

uint64_t WiFiDeviceClientStopNetwork()
{
  return MEMORY[0x1F412FE58]();
}

uint64_t WiFiDeviceClientTrafficRegistration()
{
  return MEMORY[0x1F412FE60]();
}

uint64_t WiFiManagerClientAddNetwork()
{
  return MEMORY[0x1F412FE70]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1F412FE78]();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return MEMORY[0x1F412FE88]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x1F412FE90]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x1F412FEA8]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x1F412FEB0]();
}

uint64_t WiFiManagerClientEnableNetwork()
{
  return MEMORY[0x1F412FEB8]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x1F412FED0]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1F412FEF0]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x1F412FF00]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1F412FF20]();
}

uint64_t WiFiManagerClientSetWoWState()
{
  return MEMORY[0x1F412FF48]();
}

uint64_t WiFiManagerClientTemporarilyDisableNetwork()
{
  return MEMORY[0x1F412FF50]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x1F412FF58]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x1F412FF68]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x1F412FF70]();
}

uint64_t WiFiNetworkGetAuthFlags()
{
  return MEMORY[0x1F412FF90]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x1F412FF98]();
}

uint64_t WiFiNetworkGetDirectedState()
{
  return MEMORY[0x1F412FFA0]();
}

uint64_t WiFiNetworkGetIntProperty()
{
  return MEMORY[0x1F412FFA8]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1F412FFB0]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x1F412FFB8]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1F412FFC8]();
}

uint64_t WiFiNetworkGetSSIDData()
{
  return MEMORY[0x1F412FFD0]();
}

uint64_t WiFiNetworkGetShareMode()
{
  return MEMORY[0x1F412FFD8]();
}

uint64_t WiFiNetworkIsAdHoc()
{
  return MEMORY[0x1F412FFE8]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x1F412FFF8]();
}

uint64_t WiFiNetworkIsEAP()
{
  return MEMORY[0x1F4130008]();
}

uint64_t WiFiNetworkIsHidden()
{
  return MEMORY[0x1F4130018]();
}

uint64_t WiFiNetworkIsHotspot()
{
  return MEMORY[0x1F4130020]();
}

uint64_t WiFiNetworkIsHotspot20()
{
  return MEMORY[0x1F4130028]();
}

uint64_t WiFiNetworkIsOpen()
{
  return MEMORY[0x1F4130030]();
}

uint64_t WiFiNetworkIsProfileBased()
{
  return MEMORY[0x1F4130038]();
}

uint64_t WiFiNetworkIsSAE()
{
  return MEMORY[0x1F4130040]();
}

uint64_t WiFiNetworkIsWEP()
{
  return MEMORY[0x1F4130048]();
}

uint64_t WiFiNetworkIsWPA()
{
  return MEMORY[0x1F4130050]();
}

uint64_t WiFiNetworkSetDirectedState()
{
  return MEMORY[0x1F4130060]();
}

uint64_t WiFiNetworkSetIntProperty()
{
  return MEMORY[0x1F4130068]();
}

uint64_t WiFiNetworkSetPassword()
{
  return MEMORY[0x1F4130070]();
}

uint64_t WiFiNetworkSetProperty()
{
  return MEMORY[0x1F4130078]();
}

uint64_t WiFiNetworkWasCaptive()
{
  return MEMORY[0x1F4130080]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1F40C9AE0]();
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return MEMORY[0x1F41020C8]();
}

uint64_t _SCNetworkInterfaceIsThunderbolt()
{
  return MEMORY[0x1F4102100]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1F40C9B68](*(void *)&a1, a2, *(void *)&a3);
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

uint64_t __memset_chk()
{
  return MEMORY[0x1F40C9C38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CA200](*(void *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CA530](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1F40CA570](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1F40CA6E8]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1F40CA6F0]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x1F40CA7D0]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x1F40CA7E8]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1F40CA978]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1F40CA990]();
}

uint64_t cced25519_sign()
{
  return MEMORY[0x1F40CAC40]();
}

uint64_t cced25519_verify()
{
  return MEMORY[0x1F40CAC50]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1F40CAC78]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1F40CAC88]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1F40CAC98]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1F40CACA8]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1F40CACB0]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1F40CACB8]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1F40CACC0]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1F40CB158]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x1F40CB228]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x1F40CB230]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x1F40CB238]();
}

uint64_t ccsrp_ctx_init_option()
{
  return MEMORY[0x1F40CB240]();
}

uint64_t ccsrp_generate_salt_and_verification()
{
  return MEMORY[0x1F40CB248]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x1F40CB250]();
}

uint64_t ccsrp_gp_rfc5054_3072()
{
  return MEMORY[0x1F40CB258]();
}

uint64_t ccsrp_server_compute_session()
{
  return MEMORY[0x1F40CB260]();
}

uint64_t ccsrp_server_generate_public_key()
{
  return MEMORY[0x1F40CB268]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x1F40CB270]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1F40CB3D0](*(void *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1F40CC100](a1, *(void *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1F40CC298](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1F40CC2E8](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1F40CC348](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1F40CC408](a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC488](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4E0](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4F0](*(void *)&a1, a2, a3, a4, a5);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC558](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1F40CC560](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC5A8](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1F40CC648](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1F40CC650](a1);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

int listen(int a1, int a2)
{
  return MEMORY[0x1F40CC840](*(void *)&a1, *(void *)&a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC868](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1F40CCA68](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40CCAB8](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
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

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1F40CCEA0](__rqtp, __rmtp);
}

int nftw(const char *a1, int (__cdecl *a2)(const char *, const stat *, int, FTW *), int a3, int a4)
{
  return MEMORY[0x1F40CD018](a1, a2, *(void *)&a3, *(void *)&a4);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1F40F3250](interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1F40F3480]();
}

void nw_parameters_prohibit_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
}

uint64_t nw_parameters_set_avoided_netagent_classes()
{
  return MEMORY[0x1F40F35C8]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1F40F3820]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1F40F3860]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1F40F3870]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1F40F3888]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1F40F38A8]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3930](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1F40F39B0]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
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

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x1F40CD180]();
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1F40CD188]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1F40CD190]();
}

uint64_t os_channel_attr_get()
{
  return MEMORY[0x1F40CD198]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x1F40CD200]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x1F40CD218]();
}

uint64_t os_channel_read_attr()
{
  return MEMORY[0x1F40CD250]();
}

uint64_t os_channel_ring_id()
{
  return MEMORY[0x1F40CD258]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x1F40CD270]();
}

uint64_t os_channel_set_slot_properties()
{
  return MEMORY[0x1F40CD278]();
}

uint64_t os_channel_sync()
{
  return MEMORY[0x1F40CD298]();
}

uint64_t os_channel_tx_ring()
{
  return MEMORY[0x1F40CD2A0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1F40CD668]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x1F40CD740](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CD780](a1, a2);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1F40CD790](a1, a2, a3, a4, __argv, __envp);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD998](a1, a2, a3);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDA10](a1, a2, a3);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
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

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDCB8](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1F40CDCC0](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1F40CDCC8](*(void *)&a1, a2, *(void *)&a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1F40CDED8](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDF30](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x1F40CDF38](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1F40CDF48](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int setuid(uid_t a1)
{
  return MEMORY[0x1F40CDFC8](*(void *)&a1);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1F40CDFD0](a1, a2, *(void *)&a3, a4);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1F40CDFF8](*(void *)&a1, *(void *)&a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE170](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1A8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CE238](__stringp, __delim);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE250](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1F40CE298](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x1F40CE4E8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x1F40CE4F8](*(void *)&a1, *(void *)&a2, a3);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return MEMORY[0x1F40CE538](*(void *)&thread, *(void *)&flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1F40CE7C8](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1F40CE938](*(void *)&a1, a2, *(void *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

void xpc_array_set_double(xpc_object_t xarray, size_t index, double value)
{
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1F40CEB90]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
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

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x1F40CECE8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1F40CEDF0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1F40CEE58]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40CEF00](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}