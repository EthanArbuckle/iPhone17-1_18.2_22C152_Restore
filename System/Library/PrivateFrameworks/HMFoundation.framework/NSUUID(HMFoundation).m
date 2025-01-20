@interface NSUUID(HMFoundation)
+ (NSString)shortDescription;
+ (id)hmf_UUIDWithBytesAsData:()HMFoundation;
+ (id)hmf_zeroUUID;
- (id)hmf_bytesAsData;
- (id)shortDescription;
- (uint64_t)hmf_isEqualToUUID:()HMFoundation;
- (uint64_t)hmf_isEqualToUUIDString:()HMFoundation;
@end

@implementation NSUUID(HMFoundation)

+ (id)hmf_zeroUUID
{
  if (qword_1EB4EEDA0 != -1) {
    dispatch_once(&qword_1EB4EEDA0, &__block_literal_global_38);
  }
  v0 = (void *)_MergedGlobals_69;
  return v0;
}

- (id)shortDescription
{
  v1 = [a1 UUIDString];
  v2 = [v1 substringToIndex:8];

  return v2;
}

- (uint64_t)hmf_isEqualToUUID:()HMFoundation
{
  id v4 = a3;
  v5 = v4;
  if (a1 == v4)
  {
    uint64_t v6 = 1;
  }
  else if (v4)
  {
    uint64_t v6 = [a1 isEqual:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)hmf_UUIDWithBytesAsData:()HMFoundation
{
  id v3 = a3;
  if ([v3 length] == 16) {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v3, "bytes"));
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)hmf_bytesAsData
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];
  return v1;
}

- (uint64_t)hmf_isEqualToUUIDString:()HMFoundation
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  if (v6) {
    uint64_t v7 = objc_msgSend(a1, "hmf_isEqualToUUID:", v6);
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end