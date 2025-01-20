@interface VTDecompressionSessionRemoteServer
@end

@implementation VTDecompressionSessionRemoteServer

uint64_t *__VTDecompressionSessionRemoteServer_Destroy_block_invoke(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 32); ; uint64_t i = *(void *)(a1 + 32))
  {
    v5 = *(uint64_t **)(i + 120);
    v4 = (uint64_t *)(i + 120);
    result = v5;
    if (!v5) {
      break;
    }
    uint64_t v6 = *result;
    uint64_t *v4 = *result;
    if (!v6) {
      *(void *)(*(void *)(a1 + 32) + 128) = *(void *)(a1 + 32) + 120;
    }
    vtdss_freeQueuedFrame(result);
    FigSemaphoreSignal();
  }
  return result;
}

void __VTDecompressionSessionRemoteServer_DecodeFrame_block_invoke(uint64_t a1)
{
  int v8 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  *(unsigned char *)(v2 + 152) = 1;
  CMSampleBufferGetPresentationTimeStamp(&v7, *(CMSampleBufferRef *)(a1 + 40));
  *(CMTime *)(v2 + 224) = v7;
  uint64_t v3 = *(void *)(a1 + 32);
  *(void *)(v3 + 248) = *(void *)(a1 + 48);
  int v4 = VTDecompressionSessionDecodeFrameWithOptions(*(void *)(v3 + 24), *(opaqueCMSampleBuffer **)(a1 + 40), *(unsigned int *)(a1 + 72), *(void *)(a1 + 56), *(void *)(a1 + 48), &v8);
  VTDecompressionSessionRemoteCallbackClient_DecodeFrameReturn(*(_DWORD *)(*(void *)(a1 + 32) + 56), *(void *)(*(void *)(a1 + 32) + 64), v8, 1, v4);
  if (*(_DWORD *)(a1 + 76)) {
    FigMachPortReleaseSendRight_();
  }
  if (*(_DWORD *)(a1 + 80)) {
    MEMORY[0x199706B20](*MEMORY[0x1E4F14960], *(void *)(a1 + 64));
  }
  v5 = *(const void **)(a1 + 40);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(const void **)(a1 + 56);
  if (v6) {
    CFRelease(v6);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __VTDecompressionSessionRemoteServer_FinishDelayedFrames_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 0;
  FigSemaphoreSignal();
  OSStatus v2 = VTDecompressionSessionFinishDelayedFrames(*(VTDecompressionSessionRef *)(*(void *)(a1 + 32) + 24));
  VTDecompressionSessionRemoteCallbackClient_FinishDelayedFramesReturn(*(_DWORD *)(*(void *)(a1 + 32) + 56), *(void *)(*(void *)(a1 + 32) + 64), v2);
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

double __VTDecompressionSessionRemoteServer_GetMinOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(uint64_t a1)
{
  for (uint64_t i = *(uint64_t **)(*(void *)(a1 + 40) + 120); i; uint64_t i = (uint64_t *)*i)
  {
    CMTime time1 = *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    CMTime v5 = *(CMTime *)(i + 5);
    CMTimeMinimum(&v7, &time1, &v5);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v3 + 40) = v7.epoch;
    double result = *(double *)&v7.value;
    *(_OWORD *)(v3 + 24) = *(_OWORD *)&v7.value;
  }
  return result;
}

double __VTDecompressionSessionRemoteServer_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(void *a1)
{
  for (uint64_t i = *(uint64_t **)(a1[6] + 120); i; uint64_t i = (uint64_t *)*i)
  {
    CMTime time1 = *(CMTime *)(*(void *)(a1[4] + 8) + 24);
    CMTime time2 = *(CMTime *)(i + 5);
    CMTimeMinimum(&v8, &time1, &time2);
    *(CMTime *)(*(void *)(a1[4] + 8) + 24) = v8;
    CMTime time1 = *(CMTime *)(*(void *)(a1[5] + 8) + 24);
    CMTime time2 = *(CMTime *)(i + 5);
    CMTimeMaximum(&v5, &time1, &time2);
    uint64_t v3 = *(void *)(a1[5] + 8);
    *(void *)(v3 + 40) = v5.epoch;
    double result = *(double *)&v5.value;
    *(_OWORD *)(v3 + 24) = *(_OWORD *)&v5.value;
  }
  return result;
}

void __VTDecompressionSessionRemoteServer_DecodeTile_block_invoke(uint64_t a1)
{
  int v7 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  OSStatus v2 = *(opaqueCMSampleBuffer **)(a1 + 40);
  *(unsigned char *)(v3 + 152) = 1;
  int v4 = VTTileDecompressionSessionDecodeTile(*(void *)(v3 + 32), v2, *(void *)(a1 + 64), *(void *)(a1 + 72), *(void **)(a1 + 48), *(void *)(a1 + 80), *(unsigned int *)(a1 + 88), *(void *)(a1 + 56), &v7);
  VTDecompressionSessionRemoteCallbackClient_DecodeFrameReturn(*(_DWORD *)(*(void *)(a1 + 32) + 56), *(void *)(*(void *)(a1 + 32) + 64), v7, 1, v4);
  if (*(_DWORD *)(a1 + 92)) {
    FigMachPortReleaseSendRight_();
  }
  if (*(_DWORD *)(a1 + 96)) {
    FigMachPortReleaseSendRight_();
  }
  CMTime v5 = *(const void **)(a1 + 40);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(const void **)(a1 + 48);
  if (v6) {
    CFRelease(v6);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __VTDecompressionSessionRemoteServer_FinishDelayedTiles_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 0;
  FigSemaphoreSignal();
  int v2 = VTTileDecompressionSessionFinishDelayedTiles(*(void *)(*(void *)(a1 + 32) + 32));
  VTDecompressionSessionRemoteCallbackClient_FinishDelayedFramesReturn(*(_DWORD *)(*(void *)(a1 + 32) + 56), *(void *)(*(void *)(a1 + 32) + 64), v2);
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

@end