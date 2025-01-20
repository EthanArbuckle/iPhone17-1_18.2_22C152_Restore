@interface DecodeFrameCommon
@end

@implementation DecodeFrameCommon

uint64_t __dsrxpc_DecodeFrameCommon_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &lengthAtOffsetOut, 0, &dataPointerOut);
  if (!result)
  {
    v4 = dataPointerOut;
    if ((dataPointerOut & 7) != 0)
    {
      return 4294949291;
    }
    else if (lengthAtOffsetOut > 0x57)
    {
      *((void *)dataPointerOut + 10) = 0;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_OWORD *)v4 + 2) = 0u;
      *(_OWORD *)v4 = 0u;
      v5 = dataPointerOut;
      *(void *)dataPointerOut = *(void *)(*(void *)(a1 + 40) + 16);
      *((_DWORD *)v5 + 2) = 1684366182;
      *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 80);
      *((void *)v5 + 2) = *(void *)(*(void *)(a1 + 48) + 16);
      v5[48] = *(void *)(a1 + 32) != 0;
      FigXPCRemoteClientGetServerPID();
      uint64_t result = FigInMemorySerializerAppendCFDictionary();
      if (!result)
      {
        if (dsrxpc_sampleBufferAttachmentsKeysToDrop_onceToken != -1) {
          dispatch_once(&dsrxpc_sampleBufferAttachmentsKeysToDrop_onceToken, &__block_literal_global_16);
        }
        return FigInMemorySerializerAppendCMSampleBuffer();
      }
    }
    else
    {
      return 4294949290;
    }
  }
  return result;
}

uint64_t __dsrxpc_DecodeFrameCommon_block_invoke_2(uint64_t a1, CMBlockBufferRef theBuffer)
{
  size_t v5 = 0;
  dataPointerOut = 0;
  uint64_t result = CMBlockBufferGetDataPointer(theBuffer, 0, &v5, 0, &dataPointerOut);
  if (!result)
  {
    v4 = dataPointerOut;
    if ((dataPointerOut & 7) != 0)
    {
      return 4294949291;
    }
    else if (v5 > 0x57)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *((_DWORD *)dataPointerOut + 4);
      if (*((void *)v4 + 3)) {
        return FigMemoryOriginUpdateRecipientStateFromIPCMessageData();
      }
      else {
        return 0;
      }
    }
    else
    {
      return 4294949290;
    }
  }
  return result;
}

uint64_t __vtDecompressionSessionRemote_DecodeFrameCommon_block_invoke(uint64_t a1)
{
  uint64_t result = FigAtomicIncrement32();
  if (result == 1) {
    uint64_t result = FigSemaphoreWaitRelative();
  }
  *(void *)(*(void *)(a1 + 40) + 72) = *(void *)(*(void *)(a1 + 32) + 32);
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 40);
  return result;
}

uint64_t __vtDecompressionSessionRemote_DecodeFrameCommon_block_invoke_2(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 32);
  if (v1)
  {
    uint64_t v2 = result;
    do
    {
      while (1)
      {
        v3 = v1;
        v1 = (void *)v1[9];
        if (v3 == *(void **)(v2 + 40))
        {
          v4 = (const void *)v3[3];
          if (v4)
          {
            _Block_release(v4);
            v3 = *(void **)(v2 + 40);
          }
          size_t v5 = (const void *)v3[4];
          if (v5)
          {
            _Block_release(v5);
            v3 = *(void **)(v2 + 40);
          }
          uint64_t v6 = *(void *)(v2 + 32);
          v9 = *(void **)(v6 + 32);
          v7 = (void *)(v6 + 32);
          v8 = v9;
          if (v9 != v3)
          {
            do
            {
              v10 = v8;
              v8 = (void *)v8[9];
            }
            while (v8 != v3);
            v7 = v10 + 9;
          }
          void *v7 = v3[9];
          free(*(void **)(v2 + 40));
          uint64_t result = FigAtomicDecrement32();
          if (!result) {
            break;
          }
        }
        if (!v1) {
          return result;
        }
      }
      uint64_t result = FigSemaphoreSignal();
    }
    while (v1);
  }
  return result;
}

@end