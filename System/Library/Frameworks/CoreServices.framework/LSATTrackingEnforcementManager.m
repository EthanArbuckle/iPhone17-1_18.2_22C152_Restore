@interface LSATTrackingEnforcementManager
+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3;
@end

@implementation LSATTrackingEnforcementManager

+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3
{
  if ((Class)getATTrackingEnforcementManagerClass[0]())
  {
    Class v4 = (Class)getATTrackingEnforcementManagerClass[0]();
    return [(objc_class *)v4 shouldEnforceTrackingWithReasonCode:a3];
  }
  else
  {
    v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[LSATTrackingEnforcementManager shouldEnforceTrackingWithReasonCode:](v6);
    }

    if (a3) {
      *a3 = 0;
    }
    return 1;
  }
}

+ (void)shouldEnforceTrackingWithReasonCode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Class ATTrackingEnforcementManager not found. Enforcing tracking restrictions.", v1, 2u);
}

@end