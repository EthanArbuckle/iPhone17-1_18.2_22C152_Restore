@interface CNNetworkRegisterClass
@end

@implementation CNNetworkRegisterClass

uint64_t ____CNNetworkRegisterClass_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kCNNetworkTypeID = result;
  return result;
}

@end