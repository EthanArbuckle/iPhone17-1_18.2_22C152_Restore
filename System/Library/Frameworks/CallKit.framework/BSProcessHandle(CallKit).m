@interface BSProcessHandle(CallKit)
- (id)cx_applicationIdentifier;
- (id)cx_applicationRecord;
- (id)cx_capabilities;
- (void)cx_applicationRecord;
@end

@implementation BSProcessHandle(CallKit)

- (id)cx_applicationIdentifier
{
  v1 = [a1 valueForEntitlement:@"application-identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)cx_applicationRecord
{
  id v2 = [a1 bundleIdentifier];
  if ([v2 length])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F223C8], "cx_applicationRecordForBundleIdentifier:", v2);
  }
  else
  {
    v4 = CXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(BSProcessHandle(CallKit) *)(uint64_t)a1 cx_applicationRecord];
    }

    v3 = 0;
  }

  return v3;
}

- (id)cx_capabilities
{
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  v3 = [a1 valueForEntitlement:@"com.apple.callkit"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

    id v2 = (void *)v4;
  }

  return v2;
}

- (void)cx_applicationRecord
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Could not obtain bundle identifier from process handle %@", (uint8_t *)&v2, 0xCu);
}

@end