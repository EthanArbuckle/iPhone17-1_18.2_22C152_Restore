@interface LACPreboardAMFIHelper
+ (BOOL)installProfileWithUUID:(id)a3 signature:(id)a4 error:(id *)a5;
+ (id)createUPPControlForTeamID:(id)a3;
+ (id)getUPPProfile;
+ (int64_t)useCase;
+ (unsigned)_securityBootMode;
+ (void)completeCurrentBootModeWithSuccess:(BOOL)a3;
+ (void)getUPPProfile;
@end

@implementation LACPreboardAMFIHelper

+ (int64_t)useCase
{
  int v2 = [a1 _securityBootMode];
  v3 = &LACPreboardUseCaseUPP;
  v4 = &LACPreboardUseCaseDeveloperMode;
  if (v2 != 2) {
    v4 = &LACPreboardUseCaseUnknown;
  }
  if (v2 != 3) {
    v3 = v4;
  }
  return *v3;
}

+ (void)completeCurrentBootModeWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v4 = [a1 _securityBootMode];
  BOOL v5 = v4;
  if (v4 == 2)
  {
    int v11 = AMFIDeveloperModeCommit();
    v7 = LACLogPreboard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109376;
      BOOL v15 = v3;
      __int16 v16 = 1024;
      int v17 = v11;
      v8 = "Committing developer mode value: %u with result: %u";
      v9 = v7;
      uint32_t v10 = 14;
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v4 == 3 && !v3)
  {
    int v6 = AMFIProfileCommitProfile();
    v7 = LACLogPreboard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      BOOL v15 = v6;
      v8 = "Committing UPP profile value: nil with result: %u";
      v9 = v7;
      uint32_t v10 = 8;
LABEL_8:
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:
  int v12 = AMFICompleteSecurityBootMode();
  v13 = LACLogPreboard();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109376;
    BOOL v15 = v5;
    __int16 v16 = 1024;
    int v17 = v12;
    _os_log_impl(&dword_254F14000, v13, OS_LOG_TYPE_DEFAULT, "Completing boot mode: %u with result: %u", (uint8_t *)&v14, 0xEu);
  }
}

+ (id)getUPPProfile
{
  int ScheduledProfile = AMFIProfileGetScheduledProfile();
  if (ScheduledProfile)
  {
    BOOL v3 = LACLogPreboard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[LACPreboardAMFIHelper getUPPProfile];
    }

    int v4 = 0;
  }
  else
  {
    int v4 = [[LACPreboardUPPProfile alloc] initWithUUID:0 teamID:0 teamName:0];
  }

  return v4;
}

+ (id)createUPPControlForTeamID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  memset(v15, 0, 28);
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  int v7 = 2;
  *(void *)((char *)&v8 + 4) = 0x100000005;
  id v3 = a3;
  v15[7] = [v3 lengthOfBytesUsingEncoding:4];
  id v4 = v3;
  [v4 UTF8String];
  [v4 lengthOfBytesUsingEncoding:4];

  __memcpy_chk();
  BOOL v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:148];
  return v5;
}

+ (BOOL)installProfileWithUUID:(id)a3 signature:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (id)[v8 copy];
  int v10 = AMFIProfileSetTrustWithOptions();
  long long v11 = LACLogDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    int v18 = v10;
    _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "AMFIProfileSetTrustWithOptions returned: %d", (uint8_t *)&v17, 8u);
  }

  if (v10)
  {
    if (!a5)
    {
      BOOL v15 = 0;
      goto LABEL_13;
    }
    long long v12 = +[LACError errorWithCode:-1000 debugDescription:@"Unable to set profile trust"];
    goto LABEL_11;
  }
  int v13 = AMFIProfileCommitProfile();
  long long v14 = LACLogDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    int v18 = v13;
    _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "AMFIProfileCommitProfile returned: %d", (uint8_t *)&v17, 8u);
  }

  BOOL v15 = v13 == 0;
  if (a5 && v13)
  {
    long long v12 = +[LACError errorWithCode:-1000 debugDescription:@"Unable to commit profile"];
LABEL_11:
    BOOL v15 = 0;
    *a5 = v12;
  }
LABEL_13:

  return v15;
}

+ (unsigned)_securityBootMode
{
  return -1;
}

+ (void)getUPPProfile
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "AMFIProfileGetScheduledProfile returned error code: %d", (uint8_t *)v2, 8u);
}

@end