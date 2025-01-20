@interface NSManagedObjectContext(HMDCoreDataInternal)
- (id)hmd_coreData;
- (void)setHmd_coreData:()HMDCoreDataInternal;
@end

@implementation NSManagedObjectContext(HMDCoreDataInternal)

- (void)setHmd_coreData:()HMDCoreDataInternal
{
  v4 = (objc_class *)MEMORY[0x263F42678];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithWeakObject:v5];

  v6 = [a1 userInfo];
  [v6 setObject:v7 forKeyedSubscript:@"hmdcd_wcd"];
}

- (id)hmd_coreData
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"hmdcd_wcd"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 object];

  return v5;
}

@end