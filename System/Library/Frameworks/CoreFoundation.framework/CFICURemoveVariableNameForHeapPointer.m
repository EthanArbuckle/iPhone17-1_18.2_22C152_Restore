@interface CFICURemoveVariableNameForHeapPointer
@end

@implementation CFICURemoveVariableNameForHeapPointer

void _____CFICURemoveVariableNameForHeapPointer_block_invoke(uint64_t a1)
{
  if (variableNamesByHeapPointer) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)variableNamesByHeapPointer, *(const void **)(a1 + 32));
  }
}

@end