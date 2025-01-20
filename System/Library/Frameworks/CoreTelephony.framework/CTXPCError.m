@interface CTXPCError
+ (id)errorForCode:(int)a3 errorString:(id)a4;
@end

@implementation CTXPCError

+ (id)errorForCode:(int)a3 errorString:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = a3;
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v4 errorWithDomain:@"CTError" code:v5 userInfo:v8];

  return v9;
}

@end