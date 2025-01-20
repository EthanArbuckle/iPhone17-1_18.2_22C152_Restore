uint64_t AudioSBufSourceGetTypeID()
{
  if (gAudioSBufSourceInitOnce != -1) {
    dispatch_once_f(&gAudioSBufSourceInitOnce, 0, (dispatch_function_t)_AudioSBufSourceGetTypeID);
  }
  return gAudioSBufSourceTypeID;
}

uint64_t _AudioSBufSourceGetTypeID()
{
  uint64_t result = _CFRuntimeRegisterClass();
  gAudioSBufSourceTypeID = result;
  return result;
}

uint64_t AudioSBufSourceCreate(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (gAudioSBufSourceInitOnce != -1) {
    dispatch_once_f(&gAudioSBufSourceInitOnce, 0, (dispatch_function_t)_AudioSBufSourceGetTypeID);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  uint64_t v8 = Instance;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  v9 = (AudioStreamBasicDescription *)(Instance + 32);
  *(void *)(Instance + 24) = CFStringCreateF();
  SNPrintF();
  *(void *)(v8 + 16) = dispatch_queue_create(label, 0);
  SNPrintF();
  dispatch_queue_t v10 = dispatch_queue_create(label, 0);
  uint64_t v11 = MEMORY[0x263F010E0];
  *(_OWORD *)(v8 + 112) = *MEMORY[0x263F010E0];
  *(void *)(v8 + 128) = *(void *)(v11 + 16);
  *(void *)(v8 + 136) = v10;
  uint64_t v12 = *(void *)(a2 + 32);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v9->mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 48) = v13;
  *(void *)(v8 + 64) = v12;
  *(void *)(v8 + 80) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  if (a3 <= 0) {
    int v14 = 5;
  }
  else {
    int v14 = a3;
  }
  *(_DWORD *)(v8 + 148) = v14;
  uint64_t v15 = *MEMORY[0x263EFFB08];
  uint64_t v16 = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)(v8 + 72));
  if (v16)
  {
    uint64_t v24 = v16;
    goto LABEL_19;
  }
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 48);
  if (!v20)
  {
    uint64_t v24 = 4294954514;
LABEL_19:
    APSLogErrorAt();
    CFRelease((CFTypeRef)v8);
    return v24;
  }
  uint64_t v21 = v20(CMBaseObject, *MEMORY[0x263F01570], v15, v8 + 88);
  if (v21)
  {
    uint64_t v24 = v21;
    goto LABEL_19;
  }
  uint64_t v22 = FigEndpointAudioSourceBufferQueueCreate();
  if (v22)
  {
    uint64_t v24 = v22;
    goto LABEL_19;
  }
  uint64_t v23 = FigEndpointAudioSourceCopyProperty(*(void *)(v8 + 96), *MEMORY[0x263F123F8], v15, v8 + 104);
  if (v23)
  {
    uint64_t v24 = v23;
    goto LABEL_19;
  }
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v24 = 0;
  *a4 = v8;
  return v24;
}

uint64_t FigEndpointAudioSourceCopyProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t CMBaseObject = FigEndpointAudioSourceGetCMBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  dispatch_queue_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10) {
    return 4294954514;
  }
  return v10(CMBaseObject, a2, a3, a4);
}

uint64_t AudioSBufSourceEnqueueAudioData(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __AudioSBufSourceEnqueueAudioData_block_invoke;
  block[3] = &unk_265222248;
  block[5] = a2;
  block[6] = a1;
  block[4] = &v6;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __AudioSBufSourceEnqueueAudioData_block_invoke(uint64_t a1)
{
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  CMTimeMake(&rhs, Length / *(unsigned int *)(v3 + 48), (int)*(double *)(v3 + 32));
  CMTime lhs = *(CMTime *)(v3 + 112);
  CMTimeAdd(&v11, &lhs, &rhs);
  *(CMTime *)(v3 + 112) = v11;
  memset(&v11, 0, sizeof(v11));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v11, HostTimeClock);
  CFDataRef v6 = *(const __CFData **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  CMTime lhs = v11;
  CMTime v8 = *(CMTime *)(v5 + 112);
  uint64_t result = ausrc_enqueueAudioDataInternal(v5, v6, (long long *)&lhs.value, &v8);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ausrc_enqueueAudioDataInternal(uint64_t a1, CFDataRef theData, long long *a3, CMTime *a4)
{
  if (*(_DWORD *)(a1 + 40) != 1819304813)
  {
    uint64_t v5 = 4294960591;
    goto LABEL_22;
  }
  if (!theData)
  {
    if (!*(unsigned char *)(a1 + 152)) {
      return 0;
    }
    *(unsigned char *)(a1 + 152) = 0;
    uint64_t v16 = MEMORY[0x263F010E0];
    *(_OWORD *)(a1 + 112) = *MEMORY[0x263F010E0];
    *(void *)(a1 + 128) = *(void *)(v16 + 16);
    v17 = *(NSObject **)(a1 + 136);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 0x40000000;
    v20[2] = __ausrc_enqueueAudioDataInternal_block_invoke_2;
    v20[3] = &__block_descriptor_tmp_8;
    v20[4] = a1;
    dispatch_sync(v17, v20);
    CMBufferQueueReset(*(CMBufferQueueRef *)(a1 + 104));
    uint64_t v5 = 0;
    uint64_t v18 = atomic_load((unsigned int *)(a1 + 144));
    if (v18)
    {
      APSLogErrorAt();
      return v18;
    }
    return v5;
  }
  uint64_t v5 = atomic_load((unsigned int *)(a1 + 144));
  if (v5)
  {
LABEL_22:
    APSLogErrorAt();
    return v5;
  }
  CMTime v24 = *a4;
  v26 = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  unint64_t Length = CFDataGetLength(theData);
  unint64_t v8 = *(unsigned int *)(a1 + 48);
  CMItemCount v9 = Length / v8;
  if (Length % v8)
  {
    uint64_t v5 = 4294960591;
LABEL_25:
    APSLogErrorAt();
    goto LABEL_28;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();
  if (BlockBufferWithCFDataNoCopy)
  {
    uint64_t v5 = BlockBufferWithCFDataNoCopy;
    goto LABEL_25;
  }
  uint64_t v12 = *(const opaqueCMFormatDescription **)(a1 + 72);
  CMTime presentationTimeStamp = v24;
  uint64_t v5 = CMAudioSampleBufferCreateReadyWithPacketDescriptions(v10, v26, v12, v9, &presentationTimeStamp, 0, &sampleBufferOut);
  if (!v5)
  {
    CMSampleBufferRef v13 = sampleBufferOut;
    CMSampleBufferRef sampleBufferOut = 0;
    goto LABEL_8;
  }
  APSLogErrorAt();
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
LABEL_28:
  CMSampleBufferRef v13 = 0;
LABEL_8:
  if (v26) {
    CFRelease(v26);
  }
  if (v5)
  {
LABEL_31:
    APSLogErrorAt();
    if (!v13) {
      return v5;
    }
    goto LABEL_15;
  }
  uint64_t v14 = CMBufferQueueEnqueue(*(CMBufferQueueRef *)(a1 + 104), v13);
  if (v14)
  {
    uint64_t v5 = v14;
    goto LABEL_31;
  }
  if (!*(unsigned char *)(a1 + 152))
  {
    *(unsigned char *)(a1 + 152) = 1;
    CFRetain((CFTypeRef)a1);
    uint64_t v15 = *(NSObject **)(a1 + 136);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ausrc_enqueueAudioDataInternal_block_invoke;
    block[3] = &__block_descriptor_tmp_7;
    block[4] = a1;
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    dispatch_async(v15, block);
  }
  uint64_t v5 = 0;
  if (v13) {
LABEL_15:
  }
    CFRelease(v13);
  return v5;
}

uint64_t AudioSBufSourceEnqueueAudioDataWithTimestamps(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, char a5)
{
  uint64_t v12 = 0;
  CMSampleBufferRef v13 = &v12;
  uint64_t v14 = 0x2000000000;
  int v15 = 0;
  uint64_t v5 = *(NSObject **)(a1 + 16);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __AudioSBufSourceEnqueueAudioDataWithTimestamps_block_invoke;
  v8[3] = &unk_265222270;
  v8[4] = &v12;
  v8[5] = a1;
  v8[6] = a4;
  v8[7] = a2;
  long long v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  char v11 = a5;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __AudioSBufSourceEnqueueAudioDataWithTimestamps_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  CMTimeMake(&v7, *(void *)(a1 + 48), (int)*(double *)(v2 + 32));
  *(CMTime *)(v2 + 112) = v7;
  uint64_t v3 = *(void *)(a1 + 40);
  CFDataRef v4 = *(const __CFData **)(a1 + 56);
  CMTime v7 = *(CMTime *)(a1 + 64);
  CMTime v6 = *(CMTime *)(v3 + 112);
  uint64_t result = ausrc_enqueueAudioDataInternal(v3, v4, (long long *)&v7.value, &v6);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void _AudioSBufSourceFinalize(void *a1)
{
  uint64_t v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  uint64_t v3 = (const void *)a1[9];
  if (v3)
  {
    CFRelease(v3);
    a1[9] = 0;
  }
  CFDataRef v4 = (const void *)a1[10];
  if (v4)
  {
    CFRelease(v4);
    a1[10] = 0;
  }
  uint64_t v5 = (const void *)a1[11];
  if (v5)
  {
    CFRelease(v5);
    a1[11] = 0;
  }
  CMTime v6 = (const void *)a1[12];
  if (v6)
  {
    CFRelease(v6);
    a1[12] = 0;
  }
  CMTime v7 = (const void *)a1[13];
  if (v7)
  {
    CFRelease(v7);
    a1[13] = 0;
  }
  unint64_t v8 = a1[17];
  if (v8)
  {
    dispatch_release(v8);
    a1[17] = 0;
  }
  long long v9 = a1[2];
  if (v9)
  {
    dispatch_release(v9);
    a1[2] = 0;
  }
}

void __ausrc_enqueueAudioDataInternal_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_OWORD *)&v16.value = *(_OWORD *)(a1 + 40);
  v16.epoch = *(void *)(a1 + 56);
  uint64_t v3 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v3)
  {
    unsigned int v15 = -6709;
    APSLogErrorAt();
    goto LABEL_25;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F12400], *(const void **)(v2 + 96));
  CMTime time = v16;
  unsigned int v6 = FigCFDictionarySetCMTime();
  if (v6)
  {
    unsigned int v15 = v6;
LABEL_30:
    APSLogErrorAt();
    CFDictionaryRef v9 = 0;
    goto LABEL_21;
  }
  unsigned int v7 = FigEndpointStreamAudioEngineResumeSync();
  if (v7)
  {
    unsigned int v15 = v7;
    goto LABEL_30;
  }
  unsigned int v8 = FigEndpointStreamAudioEngineSetEndpointStreamSync();
  if (v8)
  {
    unsigned int v15 = v8;
    goto LABEL_30;
  }
  CMTime time = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CFDictionaryRef v9 = CMTimeCopyAsDictionary(&time, v4);
  uint64_t CMBaseObject = FigEndpointStreamAudioEngineGetCMBaseObject();
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  CMSampleBufferRef v13 = *(uint64_t (**)(uint64_t, void, CFDictionaryRef))(v12 + 56);
  if (v13)
  {
    unsigned int v14 = v13(CMBaseObject, *MEMORY[0x263F24960], v9);
    if (!v14)
    {
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      unsigned int v15 = 0;
      goto LABEL_21;
    }
    unsigned int v15 = v14;
  }
  else
  {
    unsigned int v15 = -12782;
  }
  APSLogErrorAt();
LABEL_21:
  CFRelease(v3);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v9) {
    CFRelease(v9);
  }
LABEL_25:
  atomic_store(v15, (unsigned int *)(v2 + 144));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t __ausrc_enqueueAudioDataInternal_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = FigEndpointStreamAudioEngineSuspendSync();
  unsigned int v3 = result;
  if (result)
  {
    uint64_t result = APSLogErrorAt();
  }
  else if (gLogCategory_AirPlaySenderKit <= 50)
  {
    if (gLogCategory_AirPlaySenderKit != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  atomic_store(v3, (unsigned int *)(v1 + 144));
  return result;
}

CFTypeRef APMediaSenderFVDSourceCreate()
{
  CFTypeRef v6 = 0;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  FigVirtualDisplaySourceGetClassID();
  if (CMDerivedObjectCreate()) {
    goto LABEL_8;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(DerivedStorage + 112) = 0;
  *(void *)(DerivedStorage + 16) = CFStringCreateF();
  uint64_t v2 = dispatch_queue_create("APMediaSenderFVDSourceQueue", 0);
  *(void *)(DerivedStorage + 8) = v2;
  unsigned int v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, v2);
  *(void *)(DerivedStorage + 80) = v3;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __APMediaSenderFVDSourceCreate_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  handler[4] = DerivedStorage;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(DerivedStorage + 80), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  dispatch_resume(*(dispatch_object_t *)(DerivedStorage + 80));
  *(unsigned char *)(DerivedStorage + 116) = 1;
  if (VTPixelTransferSessionCreate(v0, (VTPixelTransferSessionRef *)(DerivedStorage + 24)))
  {
LABEL_8:
    APSLogErrorAt();
    if (v6)
    {
      CFRelease(v6);
      return 0;
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50 {
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return v6;
}

uint64_t __APMediaSenderFVDSourceCreate_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 88))
  {
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(__CVBuffer **)(v1 + 96);
    uint64_t v3 = *(void *)(v1 + 104);
    return fvdsrc_submitPixelBufferInternal(v1, v2, v3);
  }
  else
  {
    return APSLogErrorAt();
  }
}

uint64_t APMediaSenderFDVSourceSetDisplayInfoBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && a3)
  {
    CFTypeRef v6 = *(NSObject **)(DerivedStorage + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __APMediaSenderFDVSourceSetDisplayInfoBlock_block_invoke;
    block[3] = &unk_2652222F8;
    block[4] = a3;
    void block[5] = DerivedStorage;
    block[6] = a2;
    dispatch_sync(v6, block);
    return 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294955226;
  }
}

void __APMediaSenderFDVSourceSetDisplayInfoBlock_block_invoke(void *a1)
{
  uint64_t v2 = (const void *)a1[4];
  if (v2) {
    uint64_t v3 = _Block_copy(v2);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = a1[5];
  uint64_t v5 = *(const void **)(v4 + 32);
  if (v5)
  {
    _Block_release(v5);
    uint64_t v4 = a1[5];
  }
  *(void *)(v4 + 32) = v3;
  if (a1[6]) {
    CFTypeRef v6 = a1[6];
  }
  else {
    CFTypeRef v6 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v6);
  uint64_t v7 = a1[5];
  unsigned int v8 = *(NSObject **)(v7 + 40);
  if (v8)
  {
    dispatch_release(v8);
    uint64_t v7 = a1[5];
  }
  *(void *)(v7 + 40) = v6;
}

uint64_t APMediaSenderFDVSourceSetWritebackMode(uint64_t a1, char a2)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderFDVSourceSetWritebackMode_block_invoke;
  block[3] = &unk_265222320;
  char v8 = a2;
  block[4] = &v9;
  void block[5] = DerivedStorage;
  dispatch_sync(v4, block);
  uint64_t v5 = 0;
  if (*((_DWORD *)v10 + 6))
  {
    APSLogErrorAt();
    uint64_t v5 = *((unsigned int *)v10 + 6);
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __APMediaSenderFDVSourceSetWritebackMode_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(_DWORD *)(v1 + 112))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -12070;
  }
  else
  {
    *(unsigned char *)(v1 + 116) = *(unsigned char *)(result + 48);
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

uint64_t APMediaSenderFDVSourceSubmitPixelBuffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFTypeRef v6 = *(NSObject **)(DerivedStorage + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = __APMediaSenderFDVSourceSubmitPixelBuffer_block_invoke;
  v9[3] = &unk_265222348;
  v9[4] = &v10;
  v9[5] = DerivedStorage;
  v9[6] = a2;
  v9[7] = a3;
  dispatch_sync(v6, v9);
  uint64_t v7 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __APMediaSenderFDVSourceSubmitPixelBuffer_block_invoke(uint64_t a1)
{
  uint64_t result = fvdsrc_submitPixelBufferInternal(*(void *)(a1 + 40), *(CVPixelBufferRef *)(a1 + 48), *(void *)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t fvdsrc_submitPixelBufferInternal(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  CVPixelBufferRef destinationBuffer = 0;
  int v6 = *(_DWORD *)(a1 + 112);
  if (v6 == 2)
  {
    if (pixelBuffer)
    {
      if (*(unsigned char *)(a1 + 116))
      {
        uint64_t v7 = *(void *)a1;
        size_t Width = CVPixelBufferGetWidth(pixelBuffer);
        size_t Height = CVPixelBufferGetHeight(pixelBuffer);
        uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v10) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = 0;
        }
        v17 = *(uint64_t (**)(uint64_t, void, uint64_t, CVPixelBufferRef *, double, double))(v11 + 88);
        if (!v17)
        {
          unsigned int v30 = -12782;
          goto LABEL_28;
        }
        unsigned int v18 = v17(v7, 0, 1, &destinationBuffer, (double)Width, (double)Height);
        if (v18)
        {
          unsigned int v30 = v18;
          goto LABEL_28;
        }
        OSStatus v19 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 24), pixelBuffer, destinationBuffer);
        if (v19)
        {
          unsigned int v30 = v19;
          goto LABEL_28;
        }
        CMTime v16 = destinationBuffer;
      }
      else
      {
        CMTime v16 = (__CVBuffer *)CFRetain(pixelBuffer);
        CVPixelBufferRef destinationBuffer = v16;
      }
      double v20 = (double)CVPixelBufferGetWidth(v16);
      size_t v21 = CVPixelBufferGetHeight(destinationBuffer);
      double v22 = (double)v21;
      double v23 = *(double *)(a1 + 48);
      double v24 = *(double *)(a1 + 56);
      double v25 = v23 / v20;
      if (v23 / v20 >= v24 / (double)v21) {
        double v25 = v24 / (double)v21;
      }
      double v26 = (1.0 - *(double *)(a1 + 64)) * v25;
      double v14 = v26 * v20;
      double v15 = v26 * v22;
      double v12 = (v23 - v26 * v20) * 0.5;
      double v13 = (v24 - v26 * v22) * 0.5;
      double v27 = 0.0;
      CVPixelBufferRef v28 = destinationBuffer;
      double v29 = 0.0;
    }
    else
    {
      double v12 = *MEMORY[0x263F001A8];
      double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        double v41 = *(double *)(a1 + 16);
        LogPrintF();
      }
      CVPixelBufferRef v28 = 0;
      double v22 = v15;
      double v20 = v14;
      double v27 = v13;
      double v29 = v12;
    }
    uint64_t v31 = *(void *)a1;
    uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v32) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0;
    }
    v34 = *(uint64_t (**)(uint64_t, CVPixelBufferRef, uint64_t, void, void, double, double, double, double, double, double, double, double, double))(v33 + 80);
    if (v34)
    {
      unsigned int v35 = v34(v31, v28, a3, 0, 0, v29, v27, v20, v22, v12, v13, v14, v15, v41);
      if (!v35)
      {
LABEL_26:
        fvdsrc_stopRetrying(a1);
        uint64_t v36 = 0;
        goto LABEL_39;
      }
      unsigned int v30 = v35;
    }
    else
    {
      unsigned int v30 = -12782;
    }
  }
  else
  {
    if (!v6)
    {
      APSLogErrorAt();
      goto LABEL_26;
    }
    unsigned int v30 = -12072;
  }
LABEL_28:
  APSLogErrorAt();
  v37 = *(NSObject **)(a1 + 80);
  dispatch_time_t v38 = dispatch_time(0, 50000000);
  dispatch_source_set_timer(v37, v38, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  v39 = *(const void **)(a1 + 96);
  *(void *)(a1 + 96) = pixelBuffer;
  if (pixelBuffer) {
    CFRetain(pixelBuffer);
  }
  if (v39) {
    CFRelease(v39);
  }
  *(void *)(a1 + 104) = a3;
  *(unsigned char *)(a1 + 88) = 1;
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v30 == -12073) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v30;
  }
LABEL_39:
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
  return v36;
}

void fvdsrc_finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 112))
  {
    int v1 = gLogCategory_AirPlaySenderKit;
    if (gLogCategory_AirPlaySenderKit <= 100) {
      int v1 = fvdsrc_finalize_cold_2(gLogCategory_AirPlaySenderKit);
    }
    goto LABEL_24;
  }
  int v1 = gLogCategory_AirPlaySenderKit;
  if (*(void *)DerivedStorage)
  {
    while (v1 > 100)
LABEL_24:
      __break(1u);
    fvdsrc_finalize_cold_1(v1);
    __break(1u);
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(NSObject **)(DerivedStorage + 80);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*(dispatch_object_t *)(DerivedStorage + 80));
      *(void *)(DerivedStorage + 80) = 0;
    }
    uint64_t v3 = *(const void **)(DerivedStorage + 32);
    if (v3)
    {
      _Block_release(v3);
      *(void *)(DerivedStorage + 32) = 0;
    }
    uint64_t v4 = *(const void **)(DerivedStorage + 96);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(DerivedStorage + 96) = 0;
    }
    uint64_t v5 = *(const void **)(DerivedStorage + 24);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(DerivedStorage + 24) = 0;
    }
    int v6 = *(const void **)(DerivedStorage + 16);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(DerivedStorage + 16) = 0;
    }
    uint64_t v7 = *(NSObject **)(DerivedStorage + 40);
    if (v7)
    {
      dispatch_release(v7);
      *(void *)(DerivedStorage + 40) = 0;
    }
    char v8 = *(NSObject **)(DerivedStorage + 8);
    if (v8)
    {
      dispatch_release(v8);
      *(void *)(DerivedStorage + 8) = 0;
    }
  }
}

uint64_t fvdsrc_copyProperty(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  if (!CFEqual((CFTypeRef)*MEMORY[0x263F12548], a2)) {
    return 4294954512;
  }
  CFTypeRef v5 = CFRetain(@"APMediaSenderFVDSource");
  uint64_t result = 0;
  *a4 = v5;
  return result;
}

uint64_t fvdsrc_setProperty()
{
  return 4294954512;
}

uint64_t fvdsrc_plugProcessor(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __fvdsrc_plugProcessor_block_invoke;
    block[3] = &unk_265222370;
    void block[5] = DerivedStorage;
    void block[6] = a2;
    block[4] = &v8;
    dispatch_sync(v4, block);
    if (*((_DWORD *)v9 + 6))
    {
      APSLogErrorAt();
      uint64_t v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    uint64_t v5 = 4294955226;
    *((_DWORD *)v9 + 6) = -12070;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t fvdsrc_unplugProcessor(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __fvdsrc_unplugProcessor_block_invoke;
    block[3] = &unk_265222398;
    void block[5] = DerivedStorage;
    void block[6] = a2;
    block[4] = &v8;
    dispatch_sync(v4, block);
    if (*((_DWORD *)v9 + 6))
    {
      APSLogErrorAt();
      uint64_t v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    uint64_t v5 = 4294955226;
    *((_DWORD *)v9 + 6) = -12070;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t fvdsrc_start(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __fvdsrc_start_block_invoke;
  block[3] = &unk_2652223C0;
  block[4] = &v8;
  void block[5] = DerivedStorage;
  void block[6] = a2;
  dispatch_sync(v4, block);
  uint64_t v5 = 0;
  if (*((_DWORD *)v9 + 6))
  {
    APSLogErrorAt();
    uint64_t v5 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t fvdsrc_stop()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v1 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __fvdsrc_stop_block_invoke;
  block[3] = &__block_descriptor_tmp_21;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  return 0;
}

uint64_t fvdsrc_suspend()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v1 = *(NSObject **)(DerivedStorage + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __fvdsrc_suspend_block_invoke;
  v4[3] = &unk_265222430;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t fvdsrc_resume()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v1 = *(NSObject **)(DerivedStorage + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __fvdsrc_resume_block_invoke;
  v4[3] = &unk_265222458;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFTypeRef *__fvdsrc_plugProcessor_block_invoke(CFTypeRef *result)
{
  int v1 = result;
  uint64_t v2 = result[5];
  if (v2[28] || *(void *)v2)
  {
    *(_DWORD *)(*((void *)result[4] + 1) + 24) = -12073;
  }
  else
  {
    uint64_t result = (CFTypeRef *)CFRetain(result[6]);
    *(void *)v1[5] = v1[6];
  }
  return result;
}

void __fvdsrc_unplugProcessor_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (!*(_DWORD *)(v2 + 112) && (uint64_t v3 = *(const void **)v2, *(void *)v2 == a1[6]))
  {
    if (v3)
    {
      CFRelease(v3);
      *(void *)a1[5] = 0;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -12070;
  }
}

void __fvdsrc_start_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  if (*((_DWORD *)v2 + 28) || (uint64_t v3 = *v2) == 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12070;
    return;
  }
  CFTypeRef v27 = 0;
  CFTypeRef v28 = 0;
  long long v25 = xmmword_2478120B0;
  int v24 = 60;
  char v23 = 0;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  unsigned int v26 = 0;
  int v6 = *(uint64_t (**)(uint64_t, CFTypeRef *, CFTypeRef *))(v5 + 56);
  if (v6)
  {
    int v7 = v6(v3, &v28, &v27);
    if (v7)
    {
      int v12 = v7;
    }
    else
    {
      int v8 = FigDisplayModes_LookupTimingModeIDByIndex();
      if (v8)
      {
        int v12 = v8;
      }
      else
      {
        uint64_t v9 = *v2;
        uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v10) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = 0;
        }
        double v13 = *(uint64_t (**)(uint64_t, void, void))(v11 + 64);
        if (v13)
        {
          int v14 = v13(v9, v26, v26);
          if (v14)
          {
            int v12 = v14;
          }
          else
          {
            int DimensionsFromTimingMode = FigDisplayModes_ExtractDimensionsFromTimingMode();
            if (!DimensionsFromTimingMode)
            {
              FigDisplayModes_ExtractOverscanInfoFromTimingMode();
              FigDisplayModes_ExtractVSyncRateFromTimingMode();
              *((_OWORD *)v2 + 3) = v25;
              int v16 = v24;
              *((_DWORD *)v2 + 18) = v24;
              v2[8] = 0;
              uint64_t v17 = v2[4];
              if (v17)
              {
                unsigned int v18 = v2[5];
                block[0] = MEMORY[0x263EF8330];
                block[1] = 0x40000000;
                block[2] = __fvdsrc_init_block_invoke;
                block[3] = &unk_2652223E8;
                block[4] = v17;
                long long v21 = v25;
                int v22 = v16;
                dispatch_async(v18, block);
              }
              if (gLogCategory_AirPlaySenderKit <= 50
                && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              int v12 = 0;
              goto LABEL_25;
            }
            int v12 = DimensionsFromTimingMode;
          }
        }
        else
        {
          int v12 = -12782;
        }
      }
    }
  }
  else
  {
    int v12 = -12782;
  }
  APSLogErrorAt();
LABEL_25:
  if (v28) {
    CFRelease(v28);
  }
  if (v27) {
    CFRelease(v27);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v12;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    LOBYTE(block[0]) = 0;
    FigCFDictionaryGetBooleanIfPresent();
    if (LOBYTE(block[0])) {
      int v19 = 1;
    }
    else {
      int v19 = 2;
    }
    *(_DWORD *)(*(void *)(a1 + 40) + 112) = v19;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __fvdsrc_init_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), (int)*(double *)(a1 + 40), (int)*(double *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

void __fvdsrc_stop_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 112))
  {
    fvdsrc_stopRetrying(v2);
    *(_DWORD *)(*(void *)(a1 + 32) + 112) = 0;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void fvdsrc_stopRetrying(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    uint64_t v2 = *(const void **)(a1 + 96);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 96) = 0;
    }
    *(void *)(a1 + 104) = 0;
    *(unsigned char *)(a1 + 88) = 0;
  }
}

uint64_t __fvdsrc_suspend_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(_DWORD *)(v2 + 112))
  {
    *(_DWORD *)(v2 + 112) = 1;
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90)
    {
      if (gLogCategory_AirPlaySenderKit != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
        uint64_t result = LogPrintF();
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = -12070;
  }
  return result;
}

uint64_t __fvdsrc_resume_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(_DWORD *)(v2 + 112) == 1)
  {
    *(_DWORD *)(v2 + 112) = 2;
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90)
    {
      if (gLogCategory_AirPlaySenderKit != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
        uint64_t result = LogPrintF();
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = -12070;
  }
  return result;
}

void sub_247807DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_247809118(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_24780AA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, id *a14, id *a15)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v16 - 112));
  _Unwind_Resume(a1);
}

void remoteSessionHandleDeadConnection(void *a1)
{
  uint64_t v1 = a1;
  if (gLogCategory_AirPlaySenderKit <= 100
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = v1[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __remoteSessionHandleDeadConnection_block_invoke;
  block[3] = &unk_2652224A8;
  id v5 = v1;
  uint64_t v3 = v1;
  dispatch_sync(v2, block);
}

uint64_t remoteSessionHandleServerMessage(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t OpCode = FigXPCMessageGetOpCode();
  if (OpCode)
  {
    uint64_t v7 = OpCode;
    APSLogErrorAt();
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = 4294960591;
  }

  return v7;
}

void remoteSessionHandleServerDeath()
{
  if (gLogCategory_AirPlaySenderKit <= 100
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sRemoteClientLock);
  if (sRemoteClient)
  {
    CFRelease((CFTypeRef)sRemoteClient);
    sRemoteClient = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sRemoteClientLock);
}

void __remoteSessionHandleDeadConnection_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = 0;
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      int v6 = v5[2];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __remoteSessionHandleDeadConnection_block_invoke_2;
      block[3] = &unk_2652224A8;
      int v8 = v5;
      dispatch_async(v6, block);
    }
  }
}

void __remoteSessionHandleDeadConnection_block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained sessionDidFail:*(void *)(a1 + 32) withError:4294896154];
}

uint64_t APSKServiceSerializeFrame(__CVBuffer *a1, uint64_t a2, void *a3)
{
  long long v14 = 0u;
  long long v15 = 0u;
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v7 = empty;
  uint64_t bytes = a2;
  if (!a1)
  {
    xpc_dictionary_set_data(empty, "data", &bytes, 0x28uLL);
    goto LABEL_9;
  }
  IOSurface = CVPixelBufferGetIOSurface(a1);
  if (IOSurface)
  {
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
    if (XPCObject)
    {
      xpc_dictionary_set_value(v7, "surface", XPCObject);
      CVPixelBufferGetExtendedPixels(a1, (size_t *)&v14, (size_t *)&v14 + 1, (size_t *)&v15, (size_t *)&v15 + 1);
      CFDictionaryRef v10 = CVBufferCopyAttachments(a1, kCVAttachmentMode_ShouldPropagate);
      xpc_dictionary_set_data(v7, "data", &bytes, 0x28uLL);
      if (v10)
      {
        uint64_t v11 = FigXPCMessageSetCFDictionary();
        if (v11) {
          APSLogErrorAt();
        }
        else {
          *a3 = v7;
        }
        CFRelease(v10);
        goto LABEL_10;
      }
LABEL_9:
      uint64_t v11 = 0;
      *a3 = v7;
      goto LABEL_10;
    }
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v11 = 4294960534;
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v11 = 4294960591;
  }
LABEL_10:
  FigXPCRelease();
  FigXPCRelease();
  return v11;
}

uint64_t APSKServiceDeserializeFrame(void *a1, CVPixelBufferRef *a2, void *a3)
{
  size_t length = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  data = xpc_dictionary_get_data(a1, "data", &length);
  if (!data)
  {
    if (gLogCategory_AirPlaySenderKit > 90
      || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_36;
    }
LABEL_35:
    LogPrintF();
LABEL_36:
    CFDictionaryRef Mutable = 0;
    uint64_t v15 = 4294960591;
    goto LABEL_23;
  }
  if (length != 40)
  {
    if (gLogCategory_AirPlaySenderKit > 90
      || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  uint64_t v7 = data;
  xpc_object_t value = xpc_dictionary_get_value(a1, "surface");
  if (!value)
  {
    uint64_t v15 = 0;
    CFDictionaryRef Mutable = 0;
    *a3 = *v7;
    *a2 = 0;
    CVPixelBufferRef pixelBufferOut = 0;
    goto LABEL_23;
  }
  IOSurfaceRef v9 = IOSurfaceLookupFromXPCObject(value);
  if (!v9)
  {
    if (gLogCategory_AirPlaySenderKit > 90
      || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  CFDictionaryRef v10 = v9;
  uint64_t v11 = FigXPCMessageCopyCFDictionary();
  if (v11)
  {
    uint64_t v15 = v11;
    APSLogErrorAt();
    CFDictionaryRef Mutable = 0;
  }
  else
  {
    if (v7[1] || v7[2] || v7[3] || v7[4])
    {
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v7[1]) {
        FigCFDictionarySetInt64();
      }
      if (v7[2]) {
        FigCFDictionarySetInt64();
      }
      if (v7[3]) {
        FigCFDictionarySetInt64();
      }
      if (v7[4]) {
        FigCFDictionarySetInt64();
      }
    }
    else
    {
      CFDictionaryRef Mutable = 0;
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    }
    uint64_t v14 = CVPixelBufferCreateWithIOSurface(v12, v10, Mutable, &pixelBufferOut);
    if (v14)
    {
      uint64_t v15 = v14;
      APSLogErrorAt();
    }
    else
    {
      uint64_t v15 = 0;
      *a3 = *v7;
      *a2 = pixelBufferOut;
      CVPixelBufferRef pixelBufferOut = 0;
    }
  }
  CFRelease(v10);
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
LABEL_23:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v15;
}

uint64_t APMediaSenderGetTypeID()
{
  if (APMediaSenderGetTypeID_once != -1) {
    dispatch_once(&APMediaSenderGetTypeID_once, &__block_literal_global);
  }
  return APMediaSenderGetTypeID_typeID;
}

uint64_t __APMediaSenderGetTypeID_block_invoke()
{
  APMediaSenderGetTypeID_frameSenderClass = 0;
  unk_269264290 = "APMediaSender";
  qword_269264298 = 0;
  unk_2692642A0 = 0;
  qword_2692642A8 = (uint64_t)sender_finalize;
  unk_2692642B0 = 0;
  qword_2692642B8 = 0;
  unk_2692642C0 = 0;
  qword_2692642C8 = (uint64_t)sender_copyDebugDescription;
  uint64_t result = _CFRuntimeRegisterClass();
  APMediaSenderGetTypeID_typeID = result;
  return result;
}

void sender_finalize(uint64_t a1)
{
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(unsigned char *)(a1 + 182))
  {
    if (gLogCategory_AirPlaySenderKit <= 100) {
      sender_finalize_cold_1(gLogCategory_AirPlaySenderKit);
    }
    __break(1u);
  }
  else
  {
    uint64_t v2 = *(const void **)(a1 + 120);
    if (v2)
    {
      _Block_release(v2);
      *(void *)(a1 + 120) = 0;
    }
    id v3 = *(const void **)(a1 + 128);
    if (v3)
    {
      _Block_release(v3);
      *(void *)(a1 + 128) = 0;
    }
    if (*(void *)(a1 + 136))
    {
      FigSimpleMutexDestroy();
      *(void *)(a1 + 136) = 0;
    }
    char v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 40) = 0;
    }
    id v5 = *(const void **)(a1 + 32);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 32) = 0;
    }
    int v6 = *(const void **)(a1 + 48);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 48) = 0;
    }
    uint64_t v7 = *(const void **)(a1 + 56);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 56) = 0;
    }
    int v8 = *(const void **)(a1 + 104);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a1 + 104) = 0;
    }
    IOSurfaceRef v9 = *(const void **)(a1 + 112);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(a1 + 112) = 0;
    }
    CFDictionaryRef v10 = *(NSObject **)(a1 + 152);
    if (v10)
    {
      dispatch_release(v10);
      *(void *)(a1 + 152) = 0;
    }
    uint64_t v11 = *(NSObject **)(a1 + 144);
    if (v11)
    {
      dispatch_release(v11);
      *(void *)(a1 + 144) = 0;
    }
    CFAllocatorRef v12 = *(NSObject **)(a1 + 24);
    if (v12)
    {
      dispatch_release(v12);
      *(void *)(a1 + 24) = 0;
    }
    double v13 = *(NSObject **)(a1 + 16);
    if (v13)
    {
      dispatch_release(v13);
      *(void *)(a1 + 16) = 0;
    }
  }
}

CFStringRef sender_copyDebugDescription(uint64_t a1)
{
  ASPrintF();
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  id v3 = "yes";
  if (!*(unsigned char *)(a1 + 182)) {
    id v3 = "no";
  }
  CFStringRef v4 = CFStringCreateWithFormat(v2, 0, @"<APMediaSender %p %s>{ active: %s, usage modes: 0x%x }", a1, 0, v3, *(unsigned int *)(a1 + 168));
  free(0);
  return v4;
}

void *APMediaSenderCreate()
{
  if (APMediaSenderGetTypeID_once != -1) {
    dispatch_once(&APMediaSenderGetTypeID_once, &__block_literal_global);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v1 = (void *)Instance;
  if (!Instance) {
    goto LABEL_11;
  }
  *(_OWORD *)(Instance + 32) = 0u;
  *(void *)(Instance + 176) = 0;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(void *)(Instance + 16) = dispatch_queue_create("APMediaSenderQueue", 0);
  v1[3] = dispatch_queue_create("APMediaSenderCallbackQueue", 0);
  v1[19] = dispatch_semaphore_create(0);
  v1[17] = FigSimpleMutexCreate();
  if (APEndpointManagerCreate()) {
    goto LABEL_11;
  }
  CFTypeRef v2 = APMediaSenderFVDSourceCreate();
  v1[6] = v2;
  if (v2)
  {
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
LABEL_11:
    APSLogErrorAt();
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v1)
    {
      CFRelease(v1);
      return 0;
    }
  }
  return v1;
}

uint64_t APMediaSenderSetAuthBlock(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  CFTypeRef v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderSetAuthBlock_block_invoke;
  block[3] = &unk_2652226E8;
  void block[5] = &v6;
  void block[6] = a1;
  void block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __APMediaSenderSetAuthBlock_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    uint64_t v3 = (const void *)a1[4];
    if (v3)
    {
      CFStringRef v4 = _Block_copy(v3);
      uint64_t v2 = a1[6];
    }
    else
    {
      CFStringRef v4 = 0;
    }
    id v5 = *(const void **)(v2 + 120);
    if (v5)
    {
      _Block_release(v5);
      uint64_t v2 = a1[6];
    }
    *(void *)(v2 + 120) = v4;
  }
}

uint64_t APMediaSenderSetFailureBlock(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderSetFailureBlock_block_invoke;
  block[3] = &unk_265222710;
  void block[5] = &v6;
  void block[6] = a1;
  void block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __APMediaSenderSetFailureBlock_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    uint64_t v3 = (const void *)a1[4];
    if (v3)
    {
      CFStringRef v4 = _Block_copy(v3);
      uint64_t v2 = a1[6];
    }
    else
    {
      CFStringRef v4 = 0;
    }
    id v5 = *(const void **)(v2 + 128);
    if (v5)
    {
      _Block_release(v5);
      uint64_t v2 = a1[6];
    }
    *(void *)(v2 + 128) = v4;
  }
}

uint64_t APMediaSenderSetDisplayInfoUpdateBlock(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderSetDisplayInfoUpdateBlock_block_invoke;
  block[3] = &unk_265222738;
  void block[5] = &v6;
  void block[6] = a1;
  void block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __APMediaSenderSetDisplayInfoUpdateBlock_block_invoke(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6709;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = APMediaSenderFDVSourceSetDisplayInfoBlock(*(void *)(v2 + 48), *(void *)(v2 + 24), a1[4]);
    uint64_t result = *(unsigned int *)(*(void *)(a1[5] + 8) + 24);
    if (!result) {
      return result;
    }
  }
  return APSLogErrorAt();
}

uint64_t APMediaSenderSetVideoPassthroughMode(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __APMediaSenderSetVideoPassthroughMode_block_invoke;
  v4[3] = &unk_265222760;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __APMediaSenderSetVideoPassthroughMode_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -6709;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = APMediaSenderFDVSourceSetWritebackMode(*(void *)(v2 + 48), 0);
    uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (!result)
    {
      if (gLogCategory_AirPlaySenderKit <= 50)
      {
        if (gLogCategory_AirPlaySenderKit != -1) {
          return LogPrintF();
        }
        uint64_t result = _LogCategory_Initialize();
        if (result) {
          return LogPrintF();
        }
      }
      return result;
    }
  }
  return APSLogErrorAt();
}

uint64_t APMediaSenderSetVideoOverrides(uint64_t a1, CFTypeRef cf)
{
  uint64_t v9 = 0;
  CFDictionaryRef v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = 0;
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
    {
      if (IsAppleInternalBuild())
      {
        uint64_t v5 = *(NSObject **)(a1 + 16);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = __APMediaSenderSetVideoOverrides_block_invoke;
        block[3] = &unk_265222788;
        void block[4] = &v9;
        void block[5] = a1;
        void block[6] = cf;
        dispatch_sync(v5, block);
      }
    }
  }
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __APMediaSenderSetVideoOverrides_block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (*(unsigned char *)(v1 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    uint64_t v2 = *(const void **)(v1 + 104);
    uint64_t v3 = (const void *)a1[6];
    *(void *)(v1 + 104) = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (v2) {
      CFRelease(v2);
    }
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t APMediaSenderSetAudioDescription(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  if (a2)
  {
    uint64_t v3 = *(NSObject **)(a1 + 16);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = __APMediaSenderSetAudioDescription_block_invoke;
    v6[3] = &unk_2652227B0;
    v6[4] = &v8;
    v6[5] = a1;
    v6[6] = a2;
    char v7 = a3;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v9 + 6);
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __APMediaSenderSetAudioDescription_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(unsigned char *)(v1 + 182))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  else
  {
    uint64_t v2 = *(long long **)(result + 48);
    long long v3 = *v2;
    long long v4 = v2[1];
    *(void *)(v1 + 96) = *((void *)v2 + 4);
    *(_OWORD *)(v1 + 64) = v3;
    *(_OWORD *)(v1 + 80) = v4;
    *(unsigned char *)(*(void *)(result + 40) + 180) = *(unsigned char *)(result + 56);
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

uint64_t APMediaSenderSetAuthString(uint64_t a1, const void *a2)
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = 0;
  MEMORY[0x24C55F6E0](*(void *)(a1 + 136));
  long long v4 = *(NSObject **)(a1 + 144);
  if (v4)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 144));
    uint64_t v5 = *(const void **)(a1 + 112);
    *(void *)(a1 + 112) = a2;
    if (a2) {
      CFRetain(a2);
    }
    if (v5) {
      CFRelease(v5);
    }
    MEMORY[0x24C55F6F0](*(void *)(a1 + 136));
    dispatch_semaphore_signal(v4);
    dispatch_release(v4);
  }
  else
  {
    MEMORY[0x24C55F6F0](*(void *)(a1 + 136));
    uint64_t v6 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __APMediaSenderSetAuthString_block_invoke;
    block[3] = &unk_2652227D8;
    void block[4] = &v10;
    void block[5] = a1;
    void block[6] = a2;
    dispatch_sync(v6, block);
  }
  if (*((_DWORD *)v11 + 6))
  {
    APSLogErrorAt();
    uint64_t v7 = *((unsigned int *)v11 + 6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __APMediaSenderSetAuthString_block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (*(unsigned char *)(v1 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
  }
  else
  {
    uint64_t v2 = *(const void **)(v1 + 112);
    long long v3 = (const void *)a1[6];
    *(void *)(v1 + 112) = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

void APMediaSenderStart(uint64_t a1, CFTypeRef cf, int a3, int a4, int a5, uint64_t a6)
{
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v12 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderStart_block_invoke;
  block[3] = &unk_265222828;
  int v14 = a4;
  int v15 = a5;
  void block[5] = a1;
  void block[6] = cf;
  int v16 = a3;
  void block[4] = a6;
  dispatch_async(v12, block);
}

void __APMediaSenderStart_block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  intptr_t v3 = *(void *)(a1 + 40);
  *(_DWORD *)(v3 + 168) = v2;
  int v4 = *(_DWORD *)(a1 + 60);
  if (!v4) {
    int v4 = 30;
  }
  *(_DWORD *)(v3 + 172) = v4;
  CFMutableDictionaryRef v5 = *(CFMutableDictionaryRef *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 64);
  CFTypeRef v58 = 0;
  CFTypeRef cf = 0;
  memset(v57, 0, sizeof(v57));
  if (!v5)
  {
    int v12 = -6705;
LABEL_104:
    APSLogErrorAt();
    goto LABEL_117;
  }
  if (*(unsigned char *)(v3 + 182))
  {
    int v12 = -6709;
LABEL_65:
    APSLogErrorAt();
    CFMutableDictionaryRef v5 = 0;
    goto LABEL_117;
  }
  if ((v2 & 3) == 0)
  {
    int v12 = -6705;
    goto LABEL_65;
  }
  switch(v6)
  {
    case 0:
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFStringGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v69 = 0;
      v70 = &v69;
      uint64_t v71 = 0x2000000000;
      int v72 = 0;
      CFTypeRef v67 = 0;
      v68 = 0;
      CFTypeRef v66 = 0;
      TestInfoDictionary = (__CFDictionary *)APAdvertiserInfoCreateTestInfoDictionary();
      CFDictionarySetValue(TestInfoDictionary, (const void *)*MEMORY[0x263F20BE8], v5);
      int v14 = (void *)CFDictionaryCopyCString();
      if (*((_DWORD *)v70 + 6))
      {
        APSLogErrorAt();
        CFDictionaryRef Mutable = 0;
        CFMutableDictionaryRef v21 = 0;
        goto LABEL_75;
      }
      TextToHardwareAddressScalar();
      CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      int v16 = APAdvertiserInfoCreate();
      *((_DWORD *)v70 + 6) = v16;
      if (v16)
      {
        APSLogErrorAt();
        CFDictionaryRef Mutable = 0;
LABEL_163:
        CFMutableDictionaryRef v21 = 0;
        goto LABEL_75;
      }
      CFArrayRef theArray = (CFArrayRef)MEMORY[0x263EF8330];
      uint64_t v61 = 0x40000000;
      v62 = __createEndpointForNetworkAddress_block_invoke;
      v63 = &unk_2652228E8;
      v64 = &v69;
      v65 = v68;
      CFDictionaryApplyBlock();
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(v15, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetInt64();
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F20BF8], v68);
      unsigned int v18 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F20C00], (const void *)*MEMORY[0x263EFFB40]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F20C08], v18);
      int v19 = APSNetworkAddressCreateWithString();
      *((_DWORD *)v70 + 6) = v19;
      if (v19 || (int v20 = APTransportDeviceCreateWithNetworkAddress(), (*((_DWORD *)v70 + 6) = v20) != 0))
      {
        APSLogErrorAt();
        goto LABEL_163;
      }
      CFMutableDictionaryRef v21 = CFDictionaryCreateMutable(v15, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      int v22 = APEndpointCreateWithTransportDevice();
      *((_DWORD *)v70 + 6) = v22;
      if (v22)
      {
        APSLogErrorAt();
      }
      else if (gLogCategory_AirPlaySenderKit <= 50 {
             && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
LABEL_75:
      free(v14);
      if (TestInfoDictionary) {
        CFRelease(TestInfoDictionary);
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v21) {
        CFRelease(v21);
      }
      if (v68) {
        CFRelease(v68);
      }
      if (v67) {
        CFRelease(v67);
      }
      if (v66) {
        CFRelease(v66);
      }
      int v12 = *((_DWORD *)v70 + 6);
      _Block_object_dispose(&v69, 8);
      if (v12) {
        goto LABEL_64;
      }
      CFMutableDictionaryRef v5 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      v34 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(v5, (const void *)*MEMORY[0x263F24988], (const void *)*MEMORY[0x263EFFB40]);
      if (*(unsigned char *)(v3 + 168))
      {
        CFDictionarySetValue(v5, (const void *)*MEMORY[0x263F24970], v34);
        CFDictionarySetValue(v5, (const void *)*MEMORY[0x263F01178], (const void *)*MEMORY[0x263F014B0]);
        CFDictionarySetValue(v5, (const void *)*MEMORY[0x263F24980], *(const void **)(v3 + 48));
        unsigned int v35 = *(const void **)(v3 + 104);
        if (v35) {
          CFDictionarySetValue(v5, (const void *)*MEMORY[0x263F24978], v35);
        }
      }
      if ((*(unsigned char *)(v3 + 168) & 2) != 0)
      {
        if (!*(_DWORD *)(v3 + 72))
        {
          int v12 = -6705;
          goto LABEL_104;
        }
        if (*(unsigned char *)(v3 + 180)) {
          CFDictionarySetValue(v5, (const void *)*MEMORY[0x263F01178], (const void *)*MEMORY[0x263F014B0]);
        }
      }
      uint64_t v36 = *(void *)(v3 + 112);
      if (v36)
      {
        uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
        uint64_t v38 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v38) {
          uint64_t v39 = v38;
        }
        else {
          uint64_t v39 = 0;
        }
        v40 = *(uint64_t (**)(uint64_t, void, uint64_t))(v39 + 56);
        if (!v40)
        {
          int v12 = -12782;
          goto LABEL_104;
        }
        int v41 = v40(CMBaseObject, *MEMORY[0x263F01518], v36);
        if (v41)
        {
          int v12 = v41;
          goto LABEL_104;
        }
      }
      memset((char *)&v57[1] + 8, 0, 40);
      *(void *)&v57[0] = v3;
      *((void *)&v57[0] + 1) = sender_handleAuthRequiredCallback;
      *(void *)&v57[1] = sender_handleEndpointFailure;
      uint64_t v42 = *(void *)(v3 + 40);
      uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v43) {
        uint64_t v44 = v43;
      }
      else {
        uint64_t v44 = 0;
      }
      v45 = *(void (**)(uint64_t, _OWORD *))(v44 + 40);
      if (v45) {
        v45(v42, v57);
      }
      int v46 = FigEndpointActivateSync();
      if (v46)
      {
        int v12 = v46;
        goto LABEL_104;
      }
      int v47 = *(_DWORD *)(v3 + 168);
      if (v47)
      {
        int StreamOfType = FigEndpointCopyFirstStreamOfType();
        if (StreamOfType)
        {
          int v12 = StreamOfType;
          goto LABEL_104;
        }
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        int v49 = FigEndpointStreamResume();
        if (v49)
        {
          int v12 = v49;
          goto LABEL_104;
        }
        int v47 = *(_DWORD *)(v3 + 168);
      }
      if ((v47 & 2) != 0)
      {
        int v50 = FigEndpointCopyFirstStreamOfType();
        if (v50)
        {
          int v12 = v50;
          goto LABEL_104;
        }
        int v51 = AudioSBufSourceCreate((uint64_t)v58, v3 + 64, 0, (uint64_t *)(v3 + 56));
        if (v51)
        {
          int v12 = v51;
          goto LABEL_104;
        }
      }
      int v12 = 0;
      *(unsigned char *)(v3 + 182) = 1;
LABEL_117:
      sender_stopDiscovery(v3);
      if (cf) {
        CFRelease(cf);
      }
      if (v58) {
        CFRelease(v58);
      }
      if (v5) {
        CFRelease(v5);
      }
      if (v12)
      {
        if (gLogCategory_AirPlaySenderKit <= 90
          && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        sender_stopInternal(v3, 0);
        APSLogErrorAt();
      }
      else if (gLogCategory_AirPlaySenderKit <= 50 {
             && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 40) + 176) = v12;
      v52 = *(const void **)(a1 + 48);
      if (v52) {
        CFRelease(v52);
      }
      uint64_t v53 = *(void *)(a1 + 32);
      if (v53)
      {
        v54 = *(NSObject **)(*(void *)(a1 + 40) + 24);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = __APMediaSenderStart_block_invoke_2;
        block[3] = &unk_265222800;
        void block[4] = v53;
        int v56 = v12;
        dispatch_async(v54, block);
      }
      return;
    case 1:
      CFTypeID v11 = CFGetTypeID(v5);
      if (v11 != CFStringGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (gLogCategory_AirPlaySenderKit > 50) {
        goto LABEL_25;
      }
      if (gLogCategory_AirPlaySenderKit != -1)
      {
        CFMutableDictionaryRef v9 = 0;
        goto LABEL_23;
      }
      CFMutableDictionaryRef v9 = 0;
      if (_LogCategory_Initialize()) {
        goto LABEL_23;
      }
      goto LABEL_41;
    case 2:
      CFTypeID v8 = CFGetTypeID(v5);
      if (v8 != CFStringGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (gLogCategory_AirPlaySenderKit > 50)
      {
LABEL_25:
        CFMutableDictionaryRef v9 = 0;
        goto LABEL_41;
      }
      if (gLogCategory_AirPlaySenderKit != -1)
      {
        CFMutableDictionaryRef v9 = 0;
        goto LABEL_23;
      }
      CFMutableDictionaryRef v9 = 0;
      if (_LogCategory_Initialize()) {
        goto LABEL_23;
      }
      goto LABEL_41;
    case 3:
      CFTypeID v10 = CFGetTypeID(v5);
      if (v10 != CFDictionaryGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        CFMutableDictionaryRef v9 = v5;
LABEL_23:
        LogPrintF();
      }
      else
      {
        CFMutableDictionaryRef v9 = v5;
      }
LABEL_41:
      if (sender_startDiscovery_once != -1) {
        dispatch_once(&sender_startDiscovery_once, &__block_literal_global_48);
      }
      unsigned int v23 = *(_DWORD *)(v3 + 172);
      if ((v23 & 0x80000000) != 0) {
        dispatch_time_t v24 = -1;
      }
      else {
        dispatch_time_t v24 = dispatch_time(0, 1000000000 * v23);
      }
      while (1)
      {
        long long v25 = sender_startDiscovery_activationSema;
        dispatch_time_t v26 = dispatch_time(0, 1000000000);
        if (!dispatch_semaphore_wait(v25, v26)) {
          break;
        }
        if (v24 <= dispatch_time(0, 0))
        {
          int v12 = -6722;
          goto LABEL_63;
        }
        if (*(unsigned char *)(v3 + 181))
        {
          int v12 = -6723;
LABEL_63:
          APSLogErrorAt();
          goto LABEL_64;
        }
      }
      *(void *)(v3 + 160) = sender_startDiscovery_activationSema;
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
      if (v9)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
        if (gLogCategory_AirPlaySenderKit > 50
          || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_67;
        }
      }
      else
      {
        uint64_t v27 = *(void *)(v3 + 32);
        uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v28) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = 0;
        }
        unsigned int v30 = *(uint64_t (**)(uint64_t, void, void))(v29 + 8);
        if (!v30)
        {
          int v12 = -12782;
          goto LABEL_63;
        }
        int v31 = v30(v27, *MEMORY[0x263F011B8], 0);
        if (v31)
        {
          int v12 = v31;
          goto LABEL_63;
        }
        if (gLogCategory_AirPlaySenderKit > 50
          || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
        {
LABEL_67:
          CFArrayRef theArray = 0;
          unsigned int v32 = *(_DWORD *)(v3 + 172);
          if ((v32 & 0x80000000) != 0) {
            dispatch_time_t v33 = -1;
          }
          else {
            dispatch_time_t v33 = dispatch_time(0, 1000000000 * v32);
          }
          while (1)
          {
            if (v33 <= dispatch_time(0, 0))
            {
              int v12 = -6722;
              goto LABEL_145;
            }
            if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v3 + 152), v33))
            {
              int v12 = -6722;
              goto LABEL_145;
            }
            if (*(unsigned char *)(v3 + 181)) {
              break;
            }
            FigEndpointManagerCopyEndpointsForType();
          }
          int v12 = -6723;
LABEL_145:
          APSLogErrorAt();
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterRemoveListener();
LABEL_64:
          APSLogErrorAt();
          goto LABEL_65;
        }
      }
      LogPrintF();
      goto LABEL_67;
    default:
      int v12 = -6705;
      goto LABEL_64;
  }
}

uint64_t __APMediaSenderStart_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void APMediaSenderStop(uint64_t a1)
{
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(a1 + 181) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 152));
  MEMORY[0x24C55F6E0](*(void *)(a1 + 136));
  int v2 = *(NSObject **)(a1 + 144);
  if (v2)
  {
    if (*(void *)(a1 + 112))
    {
      CFRelease(*(CFTypeRef *)(a1 + 112));
      *(void *)(a1 + 112) = 0;
      int v2 = *(NSObject **)(a1 + 144);
    }
    dispatch_semaphore_signal(v2);
  }
  MEMORY[0x24C55F6F0](*(void *)(a1 + 136));
  intptr_t v3 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderStop_block_invoke;
  block[3] = &__block_descriptor_tmp_25;
  void block[4] = a1;
  dispatch_sync(v3, block);
}

void __APMediaSenderStop_block_invoke(uint64_t a1)
{
}

void sender_stopInternal(intptr_t a1, int a2)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  sender_stopDiscovery(a1);
  if (*(void *)(a1 + 40))
  {
    FigEndpointDeactivate();
    int v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 40) = 0;
    }
  }
  CFMutableDictionaryRef v5 = *(const void **)(a1 + 56);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 56) = 0;
  }
  if (a2)
  {
    *(_WORD *)(a1 + 181) = 0;
    *(_DWORD *)(a1 + 176) = 0;
  }
}

uint64_t APMediaSenderSubmitPixelBuffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  CFTypeID v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  intptr_t v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = __APMediaSenderSubmitPixelBuffer_block_invoke;
  v6[3] = &unk_265222870;
  v6[4] = &v7;
  v6[5] = a1;
  v6[6] = a2;
  void v6[7] = a3;
  dispatch_sync(v3, v6);
  uint64_t v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __APMediaSenderSubmitPixelBuffer_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 182))
  {
    if (*(unsigned char *)(v2 + 168))
    {
      int v3 = *(_DWORD *)(v2 + 176);
      if (v3)
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v3;
      }
      else
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = APMediaSenderFDVSourceSubmitPixelBuffer(*(void *)(v2 + 48), a1[6], a1[7]);
        uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
        if (!result) {
          return result;
        }
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6705;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
  }
  return APSLogErrorAt();
}

uint64_t APMediaSenderEnqueueAudioData(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderEnqueueAudioData_block_invoke;
  block[3] = &unk_265222898;
  void block[4] = &v6;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __APMediaSenderEnqueueAudioData_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 182))
  {
    uint64_t v3 = *(void *)(v2 + 56);
    if (v3)
    {
      int v4 = *(_DWORD *)(v2 + 176);
      if (v4)
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v4;
      }
      else
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = AudioSBufSourceEnqueueAudioData(v3, a1[6]);
        uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
        if (!result) {
          return result;
        }
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6705;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
  }
  return APSLogErrorAt();
}

uint64_t APMediaSenderEnqueueAudioDataWithTimestamps(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, char a5)
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000;
  int v15 = 0;
  CFMutableDictionaryRef v5 = *(NSObject **)(a1 + 16);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke;
  v8[3] = &unk_2652228C0;
  v8[4] = &v12;
  v8[5] = a1;
  long long v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  v8[6] = a2;
  v8[7] = a4;
  char v11 = a5;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 182))
  {
    uint64_t v3 = *(void *)(v2 + 56);
    if (v3)
    {
      int v4 = *(_DWORD *)(v2 + 176);
      if (!v4)
      {
        uint64_t v5 = *(void *)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 56);
        char v7 = *(unsigned char *)(a1 + 88);
        long long v9 = *(_OWORD *)(a1 + 64);
        uint64_t v10 = *(void *)(a1 + 80);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = AudioSBufSourceEnqueueAudioDataWithTimestamps(v3, v5, &v9, v6, v7);
        uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        if (result) {
          return APSLogErrorAt();
        }
        return result;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -6705;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -6709;
  }
  return APSLogErrorAt();
}

void sender_handleAuthRequiredCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, CFTypeRef, uint64_t, uint64_t), uint64_t a7)
{
  FigCFEqual();
  if (!*(void *)(a4 + 120))
  {
    CFTypeRef v15 = 0;
    if (!a6) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  MEMORY[0x24C55F6E0](*(void *)(a4 + 136));
  *(void *)(a4 + 144) = dispatch_semaphore_create(0);
  char v11 = *(const void **)(a4 + 112);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a4 + 112) = 0;
  }
  MEMORY[0x24C55F6F0](*(void *)(a4 + 136));
  (*(void (**)(void))(*(void *)(a4 + 120) + 16))();
  uint64_t v12 = *(NSObject **)(a4 + 144);
  unsigned int v13 = *(_DWORD *)(a4 + 172);
  if ((v13 & 0x80000000) != 0) {
    dispatch_time_t v14 = -1;
  }
  else {
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * v13);
  }
  dispatch_semaphore_wait(v12, v14);
  MEMORY[0x24C55F6E0](*(void *)(a4 + 136));
  int v16 = *(NSObject **)(a4 + 144);
  if (v16)
  {
    dispatch_release(v16);
    *(void *)(a4 + 144) = 0;
  }
  uint64_t v17 = *(const void **)(a4 + 112);
  if (v17) {
    CFTypeRef v15 = CFRetain(v17);
  }
  else {
    CFTypeRef v15 = 0;
  }
  MEMORY[0x24C55F6F0](*(void *)(a4 + 136));
  if (a6)
  {
LABEL_15:
    if (v15) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 4294950568;
    }
    a6(a1, v15, v18, a7);
  }
LABEL_19:
  if (v15)
  {
    CFRelease(v15);
  }
}

void sender_handleEndpointFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int Int64 = CFDictionaryGetInt64();
  if (gLogCategory_AirPlaySenderKit <= 100
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v6 = *(NSObject **)(a4 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __sender_handleEndpointFailure_block_invoke;
  block[3] = &__block_descriptor_tmp_56;
  if (Int64) {
    int v7 = Int64;
  }
  else {
    int v7 = -6762;
  }
  void block[4] = a4;
  int v9 = v7;
  dispatch_sync(v6, block);
}

void sender_handleEndpointStreamFailure(int a1, const void *a2, int a3, int a4, const __CFDictionary *cf)
{
  CFDictionaryRef Mutable = cf;
  if (cf)
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFDictionaryGetTypeID())
    {
      CFDictionaryGetInt64();
      CFDictionaryGetValue(Mutable, (const void *)*MEMORY[0x263F01558]);
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      FigCFDictionarySetInt32();
    }
    else
    {
      CFDictionaryRef Mutable = 0;
    }
  }
  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"APMediaSender_VideoStreamFailed", a2, Mutable, 1u);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

intptr_t sender_stopDiscovery(intptr_t result)
{
  uint64_t v1 = *(NSObject **)(result + 160);
  if (v1)
  {
    intptr_t v2 = result;
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t, void, void))(v5 + 8);
    if (v6) {
      v6(v3, *MEMORY[0x263F011C0], 0);
    }
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(void *)(v2 + 160) = 0;
    return dispatch_semaphore_signal(v1);
  }
  return result;
}

uint64_t endpointMatchByName(const void *a1, const void *a2)
{
  CFTypeRef cf1 = 0;
  CFAllocatorRef v3 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeID v7 = *(unsigned int (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(v6 + 48);
  if (!v7 || v7(CMBaseObject, *MEMORY[0x263F01510], v3, &cf1))
  {
    APSLogErrorAt();
    uint64_t v8 = 0;
  }
  else
  {
    if (!cf1) {
      return 0;
    }
    uint64_t v8 = CFEqual(cf1, a2);
  }
  if (cf1) {
    CFRelease(cf1);
  }
  return v8;
}

BOOL endpointMatchByID(const void *a1, const __CFString *a2)
{
  CFStringRef theString1 = 0;
  CFAllocatorRef v3 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeID v7 = *(unsigned int (**)(uint64_t, void, CFAllocatorRef, CFStringRef *))(v6 + 48);
  if (!v7 || v7(CMBaseObject, *MEMORY[0x263F014D8], v3, &theString1))
  {
    APSLogErrorAt();
    BOOL v8 = 0;
  }
  else
  {
    if (!theString1) {
      return 0;
    }
    BOOL v8 = CFStringCompare(theString1, a2, 1uLL) == kCFCompareEqualTo;
  }
  if (theString1) {
    CFRelease(theString1);
  }
  return v8;
}

BOOL endpointMatchAssisted(const void *a1)
{
  CFTypeRef cf = 0;
  CFAllocatorRef v1 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(v4 + 48);
  if (v5 && !v5(CMBaseObject, *MEMORY[0x263F014C0], v1, &cf))
  {
    CFTypeRef v6 = cf;
    BOOL v7 = cf == (CFTypeRef)*MEMORY[0x263EFFB40];
    if (!cf) {
      return v7;
    }
    goto LABEL_9;
  }
  APSLogErrorAt();
  BOOL v7 = 0;
  CFTypeRef v6 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v6);
  return v7;
}

uint64_t __createEndpointForNetworkAddress_block_invoke(uint64_t a1)
{
  uint64_t result = APAdvertiserInfoSetProperty();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if (gLogCategory_AirPlaySenderKit <= 90)
    {
      if (gLogCategory_AirPlaySenderKit != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

dispatch_semaphore_t __sender_startDiscovery_block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(1);
  sender_startDiscovery_activationSema = (uint64_t)result;
  return result;
}

intptr_t sender_availableEndpointsChangedCallback(uint64_t a1, uint64_t a2)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a2 + 152));
}

void __sender_handleEndpointFailure_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  if (*(_DWORD *)(v2 + 176)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4)
  {
    uint64_t v5 = *(NSObject **)(v2 + 24);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    v6[2] = __sender_handleEndpointFailure_block_invoke_2;
    v6[3] = &unk_265222930;
    v6[4] = v3;
    int v7 = *(_DWORD *)(a1 + 40);
    dispatch_async(v5, v6);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 176) = *(_DWORD *)(a1 + 40);
}

uint64_t __sender_handleEndpointFailure_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void apsksa_rtDispatchSignalHandler()
{
  uint64_t v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  CFAllocatorRef v1 = (atomic_uint *)v0;
  uint64_t hostTime = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  memset(&v9, 0, sizeof(v9));
  if (v0)
  {
    if (atomic_load((unsigned int *)(v0 + 120)))
    {
      id v3 = 0;
      while (1)
      {
        if ((unint64_t)APSRingBufferGetBytesUsed() <= 0x17 || APSRingBufferDequeueBytes())
        {
LABEL_16:
          APSLogErrorAt();
LABEL_10:

          goto LABEL_11;
        }
        id v4 = objc_alloc(MEMORY[0x263EFF990]);
        uint64_t v5 = (void *)[v4 initWithLength:v12];

        if (!v5)
        {
          APSLogErrorAt();
          goto LABEL_11;
        }
        unint64_t v6 = v12;
        if (APSRingBufferGetBytesUsed() < v6) {
          break;
        }
        id v3 = v5;
        [v3 mutableBytes];
        if (APSRingBufferDequeueBytes()) {
          goto LABEL_16;
        }
        atomic_fetch_add(v1 + 30, 0xFFFFFFFF);
        CMClockMakeHostTimeFromSystemUnits(&v9, hostTime);
        CMTime v8 = v9;
        [(atomic_uint *)v1 enqueueAudioDataWithTimestamps:v3 forHostTime:&v8 forSampleTime:v11 forDiscontinuity:BYTE4(v12)];
        if (!atomic_load((unsigned int *)v1 + 30)) {
          goto LABEL_10;
        }
      }
      APSLogErrorAt();
    }
  }
LABEL_11:
}

void sub_2478102B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_247810660(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t fvdsrc_finalize_cold_1(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

uint64_t fvdsrc_finalize_cold_2(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

uint64_t sender_finalize_cold_1(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

uint64_t APAdvertiserInfoCreate()
{
  return MEMORY[0x270F08BE8]();
}

uint64_t APAdvertiserInfoCreateTestInfoDictionary()
{
  return MEMORY[0x270F08BF0]();
}

uint64_t APAdvertiserInfoSetProperty()
{
  return MEMORY[0x270F08BF8]();
}

uint64_t APEndpointCreateWithTransportDevice()
{
  return MEMORY[0x270F0BAB0]();
}

uint64_t APEndpointManagerCreate()
{
  return MEMORY[0x270F0BAB8]();
}

uint64_t APSLogErrorAt()
{
  return MEMORY[0x270F0BDC8]();
}

uint64_t APSNetworkAddressCreateWithString()
{
  return MEMORY[0x270F0BE00]();
}

uint64_t APSRealTimeSignalCreate()
{
  return MEMORY[0x270F0BF28]();
}

uint64_t APSRealTimeSignalRaise()
{
  return MEMORY[0x270F0BF30]();
}

uint64_t APSRingBufferCreate()
{
  return MEMORY[0x270F0BF48]();
}

uint64_t APSRingBufferDequeueBytes()
{
  return MEMORY[0x270F0BF50]();
}

uint64_t APSRingBufferEnqueueBytes()
{
  return MEMORY[0x270F0BF58]();
}

uint64_t APSRingBufferGetBytesFree()
{
  return MEMORY[0x270F0BF60]();
}

uint64_t APSRingBufferGetBytesUsed()
{
  return MEMORY[0x270F0BF68]();
}

uint64_t APTransportDeviceCreateWithNetworkAddress()
{
  return MEMORY[0x270F08C88]();
}

uint64_t ASPrintF()
{
  return MEMORY[0x270F23BD8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

uint64_t CFDictionaryApplyBlock()
{
  return MEMORY[0x270F23D30]();
}

uint64_t CFDictionaryCopyCString()
{
  return MEMORY[0x270F23D38]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x270F23DA8]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

uint64_t CFStringCreateF()
{
  return MEMORY[0x270F23EE0]();
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7980](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE79A0](allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x270EE79D0]();
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return MEMORY[0x270EE7A60](queue, buf);
}

OSStatus CMBufferQueueReset(CMBufferQueueRef queue)
{
  return MEMORY[0x270EE7A88](queue);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x270EE7A98](hostTime);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x270EE7AA8](retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x270EE7AB8](retstr, hostTime);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x270EE7B80]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x270EE7B88]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x270EE7B90]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x270EE7BA0]();
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE9FC8](buffer, *(void *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x270EE8030]();
}

uint64_t FigCFDictionarySetCMTime()
{
  return MEMORY[0x270EE8098]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x270EE80B0]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x270EE80B8]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x270EE80D0]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x270EE8118]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x270EE8120]();
}

uint64_t FigCreateBlockBufferWithCFDataNoCopy()
{
  return MEMORY[0x270EE8168]();
}

uint64_t FigDisplayModes_ExtractDimensionsFromTimingMode()
{
  return MEMORY[0x270EF5CD8]();
}

uint64_t FigDisplayModes_ExtractOverscanInfoFromTimingMode()
{
  return MEMORY[0x270EF5CE0]();
}

uint64_t FigDisplayModes_ExtractVSyncRateFromTimingMode()
{
  return MEMORY[0x270EF5CE8]();
}

uint64_t FigDisplayModes_LookupTimingModeIDByIndex()
{
  return MEMORY[0x270EF5CF0]();
}

uint64_t FigEndpointActivateSync()
{
  return MEMORY[0x270EE81B0]();
}

uint64_t FigEndpointAudioSourceBufferQueueCreate()
{
  return MEMORY[0x270EF5CF8]();
}

uint64_t FigEndpointAudioSourceGetCMBaseObject()
{
  return MEMORY[0x270EE81B8]();
}

uint64_t FigEndpointCopyFirstStreamOfType()
{
  return MEMORY[0x270EE81C0]();
}

uint64_t FigEndpointDeactivate()
{
  return MEMORY[0x270EE81C8]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x270EE81D8]();
}

uint64_t FigEndpointManagerCopyEndpointsForType()
{
  return MEMORY[0x270EE81E8]();
}

uint64_t FigEndpointStreamAudioEngineGetCMBaseObject()
{
  return MEMORY[0x270EF5D00]();
}

uint64_t FigEndpointStreamAudioEngineResumeSync()
{
  return MEMORY[0x270EF5D08]();
}

uint64_t FigEndpointStreamAudioEngineSetEndpointStreamSync()
{
  return MEMORY[0x270EF5D10]();
}

uint64_t FigEndpointStreamAudioEngineSuspendSync()
{
  return MEMORY[0x270EF5D18]();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return MEMORY[0x270EE81F8]();
}

uint64_t FigEndpointStreamResume()
{
  return MEMORY[0x270EE8208]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x270EE8390]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x270EE8398]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x270EE83A0]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x270EE83A8]();
}

uint64_t FigVirtualDisplaySourceGetClassID()
{
  return MEMORY[0x270EF5DD0]();
}

uint64_t FigXPCCreateBasicMessage()
{
  return MEMORY[0x270EE8440]();
}

uint64_t FigXPCMessageCopyCFDictionary()
{
  return MEMORY[0x270EE8448]();
}

uint64_t FigXPCMessageGetOpCode()
{
  return MEMORY[0x270EE8460]();
}

uint64_t FigXPCMessageSetCFDictionary()
{
  return MEMORY[0x270EE8470]();
}

uint64_t FigXPCMessageSetCFObject()
{
  return MEMORY[0x270EE8478]();
}

uint64_t FigXPCMessageSetCMTime()
{
  return MEMORY[0x270EE8480]();
}

uint64_t FigXPCRelease()
{
  return MEMORY[0x270EE8490]();
}

uint64_t FigXPCRemoteClientAssociateObject()
{
  return MEMORY[0x270EE8498]();
}

uint64_t FigXPCRemoteClientCreateWithXPCService()
{
  return MEMORY[0x270EE84A0]();
}

uint64_t FigXPCRemoteClientDisassociateObject()
{
  return MEMORY[0x270EE84A8]();
}

uint64_t FigXPCRemoteClientSendSyncMessageCreatingReply()
{
  return MEMORY[0x270EE84B0]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E38](xobj);
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t SNPrintF()
{
  return MEMORY[0x270F24678]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x270F24740]();
}

uint64_t TextToHardwareAddressScalar()
{
  return MEMORY[0x270F247B8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
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

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}