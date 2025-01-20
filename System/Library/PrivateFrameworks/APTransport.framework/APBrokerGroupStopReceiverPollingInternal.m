@interface APBrokerGroupStopReceiverPollingInternal
@end

@implementation APBrokerGroupStopReceiverPollingInternal

void ___APBrokerGroupStopReceiverPollingInternal_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 120);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 120));
    dispatch_release(v3);
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 112))
  {
    *(unsigned char *)(v2 + 112) = 0;
    if (gLogCategory_APBrokerGroup <= 50
      && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

@end