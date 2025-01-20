@interface CKSubscription(HMBCloudExtensions)
+ (uint64_t)hmbDecodeData:()HMBCloudExtensions fromStorageLocation:error:;
- (uint64_t)hmbEncodeForStorageLocation:()HMBCloudExtensions error:;
@end

@implementation CKSubscription(HMBCloudExtensions)

- (uint64_t)hmbEncodeForStorageLocation:()HMBCloudExtensions error:
{
  return [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:a4];
}

+ (uint64_t)hmbDecodeData:()HMBCloudExtensions fromStorageLocation:error:
{
  return objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", a1, a3);
}

@end