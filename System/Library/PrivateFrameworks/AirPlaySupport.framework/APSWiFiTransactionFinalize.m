@interface APSWiFiTransactionFinalize
@end

@implementation APSWiFiTransactionFinalize

int *___APSWiFiTransactionFinalize_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    int v2 = 90;
  }
  else {
    int v2 = 50;
  }
  result = *(int **)(a1 + 32);
  if (v2 >= *result)
  {
    if (*result != -1) {
      return (int *)LogPrintF();
    }
    result = (int *)_LogCategory_Initialize();
    if (result) {
      return (int *)LogPrintF();
    }
  }
  return result;
}

@end