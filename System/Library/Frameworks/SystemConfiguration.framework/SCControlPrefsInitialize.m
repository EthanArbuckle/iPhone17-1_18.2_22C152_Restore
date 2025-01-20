@interface SCControlPrefsInitialize
@end

@implementation SCControlPrefsInitialize

uint64_t ____SCControlPrefsInitialize_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kSCControlPrefsTypeID = result;
  return result;
}

@end