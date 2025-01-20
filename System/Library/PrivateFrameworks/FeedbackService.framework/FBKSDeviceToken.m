@interface FBKSDeviceToken
+ (id)_basicParameterWithoutLabel;
+ (id)_basicParametersForWriting;
+ (id)_queryForParticipantID:(id)a3 isForWriting:(BOOL)a4;
+ (id)fetchDeviceTokenForParticipantID:(id)a3;
+ (void)clearAllDeviceTokens;
+ (void)clearDeviceTokenForParticipantID:(id)a3;
+ (void)setDeviceToken:(id)a3 forParticipantID:(id)a4;
@end

@implementation FBKSDeviceToken

+ (void)clearAllDeviceTokens
{
  CFDictionaryRef v2 = (const __CFDictionary *)[a1 _basicParameterWithoutLabel];
  SecItemDelete(v2);
}

+ (id)fetchDeviceTokenForParticipantID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 _queryForParticipantID:v4 isForWriting:0];
  v6 = (void *)[v5 mutableCopy];

  [v6 setObject:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F17520]];
  CFTypeRef result = 0;
  OSStatus v7 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
  if (v7 == -25300)
  {
    v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v4 unsignedLongValue];
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v11;
      _os_log_impl(&dword_24DF86000, v9, OS_LOG_TYPE_DEFAULT, "Could not find device token for participant [%lu]", buf, 0xCu);
    }
  }
  else
  {
    if (!v7)
    {
      id v8 = [NSString alloc];
      v9 = result;
      v10 = (void *)[v8 initWithData:result encoding:4];
      goto LABEL_9;
    }
    v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[FBKSDeviceToken fetchDeviceTokenForParticipantID:]();
    }
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (void)setDeviceToken:(id)a3 forParticipantID:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _queryForParticipantID:v6 isForWriting:0];
  CFDictionaryRef v9 = (const __CFDictionary *)[v8 mutableCopy];

  v10 = [a1 _queryForParticipantID:v6 isForWriting:1];

  uint64_t v11 = (void *)[v10 mutableCopy];
  uint64_t v20 = *MEMORY[0x263F175A8];
  v12 = [v7 dataUsingEncoding:4];

  v21[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  [v11 addEntriesFromDictionary:v13];
  OSStatus v14 = SecItemCopyMatching(v9, 0);
  if (v14 == -25300)
  {
    v18 = Log_0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_24DF86000, v18, OS_LOG_TYPE_DEFAULT, "Creating new token", v19, 2u);
    }

    if (SecItemAdd((CFDictionaryRef)v11, 0))
    {
      v17 = Log_0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[FBKSDeviceToken setDeviceToken:forParticipantID:].cold.4();
      }
      goto LABEL_19;
    }
  }
  else
  {
    if (v14)
    {
      v17 = Log_0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[FBKSDeviceToken setDeviceToken:forParticipantID:]();
      }
      goto LABEL_19;
    }
    uint64_t v15 = Log_0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_24DF86000, v15, OS_LOG_TYPE_DEFAULT, "Updating existing token", v19, 2u);
    }

    if (SecItemDelete(v9))
    {
      uint64_t v16 = Log_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[FBKSDeviceToken setDeviceToken:forParticipantID:]();
      }
    }
    if (SecItemAdd((CFDictionaryRef)v11, 0))
    {
      v17 = Log_0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[FBKSDeviceToken setDeviceToken:forParticipantID:]();
      }
LABEL_19:
    }
  }
}

+ (void)clearDeviceTokenForParticipantID:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)[a1 _queryForParticipantID:a3 isForWriting:0];
  SecItemDelete(v3);
}

+ (id)_basicParametersForWriting
{
  v14[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F171B8];
  v14[0] = *MEMORY[0x263F171C8];
  uint64_t v3 = *MEMORY[0x263F17090];
  v13[0] = v2;
  v13[1] = v3;
  id v4 = +[FBKSSharedConstants appleSeedURL];
  v5 = [v4 host];
  id v6 = [v5 lowercaseString];
  uint64_t v7 = *MEMORY[0x263F17000];
  v14[1] = v6;
  v14[2] = @"Feedback Assistant";
  uint64_t v8 = *MEMORY[0x263F16E90];
  v13[2] = v7;
  v13[3] = v8;
  uint64_t v9 = *MEMORY[0x263F16E80];
  v14[3] = *MEMORY[0x263F16EA0];
  v14[4] = @"group.com.apple.feedback";
  uint64_t v10 = *MEMORY[0x263F17580];
  v13[4] = v9;
  v13[5] = v10;
  v14[5] = MEMORY[0x263EFFA88];
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

+ (id)_basicParameterWithoutLabel
{
  v12[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F171B8];
  v12[0] = *MEMORY[0x263F171C8];
  uint64_t v3 = *MEMORY[0x263F17090];
  v11[0] = v2;
  v11[1] = v3;
  id v4 = +[FBKSSharedConstants appleSeedURL];
  v5 = [v4 host];
  id v6 = [v5 lowercaseString];
  uint64_t v7 = *MEMORY[0x263F16E80];
  v12[1] = v6;
  v12[2] = @"group.com.apple.feedback";
  uint64_t v8 = *MEMORY[0x263F17580];
  v11[2] = v7;
  v11[3] = v8;
  v12[3] = MEMORY[0x263EFFA88];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

+ (id)_queryForParticipantID:(id)a3 isForWriting:(BOOL)a4
{
  BOOL v4 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = [NSString stringWithFormat:@"%@", v7, *MEMORY[0x263F16ED8]];

  v16[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v11 = (void *)[v8 initWithDictionary:v10];

  if (v4) {
    [a1 _basicParametersForWriting];
  }
  else {
  v12 = [a1 _basicParameterWithoutLabel];
  }
  [v11 addEntriesFromDictionary:v12];

  v13 = (void *)[v11 copy];
  return v13;
}

+ (void)fetchDeviceTokenForParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24DF86000, v0, v1, "Failed to fetch device token with error [%i]", v2, v3, v4, v5, v6);
}

+ (void)setDeviceToken:forParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24DF86000, v0, v1, "SecItemCopyMatching failed: %d", v2, v3, v4, v5, v6);
}

+ (void)setDeviceToken:forParticipantID:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24DF86000, v0, v1, "Device token update failed: %d", v2, v3, v4, v5, v6);
}

+ (void)setDeviceToken:forParticipantID:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24DF86000, v0, v1, "Failed to delete existing token for update with error [%i]", v2, v3, v4, v5, v6);
}

+ (void)setDeviceToken:forParticipantID:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24DF86000, v0, v1, "Device token add failed: %d", v2, v3, v4, v5, v6);
}

@end