@interface SBufConsumerEnsureSetup
@end

@implementation SBufConsumerEnsureSetup

void ___SBufConsumerEnsureSetup_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CMBlockBufferRef dataBuffer = 0;
  CFTypeRef cf = 0;
  *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x263F01090];
  sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x263F01090] + 16);
  sampleTimingArray.presentationTimeStamp = sampleTimingArray.duration;
  sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
  uint64_t v19 = 0;
  if (!*(void *)(v1 + 128)) {
    goto LABEL_31;
  }
  if ((int)dispatch_source_get_data(*(dispatch_source_t *)(v1 + 144)) < 1)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  double v2 = (double)mach_absolute_time();
  unint64_t v3 = (unint64_t)(*(double *)(v1 + 80) * (v2 / (double)(unint64_t)UpTicksPerSecond()));
  CMItemCount v4 = v3 - *(void *)(v1 + 160);
  uint64_t v19 = *(unsigned int *)(v1 + 104);
  size_t v5 = v4 * v19;
  v6 = malloc_type_malloc(v4 * v19, 0x50091875uLL);
  if (!APReceiverAudioSessionReadAudio(*(void *)(v1 + 24)))
  {
    CMTimeMake(&sampleTimingArray.presentationTimeStamp, *(void *)(v1 + 160) + *(int *)(v1 + 168), (int)*(double *)(v1 + 80));
    CMTimeMake(&block, 1, (int)*(double *)(v1 + 80));
    sampleTimingArray.duration = block;
    *(void *)(v1 + 160) = v3;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (!CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, v5, (CFAllocatorRef)*MEMORY[0x263EFFB18], 0, 0, v5, 0, &dataBuffer))
    {
      sampleSizeArray = (const size_t *)&v19;
      if ((*(_DWORD *)(v1 + 92) & 0x20) != 0) {
        sampleSizeArray = 0;
      }
      if (CMSampleBufferCreate(v7, dataBuffer, 1u, 0, 0, *(CMFormatDescriptionRef *)(v1 + 120), v4, 1, &sampleTimingArray, (*(_DWORD *)(v1 + 92) & 0x20) == 0, sampleSizeArray, (CMSampleBufferRef *)&cf))
      {
        goto LABEL_31;
      }
      uint64_t v9 = *(void *)(v1 + 128);
      CFTypeRef v10 = cf;
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      int v31 = 0;
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      v13 = *(uint64_t (**)(uint64_t))(v12 + 8);
      if (v13)
      {
        v14 = v13(v9);
        if (!v14)
        {
          uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v15) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = 0;
          }
          v18 = *(uint64_t (**)(uint64_t, CFTypeRef))(v16 + 40);
          if (v18) {
            int v17 = v18(v9, v10);
          }
          else {
            int v17 = -12782;
          }
          *((_DWORD *)v29 + 6) = v17;
LABEL_17:
          _Block_object_dispose(&v28, 8);
          if (!v17) {
            goto LABEL_18;
          }
LABEL_31:
          APSLogErrorAt();
          goto LABEL_18;
        }
      }
      else
      {
        v14 = MEMORY[0x263EF83A0];
      }
      block.value = MEMORY[0x263EF8330];
      *(void *)&block.timescale = 3221225472;
      block.epoch = (CMTimeEpoch)__APReceiverSBufConsumerPushAudioSBuf_block_invoke;
      v24 = &unk_264895EB8;
      v25 = &v28;
      uint64_t v26 = v9;
      CFTypeRef v27 = v10;
      dispatch_sync(v14, &block);
      int v17 = *((_DWORD *)v29 + 6);
      goto LABEL_17;
    }
  }
  APSLogErrorAt();
LABEL_19:
  if (dataBuffer) {
    CFRelease(dataBuffer);
  }
  if (cf) {
    CFRelease(cf);
  }
  free(v6);
}

@end