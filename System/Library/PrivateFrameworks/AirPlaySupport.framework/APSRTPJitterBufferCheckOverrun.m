@interface APSRTPJitterBufferCheckOverrun
@end

@implementation APSRTPJitterBufferCheckOverrun

uint64_t ___APSRTPJitterBufferCheckOverrun_block_invoke()
{
  if (gLogCategory_APSRTPJitterBuffer <= 30)
  {
    if (gLogCategory_APSRTPJitterBuffer != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

@end