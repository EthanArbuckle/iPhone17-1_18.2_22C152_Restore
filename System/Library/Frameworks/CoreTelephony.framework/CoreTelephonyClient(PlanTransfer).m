@interface CoreTelephonyClient(PlanTransfer)
@end

@implementation CoreTelephonyClient(PlanTransfer)

- (void)carrierOneTimeCodeSendersWithCompletion:()PlanTransfer .cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "invalid parameter - completion is nil", v0, 2u);
}

@end