@interface HUNearbyAccessoriesEditorServiceGridViewController
+ (id)defaultItemProviderCreatorWithOptions:(unint64_t)a3 accessoryProfileItem:(id)a4;
- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4;
- (HMAccessory)primaryAccessory;
- (HUNearbyAccessoriesEditorServiceGridViewController)initWithAccessoryProfileSourceItem:(id)a3;
- (void)setPrimaryAccessory:(id)a3;
@end

@implementation HUNearbyAccessoriesEditorServiceGridViewController

- (HUNearbyAccessoriesEditorServiceGridViewController)initWithAccessoryProfileSourceItem:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() defaultItemProviderCreatorWithOptions:11 accessoryProfileItem:v4];
  v6 = [HUServiceGridItemManager alloc];
  v7 = (void *)[v4 copy];
  v8 = [(HUServiceGridItemManager *)v6 initWithDelegate:self sourceItem:v7 shouldGroupByRoom:1 shouldShowSectionHeaders:1 itemProvidersCreator:v5];

  v13.receiver = self;
  v13.super_class = (Class)HUNearbyAccessoriesEditorServiceGridViewController;
  v9 = [(HUSelectableServiceGridViewController *)&v13 initWithServiceGridItemManager:v8];
  if (v9)
  {
    uint64_t v10 = [v4 accessory];
    primaryAccessory = v9->_primaryAccessory;
    v9->_primaryAccessory = (HMAccessory *)v10;
  }
  return v9;
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    id v7 = v5;
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    objc_opt_class();
    uint64_t v10 = [v9 sourceHomeKitItem];
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    objc_opt_class();
    objc_super v13 = [v9 homeKitObject];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    objc_opt_class();
    id v16 = v7;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    if (v12)
    {
      v19 = [v12 accessory];
      uint64_t v20 = objc_msgSend(v19, "hf_primaryService");

      id v15 = v19;
    }
    else
    {
      if (!v18)
      {
LABEL_20:
        v21 = [(HUNearbyAccessoriesEditorServiceGridViewController *)self primaryAccessory];
        char v6 = objc_msgSend(v21, "hf_shouldHideNearbyAccessoryService:", v15);

        goto LABEL_21;
      }
      uint64_t v20 = [v18 service];
    }

    id v15 = (id)v20;
    goto LABEL_20;
  }
  char v6 = 1;
LABEL_21:

  return v6;
}

+ (id)defaultItemProviderCreatorWithOptions:(unint64_t)a3 accessoryProfileItem:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke;
  v9[3] = &unk_1E638FA80;
  id v10 = v5;
  unint64_t v11 = a3;
  id v6 = v5;
  id v7 = _Block_copy(v9);

  return v7;
}

id __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() transformationBlockWithOptions:*(void *)(a1 + 40)];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [*(id *)(a1 + 32) accessory];
  id v7 = +[HUNearbyAccessoriesItemManager itemProvidersForPrimaryAccessory:v6 inHome:v3];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke_2;
  v13[3] = &unk_1E638FA58;
  id v15 = v4;
  id v8 = v5;
  id v14 = v8;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:v13];
  id v10 = v14;
  id v11 = v8;

  return v11;
}

void __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F696B0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithSourceProvider:v4 transformationBlock:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) addObject:v5];
}

- (HMAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (void)setPrimaryAccessory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end