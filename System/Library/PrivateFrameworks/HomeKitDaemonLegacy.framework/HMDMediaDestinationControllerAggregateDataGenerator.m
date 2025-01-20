@interface HMDMediaDestinationControllerAggregateDataGenerator
- (id)aggregateDataWithDestinations:(id)a3 controllers:(id)a4 groups:(id)a5;
- (id)validDestinationForDestinationControllerData:(id)a3 inDestinations:(id)a4;
@end

@implementation HMDMediaDestinationControllerAggregateDataGenerator

- (id)validDestinationForDestinationControllerData:(id)a3 inDestinations:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __115__HMDMediaDestinationControllerAggregateDataGenerator_validDestinationForDestinationControllerData_inDestinations___block_invoke;
  v9[3] = &unk_1E6A12240;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a4, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __115__HMDMediaDestinationControllerAggregateDataGenerator_validDestinationForDestinationControllerData_inDestinations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) availableDestinationIdentifiers];
  id v5 = [v3 uniqueIdentifier];
  if ([v4 containsObject:v5]
    && [v3 containsHomeTheaterSupportedOptions])
  {
    id v6 = [v3 audioGroupIdentifier];
    v7 = [*(id *)(a1 + 32) identifier];
    if (objc_msgSend(v6, "hmf_isEqualToUUID:", v7))
    {
      v8 = [v3 uniqueIdentifier];
      v9 = [*(id *)(a1 + 32) destinationIdentifier];
      if (objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
      {
        uint64_t v10 = 1;
      }
      else
      {
        v11 = [v3 parentIdentifier];
        v12 = [*(id *)(a1 + 32) destinationIdentifier];
        uint64_t v10 = objc_msgSend(v11, "hmf_isEqualToUUID:", v12);
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)aggregateDataWithDestinations:(id)a3 controllers:(id)a4 groups:(id)a5
{
  id v8 = a3;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __104__HMDMediaDestinationControllerAggregateDataGenerator_aggregateDataWithDestinations_controllers_groups___block_invoke;
  v18 = &unk_1E6A12218;
  v19 = self;
  id v20 = v8;
  id v9 = v8;
  id v10 = a5;
  v11 = objc_msgSend(a4, "na_map:", &v15);
  v12 = [HMDMediaGroupsAggregateData alloc];
  v13 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:](v12, "initWithDestinations:destinationControllersData:groups:", v9, v11, v10, v15, v16, v17, v18, v19);

  return v13;
}

id __104__HMDMediaDestinationControllerAggregateDataGenerator_aggregateDataWithDestinations_controllers_groups___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 destinationIdentifier];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) validDestinationForDestinationControllerData:v3 inDestinations:*(void *)(a1 + 40)];
    id v6 = (void *)[v3 mutableCopy];
    id v7 = v6;
    if (v5)
    {
      id v8 = [v5 uniqueIdentifier];
      [v7 setDestinationIdentifier:v8];
    }
    else
    {
      [v6 setDestinationIdentifier:0];
    }
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

@end