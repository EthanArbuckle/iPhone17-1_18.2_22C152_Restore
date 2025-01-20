@interface NSError(DMFAdditions)
- (id)serializableError;
@end

@implementation NSError(DMFAdditions)

- (id)serializableError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  v3 = [a1 domain];
  uint64_t v4 = [a1 code];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v5 = [a1 localizedDescription];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[v2 initWithDomain:v3 code:v4 userInfo:v6];

  return v7;
}

@end