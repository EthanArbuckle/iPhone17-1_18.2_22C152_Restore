@interface LAPSErrorBuilder
+ (BOOL)checkError:(id)a3 hasCode:(int64_t)a4;
+ (BOOL)checkErrorIsInteractive:(id)a3;
+ (NSError)userCanceledError;
+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4;
+ (id)_genericErrorWithDebugDescription:(id)a3;
+ (id)_genericErrorWithUserInfo:(id)a3;
+ (id)clientCanceledError;
+ (id)deniedByLAError;
+ (id)deniedByMDMError;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)genericError;
+ (id)genericErrorWithUnderlyingError:(id)a3;
+ (id)genericErrorWithUnderlyingError:(id)a3 debugDescription:(id)a4;
+ (id)invalidPasscodeError;
+ (id)invalidPasscodeErrorWithFailedAttemptsCount:(int64_t)a3;
+ (id)invalidPasscodeErrorWithFailedAttemptsCount:(int64_t)a3 backoffTimeout:(int64_t)a4;
+ (id)newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:(id)a3;
+ (id)newPasscodeIsTooEasyError;
+ (id)systemCanceledErrorWithDebugDescription:(id)a3;
+ (id)tooManyAttemptsError;
@end

@implementation LAPSErrorBuilder

+ (NSError)userCanceledError
{
  return (NSError *)[a1 _errorWithCode:0 debugDescription:@"User canceled"];
}

+ (id)clientCanceledError
{
  return (id)[a1 _errorWithCode:1 debugDescription:@"Client canceled"];
}

+ (id)systemCanceledErrorWithDebugDescription:(id)a3
{
  return (id)[a1 _errorWithCode:2 debugDescription:a3];
}

+ (id)invalidPasscodeError
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F07F80];
  v7[0] = @"Invalid passcode";
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [a1 errorWithCode:4 userInfo:v3];

  return v4;
}

+ (id)invalidPasscodeErrorWithFailedAttemptsCount:(int64_t)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = *MEMORY[0x263F07F80];
  v8[1] = @"LAPSFailedAttemptsErrorKey";
  v9[0] = @"Invalid passcode";
  v4 = [NSNumber numberWithInteger:a3];
  v9[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v6 = [a1 errorWithCode:4 userInfo:v5];

  return v6;
}

+ (id)invalidPasscodeErrorWithFailedAttemptsCount:(int64_t)a3 backoffTimeout:(int64_t)a4
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F07F80];
  v13[0] = @"Invalid passcode";
  v12[0] = v6;
  v12[1] = @"LAPSFailedAttemptsErrorKey";
  v7 = [NSNumber numberWithInteger:a3];
  v13[1] = v7;
  v12[2] = @"LAPSBackOffTimeoutErrorKey";
  v8 = [NSNumber numberWithInteger:a4];
  v13[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  v10 = [a1 errorWithCode:4 userInfo:v9];

  return v10;
}

+ (id)newPasscodeIsTooEasyError
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    +[LAPSErrorBuilder newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:]();
  }
  v5 = v4;
  uint64_t v6 = *MEMORY[0x263F08320];
  v10[0] = *MEMORY[0x263F07F80];
  v10[1] = v6;
  v11[0] = @"Passcode does not meet requirements";
  v11[1] = v4;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [a1 errorWithCode:6 userInfo:v7];

  return v8;
}

+ (id)tooManyAttemptsError
{
  return (id)[a1 _errorWithCode:3 debugDescription:@"User failed to provided correct recovery passcode too many times"];
}

+ (id)deniedByMDMError
{
  return (id)[a1 _errorWithCode:7 debugDescription:@"Operation not allowed by MDM"];
}

+ (id)deniedByLAError
{
  return (id)[a1 _errorWithCode:8 debugDescription:@"Operation not allowed by LA"];
}

+ (id)genericError
{
  return (id)[a1 _genericErrorWithUserInfo:0];
}

+ (id)genericErrorWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    +[LAPSErrorBuilder genericErrorWithUnderlyingError:]();
  }
  v5 = v4;
  uint64_t v9 = *MEMORY[0x263F08608];
  v10[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [a1 errorWithCode:9 userInfo:v6];

  return v7;
}

+ (id)genericErrorWithUnderlyingError:(id)a3 debugDescription:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F07F80];
  v13[0] = *MEMORY[0x263F08608];
  v13[1] = v6;
  v14[0] = a3;
  v14[1] = a4;
  v7 = NSDictionary;
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11 = [a1 errorWithCode:9 userInfo:v10];

  return v11;
}

+ (BOOL)checkError:(id)a3 hasCode:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 domain];
  int v7 = [v6 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"];

  if (v7) {
    BOOL v8 = [v5 code] == a4;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)checkErrorIsInteractive:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"com.apple.LocalAuthentication.LAPSErrorDomain"])
  {
    id v5 = [v3 userInfo];
    uint64_t v6 = [v5 objectForKey:@"LAPSInteractiveErrorKey"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.LocalAuthentication.LAPSErrorDomain" code:a3 userInfo:a4];
}

+ (id)_genericErrorWithDebugDescription:(id)a3
{
  return (id)[a1 _errorWithCode:9 debugDescription:a3];
}

+ (id)_genericErrorWithUserInfo:(id)a3
{
  return (id)[a1 errorWithCode:9 userInfo:a3];
}

+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F07F80];
  v12[0] = a4;
  uint64_t v6 = NSDictionary;
  id v7 = a4;
  BOOL v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v5 errorWithDomain:@"com.apple.LocalAuthentication.LAPSErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (void)newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:.cold.1()
{
  __assert_rtn("+[LAPSErrorBuilder newPasscodeDoesNotMeetRequirementsErrorWithLocalizedDescription:]", "LAPSError.m", 67, "localizedDescription != nil");
}

+ (void)genericErrorWithUnderlyingError:.cold.1()
{
  __assert_rtn("+[LAPSErrorBuilder genericErrorWithUnderlyingError:]", "LAPSError.m", 96, "error != nil");
}

@end