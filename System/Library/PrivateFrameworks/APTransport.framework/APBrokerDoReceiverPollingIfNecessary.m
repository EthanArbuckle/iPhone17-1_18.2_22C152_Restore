@interface APBrokerDoReceiverPollingIfNecessary
@end

@implementation APBrokerDoReceiverPollingIfNecessary

void ___APBrokerDoReceiverPollingIfNecessary_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 112))
  {
    if (gLogCategory_APBrokerGroup <= 50)
    {
      if (gLogCategory_APBrokerGroup != -1 || (v3 = _LogCategory_Initialize(), uint64_t v1 = *(void *)(a1 + 32), v3))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(a1 + 32);
      }
    }
    v4 = *(NSObject **)(v1 + 120);
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * *(void *)(a1 + 40));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

@end