@interface APSRTPJitterBufferSimInitializeWritePointers
@end

@implementation APSRTPJitterBufferSimInitializeWritePointers

uint64_t ___APSRTPJitterBufferSimInitializeWritePointers_block_invoke()
{
  if (gLogCategory_APSRTPJitterBufferSim <= 30)
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