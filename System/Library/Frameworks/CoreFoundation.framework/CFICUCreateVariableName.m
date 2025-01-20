@interface CFICUCreateVariableName
@end

@implementation CFICUCreateVariableName

CFStringRef _____CFICUCreateVariableName_block_invoke(uint64_t a1)
{
  CFStringRef result = ___CFICUCreateVariableNameLocked(*(char **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end