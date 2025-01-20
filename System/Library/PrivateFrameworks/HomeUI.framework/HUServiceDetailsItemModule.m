@interface HUServiceDetailsItemModule
+ (id)serviceDetailsItemSectionComparatorForSortStrategy:(id)a3;
- (HFItem)sourceItem;
- (HMHome)home;
- (HUServiceDetailsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5;
- (id)itemProviders;
- (void)setHome:(id)a3;
- (void)setSourceItem:(id)a3;
@end

@implementation HUServiceDetailsItemModule

+ (id)serviceDetailsItemSectionComparatorForSortStrategy:(id)a3
{
  if ([a3 isEqualToString:@"HUServiceDetailsItemModuleSortStrategyProgrammableSwitch"])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__HUServiceDetailsItemModule_serviceDetailsItemSectionComparatorForSortStrategy___block_invoke;
    v7[3] = &__block_descriptor_48_e41_q24__0__HFItemSection_8__HFItemSection_16l;
    v7[4] = a2;
    v7[5] = a1;
    v5 = _Block_copy(v7);
  }
  else
  {
    v5 = &__block_literal_global_283;
  }

  return v5;
}

uint64_t __81__HUServiceDetailsItemModule_serviceDetailsItemSectionComparatorForSortStrategy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"];

  v9 = [v6 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"];

  if (v8 || !v10)
  {
    if (!v8 || v10)
    {
      if (v8 | v10)
      {
        v12 = [(id)v8 componentsSeparatedByString:@"-"];
        v13 = [(id)v10 componentsSeparatedByString:@"-"];
        uint64_t v14 = [v12 count];
        if (v14 != [v13 count])
        {
          v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"HUServiceDetailsItemModule.m" lineNumber:47 description:@"Programmable Switch Strategy expects identically padded section sorting keys."];
        }
        if (![v12 count]) {
          goto LABEL_16;
        }
        id v24 = v6;
        id v25 = v5;
        unint64_t v15 = 1;
        do
        {
          v16 = [v12 objectAtIndexedSubscript:v15 - 1];
          v17 = [v13 objectAtIndexedSubscript:v15 - 1];
          v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
          v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "integerValue"));
          uint64_t v11 = [v18 compare:v19];

          if (v15 >= [v12 count]) {
            break;
          }
          ++v15;
        }
        while (!v11);
        id v6 = v24;
        id v5 = v25;
        if (!v11)
        {
LABEL_16:
          v20 = [v5 identifier];
          v21 = [v6 identifier];
          uint64_t v11 = [v20 compare:v21];
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = -1;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __81__HUServiceDetailsItemModule_serviceDetailsItemSectionComparatorForSortStrategy___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v4 headerTitle];
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v5 userInfo];
  v12 = [v11 objectForKeyedSubscript:@"HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v5 headerTitle];
  }
  unint64_t v15 = v14;

  uint64_t v16 = [v10 localizedStandardCompare:v15];
  if (!v16)
  {
    v17 = [v4 identifier];
    v18 = [v5 identifier];
    uint64_t v16 = [v17 compare:v18];
  }
  return v16;
}

- (HUServiceDetailsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUServiceDetailsItemModule.m", 83, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HUServiceDetailsItemModule.m", 84, @"Invalid parameter not satisfying: %@", @"sourceItem" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUServiceDetailsItemModule;
  v13 = [(HFItemModule *)&v18 initWithItemUpdater:v9];
  id v14 = v13;
  if (v13)
  {
    [(HUServiceDetailsItemModule *)v13 setHome:v10];
    [(HUServiceDetailsItemModule *)v14 setSourceItem:v12];
  }

  return v14;
}

- (id)itemProviders
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUServiceDetailsItemModule.m", 95, @"%s is an abstract method that must be overriden by subclass %@", "-[HUServiceDetailsItemModule itemProviders]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end