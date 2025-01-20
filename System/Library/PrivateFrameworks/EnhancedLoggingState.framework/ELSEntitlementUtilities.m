@interface ELSEntitlementUtilities
+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4;
+ (BOOL)currentProcessHasEntitlement:(id)a3;
+ (id)entitlementMissingMessage;
+ (void)assertCurrentProcessHasEntitlement;
@end

@implementation ELSEntitlementUtilities

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
    v6 = ELSLogHandleForCategory(11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ELSEntitlementUtilities currentProcessHasEntitlement:](v6);
    }

    BOOL value = 0;
  }

  return value;
}

+ (void)assertCurrentProcessHasEntitlement
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = +[ELSEntitlementUtilities entitlementMissingMessage];
  int v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21F731000, a1, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v3, 0xCu);
}

+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  [a4 UTF8String];
  v4 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL value = xpc_BOOL_get_value(v4);
  }
  else
  {
    v7 = ELSLogHandleForCategory(11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ELSEntitlementUtilities auditToken:hasEntitlement:](v7);
    }

    BOOL value = 0;
  }

  return value;
}

+ (id)entitlementMissingMessage
{
  uint64_t v2 = ELSInternalString(@"ELS_CONTACT_MESSAGE");
  int v3 = (void *)v2;
  if (v2) {
    v4 = (__CFString *)v2;
  }
  else {
    v4 = &stru_26D1285D8;
  }
  uint64_t v5 = [@"Missing entitlement to use Enhanced Logging State. " stringByAppendingString:v4];

  return v5;
}

+ (void)currentProcessHasEntitlement:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F731000, log, OS_LOG_TYPE_ERROR, "Unable to find entitlement for current process", v1, 2u);
}

+ (void)auditToken:(os_log_t)log hasEntitlement:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F731000, log, OS_LOG_TYPE_ERROR, "Unable to find entitlement", v1, 2u);
}

@end