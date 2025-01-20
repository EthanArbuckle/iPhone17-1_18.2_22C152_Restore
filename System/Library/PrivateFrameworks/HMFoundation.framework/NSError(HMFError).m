@interface NSError(HMFError)
+ (id)hmfErrorWithCode:()HMFError reason:suggestion:underlyingError:;
+ (id)hmfUnspecifiedError;
+ (id)hmf_errorWithException:()HMFError;
+ (uint64_t)hmfErrorWithCode:()HMFError;
+ (uint64_t)hmfErrorWithCode:()HMFError reason:;
+ (uint64_t)hmfErrorWithCode:()HMFError reason:suggestion:;
+ (uint64_t)hmfErrorWithCode:()HMFError userInfo:;
- (uint64_t)isHMFError;
@end

@implementation NSError(HMFError)

+ (id)hmf_errorWithException:()HMFError
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [v3 name];

  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = v6;
  if (v5)
  {
    v8 = [v3 name];
    v9 = [v7 localizedStringForKey:v8 value:&stru_1EEF0F5E0 table:0];
    [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  else
  {
    v8 = [v6 localizedStringForKey:@"Exception." value:&stru_1EEF0F5E0 table:0];
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }

  v10 = [v3 reason];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v3 reason];
    v13 = [v11 localizedStringForKey:v12 value:&stru_1EEF0F5E0 table:0];
    [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  }
  v14 = [v3 debugDescription];
  [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28228]];

  v15 = (void *)MEMORY[0x1E4F28C58];
  v16 = (void *)[v4 copy];
  v17 = [v15 hmfErrorWithCode:16 userInfo:v16];

  return v17;
}

+ (uint64_t)hmfErrorWithCode:()HMFError
{
  return [a1 hmfErrorWithCode:a3 reason:0];
}

+ (uint64_t)hmfErrorWithCode:()HMFError reason:
{
  return [a1 hmfErrorWithCode:a3 reason:a4 suggestion:0];
}

+ (uint64_t)hmfErrorWithCode:()HMFError reason:suggestion:
{
  return [a1 hmfErrorWithCode:a3 reason:a4 suggestion:a5 underlyingError:0];
}

+ (id)hmfErrorWithCode:()HMFError reason:suggestion:underlyingError:
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  if ((unint64_t)(a3 - 1) > 0x12) {
    v14 = @"Unknown error";
  }
  else {
    v14 = off_1E59578B8[a3 - 1];
  }
  v15 = v14;
  v16 = [v13 localizedStringForKey:v15 value:&stru_1EEF0F5E0 table:0];
  [v12 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v9)
  {
    v17 = [MEMORY[0x1E4F28B50] mainBundle];
    v18 = [v17 localizedStringForKey:v9 value:&stru_1EEF0F5E0 table:0];
    [v12 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  }
  if (v10)
  {
    v19 = [MEMORY[0x1E4F28B50] mainBundle];
    v20 = [v19 localizedStringForKey:v10 value:&stru_1EEF0F5E0 table:0];
    [v12 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  }
  [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:a3 userInfo:v12];

  return v21;
}

+ (uint64_t)hmfErrorWithCode:()HMFError userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"HMFErrorDomain" code:a3 userInfo:a4];
}

+ (id)hmfUnspecifiedError
{
  if (_MergedGlobals_58 != -1) {
    dispatch_once(&_MergedGlobals_58, &__block_literal_global_7);
  }
  v0 = (void *)qword_1EB4EECE0;
  return v0;
}

- (uint64_t)isHMFError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"HMFErrorDomain"];

  return v2;
}

@end