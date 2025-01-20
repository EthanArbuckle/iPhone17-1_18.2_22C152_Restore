@interface NSError(HDCodingSupport)
+ (id)hk_errorWithCodableError:()HDCodingSupport;
- (HDCodableError)hk_codableError;
@end

@implementation NSError(HDCodingSupport)

+ (id)hk_errorWithCodableError:()HDCodingSupport
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 localizedDescription];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    v6 = 0;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  v8 = [v3 domain];
  uint64_t v9 = [v3 code];

  v10 = (void *)[v7 initWithDomain:v8 code:v9 userInfo:v6];

  return v10;
}

- (HDCodableError)hk_codableError
{
  v2 = objc_alloc_init(HDCodableError);
  id v3 = [a1 domain];
  [(HDCodableError *)v2 setDomain:v3];

  -[HDCodableError setCode:](v2, "setCode:", [a1 code]);
  uint64_t v4 = [a1 localizedDescription];
  [(HDCodableError *)v2 setLocalizedDescription:v4];

  return v2;
}

@end