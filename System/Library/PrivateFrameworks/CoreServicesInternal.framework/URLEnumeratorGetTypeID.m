@interface URLEnumeratorGetTypeID
@end

@implementation URLEnumeratorGetTypeID

uint64_t ___URLEnumeratorGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  _kCFURLEnumeratorTypeID = result;
  return result;
}

@end