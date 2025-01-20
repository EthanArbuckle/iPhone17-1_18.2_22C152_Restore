@interface HUSiriLanguageOptionItemProvider
- (HFAccessorySettingSiriLanguageAdapter)adapter;
- (HFItem)sourceItem;
- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager;
- (HUSiriLanguageOptionItemProvider)initWithAdapter:(id)a3 optionStyle:(unint64_t)a4;
- (HUSiriLanguageOptionItemProvider)initWithSiriLanguageOptionsManager:(id)a3 sourceItem:(id)a4 optionStyle:(unint64_t)a5;
- (NSSet)items;
- (id)_createSiriLanguageOptionItems:(id)a3;
- (id)_reloadItemsWithAdapter;
- (id)_reloadItemsWithSiriLanguageOptionsManager;
- (id)reloadItems;
- (unint64_t)optionStyle;
- (void)setItems:(id)a3;
- (void)setSiriLanguageOptionsManager:(id)a3;
- (void)setSourceItem:(id)a3;
@end

@implementation HUSiriLanguageOptionItemProvider

- (HUSiriLanguageOptionItemProvider)initWithAdapter:(id)a3 optionStyle:(unint64_t)a4
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HUSiriLanguageOptionItemProvider;
  v8 = [(HFItemProvider *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adapter, a3);
    v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v11 = [v10 homeManager];
    int v12 = [v11 hasOptedToHH2];

    if (v12)
    {
      objc_opt_class();
      v13 = [v7 homeKitSettingsVendor];
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      id v15 = v14;

      objc_opt_class();
      v16 = [v7 homeKitSettingsVendor];
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      if (v15) {
        v19 = v15;
      }
      else {
        v19 = v18;
      }
      v20 = objc_msgSend(v19, "hf_siriLanguageOptionsManager");
      objc_storeStrong((id *)&v9->_siriLanguageOptionsManager, v20);
    }
    v9->_optionStyle = a4;
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] set];
    items = v9->_items;
    v9->_items = (NSSet *)v21;
  }
  return v9;
}

- (HUSiriLanguageOptionItemProvider)initWithSiriLanguageOptionsManager:(id)a3 sourceItem:(id)a4 optionStyle:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUSiriLanguageOptionItemProvider;
  v11 = [(HFItemProvider *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_siriLanguageOptionsManager, a3);
    objc_storeStrong((id *)&v12->_sourceItem, a4);
    v12->_optionStyle = a5;
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
    items = v12->_items;
    v12->_items = (NSSet *)v13;
  }
  return v12;
}

- (id)reloadItems
{
  v3 = [(HUSiriLanguageOptionItemProvider *)self siriLanguageOptionsManager];

  if (v3) {
    [(HUSiriLanguageOptionItemProvider *)self _reloadItemsWithSiriLanguageOptionsManager];
  }
  else {
  v4 = [(HUSiriLanguageOptionItemProvider *)self _reloadItemsWithAdapter];
  }

  return v4;
}

- (id)_reloadItemsWithAdapter
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HUSiriLanguageOptionItemProvider__reloadItemsWithAdapter__block_invoke;
  v6[3] = &unk_1E63858C8;
  v6[4] = self;
  v3 = __59__HUSiriLanguageOptionItemProvider__reloadItemsWithAdapter__block_invoke((uint64_t)v6);
  v4 = [(HUSiriLanguageOptionItemProvider *)self _createSiriLanguageOptionItems:v3];

  return v4;
}

id __59__HUSiriLanguageOptionItemProvider__reloadItemsWithAdapter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) optionStyle];
  switch(v2)
  {
    case 2:
      v3 = [*(id *)(a1 + 32) adapter];
      v4 = [*(id *)(a1 + 32) adapter];
      v5 = [v4 selectedLanguageOption];
      uint64_t v6 = [v3 preferredOutputVoiceOptionsForSelectedOption:v5];
      goto LABEL_7;
    case 1:
      v3 = [*(id *)(a1 + 32) adapter];
      v4 = [*(id *)(a1 + 32) adapter];
      v5 = [v4 selectedLanguageOption];
      uint64_t v6 = [v3 preferredOutputVoiceAccentOptionsForSelectedOption:v5];
      goto LABEL_7;
    case 0:
      v3 = [*(id *)(a1 + 32) adapter];
      v4 = [*(id *)(a1 + 32) adapter];
      v5 = [v4 selectedLanguageOption];
      uint64_t v6 = [v3 preferredRecognitionLanguageOptionsForSelectedOption:v5];
LABEL_7:
      id v7 = (void *)v6;

      goto LABEL_9;
  }
  id v7 = [MEMORY[0x1E4F1CAD0] set];
LABEL_9:

  return v7;
}

- (id)_reloadItemsWithSiriLanguageOptionsManager
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke;
  v7[3] = &unk_1E6385000;
  v7[4] = self;
  v3 = __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke((uint64_t)v7);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke_2;
  v6[3] = &unk_1E6389D90;
  v6[4] = self;
  v4 = [v3 flatMap:v6];

  return v4;
}

id __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) optionStyle];
  switch(v2)
  {
    case 2:
      v3 = [*(id *)(a1 + 32) siriLanguageOptionsManager];
      uint64_t v4 = [v3 preferredOutputVoiceOptionsForSelectedOption];
      goto LABEL_7;
    case 1:
      v3 = [*(id *)(a1 + 32) siriLanguageOptionsManager];
      uint64_t v4 = [v3 preferredOutputVoiceAccentOptionsForSelectedOption];
      goto LABEL_7;
    case 0:
      v3 = [*(id *)(a1 + 32) siriLanguageOptionsManager];
      uint64_t v4 = [v3 preferredRecognitionLanguageOptionsForSelectedOption];
LABEL_7:
      v5 = (void *)v4;

      goto LABEL_9;
  }
  v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_9:

  return v5;
}

uint64_t __78__HUSiriLanguageOptionItemProvider__reloadItemsWithSiriLanguageOptionsManager__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createSiriLanguageOptionItems:a2];
}

- (id)_createSiriLanguageOptionItems:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke;
  aBlock[3] = &unk_1E638DBF8;
  aBlock[4] = self;
  id v4 = a3;
  v5 = _Block_copy(aBlock);
  uint64_t v6 = [v4 allObjects];
  id v7 = objc_msgSend(v6, "na_dictionaryWithKeyGenerator:", v5);

  v8 = [v4 allObjects];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_2;
  v20[3] = &unk_1E638DC20;
  id v9 = v5;
  id v21 = v9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_3;
  v19[3] = &unk_1E638DC48;
  v19[4] = self;
  id v10 = [(HFItemProvider *)self reloadItemsWithObjects:v8 keyAdaptor:v9 itemAdaptor:v20 filter:0 itemMap:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_4;
  v15[3] = &unk_1E638DC98;
  v17 = self;
  id v18 = v9;
  id v16 = v7;
  id v11 = v9;
  id v12 = v7;
  uint64_t v13 = [v10 addSuccessBlock:v15];

  return v13;
}

id __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = +[HUSiriLanguageOptionItem selectionKeyForLanguageOption:withOptionStyle:](HUSiriLanguageOptionItem, "selectionKeyForLanguageOption:withOptionStyle:", v3, [v2 optionStyle]);

  return v4;
}

id __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 languageOption];
  id v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

id __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 siriLanguageOptionsManager];

  uint64_t v6 = [HUSiriLanguageOptionItem alloc];
  uint64_t v7 = [*(id *)(a1 + 32) optionStyle];
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    id v9 = [v8 siriLanguageOptionsManager];
    uint64_t v10 = [(HUSiriLanguageOptionItem *)v6 initWithStyle:v7 siriLanguageOptionsManager:v9 languageOption:v4];
  }
  else
  {
    id v9 = [v8 adapter];
    uint64_t v10 = [(HUSiriLanguageOptionItem *)v6 initWithStyle:v7 adapter:v9 languageOption:v4];
  }
  id v11 = (void *)v10;

  return v11;
}

void __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 existingItems];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_5;
  id v9 = &unk_1E638DC70;
  id v10 = a1[4];
  id v11 = a1[6];
  objc_msgSend(v4, "na_each:", &v6);

  v5 = objc_msgSend(v3, "allItems", v6, v7, v8, v9);

  [a1[5] setItems:v5];
}

void __67__HUSiriLanguageOptionItemProvider__createSiriLanguageOptionItems___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v7 = [v4 languageOption];
  v5 = (*(void (**)(uint64_t, id))(v3 + 16))(v3, v7);
  uint64_t v6 = [v2 objectForKeyedSubscript:v5];
  [v4 setLanguageOption:v6];
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (unint64_t)optionStyle
{
  return self->_optionStyle;
}

- (HFAccessorySettingSiriLanguageAdapter)adapter
{
  return self->_adapter;
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  return self->_siriLanguageOptionsManager;
}

- (void)setSiriLanguageOptionsManager:(id)a3
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
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, 0);
  objc_storeStrong((id *)&self->_adapter, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end