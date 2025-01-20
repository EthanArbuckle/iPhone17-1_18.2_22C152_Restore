@interface AuthenticateEndpoint
@end

@implementation AuthenticateEndpoint

void __mfiMutualAuth_AuthenticateEndpoint_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v2 = *(char **)(a1 + 40);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v65 = 0;
  unint64_t v4 = 0x1EA627000uLL;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v5 = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  MEMORY[0x1D25EB370](*(void *)(v5 + 104));
  mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 1);
  MEMORY[0x1D25EB390](*(void *)(v5 + 104));
  uint64_t v6 = *(void *)(v5 + 8);
  dataPointerOut[0] = (char *)MEMORY[0x1E4F143A8];
  dataPointerOut[1] = (char *)0x40000000;
  dataPointerOut[2] = (char *)__mfiMutualAuth_initMFi4_block_invoke;
  dataPointerOut[3] = (char *)&__block_descriptor_tmp_21;
  dataPointerOut[4] = v2;
  dataPointerOut[5] = (char *)v5;
  int v7 = APAccTransportClientEndpointActivate(v6, 14, 1, (uint64_t)dataPointerOut);
  v8 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  uint64_t v57 = v1;
  if (v7)
  {
    int v21 = v7;
LABEL_165:
    APSLogErrorAt();
    APSLogErrorAt();
    CFTypeRef v13 = 0;
    goto LABEL_74;
  }
  uint64_t v9 = *(void *)(v5 + 8);
  lengthAtOffsetOut[0] = MEMORY[0x1E4F143A8];
  lengthAtOffsetOut[1] = 0x40000000;
  lengthAtOffsetOut[2] = (size_t)__mfiMutualAuth_initMFi4_block_invoke_2;
  lengthAtOffsetOut[3] = (size_t)&__block_descriptor_tmp_25;
  lengthAtOffsetOut[4] = v5;
  lengthAtOffsetOut[5] = (size_t)v2;
  int v10 = APAccTransportClientEndpointSetAuthStatusHandler(v9, (uint64_t)lengthAtOffsetOut);
  if (v10)
  {
    int v21 = v10;
    goto LABEL_165;
  }
  uint64_t v11 = *(void *)(v5 + 8);
  cf[0] = (CFTypeRef)MEMORY[0x1E4F143A8];
  cf[1] = (CFTypeRef)0x40000000;
  cf[2] = __mfiMutualAuth_initMFi4_block_invoke_3;
  cf[3] = &__block_descriptor_tmp_28;
  cf[4] = v2;
  cf[5] = (CFTypeRef)v5;
  int v12 = APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler(v11, (uint64_t)cf);
  if (v12)
  {
    int v21 = v12;
    goto LABEL_165;
  }
  v55 = (void *)DerivedStorage;
  CFTypeRef v13 = 0;
  CFAllocatorRef v14 = *v8;
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  while (1)
  {
    if (v13) {
      CFRelease(v13);
    }
    v16 = v65;
    uint64_t v17 = CMBaseObjectGetDerivedStorage();
    dataPointerOut[0] = 0;
    lengthAtOffsetOut[0] = 0;
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v16)
    {
      MEMORY[0x1D25EB370](*(void *)(v17 + 104));
      if (*(_DWORD *)(v17 + 120) != 2)
      {
        MEMORY[0x1D25EB390](*(void *)(v17 + 104));
        APSLogErrorAt();
        CFTypeRef v13 = 0;
        int v21 = -71803;
        goto LABEL_66;
      }
      mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 1);
      MEMORY[0x1D25EB390](*(void *)(v17 + 104));
      CMBlockBufferGetDataPointer(v16, 0, lengthAtOffsetOut, 0, dataPointerOut);
      if (!dataPointerOut[0] || !lengthAtOffsetOut[0])
      {
        APSLogErrorAt();
        CFTypeRef v13 = 0;
        int v21 = -71804;
        goto LABEL_66;
      }
      CFDataRef v18 = CFDataCreateWithBytesNoCopy(v14, (const UInt8 *)dataPointerOut[0], lengthAtOffsetOut[0], v15);
      if (!v18)
      {
        APSLogErrorAt();
        CFTypeRef v13 = 0;
        int v21 = -71800;
        goto LABEL_66;
      }
      CFDataRef v19 = v18;
      if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
        && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      int v20 = APAccTransportClientEndpointForwardData(*(void *)(v17 + 8), (uint64_t)v19);
      if (v20)
      {
        int v21 = v20;
        APSLogErrorAt();
        int v22 = 0;
        CFTypeRef v13 = 0;
LABEL_49:
        CFRelease(v19);
        goto LABEL_50;
      }
    }
    else
    {
      if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
        && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFDataRef v19 = 0;
    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v17 + 88), 0xFFFFFFFFFFFFFFFFLL);
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    MEMORY[0x1D25EB370](*(void *)(v17 + 104));
    CFTypeRef v13 = 0;
    int v23 = *(_DWORD *)(v17 + 120);
    if ((v23 - 3) < 2)
    {
      int v22 = 1;
LABEL_47:
      int v21 = 0;
LABEL_48:
      MEMORY[0x1D25EB390](*(void *)(v17 + 104));
      if (!v19) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v23 != 2)
    {
      int v22 = 0;
      int v21 = -71803;
      goto LABEL_48;
    }
    v24 = *(const void **)(v17 + 112);
    if (v24)
    {
      CFTypeRef v13 = CFRetain(v24);
      v25 = *(const void **)(v17 + 112);
      if (v25)
      {
        CFRelease(v25);
        int v22 = 0;
        *(void *)(v17 + 112) = 0;
      }
      else
      {
        int v22 = 0;
      }
      goto LABEL_47;
    }
    APSLogErrorAt();
    int v22 = 0;
    CFTypeRef v13 = 0;
    int v21 = -71802;
    if (v19) {
      goto LABEL_49;
    }
LABEL_50:
    if (v21)
    {
      unint64_t v4 = 0x1EA627000;
LABEL_66:
      MEMORY[0x1D25EB370](*(void *)(v17 + 104));
      mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 4);
      MEMORY[0x1D25EB390](*(void *)(v17 + 104));
LABEL_67:
      APSLogErrorAt();
      uint64_t DerivedStorage = (uint64_t)v55;
      v8 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
      goto LABEL_74;
    }
    if (v22) {
      break;
    }
    if (v65)
    {
      CFRelease(v65);
      v65 = 0;
    }
    int v21 = mfiMutualAuth_sendMessageMFi4((uint64_t)v2, v13, 0);
    unint64_t v4 = 0x1EA627000uLL;
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 20
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v21) {
      goto LABEL_67;
    }
  }
  uint64_t DerivedStorage = (uint64_t)v55;
  MEMORY[0x1D25EB370](v55[13]);
  v8 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (*((_DWORD *)v55 + 30) == 3)
  {
    int v21 = 0;
    unint64_t v4 = 0x1EA627000;
  }
  else
  {
    unint64_t v4 = 0x1EA627000uLL;
    if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 90
      && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v21 = -71802;
  }
  MEMORY[0x1D25EB390](v55[13]);
LABEL_74:
  if (v65) {
    CFRelease(v65);
  }
  if (v13) {
    CFRelease(v13);
  }
  int v26 = *(_DWORD *)(v4 + 2208);
  if (v21)
  {
    if (v26 <= 90 && (v26 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v21 == 200403) {
      int v27 = -71145;
    }
    else {
      int v27 = -71802;
    }
    MEMORY[0x1D25EB370](*(void *)(DerivedStorage + 104));
    mfiMutualAuth_setAndLogAuthState((uint64_t)v2, 4);
    MEMORY[0x1D25EB390](*(void *)(DerivedStorage + 104));
  }
  else
  {
    if (v26 <= 50 && (v26 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v27 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = v27;
  if (*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24)) {
    return;
  }
  uint64_t v28 = *(void *)(v1 + 40);
  uint64_t v29 = CMBaseObjectGetDerivedStorage();
  cf[0] = 0;
  v64 = 0;
  v65 = 0;
  v63 = 0;
  CFAllocatorRef v30 = *v8;
  Mutable = CFDictionaryCreateMutable(*v8, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  size_t v61 = 0;
  v62 = 0;
  int v32 = *(_DWORD *)(v4 + 2208);
  if (v32 <= 50 && (v32 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFDictionarySetValue(Mutable, @"X-Apple-PairingTranscript", @"1");
  uint64_t v33 = v29 + 24;
  CFAllocatorRef v34 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  CFDataRef v56 = CFDataCreateWithBytesNoCopy(v30, (const UInt8 *)(v29 + 24), 32, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  int TransformedMessage = mfiMutualAuth_createTransformedMessage(v28, 0, v56, cf);
  if (TransformedMessage)
  {
    int v39 = TransformedMessage;
LABEL_168:
    APSLogErrorAt();
    v37 = 0;
LABEL_174:
    CFDataRef v48 = 0;
LABEL_177:
    CFDataRef v52 = v56;
    goto LABEL_138;
  }
  int v36 = mfiMutualAuth_sendMessageMFi4(v28, cf[0], (uint64_t)Mutable);
  if (v36)
  {
    int v39 = v36;
    goto LABEL_168;
  }
  uint64_t v54 = v29;
  v37 = v63;
  uint64_t v38 = CMBaseObjectGetDerivedStorage();
  dataPointerOut[0] = 0;
  lengthAtOffsetOut[0] = 0;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v37)
  {
    APSLogErrorAt();
    int v39 = -71801;
    goto LABEL_127;
  }
  MEMORY[0x1D25EB370](*(void *)(v38 + 104));
  if (*(_DWORD *)(v38 + 124))
  {
    MEMORY[0x1D25EB390](*(void *)(v38 + 104));
    APSLogErrorAt();
    v37 = 0;
    int v39 = -71803;
    goto LABEL_127;
  }
  mfiMutualAuth_setAndLogSecureTunnelState(v28, 5);
  MEMORY[0x1D25EB390](*(void *)(v38 + 104));
  CMBlockBufferGetDataPointer(v37, 0, lengthAtOffsetOut, 0, dataPointerOut);
  if (!dataPointerOut[0] || !lengthAtOffsetOut[0])
  {
    APSLogErrorAt();
    v37 = 0;
    int v39 = -71804;
    goto LABEL_127;
  }
  CFDataRef v40 = CFDataCreateWithBytesNoCopy(v30, (const UInt8 *)dataPointerOut[0], lengthAtOffsetOut[0], v34);
  if (!v40)
  {
    APSLogErrorAt();
    v37 = 0;
    int v39 = -71800;
    goto LABEL_127;
  }
  CFDataRef v41 = v40;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 30
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v42 = APAccTransportClientEndpointForwardData(*(void *)(v38 + 8), (uint64_t)v41);
  if (v42)
  {
    int v39 = v42;
    APSLogErrorAt();
LABEL_182:
    CFRelease(v41);
    v37 = 0;
    goto LABEL_127;
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v38 + 88), 0xFFFFFFFFFFFFFFFFLL);
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  MEMORY[0x1D25EB370](*(void *)(v38 + 104));
  int v43 = *(_DWORD *)(v38 + 124);
  if (v43 != 6)
  {
    v37 = 0;
    int v39 = -71803;
    goto LABEL_124;
  }
  v44 = *(const void **)(v38 + 112);
  if (!v44)
  {
    APSLogErrorAt();
    int v39 = -71802;
    uint64_t v1 = v57;
    goto LABEL_182;
  }
  v37 = (OpaqueCMBlockBuffer *)CFRetain(v44);
  v45 = *(const void **)(v38 + 112);
  if (v45)
  {
    CFRelease(v45);
    *(void *)(v38 + 112) = 0;
  }
  mfiMutualAuth_setAndLogSecureTunnelState(v28, 0);
  int v39 = 0;
LABEL_124:
  MEMORY[0x1D25EB390](*(void *)(v38 + 104));
  CFRelease(v41);
  if (v43 == 6)
  {
    uint64_t v1 = v57;
    goto LABEL_128;
  }
  uint64_t v1 = v57;
LABEL_127:
  MEMORY[0x1D25EB370](*(void *)(v38 + 104));
  mfiMutualAuth_setAndLogSecureTunnelState(v28, 7);
  MEMORY[0x1D25EB390](*(void *)(v38 + 104));
  if (v39)
  {
    APSLogErrorAt();
    CFDataRef v48 = 0;
    uint64_t v29 = v54;
    CFDataRef v52 = v56;
    goto LABEL_138;
  }
LABEL_128:
  uint64_t v29 = v54;
  int v46 = mfiMutualAuth_sendMessageMFi4(v28, v37, (uint64_t)Mutable);
  if (v46)
  {
    int v39 = v46;
LABEL_173:
    APSLogErrorAt();
    goto LABEL_174;
  }
  OSStatus DataPointer = CMBlockBufferGetDataPointer(v64, 0, &v61, 0, &v62);
  if (DataPointer)
  {
    int v39 = DataPointer;
    goto LABEL_173;
  }
  CFDataRef v48 = CFDataCreateWithBytesNoCopy(v30, (const UInt8 *)v62, v61, v34);
  int v49 = mfiMutualAuth_createTransformedMessage(v28, 1, v48, (CFTypeRef *)&v65);
  if (v49)
  {
    int v39 = v49;
    APSLogErrorAt();
    goto LABEL_177;
  }
  if (CFDataGetLength(v65) != 32
    || (BytePtr = CFDataGetBytePtr(v65), size_t Length = CFDataGetLength(v65),
                                         memcmp((const void *)(v54 + 56), BytePtr, Length)))
  {
    APSLogErrorAt();
    int v39 = -71145;
    goto LABEL_177;
  }
  CFDataRef v52 = v56;
  if (gLogCategory_APAuthenticationClientMFiMutualAuth <= 50
    && (gLogCategory_APAuthenticationClientMFiMutualAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v39 = 0;
LABEL_138:
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v52) {
    CFRelease(v52);
  }
  if (v64) {
    CFRelease(v64);
  }
  if (v65) {
    CFRelease(v65);
  }
  if (v48) {
    CFRelease(v48);
  }
  if (v63) {
    CFRelease(v63);
  }
  if (v37) {
    CFRelease(v37);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  for (uint64_t i = 0; i != 64; ++i)
    *(unsigned char *)(v33 + i) = 0;
  if (v39)
  {
    MEMORY[0x1D25EB370](*(void *)(v29 + 104));
    mfiMutualAuth_setAndLogSecureTunnelState(v28, 7);
    MEMORY[0x1D25EB390](*(void *)(v29 + 104));
  }
  *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = v39;
}

@end