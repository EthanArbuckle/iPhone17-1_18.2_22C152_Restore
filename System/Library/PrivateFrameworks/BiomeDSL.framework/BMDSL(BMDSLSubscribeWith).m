@interface BMDSL(BMDSLSubscribeWith)
@end

@implementation BMDSL(BMDSLSubscribeWith)

- (void)subscribeOn:()BMDSLSubscribeWith with:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B3086000, log, OS_LOG_TYPE_FAULT, "subscribeOn:with: is no longer supported", v1, 2u);
}

@end