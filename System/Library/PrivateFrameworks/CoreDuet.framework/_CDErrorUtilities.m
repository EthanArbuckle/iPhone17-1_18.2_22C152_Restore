@interface _CDErrorUtilities
+ (BOOL)isCoreDataFatalError:(id)a3;
+ (BOOL)isCoreDataTemporaryError:(id)a3;
+ (id)transformErrorForNSSecureCoding:(id)a3;
+ (void)simulateCrashWithDescription:(id)a3;
@end

@implementation _CDErrorUtilities

+ (id)transformErrorForNSSecureCoding:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 userInfo];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      v8 = [v4 domain];
      uint64_t v9 = [v4 code];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v10 = [v4 userInfo];
      v11 = [v10 description];
      v16[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v13 = [v7 errorWithDomain:v8 code:v9 userInfo:v12];
    }
    else
    {
      id v13 = v4;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (BOOL)isCoreDataFatalError:(id)a3
{
  id v3 = [a3 userInfo];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F1BF50]];

  LOBYTE(v3) = [&unk_1EDE1E8C0 containsObject:v4];
  return (char)v3;
}

+ (BOOL)isCoreDataTemporaryError:(id)a3
{
  id v3 = [a3 userInfo];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F1BF50]];

  LOBYTE(v3) = [&unk_1EDE1E8D8 containsObject:v4];
  return (char)v3;
}

+ (void)simulateCrashWithDescription:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[_CDErrorUtilities simulateCrashWithDescription:]((uint64_t)a3);
  }
}

+ (void)simulateCrashWithDescription:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Simulating crash. Reason: %@", (uint8_t *)&v1, 0xCu);
}

@end