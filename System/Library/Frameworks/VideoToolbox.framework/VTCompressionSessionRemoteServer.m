@interface VTCompressionSessionRemoteServer
@end

@implementation VTCompressionSessionRemoteServer

uint64_t __VTCompressionSessionRemoteServer_PrepareToEncodeFrames_block_invoke(uint64_t a1)
{
  OSStatus v2 = VTCompressionSessionPrepareToEncodeFrames(*(VTCompressionSessionRef *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  mach_port_t v4 = *(_DWORD *)(v3 + 40);
  uint64_t v5 = *(void *)(v3 + 48);

  return VTCompressionSessionRemoteCallbackClient_PrepareToEncodeFramesReturn(v4, v5, v2);
}

void __VTCompressionSessionRemoteServer_EncodeFrame_block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 96)) {
    FigMachPortReleaseSendRight_();
  }
  OSStatus v2 = (unsigned int *)MEMORY[0x1E4F14960];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    MEMORY[0x199706B20](*MEMORY[0x1E4F14960], *(void *)(a1 + 80));
  }
  if (*(_DWORD *)(a1 + 100)) {
    MEMORY[0x199706B20](*v2, *(void *)(a1 + 88));
  }
  uint64_t v3 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v3) {
    CFRelease(v3);
  }
  mach_port_t v4 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = 0;
  for (uint64_t i = 56; i != 256; i += 40)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(_DWORD *)(v7 + i - 32))
    {
      FigMachPortReleaseSendRight_();
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    if (*(_DWORD *)(v7 + i - 16))
    {
      MEMORY[0x199706B20](*v2, *(void *)(v7 + i - 24));
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    if (*(_DWORD *)(v7 + i)) {
      MEMORY[0x199706B20](*v2, *(void *)(v7 + i - 8));
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    v9 = *(const void **)(v8 + v5 + 32);
    if (v9)
    {
      CFRelease(v9);
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    }
    v10 = *(const void **)(v8 + v5 + 24);
    if (v10)
    {
      CFRelease(v10);
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    }
    v11 = *(const void **)(v8 + v5 + 40);
    if (v11) {
      CFRelease(v11);
    }
    v5 += 24;
  }
  v12 = *(const void **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v12)
  {
    CFRelease(v12);
  }
}

uint64_t __VTCompressionSessionRemoteServer_EncodeFrame_block_invoke_2(uint64_t a1)
{
  VTEncodeInfoFlags infoFlagsOut = 0;
  *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 144) = 1;
  OSStatus v2 = *(OpaqueCMTaggedBufferGroup **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v3 = *(OpaqueVTCompressionSession **)(a1 + 72);
  if (v2)
  {
    CFDictionaryRef v4 = *(const __CFDictionary **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v5 = *(void **)(a1 + 80);
    CMTime presentationTimeStamp = *(CMTime *)(a1 + 88);
    CMTime v13 = *(CMTime *)(a1 + 112);
    OSStatus v6 = VTCompressionSessionEncodeMultiImageFrame(v3, v2, &presentationTimeStamp, &v13, v4, v5, &infoFlagsOut);
  }
  else
  {
    uint64_t v7 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    CFDictionaryRef v8 = *(const __CFDictionary **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    v9 = *(void **)(a1 + 80);
    CMTime presentationTimeStamp = *(CMTime *)(a1 + 88);
    CMTime v13 = *(CMTime *)(a1 + 112);
    OSStatus v6 = VTCompressionSessionEncodeFrame(v3, v7, &presentationTimeStamp, &v13, v8, v9, &infoFlagsOut);
  }
  int v10 = v6;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return VTCompressionSessionRemoteCallbackClient_EncodeReturn(*(_DWORD *)(v11 + 40), *(void *)(v11 + 48), infoFlagsOut, 1, v10);
}

uint64_t __VTCompressionSessionRemoteServer_CompleteFrames_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  FigSemaphoreSignal();
  OSStatus v2 = *(OpaqueVTCompressionSession **)(a1 + 40);
  CMTime v5 = *(CMTime *)(a1 + 48);
  OSStatus v3 = VTCompressionSessionCompleteFrames(v2, &v5);
  return VTCompressionSessionRemoteCallbackClient_CompleteFramesReturn(*(_DWORD *)(*(void *)(a1 + 32) + 40), *(void *)(*(void *)(a1 + 32) + 48), v3);
}

uint64_t __VTCompressionSessionRemoteServer_PrepareToEncodeTiles_block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  int v2 = VTTileCompressionSessionPrepareToEncodeTiles(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), &v5);
  int v3 = HIDWORD(v5);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 28) = v3;
  return VTCompressionSessionRemoteCallbackClient_PrepareToEncodeTilesReturn(*(_DWORD *)(*(void *)(a1 + 48) + 40), *(void *)(*(void *)(a1 + 48) + 48), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v2);
}

uint64_t __VTCompressionSessionRemoteServer_EncodeTile_block_invoke(uint64_t a1)
{
  int v9 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  *(unsigned char *)(v3 + 144) = 1;
  int v4 = VTTileCompressionSessionEncodeTile(v2, *(const void **)(a1 + 48), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 56), *(void *)(a1 + 64), &v9);
  if (*(_DWORD *)(a1 + 104)) {
    FigMachPortReleaseSendRight_();
  }
  uint64_t v5 = (unsigned int *)MEMORY[0x1E4F14960];
  if (*(_DWORD *)(a1 + 108)) {
    MEMORY[0x199706B20](*MEMORY[0x1E4F14960], *(void *)(a1 + 72));
  }
  if (*(_DWORD *)(a1 + 112)) {
    MEMORY[0x199706B20](*v5, *(void *)(a1 + 80));
  }
  OSStatus v6 = *(const void **)(a1 + 48);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = *(const void **)(a1 + 56);
  if (v7) {
    CFRelease(v7);
  }
  return VTCompressionSessionRemoteCallbackClient_EncodeReturn(*(_DWORD *)(*(void *)(a1 + 32) + 40), *(void *)(*(void *)(a1 + 32) + 48), v9, 1, v4);
}

uint64_t __VTCompressionSessionRemoteServer_CompleteTiles_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  FigSemaphoreSignal();
  int v2 = VTTileCompressionSessionCompleteTiles(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  mach_port_t v4 = *(_DWORD *)(v3 + 40);
  uint64_t v5 = *(void *)(v3 + 48);

  return VTCompressionSessionRemoteCallbackClient_CompleteFramesReturn(v4, v5, v2);
}

void __VTCompressionSessionRemoteServer_EstimateMotion_block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 0;
  *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 144) = 1;
  int v2 = *(char **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  mach_port_t v4 = *(void **)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  v12[2] = __VTCompressionSessionRemoteServer_EstimateMotion_block_invoke_2;
  v12[3] = &unk_1E5784DD0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 64);
  v12[5] = &v13;
  v12[6] = v6;
  v12[4] = v5;
  int v7 = VTMotionEstimationSessionEstimateMotionVectors(v2, v3, v4, 0, 0, v12);
  if (*(_DWORD *)(a1 + 88)) {
    FigMachPortReleaseSendRight_();
  }
  CFDictionaryRef v8 = (unsigned int *)MEMORY[0x1E4F14960];
  if (*(_DWORD *)(a1 + 92)) {
    MEMORY[0x199706B20](*MEMORY[0x1E4F14960], *(void *)(a1 + 72));
  }
  int v9 = *(const void **)(a1 + 48);
  if (v9) {
    CFRelease(v9);
  }
  if (*(_DWORD *)(a1 + 96)) {
    FigMachPortReleaseSendRight_();
  }
  if (*(_DWORD *)(a1 + 100)) {
    MEMORY[0x199706B20](*v8, *(void *)(a1 + 80));
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  VTCompressionSessionRemoteCallbackClient_EncodeReturn(*(_DWORD *)(v11 + 40), *(void *)(v11 + 48), *((_DWORD *)v14 + 6), 1, v7);
  _Block_object_dispose(&v13, 8);
}

void __VTCompressionSessionRemoteServer_EstimateMotion_block_invoke_2(void *a1, int a2, int a3, const void *a4, const void *a5)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1[4] + 8) + 24) + 176))
  {
    int v10 = malloc_type_calloc(1uLL, 0x30uLL, 0x10E00405F1B3371uLL);
    if (v10)
    {
      uint64_t v11 = v10;
      v10[1] = a1[6];
      *((_DWORD *)v10 + 4) = a2;
      *((_DWORD *)v10 + 5) = a3;
      if (a4) {
        CFTypeRef v12 = CFRetain(a4);
      }
      else {
        CFTypeRef v12 = 0;
      }
      v11[3] = v12;
      v11[4] = 0;
      if (a5) {
        CFTypeRef v13 = CFRetain(a5);
      }
      else {
        CFTypeRef v13 = 0;
      }
      v11[5] = v13;
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
      uint64_t v14 = *(void *)(*(void *)(a1[4] + 8) + 24);
      vtcss_enqueueFrame(v14, (uint64_t)v11);
    }
    else
    {
      FigSignalErrorAt();
    }
  }
}

uint64_t __VTCompressionSessionRemoteServer_CompleteMotionEstimation_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  FigSemaphoreSignal();
  int v2 = VTMotionEstimationSessionCompleteFrames(*(unsigned char **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  mach_port_t v4 = *(_DWORD *)(v3 + 40);
  uint64_t v5 = *(void *)(v3 + 48);

  return VTCompressionSessionRemoteCallbackClient_CompleteFramesReturn(v4, v5, v2);
}

@end