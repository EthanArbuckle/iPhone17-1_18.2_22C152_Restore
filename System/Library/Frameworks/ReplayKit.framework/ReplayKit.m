char *RPStringUtility_FourccToCStr(int a1)
{
  unint64_t v1;
  char *v2;

  v1 = RPStringUtility_FourccToCStr_ix++;
  v2 = (char *)&RPStringUtility_FourccToCStr_str + 5 * (v1 % 0xA);
  *v2 = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  v2[4] = 0;
  return v2;
}

uint64_t RPStringUtility_CStrToFourcc(char *a1)
{
  return (a1[1] << 16) | (*a1 << 24) | (a1[2] << 8) | a1[3];
}

uint64_t RPLogSetLogLevel(uint64_t result)
{
  if (result <= 3) {
    __RPLogLevel = result;
  }
  return result;
}

void sub_21F6A3A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void handleInputBuffer(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  id v10 = a1;
  memset(&v23, 0, sizeof(v23));
  CMClockMakeHostTimeFromSystemUnits(&v23, *(void *)(a4 + 8));
  CMTimeValue value = v23.value;
  CMTimeScale timescale = v23.timescale;
  CMTime time1 = *(CMTime *)((unsigned char *)v10 + 4);
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  if (CMTimeCompare(&time1, &time2)
    && value
    && *((void *)v10 + 12) >= value
    && __RPLogLevel <= 2
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    handleInputBuffer_cold_1(value, timescale);
  }
  v13 = *((void *)v10 + 1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __handleInputBuffer_block_invoke;
  block[3] = &unk_26451D818;
  CMTime v19 = v23;
  id v16 = v10;
  uint64_t v17 = a3;
  int v20 = a5;
  uint64_t v18 = a6;
  id v14 = v10;
  dispatch_async(v13, block);
}

void isRunningListenerCallback(void *a1, OpaqueAudioQueue *a2, int a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = a1;
  UInt32 ioDataSize = 4;
  int outData = 0;
  if (a3 == 1634824814)
  {
    if (AudioQueueGetProperty(a2, 0x6171726Eu, &outData, &ioDataSize))
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        isRunningListenerCallback_cold_1();
      }
    }
    else
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        id v14 = "isRunningListenerCallback";
        __int16 v15 = 1024;
        int v16 = 238;
        __int16 v17 = 1024;
        int v18 = outData;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: isRunningListenerCallback with isRunning %d", buf, 0x18u);
      }
      v6 = v5[1];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __isRunningListenerCallback_block_invoke;
      block[3] = &unk_26451D840;
      v7 = v5;
      uint64_t v9 = v7;
      int v10 = outData;
      dispatch_async(v6, block);
      AudioQueueRemovePropertyListener(*v7[4], 0x6171726Eu, (AudioQueuePropertyListenerProc)isRunningListenerCallback, v7);
    }
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    isRunningListenerCallback_cold_2();
  }
}

id __copy_helper_block_e8_56n11_8_8_t0w8_s8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  id result = *(id *)(a2 + 64);
  *(void *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_e8_56n4_8_s8(uint64_t a1)
{
}

void sub_21F6A65BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __handleInputBuffer_block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 32)) {
    return;
  }
  v4 = (long long *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 56);
  int v5 = *(_DWORD *)(a1 + 64);
  *(_OWORD *)CMTime time1 = *(_OWORD *)(v1 + 96);
  *(void *)&time1[16] = *(void *)(v1 + 112);
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  if (CMTimeCompare((CMTime *)time1, &time2))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 96) >= v3)
    {
      if (__RPLogLevel <= 2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __handleInputBuffer_block_invoke_cold_3(v3, v5);
        }
        uint64_t v6 = *(void *)(a1 + 32);
      }
      if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(v6 + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0)) {
        BOOL v7 = __RPLogLevel > 2;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __handleInputBuffer_block_invoke_cold_2();
      }
      return;
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime time1 = 136446722;
    *(void *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 147;
    *(_WORD *)&time1[18] = 2048;
    *(double *)&time1[20] = (float)((float)v3 / (float)v5);
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: first sample received at time %.3f", time1, 0x1Cu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *v4;
  *(void *)(v8 + 112) = *((void *)v4 + 2);
  *(_OWORD *)(v8 + 96) = v9;
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 40))
  {
    *(unsigned char *)(v10 + 40) = 0;
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(void *)(v10 + 48))
    {
      v11 = [MEMORY[0x263EFF910] date];
      [v11 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 48)];
      if (v12 > 0.0)
      {
        Float64 v13 = v12;
        if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime time1 = 136446466;
          *(void *)&time1[4] = "handleInputBuffer_block_invoke";
          *(_WORD *)&time1[12] = 1024;
          *(_DWORD *)&time1[14] = 159;
          _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: gap since last audio tap, filling with empty sample buffer", time1, 0x12u);
        }
        uint64_t v14 = *(void *)(a1 + 32);
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
        long long v15 = *(_OWORD *)(v14 + 72);
        *(_OWORD *)CMTime time1 = *(_OWORD *)(v14 + 56);
        *(_OWORD *)&time1[16] = v15;
        uint64_t v34 = *(void *)(v14 + 88);
        CMSampleBufferRef v16 = RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval(&time2, (uint64_t)time1, v13);
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
        if (v16) {
          CFRelease(v16);
        }
      }

      uint64_t v10 = *(void *)(a1 + 32);
    }
  }
  uint64_t v17 = *(void *)(v10 + 32);
  if (*(_DWORD *)(v17 + 152) == 2)
  {
    unsigned int v18 = *(_DWORD *)(a1 + 80);
    if (!v18)
    {
      unsigned int v19 = *(_DWORD *)(v17 + 24);
      if (v19) {
        unsigned int v18 = *(_DWORD *)(*(void *)(a1 + 40) + 16) / v19;
      }
      else {
        unsigned int v18 = 0;
      }
    }
    CMAudioFormatDescriptionRef formatDescriptionOut = 0;
    time2.CMTimeValue value = 0;
    CMBlockBufferRef destinationBuffer = 0;
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (!CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const AudioStreamBasicDescription *)(v17 + 8), 0, 0, 0, 0, 0, &formatDescriptionOut))
    {
      size_t v21 = *(unsigned int *)(*(void *)(a1 + 40) + 16);
      if (!CMBlockBufferCreateWithMemoryBlock(v20, 0, v21, v20, 0, 0, v21, 1u, &destinationBuffer)
        && !CMBlockBufferReplaceDataBytes(*(const void **)(*(void *)(a1 + 40) + 8), destinationBuffer, 0, *(unsigned int *)(*(void *)(a1 + 40) + 16)))
      {
        CMItemCount v22 = *(unsigned int *)(a1 + 80);
        CMTime v23 = *(const AudioStreamPacketDescription **)(a1 + 48);
        *(_OWORD *)CMTime time1 = *v4;
        *(void *)&time1[16] = *((void *)v4 + 2);
        if (!CMAudioSampleBufferCreateReadyWithPacketDescriptions(v20, destinationBuffer, formatDescriptionOut, v22, (CMTime *)time1, v23, (CMSampleBufferRef *)&time2))
        {
          v24 = [MEMORY[0x263EFF910] date];
          CMSampleBufferGetDuration(&time, (CMSampleBufferRef)time2.value);
          uint64_t v25 = [v24 dateByAddingTimeInterval:CMTimeGetSeconds(&time)];
          uint64_t v26 = *(void *)(a1 + 32);
          v27 = *(void **)(v26 + 48);
          *(void *)(v26 + 48) = v25;

          uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 16);
          if (v28) {
            (*(void (**)(uint64_t, CMTimeValue))(v28 + 16))(v28, time2.value);
          }
        }
      }
    }
    if (time2.value) {
      CFRelease((CFTypeRef)time2.value);
    }
    if (destinationBuffer) {
      CFRelease(destinationBuffer);
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 144) += v18;
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime time1 = 136446466;
    *(void *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 168;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: recorder is not running, ignoring audio data", time1, 0x12u);
  }
  if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0)&& __RPLogLevel <= 2&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __handleInputBuffer_block_invoke_cold_1();
  }
}

uint64_t __isRunningListenerCallback_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 152) == 1)
    {
      uint64_t v3 = result;
      if (*(_DWORD *)(result + 40))
      {
        id result = *(void *)(v1 + 24);
        if (result)
        {
          id result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
          uint64_t v2 = *(void *)(*(void *)(v3 + 32) + 32);
        }
        *(_DWORD *)(v2 + 152) = 2;
      }
    }
  }
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

double OUTLINED_FUNCTION_3(double a1, float a2)
{
  return a2;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

double OUTLINED_FUNCTION_5@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)(v3 - 8) = a3;
  return (float)((float)a1 / (float)a2);
}

CMSampleBufferRef RPSampleBufferUtilities_CreateSampleBufferFromIOSurface(IOSurfaceRef surface, const CMSampleTimingInfo *a2)
{
  CVPixelBufferRef pixelBufferOut = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], surface, 0, &pixelBufferOut);
  CMVideoFormatDescriptionCreateForImageBuffer(0, pixelBufferOut, &formatDescriptionOut);
  CMSampleBufferCreateForImageBuffer(v3, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, a2, &sampleBufferOut);
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return sampleBufferOut;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateSampleBufferWithPixelBuffer(CVImageBufferRef imageBuffer, uint64_t a2)
{
  CMSampleBufferRef sampleBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  long long v3 = *(_OWORD *)(MEMORY[0x263F01118] + 48);
  *(_OWORD *)&v10.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x263F01118] + 32);
  *(_OWORD *)&v10.decodeTimeStamp.CMTimeValue value = v3;
  CMTimeEpoch v4 = *(void *)(MEMORY[0x263F01118] + 64);
  long long v5 = *(_OWORD *)(MEMORY[0x263F01118] + 16);
  *(_OWORD *)&v10.duration.CMTimeValue value = *MEMORY[0x263F01118];
  *(_OWORD *)&v10.duration.epoch = v5;
  *(_OWORD *)&v10.presentationTimeStamp.CMTimeValue value = *(_OWORD *)a2;
  CMTimeEpoch v6 = *(void *)(a2 + 16);
  v10.decodeTimeStamp.epoch = v4;
  v10.presentationTimeStamp.epoch = v6;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], imageBuffer, &formatDescriptionOut))
  {
    OSStatus v8 = CMSampleBufferCreateReadyWithImageBuffer(v7, imageBuffer, formatDescriptionOut, &v10, &sampleBufferOut);
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    if (!v8) {
      return sampleBufferOut;
    }
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    RPSampleBufferUtilities_CreateSampleBufferWithPixelBuffer_cold_1();
  }
  CMSampleBufferRef result = sampleBufferOut;
  if (sampleBufferOut)
  {
    CFRelease(sampleBufferOut);
    return 0;
  }
  return result;
}

CMSampleBufferRef RPSampleBufferUtilities_CopySampleBufferFromSourceBuffer(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  CMItemCount numSampleTimingEntries = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CMSampleBufferGetSampleTimingInfoArray(a1, 0, 0, &numSampleTimingEntries);
  if ((unint64_t)numSampleTimingEntries >= 0x38E38E38E38E38FLL)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      RPSampleBufferUtilities_CopySampleBufferFromSourceBuffer_cold_1();
    }
    return 0;
  }
  else
  {
    CMTimeEpoch v4 = (CMSampleTimingInfo *)malloc_type_malloc(72 * numSampleTimingEntries, 0x1000040FF89C88EuLL);
    CMSampleBufferGetSampleTimingInfoArray(a1, numSampleTimingEntries, v4, &numSampleTimingEntries);
    CMItemCount v5 = numSampleTimingEntries;
    if (numSampleTimingEntries >= 1)
    {
      p_decodeTimeStamp = &v4->decodeTimeStamp;
      long long v7 = *MEMORY[0x263F01090];
      CMTimeEpoch v8 = *(void *)(MEMORY[0x263F01090] + 16);
      CMItemCount v9 = numSampleTimingEntries;
      do
      {
        *(_OWORD *)&p_decodeTimeStamp->CMTimeValue value = v7;
        p_decodeTimeStamp->epoch = v8;
        CMTimeEpoch v10 = *(void *)(a2 + 16);
        *(_OWORD *)&p_decodeTimeStamp[-1].CMTimeValue value = *(_OWORD *)a2;
        p_decodeTimeStamp[-1].epoch = v10;
        p_decodeTimeStamp += 3;
        --v9;
      }
      while (v9);
    }
    CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, v5, v4, &sampleBufferOut);
    free(v4);
    return sampleBufferOut;
  }
}

id RPSampleBufferUtilities_EncodeAudioSampleBuffer(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  CMTimeEpoch v4 = [MEMORY[0x263EFF9A0] dictionary];
  CMItemCount v5 = [NSNumber numberWithInteger:a2];
  [v4 setObject:v5 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeySampleType"];

  CMBlockBufferRef blockBufferOut = 0;
  size_t bufferListSizeNeededOut = 0;
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, &blockBufferOut);
  CMTimeEpoch v6 = (AudioBufferList *)malloc_type_malloc(bufferListSizeNeededOut, 0x256FBE5uLL);
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, 0, v6, bufferListSizeNeededOut, 0, 0, 0, &blockBufferOut);
  id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
  if (v6->mNumberBuffers)
  {
    unint64_t v8 = 0;
    p_mData = &v6->mBuffers[0].mData;
    do
    {
      uint64_t v10 = *((unsigned int *)p_mData - 1);
      v11 = *p_mData;
      p_mData += 2;
      [v7 appendBytes:v11 length:v10];
      ++v8;
    }
    while (v8 < v6->mNumberBuffers);
  }
  free(v6);
  [v4 setObject:v7 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioBufferList"];
  FormatDescription = CMSampleBufferGetFormatDescription(a1);
  Float64 v13 = [MEMORY[0x263EFF8F8] dataWithBytes:CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription) length:40];
  [v4 setObject:v13 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"];
  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetSampleTimingInfo(a1, 0, &v17);
  uint64_t v14 = [MEMORY[0x263EFF8F8] dataWithBytes:&v17 length:72];
  [v4 setObject:v14 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
  long long v15 = [NSNumber numberWithLong:CMSampleBufferGetNumSamples(a1)];
  [v4 setObject:v15 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyNumSamples"];

  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }

  return v4;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer(void *a1)
{
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef v18 = 0;
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyNumSamples"];
  CMItemCount v3 = [v2 integerValue];

  CMTimeEpoch v4 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  [v4 getBytes:&sampleTimingArray length:72];
  CMItemCount v5 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"];
  memset(&asbd, 0, sizeof(asbd));
  [v5 getBytes:&asbd length:40];
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(formatDescriptionOut);
  unint64_t v8 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioBufferList"];

  if ([v8 length])
  {
    size_t v9 = [v8 length];
    uint64_t v10 = (char *)malloc_type_malloc(v9, 0x8CE1C984uLL);
    memcpy(v10, (const void *)[v8 bytes], v9);
    if (v10)
    {
      UInt32 mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      if (mChannelsPerFrame == 1 || (StreamBasicDescription->mFormatFlags & 0x20) == 0)
      {
        double v12 = malloc_type_malloc(0x18uLL, 0x10800404ACF7207uLL);
        *(_DWORD *)double v12 = 1;
        *((_DWORD *)v12 + 3) = v9;
        *((_DWORD *)v12 + 2) = StreamBasicDescription->mChannelsPerFrame;
        *((void *)v12 + 2) = v10;
        goto LABEL_13;
      }
      if (mChannelsPerFrame == 2)
      {
        double v12 = malloc_type_malloc(0x28uLL, 0xF3B2E1ECuLL);
        *(_DWORD *)double v12 = 2;
        *((_DWORD *)v12 + 2) = 1;
        *((_DWORD *)v12 + 3) = v9 >> 1;
        *((void *)v12 + 2) = v10;
        *((_DWORD *)v12 + 6) = 1;
        *((_DWORD *)v12 + 7) = v9 >> 1;
        *((void *)v12 + 4) = &v10[v9 >> 1];
        goto LABEL_13;
      }
      if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer_cold_1();
      }
      free(v10);
    }
  }
  double v12 = 0;
LABEL_13:
  CMSampleBufferCreate(v6, 0, 0, 0, 0, formatDescriptionOut, v3, 1, &sampleTimingArray, 0, 0, &v18);
  CMSampleBufferSetDataBufferFromAudioBufferList(v18, v6, v6, 0, (const AudioBufferList *)v12);
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  if (v12)
  {
    free(*((void **)v12 + 2));
    free(v12);
  }
  CMSampleBufferRef v13 = v18;

  return v13;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval(CMTime *a1, uint64_t a2, Float64 a3)
{
  CMSampleBufferRef v16 = 0;
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&asbd.Float64 mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)&asbd.mBytesPerPacket = v5;
  *(void *)&asbd.mBitsPerChannel = *(void *)(a2 + 32);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_6();
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = formatDescriptionOut;
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v7);
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  unsigned int mFramesPerPacket = StreamBasicDescription->mFramesPerPacket;
  if (!mFramesPerPacket)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_1();
    }
LABEL_27:
    Float64 mSampleRate = 0.0;
    if (!v7) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  mBytesPerPacket = (const opaqueCMFormatDescription *)StreamBasicDescription->mBytesPerPacket;
  CMAudioFormatDescriptionRef formatDescriptionOut = mBytesPerPacket;
  if (mBytesPerPacket != StreamBasicDescription->mBytesPerFrame * mFramesPerPacket)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_5();
    }
    goto LABEL_27;
  }
  CMItemCount v11 = (unint64_t)(a3 * 44100.0 / (double)mFramesPerPacket);
  asbd.Float64 mSampleRate = 0.0;
  if (CMBlockBufferCreateWithMemoryBlock(v6, 0, (void)mBytesPerPacket * v11, v6, 0, 0, (void)mBytesPerPacket * v11, 0, (CMBlockBufferRef *)&asbd))
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_4();
    }
  }
  else
  {
    if (!CMBlockBufferAssureBlockMemory(*(CMBlockBufferRef *)&asbd.mSampleRate))
    {
      Float64 mSampleRate = asbd.mSampleRate;
      goto LABEL_8;
    }
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_3();
    }
  }
  if (*(void *)&asbd.mSampleRate) {
    CFRelease(*(CFTypeRef *)&asbd.mSampleRate);
  }
  Float64 mSampleRate = 0.0;
LABEL_8:
  memset(&v14, 0, sizeof(v14));
  CMTimeMakeWithSeconds(&v14.duration, a3, 44100);
  v14.presentationTimeStamp = *a1;
  v14.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  if (!CMSampleBufferCreate(v6, *(CMBlockBufferRef *)&mSampleRate, 1u, 0, 0, v7, v11, 1, &v14, 1, (const size_t *)&formatDescriptionOut, &v16))
  {
    if (v7) {
      CFRelease(v7);
    }
    if (mSampleRate != 0.0) {
      CFRelease(*(CFTypeRef *)&mSampleRate);
    }
    return v16;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_2();
    if (!v7) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v7) {
LABEL_41:
  }
    CFRelease(v7);
LABEL_42:
  if (mSampleRate != 0.0) {
    CFRelease(*(CFTypeRef *)&mSampleRate);
  }
  CMSampleBufferRef result = v16;
  if (v16)
  {
    CFRelease(v16);
    return 0;
  }
  return result;
}

CMSampleBufferRef RPSampleBufferUtilities_CreateAudioSampleBuffer(uint64_t a1, const AudioStreamBasicDescription *a2, CMTime *a3)
{
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef sbuf = 0;
  unsigned int v5 = *(_DWORD *)(a1 + 12);
  UInt32 mBytesPerPacket = a2->mBytesPerPacket;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_3();
    }
  }
  else
  {
    CMTime presentationTimeStamp = *a3;
    OSStatus v8 = CMAudioSampleBufferCreateWithPacketDescriptions(v7, 0, 0, 0, 0, formatDescriptionOut, v5 / mBytesPerPacket, &presentationTimeStamp, 0, &sbuf);
    CFRelease(formatDescriptionOut);
    if (v8)
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_2();
      }
    }
    else
    {
      if (!CMSampleBufferSetDataBufferFromAudioBufferList(sbuf, v7, v7, 0, (const AudioBufferList *)a1))
      {
        CMSampleBufferRef v9 = sbuf;
        CMTime presentationTimeStamp = *a3;
        CMSampleBufferSetOutputPresentationTimeStamp(sbuf, &presentationTimeStamp);
        return v9;
      }
      if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_1();
      }
    }
  }
  if (sbuf) {
    CFRelease(sbuf);
  }
  return 0;
}

void RPSampleBufferUtilities_ReleaseAudioSampleBuffer(const void *a1, void **a2)
{
  if (a1) {
    CFRelease(a1);
  }
  if (a2)
  {
    free(a2[2]);
    free(a2);
  }
}

double RPSampleBufferUtilities_SecondsPresentationTimeForSample(opaqueCMSampleBuffer *a1)
{
  if (!a1) {
    return 0.0;
  }
  memset(&v2, 0, sizeof(v2));
  CMSampleBufferGetPresentationTimeStamp(&v2, a1);
  *(float *)&double result = (float)v2.value / (float)v2.timescale;
  return result;
}

uint64_t RPSampleBufferUtilities_CreateCGImageFromIOSurface(__IOSurface *a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (IOSurfaceGetPixelFormat(a1) == 1380411457)
  {
    uint64_t v12 = *MEMORY[0x263F0EFC0];
    v13[0] = &unk_26D11EEE8;
    CMTime v2 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v3 = CGImageCreateFromIOSurface();
  }
  else
  {
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
    size_t Width = IOSurfaceGetWidth(a1);
    size_t Height = IOSurfaceGetHeight(a1);
    size_t AllocSize = IOSurfaceGetAllocSize(a1);
    CFRetain(a1);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v10 = CGDataProviderCreateWithData(a1, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)RPSampleBufferUtilities_releaseIOSurface);
    uint64_t v3 = (uint64_t)CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v10, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v10);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v3;
}

void RPSampleBufferUtilities_releaseIOSurface(__IOSurface *a1)
{
  IOSurfaceUnlock(a1, 0, 0);

  CFRelease(a1);
}

uint64_t showReactionsTip(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    CMSampleBufferRef v9 = "showReactionsTip";
    __int16 v10 = 1024;
    int v11 = 14;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  unsigned int v5 = +[RPControlCenterAngelProxy sharedInstance];
  uint64_t v6 = [v5 showReactionsTipForApplication:v3 bundleID:v4];

  return v6;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_21F6B684C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F6B6F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F6B7A5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21F6C0598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void handleInputBuffer_cold_1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_5(a1, a2, *MEMORY[0x263EF8340]);
  v4[0] = 136446978;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(v2, v3);
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: handleInputBuffer audio sample buffer timestamp %.3f earlier than previous %.3f", (uint8_t *)v4, 0x26u);
}

void isRunningListenerCallback_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: error reading AudioQueue property", v1, v2, v3, v4, 2u);
}

void isRunningListenerCallback_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: AudioQueue listener property %d not added", v1, v2, v3, v4, 2u);
}

void __handleInputBuffer_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
}

void __handleInputBuffer_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
}

void __handleInputBuffer_block_invoke_cold_3(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_5(a1, a2, *MEMORY[0x263EF8340]);
  v4[0] = 136446978;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(v2, v3);
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: discarding audio sample buffer due to timestamp %.3f earlier than previous %.3f", (uint8_t *)v4, 0x26u);
}

void RPSampleBufferUtilities_CreateSampleBufferWithPixelBuffer_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed with error code %u", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CopySampleBufferFromSourceBuffer_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Overflow detected", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d unsupported NonInterleaved with %d channels", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Non-positive framesPerPacket", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d CMSampleBufferCreate failed: %d", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d CMBlockBufferAssureBlockMemory failed: %d", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d CMBlockBufferCreateEmpty failed: %d", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Invalid ASBD params", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateEmptyAudioSampleBufferWithTimeInterval_cold_6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d CMAudioFormatDescriptionCreate failed: %d", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer: %d", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer description: %d", v1, v2, v3, v4, 2u);
}

void RPSampleBufferUtilities_CreateAudioSampleBuffer_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to create format description for audio buffer", v1, v2, v3, v4, 2u);
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x270EE2168](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x270EE2170](inAQ, *(void *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x270EE2178](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x270EE2180](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x270EE2198](inAQ, inBuffer);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x270EE21A8](inAQ, *(void *)&inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x270EE21B0](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(void *)&inFlags, outAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x270EE21C8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270EE21E0](inAQ, *(void *)&inID, inData, *(void *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x270EE21E8](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x270EE21F0](inAQ, inImmediate);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x270EF4ED0]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7980](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x270EE7998](desc);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE79A0](allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE79A8](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp);
}

OSStatus CMBlockBufferAssureBlockMemory(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x270EE79E8](theBuffer);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x270EE7A40](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x270EE7AB8](retstr, hostTime);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD8](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BE8](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BF8](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7C08](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, blockBufferOut);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C28](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x270EE7C58](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x270EE7C98](sbuf, sampleIndex, timingInfoOut);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x270EE7CA0](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

OSStatus CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBufferRef sbuf, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, const AudioBufferList *bufferList)
{
  return MEMORY[0x270EE7CC8](sbuf, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, bufferList);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x270EE7CD0](sbuf, outputPresentationTimeStamp);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FB8](allocator, imageBuffer, formatDescriptionOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E38](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x270F77180]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_enumerationMutation(id obj)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}