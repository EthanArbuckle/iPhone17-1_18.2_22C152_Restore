@interface CloseAllCommChannels
@end

@implementation CloseAllCommChannels

uint64_t __endpointAggregate_CloseAllCommChannels_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t result = endpointAggregate_CloseCommChannel(*(void *)(a1 + 32), a2);
  if (result)
  {
    if (gLogCategory_APEndpointAggregate <= 60)
    {
      if (gLogCategory_APEndpointAggregate != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

@end