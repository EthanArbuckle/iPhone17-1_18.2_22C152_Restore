@interface FigRemote
@end

@implementation FigRemote

pthread_mutex_t *__FigRemote_LookUpServerTimeoutPort_block_invoke()
{
  result = FigSimpleMutexCreate();
  qword_1EB28BC08 = (uint64_t)result;
  return result;
}

dispatch_queue_t __FigRemote_InterpretMachErrorForTimeout_block_invoke()
{
  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigRPCTimeoutServerTrace[1], @"rpctimeoutserver_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", 0, 0, gFigRPCTimeoutServerTrace);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&unk_1EB28B630, @"rpctimeoutserver_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", 0, 0, &qword_1EB28B628);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"rpc_timeout", @"com.apple.coremedia", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v1 = 1000 * AppIntegerValue;
    if (!AppIntegerValue) {
      int v1 = 0x7FFFFFFF;
    }
    sTimeoutValueFromPreference = v1;
  }
  dispatch_queue_t result = dispatch_queue_create("RPCTimeoutKillingQueue", 0);
  sServerKillingQueue = (uint64_t)result;
  return result;
}

uint64_t __FigRemote_InterpretMachErrorForTimeout_block_invoke_2(uint64_t result)
{
  if (sMessageSentSuccessfully)
  {
    uint64_t v1 = result;
    FigRemote_LookUpServerTimeoutPort();
    gFigRemoteCommonTimeout = 0x7FFFFFFF;
    if (*(void *)(v1 + 32)) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = sSuccessfulMessageServerToken == 0;
    }
    if (v2
      || ((dispatch_queue_t result = FigRemote_HandleServerTimeout_WithExtraInfo(sSuccessfulMessageServerToken, *(void *)(v1 + 40), *(const __CFString **)(v1 + 48)), result)? (v3 = result == -16521): (v3 = 1), v3))
    {
      dispatch_queue_t result = FigRemote_HandleServerTimeout_WithExtraInfo(*(void *)(v1 + 32), *(void *)(v1 + 40), *(const __CFString **)(v1 + 48));
    }
    sSuccessfulMessageServerToken = 0;
    sMessageSentSuccessfully = 0;
  }
  return result;
}

uint64_t __FigRemote_CreateSerializedAtomDataBlockBufferForFormatDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = *(const opaqueCMFormatDescription **)(a1 + 32);
  int v11 = 0;
  long long v10 = 0u;
  long long v9 = 0u;
  v8[0] = a2;
  v8[1] = a3;
  uint64_t result = FigNEAtomWriterBeginAtom((uint64_t)v8, 1717859171);
  if (!result)
  {
    uint64_t result = (uint64_t)sbufAtom_appendFormatDescriptionAtomGuts(v5, v8);
    if (!result)
    {
      uint64_t result = FigNEAtomWriterEndAtom((uint64_t)v8);
      if (a4)
      {
        if (!result)
        {
          uint64_t v7 = *((void *)&v10 + 1);
          if (*((void *)&v10 + 1) == 8) {
            uint64_t v7 = 0;
          }
          *a4 = v7;
        }
      }
    }
  }
  return result;
}

uint64_t __FigRemote_CreateSerializedAtomDataBlockBufferForPixelBuffer_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sbufAtom_createSerializedDataForPixelBuffer(*(void **)(a1 + 32), 0, 0, a2, a3, a4);
}

uint64_t __FigRemote_CreateSerializedAtomDataBlockBufferForKeyValuePair_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CFStringRef v5 = *(const __CFString **)(a1 + 32);
  v6 = *(__CFString **)(a1 + 40);
  int v14 = 0;
  long long v13 = 0u;
  long long v12 = 0u;
  v11[0] = a2;
  v11[1] = a3;
  uint64_t result = sbufAtom_appendKeyValuePairAtom(v5, 0, v6, v11);
  if (result != -12572 && a4 != 0 && result == 0)
  {
    uint64_t v10 = *((void *)&v13 + 1);
    if (*((void *)&v13 + 1) == 8) {
      uint64_t v10 = 0;
    }
    *a4 = v10;
  }
  return result;
}

CFIndex __FigRemote_CreateSerializedAtomDataBlockBufferForCFType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CFStringRef v5 = *(__CFString **)(a1 + 32);
  int v13 = 0;
  long long v12 = 0u;
  long long v11 = 0u;
  v10[0] = a2;
  v10[1] = a3;
  CFIndex result = sbufAtom_appendCFTypeAtom(v5, 0, v10);
  if (result != -12572 && a4 != 0 && result == 0)
  {
    uint64_t v9 = *((void *)&v12 + 1);
    if (*((void *)&v12 + 1) == 8) {
      uint64_t v9 = 0;
    }
    *a4 = v9;
  }
  return result;
}

CFIndex __FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForCFType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sbufAtom_createSerializedDataWithFlagsForCFType(*(__CFString **)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3, a4);
}

void __FigRemote_GetKnownNeroKeysForLightningAdapters_block_invoke()
{
  FigRemote_GetKnownNeroKeysForLightningAdapters_neroKeys = (uint64_t)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
  if (sKnownSBufKeysArray)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)sKnownSBufKeysArray);
    CFIndex v1 = Count - 1;
    if (Count >= 1)
    {
      CFIndex v2 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)sKnownSBufKeysArray, v2);
        CFSetAddValue((CFMutableSetRef)FigRemote_GetKnownNeroKeysForLightningAdapters_neroKeys, ValueAtIndex);
        if (CFEqual(ValueAtIndex, @"hvcC")) {
          BOOL v4 = 1;
        }
        else {
          BOOL v4 = v1 == v2;
        }
        ++v2;
      }
      while (!v4);
    }
  }
  CFStringRef v5 = (__CFSet *)FigRemote_GetKnownNeroKeysForLightningAdapters_neroKeys;

  CFSetAddValue(v5, @"TransportStreamEncryptionInitData");
}

@end