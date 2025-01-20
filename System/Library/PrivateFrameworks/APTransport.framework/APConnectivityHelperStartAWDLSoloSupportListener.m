@interface APConnectivityHelperStartAWDLSoloSupportListener
@end

@implementation APConnectivityHelperStartAWDLSoloSupportListener

void ___APConnectivityHelperStartAWDLSoloSupportListener_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___APConnectivityHelperStartAWDLSoloSupportListener_block_invoke_2;
  v4[3] = &unk_1E688BFA0;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_sync(v3, v4);
}

void *___APConnectivityHelperStartAWDLSoloSupportListener_block_invoke_2(void *result)
{
  v1 = (unsigned char *)result[5];
  if (!v1[200])
  {
    result = (void *)result[4];
    if (result)
    {
      v1[136] = [result supportsSoloMode];
      v1[137] = 1;
      if (gLogCategory_APConnectivityHelper <= 40
        && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (_APConnectivityHelperSendAWDLSoloSupportEvent((uint64_t)v1)) {
        APSLogErrorAt();
      }
      return (void *)_APConnectivityHelperEnsureAWDLSoloSupportListenerStopped((uint64_t)v1);
    }
  }
  return result;
}

@end