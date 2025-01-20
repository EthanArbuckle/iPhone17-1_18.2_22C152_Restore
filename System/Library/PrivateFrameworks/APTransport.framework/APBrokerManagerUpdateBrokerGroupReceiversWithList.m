@interface APBrokerManagerUpdateBrokerGroupReceiversWithList
@end

@implementation APBrokerManagerUpdateBrokerGroupReceiversWithList

void ___APBrokerManagerUpdateBrokerGroupReceiversWithList_block_invoke(uint64_t a1, void *key, void *value)
{
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 32);
  if (!v6 || !CFDictionaryContainsKey(v6, key))
  {
    v7 = *(__CFDictionary **)(a1 + 40);
    CFDictionarySetValue(v7, key, value);
  }
}

void ___APBrokerManagerUpdateBrokerGroupReceiversWithList_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 32), a2);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 184);
  _APBrokerManagerFireBrokeredReceiverEvent(v5, a3, v6);
}

void ___APBrokerManagerUpdateBrokerGroupReceiversWithList_block_invoke_3(uint64_t a1, const void *a2, const void *a3)
{
  int v6 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 32), a2);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = 176;
  if (!v6) {
    uint64_t v8 = 168;
  }
  uint64_t v9 = *(void *)(v7 + v8);
  _APBrokerManagerFireBrokeredReceiverEvent(v7, a3, v9);
}

@end