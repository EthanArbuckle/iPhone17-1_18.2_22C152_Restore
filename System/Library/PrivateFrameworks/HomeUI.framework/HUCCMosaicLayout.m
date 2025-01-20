@interface HUCCMosaicLayout
+ (id)allLandscapeLayouts;
+ (id)allPortraitLayouts;
+ (id)sortDescriptors;
+ (unint64_t)maxItemsNeededForLandscape;
+ (unint64_t)maxItemsNeededForPortrait;
- (BOOL)isComplete;
- (HUCCMosaicLayout)initWithLayoutType:(unint64_t)a3;
- (HUCCMosaicOrderable)homeItem;
- (NSArray)arrangedItems;
- (NSMutableArray)accessories;
- (NSMutableArray)fillers;
- (NSMutableArray)scenes;
- (NSString)layoutDescription;
- (id)description;
- (unint64_t)accessoriesNeeded;
- (unint64_t)layoutType;
- (unint64_t)numberOfFilledItems;
- (unint64_t)numberOfMisses;
- (unint64_t)priority;
- (unint64_t)scenesNeeded;
- (void)_addAccessoryItem:(id)a3;
- (void)_addFillerItem:(id)a3;
- (void)_addSceneItem:(id)a3;
- (void)_registerPossibleMiss;
- (void)_sizeAllItems;
- (void)addItem:(id)a3;
- (void)setAccessories:(id)a3;
- (void)setAccessoriesNeeded:(unint64_t)a3;
- (void)setFillers:(id)a3;
- (void)setHomeItem:(id)a3;
- (void)setLayoutDescription:(id)a3;
- (void)setNumberOfMisses:(unint64_t)a3;
- (void)setScenes:(id)a3;
- (void)setScenesNeeded:(unint64_t)a3;
@end

@implementation HUCCMosaicLayout

- (HUCCMosaicLayout)initWithLayoutType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUCCMosaicLayout;
  v4 = [(HUCCMosaicLayout *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_layoutType = a3;
    switch(a3)
    {
      case 1uLL:
        v4->_scenesNeeded = 0;
        v4->_accessoriesNeeded = 0;
        v4->_priority = 1;
        goto LABEL_5;
      case 2uLL:
        v4->_accessoriesNeeded = 4;
        *(_OWORD *)&v4->_priority = xmmword_1BEA198E0;
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutPortraitOneSceneFourAccessories";
        break;
      case 3uLL:
        v4->_accessoriesNeeded = 2;
        *(int64x2_t *)&v4->_priority = vdupq_n_s64(2uLL);
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutPortraitTwoScenesTwoAccessories";
        break;
      case 4uLL:
        v4->_accessoriesNeeded = 6;
        *(_OWORD *)&v4->_priority = xmmword_1BEA155B0;
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutPortraitSixAccessories";
        break;
      case 5uLL:
        v4->_accessoriesNeeded = 0;
        *(_OWORD *)&v4->_priority = xmmword_1BEA198F0;
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutPortraitThreeScenes";
        break;
      case 6uLL:
        v4->_scenesNeeded = 0;
        v4->_accessoriesNeeded = 0;
        v4->_priority = 1;
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutLandscapeHomeOnly";
        break;
      case 7uLL:
        v4->_accessoriesNeeded = 0;
        *(int64x2_t *)&v4->_priority = vdupq_n_s64(2uLL);
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutLandscapeTwoScenes";
        break;
      case 8uLL:
        v4->_accessoriesNeeded = 4;
        *(_OWORD *)&v4->_priority = xmmword_1BEA155B0;
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutLandscapeFourAccessories";
        break;
      case 9uLL:
        v4->_accessoriesNeeded = 2;
        *(_OWORD *)&v4->_priority = xmmword_1BEA198E0;
        layoutDescription = v4->_layoutDescription;
        v7 = @"HUCCLayoutLandscapeOneSceneTwoAccessories";
        break;
      default:
        NSLog(&cfstr_UnknownGridLay.isa, a3);
        v5->_scenesNeeded = 0;
        v5->_accessoriesNeeded = 0;
        *(int64x2_t *)&v5->_layoutType = vdupq_n_s64(1uLL);
LABEL_5:
        layoutDescription = v5->_layoutDescription;
        v7 = @"HUCCLayoutPortraitHomeOnly";
        break;
    }
    v5->_layoutDescription = &v7->isa;

    v5->_numberOfFilledItems = v5->_accessoriesNeeded + v5->_scenesNeeded;
    v5->_numberOfMisses = 0;
  }
  return v5;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HUCCMosaicLayout *)self layoutDescription];
  v4 = [v2 stringWithFormat:@"HUCCMosaicLayout - %@", v3];

  return v4;
}

- (NSMutableArray)scenes
{
  scenes = self->_scenes;
  if (!scenes)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = self->_scenes;
    self->_scenes = v4;

    scenes = self->_scenes;
  }

  return scenes;
}

- (NSMutableArray)accessories
{
  accessories = self->_accessories;
  if (!accessories)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = self->_accessories;
    self->_accessories = v4;

    accessories = self->_accessories;
  }

  return accessories;
}

- (NSMutableArray)fillers
{
  fillers = self->_fillers;
  if (!fillers)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = self->_fillers;
    self->_fillers = v4;

    fillers = self->_fillers;
  }

  return fillers;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  switch([v4 itemType])
  {
    case 0:
      [(HUCCMosaicLayout *)self setHomeItem:v4];
      break;
    case 1:
      [(HUCCMosaicLayout *)self _addSceneItem:v4];
      break;
    case 2:
      [(HUCCMosaicLayout *)self _addAccessoryItem:v4];
      break;
    case 3:
      [(HUCCMosaicLayout *)self _addFillerItem:v4];
      break;
    default:
      break;
  }
}

- (void)_addSceneItem:(id)a3
{
  id v5 = a3;
  if ([(HUCCMosaicLayout *)self scenesNeeded])
  {
    id v4 = [(HUCCMosaicLayout *)self scenes];
    [v4 addObject:v5];

    [(HUCCMosaicLayout *)self setScenesNeeded:[(HUCCMosaicLayout *)self scenesNeeded] - 1];
  }
  else
  {
    [(HUCCMosaicLayout *)self _registerPossibleMiss];
  }
}

- (void)_addAccessoryItem:(id)a3
{
  id v5 = a3;
  if ([(HUCCMosaicLayout *)self accessoriesNeeded])
  {
    id v4 = [(HUCCMosaicLayout *)self accessories];
    [v4 addObject:v5];

    [(HUCCMosaicLayout *)self setAccessoriesNeeded:[(HUCCMosaicLayout *)self accessoriesNeeded] - 1];
  }
  else
  {
    [(HUCCMosaicLayout *)self _registerPossibleMiss];
  }
}

- (void)_addFillerItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCCMosaicLayout *)self fillers];
  [v5 addObject:v4];

  unint64_t v6 = [(HUCCMosaicLayout *)self accessoriesNeeded] - 1;

  [(HUCCMosaicLayout *)self setAccessoriesNeeded:v6];
}

- (void)_registerPossibleMiss
{
  if (![(HUCCMosaicLayout *)self isComplete])
  {
    unint64_t v3 = [(HUCCMosaicLayout *)self numberOfMisses] + 1;
    [(HUCCMosaicLayout *)self setNumberOfMisses:v3];
  }
}

- (BOOL)isComplete
{
  unint64_t v3 = [(HUCCMosaicLayout *)self homeItem];
  BOOL v4 = v3
    && ![(HUCCMosaicLayout *)self scenesNeeded]
    && [(HUCCMosaicLayout *)self accessoriesNeeded] == 0;

  return v4;
}

- (void)_sizeAllItems
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUCCMosaicLayout *)self layoutType];
  if (v3 == 6)
  {
    BOOL v4 = [(HUCCMosaicLayout *)self homeItem];
    id v5 = v4;
    uint64_t v6 = 4;
  }
  else if (v3 == 1)
  {
    BOOL v4 = [(HUCCMosaicLayout *)self homeItem];
    id v5 = v4;
    uint64_t v6 = 3;
  }
  else
  {
    BOOL v4 = [(HUCCMosaicLayout *)self homeItem];
    id v5 = v4;
    uint64_t v6 = 2;
  }
  [v4 setItemSize:v6];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = [(HUCCMosaicLayout *)self scenes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v11++) setItemSize:2];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  v12 = [(HUCCMosaicLayout *)self accessories];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      v15 = [(HUCCMosaicLayout *)self accessories];
      v16 = [v15 objectAtIndexedSubscript:v14];

      [v16 setItemSize:1];
      ++v14;
      v17 = [(HUCCMosaicLayout *)self accessories];
      unint64_t v18 = [v17 count];
    }
    while (v14 < v18);
  }
  v19 = [(HUCCMosaicLayout *)self fillers];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    unint64_t v21 = 0;
    do
    {
      v22 = [(HUCCMosaicLayout *)self fillers];
      v23 = [v22 objectAtIndexedSubscript:v21];

      [v23 setItemSize:1];
      ++v21;
      v24 = [(HUCCMosaicLayout *)self fillers];
      unint64_t v25 = [v24 count];
    }
    while (v21 < v25);
  }
}

- (NSArray)arrangedItems
{
  [(HUCCMosaicLayout *)self _sizeAllItems];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(HUCCMosaicLayout *)self homeItem];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  id v5 = [(HUCCMosaicLayout *)self scenes];
  objc_msgSend(v3, "na_safeAddObjectsFromArray:", v5);

  uint64_t v6 = [(HUCCMosaicLayout *)self accessories];
  objc_msgSend(v3, "na_safeAddObjectsFromArray:", v6);

  v7 = [(HUCCMosaicLayout *)self fillers];
  objc_msgSend(v3, "na_safeAddObjectsFromArray:", v7);

  return (NSArray *)v3;
}

+ (id)sortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:0 ascending:0 comparator:&__block_literal_global_5];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:0 ascending:0 comparator:&__block_literal_global_35];
  v6[0] = v2;
  v6[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

uint64_t __35__HUCCMosaicLayout_sortDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 numberOfFilledItems];
  if (v6 >= [v5 numberOfFilledItems])
  {
    unint64_t v8 = [v4 numberOfFilledItems];
    uint64_t v7 = v8 > [v5 numberOfFilledItems];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __35__HUCCMosaicLayout_sortDescriptors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 numberOfMisses];
  if (v6 >= [v5 numberOfMisses])
  {
    unint64_t v8 = [v4 numberOfMisses];
    if (v8 <= [v5 numberOfMisses]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

+ (id)allPortraitLayouts
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v3 = [[HUCCMosaicLayout alloc] initWithLayoutType:4];
  [v2 addObject:v3];

  id v4 = [[HUCCMosaicLayout alloc] initWithLayoutType:2];
  [v2 addObject:v4];

  id v5 = [[HUCCMosaicLayout alloc] initWithLayoutType:3];
  [v2 addObject:v5];

  unint64_t v6 = [[HUCCMosaicLayout alloc] initWithLayoutType:5];
  [v2 addObject:v6];

  uint64_t v7 = [[HUCCMosaicLayout alloc] initWithLayoutType:1];
  [v2 addObject:v7];

  return v2;
}

+ (unint64_t)maxItemsNeededForPortrait
{
  return 7;
}

+ (id)allLandscapeLayouts
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v3 = [[HUCCMosaicLayout alloc] initWithLayoutType:7];
  [v2 addObject:v3];

  id v4 = [[HUCCMosaicLayout alloc] initWithLayoutType:8];
  [v2 addObject:v4];

  id v5 = [[HUCCMosaicLayout alloc] initWithLayoutType:9];
  [v2 addObject:v5];

  unint64_t v6 = [[HUCCMosaicLayout alloc] initWithLayoutType:6];
  [v2 addObject:v6];

  return v2;
}

+ (unint64_t)maxItemsNeededForLandscape
{
  return 5;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unint64_t)scenesNeeded
{
  return self->_scenesNeeded;
}

- (void)setScenesNeeded:(unint64_t)a3
{
  self->_scenesNeeded = a3;
}

- (unint64_t)accessoriesNeeded
{
  return self->_accessoriesNeeded;
}

- (void)setAccessoriesNeeded:(unint64_t)a3
{
  self->_accessoriesNeeded = a3;
}

- (unint64_t)numberOfFilledItems
{
  return self->_numberOfFilledItems;
}

- (unint64_t)numberOfMisses
{
  return self->_numberOfMisses;
}

- (void)setNumberOfMisses:(unint64_t)a3
{
  self->_numberOfMisses = a3;
}

- (HUCCMosaicOrderable)homeItem
{
  return self->_homeItem;
}

- (void)setHomeItem:(id)a3
{
}

- (void)setScenes:(id)a3
{
}

- (void)setAccessories:(id)a3
{
}

- (void)setFillers:(id)a3
{
}

- (NSString)layoutDescription
{
  return self->_layoutDescription;
}

- (void)setLayoutDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDescription, 0);
  objc_storeStrong((id *)&self->_fillers, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_scenes, 0);

  objc_storeStrong((id *)&self->_homeItem, 0);
}

@end