@interface NSArray(CKEntity)
- (uint64_t)__im_canonicalIDSAddressesFromEntities;
@end

@implementation NSArray(CKEntity)

- (uint64_t)__im_canonicalIDSAddressesFromEntities
{
  return objc_msgSend(a1, "__imArrayByApplyingBlock:", &__block_literal_global_17);
}

@end