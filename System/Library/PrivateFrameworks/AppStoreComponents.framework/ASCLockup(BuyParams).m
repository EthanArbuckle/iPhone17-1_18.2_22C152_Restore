@interface ASCLockup(BuyParams)
@end

@implementation ASCLockup(BuyParams)

- (void)_buyParamsWithCompletionBlock:()BuyParams .cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not able to return buy params - lockup feature was missing.", v0, 2u);
}

- (void)_buyParamsWithCompletionBlock:()BuyParams .cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Host app attempted to get lockup buy params, but was not entitled.", v0, 2u);
}

@end