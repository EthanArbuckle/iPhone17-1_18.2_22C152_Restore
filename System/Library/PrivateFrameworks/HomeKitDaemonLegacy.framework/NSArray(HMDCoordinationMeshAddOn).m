@interface NSArray(HMDCoordinationMeshAddOn)
- (id)hmd_residentWithIdentifier:()HMDCoordinationMeshAddOn;
@end

@implementation NSArray(HMDCoordinationMeshAddOn)

- (id)hmd_residentWithIdentifier:()HMDCoordinationMeshAddOn
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__NSArray_HMDCoordinationMeshAddOn__hmd_residentWithIdentifier___block_invoke;
  v8[3] = &unk_1E6A17240;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "na_firstObjectPassingTest:", v8);

  return v6;
}

@end