@interface HMAccessoryCategory(HMDHAPMetadata)
+ (id)categoryForProductClass:()HMDHAPMetadata;
+ (id)categoryIdentifierForCategory:()HMDHAPMetadata;
+ (id)categoryWithCategoryIdentifier:()HMDHAPMetadata;
+ (id)categoryWithIdentifier:()HMDHAPMetadata;
+ (uint64_t)categoryForProductInfo:()HMDHAPMetadata;
@end

@implementation HMAccessoryCategory(HMDHAPMetadata)

+ (id)categoryWithCategoryIdentifier:()HMDHAPMetadata
{
  id v3 = a3;
  v4 = +[HMDHAPMetadata getSharedInstance];
  v5 = [v4 categoryForIdentifier:v3];

  if (!v5)
  {
    v6 = +[HMDHAPMetadata getSharedInstance];
    v5 = [v6 categoryForOther];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F2E520]);
  v8 = [v5 uuidStr];
  v9 = [v5 catDescription];
  v10 = (void *)[v7 initWithType:v8 name:v9];

  v11 = [MEMORY[0x1E4F2E7B0] cachedInstanceForHMAccessoryCategory:v10];

  return v11;
}

+ (id)categoryForProductClass:()HMDHAPMetadata
{
  if (a3 == 6)
  {
    id v3 = (void *)MEMORY[0x1E4F2E520];
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    v5 = (void *)MEMORY[0x1E4F2C1D0];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F2E520];
    if (a3 == 4)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F29128]);
      v5 = (void *)MEMORY[0x1E4F2C198];
    }
    else
    {
      id v4 = objc_alloc(MEMORY[0x1E4F29128]);
      v5 = (void *)MEMORY[0x1E4F2C218];
    }
  }
  v6 = (void *)[v4 initWithUUIDString:*v5];
  id v7 = [v3 categoryWithIdentifier:v6];

  return v7;
}

+ (uint64_t)categoryForProductInfo:()HMDHAPMetadata
{
  uint64_t v3 = [a3 productClass];
  id v4 = (void *)MEMORY[0x1E4F2E520];
  return [v4 categoryForProductClass:v3];
}

+ (id)categoryWithIdentifier:()HMDHAPMetadata
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  v5 = (void *)[v4 initWithUUIDString:*MEMORY[0x1E4F2C238]];
  int v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  id v7 = +[HMDHAPMetadata getSharedInstance];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 categoryForType:*MEMORY[0x1E4F2C230]];
  }
  else
  {
    v10 = [v3 UUIDString];
    v9 = [v8 categoryForType:v10];
  }
  if (!v9)
  {
    v11 = +[HMDHAPMetadata getSharedInstance];
    v9 = [v11 categoryForOther];
  }
  id v12 = objc_alloc(MEMORY[0x1E4F2E520]);
  v13 = [v3 UUIDString];
  v14 = [v9 catDescription];
  v15 = (void *)[v12 initWithType:v13 name:v14];

  v16 = [MEMORY[0x1E4F2E7B0] cachedInstanceForHMAccessoryCategory:v15];

  return v16;
}

+ (id)categoryIdentifierForCategory:()HMDHAPMetadata
{
  id v3 = a3;
  id v4 = +[HMDHAPMetadata getSharedInstance];
  v5 = [v3 categoryType];

  int v6 = [v4 categoryForType:v5];

  if (v6)
  {
    id v7 = [v6 identifier];
  }
  else
  {
    v8 = +[HMDHAPMetadata getSharedInstance];
    v9 = [v8 categoryForOther];
    id v7 = [v9 identifier];
  }
  return v7;
}

@end