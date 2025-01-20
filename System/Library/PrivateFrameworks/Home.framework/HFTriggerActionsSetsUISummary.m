@interface HFTriggerActionsSetsUISummary
- (BOOL)hasUniqueServiceGroup;
- (BOOL)needsIconSort;
- (HFTriggerActionsSetsUISummary)init;
- (HFTriggerActionsSetsUISummary)initWithSummaryText:(id)a3 summaryIconDescriptors:(id)a4;
- (HFTriggerActionsSetsUISummary)initWithSummaryText:(id)a3 summaryIconNames:(id)a4;
- (NSArray)summaryDescriptors;
- (NSMutableArray)iconDescriptors;
- (NSMutableArray)icons;
- (NSMutableDictionary)iconCounter;
- (NSString)firstSceneName;
- (NSString)firstServiceName;
- (NSString)mediaAccessoryName;
- (NSString)summaryDescription;
- (NSString)uniqueServiceGroupName;
- (id)_descriptionForZeroAccessories;
- (id)_descriptionForZeroScenes;
- (id)summaryIconDescriptors;
- (id)summaryIcons;
- (id)summaryText;
- (id)summaryText:(BOOL)a3;
- (unint64_t)numberOfIcons;
- (unint64_t)numberOfMediaAccessories;
- (unint64_t)numberOfScenes;
- (unint64_t)numberOfStandaloneServices;
- (unint64_t)totalStandaloneAndMediaAccessoriesCount;
- (void)_incrementIconCounter:(id)a3;
- (void)_sortIconDescriptors;
- (void)addIconDescriptor:(id)a3;
- (void)addMatterRepresentableNamed:(id)a3;
- (void)addMediaAccessoryNamed:(id)a3;
- (void)addSceneNamed:(id)a3;
- (void)addServiceNamed:(id)a3;
- (void)setFirstSceneName:(id)a3;
- (void)setFirstServiceName:(id)a3;
- (void)setIconCounter:(id)a3;
- (void)setIconDescriptors:(id)a3;
- (void)setIcons:(id)a3;
- (void)setMediaAccessoryName:(id)a3;
- (void)setNeedsIconSort:(BOOL)a3;
- (void)setNumberOfMediaAccessories:(unint64_t)a3;
- (void)setNumberOfScenes:(unint64_t)a3;
- (void)setNumberOfStandaloneServices:(unint64_t)a3;
- (void)setTotalStandaloneAndMediaAccessoriesCount:(unint64_t)a3;
- (void)setUniqueServiceGroupName:(id)a3;
@end

@implementation HFTriggerActionsSetsUISummary

- (HFTriggerActionsSetsUISummary)initWithSummaryText:(id)a3 summaryIconDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFTriggerActionsSetsUISummary *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    summaryDescription = v8->_summaryDescription;
    v8->_summaryDescription = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
    summaryDescriptors = v8->_summaryDescriptors;
    v8->_summaryDescriptors = (NSArray *)v11;

    v8->_needsIconSort = 0;
  }

  return v8;
}

- (HFTriggerActionsSetsUISummary)initWithSummaryText:(id)a3 summaryIconNames:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFTriggerActionsSetsUISummary *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    summaryDescription = v8->_summaryDescription;
    v8->_summaryDescription = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
          v18 = [HFImageIconDescriptor alloc];
          v19 = -[HFImageIconDescriptor initWithImageIdentifier:](v18, "initWithImageIdentifier:", v17, (void)v23);
          [v11 addObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
    summaryDescriptors = v8->_summaryDescriptors;
    v8->_summaryDescriptors = (NSArray *)v20;

    v8->_needsIconSort = 0;
  }

  return v8;
}

- (HFTriggerActionsSetsUISummary)init
{
  v14.receiver = self;
  v14.super_class = (Class)HFTriggerActionsSetsUISummary;
  v2 = [(HFTriggerActionsSetsUISummary *)&v14 init];
  v3 = v2;
  if (v2)
  {
    firstSceneName = v2->_firstSceneName;
    v2->_firstSceneName = (NSString *)&stru_26C081158;

    firstServiceName = v3->_firstServiceName;
    v3->_firstServiceName = (NSString *)&stru_26C081158;

    mediaAccessoryName = v3->_mediaAccessoryName;
    v3->_mediaAccessoryName = (NSString *)&stru_26C081158;

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    icons = v3->_icons;
    v3->_icons = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    iconDescriptors = v3->_iconDescriptors;
    v3->_iconDescriptors = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    iconCounter = v3->_iconCounter;
    v3->_iconCounter = (NSMutableDictionary *)v11;

    v3->_needsIconSort = 0;
  }
  return v3;
}

- (BOOL)hasUniqueServiceGroup
{
  v2 = [(HFTriggerActionsSetsUISummary *)self uniqueServiceGroupName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)totalStandaloneAndMediaAccessoriesCount
{
  unint64_t v3 = [(HFTriggerActionsSetsUISummary *)self numberOfStandaloneServices];
  return [(HFTriggerActionsSetsUISummary *)self numberOfMediaAccessories] + v3;
}

- (id)summaryText
{
  return [(HFTriggerActionsSetsUISummary *)self summaryText:1];
}

- (id)summaryText:(BOOL)a3
{
  if (a3)
  {
    v4 = [(HFTriggerActionsSetsUISummary *)self summaryDescription];

    if (v4)
    {
      v5 = [(HFTriggerActionsSetsUISummary *)self summaryDescription];
      id v6 = (void *)[v5 copy];

      goto LABEL_7;
    }
    if ([(HFTriggerActionsSetsUISummary *)self numberOfScenes]
      || [(HFTriggerActionsSetsUISummary *)self totalStandaloneAndMediaAccessoriesCount])
    {
      if ([(HFTriggerActionsSetsUISummary *)self totalStandaloneAndMediaAccessoriesCount])
      {
        if ([(HFTriggerActionsSetsUISummary *)self numberOfScenes])
        {
          uint64_t v10 = [(HFTriggerActionsSetsUISummary *)self totalStandaloneAndMediaAccessoriesCount];
          [(HFTriggerActionsSetsUISummary *)self numberOfScenes];
          HFLocalizedStringWithFormat(@"HFTriggerDescriptionManyScenesManyServices", @"%lu%lu", v11, v12, v13, v14, v15, v16, v10);
        }
        else
        {
          [(HFTriggerActionsSetsUISummary *)self _descriptionForZeroScenes];
        uint64_t v8 = };
      }
      else
      {
        uint64_t v8 = [(HFTriggerActionsSetsUISummary *)self _descriptionForZeroAccessories];
      }
      goto LABEL_6;
    }
    uint64_t v7 = @"HFTriggerDescriptionNoActions";
  }
  else
  {
    uint64_t v7 = @"HFTriggerDescriptionDisabled";
  }
  uint64_t v8 = _HFLocalizedStringWithDefaultValue(v7, v7, 1);
LABEL_6:
  id v6 = (void *)v8;
LABEL_7:
  return v6;
}

- (id)_descriptionForZeroAccessories
{
  if ([(HFTriggerActionsSetsUISummary *)self numberOfScenes] == 1)
  {
    [(HFTriggerActionsSetsUISummary *)self firstSceneName];
  }
  else
  {
    uint64_t v4 = [(HFTriggerActionsSetsUISummary *)self numberOfScenes];
    HFLocalizedStringWithFormat(@"HFTriggerDescriptionManyScenesZeroServices", @"%lu", v5, v6, v7, v8, v9, v10, v4);
  unint64_t v3 = };
  return v3;
}

- (id)_descriptionForZeroScenes
{
  if ([(HFTriggerActionsSetsUISummary *)self numberOfStandaloneServices] == 1
    && ![(HFTriggerActionsSetsUISummary *)self numberOfMediaAccessories])
  {
    unint64_t v3 = [(HFTriggerActionsSetsUISummary *)self firstServiceName];
  }
  else if ([(HFTriggerActionsSetsUISummary *)self numberOfStandaloneServices] {
         || [(HFTriggerActionsSetsUISummary *)self numberOfMediaAccessories] != 1)
  }
  {
    if ([(HFTriggerActionsSetsUISummary *)self hasUniqueServiceGroup]
      && ![(HFTriggerActionsSetsUISummary *)self numberOfMediaAccessories])
    {
      unint64_t v3 = [(HFTriggerActionsSetsUISummary *)self uniqueServiceGroupName];
    }
    else
    {
      uint64_t v4 = [(HFTriggerActionsSetsUISummary *)self totalStandaloneAndMediaAccessoriesCount];
      unint64_t v3 = HFLocalizedStringWithFormat(@"HFTriggerDescriptionZeroScenesManyServices", @"%lu", v5, v6, v7, v8, v9, v10, v4);
    }
  }
  else
  {
    unint64_t v3 = [(HFTriggerActionsSetsUISummary *)self mediaAccessoryName];
  }
  return v3;
}

- (id)summaryIcons
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(HFTriggerActionsSetsUISummary *)self summaryIconDescriptors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) identifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)summaryIconDescriptors
{
  unint64_t v3 = [(HFTriggerActionsSetsUISummary *)self summaryDescriptors];

  if (v3)
  {
    uint64_t v4 = [(HFTriggerActionsSetsUISummary *)self summaryDescriptors];
  }
  else
  {
    if ([(HFTriggerActionsSetsUISummary *)self needsIconSort]) {
      [(HFTriggerActionsSetsUISummary *)self _sortIconDescriptors];
    }
    uint64_t v4 = [(HFTriggerActionsSetsUISummary *)self iconDescriptors];
  }
  uint64_t v5 = v4;
  uint64_t v6 = (void *)[v4 copy];

  return v6;
}

- (unint64_t)numberOfIcons
{
  v2 = [(HFTriggerActionsSetsUISummary *)self iconDescriptors];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)addSceneNamed:(id)a3
{
  id v5 = a3;
  if (![(HFTriggerActionsSetsUISummary *)self numberOfScenes])
  {
    uint64_t v4 = (void *)[v5 copy];
    [(HFTriggerActionsSetsUISummary *)self setFirstSceneName:v4];
  }
  [(HFTriggerActionsSetsUISummary *)self setNumberOfScenes:[(HFTriggerActionsSetsUISummary *)self numberOfScenes] + 1];
}

- (void)addServiceNamed:(id)a3
{
  id v5 = a3;
  if (![(HFTriggerActionsSetsUISummary *)self numberOfStandaloneServices])
  {
    uint64_t v4 = (void *)[v5 copy];
    [(HFTriggerActionsSetsUISummary *)self setFirstServiceName:v4];
  }
  [(HFTriggerActionsSetsUISummary *)self setNumberOfStandaloneServices:[(HFTriggerActionsSetsUISummary *)self numberOfStandaloneServices] + 1];
}

- (void)addMatterRepresentableNamed:(id)a3
{
  id v5 = a3;
  if (![(HFTriggerActionsSetsUISummary *)self numberOfStandaloneServices])
  {
    uint64_t v4 = (void *)[v5 copy];
    [(HFTriggerActionsSetsUISummary *)self setFirstServiceName:v4];
  }
  [(HFTriggerActionsSetsUISummary *)self setNumberOfStandaloneServices:[(HFTriggerActionsSetsUISummary *)self numberOfStandaloneServices] + 1];
}

- (void)addIconDescriptor:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(HFTriggerActionsSetsUISummary *)self iconDescriptors];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(HFTriggerActionsSetsUISummary *)self iconDescriptors];
    [v6 addObject:v7];
  }
  [(HFTriggerActionsSetsUISummary *)self _incrementIconCounter:v7];
  [(HFTriggerActionsSetsUISummary *)self setNeedsIconSort:1];
}

- (void)_incrementIconCounter:(id)a3
{
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "hash"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(HFTriggerActionsSetsUISummary *)self iconCounter];
  char v5 = [v4 objectForKeyedSubscript:v9];

  if (v5) {
    uint64_t v6 = [v5 integerValue] + 1;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = [NSNumber numberWithInteger:v6];
  uint64_t v8 = [(HFTriggerActionsSetsUISummary *)self iconCounter];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (void)_sortIconDescriptors
{
  if ([(HFTriggerActionsSetsUISummary *)self needsIconSort])
  {
    unint64_t v3 = [(HFTriggerActionsSetsUISummary *)self iconDescriptors];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__HFTriggerActionsSetsUISummary__sortIconDescriptors__block_invoke;
    v4[3] = &unk_264099FF8;
    v4[4] = self;
    [v3 sortUsingComparator:v4];

    [(HFTriggerActionsSetsUISummary *)self setNeedsIconSort:0];
  }
}

uint64_t __53__HFTriggerActionsSetsUISummary__sortIconDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = NSNumber;
  id v6 = a3;
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a2, "hash"));
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v6 hash];

  uint64_t v10 = [v8 numberWithInteger:v9];
  long long v11 = [*(id *)(a1 + 32) iconCounter];
  long long v12 = [v11 objectForKeyedSubscript:v7];

  long long v13 = [*(id *)(a1 + 32) iconCounter];
  long long v14 = [v13 objectForKeyedSubscript:v10];

  if (!v12
    || !v14
    || ((uint64_t v15 = [v12 integerValue], v16 = objc_msgSend(v14, "integerValue"), v15 > v16)
      ? (uint64_t v17 = -1)
      : (uint64_t v17 = 1),
        v16 == v15))
  {
    uint64_t v17 = [v7 compare:v10];
  }

  return v17;
}

- (void)addMediaAccessoryNamed:(id)a3
{
  id v5 = a3;
  if (![(HFTriggerActionsSetsUISummary *)self numberOfMediaAccessories])
  {
    uint64_t v4 = (void *)[v5 copy];
    [(HFTriggerActionsSetsUISummary *)self setMediaAccessoryName:v4];
  }
  [(HFTriggerActionsSetsUISummary *)self setNumberOfMediaAccessories:[(HFTriggerActionsSetsUISummary *)self numberOfMediaAccessories] + 1];
}

- (NSString)uniqueServiceGroupName
{
  return self->_uniqueServiceGroupName;
}

- (void)setUniqueServiceGroupName:(id)a3
{
}

- (unint64_t)numberOfScenes
{
  return self->_numberOfScenes;
}

- (void)setNumberOfScenes:(unint64_t)a3
{
  self->_numberOfScenes = a3;
}

- (unint64_t)numberOfStandaloneServices
{
  return self->_numberOfStandaloneServices;
}

- (void)setNumberOfStandaloneServices:(unint64_t)a3
{
  self->_numberOfStandaloneServices = a3;
}

- (unint64_t)numberOfMediaAccessories
{
  return self->_numberOfMediaAccessories;
}

- (void)setNumberOfMediaAccessories:(unint64_t)a3
{
  self->_numberOfMediaAccessories = a3;
}

- (void)setTotalStandaloneAndMediaAccessoriesCount:(unint64_t)a3
{
  self->_totalStandaloneAndMediaAccessoriesCount = a3;
}

- (NSString)firstSceneName
{
  return self->_firstSceneName;
}

- (void)setFirstSceneName:(id)a3
{
}

- (NSString)firstServiceName
{
  return self->_firstServiceName;
}

- (void)setFirstServiceName:(id)a3
{
}

- (NSString)mediaAccessoryName
{
  return self->_mediaAccessoryName;
}

- (void)setMediaAccessoryName:(id)a3
{
}

- (NSMutableArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (NSMutableArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (void)setIconDescriptors:(id)a3
{
}

- (NSMutableDictionary)iconCounter
{
  return self->_iconCounter;
}

- (void)setIconCounter:(id)a3
{
}

- (NSString)summaryDescription
{
  return self->_summaryDescription;
}

- (NSArray)summaryDescriptors
{
  return self->_summaryDescriptors;
}

- (BOOL)needsIconSort
{
  return self->_needsIconSort;
}

- (void)setNeedsIconSort:(BOOL)a3
{
  self->_needsIconSort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryDescriptors, 0);
  objc_storeStrong((id *)&self->_summaryDescription, 0);
  objc_storeStrong((id *)&self->_iconCounter, 0);
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryName, 0);
  objc_storeStrong((id *)&self->_firstServiceName, 0);
  objc_storeStrong((id *)&self->_firstSceneName, 0);
  objc_storeStrong((id *)&self->_uniqueServiceGroupName, 0);
}

@end