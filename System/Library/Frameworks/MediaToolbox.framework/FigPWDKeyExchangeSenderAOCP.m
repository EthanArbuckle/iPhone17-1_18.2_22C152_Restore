@interface FigPWDKeyExchangeSenderAOCP
@end

@implementation FigPWDKeyExchangeSenderAOCP

intptr_t __FigPWDKeyExchangeSenderAOCP_getCertificate_block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(const void **)(v4 + 56);
    *(void *)(v4 + 56) = cf;
    if (cf) {
      CFRetain(cf);
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void __FigPWDKeyExchangeSenderAOCP_requestCKCFromServerAfterSendingSPC_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    uint64_t v5 = [a3 code];
  }
  else {
    uint64_t v5 = 0;
  }
  FigPWDKeyExchangeSenderGetCMBaseObject(*(void *)(a1 + 32));
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  Value = 0;
  v8 = 0;
  Mutable = 0;
  CFDictionaryRef v10 = 0;
  if (v5) {
    goto LABEL_15;
  }
  if (!a2) {
    goto LABEL_32;
  }
  if (FigJSONObjectCreateWithData())
  {
LABEL_33:
    Value = 0;
    v8 = 0;
    Mutable = 0;
    CFDictionaryRef v10 = 0;
    goto LABEL_15;
  }
  if (!FigCFDictionaryGetValue() || (FigCFDictionaryGetValue(), FigCFArrayGetFirstValue(), !FigCFDictionaryGetValue()))
  {
LABEL_32:
    FigSignalErrorAt();
    goto LABEL_33;
  }
  if (FigCreateCFDataFromBase64EncodedString()) {
    goto LABEL_33;
  }
  v11 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  v12 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryRef v10 = CFDictionaryCreateMutable(0, 0, v11, v12);
  if (ZZUDP2EEn9tLDQ()
    || (FigCFDictionarySetInt64(),
        FigCFDictionarySetInt64(),
        CFDictionarySetValue(Mutable, @"RulIk", 0),
        gojqbvrX305gQO((uint64_t)Mutable, (uint64_t)v10))
    || (*(void *)(DerivedStorage + 48) = 0, FigCFDictionaryGetInt64IfPresent() != 1))
  {
    FigSignalErrorAt();
    Value = 0;
  }
  else
  {
    Value = CFDictionaryGetValue(v10, @"RulIk");
    if (Value)
    {
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      v8 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      FigCFDictionarySetInt64();
      CFDictionarySetValue(v8, @"payload", Value);
      Value = CFPropertyListCreateData(v13, v8, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      goto LABEL_15;
    }
    FigSignalErrorAt();
  }
  v8 = 0;
LABEL_15:
  v14 = (unsigned int (**)(uint64_t, const void *))(DerivedStorage + 80);
  if (*(void *)(DerivedStorage + 80))
  {
    uint64_t v15 = FigCFWeakReferenceHolderCopyReferencedObject();
    v16 = (const void *)v15;
    if (!v15 || (*v14)(v15, Value)) {
      FigSignalErrorAt();
    }
  }
  else
  {
    v16 = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (Value) {
    CFRelease(Value);
  }
  if (v16) {
    CFRelease(v16);
  }
}

@end