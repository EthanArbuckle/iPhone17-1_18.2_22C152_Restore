@interface NSInvocation
@end

@implementation NSInvocation

id __46__NSInvocation_FPExtensions__fp_sanitizeError__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = +[FPXPCSanitizer permittedErrorDomains];
  v4 = [v2 domain];
  int v5 = [v3 containsObject:v4];

  if (v5)
  {
    id v6 = v2;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v12[0] = v2;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v6 = [v7 errorWithDomain:v8 code:4101 userInfo:v9];
  }

  return v6;
}

@end