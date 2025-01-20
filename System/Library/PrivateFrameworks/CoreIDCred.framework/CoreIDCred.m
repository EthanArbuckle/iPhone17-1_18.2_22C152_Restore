void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

__CFString *DCCredentialPayloadFormatToString(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_264228BA0[a1];
  }
}

__CFString *DCCredentialPayloadProtectionPolicyToString(uint64_t a1)
{
  v1 = @"Unknown";
  if (a1 == 1) {
    v1 = @"Biometric";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Standard";
  }
}

__CFString *DCCredentialPayloadProtectionTypeToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_264228BC8[a1];
  }
}

__CFString *DCCredentialCryptoKeyTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_264228BE0[a1];
  }
}

__CFString *DCCredentialCryptoKeyUsageToString(unint64_t a1)
{
  if (a1 > 5) {
    return @"Unknown";
  }
  else {
    return off_264228C00[a1];
  }
}

id DC_LOG_CLIENT()
{
  if (DC_LOG_CLIENT_once != -1) {
    dispatch_once(&DC_LOG_CLIENT_once, &__block_literal_global);
  }
  v0 = (void *)DC_LOG_CLIENT_log;

  return v0;
}

__CFString *DCCredentialStateToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Invalid";
  }
  else {
    return off_264228D70[a1 - 1];
  }
}

__CFString *DCCredentialReaderAuthenticationPolicyToString(uint64_t a1)
{
  v1 = @"Unknown";
  if (a1 == 1) {
    v1 = @"Identity";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"None";
  }
}

__CFString *DCCredentialPresentmentAuthPolicyToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_264228D88[a1];
  }
}

__CFString *DCCredentialElementNumericTypeHintToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_264228DA0[a1];
  }
}

__CFString *DCPresentmentTypeToString(uint64_t a1)
{
  v1 = @"Unknown";
  if (a1 == 1) {
    v1 = @"Digital";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Physical";
  }
}

__CFString *DCPresentmentSessionEncryptionModeToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_264228DC0[a1];
  }
}

__CFString *DCPresentmentSessionResponseEncryptionModeToString(uint64_t a1)
{
  v1 = @"Unknown";
  if (a1 == 1) {
    v1 = @"Apple HPKE";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Disabled";
  }
}

__CFString *DCPresentmentResponseStatusToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_264228DE0[a1];
  }
}

__CFString *DCPresentmentElementRetentionIntentToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_264228DF8[a1 - 1];
  }
}

__CFString *DCPresentmentTransportKeySpecificationToString(uint64_t a1)
{
  if (a1 == 1) {
    return @"ISO18013-5";
  }
  else {
    return @"Unknown";
  }
}

id DCPresentmentElementFallbackModeToString(char a1)
{
  v2 = [MEMORY[0x263F089D8] string];
  [v2 appendFormat:@"["];
  if (a1)
  {
    v3 = @"ageOverToAgeInYears";
  }
  else
  {
    if ((a1 & 2) == 0) {
      goto LABEL_6;
    }
    v3 = @"ageOverToNearestAgeOver";
  }
  [v2 appendFormat:v3];
LABEL_6:
  [v2 appendFormat:@"]"];

  return v2;
}

__CFString *DCPresentmentMessageEncodingFormatToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_264228E10[a1];
  }
}

id DC_LOG_CLIENT_0()
{
  if (DC_LOG_CLIENT_once_0 != -1) {
    dispatch_once(&DC_LOG_CLIENT_once_0, &__block_literal_global_0);
  }
  v0 = (void *)DC_LOG_CLIENT_log_0;

  return v0;
}

__CFString *DCCredentialAuthACLTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_264229268[a1];
  }
}

id DC_LOG_CLIENT_1()
{
  if (DC_LOG_CLIENT_once_1 != -1) {
    dispatch_once(&DC_LOG_CLIENT_once_1, &__block_literal_global_1);
  }
  v0 = (void *)DC_LOG_CLIENT_log_1;

  return v0;
}

id DC_LOG_MILESTONE_LOG()
{
  if (DC_LOG_MILESTONE_LOG_once != -1) {
    dispatch_once(&DC_LOG_MILESTONE_LOG_once, &__block_literal_global_202);
  }
  v0 = (void *)DC_LOG_MILESTONE_LOG_log;

  return v0;
}

id DC_LOG_CLIENT_2()
{
  if (DC_LOG_CLIENT_once_2 != -1) {
    dispatch_once(&DC_LOG_CLIENT_once_2, &__block_literal_global_2);
  }
  v0 = (void *)DC_LOG_CLIENT_log_2;

  return v0;
}

id DC_LOG_CLIENT_3()
{
  if (DC_LOG_CLIENT_once_3 != -1) {
    dispatch_once(&DC_LOG_CLIENT_once_3, &__block_literal_global_3);
  }
  v0 = (void *)DC_LOG_CLIENT_log_3;

  return v0;
}

uint64_t sub_214B2CB5C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for BundleToken()
{
  return self;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}