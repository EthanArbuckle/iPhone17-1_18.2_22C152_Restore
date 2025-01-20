@interface CNReputationLogger
+ (OS_os_log)performanceLog;
+ (OS_os_log)queryLog;
+ (id)describeScore:(int64_t)a3;
+ (id)obfuscate:(id)a3;
+ (id)obfuscateHandle:(id)a3;
- (void)beginQueryForHandle:(id)a3;
- (void)contactsConfirmedTrustOfEmailAddress;
- (void)contactsConfirmedTrustOfPhoneNumber;
- (void)contactsCouldNotConfirmTrustOfEmailAddress;
- (void)contactsCouldNotConfirmTrustOfPhoneNumber;
- (void)coreRecentsConfirmedTrust;
- (void)coreRecentsCouldNotConfirmTrust;
- (void)couldNotQueryContactsForEmailAddressWithError:(id)a3;
- (void)couldNotQueryContactsForPhoneNumberWithError:(id)a3;
- (void)couldNotQueryCoreRecentsWithError:(id)a3;
- (void)queryForHandle:(id)a3 didFailWithError:(id)a4;
- (void)queryForHandle:(id)a3 didFinishWithReputation:(id)a4;
- (void)reputationUnestablished;
- (void)timeToResolve:(double)a3;
@end

@implementation CNReputationLogger

- (void)beginQueryForHandle:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [(id)objc_opt_class() queryLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(id)objc_opt_class() obfuscateHandle:v3];
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "Determining trust of handle %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)queryForHandle:(id)a3 didFinishWithReputation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() queryLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(id)objc_opt_class() obfuscateHandle:v5];
    v9 = objc_msgSend((id)objc_opt_class(), "describeScore:", objc_msgSend(v6, "score"));
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "Handle '%{public}@' has reputation: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)queryForHandle:(id)a3 didFailWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() queryLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = [v5 stringValue];
    int v10 = [v8 obfuscate:v9];
    int v11 = 138543618;
    __int16 v12 = v10;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "Failed to look up handle '%{public}@': %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)timeToResolve:(double)a3
{
  id v3 = [(id)objc_opt_class() performanceLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CNReputationLogger timeToResolve:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)coreRecentsConfirmedTrust
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1909E3000, v0, v1, "Handle is trusted by CoreRecents", v2, v3, v4, v5, v6);
}

- (void)coreRecentsCouldNotConfirmTrust
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1909E3000, v0, v1, "CoreRecents could not confirm trust", v2, v3, v4, v5, v6);
}

- (void)couldNotQueryCoreRecentsWithError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() queryLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CNReputationLogger couldNotQueryCoreRecentsWithError:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)contactsConfirmedTrustOfEmailAddress
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1909E3000, v0, v1, "Handle is trusted by Contacts (email)", v2, v3, v4, v5, v6);
}

- (void)contactsCouldNotConfirmTrustOfEmailAddress
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1909E3000, v0, v1, "Contacts (email) could not confirm trust", v2, v3, v4, v5, v6);
}

- (void)couldNotQueryContactsForEmailAddressWithError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() queryLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CNReputationLogger couldNotQueryContactsForEmailAddressWithError:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)contactsConfirmedTrustOfPhoneNumber
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1909E3000, v0, v1, "Handle is trusted by Contacts (phone number)", v2, v3, v4, v5, v6);
}

- (void)contactsCouldNotConfirmTrustOfPhoneNumber
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1909E3000, v0, v1, "Contacts (phone number) could not confirm trust", v2, v3, v4, v5, v6);
}

- (void)couldNotQueryContactsForPhoneNumberWithError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() queryLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CNReputationLogger couldNotQueryContactsForPhoneNumberWithError:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)reputationUnestablished
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1909E3000, v0, v1, "No source could establish a reputation for the handle", v2, v3, v4, v5, v6);
}

+ (OS_os_log)queryLog
{
  if (queryLog_cn_once_token_14 != -1) {
    dispatch_once(&queryLog_cn_once_token_14, &__block_literal_global_96);
  }
  uint64_t v2 = (void *)queryLog_cn_once_object_14;

  return (OS_os_log *)v2;
}

uint64_t __30__CNReputationLogger_queryLog__block_invoke()
{
  queryLog_cn_once_object_14 = (uint64_t)os_log_create("com.apple.contacts.reputation", "query");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)performanceLog
{
  if (performanceLog_cn_once_token_15 != -1) {
    dispatch_once(&performanceLog_cn_once_token_15, &__block_literal_global_4_8);
  }
  uint64_t v2 = (void *)performanceLog_cn_once_object_15;

  return (OS_os_log *)v2;
}

uint64_t __36__CNReputationLogger_performanceLog__block_invoke()
{
  performanceLog_cn_once_object_15 = (uint64_t)os_log_create("com.apple.contacts.reputation", "performance");

  return MEMORY[0x1F41817F8]();
}

+ (id)describeScore:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v3 = [v4 stringWithFormat:@"unknown (%@)", v5];
  }
  else
  {
    uint64_t v3 = off_1E56B7DA0[a3];
  }

  return v3;
}

+ (id)obfuscateHandle:(id)a3
{
  uint64_t v4 = [a3 stringValue];
  uint64_t v5 = [a1 obfuscate:v4];

  return v5;
}

+ (id)obfuscate:(id)a3
{
  uint64_t v3 = obfuscate__cn_once_token_16;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&obfuscate__cn_once_token_16, &__block_literal_global_18_0);
  }
  uint64_t v5 = objc_msgSend(v4, "_cn_SHA256HashStringWithSalt:", obfuscate__cn_once_object_16);

  return v5;
}

void __32__CNReputationLogger_obfuscate___block_invoke()
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  v0 = [v3 UUIDString];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)obfuscate__cn_once_object_16;
  obfuscate__cn_once_object_16 = v1;
}

- (double)timeToResolve:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1909E3000, a1, a3, "Time to resolve: %.0fms", a5, a6, a7, a8, 0);
  return result;
}

- (void)couldNotQueryCoreRecentsWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)couldNotQueryContactsForEmailAddressWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)couldNotQueryContactsForPhoneNumberWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end