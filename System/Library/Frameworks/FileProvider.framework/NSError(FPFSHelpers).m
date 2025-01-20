@interface NSError(FPFSHelpers)
+ (id)fp_errorForCollisionWithURL:()FPFSHelpers;
- (id)fp_collidingURL;
@end

@implementation NSError(FPFSHelpers)

+ (id)fp_errorForCollisionWithURL:()FPFSHelpers
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F281F8];
  v10 = @"FPErrorCollidingURLKey";
  v11[0] = a3;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v3 errorWithDomain:v4 code:516 userInfo:v7];

  return v8;
}

- (id)fp_collidingURL
{
  v2 = [a1 domain];
  if (![v2 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  uint64_t v3 = [a1 code];

  if (v3 == 516)
  {
    v2 = [a1 userInfo];
    uint64_t v4 = [v2 objectForKeyedSubscript:@"FPErrorCollidingURLKey"];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

@end