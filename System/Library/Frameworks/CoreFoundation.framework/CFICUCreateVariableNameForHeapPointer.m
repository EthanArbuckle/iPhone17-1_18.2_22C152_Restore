@interface CFICUCreateVariableNameForHeapPointer
@end

@implementation CFICUCreateVariableNameForHeapPointer

void _____CFICUCreateVariableNameForHeapPointer_block_invoke(uint64_t a1)
{
  if (!variableNamesByHeapPointer) {
    variableNamesByHeapPointer = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ___CFICUCreateVariableNameLocked(*(char **)(a1 + 40));
  v2 = (__CFDictionary *)variableNamesByHeapPointer;
  v3 = *(const void **)(a1 + 48);
  v4 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  CFDictionarySetValue(v2, v3, v4);
}

@end