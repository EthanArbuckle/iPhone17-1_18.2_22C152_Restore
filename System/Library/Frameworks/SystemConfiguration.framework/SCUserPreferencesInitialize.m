@interface SCUserPreferencesInitialize
@end

@implementation SCUserPreferencesInitialize

uint64_t ____SCUserPreferencesInitialize_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kSCUserPreferencesTypeID = result;
  return result;
}

@end