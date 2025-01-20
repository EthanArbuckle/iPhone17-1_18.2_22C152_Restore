@interface Control
@end

@implementation Control

void __screenstreamudp_Control_block_invoke(void *a1)
{
  v2 = (const void *)a1[5];
  uint64_t v3 = a1[6];
  int v30 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef v29 = 0;
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    int v10 = -16762;
    int v30 = -16762;
LABEL_22:
    APSLogErrorAt();
    goto LABEL_55;
  }
  if (!v3)
  {
    int v10 = -16760;
    int v30 = -16760;
    goto LABEL_22;
  }
  uint64_t v5 = DerivedStorage;
  uint64_t Int64 = CFDictionaryGetInt64();
  if (Int64 == *(void *)(v5 + 240)) {
    goto LABEL_54;
  }
  uint64_t v7 = Int64;
  if (!Int64)
  {
    v8 = "default";
    goto LABEL_9;
  }
  if (Int64 != 1)
  {
    if (gLogCategory_APEndpointStreamScreenUDP <= 90
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v10 = -16760;
    int v30 = -16760;
    goto LABEL_22;
  }
  if (!*(unsigned char *)(v5 + 249)) {
    goto LABEL_54;
  }
  v8 = "media presentation";
LABEL_9:
  if (gLogCategory_APEndpointStreamScreenUDP >= 51)
  {
    *(void *)(v5 + 240) = Int64;
  }
  else
  {
    if (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize())
    {
      *(void *)&long long v20 = v2;
      *((void *)&v20 + 1) = v8;
      LogPrintF();
    }
    int v9 = gLogCategory_APEndpointStreamScreenUDP;
    *(void *)(v5 + 240) = v7;
    if (v9 <= 40 && (v9 != -1 || _LogCategory_Initialize()))
    {
      *(void *)&long long v20 = v2;
      LogPrintF();
    }
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable)
  {
    APSLogErrorAt();
    int v10 = -16761;
    int v30 = -16761;
    goto LABEL_55;
  }
  v12 = Mutable;
  if (!*(unsigned char *)(v5 + 112) || !*(unsigned char *)(v5 + 113) || !*(void *)(v5 + 120)) {
    goto LABEL_52;
  }
  long long v23 = *MEMORY[0x1E4F1DB30];
  int v22 = 0;
  if (*(void *)(v5 + 240) == 1)
  {
    APSScreenGetMediaPresentationParams();
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      uint64_t v21 = 0;
      long long v20 = v23;
      LogPrintF();
    }
  }
  else
  {
    long long v23 = *(_OWORD *)(v5 + 152);
    int v22 = *(_DWORD *)(v5 + 260);
  }
  long long v24 = v23;
  LODWORD(v25) = v22;
  uint64_t v13 = *(void *)(v5 + 240);
  BYTE8(v26) = v13 == 1;
  *(void *)&long long v27 = screenstreamudp_getDisplayHDRMode(v5);
  if (!*(unsigned char *)(v5 + 113)) {
    goto LABEL_50;
  }
  CFDictionarySetInt64();
  CFDictionaryRef DisplayHDRMode = screenstreamudp_getDisplayHDRMode(v5);
  CFDictionarySetValue(v12, @"displayHDRMode", DisplayHDRMode);
  v15 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!*(unsigned char *)(v5 + 255)) {
    v15 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  CFDictionarySetValue(v12, @"hdrMirroringSupported", *v15);
  if ([*(id *)(v5 + 40) isConfigPresentForPresentationMode:v13 == 1])
  {
    v16 = 0;
    goto LABEL_47;
  }
  int v30 = objc_msgSend(*(id *)(v5 + 40), "initializeNegotiatorWithMode:presentationMode:hdrMirroringSupported:", screenstreamudp_getDisplayHDRMode(v5), v13 == 1, *(unsigned char *)(v5 + 255) != 0, v20, v21);
  if (v30) {
    goto LABEL_61;
  }
  uint64_t v17 = [*(id *)(v5 + 40) negotiationDataForPresentationMode:v13 == 1];
  if (v17)
  {
    v16 = (const void *)v17;
    if (gLogCategory_APEndpointStreamScreenUDP <= 40
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      *(void *)&long long v20 = v13 == 1;
      LogPrintF();
    }
    CFDictionarySetValue(v12, @"negotiationData", v16);
LABEL_47:
    int v30 = APTransportStreamSendPlistMessageCreatingPlistReply();
    if (!v30)
    {
      if (v16)
      {
        CFDataGetTypeID();
        uint64_t TypedValue = CFDictionaryGetTypedValue();
        goto LABEL_51;
      }
LABEL_50:
      uint64_t TypedValue = 0;
LABEL_51:
      int v30 = objc_msgSend(*(id *)(v5 + 40), "restartWithScreenOptions:negotiatedBlob:", &v24, TypedValue, (void)v20);
      if (!v30) {
        goto LABEL_52;
      }
    }
LABEL_61:
    APSLogErrorAt();
    goto LABEL_52;
  }
  APSLogErrorAt();
  int v30 = -16761;
LABEL_52:
  CFRelease(v12);
  if (v29) {
    CFRelease(v29);
  }
LABEL_54:
  int v10 = v30;
  if (!v30)
  {
    int v19 = 0;
    goto LABEL_57;
  }
LABEL_55:
  screenstreamudp_handleFatalError(v2, v10, @"HDR restart failed");
  int v19 = v30;
LABEL_57:
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v19;
}

void __screenstream_Control_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    int v20 = -16762;
    goto LABEL_32;
  }
  if (!v2)
  {
    int v20 = -16760;
    goto LABEL_32;
  }
  uint64_t v4 = DerivedStorage;
  uint64_t Int64 = CFDictionaryGetInt64();
  if (Int64 == *(void *)(v4 + 352)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)(v4 + 378)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)(v4 + 389)) {
    goto LABEL_42;
  }
  uint64_t v6 = *(void *)(v4 + 160);
  if (!v6) {
    goto LABEL_42;
  }
  uint64_t v7 = Int64;
  if (Int64)
  {
    if (Int64 == 1)
    {
      if (*(unsigned char *)(v4 + 367)) {
        goto LABEL_10;
      }
LABEL_42:
      int v20 = 0;
      goto LABEL_41;
    }
    if (gLogCategory_APEndpointStreamScreen <= 90
      && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v20 = -16760;
LABEL_32:
    APSLogErrorAt();
    goto LABEL_41;
  }
LABEL_10:
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = *(void (**)(uint64_t))(v9 + 16);
  if (v10) {
    v10(v6);
  }
  if (gLogCategory_APEndpointStreamScreen <= 50
    && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(void *)(v4 + 352) = v7;
  VirtualDisplayActivationOptions = screenstream_createVirtualDisplayActivationOptions();
  uint64_t v12 = *(void *)(v4 + 160);
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = *(uint64_t (**)(uint64_t, __CFDictionary *, void))(v14 + 8);
  if (v15)
  {
    int v16 = v15(v12, VirtualDisplayActivationOptions, 0);
    if (v16)
    {
      int v20 = v16;
    }
    else
    {
      uint64_t v17 = *(void *)(v4 + 160);
      uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v21 = *(uint64_t (**)(uint64_t))(v19 + 40);
      if (v21)
      {
        int v20 = v21(v17);
        if (!v20)
        {
          if (!VirtualDisplayActivationOptions) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }
      }
      else
      {
        int v20 = -12782;
      }
    }
  }
  else
  {
    int v20 = -12782;
  }
  APSLogErrorAt();
  if (VirtualDisplayActivationOptions) {
LABEL_40:
  }
    CFRelease(VirtualDisplayActivationOptions);
LABEL_41:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v20;
}

uint64_t __screenstream_Control_block_invoke_2(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = result;
  if (gLogCategory_APEndpointStreamScreen <= 50)
  {
    if (gLogCategory_APEndpointStreamScreen != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(v3 + 24))
  {
    int v12 = -16762;
    goto LABEL_20;
  }
  if (!*(unsigned char *)(v3 + 26) || (uint64_t v4 = *(void *)(v3 + 160)) == 0)
  {
    int v12 = 0;
    goto LABEL_21;
  }
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t))(v6 + 24);
  if (v7) {
    v7(v4);
  }
  uint64_t v8 = *(void *)(v3 + 160);
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(uint64_t (**)(uint64_t))(v10 + 32);
  if (!v11)
  {
    int v12 = -12782;
LABEL_20:
    uint64_t result = APSLogErrorAt();
    goto LABEL_21;
  }
  uint64_t result = v11(v8);
  int v12 = result;
  if (result) {
    goto LABEL_20;
  }
LABEL_21:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v12;
  return result;
}

uint64_t __screenstream_Control_block_invoke_3(uint64_t a1)
{
  uint64_t result = screenstream_handleCommandSetRecordingState(*(void *)(a1 + 40), 1);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __screenstream_Control_block_invoke_4(uint64_t a1)
{
  uint64_t result = screenstream_handleCommandSetRecordingState(*(void *)(a1 + 40), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __screenstream_Control_block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 48);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef cf = 0;
  if (*(unsigned char *)(DerivedStorage + 378))
  {
    int v22 = 0;
    goto LABEL_37;
  }
  uint64_t v4 = DerivedStorage;
  if (!*(unsigned char *)(DerivedStorage + 26))
  {
    int v22 = 0;
    goto LABEL_35;
  }
  if (!v2 || (CFTypeID v5 = CFGetTypeID(v2), v5 != CFDictionaryGetTypeID()))
  {
    int v22 = -16760;
LABEL_42:
    APSLogErrorAt();
    goto LABEL_35;
  }
  uint64_t v6 = *(void *)(v4 + 160);
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
  if (v9) {
    v9(v6);
  }
  int v10 = APEndpointDisplayDescriptionCreateWithDisplayInfo(*MEMORY[0x1E4F1CF80], v2, &cf);
  if (v10)
  {
    int v22 = v10;
    goto LABEL_42;
  }
  if (gLogCategory_APEndpointStreamScreen <= 50
    && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11 = *(const void **)(v4 + 72);
  CFTypeRef v12 = cf;
  *(void *)(v4 + 72) = cf;
  if (v12) {
    CFRetain(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  screenstream_initDisplayInfo(v4);
  VirtualDisplayActivationOptions = screenstream_createVirtualDisplayActivationOptions();
  uint64_t v14 = *(void *)(v4 + 160);
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = *(uint64_t (**)(uint64_t, __CFDictionary *, void))(v16 + 8);
  if (!v17)
  {
    int v22 = -12782;
    goto LABEL_33;
  }
  int v18 = v17(v14, VirtualDisplayActivationOptions, 0);
  if (v18)
  {
    int v22 = v18;
LABEL_33:
    APSLogErrorAt();
    if (!VirtualDisplayActivationOptions) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  uint64_t v19 = *(void *)(v4 + 160);
  uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  long long v23 = *(uint64_t (**)(uint64_t))(v21 + 40);
  if (!v23)
  {
    int v22 = -12782;
    goto LABEL_33;
  }
  int v22 = v23(v19);
  if (v22) {
    goto LABEL_33;
  }
  if (VirtualDisplayActivationOptions) {
LABEL_34:
  }
    CFRelease(VirtualDisplayActivationOptions);
LABEL_35:
  if (cf) {
    CFRelease(cf);
  }
LABEL_37:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v22;
}

@end