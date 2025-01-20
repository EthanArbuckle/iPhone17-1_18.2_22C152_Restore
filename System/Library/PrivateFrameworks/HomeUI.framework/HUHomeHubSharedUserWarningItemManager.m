@interface HUHomeHubSharedUserWarningItemManager
- (HUHomeHubSharedUserWarningItemManager)initWithDelegate:(id)a3 homesToUsersMap:(id)a4;
- (HUHomeHubSharedUserWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSArray)homes;
- (NSMapTable)homesToUsersMap;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setHomes:(id)a3;
- (void)setHomesToUsersMap:(id)a3;
@end

@implementation HUHomeHubSharedUserWarningItemManager

- (HUHomeHubSharedUserWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeHubSharedUserWarningItemManager.m", 23, @"%s is unavailable; use %@ instead",
    "-[HUHomeHubSharedUserWarningItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUHomeHubSharedUserWarningItemManager)initWithDelegate:(id)a3 homesToUsersMap:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUHomeHubSharedUserWarningItemManager;
  v7 = [(HFItemManager *)&v10 initWithDelegate:a3 sourceItem:0];
  v8 = v7;
  if (v7) {
    [(HUHomeHubSharedUserWarningItemManager *)v7 setHomesToUsersMap:v6];
  }

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(HUHomeHubSharedUserWarningItemManager *)self homesToUsersMap];
  v7 = [v6 keyEnumerator];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke;
  v14[3] = &unk_1E638D8C8;
  id v15 = v5;
  v16 = self;
  id v8 = v4;
  id v17 = v8;
  id v9 = v5;
  objc_msgSend(v7, "na_each:", v14);

  objc_super v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_163];
  [(HUHomeHubSharedUserWarningItemManager *)self setHomes:v10];

  v11 = v17;
  id v12 = v8;

  return v12;
}

void __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] addObject:v3];
  id v4 = objc_opt_new();
  id v5 = [a1[5] homesToUsersMap];
  id v6 = [v5 objectForKey:v3];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke_2;
  v14 = &unk_1E638D8A0;
  id v15 = v3;
  id v16 = v4;
  id v7 = v4;
  id v8 = v3;
  objc_msgSend(v6, "na_each:", &v11);

  id v9 = objc_alloc(MEMORY[0x1E4F695C8]);
  objc_super v10 = objc_msgSend(v9, "initWithItems:", v7, v11, v12, v13, v14);
  [a1[6] addObject:v10];
}

void __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F69710];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithHome:*(void *)(a1 + 32) user:v4 nameStyle:0];

  [*(id *)(a1 + 40) addObject:v5];
}

uint64_t __68__HUHomeHubSharedUserWarningItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 name];
  id v7 = [v4 name];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = [v5 uniqueIdentifier];

    [v4 uniqueIdentifier];
  }
  else
  {
    id v9 = [v5 name];

    [v4 name];
  objc_super v10 = };
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  if ([v31 count])
  {
    id v30 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [(HUHomeHubSharedUserWarningItemManager *)self homes];
    uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v32)
    {
      uint64_t v28 = *(void *)v40;
      v29 = self;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v4;
          id v5 = *(void **)(*((void *)&v39 + 1) + 8 * v4);
          id v6 = objc_opt_new();
          id v7 = objc_alloc(MEMORY[0x1E4F692E8]);
          int v8 = [v5 uniqueIdentifier];
          id v9 = [v8 UUIDString];
          objc_super v10 = (void *)[v7 initWithIdentifier:v9];

          uint64_t v11 = [(HUHomeHubSharedUserWarningItemManager *)self homes];
          unint64_t v12 = [v11 count];

          if (v12 >= 2)
          {
            v13 = objc_msgSend(v5, "hf_displayName");
            [v10 setHeaderTitle:v13];
          }
          v33 = v10;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v14 = v31;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v36 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                objc_opt_class();
                id v20 = v19;
                if (objc_opt_isKindOfClass()) {
                  v21 = v20;
                }
                else {
                  v21 = 0;
                }
                id v22 = v21;

                v23 = [v22 home];
                int v24 = [v23 isEqual:v5];

                if (v24) {
                  [v6 addObject:v22];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v16);
          }

          v25 = [v6 sortedArrayUsingComparator:&__block_literal_global_16_3];
          [v33 setItems:v25];
          [v30 addObject:v33];

          uint64_t v4 = v34 + 1;
          self = v29;
        }
        while (v34 + 1 != v32);
        uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v32);
    }
  }
  else
  {
    id v30 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

uint64_t __74__HUHomeHubSharedUserWarningItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 user];
  id v6 = [v5 userID];
  id v7 = [v4 user];

  int v8 = [v7 userID];
  uint64_t v9 = [v6 localizedStandardCompare:v8];

  return v9;
}

- (NSMapTable)homesToUsersMap
{
  return self->_homesToUsersMap;
}

- (void)setHomesToUsersMap:(id)a3
{
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homes, 0);

  objc_storeStrong((id *)&self->_homesToUsersMap, 0);
}

@end