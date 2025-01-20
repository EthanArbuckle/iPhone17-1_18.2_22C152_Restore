@interface HUCCSmartGridItemManager
- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome;
- (BOOL)layoutWasChanged;
- (BOOL)numberOfPlaceholdersWasChanged;
- (HFPredictionsItemProvider)predictionsItemProvider;
- (HFPredictionsManager)predictionsManager;
- (HUCCMosaicLayoutDelegate)mosaicLayoutDelegate;
- (HUCCSmartGridItemManager)initWithMosaicLayoutDelegate:(id)a3;
- (NSMutableDictionary)mosaicLayoutDetails;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildItemProvidersWithoutHome;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_mosaicKeyForItem:(id)a3;
- (id)mosaicDetailsForDisplayedItemAtIndexPath:(id)a3;
- (id)mosaicDetailsForItem:(id)a3;
- (unint64_t)chosenLayoutType;
- (unint64_t)numberOfPlaceholderItems;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)loadDefaultProviderItem;
- (void)setChosenLayoutType:(unint64_t)a3;
- (void)setLayoutWasChanged:(BOOL)a3;
- (void)setMosaicLayoutDelegate:(id)a3;
- (void)setMosaicLayoutDetails:(id)a3;
- (void)setNumberOfPlaceholderItems:(unint64_t)a3;
- (void)setNumberOfPlaceholdersWasChanged:(BOOL)a3;
- (void)setPredictionsItemProvider:(id)a3;
- (void)setPredictionsManager:(id)a3;
@end

@implementation HUCCSmartGridItemManager

- (HUCCSmartGridItemManager)initWithMosaicLayoutDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCCSmartGridItemManager;
  v5 = [(HFItemManager *)&v8 initWithDelegate:0 sourceItem:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mosaicLayoutDelegate, v4);
    v6->_chosenLayoutType = 0;
    v6->_layoutWasChanged = 0;
  }

  return v6;
}

- (void)loadDefaultProviderItem
{
  objc_msgSend_resetItemProvidersAndModules(self, a2, v2);

  MEMORY[0x270F9A6D0](self, sel_sortDisplayedItemsInSection_, 0);
}

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 1;
}

- (id)_itemsToHideInSet:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9C0];
  v10.receiver = self;
  v10.super_class = (Class)HUCCSmartGridItemManager;
  id v4 = [(HFItemManager *)&v10 _itemsToHideInSet:a3];
  v6 = objc_msgSend_setWithSet_(v3, v5, (uint64_t)v4);

  objc_super v8 = objc_msgSend_na_filter_(v6, v7, (uint64_t)&unk_26F4C7FC0);

  return v8;
}

- (id)_buildItemProvidersWithoutHome
{
  v3 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2);
  id v4 = objc_alloc(MEMORY[0x263F47B58]);
  v6 = objc_msgSend_initWithHome_(v4, v5, 0);
  id v7 = objc_alloc(MEMORY[0x263F47C28]);
  v9 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], v8, (uint64_t)v6, 0);
  v11 = objc_msgSend_initWithItems_(v7, v10, (uint64_t)v9);

  id v14 = (id)objc_msgSend_reloadItems(v11, v12, v13);
  objc_msgSend_addObject_(v3, v15, (uint64_t)v11);

  return v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
  if (objc_msgSend_hf_shouldBlockCurrentUserFromHome(v4, v8, v9))
  {
    id v12 = objc_alloc(MEMORY[0x263F47B58]);
    id v14 = objc_msgSend_initWithHome_(v12, v13, (uint64_t)v4);
    id v15 = objc_alloc(MEMORY[0x263F47C28]);
    v17 = objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], v16, (uint64_t)v14, 0);
    v19 = objc_msgSend_initWithItems_(v15, v18, (uint64_t)v17);

    id v22 = (id)objc_msgSend_reloadItems(v19, v20, v21);
    objc_msgSend_addObject_(v7, v23, (uint64_t)v19);
  }
  else
  {
    uint64_t v24 = objc_msgSend_predictionsManager(self, v10, v11);
    if (!v24) {
      goto LABEL_5;
    }
    v27 = (void *)v24;
    v28 = objc_msgSend_predictionsManager(self, v25, v26);
    v31 = objc_msgSend_home(v28, v29, v30);
    char isEqual = objc_msgSend_isEqual_(v31, v32, (uint64_t)v4);

    if ((isEqual & 1) == 0)
    {
LABEL_5:
      v34 = HFLogForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v4;
        _os_log_impl(&dword_24065C000, v34, OS_LOG_TYPE_DEFAULT, "Creating predictionsManager for home: %@", buf, 0xCu);
      }

      id v35 = objc_alloc(MEMORY[0x263F47BE8]);
      v38 = objc_msgSend_userActionPredictionController(v4, v36, v37);
      v40 = objc_msgSend_initWithHome_predictionsController_delegate_predictionLimit_(v35, v39, (uint64_t)v4, v38, self, 6);
      objc_msgSend_setPredictionsManager_(self, v41, (uint64_t)v40);
    }
    id v42 = objc_alloc(MEMORY[0x263F47BE0]);
    v45 = objc_msgSend_predictionsManager(self, v43, v44);
    v47 = objc_msgSend_initWithHome_predictionsManager_itemLimit_(v42, v46, (uint64_t)v4, v45, 6);
    objc_msgSend_setPredictionsItemProvider_(self, v48, (uint64_t)v47);

    id v14 = objc_msgSend_predictionsItemProvider(self, v49, v50);
    objc_msgSend_addObject_(v7, v51, (uint64_t)v14);
  }

  return v7;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
  objc_super v10 = objc_msgSend_mosaicLayoutDelegate(self, v8, v9);

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F47BB0]);
    uint64_t v13 = objc_msgSend_initWithIdentifier_(v11, v12, @"HUCC START GRID MAIN SECTION");
    v16 = objc_msgSend_allObjects(v4, v14, v15);
    v109[0] = MEMORY[0x263EF8330];
    v109[1] = 3221225472;
    v109[2] = sub_2406600D8;
    v109[3] = &unk_2650CBF70;
    v109[4] = self;
    v18 = objc_msgSend_sortedArrayUsingComparator_(v16, v17, (uint64_t)v109);

    if (objc_msgSend_count(v18, v19, v20))
    {
      v95 = v13;
      id v96 = v4;
      v97 = v7;
      v23 = objc_msgSend_array(MEMORY[0x263EFF980], v21, v22);
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      v94 = v18;
      id v24 = v18;
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v105, v111, 16);
      unint64_t v27 = 0x263F49000uLL;
      if (v26)
      {
        uint64_t v28 = v26;
        uint64_t v29 = *(void *)v106;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v106 != v29) {
              objc_enumerationMutation(v24);
            }
            uint64_t v31 = *(void *)(*((void *)&v105 + 1) + 8 * i);
            id v32 = objc_alloc(MEMORY[0x263F49B18]);
            v34 = objc_msgSend_initWithBaseItem_(v32, v33, v31);
            objc_msgSend_addObject_(v23, v35, (uint64_t)v34);
          }
          uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v36, (uint64_t)&v105, v111, 16);
        }
        while (v28);
      }

      v39 = objc_msgSend_mosaicLayoutDelegate(self, v37, v38);
      id v42 = objc_msgSend_arranger(v39, v40, v41);

      v93 = v23;
      uint64_t v44 = objc_msgSend_calculateOrderingForItems_(v42, v43, (uint64_t)v23);
      v92 = v42;
      uint64_t v47 = objc_msgSend_chosenLayoutType(v42, v45, v46);
      objc_msgSend_setChosenLayoutType_(self, v48, v47);
      v99 = objc_msgSend_array(MEMORY[0x263EFF980], v49, v50);
      v53 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v51, v52);
      objc_msgSend_setMosaicLayoutDetails_(self, v54, (uint64_t)v53);

      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      obuint64_t j = v44;
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v101, v110, 16);
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = 0;
        uint64_t v100 = *(void *)v102;
        do
        {
          for (uint64_t j = 0; j != v57; ++j)
          {
            if (*(void *)v102 != v100) {
              objc_enumerationMutation(obj);
            }
            v60 = *(void **)(*((void *)&v101 + 1) + 8 * j);
            objc_opt_class();
            id v61 = v60;
            if (objc_opt_isKindOfClass()) {
              v62 = v61;
            }
            else {
              v62 = 0;
            }
            id v63 = v62;

            if (v63)
            {
              objc_opt_class();
              v66 = objc_msgSend_baseItem(v63, v64, v65);
              if (objc_opt_isKindOfClass()) {
                v67 = v66;
              }
              else {
                v67 = 0;
              }
              id v68 = v67;

              if (v68) {
                ++v58;
              }
              v71 = objc_msgSend_baseItem(v63, v69, v70);
              objc_msgSend_addObject_(v99, v72, (uint64_t)v71);

              v75 = objc_msgSend_mosaicLayoutDetails(self, v73, v74);
              v78 = objc_msgSend_baseItem(v63, v76, v77);
              objc_msgSend__mosaicKeyForItem_(self, v79, (uint64_t)v78);
              unint64_t v80 = v27;
              v82 = v81 = self;
              objc_msgSend_setObject_forKey_(v75, v83, (uint64_t)v63, v82);

              self = v81;
              unint64_t v27 = v80;
            }
          }
          uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v101, v110, 16);
        }
        while (v57);
      }
      else
      {
        uint64_t v58 = 0;
      }

      if (v58 != objc_msgSend_numberOfPlaceholderItems(self, v86, v87))
      {
        objc_msgSend_setNumberOfPlaceholderItems_(self, v88, v58);
        objc_msgSend_setNumberOfPlaceholdersWasChanged_(self, v89, 1);
      }
      uint64_t v13 = v95;
      objc_msgSend_setItems_(v95, v88, (uint64_t)v99);

      id v4 = v96;
      id v7 = v97;
      v85 = v93;
      v18 = v94;
    }
    else
    {
      v85 = HFLogForCategory();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
        sub_240675CCC((uint64_t)self, v85);
      }
    }

    if (_os_feature_enabled_impl()) {
      objc_msgSend_setItems_(v13, v90, (uint64_t)v18);
    }
    objc_msgSend_addObject_(v7, v90, (uint64_t)v13);
  }

  return v7;
}

- (void)setChosenLayoutType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_chosenLayoutType != a3)
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      unint64_t chosenLayoutType = self->_chosenLayoutType;
      int v9 = 138413058;
      objc_super v10 = v7;
      __int16 v11 = 2080;
      id v12 = "-[HUCCSmartGridItemManager setChosenLayoutType:]";
      __int16 v13 = 2048;
      unint64_t v14 = chosenLayoutType;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s prev unint64_t chosenLayoutType = %lu. new unint64_t chosenLayoutType = %lu", (uint8_t *)&v9, 0x2Au);
    }
    if (self->_chosenLayoutType) {
      self->_layoutWasChanged = 1;
    }
    self->_unint64_t chosenLayoutType = a3;
  }
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)HUCCSmartGridItemManager;
  [(HFItemManager *)&v18 _didFinishUpdateTransactionWithAffectedItems:a3];
  if (objc_msgSend_layoutWasChanged(self, v4, v5))
  {
    objc_msgSend_setLayoutWasChanged_(self, v6, 0);
    objc_super v10 = objc_msgSend_mosaicLayoutDelegate(self, v8, v9);
    objc_msgSend_itemManagerDidChangeMosaicLayout_(v10, v11, (uint64_t)self);

    objc_msgSend_setNumberOfPlaceholdersWasChanged_(self, v12, 0);
  }
  if (objc_msgSend_numberOfPlaceholdersWasChanged(self, v6, v7))
  {
    objc_msgSend_setNumberOfPlaceholdersWasChanged_(self, v13, 0);
    unint64_t v16 = objc_msgSend_mosaicLayoutDelegate(self, v14, v15);
    objc_msgSend_itemManagerDidChangeNumberOfPlaceholderItems_(v16, v17, (uint64_t)self);
  }
}

- (id)mosaicDetailsForDisplayedItemAtIndexPath:(id)a3
{
  id v4 = objc_msgSend_displayedItemAtIndexPath_(self, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_mosaicDetailsForItem_(self, v5, (uint64_t)v4);

  return v6;
}

- (id)mosaicDetailsForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v7 = objc_msgSend_mosaicLayoutDetails(self, v5, v6);
  uint64_t v9 = objc_msgSend__mosaicKeyForItem_(self, v8, (uint64_t)v4);

  __int16 v11 = objc_msgSend_objectForKey_(v7, v10, (uint64_t)v9);
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)_mosaicKeyForItem:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_26F5053F8)) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v9 = v6;
  if (v6
    && (objc_msgSend_homeKitObject(v6, v7, v8), objc_super v10 = objc_claimAutoreleasedReturnValue(),
                                                v10,
                                                v10))
  {
    id v13 = objc_msgSend_homeKitObject(v9, v11, v12);
    unint64_t v16 = objc_msgSend_uniqueIdentifier(v13, v14, v15);
    objc_msgSend_UUIDString(v16, v17, v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = @"DefaultKey";
  }

  return v19;
}

- (unint64_t)numberOfPlaceholderItems
{
  return self->_numberOfPlaceholderItems;
}

- (void)setNumberOfPlaceholderItems:(unint64_t)a3
{
  self->_numberOfPlaceholderItems = a3;
}

- (HFPredictionsManager)predictionsManager
{
  return self->_predictionsManager;
}

- (void)setPredictionsManager:(id)a3
{
}

- (HFPredictionsItemProvider)predictionsItemProvider
{
  return self->_predictionsItemProvider;
}

- (void)setPredictionsItemProvider:(id)a3
{
}

- (HUCCMosaicLayoutDelegate)mosaicLayoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mosaicLayoutDelegate);

  return (HUCCMosaicLayoutDelegate *)WeakRetained;
}

- (void)setMosaicLayoutDelegate:(id)a3
{
}

- (NSMutableDictionary)mosaicLayoutDetails
{
  return self->_mosaicLayoutDetails;
}

- (void)setMosaicLayoutDetails:(id)a3
{
}

- (unint64_t)chosenLayoutType
{
  return self->_chosenLayoutType;
}

- (BOOL)layoutWasChanged
{
  return self->_layoutWasChanged;
}

- (void)setLayoutWasChanged:(BOOL)a3
{
  self->_layoutWasChanged = a3;
}

- (BOOL)numberOfPlaceholdersWasChanged
{
  return self->_numberOfPlaceholdersWasChanged;
}

- (void)setNumberOfPlaceholdersWasChanged:(BOOL)a3
{
  self->_numberOfPlaceholdersWasChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mosaicLayoutDetails, 0);
  objc_destroyWeak((id *)&self->_mosaicLayoutDelegate);
  objc_storeStrong((id *)&self->_predictionsItemProvider, 0);

  objc_storeStrong((id *)&self->_predictionsManager, 0);
}

@end