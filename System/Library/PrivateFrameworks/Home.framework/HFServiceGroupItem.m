@interface HFServiceGroupItem
+ (BOOL)_isControlItem:(id)a3 identicalToControlItem:(id)a4;
+ (BOOL)_isControlItem:(id)a3 similarToControlItem:(id)a4;
+ (id)_combinedWriteErrorForError:(id)a3 serviceGroupTitle:(id)a4;
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (BOOL)actionsMayRequireDeviceUnlock;
- (BOOL)containsActions;
- (BOOL)isContainedWithinItemGroup;
- (BOOL)isItemGroup;
- (HFCharacteristicValueSource)valueSource;
- (HFServiceGroupItem)init;
- (HFServiceGroupItem)initWithValueSource:(id)a3 serviceGroup:(id)a4;
- (HMHome)home;
- (HMServiceGroup)serviceGroup;
- (NSSet)services;
- (NSString)description;
- (double)_averageNumericalValueForResultsKey:(id)a3 inServiceItems:(id)a4;
- (id)_aggregatedValueSource;
- (id)_buildControlItemsForServiceItems:(id)a3;
- (id)_buildServiceItems;
- (id)_mergedIconDescriptorForServiceItems:(id)a3;
- (id)_mostCommonValueForResultsKey:(id)a3 inServiceItems:(id)a4;
- (id)_mostCommonValueInServiceItems:(id)a3 valueProvider:(id)a4;
- (id)_sortDescriptorsForServiceItems;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_unanimousValueForResultsKey:(id)a3 inServiceItems:(id)a4;
- (id)accessories;
- (id)allControlItems;
- (id)controlPanelItems;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)incrementalStateControlItem;
- (id)namingComponentForHomeKitObject;
- (id)primaryStateControlItem;
- (id)serviceLikeBuilderInHome:(id)a3;
- (int64_t)_highestIntegerValueForResultsKey:(id)a3 inServiceItems:(id)a4;
- (unint64_t)numberOfItemsContainedWithinGroup;
@end

@implementation HFServiceGroupItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "hf_homeKitObject");

  id v10 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    v12 = v10;
    if (v11) {
      goto LABEL_8;
    }
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v12 = 0;
LABEL_8:

  v15 = (void *)[objc_alloc((Class)a1) initWithValueSource:v6 serviceGroup:v12];
  return v15;
}

- (HFServiceGroupItem)initWithValueSource:(id)a3 serviceGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceGroupItem;
  v9 = [(HFServiceGroupItem *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueSource, a3);
    objc_storeStrong((id *)&v10->_serviceGroup, a4);
  }

  return v10;
}

- (HFServiceGroupItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFServiceGroupItem.m" lineNumber:40 description:@"Use -initWithValueSource:serviceGroup:"];

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFServiceGroupItem *)self valueSource];
  id v5 = [(HFServiceGroupItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(HFServiceGroupItem *)self serviceGroup];
  id v7 = (void *)[v5 initWithValueSource:v4 serviceGroup:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(HFServiceGroupItem *)self serviceGroup];
  id v7 = objc_msgSend(v6, "hf_prettyDescription");
  id v8 = [(HFItem *)self latestResults];
  v9 = [v3 stringWithFormat:@"<%@: %p, %@ %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  id v6 = [(HFServiceGroupItem *)self _buildServiceItems];
  id v7 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) updateWithOptions:v4];
        objc_msgSend(v7, "na_safeAddObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  v14 = (void *)MEMORY[0x263F58190];
  v15 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v16 = [v14 combineAllFutures:v7 ignoringErrors:1 scheduler:v15];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __50__HFServiceGroupItem__subclass_updateWithOptions___block_invoke;
  v24[3] = &unk_26408F198;
  v24[4] = self;
  id v25 = v8;
  id v26 = v4;
  id v17 = v5;
  id v27 = v17;
  id v18 = v4;
  id v19 = v8;
  id v20 = (id)[v16 addCompletionBlock:v24];
  v21 = v27;
  id v22 = v17;

  return v22;
}

void __50__HFServiceGroupItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [a1[4] serviceGroup];
  uint64_t v9 = objc_msgSend(v8, "hf_serviceNameComponents");

  if (v9)
  {
    [v7 setObject:v9 forKeyedSubscript:@"serviceNameComponents"];
    uint64_t v10 = [v9 composedString];
    if (v10) {
      [v7 setObject:v10 forKeyedSubscript:@"title"];
    }
  }
  v75 = v9;
  uint64_t v11 = [a1[4] _buildControlItemsForServiceItems:a1[5]];
  uint64_t v12 = [a1[6] objectForKeyedSubscript:HFItemUpdateOptionPreviousResults];
  v13 = [v12 objectForKeyedSubscript:@"childItems"];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x263EFFA08] set];
  }
  v16 = v15;

  v73 = v16;
  v74 = (void *)v11;
  id v17 = objc_msgSend(v16, "na_setByDiffingWithSet:", v11);
  [v7 setObject:v17 forKeyedSubscript:@"childItems"];

  v81 = [MEMORY[0x263EFF9C0] set];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v76 = a1;
  id v18 = a1[5];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v94 objects:v101 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v95 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v94 + 1) + 8 * i) latestResults];
        v24 = [v23 objectForKeyedSubscript:@"dependentHomeKitObjects"];

        if (v24) {
          [v81 unionSet:v24];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v94 objects:v101 count:16];
    }
    while (v20);
  }

  [v7 setObject:v81 forKeyedSubscript:@"dependentHomeKitObjects"];
  id v25 = v76;
  id v26 = [v76[4] _unanimousValueForResultsKey:@"hidden" inServiceItems:v76[5]];
  LODWORD(v27) = [v26 BOOLValue];
  uint64_t v28 = [v76[5] count];
  long long v29 = [v76[4] serviceGroup];
  char v30 = objc_msgSend(v29, "hf_isSupported");

  if ((v30 & 1) == 0)
  {
    v45 = [NSNumber numberWithBool:1];
    [v7 setObject:v45 forKeyedSubscript:@"hidden"];
LABEL_58:

    goto LABEL_59;
  }
  if (v28) {
    uint64_t v27 = v27;
  }
  else {
    uint64_t v27 = 1;
  }
  long long v31 = [NSNumber numberWithBool:v27];
  [v7 setObject:v31 forKeyedSubscript:@"hidden"];

  if ((v27 & 1) == 0)
  {
    v70 = v26;
    id v71 = v6;
    id v72 = v5;
    v32 = [v76[4] _mergedIconDescriptorForServiceItems:v76[5]];
    [v7 setObject:v32 forKeyedSubscript:@"icon"];

    uint64_t v33 = [v76[4] _unanimousValueForResultsKey:@"state" inServiceItems:v76[5]];
    v34 = (void *)v33;
    if (v33) {
      v35 = (void *)v33;
    }
    else {
      v35 = &unk_26C0F7758;
    }
    [v7 setObject:v35 forKeyedSubscript:@"state"];

    v36 = [v76[4] _mostCommonValueForResultsKey:@"roomIdentifier" inServiceItems:v76[5]];
    [v7 setObject:v36 forKeyedSubscript:@"roomIdentifier"];

    v80 = [MEMORY[0x263EFF910] distantFuture];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v37 = v76[5];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v90 objects:v100 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v91 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v90 + 1) + 8 * j) latestResults];
          v43 = [v42 objectForKeyedSubscript:@"dateAdded"];

          if (v43)
          {
            uint64_t v44 = [v80 earlierDate:v43];

            v80 = (void *)v44;
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v90 objects:v100 count:16];
      }
      while (v39);
    }

    v46 = [MEMORY[0x263EFF910] distantFuture];
    char v47 = [v80 isEqualToDate:v46];

    if ((v47 & 1) == 0) {
      [v7 setObject:v80 forKeyedSubscript:@"dateAdded"];
    }
    v69 = [v76[4] _mostCommonValueInServiceItems:v76[5] valueProvider:&__block_literal_global_180];
    objc_msgSend(v7, "na_safeSetObject:forKey:");
    id v48 = v76[5];
    v49 = [v76[4] _sortDescriptorsForServiceItems];
    v50 = [v48 sortedArrayUsingDescriptors:v49];

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    obuint64_t j = v50;
    uint64_t v79 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
    if (v79)
    {
      uint64_t v78 = *(void *)v87;
      do
      {
        for (uint64_t k = 0; k != v79; ++k)
        {
          if (*(void *)v87 != v78) {
            objc_enumerationMutation(obj);
          }
          v52 = *(void **)(*((void *)&v86 + 1) + 8 * k);
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v53 = [v52 latestResults];
          uint64_t v54 = [v53 countByEnumeratingWithState:&v82 objects:v98 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v83;
            do
            {
              for (uint64_t m = 0; m != v55; ++m)
              {
                if (*(void *)v83 != v56) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v58 = *(void *)(*((void *)&v82 + 1) + 8 * m);
                v59 = [v7 objectForKeyedSubscript:v58];

                if (!v59)
                {
                  v60 = [v52 latestResults];
                  v61 = [v60 objectForKeyedSubscript:v58];
                  [v7 setObject:v61 forKeyedSubscript:v58];
                }
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v82 objects:v98 count:16];
            }
            while (v55);
          }
        }
        uint64_t v79 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
      }
      while (v79);
    }

    id v25 = v76;
    v62 = [v76[4] serviceGroup];
    int v63 = objc_msgSend(v62, "hf_hasSetFavorite");

    id v6 = v71;
    if (v63)
    {
      v64 = NSNumber;
      v65 = [v76[4] serviceGroup];
      v66 = objc_msgSend(v64, "numberWithBool:", objc_msgSend(v65, "hf_isFavorite"));
      [v7 setObject:v66 forKeyedSubscript:@"isFavorite"];
    }
    else
    {
      [v7 setObject:0 forKeyedSubscript:@"isFavorite"];
    }
    id v5 = v72;
    id v26 = v70;
    v45 = v80;

    goto LABEL_58;
  }
LABEL_59:
  id v67 = v25[7];
  v68 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  [v67 finishWithResult:v68];
}

id __50__HFServiceGroupItem__subclass_updateWithOptions___block_invoke_17(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  v3 = [v2 objectForKeyedSubscript:@"badge"];

  if ([v3 isEqual:&unk_26C0F7770]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isItemGroup
{
  return 1;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  v2 = [(HFServiceGroupItem *)self serviceGroup];
  v3 = [v2 services];
  unint64_t v4 = [v3 count];

  return v4;
}

- (BOOL)isContainedWithinItemGroup
{
  return 0;
}

- (id)_buildServiceItems
{
  v3 = (void *)MEMORY[0x263EFFA08];
  unint64_t v4 = [(HFServiceGroupItem *)self serviceGroup];
  id v5 = [v4 services];
  id v6 = [v3 setWithArray:v5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__HFServiceGroupItem__buildServiceItems__block_invoke;
  v9[3] = &unk_26408EB00;
  v9[4] = self;
  id v7 = objc_msgSend(v6, "na_map:", v9);

  return v7;
}

id __40__HFServiceGroupItem__buildServiceItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unint64_t v4 = [v2 valueSource];
  id v5 = +[HFServiceItem serviceItemForService:v3 valueSource:v4];

  return v5;
}

- (id)_buildControlItemsForServiceItems:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    v34 = [v4 anyObject];
    id v5 = [v34 latestResults];
    id v6 = objc_msgSend(v5, "objectForKeyedSubscript:");
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke;
    v50[3] = &unk_26408EB48;
    v50[4] = self;
    id v7 = objc_msgSend(v6, "na_map:", v50);
    id v8 = (void *)[v7 mutableCopy];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v31 = v4;
    obuint64_t j = v4;
    uint64_t v35 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v47;
      uint64_t v9 = v41;
      uint64_t v10 = &unk_26408EB70;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (v12 != v34)
          {
            uint64_t v36 = i;
            uint64_t v38 = [MEMORY[0x263EFF9C0] set];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            v13 = [v12 latestResults];
            v14 = [v13 objectForKeyedSubscript:@"childItems"];

            id v39 = v14;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v51 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v43;
              do
              {
                uint64_t v18 = 0;
                uint64_t v37 = v16;
                do
                {
                  if (*(void *)v43 != v17) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v42 + 1) + 8 * v18);
                  v40[0] = MEMORY[0x263EF8330];
                  v40[1] = 3221225472;
                  v41[0] = __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke_2;
                  v41[1] = v10;
                  v41[2] = self;
                  v41[3] = v19;
                  uint64_t v20 = objc_msgSend(v8, "na_firstObjectPassingTest:", v40, v31);
                  if (v20)
                  {
                    if ([(id)objc_opt_class() _isControlItem:v20 identicalToControlItem:v19])
                    {
                      [v38 addObject:v20];
                    }
                    else
                    {
                      uint64_t v21 = v17;
                      id v22 = v9;
                      v23 = v8;
                      v24 = v10;
                      id v25 = [v19 characteristicOptions];
                      id v26 = [v20 characteristicOptions];
                      uint64_t v27 = [v25 optionsByIntersectingWithOptions:v26];

                      if ([v20 canCopyWithCharacteristicOptions:v27])
                      {
                        uint64_t v28 = [(HFServiceGroupItem *)self _aggregatedValueSource];
                        long long v29 = (void *)[v20 copyWithCharacteristicOptions:v27 valueSource:v28];

                        [v38 addObject:v29];
                      }

                      uint64_t v10 = v24;
                      id v8 = v23;
                      uint64_t v9 = v22;
                      uint64_t v17 = v21;
                      uint64_t v16 = v37;
                    }
                  }

                  ++v18;
                }
                while (v16 != v18);
                uint64_t v16 = [v39 countByEnumeratingWithState:&v42 objects:v51 count:16];
              }
              while (v16);
            }

            id v8 = v38;
            uint64_t i = v36;
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v35);
    }

    id v4 = v31;
  }
  else
  {
    id v8 = [MEMORY[0x263EFFA08] set];
  }

  return v8;
}

id __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _aggregatedValueSource];
  id v5 = (void *)[v3 copyWithValueSource:v4];

  return v5;
}

uint64_t __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke_2(uint64_t a1, void *a2)
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
    id v7 = [v5 characteristicOptions];
    id v8 = [v7 objectForKeyedSubscript:&unk_26C0F7770];
    uint64_t v9 = [v6 characteristicOptions];
    uint64_t v10 = [v9 objectForKeyedSubscript:&unk_26C0F7770];
    char v11 = [v8 intersectsSet:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)_isControlItem:(id)a3 identicalToControlItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    id v7 = [v5 characteristicOptions];
    id v8 = [v6 characteristicOptions];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_aggregatedValueSource
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(HFServiceGroupItem *)self serviceGroup];
  id v5 = [v4 services];
  id v6 = [v3 setWithArray:v5];

  id v7 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  id v8 = [(HFServiceGroupItem *)self valueSource];
  char v9 = [(HFServiceGroupItem *)self serviceGroup];
  uint64_t v10 = objc_msgSend(v9, "hf_serviceDescriptor");
  char v11 = [(HFSimpleAggregatedCharacteristicValueSource *)v7 initWithValueSource:v8 services:v6 primaryServiceDescriptor:v10];

  return v11;
}

- (id)primaryStateControlItem
{
  v2 = NSStringFromSelector(a2);
  NSLog(&cfstr_IsDeprecatedAn.isa, v2);

  return 0;
}

- (id)incrementalStateControlItem
{
  v2 = NSStringFromSelector(a2);
  NSLog(&cfstr_IsDeprecatedAn.isa, v2);

  return 0;
}

- (id)allControlItems
{
  v2 = NSStringFromSelector(a2);
  NSLog(&cfstr_IsDeprecatedAn.isa, v2);

  id v3 = (void *)MEMORY[0x263EFFA08];
  return (id)[v3 set];
}

- (id)controlPanelItems
{
  v2 = NSStringFromSelector(a2);
  NSLog(&cfstr_IsDeprecatedAn.isa, v2);

  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)containsActions
{
  v2 = [(HFServiceGroupItem *)self _buildServiceItems];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_34_5);

  return v3;
}

uint64_t __37__HFServiceGroupItem_containsActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsActions];
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  v2 = [(HFServiceGroupItem *)self _buildServiceItems];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_36_4);

  return v3;
}

uint64_t __51__HFServiceGroupItem_actionsMayRequireDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 actionsMayRequireDeviceUnlock];
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v25 = objc_alloc_init(MEMORY[0x263F58190]);
  id v26 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = [(HFServiceGroupItem *)self serviceGroup];
  id v6 = [v5 services];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * v10);
        uint64_t v12 = [(HFServiceGroupItem *)self valueSource];
        v13 = +[HFServiceItem serviceItemForService:v11 valueSource:v12];

        if (v13)
        {
          v14 = [v13 currentStateActionBuildersForHome:v4];
          if (v14) {
            [v26 addObject:v14];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  uint64_t v15 = (void *)MEMORY[0x263F58190];
  uint64_t v16 = [MEMORY[0x263F581B8] mainThreadScheduler];
  uint64_t v17 = [v15 combineAllFutures:v26 ignoringErrors:0 scheduler:v16];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke;
  v29[3] = &unk_264093558;
  id v18 = v25;
  id v30 = v18;
  id v19 = (id)[v17 addSuccessBlock:v29];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke_2;
  v27[3] = &unk_26408CDF0;
  id v20 = v18;
  id v28 = v20;
  id v21 = (id)[v17 addFailureBlock:v27];
  id v22 = v28;
  id v23 = v20;

  return v23;
}

void __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "unionSet:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) finishWithResult:v4];
}

uint64_t __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (HMHome)home
{
  v2 = [(HFServiceGroupItem *)self serviceGroup];
  id v3 = [v2 services];
  id v4 = [v3 firstObject];
  id v5 = [v4 home];

  return (HMHome *)v5;
}

- (NSSet)services
{
  id v3 = [(HFServiceGroupItem *)self serviceGroup];
  id v4 = [v3 services];
  id v5 = (void *)MEMORY[0x263EFFA08];
  if (v4)
  {
    uint64_t v6 = [(HFServiceGroupItem *)self serviceGroup];
    uint64_t v7 = [v6 services];
    uint64_t v8 = [v5 setWithArray:v7];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v8;
}

- (id)accessories
{
  v2 = [(HFServiceGroupItem *)self services];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_41_4);

  return v3;
}

uint64_t __33__HFServiceGroupItem_accessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  id v5 = [HFServiceGroupBuilder alloc];
  uint64_t v6 = [(HFServiceGroupItem *)self homeKitObject];
  uint64_t v7 = [(HFServiceGroupBuilder *)v5 initWithExistingObject:v6 inHome:v4];

  return v7;
}

+ (id)_combinedWriteErrorForError:(id)a3 serviceGroupTitle:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:@"HFOperationChangeValuesForMultipleServices" forKeyedSubscript:@"HFErrorUserInfoOperationKey"];
  if (v6)
  {
    long long v11 = @"HFErrorHandlerOptionFailedItemName";
    v12[0] = v6;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v7 setObject:v8 forKeyedSubscript:@"HFErrorUserInfoOptionsKey"];
  }
  uint64_t v9 = objc_msgSend(v5, "hf_errorWithAddedUserInfo:", v7);

  return v9;
}

- (id)_unanimousValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "latestResults", (void)v16);
        long long v13 = [v12 objectForKeyedSubscript:v5];

        if (v13)
        {
          if (v9)
          {
            if (![v9 isEqual:v13])
            {

              v14 = 0;
              goto LABEL_16;
            }
          }
          else
          {
            id v9 = v13;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  id v9 = v9;
  v14 = v9;
LABEL_16:

  return v14;
}

- (double)_averageNumericalValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v19;
  double v11 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      long long v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) latestResults];
      v14 = [v13 objectForKeyedSubscript:v5];

      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ++v9;
          [v14 doubleValue];
          double v11 = v11 + v15;
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v8);
  if (v9 >= 1) {
    double v16 = v11 / (double)v9;
  }
  else {
LABEL_13:
  }
    double v16 = 1.79769313e308;

  return v16;
}

- (id)_mostCommonValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__HFServiceGroupItem__mostCommonValueForResultsKey_inServiceItems___block_invoke;
  v10[3] = &unk_2640935C8;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(HFServiceGroupItem *)self _mostCommonValueInServiceItems:a4 valueProvider:v10];

  return v8;
}

id __67__HFServiceGroupItem__mostCommonValueForResultsKey_inServiceItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  return v4;
}

- (int64_t)_highestIntegerValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    int64_t v10 = 0xFFFFFFFF80000000;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) latestResults];
        long long v13 = [v12 objectForKeyedSubscript:v5];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 integerValue] > v10) {
          int64_t v10 = [v13 integerValue];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v10 = 0xFFFFFFFF80000000;
  }

  return v10;
}

- (id)_mergedIconDescriptorForServiceItems:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:@"HFImageIconIdentifierGeneric"];
  id v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_46_3);
  if ([v6 count] == 1)
  {
    uint64_t v7 = [v6 anyObject];
  }
  else
  {
    uint64_t v8 = objc_msgSend(v4, "na_map:", &__block_literal_global_48_2);
    uint64_t v9 = objc_msgSend(v4, "na_map:", &__block_literal_global_50_1);
    if ((unint64_t)[v8 count] >= 2 && objc_msgSend(v9, "count") == 1)
    {
      int64_t v10 = [v9 anyObject];
      id v11 = [v10 serviceType];
      long long v12 = [v9 anyObject];
      [v12 serviceSubtype];
      v14 = long long v13 = v9;
      uint64_t v7 = +[HFServiceIconFactory defaultIconDescriptorForServiceType:v11 serviceSubtype:v14];

      uint64_t v9 = v13;
    }
    else
    {
      long long v15 = [(HFServiceGroupItem *)self _mostCommonValueInServiceItems:v4 valueProvider:&__block_literal_global_53_5];
      long long v16 = v15;
      if (v15)
      {
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_5;
        v39[3] = &unk_2640935C8;
        id v40 = v15;
        long long v17 = objc_msgSend(v4, "na_map:", v39);
        if ([v17 count])
        {
          long long v33 = v8;
          long long v18 = [v17 anyObject];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v19 = [MEMORY[0x263EFFA08] setWithObject:v18];
          long long v32 = v17;
          uint64_t v20 = objc_msgSend(v17, "na_setByRemovingObjectsFromSet:", v19);

          uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
          long long v34 = v18;
          id v22 = v18;
          if (v21)
          {
            uint64_t v23 = v21;
            uint64_t v24 = *(void *)v36;
            id v22 = v34;
            id v30 = v16;
            long long v31 = v9;
            while (2)
            {
              uint64_t v25 = 0;
              id v26 = v22;
              do
              {
                if (*(void *)v36 != v24) {
                  objc_enumerationMutation(v20);
                }
                if (!v26
                  || (uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * v25), (objc_opt_respondsToSelector() & 1) == 0))
                {

                  id v22 = 0;
                  long long v16 = v30;
                  uint64_t v9 = v31;
                  goto LABEL_20;
                }
                id v22 = [(HFImageIconDescriptor *)v26 iconDescriptorByMergingWithIconDescriptor:v27];

                ++v25;
                id v26 = v22;
              }
              while (v23 != v25);
              uint64_t v23 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
              long long v16 = v30;
              uint64_t v9 = v31;
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_20:

          if (v22) {
            id v28 = v22;
          }
          else {
            id v28 = v5;
          }
          uint64_t v7 = v28;

          long long v17 = v32;
          uint64_t v8 = v33;
        }
        else
        {
          if (![v17 count]) {
            NSLog(&cfstr_WeHaveAMostCom.isa);
          }
          uint64_t v7 = v5;
        }
      }
      else
      {
        uint64_t v7 = v5;
      }
    }
  }

  return v7;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"icon"];

  return v3;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  id v3 = objc_msgSend(v2, "hf_accessoryType");

  return v3;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  id v3 = objc_msgSend(v2, "hf_serviceDescriptor");

  return v3;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"icon"];

  id v4 = [v3 identifier];

  return v4;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"icon"];

  id v5 = [v4 identifier];
  if ([v5 isEqualToString:*(void *)(a1 + 32)]) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)_mostCommonValueInServiceItems:(id)a3 valueProvider:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [a3 allObjects];
    id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_61_1];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __67__HFServiceGroupItem__mostCommonValueInServiceItems_valueProvider___block_invoke_2;
    v11[3] = &unk_2640992C0;
    id v12 = v5;
    uint64_t v8 = objc_msgSend(v7, "na_map:", v11);
    uint64_t v9 = objc_msgSend(v8, "hf_firstMostCommonObject");
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __67__HFServiceGroupItem__mostCommonValueInServiceItems_valueProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 service];
  id v6 = [v5 uniqueIdentifier];
  id v7 = [v4 service];

  uint64_t v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __67__HFServiceGroupItem__mostCommonValueInServiceItems_valueProvider___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_sortDescriptorsForServiceItems
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_64_3];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_69_2];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0 comparator:&__block_literal_global_71_2];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return v5;
}

uint64_t __53__HFServiceGroupItem__sortDescriptorsForServiceItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"priority"];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = &unk_26C0F7788;
  }
  id v9 = v8;

  int64_t v10 = [v4 latestResults];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"priority"];
  id v12 = (void *)v11;
  if (v11) {
    long long v13 = (void *)v11;
  }
  else {
    long long v13 = &unk_26C0F7788;
  }
  id v14 = v13;

  uint64_t v15 = [v9 compare:v14];
  return v15;
}

uint64_t __53__HFServiceGroupItem__sortDescriptorsForServiceItems__block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 latestResults];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"errorDescription"];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [v5 latestResults];
    int64_t v10 = [v9 objectForKeyedSubscript:@"errorDescription"];

    if (!v10)
    {
      uint64_t v11 = -1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v12 = [v4 latestResults];
  long long v13 = [v12 objectForKeyedSubscript:@"errorDescription"];
  if (v13)
  {

    uint64_t v11 = 0;
  }
  else
  {
    id v14 = [v5 latestResults];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"errorDescription"];
    uint64_t v11 = v15 != 0;
  }
LABEL_8:

  return v11;
}

uint64_t __53__HFServiceGroupItem__sortDescriptorsForServiceItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"subPriority"];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = &unk_26C0F77A0;
  }
  id v9 = v8;

  int64_t v10 = [v4 latestResults];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"subPriority"];
  id v12 = (void *)v11;
  if (v11) {
    long long v13 = (void *)v11;
  }
  else {
    long long v13 = &unk_26C0F77A0;
  }
  id v14 = v13;

  uint64_t v15 = [v9 compare:v14];
  return v15;
}

- (id)namingComponentForHomeKitObject
{
  v2 = [(HFServiceGroupItem *)self serviceGroup];
  id v3 = +[HFNamingComponents namingComponentFromServiceGroup:v2];

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HMServiceGroup)serviceGroup
{
  return self->_serviceGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGroup, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

@end