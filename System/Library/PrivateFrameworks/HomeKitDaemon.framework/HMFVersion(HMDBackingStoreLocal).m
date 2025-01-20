@interface HMFVersion(HMDBackingStoreLocal)
- (BOOL)isGreaterThan:()HMDBackingStoreLocal;
- (BOOL)isLessThan:()HMDBackingStoreLocal;
- (uint64_t)isGreaterThanOrEqualTo:()HMDBackingStoreLocal;
- (uint64_t)isLessThanOrEqualTo:()HMDBackingStoreLocal;
@end

@implementation HMFVersion(HMDBackingStoreLocal)

- (uint64_t)isLessThanOrEqualTo:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "isGreaterThan:") ^ 1;
}

- (uint64_t)isGreaterThanOrEqualTo:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "isLessThan:") ^ 1;
}

- (BOOL)isLessThan:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)isGreaterThan:()HMDBackingStoreLocal
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end