@interface CKShare(HMBCloudExtensions)
+ (id)hmbDecodeData:()HMBCloudExtensions fromStorageLocation:error:;
- (uint64_t)hmbEncodeForStorageLocation:()HMBCloudExtensions error:;
@end

@implementation CKShare(HMBCloudExtensions)

- (uint64_t)hmbEncodeForStorageLocation:()HMBCloudExtensions error:
{
  return [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:a4];
}

+ (id)hmbDecodeData:()HMBCloudExtensions fromStorageLocation:error:
{
  v7 = (void *)MEMORY[0x1E4F28DC0];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  v10 = [v8 setWithObject:a1];
  v11 = [v7 _strictlyUnarchivedObjectOfClasses:v10 fromData:v9 error:a5];

  return v11;
}

@end