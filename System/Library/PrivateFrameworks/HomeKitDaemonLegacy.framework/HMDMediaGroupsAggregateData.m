@interface HMDMediaGroupsAggregateData
- (BOOL)isEqual:(id)a3;
- (HMDMediaGroupsAggregateData)initWithDestinations:(id)a3 destinationControllersData:(id)a4;
- (HMDMediaGroupsAggregateData)initWithDestinations:(id)a3 destinationControllersData:(id)a4 groups:(id)a5;
- (HMDMediaGroupsAggregateData)initWithProtoBufferData:(id)a3;
- (NSArray)destinationControllersData;
- (NSArray)destinations;
- (NSArray)groups;
- (id)decodeDestinationControllersWithEncodedDestinationControllers:(id)a3;
- (id)decodeDestinationsWithEncodedDestinations:(id)a3;
- (id)decodeMediaGroupsWithEncodedMediaGroups:(id)a3;
- (id)description;
- (id)encodeToProtoBufferData;
- (id)encodedDestinationControllerEvents;
- (id)encodedDestinationEvents;
- (id)encodedMediaGroupEvents;
- (id)groupWithIdentifier:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sentinelDestination;
- (id)sentinelDestinationControllerData;
- (id)sentinelGroup;
- (id)sentinelIdentifier;
- (unint64_t)hash;
- (void)setDestinationControllersData:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setGroups:(id)a3;
@end

@implementation HMDMediaGroupsAggregateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_destinationControllersData, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

- (void)setGroups:(id)a3
{
}

- (NSArray)groups
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDestinationControllersData:(id)a3
{
}

- (NSArray)destinationControllersData
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestinations:(id)a3
{
}

- (NSArray)destinations
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HMDMutableMediaGroupsAggregateData alloc];
  v5 = [(HMDMediaGroupsAggregateData *)self destinations];
  v6 = [(HMDMediaGroupsAggregateData *)self destinationControllersData];
  v7 = [(HMDMediaGroupsAggregateData *)self groups];
  v8 = [(HMDMediaGroupsAggregateData *)v4 initWithDestinations:v5 destinationControllersData:v6 groups:v7];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDMediaGroupsAggregateData *)self destinations];
  v5 = [(HMDMediaGroupsAggregateData *)self destinationControllersData];
  v6 = [(HMDMediaGroupsAggregateData *)self groups];
  v7 = [v3 stringWithFormat:@"<HMDMediaGroupsAggregateData destinations: %@ destinationControllerDatas: %@ groups: %@>", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v3 = [(HMDMediaGroupsAggregateData *)self destinations];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__HMDMediaGroupsAggregateData_hash__block_invoke;
  v10[3] = &unk_1E6A0FDC0;
  v10[4] = &v11;
  objc_msgSend(v3, "na_each:", v10);

  v4 = [(HMDMediaGroupsAggregateData *)self destinationControllersData];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__HMDMediaGroupsAggregateData_hash__block_invoke_2;
  v9[3] = &unk_1E6A0FDE8;
  v9[4] = &v11;
  objc_msgSend(v4, "na_each:", v9);

  v5 = [(HMDMediaGroupsAggregateData *)self groups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__HMDMediaGroupsAggregateData_hash__block_invoke_3;
  v8[3] = &unk_1E6A0FE10;
  v8[4] = &v11;
  objc_msgSend(v5, "na_each:", v8);

  unint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __35__HMDMediaGroupsAggregateData_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hash];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

uint64_t __35__HMDMediaGroupsAggregateData_hash__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hash];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

uint64_t __35__HMDMediaGroupsAggregateData_hash__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hash];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDMediaGroupsAggregateData *)a3;
  if (v4 == self)
  {
    char v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    unint64_t v6 = v5;
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      v8 = [(HMDMediaGroupsAggregateData *)self destinations];
      v9 = [v7 setWithArray:v8];
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = [(HMDMediaGroupsAggregateData *)v6 destinations];
      v12 = [v10 setWithArray:v11];
      if ([v9 isEqualToSet:v12])
      {
        v28 = v8;
        uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v14 = [(HMDMediaGroupsAggregateData *)self destinationControllersData];
        v15 = [v13 setWithArray:v14];
        v16 = (void *)MEMORY[0x1E4F1CAD0];
        v27 = [(HMDMediaGroupsAggregateData *)v6 destinationControllersData];
        v17 = objc_msgSend(v16, "setWithArray:");
        v29 = v15;
        if ([v15 isEqualToSet:v17])
        {
          v26 = v14;
          v18 = (void *)MEMORY[0x1E4F1CAD0];
          v25 = [(HMDMediaGroupsAggregateData *)self groups];
          v19 = [v18 setWithArray:v25];
          v20 = (void *)MEMORY[0x1E4F1CAD0];
          v21 = [(HMDMediaGroupsAggregateData *)v6 groups];
          v22 = [v20 setWithArray:v21];
          char v23 = [v19 isEqualToSet:v22];

          uint64_t v14 = v26;
        }
        else
        {
          char v23 = 0;
        }

        v8 = v28;
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }
  return v23;
}

- (id)sentinelGroup
{
  v2 = [(HMDMediaGroupsAggregateData *)self sentinelIdentifier];
  id v3 = objc_alloc(MEMORY[0x1E4F2E8E0]);
  v4 = (void *)[v3 initWithIdentifier:v2 parentIdentifier:v2 name:&stru_1F2C9F1A8 defaultName:0 destinationIdentifiers:MEMORY[0x1E4F1CBF0] associatedGroupIdentifier:0];

  return v4;
}

- (id)sentinelDestination
{
  v2 = [(HMDMediaGroupsAggregateData *)self sentinelIdentifier];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F2E8C8]) initWithUniqueIdentifier:v2 parentIdentifier:v2 supportedOptions:0];

  return v3;
}

- (id)sentinelDestinationControllerData
{
  v2 = [(HMDMediaGroupsAggregateData *)self sentinelIdentifier];
  id v3 = objc_alloc(MEMORY[0x1E4F2E8D8]);
  v4 = (void *)[v3 initWithIdentifier:v2 parentIdentifier:v2 destinationIdentifier:0 supportedOptions:0 availableDestinationIdentifiers:MEMORY[0x1E4F1CBF0]];

  return v4;
}

- (id)sentinelIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  return v2;
}

- (id)encodedMediaGroupEvents
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaGroupsAggregateData *)self groups];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CA48];
    unint64_t v6 = [(HMDMediaGroupsAggregateData *)self groups];
    v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v8 = [(HMDMediaGroupsAggregateData *)self groups];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = objc_alloc(MEMORY[0x1E4F2E900]);
          v15 = [v13 encodeToProtoBufferData];
          v16 = (void *)[v14 initWithData:v15];

          if (v16) {
            [v7 addObject:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v8 = [(HMDMediaGroupsAggregateData *)self sentinelGroup];
    id v17 = objc_alloc(MEMORY[0x1E4F2E900]);
    v18 = [v8 encodeToProtoBufferData];
    v19 = (void *)[v17 initWithData:v18];

    v26[0] = v19;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  }
  return v7;
}

- (id)encodedDestinationControllerEvents
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaGroupsAggregateData *)self destinationControllersData];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(HMDMediaGroupsAggregateData *)self destinationControllersData];
    unint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_20_115280);
  }
  else
  {
    v5 = [(HMDMediaGroupsAggregateData *)self sentinelDestinationControllerData];
    id v7 = objc_alloc(MEMORY[0x1E4F2E8F8]);
    v8 = [v5 encodeToProtoBufferData];
    uint64_t v9 = (void *)[v7 initWithData:v8];
    v11[0] = v9;
    unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  return v6;
}

id __65__HMDMediaGroupsAggregateData_encodedDestinationControllerEvents__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2E8F8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 encodeToProtoBufferData];

  unint64_t v6 = (void *)[v4 initWithData:v5];
  return v6;
}

- (id)encodedDestinationEvents
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaGroupsAggregateData *)self destinations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(HMDMediaGroupsAggregateData *)self destinations];
    unint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_16_115284);
  }
  else
  {
    v5 = [(HMDMediaGroupsAggregateData *)self sentinelDestination];
    id v7 = objc_alloc(MEMORY[0x1E4F2E8E8]);
    v8 = [v5 encodeToProtoBufferData];
    uint64_t v9 = (void *)[v7 initWithData:v8];
    v11[0] = v9;
    unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  return v6;
}

id __55__HMDMediaGroupsAggregateData_encodedDestinationEvents__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2E8E8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 encodeToProtoBufferData];

  unint64_t v6 = (void *)[v4 initWithData:v5];
  return v6;
}

- (id)encodeToProtoBufferData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F2E8F0]);
  id v4 = [(HMDMediaGroupsAggregateData *)self encodedDestinationEvents];
  v5 = (void *)[v4 mutableCopy];
  [v3 setDestinations:v5];

  unint64_t v6 = [(HMDMediaGroupsAggregateData *)self encodedDestinationControllerEvents];
  id v7 = (void *)[v6 mutableCopy];
  [v3 setDestinationControllerDatas:v7];

  v8 = [(HMDMediaGroupsAggregateData *)self encodedMediaGroupEvents];
  uint64_t v9 = (void *)[v8 mutableCopy];
  [v3 setGroups:v9];

  uint64_t v10 = [v3 data];

  return v10;
}

- (id)decodeMediaGroupsWithEncodedMediaGroups:(id)a3
{
  id v4 = objc_msgSend(a3, "na_map:", &__block_literal_global_10_115288);
  if ([v4 count] == 1
    && ([v4 firstObject],
        v5 = objc_claimAutoreleasedReturnValue(),
        [(HMDMediaGroupsAggregateData *)self sentinelGroup],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 isEqual:v6],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

id __71__HMDMediaGroupsAggregateData_decodeMediaGroupsWithEncodedMediaGroups___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2E8E0];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 data];

  unint64_t v6 = (void *)[v4 initWithProtoBufferData:v5];
  return v6;
}

- (id)decodeDestinationControllersWithEncodedDestinationControllers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_6_115291);
  uint64_t v6 = [v5 count];
  if (v6 == [v4 count])
  {
    if ([v5 count] == 1
      && ([v5 firstObject],
          char v7 = objc_claimAutoreleasedReturnValue(),
          [(HMDMediaGroupsAggregateData *)self sentinelDestinationControllerData],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v7 isEqual:v8],
          v8,
          v7,
          (v9 & 1) != 0))
    {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v10 = v5;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode destination controllers data in proto data: %@", (uint8_t *)&v16, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

id __93__HMDMediaGroupsAggregateData_decodeDestinationControllersWithEncodedDestinationControllers___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2E8D8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 data];

  uint64_t v6 = (void *)[v4 initWithProtoBufferData:v5];
  return v6;
}

- (id)decodeDestinationsWithEncodedDestinations:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_115295);
  uint64_t v6 = [v5 count];
  if (v6 == [v4 count])
  {
    if ([v5 count] == 1
      && ([v5 firstObject],
          char v7 = objc_claimAutoreleasedReturnValue(),
          [(HMDMediaGroupsAggregateData *)self sentinelDestination],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v7 isEqual:v8],
          v8,
          v7,
          (v9 & 1) != 0))
    {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v10 = v5;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode destinations in proto data: %@", (uint8_t *)&v16, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

id __73__HMDMediaGroupsAggregateData_decodeDestinationsWithEncodedDestinations___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2E8C8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 data];

  uint64_t v6 = (void *)[v4 initWithProtoBufferData:v5];
  return v6;
}

- (HMDMediaGroupsAggregateData)initWithProtoBufferData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F2E8F0]) initWithData:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 destinations];
    id v8 = [(HMDMediaGroupsAggregateData *)self decodeDestinationsWithEncodedDestinations:v7];

    char v9 = [v6 destinationControllerDatas];
    id v10 = [(HMDMediaGroupsAggregateData *)self decodeDestinationControllersWithEncodedDestinationControllers:v9];

    uint64_t v11 = [v6 groups];
    v12 = [(HMDMediaGroupsAggregateData *)self decodeMediaGroupsWithEncodedMediaGroups:v11];

    uint64_t v13 = [(HMDMediaGroupsAggregateData *)self initWithDestinations:v8 destinationControllersData:v10 groups:v12];
    id v14 = v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode event data: %@", (uint8_t *)&v19, 0x16u);
    }
    id v14 = 0;
  }

  return v14;
}

- (id)groupWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMediaGroupsAggregateData *)self groups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HMDMediaGroupsAggregateData_groupWithIdentifier___block_invoke;
  v9[3] = &unk_1E6A0FCF8;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __51__HMDMediaGroupsAggregateData_groupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (HMDMediaGroupsAggregateData)initWithDestinations:(id)a3 destinationControllersData:(id)a4
{
  return [(HMDMediaGroupsAggregateData *)self initWithDestinations:a3 destinationControllersData:a4 groups:MEMORY[0x1E4F1CBF0]];
}

- (HMDMediaGroupsAggregateData)initWithDestinations:(id)a3 destinationControllersData:(id)a4 groups:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDMediaGroupsAggregateData;
  uint64_t v11 = [(HMDMediaGroupsAggregateData *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    destinations = v11->_destinations;
    v11->_destinations = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    destinationControllersData = v11->_destinationControllersData;
    v11->_destinationControllersData = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    groups = v11->_groups;
    v11->_groups = (NSArray *)v16;
  }
  return v11;
}

@end