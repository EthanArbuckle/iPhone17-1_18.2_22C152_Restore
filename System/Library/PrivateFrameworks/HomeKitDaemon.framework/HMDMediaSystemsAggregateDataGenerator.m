@interface HMDMediaSystemsAggregateDataGenerator
+ (BOOL)isValidLeftDestination:(id)a3 rightDestination:(id)a4;
+ (id)derivedDestinationForGroup:(id)a3 leftDestination:(id)a4 rightDestination:(id)a5;
+ (id)derivedMediaDestinationIdentifierForGroupIdentifier:(id)a3;
+ (unint64_t)deriveSupportedOptionsFromLeftDestination:(id)a3 rightDestination:(id)a4;
- (BOOL)hasRoleType:(unint64_t)a3 mediaSystemData:(id)a4 destination:(id)a5;
- (HMDMediaSystemsAggregateDataGeneratorDataSource)dataSource;
- (id)aggregateDataWithDestinations:(id)a3 controllers:(id)a4 groups:(id)a5;
- (id)destinationWithRoleType:(unint64_t)a3 mediaSystemData:(id)a4 destinations:(id)a5;
- (id)nameForMediaSystemData:(id)a3 room:(id)a4;
- (id)roomForAllDestinationParentIdentifiers:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation HMDMediaSystemsAggregateDataGenerator

+ (unint64_t)deriveSupportedOptionsFromLeftDestination:(id)a3 rightDestination:(id)a4
{
  id v5 = a4;
  LODWORD(a3) = [a3 supportedOptions];
  int v6 = [v5 supportedOptions];

  return a3 & v6 & 0x45;
}

+ (id)derivedMediaDestinationIdentifierForGroupIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"222AA6C0-21DB-4EE6-8E62-019974477350"];
  int v6 = (void *)MEMORY[0x263F08C38];
  v7 = [v4 UUIDString];

  v8 = [v7 dataUsingEncoding:4];
  v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

+ (id)derivedDestinationForGroup:(id)a3 leftDestination:(id)a4 rightDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v20 = (void *)_HMFPreconditionFailure();
    return (id)+[HMDMediaSystemsAggregateDataGenerator isValidLeftDestination:v22 rightDestination:v23];
  }
  id v12 = objc_alloc(MEMORY[0x263F0E4C0]);
  v13 = [v8 identifier];
  v14 = [a1 derivedMediaDestinationIdentifierForGroupIdentifier:v13];
  v15 = [v8 identifier];
  uint64_t v16 = [a1 deriveSupportedOptionsFromLeftDestination:v9 rightDestination:v11];
  v17 = [v8 associatedGroupIdentifier];
  v18 = (void *)[v12 initWithUniqueIdentifier:v14 parentIdentifier:v15 supportedOptions:v16 audioGroupIdentifier:v17];

  return v18;
}

+ (BOOL)isValidLeftDestination:(id)a3 rightDestination:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4)
    {
      id v5 = a3;
      id v6 = a4;
      LOBYTE(v5) = [v5 supportedOptions];
      unsigned __int8 v7 = [v6 supportedOptions];

      return (v5 & v7 & 0xB0) != 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaSystemsAggregateDataGeneratorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaSystemsAggregateDataGeneratorDataSource *)WeakRetained;
}

- (BOOL)hasRoleType:(unint64_t)a3 mediaSystemData:(id)a4 destination:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 == 2)
  {
    id v9 = [v7 rightDestinationIdentifier];
    id v10 = [v8 uniqueIdentifier];
    if ((objc_msgSend(v9, "hmf_isEqualToUUID:", v10) & 1) == 0)
    {
      uint64_t v11 = [v7 rightDestinationIdentifier];
      goto LABEL_9;
    }
LABEL_6:
    char v12 = 1;
LABEL_10:

    goto LABEL_11;
  }
  if (a3 == 1)
  {
    id v9 = [v7 leftDestinationIdentifier];
    id v10 = [v8 uniqueIdentifier];
    if ((objc_msgSend(v9, "hmf_isEqualToUUID:", v10) & 1) == 0)
    {
      uint64_t v11 = [v7 leftDestinationIdentifier];
LABEL_9:
      v13 = (void *)v11;
      v14 = [v8 parentIdentifier];
      char v12 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

      goto LABEL_10;
    }
    goto LABEL_6;
  }
  char v12 = 0;
LABEL_11:

  return v12;
}

- (id)destinationWithRoleType:(unint64_t)a3 mediaSystemData:(id)a4 destinations:(id)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__HMDMediaSystemsAggregateDataGenerator_destinationWithRoleType_mediaSystemData_destinations___block_invoke;
  v12[3] = &unk_264A29240;
  id v13 = v8;
  unint64_t v14 = a3;
  v12[4] = self;
  id v9 = v8;
  id v10 = objc_msgSend(a5, "na_firstObjectPassingTest:", v12);

  return v10;
}

uint64_t __94__HMDMediaSystemsAggregateDataGenerator_destinationWithRoleType_mediaSystemData_destinations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 containsMediaSystemSupportedOptions];
  int v5 = [*(id *)(a1 + 32) hasRoleType:*(void *)(a1 + 48) mediaSystemData:*(void *)(a1 + 40) destination:v3];
  id v6 = [v3 audioGroupIdentifier];

  id v7 = [*(id *)(a1 + 40) identifier];
  LODWORD(v3) = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);

  return v4 & v5 & v3;
}

- (id)roomForAllDestinationParentIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDMediaSystemsAggregateDataGenerator *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 roomForAllDestinationParentIdentifiers:v4 mediaSystemsAggregateDataGenerator:self];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      unint64_t v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v19 = 138543874;
        v20 = v17;
        __int16 v21 = 2112;
        id v22 = v4;
        __int16 v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get room for all destination parent identifiers: %@ data source: %@", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get room for all destination parent identifiers: %@ to no data source", (uint8_t *)&v19, 0x16u);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)nameForMediaSystemData:(id)a3 room:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 isDefaultName];
  id v9 = [v6 name];
  if (v8)
  {
    id v10 = [MEMORY[0x263F0E558] roomNameSentinel];
    char v11 = [v9 isEqual:v10];

    char v12 = v7;
    if ((v11 & 1) == 0)
    {
      id v13 = (void *)MEMORY[0x230FBD990](v7);
      unint64_t v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v18 = 138543362;
        int v19 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine default group name", (uint8_t *)&v18, 0xCu);
      }
      char v12 = v6;
    }
    id v9 = [v12 name];
  }

  return v9;
}

- (id)aggregateDataWithDestinations:(id)a3 controllers:(id)a4 groups:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  v36 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v31 = (void *)[v8 mutableCopy];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    uint64_t v32 = *(void *)v38;
    id v33 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v34 = v11;
      do
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v37 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v15 = v14;
        }
        else {
          v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          v17 = [(HMDMediaSystemsAggregateDataGenerator *)self destinationWithRoleType:1 mediaSystemData:v16 destinations:v8];
          int v18 = [(HMDMediaSystemsAggregateDataGenerator *)self destinationWithRoleType:2 mediaSystemData:v16 destinations:v8];
          if ([(id)objc_opt_class() isValidLeftDestination:v17 rightDestination:v18])
          {
            int v19 = [v17 parentIdentifier];
            v41[0] = v19;
            uint64_t v20 = [v18 parentIdentifier];
            v41[1] = v20;
            __int16 v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
            id v22 = [(HMDMediaSystemsAggregateDataGenerator *)self roomForAllDestinationParentIdentifiers:v21];

            if (v22)
            {
              __int16 v23 = (void *)[v16 mutableCopy];
              v24 = [(HMDMediaSystemsAggregateDataGenerator *)self nameForMediaSystemData:v16 room:v22];
              [v23 setName:v24];

              uint64_t v25 = [v17 uniqueIdentifier];
              [v23 setLeftDestinationIdentifier:v25];

              v26 = [v18 uniqueIdentifier];
              [v23 setRightDestinationIdentifier:v26];

              [v36 addObject:v23];
              v27 = [(id)objc_opt_class() derivedDestinationForGroup:v14 leftDestination:v17 rightDestination:v18];
              [v31 addObject:v27];
            }
            uint64_t v12 = v32;
            id v8 = v33;
            uint64_t v11 = v34;
          }
        }
        else
        {
          [v36 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  v28 = [[HMDMediaGroupsAggregateData alloc] initWithDestinations:v31 destinationControllersData:v30 groups:v36];
  return v28;
}

@end