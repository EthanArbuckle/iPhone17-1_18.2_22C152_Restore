@interface NSUUID(NSUUIDAdditions)
+ (id)PK_zero;
- (id)PK_shortDescription;
- (uint64_t)PK_compare:()NSUUIDAdditions;
@end

@implementation NSUUID(NSUUIDAdditions)

+ (id)PK_zero
{
  if (_MergedGlobals_119 != -1) {
    dispatch_once(&_MergedGlobals_119, &__block_literal_global_16);
  }
  v0 = (void *)qword_1EB3C5E78;

  return v0;
}

- (uint64_t)PK_compare:()NSUUIDAdditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(void *)uu1 = 0;
  uint64_t v9 = 0;
  *(void *)uu2 = 0;
  uint64_t v7 = 0;
  id v4 = a3;
  [a1 getUUIDBytes:uu1];
  [v4 getUUIDBytes:uu2];

  return uuid_compare(uu1, uu2);
}

- (id)PK_shortDescription
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X", LOBYTE(v3[0]), BYTE1(v3[0]));

  return v1;
}

@end