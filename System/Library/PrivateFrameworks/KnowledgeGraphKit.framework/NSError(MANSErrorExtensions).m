@interface NSError(MANSErrorExtensions)
+ (id)errorWithDescription:()MANSErrorExtensions;
+ (id)errorWithDomain:()MANSErrorExtensions code:localizedDescription:;
+ (id)errorWithDomain:()MANSErrorExtensions code:localizedDescription:userInfo:;
@end

@implementation NSError(MANSErrorExtensions)

+ (id)errorWithDescription:()MANSErrorExtensions
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() errorWithDomain:@"MAErrorDomain" code:-1 localizedDescription:v3];

  return v4;
}

+ (id)errorWithDomain:()MANSErrorExtensions code:localizedDescription:
{
  v7 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  id v9 = a3;
  v10 = [v7 dictionaryWithObject:a5 forKey:v8];
  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:v9 code:a4 userInfo:v10];

  return v11;
}

+ (id)errorWithDomain:()MANSErrorExtensions code:localizedDescription:userInfo:
{
  id v9 = a5;
  id v10 = a6;
  v11 = (void *)MEMORY[0x1E4F1CA60];
  id v12 = a3;
  v13 = [v11 dictionary];
  v14 = v13;
  if (v10) {
    [v13 addEntriesFromDictionary:v10];
  }
  [v14 setObject:v9 forKey:*MEMORY[0x1E4F28568]];
  v15 = [MEMORY[0x1E4F28C58] errorWithDomain:v12 code:a4 userInfo:v10];

  return v15;
}

@end