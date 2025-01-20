@interface CNFSetiMessageLogLevel
@end

@implementation CNFSetiMessageLogLevel

uint64_t (*__CNFSetiMessageLogLevel_block_invoke())(void, void)
{
  result = (uint64_t (*)(void, void))CUTWeakLinkSymbol();
  CNFSetiMessageLogLevel__MMCSSetLogLevel = result;
  return result;
}

@end