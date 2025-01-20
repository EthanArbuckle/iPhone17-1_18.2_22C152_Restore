@interface CFUUIDCreateWithBytesPrimitive
@end

@implementation CFUUIDCreateWithBytesPrimitive

void ____CFUUIDCreateWithBytesPrimitive_block_invoke(uint64_t a1)
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  v2 = (_OWORD *)(a1 + 48);
  Value = (const void *)_uniquedUUIDs;
  if (_uniquedUUIDs) {
    Value = CFDictionaryGetValue((CFDictionaryRef)_uniquedUUIDs, v2);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Value;
  v4 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v4)
  {
    if (!*(unsigned char *)(a1 + 64)) {
      CFRetain(v4);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _CFRuntimeCreateInstance(*(__objc2_class ***)(a1 + 40), 0x22uLL, 16, 0);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (!v5) {
      return;
    }
    *(_OWORD *)(v5 + 16) = *v2;
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    CFDictionaryKeyCallBacks keyCallBacks = *(CFDictionaryKeyCallBacks *)byte_1ECE10050;
    CFDictionaryValueCallBacks v8 = *(CFDictionaryValueCallBacks *)byte_1ECE10080;
    v7 = (__CFDictionary *)_uniquedUUIDs;
    if (!_uniquedUUIDs)
    {
      v7 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &keyCallBacks, &v8);
      _uniquedUUIDs = (uint64_t)v7;
    }
    CFDictionarySetValue(v7, (const void *)(v6 + 16), (const void *)v6);
  }
  if (*(unsigned char *)(a1 + 64)) {
    __CFRuntimeSetImmortal(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
}

@end