@interface LSDatabaseCreateWithAccessContext
@end

@implementation LSDatabaseCreateWithAccessContext

_LSDatabase *___LSDatabaseCreateWithAccessContext_block_invoke(uint64_t a1, unsigned int a2)
{
  result = (_LSDatabase *)objc_loadWeakRetained((id *)(a1 + 32));
  if (result) {
    _LSDatabaseHandleUnitExhaustion(result, a2);
  }
  return result;
}

@end