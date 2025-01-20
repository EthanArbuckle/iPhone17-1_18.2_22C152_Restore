@interface ResolveAddress
@end

@implementation ResolveAddress

void __browser_ResolveAddress_block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 72);
  CFStringRef v3 = *(const __CFString **)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 64);
  v4 = *(void (***)(void, void, void, void, void, void))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  CMBaseObjectGetDerivedStorage();
  if (v4)
  {
    if (v1 == 1)
    {
      DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
      uint64_t v7 = *DerivedStorage;
      if (v2)
      {
        v8 = (const void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
        if (v8)
        {
          v9 = _Block_copy(v4);
          if (v9)
          {
            v10 = v9;
            CFRetain(v8);
            goto LABEL_12;
          }
        }
      }
      else
      {
        v12 = _Block_copy(v4);
        v8 = 0;
        if (v12)
        {
          v10 = v12;
LABEL_12:
          uint64_t v13 = DerivedStorage[41];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __browser_resolveBrokerAddress_block_invoke;
          v14[3] = &unk_1E688DDB8;
          v14[6] = v7;
          v14[7] = v5;
          v14[4] = v10;
          v14[5] = v8;
          APBrokerManagerResolveBrokeredReceiverDNSName(v13, v3, v14);
          if (!v8) {
            return;
          }
          goto LABEL_13;
        }
      }
      APSLogErrorAt();
      v4[2](v4, 0, 0, 0, v2, 4294960568);
      if (!v8) {
        return;
      }
LABEL_13:
      CFRelease(v8);
      return;
    }
    v11 = (void (*)(void, const __CFString *, void, void, uint64_t, void))v4[2];
    v11(v4, v3, 0, 0, v2, 0);
  }
  else
  {
    APSLogErrorAt();
  }
}

@end