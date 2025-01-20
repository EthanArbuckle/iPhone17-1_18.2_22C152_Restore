@interface CFICUCreateVariableNameForStackPointer
@end

@implementation CFICUCreateVariableNameForStackPointer

CFStringRef _____CFICUCreateVariableNameForStackPointer_block_invoke(uint64_t a1)
{
  CFStringRef result = ___CFICUCreateVariableNameForStackPointerLocked(*(char **)(a1 + 40), *(const void **)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end