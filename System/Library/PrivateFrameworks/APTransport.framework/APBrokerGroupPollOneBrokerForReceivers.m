@interface APBrokerGroupPollOneBrokerForReceivers
@end

@implementation APBrokerGroupPollOneBrokerForReceivers

void ___APBrokerGroupPollOneBrokerForReceivers_block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  *(_DWORD *)(v4 + 4) = a2;
  if (a2 == -72440 || a2 == -6728)
  {
    *(unsigned char *)uint64_t v4 = 1;
    if (gLogCategory_APBrokerGroup > 90 || gLogCategory_APBrokerGroup == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
LABEL_8:
    LogPrintF();
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  if (a2) {
    goto LABEL_19;
  }
  CFDictionaryGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue();
  if (!TypedValue)
  {
    APSLogErrorAt();
    goto LABEL_19;
  }
  v8 = (const void *)TypedValue;
  uint64_t Int64 = CFDictionaryGetInt64();
  uint64_t v10 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (!v10)
  {
    if (gLogCategory_APBrokerGroup > 30 || gLogCategory_APBrokerGroup == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
    goto LABEL_8;
  }
  v11 = (void *)v10;
  if (Int64) {
    uint64_t v12 = Int64;
  }
  else {
    uint64_t v12 = 5;
  }
  v13 = *(const void **)(v10 + 56);
  *(void *)(v10 + 56) = v8;
  CFRetain(v8);
  if (v13) {
    CFRelease(v13);
  }
  _APBrokerGroupFireReceiversChanged((uint64_t)v11);
  v14 = v11[13];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___APBrokerDoReceiverPollingIfNecessary_block_invoke;
  block[3] = &__block_descriptor_tmp_69;
  block[4] = v11;
  block[5] = v12;
  dispatch_sync(v14, block);
  *(void *)(*(void *)(a1 + 40) + 8) = CFRetain(a3);
  **(unsigned char **)(a1 + 40) = 1;
LABEL_20:
  (*(void (**)(void, uint64_t, const void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3);
  if (v11) {
    CFRelease(v11);
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  _Block_release(*(const void **)(a1 + 32));
}

@end