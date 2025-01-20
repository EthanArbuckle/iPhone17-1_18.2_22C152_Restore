@interface CFPrefsDeliverPendingKVONotificationsGuts
@end

@implementation CFPrefsDeliverPendingKVONotificationsGuts

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
}

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_3(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, &__kCFNull);
  v6 = *(__CFDictionary **)(a1 + 40);

  CFDictionarySetValue(v6, a2, a3);
}

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  context[5] = *(void *)off_1ECE0A5B0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v5 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFIndex Count = CFArrayGetCount(a3);
  if (Count < 1)
  {
    v11 = 0;
  }
  else
  {
    CFIndex v7 = Count;
    for (CFIndex i = 0; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      v11 = (void *)ValueAtIndex[1];
      CFDictionaryRef v10 = (const __CFDictionary *)ValueAtIndex[2];
      CFDictionaryRef v12 = (const __CFDictionary *)ValueAtIndex[3];
      if (v10)
      {
        context[0] = off_1ECE0A5A0;
        context[1] = 3221225472;
        context[2] = ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_2;
        context[3] = &__block_descriptor_40_e25_v24__0____CFString__8_v16l;
        context[4] = Mutable;
        CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)applyBlockApplier, context);
      }
      if (v12)
      {
        v14[0] = off_1ECE0A5A0;
        v14[1] = 3221225472;
        v14[2] = ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_3;
        v14[3] = &__block_descriptor_48_e25_v24__0____CFString__8_v16l;
        v14[4] = Mutable;
        v14[5] = v5;
        CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)applyBlockApplier, v14);
      }
    }
  }
  v13 = (void *)MEMORY[0x185311AE0]();
  [v11 _notifyObserversOfChangeFromValuesForKeys:Mutable toValuesForKeys:v5];
  CFRelease(Mutable);
  CFRelease(v5);
}

@end