@interface SOErrorHelper
+ (BOOL)error:(id)a3 hasCode:(int64_t)a4;
+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5;
+ (id)deniedBundleIdentifier:(id)a3;
+ (id)doNotHandleBreakingRecursionWithCallerBundleIdentifier:(id)a3;
+ (id)errorNotSupported;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4 moreInfo:(id)a5;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4 suberror:(id)a5;
+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 message:(id)a5;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)internalErrorWithMessage:(id)a3;
+ (id)invalidURLError:(id)a3;
+ (id)missingEntitlementError:(id)a3;
+ (id)parameterErrorWithMessage:(id)a3;
+ (id)silentInternalErrorWithMessage:(id)a3;
+ (void)raiseExceptionOnError:(id)a3;
@end

@implementation SOErrorHelper

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 moreInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = objc_opt_new();
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v8) {
    [v10 addEntriesFromDictionary:v8];
  }
  v11 = +[SOErrorHelper errorWithCode:a3 userInfo:v10];

  return v11;
}

+ (id)silentInternalErrorWithMessage:(id)a3
{
  return +[SOErrorHelper errorWithCode:-1000 message:a3];
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AppSSO.AuthorizationError" code:a3 userInfo:a4];
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  return +[SOErrorHelper errorWithCode:a3 message:a4 moreInfo:0];
}

+ (id)errorWithCode:(int64_t)a3
{
  return +[SOErrorHelper errorWithCode:a3 message:0];
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 suberror:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F28A50];
  v14[0] = a5;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = +[SOErrorHelper errorWithCode:a3 message:v9 moreInfo:v10];

  return v11;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 message:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = @"Subcode";
  id v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = a5;
  id v9 = [v7 numberWithInteger:a4];
  v14[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = +[SOErrorHelper errorWithCode:a3 message:v8 moreInfo:v10];

  return v11;
}

+ (id)internalErrorWithMessage:(id)a3
{
  v3 = +[SOErrorHelper silentInternalErrorWithMessage:a3];
  v4 = SO_LOG_SOErrorHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[SOErrorHelper internalErrorWithMessage:]();
  }

  return v3;
}

+ (id)parameterErrorWithMessage:(id)a3
{
  v3 = +[SOErrorHelper errorWithCode:-9 message:a3];
  v4 = SO_LOG_SOErrorHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[SOErrorHelper internalErrorWithMessage:]();
  }

  return v3;
}

+ (id)missingEntitlementError:(id)a3
{
  v3 = [NSString stringWithFormat:@"Caller is missing the required '%@' entitlement.", a3];
  v4 = +[SOErrorHelper errorWithCode:-11 message:v3];

  v5 = SO_LOG_SOErrorHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SOErrorHelper internalErrorWithMessage:]();
  }

  return v4;
}

+ (id)invalidURLError:(id)a3
{
  id v3 = a3;
  v4 = +[SOErrorHelper errorWithCode:-9 message:@"not AppSSO URL"];
  v5 = SO_LOG_SOErrorHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SOErrorHelper invalidURLError:](v3, v5);
  }

  return v4;
}

+ (id)doNotHandleBreakingRecursionWithCallerBundleIdentifier:(id)a3
{
  id v3 = [NSString stringWithFormat:@"breaking calling recursion for caller with bundleIdentifier: %@", a3];
  v4 = +[SOErrorHelper errorWithCode:-5 message:v3];

  v5 = SO_LOG_SOErrorHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SOErrorHelper internalErrorWithMessage:]();
  }

  return v4;
}

+ (id)deniedBundleIdentifier:(id)a3
{
  id v3 = [NSString stringWithFormat:@"denied caller with bundleIdentifier: %@", a3];
  v4 = +[SOErrorHelper errorWithCode:-5 message:v3];

  v5 = SO_LOG_SOErrorHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SOErrorHelper internalErrorWithMessage:]();
  }

  return v4;
}

+ (id)errorNotSupported
{
  v2 = +[SOErrorHelper internalErrorWithMessage:@"This call is not supported on iOS."];
  id v3 = SO_LOG_SOErrorHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[SOErrorHelper internalErrorWithMessage:]();
  }

  return v2;
}

+ (void)raiseExceptionOnError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    int v6 = [v5 isEqualToString:@"com.apple.AppSSO.AuthorizationError"];

    if (v6 && [v4 code] == -9) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", v4 format];
    }
    id v7 = SO_LOG_SOErrorHelper();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SOErrorHelper raiseExceptionOnError:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unexpected error: %@", v4 format];
  }
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4
{
  id v5 = a3;
  int v6 = [v5 domain];
  if ([v6 isEqualToString:@"com.apple.AppSSO.AuthorizationError"]) {
    BOOL v7 = [v5 code] == a4;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5
{
  id v7 = a3;
  id v8 = [v7 userInfo];
  id v9 = [v8 objectForKeyedSubscript:@"Subcode"];

  v10 = [v7 domain];
  if ([v10 isEqualToString:@"com.apple.AppSSO.AuthorizationError"])
  {
    BOOL v11 = 0;
    if ([v7 code] == a4 && v9) {
      BOOL v11 = [v9 integerValue] == a5;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (void)internalErrorWithMessage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

+ (void)invalidURLError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 absoluteString];
  int v4 = 141558275;
  uint64_t v5 = 1752392040;
  __int16 v6 = 2117;
  id v7 = v3;
  _os_log_error_impl(&dword_1D7206000, a2, OS_LOG_TYPE_ERROR, "not AppSSO URL: %{sensitive, mask.hash}@", (uint8_t *)&v4, 0x16u);
}

+ (void)raiseExceptionOnError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "Raising exception due to error: %{public}@", v2, v3, v4, v5, v6);
}

@end