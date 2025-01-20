@interface MLCErrors
+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4;
+ (id)invalidInputErrorForMethod:(id)a3 description:(id)a4;
+ (id)invalidStateErrorForMethod:(id)a3 description:(id)a4;
@end

@implementation MLCErrors

+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F28C58];
  v7 = +[MLCStrings errorDomainGeneric];
  uint64_t v16 = *MEMORY[0x1E4F28568];
  v17[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v9 = [v6 errorWithDomain:v7 code:a3 userInfo:v8];

  v10 = +[MLCLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1DD0C9000, v10, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

+ (id)invalidStateErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid state : %@", a3, a4];
  v6 = [a1 createErrorWithCode:1 description:v5];

  return v6;
}

+ (id)invalidInputErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid inputs : %@", a3, a4];
  v6 = [a1 createErrorWithCode:1 description:v5];

  return v6;
}

@end