@interface APSPowerLog
@end

@implementation APSPowerLog

uint64_t (*__APSPowerLog_block_invoke())(void, void, void, void)
{
  result = (uint64_t (*)(void, void, void, void))CUTWeakLinkSymbol();
  APSPowerLog__PLLogTimeSensitiveRegisteredEvent = result;
  return result;
}

@end