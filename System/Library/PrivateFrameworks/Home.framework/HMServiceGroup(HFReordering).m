@interface HMServiceGroup(HFReordering)
- (HFServiceNameComponents)hf_serviceNameComponents;
- (id)hf_displayName;
- (id)hf_updateDateAdded:()HFReordering;
@end

@implementation HMServiceGroup(HFReordering)

- (id)hf_displayName
{
  v1 = objc_msgSend(a1, "hf_serviceNameComponents");
  v2 = [v1 composedString];

  return v2;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [a1 name];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend(a1, "services", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) accessory];
        v10 = [v9 room];

        if (v10)
        {
          if (v6)
          {
            if (([v6 isEqual:v10] & 1) == 0)
            {

              goto LABEL_14;
            }
          }
          else
          {
            id v6 = v10;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
LABEL_14:
    id v6 = 0;
  }

  v11 = [v6 name];
  v12 = [[HFServiceNameComponents alloc] initWithRawServiceName:v2 rawRoomName:v11];

  return v12;
}

- (id)hf_updateDateAdded:()HFReordering
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

@end