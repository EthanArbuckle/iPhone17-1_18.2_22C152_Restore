@interface IPMonitorControlRegisterClass
@end

@implementation IPMonitorControlRegisterClass

uint64_t ____IPMonitorControlRegisterClass_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kIPMonitorControlTypeID = result;
  return result;
}

@end