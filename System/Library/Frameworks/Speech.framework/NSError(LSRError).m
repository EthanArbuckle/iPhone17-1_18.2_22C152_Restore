@interface NSError(LSRError)
+ (id)lsr_errorWithCode:()LSRError description:;
+ (uint64_t)lsr_errorWithCode:()LSRError;
@end

@implementation NSError(LSRError)

+ (uint64_t)lsr_errorWithCode:()LSRError
{
  return objc_msgSend(a1, "lsr_errorWithCode:description:", a3, 0);
}

+ (id)lsr_errorWithCode:()LSRError description:
{
  id v5 = a4;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKey:*MEMORY[0x1E4F28568]];
  }
  v8 = (void *)MEMORY[0x1E4F28C58];
  if ([v7 count]) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  v10 = [v8 errorWithDomain:@"kLSRErrorDomain" code:a3 userInfo:v9];

  return v10;
}

@end