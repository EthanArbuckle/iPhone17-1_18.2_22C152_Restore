@interface NSManagedObjectContext(HMDCoreDataCloudTransformInternal)
- (id)hmd_cloudPrivateStoreIdentifier;
- (id)hmd_cloudSharedStoreIdentifier;
- (id)hmd_currentChangeSet;
- (id)hmd_homeManagerContext;
- (id)hmd_workingStoreIdentifier;
- (uint64_t)hmd_fakeRecordsEnabled;
- (uint64_t)hmd_homeManagerApplicationDataChanged;
- (void)setHmd_cloudPrivateStoreIdentifier:()HMDCoreDataCloudTransformInternal;
- (void)setHmd_cloudSharedStoreIdentifier:()HMDCoreDataCloudTransformInternal;
- (void)setHmd_currentChangeSet:()HMDCoreDataCloudTransformInternal;
- (void)setHmd_fakeRecordsEnabled:()HMDCoreDataCloudTransformInternal;
- (void)setHmd_homeManagerApplicationDataChanged:()HMDCoreDataCloudTransformInternal;
- (void)setHmd_homeManagerContext:()HMDCoreDataCloudTransformInternal;
- (void)setHmd_workingStoreIdentifier:()HMDCoreDataCloudTransformInternal;
@end

@implementation NSManagedObjectContext(HMDCoreDataCloudTransformInternal)

- (void)setHmd_homeManagerApplicationDataChanged:()HMDCoreDataCloudTransformInternal
{
  if (a3) {
    uint64_t v3 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v3 = MEMORY[0x263EFFA80];
  }
  id v4 = [a1 userInfo];
  [v4 setObject:v3 forKeyedSubscript:@"ctui_hmadc"];
}

- (id)hmd_currentChangeSet
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ctui_ccs"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setHmd_currentChangeSet:()HMDCoreDataCloudTransformInternal
{
  id v4 = a3;
  id v5 = [a1 userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"ctui_ccs"];
}

- (uint64_t)hmd_homeManagerApplicationDataChanged
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ctui_hmadc"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (void)setHmd_fakeRecordsEnabled:()HMDCoreDataCloudTransformInternal
{
  if (a3) {
    uint64_t v3 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v3 = MEMORY[0x263EFFA80];
  }
  id v4 = [a1 userInfo];
  [v4 setObject:v3 forKeyedSubscript:@"ctui_fre"];
}

- (uint64_t)hmd_fakeRecordsEnabled
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ctui_fre"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (void)setHmd_homeManagerContext:()HMDCoreDataCloudTransformInternal
{
  id v4 = a3;
  id v5 = [a1 userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"ctui_hmc"];
}

- (id)hmd_homeManagerContext
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ctui_hmc"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setHmd_workingStoreIdentifier:()HMDCoreDataCloudTransformInternal
{
  id v4 = a3;
  id v5 = [a1 userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"ctui_wsi"];
}

- (id)hmd_workingStoreIdentifier
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ctui_wsi"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setHmd_cloudSharedStoreIdentifier:()HMDCoreDataCloudTransformInternal
{
  id v4 = a3;
  id v5 = [a1 userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"ctui_cssi"];
}

- (id)hmd_cloudSharedStoreIdentifier
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ctui_cssi"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setHmd_cloudPrivateStoreIdentifier:()HMDCoreDataCloudTransformInternal
{
  id v4 = a3;
  id v5 = [a1 userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"ctui_cpsi"];
}

- (id)hmd_cloudPrivateStoreIdentifier
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ctui_cpsi"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

@end