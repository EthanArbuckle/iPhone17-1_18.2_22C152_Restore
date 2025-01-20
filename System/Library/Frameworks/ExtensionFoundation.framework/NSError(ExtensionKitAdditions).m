@interface NSError(ExtensionKitAdditions)
+ (id)_EX_errorWithCode:()ExtensionKitAdditions description:;
+ (id)_EX_errorWithCode:()ExtensionKitAdditions underlyingError:;
+ (id)_EX_hostIsLackingRequiredEntitlementErrorWithHostPID:()ExtensionKitAdditions requiredEntitlements:;
+ (id)_EX_processExitedErrorWithName:()ExtensionKitAdditions pid:;
+ (uint64_t)_EX_parameterError;
+ (uint64_t)_EX_unimplementedError;
@end

@implementation NSError(ExtensionKitAdditions)

+ (uint64_t)_EX_unimplementedError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
}

+ (uint64_t)_EX_parameterError
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
}

+ (id)_EX_errorWithCode:()ExtensionKitAdditions description:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)_EX_errorWithCode:()ExtensionKitAdditions underlyingError:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)_EX_processExitedErrorWithName:()ExtensionKitAdditions pid:
{
  id v5 = v4 = (void *)MEMORY[0x1E4F28C58];
  id v6 = objc_msgSend(v4, "_EX_errorWithCode:description:", 15, v5);

  return v6;
}

+ (id)_EX_hostIsLackingRequiredEntitlementErrorWithHostPID:()ExtensionKitAdditions requiredEntitlements:
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  v13[0] = *MEMORY[0x1E4F28568];
  id v6 = NSString;
  id v7 = a4;
  v8 = objc_msgSend(v6, "stringWithFormat:", @"Host with PID: %d is missing entitlements.", a3, v13[0]);
  v14[0] = v8;
  v13[1] = *MEMORY[0x1E4F28588];
  v9 = [NSString stringWithFormat:@"Required entitlements are: %@", v7];

  v14[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = [v5 errorWithDomain:@"com.apple.extensionKit.errorDomain" code:7 userInfo:v10];

  return v11;
}

@end