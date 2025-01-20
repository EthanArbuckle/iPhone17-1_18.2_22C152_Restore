@interface CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded
@end

@implementation CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  if (!*(unsigned char *)(a2 + 54))
  {
    v6 = (void **)(a1 + 32);
    xpc_object_t EntitlementForMessageWithLockedContext = _CFPrefsGetEntitlementForMessageWithLockedContext(*(void **)(a1 + 32), "com.apple.private.defaults-impersonate", a2);
    if (!EntitlementForMessageWithLockedContext
      || (v8 = EntitlementForMessageWithLockedContext,
          object_getClass(EntitlementForMessageWithLockedContext) != (Class)off_1ECE0A670)
      || !xpc_BOOL_get_value(v8))
    {
      int v9 = *(unsigned __int8 *)(a2 + 52);
      if (v9 == 1) {
        return;
      }
      if (v9 == 255)
      {
        int v10 = _CFPrefsSandboxCheckForMessage_0(*v6);
        *(unsigned char *)(a2 + 52) = v10 != 0;
        if (v10) {
          return;
        }
      }
      memset(buffer, 0, sizeof(buffer));
      v11 = *v6;
      size_t length = 0;
      long long v18 = 0u;
      long long v19 = 0u;
      data = (long long *)xpc_dictionary_get_data(v11, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        long long v13 = data[1];
        long long v18 = *data;
        long long v19 = v13;
      }
      else
      {
        if (!xpc_dictionary_get_remote_connection(v11))
        {
          xpc_object_t value = xpc_dictionary_get_value(v11, "connection");
          if (!value || object_getClass(value) != (Class)off_1ECE0A678) {
            ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_2();
          }
        }
        xpc_connection_get_audit_token();
      }
      proc_name(SDWORD1(v19), buffer, 0x100u);
      v15 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_1((uint64_t)buffer, (void **)(a1 + 32), v15);
      }
    }
  }
  xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 32), "CFPreferencesAuditToken", *(const void **)(a1 + 40), *(void *)(a1 + 48));
  if (!*(unsigned char *)(a2 + 54))
  {
    v4 = *(void **)(a2 + 32);
    if (v4)
    {
      *(void *)(a2 + 32) = 0;
      xpc_release(v4);
    }
    v5 = *(const void **)(a2 + 40);
    if (v5)
    {
      *(void *)(a2 + 40) = 0;
      CFRelease(v5);
    }
    *(unsigned char *)(a2 + 54) = 1;
  }
}

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_1(uint64_t a1, void **a2, NSObject *a3)
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  int v5 = _CFPrefsPIDForMessage(*a2);
  int v6 = 136446466;
  uint64_t v7 = a1;
  __int16 v8 = 1026;
  int v9 = v5;
  _os_log_fault_impl(&dword_182B90000, a3, OS_LOG_TYPE_FAULT, "Allowing process impersonation by process %{public}s (%{public}d) despite not having the com.apple.private.defaults-impersonate entitlement due to it not being sandboxed. Please add com.apple.private.defaults-impersonate instead, this will stop working in the future.", (uint8_t *)&v6, 0x12u);
}

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_2()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end