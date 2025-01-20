@interface DSEntitlementUtilities
+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4;
+ (BOOL)currentProcessHasEntitlement:(id)a3;
@end

@implementation DSEntitlementUtilities

+ (BOOL)currentProcessHasEntitlement:(id)a3
{
  [a3 UTF8String];
  v3 = (void *)xpc_copy_entitlement_for_self();
  v4 = v3;
  if (v3)
  {
    BOOL value = xpc_BOOL_get_value(v3);
  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[DSEntitlementUtilities currentProcessHasEntitlement:](v6);
    }

    BOOL value = 0;
  }

  return value;
}

+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  [a4 UTF8String];
  v4 = (void *)xpc_copy_entitlement_for_token();
  v5 = v4;
  if (v4)
  {
    BOOL value = xpc_BOOL_get_value(v4);
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[DSEntitlementUtilities auditToken:hasEntitlement:](v7);
    }

    BOOL value = 0;
  }

  return value;
}

+ (void)currentProcessHasEntitlement:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to find entitlement for current process", v1, 2u);
}

+ (void)auditToken:(os_log_t)log hasEntitlement:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to find entitlement", v1, 2u);
}

@end