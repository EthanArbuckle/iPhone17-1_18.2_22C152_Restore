@interface APBrokerGroupDoReceiverPolling
@end

@implementation APBrokerGroupDoReceiverPolling

void ___APBrokerGroupDoReceiverPolling_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = FigCFWeakReferenceHolderCreateWithReferencedObject();
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = _Block_copy(a5);
    CFRetain(v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 0x40000000;
    v13[2] = ___APBrokerGroupPollOneBrokerForReceivers_block_invoke;
    v13[3] = &unk_1E688C670;
    v13[6] = a2;
    v13[7] = v10;
    v13[4] = v11;
    v13[5] = a4;
    APBrokerGetBrokeredReceivers(a3, v13);
    CFRelease(v10);
  }
  else
  {
    APSLogErrorAt();
    *(_DWORD *)(a4 + 4) = -6728;
    *(unsigned char *)a4 = 1;
    v12 = (void (*)(void *))a5[2];
    v12(a5);
  }
}

void ___APBrokerGroupDoReceiverPolling_block_invoke_2(int a1, uint64_t a2, int a3, CFDictionaryRef theDict)
{
  if (!theDict || !CFDictionaryContainsKey(theDict, @"brokerTimeoutSecs"))
  {
    _APBrokerDoReceiverPollingIfNecessary(a2, 5);
  }
}

@end