@interface HFAbstractControlStatusItem
+ (BOOL)_isControlItem:(id)a3 identicalToControlItem:(id)a4;
+ (BOOL)_isControlItem:(id)a3 similarToControlItem:(id)a4;
+ (NSSet)serviceTypes;
- (BOOL)supportsInvalidation;
- (id)_aggregatedValueSourceWithServiceItems:(id)a3;
- (id)_buildControlItemsForServices:(id)a3;
- (id)_buildServiceItemsForServices:(id)a3;
- (id)_primaryServiceDescriptorForServices:(id)a3;
- (id)standardResultsForBatchReadResponse:(id)a3 serviceTypes:(id)a4;
@end

@implementation HFAbstractControlStatusItem

BOOL __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 characteristicOptions];
  v3 = [v2 characteristicTypesForUsage:0];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _isControlItem:v3 similarToControlItem:*(void *)(a1 + 40)];

  return v4;
}

+ (BOOL)_isControlItem:(id)a3 similarToControlItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    v7 = [v5 characteristicOptions];
    v8 = [v7 objectForKeyedSubscript:&unk_26C0F6018];
    v9 = [v6 characteristicOptions];
    v10 = [v9 objectForKeyedSubscript:&unk_26C0F6018];
    char v11 = [v8 intersectsSet:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

id __68__HFAbstractControlStatusItem__primaryServiceDescriptorForServices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isChildService"))
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_msgSend(v2, "hf_serviceDescriptor");
  }

  return v3;
}

id __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithValueSource:*(void *)(a1 + 32)];
  return v2;
}

id __70__HFAbstractControlStatusItem__aggregatedValueSourceWithServiceItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 service];
  uint64_t v4 = objc_msgSend(v3, "hf_childServices");
  id v5 = [v2 service];

  id v6 = [v4 setByAddingObject:v5];

  return v6;
}

id __61__HFAbstractControlStatusItem__buildServiceItemsForServices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 valueSource];
  id v5 = +[HFServiceItem serviceItemForService:v3 valueSource:v4];

  return v5;
}

- (id)standardResultsForBatchReadResponse:(id)a3 serviceTypes:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)HFAbstractControlStatusItem;
  id v5 = [(HFStatusItem *)&v20 standardResultsForBatchReadResponse:a3 serviceTypes:a4];
  id v6 = (void *)[v5 mutableCopy];

  v7 = [v6 objectForKeyedSubscript:@"representedHomeKitObjects"];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 anyObject];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();

    if (v10 == v11)
    {
      v12 = [(HFAbstractControlStatusItem *)self _buildControlItemsForServices:v8];
      v13 = [(HFItem *)self latestResults];
      v14 = [v13 objectForKeyedSubscript:@"childItems"];
      v15 = v14;
      if (v14)
      {
        id v16 = v14;
      }
      else
      {
        id v16 = [MEMORY[0x263EFFA08] set];
      }
      v17 = v16;

      v18 = objc_msgSend(v17, "na_setByDiffingWithSet:", v12);
      [v6 setObject:v18 forKeyedSubscript:@"childItems"];

      if ([v12 count]) {
        [v6 setObject:&unk_26C0F6000 forKeyedSubscript:@"statusItemCategory"];
      }
    }
  }

  return v6;
}

- (BOOL)supportsInvalidation
{
  return 1;
}

- (id)_buildControlItemsForServices:(id)a3
{
  v53[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFAbstractControlStatusItem *)self _buildServiceItemsForServices:v4];
  if ([v5 count])
  {
    id v28 = v4;
    id v6 = [(HFAbstractControlStatusItem *)self _aggregatedValueSourceWithServiceItems:v5];
    v7 = [v5 anyObject];
    v52 = HFItemUpdateOptionDisableOptionalData;
    v53[0] = MEMORY[0x263EFFA88];
    [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
    v30 = v32 = v7;
    v26 = objc_msgSend(v7, "createControlItemsWithOptions:");
    v8 = objc_msgSend(v26, "na_filter:", &__block_literal_global_22);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_2;
    v48[3] = &unk_26408EB48;
    id v35 = v6;
    id v49 = v35;
    v9 = objc_msgSend(v8, "na_map:", v48);
    id v38 = (id)[v9 mutableCopy];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v27 = v5;
    obuint64_t j = v5;
    uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v33)
    {
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (v11 != v32)
          {
            uint64_t v34 = i;
            v36 = [MEMORY[0x263EFF9C0] set];
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v37 = [v11 createControlItemsWithOptions:v30];
            uint64_t v12 = [v37 countByEnumeratingWithState:&v40 objects:v50 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v41;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v41 != v14) {
                    objc_enumerationMutation(v37);
                  }
                  id v16 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                  v39[0] = MEMORY[0x263EF8330];
                  v39[1] = 3221225472;
                  v39[2] = __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_3;
                  v39[3] = &unk_26408EB70;
                  v39[4] = self;
                  v39[5] = v16;
                  v17 = objc_msgSend(v38, "na_firstObjectPassingTest:", v39);
                  if (v17)
                  {
                    v18 = [v16 characteristicOptions];
                    v19 = [v18 characteristicTypesForUsage:0];
                    uint64_t v20 = [v19 count];

                    if (v20)
                    {
                      if ([(id)objc_opt_class() _isControlItem:v17 identicalToControlItem:v16])
                      {
                        [v36 addObject:v17];
                      }
                      else
                      {
                        v21 = [v16 characteristicOptions];
                        v22 = [v17 characteristicOptions];
                        v23 = [v21 optionsByIntersectingWithOptions:v22];

                        if ([v17 canCopyWithCharacteristicOptions:v23])
                        {
                          v24 = (void *)[v17 copyWithCharacteristicOptions:v23 valueSource:v35];
                          [v36 addObject:v24];
                        }
                      }
                    }
                  }
                }
                uint64_t v13 = [v37 countByEnumeratingWithState:&v40 objects:v50 count:16];
              }
              while (v13);
            }

            id v38 = v36;
            uint64_t i = v34;
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v33);
    }

    id v5 = v27;
    id v4 = v28;
  }
  else
  {
    id v38 = [MEMORY[0x263EFFA08] set];
  }

  return v38;
}

+ (BOOL)_isControlItem:(id)a3 identicalToControlItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    v7 = [v5 characteristicOptions];
    v8 = [v6 characteristicOptions];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_buildServiceItemsForServices:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__HFAbstractControlStatusItem__buildServiceItemsForServices___block_invoke;
  v5[3] = &unk_26408EB00;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "na_map:", v5);
  return v3;
}

- (id)_aggregatedValueSourceWithServiceItems:(id)a3
{
  id v4 = objc_msgSend(a3, "na_flatMap:", &__block_literal_global_15_0);
  id v5 = [(HFAbstractControlStatusItem *)self _primaryServiceDescriptorForServices:v4];
  id v6 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v7 = [(HFStatusItem *)self valueSource];
  v8 = [(HFSimpleAggregatedCharacteristicValueSource *)v6 initWithValueSource:v7 services:v4 primaryServiceDescriptor:v5];

  return v8;
}

- (id)_primaryServiceDescriptorForServices:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a3, "na_map:", &__block_literal_global_12_0);
  id v5 = [v4 anyObject];
  if ([v4 count] != 1)
  {
    id v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138413058;
      char v9 = self;
      __int16 v10 = 2048;
      uint64_t v11 = [v4 count];
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      __int16 v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%@ Invalid number of service descriptors (expected 1, found %lu): %@. Defaulting to %@.", (uint8_t *)&v8, 0x2Au);
    }
  }
  return v5;
}

+ (NSSet)serviceTypes
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractControlStatusItem.m", 179, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractControlStatusItem serviceTypes]", objc_opt_class() object file lineNumber description];

  return 0;
}

@end