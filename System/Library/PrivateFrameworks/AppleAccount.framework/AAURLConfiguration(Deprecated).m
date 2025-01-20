@interface AAURLConfiguration(Deprecated)
+ (void)beneficiaryDurationBeforeNotSetupCFU;
+ (void)beneficiaryStaleInviteDuration;
@end

@implementation AAURLConfiguration(Deprecated)

+ (void)beneficiaryStaleInviteDuration
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "beneficiaryStaleInviteDuration not specified by server, using default.", v1, 2u);
}

+ (void)beneficiaryDurationBeforeNotSetupCFU
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "beneficiaryDurationBeforeNotSetupCFU not specified by server, using default.", v1, 2u);
}

@end