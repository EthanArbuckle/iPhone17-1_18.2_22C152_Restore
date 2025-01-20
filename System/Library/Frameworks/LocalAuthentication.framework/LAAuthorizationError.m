@interface LAAuthorizationError
+ (BOOL)isResourceNotFoundError:(id)a3;
+ (id)genericErrorWithMessage:(id)a3;
+ (id)genericErrorWithStatus:(int)a3;
+ (id)genericErrorWithUnderlyingError:(uint64_t)a1;
+ (id)genericErrorWithUserInfo:(uint64_t)a1;
+ (id)missingImplementation;
+ (id)resourceNotFound;
+ (id)resourceNotFoundWithMessage:(id)a3;
+ (id)resourceNotFoundWithUnderylingError:(id)a3;
+ (id)resourceNotFoundWithUserInfo:(uint64_t)a1;
@end

@implementation LAAuthorizationError

+ (id)resourceNotFound
{
  return (id)[a1 resourceNotFoundWithMessage:@"Resource not found"];
}

+ (id)resourceNotFoundWithMessage:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = +[LAAuthorizationError resourceNotFoundWithUserInfo:]((uint64_t)a1, v6);

  return v7;
}

+ (id)resourceNotFoundWithUserInfo:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [MEMORY[0x1E4F30B90] errorWithCode:-1019 userInfo:v2];

  return v3;
}

+ (id)resourceNotFoundWithUnderylingError:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = +[LAAuthorizationError resourceNotFoundWithUserInfo:]((uint64_t)a1, v6);

  return v7;
}

+ (BOOL)isResourceNotFoundError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:@"com.apple.LocalAuthentication"]) {
    BOOL v5 = [v3 code] == -1019;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)genericErrorWithMessage:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28228];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = +[LAAuthorizationError genericErrorWithUserInfo:]((uint64_t)a1, v6);

  return v7;
}

+ (id)genericErrorWithUserInfo:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = [MEMORY[0x1E4F30B90] errorWithCode:-1008 userInfo:v2];

  return v3;
}

+ (id)genericErrorWithStatus:(int)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)SecCopyErrorMessageString(a3, 0);
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28760];
  uint64_t v12 = *MEMORY[0x1E4F28228];
  v13[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v9 = [v6 errorWithDomain:v7 code:a3 userInfo:v8];

  v10 = +[LAAuthorizationError genericErrorWithUnderlyingError:]((uint64_t)a1, v9);

  return v10;
}

+ (id)genericErrorWithUnderlyingError:(uint64_t)a1
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v7 = *MEMORY[0x1E4F28A50];
  v8[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = +[LAAuthorizationError genericErrorWithUserInfo:](v3, v4);

  return v5;
}

+ (id)missingImplementation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F30B90];
  uint64_t v6 = *MEMORY[0x1E4F28228];
  v7[0] = @"Missing Implementation";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithCode:-1000 userInfo:v3];

  return v4;
}

@end