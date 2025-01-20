@interface NSUUID(Version5)
+ (id)hmf_UUIDWithNamespace:()Version5 data:salts:;
+ (uint64_t)hmf_UUIDWithNamespace:()Version5 data:;
- (id)initWithNamespace:()Version5 data:;
@end

@implementation NSUUID(Version5)

+ (id)hmf_UUIDWithNamespace:()Version5 data:salts:
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = 0;
  v8[1] = 0;
  __NSUUIDCreateUUIDVersion5((uint64_t)v8, a3, a4, a5);
  v6 = (void *)[[a1 alloc] initWithUUIDBytes:v8];
  return v6;
}

+ (uint64_t)hmf_UUIDWithNamespace:()Version5 data:
{
  return objc_msgSend(a1, "hmf_UUIDWithNamespace:data:salts:", a3, a4, 0);
}

- (id)initWithNamespace:()Version5 data:
{
  id v5 = 0;
  v7[2] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    v7[0] = 0;
    v7[1] = 0;
    __NSUUIDCreateUUIDVersion5((uint64_t)v7, a3, a4, 0);
    a1 = (id)[a1 initWithUUIDBytes:v7];
    id v5 = a1;
  }

  return v5;
}

@end