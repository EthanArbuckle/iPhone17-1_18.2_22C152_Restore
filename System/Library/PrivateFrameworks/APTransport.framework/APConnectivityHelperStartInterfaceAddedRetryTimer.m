@interface APConnectivityHelperStartInterfaceAddedRetryTimer
@end

@implementation APConnectivityHelperStartInterfaceAddedRetryTimer

uint64_t ___APConnectivityHelperStartInterfaceAddedRetryTimer_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = 0;
  if (gLogCategory_APConnectivityHelper <= 30
    && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = v1;
    LogPrintF();
  }
  objc_msgSend(*(id *)(v1 + 40), "stopMonitoringEventType:", 10, v3);
  uint64_t result = [*(id *)(v1 + 40) startMonitoringEventType:10 error:&v4];
  if ((result & 1) == 0 && gLogCategory_APConnectivityHelper <= 90)
  {
    if (gLogCategory_APConnectivityHelper != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(v1 + 80)) {
    uint64_t result = (uint64_t)_APConnectivityHelperTrySettingWiFiDevice(v1);
  }
  if (*(unsigned char *)(v1 + 177)) {
    return _APConnectivityHelperTrySettingAWDLDevice(v1);
  }
  return result;
}

void ___APConnectivityHelperStartInterfaceAddedRetryTimer_block_invoke_2(uint64_t a1)
{
}

@end