@interface CLFBaseCommunicationLimitSettings(Additions)
@end

@implementation CLFBaseCommunicationLimitSettings(Additions)

- (void)setOutgoingCommunicationLimit:()Additions .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a2 incomingCommunicationLimit];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_217F54000, a3, OS_LOG_TYPE_FAULT, "Attempted to set outgoing communication limit to \"%@\", which was less restrictive than incoming communication limit \"%@\".", (uint8_t *)&v6, 0x16u);
}

@end