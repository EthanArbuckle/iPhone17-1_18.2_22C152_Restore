@interface APConnectivityHelper
@end

@implementation APConnectivityHelper

uint64_t ___APConnectivityHelper_getActiveHelpers_block_invoke()
{
  uint64_t result = FigCFWeakReferenceTableCreate();
  if (result)
  {
    uint64_t result = gLogCategory_APConnectivityHelper;
    if (gLogCategory_APConnectivityHelper <= 100) {
      uint64_t result = ___APConnectivityHelper_getActiveHelpers_block_invoke_cold_1(gLogCategory_APConnectivityHelper);
    }
    __break(1u);
  }
  return result;
}

uint64_t ___APConnectivityHelper_getActiveHelpers_block_invoke_cold_1(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

@end