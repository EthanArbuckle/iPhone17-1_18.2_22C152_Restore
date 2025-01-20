@interface HMAccessorySettingConstraint(Metadata)
+ (id)constraintWithDictonaryRepresentation:()Metadata;
+ (id)constraintsWithArrayRepresenation:()Metadata;
+ (id)valueWithType:()Metadata representation:;
@end

@implementation HMAccessorySettingConstraint(Metadata)

+ (id)valueWithType:()Metadata representation:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  if ((unint64_t)(a3 - 1) < 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid constraint value: %@", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_14;
  }
  if (a3 != 4)
  {
LABEL_14:
    id v7 = 0;
    goto LABEL_15;
  }
  id v8 = v5;
  objc_opt_class();
  int v9 = objc_opt_isKindOfClass() & 1;
  if (v9) {
    v10 = v8;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v9)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x263F0E028]) initWithTitle:v8];
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid constraint value: %@", (uint8_t *)&v19, 0x16u);
    }
    id v7 = 0;
  }

LABEL_15:
  return v7;
}

+ (id)constraintWithDictonaryRepresentation:()Metadata
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmf_stringForKey:", @"Type");
  if (v5)
  {
    uint64_t v6 = HMAccessorySettingConstraintTypeFromString();
    id v7 = (void *)MEMORY[0x263F0E038];
    id v8 = [v4 objectForKeyedSubscript:@"Value"];
    int v9 = [v7 valueWithType:v6 representation:v8];

    if (v9) {
      v10 = (void *)[[a1 alloc] initWithType:v6 value:v9];
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)constraintsWithArrayRepresenation:()Metadata
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = objc_msgSend(MEMORY[0x263F0E038], "constraintWithDictonaryRepresentation:", v10, (void)v14);
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

@end