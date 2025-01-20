@interface LARatchetErrorBuilder
+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4;
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)beforeFirstUnlockWithUserInfo:(id)a3;
+ (id)biometryNotEnrolledWithUserInfo:(id)a3;
+ (id)deviceTypeNotSupportedWithUserInfo:(id)a3;
+ (id)errorNotArmedWithRatchetState:(id)a3;
+ (id)genericErrorWithDebugDescription:(id)a3;
+ (id)genericErrorWithUnderlyingError:(id)a3;
+ (id)notInteractiveErrorWithUserInfo:(id)a3;
+ (id)passcodeNotSetWithUserInfo:(id)a3;
+ (id)ratchetErrorWithError:(id)a3;
+ (id)userCustomCancelErrorWithUserInfo:(id)a3;
@end

@implementation LARatchetErrorBuilder

+ (id)errorNotArmedWithRatchetState:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[LARatchetState alloc] initWithState:v4];

  uint64_t v6 = *MEMORY[0x1E4F28228];
  v10[0] = @"RatchetState";
  v10[1] = v6;
  v11[0] = v5;
  v11[1] = @"Ratchet not ready";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [a1 _errorWithCode:0 userInfo:v7];

  return v8;
}

+ (id)genericErrorWithDebugDescription:(id)a3
{
  return (id)[a1 _errorWithCode:1 debugDescription:a3];
}

+ (id)genericErrorWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [a1 _errorWithCode:1 userInfo:v6];

  return v7;
}

+ (id)notInteractiveErrorWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:2 userInfo:a3];
}

+ (id)userCustomCancelErrorWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:3 userInfo:a3];
}

+ (id)passcodeNotSetWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:4 userInfo:a3];
}

+ (id)biometryNotEnrolledWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:5 userInfo:a3];
}

+ (id)beforeFirstUnlockWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:6 userInfo:a3];
}

+ (id)deviceTypeNotSupportedWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:7 userInfo:a3];
}

+ (id)ratchetErrorWithError:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F30B90] error:v4 hasCode:-1 subcode:6])
  {
    id v5 = [v4 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"RatchetState"];
    v7 = [a1 errorNotArmedWithRatchetState:v6];

LABEL_16:
    goto LABEL_17;
  }
  if ([MEMORY[0x1E4F30B90] error:v4 hasCode:-1004])
  {
    id v5 = [v4 userInfo];
    uint64_t v8 = [a1 notInteractiveErrorWithUserInfo:v5];
LABEL_15:
    v7 = (void *)v8;
    goto LABEL_16;
  }
  if ([MEMORY[0x1E4F30B90] error:v4 hasCode:-1027])
  {
    id v5 = [v4 userInfo];
    uint64_t v8 = [a1 deviceTypeNotSupportedWithUserInfo:v5];
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F30B90] error:v4 hasCode:-1025])
  {
    id v5 = [v4 userInfo];
    uint64_t v8 = [a1 userCustomCancelErrorWithUserInfo:v5];
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F30B90] error:v4 hasCode:-5])
  {
    id v5 = [v4 userInfo];
    uint64_t v8 = [a1 passcodeNotSetWithUserInfo:v5];
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F30B90] error:v4 hasCode:-7])
  {
    id v5 = [v4 userInfo];
    uint64_t v8 = [a1 biometryNotEnrolledWithUserInfo:v5];
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F30B90] error:v4 hasCode:-1008 subcode:1])
  {
    id v5 = [v4 userInfo];
    uint64_t v8 = [a1 beforeFirstUnlockWithUserInfo:v5];
    goto LABEL_15;
  }
  v7 = [a1 genericErrorWithUnderlyingError:v4];
LABEL_17:

  return v7;
}

+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4F28228];
  v12[0] = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  uint64_t v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  uint64_t v9 = [a1 _errorWithCode:a3 userInfo:v8];

  return v9;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.LocalAuthentication.LARatchetErrorDomain" code:a3 userInfo:a4];
}

@end