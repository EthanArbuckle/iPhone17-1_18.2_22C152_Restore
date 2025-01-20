@interface APSRTPJitterBufferSimCheckOverrun
@end

@implementation APSRTPJitterBufferSimCheckOverrun

uint64_t ___APSRTPJitterBufferSimCheckOverrun_block_invoke()
{
  if (gLogCategory_APSRTPJitterBufferSim <= 50)
  {
    if (gLogCategory_APSRTPJitterBufferSim != -1) {
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