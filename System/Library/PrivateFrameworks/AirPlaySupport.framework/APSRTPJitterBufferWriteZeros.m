@interface APSRTPJitterBufferWriteZeros
@end

@implementation APSRTPJitterBufferWriteZeros

uint64_t ___APSRTPJitterBufferWriteZeros_block_invoke()
{
  if (gLogCategory_APSRTPJitterBuffer <= 20)
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