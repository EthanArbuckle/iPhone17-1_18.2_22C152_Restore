@interface CPError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5;
+ (id)internalErrorWithDescription:(id)a3;
+ (id)internalErrorWithDescription:(id)a3 underlyingError:(id)a4;
@end

@implementation CPError

+ (id)errorWithCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 + 1) > 0x19) {
    v4 = @"Unknown error";
  }
  else {
    v4 = off_1E5FF1AE8[a3 + 1];
  }
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"com.apple.copresence.CPServiceErrorDomain" code:a3 userInfo:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v7)
    {
      v10 = (void *)[(id)v7 copy];
      [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28228]];
    }
    if (v8) {
      [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.copresence.CPServiceErrorDomain" code:a3 userInfo:v9];

  return v11;
}

+ (id)internalErrorWithDescription:(id)a3
{
  return (id)[a1 errorWithCode:-1 description:a3 underlyingError:0];
}

+ (id)internalErrorWithDescription:(id)a3 underlyingError:(id)a4
{
  return (id)[a1 errorWithCode:-1 description:a3 underlyingError:a4];
}

@end